@interface PKMetalPencilShadowRenderer
+ (CGSize)maxBlurSize;
+ (CGSize)pixelSize;
- (CGRect)renderInto:(id)a3 commandBuffer:(id)a4 position:(CGPoint)a5 azimuth:(double)a6 altitude:(double)a7 height:(double)a8 alpha:(double)a9 scale:(double)a10 clearFramebuffer:(BOOL)a11 grayscale:(double)a12;
- (MTLCommandQueue)commandQueue;
- (PKMetalPencilShadowRenderer)initWithDevice:(id)a3;
- (PKMetalPencilShadowRenderer)initWithDevice:(id)a3 library:(id)a4;
- (id)current3DModel;
- (id)grayscaleTextureFromCIImage:(void *)a3 context:(double)a4 extent:(double)a5;
- (id)objectForModel:(uint64_t)a1;
- (void)render3DModel:(void *)a3 oldObject:(double)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 blendFactor:;
- (void)updateInk:(id)a3;
- (void)updateInk:(id)a3 oldInk:(id)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 progress:(double)a7;
- (void)updateRoll:(double)a3 altitudeAngle:(double)a4;
@end

@implementation PKMetalPencilShadowRenderer

- (PKMetalPencilShadowRenderer)initWithDevice:(id)a3 library:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)PKMetalPencilShadowRenderer;
  v8 = [(PKMetalPencilShadowRenderer *)&v47 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v46);
    objectsCache = v8->_objectsCache;
    v8->_objectsCache = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v8->_device, a3);
    objc_storeStrong((id *)&v8->_library, a4);
    v8->_currentPixelFormat = 0;
    uint64_t v11 = [(MTLDevice *)v8->_device newCommandQueue];
    commandQueue = v8->_commandQueue;
    v8->_commandQueue = (MTLCommandQueue *)v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F35358]);
    v14 = [v13 attributes];
    v15 = [v14 objectAtIndexedSubscript:0];
    [v15 setFormat:29];

    v16 = [v13 attributes];
    v17 = [v16 objectAtIndexedSubscript:0];
    [v17 setOffset:0];

    v18 = [v13 attributes];
    v19 = [v18 objectAtIndexedSubscript:0];
    [v19 setBufferIndex:0];

    v20 = [v13 attributes];
    v21 = [v20 objectAtIndexedSubscript:1];
    [v21 setFormat:29];

    v22 = [v13 attributes];
    v23 = [v22 objectAtIndexedSubscript:1];
    [v23 setOffset:8];

    v24 = [v13 attributes];
    v25 = [v24 objectAtIndexedSubscript:1];
    [v25 setBufferIndex:0];

    v26 = [v13 layouts];
    v27 = [v26 objectAtIndexedSubscript:0];
    [v27 setStride:16];

    v28 = [v13 layouts];
    v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setStepRate:1];

    v30 = [v13 layouts];
    v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setStepFunction:1];

    objc_storeStrong((id *)&v8->_vertexDescriptor, v13);
    v32 = (void *)[(MTLLibrary *)v8->_library newFunctionWithName:@"shadowBlurVertex"];
    v33 = (void *)[(MTLLibrary *)v8->_library newFunctionWithName:@"shadowBlurFragment"];
    id v34 = objc_alloc_init(MEMORY[0x1E4F352F0]);
    [v34 setLabel:@"Blur"];
    [v34 setRasterSampleCount:1];
    [v34 setVertexFunction:v32];
    [v34 setFragmentFunction:v33];
    [v34 setVertexDescriptor:v8->_vertexDescriptor];
    v35 = [v34 colorAttachments];
    v36 = [v35 objectAtIndexedSubscript:0];
    [v36 setPixelFormat:10];

    device = v8->_device;
    id v48 = 0;
    uint64_t v38 = [(MTLDevice *)device newRenderPipelineStateWithDescriptor:v34 error:&v48];
    id v39 = v48;
    blurPipelineState = v8->_blurPipelineState;
    v8->_blurPipelineState = (MTLRenderPipelineState *)v38;

    if (!v8->_blurPipelineState)
    {
      v41 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        v45 = [v39 localizedDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v45;
        _os_log_fault_impl(&dword_1C44F8000, v41, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", buf, 0xCu);
      }
    }
    long long v51 = xmmword_1C482C344;
    long long v52 = unk_1C482C354;
    *(_OWORD *)buf = xmmword_1C482C324;
    long long v50 = unk_1C482C334;
    uint64_t v42 = [(MTLDevice *)v8->_device newBufferWithBytes:buf length:64 options:0];
    blurVertexBuffer = v8->_blurVertexBuffer;
    v8->_blurVertexBuffer = (MTLBuffer *)v42;
  }
  return v8;
}

- (PKMetalPencilShadowRenderer)initWithDevice:(id)a3
{
  id v4 = a3;
  v5 = +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v4);
  v6 = -[PKMetalResourceHandler shaderLibrary]((uint64_t)v5);
  id v7 = [(PKMetalPencilShadowRenderer *)self initWithDevice:v4 library:v6];

  return v7;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

+ (CGSize)maxBlurSize
{
  double v2 = 50.0;
  double v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)pixelSize
{
  double v2 = 172.0;
  double v3 = 950.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)grayscaleTextureFromCIImage:(void *)a3 context:(double)a4 extent:(double)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  v45 = v13;
  id v46 = v14;
  if (*(void *)(a1 + 216))
  {
    v15 = v14;
    id v16 = 0;
  }
  else
  {
    *(_OWORD *)buf = xmmword_1C482C364;
    long long v54 = unk_1C482C374;
    long long v55 = xmmword_1C482C384;
    long long v56 = unk_1C482C394;
    uint64_t v17 = [*(id *)(a1 + 16) newBufferWithBytes:buf length:64 options:0];
    v18 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = v17;

    v19 = (void *)[*(id *)(a1 + 24) newFunctionWithName:@"pencilShadowVertex"];
    v20 = (void *)[*(id *)(a1 + 24) newFunctionWithName:@"alphaToGrayscale"];
    id v21 = objc_alloc_init(MEMORY[0x1E4F352F0]);
    [v21 setLabel:@"GrayscalePipeline"];
    [v21 setRasterSampleCount:1];
    [v21 setVertexFunction:v19];
    [v21 setFragmentFunction:v20];
    [v21 setVertexDescriptor:*(void *)(a1 + 8)];
    v22 = [v21 colorAttachments];
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 setPixelFormat:10];

    v24 = *(void **)(a1 + 16);
    id v48 = 0;
    uint64_t v25 = [v24 newRenderPipelineStateWithDescriptor:v21 error:&v48];
    id v16 = v48;
    v26 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = v25;

    if (!*(void *)(a1 + 216))
    {
      v27 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v43 = [v16 localizedDescription];
        *(_DWORD *)long long v51 = 138412290;
        long long v52 = v43;
        _os_log_fault_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_FAULT, "Failed to create pipeline state: %@", v51, 0xCu);
      }
    }

    id v13 = v45;
    v15 = v46;
  }
  v28 = (CGImage *)objc_msgSend(v15, "createCGImage:fromRect:", v13, a4, a5, a6, a7);
  if (v28)
  {
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:*(void *)(a1 + 16)];
    uint64_t v30 = *MEMORY[0x1E4F35388];
    v49[0] = *MEMORY[0x1E4F35390];
    v49[1] = v30;
    v50[0] = &unk_1F200EA60;
    v50[1] = &unk_1F200EA78;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
    id v47 = v16;
    v32 = (void *)[v29 newTextureWithCGImage:v28 options:v31 error:&v47];
    id v44 = v47;

    if (!v32)
    {
      v33 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        uint64_t v42 = [v44 localizedDescription];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v42;
        _os_log_fault_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_FAULT, "Failed to create texture: %@", buf, 0xCu);
      }
    }
    CGImageRelease(v28);
    id v34 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:(unint64_t)a6 height:(unint64_t)a7 mipmapped:0];
    [v34 setTextureType:2];
    [v34 setSampleCount:1];
    [v34 setUsage:5];
    [v34 setStorageMode:2];
    v35 = (void *)[*(id *)(a1 + 16) newTextureWithDescriptor:v34];
    id v36 = objc_alloc_init(MEMORY[0x1E4F352E0]);
    v37 = [v36 colorAttachments];
    uint64_t v38 = [v37 objectAtIndexedSubscript:0];

    [v38 setTexture:v35];
    [v38 setLoadAction:0];
    [v38 setStoreAction:1];
    id v39 = [*(id *)(a1 + 168) commandBuffer];
    v40 = [v39 renderCommandEncoderWithDescriptor:v36];
    [v40 setRenderPipelineState:*(void *)(a1 + 216)];
    *(_OWORD *)buf = xmmword_1C482A970;
    long long v54 = xmmword_1C482B4B0;
    long long v55 = xmmword_1C482B4C0;
    long long v56 = xmmword_1C482B4D0;
    [v40 setVertexBuffer:*(void *)(a1 + 208) offset:0 atIndex:0];
    [v40 setVertexBytes:buf length:64 atIndex:1];
    [v40 setFragmentTexture:v32 atIndex:0];
    [v40 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v40 endEncoding];
    [v39 commit];

    id v16 = v44;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)render3DModel:(void *)a3 oldObject:(double)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 blendFactor:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v53 = a2;
  id v54 = a3;
  if (a1)
  {
    v12 = (id *)(a1 + 32);
    uint64_t v11 = *(void **)(a1 + 32);
    *(double *)(a1 + 176) = a4;
    *(double *)(a1 + 184) = a5;
    id v56 = v11;
    uint64_t v59 = a1;
    if (!v56 || [v56 width] != 172 || objc_msgSend(v56, "height") != 950)
    {
      id v13 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:172 height:950 mipmapped:0];
      [v13 setTextureType:2];
      [v13 setSampleCount:1];
      [v13 setUsage:23];
      [v13 setStorageMode:2];
      id v14 = (void *)[*(id *)(a1 + 16) newTextureWithDescriptor:v13];

      objc_storeStrong(v12, v14);
      id v56 = v14;
      a1 = v59;
    }
    v15 = [*(id *)(a1 + 168) commandBuffer];
    _ZF = a6 >= 0.99 || v54 == 0;
    int v17 = _ZF;
    if (_ZF)
    {
      *(double *)(a1 + 248) = a4;
      *(double *)(a1 + 256) = a5;
      a6 = 1.0;
      v18 = v56;
    }
    else
    {
      *(int64x2_t *)(a1 + 248) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
      v18 = v56;
      -[PKMetal3DObject renderIntoTexture:commandBuffer:rollAngle:altitudeAngle:blendFactor:clear:]((uint64_t)v54, v56, v15, 1, a4, a5, 1.0 - a6);
    }
    -[PKMetal3DObject renderIntoTexture:commandBuffer:rollAngle:altitudeAngle:blendFactor:clear:]((uint64_t)v53, v18, v15, v17, a4, a5, a6);
    id v52 = v18;
    id v58 = v15;
    objc_storeStrong(v12, v18);
    uint64_t v19 = [v52 width];
    uint64_t v20 = [v52 height];
    id v21 = v52;
    uint64_t v22 = 0;
    uint64_t v57 = v59 + 40;
    *(void *)&long long v23 = 1.0;
    long long v60 = v23;
    long long v55 = v21;
    do
    {
      id v24 = *(id *)(v57 + v22);
      uint64_t v25 = v24;
      if (v19 >= 0) {
        uint64_t v26 = v19;
      }
      else {
        uint64_t v26 = v19 + 1;
      }
      uint64_t v27 = v26 >> 1;
      if (v20 >= 0) {
        uint64_t v28 = v20;
      }
      else {
        uint64_t v28 = v20 + 1;
      }
      uint64_t v29 = v28 >> 1;
      if (v24 && [v24 width] == v27 && objc_msgSend(v25, "height") == v29)
      {
        uint64_t v30 = v25;
      }
      else
      {
        v31 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:v27 height:v29 mipmapped:0];
        [v31 setTextureType:2];
        [v31 setSampleCount:1];
        [v31 setUsage:7];
        [v31 setStorageMode:2];
        uint64_t v30 = (void *)[*(id *)(v59 + 16) newTextureWithDescriptor:v31];

        objc_storeStrong((id *)(v57 + v22), v30);
      }
      id v32 = objc_alloc_init(MEMORY[0x1E4F352E0]);
      v33 = [v32 colorAttachments];
      id v34 = [v33 objectAtIndexedSubscript:0];
      [v34 setTexture:v30];

      v35 = [v32 colorAttachments];
      id v36 = [v35 objectAtIndexedSubscript:0];
      [v36 setLoadAction:0];

      v37 = [v32 colorAttachments];
      uint64_t v38 = [v37 objectAtIndexedSubscript:0];
      [v38 setStoreAction:1];

      id v39 = [v58 renderCommandEncoderWithDescriptor:v32];
      [v39 setRenderPipelineState:*(void *)(v59 + 200)];
      v40.i64[0] = v19;
      v40.i64[1] = v20;
      *(float32x2_t *)v61 = vcvt_f32_f64(vdivq_f64((float64x2_t)vdupq_lane_s64(v60, 0), vcvtq_f64_s64(v40)));
      *(_DWORD *)&v61[8] = 1065353216;
      [v39 setFragmentBytes:v61 length:16 atIndex:0];
      [v39 setVertexBuffer:*(void *)(v59 + 192) offset:0 atIndex:0];
      [v39 setFragmentTexture:v21 atIndex:0];
      [v39 drawPrimitives:4 vertexStart:0 vertexCount:4];
      [v39 endEncoding];

      v22 += 8;
      *((void *)&v41 + 1) = *((void *)&v60 + 1);
      *(double *)&long long v41 = *(double *)&v60 * 1.2;
      long long v60 = v41;
      uint64_t v19 = v27;
      uint64_t v20 = v29;
      id v21 = v30;
    }
    while (v22 != 32);
    unint64_t v42 = [v55 width];
    unint64_t v43 = [v55 height];
    float v44 = (double)v42 * 0.8;
    *(float *)v61 = v44 * -0.5;
    float v45 = (double)v43 * 0.8;
    *(void *)&v61[4] = 3259498496;
    int v62 = 0;
    float v63 = v44 * 0.5;
    uint64_t v64 = 0x3F800000C2480000;
    int v65 = 0;
    float v66 = v44 * -0.5;
    float v67 = v45 + -50.0;
    uint64_t v68 = 0x3F80000000000000;
    float v69 = v44 * 0.5;
    float v70 = v45 + -50.0;
    __asm { FMOV            V2.2S, #1.0 }
    uint64_t v71 = _D2;
    *(double *)(v59 + 88) = (float)(v44 * -0.5);
    *(void *)(v59 + 96) = 0xC049000000000000;
    *(double *)(v59 + 104) = v44;
    *(double *)(v59 + 112) = v45;
    uint64_t v50 = [*(id *)(v59 + 16) newBufferWithBytes:v61 length:64 options:0];
    long long v51 = *(void **)(v59 + 80);
    *(void *)(v59 + 80) = v50;

    [v58 commit];
  }
}

- (void)updateInk:(id)a3
{
}

- (id)objectForModel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 232) objectForKeyedSubscript:v3];
    if (!v4)
    {
      v5 = [PKMetal3DObject alloc];
      v6 = *(void **)(a1 + 168);
      id v7 = *(void **)(a1 + 24);
      +[PKMetalPencilShadowRenderer pixelSize];
      id v4 = [(PKMetal3DObject *)v5 initWithCommandQueue:v3 modelFile:v7 library:v8 pixelSize:v9 maxTextureBlur:50.0];
      [*(id *)(a1 + 232) setObject:v4 forKeyedSubscript:v3];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)updateInk:(id)a3 oldInk:(id)a4 rollAngle:(double)a5 altitudeAngle:(double)a6 progress:(double)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v12 = a4;
  id v54 = v12;
  if (v56)
  {
    id v13 = [v56 _shadowModel];
    if (v12)
    {
LABEL_3:
      long long v55 = [v12 _shadowModel];
      goto LABEL_6;
    }
  }
  else
  {
    id v13 = @"BallpointPen3";
    if (v12) {
      goto LABEL_3;
    }
  }
  long long v55 = @"BallpointPen3";
LABEL_6:
  int v14 = [(__CFString *)v13 isEqual:self->_currentModel] ^ 1;
  if (v12) {
    LOBYTE(v14) = 1;
  }
  if ((v14 & 1) != 0 || self->_currentRenderedRoll != a5 || self->_currentRenderedAltitude != a6)
  {
    objc_storeStrong((id *)&self->_currentModel, v13);
    if ([(__CFString *)v13 length] && [(__CFString *)v55 length])
    {
      v15 = -[PKMetalPencilShadowRenderer objectForModel:]((uint64_t)self, v13);
      if (a7 >= 1.0)
      {
        id v16 = 0;
      }
      else
      {
        id v16 = -[PKMetalPencilShadowRenderer objectForModel:]((uint64_t)self, v55);
      }
      -[PKMetalPencilShadowRenderer render3DModel:oldObject:rollAngle:altitudeAngle:blendFactor:]((uint64_t)self, v15, v16, a5, a6, a7);
    }
    else
    {
      genericShadowImage = self->_genericShadowImage;
      if (!genericShadowImage)
      {
        v18 = @"Outline Default";
        uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v20 = [MEMORY[0x1E4FB1818] imageNamed:@"Outline Default" inBundle:v19];
        uint64_t v21 = [v20 CGImage];
        if (v21)
        {
          uint64_t v22 = [MEMORY[0x1E4F1E050] imageWithCGImage:v21];
        }
        else
        {
          long long v23 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_FAULT, "Unable to load pencil shadow texture", buf, 2u);
          }

          uint64_t v22 = 0;
        }

        id v24 = self->_genericShadowImage;
        self->_genericShadowImage = v22;

        genericShadowImage = self->_genericShadowImage;
      }
      uint64_t v25 = genericShadowImage;
      id v26 = objc_alloc_init(MEMORY[0x1E4F1E018]);
      uint64_t v27 = v25;
      uint64_t v28 = [(CIImage *)v27 imageByApplyingGaussianBlurWithSigma:20.0];
      [v28 extent];
      CGRect v72 = CGRectInset(v71, -20.0, -20.0);
      double x = v72.origin.x;
      double y = v72.origin.y;
      double width = v72.size.width;
      double height = v72.size.height;
      v33 = -[PKMetalPencilShadowRenderer grayscaleTextureFromCIImage:context:extent:]((uint64_t)self, v27, v26, v72.origin.x, v72.origin.y, v72.size.width, v72.size.height);
      uint64_t v34 = -[PKMetalPencilShadowRenderer grayscaleTextureFromCIImage:context:extent:]((uint64_t)self, v28, v26, x, y, width, height);
      v35 = (void *)v34;
      if (v33 && v34)
      {
        id v53 = v25;
        objc_storeStrong((id *)self->_textures, v33);
        objc_storeStrong((id *)&self->_textures[4], v35);
        uint64_t v36 = 5;
        while (1)
        {
          v37 = -[CIImage imageByApplyingGaussianBlurWithSigma:](v27, "imageByApplyingGaussianBlurWithSigma:", (double)((int)v36 - 4) * 20.0 * 0.25, v53);
          uint64_t v38 = -[PKMetalPencilShadowRenderer grayscaleTextureFromCIImage:context:extent:]((uint64_t)self, v37, v26, x, y, width, height);
          id v39 = (void **)(&self->super.isa + v36);
          int64x2_t v40 = *v39;
          *id v39 = (void *)v38;

          if (!*v39) {
            break;
          }

          if (++v36 == 8)
          {
            float v41 = width;
            float v42 = y;
            *(float *)buf = v41 * -0.5;
            float v58 = v42;
            float v43 = height;
            uint64_t v59 = 0;
            float v60 = v41 * 0.5;
            float v61 = v42;
            uint64_t v62 = 1065353216;
            float v63 = v41 * -0.5;
            float v64 = v42 + v43;
            uint64_t v65 = 0x3F80000000000000;
            float v66 = v41 * 0.5;
            float v67 = v42 + v43;
            __asm { FMOV            V4.2S, #1.0 }
            uint64_t v68 = _D4;
            self->_imageMaxBlurredExtent.origin.double x = x;
            self->_imageMaxBlurredExtent.origin.double y = y;
            self->_imageMaxBlurredExtent.size.double width = width;
            self->_imageMaxBlurredExtent.size.double height = height;
            self->_vertexBufferBounds.origin.double x = (float)(v41 * -0.5);
            self->_vertexBufferBounds.origin.double y = v42;
            self->_vertexBufferBounds.size.double width = v41;
            self->_vertexBufferBounds.size.double height = v43;
            v49 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:buf length:64 options:0];
            vertexBuffer = self->_vertexBuffer;
            self->_vertexBuffer = v49;

            goto LABEL_36;
          }
        }
        id v52 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C44F8000, v52, OS_LOG_TYPE_FAULT, "Unable to create intermediate texture", buf, 2u);
        }
      }
      else
      {
        long long v51 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C44F8000, v51, OS_LOG_TYPE_FAULT, "Unable to create initial textures", buf, 2u);
        }
      }
LABEL_36:

      id v12 = v54;
    }
  }
}

- (id)current3DModel
{
  if (a1)
  {
    double v2 = a1;
    a1 = (id *)[a1[30] length];
    if (a1)
    {
      a1 = [v2[29] objectForKeyedSubscript:v2[30]];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)updateRoll:(double)a3 altitudeAngle:(double)a4
{
  self->_currentRoll = a3;
  self->_currentAltitude = a4;
  -[PKMetalPencilShadowRenderer current3DModel]((id *)&self->super.isa);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (self->_currentRenderedRoll != a3 || self->_currentRenderedAltitude != a4)) {
    -[PKMetalPencilShadowRenderer render3DModel:oldObject:rollAngle:altitudeAngle:blendFactor:]((uint64_t)self, v7, 0, a3, a4, 1.0);
  }
}

- (CGRect)renderInto:(id)a3 commandBuffer:(id)a4 position:(CGPoint)a5 azimuth:(double)a6 altitude:(double)a7 height:(double)a8 alpha:(double)a9 scale:(double)a10 clearFramebuffer:(BOOL)a11 grayscale:(double)a12
{
  BOOL v13 = a11;
  double y = a5.y;
  double x = a5.x;
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v93 = a4;
  v94 = v23;
  if (!self->_vertexBuffer || !self->_textures[0])
  {
    CGRect v71 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v111.a) = 0;
      _os_log_fault_impl(&dword_1C44F8000, v71, OS_LOG_TYPE_FAULT, "Shadow Renderer not set up", (uint8_t *)&v111, 2u);
    }

    goto LABEL_31;
  }
  double v24 = 1.57079633 - a7;
  if (1.57079633 - a7 < 0.3)
  {
    double v24 = pow(v24 * 3.33333333, 4.0);
    a9 = v24 * a9;
  }
  unint64_t v25 = objc_msgSend(v23, "pixelFormat", v24);
  unint64_t v26 = v25;
  currentPipelineState = self->_currentPipelineState;
  if (self->_currentPixelFormat != v25 || !currentPipelineState)
  {
    self->_currentPixelFormat = v25;
    self->_currentPipelineState = 0;

    id v28 = objc_alloc_init(MEMORY[0x1E4F352F0]);
    uint64_t v29 = [v28 colorAttachments];
    uint64_t v30 = [v29 objectAtIndexedSubscript:0];

    [v30 setPixelFormat:v26];
    [v30 setBlendingEnabled:1];
    [v30 setRgbBlendOperation:0];
    [v30 setAlphaBlendOperation:0];
    [v30 setSourceRGBBlendFactor:1];
    [v30 setSourceAlphaBlendFactor:1];
    [v30 setDestinationRGBBlendFactor:5];
    [v30 setDestinationAlphaBlendFactor:5];
    [v28 setVertexDescriptor:self->_vertexDescriptor];
    v31 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"pencilShadowVertex"];
    uint64_t v32 = [(MTLLibrary *)self->_library newFunctionWithName:@"pencilShadowFragment"];
    v33 = (void *)v32;
    if (v31 && v32)
    {
      [v28 setVertexFunction:v31];
      [v28 setFragmentFunction:v33];
      device = self->_device;
      id v109 = 0;
      v35 = (MTLRenderPipelineState *)[(MTLDevice *)device newRenderPipelineStateWithDescriptor:v28 error:&v109];
      id v36 = v109;
      v37 = self->_currentPipelineState;
      self->_currentPipelineState = v35;

      if (!self->_currentPipelineState)
      {
        uint64_t v38 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          v90 = [v36 localizedDescription];
          LODWORD(v111.a) = 138412290;
          *(void *)((char *)&v111.a + 4) = v90;
          _os_log_fault_impl(&dword_1C44F8000, v38, OS_LOG_TYPE_FAULT, "Unable to create pipeline state: %@", (uint8_t *)&v111, 0xCu);
        }
      }
    }
    if (!self->_currentPipelineState)
    {
LABEL_31:
      CGFloat v72 = *MEMORY[0x1E4F1DB20];
      CGFloat v73 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      goto LABEL_38;
    }
  }
  id v39 = objc_alloc_init(MEMORY[0x1E4F352E0]);
  int64x2_t v40 = [v39 colorAttachments];
  double v92 = a8;
  float v41 = [v40 objectAtIndexedSubscript:0];

  [v41 setTexture:v94];
  if (v13) {
    uint64_t v42 = 2;
  }
  else {
    uint64_t v42 = 1;
  }
  [v41 setLoadAction:v42];
  [v41 setStoreAction:1];
  if (v13) {
    objc_msgSend(v41, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  }
  float v43 = [v93 renderCommandEncoderWithDescriptor:v39];
  [v43 setRenderPipelineState:self->_currentPipelineState];
  unint64_t v44 = [v94 width];
  double v45 = a12;
  float v46 = (float)(unint64_t)[v94 height];
  v47.f32[0] = x;
  float32_t v48 = v46 - y;
  v47.f32[1] = v48;
  v47.i32[2] = 0;
  v47.i32[3] = 1.0;
  float32x4_t v91 = v47;
  __double2 v49 = __sincos_stret(3.14159265 - a6);
  uint64_t v50 = 0;
  *(float *)&unsigned int v51 = v49.__cosval;
  *(float *)&unsigned int v52 = v49.__sinval;
  *(float *)&unint64_t v53 = -*(float *)&v52;
  HIDWORD(v53) = v51;
  *(_OWORD *)&v110.m11 = __PAIR64__(v52, v51);
  *(_OWORD *)&v110.m13 = v53;
  *(_OWORD *)&v110.m21 = xmmword_1C482B4C0;
  *(_OWORD *)&v110.m23 = xmmword_1C482B4D0;
  do
  {
    *(float32x4_t *)((char *)&v111.a + v50) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1C482A970, COERCE_FLOAT(*(_OWORD *)((char *)&v110.m11 + v50))), (float32x4_t)xmmword_1C482B4B0, *(float32x2_t *)((char *)&v110.m11 + v50), 1), (float32x4_t)xmmword_1C482B4C0, *(float32x4_t *)((char *)&v110.m11 + v50), 2), v91, *(float32x4_t *)((char *)&v110.m11 + v50), 3);
    v50 += 16;
  }
  while (v50 != 64);
  uint64_t v55 = 0;
  LODWORD(v56) = 0;
  *((float *)&v56 + 1) = a10;
  float32x4_t v57 = *(float32x4_t *)&v111.a;
  float32x4_t v58 = *(float32x4_t *)&v111.c;
  float32x4_t v59 = *(float32x4_t *)&v111.tx;
  float32x4_t v60 = v112;
  *(float *)&unsigned int v54 = a10;
  *(_OWORD *)&v110.m11 = v54;
  *(_OWORD *)&v110.m13 = v56;
  *(_OWORD *)&v110.m21 = xmmword_1C482B4C0;
  *(_OWORD *)&v110.m23 = xmmword_1C482B4D0;
  do
  {
    *(float32x4_t *)((char *)&v111.a + v55) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v57, COERCE_FLOAT(*(_OWORD *)((char *)&v110.m11 + v55))), v58, *(float32x2_t *)((char *)&v110.m11 + v55), 1), v59, *(float32x4_t *)((char *)&v110.m11 + v55), 2), v60, *(float32x4_t *)((char *)&v110.m11 + v55), 3);
    v55 += 16;
  }
  while (v55 != 64);
  uint64_t v61 = 0;
  v62.i32[1] = 0;
  v62.i64[1] = 0;
  v63.i32[0] = 0;
  v63.i64[1] = 0;
  CGAffineTransform v107 = v111;
  float32x4_t v108 = v112;
  *(_OWORD *)&v110.m11 = *(_OWORD *)&v111.a;
  *(_OWORD *)&v110.m13 = *(_OWORD *)&v111.c;
  *(_OWORD *)&v110.m21 = *(_OWORD *)&v111.tx;
  *(float32x4_t *)&v110.m23 = v112;
  do
  {
    v62.f32[0] = 2.0 / (float)v44;
    v63.f32[1] = 2.0 / v46;
    *(float32x4_t *)((char *)&v111.a + v61) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v62, COERCE_FLOAT(*(_OWORD *)((char *)&v110.m11 + v61))), v63, *(float32x2_t *)((char *)&v110.m11 + v61), 1), (float32x4_t)xmmword_1C482B4C0, *(float32x4_t *)((char *)&v110.m11 + v61), 2), (float32x4_t)xmmword_1C482C310, *(float32x4_t *)((char *)&v110.m11 + v61), 3);
    v61 += 16;
  }
  while (v61 != 64);
  CGAffineTransform v105 = v111;
  float32x4_t v106 = v112;
  float v64 = -[PKMetalPencilShadowRenderer current3DModel]((id *)&self->super.isa);
  BOOL v65 = v64 == 0;

  float v66 = +[PKHoverSettings sharedSettings];
  [v66 toolPreviewMaxZDistance];
  if (v65)
  {
    float v76 = v92 / v67;
    float v101 = v76;

    float v77 = a7 * 10.0 / 1.57079633;
    float v102 = v77;
    float v70 = -self->_imageMaxBlurredExtent.origin.y / self->_imageMaxBlurredExtent.size.height;
  }
  else
  {
    float v68 = v92 / v67 * 1.5;
    float v101 = v68;

    float v69 = a7 * 32.0 / 1.57079633;
    float v102 = v69;
    float v70 = 0.094737;
  }
  float v103 = v70;
  float v78 = v45;
  float v79 = v78;
  float v80 = a9;
  float32x4_t v81 = vmulq_n_f32((float32x4_t)LODWORD(v79), v80);
  v81.f32[3] = v80;
  float32x4_t v104 = v81;
  objc_msgSend(v43, "setVertexBuffer:offset:atIndex:", self->_vertexBuffer, 0, 0, *(_OWORD *)&v91);
  [v43 setVertexBytes:&v105 length:64 atIndex:1];
  for (uint64_t i = 0; i != 5; ++i)
    [v43 setFragmentTexture:self->_textures[i] atIndex:i];
  [v43 setFragmentBytes:&v101 length:32 atIndex:1];
  [v43 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v43 endEncoding];
  uint64_t v83 = 0;
  memset(&v100, 0, sizeof(v100));
  v84 = (float64x2_t *)&v111;
  do
  {
    float32x4_t v85 = *(float32x4_t *)((char *)&v107.a + v83);
    float64x2_t *v84 = vcvtq_f64_f32(*(float32x2_t *)v85.f32);
    v84[1] = vcvt_hight_f64_f32(v85);
    v84 += 2;
    v83 += 16;
  }
  while (v83 != 64);
  *(_OWORD *)&v110.m31 = v113;
  *(_OWORD *)&v110.m33 = v114;
  *(_OWORD *)&v110.m41 = v115;
  *(_OWORD *)&v110.m43 = v116;
  *(_OWORD *)&v110.m11 = *(_OWORD *)&v111.a;
  *(_OWORD *)&v110.m13 = *(_OWORD *)&v111.c;
  *(_OWORD *)&v110.m21 = *(_OWORD *)&v111.tx;
  *(float32x4_t *)&v110.m23 = v112;
  CATransform3DGetAffineTransform(&v100, &v110);
  memset(&v111, 0, sizeof(v111));
  CGAffineTransformMakeScale(&t1, 1.0, -1.0);
  CGAffineTransformMakeTranslation(&t2, 0.0, (double)(unint64_t)[v94 height]);
  CGAffineTransformConcat(&v111, &t1, &t2);
  memset(&v110, 0, 48);
  CGAffineTransform v97 = v100;
  CGAffineTransform v96 = v111;
  CGAffineTransformConcat((CGAffineTransform *)&v110, &v97, &v96);
  CGRect vertexBufferBounds = self->_vertexBufferBounds;
  *(_OWORD *)&v95.a = *(_OWORD *)&v110.m11;
  *(_OWORD *)&v95.c = *(_OWORD *)&v110.m13;
  *(_OWORD *)&v95.tdouble x = *(_OWORD *)&v110.m21;
  CGRect v119 = CGRectApplyAffineTransform(vertexBufferBounds, &v95);
  CGFloat v72 = v119.origin.x;
  CGFloat v73 = v119.origin.y;
  CGFloat width = v119.size.width;
  CGFloat height = v119.size.height;

LABEL_38:
  double v86 = v72;
  double v87 = v73;
  double v88 = width;
  double v89 = height;
  result.size.CGFloat height = v89;
  result.size.CGFloat width = v88;
  result.origin.double y = v87;
  result.origin.double x = v86;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_storeStrong((id *)&self->_objectsCache, 0);
  objc_storeStrong((id *)&self->_genericShadowImage, 0);
  objc_storeStrong((id *)&self->_grayscalePipelineState, 0);
  objc_storeStrong((id *)&self->_grayscaleVertexBuffer, 0);
  objc_storeStrong((id *)&self->_blurPipelineState, 0);
  objc_storeStrong((id *)&self->_blurVertexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_currentPipelineState, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_pyramidTexture, 0);
  for (uint64_t i = 64; i != 24; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
}

@end
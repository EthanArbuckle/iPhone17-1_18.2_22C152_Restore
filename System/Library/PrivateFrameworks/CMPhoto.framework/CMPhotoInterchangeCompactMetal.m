@interface CMPhotoInterchangeCompactMetal
- (CMPhotoInterchangeCompactMetal)initWithDevice:(id)a3 encode:(BOOL)a4 bayer:(BOOL)a5 quadra:(BOOL)a6 depth:(char)a7;
- (id)prepareTexture:(__IOSurface *)a3 usage:(unint64_t)a4;
- (void)prepareData;
- (void)prepareDst:(__IOSurface *)a3;
- (void)prepareSrc:(__IOSurface *)a3;
- (void)sendRenderCommand;
@end

@implementation CMPhotoInterchangeCompactMetal

- (CMPhotoInterchangeCompactMetal)initWithDevice:(id)a3 encode:(BOOL)a4 bayer:(BOOL)a5 quadra:(BOOL)a6 depth:(char)a7
{
  int v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v41.receiver = self;
  v41.super_class = (Class)CMPhotoInterchangeCompactMetal;
  v12 = [(CMPhotoInterchangeCompactMetal *)&v41 init];
  v13 = v12;
  if (v12)
  {
    v12->_mDevice = (MTLDevice *)a3;
    if (!a3) {
      return 0;
    }
    v14 = (MTLCommandQueue *)(id)[a3 newCommandQueue];
    v13->_mCommandQueue = v14;
    if (!v14) {
      return 0;
    }
    uint64_t v40 = 0;
    uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (!v15) {
      return 0;
    }
    id v16 = (id)[(MTLDevice *)v13->_mDevice newDefaultLibraryWithBundle:v15 error:&v40];
    if (!v16) {
      return 0;
    }
    v17 = v16;
    int v18 = v9 || v8;
    if (v7 == 16) {
      __int16 v19 = 255;
    }
    else {
      __int16 v19 = 127;
    }
    if (v7 == 16) {
      __int16 v20 = 63;
    }
    else {
      __int16 v20 = 31;
    }
    if (!v18) {
      __int16 v19 = v20;
    }
    v13->_mask = v19;
    id v21 = (id)objc_opt_new();
    if (!v21) {
      return 0;
    }
    id v22 = v21;
    [v21 setConstantValue:&v13->_mask type:41 atIndex:0];
    id v23 = (id)[v17 newFunctionWithName:@"compact_metadata_cs" constantValues:v22 error:&v40];
    if (!v23) {
      return 0;
    }
    id v24 = v23;
    id v25 = objc_alloc_init(MEMORY[0x1E4F35208]);
    if (!v25) {
      return 0;
    }
    v26 = v25;
    [v25 setComputeFunction:v24];
    [v26 setLabel:@"Compact Metadata Compute Pipeline"];
    v27 = (MTLComputePipelineState *)(id)[(MTLDevice *)v13->_mDevice newComputePipelineStateWithDescriptor:v26 options:0 reflection:0 error:&v40];
    v13->_mCompactMetadataPSO = v27;
    if (!v27) {
      return 0;
    }
    v28 = (MTLRenderPassDescriptor *)(id)objc_opt_new();
    v13->_renderToTextureRenderPassDescriptor = v28;
    [[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v28 colorAttachments] objectAtIndexedSubscript:0] setLoadAction:0];
    -[MTLRenderPassColorAttachmentDescriptor setClearColor:]([(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v13->_renderToTextureRenderPassDescriptor colorAttachments] objectAtIndexedSubscript:0], "setClearColor:", 1.0, 1.0, 1.0, 1.0);
    [[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v13->_renderToTextureRenderPassDescriptor colorAttachments] objectAtIndexedSubscript:0] setStoreAction:1];
    id v29 = objc_alloc_init(MEMORY[0x1E4F352F0]);
    if (!v29) {
      return 0;
    }
    v30 = v29;
    objc_msgSend(v29, "setVertexFunction:", (id)objc_msgSend(v17, "newFunctionWithName:", @"simple_vs"));
    if (v10)
    {
      [v30 setLabel:@"Interchange Compact Repack Pipeline"];
      v31 = @"simple_fs";
      if (v8) {
        v31 = @"quadra_repack_fs";
      }
      if (v9) {
        v32 = @"bayer_repack_fs";
      }
      else {
        v32 = v31;
      }
      objc_msgSend(v30, "setFragmentFunction:", (id)objc_msgSend(v17, "newFunctionWithName:", v32));
      uint64_t v33 = 70;
      if (v7 == 16) {
        uint64_t v33 = 110;
      }
      uint64_t v34 = 10;
      if (v7 == 16) {
        uint64_t v34 = 20;
      }
      uint64_t v35 = v18 ? v33 : v34;
    }
    else
    {
      [v30 setLabel:@"Interchange Compact Unpack Pipeline"];
      v36 = @"simple_fs";
      if (v8) {
        v36 = @"quadra_unpack_fs";
      }
      v37 = v9 ? @"bayer_unpack_fs" : v36;
      objc_msgSend(v30, "setFragmentFunction:", (id)objc_msgSend(v17, "newFunctionWithName:", v37));
      uint64_t v35 = v7 == 16 ? 20 : 10;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setPixelFormat:", v35);
    v38 = (MTLRenderPipelineState *)(id)[(MTLDevice *)v13->_mDevice newRenderPipelineStateWithDescriptor:v30 error:&v40];
    v13->_renderPipeline = v38;
    if (!v38) {
      return 0;
    }
  }
  return v13;
}

- (id)prepareTexture:(__IOSurface *)a3 usage:(unint64_t)a4
{
  signed int PixelFormat = IOSurfaceGetPixelFormat(a3);
  uint64_t v8 = 0;
  if (PixelFormat <= 1278226487)
  {
    if (PixelFormat > 642527541)
    {
      if (PixelFormat == 642527542) {
        goto LABEL_22;
      }
      if (PixelFormat == 642934849) {
        goto LABEL_23;
      }
      if (PixelFormat != 1111970369) {
        goto LABEL_24;
      }
    }
    else if (PixelFormat != 641877825)
    {
      if (PixelFormat == 642527288) {
        goto LABEL_21;
      }
      int v9 = 642527336;
      goto LABEL_13;
    }
    uint64_t v8 = 70;
    goto LABEL_24;
  }
  if (PixelFormat > 1380411456)
  {
    if (PixelFormat <= 1652056887)
    {
      if (PixelFormat != 1380411457)
      {
        int v9 = 1651519798;
        goto LABEL_13;
      }
LABEL_23:
      uint64_t v8 = 110;
      goto LABEL_24;
    }
    if (PixelFormat == 1751411059) {
      goto LABEL_22;
    }
    if (PixelFormat != 1652056888) {
      goto LABEL_24;
    }
LABEL_21:
    uint64_t v8 = 10;
    goto LABEL_24;
  }
  if (PixelFormat == 1278226488) {
    goto LABEL_21;
  }
  if (PixelFormat == 1278226536)
  {
LABEL_22:
    uint64_t v8 = 20;
    goto LABEL_24;
  }
  int v9 = 1278226742;
LABEL_13:
  if (PixelFormat == v9) {
    goto LABEL_22;
  }
LABEL_24:
  BOOL v10 = (void *)MEMORY[0x1E4F35330];
  size_t Width = IOSurfaceGetWidth(a3);
  v12 = (void *)[v10 texture2DDescriptorWithPixelFormat:v8 width:Width height:IOSurfaceGetHeight(a3) mipmapped:0];
  [v12 setUsage:a4];
  v13 = (void *)[(MTLDevice *)self->_mDevice newTextureWithDescriptor:v12 iosurface:a3 plane:0];
  return v13;
}

- (void)prepareSrc:(__IOSurface *)a3
{
  v4 = [(CMPhotoInterchangeCompactMetal *)self prepareTexture:a3 usage:1];
  self->_mSrcTex = v4;
  if (!v4) {
    -[CMPhotoInterchangeCompactMetal prepareSrc:]();
  }
}

- (void)prepareDst:(__IOSurface *)a3
{
  v5 = [(CMPhotoInterchangeCompactMetal *)self prepareTexture:a3 usage:4];
  self->_mDstTex = v5;
  if (!v5) {
    -[CMPhotoInterchangeCompactMetal prepareDst:]();
  }
  if (IOSurfaceGetCompressionTypeOfPlane() == 3)
  {
    mDevice = self->_mDevice;
    if (!mDevice) {
      -[CMPhotoInterchangeCompactMetal prepareDst:]();
    }
    int v7 = (MTLBuffer *)(id)[(MTLDevice *)mDevice newBufferWithIOSurface:a3];
    self->_mDstBuf = v7;
    if (!v7) {
      -[CMPhotoInterchangeCompactMetal prepareDst:]();
    }
    BaseAddress = IOSurfaceGetBaseAddress(a3);
    self->_mDstMetaOffset = IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane() - (void)BaseAddress;
    self->mb_width = IOSurfaceGetWidthInCompressedTilesOfPlane();
    self->mb_height = IOSurfaceGetHeightInCompressedTilesOfPlane();
    uint64_t CompressedTileWidthOfPlane = IOSurfaceGetCompressedTileWidthOfPlane();
    unint64_t v10 = (unint64_t)(IOSurfaceGetCompressedTileHeightOfPlane() * CompressedTileWidthOfPlane) >> 5;
    unint64_t v11 = v10 * self->mb_width * self->mb_height;
    self->meta_size = v10;
    self->meta_length = v11;
    if (self->_mask != (unsigned __int16)(IOSurfaceGetBytesPerTileDataOfPlane() / self->meta_size - 1)) {
      -[CMPhotoInterchangeCompactMetal prepareDst:].cold.4();
    }
  }
}

- (void)prepareData
{
  self->_mBufferA = (MTLBuffer *)(id)[(MTLDevice *)self->_mDevice newBufferWithLength:self->meta_length options:0];
  self->_mBufferB = (MTLBuffer *)(id)[(MTLDevice *)self->_mDevice newBufferWithLength:2 * (self->meta_length / self->meta_size) options:0];
}

- (void)sendRenderCommand
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal sendRenderCommand]", "CMPhotoInterchangeCompactMetal.m", 247, "(IOSurfaceGetCompressionTypeOfPlane(_mDstTex.iosurface, _mDstTex.iosurfacePlane) == kIOSurfaceCompressionTypeInterchange) || (IOSurfaceGetCompressionTypeOfPlane(_mSrcTex.iosurface, _mSrcTex.iosurfacePlane) == kIOSurfaceCompressionTypeInterchange)");
}

- (void)prepareSrc:.cold.1()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareSrc:]", "CMPhotoInterchangeCompactMetal.m", 191, "_mSrcTex != nil");
}

- (void)prepareDst:.cold.1()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 196, "_mDstTex != nil");
}

- (void)prepareDst:.cold.2()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 201, "deviceSPI != nil");
}

- (void)prepareDst:.cold.3()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 203, "_mDstBuf != nil");
}

- (void)prepareDst:.cold.4()
{
  __assert_rtn("-[CMPhotoInterchangeCompactMetal prepareDst:]", "CMPhotoInterchangeCompactMetal.m", 215, "_mask == mask");
}

@end
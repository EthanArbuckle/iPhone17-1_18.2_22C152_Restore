@interface NTKPlumeriaQuad
+ (double)getDesiredFPS;
+ (float)generateZdepthForLayer:(int)a3 numLayers:(int)a4;
- (BOOL)initDigitStructs;
- (BOOL)isAnimatingOverrideDate;
- (BOOL)prepareForTime:(double)a3;
- (NSDate)overrideDate;
- (NTKPlumeriaQuad)initWithDevice:(id)a3;
- (double)tritiumProgress;
- (float)springStep;
- (id)_createQuadVertexBuffer:(float)a3 y:(float)a4 w:(float)a5 h:(float)a6 z:(float)a7;
- (id)_loadMetalBinaryArchives;
- (id)_loadTextureResource:(id)a3;
- (int)currentIndex;
- (int)state;
- (void)initBloomPipeline:(id)a3;
- (void)initLayerAndInstanceStructs;
- (void)initPlumeriaPipeline:(id)a3;
- (void)morphBetweenColorways:(float)a3 index1:(int)a4 index2:(int)a5;
- (void)performBlending:(float)a3 input1:(id *)a4 input2:(id *)a5 output:(id *)a6;
- (void)performBloomBlending:(float)a3 input1:(id *)a4 input2:(id *)a5 output:(id *)a6;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4;
- (void)setAnimatingOverrideDate:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setState:(int)a3;
- (void)setTritiumProgress:(double)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKPlumeriaQuad

- (NTKPlumeriaQuad)initWithDevice:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NTKPlumeriaQuad;
  v6 = [(NTKPlumeriaQuad *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    +[NTKPlumeriaQuad getDesiredFPS];
    v7->_fps = v8;
    uint64_t v9 = +[CLKUIMetalResourceManager sharedDevice];
    mtlDevice = v7->_mtlDevice;
    v7->_mtlDevice = (MTLDevice *)v9;

    v11 = v7->_mtlDevice;
    v12 = sub_43BC();
    v13 = (MTLLibrary *)[(MTLDevice *)v11 newDefaultLibraryWithBundle:v12 error:0];
    library = v7->_library;
    v7->_library = v13;

    [v5 screenScale];
    v7->_screenScale = v15;
    v7->_tritiumProgress = 0.0;
    *(_OWORD *)v7->_anon_1270 = xmmword_9230;
    *(_OWORD *)v7->_deviceAccel = 0u;
    NTKPlumeriaSettingsResetToDefaults(&v7->_settings.randomSeed);
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    NTKPlumeriaSettingsLoadFromPlistResource(v16, @"PlumeriaSettings", (unsigned int *)&v7->_settings);
    v7->_currentSettings = ($800C62AA10BA5F21A008C73E5E17152A *)&v7->_settings.normal[0].overallScale;
    v7->_currentTritiumSettings = ($800C62AA10BA5F21A008C73E5E17152A *)&v7->_anon_15a0[1840];
    v7->_firstSettings = ($800C62AA10BA5F21A008C73E5E17152A *)&v7->_settings.normal[0].overallScale;
  }
  return v7;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v8 = a3;
  if ((NTKEqualObjects() & 1) == 0)
  {
    if (a4 > 0.0) {
      [(NTKPlumeriaQuad *)self setAnimatingOverrideDate:1];
    }
    objc_storeStrong((id *)&self->_overrideDate, a3);
    double v7 = CACurrentMediaTime();
    self->_startOverrideTime = v7;
    self->_endOverrideTime = v7 + a4;
  }
}

- (void)setAnimatingOverrideDate:(BOOL)a3
{
  if (self->_animatingOverrideDate != a3) {
    self->_animatingOverrideDate = a3;
  }
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double screenScale = self->_screenScale;
  self->_renderSize.width = v6 * screenScale;
  self->_renderSize.height = v7 * screenScale;
  id v8 = [v4 superview];
  [v8 safeAreaInsets];
  double v10 = v9;
  v11 = [v4 superview];
  [v11 safeAreaInsets];
  double v13 = v10 - v12;

  double v14 = -v13;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  float v15 = self->_screenScale * v14;
  self->_renderSize.height = self->_renderSize.height + v15;
  id v16 = [v4 colorPixelFormat];

  self->_pixelFormat = (unint64_t)v16;
  [(NTKPlumeriaQuad *)self initDigitStructs];
  [(NTKPlumeriaQuad *)self initLayerAndInstanceStructs];
  id v19 = [(NTKPlumeriaQuad *)self _loadMetalBinaryArchives];
  [(NTKPlumeriaQuad *)self initBloomPipeline:v19];
  [(NTKPlumeriaQuad *)self initPlumeriaPipeline:v19];
  if (!self->_fontHelper)
  {
    v17 = objc_alloc_init(NTKPlumeriaFontHelper);
    fontHelper = self->_fontHelper;
    self->_fontHelper = v17;

    [(NTKPlumeriaFontHelper *)self->_fontHelper setFontToSFRoundedNumericSemibold10Point];
  }
}

- (BOOL)prepareForTime:(double)a3
{
  return 1;
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MTLRenderPassDescriptor renderPassDescriptor];
  tempRenderTargetTexture = self->_tempRenderTargetTexture;
  double v10 = [v8 colorAttachments];
  v11 = [v10 objectAtIndexedSubscript:0];
  [v11 setTexture:tempRenderTargetTexture];

  double v12 = [v8 colorAttachments];
  double v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setLoadAction:2];

  double v14 = [v7 renderCommandEncoderWithDescriptor:v8];
  [(NTKPlumeriaQuad *)self renderForDisplayWithEncoder:v14];
  [v14 endEncoding];
  [(NTKPlumeriaBloomEffect *)self->_bloomEffect setMaxIterations:(double)self->_currentSettings->var22];
  float v15 = [(NTKPlumeriaBloomEffect *)self->_bloomEffect bloom:self->_tempRenderTargetTexture commandBuffer:v7];
  id v16 = [v7 renderCommandEncoderWithDescriptor:v6];

  p_settings = &self->_settings;
  if (self->_editingColors)
  {
    uint64_t editingIndex1 = self->_editingIndex1;
    uint64_t v20 = (uint64_t)(&p_settings->normal[0].overallScale + 64 * (uint64_t)self->_editingIndex2);
    *(float *)&double tritiumProgress = self->_editingFraction;
  }
  else
  {
    uint64_t editingIndex1 = self->_currentIndex;
    uint64_t v20 = (uint64_t)(&p_settings[3].normal[2].fontEnlargement + 64 * editingIndex1);
    double tritiumProgress = self->_tritiumProgress;
    *(float *)&double tritiumProgress = tritiumProgress;
  }
  memset(v22, 0, sizeof(v22));
  int v23 = 0;
  [(NTKPlumeriaQuad *)self performBloomBlending:&p_settings->normal[0].overallScale + 64 * editingIndex1 input1:v20 input2:v22 output:tritiumProgress];
  id v21 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:v22 length:28 options:1];
  [v16 setFragmentBuffer:v21 offset:0 atIndex:0];
  [v16 setRenderPipelineState:self->_bloomPipelineState];
  [v16 setFragmentTexture:self->_tempRenderTargetTexture atIndex:0];
  [v16 setFragmentTexture:v15 atIndex:1];
  [v16 drawPrimitives:3 vertexStart:0 vertexCount:3];
  [v16 endEncoding];
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  [v4 setLabel:@"Plumeria Render Encoder"];
  uint64_t v98 = 0;
  uint64_t v97 = 0;
  CGSize renderSize = self->_renderSize;
  long long v100 = xmmword_9240;
  [v4 setViewport:&v97];
  [v4 setRenderPipelineState:self->_plumeriaPipelineState];
  [v4 setCullMode:0];
  [(NTKPlumeriaQuad *)self springStep];
  self->_springPosition = *(float *)&tritiumProgress;
  HIDWORD(tritiumProgress) = 0;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  memset(v74, 0, sizeof(v74));
  p_settings = &self->_settings;
  if (self->_editingColors)
  {
    uint64_t editingIndex1 = self->_editingIndex1;
    uint64_t v8 = (uint64_t)(&p_settings->normal[0].overallScale + 64 * (uint64_t)self->_editingIndex2);
    *(float *)&double tritiumProgress = self->_editingFraction;
  }
  else
  {
    uint64_t editingIndex1 = self->_currentIndex;
    uint64_t v8 = (uint64_t)(&p_settings[3].normal[2].fontEnlargement + 64 * editingIndex1);
    double tritiumProgress = self->_tritiumProgress;
    *(float *)&double tritiumProgress = tritiumProgress;
  }
  [(NTKPlumeriaQuad *)self performBlending:&p_settings->normal[0].overallScale + 64 * editingIndex1 input1:v8 input2:v74 output:tritiumProgress];
  if (*((float *)&v75 + 2) < 1.0) {
    *(float *)&long long v75 = *((float *)&v75 + 2) * *(float *)&v75;
  }
  [(CLKDevice *)self->_device screenBounds];
  double v10 = v9;
  [(CLKDevice *)self->_device screenBounds];
  float v12 = v10 / v11;
  *(float *)v74 = v12;
  id v13 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:v74 length:416 options:1];
  [v4 setVertexBuffer:v13 offset:0 atIndex:1];
  v65 = v13;
  [v4 setFragmentBuffer:v13 offset:0 atIndex:0];
  overrideDate = self->_overrideDate;
  if (overrideDate)
  {
    float v15 = overrideDate;
  }
  else
  {
    float v15 = +[NTKDate faceDate];
  }
  id v16 = v15;
  v63 = +[NSCalendar currentCalendar];
  v17 = [v63 components:96 fromDate:v16];
  int64_t v18 = (int64_t)[v17 hour];
  v62 = v17;
  unint64_t v19 = (unint64_t)[v17 minute];
  v61 = +[NSLocale currentLocale];
  if ((CLKLocaleIs24HourMode() & 1) == 0)
  {
    if (v18)
    {
      if (v18 > 12) {
        v18 -= 12;
      }
    }
    else
    {
      int64_t v18 = 12;
    }
  }
  int var1 = self->_currentSettings->var1;
  v64 = v16;
  if (var1 >= 1)
  {
    int64_t v18 = var1 / 0x64uLL;
    unint64_t v19 = var1 % 0x64u;
  }
  uint64_t v21 = 0;
  v104[0] = (int)v18 / 10;
  v104[1] = (int)v18 % 10;
  v104[2] = (int)v19 / 10;
  v104[3] = (int)v19 % 10;
  v22 = &self->_layerStructs[2];
  int v23 = v103;
  do
  {
    uint64_t v24 = *(void *)&v22->layer;
    v22 += 6;
    *(void *)int v23 = v24;
    +[NTKPlumeriaQuad generateZdepthForLayer:v21 numLayers:20];
    *((_DWORD *)v23 + 2) = v25;
    ++v21;
    v23 += 16;
  }
  while (v21 != 20);
  id v66 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:v103 length:320 options:1];
  objc_msgSend(v4, "setVertexBuffer:offset:atIndex:");
  [(NTKPlumeriaFontHelper *)self->_fontHelper generateLayout:v18 minute:v19 layout:v101];
  uint64_t v26 = 0;
  digitStructs = self->_digitStructs;
  v28 = v102;
  do
  {
    +[NTKPlumeriaFontHelper generateTransformFromRect:v28 toRect:v28 + 16 transformX:*(double *)&digitStructs[2 * v104[v26] + 1].digit transformY:v101[2 * v26]];
    ++v26;
    v28 += 32;
  }
  while (v26 != 4);
  id v70 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:v102 length:128 options:1];
  uint64_t v29 = 0;
  LODWORD(v30) = DWORD2(v75);
  float v31 = *((float *)&v75 + 1);
  p_segmentPos = &self->_instanceStructs[0].segmentPos;
  v33 = (float *)&v98;
  do
  {
    float v34 = *(p_segmentPos - 1);
    float v35 = *p_segmentPos;
    *(v33 - 2) = *(p_segmentPos - 2) * *(float *)&v30;
    *(v33 - 1) = v35;
    float *v33 = v34;
    *((_DWORD *)v33 + 1) = v29 >> 2;
    float v36 = v35 + (float)(v34 * v31);
    float *p_segmentPos = v36;
    float v37 = -1.0;
    if (v36 > 1.0 || v36 < 0.0 && (float v37 = 1.0, v34 < 0.0)) {
      float *p_segmentPos = v36 + v37;
    }
    ++v29;
    p_segmentPos += 6;
    v33 += 4;
  }
  while (v29 != 144);
  LODWORD(v30) = HIDWORD(v75);
  if (*((float *)&v75 + 3) > 1.0)
  {
    uint64_t v38 = *(int *)(v8 + 32);
    *((float *)&v97 + 16 * v38) = *((float *)&v75 + 3) * *((float *)&v97 + 16 * v38);
    v39 = (float *)(&v97 + 8 * (int)v38);
    v39[4] = *(float *)&v30 * v39[4];
    v39[8] = *(float *)&v30 * v39[8];
    *(float *)&double v30 = *(float *)&v30 * v39[12];
    v39[12] = *(float *)&v30;
  }
  v68 = self->_digitStructs;
  id v69 = -[MTLDevice newBufferWithBytes:length:options:](self->_mtlDevice, "newBufferWithBytes:length:options:", &v97, 2304, 1, v30);
  uint64_t v40 = 19;
  do
  {
    uint64_t v41 = v40;
    [v4 setVertexBuffer:v66 offset:16 * v40 atIndex:2];
    uint64_t v42 = 0;
    uint64_t v67 = v41;
    uint64_t v71 = v41 << 6;
    do
    {
      v43 = digitStructs[2 * v104[v42]].mesh;
      v44 = [(MTKMesh *)v43 vertexBuffers];
      v45 = [v44 objectAtIndexedSubscript:0];

      v46 = [v45 buffer];
      v72 = v45;
      objc_msgSend(v4, "setVertexBuffer:offset:atIndex:", v46, objc_msgSend(v45, "offset"), 0);

      [v4 setFragmentBuffer:v69 offset:v71 + 16 * v42 atIndex:1];
      uint64_t v73 = v42;
      [v4 setVertexBuffer:v70 offset:32 * v42 atIndex:3];
      [v4 setVertexBuffer:v69 offset:v71 + 16 * v42 atIndex:4];
      v47 = [(MTKMesh *)v43 submeshes];
      id v48 = [v47 count];

      v49 = v4;
      if (v48)
      {
        unint64_t v50 = 0;
        do
        {
          v51 = [(MTKMesh *)v43 submeshes];
          v52 = [v51 objectAtIndexedSubscript:v50];

          id v53 = [v52 primitiveType];
          id v54 = [v52 indexCount];
          id v55 = [v52 indexType];
          v56 = [v52 indexBuffer];
          v57 = [v56 buffer];
          v58 = [v52 indexBuffer];
          objc_msgSend(v49, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", v53, v54, v55, v57, objc_msgSend(v58, "offset"));

          ++v50;
          v59 = [(MTKMesh *)v43 submeshes];
          id v60 = [v59 count];
        }
        while ((unint64_t)v60 > v50);
      }

      uint64_t v42 = v73 + 1;
      id v4 = v49;
      digitStructs = v68;
    }
    while (v73 != 3);
    uint64_t v40 = v67 - 1;
  }
  while (v67);
}

- (id)_loadMetalBinaryArchives
{
  if (_os_feature_enabled_impl())
  {
    v3 = sub_43BC();
    id v4 = [v3 URLForResource:@"plumeria" withExtension:@"metallib"];
    id v5 = objc_opt_new();
    [v5 setUrl:v4];
    mtlDevice = self->_mtlDevice;
    id v12 = 0;
    id v7 = [(MTLDevice *)mtlDevice newBinaryArchiveWithDescriptor:v5 error:&v12];
    id v8 = v12;
    if (v7)
    {
      id v13 = v7;
      double v9 = +[NSArray arrayWithObjects:&v13 count:1];
    }
    else
    {
      double v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_701C();
      }

      double v9 = &__NSArray0__struct;
    }
  }
  else
  {
    double v9 = &__NSArray0__struct;
  }

  return v9;
}

- (void)initPlumeriaPipeline:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLLibrary *)self->_library newFunctionWithName:@"plumeriaVertexShader"];
  id v6 = [(MTLLibrary *)self->_library newFunctionWithName:@"plumeriaFragmentShader"];
  if (!v6)
  {
    id v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_7154((uint64_t)self, v7);
    }
  }
  id v8 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  double v9 = v8;
  if (v4) {
    [v8 setBinaryArchives:v4];
  }
  [v9 setVertexFunction:v5];
  [v9 setFragmentFunction:v6];
  [v9 setLabel:@"Plumeria Render Pipeline"];
  double v10 = [v9 colorAttachments];
  double v11 = [v10 objectAtIndexedSubscript:0];

  [v11 setPixelFormat:self->_pixelFormat];
  [v11 setBlendingEnabled:0];
  plumeriaPipelineState = self->_plumeriaPipelineState;
  self->_plumeriaPipelineState = 0;

  if (v4)
  {
    mtlDevice = self->_mtlDevice;
    id v24 = 0;
    double v14 = (MTLRenderPipelineState *)[(MTLDevice *)mtlDevice newRenderPipelineStateWithDescriptor:v9 options:4 reflection:0 error:&v24];
    id v15 = v24;
    id v16 = self->_plumeriaPipelineState;
    self->_plumeriaPipelineState = v14;

    if (self->_plumeriaPipelineState)
    {
      id v17 = 0;
      if (!v15) {
        goto LABEL_21;
      }
    }
    int64_t v18 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_70EC();
    }
  }
  else
  {
    id v15 = 0;
  }
  if (self->_plumeriaPipelineState)
  {
    id v17 = v15;
  }
  else
  {
    unint64_t v19 = self->_mtlDevice;
    id v23 = v15;
    uint64_t v20 = (MTLRenderPipelineState *)[(MTLDevice *)v19 newRenderPipelineStateWithDescriptor:v9 error:&v23];
    id v17 = v23;

    uint64_t v21 = self->_plumeriaPipelineState;
    self->_plumeriaPipelineState = v20;

    if (!self->_plumeriaPipelineState || v17)
    {
      v22 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        sub_7084();
      }
    }
  }
LABEL_21:
}

- (id)_createQuadVertexBuffer:(float)a3 y:(float)a4 w:(float)a5 h:(float)a6 z:(float)a7
{
  *(float *)&long long v7 = a3 + a5;
  float v8 = a4 + a6;
  long long v9 = *(_OWORD *)&a3;
  *((float *)&v9 + 1) = a4;
  *((float *)&v9 + 2) = a7;
  v19[0] = v9;
  v19[1] = xmmword_9250;
  uint64_t v20 = 0x3F80000000000000;
  float v10 = v8;
  long long v21 = *(_OWORD *)&a3;
  long long v22 = xmmword_9250;
  _Q0 = v7;
  *((float *)&_Q0 + 1) = a4;
  *((float *)&_Q0 + 2) = a7;
  uint64_t v23 = 0;
  long long v24 = _Q0;
  long long v25 = xmmword_9250;
  __asm { FMOV            V0.2S, #1.0 }
  *((float *)&v7 + 1) = v8;
  uint64_t v26 = _Q0;
  *((float *)&v7 + 2) = a7;
  long long v27 = v7;
  long long v28 = xmmword_9250;
  uint64_t v29 = 1065353216;
  id v17 = [(MTLDevice *)self->_mtlDevice newBufferWithBytes:v19 length:192 options:1];

  return v17;
}

- (id)_loadTextureResource:(id)a3
{
  v11[0] = MTKTextureLoaderOptionTextureUsage;
  v11[1] = MTKTextureLoaderOptionTextureStorageMode;
  v12[0] = &off_CE60;
  v12[1] = &off_CE78;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v6 = [objc_alloc((Class)MTKTextureLoader) initWithDevice:self->_mtlDevice];
  long long v7 = sub_43BC();
  uint64_t v10 = 0;
  id v8 = [v6 newTextureWithName:v4 scaleFactor:v7 bundle:v5 options:&v10 error:1.0];

  return v8;
}

- (void)performBloomBlending:(float)a3 input1:(id *)a4 input2:(id *)a5 output:(id *)a6
{
  BOOL v7 = a3 < 0.0;
  float v8 = 0.0;
  if (!v7) {
    float v8 = a3;
  }
  if (v8 > 1.0) {
    float v8 = 1.0;
  }
  double v9 = (float)(v8 * v8);
  *(float *)&double v9 = (v8 * -2.0 + 3.0) * v9;
  float32x4_t v10 = *(float32x4_t *)&a4->var15;
  float32x4_t v11 = *(float32x4_t *)&a5->var15;
  *(float32x4_t *)&a6->var0 = vmlaq_n_f32(v10, vsubq_f32(v11, v10), *(float *)&v9);
  *(float32x2_t *)&a6->var4 = vmla_f32(*(float32x2_t *)&a4->var19, vsub_f32(*(float32x2_t *)&a5->var19, *(float32x2_t *)&a4->var19), (float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)&v9, 0));
  float var21 = a4->var21;
  float v13 = a5->var21;
  a6->var6 = var21 + (float)(*(float *)&v9 * (float)(v13 - var21));
  if (self->_state == 2)
  {
    double var2 = a5[1].var2;
    if (*(float *)&var2 > 0.0) {
      a6->int var1 = splineInterpolation(v10.f32[1], *(float *)&var2, *((float *)&var2 + 1), v11.f32[1], a3);
    }
    double var3 = a5[1].var3;
    if (*(float *)&var3 > 0.0) {
      a6->var6 = splineInterpolation(var21, *(float *)&var3, *((float *)&var3 + 1), v13, a3);
    }
  }
}

- (void)performBlending:(float)a3 input1:(id *)a4 input2:(id *)a5 output:(id *)a6
{
  BOOL v12 = a3 < 0.0;
  float v13 = 0.0;
  if (!v12) {
    float v13 = a3;
  }
  if (v13 > 1.0) {
    float v13 = 1.0;
  }
  *(float *)v6.i32 = (v13 * -2.0 + 3.0) * (float)(v13 * v13);
  v14.f64[0] = a4->var2;
  v15.f64[0] = a5->var2;
  float64x2_t v16 = *(float64x2_t *)&a4->var3;
  float64x2_t v17 = *(float64x2_t *)&a5->var3;
  float var6 = a4->var6;
  float v19 = a5->var6;
  a6[1].var5 = var6 + (float)(*(float *)v6.i32 * (float)(v19 - var6));
  v14.f64[1] = a4->var7;
  float32x4_t v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v14);
  v15.f64[1] = a5->var7;
  *(float32x4_t *)&a6->float var9 = vmlaq_n_f32(v20, vsubq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), v15), v20), *(float *)v6.i32);
  v20.i64[0] = *(void *)&a4->var10;
  v17.f64[0] = a5->var10;
  v20.i64[1] = *(void *)&a4->var12;
  float32x4_t v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a4->var8), (float64x2_t)v20);
  v17.f64[1] = a5->var12;
  float32x2_t v36 = (float32x2_t)vdupq_lane_s32(v6, 0).u64[0];
  float v37 = *(float *)v6.i32;
  *(float32x4_t *)&a6->var13 = vmlaq_n_f32(v21, vsubq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->var8), v17), v21), *(float *)v6.i32);
  *(float32x2_t *)v21.f32 = vcvt_f32_f64(*(float64x2_t *)&a4->var13);
  *(float32x2_t *)&a6[1].double var3 = vmla_f32(*(float32x2_t *)v21.f32, vsub_f32(vcvt_f32_f64(*(float64x2_t *)&a5->var13), *(float32x2_t *)v21.f32), v36);
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  BOOL v24 = IsReduceMotionEnabled;
  if (self->_state == 2 && !IsReduceMotionEnabled)
  {
    float var7 = a4->var7;
    float v26 = a5->var7;
    a6->var12 = splineInterpolation(var7, COERCE_FLOAT(*(void *)&a5->var23), COERCE_FLOAT(HIDWORD(*(void *)&a5->var23)), v26, a3);
    float var8 = a4->var8;
    float v28 = a5->var8;
    *(float *)&a6->var13 = splineInterpolation(var8, COERCE_FLOAT(*(void *)&a5->var23), COERCE_FLOAT(HIDWORD(*(void *)&a5->var23)), v28, a3);
    float var9 = a4->var9;
    float v30 = a5->var9;
    a6[1].var0 = splineInterpolation(var9, COERCE_FLOAT(*(void *)&a5[1].var0), COERCE_FLOAT(HIDWORD(*(void *)&a5[1].var0)), v30, a3);
    float var2 = a4->var2;
    float v32 = a5->var2;
    a6->var11 = splineInterpolation(var2, COERCE_FLOAT(*(void *)&a5[1].var4), COERCE_FLOAT(HIDWORD(*(void *)&a5[1].var4)), v32, a3);
  }
  for (uint64_t i = 0; i != 320; i += 16)
  {
    *(float32x2_t *)&long long v23 = vmla_f32(*(float32x2_t *)((char *)&a4[1].var6 + i), vsub_f32(*(float32x2_t *)((char *)&a5[1].var6 + i), *(float32x2_t *)((char *)&a4[1].var6 + i)), v36);
    *((float *)&v23 + 2) = *(float *)((char *)&a4[1].var7 + i)
                         + (float)(v37
                                 * (float)(*(float *)((char *)&a5[1].var7 + i) - *(float *)((char *)&a4[1].var7 + i)));
    *(_OWORD *)((char *)&a6[1].var10 + i) = v23;
  }
  if (v24 || (int state = self->_state, state == 3))
  {
    *(_DWORD *)&self->_deviceAccel[8] = 0;
    *(void *)self->_deviceAccel = 0;
    int state = self->_state;
  }
  if ((state - 4) < 2)
  {
    long long v23 = 0uLL;
  }
  else if ((state - 1) > 1)
  {
    long long v23 = *(_OWORD *)self->_deviceAccel;
  }
  else
  {
    *(float32x2_t *)&long long v23 = vmla_f32(*(float32x2_t *)self->_deviceAccel, vsub_f32(0, *(float32x2_t *)self->_deviceAccel), v36);
    *((float *)&v23 + 2) = *(float *)&self->_deviceAccel[8]
                         + (float)(v37 * (float)(0.0 - *(float *)&self->_deviceAccel[8]));
  }
  *(_OWORD *)&a6->var4 = v23;
  float springPosition = self->_springPosition;
  if ((self->_state - 1) < 2) {
    float springPosition = springPosition + (float)(v37 * (float)(0.0 - springPosition));
  }
  a6->float var8 = springPosition;
}

+ (float)generateZdepthForLayer:(int)a3 numLayers:(int)a4
{
  float result = 1.0 / (double)(a4 - 1) * (double)a3;
  if (result <= 0.0) {
    return 0.001;
  }
  if (result >= 1.0) {
    return 0.9999;
  }
  return result;
}

- (void)initLayerAndInstanceStructs
{
  unsigned int randomSeed = self->_settings.randomSeed;
  srand(randomSeed);
  uint64_t v4 = 0;
  dword_13570 = randomSeed;
  for (uint64_t i = &self->_layerStructs[4]; ; i += 6)
  {
    i[-4].layer = v4;
    float v6 = randomSeed ? (double)rand() / 2147483650.0 : (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
    *(float *)&i[-2].layer = v6;
    float v7 = dword_13570 ? (double)rand() / 2147483650.0 : (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
    *(float *)&i[-1].layer = v7;
    +[NTKPlumeriaQuad generateZdepthForLayer:v4 numLayers:36];
    i->layer = v8;
    if (v4 == 35) {
      break;
    }
    unsigned int randomSeed = dword_13570;
    ++v4;
  }
  uint64_t v9 = 0;
  *(void *)&self->_layerStructs[2].layer = 0x3F0000003F000000;
  p_segmentPos = &self->_instanceStructs[0].segmentPos;
  do
  {
    *((_DWORD *)p_segmentPos - 5) = v9;
    *((_DWORD *)p_segmentPos - 4) = v9 / 0x24u;
    *((_DWORD *)p_segmentPos - 3) = v9 % 0x24u;
    if (dword_13570) {
      float v11 = (double)rand() / 2147483650.0;
    }
    else {
      float v11 = (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
    }
    *(p_segmentPos - 2) = (float)(v11 * 0.25) + 0.3;
    if (dword_13570) {
      float v12 = (double)rand() / 2147483650.0;
    }
    else {
      float v12 = (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
    }
    float *p_segmentPos = v12;
    double fps = self->_fps;
    if (dword_13570) {
      float v14 = (double)rand() / 2147483650.0;
    }
    else {
      float v14 = (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
    }
    float v15 = 30.0 / fps;
    double v16 = v15;
    float v17 = v16 * 0.0015;
    *(float *)&double v16 = v16 * 0.0024;
    *(p_segmentPos - 1) = v17 + (float)(v14 * (float)(*(float *)&v16 - v17));
    if (dword_13570) {
      float v18 = (double)rand() / 2147483650.0;
    }
    else {
      float v18 = (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
    }
    if (v18 > 0.66) {
      *(p_segmentPos - 1) = -*(p_segmentPos - 1);
    }
    ++v9;
    p_segmentPos += 6;
  }
  while (v9 != 144);
}

- (BOOL)initDigitStructs
{
  float v34 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v34) {
    goto LABEL_16;
  }
  id v33 = [objc_alloc((Class)MTKMeshBufferAllocator) initWithDevice:self->_mtlDevice];
  if (!v33) {
    goto LABEL_16;
  }
  uint64_t v3 = 0;
  int v32 = 0;
  float v30 = self;
  uint64_t v4 = self;
  do
  {
    id v5 = +[NSString stringWithFormat:@"%d", v3];
    float v6 = [v34 URLForResource:v5 withExtension:@"usdc"];
    if (v6)
    {
      id v7 = objc_alloc_init((Class)MDLVertexDescriptor);
      id v8 = objc_alloc((Class)NSMutableArray);
      id v9 = [objc_alloc((Class)MDLVertexAttribute) initWithName:MDLVertexAttributePosition format:786435 offset:0 bufferIndex:0];
      id v10 = [objc_alloc((Class)MDLVertexAttribute) initWithName:MDLVertexAttributeNormal format:786435 offset:16 bufferIndex:0];
      id v11 = [objc_alloc((Class)MDLVertexAttribute) initWithName:MDLVertexAttributeTextureCoordinate format:786434 offset:32 bufferIndex:0];
      id v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, 0);
      [v7 setAttributes:v12];

      id v13 = objc_alloc((Class)NSMutableArray);
      id v14 = [objc_alloc((Class)MDLVertexBufferLayout) initWithStride:48];
      id v15 = objc_msgSend(v13, "initWithObjects:", v14, 0);
      [v7 setLayouts:v15];

      id v16 = [objc_alloc((Class)MDLAsset) initWithURL:v6 vertexDescriptor:v7 bufferAllocator:v33];
      if (v16)
      {
        float v17 = [v16 childObjectsOfClass:objc_opt_class()];
        float v18 = v17;
        if (v17 && [v17 count])
        {
          float v19 = [v18 objectAtIndexedSubscript:0];
          id v20 = objc_alloc((Class)MTKMesh);
          mtlDevice = v30->_mtlDevice;
          id v35 = 0;
          id v22 = [v20 initWithMesh:v19 device:mtlDevice error:&v35];
          id v23 = v35;
          BOOL v24 = v23;
          if (v22)
          {
            id v31 = v23;
            v4->_digitStructs[0].digit = v3;
            objc_storeStrong((id *)&v4->_digitStructs[0].mesh, v22);
            [v19 boundingBox];
            v4->_digitStructs[1] = ($7402B7C41D1FBC5D0C1044E1BDECB9CB)vzip1q_s64(v26, v25);
            BOOL v24 = v31;
            ++v32;
          }
        }
      }
    }
    ++v3;
    uint64_t v4 = (NTKPlumeriaQuad *)((char *)v4 + 32);
  }
  while (v3 != 10);

  if (v32 == 10)
  {
    BOOL v27 = 1;
  }
  else
  {
LABEL_16:
    float v28 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_71EC(v28);
    }

    BOOL v27 = 0;
  }

  return v27;
}

- (void)initBloomPipeline:(id)a3
{
  id v4 = a3;
  [(CLKDevice *)self->_device screenBounds];
  int v6 = (int)(v5 * self->_screenScale);
  [(CLKDevice *)self->_device screenBounds];
  int v8 = (int)(self->_screenScale * v7);
  id v9 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:self->_pixelFormat width:v6 height:v8 mipmapped:0];
  [v9 setUsage:5];
  [v9 setStorageMode:2];
  id v10 = (MTLTexture *)[(MTLDevice *)self->_mtlDevice newTextureWithDescriptor:v9];
  tempRenderTargetTexture = self->_tempRenderTargetTexture;
  self->_tempRenderTargetTexture = v10;

  id v12 = objc_alloc_init(NTKPlumeriaBloomEffect);
  bloomEffect = self->_bloomEffect;
  self->_bloomEffect = v12;

  [(NTKPlumeriaBloomEffect *)self->_bloomEffect initShader:self->_mtlDevice metalLibrary:self->_library width:(int)((double)v6 * 0.5) height:(int)((double)v8 * 0.5)];
  id v14 = [(MTLLibrary *)self->_library newFunctionWithName:@"screenTriangleVertex"];
  id v15 = [(MTLLibrary *)self->_library newFunctionWithName:@"bloomCompositeFragment"];
  id v16 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  float v17 = v16;
  if (v4) {
    [v16 setBinaryArchives:v4];
  }
  id v31 = v14;
  [v17 setVertexFunction:v14];
  [v17 setFragmentFunction:v15];
  [v17 setLabel:@"Plumeria Bloom Final Pass Pipeline"];
  float v18 = [v17 colorAttachments];
  float v19 = [v18 objectAtIndexedSubscript:0];

  [v19 setPixelFormat:self->_pixelFormat];
  [v19 setBlendingEnabled:0];
  bloomPipelineState = self->_bloomPipelineState;
  self->_bloomPipelineState = 0;

  if (v4)
  {
    mtlDevice = self->_mtlDevice;
    id v33 = 0;
    id v22 = (MTLRenderPipelineState *)[(MTLDevice *)mtlDevice newRenderPipelineStateWithDescriptor:v17 options:4 reflection:0 error:&v33];
    id v23 = v33;
    BOOL v24 = self->_bloomPipelineState;
    self->_bloomPipelineState = v22;

    if (self->_bloomPipelineState)
    {
      id v25 = 0;
      if (!v23) {
        goto LABEL_17;
      }
    }
    int64x2_t v26 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_7298();
    }
  }
  else
  {
    id v23 = 0;
  }
  if (self->_bloomPipelineState)
  {
    id v25 = v23;
  }
  else
  {
    BOOL v27 = self->_mtlDevice;
    id v32 = v23;
    float v28 = (MTLRenderPipelineState *)[(MTLDevice *)v27 newRenderPipelineStateWithDescriptor:v17 error:&v32];
    id v25 = v32;

    uint64_t v29 = self->_bloomPipelineState;
    self->_bloomPipelineState = v28;

    if (!self->_bloomPipelineState || v25)
    {
      float v30 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        sub_7230();
      }
    }
  }
LABEL_17:
}

- (void)morphBetweenColorways:(float)a3 index1:(int)a4 index2:(int)a5
{
  self->_editingColors = 1;
  self->_uint64_t editingIndex1 = a4;
  self->_editingIndex2 = a5;
  self->_editingFraction = a3;
  self->_int state = 5;
  if (a4 == a5)
  {
    self->_editingColors = 0;
    self->_currentIndex = a4;
    double v5 = (char *)&self->_settings + 512 * (uint64_t)a4;
    self->_currentSettings = ($800C62AA10BA5F21A008C73E5E17152A *)(v5 + 16);
    self->_currentTritiumSettings = ($800C62AA10BA5F21A008C73E5E17152A *)(v5 + 2576);
    self->_int state = 4;
  }
}

- (float)springStep
{
  return self->_springDisplacement;
}

+ (double)getDesiredFPS
{
  return 30.0;
}

- (double)tritiumProgress
{
  return self->_tritiumProgress;
}

- (void)setTritiumProgress:(double)a3
{
  self->_double tritiumProgress = a3;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (int)currentIndex
{
  return self->_currentIndex;
}

- (BOOL)isAnimatingOverrideDate
{
  return self->_animatingOverrideDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_plumeriaPipelineState, 0);
  objc_storeStrong((id *)&self->_bloomPipelineState, 0);
  objc_storeStrong((id *)&self->_tempRenderTargetTexture, 0);
  objc_storeStrong((id *)&self->_bloomFinalFragmentFunction, 0);
  objc_storeStrong((id *)&self->_bloomFinalVertexFunction, 0);
  objc_storeStrong((id *)&self->_bloomEffect, 0);
  objc_storeStrong((id *)&self->_fontHelper, 0);
  for (uint64_t i = 296; i != -24; i -= 32)

  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
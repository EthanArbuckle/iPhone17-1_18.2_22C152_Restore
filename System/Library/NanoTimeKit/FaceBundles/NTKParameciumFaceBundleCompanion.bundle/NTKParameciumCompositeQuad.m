@interface NTKParameciumCompositeQuad
+ (id)confettiFontDescriptor;
+ (id)renderNumbersWithColors:(id)a3 size:(double)a4 weight:(double)a5 inBounds:(CGRect)a6 baselineRadius:(double)a7;
+ (id)renderPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 library:(id)a5 device:(id)a6 pixelFormat:(unint64_t)a7;
- (BOOL)prepareForTime:(double)a3;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NTKParameciumCompositeQuad)initWithDevice:(id)a3;
- (double)backgroundOn;
- (double)confettiEntropy;
- (double)confettiRotation;
- (double)createMatrixForTextureWithSize:(float32x2_t)a1 translation:(double)a2 scale:(int32x2_t)a3 rotate:(float)a4 offset:(__n128)a5;
- (double)dateFraction;
- (double)secondFraction;
- (double)showsConfetti;
- (double)showsNumbers;
- (double)showsTicks;
- (double)tickShadows;
- (double)tritiumProgress;
- (float)currentTime;
- (id)_confettiHiddenBehindTicksBuffer:(id)a3 capsuleSize:(CGSize)a4;
- (id)_generateNoiseTextureInRect:(CGRect)a3 device:(id)a4;
- (id)confettiOriginsBuffer:(id)a3 capsuleSize:(CGSize)a4;
- (void)_initializeColors;
- (void)_updateHandAngles;
- (void)handleTouchAt:(CGPoint)a3 at:(double)a4;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4;
- (void)resetCurrentTime;
- (void)setBackgroundOn:(double)a3;
- (void)setConfettiEntropy:(double)a3;
- (void)setConfettiRotation:(double)a3;
- (void)setDateFraction:(double)a3;
- (void)setFromDate:(id)a3;
- (void)setSecondFraction:(double)a3;
- (void)setShowsConfetti:(double)a3;
- (void)setShowsNumbers:(double)a3;
- (void)setShowsTicks:(double)a3;
- (void)setTickShadows:(double)a3;
- (void)setToDate:(id)a3;
- (void)setTritiumProgress:(double)a3;
- (void)setupForQuadView:(id)a3;
- (void)updateConfettiColors:(id)a3;
@end

@implementation NTKParameciumCompositeQuad

- (NTKParameciumCompositeQuad)initWithDevice:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKParameciumCompositeQuad;
  v6 = [(NTKParameciumCompositeQuad *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    [v5 screenBounds];
    double v9 = v8;
    [v5 screenScale];
    *(float *)&double v10 = v10 * v9;
    unsigned int v19 = LODWORD(v10);
    [v5 screenBounds];
    double v12 = v11;
    [v5 screenScale];
    *(float *)&double v13 = v13 * v12;
    *(void *)v7->_targetSize = __PAIR64__(LODWORD(v13), v19);
    uint64_t v14 = +[NSCalendar autoupdatingCurrentCalendar];
    calendar = v7->_calendar;
    v7->_calendar = (NSCalendar *)v14;

    v7->_tritiumProgress = 1.0;
    v7->_dateFraction = 1.0;
    v7->_secondFraction = 1.0;
    v7->_currentTime = 0.0;
    v16 = objc_alloc_init(NTKParameciumTouchHandler);
    touchHandler = v7->_touchHandler;
    v7->_touchHandler = v16;

    [(NTKParameciumCompositeQuad *)v7 _initializeColors];
  }

  return v7;
}

- (void)setFromDate:(id)a3
{
  objc_storeStrong((id *)&self->_fromDate, a3);
  id v5 = a3;
  NTKHourMinuteSecondAnglesForTime();

  self->_fromHourAngle = -0.0;
  self->_fromMinuteAngle = -0.0;
  self->_fromSecondAngle = -0.0;
  [(NTKParameciumCompositeQuad *)self _updateHandAngles];
}

- (void)setToDate:(id)a3
{
  objc_storeStrong((id *)&self->_toDate, a3);
  id v5 = a3;
  NTKHourMinuteSecondAnglesForTime();

  self->_toHourAngle = -0.0;
  self->_toMinuteAngle = -0.0;
  self->_toSecondAngle = -0.0;
  [(NTKParameciumCompositeQuad *)self _updateHandAngles];
}

- (void)setDateFraction:(double)a3
{
  self->_dateFraction = a3;
  [(NTKParameciumCompositeQuad *)self _updateHandAngles];
}

- (void)setSecondFraction:(double)a3
{
  self->_secondFraction = a3;
  [(NTKParameciumCompositeQuad *)self _updateHandAngles];
}

- (void)_updateHandAngles
{
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  self->_hourAngle = v3;
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  self->_minuteAngle = v4;
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  self->_secondAngle = v5;
}

- (void)resetCurrentTime
{
  self->_currentTime = 0.0;
}

- (float)currentTime
{
  return self->_currentTime;
}

- (void)setConfettiRotation:(double)a3
{
  double v5 = self->_confettiRotation - a3;
  *(float *)&double v5 = v5;
  *(float *)&double v5 = -*(float *)&v5;
  [(NTKParameciumTouchHandler *)self->_touchHandler rotateTouchesByAngle:v5];
  self->_confettiRotation = a3;
}

+ (id)renderPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 library:(id)a5 device:(id)a6 pixelFormat:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  id v15 = [v14 newFunctionWithName:v11];
  id v16 = [v14 newFunctionWithName:v12];

  id v17 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v17 setLabel:@"ParameciumPipeline"];
  [v17 setVertexFunction:v15];
  [v17 setFragmentFunction:v16];
  v18 = [v17 colorAttachments];
  unsigned int v19 = [v18 objectAtIndexedSubscript:0];
  [v19 setPixelFormat:a7];

  objc_super v20 = [v17 colorAttachments];
  v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setBlendingEnabled:0];

  id v26 = 0;
  id v22 = [v13 newRenderPipelineStateWithDescriptor:v17 error:&v26];

  id v23 = v26;
  if (v23)
  {
    v24 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_8FAC((uint64_t)v12, v23, v24);
    }
  }

  return v22;
}

- (void)setupForQuadView:(id)a3
{
  id v155 = a3;
  [v155 setOpaque:0];
  double v4 = +[NSBundle bundleForClass:objc_opt_class()];
  double v5 = +[CLKUIMetalResourceManager sharedDevice];
  p_mtlDevice = &self->_mtlDevice;
  objc_storeStrong((id *)&self->_mtlDevice, v5);
  id v7 = [v5 newDefaultLibraryWithBundle:v4 error:0];
  id v147 = [v7 newFunctionWithName:@"paramecium_move_confetti"];
  double v8 = (MTLComputePipelineState *)objc_msgSend(v5, "newComputePipelineStateWithFunction:error:");
  computeConfettiPipelineState = self->_computeConfettiPipelineState;
  self->_computeConfettiPipelineState = v8;

  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_sprite_vertex_shader", @"paramecium_sprite_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  double v10 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  spritePipelineState = self->_spritePipelineState;
  self->_spritePipelineState = v10;

  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_sprite_vertex_shader", @"paramecium_sprite_multiply_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  id v12 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  spriteMultiplyPipelineState = self->_spriteMultiplyPipelineState;
  self->_spriteMultiplyPipelineState = v12;

  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_sprite_vertex_shader", @"paramecium_tinted_sprite_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  id v14 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  tintedSpritePipelineState = self->_tintedSpritePipelineState;
  self->_tintedSpritePipelineState = v14;

  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_sprite_vertex_shader", @"paramecium_hour_minute_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  id v16 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  handPipelineState = self->_handPipelineState;
  self->_handPipelineState = v16;

  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_sprite_vertex_shader", @"paramecium_hour_minute_inlay_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  v18 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  inlayPipelineState = self->_inlayPipelineState;
  self->_inlayPipelineState = v18;

  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_capsule_vertex_shader", @"paramecium_capsule_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  objc_super v20 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  capsulePipelineState = self->_capsulePipelineState;
  self->_capsulePipelineState = v20;

  v148 = v7;
  v154 = v5;
  +[NTKParameciumCompositeQuad renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:](NTKParameciumCompositeQuad, "renderPipelineStateWithVertexShader:fragmentShader:library:device:pixelFormat:", @"paramecium_blur_vertex_shader", @"paramecium_blur_fragment_shader", v7, v5, [v155 colorPixelFormat]);
  id v22 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  blurPipelineState = self->_blurPipelineState;
  self->_blurPipelineState = v22;

  v24 = +[MTLRenderPassDescriptor renderPassDescriptor];
  compositePassDescriptor = self->_compositePassDescriptor;
  self->_compositePassDescriptor = v24;

  id v26 = [(MTLRenderPassDescriptor *)self->_compositePassDescriptor colorAttachments];
  v27 = [v26 objectAtIndexedSubscript:0];

  [v27 setLoadAction:1];
  v146 = v27;
  [v27 setStoreAction:1];
  v28 = +[MTLRenderPassDescriptor renderPassDescriptor];
  blurPassDescriptor = self->_blurPassDescriptor;
  self->_blurPassDescriptor = v28;

  v30 = [(MTLRenderPassDescriptor *)self->_blurPassDescriptor colorAttachments];
  v31 = [v30 objectAtIndexedSubscript:0];

  [v31 setLoadAction:2];
  objc_msgSend(v31, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  v145 = v31;
  [v31 setStoreAction:1];
  v144 = [v4 URLForResource:@"gradient" withExtension:@"png"];
  v143 = +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:");
  v142 = +[UIImage imageWithData:](UIImage, "imageWithData:");
  v32 = [[NTKParameciumSprite alloc] initWithImage:v142];
  gradientSprite = self->_gradientSprite;
  self->_gradientSprite = v32;

  v149 = v4;
  v141 = [v4 URLForResource:@"gradient_shadow" withExtension:@"png"];
  v140 = +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:");
  v139 = +[UIImage imageWithData:](UIImage, "imageWithData:");
  v34 = [[NTKParameciumSprite alloc] initWithImage:v139];
  shadowGradientSprite = self->_shadowGradientSprite;
  self->_shadowGradientSprite = v34;

  v36 = +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:self->_device];
  hourConfiguration = self->_hourConfiguration;
  self->_hourConfiguration = v36;

  [(CLKUIAnalogHandConfiguration *)self->_hourConfiguration setRadialShadowRadius:25.0];
  [(CLKUIAnalogHandConfiguration *)self->_hourConfiguration setRadialShadowOpacity:0.6];
  v38 = +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:self->_device];
  minuteConfiguration = self->_minuteConfiguration;
  self->_minuteConfiguration = v38;

  [(CLKUIAnalogHandConfiguration *)self->_minuteConfiguration setRadialShadowRadius:25.0];
  [(CLKUIAnalogHandConfiguration *)self->_minuteConfiguration setRadialShadowOpacity:0.5];
  v40 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:self->_device];
  secondConfiguration = self->_secondConfiguration;
  self->_secondConfiguration = v40;

  v42 = self->_secondConfiguration;
  [(CLKUIAnalogHandConfiguration *)v42 handWidth];
  [(CLKUIAnalogHandConfiguration *)v42 setHandWidth:v43 * 1.75];
  v44 = self->_secondConfiguration;
  [(CLKUIAnalogHandConfiguration *)v44 handLength];
  [(CLKUIAnalogHandConfiguration *)v44 setHandLength:v45 * 0.85];
  [(CLKUIAnalogHandConfiguration *)self->_secondConfiguration setRadialShadowRadius:9.0];
  [(CLKUIAnalogHandConfiguration *)self->_secondConfiguration setRadialShadowOpacity:0.2];
  [(CLKUIAnalogHandConfiguration *)self->_hourConfiguration anchorPoint];
  float64_t v150 = v46;
  [(CLKUIAnalogHandConfiguration *)self->_hourConfiguration anchorPoint];
  v47.f64[0] = v150;
  v47.f64[1] = v48;
  *(float32x2_t *)self->_hourAnchor = vcvt_f32_f64(v47);
  [(CLKUIAnalogHandConfiguration *)self->_minuteConfiguration anchorPoint];
  float64_t v151 = v49;
  [(CLKUIAnalogHandConfiguration *)self->_minuteConfiguration anchorPoint];
  v50.f64[0] = v151;
  v50.f64[1] = v51;
  *(float32x2_t *)self->_minuteAnchor = vcvt_f32_f64(v50);
  [(CLKUIAnalogHandConfiguration *)self->_secondConfiguration anchorPoint];
  float64_t v152 = v52;
  [(CLKUIAnalogHandConfiguration *)self->_secondConfiguration anchorPoint];
  v53.f64[0] = v152;
  v53.f64[1] = v54;
  *(float32x2_t *)self->_secondAnchor = vcvt_f32_f64(v53);
  v55 = +[CLKUIAnalogHandFactory getAssets:38 forConfiguration:self->_hourConfiguration];
  v56 = +[CLKUIAnalogHandFactory getAssets:38 forConfiguration:self->_minuteConfiguration];
  v57 = +[CLKUIAnalogHandFactory getAssets:6 forConfiguration:self->_secondConfiguration];
  v153 = [v55 objectForKey:&off_10D60];
  uint64_t v58 = [v55 objectForKey:&off_10D78];
  v138 = v55;
  uint64_t v59 = [v55 objectForKey:&off_10D90];
  uint64_t v60 = [v56 objectForKey:&off_10D60];
  uint64_t v61 = [v56 objectForKey:&off_10D78];
  v137 = v56;
  uint64_t v62 = [v56 objectForKey:&off_10D90];
  v128 = [v57 objectForKey:&off_10D60];
  v136 = v57;
  v63 = [v57 objectForKey:&off_10D90];
  v64 = +[NTKParameciumSprite spriteWithImage:v153];
  hourSprite = self->_hourSprite;
  self->_hourSprite = v64;

  v135 = (void *)v58;
  v66 = +[NTKParameciumSprite spriteWithImage:v58];
  hourInlaySprite = self->_hourInlaySprite;
  self->_hourInlaySprite = v66;

  v134 = (void *)v59;
  v68 = +[NTKParameciumSprite spriteWithImage:v59];
  hourShadowSprite = self->_hourShadowSprite;
  self->_hourShadowSprite = v68;

  v133 = (void *)v60;
  v70 = +[NTKParameciumSprite spriteWithImage:v60];
  minuteSprite = self->_minuteSprite;
  self->_minuteSprite = v70;

  v132 = (void *)v61;
  v72 = +[NTKParameciumSprite spriteWithImage:v61];
  minuteInlaySprite = self->_minuteInlaySprite;
  self->_minuteInlaySprite = v72;

  v131 = (void *)v62;
  v74 = +[NTKParameciumSprite spriteWithImage:v62];
  minuteShadowSprite = self->_minuteShadowSprite;
  self->_minuteShadowSprite = v74;

  v76 = +[NTKParameciumSprite spriteWithImage:v128];
  secondSprite = self->_secondSprite;
  self->_secondSprite = v76;

  v78 = +[NTKParameciumSprite spriteWithImage:v63];
  secondShadowSprite = self->_secondShadowSprite;
  self->_secondShadowSprite = v78;

  double v80 = sub_57E8(self->_device) * 0.5 + -17.75;
  uint64_t v81 = +[NTKParameciumCompositeQuad renderNumbersWithColors:size:weight:inBounds:baselineRadius:](NTKParameciumCompositeQuad, "renderNumbersWithColors:size:weight:inBounds:baselineRadius:", self->_numberColors, 50.0, 10.0, 0.0, 0.0, COERCE_FLOAT(*(void *)self->_targetSize), COERCE_FLOAT(HIDWORD(*(void *)self->_targetSize)), v80);
  uint64_t v82 = +[NTKParameciumCompositeQuad renderNumbersWithColors:size:weight:inBounds:baselineRadius:](NTKParameciumCompositeQuad, "renderNumbersWithColors:size:weight:inBounds:baselineRadius:", self->_tritiumNumberColors, 50.0, 10.0, 0.0, 0.0, COERCE_FLOAT(*(void *)self->_targetSize), COERCE_FLOAT(HIDWORD(*(void *)self->_targetSize)), v80);
  v130 = (void *)v81;
  v83 = +[NTKParameciumSprite spriteWithImage:v81 format:70];
  backgroundWhiteNumbersSprite = self->_backgroundWhiteNumbersSprite;
  self->_backgroundWhiteNumbersSprite = v83;

  v129 = (void *)v82;
  v85 = +[NTKParameciumSprite spriteWithImage:v82 format:70];
  backgroundBlackNumbersSprite = self->_backgroundBlackNumbersSprite;
  self->_backgroundBlackNumbersSprite = v85;

  -[NTKParameciumCompositeQuad _generateNoiseTextureInRect:device:](self, "_generateNoiseTextureInRect:device:", self->_mtlDevice, 0.0, 0.0, 15.0, 15.0);
  v87 = (NTKParameciumSprite *)objc_claimAutoreleasedReturnValue();
  noiseSprite = self->_noiseSprite;
  self->_noiseSprite = v87;

  -[NTKParameciumCompositeQuad confettiOriginsBuffer:capsuleSize:](self, "confettiOriginsBuffer:capsuleSize:", self->_mtlDevice, 148.0, 46.0);
  v89 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  confettiOriginsBuffer = self->_confettiOriginsBuffer;
  self->_confettiOriginsBuffer = v89;

  -[NTKParameciumCompositeQuad _confettiHiddenBehindTicksBuffer:capsuleSize:](self, "_confettiHiddenBehindTicksBuffer:capsuleSize:", self->_mtlDevice, 148.0, 46.0);
  v91 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
  confettiHiddenBuffer = self->_confettiHiddenBuffer;
  self->_confettiHiddenBuffer = v91;

  v93 = [v155 metalLayer];
  id v94 = [v93 pixelFormat];
  [v128 size];
  double v96 = v95;
  [v128 scale];
  unint64_t v98 = (unint64_t)(v96 * v97);
  [v128 size];
  double v100 = v99;
  [v128 scale];
  v102 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v94 width:v98 height:(unint64_t)(v100 * v101) mipmapped:0];

  [v102 setUsage:7];
  [v102 setStorageMode:2];
  v103 = +[CLKUIMetalResourcePool texturePoolWithDescriptor:v102 expectedCountPerFrame:1];
  secondHandBlurTexturePool = self->_secondHandBlurTexturePool;
  self->_secondHandBlurTexturePool = v103;

  v105 = +[CLKUIMetalResourcePool bufferPoolWithLength:6720 andOptions:32 expectedCountPerFrame:1];
  confettiDefinitionsPool = self->_confettiDefinitionsPool;
  self->_confettiDefinitionsPool = v105;

  [(CLKDevice *)self->_device screenBounds];
  double v108 = v107;
  [(CLKDevice *)self->_device screenScale];
  unint64_t v110 = (unint64_t)(v108 * v109);
  [(CLKDevice *)self->_device screenBounds];
  double v112 = v111;
  [(CLKDevice *)self->_device screenScale];
  v114 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:v110 height:(unint64_t)(v112 * v113) mipmapped:0];
  [v114 setUsage:7];
  [v114 setStorageMode:2];
  v115 = objc_opt_new();
  v116 = objc_opt_new();
  int v117 = 3;
  do
  {
    id v118 = [(MTLDevice *)*p_mtlDevice newBufferWithLength:80 options:0];
    [v115 addObject:v118];

    id v119 = [(MTLDevice *)*p_mtlDevice newBufferWithLength:40 options:0];
    [v116 addObject:v119];

    --v117;
  }
  while (v117);
  objc_storeStrong((id *)&self->_touchLocationBuffers, v115);
  objc_storeStrong((id *)&self->_touchTimeBuffers, v116);
  id v120 = [v154 newBufferWithLength:1176 options:0];
  uint64_t v121 = 0;
  v122 = &xmmword_BD10;
  do
  {
    long long v123 = *v122++;
    id v124 = v120;
    *(_WORD *)((char *)[v124 contents] + v121) = v123;
    id v125 = v124;
    *(_WORD *)((char *)[v125 contents] + v121 + 2) = WORD2(v123);
    id v126 = v125;
    *(_WORD *)((char *)[v126 contents] + v121 + 4) = WORD4(v123);
    v121 += 6;
  }
  while (v121 != 1176);
  confettiIndexBuffer = self->_confettiIndexBuffer;
  self->_confettiIndexBuffer = (MTLBuffer *)v126;
}

- (id)_generateNoiseTextureInRect:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  double v9 = objc_opt_new();
  [v9 setPixelFormat:70];
  [v9 setWidth:128];
  [v9 setHeight:128];
  [v9 setMipmapLevelCount:1];
  [v9 setTextureType:2];
  [v9 setUsage:1];
  [v9 setStorageMode:2];
  id v10 = [v8 newTextureWithDescriptor:v9];
  id v11 = [v8 newBufferWithLength:0x10000 options:0];

  id v12 = v11;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  id v26 = sub_5AF0;
  v27 = &unk_105C0;
  CGFloat v28 = x;
  CGFloat v29 = y;
  double v30 = width;
  double v31 = height;
  int v33 = (int)width;
  int v34 = (int)height;
  id v32 = [v12 contents];
  NTKHighPriorityApply();
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  objc_super v20 = sub_5C78;
  v21 = &unk_105E8;
  id v22 = v12;
  id v23 = v10;
  id v13 = v10;
  id v14 = v12;
  id v15 = objc_retainBlock(&v18);
  id v16 = +[NTKParameciumSprite spriteWithBlitBlock:](NTKParameciumSprite, "spriteWithBlitBlock:", v15, v18, v19, v20, v21);

  return v16;
}

+ (id)confettiFontDescriptor
{
  if (qword_16548 != -1) {
    dispatch_once(&qword_16548, &stru_10608);
  }
  v2 = (void *)qword_16540;

  return v2;
}

+ (id)renderNumbersWithColors:(id)a3 size:(double)a4 weight:(double)a5 inBounds:(CGRect)a6 baselineRadius:(double)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  id v10 = a3;
  id v11 = +[NTKParameciumCompositeQuad confettiFontDescriptor];
  v38 = +[UIFont fontWithDescriptor:v11 size:a4];

  unsigned int v12 = 16 * width;
  id v13 = malloc_type_malloc(v12 * height, 0xBB5713D1uLL);
  bzero(v13, v12 * height);
  id v14 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  size_t v35 = width;
  size_t v36 = height;
  id v15 = CGBitmapContextCreate(v13, v35, v36, 0x20uLL, v12, v14, 0x2101u);
  CGColorSpaceRelease(v14);
  CGContextScaleCTM(v15, 2.0, -2.0);
  double v16 = width * 0.25;
  double v17 = height * -0.25;
  unsigned int v18 = -3;
  for (unint64_t i = 1; i != 13; ++i)
  {
    v39[1] = NSForegroundColorAttributeName;
    v40[0] = v38;
    v39[0] = NSFontAttributeName;
    objc_super v20 = objc_msgSend(v10, "objectAtIndexedSubscript:", i % (unint64_t)objc_msgSend(v10, "count"));
    v40[1] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

    id v22 = objc_alloc((Class)NSAttributedString);
    id v23 = +[NSString localizedStringWithFormat:@"%d", i];
    CFAttributedStringRef v24 = (const __CFAttributedString *)[v22 initWithString:v23 attributes:v21];

    CGContextSaveGState(v15);
    CGContextSetTextPosition(v15, 0.0, 0.0);
    uint64_t v25 = CTLineCreateWithAttributedString(v24);
    double TypographicBounds = CTLineGetTypographicBounds(v25, 0, 0, 0);
    CGRect ImageBounds = CTLineGetImageBounds(v25, v15);
    double v27 = ImageBounds.size.height;
    CGContextTranslateCTM(v15, v16, v17);
    CGContextRotateCTM(v15, (double)(int)(v18 + 1) * 0.523598776);
    CGContextTranslateCTM(v15, 37.0 - v27 + a7, 0.0);
    CGContextRotateCTM(v15, 1.57079633);
    CGContextScaleCTM(v15, 1.0, -1.0);
    if (v18 <= 4)
    {
      CGContextScaleCTM(v15, -1.0, -1.0);
      CGContextTranslateCTM(v15, 0.0, 0.5 - v27);
    }
    CGContextTranslateCTM(v15, TypographicBounds * -0.5, 0.0);
    CTLineDraw(v25, v15);
    CFRelease(v25);
    CGContextRestoreGState(v15);

    ++v18;
  }
  size_t v28 = (4 * v35);
  CGFloat v29 = malloc_type_malloc((v28 * v36), 0x1F01AC6CuLL);
  double v30 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  double v31 = CGBitmapContextCreate(v29, v35, v36, 8uLL, v28, v30, 1u);
  CGColorSpaceRelease(v30);
  NTKHighPriorityApply();
  CGContextRelease(v15);
  free(v13);
  Image = CGBitmapContextCreateImage(v31);
  CGContextRelease(v31);
  free(v29);
  int v33 = +[UIImage imageWithCGImage:Image];
  CGImageRelease(Image);

  return v33;
}

- (void)_initializeColors
{
  double v3 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  obuint64_t j = (id)objc_opt_new();
  for (uint64_t i = 0; i != 192; i += 16)
  {
    id v5 = +[UIColor colorWithDisplayP3Red:*(float *)((char *)&unk_C950 + i) green:*(float *)((char *)&unk_C950 + i + 4) blue:*(float *)((char *)&unk_C950 + i + 8) alpha:*(float *)((char *)&unk_C950 + i + 12)];
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v3, kCGRenderingIntentDefault, (CGColorRef)[v5 CGColor], 0);
    Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
    *(float32x2_t *)&long long v8 = vcvt_f32_f64(*Components);
    *(float *)&unsigned int v9 = Components[1].f64[0];
    *((void *)&v8 + 1) = __PAIR64__(1.0, v9);
    *(_OWORD *)&self->_confettiColors[i] = v8;
    [obj addObject:v5];
    CGColorRelease(CopyByMatchingToColorSpace);
  }
  objc_storeStrong((id *)&self->_numberColors, obj);
  id v10 = (NSArray *)objc_opt_new();
  for (uint64_t j = 0; j != 192; j += 16)
  {
    id v12 = +[UIColor colorWithDisplayP3Red:*(float *)((char *)&unk_CA10 + j) green:*(float *)((char *)&unk_CA10 + j + 4) blue:*(float *)((char *)&unk_CA10 + j + 8) alpha:*(float *)((char *)&unk_CA10 + j + 12)];
    id v13 = CGColorCreateCopyByMatchingToColorSpace(v3, kCGRenderingIntentDefault, (CGColorRef)[v12 CGColor], 0);
    id v14 = (float64x2_t *)CGColorGetComponents(v13);
    *(float32x2_t *)&long long v15 = vcvt_f32_f64(*v14);
    *(float *)&unsigned int v16 = v14[1].f64[0];
    *((void *)&v15 + 1) = __PAIR64__(1.0, v16);
    *(_OWORD *)&self->_tritiumColors[j] = v15;
    [(NSArray *)v10 addObject:v12];
    CGColorRelease(v13);
  }
  tritiumNumberColors = self->_tritiumNumberColors;
  self->_tritiumNumberColors = v10;

  CGColorSpaceRelease(v3);
}

- (void)updateConfettiColors:(id)a3
{
  double v4 = (float32x4_t *)[a3 contents];
  uint64_t v5 = 0;
  double v6 = 1.0 - self->_backgroundOn;
  *(float *)&double v6 = fmin(self->_tritiumProgress, v6);
  float32x4_t v7 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v6, 0);
  float v8 = 1.0 - *(float *)&v6;
  unsigned int v9 = v4 + 1;
  do
  {
    uint64_t v10 = (12 * (v5 / 0xCu) - v5 + 11);
    *unsigned int v9 = vmlaq_f32(vmulq_n_f32(*(float32x4_t *)&self->_tritiumColors[16 * v10], v8), *(float32x4_t *)&self->_confettiColors[16 * v10], v7);
    v9 += 7;
    ++v5;
  }
  while (v5 != 60);
}

- (id)confettiOriginsBuffer:(id)a3 capsuleSize:(CGSize)a4
{
  CGFloat width = a4.width;
  CGFloat height = a4.height;
  id v28 = [(MTLDevice *)self->_mtlDevice newBufferWithLength:6720 options:0];
  uint64_t v5 = (char *)[v28 contents];
  v6.f64[0] = width;
  v6.f64[1] = height;
  float32x2_t v29 = vcvt_f32_f64(v6);
  uint64_t v30 = *(void *)self->_targetSize;
  float32x4_t v7 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  double v8 = sub_57E8(self->_device);
  uint64_t v9 = 0;
  *(float *)&double v8 = v10;
  float32x2_t v11 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v8, 0);
  id v12 = v5 + 32;
  do
  {
    id v13 = (float *)&self->_confettiColors[16 * (11 - v9 % 0xCu)];
    id v14 = +[UIColor colorWithDisplayP3Red:*v13 green:v13[1] blue:v13[2] alpha:v13[3]];
    long long v15 = (CGColor *)[v14 CGColor];

    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v7, kCGRenderingIntentDefault, v15, 0);
    Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
    *(float32x2_t *)&long long v18 = vcvt_f32_f64(*Components);
    *(float *)&unsigned int v19 = Components[1].f64[0];
    *((void *)&v18 + 1) = __PAIR64__(1.0, v19);
    long long v33 = v18;
    CGColorRelease(CopyByMatchingToColorSpace);
    float v20 = ((float)((float)(v9 % 0xCu) / 12.0) + (float)((float)(v9 % 0xCu) / 12.0))
        * 3.14159265;
    float v21 = (float)((float)(v9 / 0xCu) / 5.0) * 0.523598776;
    float32x2_t v22 = vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000);
    float v23 = v21 + v20;
    __float2 v24 = __sincosf_stret(v21 + v20);
    float32x2_t v25 = vmla_f32(v22, v11, vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v24.__sinval), LODWORD(v24.__cosval)), (float)(arc4random_uniform(0x78u) + 160)));
    float v26 = fmod(v23 + 1.57079633, 6.28318531);
    *((void *)v12 - 4) = v30;
    *((float32x2_t *)v12 - 3) = v29;
    *((_OWORD *)v12 - 1) = v33;
    *(float32x2_t *)id v12 = v25;
    *((void *)v12 + 1) = 0x3F0000003F000000;
    *((void *)v12 + 2) = 0;
    *((float *)v12 + 6) = v26;
    *(_OWORD *)(v12 + 28) = 0u;
    *(_OWORD *)(v12 + 44) = 0u;
    *(_OWORD *)(v12 + 60) = 0u;
    *((_DWORD *)v12 + 19) = 0;
    ++v9;
    v12 += 112;
  }
  while (v9 != 60);
  CGColorSpaceRelease(v7);

  return v28;
}

- (id)_confettiHiddenBehindTicksBuffer:(id)a3 capsuleSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v29 = [(MTLDevice *)self->_mtlDevice newBufferWithLength:6720 options:0];
  uint64_t v5 = (char *)[v29 contents];
  uint64_t v6 = *(void *)self->_targetSize;
  v7.f64[0] = width;
  v7.f64[1] = height;
  float32x2_t v8 = vcvt_f32_f64(v7);
  uint64_t v9 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  double v10 = sub_57E8(self->_device);
  uint64_t v11 = 0;
  *(float *)&double v10 = v10;
  float32x2_t v12 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v10, 0);
  id v13 = v5 + 32;
  do
  {
    id v14 = (float *)&self->_confettiColors[16 * (11 - v11 % 0xCu)];
    id v15 = +[UIColor colorWithDisplayP3Red:*v14 green:v14[1] blue:v14[2] alpha:v14[3]];
    unsigned int v16 = (CGColor *)[v15 CGColor];

    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v9, kCGRenderingIntentDefault, v16, 0);
    Components = (float64x2_t *)CGColorGetComponents(CopyByMatchingToColorSpace);
    *(float32x2_t *)&long long v19 = vcvt_f32_f64(*Components);
    *(float *)&unsigned int v20 = Components[1].f64[0];
    *((void *)&v19 + 1) = __PAIR64__(1.0, v20);
    long long v31 = v19;
    CGColorRelease(CopyByMatchingToColorSpace);
    unsigned int v21 = (((v11 % 0xCu) | 0x10)
                          - 12 * ((unsigned __int16)(22 * ((v11 % 0xCu) | 0x10)) >> 8));
    float v22 = ((float)((float)v21 / 12.0) + (float)((float)v21 / 12.0)) * 3.14159265;
    float32x2_t v23 = vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000);
    float v24 = v22 + 0.0;
    __float2 v25 = __sincosf_stret(v22 + 0.0);
    float v26 = fmod(v24, 6.28318531);
    *((void *)v13 - 4) = v6;
    *((float32x2_t *)v13 - 3) = v8;
    *((_OWORD *)v13 - 1) = v31;
    *(float32x2_t *)id v13 = vmla_f32(v23, v12, (float32x2_t)__PAIR64__(LODWORD(v25.__sinval), LODWORD(v25.__cosval)));
    *((void *)v13 + 1) = 0x3F0000003F000000;
    *((void *)v13 + 2) = 0;
    *((float *)v13 + 6) = v26;
    *(_OWORD *)(v13 + 28) = 0u;
    *(_OWORD *)(v13 + 44) = 0u;
    *(_OWORD *)(v13 + 60) = 0u;
    *((_DWORD *)v13 + 19) = 0;
    ++v11;
    v13 += 112;
  }
  while (v11 != 60);
  CGColorSpaceRelease(v9);

  return v29;
}

- (void)handleTouchAt:(CGPoint)a3 at:(double)a4
{
  *(float *)&a3.CGFloat x = a3.x;
  *(float *)&a3.CGFloat y = a3.y;
  [(NTKParameciumTouchHandler *)self->_touchHandler startWaveAtX:a3.x y:a3.y atTime:a4 + 0.25];
}

- (double)createMatrixForTextureWithSize:(float32x2_t)a1 translation:(double)a2 scale:(int32x2_t)a3 rotate:(float)a4 offset:(__n128)a5
{
  __asm { FMOV            V0.4S, #1.0 }
  int32x4_t v29 = _Q0;
  *(double *)_Q0.i64 = a2;
  float32x4_t v27 = (float32x4_t)_Q0;
  __float2 v13 = __sincosf_stret(a4);
  *(float *)v12.i32 = v13.__cosval;
  *(float *)v11.i32 = v13.__sinval;
  uint64_t v14 = 0;
  v15.i32[3] = 0;
  v15.i64[0] = LODWORD(v13.__cosval);
  *(float *)&v15.i32[2] = -v13.__sinval;
  int32x4_t v31 = vzip1q_s32(v15, v11);
  int32x4_t v32 = vzip2q_s32(v15, vdupq_lane_s32(v12, 0));
  int32x4_t v33 = (int32x4_t)xmmword_BCD0;
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  float32x4_t v36 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v14) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_BCF0, COERCE_FLOAT(*(_OWORD *)((char *)&v31 + v14))), (float32x4_t)xmmword_BCE0, *(float32x2_t *)&v31.i8[v14], 1), v27, *(float32x4_t *)((char *)&v31 + v14), 2);
    v14 += 16;
  }
  while (v14 != 48);
  uint64_t v16 = 0;
  float32x4_t v17 = v34;
  float32x4_t v18 = v35;
  float32x4_t v19 = v36;
  int32x4_t v31 = (int32x4_t)a3.u32[0];
  int32x4_t v32 = vzip2q_s32((int32x4_t)a3.u32[0], vdupq_lane_s32(a3, 1));
  int32x4_t v33 = vzip1q_s32(vzip2q_s32((int32x4_t)a3.u32[0], v29), (int32x4_t)0);
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  float32x4_t v36 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(_OWORD *)((char *)&v31 + v16))), v18, *(float32x2_t *)&v31.i8[v16], 1), v19, *(float32x4_t *)((char *)&v31 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  uint64_t v20 = 0;
  float32x4_t v21 = v34;
  float32x4_t v22 = v35;
  v23.i64[1] = a5.n128_i64[1];
  v24.i64[0] = 1065353216;
  v24.u64[1] = (unint64_t)vmla_f32((float32x2_t)a5.n128_u64[0], (float32x2_t)0xBF000000BF000000, a1);
  float32x4_t v25 = v36;
  *(int32x2_t *)v23.i8 = vdup_lane_s32((int32x2_t)v24.u64[1], 1);
  int32x4_t v31 = (int32x4_t)COERCE_UNSIGNED_INT(1.0);
  int32x4_t v32 = (int32x4_t)xmmword_BCE0;
  int32x4_t v33 = vzip1q_s32(vzip2q_s32(v24, v29), v23);
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  float32x4_t v36 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v20) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)((char *)&v31 + v20))), v22, *(float32x2_t *)&v31.i8[v20], 1), v25, *(float32x4_t *)((char *)&v31 + v20), 2);
    v20 += 16;
  }
  while (v20 != 48);
  return *(double *)v34.i64;
}

- (BOOL)prepareForTime:(double)a3
{
  self->_currentTime = self->_currentTime + self->_tritiumProgress * 0.0166666667;
  return 1;
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  id v4 = a3;
  [(NTKParameciumSprite *)self->_gradientSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_shadowGradientSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_hourSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_hourInlaySprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_hourShadowSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_secondSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_secondShadowSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_minuteSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_minuteInlaySprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_minuteShadowSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_noiseSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_backgroundWhiteNumbersSprite blitIfNecessaryWithCommandBuffer:v4];
  [(NTKParameciumSprite *)self->_backgroundBlackNumbersSprite blitIfNecessaryWithCommandBuffer:v4];
  float v5 = self->_confettiRotation + -1.57079633 + -0.261799388;
  *(float *)float32x4_t v27 = v5;
  long double v6 = fmod(self->_currentTime, 86400.0);
  showsConfettuint64_t i = self->_showsConfetti;
  *(float *)&long double v6 = v6;
  float v8 = ceil(showsConfetti);
  v27[1] = LODWORD(v6);
  *(float *)&v27[2] = v8;
  *(float *)&long double v6 = 1.0 - showsConfetti;
  *(float *)&showsConfettuint64_t i = self->_confettiEntropy * self->_tritiumProgress;
  v27[3] = LODWORD(v6);
  v27[4] = LODWORD(showsConfetti);
  uint64_t v9 = [(CLKUIMetalResourcePool *)self->_confettiDefinitionsPool dequeueReusableResourceForUseOnCommandBuffer:v4];
  currentFrameConfettiPositions = self->_currentFrameConfettiPositions;
  self->_currentFrameConfettiPositions = v9;

  [(NTKParameciumCompositeQuad *)self updateConfettiColors:self->_confettiHiddenBuffer];
  [(NTKParameciumCompositeQuad *)self updateConfettiColors:self->_confettiOriginsBuffer];
  [(NTKParameciumCompositeQuad *)self updateConfettiColors:self->_currentFrameConfettiPositions];
  if (self->_showsConfetti > 0.0)
  {
    int32x4_t v11 = [(NSArray *)self->_touchTimeBuffers objectAtIndex:self->_touchBufferIndex];
    int32x2_t v12 = [(NSArray *)self->_touchLocationBuffers objectAtIndex:self->_touchBufferIndex];
    self->_touchBufferIndeCGFloat x = (self->_touchBufferIndex + 1) % 3;
    touchHandler = self->_touchHandler;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_717C;
    v24[3] = &unk_10650;
    id v25 = v11;
    id v26 = v12;
    id v14 = v12;
    id v15 = v11;
    [(NTKParameciumTouchHandler *)touchHandler iterateTouchesWithBlock:v24];
    uint64_t v16 = [v4 computeCommandEncoder];
    [v16 setComputePipelineState:self->_computeConfettiPipelineState];
    [v16 setBuffer:self->_confettiOriginsBuffer offset:0 atIndex:0];
    float32x4_t v17 = [(NTKParameciumSprite *)self->_noiseSprite texture];
    [v16 setTexture:v17 atIndex:0];

    [v16 setBuffer:self->_currentFrameConfettiPositions offset:0 atIndex:1];
    [v16 setBytes:v27 length:20 atIndex:2];
    [v16 setBuffer:self->_confettiHiddenBuffer offset:0 atIndex:3];
    [v16 setBuffer:v14 offset:0 atIndex:4];
    [v16 setBuffer:v15 offset:0 atIndex:5];
    unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_computeConfettiPipelineState threadExecutionWidth];
    unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_computeConfettiPipelineState maxTotalThreadsPerThreadgroup];
    uint64_t v23 = 1;
    unint64_t v20 = v19 / v18 * v18;
    int64x2_t v21 = vdupq_n_s64(1uLL);
    long long v22 = xmmword_BD00;
    [v16 dispatchThreads:&v22 threadsPerThreadgroup:&v20];
    [v16 endEncoding];
  }
}

- (void)renderWithCommandBuffer:(id)a3 passDescriptor:(id)a4
{
  id v148 = a3;
  id v149 = a4;
  long double v6 = objc_msgSend(v148, "renderCommandEncoderWithDescriptor:");
  float64_t v151 = [(NTKParameciumSprite *)self->_gradientSprite texture];
  float64_t v150 = [(NTKParameciumSprite *)self->_shadowGradientSprite texture];
  if (self->_showsConfetti > 0.0)
  {
    [v6 setRenderPipelineState:self->_capsulePipelineState];
    [v6 setVertexBuffer:self->_currentFrameConfettiPositions offset:0 atIndex:0];
    [v6 drawIndexedPrimitives:3 indexCount:588 indexType:0 indexBuffer:self->_confettiIndexBuffer indexBufferOffset:0 instanceCount:60];
  }
  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  *(void *)&long long v160 = *(void *)self->_targetSize;
  LODWORD(v165) = 1065353216;
  if (self->_showsNumbers > 0.0)
  {
    float64x2_t v7 = [(NTKParameciumSprite *)self->_backgroundWhiteNumbersSprite texture];
    float v8 = [(NTKParameciumSprite *)self->_backgroundBlackNumbersSprite texture];
    float v9 = fmin(self->_tritiumProgress, 1.0 - self->_backgroundOn);
    [v6 setRenderPipelineState:self->_spriteMultiplyPipelineState];
    float v156 = (float)(unint64_t)[v7 width];
    id v10 = [v7 height];
    *(float *)&double v11 = v156;
    *((float *)&v11 + 1) = (float)(unint64_t)v10;
    *((double *)&v160 + 1) = v11;
    long long v161 = *(unint64_t *)&v11;
    __asm { FMOV            V2.2S, #1.0 }
    [(NTKParameciumCompositeQuad *)self createMatrixForTextureWithSize:v11 translation:COERCE_DOUBLE(vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000)) scale:_D2 rotate:0.0 offset:0.0];
    DWORD2(v162) = v17;
    DWORD2(v163) = v18;
    *(void *)&long long v162 = v19;
    *(void *)&long long v163 = v20;
    DWORD2(v164) = v21;
    *(void *)&long long v164 = v22;
    v166[0] = 0.0;
    [v6 setVertexBytes:v166 length:4 atIndex:1];
    float v23 = fmin(self->_showsNumbers + self->_showsNumbers, 1.0) * v9;
    *(float *)&long long v165 = v23;
    [v6 setVertexBytes:&v160 length:96 atIndex:0];
    [v6 setFragmentTexture:v7 atIndex:0];
    [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];
    float v24 = fmin(self->_showsNumbers + self->_showsNumbers, 1.0) * (float)(1.0 - v9);
    *(float *)&long long v165 = v24;
    [v6 setVertexBytes:&v160 length:96 atIndex:0];
    [v6 setFragmentTexture:v8 atIndex:0];
    [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
  if (self->_showsTicks > 0.0)
  {
    uint64_t v25 = *(void *)self->_targetSize;
    double v26 = sub_57E8(self->_device);
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    *(float *)&double v26 = v26 + v26;
    *(void *)&double v157 = LODWORD(v26);
    do
    {
      float tickShadows = self->_tickShadows;
      *(void *)&long long v31 = 0;
      DWORD2(v31) = 0;
      *((float *)&v31 + 3) = tickShadows;
      long long v152 = v31;
      double v32 = COERCE_DOUBLE(vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000));
      float v33 = (float)(int)v29 / 12.0 * 6.28318531 + 1.57079633;
      *(float *)&double v27 = v33;
      [(NTKParameciumCompositeQuad *)self createMatrixForTextureWithSize:1.03079232e11 translation:v32 scale:0.0000305175853 rotate:v27 offset:v157];
      float32x4_t v34 = &v166[v28];
      *(void *)float32x4_t v34 = v25;
      *((void *)v34 + 1) = 0x4238000043140000;
      *((_OWORD *)v34 + 1) = v152;
      *((double *)v34 + 4) = v32;
      *((void *)v34 + 5) = 0x3F0000003F000000;
      HIDWORD(v27) = HIDWORD(v157);
      *((double *)v34 + 6) = v157;
      v34[14] = v33;
      v34[15] = 0.0;
      v166[v28 + 18] = v35;
      *((void *)v34 + 8) = v36;
      v166[v28 + 22] = v37;
      *((void *)v34 + 10) = v38;
      v166[v28 + 26] = v39;
      ++v29;
      v28 += 28;
      *((void *)v34 + 12) = v40;
    }
    while (v29 != 12);
    [v6 setRenderPipelineState:self->_capsulePipelineState];
    double v41 = 1.0 - self->_backgroundOn;
    *(float *)&double v41 = fmin(self->_tritiumProgress, v41);
    float32x4_t v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v41, 0);
    float v43 = 1.0 - *(float *)&v41;
    float v44 = fmin(self->_showsTicks + self->_showsTicks, 1.0);
    uint64_t v45 = 0xC00000000;
    uint64_t v46 = 4;
    do
    {
      uint64_t v47 = v45 >> 32;
      if (v46 == 4) {
        uint64_t v47 = 0;
      }
      float32x4_t v48 = vmlaq_f32(vmulq_n_f32(*(float32x4_t *)&self->_tritiumColors[16 * v47], v43), *(float32x4_t *)&self->_confettiColors[16 * v47], v42);
      v48.f32[3] = v44;
      *(float32x4_t *)&v166[v46] = v48;
      v46 += 28;
      v45 -= 0x100000000;
    }
    while (v45);
    [v6 setVertexBytes:v166 length:1344 atIndex:0];
    [v6 drawIndexedPrimitives:3 indexCount:588 indexType:0 indexBuffer:self->_confettiIndexBuffer indexBufferOffset:0 instanceCount:12];
  }
  LODWORD(v165) = 1065353216;
  double v49 = [(NTKParameciumSprite *)self->_minuteShadowSprite texture];
  float v50 = -self->_confettiRotation - self->_minuteAngle;
  v166[0] = v50;
  [v6 setRenderPipelineState:self->_tintedSpritePipelineState];
  float v158 = (float)(unint64_t)[v49 width];
  id v51 = [v49 height];
  v52.f32[0] = v158;
  v52.f32[1] = (float)(unint64_t)v51;
  float32x2_t v159 = v52;
  *((float32x2_t *)&v160 + 1) = v52;
  long long v161 = (unint64_t)v52;
  float32x2_t v53 = vsub_f32((float32x2_t)0x3F0000003F000000, *(float32x2_t *)self->_minuteAnchor);
  [(CLKUIAnalogHandConfiguration *)self->_minuteConfiguration radialShadowRadius];
  *(float *)&double v54 = v54;
  double minuteAngle = self->_minuteAngle;
  *(float *)&double minuteAngle = minuteAngle;
  double v56 = COERCE_DOUBLE(vneg_f32(vmla_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v54, 0), v53, v159)));
  LODWORD(v56) = 0;
  __asm { FMOV            V8.2S, #1.0 }
  [(NTKParameciumCompositeQuad *)self createMatrixForTextureWithSize:*((double *)&v160 + 1) translation:COERCE_DOUBLE(vadd_f32(vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000), (float32x2_t)0xC0A0000000000000)) scale:_D8 rotate:minuteAngle offset:v56];
  DWORD2(v162) = v58;
  DWORD2(v163) = v59;
  *(void *)&long long v162 = v60;
  *(void *)&long long v163 = v61;
  DWORD2(v164) = v62;
  *(void *)&long long v164 = v63;
  [v6 setVertexBytes:v166 length:4 atIndex:1];
  [v6 setVertexBytes:&v160 length:96 atIndex:0];
  [v6 setFragmentTexture:v49 atIndex:0];
  [v6 setFragmentTexture:v150 atIndex:1];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];

  v64 = [(NTKParameciumSprite *)self->_minuteSprite texture];
  v65 = [(NTKParameciumSprite *)self->_minuteInlaySprite texture];
  float v66 = -self->_confettiRotation - self->_minuteAngle;
  v166[0] = v66;
  [v6 setRenderPipelineState:self->_handPipelineState];
  float v146 = (float)(unint64_t)[v64 width];
  id v67 = [v64 height];
  *(float *)&unint64_t v68 = v146;
  *((float *)&v68 + 1) = (float)(unint64_t)v67;
  *((void *)&v160 + 1) = v68;
  long long v161 = v68;
  -[NTKParameciumCompositeQuad createMatrixForTextureWithSize:translation:scale:rotate:offset:](self, "createMatrixForTextureWithSize:translation:scale:rotate:offset:");
  DWORD2(v162) = v69;
  DWORD2(v163) = v70;
  *(void *)&long long v162 = v71;
  *(void *)&long long v163 = v72;
  DWORD2(v164) = v73;
  *(void *)&long long v164 = v74;
  [v6 setVertexBytes:v166 length:4 atIndex:1];
  [v6 setVertexBytes:&v160 length:96 atIndex:0];
  [v6 setFragmentTexture:v64 atIndex:0];
  [v6 setFragmentTexture:v151 atIndex:1];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v6 setRenderPipelineState:self->_inlayPipelineState];
  [v6 setFragmentTexture:v65 atIndex:0];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];

  float v75 = -self->_confettiRotation - self->_hourAngle;
  v166[0] = v75;
  v76 = [(NTKParameciumSprite *)self->_hourShadowSprite texture];
  [v6 setRenderPipelineState:self->_tintedSpritePipelineState];
  float v153 = (float)(unint64_t)[v76 width];
  id v77 = [v76 height];
  v78.f32[0] = v153;
  v78.f32[1] = (float)(unint64_t)v77;
  float32x2_t v154 = v78;
  *((float32x2_t *)&v160 + 1) = v78;
  long long v161 = (unint64_t)v78;
  float32x2_t v79 = vsub_f32((float32x2_t)0x3F0000003F000000, *(float32x2_t *)self->_hourAnchor);
  [(CLKUIAnalogHandConfiguration *)self->_hourConfiguration radialShadowRadius];
  *(float *)&double v80 = v80;
  double hourAngle = self->_hourAngle;
  *(float *)&double hourAngle = hourAngle;
  double v82 = COERCE_DOUBLE(vneg_f32(vmla_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v80, 0), v79, v154)));
  LODWORD(v82) = 0;
  [(NTKParameciumCompositeQuad *)self createMatrixForTextureWithSize:*((double *)&v160 + 1) translation:COERCE_DOUBLE(vadd_f32(vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000), (float32x2_t)0xC0A0000000000000)) scale:_D8 rotate:hourAngle offset:v82];
  DWORD2(v162) = v83;
  DWORD2(v163) = v84;
  *(void *)&long long v162 = v85;
  *(void *)&long long v163 = v86;
  DWORD2(v164) = v87;
  *(void *)&long long v164 = v88;
  [v6 setVertexBytes:v166 length:4 atIndex:1];
  [v6 setVertexBytes:&v160 length:96 atIndex:0];
  [v6 setFragmentTexture:v76 atIndex:0];
  [v6 setFragmentTexture:v150 atIndex:1];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];

  float v89 = -self->_confettiRotation - self->_hourAngle;
  v166[0] = v89;
  v90 = [(NTKParameciumSprite *)self->_hourSprite texture];
  v91 = [(NTKParameciumSprite *)self->_hourInlaySprite texture];
  [v6 setRenderPipelineState:self->_handPipelineState];
  v154.f32[0] = (float)(unint64_t)[v90 width];
  id v92 = [v90 height];
  LODWORD(v93) = v154.i32[0];
  *((float *)&v93 + 1) = (float)(unint64_t)v92;
  *((void *)&v160 + 1) = v93;
  long long v161 = v93;
  -[NTKParameciumCompositeQuad createMatrixForTextureWithSize:translation:scale:rotate:offset:](self, "createMatrixForTextureWithSize:translation:scale:rotate:offset:");
  DWORD2(v162) = v94;
  DWORD2(v163) = v95;
  *(void *)&long long v162 = v96;
  *(void *)&long long v163 = v97;
  DWORD2(v164) = v98;
  *(void *)&long long v164 = v99;
  [v6 setVertexBytes:v166 length:4 atIndex:1];
  [v6 setVertexBytes:&v160 length:96 atIndex:0];
  [v6 setFragmentTexture:v90 atIndex:0];
  [v6 setFragmentTexture:v151 atIndex:1];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v6 setRenderPipelineState:self->_inlayPipelineState];
  [v6 setFragmentTexture:v91 atIndex:0];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];

  float confettiRotation = self->_confettiRotation;
  v166[0] = -confettiRotation;
  double v101 = [(NTKParameciumSprite *)self->_secondShadowSprite texture];
  [v6 setRenderPipelineState:self->_spritePipelineState];
  v154.f32[0] = (float)(unint64_t)[v101 width];
  id v102 = [v101 height];
  v103.i32[0] = v154.i32[0];
  v103.f32[1] = (float)(unint64_t)v102;
  float32x2_t v155 = v103;
  *((float32x2_t *)&v160 + 1) = v103;
  long long v161 = (unint64_t)v103;
  float32x2_t v104 = vsub_f32((float32x2_t)0x3F0000003F000000, *(float32x2_t *)self->_secondAnchor);
  [(CLKUIAnalogHandConfiguration *)self->_secondConfiguration radialShadowRadius];
  *(float *)&double v105 = v105;
  double secondAngle = self->_secondAngle;
  *(float *)&double secondAngle = secondAngle;
  double v107 = COERCE_DOUBLE(vneg_f32(vmla_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v105, 0), v104, v155)));
  LODWORD(v107) = 0;
  [(NTKParameciumCompositeQuad *)self createMatrixForTextureWithSize:*((double *)&v160 + 1) translation:COERCE_DOUBLE(vadd_f32(vmul_f32(*(float32x2_t *)self->_targetSize, (float32x2_t)0x3F0000003F000000), (float32x2_t)0xC0A0000000000000)) scale:_D8 rotate:secondAngle offset:v107];
  DWORD2(v162) = v108;
  DWORD2(v163) = v109;
  *(void *)&long long v162 = v110;
  *(void *)&long long v163 = v111;
  DWORD2(v164) = v112;
  *(void *)&long long v164 = v113;
  [v6 setVertexBytes:v166 length:4 atIndex:1];
  [v6 setVertexBytes:&v160 length:96 atIndex:0];
  [v6 setFragmentTexture:v101 atIndex:0];
  [v6 drawPrimitives:4 vertexStart:0 vertexCount:4];

  [v6 endEncoding];
  v114 = [(CLKUIMetalResourcePool *)self->_secondHandBlurTexturePool dequeueReusableResourceForUseOnCommandBuffer:v148];
  v115 = [(MTLRenderPassDescriptor *)self->_blurPassDescriptor colorAttachments];
  v116 = [v115 objectAtIndexedSubscript:0];
  [v116 setTexture:v114];

  int v117 = [v148 renderCommandEncoderWithDescriptor:self->_blurPassDescriptor];
  id v118 = [(NTKParameciumSprite *)self->_secondSprite texture];
  [v117 setRenderPipelineState:self->_blurPipelineState];
  float v145 = (float)(unint64_t)[v114 width];
  id v119 = [v114 height];
  *(float *)&unint64_t v120 = v145;
  *((float *)&v120 + 1) = (float)(unint64_t)v119;
  *((void *)&v160 + 1) = v120;
  long long v161 = v120;
  -[NTKParameciumCompositeQuad createMatrixForTextureWithSize:translation:scale:rotate:offset:](self, "createMatrixForTextureWithSize:translation:scale:rotate:offset:");
  DWORD2(v162) = v121;
  DWORD2(v163) = v122;
  *(void *)&long long v162 = v123;
  *(void *)&long long v163 = v124;
  DWORD2(v164) = v125;
  *(void *)&long long v164 = v126;
  [v117 setVertexBytes:&v160 length:96 atIndex:0];
  v127 = [v149 colorAttachments];
  v128 = [v127 objectAtIndexedSubscript:0];
  v129 = [v128 texture];
  [v117 setFragmentTexture:v129 atIndex:0];

  [v117 setFragmentTexture:v118 atIndex:1];
  float v130 = fmin(self->_tritiumProgress, 1.0 - self->_backgroundOn);
  v166[0] = v130;
  [v117 setFragmentBytes:v166 length:4 atIndex:0];
  [v117 drawPrimitives:4 vertexStart:0 vertexCount:4];

  [v117 endEncoding];
  v131 = [v149 colorAttachments];
  v132 = [v131 objectAtIndexedSubscript:0];
  v133 = [v132 texture];
  v134 = [(MTLRenderPassDescriptor *)self->_compositePassDescriptor colorAttachments];
  v135 = [v134 objectAtIndexedSubscript:0];
  [v135 setTexture:v133];

  v136 = [v148 renderCommandEncoderWithDescriptor:self->_compositePassDescriptor];

  [v136 setRenderPipelineState:self->_spritePipelineState];
  float v147 = (float)(unint64_t)[v114 width];
  id v137 = [v114 height];
  *(float *)&unint64_t v138 = v147;
  *((float *)&v138 + 1) = (float)(unint64_t)v137;
  *((void *)&v160 + 1) = v138;
  long long v161 = v138;
  -[NTKParameciumCompositeQuad createMatrixForTextureWithSize:translation:scale:rotate:offset:](self, "createMatrixForTextureWithSize:translation:scale:rotate:offset:");
  DWORD2(v162) = v139;
  DWORD2(v163) = v140;
  DWORD2(v164) = v141;
  *(void *)&long long v162 = v142;
  *(void *)&long long v163 = v143;
  *(void *)&long long v164 = v144;
  *(float *)&uint64_t v142 = self->_tritiumProgress;
  LODWORD(v165) = v142;
  [v136 setVertexBytes:&v160 length:96 atIndex:0];
  [v136 setFragmentTexture:v114 atIndex:0];
  [v136 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v136 endEncoding];
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (double)dateFraction
{
  return self->_dateFraction;
}

- (double)secondFraction
{
  return self->_secondFraction;
}

- (double)tritiumProgress
{
  return self->_tritiumProgress;
}

- (void)setTritiumProgress:(double)a3
{
  self->_tritiumProgress = a3;
}

- (double)backgroundOn
{
  return self->_backgroundOn;
}

- (void)setBackgroundOn:(double)a3
{
  self->_backgroundOn = a3;
}

- (double)showsNumbers
{
  return self->_showsNumbers;
}

- (void)setShowsNumbers:(double)a3
{
  self->_showsNumbers = a3;
}

- (double)showsTicks
{
  return self->_showsTicks;
}

- (void)setShowsTicks:(double)a3
{
  self->_showsTicks = a3;
}

- (double)tickShadows
{
  return self->_tickShadows;
}

- (void)setTickShadows:(double)a3
{
  self->_float tickShadows = a3;
}

- (double)showsConfetti
{
  return self->_showsConfetti;
}

- (void)setShowsConfetti:(double)a3
{
  self->_showsConfettuint64_t i = a3;
}

- (double)confettiEntropy
{
  return self->_confettiEntropy;
}

- (void)setConfettiEntropy:(double)a3
{
  self->_confettiEntropCGFloat y = a3;
}

- (double)confettiRotation
{
  return self->_confettiRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confettiIndexBuffer, 0);
  objc_storeStrong((id *)&self->_touchTimeBuffers, 0);
  objc_storeStrong((id *)&self->_touchLocationBuffers, 0);
  objc_storeStrong((id *)&self->_touchHandler, 0);
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_currentFrameConfettiPositions, 0);
  objc_storeStrong((id *)&self->_compositedBackgroundTexture, 0);
  objc_storeStrong((id *)&self->_backgroundBlackNumbersSprite, 0);
  objc_storeStrong((id *)&self->_backgroundWhiteNumbersSprite, 0);
  objc_storeStrong((id *)&self->_minuteShadowSprite, 0);
  objc_storeStrong((id *)&self->_minuteInlaySprite, 0);
  objc_storeStrong((id *)&self->_minuteSprite, 0);
  objc_storeStrong((id *)&self->_minuteConfiguration, 0);
  objc_storeStrong((id *)&self->_confettiHiddenBuffer, 0);
  objc_storeStrong((id *)&self->_confettiOriginsBuffer, 0);
  objc_storeStrong((id *)&self->_confettiDefinitionsPool, 0);
  objc_storeStrong((id *)&self->_secondHandBlurTexturePool, 0);
  objc_storeStrong((id *)&self->_secondShadowSprite, 0);
  objc_storeStrong((id *)&self->_secondSprite, 0);
  objc_storeStrong((id *)&self->_secondConfiguration, 0);
  objc_storeStrong((id *)&self->_hourShadowSprite, 0);
  objc_storeStrong((id *)&self->_hourInlaySprite, 0);
  objc_storeStrong((id *)&self->_hourSprite, 0);
  objc_storeStrong((id *)&self->_hourConfiguration, 0);
  objc_storeStrong((id *)&self->_noiseSprite, 0);
  objc_storeStrong((id *)&self->_shadowGradientSprite, 0);
  objc_storeStrong((id *)&self->_gradientSprite, 0);
  objc_storeStrong((id *)&self->_compositePassDescriptor, 0);
  objc_storeStrong((id *)&self->_blurPipelineState, 0);
  objc_storeStrong((id *)&self->_blurPassDescriptor, 0);
  objc_storeStrong((id *)&self->_capsulePipelineState, 0);
  objc_storeStrong((id *)&self->_inlayPipelineState, 0);
  objc_storeStrong((id *)&self->_handPipelineState, 0);
  objc_storeStrong((id *)&self->_tintedSpritePipelineState, 0);
  objc_storeStrong((id *)&self->_spriteMultiplyPipelineState, 0);
  objc_storeStrong((id *)&self->_spritePipelineState, 0);
  objc_storeStrong((id *)&self->_computeConfettiPipelineState, 0);
  objc_storeStrong((id *)&self->_tritiumNumberColors, 0);
  objc_storeStrong((id *)&self->_numberColors, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
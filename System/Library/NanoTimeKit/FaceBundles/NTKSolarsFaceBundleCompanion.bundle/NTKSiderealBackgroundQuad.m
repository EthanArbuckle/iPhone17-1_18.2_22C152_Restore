@interface NTKSiderealBackgroundQuad
- (BOOL)prepareForTime:(double)a3;
- (BOOL)shouldDrawGlowPath;
- (MTLTexture)dayMask;
- (MTLTexture)nightMask;
- (NTKSiderealBackgroundQuad)initWithDevice:(id)a3 orbitDiameter:(double)a4 timeOrbitRadius:(double)a5 timeRadius:(double)a6 dialImage:(id)a7 waypointImage:(id)a8 gnomonImage:(id)a9 dayGnomonImage:(id)a10 dayDiskBloomImage:(id)a11 dayDiscImage:(id)a12 nightGnomonImage:(id)a13 nightDiscImage:(id)a14 nightRingImage:(id)a15 initialData:(id)a16 useXR:(BOOL)a17;
- (float)backgroundDimming;
- (float)blurScale;
- (float)litProgress;
- (float)sunsetFilter;
- (id)_currentBuffer;
- (int)numSlicesForAngle:(double)a3;
- (unint64_t)renderingMode;
- (void)loadGradientTexture;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setBackgroundDimming:(float)a3;
- (void)setBlurScale:(float)a3;
- (void)setDayMask:(id)a3;
- (void)setGlowViewStartAngle:(double)a3 endAngle:(double)a4;
- (void)setLitProgress:(float)a3;
- (void)setNightMask:(id)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setSectors:(id)a3;
- (void)setShouldDrawGlowPath:(BOOL)a3;
- (void)setSolarDayProgress:(double)a3;
- (void)setSunsetFilter:(float)a3;
- (void)setupForQuadView:(id)a3;
- (void)siderealDataChanged:(id)a3;
- (void)updateWaypointImage:(id)a3;
@end

@implementation NTKSiderealBackgroundQuad

- (NTKSiderealBackgroundQuad)initWithDevice:(id)a3 orbitDiameter:(double)a4 timeOrbitRadius:(double)a5 timeRadius:(double)a6 dialImage:(id)a7 waypointImage:(id)a8 gnomonImage:(id)a9 dayGnomonImage:(id)a10 dayDiskBloomImage:(id)a11 dayDiscImage:(id)a12 nightGnomonImage:(id)a13 nightDiscImage:(id)a14 nightRingImage:(id)a15 initialData:(id)a16 useXR:(BOOL)a17
{
  id v53 = a3;
  id v52 = a7;
  id v51 = a8;
  id v50 = a9;
  id v49 = a10;
  id v48 = a11;
  id v47 = a12;
  id v46 = a13;
  id v45 = a14;
  id v44 = a15;
  id v43 = a16;
  v54.receiver = self;
  v54.super_class = (Class)NTKSiderealBackgroundQuad;
  v25 = [(NTKSiderealBackgroundQuad *)&v54 init];
  v26 = v25;
  if (v25)
  {
    v25->_useXR = a17;
    float v27 = a4;
    v25->_diameter = v27;
    objc_storeStrong((id *)&v25->_clkDevice, a3);
    v26->_isConstantSun = 0;
    objc_storeStrong((id *)&v26->_currentData, a16);
    v26->_litProgress = 1.0;
    v26->_backgroundDimming = 1.0;
    v26->_blurScale = 1.0;
    v26->_sunsetFilter = 0.0;
    objc_storeStrong((id *)&v26->_dialTex, a7);
    objc_storeStrong((id *)&v26->_waypointTex, a8);
    objc_storeStrong((id *)&v26->_gnomonTexture, a9);
    objc_storeStrong((id *)&v26->_dayGnomonTexture, a10);
    objc_storeStrong((id *)&v26->_dayDiskBloomTexture, a11);
    objc_storeStrong((id *)&v26->_dayDiskTexture, a12);
    objc_storeStrong((id *)&v26->_nightGnomonTexture, a13);
    objc_storeStrong((id *)&v26->_nightDiskTexture, a14);
    objc_storeStrong((id *)&v26->_nightRingTexture, a15);
    v26->_glowStartAngle = 0.0;
    v26->_glowEndAngle = 0.0;
    float v28 = a6;
    v26->_blurRadius = v28;
    float v29 = a5;
    v26->_blurOrbitRadius = v29;
    v30 = +[MTLRenderPassDescriptor renderPassDescriptor];
    v31 = [(MTLRenderPassDescriptor *)v30 colorAttachments];
    v32 = [v31 objectAtIndexedSubscript:0];

    [v32 setLoadAction:2];
    objc_msgSend(v32, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    [v32 setStoreAction:1];
    objc_storeStrong((id *)&v26->_offscreenPassDescriptor, v30);
    v33 = +[MTLRenderPassDescriptor renderPassDescriptor];
    v34 = [v33 colorAttachments];
    v35 = [v34 objectAtIndexedSubscript:0];

    [v35 setLoadAction:2];
    objc_msgSend(v35, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    [v35 setStoreAction:1];
    objc_storeStrong((id *)&v26->_verticalBlurPassDescriptor, v30);
    v36 = +[MTLRenderPassDescriptor renderPassDescriptor];
    v37 = [v36 colorAttachments];
    v38 = [v37 objectAtIndexedSubscript:0];

    [v38 setLoadAction:2];
    objc_msgSend(v38, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    [v38 setStoreAction:1];
    horizontalBlurPassDescriptor = v26->_horizontalBlurPassDescriptor;
    v26->_horizontalBlurPassDescriptor = v30;
  }
  return v26;
}

- (void)siderealDataChanged:(id)a3
{
  objc_storeStrong((id *)&self->_currentData, a3);
  id v5 = a3;
  [(NTKSiderealBackgroundQuad *)self loadGradientTexture];
  unsigned __int8 v6 = [v5 isConstantSunUpOrDown];

  self->_isConstantSun = v6;
}

- (void)setGlowViewStartAngle:(double)a3 endAngle:(double)a4
{
  self->_glowStartAngle = a3;
  self->_glowEndAngle = a4;
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  self->_size.width = v5 + v5;
  self->_size.height = v6 + v6;
  double v7 = self->_diameter / (v5 + v5);
  [(CLKDevice *)self->_clkDevice screenScale];
  *(float *)&double v8 = v7 * v8;
  self->_orbitDiameter = *(float *)&v8;
  v9 = +[CLKUIMetalResourceManager sharedDevice];
  device = self->_device;
  self->_device = v9;

  v154[0] = 1;
  v11 = self->_device;
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [(MTLDevice *)v11 newDefaultLibraryWithBundle:v12 error:0];

  id v14 = [v13 newFunctionWithName:@"sidereal_fragment_solid_shader"];
  id v116 = [v13 newFunctionWithName:@"sidereal_fragment_gradient_shader"];
  id v15 = [v13 newFunctionWithName:@"sidereal_vertex_shader"];
  v16 = objc_opt_new();
  [v16 setConstantValue:v154 type:53 atIndex:0];
  v103 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = +[CLKUIMetalBinaryArchive archiveWithName:bundle:device:](CLKUIMetalBinaryArchive, "archiveWithName:bundle:device:", @"sidereal");
  v18 = +[MTLFunctionDescriptor functionDescriptor];
  v104 = v16;
  [v18 setConstantValues:v16];
  [v18 setName:@"sidereal_fragment_glow_shader"];
  id v19 = [v17 newFunctionInLibrary:v13 withDescriptor:v18];
  [v18 setName:@"sidereal_fragment_sprite_shader"];
  v102 = v18;
  id v114 = [v17 newFunctionInLibrary:v13 withDescriptor:v18];
  id v112 = [v13 newFunctionWithName:@"sidereal_vertex_sprite_shader"];
  id v110 = [v13 newFunctionWithName:@"sidereal_fragment_blur_shader"];
  id v108 = [v13 newFunctionWithName:@"sidereal_vertex_blur_shader"];
  id v107 = [v13 newFunctionWithName:@"sidereal_fragment_composite_shader"];
  v105 = v13;
  id v106 = [v13 newFunctionWithName:@"sidereal_vertex_composite_shader"];
  objc_initWeak(&location, self);
  v150[0] = _NSConcreteStackBlock;
  v150[1] = 3221225472;
  v150[2] = sub_1A1A4;
  v150[3] = &unk_2CD20;
  objc_copyWeak(&v152, &location);
  id v101 = v17;
  id v151 = v101;
  v20 = objc_retainBlock(v150);
  v145[0] = _NSConcreteStackBlock;
  v145[1] = 3221225472;
  v145[2] = sub_1A224;
  v145[3] = &unk_2CD48;
  id v21 = v15;
  id v146 = v21;
  id v100 = v14;
  id v147 = v100;
  id v22 = v4;
  id v148 = v22;
  v23 = v20;
  id v149 = v23;
  v24 = +[NTKPromise metalPipelinePromiseNamed:@"Sidereal Solid Pipeline" withBlock:v145];
  mtlSolidPipelineState = self->_mtlSolidPipelineState;
  self->_mtlSolidPipelineState = v24;

  v140[0] = _NSConcreteStackBlock;
  v140[1] = 3221225472;
  v140[2] = sub_1A314;
  v140[3] = &unk_2CD48;
  id v26 = v21;
  id v141 = v26;
  id v117 = v116;
  id v142 = v117;
  id v27 = v22;
  id v143 = v27;
  float v28 = v23;
  id v144 = v28;
  float v29 = +[NTKPromise metalPipelinePromiseNamed:@"Sidereal Gradient Pipeline" withBlock:v140];
  mtlGradientPipelineState = self->_mtlGradientPipelineState;
  self->_mtlGradientPipelineState = v29;

  v134[0] = _NSConcreteStackBlock;
  v134[1] = 3221225472;
  v134[2] = sub_1A404;
  v134[3] = &unk_2CD70;
  id v99 = v26;
  id v135 = v99;
  id v98 = v19;
  id v136 = v98;
  id v31 = v27;
  id v137 = v31;
  char v139 = v154[0];
  v32 = v28;
  id v138 = v32;
  v33 = +[NTKPromise metalPipelinePromiseNamed:@"Sidereal Glow Pipeline" withBlock:v134];
  mtlGlowPipelineState = self->_mtlGlowPipelineState;
  self->_mtlGlowPipelineState = v33;

  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_1A5C8;
  v128[3] = &unk_2CD70;
  id v35 = v112;
  id v129 = v35;
  id v115 = v114;
  id v130 = v115;
  id v36 = v31;
  id v131 = v36;
  char v133 = v154[0];
  v37 = v32;
  id v132 = v37;
  v38 = +[NTKPromise metalPipelinePromiseNamed:@"Sidereal Sprite Pipeline" withBlock:v128];
  mtlSpritePipelineState = self->_mtlSpritePipelineState;
  self->_mtlSpritePipelineState = v38;

  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472;
  v123[2] = sub_1A78C;
  v123[3] = &unk_2CD48;
  id v113 = v108;
  id v124 = v113;
  id v111 = v110;
  id v125 = v111;
  id v40 = v36;
  id v126 = v40;
  v41 = v37;
  id v127 = v41;
  v42 = +[NTKPromise metalPipelinePromiseNamed:@"Sidereal Blur Pipeline" withBlock:v123];
  mtlBlurPipelineState = self->_mtlBlurPipelineState;
  self->_mtlBlurPipelineState = v42;

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_1A8AC;
  v118[3] = &unk_2CD48;
  id v44 = v106;
  id v119 = v44;
  id v109 = v107;
  id v120 = v109;
  id v45 = v40;
  id v121 = v45;
  id v46 = v41;
  id v122 = v46;
  id v47 = +[NTKPromise metalPipelinePromiseNamed:@"Sidereal Composite Pipeline" withBlock:v118];
  mtlCompositePipelineState = self->_mtlCompositePipelineState;
  self->_mtlCompositePipelineState = v47;

  for (uint64_t i = 0; i != 3; ++i)
  {
    id v50 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 1728, 0, v98);
    id v51 = self->_mtlSectorDescriptorBuffers[i];
    self->_mtlSectorDescriptorBuffers[i] = v50;
  }
  id v52 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:512 options:0];
  mtlIndexBuffer = self->_mtlIndexBuffer;
  self->_mtlIndexBuffer = v52;

  objc_super v54 = (char *)[(MTLBuffer *)self->_mtlIndexBuffer contents];
  uint64_t v55 = 0;
  int64x2_t v56 = (int64x2_t)xmmword_23A70;
  int64x2_t v57 = (int64x2_t)xmmword_23A80;
  int64x2_t v58 = (int64x2_t)xmmword_23A90;
  int64x2_t v59 = (int64x2_t)xmmword_23AA0;
  int16x8_t v60 = (int16x8_t)xmmword_23AB0;
  int8x16_t v61 = (int8x16_t)vdupq_n_s64(1uLL);
  int64x2_t v62 = vdupq_n_s64(8uLL);
  v63.i64[0] = 0x8000800080008;
  v63.i64[1] = 0x8000800080008;
  do
  {
    *(int8x16_t *)&v54[v55] = vbicq_s8((int8x16_t)v60, (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)v59, v61)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)v58, v61))), (int16x8_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)v57, v61)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)v56, v61)))));
    int64x2_t v57 = vaddq_s64(v57, v62);
    int64x2_t v58 = vaddq_s64(v58, v62);
    int64x2_t v59 = vaddq_s64(v59, v62);
    int64x2_t v56 = vaddq_s64(v56, v62);
    int16x8_t v60 = vaddq_s16(v60, v63);
    v55 += 16;
  }
  while (v55 != 512);
  CLKUIConvertToRGBfFromSRGBf_fast();
  *(float32x4_t *)self->_ticksColor_dim = vsqrtq_f32(v64);
  CLKUIConvertToRGBfFromSRGBf_fast();
  *(float32x4_t *)self->_ticksColor_bright = vsqrtq_f32(v65);
  CLKUIConvertToRGBfFromSRGBf_fast();
  *(float32x4_t *)self->_waypointsColor = vsqrtq_f32(v66);
  v67 = +[NTKSiderealColorManager sharedInstance];
  v68 = v67;
  if (self->_useXR)
  {
    v69 = [v67 civilTwilightCurveP3];
    civilTwilightCurve = self->_civilTwilightCurve;
    self->_civilTwilightCurve = v69;

    v71 = [v68 nauticalTwilightCurveP3];
    nauticalTwilightCurve = self->_nauticalTwilightCurve;
    self->_nauticalTwilightCurve = v71;

    v73 = [v68 astronomicalTwilightCurveP3];
    astronomicalTwilightCurve = self->_astronomicalTwilightCurve;
    self->_astronomicalTwilightCurve = v73;

    [v68 dialBackgroundCurveP3];
  }
  else
  {
    v76 = [v67 civilTwilightColorCurve];
    v77 = self->_civilTwilightCurve;
    self->_civilTwilightCurve = v76;

    v78 = [v68 nauticalTwilightColorCurve];
    v79 = self->_nauticalTwilightCurve;
    self->_nauticalTwilightCurve = v78;

    v80 = [v68 astronomicalTwilightColorCurve];
    v81 = self->_astronomicalTwilightCurve;
    self->_astronomicalTwilightCurve = v80;

    [v68 dialBackgroundColorCurve];
  }
  v75 = (NTKAltitudeColorCurve *)objc_claimAutoreleasedReturnValue();
  nightColorCurve = self->_nightColorCurve;
  self->_nightColorCurve = v75;

  v83 = [v68 dayDiskBloomColorCurve];
  v84 = v35;
  bloomColorCurve = self->_bloomColorCurve;
  self->_bloomColorCurve = v83;

  self->_renderingMode = 0;
  self->_shouldDrawGlowPath = 0;
  if (self->_useXR) {
    uint64_t v86 = 555;
  }
  else {
    uint64_t v86 = 81;
  }
  v87 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v86 width:(unint64_t)self->_size.width height:(unint64_t)self->_size.height mipmapped:0];
  [v87 setUsage:5];
  v88 = +[CLKUIMetalResourceManager sharedDevice];
  v89 = (MTLTexture *)[v88 newTextureWithDescriptor:v87];
  offscreenBuffer = self->_offscreenBuffer;
  self->_offscreenBuffer = v89;

  v91 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v86 width:(unint64_t)(self->_size.width * 0.125) height:(unint64_t)(self->_size.height * 0.125) mipmapped:0];
  [v91 setUsage:5];
  v92 = +[CLKUIMetalResourceManager sharedDevice];
  v93 = (MTLTexture *)[v92 newTextureWithDescriptor:v91];
  verticalBlurBuffer = self->_verticalBlurBuffer;
  self->_verticalBlurBuffer = v93;

  v95 = +[CLKUIMetalResourceManager sharedDevice];
  v96 = (MTLTexture *)[v95 newTextureWithDescriptor:v91];
  horizontalBlurBuffer = self->_horizontalBlurBuffer;
  self->_horizontalBlurBuffer = v96;

  [(NTKSiderealBackgroundQuad *)self siderealDataChanged:self->_currentData];
  objc_destroyWeak(&v152);
  objc_destroyWeak(&location);
}

- (void)updateWaypointImage:(id)a3
{
}

- (void)loadGradientTexture
{
  v3 = [(NTKSiderealData *)self->_currentData gradientData];
  device = self->_device;
  id v5 = v3;
  id v6 = -[MTLDevice newBufferWithBytes:length:options:](device, "newBufferWithBytes:length:options:", [v5 bytes], objc_msgSend(v5, "length"), 0);
  double v7 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:110 width:128 height:64 mipmapped:0];
  [v7 setStorageMode:2];
  [v7 setUsage:1];
  id v8 = [(MTLDevice *)self->_device newTextureWithDescriptor:v7];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_1AB5C;
  v18 = &unk_2CD98;
  id v19 = v6;
  id v20 = v8;
  id v9 = v8;
  id v10 = v6;
  v11 = objc_retainBlock(&v15);
  v12 = [NTKSiderealUncachedMTLTexture alloc];
  id v13 = -[NTKSiderealUncachedMTLTexture initWithTextureGenerationBlock:](v12, "initWithTextureGenerationBlock:", v11, v15, v16, v17, v18);
  gradientTex = self->_gradientTex;
  self->_gradientTex = v13;
}

- (void)setSolarDayProgress:(double)a3
{
  self->_dayProgress = a3;
}

- (void)setSectors:(id)a3
{
  id v11 = a3;
  if ([v11 count])
  {
    id v4 = [v11 count];
    if ((unint64_t)v4 >= 0x12) {
      uint64_t v5 = 18;
    }
    else {
      uint64_t v5 = (uint64_t)v4;
    }
    id v6 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v5);
    double v7 = [v11 objectsAtIndexes:v6];
    id v8 = +[NSOrderedSet orderedSetWithArray:v7];
    sectors = self->_sectors;
    self->_sectors = v8;
  }
  else
  {
    id v10 = +[NSOrderedSet orderedSet];
    id v6 = self->_sectors;
    self->_sectors = v10;
  }
}

- (int)numSlicesForAngle:(double)a3
{
  double v3 = fabs(a3) * 50.0 / 3.14159265;
  if (v3 < 4.0) {
    return (int)4.0;
  }
  return (int)v3;
}

- (BOOL)prepareForTime:(double)a3
{
  NSUInteger v4 = [(NSOrderedSet *)self->_sectors count];
  if (v4)
  {
    self->_currentBufferIndex = self->_currentBufferIndex
                              + 1
                              - 3
                              * ((1431655766 * (unint64_t)(self->_currentBufferIndex + 1)) >> 32);
    id v5 = [(NTKSiderealBackgroundQuad *)self _currentBuffer];
    id v6 = [v5 contents];
    [(NTKSiderealData *)self->_currentData altitudeForProgress:self->_dayProgress];
    [(NSOrderedSet *)self->_sectors count];
    NTKHighPriorityApply();
    [(NSOrderedSet *)self->_sectors count];
    [(NSOrderedSet *)self->_sectors count];
    NTKHighPriorityApply();
    double glowStartAngle = self->_glowStartAngle;
    float v8 = glowStartAngle;
    double glowEndAngle = self->_glowEndAngle;
    float v10 = glowEndAngle;
    unsigned int v11 = [(NTKSiderealBackgroundQuad *)self numSlicesForAngle:glowEndAngle - glowStartAngle];
    v6[102] = xmmword_23B00;
    v6[103] = xmmword_23B00;
    v6[104] = xmmword_23B00;
    *((void *)v6 + 210) = 0;
    *((float *)v6 + 422) = v8;
    *((float *)v6 + 423) = v10;
    *((void *)v6 + 213) = 0;
    *((void *)v6 + 212) = 0;
    *((_DWORD *)v6 + 428) = 0;
    *((_DWORD *)v6 + 429) = v11;
    *((void *)v6 + 215) = 0;
  }
  return v4 != 0;
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKSiderealCachedMTLTexture *)self->_dialTex loadTextureWithCommandBuffer:v4 usingBlitEncoder:0];
  id v6 = [(NTKSiderealCachedMTLTexture *)self->_waypointTex loadTextureWithCommandBuffer:v4 usingBlitEncoder:v5];

  double v7 = [(NTKSiderealCachedMTLTexture *)self->_gnomonTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v6];

  float v8 = [(NTKSiderealCachedMTLTexture *)self->_dayGnomonTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v7];

  id v9 = [(NTKSiderealCachedMTLTexture *)self->_dayDiskBloomTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v8];

  float v10 = [(NTKSiderealCachedMTLTexture *)self->_dayDiskTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v9];

  unsigned int v11 = [(NTKSiderealCachedMTLTexture *)self->_nightGnomonTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v10];

  v12 = [(NTKSiderealCachedMTLTexture *)self->_nightDiskTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v11];

  id v13 = [(NTKSiderealCachedMTLTexture *)self->_nightRingTexture loadTextureWithCommandBuffer:v4 usingBlitEncoder:v12];

  id v14 = [(NTKSiderealUncachedMTLTexture *)self->_gradientTex loadTextureWithCommandBuffer:v4 usingBlitEncoder:v13];

  if (v14) {
    [v14 endEncoding];
  }
  v96 = v14;
  id v15 = [(MTLRenderPassDescriptor *)self->_offscreenPassDescriptor colorAttachments];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setTexture:self->_offscreenBuffer];

  v17 = [v4 renderCommandEncoderWithDescriptor:self->_offscreenPassDescriptor];
  id v95 = [(NTKSiderealBackgroundQuad *)self _currentBuffer];
  id v18 = [v95 contents];
  [v17 setLabel:@"Sidereal Encoder"];
  id v19 = [(NTKSiderealBackgroundQuad *)self _currentBuffer];
  [v17 setVertexBuffer:v19 offset:0 atIndex:0];

  id v20 = [(NTKSiderealUncachedMTLTexture *)self->_gradientTex texture];
  [v17 setFragmentTexture:v20 atIndex:0];

  id v21 = [(NTKSiderealCachedMTLTexture *)self->_dialTex texture];
  [v17 setFragmentTexture:v21 atIndex:1];

  id v22 = [(NTKSiderealCachedMTLTexture *)self->_waypointTex texture];
  [v17 setFragmentTexture:v22 atIndex:2];

  unint64_t renderingMode = self->_renderingMode;
  if (renderingMode - 1 < 2)
  {
    long long v24 = 0uLL;
    float backgroundDimming = 1.0;
    float litProgress = 1.0;
LABEL_7:
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    goto LABEL_9;
  }
  float litProgress = self->_litProgress;
  float backgroundDimming = self->_backgroundDimming;
  if (renderingMode == 3)
  {
    long long v24 = 0uLL;
    goto LABEL_7;
  }
  long long v28 = *(_OWORD *)self->_ticksColor_dim;
  long long v27 = *(_OWORD *)self->_ticksColor_bright;
  long long v24 = *(_OWORD *)self->_waypointsColor;
LABEL_9:
  uint64_t v114 = 0;
  v111[0] = v28;
  v111[1] = v27;
  v111[2] = v24;
  float v112 = litProgress;
  float v113 = backgroundDimming;
  *(float *)&uint64_t v114 = self->_sunsetFilter;
  objc_msgSend(v17, "setFragmentBytes:length:atIndex:", v111, 64, 0, 412);
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_1BF54;
  v107[3] = &unk_2CE10;
  id v29 = v17;
  id v109 = self;
  id v110 = v18;
  id v108 = v29;
  v30 = objc_retainBlock(v107);
  id v31 = [(NTKPromise *)self->_mtlSolidPipelineState object];
  [v29 setRenderPipelineState:v31];

  if ([(NSOrderedSet *)self->_sectors count])
  {
    unint64_t v32 = 0;
    do
    {
      v33 = [(NSOrderedSet *)self->_sectors objectAtIndexedSubscript:v32];
      id v34 = [v33 type];

      if (v34) {
        ((void (*)(void *, unint64_t))v30[2])(v30, v32);
      }
      ++v32;
    }
    while ([(NSOrderedSet *)self->_sectors count] > v32);
  }
  unint64_t v35 = self->_renderingMode;
  if (!v35 || v35 == 3)
  {
    id v36 = [(NTKPromise *)self->_mtlGradientPipelineState object];
    [v29 setRenderPipelineState:v36];
  }
  if ([(NSOrderedSet *)self->_sectors count])
  {
    unint64_t v37 = 0;
    do
    {
      v38 = [(NSOrderedSet *)self->_sectors objectAtIndexedSubscript:v37];
      id v39 = [v38 type];

      if (!v39) {
        ((void (*)(void *, unint64_t))v30[2])(v30, v37);
      }
      ++v37;
    }
    while ([(NSOrderedSet *)self->_sectors count] > v37);
  }
  if (!self->_renderingMode)
  {
    if (self->_shouldDrawGlowPath)
    {
      if (self->_glowStartAngle == self->_glowEndAngle || *(float *)&self->CLKUIQuad_opaque[v90] <= 0.0)
      {
        int v41 = 0;
      }
      else
      {
        id v40 = [(NTKPromise *)self->_mtlGlowPipelineState object];
        [v29 setRenderPipelineState:v40];

        int v41 = 1;
        [v29 setFragmentBytes:&self->_orbitDiameter length:4 atIndex:1];
        v42 = +[CLKDevice currentDevice];
        [v42 screenScale];
        float32_t v44 = 1.0 / v43 / self->_size.width;

        v97.f32[0] = v44;
        [v29 setFragmentBytes:&v97 length:4 atIndex:2];
        ((void (*)(void *, uint64_t))v30[2])(v30, 17);
      }
    }
    else
    {
      int v41 = 0;
    }
    id v45 = [(NTKPromise *)self->_mtlSpritePipelineState object];
    [v29 setRenderPipelineState:v45];

    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_1BFD4;
    v105[3] = &unk_2CE38;
    v105[4] = self;
    id v106 = v29;
    id v46 = objc_retainBlock(v105);
    id v47 = (void (**)(void, void, void, void, double))v46;
    if (v41)
    {
      __asm { FMOV            V1.4S, #1.0 }
      ((void (*)(void *, NTKSiderealCachedMTLTexture *, uint64_t, uint64_t, double, __n128))v46[2])(v46, self->_gnomonTexture, 1, 1, self->_glowStartAngle + 1.57079633, _Q1);
    }
    [(NTKSiderealData *)self->_currentData altitudeForProgress:self->_dayProgress];
    unsigned __int32 v54 = v53;
    int v56 = v55;
    int v58 = v57;
    -[NTKAltitudeColorCurve rgbfColorForAltitude:](self->_nightColorCurve, "rgbfColorForAltitude:");
    CLKUIConvertToXRSRGBfFromRGBf();
    __n128 v92 = v59;
    v59.n128_u32[0] = v54;
    LODWORD(v60) = v56;
    LODWORD(v61) = v58;
    -[NTKAltitudeColorCurve rgbfColorForAltitude:](self->_bloomColorCurve, "rgbfColorForAltitude:", v59.n128_f64[0], v60, v61);
    CLKUIConvertToXRSRGBfFromRGBf();
    v62.n128_u32[3] = 0.75;
    __n128 v91 = v62;
    v62.n128_f32[0] = self->_glowEndAngle + 1.57079633;
    double v63 = v62.n128_f32[0];
    __asm { FMOV            V1.4S, #1.0 }
    __n128 v93 = _Q1;
    ((void (**)(void, NTKSiderealCachedMTLTexture *, uint64_t, void, double))v47)[2](v47, self->_dayGnomonTexture, 1, 0, v62.n128_f32[0]);
    ((void (*)(void (**)(void, void, void, void, double), NTKSiderealCachedMTLTexture *, uint64_t, void, double, __n128))v47[2])(v47, self->_dayDiskBloomTexture, 1, 0, v63, v91);
    ((void (*)(void (**)(void, void, void, void, double), NTKSiderealCachedMTLTexture *, void, void, double, __n128))v47[2])(v47, self->_nightGnomonTexture, 0, 0, v63, v93);
    ((void (*)(void (**)(void, void, void, void, double), NTKSiderealCachedMTLTexture *, void, void, double, __n128))v47[2])(v47, self->_nightDiskTexture, 0, 0, v63, v92);
    ((void (*)(void (**)(void, void, void, void, double), NTKSiderealCachedMTLTexture *, void, uint64_t, double, __n128))v47[2])(v47, self->_nightRingTexture, 0, 1, v63, v93);
    ((void (*)(void (**)(void, void, void, void, double), NTKSiderealCachedMTLTexture *, uint64_t, void, double, __n128))v47[2])(v47, self->_dayDiskTexture, 1, 0, v63, v93);
  }
  [v29 endEncoding];
  if (!self->_renderingMode)
  {
    float v65 = self->_dayProgress * -3.14159265 * 2.0 + 1.57079633;
    __float2 v66 = __sincosf_stret(v65);
    float32x2_t v67 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v66.__sinval), LODWORD(v66.__cosval)), self->_blurOrbitRadius);
    [(CLKDevice *)self->_clkDevice screenScale];
    *(float *)&double v68 = v68;
    CGFloat v69 = self->_size.width * 0.5;
    *(float *)&CGFloat v69 = v69;
    float32x2_t v70 = vmul_n_f32(vdiv_f32(vmul_n_f32(v67, *(float *)&v68), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v69, 0)), self->_blurScale);
    double v71 = self->_blurRadius + 26.5;
    [(CLKDevice *)self->_clkDevice screenScale];
    *(float *)v73.i32 = v71 * v72 / (self->_size.width * 0.5) * self->_blurScale;
    __int32 v94 = v73.i32[0];
    __asm { FMOV            V1.2S, #-1.0 }
    float32x2_t v75 = vmla_n_f32(v70, _D1, *(float *)v73.i32);
    float32x2_t v76 = vmla_n_f32(v70, (float32x2_t)0xBF8000003F800000, *(float *)v73.i32);
    float32x2_t v77 = vmla_n_f32(v70, (float32x2_t)0x3F800000BF800000, *(float *)v73.i32);
    float32x2_t v78 = vadd_f32(v70, (float32x2_t)vdup_lane_s32(v73, 0));
    v79 = [(MTLRenderPassDescriptor *)self->_verticalBlurPassDescriptor colorAttachments];
    v80 = [v79 objectAtIndexedSubscript:0];
    [v80 setTexture:self->_verticalBlurBuffer];

    v81 = [v4 renderCommandEncoderWithDescriptor:self->_verticalBlurPassDescriptor];
    v82 = [(NTKPromise *)self->_mtlBlurPipelineState object];
    [v81 setRenderPipelineState:v82];

    float32x2_t v97 = v75;
    float32x2_t v98 = v76;
    float32x2_t v99 = v77;
    float32x2_t v100 = v78;
    __int32 v103 = v94;
    int v104 = 0;
    float v83 = 2.0 / self->_size.width;
    LODWORD(v84) = 0;
    *((float *)&v84 + 1) = v83;
    float32x2_t v101 = v70;
    uint64_t v102 = v84;
    [v81 setVertexBytes:&v97 length:56 atIndex:2];
    [v81 setFragmentTexture:self->_offscreenBuffer atIndex:3];
    [v81 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v81 endEncoding];

    v85 = [(MTLRenderPassDescriptor *)self->_horizontalBlurPassDescriptor colorAttachments];
    uint64_t v86 = [v85 objectAtIndexedSubscript:0];
    [v86 setTexture:self->_horizontalBlurBuffer];

    v87 = [v4 renderCommandEncoderWithDescriptor:self->_horizontalBlurPassDescriptor];
    v88 = [(NTKPromise *)self->_mtlBlurPipelineState object];
    [v87 setRenderPipelineState:v88];

    float32x2_t v97 = v75;
    float32x2_t v98 = v76;
    float32x2_t v99 = v77;
    float32x2_t v100 = v78;
    __int32 v103 = v94;
    int v104 = 0;
    *(float *)&unsigned int v89 = 2.0 / self->_size.width;
    float32x2_t v101 = v70;
    uint64_t v102 = v89;
    [v87 setVertexBytes:&v97 length:56 atIndex:2];
    [v87 setFragmentTexture:self->_verticalBlurBuffer atIndex:3];
    [v87 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v87 endEncoding];
  }
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKPromise *)self->_mtlCompositePipelineState object];
  [v4 setRenderPipelineState:v5];

  __asm { FMOV            V0.2S, #-1.0 }
  v21[0] = _D0;
  v21[1] = 0xBF8000003F800000;
  __asm { FMOV            V1.2S, #1.0 }
  v21[2] = 0x3F800000BF800000;
  v21[3] = _D1;
  *(float *)&_D0 = self->_dayProgress * -3.14159265 * 2.0 + 1.57079633;
  __float2 v12 = __sincosf_stret(*(float *)&_D0);
  float32x2_t v13 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval)), self->_blurOrbitRadius);
  [(CLKDevice *)self->_clkDevice screenScale];
  *(float *)&double v14 = v14;
  CGFloat v15 = self->_size.width * 0.5;
  *(float *)&CGFloat v15 = v15;
  v21[4] = vmul_n_f32(vdiv_f32(vmul_n_f32(v13, *(float *)&v14), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v15, 0)), self->_blurScale);
  float v16 = -1.0;
  if (!self->_renderingMode)
  {
    double blurRadius = self->_blurRadius;
    [(CLKDevice *)self->_clkDevice screenScale];
    float v16 = v18 * blurRadius / (self->_size.width * 0.5) * self->_blurScale;
  }
  float v22 = v16;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v19 = v19;
  int v23 = LODWORD(v19);
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v20 = v20;
  uint64_t v24 = LODWORD(v20);
  [v4 setVertexBytes:v21 length:56 atIndex:3];
  [v4 setFragmentTexture:self->_horizontalBlurBuffer atIndex:5];
  [v4 setFragmentTexture:self->_offscreenBuffer atIndex:4];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
}

- (id)_currentBuffer
{
  return self->_mtlSectorDescriptorBuffers[self->_currentBufferIndex];
}

- (float)litProgress
{
  return self->_litProgress;
}

- (void)setLitProgress:(float)a3
{
  self->_float litProgress = a3;
}

- (float)backgroundDimming
{
  return self->_backgroundDimming;
}

- (void)setBackgroundDimming:(float)a3
{
  self->_float backgroundDimming = a3;
}

- (float)blurScale
{
  return self->_blurScale;
}

- (void)setBlurScale:(float)a3
{
  self->_blurScale = a3;
}

- (BOOL)shouldDrawGlowPath
{
  return self->_shouldDrawGlowPath;
}

- (void)setShouldDrawGlowPath:(BOOL)a3
{
  self->_shouldDrawGlowPath = a3;
}

- (float)sunsetFilter
{
  return self->_sunsetFilter;
}

- (void)setSunsetFilter:(float)a3
{
  self->_sunsetFilter = a3;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_unint64_t renderingMode = a3;
}

- (MTLTexture)dayMask
{
  return self->_dayMask;
}

- (void)setDayMask:(id)a3
{
}

- (MTLTexture)nightMask
{
  return self->_nightMask;
}

- (void)setNightMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nightMask, 0);
  objc_storeStrong((id *)&self->_dayMask, 0);
  objc_storeStrong((id *)&self->_horizontalBlurBuffer, 0);
  objc_storeStrong((id *)&self->_verticalBlurBuffer, 0);
  objc_storeStrong((id *)&self->_offscreenBuffer, 0);
  objc_storeStrong((id *)&self->_horizontalBlurPassDescriptor, 0);
  objc_storeStrong((id *)&self->_verticalBlurPassDescriptor, 0);
  objc_storeStrong((id *)&self->_offscreenPassDescriptor, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_bloomColorCurve, 0);
  objc_storeStrong((id *)&self->_nightColorCurve, 0);
  objc_storeStrong((id *)&self->_astronomicalTwilightCurve, 0);
  objc_storeStrong((id *)&self->_nauticalTwilightCurve, 0);
  objc_storeStrong((id *)&self->_civilTwilightCurve, 0);
  objc_storeStrong((id *)&self->_sectors, 0);
  objc_storeStrong((id *)&self->_nightRingTexture, 0);
  objc_storeStrong((id *)&self->_nightDiskTexture, 0);
  objc_storeStrong((id *)&self->_nightGnomonTexture, 0);
  objc_storeStrong((id *)&self->_dayDiskTexture, 0);
  objc_storeStrong((id *)&self->_dayDiskBloomTexture, 0);
  objc_storeStrong((id *)&self->_dayGnomonTexture, 0);
  objc_storeStrong((id *)&self->_gnomonTexture, 0);
  objc_storeStrong((id *)&self->_waypointTex, 0);
  objc_storeStrong((id *)&self->_dialTex, 0);
  objc_storeStrong((id *)&self->_gradientTex, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_mtlSectorDescriptorBuffers[i], 0);
  objc_storeStrong((id *)&self->_mtlIndexBuffer, 0);
  objc_storeStrong((id *)&self->_mtlCompositePipelineState, 0);
  objc_storeStrong((id *)&self->_mtlBlurPipelineState, 0);
  objc_storeStrong((id *)&self->_mtlSpritePipelineState, 0);
  objc_storeStrong((id *)&self->_mtlGlowPipelineState, 0);
  objc_storeStrong((id *)&self->_mtlGradientPipelineState, 0);
  objc_storeStrong((id *)&self->_mtlSolidPipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_clkDevice, 0);
}

@end
@interface NTKLilypadQuad
- (BOOL)is24hour;
- (BOOL)prepareForTime:(double)a3;
- (LilypadNoiseConfig)noiseConfigForPosition:(double)a3 atTime:;
- (NTKLilypadPhysicsBodies)_bodiesForTime:(NTKLilypadTime *)a3;
- (NTKLilypadQuad)initWithDevice:(id)a3;
- (double)createMatrixForTextureWithSize:(float32x2_t)a1 translation:(double)a2 scale:(float)a3 rotate:(float)a4 xOffset:(float)a5;
- (float)textureOriginForDigit:(unsigned int)a3;
- (float)textureSizeForDigit:(unsigned int)a3;
- (id)_generateNoiseTextureInRect:(CGRect)a3 device:(id)a4;
- (id)_wallBodies;
- (void)_createPhysicsWorld;
- (void)_resetTimeBodiesToDefaultPositions;
- (void)_updateTimeBodiesFromTime:(NTKLilypadTime *)a3 toTime:(NTKLilypadTime *)a4;
- (void)loadTextures;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)renderTimeToRenderEncoder:(id)a3;
- (void)resetStartTime;
- (void)setColorMode:(float)a3;
- (void)setDeviceMotion:(id)a3;
- (void)setIs24hour:(BOOL)a3;
- (void)setMotionSuppressed:(float)a3;
- (void)setThreadVibrations:(NTKLilypadThreadVibrations *)a3;
- (void)setTime:(NTKLilypadTime *)a3;
- (void)setTritiumProgress:(float)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKLilypadQuad

- (NTKLilypadQuad)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKLilypadQuad;
  v6 = [(NTKLilypadQuad *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(3);
    renderSemaphore = v7->_renderSemaphore;
    v7->_renderSemaphore = (OS_dispatch_semaphore *)v8;

    v7->_currentBufferIndex = 0;
    v7->_tritiumProgress = 1.0;
    v7->_currentMotionAmount = 0.0;
    uint64_t v10 = +[CLKUIMetalResourceManager sharedDevice];
    mtlDevice = v7->_mtlDevice;
    v7->_mtlDevice = (MTLDevice *)v10;

    v7->_startTime = CACurrentMediaTime();
  }

  return v7;
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  [(CLKDevice *)self->_device screenBounds];
  double v6 = v5;
  [(CLKDevice *)self->_device screenScale];
  self->_screenWidth = (int)(v6 * v7);
  [(CLKDevice *)self->_device screenBounds];
  double v9 = v8;
  [(CLKDevice *)self->_device screenScale];
  double v11 = v9 * v10;
  unsigned int v12 = (int)v11;
  self->_screenHeight = (int)v11;
  LOWORD(v11) = self->_screenWidth;
  *(float *)&uint64_t v13 = (float)LODWORD(v11);
  *((float *)&v13 + 1) = (float)v12;
  *(void *)self->_targetSize = v13;
  self->_digitScale = (float)((float)LODWORD(v11) * 1.8) / 396.0;
  [(NTKLilypadQuad *)self _createPhysicsWorld];
  v14 = +[CLKUIMetalResourceManager sharedDevice];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  id v16 = [v14 newDefaultLibraryWithBundle:v15 error:0];

  id v17 = [v16 newFunctionWithName:@"lilypad_vertex_shader"];
  id v18 = [v16 newFunctionWithName:@"lilypad_fragment_shader"];
  id v19 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v19 setLabel:@"LilypadTimePipeline"];
  [v19 setVertexFunction:v17];
  [v19 setFragmentFunction:v18];
  v95 = v4;
  id v20 = [v4 colorPixelFormat];
  v21 = [v19 colorAttachments];
  v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setPixelFormat:v20];

  v23 = [v19 colorAttachments];
  v24 = [v23 objectAtIndexedSubscript:0];
  [v24 setBlendingEnabled:1];

  v25 = [v19 colorAttachments];
  v26 = [v25 objectAtIndexedSubscript:0];
  [v26 setRgbBlendOperation:0];

  v27 = [v19 colorAttachments];
  v28 = [v27 objectAtIndexedSubscript:0];
  [v28 setAlphaBlendOperation:0];

  v29 = [v19 colorAttachments];
  v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setSourceRGBBlendFactor:4];

  v31 = [v19 colorAttachments];
  v32 = [v31 objectAtIndexedSubscript:0];
  [v32 setSourceAlphaBlendFactor:4];

  v33 = [v19 colorAttachments];
  v34 = [v33 objectAtIndexedSubscript:0];
  [v34 setDestinationRGBBlendFactor:5];

  v35 = [v19 colorAttachments];
  v36 = [v35 objectAtIndexedSubscript:0];
  [v36 setDestinationAlphaBlendFactor:5];

  id v98 = 0;
  v37 = (MTLRenderPipelineState *)[v14 newRenderPipelineStateWithDescriptor:v19 error:&v98];
  id v38 = v98;
  timeRenderPipelineState = self->_timeRenderPipelineState;
  self->_timeRenderPipelineState = v37;

  if (v38)
  {
    v40 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_7310(v38);
    }
  }
  id v41 = [v16 newFunctionWithName:@"lilypad_strand_compute_shader"];
  id v97 = 0;
  v42 = (MTLComputePipelineState *)[v14 newComputePipelineStateWithFunction:v41 error:&v97];
  id v43 = v97;
  strandsComputePipelineState = self->_strandsComputePipelineState;
  self->_strandsComputePipelineState = v42;

  if (v43)
  {
    v45 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_7288(v43);
    }
  }
  id v46 = [v16 newFunctionWithName:@"lilypad_strand_vertex_shader"];
  id v47 = [v16 newFunctionWithName:@"lilypad_strand_fragment_shader"];
  id v48 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v48 setLabel:@"LilypadStrandPipeline"];
  [v48 setVertexFunction:v46];
  [v48 setFragmentFunction:v47];
  id v49 = [v95 colorPixelFormat];
  v50 = [v48 colorAttachments];
  v51 = [v50 objectAtIndexedSubscript:0];
  [v51 setPixelFormat:v49];

  v52 = [v48 colorAttachments];
  v53 = [v52 objectAtIndexedSubscript:0];
  [v53 setBlendingEnabled:1];

  v54 = [v48 colorAttachments];
  v55 = [v54 objectAtIndexedSubscript:0];
  [v55 setRgbBlendOperation:0];

  v56 = [v48 colorAttachments];
  v57 = [v56 objectAtIndexedSubscript:0];
  [v57 setAlphaBlendOperation:0];

  v58 = [v48 colorAttachments];
  v59 = [v58 objectAtIndexedSubscript:0];
  [v59 setSourceRGBBlendFactor:4];

  v60 = [v48 colorAttachments];
  v61 = [v60 objectAtIndexedSubscript:0];
  [v61 setSourceAlphaBlendFactor:0];

  v62 = [v48 colorAttachments];
  v63 = [v62 objectAtIndexedSubscript:0];
  [v63 setDestinationRGBBlendFactor:5];

  v64 = [v48 colorAttachments];
  v65 = [v64 objectAtIndexedSubscript:0];
  [v65 setDestinationAlphaBlendFactor:1];

  id v96 = 0;
  v66 = (MTLRenderPipelineState *)[v14 newRenderPipelineStateWithDescriptor:v48 error:&v96];
  unint64_t v67 = (unint64_t)v96;
  strandsRenderPipelineState = self->_strandsRenderPipelineState;
  self->_strandsRenderPipelineState = v66;

  if (v67)
  {
    v69 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_7200((void *)v67);
    }
  }
  v94 = v16;

  v70 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:10 width:self->_screenWidth / 3u height:self->_screenHeight / 3u mipmapped:0];
  [v70 setUsage:5];
  [v70 setStorageMode:2];
  unint64_t v71 = sub_4BE4(self->_device);
  LODWORD(v67) = v71;
  uint64_t v72 = 0;
  uint64_t v73 = v71 << 32;
  uint64_t v74 = (uint64_t)((v71 << 32) * HIDWORD(v71)) >> 30;
  do
  {
    v75 = (MTLTexture *)[v14 newTextureWithDescriptor:v70];
    v76 = self->_timeBuffer[v72];
    self->_timeBuffer[v72] = v75;

    v77 = (MTLBuffer *)[v14 newBufferWithLength:v74 options:32];
    v78 = self->_strandBuffer[v72];
    self->_strandBuffer[v72] = v77;

    ++v72;
  }
  while (v72 != 3);
  v79 = +[MTLRenderPassDescriptor renderPassDescriptor];
  v80 = [v79 colorAttachments];
  v81 = [v80 objectAtIndexedSubscript:0];

  [v81 setLoadAction:2];
  objc_msgSend(v81, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  [v81 setStoreAction:1];
  objc_storeStrong((id *)&self->_timePassDescriptor, v79);
  v82 = (MTLBuffer *)[v14 newBufferWithLength:v73 >> 28 options:0];
  lightColors = self->_lightColors;
  self->_lightColors = v82;

  v84 = (MTLBuffer *)[v14 newBufferWithLength:v73 >> 28 options:0];
  darkColors = self->_darkColors;
  self->_darkColors = v84;

  v86 = [(MTLBuffer *)self->_lightColors contents];
  v87 = [(MTLBuffer *)self->_darkColors contents];
  if ((int)v67 >= 1)
  {
    v88 = v87;
    v89 = &xmmword_9790;
    unint64_t v67 = v67;
    v90 = &xmmword_9690;
    do
    {
      ++v90;
      CLKUIConvertToRGBfFromSRGBf_fast();
      *v86++ = v91;
      ++v89;
      CLKUIConvertToRGBfFromSRGBf_fast();
      *v88++ = v92;
      --v67;
    }
    while (v67);
  }
  for (uint64_t i = 0; i != 16; ++i)
  {
    *(void *)&self->_noiseOrigins[i * 8] = qword_9890[i];
    *(void *)&self->_noiseDirections[i * 8] = qword_9910[i];
  }
  [(NTKLilypadQuad *)self loadTextures];
}

- (void)loadTextures
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = +[UIImage imageNamed:@"DigitSprites" inBundle:v3 withConfiguration:0];

  id v4 = CLKUIConvertUIImageToMTLTexture();
  id blitDigits = self->_blitDigits;
  self->_id blitDigits = v4;

  double v6 = +[NSBundle bundleForClass:objc_opt_class()];
  double v7 = +[UIImage imageNamed:@"CurveFunction-75" inBundle:v6 withConfiguration:0];

  double v8 = CLKUIConvertUIImageToMTLTexture();
  id blitFunction = self->_blitFunction;
  self->_id blitFunction = v8;

  double v10 = -[NTKLilypadQuad _generateNoiseTextureInRect:device:](self, "_generateNoiseTextureInRect:device:", self->_mtlDevice, 0.0, 0.0, 15.0, 15.0);
  id blitNoise = self->_blitNoise;
  self->_id blitNoise = v10;
}

- (float)textureOriginForDigit:(unsigned int)a3
{
  if (a3 >= 0xA) {
    sub_7398();
  }
  return (float)dword_9990[a3];
}

- (float)textureSizeForDigit:(unsigned int)a3
{
  if (a3 >= 0xA) {
    sub_73C4();
  }
  return (float)(dword_9990[a3 + 1] + ~dword_9990[a3]);
}

- (void)resetStartTime
{
  double v3 = CACurrentMediaTime();
  self->_startTime = v3 - (double)arc4random_uniform(0x3E8u);
}

- (void)setTime:(NTKLilypadTime *)a3
{
  p_NTKLilypadTime time = &self->_time;
  NTKLilypadTime time = self->_time;
  NTKLilypadTime v6 = *a3;
  [(NTKLilypadQuad *)self _updateTimeBodiesFromTime:&time toTime:&v6];
  long long v5 = *(_OWORD *)&a3->fromHour;
  p_time->fraction = a3->fraction;
  *(_OWORD *)&p_time->fromHour = v5;
}

- (void)setThreadVibrations:(NTKLilypadThreadVibrations *)a3
{
  long long v3 = *(_OWORD *)&a3->vibrations[12];
  long long v5 = *(_OWORD *)a3->vibrations;
  long long v4 = *(_OWORD *)&a3->vibrations[4];
  *(_OWORD *)&self->_vibrations.vibrations[8] = *(_OWORD *)&a3->vibrations[8];
  *(_OWORD *)&self->_vibrations.vibrations[12] = v3;
  *(_OWORD *)self->_vibrations.vibrations = v5;
  *(_OWORD *)&self->_vibrations.vibrations[4] = v4;
}

- (void)setTritiumProgress:(float)a3
{
  self->_tritiumProgress = a3;
}

- (void)setMotionSuppressed:(float)a3
{
  self->_motionSuppression = a3;
}

- (void)setColorMode:(float)a3
{
  self->_colorMode = a3;
}

- (void)setDeviceMotion:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    [v4 userAcceleration];
    v6.f64[1] = v5;
    float64x2_t v11 = v6;
    [v12 gravity];
    v8.f64[1] = v7;
    *(float32x2_t *)self->_motionForce = vneg_f32(vcvt_f32_f64(vmlaq_f64(v11, (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL), v8)));
    [v12 rotationRate];
    float v10 = v9;
    self->_motionTorque = v10;
  }
  else
  {
    [(NTKLilypadQuad *)self _resetTimeBodiesToDefaultPositions];
  }
}

- (void)_createPhysicsWorld
{
  id v3 = objc_alloc_init((Class)PKPhysicsWorld);
  NTKLilypadTime time = self->_time;
  id v4 = [(NTKLilypadQuad *)self _bodiesForTime:&time];
  float64x2_t v6 = v5;
  float64_t v7 = [(NTKLilypadQuad *)self _wallBodies];
  [v3 addBody:v4];
  [v3 addBody:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      float64x2_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v3, "addBody:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
        float64x2_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v9);
  }

  objc_msgSend(v3, "setGravity:", 0.0, 0.0);
  objc_storeStrong((id *)&self->_world, v3);
  objc_storeStrong((id *)&self->_minuteBody, v4);
  objc_storeStrong((id *)&self->_hourBody, v6);
  [(NTKLilypadQuad *)self _resetTimeBodiesToDefaultPositions];
}

- (void)_updateTimeBodiesFromTime:(NTKLilypadTime *)a3 toTime:(NTKLilypadTime *)a4
{
  if (*(void *)&a3->fromHour != *(void *)&a4->fromHour)
  {
    NTKLilypadTime v8 = *a4;
    id v5 = [(NTKLilypadQuad *)self _bodiesForTime:&v8];
    float64_t v7 = v6;
    [(PKPhysicsBody *)self->_hourBody position];
    objc_msgSend(v7, "setPosition:");
    [(PKPhysicsBody *)self->_hourBody velocity];
    objc_msgSend(v7, "setVelocity:");
    [(PKPhysicsBody *)self->_hourBody rotation];
    objc_msgSend(v7, "setRotation:");
    [(PKPhysicsBody *)self->_hourBody angularVelocity];
    objc_msgSend(v7, "setAngularVelocity:");
    [(PKPhysicsBody *)self->_minuteBody position];
    objc_msgSend(v5, "setPosition:");
    [(PKPhysicsBody *)self->_minuteBody velocity];
    objc_msgSend(v5, "setVelocity:");
    [(PKPhysicsBody *)self->_minuteBody rotation];
    objc_msgSend(v5, "setRotation:");
    [(PKPhysicsBody *)self->_minuteBody angularVelocity];
    objc_msgSend(v5, "setAngularVelocity:");
    [(PKPhysicsWorld *)self->_world removeBody:self->_hourBody];
    [(PKPhysicsWorld *)self->_world removeBody:self->_minuteBody];
    objc_storeStrong((id *)&self->_hourBody, v7);
    objc_storeStrong((id *)&self->_minuteBody, v5);
    [(PKPhysicsWorld *)self->_world addBody:self->_hourBody];
    [(PKPhysicsWorld *)self->_world addBody:self->_minuteBody];
  }
}

- (NTKLilypadPhysicsBodies)_bodiesForTime:(NTKLilypadTime *)a3
{
  int v4 = 0;
  uint64_t v5 = 0;
  int fromHour = a3->fromHour;
  int fromMinute = a3->fromMinute;
  v36[0] = fromMinute % 10;
  v36[1] = fromMinute / 10;
  int v30 = fromHour;
  v36[2] = fromHour % 10;
  v36[3] = fromHour / 10;
  long long v34 = 0u;
  long long v35 = 0u;
  do
  {
    uint64_t v8 = (int)v36[v5];
    [(NTKLilypadQuad *)self textureSizeForDigit:v8];
    float32x2_t v10 = *(float32x2_t *)&v9;
    *(float *)&double v11 = self->_digitScale;
    *(float *)&double v12 = (float)((float)(1 - (v4 & 2)) * flt_99BC[v8]) + 0.0;
    [(NTKLilypadQuad *)self createMatrixForTextureWithSize:v9 translation:0.0 scale:v11 rotate:0.0 xOffset:v12];
    float32x2_t v13 = vmla_f32((float32x2_t)0x41B0000041700000, 0, v10);
    float32x2_t v17 = *(float32x2_t *)self->_targetSize;
    float32x2_t v18 = vdiv_f32(vadd_f32(v16, (float32x2_t)*(_OWORD *)&vmlaq_lane_f32(vmulq_n_f32(v14, v13.f32[0]), v15, v13, 1)), v17);
    float32x2_t v19 = vadd_f32(v10, (float32x2_t)0xC1B00000C1700000);
    *(float32x2_t *)v14.f32 = vdiv_f32(vadd_f32(v16, (float32x2_t)*(_OWORD *)&vmlaq_lane_f32(vmulq_n_f32(v14, v19.f32[0]), v15, v19, 1)), v17);
    id v20 = +[PKPhysicsBody bodyWithRectangleOfSize:vcvtq_f64_f32(vsub_f32(*(float32x2_t *)v14.f32, v18)) center:vcvtq_f64_f32(vmul_f32(vadd_f32(v18, *(float32x2_t *)v14.f32), (float32x2_t)0x3F0000003F000000))];
    [v20 setCategoryBitMask:1];
    [v20 setCollisionBitMask:1];
    v21 = (void *)*((void *)&v34 + v5);
    *((void *)&v34 + v5) = v20;

    ++v5;
    v4 += 2;
  }
  while (v5 != 4);
  if (self->_is24hour || (v30 + 9) >= 0x13)
  {
    long long v32 = v35;
    v22 = +[NSArray arrayWithObjects:&v32 count:2];
    uint64_t v23 = +[PKPhysicsBody bodyWithBodies:v22];
  }
  else
  {
    uint64_t v33 = v35;
    v22 = +[NSArray arrayWithObjects:&v33 count:1];
    uint64_t v23 = +[PKPhysicsBody bodyWithBodies:v22];
  }
  v24 = (void *)v23;

  long long v31 = v34;
  v25 = +[NSArray arrayWithObjects:&v31 count:2];
  v26 = +[PKPhysicsBody bodyWithBodies:v25];

  [v24 setDynamic:1];
  [v24 setMass:10.0];
  [v24 setCategoryBitMask:1];
  [v24 setCollisionBitMask:1];
  [v24 setLinearDamping:0.400000006];
  [v24 setAngularDamping:0.25];
  [v26 setDynamic:1];
  [v26 setMass:10.0];
  [v26 setCategoryBitMask:1];
  [v26 setCollisionBitMask:1];
  [v26 setLinearDamping:0.400000006];
  [v26 setAngularDamping:0.25];
  for (uint64_t i = 24; i != -8; i -= 8)

  v28 = v26;
  v29 = v24;
  result.var1 = v29;
  result.var0 = v28;
  return result;
}

- (void)_resetTimeBodiesToDefaultPositions
{
  -[PKPhysicsBody setPosition:](self->_hourBody, "setPosition:", 0.550000012, 0.720000029);
  [(PKPhysicsBody *)self->_hourBody setRotation:-0.17453292];
  -[PKPhysicsBody setVelocity:](self->_hourBody, "setVelocity:", 0.0, 0.0);
  [(PKPhysicsBody *)self->_hourBody setAngularVelocity:0.0];
  -[PKPhysicsBody setPosition:](self->_minuteBody, "setPosition:", 0.449999988, 0.270000011);
  [(PKPhysicsBody *)self->_minuteBody setRotation:-0.17453292];
  -[PKPhysicsBody setVelocity:](self->_minuteBody, "setVelocity:", 0.0, 0.0);
  minuteBody = self->_minuteBody;

  [(PKPhysicsBody *)minuteBody setAngularVelocity:0.0];
}

- (id)_wallBodies
{
  v2 = +[PKPhysicsBody bodyWithRectangleOfSize:center:](PKPhysicsBody, "bodyWithRectangleOfSize:center:", 1.0, 1.0, -0.5, 0.5);
  id v3 = +[PKPhysicsBody bodyWithRectangleOfSize:center:](PKPhysicsBody, "bodyWithRectangleOfSize:center:", 1.0, 1.0, 1.5, 0.5);
  int v4 = +[PKPhysicsBody bodyWithRectangleOfSize:center:](PKPhysicsBody, "bodyWithRectangleOfSize:center:", 1.0, 1.0, 0.5, 1.5);
  uint64_t v5 = +[PKPhysicsBody bodyWithRectangleOfSize:center:](PKPhysicsBody, "bodyWithRectangleOfSize:center:", 1.0, 1.0, 0.5, -0.5);
  v18[0] = v2;
  v18[1] = v3;
  v18[2] = v4;
  v18[3] = v5;
  +[NSArray arrayWithObjects:v18 count:4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "setDynamic:", 0, (void)v13);
        [v11 setPinned:1];
        [v11 setMass:100.0];
        [v11 setCollisionBitMask:1];
        [v11 setCategoryBitMask:1];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)_generateNoiseTextureInRect:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  [v9 setPixelFormat:10];
  [v9 setWidth:128];
  [v9 setHeight:128];
  [v9 setMipmapLevelCount:1];
  [v9 setTextureType:2];
  [v9 setUsage:1];
  [v9 setStorageMode:2];
  id v10 = [v8 newTextureWithDescriptor:v9];
  id v11 = [v8 newBufferWithLength:0x4000 options:0];

  id v12 = v11;
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_5CD8;
  v24 = &unk_C4A8;
  CGFloat v25 = x;
  CGFloat v26 = y;
  double v27 = width;
  double v28 = height;
  int v30 = (int)width;
  int v31 = (int)height;
  id v29 = [v12 contents];
  NTKHighPriorityApply();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5DA4;
  v18[3] = &unk_C4D0;
  id v19 = v12;
  id v20 = v10;
  id v13 = v10;
  id v14 = v12;
  long long v15 = objc_retainBlock(v18);
  long long v16 = objc_retainBlock(v15);

  return v16;
}

- (LilypadNoiseConfig)noiseConfigForPosition:(double)a3 atTime:
{
  snoise4();
  snoise4();
  snoise4();
  return v3;
}

- (double)createMatrixForTextureWithSize:(float32x2_t)a1 translation:(double)a2 scale:(float)a3 rotate:(float)a4 xOffset:(float)a5
{
  __asm { FMOV            V0.4S, #1.0 }
  int32x4_t v30 = _Q0;
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
  int32x4_t v33 = (int32x4_t)xmmword_9660;
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  float32x4_t v36 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v14) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_9680, COERCE_FLOAT(*(_OWORD *)((char *)&v31 + v14))), (float32x4_t)xmmword_9670, *(float32x2_t *)&v31.i8[v14], 1), v27, *(float32x4_t *)((char *)&v31 + v14), 2);
    v14 += 16;
  }
  while (v14 != 48);
  uint64_t v16 = 0;
  float32x4_t v17 = v34;
  float32x4_t v18 = v35;
  float32x4_t v19 = v36;
  LODWORD(v20) = 0;
  *((float *)&v20 + 1) = a3;
  int32x4_t v31 = (int32x4_t)LODWORD(a3);
  int32x4_t v32 = (int32x4_t)v20;
  int32x4_t v33 = (int32x4_t)xmmword_9660;
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  float32x4_t v36 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(_OWORD *)((char *)&v31 + v16))), v18, *(float32x2_t *)&v31.i8[v16], 1), v19, *(float32x4_t *)((char *)&v31 + v16), 2);
    v16 += 16;
  }
  while (v16 != 48);
  uint64_t v21 = 0;
  float32x4_t v22 = v34;
  float32x4_t v23 = v35;
  v24.i64[0] = 1065353216;
  v24.u64[1] = (unint64_t)vmla_f32((float32x2_t)LODWORD(a5), (float32x2_t)0xBF000000BF000000, a1);
  float32x4_t v25 = v36;
  *(int32x2_t *)v19.f32 = vdup_lane_s32((int32x2_t)v24.u64[1], 1);
  int32x4_t v31 = (int32x4_t)COERCE_UNSIGNED_INT(1.0);
  int32x4_t v32 = (int32x4_t)xmmword_9670;
  int32x4_t v33 = vzip1q_s32(vzip2q_s32(v24, v30), (int32x4_t)v19);
  float32x4_t v34 = 0u;
  float32x4_t v35 = 0u;
  float32x4_t v36 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v34 + v21) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(_OWORD *)((char *)&v31 + v21))), v23, *(float32x2_t *)&v31.i8[v21], 1), v25, *(float32x4_t *)((char *)&v31 + v21), 2);
    v21 += 16;
  }
  while (v21 != 48);
  return *(double *)v34.i64;
}

- (BOOL)prepareForTime:(double)a3
{
  renderSemaphore = self->_renderSemaphore;
  dispatch_time_t v5 = dispatch_time(0, 33333333);
  intptr_t v6 = dispatch_semaphore_wait(renderSemaphore, v5);
  if (!v6)
  {
    float v7 = self->_tritiumProgress * self->_motionSuppression;
    float currentMotionAmount = self->_currentMotionAmount;
    if (currentMotionAmount <= v7) {
      float v7 = v7 * 0.02 + currentMotionAmount * 0.98;
    }
    self->_float currentMotionAmount = v7;
    double v9 = CACurrentMediaTime();
    float32x2_t v10 = (float32x2_t)[(NTKLilypadQuad *)self noiseConfigForPosition:0.000371093919 atTime:v9 + 0.0];
    float v12 = v11;
    float32x2_t v13 = (float32x2_t)[(NTKLilypadQuad *)self noiseConfigForPosition:0.000000195503304 atTime:v9 + -1.0];
    float v15 = v14;
    float32x2_t v16 = vmul_f32(*(float32x2_t *)self->_motionForce, (float32x2_t)vdup_n_s32(0x42960000u));
    float32x2_t v17 = vmul_f32(v16, v16);
    v17.f32[0] = sqrtf(vaddv_f32(v17));
    if (v17.f32[0] > 5.0 && v17.f32[0] > 0.0)
    {
      __asm { FMOV            V2.2S, #5.0 }
      float32x2_t v16 = vmul_f32(vdiv_f32(v16, (float32x2_t)vdup_lane_s32((int32x2_t)v17, 0)), _D2);
    }
    float32x2_t v21 = (float32x2_t)vdup_n_s32(0x3EAA7EFAu);
    float32x2_t v38 = vmul_f32(v13, v21);
    float32x2_t v39 = vmul_f32(v10, v21);
    [(PKPhysicsBody *)self->_minuteBody position];
    v23.f64[1] = v22;
    __asm { FMOV            V14.2S, #17.0 }
    float32x2_t v37 = vmul_f32(vadd_f32(vcvt_f32_f64(v23), (float32x2_t)0xBE8A3D71BEE66666), _D14);
    [(PKPhysicsBody *)self->_hourBody position];
    *(void *)&v26.f64[1] = v27.i64[0];
    *(float32x2_t *)&v26.f64[0] = vadd_f32(vcvt_f32_f64(v26), (float32x2_t)0xBF3851ECBF0CCCCDLL);
    float32x2_t v25 = vmul_f32(*(float32x2_t *)&v26.f64[0], _D14);
    *(float *)v26.f64 = self->_motionTorque * -0.00001;
    v27.i32[1] = 0;
    _VF = fabsf(*(float *)v26.f64) <= 6.0 || *(float *)v26.f64 == 0.0;
    v27.i32[0] = 1.0;
    v30.i64[0] = 0x8000000080000000;
    v30.i64[1] = 0x8000000080000000;
    *(float *)v27.i32 = *(float *)vbslq_s8(v30, v27, (int8x16_t)v26).i32 * 6.0;
    if (_VF) {
      float v31 = self->_motionTorque * -0.00001;
    }
    else {
      float v31 = *(float *)v27.i32;
    }
    [(PKPhysicsBody *)self->_minuteBody rotation];
    float v33 = (v32 + 0.17453292) * -0.0000999999975;
    [(PKPhysicsBody *)self->_hourBody rotation];
    *(float *)&double v34 = (v34 + 0.17453292) * -0.0000999999975;
    float v35 = (float)((float)(v12 * 0.00001) + v31) + *(float *)&v34;
    [(PKPhysicsBody *)self->_minuteBody applyForce:vcvtq_f64_f32(vsub_f32(vadd_f32(v38, v16), v37))];
    [(PKPhysicsBody *)self->_minuteBody applyTorque:(float)((float)((float)(v15 * 0.00001) + v31) + v33)];
    [(PKPhysicsBody *)self->_hourBody applyForce:vcvtq_f64_f32(vsub_f32(vadd_f32(v39, v16), v25))];
    [(PKPhysicsBody *)self->_hourBody applyTorque:v35];
    [(PKPhysicsWorld *)self->_world stepWithTime:1 velocityIterations:1 positionIterations:0.0166666667];
  }
  return v6 == 0;
}

- (void)renderTimeToRenderEncoder:(id)a3
{
  id v4 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_66A0;
  v12[3] = &unk_C4F8;
  v12[4] = self;
  dispatch_time_t v5 = objc_retainBlock(v12);
  [v4 setRenderPipelineState:self->_timeRenderPipelineState];
  [v4 setFragmentTexture:self->_digitsTex atIndex:0];
  int fromHour = self->_time.fromHour;
  int fromMinute = self->_time.fromMinute;
  int v14 = fromMinute % 10;
  int v15 = fromMinute / 10;
  int v16 = fromHour % 10;
  int v17 = fromHour / 10;
  ((void (*)(void *, unsigned char *, int *, float))v5[2])(v5, v13, &v14, 1.0 - self->_time.fraction);
  if (self->_is24hour | v17) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 3;
  }
  [v4 setVertexBytes:v13 length:384 atIndex:0];
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4 instanceCount:v8];
  if (self->_time.fraction != 0.0)
  {
    int toHour = self->_time.toHour;
    int toMinute = self->_time.toMinute;
    int v14 = toMinute % 10;
    int v15 = toMinute / 10;
    int v16 = toHour % 10;
    int v17 = toHour / 10;
    ((void (*)(void *, unsigned char *, int *))v5[2])(v5, v13, &v14);
    if (self->_is24hour | v17) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 3;
    }
    [v4 setVertexBytes:v13 length:384 atIndex:0];
    [v4 drawPrimitives:4 vertexStart:0 vertexCount:4 instanceCount:v11];
  }
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  id v4 = a3;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_6DA4;
  v46[3] = &unk_C520;
  v46[4] = self;
  [v4 addCompletedHandler:v46];
  id blitDigits = (void (**)(id, id))self->_blitDigits;
  if (blitDigits)
  {
    blitDigits[2](blitDigits, v4);
    uint64_t v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    digitsTeCGFloat x = self->_digitsTex;
    self->_digitsTeCGFloat x = v8;

    id v10 = self->_blitDigits;
    self->_id blitDigits = 0;
  }
  id blitFunction = (void (**)(id, id))self->_blitFunction;
  if (blitFunction)
  {
    blitFunction[2](blitFunction, v4);
    float v12 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    functionTeCGFloat x = self->_functionTex;
    self->_functionTeCGFloat x = v12;

    id v14 = self->_blitFunction;
    self->_id blitFunction = 0;
  }
  id blitNoise = (void (**)(id, id))self->_blitNoise;
  if (blitNoise)
  {
    blitNoise[2](blitNoise, v4);
    int v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    noiseTeCGFloat x = self->_noiseTex;
    self->_noiseTeCGFloat x = v16;

    id v18 = self->_blitNoise;
    self->_id blitNoise = 0;
  }
  LOWORD(v5) = self->_screenWidth;
  *(float *)&uint64_t v19 = (float)v5;
  LOWORD(v5) = self->_screenHeight;
  *((float *)&v19 + 1) = (float)v5;
  unint64_t v20 = self->_timeBuffer[self->_currentBufferIndex];
  float32x2_t v21 = [(MTLRenderPassDescriptor *)self->_timePassDescriptor colorAttachments];
  float64_t v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setTexture:v20];

  float64x2_t v23 = [v4 renderCommandEncoderWithDescriptor:self->_timePassDescriptor];
  [(NTKLilypadQuad *)self renderTimeToRenderEncoder:v23];
  [v23 endEncoding];
  unint64_t v24 = sub_4BE4(self->_device);
  int v25 = v24;
  uint64_t v27 = v26;
  unint64_t v28 = HIDWORD(v24);
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  CFTimeInterval v29 = CACurrentMediaTime();
  uint64_t v30 = 0;
  *(float *)&CFTimeInterval v29 = v29 - self->_startTime;
  LODWORD(v43) = LODWORD(v29);
  *((void *)&v43 + 1) = v38;
  LOWORD(v44) = v28;
  BYTE2(v44) = v25;
  float tritiumProgress = self->_tritiumProgress;
  *((float *)&v44 + 1) = (float)(int)v27;
  *((float *)&v44 + 2) = (float)SHIDWORD(v27);
  *(float *)&CFTimeInterval v29 = self->_colorMode;
  *((float *)&v44 + 3) = tritiumProgress;
  LODWORD(v45) = LODWORD(v29);
  uint64_t motionSuppression_low = LODWORD(self->_motionSuppression);
  uint64_t v33 = 192;
  memset(v42, 0, sizeof(v42));
  do
  {
    *((float *)v42 + v30) = self->_vibrations.vibrations[v30] * *(float *)&motionSuppression_low;
    double v34 = (void *)((char *)v42 + v33);
    *(v34 - 16) = *(void *)&self->_noiseOrigins[8 * v30];
    void *v34 = *(void *)&self->_noiseDirections[8 * v30++];
    v33 += 8;
  }
  while (v30 != 16);
  float v35 = [v4 computeCommandEncoder];
  [v35 setComputePipelineState:self->_strandsComputePipelineState];
  [v35 setTexture:self->_timeBuffer[self->_currentBufferIndex] atIndex:0];
  [v35 setTexture:self->_functionTex atIndex:1];
  [v35 setTexture:self->_noiseTex atIndex:2];
  [v35 setBytes:&v43 length:40 atIndex:0];
  [v35 setBuffer:self->_strandBuffer[self->_currentBufferIndex] offset:0 atIndex:2];
  [v35 setBytes:v42 length:320 atIndex:1];
  unint64_t v36 = (unint64_t)[(MTLComputePipelineState *)self->_strandsComputePipelineState threadExecutionWidth];
  unint64_t v37 = (unint64_t)[(MTLComputePipelineState *)self->_strandsComputePipelineState maxTotalThreadsPerThreadgroup];
  v39[2] = 1;
  unint64_t v40 = (v36 + v25 * (int)v28 - 1) / v36;
  int64x2_t v41 = vdupq_n_s64(1uLL);
  v39[0] = v36;
  v39[1] = v37 / v36;
  [v35 dispatchThreadgroups:&v40 threadsPerThreadgroup:v39];
  [v35 endEncoding];
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  LOWORD(v3) = self->_screenWidth;
  *(float *)&uint64_t v5 = (float)v3;
  LOWORD(v3) = self->_screenHeight;
  *((float *)&v5 + 1) = (float)v3;
  uint64_t v13 = v5;
  device = self->_device;
  id v7 = a3;
  unint64_t v8 = sub_4BE4(device);
  LODWORD(device) = v8;
  unint64_t v9 = HIDWORD(v8);
  v14[0] = 0;
  long long v15 = 0u;
  *(void *)int v16 = 0;
  v14[1] = v13;
  LOWORD(v15) = WORD2(v8);
  BYTE2(v15) = v8;
  *((float *)&v15 + 1) = (float)v10;
  *((float *)&v15 + 2) = (float)v11;
  float colorMode = self->_colorMode;
  HIDWORD(v15) = LODWORD(self->_tritiumProgress);
  v16[0] = colorMode;
  [v7 setRenderPipelineState:self->_strandsRenderPipelineState];
  [v7 setVertexBytes:v14 length:40 atIndex:0];
  [v7 setVertexBuffer:self->_lightColors offset:0 atIndex:1];
  [v7 setVertexBuffer:self->_darkColors offset:0 atIndex:2];
  [v7 setVertexBuffer:self->_strandBuffer[self->_currentBufferIndex] offset:0 atIndex:3];
  [v7 drawPrimitives:4 vertexStart:0 vertexCount:2 * (int)v9 instanceCount:(int)device];

  self->_currentBufferIndeCGFloat x = (self->_currentBufferIndex + 1) % 3;
}

- (BOOL)is24hour
{
  return self->_is24hour;
}

- (void)setIs24hour:(BOOL)a3
{
  self->_is24hour = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourBody, 0);
  objc_storeStrong((id *)&self->_minuteBody, 0);
  objc_storeStrong((id *)&self->_world, 0);
  objc_storeStrong((id *)&self->_noiseTex, 0);
  objc_storeStrong(&self->_blitNoise, 0);
  objc_storeStrong((id *)&self->_functionTex, 0);
  objc_storeStrong(&self->_blitFunction, 0);
  objc_storeStrong((id *)&self->_digitsTex, 0);
  objc_storeStrong(&self->_blitDigits, 0);
  objc_storeStrong((id *)&self->_darkColors, 0);
  objc_storeStrong((id *)&self->_lightColors, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_strandBuffer[i], 0);
  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_timeBuffer[j], 0);
  objc_storeStrong((id *)&self->_renderSemaphore, 0);
  objc_storeStrong((id *)&self->_strandsRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_strandsComputePipelineState, 0);
  objc_storeStrong((id *)&self->_timeRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_timePassDescriptor, 0);
  objc_storeStrong((id *)&self->_mtlDevice, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
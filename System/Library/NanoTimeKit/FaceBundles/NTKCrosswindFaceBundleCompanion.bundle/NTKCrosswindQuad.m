@interface NTKCrosswindQuad
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_colorCompositionForDate:(id)a3;
- (BOOL)isAnimatingOverrideDate;
- (BOOL)prepareForTime:(double)a3;
- (NSCalendar)calendar;
- (NSDate)overrideDate;
- (NSDate)tritiumOverrideDate;
- (NTKCrosswindQuad)initWithScreenScale:(double)a3 calendar:(id)a4;
- (NTKCrosswindQuadDelegate)delegate;
- (UIColor)hourHandInlayColor;
- (UIColor)minuteHandDotColor;
- (UIColor)minuteHandInlayColor;
- (double)innerCircleRadius;
- (double)middleCircleRadius;
- (double)outerCircleRadius;
- (double)tritiumProgress;
- (id)_createRenderPipelineWithPixelFormat:(unint64_t)a3;
- (id)_createVertexBuffer;
- (id)_handContentColorAtIndex:(unint64_t)a3 colors:(id *)a4;
- (void)_prepareUniformsForRendering:(id *)a3 withResult:(id *)a4;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setAnimatingOverrideDate:(BOOL)a3;
- (void)setBaseLayerBackgroundColor:(id)a3 baseLayerForegroundColor:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFromColor:(id)a3 midColor:(id)a4 toColor:(id)a5 forGradientIndex:(unint64_t)a6;
- (void)setHandInlayColor:(id)a3 forGradientIndex:(unint64_t)a4;
- (void)setInnerCircleRadius:(double)a3;
- (void)setMiddleCircleRadius:(double)a3;
- (void)setOuterCircleRadius:(double)a3;
- (void)setOutermostFromColor:(id)a3 midColor:(id)a4 toColor:(id)a5 forGradientIndex:(unint64_t)a6;
- (void)setOverrideDate:(id)a3 overrideComposition:(id)a4 duration:(double)a5;
- (void)setTritiumOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6;
- (void)setTritiumProgress:(double)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKCrosswindQuad

- (NTKCrosswindQuad)initWithScreenScale:(double)a3 calendar:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NTKCrosswindQuad;
  v8 = [(NTKCrosswindQuad *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_calendar, a4);
    v9->_screenScale = a3;
    uint64_t v10 = +[CLKUIMetalResourceManager sharedDevice];
    device = v9->_device;
    v9->_device = (MTLDevice *)v10;

    v12 = v9->_device;
    if (qword_16F18 != -1) {
      dispatch_once(&qword_16F18, &stru_104D8);
    }
    id v13 = (id)qword_16F10;
    v14 = (MTLLibrary *)[(MTLDevice *)v12 newDefaultLibraryWithBundle:v13 error:0];
    library = v9->_library;
    v9->_library = v14;

    uint64_t v16 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    overrideDateMediaTimingFunction = v9->_overrideDateMediaTimingFunction;
    v9->_overrideDateMediaTimingFunction = (CAMediaTimingFunction *)v16;

    v18 = [[NTKCrosswindColorSequencer alloc] initWithCalendar:v7 gradientCount:4];
    colorSequencer = v9->_colorSequencer;
    v9->_colorSequencer = (NTKCrosswindColorSequencing *)v18;
  }
  return v9;
}

- (void)setTritiumProgress:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_tritiumProgress = a3;
    self->_renderedTritiumProgressNeedsUpdate = 1;
  }
}

- (UIColor)hourHandInlayColor
{
  return (UIColor *)[(NTKCrosswindQuad *)self _handContentColorAtIndex:0 colors:self->_handInlayColors];
}

- (UIColor)minuteHandInlayColor
{
  return (UIColor *)[(NTKCrosswindQuad *)self _handContentColorAtIndex:1 colors:self->_handInlayColors];
}

- (UIColor)minuteHandDotColor
{
  return (UIColor *)[(NTKCrosswindQuad *)self _handContentColorAtIndex:2 colors:self->_handDotColors];
}

- (void)setBaseLayerBackgroundColor:(id)a3 baseLayerForegroundColor:(id)a4
{
  id v5 = a4;
  CLKUIConvertToRGBfFromUIColor();
  *(_OWORD *)self->_baseLayerBackgroundColor = v6;
  CLKUIConvertToRGBfFromUIColor();
  long long v8 = v7;

  *(_OWORD *)self->_baseLayerForegroundColor = v8;
}

- (void)setFromColor:(id)a3 midColor:(id)a4 toColor:(id)a5 forGradientIndex:(unint64_t)a6
{
  v9 = (UIColor *)a5;
  id v10 = a4;
  CLKUIConvertToRGBfFromUIColor();
  long long v17 = v11;
  CLKUIConvertToRGBfFromUIColor();
  long long v16 = v12;

  CLKUIConvertToRGBfFromUIColor();
  id v13 = &self->_anon_e0[48 * a6];
  *(_OWORD *)id v13 = v17;
  *((_OWORD *)v13 + 1) = v16;
  *((_OWORD *)v13 + 2) = v14;
  self->_renderedGradientsNeedUpdate = 1;
  v15 = self->_handDotColors[a6];
  self->_handDotColors[a6] = v9;

  self->_renderedHandContentColorsNeedUpdate = 1;
}

- (void)setOutermostFromColor:(id)a3 midColor:(id)a4 toColor:(id)a5 forGradientIndex:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  CLKUIConvertToRGBfFromUIColor();
  long long v17 = v11;
  CLKUIConvertToRGBfFromUIColor();
  long long v16 = v12;

  CLKUIConvertToRGBfFromUIColor();
  long long v15 = v13;

  long long v14 = &self->_anon_1a0[48 * a6];
  *(_OWORD *)long long v14 = v17;
  *((_OWORD *)v14 + 1) = v16;
  *((_OWORD *)v14 + 2) = v15;
}

- (void)setHandInlayColor:(id)a3 forGradientIndex:(unint64_t)a4
{
  self->_renderedHandContentColorsNeedUpdate = 1;
}

- (void)setOverrideDate:(id)a3 overrideComposition:(id)a4 duration:(double)a5
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v10 = a3;
  p_overrideDate = &self->_overrideDate;
  if ((NTKEqualObjects() & 1) == 0)
  {
    if (a5 > 0.0 && !self->_hasEverPreparedForRendering)
    {
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
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v56 = 0u;
      long long v55 = 0u;
      [(NTKCrosswindQuad *)self _prepareUniformsForRendering:&v55 withResult:0];
    }
    uint64_t v13 = +[NTKDate faceDate];
    long long v14 = (void *)v13;
    long long v15 = *p_overrideDate;
    if (!*p_overrideDate) {
      long long v15 = (void *)v13;
    }
    id v16 = v15;
    if (v10)
    {
      id v17 = v10;
    }
    else
    {
      id v17 = [v14 dateByAddingTimeInterval:a5];
    }
    v18 = v17;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    self->_overrideComposition.innerSecondGradientIndex = var0;
    self->_overrideComposition.outerSecondGradientIndex = var1;
    double v19 = CACurrentMediaTime();
    self->_startOverrideTime = v19;
    self->_endOverrideTime = v19 + a5;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v52 = 0;
    NTKHourMinuteSecondAnglesForTime();
    *(__n128 *)self->_startOverrideAngles = NTKCrosswindHourMinuteSecondAnglesToPolarAngles();
    NTKHourMinuteSecondAnglesForTime();
    endOverrideAngles = self->_endOverrideAngles;
    *(__n128 *)self->_endOverrideAngles = NTKCrosswindHourMinuteSecondAnglesToPolarAngles();
    *(void *)self->_fullTurnAngleCrossings = 0;
    if (a5 <= 0.0)
    {
      *(_OWORD *)self->_transitionContext.transitionInnerGradientIndicies = 0u;
      *(_OWORD *)&self->_transitionContext.transitionOuterGradientIndicies[1] = 0u;
      *(_OWORD *)&self->_anon_344[12] = 0u;
      *(_OWORD *)&self->_anon_344[28] = 0u;
      *(_OWORD *)&self->_anon_344[44] = 0u;
      *(_OWORD *)&self->_anon_344[60] = 0u;
      *(void *)&self->_anon_344[76] = 0;
    }
    else
    {
      long long v87 = *(_OWORD *)self->_renderedGradientIndiciesForHandContentColors;
      uint64_t v21 = *(void *)self->_renderedInnerSectorsConfiguration.gradientIndicies;
      unint64_t v88 = self->_renderedGradientIndiciesForHandContentColors[2];
      uint64_t v89 = v21;
      unsigned int v90 = self->_renderedInnerSectorsConfiguration.gradientIndicies[2];
      uint64_t v39 = *(void *)self->_renderedOuterSectorsConfiguration.gradientIndicies;
      int v22 = NTKCrosswindPolarFullTurnAngleCrossingAlongShortestPathBetweenAngles();
      unsigned __int32 v23 = NTKCrosswindPolarFullTurnAngleCrossingAlongShortestPathBetweenAngles() + v22;
      v26.n128_u32[0] = NTKCrosswindPolarFullTurnAngleCrossingAlongShortestPathBetweenAngles() + v23;
      v26.n128_u32[1] = v23;
      unint64_t v38 = v26.n128_u64[0];
      *(void *)&long long v58 = 0;
      v26.n128_u32[3] = 0;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v55 = 0u;
      uint64_t v51 = 0;
      memset(v50, 0, sizeof(v50));
      long long v49 = 0u;
      __n128 v24 = *(__n128 *)endOverrideAngles;
      LODWORD(v25) = HIDWORD(*(void *)endOverrideAngles);
      v26.n128_u64[0] = *(void *)&self->_endOverrideAngles[8];
      __n128 v41 = *(__n128 *)endOverrideAngles;
      if (COERCE_FLOAT(*(_OWORD *)endOverrideAngles) >= v25)
      {
        int v28 = 2;
        if (v25 >= v26.n128_f32[0])
        {
          int v29 = 0;
          int v27 = 1;
        }
        else
        {
          int v27 = 0;
          if (v24.n128_f32[0] >= v26.n128_f32[0]) {
            int v29 = 1;
          }
          else {
            int v29 = 2;
          }
          if (v24.n128_f32[0] < v26.n128_f32[0]) {
            int v28 = 1;
          }
          else {
            int v28 = 2;
          }
        }
      }
      else
      {
        int v27 = 2;
        if (v24.n128_f32[0] >= v26.n128_f32[0])
        {
          int v29 = 0;
          int v28 = 1;
        }
        else
        {
          int v28 = 0;
          if (v25 >= v26.n128_f32[0]) {
            int v29 = 1;
          }
          else {
            int v29 = 2;
          }
          if (v25 < v26.n128_f32[0]) {
            int v27 = 1;
          }
          else {
            int v27 = 2;
          }
        }
      }
      v26.n128_u64[0] = __PAIR64__(v27, v28);
      v26.n128_u32[2] = v29;
      __n128 v40 = v26;
      id v30 = [(NTKCrosswindQuad *)self _colorCompositionForDate:v18];
      v32 = v31;
      __int16 v47 = 0;
      int v46 = 0;
      unint64_t v48 = 0;
      uint64_t v43 = -1;
      id v44 = v30;
      __int16 v45 = 0;
      NTKCrosswindBuildSectorsConfiguration(&v55, (uint64_t)&v43, &v48, v41, v40);
      __int16 v47 = 0;
      int v46 = 0;
      unint64_t v42 = 0;
      uint64_t v43 = -1;
      id v44 = v32;
      __int16 v45 = 1;
      NTKCrosswindBuildSectorsConfiguration(&v49, (uint64_t)&v43, &v42, v41, v40);
      v40.n128_u64[0] = __PAIR64__(v42, v48);
      unsigned __int32 v37 = NTKCrosswindGetAngleIndiciesFromSectorsConfiguration(&v55).n128_u32[0];
      __n128 AngleIndiciesFromSectorsConfiguration = NTKCrosswindGetAngleIndiciesFromSectorsConfiguration(&v49);
      uint64_t v34 = *((unsigned int *)&v55 + (int)v37 + 4);
      uint64_t v35 = *((unsigned int *)v50 + AngleIndiciesFromSectorsConfiguration.n128_i32[1]);
      uint64_t v36 = *((unsigned int *)v50 + AngleIndiciesFromSectorsConfiguration.n128_i32[2]);
      *(void *)self->_transitionContext.transitionInnerGradientIndicies = v89;
      self->_transitionContext.transitionInnerGradientIndicies[2] = v90;
      *(void *)self->_transitionContext.transitionOuterGradientIndicies = v39;
      *(_DWORD *)self->_anon_344 = 0;
      *(void *)&self->_anon_344[4] = v38;
      *(_OWORD *)&self->_anon_344[12] = v87;
      *(void *)&self->_anon_344[28] = v88;
      *(void *)&self->_anon_344[36] = v34;
      *(void *)&self->_anon_344[44] = v35;
      *(void *)&self->_anon_344[52] = v36;
      *(void *)&self->_anon_344[60] = v30;
      *(void *)&self->_anon_344[68] = v32;
      *(void *)&self->_anon_344[76] = v40.n128_u64[0];
    }
  }
}

- (void)setTritiumOverrideDate:(id)a3 hourRadians:(double)a4 minuteRadians:(double)a5 secondRadians:(double)a6
{
  id v8 = a3;
  if (v8)
  {
    __n128 v9 = NTKCrosswindHourMinuteSecondAnglesToPolarAngles();
    *(__n128 *)self->_startOverrideAngles = v9;
    *(__n128 *)self->_endOverrideAngles = v9;
    if ((NTKEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)&self->_tritiumOverrideDate, a3);
      double v10 = CACurrentMediaTime();
      self->_startOverrideTime = v10;
      self->_endOverrideTime = v10;
      id v11 = [(NTKCrosswindColorSequencing *)self->_colorSequencer colorCompositionForDate:v8];
      unint64_t v13 = v12;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v35 = 0;
      NTKHourMinuteSecondAnglesForTime();
      __n128 v14 = NTKCrosswindHourMinuteSecondAnglesToPolarAngles();
      if (v14.n128_f32[0] >= v14.n128_f32[1])
      {
        int v17 = 2;
        if (v14.n128_f32[1] >= v14.n128_f32[2])
        {
          unsigned __int32 v18 = 0;
          int v16 = 1;
        }
        else
        {
          int v16 = 0;
          if (v14.n128_f32[0] >= v14.n128_f32[2]) {
            unsigned __int32 v18 = 1;
          }
          else {
            unsigned __int32 v18 = 2;
          }
          if (v14.n128_f32[0] < v14.n128_f32[2]) {
            int v17 = 1;
          }
          else {
            int v17 = 2;
          }
        }
      }
      else
      {
        int v16 = 2;
        if (v14.n128_f32[0] >= v14.n128_f32[2])
        {
          unsigned __int32 v18 = 0;
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
          if (v14.n128_f32[1] >= v14.n128_f32[2]) {
            unsigned __int32 v18 = 1;
          }
          else {
            unsigned __int32 v18 = 2;
          }
          if (v14.n128_f32[1] < v14.n128_f32[2]) {
            int v16 = 1;
          }
          else {
            int v16 = 2;
          }
        }
      }
      v15.n128_u64[0] = __PAIR64__(v16, v17);
      v15.n128_u32[2] = v18;
      __n128 v22 = v15;
      unint64_t v20 = v18;
      uint64_t v34 = 0;
      memset(v33, 0, sizeof(v33));
      long long v32 = 0u;
      uint64_t v31 = 0;
      memset(v30, 0, sizeof(v30));
      long long v29 = 0u;
      __int16 v28 = 0;
      int v27 = 0;
      uint64_t v24 = -1;
      unint64_t v25 = (unint64_t)v11;
      __int16 v26 = 256;
      __n128 v23 = v14;
      NTKCrosswindBuildSectorsConfiguration(&v32, (uint64_t)&v24, 0, v14, v15);
      __int16 v28 = 0;
      int v27 = 0;
      uint64_t v24 = -1;
      unint64_t v25 = v13;
      __int16 v26 = 257;
      NTKCrosswindBuildSectorsConfiguration(&v29, (uint64_t)&v24, 0, v23, v22);
      v22.n128_u32[0] = NTKCrosswindGetAngleIndiciesFromSectorsConfiguration(&v32).n128_u32[0];
      unint64_t v21 = *((unsigned int *)v30 + NTKCrosswindGetAngleIndiciesFromSectorsConfiguration((_DWORD *)&v29).n128_i32[1]);
      self->_tritiumOverrideContext.gradientIndiciesForHandContentColors[0] = *((unsigned int *)v33 + v22.n128_i32[0]);
      self->_tritiumOverrideContext.gradientIndiciesForHandContentColors[1] = v21;
      self->_tritiumOverrideContext.composition.innerSecondGradientIndex = (unint64_t)v11;
      self->_tritiumOverrideContext.composition.outerSecondGradientIndex = v13;
      self->_tritiumOverrideContext.secondAngleIndexForRelativeAngleOrdering = v20;
    }
  }
  else
  {
    tritiumOverrideDate = self->_tritiumOverrideDate;
    self->_tritiumOverrideDate = 0;

    *(_OWORD *)self->_tritiumOverrideContext.gradientIndiciesForHandContentColors = 0u;
    self->_tritiumOverrideContext.composition = 0u;
    self->_tritiumOverrideContext.secondAngleIndexForRelativeAngleOrdering = 0;
  }
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double screenScale = self->_screenScale;
  self->_renderSize.width = v6 * screenScale;
  self->_renderSize.height = v7 * screenScale;
  id v8 = [v4 colorPixelFormat];

  __n128 v9 = [(NTKCrosswindQuad *)self _createRenderPipelineWithPixelFormat:v8];
  renderPipelineState = self->_renderPipelineState;
  self->_renderPipelineState = v9;

  self->_vertexBuffer = [(NTKCrosswindQuad *)self _createVertexBuffer];

  _objc_release_x1();
}

- (BOOL)prepareForTime:(double)a3
{
  return 1;
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  id v4 = a3;
  [v4 setLabel:@"Crosswind Render Encoder"];
  v8[0] = 0;
  v8[1] = 0;
  CGSize renderSize = self->_renderSize;
  long long v10 = xmmword_CA50;
  [v4 setViewport:v8];
  [v4 setRenderPipelineState:self->_renderPipelineState];
  [v4 setCullMode:0];
  bzero(v8, 0x2C0uLL);
  __int16 v7 = 0;
  [(NTKCrosswindQuad *)self _prepareUniformsForRendering:v8 withResult:&v7];
  id v5 = [(MTLDevice *)self->_device newBufferWithBytes:v8 length:704 options:1];
  [v4 setVertexBuffer:self->_vertexBuffer offset:0 atIndex:0];
  [v4 setVertexBuffer:v5 offset:0 atIndex:1];
  [v4 setFragmentBuffer:v5 offset:0 atIndex:0];
  if ((_BYTE)v7)
  {
    double v6 = [(NTKCrosswindQuad *)self delegate];
    [v6 crosswindQuadWillUpdateForegroundColors:self];
  }
  [v4 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [(NTKCrosswindQuad *)self setAnimatingOverrideDate:HIBYTE(v7)];
}

- (void)setAnimatingOverrideDate:(BOOL)a3
{
  if (self->_animatingOverrideDate != a3)
  {
    self->_animatingOverrideDate = a3;
    id v4 = [(NTKCrosswindQuad *)self delegate];
    [v4 crosswindQuadDidUpdateAnimatingOverrideDate:self];
  }
}

- (id)_createRenderPipelineWithPixelFormat:(unint64_t)a3
{
  id v5 = self->_library;
  id v6 = [(MTLLibrary *)v5 newFunctionWithName:@"crosswindVertexShader"];
  id v7 = [(MTLLibrary *)v5 newFunctionWithName:@"crosswindQuadtoneConicFragmentShader"];
  id v8 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v8 setVertexFunction:v6];
  [v8 setFragmentFunction:v7];
  [v8 setLabel:@"Crosswind Render Pipeline"];
  __n128 v9 = [v8 colorAttachments];
  long long v10 = [v9 objectAtIndexedSubscript:0];

  [v10 setPixelFormat:a3];
  [v10 setBlendingEnabled:1];
  [v10 setRgbBlendOperation:0];
  [v10 setAlphaBlendOperation:0];
  [v10 setSourceRGBBlendFactor:4];
  [v10 setSourceAlphaBlendFactor:4];
  [v10 setDestinationRGBBlendFactor:5];
  [v10 setDestinationAlphaBlendFactor:5];
  id v11 = self->_device;
  id v16 = 0;
  id v12 = [(MTLDevice *)v11 newRenderPipelineStateWithDescriptor:v8 error:&v16];
  id v13 = v16;
  if (!v12)
  {
    __n128 v14 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_9DA8((uint64_t)v11, (uint64_t)v13, v14);
    }
  }

  return v12;
}

- (id)_createVertexBuffer
{
  v4[0] = xmmword_CA68;
  v4[1] = unk_CA78;
  id v2 = [(MTLDevice *)self->_device newBufferWithBytes:v4 length:32 options:1];

  return v2;
}

- (id)_handContentColorAtIndex:(unint64_t)a3 colors:(id *)a4
{
  if (self->_renderedTransitionProgress > 0.0)
  {
    id v7 = a4[*(void *)&self->_anon_344[8 * a3 + 12]];
    CLKUIInterpolateBetweenColors();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  id v8 = a4[self->_renderedGradientIndiciesForHandContentColors[a3]];
  if (self->_tritiumProgress > 0.0 && a3 <= 1 && self->_tritiumOverrideDate)
  {
    id v7 = a4[self->_tritiumOverrideContext.gradientIndiciesForHandContentColors[a3]];
    uint64_t v9 = CLKUIInterpolateBetweenColors();

    id v8 = (id)v9;
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_colorCompositionForDate:(id)a3
{
  id v4 = (NSDate *)a3;
  if (self->_overrideDate != v4
    || (id innerSecondGradientIndex = self->_overrideComposition.innerSecondGradientIndex,
        unint64_t outerSecondGradientIndex = self->_overrideComposition.outerSecondGradientIndex,
        NTKCrosswindColorCompositionEqualToComposition((uint64_t)innerSecondGradientIndex, outerSecondGradientIndex, -1, -1)))
  {
    id innerSecondGradientIndex = [(NTKCrosswindColorSequencing *)self->_colorSequencer colorCompositionForDate:v4];
    unint64_t outerSecondGradientIndex = v7;
  }

  unint64_t v8 = (unint64_t)innerSecondGradientIndex;
  unint64_t v9 = outerSecondGradientIndex;
  result.unint64_t var1 = v9;
  result.unint64_t var0 = v8;
  return result;
}

- (void)_prepareUniformsForRendering:(id *)a3 withResult:(id *)a4
{
  self->_hasEverPreparedForRendering = 1;
  __asm { FMOV            V1.2D, #0.5 }
  *(float32x2_t *)&a3->unint64_t var0 = vcvt_f32_f64(vmulq_f64((float64x2_t)self->_renderSize, _Q1));
  _Q1.f64[0] = self->_screenScale;
  float v10 = self->_innerCircleRadius * _Q1.f64[0];
  a3->var2 = v10;
  *(float *)&unsigned int v11 = _Q1.f64[0] * self->_middleCircleRadius;
  a3->var5.unint64_t var0 = v11;
  float v12 = _Q1.f64[0] * self->_outerCircleRadius;
  a3->var5.var1[0] = v12;
  *(_OWORD *)&a3->var5.var2[1] = *(_OWORD *)self->_baseLayerBackgroundColor;
  *(_OWORD *)&a3->var6.var1[1] = *(_OWORD *)self->_baseLayerForegroundColor;
  long long v13 = *(_OWORD *)self->_anon_e0;
  long long v14 = *(_OWORD *)&self->_anon_e0[16];
  long long v15 = *(_OWORD *)&self->_anon_e0[48];
  *(_OWORD *)&a3->var8.var2[2] = *(_OWORD *)&self->_anon_e0[32];
  *(_OWORD *)&a3->var9.var1[2] = v15;
  *(_OWORD *)&a3->var6.var2[2] = v13;
  *(_OWORD *)&a3->var8.var1[1] = v14;
  long long v16 = *(_OWORD *)&self->_anon_e0[64];
  long long v17 = *(_OWORD *)&self->_anon_e0[80];
  long long v18 = *(_OWORD *)&self->_anon_e0[112];
  *(_OWORD *)&a3[1].var2 = *(_OWORD *)&self->_anon_e0[96];
  *(_OWORD *)&a3[1].var5.var1[2] = v18;
  *(_OWORD *)&a3->var10 = v16;
  *(_OWORD *)a3->var12 = v17;
  long long v19 = *(_OWORD *)&self->_anon_e0[128];
  long long v20 = *(_OWORD *)&self->_anon_e0[144];
  long long v21 = *(_OWORD *)&self->_anon_e0[176];
  *(_OWORD *)&a3[1].var8.unint64_t var0 = *(_OWORD *)&self->_anon_e0[160];
  *(_OWORD *)a3[1].var8.var2 = v21;
  *(_OWORD *)&a3[1].var6.unint64_t var0 = v19;
  *(_OWORD *)a3[1].var6.var2 = v20;
  long long v22 = *(_OWORD *)&self->_anon_1a0[48];
  long long v24 = *(_OWORD *)self->_anon_1a0;
  long long v23 = *(_OWORD *)&self->_anon_1a0[16];
  *(_OWORD *)&a3[1].var11[1] = *(_OWORD *)&self->_anon_1a0[32];
  *(_OWORD *)&a3[2].unint64_t var0 = v22;
  *(_OWORD *)a3[1].var9.unint64_t var1 = v24;
  *(_OWORD *)&a3[1].var9.var2[1] = v23;
  long long v25 = *(_OWORD *)&self->_anon_1a0[112];
  long long v27 = *(_OWORD *)&self->_anon_1a0[64];
  long long v26 = *(_OWORD *)&self->_anon_1a0[80];
  *(_OWORD *)&a3[2].var6.var1[1] = *(_OWORD *)&self->_anon_1a0[96];
  *(_OWORD *)&a3[2].var6.var2[2] = v25;
  *(_OWORD *)a3[2].var5.unint64_t var1 = v27;
  *(_OWORD *)&a3[2].var5.var2[1] = v26;
  long long v28 = *(_OWORD *)&self->_anon_1a0[176];
  long long v30 = *(_OWORD *)&self->_anon_1a0[128];
  long long v29 = *(_OWORD *)&self->_anon_1a0[144];
  *(_OWORD *)&a3[2].var9.var1[2] = *(_OWORD *)&self->_anon_1a0[160];
  *(_OWORD *)&a3[2].var10 = v28;
  *(_OWORD *)&a3[2].var8.var1[1] = v30;
  *(_OWORD *)&a3[2].var8.var2[2] = v29;
  BOOL renderedGradientsNeedUpdate = self->_renderedGradientsNeedUpdate;
  self->_BOOL renderedGradientsNeedUpdate = 0;
  LODWORD(v118) = self->_renderedHandContentColorsNeedUpdate;
  HIDWORD(v118) = renderedGradientsNeedUpdate;
  self->_renderedHandContentColorsNeedUpdate = 0;
  long long v32 = [(NTKCrosswindQuad *)self overrideDate];
  v33 = v32;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    id v34 = +[NTKDate faceDate];
  }
  id v35 = v34;

  double v36 = CACurrentMediaTime();
  tritiumOverrideDate = self->_tritiumOverrideDate;
  double endOverrideTime = self->_endOverrideTime;
  v119 = v35;
  if (v36 >= endOverrideTime && *(_OWORD *)&self->_overrideDate == 0)
  {
    NTKHourMinuteSecondAnglesForTime();
    __n128 v45 = NTKCrosswindHourMinuteSecondAnglesToPolarAngles();
    double v125 = v45.n128_f32[1];
    double v126 = v45.n128_f32[0];
    double v124 = v45.n128_f32[2];
LABEL_18:
    id v58 = [(NTKCrosswindQuad *)self _colorCompositionForDate:v35];
    unint64_t v60 = v59;
    int v61 = 0;
    goto LABEL_24;
  }
  double startOverrideTime = self->_startOverrideTime;
  double v40 = endOverrideTime - startOverrideTime;
  if (v40 <= 0.0)
  {
    int v44 = 0;
    double v42 = 1.0;
  }
  else
  {
    double v41 = (v36 - startOverrideTime) / v40;
    double v42 = 1.0;
    if (v41 >= 1.0)
    {
      int v44 = 0;
    }
    else
    {
      *(float *)&double v41 = v41;
      [(CAMediaTimingFunction *)self->_overrideDateMediaTimingFunction _solveForInput:v41];
      double v42 = v43;
      int v44 = 1;
    }
  }
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  CLKWrapRadians();
  double v126 = v46;
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  CLKWrapRadians();
  double v125 = v47;
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  CLKWrapRadians();
  double v124 = v48;
  if (!v44) {
    goto LABEL_18;
  }
  int v49 = NTKCrosswindPolarFullTurnAngleCrossingBetweenAngles();
  int v50 = NTKCrosswindPolarFullTurnAngleCrossingBetweenAngles();
  v51.i32[0] = NTKCrosswindPolarFullTurnAngleCrossingBetweenAngles() + v50 + v49;
  v51.i32[1] = v50 + v49;
  *(int32x2_t *)self->_fullTurnAngleCrossings = vadd_s32(*(int32x2_t *)self->_fullTurnAngleCrossings, v51);
  unint64_t var1 = (void *)a3[4].var8.var1;
  uint64_t v53 = *(void *)self->_transitionContext.transitionInnerGradientIndicies;
  LODWORD(a3[4].var8.var1[2]) = self->_transitionContext.transitionInnerGradientIndicies[2];
  *(void *)a3[4].var8.unint64_t var1 = v53;
  *(void *)a3[4].var8.var2 = *(void *)self->_transitionContext.transitionOuterGradientIndicies;
  uint64_t v54 = *(void *)self->_fullTurnAngleCrossings;
  if (v54)
  {
    uint64_t v55 = 0;
    uint64_t v56 = (int)v54;
    do
    {
      *((_DWORD *)&v127 + NTKCrosswindOffsetIndexWrapped(v55, v56, 3)) = *((_DWORD *)var1 + v55);
      ++v55;
    }
    while (v55 != 3);
    *unint64_t var1 = v127;
    a3[4].var8.var1[2] = *((float *)&v127 + 2);
    int v57 = *(_DWORD *)&self->_fullTurnAngleCrossings[4];
    if (!v57) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  int v57 = HIDWORD(*(void *)self->_fullTurnAngleCrossings);
  if (HIDWORD(v54))
  {
LABEL_20:
    uint64_t v62 = 0;
    var2 = a3[4].var8.var2;
    uint64_t v64 = v57;
    do
    {
      *((_DWORD *)&v127 + NTKCrosswindOffsetIndexWrapped(v62, v64, 2)) = var2[v62];
      ++v62;
    }
    while (v62 != 2);
    *(void *)var2 = v127;
  }
LABEL_23:
  *(float *)&unsigned int v65 = 1.0 - v42;
  a3[4].var8.unint64_t var0 = v65;
  id v58 = *(id *)&self->_anon_344[60];
  unint64_t v60 = *(void *)&self->_anon_344[68];
  int v61 = 1;
LABEL_24:
  unint64_t innerSecondGradientIndex = self->_renderedColorComposition.innerSecondGradientIndex;
  unint64_t outerSecondGradientIndex = self->_renderedColorComposition.outerSecondGradientIndex;
  self->_renderedColorComposition.unint64_t innerSecondGradientIndex = (unint64_t)v58;
  self->_renderedColorComposition.unint64_t outerSecondGradientIndex = v60;
  BOOL v114 = NTKCrosswindColorCompositionEqualToComposition((uint64_t)v58, v60, innerSecondGradientIndex, outerSecondGradientIndex);
  v68.n128_f32[0] = v126;
  float v69 = v125;
  v70.n128_f32[0] = v124;
  __n128 v71 = v68;
  v71.n128_f32[1] = v69;
  if (v68.n128_f32[0] >= v69)
  {
    int v74 = 2;
    if (v69 >= v70.n128_f32[0])
    {
      int v76 = 0;
      int v75 = 1;
    }
    else
    {
      int v75 = 0;
      if (v68.n128_f32[0] >= v70.n128_f32[0]) {
        int v76 = 1;
      }
      else {
        int v76 = 2;
      }
      if (v68.n128_f32[0] < v70.n128_f32[0]) {
        int v74 = 1;
      }
      else {
        int v74 = 2;
      }
    }
  }
  else
  {
    if (v69 < v70.n128_f32[0]) {
      int v72 = 1;
    }
    else {
      int v72 = 2;
    }
    if (v69 >= v70.n128_f32[0]) {
      int v73 = 1;
    }
    else {
      int v73 = 2;
    }
    int v74 = v68.n128_f32[0] >= v70.n128_f32[0];
    if (v68.n128_f32[0] < v70.n128_f32[0]) {
      int v75 = v72;
    }
    else {
      int v75 = 2;
    }
    if (v68.n128_f32[0] < v70.n128_f32[0]) {
      int v76 = v73;
    }
    else {
      int v76 = 0;
    }
  }
  v71.n128_f32[2] = v124;
  v70.n128_u64[0] = __PAIR64__(v75, v74);
  v70.n128_u32[2] = v76;
  __n128 v121 = v70;
  float v115 = v126;
  float v112 = v125;
  if (v61)
  {
    uint64_t v77 = *(void *)&self->_anon_344[76];
    uint64_t v78 = v77;
    uint64_t v79 = HIDWORD(v77);
  }
  else
  {
    uint64_t v78 = -1;
    uint64_t v79 = -1;
  }
  uint64_t v128 = 0;
  *(void *)&long long v127 = v78;
  *((void *)&v127 + 1) = v58;
  __n128 v123 = v71;
  NTKCrosswindBuildSectorsConfiguration(a3[2].var12, (uint64_t)&v127, 0, v71, v121);
  uint64_t v128 = 1;
  *(void *)&long long v127 = v79;
  *((void *)&v127 + 1) = v60;
  NTKCrosswindBuildSectorsConfiguration(&a3[3].var6.var1[1], (uint64_t)&v127, 0, v123, v121);
  if (v61)
  {
    sub_871C(&a3[3].var2, a3[2].var12[0], (int)(*(void *)self->_fullTurnAngleCrossings - *(void *)&self->_anon_344[4]));
    sub_871C(&a3[3].var6.var2[2], LODWORD(a3[3].var6.var1[1]), *(int *)&self->_fullTurnAngleCrossings[4] - (uint64_t)*(int *)&self->_anon_344[8]);
  }
  double tritiumProgress = self->_tritiumProgress;
  if (tritiumProgress > 0.0)
  {
    __n128 v81 = v123;
    if (tritiumOverrideDate)
    {
      id v58 = self->_tritiumOverrideContext.composition.innerSecondGradientIndex;
      unint64_t v60 = self->_tritiumOverrideContext.composition.outerSecondGradientIndex;
      unint64_t secondAngleIndexForRelativeAngleOrdering = self->_tritiumOverrideContext.secondAngleIndexForRelativeAngleOrdering;
      LODWORD(v127) = 0;
      if (v115 >= v112) {
        float v83 = v125;
      }
      else {
        float v83 = v126;
      }
      if (v115 >= v112) {
        float v84 = v126;
      }
      else {
        float v84 = v125;
      }
      *(void *)((char *)&v127 + 4) = __PAIR64__(LODWORD(v84), LODWORD(v83));
      HIDWORD(v127) = 1086918619;
      float v85 = (float)(*((float *)&v127 + secondAngleIndexForRelativeAngleOrdering)
                  + *((float *)&v127 + secondAngleIndexForRelativeAngleOrdering + 1))
          * 0.5;
      v86.n128_u32[3] = v123.n128_u32[3];
      v81.n128_u64[0] = v123.n128_u64[0];
      v81.n128_f32[2] = v85;
      v81.n128_u32[3] = v123.n128_u32[3];
      if (v115 >= v112)
      {
        if (v85 > v115) {
          int v92 = 1;
        }
        else {
          int v92 = 2;
        }
        if (v85 <= v115) {
          int v88 = 1;
        }
        else {
          int v88 = 2;
        }
        BOOL v89 = v85 <= v112;
        if (v85 > v112) {
          int v90 = v92;
        }
        else {
          int v90 = 2;
        }
        int v91 = v85 <= v112;
      }
      else
      {
        if (v85 > v112) {
          int v87 = 1;
        }
        else {
          int v87 = 2;
        }
        if (v85 <= v112) {
          int v88 = 1;
        }
        else {
          int v88 = 2;
        }
        BOOL v89 = v85 <= v115;
        int v90 = v85 <= v115;
        if (v85 > v115) {
          int v91 = v87;
        }
        else {
          int v91 = 2;
        }
      }
      if (v89) {
        int v93 = 0;
      }
      else {
        int v93 = v88;
      }
      v86.n128_u64[0] = __PAIR64__(v91, v90);
      v86.n128_u32[2] = v93;
      __n128 v121 = v86;
    }
    __n128 v116 = v81;
    uint64_t v128 = 256;
    *(void *)&long long v127 = -1;
    *((void *)&v127 + 1) = v58;
    NTKCrosswindBuildSectorsConfiguration(&a3[3].var9.var1[2], (uint64_t)&v127, 0, v81, v121);
    uint64_t v128 = 257;
    *(void *)&long long v127 = -1;
    *((void *)&v127 + 1) = v60;
    NTKCrosswindBuildSectorsConfiguration(a3[4].var5.var1, (uint64_t)&v127, 0, v116, v121);
  }
  BOOL v117 = v61;
  v113 = tritiumOverrideDate;
  BOOL renderedTritiumProgressNeedsUpdate = self->_renderedTritiumProgressNeedsUpdate;
  self->_BOOL renderedTritiumProgressNeedsUpdate = 0;
  float v94 = tritiumProgress;
  a3[3].var9.var1[0] = v94;
  signed __int32 v122 = NTKCrosswindGetAngleIndiciesFromSectorsConfiguration(a3[2].var12).n128_u32[0];
  __n128 AngleIndiciesFromSectorsConfiguration = NTKCrosswindGetAngleIndiciesFromSectorsConfiguration(&a3[3].var6.var1[1]);
  uint64_t v96 = *((unsigned int *)&a3[3].var2 + v122);
  uint64_t v97 = a3[3].var6.var2[AngleIndiciesFromSectorsConfiguration.n128_i32[1] + 2];
  *(void *)&long long v127 = v96;
  *((void *)&v127 + 1) = v97;
  unint64_t v98 = a3[3].var6.var2[AngleIndiciesFromSectorsConfiguration.n128_i32[2] + 2];
  unint64_t v99 = self->_renderedGradientIndiciesForHandContentColors[0];
  unint64_t v100 = self->_renderedGradientIndiciesForHandContentColors[1];
  unint64_t v101 = self->_renderedGradientIndiciesForHandContentColors[2];
  self->_renderedGradientIndiciesForHandContentColors[2] = v98;
  *(_OWORD *)self->_renderedGradientIndiciesForHandContentColors = v127;
  *(__n128 *)self->_renderedAngles = v123;
  long long v103 = *(_OWORD *)&a3[3].var2;
  long long v102 = *(_OWORD *)&a3[3].var5.var1[2];
  long long v104 = *(_OWORD *)a3[2].var12;
  *(void *)&self->_anon_28c[20] = *(void *)&a3[3].var6.var0;
  *(_OWORD *)self->_renderedInnerSectorsConfiguration.gradientIndicies = v103;
  *(_OWORD *)&self->_anon_28c[4] = v102;
  *(_OWORD *)&self->_renderedInnerSectorsConfiguration.angleCount = v104;
  long long v106 = *(_OWORD *)&a3[3].var6.var2[2];
  long long v105 = *(_OWORD *)&a3[3].var8.var1[1];
  long long v107 = *(_OWORD *)&a3[3].var6.var1[1];
  *(void *)&self->_anon_2c4[20] = *(void *)&a3[3].var8.var2[2];
  *(_OWORD *)self->_renderedOuterSectorsConfiguration.gradientIndicies = v106;
  *(_OWORD *)&self->_anon_2c4[4] = v105;
  *(_OWORD *)&self->_renderedOuterSectorsConfiguration.angleCount = v107;
  uint64_t v128 = v98;
  LODWORD(self->_renderedTransitionProgress) = a3[4].var8.var0;
  char v108 = CLKFloatEqualsFloat();
  NTKCrosswindDeduplicateAnglesInSectorsConfiguration((uint64_t)a3[2].var12);
  NTKCrosswindDeduplicateAnglesInSectorsConfiguration((uint64_t)&a3[3].var6.var1[1]);
  if (tritiumProgress > 0.0)
  {
    NTKCrosswindDeduplicateAnglesInSectorsConfiguration((uint64_t)&a3[3].var9.var1[2]);
    NTKCrosswindDeduplicateAnglesInSectorsConfiguration((uint64_t)a3[4].var5.var1);
  }
  if (a4)
  {
    char v109 = 1;
    if (!v118 && v114 && !(v99 ^ v96 | v100 ^ v97 | v101 ^ v98))
    {
      if (v113) {
        _ZF = !renderedTritiumProgressNeedsUpdate;
      }
      else {
        _ZF = 1;
      }
      char v109 = v108 ^ 1;
      if (!_ZF) {
        char v109 = 1;
      }
    }
    a4->unint64_t var0 = v109;
    a4->unint64_t var1 = v117;
  }
}

- (NTKCrosswindQuadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCrosswindQuadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (NSDate)tritiumOverrideDate
{
  return self->_tritiumOverrideDate;
}

- (BOOL)isAnimatingOverrideDate
{
  return self->_animatingOverrideDate;
}

- (double)innerCircleRadius
{
  return self->_innerCircleRadius;
}

- (void)setInnerCircleRadius:(double)a3
{
  self->_innerCircleRadius = a3;
}

- (double)middleCircleRadius
{
  return self->_middleCircleRadius;
}

- (void)setMiddleCircleRadius:(double)a3
{
  self->_middleCircleRadius = a3;
}

- (double)outerCircleRadius
{
  return self->_outerCircleRadius;
}

- (void)setOuterCircleRadius:(double)a3
{
  self->_outerCircleRadius = a3;
}

- (double)tritiumProgress
{
  return self->_tritiumProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tritiumOverrideDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideDateMediaTimingFunction, 0);
  for (uint64_t i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_handInlayColors[i], 0);
  for (uint64_t j = 3; j != -1; --j)
    objc_storeStrong((id *)&self->_handDotColors[j], 0);
  objc_storeStrong((id *)&self->_colorSequencer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end
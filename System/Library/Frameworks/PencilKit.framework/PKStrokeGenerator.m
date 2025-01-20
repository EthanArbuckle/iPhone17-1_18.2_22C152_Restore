@interface PKStrokeGenerator
+ (vector<PKInputPoint,)inputPointsFromPath:(id)a2 maxSegmentLength:(SEL)a3 velocityForDistanceFunction:(CGPath *)a4;
+ (vector<PKInputPoint,)inputPointsFromPoints:(id)a2 velocityForDistanceFunction:(SEL)a3;
+ (void)initialize;
- (BOOL)canSnapToRuler;
- (BOOL)captureLiveData;
- (BOOL)isPreviewing;
- (BOOL)isSnappedToRuler;
- (BOOL)isSnappedToRulerTopSide;
- (BOOL)lastPointIsMasked;
- (BOOL)rollAngleEnabled;
- (BOOL)shouldClearAzimuth;
- (BOOL)shouldSnapPointToRuler:(CGPoint)a3;
- (BOOL)useRuler;
- (CGAffineTransform)rulerTransform;
- (CGPoint)getRulerSnapLineOriginAndTangent:(CGPoint *)a3 andNormal:(CGPoint *)a4;
- (CGPoint)lastPoint;
- (CGPoint)snapPointToRuler:(CGPoint)a3;
- (OS_dispatch_queue)outputQueue;
- (PKStrokeGenerator)init;
- (PKStrokeGenerator)initWithStrokeNoiseSmoothing:(BOOL)a3;
- (PKStrokeGeneratorDelegate)delegate;
- (_PKStrokePoint)_latestStrokePoint;
- (_PKStrokePoint)outputCurrentStrokePoint:(SEL)a3;
- (_PKStrokePoint)outputPoint:(SEL)a3 baseValues:(id *)a4;
- (double)additionalRollAngle;
- (double)distanceToRulerCenter:(CGPoint)a3;
- (double)eraserIndicatorAlpha;
- (double)inputScale;
- (double)latestNonPredictedTimestamp;
- (double)latestTimestamp;
- (double)rulerWidth;
- (double)strokeMaxForce;
- (double)touchSensitivity;
- (id).cxx_construct;
- (id)_newStrokeWithCurrentDataAndStrokeDataUUID:(id)a3;
- (id)newStrokeWithCurrentData;
- (id)newStrokeWithCurrentDataCopy;
- (id)strokeFromInputPoints:(void *)a3 inputType:(int64_t)a4 ink:(id)a5 inputScale:(double)a6 randomSeed:(unsigned int)a7 strokeClass:(Class)a8;
- (id)strokeFromLineSegments:(const void *)a3 maxSegmentLength:(double)a4 ink:(id)a5 inputScale:(double)a6 strokeClass:(Class)a7;
- (id)strokeFromPath:(CGPath *)a3 ink:(id)a4 inputScale:(double)a5 maxSegmentLength:(double)a6 velocityForDistanceFunction:(id)a7 strokeClass:(Class)a8;
- (id)strokeFromPoints:(CGPoint *)a3 count:(unint64_t)a4 ink:(id)a5 inputScale:(double)a6 strokeClass:(Class)a7;
- (id)strokeFromPoints:(const void *)a3 sourceStroke:(id)a4 inputScale:(double)a5 averageInputPoint:(id *)a6;
- (int64_t)fetchFilteredPointsFromIndex:(int64_t)a3 accessBlock:(id)a4;
- (int64_t)inputType;
- (unint64_t)activeInputProperties;
- (unint64_t)copyInputUpdatedRangeFromIndex:(unint64_t)a3 into:(void *)a4;
- (void)_drawingAddPoint:(id *)a3;
- (void)_drawingUpdateAllPointsDidTimeout:(BOOL)a3 updateSemaphore:(BOOL)a4;
- (void)_drawingUpdateAllPointsDidTimeoutWithStrokeUUID:(id)a3;
- (void)_removePredictedTouches;
- (void)_updatePredictedTouches;
- (void)addPoint:(id *)a3;
- (void)addPoints:()vector<PKInputPoint;
- (void)allowSnappingToRuler:(CGAffineTransform *)a3 width:(double)a4;
- (void)animationFilter;
- (void)azimuthFilter;
- (void)closeStroke;
- (void)compressionFilter;
- (void)configureFilters;
- (void)dealloc;
- (void)decompressionFilter;
- (void)directionAngleFilter;
- (void)drawingBeganWithStroke:(id)a3 inputType:(int64_t)a4 activeInputProperties:(unint64_t)a5 inputScale:(double)a6 start:(id)a7;
- (void)drawingCancelledWithCompletion:(id)a3;
- (void)drawingEndedEstimatesTimeout:(double)a3 completion:(id)a4;
- (void)drawingUpdateAllPoints;
- (void)drawingUpdateAllPointsDidTimeoutWithStrokeUUID:(id)a3;
- (void)drawingUpdatePoint:(id *)a3;
- (void)endCapFilter;
- (void)endHookFilter;
- (void)estimatedAltitudeAndAzimuthFilter;
- (void)fountainPenFilter;
- (void)getInputUpdatedRangeFromIndex:(unint64_t *)a3;
- (void)getUpdatedRangeFromIndex:(unint64_t *)a3;
- (void)inputProvider;
- (void)inputSmoother;
- (void)inputToOutputFilter;
- (void)maskToRuler;
- (void)noiseSmoother;
- (void)pixelSmoothingFilter;
- (void)pointReductionFilter;
- (void)propertySmoother;
- (void)reset;
- (void)resetFilters;
- (void)rulerExtremaFilter;
- (void)setAdditionalRollAngle:(double)a3;
- (void)setAnimationFilter:(void *)a3;
- (void)setAzimuthFilter:(void *)a3;
- (void)setCanSnapToRuler:(BOOL)a3;
- (void)setCaptureLiveData:(BOOL)a3;
- (void)setCompressionFilter:(void *)a3;
- (void)setDecompressionFilter:(void *)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionAngleFilter:(void *)a3;
- (void)setEndCapFilter:(void *)a3;
- (void)setEndHookFilter:(void *)a3;
- (void)setEraserIndicatorAlpha:(double)a3;
- (void)setEstimatedAltitudeAndAzimuthFilter:(void *)a3;
- (void)setFountainPenFilter:(void *)a3;
- (void)setInputProvider:(void *)a3;
- (void)setInputScale:(double)a3;
- (void)setInputSmoother:(void *)a3;
- (void)setInputToOutputFilter:(void *)a3;
- (void)setIsPreviewing:(BOOL)a3;
- (void)setIsSnappedToRuler:(BOOL)a3;
- (void)setIsSnappedToRulerTopSide:(BOOL)a3;
- (void)setLastPoint:(CGPoint)a3;
- (void)setNoiseSmoother:(void *)a3;
- (void)setOutputQueue:(id)a3;
- (void)setPixelSmoothingFilter:(void *)a3;
- (void)setPointReductionFilter:(void *)a3;
- (void)setPropertySmoother:(void *)a3;
- (void)setRollAngleEnabled:(BOOL)a3;
- (void)setRulerExtremaFilter:(void *)a3;
- (void)setRulerTransform:(CGAffineTransform *)a3;
- (void)setRulerWidth:(double)a3;
- (void)setShouldClearAzimuth:(BOOL)a3;
- (void)setStartCapFilter:(void *)a3;
- (void)setStartHookFilter:(void *)a3;
- (void)setStrokeMaxForce:(double)a3;
- (void)setTouchSensitivity:(double)a3;
- (void)setUseRuler:(BOOL)a3;
- (void)setVelocityFilter:(void *)a3;
- (void)setupForInk:(id)a3 maximumSupportedContentVersion:(int64_t)a4;
- (void)snapToRuler;
- (void)startCapFilter;
- (void)startHookFilter;
- (void)updateImmutableCount;
- (void)updateRulerSnapping;
- (void)velocityFilter;
- (void)whenFinishedProcessingPointsCallCompletion:(id)a3;
@end

@implementation PKStrokeGenerator

- (void)setDelegate:(id)a3
{
}

- (PKStrokeGenerator)init
{
  return [(PKStrokeGenerator *)self initWithStrokeNoiseSmoothing:0];
}

- (PKStrokeGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKStrokeGeneratorDelegate *)WeakRetained;
}

- (id).cxx_construct
{
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

- (PKStrokeGenerator)initWithStrokeNoiseSmoothing:(BOOL)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKStrokeGenerator;
  v3 = [(PKStrokeGenerator *)&v21 init];
  v4 = v3;
  if (v3)
  {
    allInputPointFilters = v3->_allInputPointFilters;
    v3->_allInputPointFilters = (NSArray *)MEMORY[0x1E4F1CBF0];

    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4->_enableDidUpdateRoll = [v6 BOOLForKey:@"internalSettings.drawing.disableDidUpdateRoll"] ^ 1;

    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4->_alwaysUseRollAngleForFountainPen = [v7 BOOLForKey:@"PKAlwaysUseRollAngleForFountainPen"];

    v8 = objc_alloc_init(PKInputPointExtraRollLatencyFilter);
    extraRollLatencyFilter = v4->_extraRollLatencyFilter;
    v4->_extraRollLatencyFilter = v8;

    v10 = objc_alloc_init(PKInputPointRollNoiseFilter);
    rollNoiseFilter = v4->_rollNoiseFilter;
    v4->_rollNoiseFilter = v10;

    v12 = v4->_rollNoiseFilter;
    v22[0] = v4->_extraRollLatencyFilter;
    v22[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v14 = v4->_allInputPointFilters;
    v4->_allInputPointFilters = (NSArray *)v13;

    v4->_baseRollAngleLock._os_unfair_lock_opaque = 0;
    if (qword_1EB3C6370 != -1) {
      dispatch_once(&qword_1EB3C6370, &__block_literal_global_391);
    }
    if (_MergedGlobals_164 == 1) {
      v4->_keepPredictedTouchesAtEndOfStroke = _MergedGlobals_164;
    }
    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.pencilkit.draw-input", v15);
    inputQueue = v4->_inputQueue;
    v4->_inputQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.pencilkit.draw-output", v15);
    outputQueue = v4->_outputQueue;
    v4->_outputQueue = (OS_dispatch_queue *)v18;

    v4->_inputScale = 1.0;
    operator new();
  }
  return 0;
}

- (void)resetFilters
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_allInputPointFilters;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "resetFilter", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PKStrokeGenerator;
  objc_msgSendSuper2(&v2, sel_initialize);
  objc_opt_class();
}

- (void)dealloc
{
  inputProvider = (id *)self->_inputProvider;
  if (inputProvider)
  {
    objc_destroyWeak(inputProvider + 1);
    MEMORY[0x1C8783F10](inputProvider, 0x81C40803F642BLL);
  }
  pixelSmoothingFilter = (id *)self->_pixelSmoothingFilter;
  if (pixelSmoothingFilter)
  {
    objc_destroyWeak(pixelSmoothingFilter + 6);
    MEMORY[0x1C8783F10](pixelSmoothingFilter, 0x10A1C40F7C73FE6);
  }
  pointReductionFilter = self->_pointReductionFilter;
  if (pointReductionFilter)
  {
    void *pointReductionFilter = &unk_1F1FB01A8;
    long long v6 = (void *)pointReductionFilter[21];
    if (v6)
    {
      pointReductionFilter[22] = v6;
      operator delete(v6);
    }
    long long v7 = (void *)pointReductionFilter[18];
    if (v7)
    {
      pointReductionFilter[19] = v7;
      operator delete(v7);
    }
    void *pointReductionFilter = &unk_1F1FAF930;
    long long v8 = (void *)pointReductionFilter[10];
    if (v8)
    {
      pointReductionFilter[11] = v8;
      operator delete(v8);
    }
    void *pointReductionFilter = &unk_1F1FAFF10;
    long long v9 = (void *)pointReductionFilter[6];
    if (v9)
    {
      pointReductionFilter[7] = v9;
      operator delete(v9);
    }
    MEMORY[0x1C8783F10](pointReductionFilter, 0x10B1C40B92EB384);
  }
  startHookFilter = self->_startHookFilter;
  if (startHookFilter) {
    MEMORY[0x1C8783F10](startHookFilter, 0x10A1C40A8CDCD5BLL);
  }
  endHookFilter = self->_endHookFilter;
  if (endHookFilter) {
    MEMORY[0x1C8783F10](endHookFilter, 0x10A1C40A8CDCD5BLL);
  }
  velocityFilter = self->_velocityFilter;
  if (velocityFilter) {
    MEMORY[0x1C8783F10](velocityFilter, 0x10A1C40A8CDCD5BLL);
  }
  directionAngleFilter = (id *)self->_directionAngleFilter;
  if (directionAngleFilter)
  {
    objc_destroyWeak(directionAngleFilter + 6);
    MEMORY[0x1C8783F10](directionAngleFilter, 0x10A1C40F9F78CB0);
  }
  inputSmoother = (id *)self->_inputSmoother;
  if (inputSmoother)
  {
    id *inputSmoother = &unk_1F1FAFBA8;
    objc_destroyWeak(inputSmoother + 17);
    id v15 = inputSmoother[14];
    if (v15)
    {
      inputSmoother[15] = v15;
      operator delete(v15);
    }
    id *inputSmoother = &unk_1F1FAF9E0;
    id v16 = inputSmoother[10];
    if (v16)
    {
      inputSmoother[11] = v16;
      operator delete(v16);
    }
    id *inputSmoother = &unk_1F1FAFFB0;
    id v17 = inputSmoother[6];
    if (v17)
    {
      inputSmoother[7] = v17;
      operator delete(v17);
    }
    MEMORY[0x1C8783F10](inputSmoother, 0x10A1C4091D11D32);
  }
  fountainPenFilter = self->_fountainPenFilter;
  if (fountainPenFilter)
  {
    void *fountainPenFilter = &unk_1F1FAF9E0;
    v19 = (void *)fountainPenFilter[10];
    if (v19)
    {
      fountainPenFilter[11] = v19;
      operator delete(v19);
    }
    void *fountainPenFilter = &unk_1F1FAFFB0;
    v20 = (void *)fountainPenFilter[6];
    if (v20)
    {
      fountainPenFilter[7] = v20;
      operator delete(v20);
    }
    MEMORY[0x1C8783F10](fountainPenFilter, 0x10A1C40F23EBCE3);
  }
  propertySmoother = (id *)self->_propertySmoother;
  if (propertySmoother)
  {
    objc_destroyWeak(propertySmoother + 15);
    id *propertySmoother = &unk_1F1FAF9E0;
    id v22 = propertySmoother[10];
    if (v22)
    {
      propertySmoother[11] = v22;
      operator delete(v22);
    }
    id *propertySmoother = &unk_1F1FAFFB0;
    id v23 = propertySmoother[6];
    if (v23)
    {
      propertySmoother[7] = v23;
      operator delete(v23);
    }
    MEMORY[0x1C8783F10](propertySmoother, 0x10A1C40E2AAAF71);
  }
  inputToOutputFilter = (id *)self->_inputToOutputFilter;
  if (inputToOutputFilter)
  {
    objc_destroyWeak(inputToOutputFilter + 13);
    id *inputToOutputFilter = &unk_1F1FAF8D8;
    id v25 = inputToOutputFilter[10];
    if (v25)
    {
      inputToOutputFilter[11] = v25;
      operator delete(v25);
    }
    id *inputToOutputFilter = &unk_1F1FAFEC0;
    id v26 = inputToOutputFilter[6];
    if (v26)
    {
      inputToOutputFilter[7] = v26;
      operator delete(v26);
    }
    MEMORY[0x1C8783F10](inputToOutputFilter, 0x10A1C40D2FCA11BLL);
  }
  startCapFilter = self->_startCapFilter;
  if (startCapFilter) {
    MEMORY[0x1C8783F10](startCapFilter, 0x10A1C40C3B39206);
  }
  azimuthFilter = (id *)self->_azimuthFilter;
  if (azimuthFilter)
  {
    objc_destroyWeak(azimuthFilter + 14);
    id *azimuthFilter = &unk_1F1FAFF10;
    id v29 = azimuthFilter[6];
    if (v29)
    {
      azimuthFilter[7] = v29;
      operator delete(v29);
    }
    MEMORY[0x1C8783F10](azimuthFilter, 0x10A1C40C295C68ALL);
  }
  endCapFilter = self->_endCapFilter;
  if (endCapFilter) {
    MEMORY[0x1C8783F10](endCapFilter, 0x10A1C40C3B39206);
  }
  compressionFilter = self->_compressionFilter;
  if (compressionFilter)
  {
    void *compressionFilter = &unk_1F1FAF988;
    v32 = (void *)compressionFilter[10];
    if (v32)
    {
      compressionFilter[11] = v32;
      operator delete(v32);
    }
    void *compressionFilter = &unk_1F1FAFF60;
    v33 = (void *)compressionFilter[6];
    if (v33)
    {
      compressionFilter[7] = v33;
      operator delete(v33);
    }
    MEMORY[0x1C8783F10](compressionFilter, 0x10A1C40AE98C8B9);
  }
  decompressionFilter = self->_decompressionFilter;
  if (decompressionFilter)
  {
    void *decompressionFilter = &unk_1F1FAFA38;
    v35 = (void *)decompressionFilter[10];
    if (v35)
    {
      decompressionFilter[11] = v35;
      operator delete(v35);
    }
    void *decompressionFilter = &unk_1F1FB0000;
    v36 = (void *)decompressionFilter[6];
    if (v36)
    {
      decompressionFilter[7] = v36;
      operator delete(v36);
    }
    MEMORY[0x1C8783F10](decompressionFilter, 0x10A1C40E4B39F60);
  }
  rulerExtremaFilter = (id *)self->_rulerExtremaFilter;
  if (rulerExtremaFilter)
  {
    objc_destroyWeak(rulerExtremaFilter + 13);
    id *rulerExtremaFilter = &unk_1F1FAF9E0;
    id v38 = rulerExtremaFilter[10];
    if (v38)
    {
      rulerExtremaFilter[11] = v38;
      operator delete(v38);
    }
    id *rulerExtremaFilter = &unk_1F1FAFFB0;
    id v39 = rulerExtremaFilter[6];
    if (v39)
    {
      rulerExtremaFilter[7] = v39;
      operator delete(v39);
    }
    MEMORY[0x1C8783F10](rulerExtremaFilter, 0x10A1C40D2FCA11BLL);
  }
  estimatedAltitudeAndAzimuthFilter = (id *)self->_estimatedAltitudeAndAzimuthFilter;
  if (estimatedAltitudeAndAzimuthFilter)
  {
    objc_destroyWeak(estimatedAltitudeAndAzimuthFilter + 16);
    MEMORY[0x1C8783F10](estimatedAltitudeAndAzimuthFilter, 0x10A1C40BB619F7BLL);
  }
  animationFilter = (id *)self->_animationFilter;
  if (animationFilter)
  {
    objc_destroyWeak(animationFilter + 6);
    MEMORY[0x1C8783F10](animationFilter, 0x10A1C40F7C73FE6);
  }
  noiseSmoother = (id *)self->_noiseSmoother;
  if (noiseSmoother)
  {
    objc_destroyWeak(noiseSmoother + 15);
    id *noiseSmoother = &unk_1F1FAF930;
    id v43 = noiseSmoother[10];
    if (v43)
    {
      noiseSmoother[11] = v43;
      operator delete(v43);
    }
    id *noiseSmoother = &unk_1F1FAFF10;
    id v44 = noiseSmoother[6];
    if (v44)
    {
      noiseSmoother[7] = v44;
      operator delete(v44);
    }
    MEMORY[0x1C8783F10](noiseSmoother, 0x10A1C40E2AAAF71);
  }
  v45.receiver = self;
  v45.super_class = (Class)PKStrokeGenerator;
  [(PKStrokeGenerator *)&v45 dealloc];
}

- (void)setupForInk:(id)a3 maximumSupportedContentVersion:(int64_t)a4
{
  id v13 = a3;
  [(PKStrokeGenerator *)self setRollAngleEnabled:0];
  [(PKStrokeGenerator *)self setAdditionalRollAngle:0.0];
  [(PKStrokeGenerator *)self setShouldClearAzimuth:0];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_8;
  }
  long long v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v7 = [v6 valueForKey:@"internalSettings.drawing.markerUsesRollForAzimuth"];
  if (v7)
  {
    long long v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v9 = [v8 BOOLForKey:@"internalSettings.drawing.markerUsesRollForAzimuth"];

    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  if ([v13 _isMarkerInk]) {
    [(PKStrokeGenerator *)self setRollAngleEnabled:1];
  }
LABEL_8:
  if (![v13 _isFountainPenInkV2]) {
    goto LABEL_23;
  }
  int v10 = _os_feature_enabled_impl() ^ 1;
  if (a4 < 3) {
    LOBYTE(v10) = 1;
  }
  if (v10)
  {
LABEL_23:
    if ([v13 _isFountainPenInk]) {
      [(PKStrokeGenerator *)self setShouldClearAzimuth:1];
    }
  }
  else
  {
    [(PKStrokeGenerator *)self setShouldClearAzimuth:1];
    uint64_t v11 = +[PKPencilDevice activePencil];
    if ([v11 isRollSupported])
    {
    }
    else
    {
      BOOL alwaysUseRollAngleForFountainPen = self->_alwaysUseRollAngleForFountainPen;

      if (!alwaysUseRollAngleForFountainPen) {
        goto LABEL_18;
      }
    }
    [(PKStrokeGenerator *)self setRollAngleEnabled:1];
    [(PKStrokeGenerator *)self setAdditionalRollAngle:1.57079633];
  }
LABEL_18:
}

- (int64_t)inputType
{
  return self->_currentInputType;
}

- (unint64_t)activeInputProperties
{
  return self->_currentActiveInputProperties;
}

- (void)configureFilters
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v9 integerForKey:@"internalSettings.roll.extraLatency"];
  extraRollLatencyFilter = self->_extraRollLatencyFilter;
  if (extraRollLatencyFilter) {
    extraRollLatencyFilter->_numFramesExtraLatency = v3;
  }

  id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v10 integerForKey:@"internalSettings.roll.noiseOffset"];
  rollNoiseFilter = self->_rollNoiseFilter;
  if (rollNoiseFilter && rollNoiseFilter->_rollOffsetNoise != (double)v5)
  {
    rollNoiseFilter->_rollOffsetNoise = (double)v5;
    [(PKInputPointRollNoiseFilter *)rollNoiseFilter _recalculateOffset];
  }

  id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v7 = [v11 integerForKey:@"internalSettings.roll.noiseJitter"];
  long long v8 = self->_rollNoiseFilter;
  if (v8) {
    v8->_rollJitterNoise = (double)v7;
  }
}

- (void)drawingBeganWithStroke:(id)a3 inputType:(int64_t)a4 activeInputProperties:(unint64_t)a5 inputScale:(double)a6 start:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  BOOL v14 = [(PKStrokeGenerator *)self shouldClearAzimuth];
  BOOL v15 = [(PKStrokeGenerator *)self rollAngleEnabled];
  if (self)
  {
    os_unfair_lock_lock(&self->_baseRollAngleLock);
    double baseRollAngle = self->_baseRollAngle;
    os_unfair_lock_unlock(&self->_baseRollAngleLock);
  }
  else
  {
    double baseRollAngle = 0.0;
  }
  [(PKStrokeGenerator *)self additionalRollAngle];
  self->_currentStrokeRollBaseValue = -1.0;
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke;
  block[3] = &unk_1E64CB488;
  BOOL v29 = v14;
  BOOL v30 = v15;
  double v24 = baseRollAngle;
  uint64_t v25 = v18;
  block[4] = self;
  id v22 = v12;
  unint64_t v26 = a5;
  int64_t v27 = a4;
  double v28 = a6;
  id v23 = v13;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(inputQueue, block);
}

void __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 400);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke_2;
  v9[3] = &unk_1E64CB460;
  v9[4] = v2;
  __int16 v14 = *(_WORD *)(a1 + 96);
  long long v11 = *(_OWORD *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  long long v12 = *(_OWORD *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 88);
  dispatch_sync(v3, v9);
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v4, v5, v6, v7);
  }
}

void __93__PKStrokeGenerator_drawingBeganWithStroke_inputType_activeInputProperties_inputScale_start___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 257) = *(unsigned char *)(a1 + 88);
  *(unsigned char *)(*(void *)(a1 + 32) + 258) = *(unsigned char *)(a1 + 89);
  *(void *)(*(void *)(a1 + 32) + 264) = *(void *)(a1 + 48);
  *(void *)(*(void *)(a1 + 32) + 272) = *(void *)(a1 + 56);
  [*(id *)(a1 + 32) configureFilters];
  uint64_t v2 = os_log_create("com.apple.pencilkit", "Stroke Generator");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v19 = 0;
    _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Drawing began", v19, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *(id *)(a1 + 40));
  uint64_t v3 = [*(id *)(a1 + 40) _flags];
  if ((v3 & 0x2000000000) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 176) _setFlags:v3 & 0xFFFFFFC00000001FLL | (32 * arc4random()) | 0x2000000000];
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  if (qword_1EB3C6370 != -1) {
    dispatch_once(&qword_1EB3C6370, &__block_literal_global_391);
  }
  BOOL v6 = (_MergedGlobals_164 & 1) != 0 || v4 == 1 && (v5 & 0xC) == 8;
  *(unsigned char *)(*(void *)(a1 + 32) + 256) = v6;
  *(void *)(*(void *)(a1 + 32) + 584) = *(void *)(a1 + 80);
  [*(id *)(a1 + 32) setUseRuler:0];
  [*(id *)(a1 + 32) setCanSnapToRuler:0];
  [*(id *)(a1 + 32) setIsSnappedToRuler:0];
  [*(id *)(a1 + 32) setStrokeMaxForce:0.0];
  [*(id *)(a1 + 32) setTouchSensitivity:1.0];
  if (_UIAccessibilityForceTouchEnabled())
  {
    _UIAccessibilityForceTouchSensitivity();
    [*(id *)(a1 + 32) setTouchSensitivity:(1.0 - v8) * -3.0 + 1.0];
  }
  uint64_t v9 = *(void *)(a1 + 64);
  *(void *)(*(void *)(a1 + 32) + 184) = *(void *)(a1 + 72);
  *(void *)(*(void *)(a1 + 32) + 192) = v9;
  *(void *)(*(void *)(a1 + 32) + 200) = 0;
  *(void *)(*(void *)(a1 + 32) + 208) = 0;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(v10 + 80) = v11;
  *(void *)(v10 + 88) = 0;
  *(void *)(v10 + 96) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v10 + 104) = _Q0;
  *(_OWORD *)(v10 + 120) = 0u;
  *(_OWORD *)(v10 + 136) = 0u;
  *(_OWORD *)(v10 + 152) = 0u;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 568) + 104) = *(void *)(*(void *)(a1 + 32) + 80);
  id v16 = (void (***)(void, void *, void, __n128))[*(id *)(a1 + 32) outputFilter];
  id v17 = [*(id *)(*(void *)(a1 + 32) + 176) ink];
  v18.n128_u64[0] = *(void *)(*(void *)(a1 + 32) + 584);
  (**v16)(v16, v17, *(void *)(a1 + 72), v18);

  if ((v5 & 8) != 0)
  {
    if (*(void *)(a1 + 72) != 1) {
      goto LABEL_22;
    }
    if (qword_1EB3C6378 != -1) {
      dispatch_once(&qword_1EB3C6378, &__block_literal_global_549);
    }
    if (byte_1EB3C6369)
    {
LABEL_22:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 440) + 40) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 448) + 40) = 1;
    }
  }
}

- (void)allowSnappingToRuler:(CGAffineTransform *)a3 width:(double)a4
{
  inputQueue = self->_inputQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  long long v5 = *(_OWORD *)&a3->c;
  long long v7 = *(_OWORD *)&a3->a;
  v6[2] = __48__PKStrokeGenerator_allowSnappingToRuler_width___block_invoke;
  v6[3] = &unk_1E64CB4B0;
  v6[4] = self;
  long long v8 = v5;
  long long v9 = *(_OWORD *)&a3->tx;
  double v10 = a4;
  dispatch_async(inputQueue, v6);
}

uint64_t __48__PKStrokeGenerator_allowSnappingToRuler_width___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  [*(id *)(a1 + 32) setRulerTransform:v4];
  [*(id *)(a1 + 32) setRulerWidth:*(double *)(a1 + 88)];
  [*(id *)(a1 + 32) setUseRuler:1];
  return [*(id *)(a1 + 32) setCanSnapToRuler:1];
}

- (CGPoint)getRulerSnapLineOriginAndTangent:(CGPoint *)a3 andNormal:(CGPoint *)a4
{
  [(PKStrokeGenerator *)self rulerTransform];
  [(PKStrokeGenerator *)self rulerWidth];
  double v8 = v7 * 0.5;
  if ([(PKStrokeGenerator *)self isSnappedToRuler])
  {
    long long v9 = [(PKStroke *)self->_currentStroke ink];
    double v10 = [v9 behavior];
    if (v10) {
      double v11 = -(v10[3] - self->_baseValues.aspectRatio * (self->_baseValues.edgeWidth + self->_baseValues.radius) * v10[2]);
    }
    else {
      double v11 = 0.0;
    }
    double v8 = v8 + v11 / self->_inputScale;
  }
  if ([(PKStrokeGenerator *)self isSnappedToRulerTopSide]) {
    double v12 = v8;
  }
  else {
    double v12 = -v8;
  }
  double v13 = v12 * 0.0;
  double v14 = v12 * 0.0;
  if (a3)
  {
    a3->x = v13 + 0.0 * 100.0 + 0.0;
    a3->y = v14 + 0.0 * 100.0 + 0.0;
  }
  if (a4)
  {
    double v15 = (v12 + v12) * 0.0
        + 0.0 * 0.0
        + 0.0
        - (0.0 * *(double *)(MEMORY[0x1E4F1DAD8] + 8)
         + 0.0 * *MEMORY[0x1E4F1DAD8]
         + 0.0);
    double v16 = 1.0 / sqrt(v15 * v15 + v15 * v15);
    a4->x = v15 * v16;
    a4->y = v15 * v16;
  }
  double v17 = v13 + 0.0 * -100.0 + 0.0;
  double v18 = v14 + 0.0 * -100.0 + 0.0;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)distanceToRulerCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PKStrokeGenerator *)self rulerTransform];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) * 0.0 + 0.0 * *MEMORY[0x1E4F1DAD8] + 0.0;
  [(PKStrokeGenerator *)self rulerWidth];
  double v8 = v7 * 0.5 * 0.0 + 0.0 * 0.0 + 0.0 - v6;
  double v9 = 1.0 / sqrt(v8 * v8 + v8 * v8);
  return (y - v6) * (v8 * v9) + (x - v6) * (v8 * v9);
}

- (BOOL)shouldSnapPointToRuler:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(PKStrokeGenerator *)self useRuler];
  if (v6)
  {
    if (self->_currentInputType == 1) {
      double v7 = 25.0;
    }
    else {
      double v7 = 45.0;
    }
    [(PKStrokeGenerator *)self rulerWidth];
    double v9 = v8 * 0.5 + v7;
    [(PKStrokeGenerator *)self rulerTransform];
    -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", x, y);
    LOBYTE(v6) = fabs(v10) < v9 * sqrt(v13 * v13 + v12 * v12);
  }
  return v6;
}

- (void)snapToRuler
{
  uint64_t v3 = [(PKStrokeGenerator *)self delegate];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    long long v5 = [(PKStrokeGenerator *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(PKStrokeGenerator *)self delegate];
      [v7 strokeGeneratorDidSnapToRuler:self];
    }
  }
  end = self->_drawPoints.__end_;
  long long v9 = *((_OWORD *)end - 5);
  long long v11 = *((_OWORD *)end - 8);
  long long v10 = *((_OWORD *)end - 7);
  *(_OWORD *)&v23[4] = *((_OWORD *)end - 6);
  *(_OWORD *)&v23[6] = v9;
  *(_OWORD *)id v23 = v11;
  *(_OWORD *)&v23[2] = v10;
  long long v12 = *((_OWORD *)end - 1);
  long long v14 = *((_OWORD *)end - 4);
  long long v13 = *((_OWORD *)end - 3);
  *(_OWORD *)&v23[12] = *((_OWORD *)end - 2);
  *(_OWORD *)&v23[14] = v12;
  *(_OWORD *)&v23[8] = v14;
  *(_OWORD *)&v23[10] = v13;
  [(PKStrokeGenerator *)self outputCurrentStrokePoint:v23];
  long long v15 = *(_OWORD *)&v23[23];
  *(_OWORD *)&self->_baseValues.aspectRatio = *(_OWORD *)&v23[21];
  *(_OWORD *)&self->_baseValues.force = v15;
  *(_OWORD *)&self->_baseValues.altitude = *(_OWORD *)&v23[25];
  *(void *)&self->_baseValues.radius2 = v23[27];
  long long v16 = *(_OWORD *)&v23[19];
  *(_OWORD *)&self->_baseValues.timestamp = *(_OWORD *)&v23[17];
  *(_OWORD *)&self->_baseValues.location.double y = v16;
  -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  [(PKStrokeGenerator *)self setIsSnappedToRulerTopSide:v17 > 0.0];
  [(PKStrokeGenerator *)self setIsSnappedToRuler:1];
  double v18 = [(PKStroke *)self->_currentStroke _clipPlane];

  if (v18) {
    [(PKStroke *)self->_currentStroke _setClipPlane:0];
  }
  begin = self->_drawPoints.__begin_;
  id v20 = self->_drawPoints.__end_;
  while (begin != v20)
  {
    -[PKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", *(double *)begin, *((double *)begin + 1));
    *(void *)begin = v21;
    *((void *)begin + 1) = v22;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128);
  }
}

- (void)maskToRuler
{
  -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1));
  [(PKStrokeGenerator *)self setIsSnappedToRulerTopSide:v3 > 0.0];
  [(PKStrokeGenerator *)self setIsSnappedToRuler:0];
  [(PKStrokeGenerator *)self getRulerSnapLineOriginAndTangent:0 andNormal:v11];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(PKStroke *)self->_currentStroke _clipPlane];

  if (!v8)
  {
    long long v9 = [_PKStrokeClipPlane alloc];
    long long v10 = -[_PKStrokeClipPlane initWithOrigin:normal:](v9, "initWithOrigin:normal:", v5, v7, -v11[0], -v11[1]);
    [(PKStroke *)self->_currentStroke _setClipPlane:v10];
  }
}

- (CGPoint)snapPointToRuler:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(PKStrokeGenerator *)self isSnappedToRuler])
  {
    [(PKStrokeGenerator *)self getRulerSnapLineOriginAndTangent:&v14 andNormal:0];
    double v8 = 1.0 / sqrt((v15 - v7) * (v15 - v7) + (v14 - v6) * (v14 - v6));
    double v9 = (v14 - v6) * v8;
    double v10 = (v15 - v7) * v8;
    double v11 = (y - v7) * v10 + (x - v6) * v9;
    double x = v6 + v9 * v11;
    double y = v7 + v10 * v11;
  }
  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (void)updateRulerSnapping
{
  if ([(PKStrokeGenerator *)self canSnapToRuler])
  {
    unint64_t v3 = self->_drawPoints.__end_ - self->_drawPoints.__begin_;
    if (v3)
    {
      if (v3 >= 0x81 && ![(PKStrokeGenerator *)self isPreviewing])
      {
        begin = self->_drawPoints.__begin_;
        end = self->_drawPoints.__end_;
        double v6 = *((double *)end - 16) - *(double *)begin;
        double v7 = *((double *)end - 15) - *((double *)begin + 1);
        [(PKStrokeGenerator *)self rulerTransform];
        double v8 = v7 * v7 + v6 * v6;
        if (v8 > self->_inputScale * (self->_inputScale * 225.0))
        {
          double v10 = *MEMORY[0x1E4F1DAD8];
          double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          if (-[PKStrokeGenerator shouldSnapPointToRuler:](self, "shouldSnapPointToRuler:", *(double *)self->_drawPoints.__begin_, *((double *)self->_drawPoints.__begin_ + 1))&& (v11 = v20 + v16 + v18 * 0.0 - (v20 + v9 * v18 + v16 * v10), v12 = v21 + v17 + v19 * 0.0 - (v21 + v9 * v19 + v17 * v10), double v13 = 1.0 / sqrt(v8), v14 = 1.0 / sqrt(v12 * v12 + v11 * v11), fabs(v7 * v13 * (v12 * v14) + v6 * v13 * (v11 * v14)) > 0.86))
          {
            [(PKStrokeGenerator *)self snapToRuler];
          }
          else
          {
            [(PKStrokeGenerator *)self maskToRuler];
          }
          [(PKStrokeGenerator *)self setCanSnapToRuler:0];
        }
      }
      if ([(PKStrokeGenerator *)self canSnapToRuler])
      {
        double v15 = [(PKStroke *)self->_currentStroke _clipPlane];

        if (!v15) {
          [(PKStrokeGenerator *)self maskToRuler];
        }
      }
    }
  }
}

- (BOOL)lastPointIsMasked
{
  [(PKStrokeGenerator *)self lastPoint];
  BOOL v5 = v4 == INFINITY && v3 == INFINITY;
  BOOL result = 0;
  if (!v5
    && [(PKStrokeGenerator *)self useRuler]
    && ![(PKStrokeGenerator *)self isSnappedToRuler])
  {
    [(PKStrokeGenerator *)self lastPoint];
    -[PKStrokeGenerator distanceToRulerCenter:](self, "distanceToRulerCenter:");
    double v8 = v7;
    [(PKStrokeGenerator *)self rulerWidth];
    double v10 = v9 * 0.5;
    [(PKStrokeGenerator *)self rulerTransform];
    double v11 = v10 * sqrt(v13 * v13 + v12 * v12);
    if ([(PKStrokeGenerator *)self isSnappedToRulerTopSide])
    {
      if (v8 < v11) {
        return 1;
      }
    }
    if (![(PKStrokeGenerator *)self isSnappedToRulerTopSide] && v11 > -v8) {
      return 1;
    }
  }
  return result;
}

- (void)getUpdatedRangeFromIndex:(unint64_t *)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PKStrokeGenerator_getUpdatedRangeFromIndex___block_invoke;
  block[3] = &unk_1E64CB4D8;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(outputQueue, block);
  double v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__PKStrokeGenerator_getUpdatedRangeFromIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) outputFilter];
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 16))(v2, *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)getInputUpdatedRangeFromIndex:(unint64_t *)a3
{
}

- (unint64_t)copyInputUpdatedRangeFromIndex:(unint64_t)a3 into:(void *)a4
{
  return self->_immutableCount;
}

- (void)reset
{
  self->_drawPoints.__end_ = self->_drawPoints.__begin_;
  self->_latestNonPredictedTimestamp = 0.0;
  self->_immutableCount = 0;
  self->_missedUpdates = 0;
  [(PKStrokeGenerator *)self setIsSnappedToRuler:0];
  std::vector<_PKStrokePoint>::resize((uint64_t)&self->_outputPoints, 0);
  self->_outputImmutableCount = 0;
  self->_inputHasChanged = 0;
}

- (_PKStrokePoint)outputCurrentStrokePoint:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v4;
  long long v5 = *(_OWORD *)&a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = v5;
  long long v6 = *(_OWORD *)&a4->var1;
  v15[0] = a4->var0;
  v15[1] = v6;
  long long v7 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v7;
  long long v8 = *(_OWORD *)&self->_baseValues.location.y;
  v13[0] = *(_OWORD *)&self->_baseValues.timestamp;
  v13[1] = v8;
  long long v9 = *(_OWORD *)&self->_baseValues.aspectRatio;
  long long v10 = *(_OWORD *)&self->_baseValues.force;
  long long v11 = *(_OWORD *)&self->_baseValues.altitude;
  double radius2 = self->_baseValues.radius2;
  v13[3] = v10;
  v13[4] = v11;
  v13[2] = v9;
  return [(PKStrokeGenerator *)self outputPoint:v15 baseValues:v13];
}

- (_PKStrokePoint)outputPoint:(SEL)a3 baseValues:(id *)a4
{
  touchSensitivitdouble y = self->_touchSensitivity;
  if ([(PKStrokeGenerator *)self isPreviewing])
  {
    long long v10 = [(PKStroke *)self->_currentStroke ink];
    long long v11 = [v10 identifier];
    int v12 = [v11 isEqualToString:@"com.apple.ink.watercolor"];

    if (v12)
    {
      a4->double var1 = 0.7;
      a4->var3 = 0.785398163;
    }
  }
  long long v13 = *(_OWORD *)&a5->force;
  v38[2] = *(_OWORD *)&a5->aspectRatio;
  v38[3] = v13;
  v38[4] = *(_OWORD *)&a5->altitude;
  double radius2 = a5->radius2;
  uint64_t v40 = 0;
  long long v14 = *(_OWORD *)&a5->location.y;
  v38[0] = *(_OWORD *)&a5->timestamp;
  v38[1] = v14;
  LOBYTE(v40) = self->_isSnappedToRuler;
  currentStroke = self->_currentStroke;
  int64_t currentInputType = self->_currentInputType;
  double inputScale = self->_inputScale;
  double v43 = touchSensitivity;
  *(double *)&long long v14 = self->_eraserIndicatorAlpha;
  double strokeMaxForce = self->_strokeMaxForce;
  double var1 = strokeMaxForce;
  uint64_t v45 = v14;
  unint64_t currentActiveInputProperties = self->_currentActiveInputProperties;
  v46 = currentStroke;
  unint64_t v47 = currentActiveInputProperties;
  if (strokeMaxForce < a4->var1) {
    double var1 = a4->var1;
  }
  self->_double strokeMaxForce = var1;
  double v18 = [(PKStroke *)currentStroke ink];
  double v19 = [v18 behavior];
  long long v20 = *(_OWORD *)&a4->var9;
  v37[4] = *(_OWORD *)&a4->var7;
  v37[5] = v20;
  long long v21 = *(_OWORD *)&a4->var13;
  v37[6] = *(_OWORD *)&a4->var11;
  v37[7] = v21;
  long long v22 = *(_OWORD *)&a4->var1;
  v37[0] = a4->var0;
  v37[1] = v22;
  long long v23 = *(_OWORD *)&a4->var5;
  v37[2] = *(_OWORD *)&a4->var3;
  v37[3] = v23;
  self->_eraserIndicatorAlpha = -[PKInkBehavior brushOpacityForPoint:context:](v19, v37, (uint64_t)v38);

  retstr->double radius2 = 0.0;
  *(_OWORD *)&retstr->force = 0u;
  *(_OWORD *)&retstr->altitude = 0u;
  *(_OWORD *)&retstr->location.double y = 0u;
  *(_OWORD *)&retstr->aspectRatio = 0u;
  *(_OWORD *)&retstr->timestamp = 0u;
  double v24 = [(PKStroke *)self->_currentStroke ink];
  uint64_t v25 = [v24 behavior];
  long long v26 = *(_OWORD *)&a4->var9;
  v36[4] = *(_OWORD *)&a4->var7;
  v36[5] = v26;
  long long v27 = *(_OWORD *)&a4->var13;
  v36[6] = *(_OWORD *)&a4->var11;
  v36[7] = v27;
  long long v28 = *(_OWORD *)&a4->var1;
  v36[0] = a4->var0;
  v36[1] = v28;
  long long v29 = *(_OWORD *)&a4->var5;
  v36[2] = *(_OWORD *)&a4->var3;
  v36[3] = v29;
  [(PKInkBehavior *)(uint64_t)v25 outputForPoint:(uint64_t)v38 context:(uint64_t)retstr];

  BOOL v31 = !self->_shouldClearAzimuth;
  if (self->_currentRollAngleEnabled && self->_currentInputType == 1)
  {
    double v32 = retstr->azimuth - (a4->var12 - self->_currentBaseRollAngle + self->_currentAdditionalRollAngle);
    long double v33 = fmod(v32, 6.28318531);
    if (v32 <= 6.28318531 && v32 >= 0.0) {
      long double v33 = v32;
    }
    if (v33 < 0.0) {
      long double v33 = v33 + 6.28318531;
    }
    if (v33 == 0.0) {
      long double v33 = 0.0;
    }
    retstr->azimuth = v33;
    BOOL v31 = 1;
  }
  else if (self->_currentShouldClearAzimuth)
  {
    retstr->azimuth = 0.0;
  }
  if (self->_isSnappedToRuler)
  {
    uint64_t result = (_PKStrokePoint *)[(PKStrokeGenerator *)self getRulerSnapLineOriginAndTangent:0 andNormal:v35];
    if (v31) {
      retstr->azimuth = atan2(v35[1], v35[0]);
    }
  }
  return result;
}

- (_PKStrokePoint)_latestStrokePoint
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x8812000000;
  long long v13 = __Block_byref_object_copy__36;
  long long v14 = __Block_byref_object_dispose__36;
  double v15 = "";
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0;
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PKStrokeGenerator__latestStrokePoint__block_invoke;
  block[3] = &unk_1E64C7628;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(outputQueue, block);
  long long v5 = v11;
  long long v6 = *((_OWORD *)v11 + 6);
  *(_OWORD *)&retstr->aspectRatio = *((_OWORD *)v11 + 5);
  *(_OWORD *)&retstr->force = v6;
  *(_OWORD *)&retstr->altitude = *((_OWORD *)v5 + 7);
  *(void *)&retstr->double radius2 = v5[16];
  long long v7 = *((_OWORD *)v5 + 4);
  *(_OWORD *)&retstr->timestamp = *((_OWORD *)v5 + 3);
  *(_OWORD *)&retstr->location.double y = v7;
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __39__PKStrokeGenerator__latestStrokePoint__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v1 != *(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v3 = *(_OWORD *)(v1 - 40);
    long long v4 = *(_OWORD *)(v1 - 24);
    long long v5 = *(_OWORD *)(v1 - 56);
    *(void *)(v2 + 128) = *(void *)(v1 - 8);
    *(_OWORD *)(v2 + 96) = v3;
    *(_OWORD *)(v2 + 112) = v4;
    *(_OWORD *)(v2 + 80) = v5;
    __n128 result = *(__n128 *)(v1 - 88);
    long long v7 = *(_OWORD *)(v1 - 72);
    *(__n128 *)(v2 + 48) = result;
    *(_OWORD *)(v2 + 64) = v7;
  }
  return result;
}

- (int64_t)fetchFilteredPointsFromIndex:(int64_t)a3 accessBlock:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  outputQueue = self->_outputQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  double v11[2] = __62__PKStrokeGenerator_fetchFilteredPointsFromIndex_accessBlock___block_invoke;
  v11[3] = &unk_1E64CB500;
  v11[4] = self;
  id v12 = v6;
  long long v13 = &v15;
  int64_t v14 = a3;
  id v8 = v6;
  dispatch_sync(outputQueue, v11);
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __62__PKStrokeGenerator_fetchFilteredPointsFromIndex_accessBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72))
  {
    std::vector<_PKStrokePoint>::resize(v2 + 40, *(void *)(v2 + 64));
    uint64_t v3 = [*(id *)(a1 + 32) outputFilter];
    *(void *)(*(void *)(a1 + 32) + 64) = (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)v3 + 24))(v3, *(void *)(*(void *)(a1 + 32) + 64), *(void *)(a1 + 32) + 40);
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(v2 + 48) - *(void *)(v2 + 40)) >> 3);
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5 < 0 || v5 >= v4)
  {
    if (v5 > v4)
    {
      long long v7 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        uint64_t v8 = *(void *)(a1 + 56);
        int v9 = 134218240;
        uint64_t v10 = v8;
        __int16 v11 = 2048;
        uint64_t v12 = v4;
        _os_log_fault_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_FAULT, "fromIndex > outputPointsSize (%lu > %lu)", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    id v6 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    memcpy(v6, (const void *)(*(void *)(*(void *)(a1 + 32) + 40) + 88 * *(void *)(a1 + 56)), 88 * (v4 - *(void *)(a1 + 56)));
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 64);
}

- (id)newStrokeWithCurrentData
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__30;
  uint64_t v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PKStrokeGenerator_newStrokeWithCurrentData__block_invoke;
  v5[3] = &unk_1E64C5848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__PKStrokeGenerator_newStrokeWithCurrentData__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 32);
  id v6 = [v2[22] _strokeDataUUID];
  uint64_t v3 = objc_msgSend(v2, "_newStrokeWithCurrentDataAndStrokeDataUUID:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)newStrokeWithCurrentDataCopy
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__30;
  uint64_t v10 = __Block_byref_object_dispose__31;
  id v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PKStrokeGenerator_newStrokeWithCurrentDataCopy__block_invoke;
  v5[3] = &unk_1E64C5848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __49__PKStrokeGenerator_newStrokeWithCurrentDataCopy__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v3 = objc_msgSend(v2, "_newStrokeWithCurrentDataAndStrokeDataUUID:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_newStrokeWithCurrentDataAndStrokeDataUUID:(id)a3
{
  id v4 = a3;
  if (!self->_currentStroke
    || (uint64_t v5 = [(PKStrokeGenerator *)self compressionFilter],
        (*(void (**)(void *))(*(void *)v5 + 40))(v5),
        compressionFilter = self->_compressionFilter,
        compressionFilter[11] == compressionFilter[10]))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(PKStroke *)self->_currentStroke copyForMutation];
    if (self->_captureLiveData)
    {
      uint64_t v8 = [PKLiveStrokePath alloc];
      uint64_t v9 = compressionFilter[10];
      uint64_t v10 = compressionFilter[11];
      uint64_t v11 = *((void *)self->_compressionFilter + 9);
      int64_t currentInputType = self->_currentInputType;
      double timestamp = self->_baseValues.timestamp;
      int64_t v14 = v4;
      if (!v4)
      {
        int64_t v14 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v15 = [(PKLiveStrokePath *)v8 initWithPoints:v9 count:(v10 - v9) >> 5 immutableCount:v11 inputType:currentInputType timestamp:v14 UUID:&self->_drawPoints inputPoints:timestamp];
      objc_msgSend(v7, "set_strokeData:", v15);
    }
    else
    {
      long long v16 = [PKStrokePath alloc];
      uint64_t v17 = compressionFilter[10];
      uint64_t v18 = compressionFilter[11];
      uint64_t v19 = *((void *)self->_compressionFilter + 9);
      int64_t v20 = self->_currentInputType;
      double v21 = self->_baseValues.timestamp;
      int64_t v14 = v4;
      if (!v4)
      {
        int64_t v14 = [MEMORY[0x1E4F29128] UUID];
      }
      uint64_t v15 = [(PKStrokePath *)v16 initWithPoints:v17 count:(v18 - v17) >> 5 immutableCount:v19 inputType:v20 timestamp:v14 UUID:v21];
      objc_msgSend(v7, "set_strokeData:", v15);
    }

    if (!v4) {
    long long v22 = [v7 ink];
    }
    if ([v22 _isFountainPenInkV2] && objc_msgSend(v7, "requiredContentVersion") <= 2)
    {
      uint64_t v23 = [v22 _copyWithOriginalRequiredContentVersion];

      long long v22 = (void *)v23;
      [v7 _setInk:v23];
    }
    if (self->_shouldSetIsSafeForStyleInventorFlag) {
      [v7 _setIsSafeForStyleInventory:1];
    }
  }
  return v7;
}

- (void)drawingUpdatePoint:(id *)a3
{
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v5 = *(_OWORD *)&a3->var9;
  long long v14 = *(_OWORD *)&a3->var7;
  long long v15 = v5;
  long long v6 = *(_OWORD *)&a3->var13;
  long long v16 = *(_OWORD *)&a3->var11;
  long long v17 = v6;
  long long v7 = *(_OWORD *)&a3->var1;
  $047367E7237D93BB26E796C35D3A0ACE var0 = a3->var0;
  long long v11 = v7;
  long long v8 = *(_OWORD *)&a3->var5;
  long long v12 = *(_OWORD *)&a3->var3;
  long long v13 = v8;
  block[2] = __40__PKStrokeGenerator_drawingUpdatePoint___block_invoke;
  block[3] = &unk_1E64C7600;
  block[4] = self;
  dispatch_async(outputQueue, block);
  [(PKStrokeGenerator *)self drawingUpdateAllPoints];
}

void __40__PKStrokeGenerator_drawingUpdatePoint___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = (long long *)(a1 + 40);
  uint64_t v3 = (_OWORD *)v1[28];
  unint64_t v4 = v1[29];
  if ((unint64_t)v3 >= v4)
  {
    uint64_t v12 = v1[27];
    uint64_t v13 = ((uint64_t)v3 - v12) >> 7;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 57) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v4 - v12;
    if (v15 >> 6 > v14) {
      unint64_t v14 = v15 >> 6;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFF80) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)(v1 + 29), v16);
    }
    else {
      long long v17 = 0;
    }
    uint64_t v18 = &v17[128 * v13];
    uint64_t v19 = &v17[128 * v16];
    long long v20 = *v2;
    long long v21 = v2[1];
    long long v22 = v2[3];
    *((_OWORD *)v18 + 2) = v2[2];
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)uint64_t v18 = v20;
    *((_OWORD *)v18 + 1) = v21;
    long long v23 = v2[4];
    long long v24 = v2[5];
    long long v25 = v2[7];
    *((_OWORD *)v18 + 6) = v2[6];
    *((_OWORD *)v18 + 7) = v25;
    *((_OWORD *)v18 + 4) = v23;
    *((_OWORD *)v18 + 5) = v24;
    long long v11 = v18 + 128;
    long long v27 = (char *)v1[27];
    long long v26 = (char *)v1[28];
    if (v26 != v27)
    {
      do
      {
        long long v28 = *((_OWORD *)v26 - 8);
        long long v29 = *((_OWORD *)v26 - 7);
        long long v30 = *((_OWORD *)v26 - 5);
        *((_OWORD *)v18 - 6) = *((_OWORD *)v26 - 6);
        *((_OWORD *)v18 - 5) = v30;
        *((_OWORD *)v18 - 8) = v28;
        *((_OWORD *)v18 - 7) = v29;
        long long v31 = *((_OWORD *)v26 - 4);
        long long v32 = *((_OWORD *)v26 - 3);
        long long v33 = *((_OWORD *)v26 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v26 - 2);
        *((_OWORD *)v18 - 1) = v33;
        *((_OWORD *)v18 - 4) = v31;
        *((_OWORD *)v18 - 3) = v32;
        v18 -= 128;
        v26 -= 128;
      }
      while (v26 != v27);
      long long v26 = (char *)v1[27];
    }
    v1[27] = v18;
    v1[28] = v11;
    v1[29] = v19;
    if (v26) {
      operator delete(v26);
    }
  }
  else
  {
    long long v5 = *v2;
    long long v6 = *(_OWORD *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 88);
    v3[2] = *(_OWORD *)(a1 + 72);
    v3[3] = v7;
    _OWORD *v3 = v5;
    v3[1] = v6;
    long long v8 = *(_OWORD *)(a1 + 104);
    long long v9 = *(_OWORD *)(a1 + 120);
    long long v10 = *(_OWORD *)(a1 + 152);
    v3[6] = *(_OWORD *)(a1 + 136);
    v3[7] = v10;
    v3[4] = v8;
    v3[5] = v9;
    long long v11 = v3 + 8;
  }
  v1[28] = v11;
}

- (void)drawingUpdateAllPoints
{
}

- (void)drawingUpdateAllPointsDidTimeoutWithStrokeUUID:(id)a3
{
  id v4 = a3;
  outputQueue = self->_outputQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__PKStrokeGenerator_drawingUpdateAllPointsDidTimeoutWithStrokeUUID___block_invoke;
  v7[3] = &unk_1E64C5870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(outputQueue, v7);
}

uint64_t __68__PKStrokeGenerator_drawingUpdateAllPointsDidTimeoutWithStrokeUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawingUpdateAllPointsDidTimeoutWithStrokeUUID:*(void *)(a1 + 40)];
}

- (void)_drawingUpdateAllPointsDidTimeoutWithStrokeUUID:(id)a3
{
  id v6 = a3;
  if (!v6
    || ([(PKStroke *)self->_currentStroke _strokeUUID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isEqual:v6],
        v4,
        (v5 & 1) != 0))
  {
    [(PKStrokeGenerator *)self _drawingUpdateAllPointsDidTimeout:v6 != 0 updateSemaphore:1];
  }
}

- (void)_drawingUpdateAllPointsDidTimeout:(BOOL)a3 updateSemaphore:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  begin = self->_updatedDrawPoints.__begin_;
  end = self->_updatedDrawPoints.__end_;
  if (end == begin) {
    goto LABEL_25;
  }
  char v9 = 0;
  long long v10 = 0;
  long long v11 = self->_drawPoints.__begin_;
  uint64_t v12 = (self->_drawPoints.__end_ - v11) >> 7;
  uint64_t v13 = (char *)v11 + 80;
  unint64_t v14 = begin;
LABEL_3:
  while (2)
  {
    uint64_t v15 = v14;
    int64_t immutableCount = self->_immutableCount;
    uint64_t v17 = v12 - immutableCount;
    if (v12 > immutableCount)
    {
      uint64_t v18 = (double *)&v13[128 * immutableCount];
      do
      {
        if (*(void *)v18 == *((void *)v15 + 10))
        {
          double v19 = *((double *)v15 + 2);
          *(v18 - 8) = v19;
          if (self->_currentRollAngleEnabled && self->_enableDidUpdateRoll) {
            v18[3] = *((double *)v15 + 13);
          }
          if (!self->_currentInputType) {
            *(v18 - 8) = v19 / self->_touchSensitivity;
          }
          if (!*((void *)v15 + 15)) {
            *uint64_t v18 = NAN;
          }
          if (!self->_keepPredictedTouchesAtEndOfStroke)
          {
            unint64_t v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128);
            char v9 = 1;
            long long v10 = v15;
            if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128) == end) {
              goto LABEL_21;
            }
            goto LABEL_3;
          }
          char v9 = 1;
          long long v10 = v15;
        }
        v18 += 16;
        --v17;
      }
      while (v17);
    }
    unint64_t v14 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128);
    if (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128) != end) {
      continue;
    }
    break;
  }
  uint64_t v15 = v10;
  if (v9)
  {
LABEL_21:
    long long v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128);
    if (begin != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 + 128))
    {
      int64_t v21 = end - v20;
      if (end != v20) {
        memmove(begin, v20, end - v20);
      }
      self->_updatedDrawPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v21);
    }
  }
LABEL_25:
  [(PKStrokeGenerator *)self updateImmutableCount];
  if (self->_drawingEndedButNotFinished)
  {
    unint64_t v22 = self->_immutableCount;
    int64_t v23 = self->_drawPoints.__end_ - self->_drawPoints.__begin_;
    if (v22 >= v23 >> 7 || v5)
    {
      unint64_t v25 = v23 >> 7;
      self->_drawingEndedButNotFinished = 0;
      if (v22 < v25)
      {
        self->_int64_t immutableCount = v25;
        if (!v4) {
          return;
        }
        long long v26 = os_log_create("com.apple.pencilkit", "Stroke Generator");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v30) = 0;
          _os_log_debug_impl(&dword_1C44F8000, v26, OS_LOG_TYPE_DEBUG, "Timeout waiting for updates", (uint8_t *)&v30, 2u);
        }
      }
      else if (!v4)
      {
        return;
      }
      if (self->_missedUpdates >= 1)
      {
        long long v27 = os_log_create("com.apple.pencilkit", "Stroke Generator");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          int64_t v29 = self->_immutableCount;
          int64_t missedUpdates = self->_missedUpdates;
          int v30 = 134218240;
          int64_t v31 = missedUpdates;
          __int16 v32 = 2048;
          int64_t v33 = v29;
          _os_log_error_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_ERROR, "Missed updates at end of stroke: %lu (total points: %lu)", (uint8_t *)&v30, 0x16u);
        }
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_drawingWaitForFinishSemaphore);
    }
  }
}

- (void)updateImmutableCount
{
  uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
  [v3 systemUptime];
  double v5 = v4;

  if (![(PKStrokeGenerator *)self canSnapToRuler])
  {
    begin = self->_drawPoints.__begin_;
    uint64_t v7 = self->_drawPoints.__end_ - begin;
    if ((unint64_t)v7 >= 0x81)
    {
      uint64_t v8 = v7 >> 7;
      for (i = self->_immutableCount; i < v8; self->_int64_t immutableCount = i)
      {
        long long v10 = (char *)begin + 128 * i;
        uint64_t v12 = (uint64_t *)(v10 + 80);
        uint64_t v11 = *((void *)v10 + 10);
        if ((v11 & 0x8000000000000000) == 0)
        {
          if (*((double *)v10 + 8) >= v5 + -0.1) {
            return;
          }
          uint64_t *v12 = -1;
          ++self->_missedUpdates;
          uint64_t v11 = *v12;
        }
        if (v10[72]) {
          break;
        }
        if ((v11 & 0x8000000000000000) == 0) {
          break;
        }
        int64_t i = self->_immutableCount + 1;
      }
    }
  }
}

- (void)_removePredictedTouches
{
  begin = self->_drawPoints.__begin_;
  end = self->_drawPoints.__end_;
  p_drawPoints = &self->_drawPoints;
  int64_t v5 = end - begin;
  uint64_t v6 = (end - begin) >> 7;
  for (int64_t i = (unsigned __int8 *)begin + (v5 & 0xFFFFFFFFFFFFFF80) - 56; v6-- >= 1; i -= 128)
  {
    if (!*i)
    {
      std::vector<PKInputPoint>::resize((uint64_t)p_drawPoints, v6 + 1);
      return;
    }
  }
}

- (void)_updatePredictedTouches
{
  begin = self->_drawPoints.__begin_;
  uint64_t v3 = self->_drawPoints.__end_ - begin;
  uint64_t v4 = v3 >> 7;
  int64_t v5 = (double *)((char *)begin + (v3 & 0xFFFFFFFFFFFFFF80) + 24);
  uint64_t v6 = v3 >> 7;
  while (v6-- >= 1)
  {
    int v8 = *((unsigned __int8 *)v5 - 80);
    v5 -= 16;
    if (!v8)
    {
      uint64_t v9 = v6 + 1;
      if (v9 < v4)
      {
        char v10 = 0;
        double v11 = *(v5 - 1);
        double v12 = *v5;
        uint64_t v13 = *((void *)v5 + 1);
        uint64_t v14 = *((void *)v5 + 7);
        double v15 = v5[10];
        do
        {
          while (1)
          {
            unint64_t v16 = (double *)((char *)begin + 128 * v9);
            if (vabdd_f64(v16[2], v11) >= 0.00999999978)
            {
              v16[2] = v11;
              char v10 = 1;
            }
            double v18 = v16[3];
            uint64_t v17 = v16 + 3;
            if (vabdd_f64(v18, v12) >= 0.00999999978)
            {
              *uint64_t v17 = v12;
              char v10 = 1;
            }
            double v19 = (char *)begin + 128 * v9;
            if (vabdd_f64(*((double *)v19 + 4), v12) >= 0.00999999978)
            {
              *((void *)v19 + 4) = v13;
              char v10 = 1;
            }
            double v21 = *((double *)v19 + 13);
            long long v20 = (double *)(v19 + 104);
            if (vabdd_f64(v21, v15) < 0.00999999978) {
              break;
            }
            double *v20 = v15;
            int64_t v23 = (char *)begin + 128 * v9;
            *((void *)v23 + 10) = v14;
            v23[72] = 0;
            ++v9;
            char v10 = 1;
            if (v9 == v4) {
              goto LABEL_18;
            }
          }
          unint64_t v22 = (char *)begin + 128 * v9;
          *((void *)v22 + 10) = v14;
          v22[72] = 0;
          ++v9;
        }
        while (v9 != v4);
        if ((v10 & 1) == 0) {
          return;
        }
LABEL_18:
        self->_inputHasChanged = 1;
      }
      return;
    }
  }
}

- (double)latestNonPredictedTimestamp
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PKStrokeGenerator_latestNonPredictedTimestamp__block_invoke;
  v5[3] = &unk_1E64C5848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __48__PKStrokeGenerator_latestNonPredictedTimestamp__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 8);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)latestTimestamp
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PKStrokeGenerator_latestTimestamp__block_invoke;
  v5[3] = &unk_1E64C7628;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __36__PKStrokeGenerator_latestTimestamp__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  if (v3 != v2)
  {
    double result = *(double *)(v2 - 64);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)addPoints:()vector<PKInputPoint
{
  inputQueue = self->_inputQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3321888768;
  v4[2] = __31__PKStrokeGenerator_addPoints___block_invoke;
  _OWORD v4[3] = &unk_1F1FB0BD0;
  v4[4] = self;
  __p = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, a3->__begin_, (uint64_t)a3->__end_, (a3->__end_ - a3->__begin_) >> 7);
  dispatch_async(inputQueue, v4);
  if (__p)
  {
    uint64_t v6 = __p;
    operator delete(__p);
  }
}

void __31__PKStrokeGenerator_addPoints___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 176))
  {
    uint64_t v3 = *(NSObject **)(v1 + 400);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3321888768;
    v4[2] = __31__PKStrokeGenerator_addPoints___block_invoke_2;
    _OWORD v4[3] = &unk_1F1FB0BD0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    __p = 0;
    std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, *(const void **)(a1 + 40), *(void *)(a1 + 48), (uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 7);
    v4[4] = *(void *)(a1 + 32);
    dispatch_sync(v3, v4);
    if (__p)
    {
      uint64_t v6 = __p;
      operator delete(__p);
    }
  }
}

uint64_t __31__PKStrokeGenerator_addPoints___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48) - *(void *)(result + 40);
  if (v1 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    uint64_t v4 = (unint64_t)v1 >> 7;
    if (v4 <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = v4;
    }
    do
    {
      uint64_t v6 = *(void **)(v2 + 32);
      uint64_t v7 = (long long *)(*(void *)(v2 + 40) + v3);
      long long v8 = v7[3];
      long long v10 = *v7;
      long long v9 = v7[1];
      v14[2] = v7[2];
      v14[3] = v8;
      v14[0] = v10;
      v14[1] = v9;
      long long v11 = v7[7];
      long long v13 = v7[4];
      long long v12 = v7[5];
      v14[6] = v7[6];
      v14[7] = v11;
      v14[4] = v13;
      v14[5] = v12;
      double result = [v6 _drawingAddPoint:v14];
      v3 += 128;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (void)addPoint:(id *)a3
{
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v4 = *(_OWORD *)&a3->var9;
  long long v13 = *(_OWORD *)&a3->var7;
  long long v14 = v4;
  long long v5 = *(_OWORD *)&a3->var13;
  long long v15 = *(_OWORD *)&a3->var11;
  long long v16 = v5;
  long long v6 = *(_OWORD *)&a3->var1;
  $047367E7237D93BB26E796C35D3A0ACE var0 = a3->var0;
  long long v10 = v6;
  long long v7 = *(_OWORD *)&a3->var5;
  long long v11 = *(_OWORD *)&a3->var3;
  long long v12 = v7;
  block[2] = __30__PKStrokeGenerator_addPoint___block_invoke;
  block[3] = &unk_1E64C7600;
  block[4] = self;
  dispatch_async(inputQueue, block);
}

__n128 __30__PKStrokeGenerator_addPoint___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 176))
  {
    uint64_t v2 = *(NSObject **)(v1 + 400);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__PKStrokeGenerator_addPoint___block_invoke_2;
    block[3] = &unk_1E64C7600;
    block[4] = v1;
    long long v3 = *(_OWORD *)(a1 + 120);
    long long v12 = *(_OWORD *)(a1 + 104);
    long long v13 = v3;
    long long v14 = *(_OWORD *)(a1 + 136);
    long long v15 = *(_OWORD *)(a1 + 152);
    long long v4 = *(_OWORD *)(a1 + 56);
    long long v8 = *(_OWORD *)(a1 + 40);
    long long v9 = v4;
    long long v5 = *(_OWORD *)(a1 + 88);
    long long v10 = *(_OWORD *)(a1 + 72);
    long long v11 = v5;
    dispatch_sync(v2, block);
  }
  return result;
}

uint64_t __30__PKStrokeGenerator_addPoint___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  void v7[5] = v2;
  long long v3 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v5;
  return [v1 _drawingAddPoint:v7];
}

- (void)closeStroke
{
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PKStrokeGenerator_closeStroke__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_async(inputQueue, block);
}

void __32__PKStrokeGenerator_closeStroke__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 176))
  {
    long long v2 = *(NSObject **)(v1 + 400);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PKStrokeGenerator_closeStroke__block_invoke_2;
    block[3] = &unk_1E64C5368;
    block[4] = v1;
    dispatch_sync(v2, block);
  }
}

uint64_t __32__PKStrokeGenerator_closeStroke__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removePredictedTouches];
  long long v2 = *(double **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  double v4 = *(double *)(v3 - 128);
  double v5 = *(double *)(v3 - 120);
  long long v6 = *(_OWORD *)(v3 - 32);
  long long v27 = *(_OWORD *)(v3 - 48);
  long long v28 = v6;
  long long v29 = *(_OWORD *)(v3 - 16);
  long long v7 = *(_OWORD *)(v3 - 96);
  long long v23 = *(_OWORD *)(v3 - 112);
  long long v24 = v7;
  long long v8 = *(_OWORD *)(v3 - 64);
  long long v25 = *(_OWORD *)(v3 - 80);
  long long v26 = v8;
  double v9 = *v2;
  double v10 = v2[1];
  double v11 = 1.0 / (double)(uint64_t)fmax(sqrt((v10 - v5) * (v10 - v5) + (*v2 - v4) * (*v2 - v4)) / 6.0, 2.0);
  double v12 = 0.0;
  do
  {
    long long v13 = *(void **)(a1 + 32);
    v15[0] = v9 * v12 + v4 * (1.0 - v12);
    v15[1] = v10 * v12 + v5 * (1.0 - v12);
    long long v20 = v27;
    long long v21 = v28;
    long long v22 = v29;
    long long v16 = v23;
    long long v17 = v24;
    long long v18 = v25;
    long long v19 = v26;
    uint64_t result = [v13 _drawingAddPoint:v15];
    double v12 = v11 + v12;
  }
  while (v12 <= 1.0);
  return result;
}

- (void)_drawingAddPoint:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_allInputPointFilters count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    double v5 = self->_allInputPointFilters;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v63 != v7) {
            objc_enumerationMutation(v5);
          }
          double v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          long long v10 = *(_OWORD *)&a3->var9;
          v61[4] = *(_OWORD *)&a3->var7;
          v61[5] = v10;
          long long v11 = *(_OWORD *)&a3->var13;
          v61[6] = *(_OWORD *)&a3->var11;
          v61[7] = v11;
          long long v12 = *(_OWORD *)&a3->var1;
          v61[0] = a3->var0;
          v61[1] = v12;
          long long v13 = *(_OWORD *)&a3->var5;
          v61[2] = *(_OWORD *)&a3->var3;
          v61[3] = v13;
          objc_msgSend(v9, "addInputPoint:", v61, *(_OWORD *)&v53, v54, v55, v56, v57, v58, v59, v60);
          if (v9)
          {
            [v9 currentFilteredPoint];
          }
          else
          {
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            $047367E7237D93BB26E796C35D3A0ACE v53 = 0u;
            long long v54 = 0u;
          }
          *(_OWORD *)&a3->double var7 = v57;
          *(_OWORD *)&a3->var9 = v58;
          *(_OWORD *)&a3->var11 = v59;
          *(_OWORD *)&a3->var13 = v60;
          a3->$047367E7237D93BB26E796C35D3A0ACE var0 = v53;
          *(_OWORD *)&a3->double var1 = v54;
          *(_OWORD *)&a3->var3 = v55;
          *(_OWORD *)&a3->var5 = v56;
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v6);
    }
  }
  self->_inputHasChanged = 1;
  if (!a3->var8)
  {
    long double currentStrokeRollBaseValue = self->_currentStrokeRollBaseValue;
    double var12 = a3->var12;
    if (currentStrokeRollBaseValue >= 0.0)
    {
      DKDDiffAngleInRadians(a3->var12, currentStrokeRollBaseValue);
      if (v18 >= self->_currentStrokeRollDeltaMin)
      {
        if (v18 > self->_currentStrokeRollDeltaMax) {
          self->_currentStrokeRollDeltaMadouble x = v18;
        }
      }
      else
      {
        self->_currentStrokeRollDeltaMin = v18;
      }
    }
    else
    {
      long double v16 = fmod(a3->var12, 6.28318531);
      if (var12 <= 6.28318531 && var12 >= 0.0) {
        long double v16 = var12;
      }
      if (v16 < 0.0) {
        long double v16 = v16 + 6.28318531;
      }
      if (v16 == 0.0) {
        long double v16 = 0.0;
      }
      self->_long double currentStrokeRollBaseValue = v16;
      self->_currentStrokeRollDeltaMin = 0.0;
      self->_currentStrokeRollDeltaMadouble x = 0.0;
    }
    double var7 = a3->var7;
    if (var7 < self->_latestNonPredictedTimestamp) {
      double var7 = self->_latestNonPredictedTimestamp;
    }
    self->_latestNonPredictedTimestamp = var7;
    [(PKStrokeGenerator *)self _removePredictedTouches];
  }
  -[PKStrokeGenerator snapPointToRuler:](self, "snapPointToRuler:", a3->var0.var0.x, a3->var0.var0.y, *(_OWORD *)&v53, v54, v55, v56, v57, v58, v59, v60);
  a3->var0.var0.double x = v20;
  a3->var0.var0.double y = v21;
  if (a3->var8) {
    a3->var9 = -1;
  }
  value = self->_drawPoints.__end_cap_.__value_;
  end = self->_drawPoints.__end_;
  if (end >= value)
  {
    begin = self->_drawPoints.__begin_;
    uint64_t v32 = (end - begin) >> 7;
    unint64_t v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 57) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v34 = value - begin;
    if (v34 >> 6 > v33) {
      unint64_t v33 = v34 >> 6;
    }
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFF80) {
      unint64_t v35 = 0x1FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v35 = v33;
    }
    if (v35) {
      v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_drawPoints.__end_cap_, v35);
    }
    else {
      v36 = 0;
    }
    v37 = &v36[128 * v32];
    id v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v36[128 * v35];
    $047367E7237D93BB26E796C35D3A0ACE var0 = a3->var0;
    long long v40 = *(_OWORD *)&a3->var1;
    long long v41 = *(_OWORD *)&a3->var5;
    *((_OWORD *)v37 + 2) = *(_OWORD *)&a3->var3;
    *((_OWORD *)v37 + 3) = v41;
    *($047367E7237D93BB26E796C35D3A0ACE *)v37 = var0;
    *((_OWORD *)v37 + 1) = v40;
    long long v42 = *(_OWORD *)&a3->var7;
    long long v43 = *(_OWORD *)&a3->var9;
    long long v44 = *(_OWORD *)&a3->var13;
    *((_OWORD *)v37 + 6) = *(_OWORD *)&a3->var11;
    *((_OWORD *)v37 + 7) = v44;
    *((_OWORD *)v37 + 4) = v42;
    *((_OWORD *)v37 + 5) = v43;
    int v30 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v37 + 128);
    v46 = self->_drawPoints.__begin_;
    uint64_t v45 = self->_drawPoints.__end_;
    if (v45 != v46)
    {
      do
      {
        long long v47 = *((_OWORD *)v45 - 8);
        long long v48 = *((_OWORD *)v45 - 7);
        long long v49 = *((_OWORD *)v45 - 5);
        *((_OWORD *)v37 - 6) = *((_OWORD *)v45 - 6);
        *((_OWORD *)v37 - 5) = v49;
        *((_OWORD *)v37 - 8) = v47;
        *((_OWORD *)v37 - 7) = v48;
        long long v50 = *((_OWORD *)v45 - 4);
        long long v51 = *((_OWORD *)v45 - 3);
        long long v52 = *((_OWORD *)v45 - 1);
        *((_OWORD *)v37 - 2) = *((_OWORD *)v45 - 2);
        *((_OWORD *)v37 - 1) = v52;
        *((_OWORD *)v37 - 4) = v50;
        *((_OWORD *)v37 - 3) = v51;
        v37 -= 128;
        uint64_t v45 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v45 - 128);
      }
      while (v45 != v46);
      uint64_t v45 = self->_drawPoints.__begin_;
    }
    self->_drawPoints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v37;
    self->_drawPoints.__end_ = v30;
    self->_drawPoints.__end_cap_.__value_ = v38;
    if (v45) {
      operator delete(v45);
    }
  }
  else
  {
    $047367E7237D93BB26E796C35D3A0ACE v24 = a3->var0;
    long long v25 = *(_OWORD *)&a3->var1;
    long long v26 = *(_OWORD *)&a3->var5;
    *((_OWORD *)end + 2) = *(_OWORD *)&a3->var3;
    *((_OWORD *)end + 3) = v26;
    *($047367E7237D93BB26E796C35D3A0ACE *)end = v24;
    *((_OWORD *)end + 1) = v25;
    long long v27 = *(_OWORD *)&a3->var7;
    long long v28 = *(_OWORD *)&a3->var9;
    long long v29 = *(_OWORD *)&a3->var13;
    *((_OWORD *)end + 6) = *(_OWORD *)&a3->var11;
    *((_OWORD *)end + 7) = v29;
    *((_OWORD *)end + 4) = v27;
    *((_OWORD *)end + 5) = v28;
    int v30 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
  }
  self->_drawPoints.__end_ = v30;
  [(PKStrokeGenerator *)self updateRulerSnapping];
  [(PKStrokeGenerator *)self drawingUpdateAllPoints];
  [(PKStrokeGenerator *)self updateImmutableCount];
  -[PKStrokeGenerator setLastPoint:](self, "setLastPoint:", a3->var0.var0.x, a3->var0.var0.y);
}

- (void)drawingEndedEstimatesTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke;
  block[3] = &unk_1E64CB528;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(inputQueue, block);
  -[PKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY);
}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 176))
  {
    long long v2 = os_log_create("com.apple.pencilkit", "Stroke Generator");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Drawing ended", buf, 2u);
    }

    *(void *)buf = 0;
    long long v25 = buf;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__30;
    long long v28 = __Block_byref_object_dispose__31;
    id v29 = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(NSObject **)(v3 + 400);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_36;
    block[3] = &unk_1E64C7628;
    block[4] = v3;
    void block[5] = buf;
    dispatch_sync(v4, block);
    if (*((void *)v25 + 5))
    {
      double v5 = *(double *)(a1 + 48);
      id v6 = os_log_create("com.apple.pencilkit", "Stroke Generator");
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
      if (v5 <= 0.0)
      {
        if (v7)
        {
          *(_WORD *)long long v22 = 0;
          _os_log_debug_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEBUG, "No estimates timeout", v22, 2u);
        }

        [*(id *)(a1 + 32) _drawingUpdateAllPointsDidTimeout:1 updateSemaphore:0];
        long long v12 = (void *)*((void *)v25 + 5);
        *((void *)v25 + 5) = 0;
      }
      else
      {
        if (v7)
        {
          *(_WORD *)long long v22 = 0;
          _os_log_debug_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEBUG, "Waiting for estimates", v22, 2u);
        }

        dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = *(NSObject **)(v9 + 400);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_37;
        v21[3] = &unk_1E64C7628;
        v21[4] = v9;
        v21[5] = buf;
        dispatch_after(v8, v10, v21);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 248), 0xFFFFFFFFFFFFFFFFLL);
      }
    }
    long long v13 = os_log_create("com.apple.pencilkit", "Stroke Generator");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEBUG, "Finishing drawing ended", v22, 2u);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = *(NSObject **)(v14 + 400);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_38;
    v20[3] = &unk_1E64C5368;
    v20[4] = v14;
    dispatch_sync(v15, v20);
    long double v16 = +[PKLocalStrokeTracker sharedInstance]();
    -[PKLocalStrokeTracker addStroke:]((uint64_t)v16, *(void **)(*(void *)(a1 + 32) + 176));

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v17 = *(void *)(a1 + 32);
    double v18 = *(NSObject **)(v17 + 400);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_2;
    v19[3] = &unk_1E64C5368;
    v19[4] = v17;
    dispatch_sync(v18, v19);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v11();
  }
}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_36(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  long long v2 = *(unsigned char **)(a1 + 32);
  if (v2[256]) {
    [v2 _updatePredictedTouches];
  }
  else {
    [v2 _removePredictedTouches];
  }
  [*(id *)(a1 + 32) setCanSnapToRuler:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 440) + 40) = 0;
  uint64_t v3 = [*(id *)(a1 + 32) outputFilter];
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  [*(id *)(a1 + 32) updateImmutableCount];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 200) != (uint64_t)(*(void *)(v4 + 24) - *(void *)(v4 + 16)) >> 7)
  {
    uint64_t v5 = [*(id *)(v4 + 176) _strokeUUID];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
  }
}

uint64_t __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_37(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawingUpdateAllPointsDidTimeoutWithStrokeUUID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_38(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _newStrokeWithCurrentDataAndStrokeDataUUID:0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 176);
  *(void *)(v3 + 176) = v2;
}

void __61__PKStrokeGenerator_drawingEndedEstimatesTimeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) outputFilter];
  (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 176);
  *(void *)(v3 + 176) = 0;
}

- (void)drawingCancelledWithCompletion:(id)a3
{
  id v4 = a3;
  inputQueue = self->_inputQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke;
  id v10 = &unk_1E64C53B8;
  double v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(inputQueue, &v7);
  -[PKStrokeGenerator setLastPoint:](self, "setLastPoint:", INFINITY, INFINITY, v7, v8, v9, v10, v11);
}

void __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = os_log_create("com.apple.pencilkit", "Stroke Generator");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEBUG, "Drawing cancelled", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 400);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke_40;
  block[3] = &unk_1E64C5368;
  block[4] = v3;
  dispatch_sync(v4, block);
}

void __52__PKStrokeGenerator_drawingCancelledWithCompletion___block_invoke_40(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) outputFilter];
  (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 176);
  *(void *)(v3 + 176) = 0;
}

+ (vector<PKInputPoint,)inputPointsFromPoints:(id)a2 velocityForDistanceFunction:(SEL)a3
{
  uint64_t v7 = (double (**)(void, double))a5;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = (double (**)(void, double))&__block_literal_global_91;
  }
  __p = 0;
  v46 = 0;
  uint64_t v47 = 0;
  PKArcLengthsFromPointArray((uint64_t *)a4, (uint64_t)&__p);
  uint64_t v9 = *((void *)a4 + 1) - *(void *)a4;
  if (!v9)
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    double v12 = 0.0;
    retstr->__end_cap_.__value_ = 0;
LABEL_12:
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (*((void *)a4 + 1) != *(void *)a4)
    {
      double v15 = v14;
      unint64_t v16 = 0;
      double v17 = 0.0;
      long long v43 = xmmword_1C482BB00;
      do
      {
        +[PKInkProperties rangeForInput:](PKInkProperties, "rangeForInput:", 1, v43);
        double v19 = v18;
        +[PKInkProperties rangeForInput:1];
        double v21 = fmin(v19, fmax(v20, v8[2](v8, v17 / v12)));
        double v22 = *((double *)__p + v16);
        double v15 = v15 + v22 / v21;
        long long v23 = (long long *)(*(void *)a4 + 16 * v16);
        long long v44 = *v23;
        end = retstr->__end_;
        value = retstr->__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v27 = (end - retstr->__begin_) >> 7;
          unint64_t v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 57) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v29 = value - retstr->__begin_;
          if (v29 >> 6 > v28) {
            unint64_t v28 = v29 >> 6;
          }
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFF80) {
            unint64_t v30 = 0x1FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30) {
            int64_t v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&retstr->__end_cap_, v30);
          }
          else {
            int64_t v31 = 0;
          }
          uint64_t v32 = &v31[128 * v27];
          *(_OWORD *)uint64_t v32 = v44;
          *((void *)v32 + 2) = 0xBFF0000000000000;
          *(_OWORD *)(v32 + 24) = 0u;
          *(_OWORD *)(v32 + 40) = 0u;
          *((void *)v32 + 7) = 0;
          *((double *)v32 + 8) = v15;
          *(_OWORD *)(v32 + 72) = v43;
          *(_OWORD *)(v32 + 88) = 0u;
          *(_OWORD *)(v32 + 104) = 0u;
          *((void *)v32 + 15) = 0;
          begin = retstr->__begin_;
          unint64_t v33 = retstr->__end_;
          unint64_t v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v32;
          if (v33 != retstr->__begin_)
          {
            do
            {
              long long v36 = *((_OWORD *)v33 - 8);
              long long v37 = *((_OWORD *)v33 - 7);
              long long v38 = *((_OWORD *)v33 - 5);
              *((_OWORD *)v35 - 6) = *((_OWORD *)v33 - 6);
              *((_OWORD *)v35 - 5) = v38;
              *((_OWORD *)v35 - 8) = v36;
              *((_OWORD *)v35 - 7) = v37;
              long long v39 = *((_OWORD *)v33 - 4);
              long long v40 = *((_OWORD *)v33 - 3);
              long long v41 = *((_OWORD *)v33 - 1);
              *((_OWORD *)v35 - 2) = *((_OWORD *)v33 - 2);
              *((_OWORD *)v35 - 1) = v41;
              *((_OWORD *)v35 - 4) = v39;
              *((_OWORD *)v35 - 3) = v40;
              unint64_t v35 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v35 - 128);
              unint64_t v33 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v33 - 128);
            }
            while (v33 != begin);
            unint64_t v33 = begin;
          }
          uint64_t v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v32 + 128);
          retstr->__begin_ = v35;
          retstr->__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v32 + 128);
          retstr->__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v31[128 * v30];
          if (v33) {
            operator delete(v33);
          }
        }
        else
        {
          *(_OWORD *)end = *v23;
          *((void *)end + 2) = 0xBFF0000000000000;
          *(_OWORD *)((char *)end + 24) = 0u;
          *(_OWORD *)((char *)end + 40) = 0u;
          *((void *)end + 7) = 0;
          *((double *)end + 8) = v15;
          *(_OWORD *)((char *)end + 72) = v43;
          *(_OWORD *)((char *)end + 88) = 0u;
          *(_OWORD *)((char *)end + 104) = 0u;
          uint64_t v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
          *((void *)end + 15) = 0;
        }
        retstr->__end_ = v26;
        double v17 = v17 + v22;
        ++v16;
      }
      while (v16 < (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4);
    }
    goto LABEL_31;
  }
  unint64_t v10 = v9 >> 4;
  double v11 = (double *)__p;
  if (v10 <= 1) {
    unint64_t v10 = 1;
  }
  double v12 = 0.0;
  do
  {
    double v13 = *v11++;
    double v12 = v12 + v13;
    --v10;
  }
  while (v10);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  if (v12 >= 0.0) {
    goto LABEL_12;
  }
LABEL_31:
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }

  return result;
}

uint64_t __71__PKStrokeGenerator_inputPointsFromPoints_velocityForDistanceFunction___block_invoke()
{
  return +[PKInkProperties rangeForInput:1];
}

+ (vector<PKInputPoint,)inputPointsFromPath:(id)a2 maxSegmentLength:(SEL)a3 velocityForDistanceFunction:(CGPath *)a4
{
  id v9 = a6;
  __p = 0;
  double v12 = 0;
  uint64_t v13 = 0;
  PKPointsFromPath(a4, (const void **)&__p, a5, 0.0);
  [a2 inputPointsFromPoints:&__p velocityForDistanceFunction:v9];
  if (__p)
  {
    double v12 = __p;
    operator delete(__p);
  }

  return result;
}

- (id)strokeFromInputPoints:(void *)a3 inputType:(int64_t)a4 ink:(id)a5 inputScale:(double)a6 randomSeed:(unsigned int)a7 strokeClass:(Class)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a5;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__30;
  unint64_t v30 = __Block_byref_object_dispose__31;
  id v31 = objc_alloc_init(a8);
  [(id)v27[5] _setInk:v14];
  [(id)v27[5] _setRandomSeed:v9];
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    if (a4) {
      uint64_t v16 = 23;
    }
    else {
      uint64_t v16 = 8;
    }
    [(PKStrokeGenerator *)self drawingBeganWithStroke:v27[5] inputType:a4 activeInputProperties:v16 inputScale:0 start:a6];
    __p = 0;
    $047367E7237D93BB26E796C35D3A0ACE v24 = 0;
    uint64_t v25 = 0;
    std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, *(const void **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 7);
    [(PKStrokeGenerator *)self addPoints:&__p];
    if (__p)
    {
      $047367E7237D93BB26E796C35D3A0ACE v24 = __p;
      operator delete(__p);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__PKStrokeGenerator_strokeFromInputPoints_inputType_ink_inputScale_randomSeed_strokeClass___block_invoke;
    v20[3] = &unk_1E64CB570;
    double v22 = &v26;
    double v17 = v15;
    double v21 = v17;
    [(PKStrokeGenerator *)self drawingEndedEstimatesTimeout:v20 completion:0.0];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __91__PKStrokeGenerator_strokeFromInputPoints_inputType_ink_inputScale_randomSeed_strokeClass___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)strokeFromPath:(CGPath *)a3 ink:(id)a4 inputScale:(double)a5 maxSegmentLength:(double)a6 velocityForDistanceFunction:(id)a7 strokeClass:(Class)a8
{
  id v14 = a4;
  id v15 = a7;
  uint64_t v16 = objc_opt_class();
  if (v16)
  {
    [v16 inputPointsFromPath:a3 maxSegmentLength:v15 velocityForDistanceFunction:a6];
  }
  else
  {
    __p = 0;
    double v20 = 0;
    uint64_t v21 = 0;
  }
  double v17 = [(PKStrokeGenerator *)self strokeFromInputPoints:&__p inputType:0 ink:v14 inputScale:arc4random() randomSeed:a8 strokeClass:a5];
  if (__p)
  {
    double v20 = __p;
    operator delete(__p);
  }

  return v17;
}

- (id)strokeFromPoints:(CGPoint *)a3 count:(unint64_t)a4 ink:(id)a5 inputScale:(double)a6 strokeClass:(Class)a7
{
  id v12 = a5;
  double v19 = 0;
  double v20 = 0;
  uint64_t v21 = 0;
  std::vector<CGPoint>::__init_with_size[abi:ne180100]<CGPoint*,CGPoint*>(&v19, a3, (uint64_t)&a3[a4], a4);
  uint64_t v13 = objc_opt_class();
  if (v13)
  {
    [v13 inputPointsFromPoints:&v19 velocityForDistanceFunction:0];
  }
  else
  {
    __p = 0;
    double v17 = 0;
    uint64_t v18 = 0;
  }
  id v14 = [(PKStrokeGenerator *)self strokeFromInputPoints:&__p inputType:0 ink:v12 inputScale:arc4random() randomSeed:a7 strokeClass:a6];
  if (__p)
  {
    double v17 = __p;
    operator delete(__p);
  }
  if (v19)
  {
    double v20 = v19;
    operator delete(v19);
  }

  return v14;
}

- (id)strokeFromPoints:(const void *)a3 sourceStroke:(id)a4 inputScale:(double)a5 averageInputPoint:(id *)a6
{
  id v10 = a4;
  double v11 = objc_opt_class();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __80__PKStrokeGenerator_strokeFromPoints_sourceStroke_inputScale_averageInputPoint___block_invoke;
  v30[3] = &__block_descriptor_160_e8_d16__0d8l;
  long long v12 = *(_OWORD *)&a6->var9;
  long long v35 = *(_OWORD *)&a6->var7;
  long long v36 = v12;
  long long v13 = *(_OWORD *)&a6->var13;
  long long v37 = *(_OWORD *)&a6->var11;
  long long v38 = v13;
  long long v14 = *(_OWORD *)&a6->var1;
  $047367E7237D93BB26E796C35D3A0ACE var0 = a6->var0;
  long long v32 = v14;
  long long v15 = *(_OWORD *)&a6->var3;
  long long v16 = *(_OWORD *)&a6->var5;
  long long v33 = v15;
  long long v34 = v16;
  if (v11)
  {
    [v11 inputPointsFromPoints:a3 velocityForDistanceFunction:v30];
    double v17 = (double *)v39;
    if (v40 != v39)
    {
      unint64_t v18 = (v40 - v39) >> 7;
      *(void *)&long long v16 = *(void *)v39;
      *(void *)&long long v15 = *((void *)v39 + 1);
      if (v18 <= 1) {
        unint64_t v18 = 1;
      }
      do
      {
        double v19 = *v17;
        double v20 = v17[1];
        double var12 = a6->var12;
        double var5 = a6->var5;
        double v23 = (v20 - *(double *)&v15) * (v20 - *(double *)&v15) + (*v17 - *(double *)&v16) * (*v17 - *(double *)&v16);
        long long v24 = *(_OWORD *)&a6->var3;
        *((_OWORD *)v17 + 1) = *(_OWORD *)&a6->var1;
        *((_OWORD *)v17 + 2) = v24;
        v17[6] = var5;
        v17[11] = sqrt(v23);
        v17[13] = var12;
        v17 += 16;
        *(double *)&long long v15 = v20;
        *(double *)&long long v16 = v19;
        --v18;
      }
      while (v18);
    }
  }
  else
  {
    long long v39 = 0;
    long long v40 = 0;
    uint64_t v41 = 0;
  }
  uint64_t v25 = objc_msgSend(v10, "_inputType", *(double *)&v15, *(double *)&v16);
  uint64_t v26 = [v10 ink];
  uint64_t v27 = arc4random();
  uint64_t v28 = [(PKStrokeGenerator *)self strokeFromInputPoints:&v39 inputType:v25 ink:v26 inputScale:v27 randomSeed:objc_opt_class() strokeClass:a5];

  if (v39)
  {
    long long v40 = v39;
    operator delete(v39);
  }

  return v28;
}

double __80__PKStrokeGenerator_strokeFromPoints_sourceStroke_inputScale_averageInputPoint___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 72);
}

- (id)strokeFromLineSegments:(const void *)a3 maxSegmentLength:(double)a4 ink:(id)a5 inputScale:(double)a6 strokeClass:(Class)a7
{
  id v38 = a5;
  __p = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  long long v40 = 0;
  uint64_t v41 = 0;
  uint64_t v11 = ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4) - 1;
  do
  {
    unint64_t v12 = 0;
    long long v13 = (double *)(*(void *)a3 + 16 * v10);
    double v14 = *v13;
    double v15 = v13[1];
    ++v10;
    long long v16 = (double *)(*(void *)a3 + 16 * v10);
    double v17 = v16[1];
    double v18 = sqrt((v15 - v17) * (v15 - v17) + (*v13 - *v16) * (*v13 - *v16)) / a4;
    unint64_t v19 = vcvtpd_u64_f64(v18);
    double v20 = (double)(unint64_t)ceil(v18);
    double v21 = *v16 - *v13;
    double v22 = v17 - v15;
    do
    {
      double v23 = (double)v12 / v20;
      double v24 = v14 + v21 * v23;
      double v25 = v15 + v22 * v23;
      if (v9 >= v41)
      {
        uint64_t v26 = __p;
        uint64_t v27 = ((char *)v9 - (char *)__p) >> 4;
        unint64_t v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 60) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v29 = (char *)v41 - (char *)__p;
        if (v41 - __p > v28) {
          unint64_t v28 = v29 >> 3;
        }
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v30 = v28;
        }
        if (v30)
        {
          id v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v41, v30);
          uint64_t v26 = __p;
          uint64_t v9 = v40;
        }
        else
        {
          id v31 = 0;
        }
        long long v32 = (double *)&v31[16 * v27];
        double *v32 = v24;
        v32[1] = v25;
        long long v33 = v32;
        if (v9 != v26)
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)v9 - 1);
            v33 -= 2;
            v9 -= 2;
          }
          while (v9 != v26);
          uint64_t v26 = __p;
        }
        uint64_t v9 = v32 + 2;
        __p = v33;
        uint64_t v41 = (double *)&v31[16 * v30];
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        *uint64_t v9 = v24;
        v9[1] = v25;
        v9 += 2;
      }
      long long v40 = v9;
      ++v12;
    }
    while (v12 <= v19);
  }
  while (v10 != v11);
  long long v34 = -[PKStrokeGenerator strokeFromPoints:count:ink:inputScale:strokeClass:](self, "strokeFromPoints:count:ink:inputScale:strokeClass:", a6);
  if (__p) {
    operator delete(__p);
  }

  return v34;
}

- (void)whenFinishedProcessingPointsCallCompletion:(id)a3
{
  id v4 = a3;
  inputQueue = self->_inputQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke;
  v7[3] = &unk_1E64C5E48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(inputQueue, v7);
}

void __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 400);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke_2;
  block[3] = &unk_1E64C5390;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __64__PKStrokeGenerator_whenFinishedProcessingPointsCallCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)captureLiveData
{
  return self->_captureLiveData;
}

- (void)setCaptureLiveData:(BOOL)a3
{
  self->_captureLiveData = a3;
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
}

- (double)additionalRollAngle
{
  return self->_additionalRollAngle;
}

- (void)setAdditionalRollAngle:(double)a3
{
  self->_additionalRollAngle = a3;
}

- (BOOL)rollAngleEnabled
{
  return self->_rollAngleEnabled;
}

- (void)setRollAngleEnabled:(BOOL)a3
{
  self->_rollAngleEnabled = a3;
}

- (BOOL)shouldClearAzimuth
{
  return self->_shouldClearAzimuth;
}

- (void)setShouldClearAzimuth:(BOOL)a3
{
  self->_shouldClearAzimuth = a3;
}

- (CGAffineTransform)rulerTransform
{
  long long v3 = *(_OWORD *)&self[13].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[13].c;
  return self;
}

- (void)setRulerTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_rulerTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_rulerTransform.tdouble x = v4;
  *(_OWORD *)&self->_rulerTransform.a = v3;
}

- (BOOL)useRuler
{
  return self->_useRuler;
}

- (void)setUseRuler:(BOOL)a3
{
  self->_useRuler = a3;
}

- (double)rulerWidth
{
  return self->_rulerWidth;
}

- (void)setRulerWidth:(double)a3
{
  self->_rulerWidth = a3;
}

- (BOOL)isSnappedToRulerTopSide
{
  return self->_isSnappedToRulerTopSide;
}

- (void)setIsSnappedToRulerTopSide:(BOOL)a3
{
  self->_isSnappedToRulerTopSide = a3;
}

- (BOOL)canSnapToRuler
{
  return self->_canSnapToRuler;
}

- (void)setCanSnapToRuler:(BOOL)a3
{
  self->_canSnapToRuler = a3;
}

- (double)strokeMaxForce
{
  return self->_strokeMaxForce;
}

- (void)setStrokeMaxForce:(double)a3
{
  self->_double strokeMaxForce = a3;
}

- (CGPoint)lastPoint
{
  objc_copyStruct(v4, &self->_lastPoint, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setLastPoint:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_lastPoint, &v3, 16, 1, 0);
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputQueue:(id)a3
{
}

- (double)touchSensitivity
{
  return self->_touchSensitivity;
}

- (void)setTouchSensitivity:(double)a3
{
  self->_touchSensitivitdouble y = a3;
}

- (void)inputProvider
{
  return self->_inputProvider;
}

- (void)setInputProvider:(void *)a3
{
  self->_inputProvider = a3;
}

- (void)pixelSmoothingFilter
{
  return self->_pixelSmoothingFilter;
}

- (void)setPixelSmoothingFilter:(void *)a3
{
  self->_pixelSmoothingFilter = a3;
}

- (void)pointReductionFilter
{
  return self->_pointReductionFilter;
}

- (void)setPointReductionFilter:(void *)a3
{
  self->_pointReductionFilter = a3;
}

- (void)startHookFilter
{
  return self->_startHookFilter;
}

- (void)setStartHookFilter:(void *)a3
{
  self->_startHookFilter = a3;
}

- (void)endHookFilter
{
  return self->_endHookFilter;
}

- (void)setEndHookFilter:(void *)a3
{
  self->_endHookFilter = a3;
}

- (void)velocityFilter
{
  return self->_velocityFilter;
}

- (void)setVelocityFilter:(void *)a3
{
  self->_velocityFilter = a3;
}

- (void)directionAngleFilter
{
  return self->_directionAngleFilter;
}

- (void)setDirectionAngleFilter:(void *)a3
{
  self->_directionAngleFilter = a3;
}

- (void)inputSmoother
{
  return self->_inputSmoother;
}

- (void)setInputSmoother:(void *)a3
{
  self->_inputSmoother = a3;
}

- (void)noiseSmoother
{
  return self->_noiseSmoother;
}

- (void)setNoiseSmoother:(void *)a3
{
  self->_noiseSmoother = a3;
}

- (void)propertySmoother
{
  return self->_propertySmoother;
}

- (void)setPropertySmoother:(void *)a3
{
  self->_propertySmoother = a3;
}

- (void)inputToOutputFilter
{
  return self->_inputToOutputFilter;
}

- (void)setInputToOutputFilter:(void *)a3
{
  self->_inputToOutputFilter = a3;
}

- (void)startCapFilter
{
  return self->_startCapFilter;
}

- (void)setStartCapFilter:(void *)a3
{
  self->_startCapFilter = a3;
}

- (void)animationFilter
{
  return self->_animationFilter;
}

- (void)setAnimationFilter:(void *)a3
{
  self->_animationFilter = a3;
}

- (void)azimuthFilter
{
  return self->_azimuthFilter;
}

- (void)setAzimuthFilter:(void *)a3
{
  self->_azimuthFilter = a3;
}

- (void)endCapFilter
{
  return self->_endCapFilter;
}

- (void)setEndCapFilter:(void *)a3
{
  self->_endCapFilter = a3;
}

- (void)fountainPenFilter
{
  return self->_fountainPenFilter;
}

- (void)setFountainPenFilter:(void *)a3
{
  self->_fountainPenFilter = a3;
}

- (void)rulerExtremaFilter
{
  return self->_rulerExtremaFilter;
}

- (void)setRulerExtremaFilter:(void *)a3
{
  self->_rulerExtremaFilter = a3;
}

- (void)estimatedAltitudeAndAzimuthFilter
{
  return self->_estimatedAltitudeAndAzimuthFilter;
}

- (void)setEstimatedAltitudeAndAzimuthFilter:(void *)a3
{
  self->_estimatedAltitudeAndAzimuthFilter = a3;
}

- (void)compressionFilter
{
  return self->_compressionFilter;
}

- (void)setCompressionFilter:(void *)a3
{
  self->_compressionFilter = a3;
}

- (void)decompressionFilter
{
  return self->_decompressionFilter;
}

- (void)setDecompressionFilter:(void *)a3
{
  self->_decompressionFilter = a3;
}

- (BOOL)isSnappedToRuler
{
  return self->_isSnappedToRuler;
}

- (void)setIsSnappedToRuler:(BOOL)a3
{
  self->_isSnappedToRuler = a3;
}

- (double)eraserIndicatorAlpha
{
  return self->_eraserIndicatorAlpha;
}

- (void)setEraserIndicatorAlpha:(double)a3
{
  self->_eraserIndicatorAlpha = a3;
}

- (double)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(double)a3
{
  self->_double inputScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allInputPointFilters, 0);
  objc_storeStrong((id *)&self->_rollNoiseFilter, 0);
  objc_storeStrong((id *)&self->_extraRollLatencyFilter, 0);
  objc_storeStrong((id *)&self->_drawingWaitForFinishSemaphore, 0);
  begin = self->_updatedDrawPoints.__begin_;
  if (begin)
  {
    self->_updatedDrawPoints.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_currentStroke, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
  long long v4 = self->_outputPoints.__begin_;
  if (v4)
  {
    self->_outputPoints.__end_ = v4;
    operator delete(v4);
  }
  uint64_t v5 = self->_drawPoints.__begin_;
  if (v5)
  {
    self->_drawPoints.__end_ = v5;
    operator delete(v5);
  }
}

@end
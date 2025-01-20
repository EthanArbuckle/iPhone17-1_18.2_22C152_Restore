@interface AR3DSkeletonLiftingTechnique
- (AR3DSkeletonLiftingTechnique)init;
- (double)requiredTimeInterval;
- (id)processEspressoTensor:(id)a3;
- (unint64_t)requiredSensorDataTypes;
- (void)_endLoadingMLModelSignpost;
- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3;
- (void)_endMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)_prepareOnce:(BOOL)a3;
- (void)_startLoadingMLModelSignpost;
- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5;
- (void)_startMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3;
@end

@implementation AR3DSkeletonLiftingTechnique

- (AR3DSkeletonLiftingTechnique)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v11 = v5;
    __int16 v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Initializing", buf, 0x16u);
  }
  v6 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.humanpose3d");
  v9.receiver = self;
  v9.super_class = (Class)AR3DSkeletonLiftingTechnique;
  v7 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v9, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v6, 1, 1.0, 32.0);

  return v7;
}

- (void)_prepareOnce:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CreateABPK3DLiftingAlgorithm();
  v4 = (ABPK3DLiftingAlgorithm *)objc_claimAutoreleasedReturnValue();
  liftingAlgorithm = self->_liftingAlgorithm;
  self->_liftingAlgorithm = v4;

  if (!self->_liftingAlgorithm)
  {
    v6 = _ARLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      v13 = v8;
      __int16 v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ABPK3DLiftingAlgorithm could not be initialized!", buf, 0x16u);
    }
    if (ARSkipCrashOnCrash(void)::onceToken != -1) {
      dispatch_once(&ARSkipCrashOnCrash(void)::onceToken, &__block_literal_global_42);
    }
    if (!ARSkipCrashOnCrash(void)::skipCrashOnCrash)
    {
      objc_super v9 = NSString;
      v10 = [NSString stringWithFormat:@"ABPK3DLiftingAlgorithm could not be initialized!"];
      id v11 = [v9 stringWithFormat:@"ARCrash: %@", v10];
      qword_1E9EECB28 = (uint64_t)strdup((const char *)[v11 UTF8String]);

      abort();
    }
  }
}

- (unint64_t)requiredSensorDataTypes
{
  return 0;
}

- (double)requiredTimeInterval
{
  if (-[AR3DSkeletonLiftingTechnique requiredTimeInterval]::onceToken != -1) {
    dispatch_once(&-[AR3DSkeletonLiftingTechnique requiredTimeInterval]::onceToken, &__block_literal_global_5);
  }
  return *(double *)&-[AR3DSkeletonLiftingTechnique requiredTimeInterval]::sTimeInterval;
}

uint64_t __52__AR3DSkeletonLiftingTechnique_requiredTimeInterval__block_invoke()
{
  uint64_t result = ARIsANEVersionEqualOrPriorToH12();
  double v1 = 0.008;
  if (result) {
    double v1 = 0.015;
  }
  -[AR3DSkeletonLiftingTechnique requiredTimeInterval]::sTimeInterval = *(void *)&v1;
  return result;
}

- (id)processEspressoTensor:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _ARLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    v44 = v7;
    __int16 v45 = 2048;
    v46 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ProcessEspressoTensor", buf, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_13;
  }
  id v8 = v4;
  if (ARIsANEVersionEqualOrPriorToH12()) {
    [v8 trackedDetectionResult];
  }
  else {
  objc_super v9 = [v8 rawDetectionResult];
  }
  id v11 = v9;
  if (!v9) {
    goto LABEL_11;
  }
  __int16 v12 = [v9 liftingData];
  BOOL v13 = [v12 liftingData3D] == 0;

  if (v13) {
    goto LABEL_11;
  }
  [v8 timestamp];
  -[AR3DSkeletonLiftingTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
  liftingAlgorithm = self->_liftingAlgorithm;
  [v8 timestamp];
  LODWORD(liftingAlgorithm) = -[ABPK3DLiftingAlgorithm runLiftingModelWithData:atTimestamp:](liftingAlgorithm, "runLiftingModelWithData:atTimestamp:", v11);
  [v8 timestamp];
  -[AR3DSkeletonLiftingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
  if (liftingAlgorithm) {
    goto LABEL_11;
  }
  if (ARIsANEVersionEqualOrPriorToH12())
  {
LABEL_19:
    v29 = [AR3DSkeletonDetectionResult alloc];
    v30 = [(ABPK3DLiftingAlgorithm *)self->_liftingAlgorithm getLiftingResults];
    v15 = -[AR3DSkeletonDetectionResult initWithJoints:numberOfJoints:referenceDetectionResult:](v29, "initWithJoints:numberOfJoints:referenceDetectionResult:", [v30 joints], 17, v11);

    v10 = objc_opt_new();
    if (v15)
    {
      v42 = v15;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    }
    else
    {
      v31 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [v10 setDetectedSkeletons:v31];
    if (v15) {

    }
    [v8 timestamp];
    objc_msgSend(v10, "setTimestamp:");
    goto LABEL_12;
  }
  v17 = [v8 trackedDetectionResult];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    id v41 = objc_alloc(MEMORY[0x1E4F4A3F8]);
    v38 = [v8 trackedDetectionResult];
    uint64_t v40 = [v38 rawJointsOutput];
    v37 = [v8 rawDetectionResult];
    uint64_t v39 = [v37 jointTrackingStates];
    v36 = [v8 rawDetectionResult];
    uint64_t v19 = [v36 jointCount];
    v35 = [v8 rawDetectionResult];
    [v35 imageResolution];
    double v21 = v20;
    double v23 = v22;
    v24 = [v8 rawDetectionResult];
    uint64_t v25 = [v24 rotation];
    v26 = [v8 trackedDetectionResult];
    v27 = [v26 liftingData];
    uint64_t v28 = objc_msgSend(v41, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v40, v39, v19, v25, v27, v21, v23, 0.0, 0.0, 1.0, 1.0);

    id v11 = (void *)v28;
    goto LABEL_19;
  }
  v32 = _ARLogGeneral();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    *(_DWORD *)buf = 138543618;
    v44 = v34;
    __int16 v45 = 2048;
    v46 = self;
    _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: trackedDetectionResult is nil, bailing out", buf, 0x16u);
  }
LABEL_11:
  v15 = 0;
  v10 = 0;
LABEL_12:

LABEL_13:
  return v10;
}

- (void)_startLoadingMLModelSignpost
{
}

- (void)_endLoadingMLModelSignpost
{
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
}

@end
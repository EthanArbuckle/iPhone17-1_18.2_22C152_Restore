@interface ARFaceTrackingTechnique
+ (BOOL)isSupported;
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
- (ARFaceTrackingTechnique)init;
- (ARFaceTrackingTechnique)initWithMaximumNumberOfTrackedFaces:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFaceTracked;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (int64_t)maximumNumberOfTrackedFaces;
- (unint64_t)requiredSensorDataTypes;
- (void)setIsFaceTracked:(BOOL)a3;
@end

@implementation ARFaceTrackingTechnique

- (ARFaceTrackingTechnique)init
{
  return [(ARFaceTrackingTechnique *)self initWithMaximumNumberOfTrackedFaces:1];
}

- (ARFaceTrackingTechnique)initWithMaximumNumberOfTrackedFaces:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingTechnique;
  v4 = [(ARImageBasedTechnique *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_isFaceTracked = 0;
    v4->_maximumNumberOfTrackedFaces = a3;
    uint64_t v6 = objc_opt_new();
    singleUserAnchorIdentifier = v5->_singleUserAnchorIdentifier;
    v5->_singleUserAnchorIdentifier = (NSUUID *)v6;
  }
  return v5;
}

+ (BOOL)isSupported
{
  if (+[ARFaceTrackingTechnique isSupported]::onceToken != -1) {
    dispatch_once(&+[ARFaceTrackingTechnique isSupported]::onceToken, &__block_literal_global_80);
  }
  return +[ARFaceTrackingTechnique isSupported]::supported;
}

uint64_t __38__ARFaceTrackingTechnique_isSupported__block_invoke()
{
  uint64_t result = ARPearlCameraSupported();
  +[ARFaceTrackingTechnique isSupported]::supported = result;
  if ((result & 1) == 0)
  {
    uint64_t result = ARRGBFaceTrackingEnabled();
    if (result)
    {
      uint64_t result = ARRGBFaceTrackingEnabled();
      +[ARFaceTrackingTechnique isSupported]::supported = result;
    }
  }
  return result;
}

- (unint64_t)requiredSensorDataTypes
{
  return 49;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)processData:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = v4;
    goto LABEL_13;
  }
  v35.receiver = self;
  v35.super_class = (Class)ARFaceTrackingTechnique;
  id v5 = [(ARImageBasedTechnique *)&v35 processData:v4];
  id v6 = v4;
  v31 = objc_opt_new();
  v7 = [v6 faceData];
  v8 = [v7 faceMeshPayload];
  objc_super v9 = (void *)MEMORY[0x1E4F4D7C8];
  if (!v8)
  {

LABEL_7:
    [v6 timestamp];
    kdebug_trace();
    goto LABEL_8;
  }
  v10 = [v6 faceData];
  v11 = [v10 faceMeshPayload];
  v12 = [v11 objectForKeyedSubscript:*v9];
  BOOL v13 = [v12 count] == 0;

  if (v13) {
    goto LABEL_7;
  }
LABEL_8:
  v15 = [v6 faceData];
  int v16 = [v15 isMirrored];
  unsigned int v17 = [v6 isMirrored];

  v18 = [v6 faceData];
  v19 = [v18 faceMeshPayload];
  v20 = [v19 objectForKeyedSubscript:*v9];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __39__ARFaceTrackingTechnique_processData___block_invoke;
  v32[3] = &unk_1E6187710;
  uint64_t v21 = v16 ^ v17;
  v32[4] = self;
  char v34 = v21;
  id v22 = v31;
  id v33 = v22;
  [v20 enumerateObjectsUsingBlock:v32];

  if ([(ARFaceTrackingTechnique *)self maximumNumberOfTrackedFaces] == 1)
  {
    v23 = [v22 firstObject];
    if (v23)
    {
      [v22 removeAllObjects];
      v24 = [ARFaceTrackingData alloc];
      v25 = [v23 trackingData];
      v26 = [(ARFaceTrackingData *)v24 initWithTrackingData:v25 transformToMirrored:v21 anchorIdentifier:self->_singleUserAnchorIdentifier];

      [v22 addObject:v26];
    }
  }
  v27 = objc_opt_new();
  [v27 setTrackedFaces:v22];
  v36[0] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v6 timestamp];
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v28);

  id v29 = v6;
LABEL_13:

  return v4;
}

void __39__ARFaceTrackingTechnique_processData___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4D740]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
LABEL_5:
    v11 = _ARLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      BOOL v13 = NSStringFromClass(v12);
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)v27 = 138543874;
      *(void *)&v27[4] = v13;
      *(_WORD *)&v27[12] = 2048;
      *(void *)&v27[14] = v14;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking anchor with ID = %@", v27, 0x20u);
    }
    v15 = [[ARFaceTrackingData alloc] initWithTrackingData:v6 transformToMirrored:*(unsigned __int8 *)(a1 + 48) anchorIdentifier:v8];
    int v16 = [*(id *)(a1 + 32) isFaceTracked];
    if (v16 != [(ARFaceTrackingData *)v15 isValid])
    {
      if (_ARLogTechnique(void)::onceToken != -1) {
        dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_53);
      }
      unsigned int v17 = (id)_ARLogTechnique(void)::logObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        uint64_t v20 = *(void *)(a1 + 32);
        BOOL v21 = [(ARFaceTrackingData *)v15 isValid];
        id v22 = @"NO";
        *(_DWORD *)v27 = 138543874;
        *(void *)&v27[4] = v19;
        if (v21) {
          id v22 = @"YES";
        }
        *(_WORD *)&v27[12] = 2048;
        *(void *)&v27[14] = v20;
        __int16 v28 = 2112;
        id v29 = v22;
        _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Face is being tracked: %@", v27, 0x20u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setIsFaceTracked:", -[ARFaceTrackingData isValid](v15, "isValid"));
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15, *(_OWORD *)v27);
    unint64_t v23 = [*(id *)(a1 + 40) count];
    *a4 = v23 >= [*(id *)(a1 + 32) maximumNumberOfTrackedFaces];

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    *(_DWORD *)v27 = 0;
    *(_DWORD *)v27 = objc_msgSend(v9, "intValue", *(void *)v27);
    v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:4];
    v8 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithData:", v10);

    goto LABEL_5;
  }
  v8 = _ARLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    uint64_t v26 = *(void *)(a1 + 32);
    *(_DWORD *)v27 = 138543618;
    *(void *)&v27[4] = v25;
    *(_WORD *)&v27[12] = 2048;
    *(void *)&v27[14] = v26;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Encountered invalid face ID", v27, 0x16u);
  }
LABEL_16:
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingTechnique;
  if ([(ARTechnique *)&v9 isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(ARFaceTrackingTechnique *)self maximumNumberOfTrackedFaces];
    BOOL v7 = v6 == [v5 maximumNumberOfTrackedFaces];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (BOOL)isFaceTracked
{
  return self->_isFaceTracked;
}

- (void)setIsFaceTracked:(BOOL)a3
{
  self->_isFaceTracked = a3;
}

- (void).cxx_destruct
{
}

@end
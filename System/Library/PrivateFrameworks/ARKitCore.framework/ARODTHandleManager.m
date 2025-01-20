@interface ARODTHandleManager
+ (id)handleAccumulatedErrorType:(int64_t)a3 failedReferenceImageNames:(id)a4;
+ (id)suggestionInternalError;
+ (id)suggestionInvalidFeature;
+ (id)suggestionInvalidImage;
+ (int)_calibrationDataFromImageData:(id)a3 pCalibrationData:(id *)a4;
+ (int)verifyReferenceImage:(id)a3;
+ (int64_t)actualNumberOfImagesTracked:(int64_t)a3;
+ (void)accumulateReferenceImageErrorsForResult:(int)a3 refImage:(id)a4 objectID:(unint64_t)a5 pReferenceImageMap:(id *)a6 pFailedReferenceImageNames:(id *)a7 pUserErrorType:(int64_t *)a8;
- (ARODTHandleManager)init;
- (ARODTHandleManager)initWithDeterministicMode:(BOOL)a3;
- (ARODTHandleManager)initWithMaximumNumberOfTrackedImages:(int64_t)a3;
- (ARODTHandleManager)initWithMaximumNumberOfTrackedImages:(int64_t)a3 continuousDetection:(BOOL)a4 deterministicMode:(BOOL)a5;
- (ARODTHandleManager)initWithRegionProposalModelAndDeterministicMode:(BOOL)a3;
- (BOOL)continuousDetection;
- (BOOL)deterministicMode;
- (BOOL)isEqual:(id)a3;
- (int)addReferenceImage:(id)a3 tracking:(BOOL)a4 pObjectID:(unint64_t *)a5;
- (int)addReferenceObject:(id)a3 tracking:(BOOL)a4 pObjectID:(unint64_t *)a5;
- (int)detectReferenceObjectsForImageData:(id)a3 worldTrackingPose:(id)a4 imageContext:(const void *)a5 pResultArray:(id *)a6;
- (int)predictPlanarObjectsAtTimestamp:(double)a3 worldTrackingPose:(id)a4 timeBudget:(double)a5 pResultArray:(id *)a6;
- (int)trackPlanarObjectAndEstimateScaleForImageData:(id)a3 worldTrackingPose:(id)a4 imageContext:(const void *)a5 timeBudget:(double)a6 pResultArray:(id *)a7;
- (int)trackPlanarObjectForImageData:(id)a3 imageContext:(const void *)a4 timeBudget:(double)a5 pResultArray:(id *)a6;
- (int)waitForAllObjectsAddToFinish;
- (int64_t)maximumNumberOfTrackedImages;
- (void)dealloc;
- (void)releaseODTHandle;
- (void)updatePowerUsage:(unint64_t)a3;
@end

@implementation ARODTHandleManager

- (int64_t)maximumNumberOfTrackedImages
{
  v2 = [(NSDictionary *)self->_options objectForKey:*MEMORY[0x1E4F4D358]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)continuousDetection
{
  v2 = [(NSDictionary *)self->_options objectForKey:*MEMORY[0x1E4F4D350]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)deterministicMode
{
  v2 = [(NSDictionary *)self->_options objectForKey:*MEMORY[0x1E4F4D348]];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (int64_t)actualNumberOfImagesTracked:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 < 0)
  {
    v5 = _ARLogSession();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "Warning: Maximum number of tracked images cannot be negative. Using a value of zero instead", (uint8_t *)&v7, 2u);
    }

    CV3DODTGetMaxSupportedNumberImagesToTrack();
    return 0;
  }
  else
  {
    int64_t v3 = a3;
    if (CV3DODTGetMaxSupportedNumberImagesToTrack() < (unint64_t)a3)
    {
      int64_t v3 = CV3DODTGetMaxSupportedNumberImagesToTrack();
      v4 = _ARLogSession();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        int64_t v8 = v3;
        _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Maximum number of tracked images exceeds the maximum. Using a value of %ld instead.", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  return v3;
}

- (ARODTHandleManager)initWithMaximumNumberOfTrackedImages:(int64_t)a3
{
  return [(ARODTHandleManager *)self initWithMaximumNumberOfTrackedImages:a3 continuousDetection:0 deterministicMode:0];
}

- (ARODTHandleManager)initWithMaximumNumberOfTrackedImages:(int64_t)a3 continuousDetection:(BOOL)a4 deterministicMode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v31[3] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ARODTHandleManager;
  int64_t v8 = [(ARODTHandleManager *)&v23 init];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [(id)objc_opt_class() actualNumberOfImagesTracked:a3];
  v30[0] = *MEMORY[0x1E4F4D358];
  v10 = [NSNumber numberWithInteger:v9];
  v31[0] = v10;
  v30[1] = *MEMORY[0x1E4F4D348];
  v11 = [NSNumber numberWithBool:v5];
  v31[1] = v11;
  v30[2] = *MEMORY[0x1E4F4D350];
  v12 = [NSNumber numberWithBool:v6];
  v31[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

  objc_storeStrong((id *)&v8->_options, v13);
  if (!v15)
  {
    dispatch_semaphore_t v20 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v8->_odtHandleSemaphore;
    v8->_odtHandleSemaphore = (OS_dispatch_semaphore *)v20;

    v8->_odtCounter = 0;
    v8->_odtPowerUsage = 0;

LABEL_7:
    v19 = v8;
    goto LABEL_8;
  }
  v16 = _ARLogTechnique();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543874;
    v25 = v18;
    __int16 v26 = 2048;
    v27 = v8;
    __int16 v28 = 1024;
    int v29 = v15;
    _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection. Failed with error %d", buf, 0x1Cu);
  }
  v19 = 0;
LABEL_8:

  return v19;
}

- (ARODTHandleManager)initWithDeterministicMode:(BOOL)a3
{
  BOOL v3 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)ARODTHandleManager;
  v4 = [(ARODTHandleManager *)&v16 init];
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t v23 = *MEMORY[0x1E4F4D348];
  BOOL v5 = [NSNumber numberWithBool:v3];
  v24[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  objc_storeStrong((id *)&v4->_options, v6);
  if (!v8)
  {
    dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v4->_odtHandleSemaphore;
    v4->_odtHandleSemaphore = (OS_dispatch_semaphore *)v13;

    v4->_odtCounter = 0;
LABEL_7:
    v12 = v4;
    goto LABEL_8;
  }
  uint64_t v9 = _ARLogTechnique();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    __int16 v19 = 2048;
    dispatch_semaphore_t v20 = v4;
    __int16 v21 = 1024;
    int v22 = v8;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection. Failed with error %d.", buf, 0x1Cu);
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (ARODTHandleManager)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)ARODTHandleManager;
  v2 = [(ARODTHandleManager *)&v12 init];
  v4 = v2;
  if (!v2) {
    goto LABEL_7;
  }
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v4->_odtHandleSemaphore;
    v4->_odtHandleSemaphore = (OS_dispatch_semaphore *)v9;

    v4->_odtCounter = 0;
LABEL_7:
    int v8 = v4;
    goto LABEL_8;
  }
  BOOL v5 = _ARLogTechnique();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    __int16 v15 = 2048;
    objc_super v16 = v4;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection.", buf, 0x16u);
  }
  int v8 = 0;
LABEL_8:

  return v8;
}

- (ARODTHandleManager)initWithRegionProposalModelAndDeterministicMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)ARODTHandleManager;
  v4 = [(ARODTHandleManager *)&v30 init];
  if (!v4) {
    goto LABEL_17;
  }
  ObjectRegionProposalModelData = (const void *)CV3DModelsCreateObjectRegionProposalModelData();
  if (ObjectRegionProposalModelData)
  {
    int v6 = CV3DMLModelCreate();
    int v7 = _ARLogTechnique();
    int v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        dispatch_semaphore_t v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        *(_DWORD *)buf = 138543874;
        v34 = v10;
        __int16 v35 = 2048;
        v36 = v4;
        __int16 v37 = 1024;
        int v38 = v6;
        _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error creating region proposal model: %i", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      __int16 v15 = NSStringFromClass(v14);
      mlModel = (int *)v4->_mlModel;
      int v17 = *mlModel;
      int v18 = mlModel[1];
      LODWORD(mlModel) = mlModel[2];
      *(_DWORD *)buf = 138544386;
      v34 = v15;
      __int16 v35 = 2048;
      v36 = v4;
      __int16 v37 = 1024;
      int v38 = v17;
      __int16 v39 = 1024;
      int v40 = v18;
      __int16 v41 = 1024;
      int v42 = (int)mlModel;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Region proposal model loaded from AppleCV3DModels-%i.%i.%i", buf, 0x28u);
    }
    CFRelease(ObjectRegionProposalModelData);
  }
  else
  {
    v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = (objc_class *)objc_opt_class();
      dispatch_semaphore_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v34 = v13;
      __int16 v35 = 2048;
      v36 = v4;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create object region proposal model", buf, 0x16u);
    }
  }
  uint64_t v31 = *MEMORY[0x1E4F4D348];
  __int16 v19 = [NSNumber numberWithBool:v3];
  v32 = v19;
  dispatch_semaphore_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

  objc_storeStrong((id *)&v4->_options, v20);
  if (!v22)
  {
    dispatch_semaphore_t v27 = dispatch_semaphore_create(1);
    odtHandleSemaphore = v4->_odtHandleSemaphore;
    v4->_odtHandleSemaphore = (OS_dispatch_semaphore *)v27;

    v4->_odtCounter = 0;
LABEL_17:
    __int16 v26 = v4;
    goto LABEL_18;
  }
  uint64_t v23 = _ARLogTechnique();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543874;
    v34 = v25;
    __int16 v35 = 2048;
    v36 = v4;
    __int16 v37 = 1024;
    int v38 = v22;
    _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create AppleCV3D handle for image detection. Failed with error %d.", buf, 0x1Cu);
  }
  __int16 v26 = 0;
LABEL_18:

  return v26;
}

- (int)addReferenceImage:(id)a3 tracking:(BOOL)a4 pObjectID:(unint64_t *)a5
{
  id v7 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [v7 pixelBuffer];
  [v7 alphaMask];
  [v7 physicalSize];
  int v8 = CV3DODTAddPlanarObject();
  *a5 = self->_odtCounter;
  odtHandleSemaphore = self->_odtHandleSemaphore;
  ++self->_odtCounter;
  dispatch_semaphore_signal(odtHandleSemaphore);

  return v8;
}

+ (id)suggestionInvalidImage
{
  v2 = ARKitCoreBundle();
  BOOL v3 = [v2 localizedStringForKey:@"Make sure that all reference images are greater than 100 pixels and have a positive physical size in meters." value:&stru_1F120C8F0 table:@"Localizable_iOS"];

  return v3;
}

+ (id)suggestionInvalidFeature
{
  v2 = ARKitCoreBundle();
  BOOL v3 = [v2 localizedStringForKey:@"One or more images lack sufficient texture and contrast for accurate detection. Image detection works best when an image contains multiple high-contrast regions distributed across its extent." value:&stru_1F120C8F0 table:@"Localizable_iOS"];

  return v3;
}

+ (id)suggestionInternalError
{
  v2 = ARKitCoreBundle();
  BOOL v3 = [v2 localizedStringForKey:@"An unknown error occurred while loading ARReferenceImages for detection. Please file a bug report." value:&stru_1F120C8F0 table:@"Localizable_iOS"];

  return v3;
}

+ (void)accumulateReferenceImageErrorsForResult:(int)a3 refImage:(id)a4 objectID:(unint64_t)a5 pReferenceImageMap:(id *)a6 pFailedReferenceImageNames:(id *)a7 pUserErrorType:(int64_t *)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = *a6;
  id v15 = *a7;
  if (a3 > 0xF) {
    goto LABEL_17;
  }
  if (((1 << a3) & 0x6030) != 0)
  {
    objc_super v16 = _ARLogTechnique();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = [v13 description];
      int v28 = 138412546;
      int v29 = v17;
      __int16 v30 = 1024;
      int v31 = a3;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "Could not add planar object for detection: %@ Reason: %i", (uint8_t *)&v28, 0x12u);
    }
    if ((unint64_t)(*a8 + 1) <= 1)
    {
      *a8 = -1;
      int v18 = [v13 name];
      if (v18)
      {
        __int16 v19 = [v13 name];
        dispatch_semaphore_t v20 = v19;
      }
      else
      {
        dispatch_semaphore_t v20 = ARKitCoreBundle();
        __int16 v19 = [v20 localizedStringForKey:@"<Unnamed>" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      }
      [v15 addObject:v19];
      if (!v18) {

      }
LABEL_26:
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (!a3)
  {
    v24 = [NSNumber numberWithInteger:a5];
    [v14 setObject:v13 forKey:v24];

    goto LABEL_27;
  }
  if (a3 != 15)
  {
LABEL_17:
    v25 = _ARLogTechnique();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = [v13 description];
      int v28 = 138412546;
      int v29 = v26;
      __int16 v30 = 1024;
      int v31 = a3;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "Could not add planar object for detection: %@ Reason: %i", (uint8_t *)&v28, 0x12u);
    }
    if (!*a8 || *a8 == -3)
    {
      *a8 = -3;
      int v18 = [v13 name];
      if (v18)
      {
        dispatch_semaphore_t v27 = [v13 name];
        dispatch_semaphore_t v20 = v27;
      }
      else
      {
        dispatch_semaphore_t v20 = ARKitCoreBundle();
        dispatch_semaphore_t v27 = [v20 localizedStringForKey:@"<Unnamed>" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      }
      [v15 addObject:v27];
      if (!v18) {

      }
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  __int16 v21 = _ARLogTechnique();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    int v22 = [v13 description];
    int v28 = 138412546;
    int v29 = v22;
    __int16 v30 = 1024;
    int v31 = 15;
    _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_ERROR, "Could not add planar object for detection: %@ Reason: %i", (uint8_t *)&v28, 0x12u);
  }
  if (!*a8 || *a8 == -2)
  {
    *a8 = -2;
    int v18 = [v13 name];
    if (v18)
    {
      uint64_t v23 = [v13 name];
      dispatch_semaphore_t v20 = v23;
    }
    else
    {
      dispatch_semaphore_t v20 = ARKitCoreBundle();
      uint64_t v23 = [v20 localizedStringForKey:@"<Unnamed>" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    }
    [v15 addObject:v23];
    if (!v18) {

    }
    goto LABEL_26;
  }
LABEL_27:
}

+ (id)handleAccumulatedErrorType:(int64_t)a3 failedReferenceImageNames:(id)a4
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  switch(a3)
  {
    case -3:
      id v15 = _ARLogSession();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_DEFAULT, "An unknown error occurred while loading ARReferenceImages for detection. Please file a bug report.", buf, 2u);
      }

      objc_super v16 = NSString;
      int v17 = ARKitCoreBundle();
      int v18 = [v17 localizedStringForKey:@"One or more reference images could not be loaded due to an unknown error: %@" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      __int16 v19 = [v5 componentsJoinedByString:@", "];
      v10 = objc_msgSend(v16, "stringWithFormat:", v18, v19);

      v32[0] = v5;
      uint64_t v20 = *MEMORY[0x1E4F285A0];
      v31[0] = @"ARErrorItems";
      v31[1] = v20;
      __int16 v21 = [(id)objc_opt_class() suggestionInternalError];
      v31[2] = *MEMORY[0x1E4F28588];
      v32[1] = v21;
      v32[2] = v10;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

      uint64_t v14 = ARErrorWithCodeAndUserInfo(300, v13);
      goto LABEL_9;
    case -2:
      int v22 = NSString;
      uint64_t v23 = ARKitCoreBundle();
      v24 = [v23 localizedStringForKey:@"One or more reference images have insufficient texture: %@" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v25 = [v5 componentsJoinedByString:@", "];
      v10 = objc_msgSend(v22, "stringWithFormat:", v24, v25);

      v34[0] = v5;
      uint64_t v26 = *MEMORY[0x1E4F285A0];
      v33[0] = @"ARErrorItems";
      v33[1] = v26;
      dispatch_semaphore_t v27 = [(id)objc_opt_class() suggestionInvalidFeature];
      v33[2] = *MEMORY[0x1E4F28588];
      v34[1] = v27;
      v34[2] = v10;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

      uint64_t v14 = ARErrorWithCodeAndUserInfo(300, v13);
      goto LABEL_9;
    case -1:
      int v6 = NSString;
      id v7 = ARKitCoreBundle();
      int v8 = [v7 localizedStringForKey:@"One or more reference images have an invalid size: %@" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      dispatch_semaphore_t v9 = [v5 componentsJoinedByString:@", "];
      v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);

      v36[0] = v5;
      uint64_t v11 = *MEMORY[0x1E4F285A0];
      v35[0] = @"ARErrorItems";
      v35[1] = v11;
      objc_super v12 = [(id)objc_opt_class() suggestionInvalidImage];
      v35[2] = *MEMORY[0x1E4F28588];
      v36[1] = v12;
      v36[2] = v10;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];

      uint64_t v14 = ARErrorWithCodeAndUserInfo(300, v13);
LABEL_9:
      int v28 = (void *)v14;

      goto LABEL_11;
  }
  int v28 = 0;
LABEL_11:

  return v28;
}

- (int)waitForAllObjectsAddToFinish
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  int v3 = CV3DODTWaitForAllObjectsAddToFinish();
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  return v3;
}

- (int)addReferenceObject:(id)a3 tracking:(BOOL)a4 pObjectID:(unint64_t *)a5
{
  id v7 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  int v8 = [v7 trackingData];
  int v9 = CV3DODTAdd3dObject();

  *a5 = self->_odtCounter;
  odtHandleSemaphore = self->_odtHandleSemaphore;
  ++self->_odtCounter;
  dispatch_semaphore_signal(odtHandleSemaphore);

  return v9;
}

- (int)detectReferenceObjectsForImageData:(id)a3 worldTrackingPose:(id)a4 imageContext:(const void *)a5 pResultArray:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v20 = 0;
  int v11 = [(id)objc_opt_class() _calibrationDataFromImageData:v9 pCalibrationData:&v20];
  id v12 = v20;
  if (v11)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);

    int v13 = 7;
  }
  else
  {
    [v10 visionCameraTransform];
    objc_msgSend(v9, "pixelBuffer", ARMatrix4x4RowMajorRotationAndTranslation(v22, &v21, v14, v15, v16, v17));
    [v9 timestamp];
    int v13 = CV3DODTDetectWithMetadata();
    id v18 = objc_opt_new();
    *a6 = v18;
    CV3DODTObjectInfoRelease();

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  }

  return v13;
}

- (int)trackPlanarObjectAndEstimateScaleForImageData:(id)a3 worldTrackingPose:(id)a4 imageContext:(const void *)a5 timeBudget:(double)a6 pResultArray:(id *)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  int v13 = objc_opt_new();
  v24 = a7;
  id v25 = v13;
  int v14 = [(id)objc_opt_class() _calibrationDataFromImageData:v11 pCalibrationData:&v25];
  id v15 = v25;

  if (v14)
  {

    int v16 = 7;
  }
  else
  {
    if (a6 > 0.0) {
      CV3DODTSetMaximumTrackingTime();
    }
    if (v12)
    {
      [v12 visionCameraTransform];
      objc_msgSend(v11, "pixelBuffer", ARMatrix4x4RowMajorRotationAndTranslation(v27, &v26, v17, v18, v19, v20));
      [v11 timestamp];
      int v21 = CV3DODTTrackAndEstimateScale();
    }
    else
    {
      [v11 pixelBuffer];
      [v11 timestamp];
      int v21 = CV3DODTTrack();
    }
    int v16 = v21;
    id v22 = objc_opt_new();
    id *v24 = v22;
    CV3DODTObjectInfoRelease();

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  }

  return v16;
}

- (int)trackPlanarObjectForImageData:(id)a3 imageContext:(const void *)a4 timeBudget:(double)a5 pResultArray:(id *)a6
{
  return [(ARODTHandleManager *)self trackPlanarObjectAndEstimateScaleForImageData:a3 worldTrackingPose:0 imageContext:a4 timeBudget:a6 pResultArray:a5];
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_odtHandle)
  {
    int v3 = _ARLogTechnique();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      odtHandle = self->_odtHandle;
      *(_DWORD *)buf = 138543874;
      id v12 = v5;
      __int16 v13 = 2048;
      int v14 = self;
      __int16 v15 = 2048;
      int v16 = odtHandle;
      _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing Image Detection handle: %p …", buf, 0x20u);
    }
    CV3DODTRelease();
    self->_odtHandle = 0;
    id v7 = _ARLogTechnique();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      id v12 = v9;
      __int16 v13 = 2048;
      int v14 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ImageDetectionHandle handle released", buf, 0x16u);
    }
  }
  if (self->_mlModel) {
    CV3DMLModelRelease();
  }
  v10.receiver = self;
  v10.super_class = (Class)ARODTHandleManager;
  [(ARODTHandleManager *)&v10 dealloc];
}

- (int)predictPlanarObjectsAtTimestamp:(double)a3 worldTrackingPose:(id)a4 timeBudget:(double)a5 pResultArray:(id *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a5 > 0.0) {
    CV3DODTSetMaximumTrackingTime();
  }
  if (v9)
  {
    [v9 visionCameraTransform];
    ARMatrix4x4RowMajorRotationAndTranslation(v19, &v18, v10, v11, v12, v13);
    int v14 = CV3DODTImagePredictInWorld();
  }
  else
  {
    int v14 = CV3DODTImagePredict();
  }
  int v15 = v14;
  id v16 = (id) [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  *a6 = v16;
  CV3DODTObjectInfoRelease();

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
  return v15;
}

+ (int)verifyReferenceImage:(id)a3
{
  id v3 = a3;
  [v3 pixelBuffer];
  [v3 alphaMask];
  [v3 physicalSize];
  int v4 = CV3DODTVerifyReferenceImage();

  return v4;
}

- (void)updatePowerUsage:(unint64_t)a3
{
  if (self->_odtPowerUsage != a3)
  {
    self->_odtPowerUsage = a3;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    CV3DODTSetPerformanceMode();
    odtHandleSemaphore = self->_odtHandleSemaphore;
    dispatch_semaphore_signal(odtHandleSemaphore);
  }
}

- (void)releaseODTHandle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_odtHandleSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_odtHandle)
  {
    id v3 = _ARLogTechnique();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      odtHandle = self->_odtHandle;
      int v10 = 138543874;
      int8x16_t v11 = v5;
      __int16 v12 = 2048;
      __n128 v13 = self;
      __int16 v14 = 2048;
      int v15 = odtHandle;
      _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing Image Detection handle: %p …", (uint8_t *)&v10, 0x20u);
    }
    CV3DODTRelease();
    self->_odtHandle = 0;
    id v7 = _ARLogTechnique();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v10 = 138543618;
      int8x16_t v11 = v9;
      __int16 v12 = 2048;
      __n128 v13 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ImageDetectionHandle handle released", (uint8_t *)&v10, 0x16u);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_odtHandleSemaphore);
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSDictionary *)self->_options isEqual:v4[4]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (int)_calibrationDataFromImageData:(id)a3 pCalibrationData:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = objc_opt_new();
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v5 pixelBuffer], 0);
  [v5 cameraIntrinsics];
  float v14 = v7;
  float v15 = v8;
  uint64_t v16 = v9;
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v5 pixelBuffer]);
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v5 pixelBuffer]);
  if (MEMORY[0x1BA9C4BC0](v6, Width, Height, v17, v17, v17, v17, "Perspective", v14, v15, *(float *)&v16, *((float *)&v16 + 1), 0.0))
  {
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v5 pixelBuffer], 0);
    int v12 = 8;
  }
  else
  {
    *a4 = v6;
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v5 pixelBuffer], 0);
    int v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_odtHandleSemaphore, 0);
}

@end
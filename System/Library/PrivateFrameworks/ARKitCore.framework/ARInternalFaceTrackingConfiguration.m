@interface ARInternalFaceTrackingConfiguration
+ (BOOL)isSupported;
+ (id)supportedVideoFormats;
- (ARInternalFaceTrackingConfiguration)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)useAlternativeResources;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageSensorSettings;
- (int64_t)maximumNumberOfTrackedFaces;
- (void)createTechniques:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setLightEstimationEnabled:(BOOL)a3;
- (void)setMaximumNumberOfTrackedFaces:(int64_t)a3;
- (void)setUseAlternativeResources:(BOOL)a3;
@end

@implementation ARInternalFaceTrackingConfiguration

- (ARInternalFaceTrackingConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARInternalFaceTrackingConfiguration;
  v2 = [(ARConfiguration *)&v5 initPrivate];
  v3 = v2;
  if (v2)
  {
    [(ARInternalFaceTrackingConfiguration *)v2 setLightEstimationEnabled:1];
    [(ARInternalFaceTrackingConfiguration *)v3 setMaximumNumberOfTrackedFaces:1];
  }
  return v3;
}

- (void)setLightEstimationEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(ARConfiguration *)self setLightEstimation:v3];
}

- (void)setCameraPosition:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.faceTracking.backCamera.allowed"])
  {
    if (a3
      && ([(ARConfiguration *)self videoFormat],
          objc_super v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 captureDevicePosition],
          v5,
          v6 != a3))
    {
      v14.receiver = self;
      v14.super_class = (Class)ARInternalFaceTrackingConfiguration;
      [(ARConfiguration *)&v14 setCameraPosition:a3];
    }
    else
    {
      v7 = [(id)objc_opt_class() supportedVideoFormats];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__ARInternalFaceTrackingConfiguration_setCameraPosition___block_invoke;
      v13[3] = &__block_descriptor_40_e30_B32__0__ARVideoFormat_8Q16_B24l;
      v13[4] = a3;
      objc_msgSend(v7, "ar_firstObjectPassingTest:", v13);
      v8 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
      videoFormat = self->super._videoFormat;
      self->super._videoFormat = v8;

      self->super._cameraPosition = a3;
    }
  }
  else
  {
    v10 = _ARLogGeneral_6();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: setCameraPosition failed: The camera position for face tracking cannot be changed.", buf, 0x16u);
    }
  }
}

BOOL __57__ARInternalFaceTrackingConfiguration_setCameraPosition___block_invoke(uint64_t a1, void *a2)
{
  return !*(void *)(a1 + 32) || [a2 captureDevicePosition] == *(void *)(a1 + 32);
}

+ (BOOL)isSupported
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ARInternalFaceTrackingConfiguration;
  unsigned int v2 = objc_msgSendSuper2(&v4, sel_isSupported);
  if (v2) {
    LOBYTE(v2) = +[ARFaceTrackingInternalTechnique isSupported];
  }
  return v2;
}

+ (id)supportedVideoFormats
{
  return +[ARFaceTrackingConfiguration supportedVideoFormats];
}

- (void)createTechniques:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ARInternalFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces] < 1) {
    goto LABEL_4;
  }
  objc_super v5 = [[ARFaceTrackingInternalTechnique alloc] initWithMaximumNumberOfTrackedFaces:[(ARInternalFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces] options:0];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = [ARParentTechnique alloc];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(ARParentTechnique *)v7 initWithParallelTechniques:v8];

    [v4 addObject:v9];
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)ARInternalFaceTrackingConfiguration;
    [(ARConfiguration *)&v10 createTechniques:v4];
  }
}

- (void)setMaximumNumberOfTrackedFaces:(int64_t)a3
{
  if (ARLinkedOnOrAfterYukon())
  {
    int64_t v5 = (int)+[ARFaceTrackingConfiguration supportedNumberOfTrackedFaces];
    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    self->_maximumNumberOfTrackedFaces = 0;
    return;
  }
  int64_t v5 = 1;
  if (a3 < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (v5 >= a3) {
    self->_maximumNumberOfTrackedFaces = a3;
  }
  else {
    self->_maximumNumberOfTrackedFaces = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARInternalFaceTrackingConfiguration;
  if ([(ARConfiguration *)&v10 isEqual:v4])
  {
    id v5 = v4;
    int v6 = [(ARInternalFaceTrackingConfiguration *)self useAlternativeResources];
    if (v6 == [v5 useAlternativeResources])
    {
      int64_t v8 = [(ARInternalFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces];
      BOOL v7 = v8 == [v5 maximumNumberOfTrackedFaces];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARInternalFaceTrackingConfiguration;
  id v4 = [(ARConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setUseAlternativeResources:", -[ARInternalFaceTrackingConfiguration useAlternativeResources](self, "useAlternativeResources"));
  v4[15] = self->_maximumNumberOfTrackedFaces;
  return v4;
}

- (id)imageSensorSettings
{
  v4.receiver = self;
  v4.super_class = (Class)ARInternalFaceTrackingConfiguration;
  unsigned int v2 = [(ARConfiguration *)&v4 imageSensorSettings];
  [v2 setMetaData:*MEMORY[0x1E4F15E30]];
  return v2;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (BOOL)useAlternativeResources
{
  return self->_useAlternativeResources;
}

- (void)setUseAlternativeResources:(BOOL)a3
{
  self->_useAlternativeResources = a3;
}

@end
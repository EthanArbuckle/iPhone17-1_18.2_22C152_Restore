@interface ARObjectScanningConfiguration
+ (BOOL)isSupported;
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
+ (id)supportedVideoFormats;
- (ARObjectScanningConfiguration)init;
- (ARPlaneDetection)planeDetection;
- (BOOL)deliverRawSceneUnderstandingResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowQosSchedulingEnabled;
- (BOOL)isMLModelEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageSensorSettings;
- (void)createTechniques:(id)a3;
- (void)setDeliverRawSceneUnderstandingResults:(BOOL)a3;
- (void)setLowQosSchedulingEnabled:(BOOL)a3;
- (void)setMlModelEnabled:(BOOL)a3;
- (void)setPlaneDetection:(ARPlaneDetection)planeDetection;
@end

@implementation ARObjectScanningConfiguration

+ (BOOL)isSupported
{
  return +[ARWorldTrackingConfiguration isSupported];
}

- (ARObjectScanningConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARObjectScanningConfiguration;
  v2 = [(ARConfiguration *)&v5 initPrivate];
  v3 = v2;
  if (v2)
  {
    [(ARConfiguration *)v2 setAutoFocusEnabled:1];
    [(ARObjectScanningConfiguration *)v3 setLowQosSchedulingEnabled:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.enableLowQosScheduling"]];
  }
  return v3;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return a3 == 0;
}

+ (id)supportedVideoFormats
{
  v2 = +[ARWorldTrackingConfiguration supportedVideoFormats];
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_119];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

uint64_t __54__ARObjectScanningConfiguration_supportedVideoFormats__block_invoke(uint64_t a1, void *a2)
{
  return [a2 has4KVideoResolution] ^ 1;
}

- (id)imageSensorSettings
{
  v4.receiver = self;
  v4.super_class = (Class)ARObjectScanningConfiguration;
  v2 = [(ARConfiguration *)&v4 imageSensorSettings];
  [v2 setVisionDataOutputEnabled:0];
  return v2;
}

- (void)createTechniques:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  v6 = [(ARObjectScanningConfiguration *)self imageSensorSettings];
  [v5 setImageSensorSettings:v6];

  v7 = [(ARConfiguration *)self deviceModel];
  [v5 setDeviceModel:v7];

  [v5 setSlamConfiguration:@"ObjectDetectionMapBuilding"];
  objc_msgSend(v5, "setPlaneDetection:", -[ARObjectScanningConfiguration planeDetection](self, "planeDetection"));
  objc_msgSend(v5, "setMlModelEnabled:", -[ARObjectScanningConfiguration isMLModelEnabled](self, "isMLModelEnabled"));
  objc_msgSend(v5, "setLowQosSchedulingEnabled:", -[ARObjectScanningConfiguration isLowQosSchedulingEnabled](self, "isLowQosSchedulingEnabled"));
  [v5 setPlaneEstimationShouldUseJasperData:0];
  v8 = [(ARConfiguration *)self replaySensor];
  v9 = v8;
  if (v8 && [v8 replayMode]) {
    [v5 setDeterministicMode:1];
  }
  v10 = [[ARWorldTrackingTechnique alloc] initWithOptions:v5];
  if (v10)
  {
    v11 = [ARParentTechnique alloc];
    v18[0] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v13 = [(ARParentTechnique *)v11 initWithParallelTechniques:v12];

    [v4 addObject:v13];
    v14 = [(ARWorldTrackingTechnique *)v10 options];
    uint64_t v15 = [v14 planeDetection];

    if (v15)
    {
      v16 = [[ARPlaneEstimationTechnique alloc] initWithTrackingTechnique:v10];
      [v4 addObject:v16];
    }
    v17.receiver = self;
    v17.super_class = (Class)ARObjectScanningConfiguration;
    [(ARConfiguration *)&v17 createTechniques:v4];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARObjectScanningConfiguration;
  if ([(ARConfiguration *)&v8 isEqual:v4])
  {
    objc_super v5 = v4;
    BOOL v6 = self->_planeDetection == v5[15]
      && self->_mlModelEnabled == *((unsigned __int8 *)v5 + 112)
      && self->_lowQosSchedulingEnabled == *((unsigned __int8 *)v5 + 113)
      && self->_deliverRawSceneUnderstandingResults == *((unsigned __int8 *)v5 + 114);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARObjectScanningConfiguration;
  id result = [(ARConfiguration *)&v5 copyWithZone:a3];
  *((void *)result + 15) = self->_planeDetection;
  *((unsigned char *)result + 112) = self->_mlModelEnabled;
  *((unsigned char *)result + 113) = self->_lowQosSchedulingEnabled;
  *((unsigned char *)result + 114) = self->_deliverRawSceneUnderstandingResults;
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  BOOL v7 = [(ARConfiguration *)self isAutoFocusEnabled];
  objc_super v8 = @"Disabled";
  if (v7) {
    objc_super v8 = @"Enabled";
  }
  [v6 appendFormat:@" autoFocus=%@", v8];
  v9 = NSStringFromARPlaneDetection(self->_planeDetection);
  [v6 appendFormat:@" planeDetection=%@", v9];

  v10 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v10];

  [v6 appendString:@">"];
  return v6;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (BOOL)isMLModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)deliverRawSceneUnderstandingResults
{
  return self->_deliverRawSceneUnderstandingResults;
}

- (void)setDeliverRawSceneUnderstandingResults:(BOOL)a3
{
  self->_deliverRawSceneUnderstandingResults = a3;
}

@end
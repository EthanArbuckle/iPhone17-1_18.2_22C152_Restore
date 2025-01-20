@interface BWMattingV2InferenceConfiguration
+ (BOOL)isMattingOutputAttachedMediaKey:(id)a3;
+ (id)inputAttachedMediaKeyForMattingOutputType:(unsigned int)a3;
+ (unsigned)mattingOutputTypeForAttachedMediaKey:(id)a3;
- (BOOL)appliesFinalCropRect;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)submitWithoutSynchronization;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)sdofRenderingTuningParameters;
- (NSDictionary)sensorConfigurationsByPortType;
- (float)mainImageDownscalingFactor;
- (float)targetAspectRatio;
- (int)tuningConfiguration;
- (unsigned)enabledMattes;
- (void)dealloc;
- (void)setAppliesFinalCropRect:(BOOL)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setEnabledMattes:(unsigned int)a3;
- (void)setMainImageDownscalingFactor:(float)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setSdofRenderingTuningParameters:(id)a3;
- (void)setSensorConfigurationsByPortType:(id)a3;
- (void)setSubmitWithoutSynchronization:(BOOL)a3;
- (void)setTargetAspectRatio:(float)a3;
- (void)setTuningConfiguration:(int)a3;
@end

@implementation BWMattingV2InferenceConfiguration

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (BOOL)appliesFinalCropRect
{
  return self->_appliesFinalCropRect;
}

- (int)tuningConfiguration
{
  return self->_tuningConfiguration;
}

- (float)targetAspectRatio
{
  return self->_targetAspectRatio;
}

- (BOOL)submitWithoutSynchronization
{
  return self->_submitWithoutSynchronization;
}

- (NSDictionary)sensorConfigurationsByPortType
{
  return self->_sensorConfigurationsByPortType;
}

- (NSDictionary)sdofRenderingTuningParameters
{
  return self->_sdofRenderingTuningParameters;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (unsigned)enabledMattes
{
  return self->_enabledMattes;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (void)setTuningConfiguration:(int)a3
{
  self->_tuningConfiguration = a3;
}

- (void)setSensorConfigurationsByPortType:(id)a3
{
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (void)setMainImageDownscalingFactor:(float)a3
{
  self->_mainImageDownscalingFactor = a3;
}

- (void)setEnabledMattes:(unsigned int)a3
{
  self->_enabledMattes = a3;
}

- (void)setAppliesFinalCropRect:(BOOL)a3
{
  self->_appliesFinalCropRect = a3;
}

- (void)setTargetAspectRatio:(float)a3
{
  self->_targetAspectRatio = a3;
}

+ (unsigned)mattingOutputTypeForAttachedMediaKey:(id)a3
{
  if ([a3 isEqualToString:0x1EFA74440]) {
    return 1;
  }
  if ([a3 isEqualToString:0x1EFA74420]) {
    return 2;
  }
  if ([a3 isEqualToString:@"PersonSemanticsHair"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"PersonSemanticsSkin"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"PersonSemanticsTeeth"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"PersonSemanticsGlasses"]) {
    return 32;
  }
  if ([a3 isEqualToString:0x1EFA745A0]) {
    return 64;
  }
  if ([a3 isEqualToString:0x1EFA745C0]) {
    return 128;
  }
  return 0;
}

- (void)setSubmitWithoutSynchronization:(BOOL)a3
{
  self->_submitWithoutSynchronization = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

+ (id)inputAttachedMediaKeyForMattingOutputType:(unsigned int)a3
{
  return +[BWMattingV2InferenceProvider inputAttachedMediaKeyForMattingOutputType:*(void *)&a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMattingV2InferenceConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

+ (BOOL)isMattingOutputAttachedMediaKey:(id)a3
{
  unsigned int v3 = [a1 mattingOutputTypeForAttachedMediaKey:a3];
  return v3 >= 2 && v3 != 256 && v3 != 128;
}

- (void)setSdofRenderingTuningParameters:(id)a3
{
}

@end
@interface BWPhotosCurationInferenceConfiguration
+ (id)configuration;
- (BWPhotosCurationInferenceConfiguration)initWithInferenceType:(int)a3;
- (int)semanticDevelopmentVersion;
- (void)setSemanticDevelopmentVersion:(int)a3;
@end

@implementation BWPhotosCurationInferenceConfiguration

- (BWPhotosCurationInferenceConfiguration)initWithInferenceType:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BWPhotosCurationInferenceConfiguration;
  result = [(BWInferenceConfiguration *)&v4 initWithInferenceType:*(void *)&a3];
  if (result) {
    *(_DWORD *)(&result->super._suppressTimeOutFailure + 3) = 0;
  }
  return result;
}

+ (id)configuration
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInferenceType:803];
  return v2;
}

- (int)semanticDevelopmentVersion
{
  return *(_DWORD *)(&self->super._suppressTimeOutFailure + 3);
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  *(_DWORD *)(&self->super._suppressTimeOutFailure + 3) = a3;
}

@end
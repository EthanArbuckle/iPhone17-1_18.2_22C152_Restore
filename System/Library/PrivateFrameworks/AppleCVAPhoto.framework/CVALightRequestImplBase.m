@interface CVALightRequestImplBase
- (CVALightRequestImplBase)init;
- (NSDictionary)faceKitProcessOutput;
- (float)portraitStyleStrength;
- (void)setFaceKitProcessOutput:(id)a3;
- (void)setPortraitStyleStrength:(float)a3;
@end

@implementation CVALightRequestImplBase

- (void).cxx_destruct
{
}

- (void)setPortraitStyleStrength:(float)a3
{
  self->_portraitStyleStrength = a3;
}

- (float)portraitStyleStrength
{
  return self->_portraitStyleStrength;
}

- (void)setFaceKitProcessOutput:(id)a3
{
}

- (NSDictionary)faceKitProcessOutput
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (CVALightRequestImplBase)init
{
  v6.receiver = self;
  v6.super_class = (Class)CVALightRequestImplBase;
  v2 = [(CVALightRequestImplBase *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_portraitStyleStrength = NAN;
    v4 = v2;
  }

  return v3;
}

@end
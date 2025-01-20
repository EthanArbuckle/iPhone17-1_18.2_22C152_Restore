@interface CVAPortraitGenericRequestImpl
- (BOOL)isTmpConfig;
- (CVABackgroundRequest)background;
- (CVALightRequest)light;
- (CVAPostProcessingRequest)post;
- (void)setBackground:(id)a3;
- (void)setIsTmpConfig:(BOOL)a3;
- (void)setLight:(id)a3;
- (void)setPost:(id)a3;
@end

@implementation CVAPortraitGenericRequestImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_light, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

- (void)setIsTmpConfig:(BOOL)a3
{
  self->_isTmpConfig = a3;
}

- (BOOL)isTmpConfig
{
  return self->_isTmpConfig;
}

- (void)setPost:(id)a3
{
}

- (CVAPostProcessingRequest)post
{
  return (CVAPostProcessingRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLight:(id)a3
{
}

- (CVALightRequest)light
{
  return (CVALightRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackground:(id)a3
{
}

- (CVABackgroundRequest)background
{
  return (CVABackgroundRequest *)objc_getProperty(self, a2, 16, 1);
}

@end
@interface CAMQuadraHighResolutionStillImageCommand
- (BOOL)_isEnabled;
- (CAMQuadraHighResolutionStillImageCommand)initWithCoder:(id)a3;
- (CAMQuadraHighResolutionStillImageCommand)initWithFeatureEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMQuadraHighResolutionStillImageCommand

- (CAMQuadraHighResolutionStillImageCommand)initWithFeatureEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  v4 = [(CAMCaptureCommand *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (void)executeWithContext:(id)a3
{
  id v9 = a3;
  v4 = [v9 currentVideoDeviceFormat];
  int v5 = [v4 supportsQuadraHighResolutionStillImageOutput];
  BOOL v6 = [(CAMQuadraHighResolutionStillImageCommand *)self _isEnabled];
  if (v5)
  {
    BOOL v7 = v6;
    objc_super v8 = [v9 currentStillImageOutput];
    [v8 setHighResolutionCaptureEnabled:v7];
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMQuadraHighResolutionStillImageCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  int v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMFeature0StillImageCommandEnabled"];
    BOOL v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMQuadraHighResolutionStillImageCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMFeature0StillImageCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMQuadraHighResolutionStillImageCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMQuadraHighResolutionStillImageCommand *)self _isEnabled];
  return v4;
}

@end
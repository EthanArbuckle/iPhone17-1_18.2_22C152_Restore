@interface CAMSpatialOverCaptureEnabledCommand
- (BOOL)_isEnabled;
- (CAMSpatialOverCaptureEnabledCommand)initWithCoder:(id)a3;
- (CAMSpatialOverCaptureEnabledCommand)initWithSpatialOverCaptureEnabled:(BOOL)a3;
- (CAMSpatialOverCaptureEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMSpatialOverCaptureEnabledCommand

- (CAMSpatialOverCaptureEnabledCommand)initWithSpatialOverCaptureEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMSpatialOverCaptureEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMSpatialOverCaptureEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMSpatialOverCaptureEnabledCommand *)self initWithSpatialOverCaptureEnabled:0];
}

- (CAMSpatialOverCaptureEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMSpatialOverCaptureEnabledKey"];
  return [(CAMSpatialOverCaptureEnabledCommand *)self initWithSpatialOverCaptureEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMSpatialOverCaptureEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMSpatialOverCaptureEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMSpatialOverCaptureEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMSpatialOverCaptureEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMSpatialOverCaptureEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  id v7 = [v4 currentVideoDevice];
  objc_super v5 = [v4 currentVideoDeviceFormat];
  objc_super v6 = [v4 currentStillImageOutput];

  if ([v5 isSpatialOverCaptureSupported]) {
    objc_msgSend(v7, "setSpatialOverCaptureEnabled:", -[CAMSpatialOverCaptureEnabledCommand _isEnabled](self, "_isEnabled"));
  }
  [v6 setSpatialOverCaptureEnabled:0];
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
@interface CAMLowLightTimelapseCommand
- (BOOL)_isEnabled;
- (CAMLowLightTimelapseCommand)initWithCoder:(id)a3;
- (CAMLowLightTimelapseCommand)initWithTimelapseLowLightCompensationEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMLowLightTimelapseCommand

- (CAMLowLightTimelapseCommand)initWithTimelapseLowLightCompensationEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMLowLightTimelapseCommand;
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
  v4 = [a3 currentVideoDevice];
  memset(&v9, 0, sizeof(v9));
  CMTimeMake(&v9, 1, 15);
  if ([(CAMLowLightTimelapseCommand *)self _isEnabled])
  {
    memset(&v8, 0, sizeof(v8));
    if (v4) {
      [v4 activeVideoMaxFrameDuration];
    }
    CMTime time1 = v8;
    CMTime time2 = v9;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      CMTime v5 = v9;
      [v4 setActiveVideoMaxFrameDuration:&v5];
    }
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMLowLightTimelapseCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMLowLightTimelapseCommand;
  CMTime v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMLowLightTimelapseCommandEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightTimelapseCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightTimelapseCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMLowLightTimelapseCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightTimelapseCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMLowLightTimelapseCommand *)self _isEnabled];
  return v4;
}

@end
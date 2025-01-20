@interface CAMLowLightBoostCommand
- (BOOL)_isEnabled;
- (CAMLowLightBoostCommand)initWithCoder:(id)a3;
- (CAMLowLightBoostCommand)initWithLowLightBoostEnabled:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMLowLightBoostCommand

- (CAMLowLightBoostCommand)initWithLowLightBoostEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMLowLightBoostCommand;
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
  id v5 = [a3 currentVideoDevice];
  BOOL v4 = [(CAMLowLightBoostCommand *)self _isEnabled];
  if ([v5 isLowLightBoostSupported]) {
    [v5 setAutomaticallyEnablesLowLightBoostWhenAvailable:v4];
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMLowLightBoostCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMLowLightBoostCommand;
  id v5 = [(CAMCaptureCommand *)&v8 init];
  if (v5)
  {
    v5->__enabled = [v4 decodeBoolForKey:@"CAMLowLightBoostCommandEnabled"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMLowLightBoostCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMLowLightBoostCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMLowLightBoostCommandEnabled");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightBoostCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMLowLightBoostCommand *)self _isEnabled];
  return v4;
}

@end
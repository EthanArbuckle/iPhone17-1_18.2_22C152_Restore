@interface CAMDemosaicedRAWEnabledCommand
- (BOOL)_isEnabled;
- (CAMDemosaicedRAWEnabledCommand)initWithCoder:(id)a3;
- (CAMDemosaicedRAWEnabledCommand)initWithEnabled:(BOOL)a3;
- (CAMDemosaicedRAWEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMDemosaicedRAWEnabledCommand

- (CAMDemosaicedRAWEnabledCommand)initWithEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMDemosaicedRAWEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMDemosaicedRAWEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMDemosaicedRAWEnabledCommand *)self initWithEnabled:0];
}

- (CAMDemosaicedRAWEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMDemosaicedRAWEnabledKey"];
  return [(CAMDemosaicedRAWEnabledCommand *)self initWithEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMDemosaicedRAWEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMDemosaicedRAWEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMDemosaicedRAWEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMDemosaicedRAWEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMDemosaicedRAWEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  if ([v4 isAppleProRAWSupported]) {
    objc_msgSend(v4, "setAppleProRAWEnabled:", -[CAMDemosaicedRAWEnabledCommand _isEnabled](self, "_isEnabled"));
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
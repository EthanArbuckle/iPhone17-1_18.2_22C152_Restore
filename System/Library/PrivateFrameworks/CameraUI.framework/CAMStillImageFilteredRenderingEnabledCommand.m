@interface CAMStillImageFilteredRenderingEnabledCommand
- (BOOL)_isEnabled;
- (CAMStillImageFilteredRenderingEnabledCommand)initWithCoder:(id)a3;
- (CAMStillImageFilteredRenderingEnabledCommand)initWithFilteredRenderingEnabled:(BOOL)a3;
- (CAMStillImageFilteredRenderingEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStillImageFilteredRenderingEnabledCommand

- (CAMStillImageFilteredRenderingEnabledCommand)initWithFilteredRenderingEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMStillImageFilteredRenderingEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
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
  id v4 = a3;
  BOOL v5 = [(CAMStillImageFilteredRenderingEnabledCommand *)self _isEnabled];
  id v6 = [v4 currentStillImageOutput];

  [v6 setFilterRenderingEnabled:v5];
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMStillImageFilteredRenderingEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMStillImageFilteredRenderingEnabledCommand *)self initWithFilteredRenderingEnabled:0];
}

- (CAMStillImageFilteredRenderingEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMStillImageFilteredRenderingEnabledKey"];
  return [(CAMStillImageFilteredRenderingEnabledCommand *)self initWithFilteredRenderingEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMStillImageFilteredRenderingEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImageFilteredRenderingEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMStillImageFilteredRenderingEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMStillImageFilteredRenderingEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMStillImageFilteredRenderingEnabledCommand *)self _isEnabled];
  return v4;
}

@end
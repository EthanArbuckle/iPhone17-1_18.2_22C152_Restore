@interface CAMStillImageDepthDataDeliveryEnabledCommand
- (BOOL)_isEnabled;
- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithCoder:(id)a3;
- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithDepthDataDeliveryEnabled:(BOOL)a3;
- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStillImageDepthDataDeliveryEnabledCommand

- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithDepthDataDeliveryEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMStillImageDepthDataDeliveryEnabledCommand;
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
  BOOL v5 = [(CAMStillImageDepthDataDeliveryEnabledCommand *)self _isEnabled];
  id v6 = [v4 currentStillImageOutput];

  if ([v6 isDepthDataDeliverySupported]) {
    [v6 setDepthDataDeliveryEnabled:v5];
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMStillImageDepthDataDeliveryEnabledCommand *)self initWithDepthDataDeliveryEnabled:0];
}

- (CAMStillImageDepthDataDeliveryEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMStillImageDepthDataDeliveryEnabledKey"];
  return [(CAMStillImageDepthDataDeliveryEnabledCommand *)self initWithDepthDataDeliveryEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMStillImageDepthDataDeliveryEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImageDepthDataDeliveryEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMStillImageDepthDataDeliveryEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMStillImageDepthDataDeliveryEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMStillImageDepthDataDeliveryEnabledCommand *)self _isEnabled];
  return v4;
}

@end
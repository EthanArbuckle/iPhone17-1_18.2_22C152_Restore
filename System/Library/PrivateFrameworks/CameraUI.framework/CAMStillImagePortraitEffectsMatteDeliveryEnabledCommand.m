@interface CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand
- (BOOL)_isEnabled;
- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithCoder:(id)a3;
- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithPortraitEffectsMatteDeliveryEnabled:(BOOL)a3;
- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand

- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithPortraitEffectsMatteDeliveryEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand;
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
  id v4 = [a3 currentStillImageOutput];
  if ([v4 isPortraitEffectsMatteDeliverySupported]) {
    objc_msgSend(v4, "setPortraitEffectsMatteDeliveryEnabled:", -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand _isEnabled](self, "_isEnabled"));
  }
}

- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *)self initWithPortraitEffectsMatteDeliveryEnabled:0];
}

- (CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMStillImagePortraitEffectsMatteDeliveryEnabledKey"];
  return [(CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *)self initWithPortraitEffectsMatteDeliveryEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMStillImagePortraitEffectsMatteDeliveryEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand *)self _isEnabled];
  return v4;
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
@interface CAMDeferredProcessingEnabledCommand
- (BOOL)_isEnabled;
- (CAMDeferredProcessingEnabledCommand)initWithCoder:(id)a3;
- (CAMDeferredProcessingEnabledCommand)initWithDeferredProcessingEnabled:(BOOL)a3;
- (CAMDeferredProcessingEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMDeferredProcessingEnabledCommand

- (CAMDeferredProcessingEnabledCommand)initWithDeferredProcessingEnabled:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMDeferredProcessingEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v8 initWithSubcommands:0];
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMDeferredProcessingEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMDeferredProcessingEnabledCommand *)self initWithDeferredProcessingEnabled:0];
}

- (CAMDeferredProcessingEnabledCommand)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"CAMDeferredProcessingEnabledKey"];
  return [(CAMDeferredProcessingEnabledCommand *)self initWithDeferredProcessingEnabled:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMDeferredProcessingEnabledCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMDeferredProcessingEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), @"CAMDeferredProcessingEnabledKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMDeferredProcessingEnabledCommand;
  id v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMDeferredProcessingEnabledCommand *)self _isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  if ([v4 isDeferredProcessingSupported]) {
    objc_msgSend(v4, "setDeferredProcessingEnabled:", -[CAMDeferredProcessingEnabledCommand _isEnabled](self, "_isEnabled"));
  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
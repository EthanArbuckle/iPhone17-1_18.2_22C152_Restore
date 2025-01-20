@interface CAMUltraHighResolutionZeroShutterLagEnabledCommand
- (BOOL)isEnabled;
- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithCoder:(id)a3;
- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithEnabled:(BOOL)a3;
- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMUltraHighResolutionZeroShutterLagEnabledCommand

- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMUltraHighResolutionZeroShutterLagEnabledCommand;
  result = [(CAMCaptureCommand *)&v5 initWithSubcommands:0];
  if (result) {
    result->_enabled = a3;
  }
  return result;
}

- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithSubcommands:(id)a3
{
  return [(CAMUltraHighResolutionZeroShutterLagEnabledCommand *)self initWithEnabled:0];
}

- (CAMUltraHighResolutionZeroShutterLagEnabledCommand)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMUltraHighResolutionZeroShutterLagEnabledCommand;
  [(CAMCaptureCommand *)&v3 encodeWithCoder:a3];
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"NSCoding not implemented"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMUltraHighResolutionZeroShutterLagEnabledCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[24] = [(CAMUltraHighResolutionZeroShutterLagEnabledCommand *)self isEnabled];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  v4 = [a3 currentStillImageOutput];
  if (v4)
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      if ([v4 isUltraHighResolutionZeroShutterLagSupportEnabled]) {
        objc_msgSend(v4, "setUltraHighResolutionZeroShutterLagEnabled:", -[CAMUltraHighResolutionZeroShutterLagEnabledCommand isEnabled](self, "isEnabled"));
      }
    }
    else
    {
      objc_super v5 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[CAMUltraHighResolutionZeroShutterLagEnabledCommand executeWithContext:](v5);
      }
    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)executeWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "UltraHighResolutionZeroShutterLag SPI not available", v1, 2u);
}

@end
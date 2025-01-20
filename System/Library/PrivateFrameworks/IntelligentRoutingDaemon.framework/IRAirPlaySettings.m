@interface IRAirPlaySettings
+ (id)shared;
- (BOOL)isAutoRoutingSettingEnabled;
- (BOOL)isAutoRoutingSettingEnabledInternal;
- (BOOL)isRoutePredictionSettingEnabled;
- (BOOL)isRoutePredictionSettingEnabledInternal;
- (IRAirPlaySettings)init;
- (id)dumpState;
- (void)setIsAutoRoutingSettingEnabledInternal:(BOOL)a3;
- (void)setIsRoutePredictionSettingEnabledInternal:(BOOL)a3;
@end

@implementation IRAirPlaySettings

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__IRAirPlaySettings_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, block);
  }
  v2 = (void *)shared_sharedInstance_0;

  return v2;
}

uint64_t __27__IRAirPlaySettings_shared__block_invoke(uint64_t a1)
{
  shared_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (IRAirPlaySettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)IRAirPlaySettings;
  v2 = [(IRAirPlaySettings *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IRAirPlaySettings *)v2 setIsAutoRoutingSettingEnabledInternal:1];
    [(IRAirPlaySettings *)v3 setIsRoutePredictionSettingEnabledInternal:1];
  }
  return v3;
}

- (BOOL)isAutoRoutingSettingEnabled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"EnableAutoRouting", @"com.apple.coremedia", &keyExistsAndHasValidFormat))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  uint64_t v4 = v3;
  if ([(IRAirPlaySettings *)self isAutoRoutingSettingEnabledInternal] != v4)
  {
    [(IRAirPlaySettings *)self setIsAutoRoutingSettingEnabledInternal:v4];
    objc_super v5 = (void *)*MEMORY[0x263F50098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50098], OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSNumber;
      v7 = v5;
      v8 = objc_msgSend(v6, "numberWithBool:", -[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal"));
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#airplay-settings, autoRoutingSettingEnabled: %@", buf, 0xCu);
    }
  }
  return [(IRAirPlaySettings *)self isAutoRoutingSettingEnabledInternal];
}

- (BOOL)isRoutePredictionSettingEnabled
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"EnableRoutePrediction", @"com.apple.coremedia", &keyExistsAndHasValidFormat))
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  uint64_t v4 = v3;
  if ([(IRAirPlaySettings *)self isRoutePredictionSettingEnabledInternal] != v4)
  {
    [(IRAirPlaySettings *)self setIsRoutePredictionSettingEnabledInternal:v4];
    objc_super v5 = (void *)*MEMORY[0x263F50098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50098], OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSNumber;
      v7 = v5;
      v8 = objc_msgSend(v6, "numberWithBool:", -[IRAirPlaySettings isRoutePredictionSettingEnabledInternal](self, "isRoutePredictionSettingEnabledInternal"));
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#airplay-settings, routePredictionSettingEnabled: %@", buf, 0xCu);
    }
  }
  return [(IRAirPlaySettings *)self isRoutePredictionSettingEnabledInternal]
      || [(IRAirPlaySettings *)self isAutoRoutingSettingEnabledInternal];
}

- (id)dumpState
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IRAirPlaySettings isAutoRoutingSettingEnabledInternal](self, "isAutoRoutingSettingEnabledInternal"));
  objc_super v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IRAirPlaySettings isRoutePredictionSettingEnabledInternal](self, "isRoutePredictionSettingEnabledInternal"));
  v6 = [v3 stringWithFormat:@"IRAirPlaySettings: autoRoutingSettingEnabled: %@, routePredictionSettingEnabled: %@", v4, v5];

  return v6;
}

- (BOOL)isAutoRoutingSettingEnabledInternal
{
  return self->_isAutoRoutingSettingEnabledInternal;
}

- (void)setIsAutoRoutingSettingEnabledInternal:(BOOL)a3
{
  self->_isAutoRoutingSettingEnabledInternal = a3;
}

- (BOOL)isRoutePredictionSettingEnabledInternal
{
  return self->_isRoutePredictionSettingEnabledInternal;
}

- (void)setIsRoutePredictionSettingEnabledInternal:(BOOL)a3
{
  self->_isRoutePredictionSettingEnabledInternal = a3;
}

@end
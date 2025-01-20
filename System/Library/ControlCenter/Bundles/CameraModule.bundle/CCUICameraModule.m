@interface CCUICameraModule
- (void)handleTapWithTouchType:(int64_t)a3;
- (void)handleTouchDownWithTouchType:(int64_t)a3;
@end

@implementation CCUICameraModule

- (void)handleTouchDownWithTouchType:(int64_t)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F33C50];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x263F33C50]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_240629000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_DID_BEGIN_INTERACTION_EVENT", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  v6 = [NSNumber numberWithLongLong:mach_absolute_time()];
  v7 = [NSNumber numberWithLongLong:mach_continuous_time()];
  uint64_t v8 = *MEMORY[0x263EF96E0];
  uint64_t v9 = *MEMORY[0x263EF96F0];
  v14[0] = *MEMORY[0x263EF96E8];
  v14[1] = v9;
  v15[0] = v8;
  v15[1] = v6;
  v14[2] = *MEMORY[0x263EF96F8];
  v15[2] = v7;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v11 = [(CCUIAppLauncherModule *)self applicationIdentifier];
  AVCapturePrewarmWithOptions();

  v12.receiver = self;
  v12.super_class = (Class)CCUICameraModule;
  [(CCUIAppLauncherModule *)&v12 handleTouchDownWithTouchType:a3];
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  v5 = *MEMORY[0x263F33C50];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x263F33C50]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_240629000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CCUI_MODULE_HANDLE_TAP_EVENT", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  v6.receiver = self;
  v6.super_class = (Class)CCUICameraModule;
  [(CCUIAppLauncherModule *)&v6 handleTapWithTouchType:a3];
}

@end
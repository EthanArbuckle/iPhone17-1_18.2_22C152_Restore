@interface ANVolumeController
+ (id)sharedController;
- (float)smartSiriVolume;
- (void)setVolumeWithOptions:(unint64_t)a3;
@end

@implementation ANVolumeController

+ (id)sharedController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ANVolumeController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_controller;

  return v2;
}

uint64_t __38__ANVolumeController_sharedController__block_invoke()
{
  sharedController_controller = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)setVolumeWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(ANVolumeController *)self smartSiriVolume];
  if (v3)
  {
    float v5 = v4;
    if (v4 != -1.0)
    {
      v6 = [MEMORY[0x263F544E0] sharedAVSystemController];
      *(float *)&double v7 = v5;
      uint64_t v8 = [v6 setVolumeTo:@"VoiceCommand" forCategory:v7];

      if (ANLogHandleVolumeController_once != -1) {
        dispatch_once(&ANLogHandleVolumeController_once, &__block_literal_global_0);
      }
      v9 = (id)ANLogHandleVolumeController_logger;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(float *)&double v10 = v5;
        v11 = [NSNumber numberWithFloat:v10];
        v12 = [NSNumber numberWithBool:v8];
        int v13 = 138412802;
        v14 = &stru_26D2D46B0;
        __int16 v15 = 2112;
        v16 = v11;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_220FAA000, v9, OS_LOG_TYPE_DEFAULT, "%@Volume set to %@ = %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
}

- (float)smartSiriVolume
{
  return -1.0;
}

@end
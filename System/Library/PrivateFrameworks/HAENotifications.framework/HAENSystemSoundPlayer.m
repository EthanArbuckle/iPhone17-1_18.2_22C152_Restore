@interface HAENSystemSoundPlayer
+ (id)sharedInstance;
- (HAENSystemSoundPlayer)init;
- (id)playSystemSoundWithEvent:(id)a3 completion:(id)a4;
- (void)dealloc;
@end

@implementation HAENSystemSoundPlayer

+ (id)sharedInstance
{
  if (sharedInstance_once_3 != -1) {
    dispatch_once(&sharedInstance_once_3, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_instance_3;
  return v2;
}

uint64_t __39__HAENSystemSoundPlayer_sharedInstance__block_invoke()
{
  sharedInstance_instance_3 = objc_alloc_init(HAENSystemSoundPlayer);
  return MEMORY[0x270F9A758]();
}

- (HAENSystemSoundPlayer)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HAENSystemSoundPlayer;
  v2 = [(HAENSystemSoundPlayer *)&v16 init];
  if (v2)
  {
    v3 = NSDictionary;
    v4 = [NSNumber numberWithUnsignedInteger:2];
    uint64_t v5 = *MEMORY[0x263EFC0F8];
    v6 = [NSNumber numberWithBool:1];
    uint64_t v7 = *MEMORY[0x263EFC100];
    LODWORD(v8) = 1.0;
    v9 = [NSNumber numberWithFloat:v8];
    uint64_t v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v6, v7, v9, *MEMORY[0x263EFC118], 0);
    options = v2->_options;
    v2->_options = (NSDictionary *)v10;

    v2->_turnOFFSound = 0;
    if (MGGetBoolAnswer())
    {
      CFPreferencesAppSynchronize(@"com.apple.coreaudio");
      if (CFPreferencesGetAppBooleanValue(@"haen_soundoff", @"com.apple.coreaudio", 0))
      {
        v2->_turnOFFSound = 1;
        v12 = HAENotificationsLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FABA000, v12, OS_LOG_TYPE_DEFAULT, "Setting HAEN Sounds off", buf, 2u);
        }
      }
    }
    v13 = HAENotificationsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v2->_options;
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_21FABA000, v13, OS_LOG_TYPE_INFO, "System Sound Options: %@", buf, 0xCu);
    }
  }
  return v2;
}

- (id)playSystemSoundWithEvent:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = HAENotificationsLog();
  v9 = [v6 uuid];
  os_signpost_id_t v10 = [v9 hash];

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = [v6 uuid];
    int v13 = 138412290;
    v14 = v11;
    _os_signpost_emit_with_name_impl(&dword_21FABA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "HAENSSPlayed", "%@", (uint8_t *)&v13, 0xCu);
  }
  if (!self->_turnOFFSound) {
    AudioServicesPlaySystemSoundWithOptions();
  }

  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)HAENSystemSoundPlayer;
  [(HAENSystemSoundPlayer *)&v2 dealloc];
}

- (void).cxx_destruct
{
}

@end
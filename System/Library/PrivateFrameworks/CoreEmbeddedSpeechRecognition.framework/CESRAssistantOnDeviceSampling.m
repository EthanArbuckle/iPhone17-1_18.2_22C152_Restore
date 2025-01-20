@interface CESRAssistantOnDeviceSampling
+ (id)sharedManager;
- (BOOL)isRequestSelectedForSamplingForTask:(id)a3;
- (CESRAssistantOnDeviceSampling)init;
@end

@implementation CESRAssistantOnDeviceSampling

- (BOOL)isRequestSelectedForSamplingForTask:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
  uint64_t v5 = [v4 siriDataSharingOptInStatus];

  if (v5 == 1)
  {
    if (([v3 isEqualToString:@"SearchOrMessaging"] & 1) != 0
      || ([v3 isEqualToString:@"SiriDictation"] & 1) != 0
      || ([v3 isEqualToString:@"Beto"] & 1) != 0)
    {
      char v6 = 1;
    }
    else
    {
      char v6 = [v3 isEqualToString:@"BetoDictation"];
    }
  }
  else
  {
    v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "-[CESRAssistantOnDeviceSampling isRequestSelectedForSamplingForTask:]";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Assistant Sampling: User is NOT opted in.", (uint8_t *)&v9, 0xCu);
    }
    char v6 = 0;
  }

  return v6;
}

- (CESRAssistantOnDeviceSampling)init
{
  v3.receiver = self;
  v3.super_class = (Class)CESRAssistantOnDeviceSampling;
  return [(CESRAssistantOnDeviceSampling *)&v3 init];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_325);
  }
  v2 = (void *)sharedManager_sharedMyManager;

  return v2;
}

uint64_t __46__CESRAssistantOnDeviceSampling_sharedManager__block_invoke()
{
  sharedManager_sharedMyManager = objc_alloc_init(CESRAssistantOnDeviceSampling);

  return MEMORY[0x1F41817F8]();
}

@end
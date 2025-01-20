@interface RegisterPeriodicPowerLoggingActivity
@end

@implementation RegisterPeriodicPowerLoggingActivity

void ___RegisterPeriodicPowerLoggingActivity_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  v3 = [MEMORY[0x1E4F5D3A8] sharedPowerLogger];
  v4 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  uint64_t v5 = [v4 voiceTriggerEnabled];
  v6 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  v7 = [v6 powerLoggingCurrentLanguage];
  v8 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  v9 = [v8 powerLoggingCurrentAssetConfigVersion];
  [v3 powerLogSiriConfigWithVoiceTriggerEnabled:v5 withLanguage:v7 withModelVersion:v9];

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }
}

void ___RegisterPeriodicPowerLoggingActivity_block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_object_t v2 = xpc_activity_copy_criteria(activity);
  if (!v2)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14238] + *MEMORY[0x1E4F14218]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E4F141A8], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14138], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14338], 0);
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E4F14340], 0);
    xpc_activity_set_criteria(activity, v3);
  }
}

@end
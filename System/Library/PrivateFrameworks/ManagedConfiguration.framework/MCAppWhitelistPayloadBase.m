@interface MCAppWhitelistPayloadBase
+ (id)knownOptionsKeys;
+ (id)knownUserEnabledOptionKeys;
- (BOOL)allowAccessWithoutPasscode;
- (BOOL)forceAllowSupervisorAccess;
- (MCAppWhitelistPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)whitelistedAppsAndOptions;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)verboseDescription;
- (void)setAllowAccessWithoutPasscode:(BOOL)a3;
- (void)setForceAllowSupervisorAccess:(BOOL)a3;
- (void)setWhitelistedAppsAndOptions:(id)a3;
@end

@implementation MCAppWhitelistPayloadBase

+ (id)knownOptionsKeys
{
  if (knownOptionsKeys_onceToken != -1) {
    dispatch_once(&knownOptionsKeys_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)knownOptionsKeys_keys;
  return v2;
}

void __45__MCAppWhitelistPayloadBase_knownOptionsKeys__block_invoke()
{
  v4[13] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"DisableTouch";
  v4[1] = @"DisableDeviceRotation";
  v4[2] = @"DisableVolumeButtons";
  v4[3] = @"DisableRingerSwitch";
  v4[4] = @"DisableSleepWakeButton";
  v4[5] = @"DisableAutoLock";
  v4[6] = @"EnableVoiceOver";
  v4[7] = @"EnableZoom";
  v4[8] = @"EnableInvertColors";
  v4[9] = @"EnableAssistiveTouch";
  v4[10] = @"EnableSpeakSelection";
  v4[11] = @"EnableMonoAudio";
  v4[12] = @"EnableVoiceControl";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:13];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)knownOptionsKeys_keys;
  knownOptionsKeys_keys = v2;
}

+ (id)knownUserEnabledOptionKeys
{
  if (knownUserEnabledOptionKeys_onceToken != -1) {
    dispatch_once(&knownUserEnabledOptionKeys_onceToken, &__block_literal_global_10_0);
  }
  uint64_t v2 = (void *)knownUserEnabledOptionKeys_keys;
  return v2;
}

void __55__MCAppWhitelistPayloadBase_knownUserEnabledOptionKeys__block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"Zoom";
  v4[1] = @"InvertColors";
  v4[2] = @"AssistiveTouch";
  v4[3] = @"VoiceOver";
  v4[4] = @"VoiceControl";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)knownUserEnabledOptionKeys_keys;
  knownUserEnabledOptionKeys_keys = v2;
}

- (MCAppWhitelistPayloadBase)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCAppWhitelistPayloadBase;
  v10 = [(MCPayload *)&v16 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10 && [v9 isStub])
  {
    uint64_t v11 = [v8 objectForKey:@"Apps"];
    whitelistedAppsAndOptions = v10->_whitelistedAppsAndOptions;
    v10->_whitelistedAppsAndOptions = (NSArray *)v11;

    v13 = [v8 objectForKey:@"AllowAccessWithoutPasscode"];
    v10->_allowAccessWithoutPasscode = [v13 BOOLValue];

    v14 = [v8 objectForKey:@"ForceAllowSupervisorAccess"];
    v10->_forceAllowSupervisorAccess = [v14 BOOLValue];

    [v8 removeObjectForKey:@"Apps"];
    [v8 removeObjectForKey:@"AllowAccessWithoutPasscode"];
    [v8 removeObjectForKey:@"ForceAllowSupervisorAccess"];
  }

  return v10;
}

- (id)restrictions
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (![(MCAppWhitelistPayloadBase *)self allowAccessWithoutPasscode])
  {
    v31[0] = @"value";
    v31[1] = @"preference";
    v32[0] = MEMORY[0x1E4F1CC28];
    v32[1] = MEMORY[0x1E4F1CC28];
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    [v4 setObject:v5 forKeyedSubscript:@"allowAccessWithoutPasscodeInAppLock"];
  }
  if ([(MCAppWhitelistPayloadBase *)self forceAllowSupervisorAccess])
  {
    v29[0] = @"value";
    v29[1] = @"preference";
    v30[0] = MEMORY[0x1E4F1CC38];
    v30[1] = MEMORY[0x1E4F1CC38];
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v4 setObject:v6 forKeyedSubscript:@"forceGrantSupervisorAccessInAppLock"];
  }
  [v3 setObject:v4 forKeyedSubscript:@"restrictedBool"];
  v7 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1CA48];
    id v9 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
    v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v11 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_super v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKey:@"Identifier"];
          if (v16) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }

    v26 = @"appLockBundleIDs";
    v24 = @"values";
    v25 = v10;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v27 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v3 setObject:v18 forKeyedSubscript:@"intersection"];
  }
  return v3;
}

- (id)stubDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)MCAppWhitelistPayloadBase;
  v3 = [(MCPayload *)&v9 stubDictionary];
  v4 = v3;
  whitelistedAppsAndOptions = self->_whitelistedAppsAndOptions;
  if (whitelistedAppsAndOptions) {
    [v3 setObject:whitelistedAppsAndOptions forKey:@"Apps"];
  }
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCAppWhitelistPayloadBase allowAccessWithoutPasscode](self, "allowAccessWithoutPasscode"));
  [v4 setObject:v6 forKey:@"AllowAccessWithoutPasscode"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCAppWhitelistPayloadBase forceAllowSupervisorAccess](self, "forceAllowSupervisorAccess"));
  [v4 setObject:v7 forKey:@"ForceAllowSupervisorAccess"];

  return v4;
}

- (id)verboseDescription
{
  v7.receiver = self;
  v7.super_class = (Class)MCAppWhitelistPayloadBase;
  v3 = [(MCPayload *)&v7 verboseDescription];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"App whitelist:\n"];
  v5 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
  [v4 appendFormat:@"  Apps: %@\n", v5];

  objc_msgSend(v4, "appendFormat:", @"  Allow access without passcode: %d\n", -[MCAppWhitelistPayloadBase allowAccessWithoutPasscode](self, "allowAccessWithoutPasscode"));
  objc_msgSend(v4, "appendFormat:", @"  Allow supervisor access: %d\n", -[MCAppWhitelistPayloadBase forceAllowSupervisorAccess](self, "forceAllowSupervisorAccess"));
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [MCKeyValue alloc];
  v5 = MCLocalizedStringForBool([(MCAppWhitelistPayloadBase *)self allowAccessWithoutPasscode]);
  v6 = MCLocalizedString(@"ALLOW_ACCESS_WITHOUT_PASSCODE");
  objc_super v7 = [(MCKeyValue *)v4 initWithLocalizedString:v5 localizedKey:v6];

  id v8 = [MCKeyValue alloc];
  objc_super v9 = MCLocalizedStringForBool([(MCAppWhitelistPayloadBase *)self forceAllowSupervisorAccess]);
  v10 = MCLocalizedString(@"ALLOW_SUPERVISOR_ACCESS");
  uint64_t v11 = [(MCKeyValue *)v8 initWithLocalizedString:v9 localizedKey:v10];

  v37[0] = v7;
  v37[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  uint64_t v13 = +[MCKeyValueSection sectionWithKeyValues:v12];

  uint64_t v14 = v3;
  [v3 addObject:v13];
  v15 = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];

  if (v15)
  {
    v28 = v13;
    v29 = v11;
    v30 = v7;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(MCAppWhitelistPayloadBase *)self whitelistedAppsAndOptions];
    uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v21 = objc_opt_new();
          long long v22 = [v20 objectForKey:@"Identifier"];
          long long v23 = [MCKeyValue alloc];
          v24 = MCLocalizedString(@"APP");
          v25 = [(MCKeyValue *)v23 initWithLocalizedString:v22 localizedKey:v24];

          [v21 addObject:v25];
          v26 = +[MCKeyValueSection sectionWithKeyValues:v21];
          [v14 addObject:v26];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    uint64_t v11 = v29;
    objc_super v7 = v30;
    uint64_t v13 = v28;
  }

  return v14;
}

- (NSArray)whitelistedAppsAndOptions
{
  return self->_whitelistedAppsAndOptions;
}

- (void)setWhitelistedAppsAndOptions:(id)a3
{
}

- (BOOL)allowAccessWithoutPasscode
{
  return self->_allowAccessWithoutPasscode;
}

- (void)setAllowAccessWithoutPasscode:(BOOL)a3
{
  self->_allowAccessWithoutPasscode = a3;
}

- (BOOL)forceAllowSupervisorAccess
{
  return self->_forceAllowSupervisorAccess;
}

- (void)setForceAllowSupervisorAccess:(BOOL)a3
{
  self->_forceAllowSupervisorAccess = a3;
}

- (void).cxx_destruct
{
}

@end
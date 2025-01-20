@interface DNDSPlaceholderModeManager
- (DNDSPlaceholderModeManager)initWithBackingStore:(id)a3;
- (NSString)sysdiagnoseDataIdentifier;
- (id)_readPlaceholderModesReturningError:(id *)a3;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)placeholderModeIgnoringExcludedPlatformsForSemanticType:(int64_t)a3;
- (id)placeholderModesWithError:(id *)a3;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
@end

@implementation DNDSPlaceholderModeManager

- (DNDSPlaceholderModeManager)initWithBackingStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSPlaceholderModeManager;
  v6 = [(DNDSPlaceholderModeManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingStore, a3);
  }

  return v7;
}

- (id)placeholderModesWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(DNDSPlaceholderModeManager *)self _readPlaceholderModesReturningError:a3];
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = currentDevicePlatformString();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = v3;
  v6 = [v3 placeholderModes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v11 placeholderExcludedPlatforms];
        char v13 = [v12 containsObject:v5];

        if ((v13 & 1) == 0)
        {
          v14 = [MEMORY[0x1E4F5F5F8] modeForRecord:v11];
          if ([v14 semanticType] != 9
            || (_os_feature_enabled_impl() & 1) != 0
            || !+[DNDSPlatformEligibility isIntelligenceAvailable])
          {
            [v4 addObject:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)placeholderModeIgnoringExcludedPlatformsForSemanticType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [(DNDSPlaceholderModeManager *)self _readPlaceholderModesReturningError:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(v4, "placeholderModes", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 semanticType] == a3)
        {
          v11 = [MEMORY[0x1E4F5F5F8] modeForRecord:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v6 = a4;
  return v6;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.PlaceholderModeManager";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"placeholderModes";
  v4 = -[DNDSPlaceholderModeManager placeholderModesWithError:](self, "placeholderModesWithError:", 0, a4);
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)_readPlaceholderModesReturningError:(id *)a3
{
  backingStore = self->_backingStore;
  id v10 = 0;
  id v5 = [(DNDSBackingStore *)backingStore readRecordWithError:&v10];
  id v6 = v10;
  uint64_t v7 = v6;
  if (v6)
  {
    if (a3) {
      *a3 = v6;
    }
    uint64_t v8 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[DNDSPlaceholderModeManager _readPlaceholderModesReturningError:]((uint64_t)v7, v8);
    }
    _DNDSRequestRadar(@"Failed to load placeholder Focus modes", v7, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSPlaceholderModeManager.m", 109);
  }
  if (!v5) {
    id v5 = objc_alloc_init(DNDSPlaceholderModesRecord);
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)_readPlaceholderModesReturningError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Failed to load placeholder modes, will request a radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end
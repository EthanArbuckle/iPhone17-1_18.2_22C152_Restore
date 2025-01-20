@interface HTProcessTerminationSettings
+ (HTProcessTerminationSettings)sharedSettings;
- (BOOL)_addTrackedReason:(unint64_t)a3 propagatingSubReasons:(BOOL)a4;
- (BOOL)_removeTrackedReason:(unint64_t)a3;
- (BOOL)_removeTrackedReason:(unint64_t)a3 propagatingSubReasons:(BOOL)a4;
- (BOOL)_removeTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4;
- (BOOL)_setTrackedReasons:(unint64_t)a3 propagatingSubReasons:(BOOL)a4;
- (BOOL)_setTrackedSubReasons:(unint64_t)a3 forReason:(unint64_t)a4;
- (BOOL)_setTracksAllProcesses:(BOOL)a3;
- (BOOL)_setTracksCriticalProcesses:(BOOL)a3;
- (BOOL)_trackAllDefaultReasons;
- (BOOL)_trackAllReasons;
- (BOOL)_trackAllSubReasonsForReason:(unint64_t)a3;
- (BOOL)displayTerminationsInHUD;
- (BOOL)isForceQuitDetectionEnabled;
- (BOOL)tracksAllProcesses;
- (BOOL)tracksCriticalProcesses;
- (HTProcessTerminationSettings)init;
- (HTProcessTerminationSettings)initWithDefaults:(id)a3;
- (NSArray)criticalProcessNames;
- (NSArray)trackedProcessNames;
- (id)availableSubReasonsForReason:(unint64_t)a3;
- (int64_t)forceQuitDetectionThreshold;
- (unint64_t)allReasonsValue;
- (unint64_t)allSubReasonsValueForReason:(unint64_t)a3;
- (unint64_t)trackedReasons;
- (unint64_t)trackedSubReasonsForReason:(unint64_t)a3;
- (void)addTrackedProcessNamed:(id)a3;
- (void)addTrackedReason:(unint64_t)a3;
- (void)addTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4;
- (void)applySettings;
- (void)removeTrackedProcessNamed:(id)a3;
- (void)removeTrackedReason:(unint64_t)a3;
- (void)removeTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4;
- (void)setDisplayTerminationsInHUD:(BOOL)a3;
- (void)setForceQuitDetectionEnabled:(BOOL)a3;
- (void)setForceQuitDetectionThreshold:(int64_t)a3;
- (void)setTrackedProcessNames:(id)a3;
- (void)setTrackedReasons:(unint64_t)a3;
- (void)setTrackedSubReasons:(unint64_t)a3 forReason:(unint64_t)a4;
- (void)setTracksAllProcesses:(BOOL)a3;
- (void)setTracksCriticalProcesses:(BOOL)a3;
- (void)trackAllReasons;
- (void)trackAllSubReasonsForReason:(unint64_t)a3;
@end

@implementation HTProcessTerminationSettings

+ (HTProcessTerminationSettings)sharedSettings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HTProcessTerminationSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, block);
  }
  v2 = (void *)sharedSettings_sharedInstance;

  return (HTProcessTerminationSettings *)v2;
}

uint64_t __46__HTProcessTerminationSettings_sharedSettings__block_invoke()
{
  sharedSettings_sharedInstance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (HTProcessTerminationSettings)init
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x263F42798]];
  v5 = [(HTProcessTerminationSettings *)self initWithDefaults:v4];

  return v5;
}

- (HTProcessTerminationSettings)initWithDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HTProcessTerminationSettings;
  v6 = [(HTProcessTerminationSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_defaults, a3);
  }

  return v7;
}

- (BOOL)isForceQuitDetectionEnabled
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:*MEMORY[0x263F427F0]];
}

- (void)setForceQuitDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HTProcessTerminationSettings *)self isForceQuitDetectionEnabled] != a3)
  {
    defaults = self->_defaults;
    if (v3) {
      [(NSUserDefaults *)defaults setBool:1 forKey:*MEMORY[0x263F427F0]];
    }
    else {
      [(NSUserDefaults *)defaults removeObjectForKey:*MEMORY[0x263F427F0]];
    }
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (int64_t)forceQuitDetectionThreshold
{
  return [(NSUserDefaults *)self->_defaults integerForKey:*MEMORY[0x263F427F8]];
}

- (void)setForceQuitDetectionThreshold:(int64_t)a3
{
  if ([(HTProcessTerminationSettings *)self forceQuitDetectionThreshold] != a3)
  {
    defaults = self->_defaults;
    if (a3 == 3000) {
      [(NSUserDefaults *)defaults removeObjectForKey:*MEMORY[0x263F427F8]];
    }
    else {
      [(NSUserDefaults *)defaults setInteger:a3 forKey:*MEMORY[0x263F427F8]];
    }
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (void)applySettings
{
}

- (BOOL)displayTerminationsInHUD
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:*MEMORY[0x263F42898]];
}

- (void)setDisplayTerminationsInHUD:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HTProcessTerminationSettings *)self displayTerminationsInHUD] != a3)
  {
    defaults = self->_defaults;
    if (v3)
    {
      [(NSUserDefaults *)defaults setBool:1 forKey:*MEMORY[0x263F42898]];
      v6 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x263F42890]];

      if (!v6) {
        [(HTProcessTerminationSettings *)self _setTracksCriticalProcesses:1];
      }
      v7 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x263F428A8]];

      if (!v7) {
        [(HTProcessTerminationSettings *)self _trackAllDefaultReasons];
      }
    }
    else
    {
      [(NSUserDefaults *)defaults removeObjectForKey:*MEMORY[0x263F42898]];
    }
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)tracksAllProcesses
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:*MEMORY[0x263F42888]];
}

- (void)setTracksAllProcesses:(BOOL)a3
{
  if ([(HTProcessTerminationSettings *)self _setTracksAllProcesses:a3])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_setTracksAllProcesses:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HTProcessTerminationSettings *)self tracksAllProcesses] ^ a3;
  if (v5) {
    [(NSUserDefaults *)self->_defaults setBool:v3 forKey:*MEMORY[0x263F42888]];
  }
  return v5;
}

- (BOOL)tracksCriticalProcesses
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:*MEMORY[0x263F42890]];
}

- (void)setTracksCriticalProcesses:(BOOL)a3
{
  if ([(HTProcessTerminationSettings *)self _setTracksCriticalProcesses:a3])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_setTracksCriticalProcesses:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HTProcessTerminationSettings *)self tracksCriticalProcesses] ^ a3;
  if (v5) {
    [(NSUserDefaults *)self->_defaults setBool:v3 forKey:*MEMORY[0x263F42890]];
  }
  return v5;
}

- (NSArray)criticalProcessNames
{
  return (NSArray *)&unk_2701CBE40;
}

- (NSArray)trackedProcessNames
{
  v2 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x263F428A0]];
  BOOL v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA68];
  }
  v4 = v2;

  return v4;
}

- (void)setTrackedProcessNames:(id)a3
{
  id v10 = a3;
  v4 = [(HTProcessTerminationSettings *)self trackedProcessNames];
  char v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [v10 count];
    defaults = self->_defaults;
    if (v6)
    {
      v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v10];
      objc_super v9 = [v8 array];
      [(NSUserDefaults *)defaults setObject:v9 forKey:*MEMORY[0x263F428A0]];
    }
    else
    {
      [(NSUserDefaults *)self->_defaults removeObjectForKey:*MEMORY[0x263F428A0]];
    }
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (void)addTrackedProcessNamed:(id)a3
{
  id v6 = a3;
  v4 = [(HTProcessTerminationSettings *)self trackedProcessNames];
  char v5 = (void *)[v4 mutableCopy];

  if (([v5 containsObject:v6] & 1) == 0)
  {
    [v5 addObject:v6];
    [(HTProcessTerminationSettings *)self setTrackedProcessNames:v5];
  }
}

- (void)removeTrackedProcessNamed:(id)a3
{
  id v4 = a3;
  char v5 = [(HTProcessTerminationSettings *)self trackedProcessNames];
  id v7 = (id)[v5 mutableCopy];

  uint64_t v6 = [v7 indexOfObject:v4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v7 removeObjectAtIndex:v6];
    [(HTProcessTerminationSettings *)self setTrackedProcessNames:v7];
  }
}

- (unint64_t)trackedReasons
{
  BOOL v3 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x263F428A8]];
  unint64_t v4 = [v3 unsignedLongLongValue];

  if (v4 != 1) {
    return v4;
  }

  return [(HTProcessTerminationSettings *)self allReasonsValue];
}

- (void)setTrackedReasons:(unint64_t)a3
{
  if ([(HTProcessTerminationSettings *)self _setTrackedReasons:a3 propagatingSubReasons:1])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_setTrackedReasons:(unint64_t)a3 propagatingSubReasons:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(HTProcessTerminationSettings *)self trackedReasons];
  if (v7 != a3)
  {
    if (a3 == 1) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = [(HTProcessTerminationSettings *)self allReasonsValue] == a3 ? 1 : a3;
    }
    defaults = self->_defaults;
    id v10 = [NSNumber numberWithUnsignedLongLong:v8];
    [(NSUserDefaults *)defaults setObject:v10 forKey:*MEMORY[0x263F428A8]];

    if (v4)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v11 = [(HTProcessTerminationSettings *)self availableReasons];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedLongLongValue];
            if (a3 == 1 || (v16 & a3) == v16) {
              [(HTProcessTerminationSettings *)self _trackAllSubReasonsForReason:v16];
            }
            else {
              [(HTProcessTerminationSettings *)self _setTrackedSubReasons:0 forReason:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }
    }
  }
  return v7 != a3;
}

- (unint64_t)allReasonsValue
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v2 = allReasonsValue_allReasons;
  if (!allReasonsValue_allReasons)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v3 = [(HTProcessTerminationSettings *)self availableReasons];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) unsignedLongLongValue];
          allReasonsValue_allReasons |= v8;
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    return allReasonsValue_allReasons;
  }
  return v2;
}

- (void)addTrackedReason:(unint64_t)a3
{
  if ([(HTProcessTerminationSettings *)self _addTrackedReason:a3 propagatingSubReasons:1])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_addTrackedReason:(unint64_t)a3 propagatingSubReasons:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(HTProcessTerminationSettings *)self trackedReasons] | a3;

  return [(HTProcessTerminationSettings *)self _setTrackedReasons:v6 propagatingSubReasons:v4];
}

- (void)removeTrackedReason:(unint64_t)a3
{
  if ([(HTProcessTerminationSettings *)self _removeTrackedReason:a3])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_removeTrackedReason:(unint64_t)a3
{
  return [(HTProcessTerminationSettings *)self _removeTrackedReason:a3 propagatingSubReasons:1];
}

- (BOOL)_removeTrackedReason:(unint64_t)a3 propagatingSubReasons:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(HTProcessTerminationSettings *)self trackedReasons] & ~a3;

  return [(HTProcessTerminationSettings *)self _setTrackedReasons:v6 propagatingSubReasons:v4];
}

- (void)trackAllReasons
{
  if ([(HTProcessTerminationSettings *)self _trackAllReasons])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_trackAllReasons
{
  return [(HTProcessTerminationSettings *)self _setTrackedReasons:1 propagatingSubReasons:1];
}

- (BOOL)_trackAllDefaultReasons
{
  BOOL v3 = [(HTProcessTerminationSettings *)self _setTrackedReasons:1 propagatingSubReasons:1];
  BOOL v4 = [(HTProcessTerminationSettings *)self _removeTrackedSubReason:1024 forReason:2];
  return [(HTProcessTerminationSettings *)self _removeTrackedSubReason:0x8000 forReason:2]|| v4|| v3;
}

- (id)availableSubReasonsForReason:(unint64_t)a3
{
  return HTTerminationAllAvailableSubReasonsForReason(a3);
}

- (unint64_t)allSubReasonsValueForReason:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = -[HTProcessTerminationSettings availableSubReasonsForReason:](self, "availableSubReasonsForReason:", a3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedLongLongValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)trackedSubReasonsForReason:(unint64_t)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"%@.%llu", *MEMORY[0x263F428A8], a3];
  unint64_t v6 = [(NSUserDefaults *)self->_defaults objectForKey:v5];
  unint64_t v7 = [v6 unsignedLongLongValue];

  if (v7 == 1) {
    unint64_t v7 = [(HTProcessTerminationSettings *)self allSubReasonsValueForReason:a3];
  }

  return v7;
}

- (void)setTrackedSubReasons:(unint64_t)a3 forReason:(unint64_t)a4
{
  if ([(HTProcessTerminationSettings *)self _setTrackedSubReasons:a3 forReason:a4])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_setTrackedSubReasons:(unint64_t)a3 forReason:(unint64_t)a4
{
  if ([(HTProcessTerminationSettings *)self trackedSubReasonsForReason:a4] == a3) {
    return 0;
  }
  unint64_t v7 = [(HTProcessTerminationSettings *)self availableSubReasonsForReason:a4];
  uint64_t v8 = [v7 count];

  if (!v8) {
    return 0;
  }
  if (a3 == 1)
  {
    unint64_t v9 = 1;
  }
  else if ([(HTProcessTerminationSettings *)self allSubReasonsValueForReason:a4] == a3)
  {
    unint64_t v9 = 1;
  }
  else
  {
    unint64_t v9 = a3;
  }
  long long v11 = [NSString stringWithFormat:@"%@.%llu", *MEMORY[0x263F428A8], a4];
  defaults = self->_defaults;
  long long v13 = [NSNumber numberWithUnsignedLongLong:v9];
  [(NSUserDefaults *)defaults setObject:v13 forKey:v11];

  unint64_t v14 = [(HTProcessTerminationSettings *)self trackedReasons];
  unint64_t v15 = v14 & a4;
  if (a3)
  {
    if (v14 != 1 && !v15) {
      [(HTProcessTerminationSettings *)self _addTrackedReason:a4 propagatingSubReasons:0];
    }
  }
  else if (v14 == 1 || v15 == a4)
  {
    [(HTProcessTerminationSettings *)self _removeTrackedReason:a4 propagatingSubReasons:0];
  }

  return 1;
}

- (void)addTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4
{
  unint64_t v6 = [(HTProcessTerminationSettings *)self trackedSubReasonsForReason:a4] | a3;

  [(HTProcessTerminationSettings *)self setTrackedSubReasons:v6 forReason:a4];
}

- (void)removeTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4
{
  if ([(HTProcessTerminationSettings *)self _removeTrackedSubReason:a3 forReason:a4])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_removeTrackedSubReason:(unint64_t)a3 forReason:(unint64_t)a4
{
  unint64_t v6 = [(HTProcessTerminationSettings *)self trackedSubReasonsForReason:a4] & ~a3;

  return [(HTProcessTerminationSettings *)self _setTrackedSubReasons:v6 forReason:a4];
}

- (void)trackAllSubReasonsForReason:(unint64_t)a3
{
  if ([(HTProcessTerminationSettings *)self _trackAllSubReasonsForReason:a3])
  {
    [(HTProcessTerminationSettings *)self applySettings];
  }
}

- (BOOL)_trackAllSubReasonsForReason:(unint64_t)a3
{
  return [(HTProcessTerminationSettings *)self _setTrackedSubReasons:1 forReason:a3];
}

- (void).cxx_destruct
{
}

@end
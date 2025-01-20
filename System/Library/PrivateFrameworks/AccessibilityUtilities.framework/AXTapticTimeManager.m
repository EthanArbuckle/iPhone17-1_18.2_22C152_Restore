@interface AXTapticTimeManager
+ (id)sharedInstance;
- (AXTapticTimeManager)init;
- (BOOL)_is24HourTime;
- (BOOL)_preStartCheck;
- (BOOL)_startPowerAssertion;
- (BOOL)isCurrentlyOutputting;
- (NSDate)dateOverride;
- (NSLocale)localeOverride;
- (id)_atomToLegacyVibePattern:(id)a3;
- (id)_convertSoundToStringName:(unsigned int)a3;
- (id)_dateComponentsForClockTime;
- (id)testingQueueCallback;
- (int64_t)_numberOfTapHoursForClockTimeWithEncoding:(int64_t)a3;
- (int64_t)_numberOfTapMinutesForClockTime;
- (int64_t)_numberOfTapsForHourNumber:(int64_t)a3 withEncoding:(int64_t)a4;
- (unsigned)assertionID;
- (void)_cleanupHapticsDict;
- (void)_clearQueue;
- (void)_dequeueSound;
- (void)_enqueueHours:(unint64_t)a3 encoding:(int64_t)a4;
- (void)_enqueueMinutes:(unint64_t)a3 encoding:(int64_t)a4;
- (void)_handleTestingQueueCallback;
- (void)_informObserversDidOutputSSID:(int64_t)a3;
- (void)_informObserversDidStart;
- (void)_informObserversDidStop;
- (void)_informObserversWillOutputSSID:(int64_t)a3 hapticsDescriptions:(id)a4;
- (void)_outputWithEnqueueBlock:(id)a3;
- (void)_stopPowerAssertion;
- (void)_updateHapticPatternsIfNecessary:(BOOL)a3;
- (void)_updateIs24HourTime;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)outputHours:(int64_t)a3;
- (void)outputHoursAndMinutes:(int64_t)a3;
- (void)outputMinutes:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)setAssertionID:(unsigned int)a3;
- (void)setDateOverride:(id)a3;
- (void)setLocaleOverride:(id)a3;
- (void)setTestingQueueCallback:(id)a3;
- (void)stopCurrentOutput;
@end

@implementation AXTapticTimeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_36);
  }
  v2 = (void *)sharedInstance__sHapticOutputShared;

  return v2;
}

uint64_t __37__AXTapticTimeManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXTapticTimeManager);
  uint64_t v1 = sharedInstance__sHapticOutputShared;
  sharedInstance__sHapticOutputShared = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (AXTapticTimeManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)AXTapticTimeManager;
  v2 = [(AXTapticTimeManager *)&v18 init];
  v3 = v2;
  if (v2)
  {
    [(AXTapticTimeManager *)v2 setAssertionID:0];
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedSounds = v3->_enqueuedSounds;
    v3->_enqueuedSounds = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    enqueuedSoundDelays = v3->_enqueuedSoundDelays;
    v3->_enqueuedSoundDelays = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    soundToPatterns = v3->_soundToPatterns;
    v3->_soundToPatterns = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    hapticsDescriptions = v3->_hapticsDescriptions;
    v3->_hapticsDescriptions = v12;

    [(AXTapticTimeManager *)v3 _updateHapticPatternsIfNecessary:0];
    [(AXTapticTimeManager *)v3 _updateIs24HourTime];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v3 selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    os_activity_t v15 = _os_activity_create(&dword_18D308000, "Taptic Time", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DETACHED);
    activity = v3->_activity;
    v3->_activity = (OS_os_activity *)v15;
  }
  return v3;
}

- (void)_updateHapticPatternsIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  v101[4] = *MEMORY[0x1E4F143B8];
  cachedSpeed = self->_cachedSpeed;
  if (!cachedSpeed
    || ([(NSNumber *)cachedSpeed floatValue],
        double v6 = v5,
        +[AXSettings sharedInstance],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 voiceOverTapticTimeSpeed],
        double v9 = vabdd_f64(v6, v8),
        v7,
        v9 >= 2.22044605e-16))
  {
    if (v3) {
      [(AXTapticTimeManager *)self _cleanupHapticsDict];
    }
    unint64_t v10 = 0x1E4F28000uLL;
    v11 = NSNumber;
    v12 = +[AXSettings sharedInstance];
    [v12 voiceOverTapticTimeSpeed];
    objc_msgSend(v11, "numberWithFloat:");
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = self->_cachedSpeed;
    self->_cachedSpeed = v13;

    [(NSMutableDictionary *)self->_soundToPatterns removeAllObjects];
    [(NSNumber *)self->_cachedSpeed floatValue];
    double v16 = v15;
    double v17 = 0.12 / v15;
    *(float *)&double v17 = v17;
    v100[0] = @"Amplitude";
    v100[1] = @"StartTime";
    v101[0] = &unk_1EDC635B8;
    v101[1] = &unk_1EDC635C8;
    v101[2] = @"BoostSineBrake";
    v100[2] = @"Type";
    v100[3] = @"Duration";
    v19 = [NSNumber numberWithFloat:v17];
    v101[3] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:4];

    v98[0] = @"Amplitude";
    v98[1] = @"StartTime";
    v99[0] = &unk_1EDC635D8;
    v99[1] = &unk_1EDC635C8;
    v99[2] = @"BoostSineBrake";
    v98[2] = @"Type";
    v98[3] = @"Duration";
    unint64_t v21 = 0x1E4F1C000uLL;
    float v18 = 0.37 / v16;
    *(float *)&double v22 = v18;
    v23 = [NSNumber numberWithFloat:v22];
    v99[3] = v23;
    v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:4];

    float v24 = 0.35 / v16;
    double v25 = 0.65 / v16;
    v26 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v27 = *MEMORY[0x1E4F18A10];
    double v28 = v24;
    double v29 = 0.0;
    uint64_t v30 = 32;
    uint64_t v79 = *MEMORY[0x1E4F18A10];
    do
    {
      v31 = (void *)[v20 mutableCopy];
      v32 = [*(id *)(v10 + 3792) numberWithDouble:v29];
      [v31 setObject:v32 forKey:@"StartTime"];

      [v26 addObject:v31];
      v96[0] = @"Amplitude";
      v96[1] = @"Atoms";
      v97[0] = &unk_1EDC635B8;
      v97[1] = v26;
      v33 = [*(id *)(v21 + 2536) dictionaryWithObjects:v97 forKeys:v96 count:2];
      uint64_t v94 = v27;
      v95 = v33;
      [*(id *)(v21 + 2536) dictionaryWithObjects:&v95 forKeys:&v94 count:1];
      AudioServicesCreateSystemSoundIDWithOptions();
      v34 = (void *)[v26 copy];
      hapticsDescriptions = self->_hapticsDescriptions;
      v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&self->super.isa + v30)];
      [(NSMutableDictionary *)hapticsDescriptions setObject:v34 forKeyedSubscript:v36];

      soundToPatterns = self->_soundToPatterns;
      v92[0] = @"Intensity";
      v92[1] = @"VibePattern";
      v93[0] = &unk_1EDC635B8;
      v38 = [(AXTapticTimeManager *)self _atomToLegacyVibePattern:v26];
      v93[1] = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
      v40 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&self->super.isa + v30)];
      v41 = soundToPatterns;
      unint64_t v21 = 0x1E4F1C000;
      [(NSMutableDictionary *)v41 setObject:v39 forKey:v40];

      uint64_t v27 = v79;
      double v29 = v29 + v28;

      unint64_t v10 = 0x1E4F28000;
      v30 += 4;
    }
    while (v30 != 128);
    [v26 removeAllObjects];
    float v42 = v25;
    double v43 = v42;
    double v44 = 0.0;
    do
    {
      v45 = (void *)[v78 mutableCopy];
      v46 = [NSNumber numberWithDouble:v44];
      [v45 setObject:v46 forKey:@"StartTime"];

      [v26 addObject:v45];
      v90[0] = @"Amplitude";
      v90[1] = @"Atoms";
      v91[0] = &unk_1EDC635B8;
      v91[1] = v26;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
      uint64_t v88 = v79;
      v89 = v47;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      AudioServicesCreateSystemSoundIDWithOptions();
      v48 = (void *)[v26 copy];
      v49 = self->_hapticsDescriptions;
      v50 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&self->super.isa + v30)];
      [(NSMutableDictionary *)v49 setObject:v48 forKeyedSubscript:v50];

      v51 = self->_soundToPatterns;
      v86[0] = @"Intensity";
      v86[1] = @"VibePattern";
      v87[0] = &unk_1EDC635B8;
      v52 = [(AXTapticTimeManager *)self _atomToLegacyVibePattern:v26];
      v87[1] = v52;
      v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:2];
      v54 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&self->super.isa + v30)];
      [(NSMutableDictionary *)v51 setObject:v53 forKey:v54];

      double v44 = v44 + v43;
      v30 += 4;
    }
    while (v30 != 224);
    uint64_t v55 = 0;
    do
    {
      [v26 removeAllObjects];
      uint64_t v56 = 0;
      double v57 = 0.0;
      v58 = v26;
      do
      {
        [&unk_1EDC63288 objectAtIndex:v55];
        v60 = uint64_t v59 = v55;
        v61 = objc_msgSend(v60, "substringWithRange:", v56, 1);

        int v62 = [v61 isEqualToString:@"-"];
        BOOL v63 = v62 == 0;
        if (v62) {
          v64 = v78;
        }
        else {
          v64 = v20;
        }
        if (v63) {
          double v65 = 0.3;
        }
        else {
          double v65 = 0.5;
        }
        v66 = (void *)[v64 mutableCopy];
        v67 = [NSNumber numberWithDouble:v57];
        [v66 setObject:v67 forKey:@"StartTime"];

        [v58 addObject:v66];
        uint64_t v55 = v59;
        ++v56;
        double v57 = v57 + v65;
      }
      while (v56 != 5);
      v84[0] = @"Amplitude";
      v84[1] = @"Atoms";
      v85[0] = &unk_1EDC635B8;
      v85[1] = v58;
      v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
      uint64_t v82 = v79;
      v83 = v77;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      v68 = &self->_ssIDHapticMorse[v59];
      AudioServicesCreateSystemSoundIDWithOptions();
      v69 = (void *)[v58 copy];
      v70 = self->_hapticsDescriptions;
      v71 = [NSNumber numberWithUnsignedInt:*v68];
      [(NSMutableDictionary *)v70 setObject:v69 forKeyedSubscript:v71];

      v76 = self->_soundToPatterns;
      v80[0] = @"Intensity";
      v80[1] = @"VibePattern";
      v81[0] = &unk_1EDC635B8;
      v72 = [(AXTapticTimeManager *)self _atomToLegacyVibePattern:v58];
      v81[1] = v72;
      v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
      v74 = [NSNumber numberWithUnsignedInt:*v68];
      [(NSMutableDictionary *)v76 setObject:v73 forKey:v74];

      uint64_t v55 = v59 + 1;
      BOOL v63 = v59 == 9;
      v26 = v58;
    }
    while (!v63);
  }
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)_informObserversDidStart
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = AXLogTapticTime();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "taptic time did start", buf, 2u);
  }

  os_activity_scope_enter((os_activity_t)self->_activity, &self->_scopeState);
  self->_isCurrentlyOutputting = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "tapticTimeManagerDidBegin:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_informObserversDidStop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = AXLogTapticTime();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_DEFAULT, "taptic time did stop", buf, 2u);
  }

  os_activity_scope_leave(&self->_scopeState);
  self->_isCurrentlyOutputting = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "tapticTimeManagerDidComplete:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_informObserversWillOutputSSID:(int64_t)a3 hapticsDescriptions:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = AXLogTapticTime();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v20 = a3;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_INFO, "will output ssid: %zd, hapticsDescriptions: %@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = self->_observers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "tapticTimeManager:willOutputSSID:hapticsDescriptions:", self, a3, v6, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_informObserversDidOutputSSID:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AXLogTapticTime();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a3;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "did output ssid: %zd", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "tapticTimeManager:didOutputSSID:", self, a3, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_cleanupHapticsDict
{
  for (uint64_t i = 0; i != 24; ++i)
  {
    AudioServicesDisposeSystemSoundID(self->_ssIDHapticFast[i]);
    AudioServicesDisposeSystemSoundID(self->_ssIDHapticSlow[i]);
  }
  for (uint64_t j = 0; j != 10; ++j)
    AudioServicesDisposeSystemSoundID(self->_ssIDHapticMorse[j]);
  hapticsDescriptions = self->_hapticsDescriptions;

  [(NSMutableDictionary *)hapticsDescriptions removeAllObjects];
}

- (void)dealloc
{
  [(AXTapticTimeManager *)self _cleanupHapticsDict];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXTapticTimeManager;
  [(AXTapticTimeManager *)&v4 dealloc];
}

- (id)_atomToLegacyVibePattern:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    float v8 = 0.0;
    uint64_t v9 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v12 = [v11 objectForKey:@"StartTime"];
        [v12 doubleValue];
        double v14 = v13;

        if (v14 > 0.0)
        {
          [v4 addObject:MEMORY[0x1E4F1CC28]];
          long long v15 = [NSNumber numberWithDouble:(v14 - v8) * 1000.0];
          [v4 addObject:v15];
        }
        long long v16 = [v11 objectForKey:@"Duration"];
        [v16 doubleValue];
        double v18 = v17;

        uint64_t v19 = [v11 objectForKey:@"Type"];
        LODWORD(v16) = [v19 isEqualToString:@"Tap"];

        [v4 addObject:v9];
        if (v16)
        {
          [v4 addObject:&unk_1EDC62C28];
        }
        else
        {
          int64_t v20 = [NSNumber numberWithDouble:v18 * 1000.0];
          [v4 addObject:v20];
        }
        float v8 = v14;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)setLocaleOverride:(id)a3
{
  objc_storeStrong((id *)&self->_localeOverride, a3);

  [(AXTapticTimeManager *)self _localeDidChange:0];
}

- (void)_updateIs24HourTime
{
  id v3 = (void *)MEMORY[0x1E4F28C10];
  objc_super v4 = [(AXTapticTimeManager *)self localeOverride];
  if (v4)
  {
    id v7 = [v3 dateFormatFromTemplate:@"jj:mm" options:0 locale:v4];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v7 = [v3 dateFormatFromTemplate:@"jj:mm" options:0 locale:v5];
  }
  BOOL v6 = [v7 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL
    || [v7 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;
  self->_is24Hour = v6;
}

- (BOOL)_is24HourTime
{
  return self->_is24Hour;
}

- (int64_t)_numberOfTapsForHourNumber:(int64_t)a3 withEncoding:(int64_t)a4
{
  BOOL v6 = [(AXTapticTimeManager *)self _is24HourTime];
  int64_t v7 = 12;
  int64_t v8 = a3 % 12;
  uint64_t v9 = 24;
  if (a4 == 3) {
    uint64_t v9 = 0;
  }
  if (v6)
  {
    int64_t v8 = a3;
    int64_t v7 = v9;
  }
  if (v8) {
    return v8;
  }
  else {
    return v7;
  }
}

- (id)_dateComponentsForClockTime
{
  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  objc_super v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [(AXTapticTimeManager *)self dateOverride];

  if (v5)
  {
    uint64_t v6 = [(AXTapticTimeManager *)self dateOverride];

    objc_super v4 = (void *)v6;
  }
  int64_t v7 = [v3 components:96 fromDate:v4];

  return v7;
}

- (int64_t)_numberOfTapHoursForClockTimeWithEncoding:(int64_t)a3
{
  uint64_t v5 = [(AXTapticTimeManager *)self _dateComponentsForClockTime];
  int64_t v6 = -[AXTapticTimeManager _numberOfTapsForHourNumber:withEncoding:](self, "_numberOfTapsForHourNumber:withEncoding:", [v5 hour], a3);

  return v6;
}

- (int64_t)_numberOfTapMinutesForClockTime
{
  v2 = [(AXTapticTimeManager *)self _dateComponentsForClockTime];
  int64_t v3 = [v2 minute];

  return v3;
}

- (void)_clearQueue
{
  [(NSMutableArray *)self->_enqueuedSounds removeAllObjects];
  enqueuedSoundDelays = self->_enqueuedSoundDelays;

  [(NSMutableArray *)enqueuedSoundDelays removeAllObjects];
}

- (BOOL)_preStartCheck
{
  if ([(AXTapticTimeManager *)self isCurrentlyOutputting]
    || ![(AXTapticTimeManager *)self _startPowerAssertion])
  {
    return 0;
  }
  BOOL v3 = 1;
  [(AXTapticTimeManager *)self _updateHapticPatternsIfNecessary:1];
  self->_currentSsid = 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

- (BOOL)_startPowerAssertion
{
  [(AXTapticTimeManager *)self _stopPowerAssertion];
  if (_startPowerAssertion_onceToken != -1) {
    dispatch_once(&_startPowerAssertion_onceToken, &__block_literal_global_97);
  }
  IOReturn v3 = IOPMAssertionCreateWithProperties((CFDictionaryRef)_startPowerAssertion_PMAssertionProperties, &self->_assertionID);
  if (v3) {
    [(AXTapticTimeManager *)self setAssertionID:0];
  }
  return v3 == 0;
}

void __43__AXTapticTimeManager__startPowerAssertion__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AssertType";
  v2[1] = @"AssertName";
  v3[0] = @"PreventUserIdleSystemSleep";
  v3[1] = @"Outputting taptic time";
  v2[2] = @"FrameworkBundleID";
  v2[3] = @"TimeoutAction";
  v3[2] = @"com.apple.AccessibilityUtilities";
  v3[3] = @"TimeoutActionRelease";
  v2[4] = @"TimeoutSeconds";
  v3[4] = &unk_1EDC62C40;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  uint64_t v1 = (void *)_startPowerAssertion_PMAssertionProperties;
  _startPowerAssertion_PMAssertionProperties = v0;
}

- (void)_stopPowerAssertion
{
  if ([(AXTapticTimeManager *)self assertionID])
  {
    IOPMAssertionRelease([(AXTapticTimeManager *)self assertionID]);
    [(AXTapticTimeManager *)self setAssertionID:0];
  }
}

- (void)_outputWithEnqueueBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__AXTapticTimeManager__outputWithEnqueueBlock___block_invoke;
    v6[3] = &unk_1E5586570;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __47__AXTapticTimeManager__outputWithEnqueueBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearQueue];
  uint64_t result = [*(id *)(a1 + 32) _preStartCheck];
  if (result)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _handleTestingQueueCallback];
    [*(id *)(a1 + 32) _informObserversDidStart];
    IOReturn v3 = *(void **)(a1 + 32);
    return [v3 _dequeueSound];
  }
  return result;
}

- (void)outputHoursAndMinutes:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__AXTapticTimeManager_outputHoursAndMinutes___block_invoke;
  v3[3] = &unk_1E55872B8;
  v3[4] = self;
  v3[5] = a3;
  [(AXTapticTimeManager *)self _outputWithEnqueueBlock:v3];
}

uint64_t __45__AXTapticTimeManager_outputHoursAndMinutes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_enqueueHours:encoding:", objc_msgSend(*(id *)(a1 + 32), "_numberOfTapHoursForClockTimeWithEncoding:", *(void *)(a1 + 40)), *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _numberOfTapMinutesForClockTime];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 _enqueueMinutes:v3 encoding:v4];
}

- (void)outputHours:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__AXTapticTimeManager_outputHours___block_invoke;
  v3[3] = &unk_1E55872B8;
  v3[4] = self;
  v3[5] = a3;
  [(AXTapticTimeManager *)self _outputWithEnqueueBlock:v3];
}

uint64_t __35__AXTapticTimeManager_outputHours___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _numberOfTapHoursForClockTimeWithEncoding:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 _enqueueHours:v3 encoding:v4];
}

- (void)outputMinutes:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__AXTapticTimeManager_outputMinutes___block_invoke;
  v3[3] = &unk_1E55872B8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __37__AXTapticTimeManager_outputMinutes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearQueue];
  uint64_t result = [*(id *)(a1 + 32) _preStartCheck];
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_enqueueMinutes:encoding:", objc_msgSend(*(id *)(a1 + 32), "_numberOfTapMinutesForClockTime"), *(void *)(a1 + 40));
    [*(id *)(a1 + 32) _handleTestingQueueCallback];
    [*(id *)(a1 + 32) _informObserversDidStart];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _dequeueSound];
  }
  return result;
}

- (void)stopCurrentOutput
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AXTapticTimeManager_stopCurrentOutput__block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __40__AXTapticTimeManager_stopCurrentOutput__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearQueue];
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 296);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    return MEMORY[0x1F40D4E70]();
  }
  return result;
}

- (void)_enqueueMinutes:(unint64_t)a3 encoding:(int64_t)a4
{
  [(NSNumber *)self->_cachedSpeed floatValue];
  float v8 = v7;
  double v9 = v7;
  if ([(NSMutableArray *)self->_enqueuedSounds count]) {
    double v10 = (float)(1.5 / v8);
  }
  else {
    double v10 = 0.0;
  }
  if (a4 != 1)
  {
    if (a4 != 3)
    {
      if (a4 != 2 || a3 < 0xF) {
        return;
      }
      unint64_t v11 = a3;
      enqueuedSounds = self->_enqueuedSounds;
      double v13 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticFast[v11 / 0xF + 23]];
      [(NSMutableArray *)enqueuedSounds addObject:v13];

      enqueuedSoundDelays = self->_enqueuedSoundDelays;
      long long v15 = NSNumber;
      double v16 = v10;
      goto LABEL_14;
    }
    float v22 = 0.9 / v9;
    unint64_t v27 = a3 / 0xA;
    unint64_t v28 = a3 % 0xA;
    double v29 = self->_enqueuedSounds;
    uint64_t v30 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticMorse[v27]];
    [(NSMutableArray *)v29 addObject:v30];

    v31 = self->_enqueuedSoundDelays;
    v32 = [NSNumber numberWithDouble:v10];
    [(NSMutableArray *)v31 addObject:v32];

    v33 = self->_enqueuedSounds;
    v34 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticMorse[v28]];
    [(NSMutableArray *)v33 addObject:v34];

    enqueuedSoundDelays = self->_enqueuedSoundDelays;
    long long v15 = NSNumber;
    goto LABEL_17;
  }
  int64_t v17 = a3 % 0xA;
  if (a3 >= 0xA)
  {
    double v18 = self->_enqueuedSounds;
    uint64_t v19 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticFast[a3 / 0xA + 23]];
    [(NSMutableArray *)v18 addObject:v19];

    int64_t v20 = self->_enqueuedSoundDelays;
    __int16 v21 = [NSNumber numberWithDouble:v10];
    [(NSMutableArray *)v20 addObject:v21];
  }
  if (v17 >= 1)
  {
    float v22 = 0.8 / v9;
    long long v23 = self->_enqueuedSounds;
    long long v24 = [NSNumber numberWithUnsignedInt:*((unsigned int *)&self->_observers + v17 + 1)];
    [(NSMutableArray *)v23 addObject:v24];

    enqueuedSoundDelays = self->_enqueuedSoundDelays;
    long long v15 = NSNumber;
    if (a3 < 0xA)
    {
      double v16 = v10 + v22;
LABEL_14:
      uint64_t v26 = [v15 numberWithDouble:v16];
LABEL_18:
      id v35 = (id)v26;
      [(NSMutableArray *)enqueuedSoundDelays addObject:v26];

      return;
    }
LABEL_17:
    *(float *)&double v25 = v22;
    uint64_t v26 = [v15 numberWithFloat:v25];
    goto LABEL_18;
  }
}

- (void)_enqueueHours:(unint64_t)a3 encoding:(int64_t)a4
{
  [(NSNumber *)self->_cachedSpeed floatValue];
  float v8 = v7;
  float v9 = 0.8 / v7;
  uint64_t v10 = [(NSMutableArray *)self->_enqueuedSounds count];
  if (a4 != 1)
  {
    if (a4 != 3)
    {
      if (a4 != 2) {
        return;
      }
      unint64_t v11 = a3 / 5;
      unint64_t v12 = a3 % 5;
      if (a3 > 4)
      {
        enqueuedSounds = self->_enqueuedSounds;
        v33 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticFast[v11 + 23]];
        [(NSMutableArray *)enqueuedSounds addObject:v33];

        [(NSMutableArray *)self->_enqueuedSoundDelays addObject:&unk_1EDC635C8];
        if (!v12) {
          return;
        }
        enqueuedSoundDelays = self->_enqueuedSoundDelays;
        *(float *)&double v34 = v9;
        v36 = [NSNumber numberWithFloat:v34];
        [(NSMutableArray *)enqueuedSoundDelays addObject:v36];
      }
      else
      {
        if (!v12) {
          return;
        }
        [(NSMutableArray *)self->_enqueuedSoundDelays addObject:&unk_1EDC635C8];
      }
      v37 = self->_enqueuedSounds;
      uint64_t v30 = [NSNumber numberWithUnsignedInt:*((unsigned int *)&self->_observers + v12 + 1)];
      id v38 = (id)v30;
      v31 = v37;
      goto LABEL_19;
    }
    if (v10) {
      double v20 = (float)(1.5 / v8);
    }
    else {
      double v20 = 0.0;
    }
    unint64_t v21 = a3 / 0xA;
    unint64_t v22 = a3 % 0xA;
    long long v23 = self->_enqueuedSounds;
    long long v24 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticMorse[v21]];
    [(NSMutableArray *)v23 addObject:v24];

    double v25 = self->_enqueuedSoundDelays;
    uint64_t v26 = [NSNumber numberWithDouble:v20];
    [(NSMutableArray *)v25 addObject:v26];

    int64_t v17 = self->_enqueuedSounds;
    double v18 = NSNumber;
    uint64_t v19 = self->_ssIDHapticMorse[v22];
LABEL_15:
    unint64_t v27 = [v18 numberWithUnsignedInt:v19];
    [(NSMutableArray *)v17 addObject:v27];

    unint64_t v28 = self->_enqueuedSoundDelays;
    *(float *)&double v29 = v9;
    uint64_t v30 = [NSNumber numberWithFloat:v29];
    id v38 = (id)v30;
    v31 = v28;
LABEL_19:
    [(NSMutableArray *)v31 addObject:v30];

    return;
  }
  unint64_t v13 = a3 / 0xA;
  int64_t v14 = a3 % 0xA;
  if (a3 >= 0xA)
  {
    long long v15 = self->_enqueuedSounds;
    double v16 = [NSNumber numberWithUnsignedInt:self->_ssIDHapticFast[v13 + 23]];
    [(NSMutableArray *)v15 addObject:v16];

    [(NSMutableArray *)self->_enqueuedSoundDelays addObject:&unk_1EDC635C8];
  }
  if (v14 >= 1)
  {
    int64_t v17 = self->_enqueuedSounds;
    double v18 = NSNumber;
    uint64_t v19 = *((unsigned int *)&self->_observers + v14 + 1);
    goto LABEL_15;
  }
}

- (id)_convertSoundToStringName:(unsigned int)a3
{
  for (uint64_t i = 0; i != 24; ++i)
  {
    uint64_t v4 = (char *)self + 4 * i;
    if (*((_DWORD *)v4 + 32) == a3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"slow_%d", i + 1);
      goto LABEL_12;
    }
    if (*((_DWORD *)v4 + 8) == a3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"fast_%d", i + 1);
      goto LABEL_12;
    }
  }
  uint64_t v5 = 0;
  while (self->_ssIDHapticMorse[v5] != a3)
  {
    if (++v5 == 10)
    {
      int64_t v6 = 0;
      goto LABEL_13;
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"morse_%d", v5);
  int64_t v6 = LABEL_12:;
LABEL_13:

  return v6;
}

- (void)_handleTestingQueueCallback
{
  uint64_t v3 = [(AXTapticTimeManager *)self testingQueueCallback];

  if (v3)
  {
    id v14 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(NSMutableArray *)self->_enqueuedSounds count];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        float v7 = [(NSMutableArray *)self->_enqueuedSounds objectAtIndex:i];
        float v8 = [(NSMutableArray *)self->_enqueuedSoundDelays objectAtIndex:i];
        [v8 doubleValue];
        double v10 = v9;

        unint64_t v11 = objc_alloc_init(AXTapticSoundTestingContainer);
        unint64_t v12 = -[AXTapticTimeManager _convertSoundToStringName:](self, "_convertSoundToStringName:", [v7 intValue]);
        [(AXTapticSoundTestingContainer *)v11 setSound:v12];

        [(AXTapticSoundTestingContainer *)v11 setDelay:v10];
        [v14 addObject:v11];
      }
    }
    unint64_t v13 = [(AXTapticTimeManager *)self testingQueueCallback];
    ((void (**)(void, id))v13)[2](v13, v14);
  }
}

- (void)_dequeueSound
{
  if ([(NSMutableArray *)self->_enqueuedSounds count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_enqueuedSounds firstObject];
    int64_t v4 = [v3 integerValue];
    self->_currentSsid = v4;
    [(NSMutableArray *)self->_enqueuedSounds removeObjectAtIndex:0];
    uint64_t v5 = [(NSMutableArray *)self->_enqueuedSoundDelays objectAtIndex:0];
    [v5 doubleValue];
    double v7 = v6;

    [(NSMutableArray *)self->_enqueuedSoundDelays removeObjectAtIndex:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__AXTapticTimeManager__dequeueSound__block_invoke;
    aBlock[3] = &unk_1E55872B8;
    aBlock[4] = self;
    aBlock[5] = v4;
    float v8 = _Block_copy(aBlock);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__AXTapticTimeManager__dequeueSound__block_invoke_2;
    block[3] = &unk_1E5588570;
    id v12 = v8;
    int64_t v13 = v4;
    block[4] = self;
    id v10 = v8;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(AXTapticTimeManager *)self _informObserversDidStop];
    [(AXTapticTimeManager *)self _stopPowerAssertion];
  }
}

uint64_t __36__AXTapticTimeManager__dequeueSound__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _informObserversDidOutputSSID:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 _dequeueSound];
}

void __36__AXTapticTimeManager__dequeueSound__block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 264);
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  int64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = [v4 objectForKey:@"VibePattern"];

  double v6 = *(void **)(*(void *)(a1 + 32) + 264);
  double v7 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v6 objectForKey:v7];
  AudioServicesPlaySystemSoundWithVibration();

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v20;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        if (((v11 + i) & 0x80000001) == 1)
        {
          [*(id *)(*((void *)&v19 + 1) + 8 * i) doubleValue];
          double v13 = v13 + v15;
        }
      }
      v11 += v10;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
  else
  {
    double v13 = 0.0;
  }

  dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v13 / 1000.0 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AXTapticTimeManager__dequeueSound__block_invoke_3;
  block[3] = &unk_1E5586638;
  id v18 = *(id *)(a1 + 40);
  dispatch_after(v16, MEMORY[0x1E4F14428], block);
}

uint64_t __36__AXTapticTimeManager__dequeueSound__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isCurrentlyOutputting
{
  return self->_isCurrentlyOutputting;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (id)testingQueueCallback
{
  return self->_testingQueueCallback;
}

- (void)setTestingQueueCallback:(id)a3
{
}

- (NSLocale)localeOverride
{
  return self->_localeOverride;
}

- (NSDate)dateOverride
{
  return self->_dateOverride;
}

- (void)setDateOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOverride, 0);
  objc_storeStrong((id *)&self->_localeOverride, 0);
  objc_storeStrong(&self->_testingQueueCallback, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_cachedSpeed, 0);
  objc_storeStrong((id *)&self->_hapticsDescriptions, 0);
  objc_storeStrong((id *)&self->_soundToPatterns, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_enqueuedSoundDelays, 0);

  objc_storeStrong((id *)&self->_enqueuedSounds, 0);
}

@end
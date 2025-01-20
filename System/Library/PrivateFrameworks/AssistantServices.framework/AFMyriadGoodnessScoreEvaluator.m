@interface AFMyriadGoodnessScoreEvaluator
- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5;
- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5 instrumentation:(id)a6;
- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 queue:(id)a4;
- (BOOL)evaluateForAudioAccessory;
- (double)lastActivationTime;
- (id)_createSettingsConnectionIfRequired;
- (id)_readSidekickBoostsFile:(id)a3;
- (unint64_t)_findSidekickBoost:(id)a3 isSpeaker:(BOOL)a4 model:(id)a5;
- (unsigned)_bumpGoodnessScore:(id)a3 lastActivationTime:(double)a4 mediaPlaybackInterruptedTime:(double)a5 ignoreAdjustedBoost:(BOOL)a6 recentlyWonBySmallAmount:(BOOL)a7;
- (unsigned)_getRecentBump:(double)a3 ignoreAdjustedBoost:(BOOL)a4 recentlyWonBySmallAmount:(BOOL)a5;
- (unsigned)getMyriadAdjustedBoostForGoodnessScoreContext:(id)a3;
- (unsigned)getPlatformBias;
- (void)_fetchDevicePlatformBiasIfRequired;
- (void)_reloadTrialConfiguredBoostValues;
- (void)_settingsConnectionDidDisconnect;
- (void)_updateMediaPlaybackBoost:(unsigned __int8)a3;
- (void)_updatePlatformBias:(unsigned __int8)a3;
- (void)_updateRecentSiriBoostTrialEnabled:(BOOL)a3;
- (void)_updateRecentSiriExponentialBoostDefined:(BOOL)a3 withSecondDegree:(double)a4 andFirstDegree:(double)a5 andIntercept:(double)a6;
- (void)_updateSidekickBoosts:(id)a3;
- (void)dealloc;
- (void)myriadTrialBoostsUpdated:(id)a3;
- (void)preheat;
- (void)setLastActivationTime:(double)a3;
@end

@implementation AFMyriadGoodnessScoreEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointModelName, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_deviceInstanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLastActivationTime:(double)a3
{
  self->_lastActivationTime = a3;
}

- (double)lastActivationTime
{
  return self->_lastActivationTime;
}

- (BOOL)evaluateForAudioAccessory
{
  return self->_evaluateForAudioAccessory;
}

- (void)_settingsConnectionDidDisconnect
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__AFMyriadGoodnessScoreEvaluator__settingsConnectionDidDisconnect__block_invoke;
  v4[3] = &unk_1E592B978;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__AFMyriadGoodnessScoreEvaluator__settingsConnectionDidDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = WeakRetained[7];
      int v5 = 136315394;
      v6 = "-[AFMyriadGoodnessScoreEvaluator _settingsConnectionDidDisconnect]_block_invoke";
      __int16 v7 = 2048;
      uint64_t v8 = v3;
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s #myriad platform bias acquisition state: %ld", (uint8_t *)&v5, 0x16u);
    }
    if (WeakRetained[7] == 1)
    {
      WeakRetained[7] = 0;
      v4 = (void *)WeakRetained[9];
      WeakRetained[9] = 0;
    }
  }
}

- (unsigned)getMyriadAdjustedBoostForGoodnessScoreContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    v19 = "-[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v18, 0xCu);
  }
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  BOOL v7 = [(AFPreferences *)self->_pref myriadShouldIgnoreAdjustedBoost];
  BOOL v8 = [(AFPreferences *)self->_pref ignoreMyriadPlatformBias];
  BOOL v9 = v8;
  if (v7 && v8)
  {
    unsigned int v10 = 0;
  }
  else if (v7)
  {
    unsigned int v10 = [(AFMyriadGoodnessScoreEvaluator *)self getPlatformBias];
  }
  else
  {
    v11 = [v4 reasons];
    double lastActivationTime = self->_lastActivationTime;
    [v4 mediaPlaybackInterruptedTime];
    unsigned int v10 = -[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v11, 0, [v4 recentlyWonBySmallAmount], lastActivationTime, v13);

    if (!v9)
    {
      v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315394;
        v19 = "-[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        _os_log_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_INFO, "%s #myriad payload adjusted score: %ld", (uint8_t *)&v18, 0x16u);
      }
      v10 += [(AFMyriadGoodnessScoreEvaluator *)self getPlatformBias];
    }
  }
  v15 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[AFMyriadGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    __int16 v20 = 2048;
    uint64_t v21 = v10;
    _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s #myriad adjusted score: %ld", (uint8_t *)&v18, 0x16u);
  }
  if (v10 >= 0xFF) {
    unsigned __int8 v16 = -1;
  }
  else {
    unsigned __int8 v16 = v10;
  }
  os_unfair_lock_unlock(p_scoreEvaluationLock);

  return v16;
}

- (void)preheat
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AFMyriadGoodnessScoreEvaluator_preheat__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __41__AFMyriadGoodnessScoreEvaluator_preheat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchDevicePlatformBiasIfRequired];
}

- (void)_reloadTrialConfiguredBoostValues
{
  v16[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[AFFeatureFlags isSCDATrialEnabled])
  {
    uint64_t v9 = 0;
    unsigned int v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__30468;
    double v13 = __Block_byref_object_dispose__30469;
    v14 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_deviceInstanceContext];
    [(id)v10[5] setXPCConnectionManagementQueue:self->_queue];
    objc_initWeak(&location, self);
    uint64_t v3 = (void *)v10[5];
    v16[0] = @"RECENT_SIRI_BOOST_TRIAL_ENABLE";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    v15[0] = @"RECENT_PLAYBACK_BOOST";
    v15[1] = @"HOMEPOD_BOOST";
    v15[2] = @"RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF";
    v15[3] = @"RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF";
    v15[4] = @"RECENT_SIRI_BOOST_INTERCEPT";
    int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__AFMyriadGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke;
    v6[3] = &unk_1E59294B8;
    objc_copyWeak(&v7, &location);
    v6[4] = &v9;
    [v3 getTrialEnables:v4 doubleFactors:v5 withCompletion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v9, 8);
  }
}

void __67__AFMyriadGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      uint64_t v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
        __int16 v43 = 2112;
        id v44 = v9;
        _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s #myriad Error loading Trial factors: %@", buf, 0x16u);
      }
    }
    else
    {
      v12 = [v7 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_TRIAL_ENABLE"];
      uint64_t v13 = [v12 BOOLValue];
      if (v12)
      {
        [WeakRetained _updateRecentSiriBoostTrialEnabled:v13];
      }
      else
      {
        v14 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_DEBUG, "%s #myriad Recent Siri Boost Trial Enable Not Loaded", buf, 0xCu);
        }
      }
      v15 = [v8 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF"];
      unsigned __int8 v16 = [v8 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF"];
      uint64_t v17 = [v8 objectForKeyedSubscript:@"RECENT_SIRI_BOOST_INTERCEPT"];
      int v18 = (void *)v17;
      if (v15) {
        int v19 = v13;
      }
      else {
        int v19 = 0;
      }
      v40 = v16;
      if (v19 == 1 && v16 && v17)
      {
        [v15 doubleValue];
        double v21 = v20;
        [v16 doubleValue];
        double v23 = v22;
        [v18 doubleValue];
        double v25 = v24;
        v26 = WeakRetained;
        uint64_t v27 = 1;
        double v28 = v21;
        double v29 = v23;
      }
      else
      {
        v30 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          __int16 v43 = 2112;
          id v44 = v15;
          __int16 v45 = 2112;
          v46 = v40;
          __int16 v47 = 2112;
          v48 = v18;
          _os_log_debug_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_DEBUG, "%s #myriad Recent Siri exponential factors not loaded: %@ %@ %@", buf, 0x2Au);
        }
        double v28 = 0.0;
        double v29 = 0.0;
        double v25 = 0.0;
        v26 = WeakRetained;
        uint64_t v27 = 0;
      }
      [v26 _updateRecentSiriExponentialBoostDefined:v27 withSecondDegree:v28 andFirstDegree:v29 andIntercept:v25];
      v31 = [v8 objectForKeyedSubscript:@"RECENT_PLAYBACK_BOOST"];
      unsigned int v32 = [v31 unsignedIntValue];
      if (v31 && v32 <= 0xFF)
      {
        [WeakRetained _updateMediaPlaybackBoost:v32];
      }
      else
      {
        v33 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          __int16 v43 = 2112;
          id v44 = v31;
          _os_log_debug_impl(&dword_19CF1D000, v33, OS_LOG_TYPE_DEBUG, "%s #myriad Trial Playback Boost not loaded: %@", buf, 0x16u);
        }
      }
      if (AFIsHorseman_onceToken != -1) {
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
      }
      v34 = v40;
      if (AFIsHorseman_isHorseman)
      {
        v35 = [v8 objectForKeyedSubscript:@"HOMEPOD_BOOST"];
        unsigned int v36 = [v35 unsignedIntValue];
        if (v35 && v36 <= 0xFF)
        {
          [WeakRetained _updatePlatformBias:v36];
        }
        else
        {
          log = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v42 = "-[AFMyriadGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
            __int16 v43 = 2112;
            id v44 = v35;
            _os_log_debug_impl(&dword_19CF1D000, log, OS_LOG_TYPE_DEBUG, "%s #myriad Trial HomePod Boost not loaded: %@", buf, 0x16u);
          }
        }

        v34 = v40;
      }
      uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 8);
      v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = 0;
    }
  }
}

- (unint64_t)_findSidekickBoost:(id)a3 isSpeaker:(BOOL)a4 model:(id)a5
{
  return 0;
}

- (id)_readSidekickBoostsFile:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v4 fileExistsAtPath:v3] & 1) == 0)
    {
      uint64_t v11 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v3;
        _os_log_error_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_ERROR, "%s Unable to find sidekick boosts plist at path %@.", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_23;
    }
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3];
    if (!v5)
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v3;
        _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read sidekick boosts plist file at path %@.", buf, 0x16u);
      }
      id v10 = 0;
      goto LABEL_22;
    }
    id v18 = 0;
    v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v18];
    id v7 = v18;
    if (v7)
    {
      id v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        double v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v3;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Unable to initialize sidekick boosts from plist file at path %@ due to error %@", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v6;
LABEL_21:

LABEL_22:
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v13 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        v15 = v13;
        unsigned __int8 v16 = (objc_class *)objc_opt_class();
        uint64_t v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 136315394;
        double v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        __int16 v21 = 2112;
        id v22 = v17;
        _os_log_error_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_ERROR, "%s Unexpected type of initialized sidekick boosts plist %@.", buf, 0x16u);
      }
    }
    id v10 = 0;
    goto LABEL_21;
  }
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    double v20 = "-[AFMyriadGoodnessScoreEvaluator _readSidekickBoostsFile:]";
    _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s _readSidekickBoostsFile: called with empty filepath", buf, 0xCu);
  }
  id v10 = 0;
LABEL_24:

  return v10;
}

- (void)_fetchDevicePlatformBiasIfRequired
{
  if (self->_platformBiasAcquisitionState != 2)
  {
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (AFIsHorseman_isHorseman) {
      [(AFMyriadGoodnessScoreEvaluator *)self _updatePlatformBias:12];
    }
    self->_platformBiasAcquisitionState = 2;
  }
}

- (id)_createSettingsConnectionIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    id v4 = [[AFSettingsConnection alloc] initWithInstanceContext:self->_deviceInstanceContext];
    int v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    [(AFSettingsConnection *)self->_settingsConnection setXPCConnectionManagementQueue:self->_queue];
    [(AFSettingsConnection *)self->_settingsConnection _setDelegate:self];
    settingsConnection = self->_settingsConnection;
  }
  v6 = settingsConnection;
  return v6;
}

- (void)_updateSidekickBoosts:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    int v5 = "-[AFMyriadGoodnessScoreEvaluator _updateSidekickBoosts:]";
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s #myriad Error updating sidekick boosts: unsupported platform", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_updateRecentSiriExponentialBoostDefined:(BOOL)a3 withSecondDegree:(double)a4 andFirstDegree:(double)a5 andIntercept:(double)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_BOOL isExponentialBoostDefined = a3;
  self->_double recentSiriSecondDegreeCoefficient = a4;
  self->_double recentSiriFirstDegreeCoefficient = a5;
  self->_double recentSiriIntercept = a6;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL isExponentialBoostDefined = self->_isExponentialBoostDefined;
    double recentSiriSecondDegreeCoefficient = self->_recentSiriSecondDegreeCoefficient;
    double recentSiriFirstDegreeCoefficient = self->_recentSiriFirstDegreeCoefficient;
    double recentSiriIntercept = self->_recentSiriIntercept;
    int v17 = 136316162;
    id v18 = "-[AFMyriadGoodnessScoreEvaluator _updateRecentSiriExponentialBoostDefined:withSecondDegree:andFirstDegree:andIntercept:]";
    __int16 v19 = 1024;
    BOOL v20 = isExponentialBoostDefined;
    __int16 v21 = 2048;
    double v22 = recentSiriSecondDegreeCoefficient;
    __int16 v23 = 2048;
    double v24 = recentSiriFirstDegreeCoefficient;
    __int16 v25 = 2048;
    double v26 = recentSiriIntercept;
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s #myriad updated Trial recent Siri exponential boost to %du %.12f %.12f %.12f", (uint8_t *)&v17, 0x30u);
  }
}

- (void)_updateRecentSiriBoostTrialEnabled:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isRecentSiriBoostTrialEnabled = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v7 = @"YES";
    if (!self->_isRecentSiriBoostTrialEnabled) {
      id v7 = @"NO";
    }
    int v8 = 136315394;
    id v9 = "-[AFMyriadGoodnessScoreEvaluator _updateRecentSiriBoostTrialEnabled:]";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #myriad updated _isRecentSiriBoostTrialEnabled to %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateMediaPlaybackBoost:(unsigned __int8)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_int mediaPlaybackBoost = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int mediaPlaybackBoost = self->_mediaPlaybackBoost;
    int v8 = 136315394;
    id v9 = "-[AFMyriadGoodnessScoreEvaluator _updateMediaPlaybackBoost:]";
    __int16 v10 = 1024;
    int v11 = mediaPlaybackBoost;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #myriad updated _mediaPlaybackBoost to %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)_updatePlatformBias:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_myriadPlatformBias = v3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  uint64_t v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[AFMyriadGoodnessScoreEvaluator _updatePlatformBias:]";
    __int16 v9 = 1024;
    int v10 = v3;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s #myriad updated platform bias to %d", (uint8_t *)&v7, 0x12u);
  }
}

- (unsigned)_bumpGoodnessScore:(id)a3 lastActivationTime:(double)a4 mediaPlaybackInterruptedTime:(double)a5 ignoreAdjustedBoost:(BOOL)a6 recentlyWonBySmallAmount:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = v12;
  if (!v12 || ([v12 containsObject:&unk_1EEE97B08] & 1) != 0)
  {
LABEL_3:
    LOBYTE(mediaPlaybackBoost) = 0;
    goto LABEL_4;
  }
  if ([v13 containsObject:&unk_1EEE97B20])
  {
    int v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v29 = 136315138;
      *(void *)&v29[4] = "-[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterrupt"
                           "edTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s #myriad alarm/timer bumping is no longer allowed", v29, 0xCu);
    }
  }
  if ([v13 containsObject:&unk_1EEE97B38])
  {
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (!AFIsHorseman_isHorseman) {
      goto LABEL_3;
    }
    p_int mediaPlaybackBoost = &self->_mediaPlaybackBoost;
    int mediaPlaybackBoost = self->_mediaPlaybackBoost;
    uint64_t v19 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    *(_DWORD *)double v29 = 136315394;
    *(void *)&v29[4] = "-[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterrupted"
                         "Time:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = mediaPlaybackBoost;
    BOOL v20 = "%s #myriad bumping goodness score (reason: media playback active, adjusted score: %d)";
    __int16 v21 = v19;
    uint32_t v22 = 18;
    goto LABEL_14;
  }
  if (![v13 containsObject:&unk_1EEE97B50]) {
    goto LABEL_3;
  }
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (!AFIsHorseman_isHorseman) {
    goto LABEL_3;
  }
  double v24 = [MEMORY[0x1E4F28F80] processInfo];
  [v24 systemUptime];
  double v26 = v25;

  LOBYTE(mediaPlaybackBoost) = 0;
  if (v26 > a5)
  {
    double v27 = v26 - a5;
    if (v27 <= 60.0)
    {
      p_int mediaPlaybackBoost = &self->_mediaPlaybackBoost;
      int mediaPlaybackBoost = self->_mediaPlaybackBoost;
      uint64_t v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_DWORD *)double v29 = 136315650;
      *(void *)&v29[4] = "-[AFMyriadGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterrupt"
                           "edTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      *(_WORD *)&v29[12] = 2048;
      *(double *)&v29[14] = v27;
      *(_WORD *)&v29[22] = 1024;
      LODWORD(v30) = mediaPlaybackBoost;
      BOOL v20 = "%s #myriad bumping goodness score (reason: media playback interrupted, last playback time: %f seconds ago, a"
            "djusted score: %d)";
      __int16 v21 = v28;
      uint32_t v22 = 28;
LABEL_14:
      _os_log_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_INFO, v20, v29, v22);
LABEL_15:
      if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
      {
        myriadInstrumentation = self->_myriadInstrumentation;
        if (myriadInstrumentation) {
          [(AFMyriadInstrumentation *)myriadInstrumentation updateBoost:6 value:*p_mediaPlaybackBoost];
        }
      }
    }
  }
LABEL_4:
  unsigned __int8 v15 = [(AFMyriadGoodnessScoreEvaluator *)self _getRecentBump:v8 ignoreAdjustedBoost:v7 recentlyWonBySmallAmount:a4];

  return v15 + mediaPlaybackBoost;
}

- (unsigned)getPlatformBias
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int myriadPlatformBias = self->_myriadPlatformBias;
    int v7 = 136315394;
    BOOL v8 = "-[AFMyriadGoodnessScoreEvaluator getPlatformBias]";
    __int16 v9 = 1024;
    int v10 = myriadPlatformBias;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s #myriad bumping goodness score (reason: platform bias, adjusted bias: %d)", (uint8_t *)&v7, 0x12u);
  }
  if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
  {
    myriadInstrumentation = self->_myriadInstrumentation;
    if (myriadInstrumentation) {
      [(AFMyriadInstrumentation *)myriadInstrumentation updateBoost:1 value:self->_myriadPlatformBias];
    }
  }
  return self->_myriadPlatformBias;
}

- (unsigned)_getRecentBump:(double)a3 ignoreAdjustedBoost:(BOOL)a4 recentlyWonBySmallAmount:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v29 = 136315138;
      uint64_t v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s #myriad ignoring recent event bump", (uint8_t *)&v29, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v7 = a5;
    if (softLinkMKBGetDeviceLockState(0) == 3
      || (double v10 = 0.0, !softLinkMKBGetDeviceLockState(0)))
    {
      uint64_t v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v29 = 136315138;
        uint64_t v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s #myriad device is unlocked, compute bump", (uint8_t *)&v29, 0xCu);
      }
      double v10 = 4.0;
      if (AFCDAFaceDetection())
      {
        if (AFAccessibilitySupportsAttentionAwareFeatures())
        {
          id v12 = AFSiriLogContextConnection;
          double v10 = 0.0;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
          {
            int v29 = 136315138;
            uint64_t v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
            _os_log_debug_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_DEBUG, "%s #myriad unlock bump is ignored due to awareness being on", (uint8_t *)&v29, 0xCu);
          }
        }
      }
    }
    uint64_t v13 = [MEMORY[0x1E4F28F80] processInfo];
    [v13 systemUptime];
    double v15 = v14;

    double v16 = v15 - a3;
    double v17 = v15 - a3 + -15.0;
    if (v17 < 0.0) {
      double v17 = 0.0;
    }
    double v18 = v17 * -0.0444444455 + 8.0;
    if (v18 >= 0.0) {
      double v19 = v18;
    }
    else {
      double v19 = 0.0;
    }
    if (self->_isRecentSiriBoostTrialEnabled && self->_isExponentialBoostDefined)
    {
      unsigned int v20 = AFMyriadGoodnessComputeExponentialBoost(a3, v15, self->_recentSiriSecondDegreeCoefficient, self->_recentSiriFirstDegreeCoefficient, self->_recentSiriIntercept);
      __int16 v21 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v29 = 136315650;
        uint64_t v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        __int16 v31 = 2048;
        double v32 = v19;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = v20;
        _os_log_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_INFO, "%s #myriad trial exponential boost configured, replacing %f with %du", (uint8_t *)&v29, 0x1Cu);
      }
      double v19 = (double)v20;
    }
    uint32_t v22 = AFSiriLogContextConnection;
    if (v7 && v19 > v10)
    {
      double v23 = 0.0;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v29 = 136316162;
        uint64_t v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        __int16 v31 = 2048;
        double v32 = v16;
        __int16 v33 = 2048;
        *(double *)v34 = v10;
        *(_WORD *)&v34[8] = 2048;
        *(double *)&v34[10] = v10;
        *(_WORD *)&v34[18] = 2048;
        *(double *)&v34[20] = v19;
        _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s #myriad previous close win: canceling recency bump from secsAgo=%f yields %f = %f(act) + %f(siri)", (uint8_t *)&v29, 0x34u);
        uint32_t v22 = AFSiriLogContextConnection;
      }
    }
    else
    {
      double v23 = v19;
    }
    if (v10 >= v23) {
      double v24 = v10;
    }
    else {
      double v24 = v23;
    }
    int v6 = (int)v24;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v29 = 136316162;
      uint64_t v30 = "-[AFMyriadGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      __int16 v31 = 2048;
      double v32 = v16;
      __int16 v33 = 1024;
      *(_DWORD *)v34 = v6;
      *(_WORD *)&v34[4] = 2048;
      *(double *)&v34[6] = v10;
      *(_WORD *)&v34[14] = 2048;
      *(double *)&v34[16] = v23;
      _os_log_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_INFO, "%s #myriad bumptoGoodness secsAgo=%f yields %d = %f(act) + %f(siri)", (uint8_t *)&v29, 0x30u);
    }
    if (+[AFFeatureFlags isMyriadSelfMetricsEnabled])
    {
      myriadInstrumentation = self->_myriadInstrumentation;
      if (myriadInstrumentation)
      {
        if (v6)
        {
          if (v10 <= v23)
          {
            uint64_t v26 = v23;
            uint64_t v27 = 4;
          }
          else
          {
            uint64_t v26 = v10;
            uint64_t v27 = 2;
          }
          [(AFMyriadInstrumentation *)myriadInstrumentation updateBoost:v27 value:v26];
        }
      }
    }
  }
  return v6;
}

- (void)myriadTrialBoostsUpdated:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__AFMyriadGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __59__AFMyriadGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[AFMyriadGoodnessScoreEvaluator myriadTrialBoostsUpdated:]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Trial Boosts Updated Notification", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _reloadTrialConfiguredBoostValues];
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AFMyriadGoodnessScoreEvaluator;
  [(AFMyriadGoodnessScoreEvaluator *)&v4 dealloc];
}

- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5 instrumentation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AFMyriadGoodnessScoreEvaluator;
  double v15 = [(AFMyriadGoodnessScoreEvaluator *)&v26 init];
  double v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceInstanceContext, a3);
    if (v12) {
      double v17 = (AFPreferences *)v12;
    }
    else {
      double v17 = [[AFPreferences alloc] initWithInstanceContext:v16->_deviceInstanceContext];
    }
    pref = v16->_pref;
    v16->_pref = v17;

    v16->_platformBiasAcquisitionState = 0;
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_scoreEvaluationLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v16->_myriadInstrumentation, a6);
    v16->_int mediaPlaybackBoost = 7;
    v16->_isSpeakerEndpoint = 0;
    endpointModelName = v16->_endpointModelName;
    v16->_endpointModelName = 0;

    uint64_t v20 = MEMORY[0x1E4F143A8];
    *(double *)((char *)&v16->_recentSiriSecondDegreeCoefficient + 6) = 0.0;
    *(void *)&v16->_isRecentSiriBoostTrialEnabled = 0;
    HIWORD(v16->_recentSiriIntercept) = 0;
    *(double *)((char *)&v16->_recentSiriFirstDegreeCoefficient + 6) = 0.0;
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __98__AFMyriadGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke;
    block[3] = &unk_1E592C678;
    __int16 v21 = v16;
    double v25 = v21;
    dispatch_async(v13, block);
    uint32_t v22 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v22 addObserver:v21 selector:sel_myriadTrialBoostsUpdated_ name:@"AFMyriadTrialBoostsUpdatedNotification" object:0];
  }
  return v16;
}

uint64_t __98__AFMyriadGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _fetchDevicePlatformBiasIfRequired];
  v2 = *(void **)(a1 + 32);
  return [v2 _reloadTrialConfiguredBoostValues];
}

- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5
{
  return [(AFMyriadGoodnessScoreEvaluator *)self initWithDeviceInstanceContext:a3 preferences:a4 queue:a5 instrumentation:0];
}

- (AFMyriadGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 queue:(id)a4
{
  return [(AFMyriadGoodnessScoreEvaluator *)self initWithDeviceInstanceContext:a3 preferences:0 queue:a4 instrumentation:0];
}

@end
@interface AFInterstitialProvider
- (AFInterstitialProvider)initWithStyle:(int64_t)a3 recordRoute:(id)a4 isVoiceTrigger:(BOOL)a5 isDucking:(BOOL)a6 isTwoShot:(BOOL)a7 speechEndHostTime:(unint64_t)a8 context:(id)a9 delegate:(id)a10;
- (AFInterstitialProvider)initWithStyle:(int64_t)a3 recordRoute:(id)a4 isVoiceTrigger:(BOOL)a5 isDucking:(BOOL)a6 isTwoShot:(BOOL)a7 speechEndHostTime:(unint64_t)a8 context:(id)a9 preferences:(id)a10 delegate:(id)a11;
- (void)_invalidate;
- (void)_performNextActionWithExpectedDelay:(double)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AFInterstitialProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_performNextActionWithExpectedDelay:(double)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_pendingActions count])
  {
    v5 = [(NSMutableArray *)self->_pendingActions objectAtIndex:0];
    [(NSMutableArray *)self->_pendingActions removeObjectAtIndex:0];
    objc_initWeak(&location, self);
    v6 = [AFOneArgumentSafetyBlock alloc];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke;
    v44[3] = &unk_1E5924AA0;
    objc_copyWeak(&v45, &location);
    v37 = [(AFOneArgumentSafetyBlock *)v6 initWithBlock:v44];
    unint64_t v7 = [v5 phase];
    int64_t v8 = [(AFInterstitialConfiguration *)self->_configuration style];
    [v5 duration];
    if (v7)
    {
      v10 = [(AFInterstitialConfiguration *)self->_configuration languageCode];
      int64_t v11 = [(AFInterstitialConfiguration *)self->_configuration gender];
      v36 = v10;
      v12 = 0;
      v13 = 0;
      if ([v10 length] && v11)
      {
        if (v8 == 7)
        {
          v13 = 0;
        }
        else
        {
          v19 = [v5 displayKey];
          v20 = v19;
          if (v19)
          {
            v21 = _AFInterstitialGetLocalizationKey(v19);
            if (v21)
            {
              v22 = +[AFLocalization sharedInstance];
              v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              v13 = [v22 localizedStringForKey:v21 gender:v11 table:@"Interstitials" bundle:v23 languageCode:v10];
            }
            else
            {
              v13 = 0;
            }
          }
          else
          {
            v13 = 0;
          }
        }
        v24 = [v5 speakableKey];
        v25 = v24;
        if (v24)
        {
          v26 = _AFInterstitialGetLocalizationKey(v24);
          if (v26)
          {
            v27 = +[AFLocalization sharedInstance];
            v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v12 = [v27 localizedStringForKey:v26 gender:v11 table:@"Interstitials" bundle:v28 languageCode:v36];
          }
          else
          {
            v12 = 0;
          }
        }
        else
        {
          v12 = 0;
        }
      }
      v29 = (id)AFSiriLogContextConnection;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        if (v7 > 4) {
          v30 = @"(unknown)";
        }
        else {
          v30 = off_1E5928BD8[v7];
        }
        v31 = v30;
        *(_DWORD *)buf = 136316162;
        v48 = "-[AFInterstitialProvider _performNextActionWithExpectedDelay:]";
        __int16 v49 = 2112;
        v50 = v31;
        __int16 v51 = 2112;
        v52 = v13;
        __int16 v53 = 2112;
        v54 = v12;
        __int16 v55 = 2048;
        double v56 = a3;
        _os_log_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_INFO, "%s phase = %@, displayText = %@, speakableText = %@, expectedDelay = %f", buf, 0x34u);
      }
      v32 = self->_queue;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id context = self->_context;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_15;
      v41[3] = &unk_1E592C710;
      v35 = v32;
      v42 = v35;
      v43 = v37;
      [WeakRetained interstitialProvider:self handlePhase:v7 displayText:v13 speakableText:v12 expectedDelay:context context:v41 completion:a3];
    }
    else
    {
      double v14 = v9;
      if (v9 <= 0.0)
      {
LABEL_32:

        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);

        return;
      }
      v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[AFInterstitialProvider _performNextActionWithExpectedDelay:]";
        __int16 v49 = 2048;
        v50 = *(__CFString **)&v14;
        _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s duration = %f", buf, 0x16u);
      }
      [v5 duration];
      dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_16;
      block[3] = &unk_1E592B398;
      v39 = v37;
      double v40 = v14;
      dispatch_after(v17, queue, block);
      v13 = v39;
    }

    goto LABEL_32;
  }
}

void __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 doubleValue];
  double v5 = v4;

  [WeakRetained _performNextActionWithExpectedDelay:v5];
}

void __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_15(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_2;
  block[3] = &unk_1E592C678;
  v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

void __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_16(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
  [v1 invokeWithValue:v2];
}

uint64_t __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithValue:0];
}

- (void)_invalidate
{
  configuration = self->_configuration;
  self->_configuration = 0;

  pendingActions = self->_pendingActions;
  self->_pendingActions = 0;

  id context = self->_context;
  self->_id context = 0;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v7 = "-[AFInterstitialProvider invalidate]";
    __int16 v8 = 2048;
    double v9 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AFInterstitialProvider_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__AFInterstitialProvider_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (AFInterstitialProvider)initWithStyle:(int64_t)a3 recordRoute:(id)a4 isVoiceTrigger:(BOOL)a5 isDucking:(BOOL)a6 isTwoShot:(BOOL)a7 speechEndHostTime:(unint64_t)a8 context:(id)a9 delegate:(id)a10
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v16 = a10;
  id v17 = a9;
  id v18 = a4;
  v19 = +[AFInstanceContext currentContext];
  v20 = [[AFPreferences alloc] initWithInstanceContext:v19];
  v21 = [(AFInterstitialProvider *)self initWithStyle:a3 recordRoute:v18 isVoiceTrigger:v12 isDucking:v11 isTwoShot:v10 speechEndHostTime:a8 context:v17 preferences:v20 delegate:v16];

  return v21;
}

- (AFInterstitialProvider)initWithStyle:(int64_t)a3 recordRoute:(id)a4 isVoiceTrigger:(BOOL)a5 isDucking:(BOOL)a6 isTwoShot:(BOOL)a7 speechEndHostTime:(unint64_t)a8 context:(id)a9 preferences:(id)a10 delegate:(id)a11
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  v45.receiver = self;
  v45.super_class = (Class)AFInterstitialProvider;
  v21 = [(AFInterstitialProvider *)&v45 init];
  if (v21)
  {
    BOOL v32 = v14;
    BOOL v33 = v13;
    v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      if ((unint64_t)a3 > 8) {
        v24 = @"(unknown)";
      }
      else {
        v24 = off_1E592B0C0[a3];
      }
      v25 = v24;
      *(_DWORD *)buf = 136317442;
      v47 = "-[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:cont"
            "ext:preferences:delegate:]";
      __int16 v48 = 2048;
      __int16 v49 = v21;
      __int16 v50 = 2112;
      __int16 v51 = v25;
      __int16 v52 = 2112;
      id v53 = v17;
      __int16 v54 = 1024;
      BOOL v55 = v32;
      __int16 v56 = 1024;
      BOOL v57 = v33;
      __int16 v58 = 1024;
      BOOL v59 = v12;
      __int16 v60 = 2048;
      unint64_t v61 = a8;
      __int16 v62 = 2112;
      id v63 = v18;
      __int16 v64 = 2112;
      id v65 = v19;
      _os_log_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_INFO, "%s %p (style = %@, recordRoute = %@, isVoiceTrigger = %d, isDucking = %d, isTwoShot = %d, speechEndHostTime = %llu, id context = %@, preferences = %@)", buf, 0x5Au);
    }
    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v28 = dispatch_queue_create("com.apple.assistant.interstitial-provider.default", v27);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v28;

    v30 = v21->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __134__AFInterstitialProvider_initWithStyle_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime_context_preferences_delegate___block_invoke;
    block[3] = &unk_1E5924A78;
    id v35 = v19;
    v36 = v21;
    int64_t v40 = a3;
    BOOL v42 = v32;
    BOOL v43 = v33;
    BOOL v44 = v12;
    id v37 = v17;
    unint64_t v41 = a8;
    id v38 = v18;
    id v39 = v20;
    dispatch_async(v30, block);
  }
  return v21;
}

void __134__AFInterstitialProvider_initWithStyle_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime_context_preferences_delegate___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    double v4 = [AFPreferences alloc];
    double v5 = +[AFInstanceContext currentContext];
    id v3 = [(AFPreferences *)v4 initWithInstanceContext:v5];
  }
  v6 = [(AFPreferences *)v3 languageCode];
  if ([v6 length])
  {
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v7 = [(AFPreferences *)v3 bestSupportedLanguageCodeForLanguageCode:0];

    __int16 v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechE"
                           "ndHostTime:context:preferences:delegate:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s No language preference, using best supported language: %@", buf, 0x16u);
    }
  }
  double v9 = +[AFPreferences sharedPreferences];
  BOOL v10 = [v9 outputVoice];

  uint64_t v11 = [v10 gender];
  if (!v11) {
    uint64_t v11 = +[AFVoiceInfo defaultGenderForOutputVoiceLanguageCode:v7];
  }
  BOOL v12 = [AFInterstitialConfiguration alloc];
  LOBYTE(v62) = *(unsigned char *)(a1 + 90);
  uint64_t v13 = [(AFInterstitialConfiguration *)v12 initWithStyle:*(void *)(a1 + 72) languageCode:v7 gender:v11 recordRoute:*(void *)(a1 + 48) isVoiceTrigger:*(unsigned __int8 *)(a1 + 88) isDucking:*(unsigned __int8 *)(a1 + 89) isTwoShot:v62 speechEndHostTime:*(void *)(a1 + 80)];
  uint64_t v14 = *(void *)(a1 + 40);
  v15 = *(void **)(v14 + 16);
  *(void *)(v14 + 16) = v13;

  id v16 = *(id *)(*(void *)(a1 + 40) + 16);
  id v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_INFO, "%s configuration = %@", buf, 0x16u);
  }
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  uint64_t v18 = [v16 style];
  double InitialInterstitialDelay = _AFPreferencesGetInitialInterstitialDelay(v18);
  if (InitialInterstitialDelay <= 0.0) {
    double v20 = 3.5;
  }
  else {
    double v20 = InitialInterstitialDelay;
  }
  v21 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v20;
    _os_log_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_INFO, "%s initialInterstitialDelay = %f", buf, 0x16u);
    v21 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v20;
    _os_log_impl(&dword_19CF1D000, v21, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f", buf, 0x16u);
  }
  uint64_t v22 = [v16 speechEndHostTime];
  if (v22)
  {
    unint64_t v23 = mach_absolute_time() - v22;
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    double v24 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v23 / 1000000000.0;
  }
  else
  {
    double v24 = 0.0;
  }
  v68 = v7;
  v69 = v3;
  id v66 = v16;
  v67 = v10;
  switch(v18)
  {
    case 1:
    case 2:
    case 5:
    case 6:
      goto LABEL_25;
    case 3:
      int v54 = [v16 isVoiceTrigger];
      char v55 = [v16 isDucking];
      char v56 = [v16 isTwoShot];
      if (v54 && (v55 & 1) == 0 && (v56 & 1) == 0)
      {
        double InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking = _AFPreferencesGetInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking();
        if (InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking <= 0.0) {
          double v20 = 1.75;
        }
        else {
          double v20 = InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking;
        }
        __int16 v58 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v20;
          _os_log_impl(&dword_19CF1D000, v58, OS_LOG_TYPE_INFO, "%s initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking = %f", buf, 0x16u);
          __int16 v58 = AFSiriLogContextConnection;
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v20;
          _os_log_impl(&dword_19CF1D000, v58, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment based on speech request info for Hearst)", buf, 0x16u);
        }
      }
LABEL_25:
      if (v24 > 0.0)
      {
        double v20 = v20 - v24 >= 0.0 ? v20 - v24 : 0.0;
        v25 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v20;
          _os_log_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment based on end-of-speech info)", buf, 0x16u);
        }
      }
      uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"INITIAL_%u", arc4random_uniform(3u));
      v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"FOLLOW_UP_%u", arc4random_uniform(3u));
      dispatch_queue_t v28 = 0;
      do
      {
        v29 = v28;
        dispatch_queue_t v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"FOLLOW_UP_%u", arc4random_uniform(3u));
      }
      while (([v28 isEqualToString:v27] & 1) != 0);
      if (v20 + -0.4 >= 0.0) {
        double v30 = v20 + -0.4;
      }
      else {
        double v30 = 0.0;
      }
      v31 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v30;
        _os_log_impl(&dword_19CF1D000, v31, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment for frontend UI)", buf, 0x16u);
      }
      id v65 = [[_AFInterstitialAction alloc] initWithDuration:v30];
      *(void *)buf = v65;
      __int16 v64 = [[_AFInterstitialAction alloc] initWithPhase:1 displayKey:v26 speakableKey:v26];
      *(void *)&buf[8] = v64;
      id v63 = [[_AFInterstitialAction alloc] initWithDuration:5.6];
      *(void *)&buf[16] = v63;
      BOOL v32 = [[_AFInterstitialAction alloc] initWithPhase:2 displayKey:v27 speakableKey:v27];
      v71 = v32;
      uint64_t v33 = 0x401E666666666666;
      v34 = [[_AFInterstitialAction alloc] initWithDuration:7.6];
      v72 = v34;
      id v35 = [_AFInterstitialAction alloc];
      v36 = v28;
      id v37 = v28;
      goto LABEL_39;
    case 4:
    case 7:
      uint64_t v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"INITIAL_%u", arc4random_uniform(3u));
      v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"FOLLOW_UP_%u", arc4random_uniform(3u));
      dispatch_queue_t v28 = 0;
      do
      {
        BOOL v43 = v28;
        dispatch_queue_t v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"FOLLOW_UP_%u", arc4random_uniform(3u));
      }
      while (([v28 isEqualToString:v27] & 1) != 0);
      id v65 = [[_AFInterstitialAction alloc] initWithDuration:v20];
      *(void *)buf = v65;
      __int16 v64 = [[_AFInterstitialAction alloc] initWithPhase:1 displayKey:0 speakableKey:v42];
      *(void *)&buf[8] = v64;
      id v63 = [[_AFInterstitialAction alloc] initWithDuration:6.0];
      *(void *)&buf[16] = v63;
      BOOL v32 = [[_AFInterstitialAction alloc] initWithPhase:2 displayKey:0 speakableKey:v27];
      v71 = v32;
      v34 = [[_AFInterstitialAction alloc] initWithDuration:8.0];
      v72 = v34;
      id v38 = (void *)v42;
      id v39 = [[_AFInterstitialAction alloc] initWithPhase:3 displayKey:0 speakableKey:v28];
      v73 = v39;
      int64_t v40 = [_AFInterstitialAction alloc];
      double v41 = 8.0;
      goto LABEL_43;
    case 8:
      uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"INITIAL_%u", arc4random_uniform(3u));
      v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"FOLLOW_UP_%u", arc4random_uniform(3u));
      dispatch_queue_t v28 = 0;
      do
      {
        BOOL v59 = v28;
        dispatch_queue_t v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"FOLLOW_UP_%u", arc4random_uniform(3u));
      }
      while (([v28 isEqualToString:v27] & 1) != 0);
      double v60 = 0.0;
      if (+[AFFeatureFlags isNanoSiriUIRefreshEnabled])
      {
        unint64_t v61 = AFSiriLogContextConnection;
        if (v24 > 0.0)
        {
          double v20 = v20 - v24 >= 0.0 ? v20 - v24 : 0.0;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v20;
            _os_log_impl(&dword_19CF1D000, v61, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment based on end-of-speech info)", buf, 0x16u);
            unint64_t v61 = AFSiriLogContextConnection;
          }
        }
        if (v20 + -0.6 >= 0.0) {
          double v60 = v20 + -0.6;
        }
        else {
          double v60 = 0.0;
        }
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v60;
          _os_log_impl(&dword_19CF1D000, v61, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment for frontend UI)", buf, 0x16u);
        }
      }
      id v65 = [[_AFInterstitialAction alloc] initWithDuration:v60];
      *(void *)buf = v65;
      __int16 v64 = [[_AFInterstitialAction alloc] initWithPhase:1 displayKey:v26 speakableKey:0];
      *(void *)&buf[8] = v64;
      id v63 = [[_AFInterstitialAction alloc] initWithDuration:5.4];
      *(void *)&buf[16] = v63;
      BOOL v32 = [[_AFInterstitialAction alloc] initWithPhase:2 displayKey:v27 speakableKey:0];
      v71 = v32;
      uint64_t v33 = 0x401D99999999999ALL;
      v34 = [[_AFInterstitialAction alloc] initWithDuration:7.4];
      v72 = v34;
      id v35 = [_AFInterstitialAction alloc];
      v36 = v28;
      id v37 = 0;
LABEL_39:
      id v38 = (void *)v26;
      id v39 = [(_AFInterstitialAction *)v35 initWithPhase:3 displayKey:v36 speakableKey:v37];
      v73 = v39;
      int64_t v40 = [_AFInterstitialAction alloc];
      double v41 = *(double *)&v33;
LABEL_43:
      BOOL v44 = [(_AFInterstitialAction *)v40 initWithDuration:v41];
      v74 = v44;
      objc_super v45 = [[_AFInterstitialAction alloc] initWithPhase:4 displayKey:0 speakableKey:0];
      v75 = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:8];

      unint64_t v7 = v68;
      id v3 = v69;
      id v16 = v66;
      BOOL v10 = v67;
      break;
    default:
      v46 = 0;
      break;
  }

  uint64_t v47 = [v46 mutableCopy];
  uint64_t v48 = *(void *)(a1 + 40);
  __int16 v49 = *(void **)(v48 + 24);
  *(void *)(v48 + 24) = v47;

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 32), *(id *)(a1 + 56));
  objc_storeWeak((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 64));
  __int16 v50 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v51 = *(void *)(a1 + 40);
    uint64_t v52 = *(void *)(v51 + 16);
    id v53 = *(_AFInterstitialAction **)(v51 + 32);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEnd"
                         "HostTime:context:preferences:delegate:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v52;
    *(_WORD *)&buf[22] = 2112;
    v71 = v53;
    _os_log_impl(&dword_19CF1D000, v50, OS_LOG_TYPE_INFO, "%s configuration = %@, id context = %@", buf, 0x20u);
  }
  [*(id *)(a1 + 40) _performNextActionWithExpectedDelay:0.0];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFInterstitialProvider dealloc]";
    __int16 v7 = 2048;
    __int16 v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFInterstitialProvider;
  [(AFInterstitialProvider *)&v4 dealloc];
}

@end
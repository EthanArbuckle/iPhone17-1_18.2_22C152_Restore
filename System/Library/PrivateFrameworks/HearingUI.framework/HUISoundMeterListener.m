@interface HUISoundMeterListener
- (BOOL)areLocalLevelsAvailable;
- (BOOL)areRemoteLevelsAvailable;
- (BOOL)isListeningForLocalLevels;
- (BOOL)isListeningForRemoteLevels;
- (BOOL)shouldShow;
- (HUISoundMeterListener)initWithDelgate:(id)a3 source:(unint64_t)a4;
- (HUISoundMeterListenerDelegate)delegate;
- (unint64_t)source;
- (void)_startLocalLevels;
- (void)_startRemoteLevels;
- (void)_stopLocalLevels;
- (void)_stopRemoteLevels;
- (void)_updateSoundMeterAvailableLocally:(BOOL)a3 remotely:(BOOL)a4;
- (void)setAreLocalLevelsAvailable:(BOOL)a3;
- (void)setAreRemoteLevelsAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsListeningForLocalLevels:(BOOL)a3;
- (void)setIsListeningForRemoteLevels:(BOOL)a3;
- (void)setSource:(unint64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation HUISoundMeterListener

- (HUISoundMeterListener)initWithDelgate:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUISoundMeterListener;
  v7 = [(HUISoundMeterListener *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(HUISoundMeterListener *)v7 setSource:a4];
    [(HUISoundMeterListener *)v8 setDelegate:v6];
  }

  return v8;
}

- (void)start
{
  [(HUISoundMeterListener *)self _startLocalLevels];
  [(HUISoundMeterListener *)self _startRemoteLevels];
}

- (void)stop
{
  [(HUISoundMeterListener *)self _stopLocalLevels];
  [(HUISoundMeterListener *)self _stopRemoteLevels];
  [(HUISoundMeterListener *)self _updateSoundMeterAvailableLocally:0 remotely:0];
}

- (BOOL)shouldShow
{
  if ([(HUISoundMeterListener *)self areLocalLevelsAvailable]) {
    return 1;
  }
  return [(HUISoundMeterListener *)self areRemoteLevelsAvailable];
}

- (void)_updateSoundMeterAvailableLocally:(BOOL)a3 remotely:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v7 = [(HUISoundMeterListener *)self shouldShow];
  int v8 = [(HUISoundMeterListener *)self areLocalLevelsAvailable];
  BOOL v9 = [(HUISoundMeterListener *)self areRemoteLevelsAvailable];
  uint64_t v10 = v5 | v4;
  [(HUISoundMeterListener *)self setAreLocalLevelsAvailable:v5];
  [(HUISoundMeterListener *)self setAreRemoteLevelsAvailable:v4];
  int v11 = [(HUISoundMeterListener *)self areLocalLevelsAvailable];
  int v12 = v9 ^ [(HUISoundMeterListener *)self areRemoteLevelsAvailable];
  if (v8 != v11)
  {
    v13 = [(HUISoundMeterListener *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(HUISoundMeterListener *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        v17 = [(HUISoundMeterListener *)self delegate];
        [v17 localSourceAvailableDidUpdate:v5];
      }
    }
  }
  int v18 = v10 ^ v7;
  if (v12)
  {
    v19 = [(HUISoundMeterListener *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v21 = [(HUISoundMeterListener *)self delegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = [(HUISoundMeterListener *)self delegate];
        [v23 remoteSourceAvailableDidUpdate:v4];
      }
    }
  }
  if (v18)
  {
    v24 = HCLogSoundMeter();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = "Hiding";
      if (v10) {
        v25 = "Showing";
      }
      int v29 = 136315138;
      v30 = v25;
      _os_log_impl(&dword_226B65000, v24, OS_LOG_TYPE_INFO, "%s sound meter", (uint8_t *)&v29, 0xCu);
    }

    v26 = [(HUISoundMeterListener *)self delegate];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(HUISoundMeterListener *)self delegate];
      [v28 liveLevelMeteringDisplayStateChanged:v10];
    }
  }
}

- (void)_startLocalLevels
{
  if ([(HUISoundMeterListener *)self source] != 2
    && ![(HUISoundMeterListener *)self isListeningForLocalLevels])
  {
    v3 = HCLogSoundMeter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_226B65000, v3, OS_LOG_TYPE_INFO, "Start listening for local headphone levels", (uint8_t *)buf, 2u);
    }

    [(HUISoundMeterListener *)self setIsListeningForLocalLevels:1];
    objc_initWeak(buf, self);
    BOOL v4 = [MEMORY[0x263F47528] sharedInstance];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __42__HUISoundMeterListener__startLocalLevels__block_invoke;
    v5[3] = &unk_2647CD9D8;
    objc_copyWeak(&v6, buf);
    [v4 registerListener:self forLiveHeadphoneLevelHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __42__HUISoundMeterListener__startLocalLevels__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v5 = [v3 objectForKey:*MEMORY[0x263F474F8]];
    int v6 = [v5 BOOLValue];

    BOOL v7 = [v3 objectForKey:*MEMORY[0x263F47510]];
    [v7 unsignedIntegerValue];

    int v8 = [v3 objectForKey:*MEMORY[0x263F47508]];
    [v8 floatValue];

    BOOL v9 = [v3 objectForKey:*MEMORY[0x263F47500]];
    [v9 floatValue];

    AXPerformBlockOnMainThread();
    int v10 = [WeakRetained isListeningForRemoteLevels];
    if (v6)
    {
      if (v10)
      {
        int v11 = HCLogSoundMeter();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226B65000, v11, OS_LOG_TYPE_INFO, "local headphone levels enabled", buf, 2u);
        }

        [WeakRetained _stopRemoteLevels];
      }
    }
    else if ((v10 & 1) == 0)
    {
      int v12 = HCLogSoundMeter();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226B65000, v12, OS_LOG_TYPE_INFO, "local headphone levels not enabled", buf, 2u);
      }

      [WeakRetained _startRemoteLevels];
    }
    if (v6 != [WeakRetained areLocalLevelsAvailable])
    {
      v13 = HCLogSoundMeter();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        char v14 = "unavailable";
        if (v6) {
          char v14 = "available";
        }
        *(_DWORD *)buf = 136315138;
        char v16 = v14;
        _os_log_impl(&dword_226B65000, v13, OS_LOG_TYPE_INFO, "Local headphone levels %s", buf, 0xCu);
      }

      AXPerformBlockOnMainThread();
    }
  }
}

void __42__HUISoundMeterListener__startLocalLevels__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 updateViewsWith:*(void *)(a1 + 40) fastLeq:*(float *)(a1 + 48) thresholdLevel:*(float *)(a1 + 52)];
  }
}

uint64_t __42__HUISoundMeterListener__startLocalLevels__block_invoke_13(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [v1 areRemoteLevelsAvailable];
  return [v1 _updateSoundMeterAvailableLocally:v2 remotely:v3];
}

- (void)_stopLocalLevels
{
  uint64_t v3 = HCLogSoundMeter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_226B65000, v3, OS_LOG_TYPE_INFO, "Stop listening for local headphone levels", v5, 2u);
  }

  [(HUISoundMeterListener *)self setIsListeningForLocalLevels:0];
  id v4 = [MEMORY[0x263F47528] sharedInstance];
  [v4 unregisterLiveHeadphoneLevelHandler:self];
}

- (void)_startRemoteLevels
{
  if ([(HUISoundMeterListener *)self source] != 1
    && ![(HUISoundMeterListener *)self isListeningForRemoteLevels])
  {
    uint64_t v3 = HCLogSoundMeter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_226B65000, v3, OS_LOG_TYPE_INFO, "Start listening for remote headphone levels", (uint8_t *)buf, 2u);
    }

    [(HUISoundMeterListener *)self setIsListeningForRemoteLevels:1];
    objc_initWeak(buf, self);
    id v4 = [MEMORY[0x263F47528] sharedInstance];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__HUISoundMeterListener__startRemoteLevels__block_invoke;
    v5[3] = &unk_2647CD9D8;
    objc_copyWeak(&v6, buf);
    [v4 registerListener:self forRemoteLiveHeadphoneLevelHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __43__HUISoundMeterListener__startRemoteLevels__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v5 = [v3 objectForKey:*MEMORY[0x263F474F8]];
    int v6 = [v5 BOOLValue];

    BOOL v7 = [v3 objectForKey:*MEMORY[0x263F47510]];
    [v7 unsignedIntegerValue];

    int v8 = [v3 objectForKey:*MEMORY[0x263F47508]];
    [v8 floatValue];

    BOOL v9 = [v3 objectForKey:*MEMORY[0x263F47500]];
    [v9 floatValue];

    AXPerformBlockOnMainThread();
    if (v6 != [WeakRetained areRemoteLevelsAvailable])
    {
      int v10 = HCLogSoundMeter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = "unavailable";
        if (v6) {
          int v11 = "available";
        }
        *(_DWORD *)buf = 136315138;
        v13 = v11;
        _os_log_impl(&dword_226B65000, v10, OS_LOG_TYPE_INFO, "Remote headphone levels %s", buf, 0xCu);
      }

      AXPerformBlockOnMainThread();
    }
  }
}

void __43__HUISoundMeterListener__startRemoteLevels__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 updateViewsWith:*(void *)(a1 + 40) fastLeq:*(float *)(a1 + 48) thresholdLevel:*(float *)(a1 + 52)];
  }
}

uint64_t __43__HUISoundMeterListener__startRemoteLevels__block_invoke_15(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 areLocalLevelsAvailable];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  return [v2 _updateSoundMeterAvailableLocally:v3 remotely:v4];
}

- (void)_stopRemoteLevels
{
  uint64_t v3 = HCLogSoundMeter();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_226B65000, v3, OS_LOG_TYPE_INFO, "Stop listening for remote headphone levels", v5, 2u);
  }

  [(HUISoundMeterListener *)self setIsListeningForRemoteLevels:0];
  uint64_t v4 = [MEMORY[0x263F47528] sharedInstance];
  [v4 unregisterRemoteLiveHeadphoneLevelHandler:self];
}

- (HUISoundMeterListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HUISoundMeterListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isListeningForLocalLevels
{
  return self->_isListeningForLocalLevels;
}

- (void)setIsListeningForLocalLevels:(BOOL)a3
{
  self->_isListeningForLocalLevels = a3;
}

- (BOOL)isListeningForRemoteLevels
{
  return self->_isListeningForRemoteLevels;
}

- (void)setIsListeningForRemoteLevels:(BOOL)a3
{
  self->_isListeningForRemoteLevels = a3;
}

- (BOOL)areLocalLevelsAvailable
{
  return self->_areLocalLevelsAvailable;
}

- (void)setAreLocalLevelsAvailable:(BOOL)a3
{
  self->_areLocalLevelsAvailable = a3;
}

- (BOOL)areRemoteLevelsAvailable
{
  return self->_areRemoteLevelsAvailable;
}

- (void)setAreRemoteLevelsAvailable:(BOOL)a3
{
  self->_areRemoteLevelsAvailable = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
}

@end
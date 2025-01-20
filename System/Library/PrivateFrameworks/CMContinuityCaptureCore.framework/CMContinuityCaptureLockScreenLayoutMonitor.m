@interface CMContinuityCaptureLockScreenLayoutMonitor
- (BOOL)lockScreenInLayout;
- (CMContinuityCaptureLockScreenLayoutMonitor)init;
- (CMContinuityCaptureLockScreenLayoutMonitorDelegate)delegate;
- (void)_handleLayout:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CMContinuityCaptureLockScreenLayoutMonitor

- (CMContinuityCaptureLockScreenLayoutMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureLockScreenLayoutMonitor;
  v2 = [(CMContinuityCaptureLockScreenLayoutMonitor *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lockScreenInLayout = 0;
    v2->_shieldFrontMostInLayout = 1;
    v4 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    [v4 setNeedsUserInteractivePriority:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke;
    v9[3] = &unk_264C99E88;
    v5 = v3;
    v10 = v5;
    [v4 setTransitionHandler:v9];
    uint64_t v6 = [MEMORY[0x263F3F728] monitorWithConfiguration:v4];
    layoutMonitor = v5->_layoutMonitor;
    v5->_layoutMonitor = (FBSDisplayLayoutMonitor *)v6;
  }
  return v3;
}

void __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke_2;
  v6[3] = &unk_264C99080;
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __50__CMContinuityCaptureLockScreenLayoutMonitor_init__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLayout:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureLockScreenLayoutMonitor;
  [(CMContinuityCaptureLockScreenLayoutMonitor *)&v4 dealloc];
}

- (BOOL)lockScreenInLayout
{
  return self->_lockScreenInLayout;
}

- (void)_handleLayout:(id)a3
{
  v53[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CMContinuityCaptureLog(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v49 = self;
    __int16 v50 = 2112;
    *(void *)v51 = v4;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ New layout: %@", buf, 0x16u);
  }

  int lockScreenInLayout = self->_lockScreenInLayout;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (!v4)
  {
    id v7 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_impl(&dword_235FC2000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring nil layout", buf, 0xCu);
    }
    goto LABEL_48;
  }
  v53[0] = *MEMORY[0x263F3F570];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];
  if (![v4 displayBacklightLevel])
  {
    self->_int lockScreenInLayout = 1;
    v9 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring layout with minimum (0) backlight level.", buf, 0xCu);
    }
    goto LABEL_47;
  }
  id v8 = [v4 elements];
  v9 = objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_6);

  if (v9) {
    int v43 = [v9 sb_isTransitioning];
  }
  else {
    int v43 = 0;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v10 = [v4 elements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (!v11)
  {

    int v30 = 0;
    self->_int lockScreenInLayout = 0;
    uint64_t v42 = -1;
    uint64_t v39 = -1;
    goto LABEL_38;
  }
  uint64_t v12 = v11;
  int v36 = lockScreenInLayout;
  v37 = v9;
  id v38 = v4;
  v41 = self;
  char v13 = 0;
  uint64_t v14 = *(void *)v45;
  uint64_t v15 = *MEMORY[0x263F79510];
  uint64_t v39 = -1;
  uint64_t v40 = *MEMORY[0x263F3F560];
  uint64_t v42 = -1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v45 != v14) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      v18 = [v17 identifier];
      int v19 = [v7 containsObject:v18];

      if (v19)
      {
        v20 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v17 identifier];
          *(_DWORD *)buf = 138543618;
          v49 = v41;
          __int16 v50 = 2112;
          *(void *)v51 = v21;
          v22 = v20;
          v23 = "%{public}@ Ignoring %@ in layout";
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      v24 = [v17 identifier];
      int v25 = [v24 isEqualToString:v15] & v43;

      if (v25 == 1)
      {
        v20 = CMContinuityCaptureLog(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v17 identifier];
          *(_DWORD *)buf = 138543618;
          v49 = v41;
          __int16 v50 = 2112;
          *(void *)v51 = v21;
          v22 = v20;
          v23 = "%{public}@ Ignoring %@ in layout during shield transition period";
LABEL_23:
          _os_log_impl(&dword_235FC2000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
        }
LABEL_24:

        continue;
      }
      if ([v17 level] > v42) {
        uint64_t v42 = [v17 level];
      }
      v26 = [v17 bundleIdentifier];
      int v27 = [v26 isEqualToString:@"com.apple.ContinuityCaptureShieldUI"];

      if (v27 && [v17 level] > v39) {
        uint64_t v39 = [v17 level];
      }
      v28 = [v17 identifier];
      char v29 = [v28 isEqualToString:v40];

      v13 |= v29;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v52 count:16];
  }
  while (v12);

  int v30 = v13 & 1;
  self = v41;
  v41->_int lockScreenInLayout = v30;
  int lockScreenInLayout = v36;
  if (v39 == -1) {
    uint64_t v39 = -1;
  }
  else {
    v41->_firstShieldLayoutReceived = 1;
  }
  v9 = v37;
  id v4 = v38;
LABEL_38:
  if (self->_firstShieldLayoutReceived)
  {
    BOOL v31 = v39 >= v42;
    if (self->_shieldFrontMostInLayout != v31 || v30 != lockScreenInLayout)
    {
      self->_BOOL shieldFrontMostInLayout = v31;
      v32 = CMContinuityCaptureLog(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        BOOL shieldFrontMostInLayout = self->_shieldFrontMostInLayout;
        BOOL v34 = self->_lockScreenInLayout;
        *(_DWORD *)buf = 138543874;
        v49 = self;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = shieldFrontMostInLayout;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v34;
        _os_log_impl(&dword_235FC2000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Update layout change, shieldFrontMostInLayout:%d lockScreenInLayout:%d", buf, 0x18u);
      }

      v35 = [(CMContinuityCaptureLockScreenLayoutMonitor *)self delegate];
      [v35 lockScreenLayoutMonitor:self didUpdateLayoutWithShieldFrontMost:self->_shieldFrontMostInLayout lockscreenInLayout:self->_lockScreenInLayout];
      goto LABEL_46;
    }
  }
  else
  {
    v35 = CMContinuityCaptureLog(0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v49 = self;
      _os_log_impl(&dword_235FC2000, v35, OS_LOG_TYPE_INFO, "%{public}@ Ignoring layout. Haven't received first layout with ShieldUI in it.", buf, 0xCu);
    }
LABEL_46:
  }
LABEL_47:

LABEL_48:
}

uint64_t __60__CMContinuityCaptureLockScreenLayoutMonitor__handleLayout___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"com.apple.ContinuityCaptureShieldUI"];

  return v3;
}

- (CMContinuityCaptureLockScreenLayoutMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CMContinuityCaptureLockScreenLayoutMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
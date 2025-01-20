@interface MPVolumeController
+ (id)descriptionForWarningState:(int64_t)a3;
- (BOOL)isMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)muted;
- (BOOL)volumeWarningEnabled;
- (MPVolumeController)init;
- (MPVolumeController)initWithDataSource:(id)a3;
- (MPVolumeControllerDataSource)dataSource;
- (MPVolumeControllerDelegate)delegate;
- (NSString)volumeAudioCategory;
- (NSString)volumeControlLabel;
- (float)EUVolumeLimit;
- (float)volumeValue;
- (int64_t)volumeWarningState;
- (unsigned)volumeCapabilities;
- (void)adjustVolumeValue:(float)a3;
- (void)beginDecreasingRelativeVolume;
- (void)beginIncreasingRelativeVolume;
- (void)decreaseVolume;
- (void)endDecreasingRelativeVolume;
- (void)endIncreasingRelativeVolume;
- (void)getVolumeValueWithCompletion:(id)a3;
- (void)increaseVolume;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setVolume:(float)a3 withNotificationDelay:(float)a4;
- (void)setVolumeAudioCategory:(id)a3;
- (void)setVolumeValue:(float)a3;
- (void)updateVolumeValue;
- (void)volumeControllerDataSource:(id)a3 didChangeMuted:(BOOL)a4;
- (void)volumeControllerDataSource:(id)a3 didChangeVolume:(float)a4;
- (void)volumeControllerDataSource:(id)a3 didChangeVolume:(float)a4 silenceVolumeHUD:(BOOL)a5;
- (void)volumeControllerDataSource:(id)a3 didChangeVolumeAudioCategory:(id)a4;
- (void)volumeControllerDataSource:(id)a3 didChangeVolumeCapabilities:(unsigned int)a4;
- (void)volumeControllerDataSource:(id)a3 didChangeVolumeControlAvailability:(BOOL)a4;
- (void)volumeControllerDataSource:(id)a3 didChangeVolumeLabel:(id)a4;
@end

@implementation MPVolumeController

- (unsigned)volumeCapabilities
{
  return [(MPVolumeControllerDataSource *)self->_dataSource volumeControlCapabilities];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (MPVolumeControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (MPVolumeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPVolumeControllerDelegate *)WeakRetained;
}

- (BOOL)muted
{
  return [(MPVolumeControllerDataSource *)self->_dataSource isMuted];
}

- (float)EUVolumeLimit
{
  [(MPVolumeControllerDataSource *)self->_dataSource EUVolumeLimit];
  return result;
}

- (int64_t)volumeWarningState
{
  return [(MPVolumeControllerDataSource *)self->_dataSource volumeWarningState];
}

- (BOOL)volumeWarningEnabled
{
  return [(MPVolumeControllerDataSource *)self->_dataSource volumeWarningEnabled];
}

- (void)setVolumeAudioCategory:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MPVolumeControllerDataSource *)self->_dataSource setVolumeAudioCategory:v4];
  }
}

- (NSString)volumeAudioCategory
{
  return (NSString *)[(MPVolumeControllerDataSource *)self->_dataSource volumeAudioCategory];
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeAudioCategory:(id)a4
{
  id v4 = +[MPVolumeHUDController sharedInstance];
  [v4 setNeedsUpdate];
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeLabel:(id)a4
{
  id v6 = a4;
  v5 = [(MPVolumeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 volumeController:self volumeControlLabelDidChange:v6];
  }
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeCapabilities:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription();
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%@ volumeControlCapabilitiesDidChange capabilities:%{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = [(MPVolumeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 volumeController:self volumeControlCapabilitiesDidChange:v4];
  }
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolumeControlAvailability:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = os_log_create("com.apple.amp.mediaplayer", "Volume");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%@ volumeControlAvailableDidChange available: %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }

  uint64_t v7 = [(MPVolumeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 volumeController:self volumeControlAvailableDidChange:v4];
  }
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolume:(float)a4 silenceVolumeHUD:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(MPVolumeController *)self delegate];
  uint64_t v9 = (void *)v8;
  if (!self->_volumeChangeCoalescingCount)
  {
    v13 = (void *)v8;
    if (objc_opt_respondsToSelector())
    {
      *(float *)&double v10 = a4;
      [v13 volumeController:self volumeValueDidChange:v5 silenceVolumeHUD:v10];
    }
    else
    {
      char v11 = objc_opt_respondsToSelector();
      uint64_t v9 = v13;
      if ((v11 & 1) == 0) {
        goto LABEL_7;
      }
      *(float *)&double v12 = a4;
      [v13 volumeController:self volumeValueDidChange:v12];
    }
    uint64_t v9 = v13;
  }
LABEL_7:
}

- (void)volumeControllerDataSource:(id)a3 didChangeVolume:(float)a4
{
}

- (void)volumeControllerDataSource:(id)a3 didChangeMuted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MPVolumeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 volumeController:self mutedStateDidChange:v4];
  }
}

- (void)setDataSource:(id)a3
{
  id v6 = (MPVolumeControllerDataSource *)a3;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MPVolumeController.m", 190, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];

    id v6 = 0;
  }
  if (self->_dataSource != v6)
  {
    uint64_t v8 = v6;
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(MPVolumeControllerDataSource *)self->_dataSource setDelegate:self];
    [(MPVolumeControllerDataSource *)self->_dataSource initializeVolume];
    id v6 = v8;
  }
}

- (void)decreaseVolume
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    [(MPVolumeControllerDataSource *)self->_dataSource beginDecreasingRelativeVolume];
    dataSource = self->_dataSource;
    [(MPVolumeControllerDataSource *)dataSource endDecreasingRelativeVolume];
  }
}

- (void)increaseVolume
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    [(MPVolumeControllerDataSource *)self->_dataSource beginIncreasingRelativeVolume];
    dataSource = self->_dataSource;
    [(MPVolumeControllerDataSource *)dataSource endIncreasingRelativeVolume];
  }
}

- (void)endDecreasingRelativeVolume
{
  if (objc_opt_respondsToSelector())
  {
    dataSource = self->_dataSource;
    [(MPVolumeControllerDataSource *)dataSource endDecreasingRelativeVolume];
  }
}

- (void)beginDecreasingRelativeVolume
{
  if (objc_opt_respondsToSelector())
  {
    dataSource = self->_dataSource;
    [(MPVolumeControllerDataSource *)dataSource beginDecreasingRelativeVolume];
  }
}

- (void)endIncreasingRelativeVolume
{
  if (objc_opt_respondsToSelector())
  {
    dataSource = self->_dataSource;
    [(MPVolumeControllerDataSource *)dataSource endIncreasingRelativeVolume];
  }
}

- (void)beginIncreasingRelativeVolume
{
  if (objc_opt_respondsToSelector())
  {
    dataSource = self->_dataSource;
    [(MPVolumeControllerDataSource *)dataSource beginIncreasingRelativeVolume];
  }
}

- (void)setVolume:(float)a3 withNotificationDelay:(float)a4
{
  if ([(MPVolumeController *)self isVolumeControlAvailable])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke;
    v7[3] = &unk_1E57F8328;
    v7[4] = self;
    float v8 = a4;
    float v9 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(float)(*(float *)(a1 + 40) * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke_2;
  block[3] = &unk_1E57F9EA8;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  LODWORD(v3) = *(_DWORD *)(a1 + 44);
  return [*(id *)(*(void *)(a1 + 32) + 24) setVolume:v3];
}

void __54__MPVolumeController_setVolume_withNotificationDelay___block_invoke_2(uint64_t a1)
{
  --*(_DWORD *)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v2 = *(_DWORD **)(a1 + 32);
  if (!v2[2])
  {
    id v4 = [v2 delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = *(void *)(a1 + 32);
      [*(id *)(v3 + 24) volume];
      objc_msgSend(v4, "volumeController:volumeValueDidChange:", v3);
    }
  }
}

- (void)getVolumeValueWithCompletion:(id)a3
{
}

- (void)adjustVolumeValue:(float)a3
{
}

- (void)updateVolumeValue
{
}

- (void)setMuted:(BOOL)a3
{
}

- (BOOL)isMuted
{
  return [(MPVolumeControllerDataSource *)self->_dataSource isMuted];
}

- (void)setVolumeValue:(float)a3
{
}

- (float)volumeValue
{
  [(MPVolumeControllerDataSource *)self->_dataSource volume];
  return result;
}

- (NSString)volumeControlLabel
{
  return (NSString *)[(MPVolumeControllerDataSource *)self->_dataSource volumeControlLabel];
}

- (BOOL)isVolumeControlAvailable
{
  return [(MPVolumeControllerDataSource *)self->_dataSource isVolumeControlAvailable];
}

- (MPVolumeController)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPVolumeController;
  BOOL v5 = [(MPVolumeController *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(MPVolumeController *)v5 setDataSource:v4];
  }

  return v6;
}

- (MPVolumeController)init
{
  uint64_t v3 = objc_alloc_init(MPVolumeControllerSystemDataSource);
  id v4 = [(MPVolumeController *)self initWithDataSource:v3];

  return v4;
}

+ (id)descriptionForWarningState:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return *(&off_1E57F2248 + a3);
  }
}

@end
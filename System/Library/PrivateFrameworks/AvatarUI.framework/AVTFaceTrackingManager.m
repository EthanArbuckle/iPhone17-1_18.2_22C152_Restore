@interface AVTFaceTrackingManager
+ (double)desiredUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3;
- (AVTFaceTrackingManager)initWithAvatarView:(id)a3 environment:(id)a4;
- (AVTFaceTrackingManager)initWithAvatarView:(id)a3 userInfoView:(id)a4 environment:(id)a5;
- (AVTFaceTrackingManagerDelegate)delegate;
- (AVTUIEnvironment)environment;
- (AVTUserInfoView)userInfoView;
- (AVTView)avatarView;
- (BOOL)faceTrackingManagementPaused;
- (BOOL)shouldRecheckLowLightAndSensorOcclusionState;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSString)localizedDeviceName;
- (NSTimer)lowLightAndSensorOcclusionLockoutTimer;
- (NSTimer)pauseTrackingTimer;
- (NSTimer)trackingLostMessageTimer;
- (id)userInfoStringForCurrentTrackingState;
- (unint64_t)interruptionType;
- (void)avatarView:(id)a3 didUpdateWithFaceTrackingStatus:(BOOL)a4;
- (void)avatarView:(id)a3 faceTrackingSessionFailedWithError:(id)a4;
- (void)avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus;
- (void)avatarViewFaceTrackingSessionInterruptionDidBegin:(id)a3;
- (void)avatarViewFaceTrackingSessionInterruptionDidEnd:(id)a3;
- (void)cancelLowLightAndSensorOcclusionTimer;
- (void)dealloc;
- (void)invalidateFaceTrackingTimers;
- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4;
- (void)resetForResumingTrackingAnimated:(BOOL)a3;
- (void)resetForTrackingFoundAFaceAnimated:(BOOL)a3;
- (void)resumeFaceTrackingIfNeededAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceTrackingManagementPaused:(BOOL)a3;
- (void)setInterruptionType:(unint64_t)a3;
- (void)setLowLightAndSensorOcclusionLockoutTimer:(id)a3;
- (void)setPauseTrackingTimer:(id)a3;
- (void)setShouldRecheckLowLightAndSensorOcclusionState:(BOOL)a3;
- (void)setTrackingLostMessageTimer:(id)a3;
- (void)setupDisplayLayoutMonitor;
- (void)startTrackingLostTimers;
- (void)updateForPausingTracking;
- (void)updateForPausingTrackingWithLabel:(BOOL)a3;
- (void)updateForTrackingLost;
- (void)updateInterruptionTypeIfNeeded:(unint64_t)a3;
- (void)updateUserInfoBackdropForCurrentLabel;
- (void)updateUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3;
- (void)updateUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation AVTFaceTrackingManager

+ (double)desiredUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3
{
  double result = 1.0;
  if (a3) {
    return 0.0;
  }
  return result;
}

- (AVTFaceTrackingManager)initWithAvatarView:(id)a3 environment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [AVTUserInfoView alloc];
  v9 = -[AVTUserInfoView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = [(AVTFaceTrackingManager *)self initWithAvatarView:v7 userInfoView:v9 environment:v6];

  return v10;
}

- (AVTFaceTrackingManager)initWithAvatarView:(id)a3 userInfoView:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVTFaceTrackingManager;
  v12 = [(AVTFaceTrackingManager *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a5);
    objc_storeStrong((id *)&v13->_avatarView, a3);
    [v9 setFaceTrackingDelegate:v13];
    objc_storeStrong((id *)&v13->_userInfoView, a4);
    [v10 setUserInteractionEnabled:0];
    [(AVTUserInfoView *)v13->_userInfoView setAlpha:0.0];
    v14 = (void *)MGCopyAnswer();
    uint64_t v15 = [v14 copy];
    localizedDeviceName = v13->_localizedDeviceName;
    v13->_localizedDeviceName = (NSString *)v15;

    [(AVTFaceTrackingManager *)v13 setupDisplayLayoutMonitor];
  }

  return v13;
}

- (void)dealloc
{
  v3 = [(AVTFaceTrackingManager *)self displayLayoutMonitor];
  [v3 invalidate];

  [(AVTFaceTrackingManager *)self invalidateFaceTrackingTimers];
  [(AVTFaceTrackingManager *)self cancelLowLightAndSensorOcclusionTimer];
  v4.receiver = self;
  v4.super_class = (Class)AVTFaceTrackingManager;
  [(AVTFaceTrackingManager *)&v4 dealloc];
}

- (void)setFaceTrackingManagementPaused:(BOOL)a3
{
  if (self->_faceTrackingManagementPaused != a3)
  {
    self->_faceTrackingManagementPaused = a3;
    if (a3)
    {
      [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:1 animated:0];
      [(AVTFaceTrackingManager *)self resetForResumingTrackingAnimated:0];
      [(AVTFaceTrackingManager *)self cancelLowLightAndSensorOcclusionTimer];
    }
    else
    {
      objc_super v4 = [(AVTFaceTrackingManager *)self avatarView];
      char v5 = [v4 faceIsTracked];

      if ((v5 & 1) == 0)
      {
        [(AVTFaceTrackingManager *)self startTrackingLostTimers];
      }
    }
  }
}

- (void)resumeFaceTrackingIfNeededAnimated:(BOOL)a3
{
  [(AVTFaceTrackingManager *)self resetForResumingTrackingAnimated:a3];
  objc_super v4 = [(AVTFaceTrackingManager *)self avatarView];
  char v5 = [v4 faceIsTracked];

  if ((v5 & 1) == 0)
  {
    [(AVTFaceTrackingManager *)self startTrackingLostTimers];
  }
}

- (void)updateInterruptionTypeIfNeeded:(unint64_t)a3
{
  if ([(AVTFaceTrackingManager *)self interruptionType] < a3)
  {
    [(AVTFaceTrackingManager *)self setInterruptionType:a3];
  }
}

- (void)updateUserInfoBackdropForCurrentLabel
{
  v3 = [(AVTFaceTrackingManager *)self userInfoView];
  [v3 sizeToFit];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [(AVTFaceTrackingManager *)self userInfoView];
    [v6 bounds];
    objc_msgSend(v9, "faceTrackingManager:didUpdateUserInfoWithSize:", self, v7, v8);
  }
}

- (void)resetForTrackingFoundAFaceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTFaceTrackingManager *)self invalidateFaceTrackingTimers];
  [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:1 animated:v3];
}

- (void)resetForResumingTrackingAnimated:(BOOL)a3
{
  [(AVTFaceTrackingManager *)self invalidateFaceTrackingTimers];
  objc_super v4 = [(AVTFaceTrackingManager *)self avatarView];
  [v4 setFaceTrackingPaused:0];

  char v5 = [(AVTFaceTrackingManager *)self userInfoStringForCurrentTrackingState];
  id v6 = [(AVTFaceTrackingManager *)self userInfoView];
  [v6 setText:v5];

  [(AVTFaceTrackingManager *)self updateUserInfoBackdropForCurrentLabel];
  double v7 = [(AVTFaceTrackingManager *)self avatarView];
  LODWORD(v6) = [v7 faceIsTracked];

  if (v6) {
    [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:1 animated:1];
  }
  double v8 = [(AVTFaceTrackingManager *)self environment];
  id v9 = [v8 usageTrackingSession];
  [v9 didResumeFaceTracking];

  [(AVTFaceTrackingManager *)self setInterruptionType:0];
}

- (void)updateUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3
{
  if (a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  id v4 = [(AVTFaceTrackingManager *)self userInfoView];
  [v4 setAlpha:v3];
}

- (void)updateUserInfoLabelAlphaForFaceTrackingState:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(AVTFaceTrackingManager *)self userInfoView];
  [v7 alpha];
  double v9 = v8;
  [(id)objc_opt_class() desiredUserInfoLabelAlphaForFaceTrackingState:v5];
  double v11 = v10;

  if (v9 != v11)
  {
    if (v4)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __80__AVTFaceTrackingManager_updateUserInfoLabelAlphaForFaceTrackingState_animated___block_invoke;
      v12[3] = &unk_263FF1318;
      v12[4] = self;
      BOOL v13 = v5;
      [MEMORY[0x263F1CB60] animateWithDuration:v12 animations:0.5];
    }
    else
    {
      [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:v5];
    }
  }
}

uint64_t __80__AVTFaceTrackingManager_updateUserInfoLabelAlphaForFaceTrackingState_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUserInfoLabelAlphaForFaceTrackingState:*(unsigned __int8 *)(a1 + 40)];
}

- (void)invalidateFaceTrackingTimers
{
  double v3 = [(AVTFaceTrackingManager *)self trackingLostMessageTimer];
  [v3 invalidate];

  [(AVTFaceTrackingManager *)self setTrackingLostMessageTimer:0];
  BOOL v4 = [(AVTFaceTrackingManager *)self pauseTrackingTimer];
  [v4 invalidate];

  [(AVTFaceTrackingManager *)self setPauseTrackingTimer:0];
}

- (void)startTrackingLostTimers
{
  double v3 = [(AVTFaceTrackingManager *)self pauseTrackingTimer];

  if (!v3 && ![(AVTFaceTrackingManager *)self faceTrackingManagementPaused])
  {
    objc_initWeak(&location, self);
    BOOL v4 = (void *)MEMORY[0x263EFFA20];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke;
    v15[3] = &unk_263FF1340;
    objc_copyWeak(&v16, &location);
    BOOL v5 = [v4 timerWithTimeInterval:0 repeats:v15 block:2.0];
    [(AVTFaceTrackingManager *)self setTrackingLostMessageTimer:v5];

    id v6 = (void *)MEMORY[0x263EFFA20];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke_2;
    v13[3] = &unk_263FF1340;
    objc_copyWeak(&v14, &location);
    double v7 = [v6 timerWithTimeInterval:0 repeats:v13 block:10.0];
    [(AVTFaceTrackingManager *)self setPauseTrackingTimer:v7];

    double v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
    double v9 = [(AVTFaceTrackingManager *)self pauseTrackingTimer];
    uint64_t v10 = *MEMORY[0x263EFF588];
    [v8 addTimer:v9 forMode:*MEMORY[0x263EFF588]];

    double v11 = [MEMORY[0x263EFF9F0] mainRunLoop];
    v12 = [(AVTFaceTrackingManager *)self trackingLostMessageTimer];
    [v11 addTimer:v12 forMode:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateForTrackingLost];
  [WeakRetained setTrackingLostMessageTimer:0];
}

void __49__AVTFaceTrackingManager_startTrackingLostTimers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateForPausingTracking];
}

- (void)updateForTrackingLost
{
  double v3 = [(AVTFaceTrackingManager *)self userInfoStringForCurrentTrackingState];
  BOOL v4 = [(AVTFaceTrackingManager *)self userInfoView];
  [v4 setText:v3];

  [(AVTFaceTrackingManager *)self updateUserInfoBackdropForCurrentLabel];
  [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:0 animated:1];
}

- (void)updateForPausingTracking
{
}

- (void)updateForPausingTrackingWithLabel:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTFaceTrackingManager *)self cancelLowLightAndSensorOcclusionTimer];
  if (v3)
  {
    BOOL v5 = AVTAvatarUIBundle();
    id v6 = [v5 localizedStringForKey:@"TAP_TO_RESUME" value:&stru_26BF058D0 table:@"Localized"];
    double v7 = [(AVTFaceTrackingManager *)self userInfoView];
    [v7 setText:v6];

    [(AVTFaceTrackingManager *)self updateUserInfoBackdropForCurrentLabel];
  }
  [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:!v3 animated:1];
  double v8 = [(AVTFaceTrackingManager *)self avatarView];
  [v8 setFaceTrackingPaused:1];

  [(AVTFaceTrackingManager *)self setPauseTrackingTimer:0];
  [(AVTFaceTrackingManager *)self updateInterruptionTypeIfNeeded:1];
  id v10 = [(AVTFaceTrackingManager *)self environment];
  double v9 = [v10 usageTrackingSession];
  [v9 didPauseFaceTracking];
}

- (id)userInfoStringForCurrentTrackingState
{
  BOOL v3 = [(AVTFaceTrackingManager *)self environment];
  if (([v3 deviceIsPad] & 1) == 0)
  {

    goto LABEL_5;
  }
  BOOL v4 = [(AVTFaceTrackingManager *)self delegate];
  uint64_t v5 = [v4 interfaceOrientationForFaceTrackingManager:self];

  if (v5 != 2)
  {
LABEL_5:
    double v11 = [(AVTFaceTrackingManager *)self avatarView];
    int v12 = [v11 isSensorCovered];

    if (v12)
    {
      BOOL v13 = AVTAvatarUIBundle();
      double v7 = v13;
      id v14 = @"CAMERA_COVERED";
    }
    else
    {
      uint64_t v15 = [(AVTFaceTrackingManager *)self avatarView];
      int v16 = [v15 captureImageIsTooDark];

      BOOL v13 = AVTAvatarUIBundle();
      double v7 = v13;
      if (v16) {
        id v14 = @"LOW_LIGHT";
      }
      else {
        id v14 = @"TRACKING_LOST";
      }
    }
    id v10 = [v13 localizedStringForKey:v14 value:&stru_26BF058D0 table:@"Localized"];
    goto LABEL_11;
  }
  id v6 = NSString;
  double v7 = AVTAvatarUIBundle();
  double v8 = [v7 localizedStringForKey:@"ROTATE_DEVICE" value:&stru_26BF058D0 table:@"Localized"];
  double v9 = [(AVTFaceTrackingManager *)self localizedDeviceName];
  id v10 = objc_msgSend(v6, "stringWithFormat:", v8, v9);

LABEL_11:
  return v10;
}

- (void)avatarView:(id)a3 didUpdateWithFaceTrackingStatus:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__AVTFaceTrackingManager_avatarView_didUpdateWithFaceTrackingStatus___block_invoke;
  v4[3] = &unk_263FF1318;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __69__AVTFaceTrackingManager_avatarView_didUpdateWithFaceTrackingStatus___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) faceTrackingManagementPaused];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) interruptionType];
    if (!result)
    {
      BOOL v3 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 40))
      {
        return [v3 resetForTrackingFoundAFaceAnimated:1];
      }
      else
      {
        return [v3 startTrackingLostTimers];
      }
    }
  }
  return result;
}

- (void)cancelLowLightAndSensorOcclusionTimer
{
  BOOL v3 = [(AVTFaceTrackingManager *)self lowLightAndSensorOcclusionLockoutTimer];
  [v3 invalidate];

  [(AVTFaceTrackingManager *)self setLowLightAndSensorOcclusionLockoutTimer:0];
  [(AVTFaceTrackingManager *)self setShouldRecheckLowLightAndSensorOcclusionState:0];
}

- (void)avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke;
  block[3] = &unk_263FF03D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) faceTrackingManagementPaused] & 1) != 0
    || [*(id *)(a1 + 32) interruptionType] && objc_msgSend(*(id *)(a1 + 32), "interruptionType") != 1)
  {
    return;
  }
  v2 = [*(id *)(a1 + 32) lowLightAndSensorOcclusionLockoutTimer];

  BOOL v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    BOOL v4 = [v3 avatarView];
    if ([v4 faceIsTracked])
    {
      BOOL v5 = [*(id *)(a1 + 32) avatarView];
      if (![v5 captureImageIsTooDark])
      {
        BOOL v13 = [*(id *)(a1 + 32) avatarView];
        char v14 = [v13 isSensorCovered];

        if ((v14 & 1) == 0)
        {
          uint64_t v8 = 1;
          goto LABEL_13;
        }
LABEL_12:
        id v6 = [*(id *)(a1 + 32) userInfoStringForCurrentTrackingState];
        double v7 = [*(id *)(a1 + 32) userInfoView];
        [v7 setText:v6];

        [*(id *)(a1 + 32) updateUserInfoBackdropForCurrentLabel];
        uint64_t v8 = 0;
LABEL_13:
        [*(id *)(a1 + 32) updateUserInfoLabelAlphaForFaceTrackingState:v8 animated:1];
        objc_initWeak(&location, *(id *)(a1 + 32));
        double v9 = (void *)MEMORY[0x263EFFA20];
        uint64_t v15 = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        v17 = __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke_2;
        objc_super v18 = &unk_263FF1340;
        objc_copyWeak(&v19, &location);
        id v10 = [v9 timerWithTimeInterval:0 repeats:&v15 block:1.0];
        objc_msgSend(*(id *)(a1 + 32), "setLowLightAndSensorOcclusionLockoutTimer:", v10, v15, v16, v17, v18);

        double v11 = [MEMORY[0x263EFF9F0] mainRunLoop];
        int v12 = [*(id *)(a1 + 32) lowLightAndSensorOcclusionLockoutTimer];
        [v11 addTimer:v12 forMode:*MEMORY[0x263EFF588]];

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
        return;
      }
    }
    goto LABEL_12;
  }
  [v3 setShouldRecheckLowLightAndSensorOcclusionState:1];
}

void __80__AVTFaceTrackingManager_avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained shouldRecheckLowLightAndSensorOcclusionState])
  {
    [WeakRetained setLowLightAndSensorOcclusionLockoutTimer:0];
    [WeakRetained avatarViewDidUpdateWithLowLightOrCameraOcclusionStatus];
  }
}

- (void)avatarView:(id)a3 faceTrackingSessionFailedWithError:(id)a4
{
  if (![(AVTFaceTrackingManager *)self faceTrackingManagementPaused])
  {
    [(AVTFaceTrackingManager *)self updateInterruptionTypeIfNeeded:4];
    [(AVTFaceTrackingManager *)self invalidateFaceTrackingTimers];
    [(AVTFaceTrackingManager *)self cancelLowLightAndSensorOcclusionTimer];
    BOOL v5 = [(AVTFaceTrackingManager *)self avatarView];
    [v5 setFaceTrackingPaused:1];

    id v6 = AVTAvatarUIBundle();
    double v7 = [v6 localizedStringForKey:@"FACE_TRACKING_FAILED" value:&stru_26BF058D0 table:@"Localized"];
    uint64_t v8 = [(AVTFaceTrackingManager *)self userInfoView];
    [v8 setText:v7];

    [(AVTFaceTrackingManager *)self updateUserInfoBackdropForCurrentLabel];
    [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:0 animated:1];
  }
}

- (void)avatarViewFaceTrackingSessionInterruptionDidBegin:(id)a3
{
  if (![(AVTFaceTrackingManager *)self faceTrackingManagementPaused])
  {
    [(AVTFaceTrackingManager *)self updateInterruptionTypeIfNeeded:2];
    if ([(AVTFaceTrackingManager *)self interruptionType] == 2)
    {
      [(AVTFaceTrackingManager *)self invalidateFaceTrackingTimers];
      [(AVTFaceTrackingManager *)self cancelLowLightAndSensorOcclusionTimer];
      BOOL v4 = AVTAvatarUIBundle();
      BOOL v5 = [v4 localizedStringForKey:@"SESSION_INTERRUPTED" value:&stru_26BF058D0 table:@"Localized"];
      id v6 = [(AVTFaceTrackingManager *)self userInfoView];
      [v6 setText:v5];

      [(AVTFaceTrackingManager *)self updateUserInfoBackdropForCurrentLabel];
      [(AVTFaceTrackingManager *)self updateUserInfoLabelAlphaForFaceTrackingState:0 animated:1];
    }
  }
}

- (void)avatarViewFaceTrackingSessionInterruptionDidEnd:(id)a3
{
  if (![(AVTFaceTrackingManager *)self faceTrackingManagementPaused]
    && [(AVTFaceTrackingManager *)self interruptionType] == 2)
  {
    [(AVTFaceTrackingManager *)self resumeFaceTrackingIfNeededAnimated:1];
  }
}

- (void)setupDisplayLayoutMonitor
{
  objc_initWeak(&location, self);
  BOOL v3 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __51__AVTFaceTrackingManager_setupDisplayLayoutMonitor__block_invoke;
  double v9 = &unk_263FF2C68;
  objc_copyWeak(&v10, &location);
  [v3 setTransitionHandler:&v6];
  objc_msgSend(MEMORY[0x263F3F728], "monitorWithConfiguration:", v3, v6, v7, v8, v9);
  BOOL v4 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  displayLayoutMonitor = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = v4;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__AVTFaceTrackingManager_setupDisplayLayoutMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  BOOL v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained layoutMonitorDidUpdateDisplayLayout:v7 withContext:v6];
}

- (void)layoutMonitorDidUpdateDisplayLayout:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__AVTFaceTrackingManager_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke;
  v7[3] = &unk_263FF0780;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __74__AVTFaceTrackingManager_layoutMonitorDidUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) faceTrackingManagementPaused];
  if ((result & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [*(id *)(v1 + 40) elements];
    uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v22 = *(void *)v24;
      uint64_t v5 = *MEMORY[0x263F3F558];
      uint64_t v6 = *MEMORY[0x263F3F560];
      uint64_t v7 = *MEMORY[0x263F3F570];
      uint64_t v21 = *MEMORY[0x263F3F568];
      uint64_t v19 = v1;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v24 != v22) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "identifier", v19);
          if ([v10 isEqualToString:v5]) {
            goto LABEL_17;
          }
          double v11 = [v9 identifier];
          if ([v11 isEqualToString:v6]) {
            goto LABEL_16;
          }
          int v12 = [v9 identifier];
          if ([v12 isEqualToString:v7])
          {

LABEL_16:
LABEL_17:

LABEL_18:
            int v15 = 1;
            uint64_t v1 = v19;
            goto LABEL_19;
          }
          BOOL v13 = [v9 identifier];
          char v14 = [v13 isEqualToString:v21];

          if (v14) {
            goto LABEL_18;
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        int v15 = 0;
        uint64_t v1 = v19;
        if (v4) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v15 = 0;
    }
LABEL_19:

    unint64_t v16 = [*(id *)(v1 + 32) interruptionType];
    v17 = *(void **)(v1 + 32);
    if (v15 && v16 <= 2)
    {
      [v17 updateInterruptionTypeIfNeeded:3];
      [*(id *)(v1 + 32) invalidateFaceTrackingTimers];
      return [*(id *)(v1 + 32) updateForPausingTrackingWithLabel:0];
    }
    else
    {
      uint64_t result = [v17 interruptionType];
      if (result == 3) {
        char v18 = v15;
      }
      else {
        char v18 = 1;
      }
      if ((v18 & 1) == 0) {
        return [*(id *)(v1 + 32) resumeFaceTrackingIfNeededAnimated:1];
      }
    }
  }
  return result;
}

- (BOOL)faceTrackingManagementPaused
{
  return self->_faceTrackingManagementPaused;
}

- (AVTFaceTrackingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTFaceTrackingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTUserInfoView)userInfoView
{
  return self->_userInfoView;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTView)avatarView
{
  return self->_avatarView;
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (NSTimer)lowLightAndSensorOcclusionLockoutTimer
{
  return self->_lowLightAndSensorOcclusionLockoutTimer;
}

- (void)setLowLightAndSensorOcclusionLockoutTimer:(id)a3
{
}

- (BOOL)shouldRecheckLowLightAndSensorOcclusionState
{
  return self->_shouldRecheckLowLightAndSensorOcclusionState;
}

- (void)setShouldRecheckLowLightAndSensorOcclusionState:(BOOL)a3
{
  self->_shouldRecheckLowLightAndSensorOcclusionState = a3;
}

- (NSTimer)trackingLostMessageTimer
{
  return self->_trackingLostMessageTimer;
}

- (void)setTrackingLostMessageTimer:(id)a3
{
}

- (NSTimer)pauseTrackingTimer
{
  return self->_pauseTrackingTimer;
}

- (void)setPauseTrackingTimer:(id)a3
{
}

- (unint64_t)interruptionType
{
  return self->_interruptionType;
}

- (void)setInterruptionType:(unint64_t)a3
{
  self->_interruptionType = a3;
}

- (NSString)localizedDeviceName
{
  return self->_localizedDeviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceName, 0);
  objc_storeStrong((id *)&self->_pauseTrackingTimer, 0);
  objc_storeStrong((id *)&self->_trackingLostMessageTimer, 0);
  objc_storeStrong((id *)&self->_lowLightAndSensorOcclusionLockoutTimer, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_userInfoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
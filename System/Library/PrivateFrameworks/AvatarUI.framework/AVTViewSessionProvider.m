@interface AVTViewSessionProvider
+ (CGSize)backingSizeForEnvironment:(id)a3;
+ (id)creatorForAVTRecordView;
+ (id)creatorForAVTView;
- (AVTFaceTrackingManager)faceTrackingManager;
- (AVTUIEnvironment)environment;
- (AVTView)avtView;
- (AVTViewSession)activeSession;
- (AVTViewSession)pausedTrackingSession;
- (AVTViewSession)pendingSession;
- (AVTViewSessionProvider)initWithAVTViewBackingSize:(CGSize)a3 viewCreator:(id)a4 environment:(id)a5;
- (AVTViewSessionProviderDelegate)delegate;
- (AVTViewUpdater)avtViewUpdater;
- (CGSize)avtViewBackingSize;
- (NSNotificationCenter)notificationCenter;
- (UIView)avtViewContainer;
- (id)sessionWithDidBecomeActiveHandler:(id)a3 tearDownHandler:(id)a4;
- (id)viewCreator;
- (void)activateNextSession;
- (void)createContainerAndViewIfNeeded;
- (void)dealloc;
- (void)didLosePrimaryStatusWithSessionToPause:(id)a3;
- (void)handleProviderReleasesPrimaryStatusNotification:(id)a3;
- (void)handleProviderTakesPrimaryStatusNotification:(id)a3;
- (void)recoverPrimaryStatus;
- (void)sessionDidTearDown:(id)a3;
- (void)setActiveSession:(id)a3;
- (void)setAvtView:(id)a3;
- (void)setAvtViewContainer:(id)a3;
- (void)setAvtViewUpdater:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceTrackingManager:(id)a3;
- (void)setPausedTrackingSession:(id)a3;
- (void)setPendingSession:(id)a3;
@end

@implementation AVTViewSessionProvider

+ (id)creatorForAVTView
{
  v2 = (void *)[&__block_literal_global_25 copy];
  return v2;
}

AVTFixedSizeViewContainer *__43__AVTViewSessionProvider_creatorForAVTView__block_invoke(double a1, double a2, uint64_t a3, void *a4, AVTFixedSizeViewContainer **a5)
{
  *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F296E0]), "initWithFrame:", 0.0, 0.0, a1, a2);
  result = [[AVTFixedSizeViewContainer alloc] initWithFixedSizeView:*a4];
  *a5 = result;
  return result;
}

+ (id)creatorForAVTRecordView
{
  v2 = (void *)[&__block_literal_global_7 copy];
  return v2;
}

AVTFixedSizeViewContainer *__49__AVTViewSessionProvider_creatorForAVTRecordView__block_invoke(double a1, double a2, uint64_t a3, void *a4, AVTFixedSizeViewContainer **a5)
{
  *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F296B0]), "initWithFrame:", 0.0, 0.0, a1, a2);
  result = [[AVTFixedSizeViewContainer alloc] initWithFixedSizeView:*a4];
  *a5 = result;
  return result;
}

+ (CGSize)backingSizeForEnvironment:(id)a3
{
  int v3 = [a3 deviceIsPad];
  double v4 = 380.0;
  if (v3) {
    double v4 = 512.0;
  }
  double v5 = 285.0;
  if (v3) {
    double v5 = 384.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (AVTViewSessionProvider)initWithAVTViewBackingSize:(CGSize)a3 viewCreator:(id)a4 environment:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVTViewSessionProvider;
  v11 = [(AVTViewSessionProvider *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_avtViewBackingSize.CGFloat width = width;
    v11->_avtViewBackingSize.CGFloat height = height;
    uint64_t v13 = [v9 copy];
    id viewCreator = v12->_viewCreator;
    v12->_id viewCreator = (id)v13;

    objc_storeStrong((id *)&v12->_environment, a5);
    uint64_t v15 = [v10 notificationCenter];
    notificationCenter = v12->_notificationCenter;
    v12->_notificationCenter = (NSNotificationCenter *)v15;

    [(NSNotificationCenter *)v12->_notificationCenter addObserver:v12 selector:sel_handleProviderTakesPrimaryStatusNotification_ name:@"AVTViewSessionProviderTakePrimaryStatusNotification" object:0];
    [(NSNotificationCenter *)v12->_notificationCenter addObserver:v12 selector:sel_handleProviderReleasesPrimaryStatusNotification_ name:@"AVTViewSessionProviderReleasePrimaryStatusNotification" object:0];
  }

  return v12;
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)AVTViewSessionProvider;
  [(AVTViewSessionProvider *)&v3 dealloc];
}

- (id)sessionWithDidBecomeActiveHandler:(id)a3 tearDownHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [AVTViewSession alloc];
  [(AVTViewSessionProvider *)self avtViewBackingSize];
  id v9 = -[AVTViewSession initWithBecomeActiveHandler:tearDownHandler:aspectRatio:](v8, "initWithBecomeActiveHandler:tearDownHandler:aspectRatio:", v7, v6);

  [(AVTViewSession *)v9 setDelegate:self];
  [(AVTViewSessionProvider *)self setPendingSession:v9];
  id v10 = [(AVTViewSessionProvider *)self activeSession];
  LODWORD(v6) = [v10 isActive];

  v11 = [(AVTViewSessionProvider *)self activeSession];
  v12 = v11;
  if (v6)
  {
    [v11 tearDownWithCompletionHandler:0];
  }
  else
  {

    if (!v12)
    {
      uint64_t v13 = [(AVTViewSessionProvider *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        uint64_t v15 = [(AVTViewSessionProvider *)self delegate];
        [v15 sessionProviderWillStartCameraSession:self];
      }
      [(AVTViewSessionProvider *)self activateNextSession];
    }
  }
  return v9;
}

- (void)activateNextSession
{
  objc_super v3 = [(AVTViewSessionProvider *)self pendingSession];

  double v4 = [(AVTViewSessionProvider *)self notificationCenter];
  double v5 = v4;
  if (v3)
  {
    [v4 postNotificationName:@"AVTViewSessionProviderTakePrimaryStatusNotification" object:self];

    [(AVTViewSessionProvider *)self createContainerAndViewIfNeeded];
    id v6 = [(AVTViewSessionProvider *)self pendingSession];
    [(AVTViewSessionProvider *)self setActiveSession:v6];

    [(AVTViewSessionProvider *)self setPendingSession:0];
    id v12 = [(AVTViewSessionProvider *)self activeSession];
    id v7 = [(AVTViewSessionProvider *)self avtView];
    v8 = [(AVTViewSessionProvider *)self avtViewContainer];
    id v9 = [(AVTViewSessionProvider *)self avtViewUpdater];
    [v12 activateWithAVTView:v7 container:v8 updater:v9];
  }
  else
  {
    [v4 postNotificationName:@"AVTViewSessionProviderReleasePrimaryStatusNotification" object:self];

    id v10 = [(AVTViewSessionProvider *)self delegate];
    uint64_t v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      return;
    }
    id v12 = [(AVTViewSessionProvider *)self delegate];
    [v12 sessionProviderDidEndCameraSession:self];
  }
}

- (void)createContainerAndViewIfNeeded
{
  objc_super v3 = [(AVTViewSessionProvider *)self avtViewContainer];

  if (!v3)
  {
    double v4 = [(AVTViewSessionProvider *)self viewCreator];
    [(AVTViewSessionProvider *)self avtViewBackingSize];
    id v15 = 0;
    id v16 = 0;
    ((void (**)(void, id *, id *))v4)[2](v4, &v16, &v15);
    id v5 = v16;
    id v6 = v15;

    [(AVTViewSessionProvider *)self setAvtViewContainer:v6];
    [(AVTViewSessionProvider *)self setAvtView:v5];
    id v7 = [AVTViewUpdater alloc];
    v8 = [(AVTViewSessionProvider *)self avtView];
    id v9 = [(AVTViewSessionProvider *)self environment];
    id v10 = [v9 logger];
    uint64_t v11 = [(AVTViewUpdater *)v7 initWithAVTView:v8 logger:v10];
    [(AVTViewSessionProvider *)self setAvtViewUpdater:v11];

    id v12 = [AVTFaceTrackingManager alloc];
    uint64_t v13 = [(AVTViewSessionProvider *)self environment];
    char v14 = [(AVTFaceTrackingManager *)v12 initWithAvatarView:v5 environment:v13];

    [(AVTViewSessionProvider *)self setFaceTrackingManager:v14];
  }
}

- (void)handleProviderTakesPrimaryStatusNotification:(id)a3
{
  double v4 = [a3 object];

  if (v4 != self)
  {
    id v5 = [(AVTViewSessionProvider *)self activeSession];
    [(AVTViewSessionProvider *)self didLosePrimaryStatusWithSessionToPause:v5];
  }
}

- (void)didLosePrimaryStatusWithSessionToPause:(id)a3
{
  id v7 = a3;
  double v4 = [v7 avtView];
  int v5 = [v4 enableFaceTracking];

  if (v5)
  {
    id v6 = [v7 avtView];
    [v6 setEnableFaceTracking:0];

    [(AVTViewSessionProvider *)self setPausedTrackingSession:v7];
  }
}

- (void)handleProviderReleasesPrimaryStatusNotification:(id)a3
{
  double v4 = [a3 object];

  if (v4 != self)
  {
    int v5 = [(AVTViewSessionProvider *)self pausedTrackingSession];

    if (v5)
    {
      [(AVTViewSessionProvider *)self recoverPrimaryStatus];
    }
  }
}

- (void)recoverPrimaryStatus
{
  objc_super v3 = [(AVTViewSessionProvider *)self pausedTrackingSession];
  double v4 = [v3 avtView];
  [v4 setEnableFaceTracking:1];

  [(AVTViewSessionProvider *)self setPausedTrackingSession:0];
}

- (void)sessionDidTearDown:(id)a3
{
  id v6 = a3;
  id v4 = [(AVTViewSessionProvider *)self pendingSession];

  if (v4 == v6)
  {
    [(AVTViewSessionProvider *)self setPendingSession:0];
  }
  else
  {
    id v5 = [(AVTViewSessionProvider *)self activeSession];

    if (v5 != v6) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method can only be called if the session was known to the provider"];
    }
    [(AVTViewSessionProvider *)self setActiveSession:0];
    [(AVTViewSessionProvider *)self activateNextSession];
  }
}

- (CGSize)avtViewBackingSize
{
  double width = self->_avtViewBackingSize.width;
  double height = self->_avtViewBackingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (AVTViewSessionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTViewSessionProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTFaceTrackingManager)faceTrackingManager
{
  return self->_faceTrackingManager;
}

- (void)setFaceTrackingManager:(id)a3
{
}

- (id)viewCreator
{
  return self->_viewCreator;
}

- (UIView)avtViewContainer
{
  return self->_avtViewContainer;
}

- (void)setAvtViewContainer:(id)a3
{
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (void)setAvtView:(id)a3
{
}

- (AVTViewUpdater)avtViewUpdater
{
  return self->_avtViewUpdater;
}

- (void)setAvtViewUpdater:(id)a3
{
}

- (AVTViewSession)activeSession
{
  return self->_activeSession;
}

- (void)setActiveSession:(id)a3
{
}

- (AVTViewSession)pendingSession
{
  return self->_pendingSession;
}

- (void)setPendingSession:(id)a3
{
}

- (AVTViewSession)pausedTrackingSession
{
  return self->_pausedTrackingSession;
}

- (void)setPausedTrackingSession:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pausedTrackingSession, 0);
  objc_storeStrong((id *)&self->_pendingSession, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_avtViewUpdater, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
  objc_storeStrong((id *)&self->_avtViewContainer, 0);
  objc_storeStrong(&self->_viewCreator, 0);
  objc_storeStrong((id *)&self->_faceTrackingManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
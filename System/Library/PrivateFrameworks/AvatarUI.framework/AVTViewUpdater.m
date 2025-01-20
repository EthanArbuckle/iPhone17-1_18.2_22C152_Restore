@interface AVTViewUpdater
- (AVTAvatar)currentAvatar;
- (AVTAvatarRecord)avatarRecord;
- (AVTUILogger)logger;
- (AVTView)avtView;
- (AVTViewUpdater)initWithAVTView:(id)a3 callbackQueue:(id)a4 logger:(id)a5;
- (AVTViewUpdater)initWithAVTView:(id)a3 logger:(id)a4;
- (BOOL)willUpdateViewForRecord:(id)a3 avatar:(id)a4;
- (OS_dispatch_queue)callbackQueue;
- (void)addAvatarPresentedOnScreenCallbackWithQueue:(id)a3 forTimestamp:(double)a4;
- (void)setAvatarRecord:(id)a3;
- (void)setAvatarRecord:(id)a3 avatar:(id)a4 completionHandler:(id)a5;
- (void)setAvatarRecord:(id)a3 completionHandler:(id)a4;
- (void)setCurrentAvatar:(id)a3;
- (void)setStickerConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation AVTViewUpdater

- (AVTViewUpdater)initWithAVTView:(id)a3 logger:(id)a4
{
  return [(AVTViewUpdater *)self initWithAVTView:a3 callbackQueue:MEMORY[0x263EF83A0] logger:a4];
}

- (AVTViewUpdater)initWithAVTView:(id)a3 callbackQueue:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTViewUpdater;
  v12 = [(AVTViewUpdater *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_logger, a5);
    objc_storeStrong((id *)&v13->_avtView, a3);
    objc_storeStrong((id *)&v13->_callbackQueue, a4);
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)setAvatarRecord:(id)a3 completionHandler:(id)a4
{
}

- (void)setStickerConfiguration:(id)a3 completionHandler:(id)a4
{
  p_lock = &self->_lock;
  id v10 = a4;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  CFTimeInterval v8 = CACurrentMediaTime();
  self->_lastUpdateTimestamp = v8;
  os_unfair_lock_unlock(p_lock);
  id v9 = [(AVTViewUpdater *)self avtView];
  [v9 transitionToStickerConfiguration:v7 duration:0 completionHandler:0.0];

  [(AVTViewUpdater *)self addAvatarPresentedOnScreenCallbackWithQueue:v10 forTimestamp:v8];
}

- (void)setAvatarRecord:(id)a3 avatar:(id)a4 completionHandler:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  CFTimeInterval v10 = CACurrentMediaTime();
  self->_lastUpdateTimestamp = v10;
  os_unfair_lock_unlock(&self->_lock);
  BOOL v11 = [(AVTViewUpdater *)self willUpdateViewForRecord:v23 avatar:v8];
  [(AVTViewUpdater *)self setAvatarRecord:v23];
  if (v11)
  {
    id v12 = v8;
    if (!v12)
    {
      id v12 = [MEMORY[0x263F29730] avatarForRecord:v23];
    }
    [(AVTViewUpdater *)self setCurrentAvatar:v12];
    v13 = [(AVTViewUpdater *)self logger];
    v14 = [v12 description];
    [v13 logAVTViewSetAvatar:v14];

    objc_super v15 = [(AVTViewUpdater *)self avtView];
    uint64_t v16 = [v15 avatar];
    v17 = [(id)v16 pose];

    v18 = [(AVTViewUpdater *)self avtView];
    LOBYTE(v16) = [v18 enableFaceTracking];

    if ((v16 & 1) == 0 && !v17)
    {
      v17 = [MEMORY[0x263F29670] friendlyPose];
    }
    v19 = [(AVTViewUpdater *)self avtView];
    [v19 setAvatar:v12];

    v20 = [(AVTViewUpdater *)self avtView];
    char v21 = [v20 enableFaceTracking];

    if ((v21 & 1) == 0)
    {
      v22 = [(AVTViewUpdater *)self avtView];
      [v22 transitionToPose:v17 duration:0 completionHandler:0.0];
    }
  }
  [(AVTViewUpdater *)self addAvatarPresentedOnScreenCallbackWithQueue:v9 forTimestamp:v10];
}

- (BOOL)willUpdateViewForRecord:(id)a3 avatar:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  id v8 = a4;
  uint64_t v9 = [(AVTViewUpdater *)self avatarRecord];
  if (v7 | v9)
  {
    v4 = [(AVTViewUpdater *)self avatarRecord];
    char v10 = [v4 isEqual:v7];
    LOBYTE(v11) = v10 ^ 1;
    if (!v8 || (v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    LOBYTE(v11) = 0;
    goto LABEL_9;
  }
  id v12 = [(AVTViewUpdater *)self currentAvatar];
  v13 = [(AVTViewUpdater *)self currentAvatar];
  int v11 = [v13 isEqual:v8] ^ 1;

  if (v7 | v9) {
LABEL_7:
  }

LABEL_9:
  return v11;
}

- (void)addAvatarPresentedOnScreenCallbackWithQueue:(id)a3 forTimestamp:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    unint64_t v7 = [(AVTViewUpdater *)self avtView];
    id v8 = [(AVTViewUpdater *)self callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__AVTViewUpdater_addAvatarPresentedOnScreenCallbackWithQueue_forTimestamp___block_invoke;
    v9[3] = &unk_263FF0758;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)&a4;
    id v10 = v6;
    [v7 addAvatarPresentedOnScreenCallbackWithQueue:v8 block:v9];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __75__AVTViewUpdater_addAvatarPresentedOnScreenCallbackWithQueue_forTimestamp___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 2;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 2);
    os_unfair_lock_unlock(v3);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    WeakRetained = v4;
  }
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTAvatar)currentAvatar
{
  return self->_currentAvatar;
}

- (void)setCurrentAvatar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAvatar, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
}

@end
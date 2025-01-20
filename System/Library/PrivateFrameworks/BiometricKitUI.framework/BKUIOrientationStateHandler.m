@interface BKUIOrientationStateHandler
+ (unint64_t)bkui_getState:(int)a3;
- (BKUIOrientationStateHandler)init;
- (BOOL)rotationLockStatusIsLocked;
- (int)orientationLockToken;
- (int)orientationNotificationToken;
- (int)rawOrientationToken;
- (int)rotationLockNotificationToken;
- (int64_t)lastKownOrientation;
- (int64_t)rawDeviceOrientationIgnoringOrientationLocks;
- (void)_invalidateTokenIfNeeded:(int)a3;
- (void)dealloc;
- (void)registerRotationLockObserver:(id)a3;
- (void)registerRotationObserver:(id)a3;
- (void)setLastKownOrientation:(int64_t)a3;
- (void)setOrientationLockToken:(int)a3;
- (void)setOrientationNotificationToken:(int)a3;
- (void)setRawOrientationToken:(int)a3;
- (void)setRotationLockNotificationToken:(int)a3;
@end

@implementation BKUIOrientationStateHandler

- (BKUIOrientationStateHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIOrientationStateHandler;
  result = [(BKUIOrientationStateHandler *)&v3 init];
  if (result)
  {
    *(void *)&result->_rawOrientationToken = -1;
    *(void *)&result->_rotationLockNotificationToken = -1;
  }
  return result;
}

- (int64_t)rawDeviceOrientationIgnoringOrientationLocks
{
  int out_token = 0;
  int rawOrientationToken = self->_rawOrientationToken;
  if (rawOrientationToken == -1)
  {
    notify_register_check((const char *)RAW_ORIENTATION_TOKEN_NAME, &out_token);
    int rawOrientationToken = out_token;
    self->_int rawOrientationToken = out_token;
  }
  int check = 0;
  notify_check(rawOrientationToken, &check);
  int v4 = self->_rawOrientationToken;
  if (v4 == -1 || check == 0) {
    return self->_lastKownOrientation;
  }
  int64_t v7 = 0;
  notify_get_state(v4, (uint64_t *)&v7);
  int64_t result = v7;
  self->_lastKownOrientation = v7;
  return result;
}

- (BOOL)rotationLockStatusIsLocked
{
  int out_token = 0;
  int orientationLockToken = self->_orientationLockToken;
  if (orientationLockToken == -1)
  {
    notify_register_check((const char *)RAW_ORIENTATION_LOCK_TOKEN_NAME, &out_token);
    int orientationLockToken = out_token;
    self->_int orientationLockToken = out_token;
    if (orientationLockToken == -1) {
      return 0;
    }
  }
  uint64_t v5 = 0;
  notify_get_state(orientationLockToken, &v5);
  return v5 != 0;
}

- (void)registerRotationObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "ForcedRotation:registerRotationObserver:", (uint8_t *)&buf, 2u);
  }

  if (self->_orientationNotificationToken == -1)
  {
    int out_token = 0;
    objc_initWeak(&buf, self);
    v6 = (const char *)RAW_ORIENTATION_TOKEN_NAME;
    int64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__BKUIOrientationStateHandler_registerRotationObserver___block_invoke;
    v9[3] = &unk_1E6EA2020;
    objc_copyWeak(&v11, &buf);
    id v10 = v4;
    notify_register_dispatch(v6, &out_token, v7, v9);

    self->_orientationNotificationToken = out_token;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&buf);
  }
}

void __56__BKUIOrientationStateHandler_registerRotationObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    *((_DWORD *)WeakRetained + 2) = a2;
  }
  unint64_t v6 = +[BKUIOrientationStateHandler bkui_getState:a2];
  int64_t v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "ForcedRotation:[Rotation Callback] device orientation: %i", (uint8_t *)v9, 8u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v6);
  }
}

- (void)registerRotationLockObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_rotationLockNotificationToken == -1)
  {
    int out_token = 0;
    unint64_t v6 = (const char *)RAW_ORIENTATION_LOCK_TOKEN_NAME;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__BKUIOrientationStateHandler_registerRotationLockObserver___block_invoke;
    v7[3] = &unk_1E6EA2048;
    id v8 = v4;
    notify_register_dispatch(v6, &out_token, MEMORY[0x1E4F14428], v7);
    self->_rotationLockNotificationToken = out_token;
  }
}

uint64_t __60__BKUIOrientationStateHandler_registerRotationLockObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  +[BKUIOrientationStateHandler bkui_getState:a2];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

+ (unint64_t)bkui_getState:(int)a3
{
  uint64_t state64 = 0;
  notify_get_state(a3, &state64);
  return state64;
}

- (void)dealloc
{
  [(BKUIOrientationStateHandler *)self _invalidateTokenIfNeeded:self->_orientationNotificationToken];
  [(BKUIOrientationStateHandler *)self _invalidateTokenIfNeeded:self->_rotationLockNotificationToken];
  [(BKUIOrientationStateHandler *)self _invalidateTokenIfNeeded:self->_orientationLockToken];
  [(BKUIOrientationStateHandler *)self _invalidateTokenIfNeeded:self->_rawOrientationToken];
  v3.receiver = self;
  v3.super_class = (Class)BKUIOrientationStateHandler;
  [(BKUIOrientationStateHandler *)&v3 dealloc];
}

- (void)_invalidateTokenIfNeeded:(int)a3
{
  if (notify_is_valid_token(a3))
  {
    notify_cancel(a3);
  }
}

- (int)rawOrientationToken
{
  return self->_rawOrientationToken;
}

- (void)setRawOrientationToken:(int)a3
{
  self->_int rawOrientationToken = a3;
}

- (int)orientationLockToken
{
  return self->_orientationLockToken;
}

- (void)setOrientationLockToken:(int)a3
{
  self->_int orientationLockToken = a3;
}

- (int)rotationLockNotificationToken
{
  return self->_rotationLockNotificationToken;
}

- (void)setRotationLockNotificationToken:(int)a3
{
  self->_rotationLockNotificationToken = a3;
}

- (int)orientationNotificationToken
{
  return self->_orientationNotificationToken;
}

- (void)setOrientationNotificationToken:(int)a3
{
  self->_orientationNotificationToken = a3;
}

- (int64_t)lastKownOrientation
{
  return self->_lastKownOrientation;
}

- (void)setLastKownOrientation:(int64_t)a3
{
  self->_lastKownOrientation = a3;
}

@end
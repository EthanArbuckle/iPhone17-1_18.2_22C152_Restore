@interface FigCameraUsageListener
+ (void)initialize;
- (FigCameraUsageListener)initWithChangeHandler:(id)a3;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation FigCameraUsageListener

+ (void)initialize
{
}

- (FigCameraUsageListener)initWithChangeHandler:(id)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)FigCameraUsageListener;
    id v4 = [(FigCameraUsageListener *)&v7 init];
    if (v4)
    {
      *((void *)v4 + 3) = [a3 copy];
      v5 = (pthread_mutex_t *)FigSimpleMutexCreate();
      *((void *)v4 + 2) = v5;
      pthread_mutex_lock(v5);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection"), "registerObserver:", v4);
      *((unsigned char *)v4 + 8) = FigCameraUsageProhibited();
      pthread_mutex_unlock(*((pthread_mutex_t **)v4 + 2));
    }
  }
  else
  {

    return 0;
  }
  return (FigCameraUsageListener *)v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection"), "unregisterObserver:", self);

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCameraUsageListener;
  [(FigCameraUsageListener *)&v3 dealloc];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = FigCameraUsageProhibited();
  pthread_mutex_lock((pthread_mutex_t *)self->_isProhibitedLock);
  if (v5 != self->_isProhibited)
  {
    self->_isProhibited = v5;
    (*((void (**)(void))self->_changeHandler + 2))();
  }
  isProhibitedLock = self->_isProhibitedLock;
  pthread_mutex_unlock((pthread_mutex_t *)isProhibitedLock);
}

@end
@interface CMGestureManagerInternal
- (CMGestureManagerInternal)initWithPriority:(int)a3;
- (void)dealloc;
- (void)startGestureUpdatesWithHandlerPrivate:(id)a3;
- (void)stopGestureUpdatesPrivate;
@end

@implementation CMGestureManagerInternal

- (CMGestureManagerInternal)initWithPriority:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMGestureManagerInternal;
  v4 = [(CMGestureManagerInternal *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->fPriority = a3;
    v4->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotionCMGestureManagerPrivateQueue", 0);
  }
  return v5;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMGestureManagerInternal;
  [(CMGestureManagerInternal *)&v3 dealloc];
}

- (void)startGestureUpdatesWithHandlerPrivate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id fGestureHandler = self->fGestureHandler;
  if (fGestureHandler != a3)
  {

    self->id fGestureHandler = (id)objc_msgSend_copy(a3, v6, v7);
    if (!self->fLocationdConnection) {
      operator new();
    }
  }
}

- (void)stopGestureUpdatesPrivate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->fGestureHandler)
  {
    if (qword_1E929D6D0 != -1) {
      dispatch_once(&qword_1E929D6D0, &unk_1EDFD3AE0);
    }
    objc_super v3 = qword_1E929D6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929D6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping gesture updates", buf, 2u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D6D0 != -1) {
        dispatch_once(&qword_1E929D6D0, &unk_1EDFD3AE0);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMGestureManagerInternal stopGestureUpdatesPrivate]", "CoreLocation: %s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }

    self->id fGestureHandler = 0;
    if (self->fLocationdConnection)
    {
      uint64_t v4 = MEMORY[0x192FCC3F0]();
      MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
    }
    self->fLocationdConnection = 0;
  }
}

@end
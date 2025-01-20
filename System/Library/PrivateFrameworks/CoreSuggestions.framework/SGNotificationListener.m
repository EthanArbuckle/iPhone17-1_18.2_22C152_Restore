@interface SGNotificationListener
- (BOOL)unsubscribe;
- (SGNotificationListener)initWithNotification:(__CFString *)a3 callback:(id)a4;
- (void)_notify;
- (void)dealloc;
@end

@implementation SGNotificationListener

- (SGNotificationListener)initWithNotification:(__CFString *)a3 callback:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGNotificationListener;
  v7 = [(SGNotificationListener *)&v12 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x1A62654A0](v6);
    id callback = v7->_callback;
    v7->_id callback = (id)v8;

    v7->_notification = (__CFString *)CFRetain(a3);
    pthread_mutex_init(&v7->_lock, 0);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v7, (CFNotificationCallback)changeCallback, v7->_notification, v7->_notification, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)unsubscribe
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  notification = self->_notification;
  if (notification)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterRemoveObserver(DistributedCenter, self, self->_notification, self->_notification);
    CFRelease(self->_notification);
    id callback = self->_callback;
    self->_id callback = 0;
    self->_notification = 0;
  }
  pthread_mutex_unlock(p_lock);
  return notification != 0;
}

- (void)dealloc
{
  [(SGNotificationListener *)self unsubscribe];
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGNotificationListener;
  [(SGNotificationListener *)&v3 dealloc];
}

- (void)_notify
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[SGRecordId recordIdWithNumericValue:-1];
  id callback = (void (**)(id, void *, void *))self->_callback;
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7 = v3;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  callback[2](callback, v5, v6);
}

@end
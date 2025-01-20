@interface IOKMatchingNotificationRef
- (IOKMatchingNotification)notification;
- (IOKMatchingNotificationRef)init;
- (void)lock;
- (void)setNotification:(id)a3;
- (void)unlock;
@end

@implementation IOKMatchingNotificationRef

- (IOKMatchingNotificationRef)init
{
  v3.receiver = self;
  v3.super_class = (Class)IOKMatchingNotificationRef;
  result = [(IOKMatchingNotificationRef *)&v3 init];
  if (result) {
    result->_lock = 0;
  }
  return result;
}

- (void)lock
{
}

- (void)unlock
{
}

- (IOKMatchingNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  self->_notification = (IOKMatchingNotification *)a3;
}

@end
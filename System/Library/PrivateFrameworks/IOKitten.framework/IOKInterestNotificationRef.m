@interface IOKInterestNotificationRef
- (IOKInterestNotification)notification;
- (IOKInterestNotificationRef)init;
- (void)lock;
- (void)setNotification:(id)a3;
- (void)unlock;
@end

@implementation IOKInterestNotificationRef

- (void)setNotification:(id)a3
{
  self->_notification = (IOKInterestNotification *)a3;
}

- (void)unlock
{
}

- (void)lock
{
}

- (IOKInterestNotificationRef)init
{
  v3.receiver = self;
  v3.super_class = (Class)IOKInterestNotificationRef;
  result = [(IOKInterestNotificationRef *)&v3 init];
  if (result) {
    result->_lock = 0;
  }
  return result;
}

- (IOKInterestNotification)notification
{
  return self->_notification;
}

@end
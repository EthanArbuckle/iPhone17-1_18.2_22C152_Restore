@interface CDXNotifydNotifier
- (CDXNotifydNotifier)initWithNotificationName:(const char *)a3;
- (const)notificationName;
- (void)postNotification;
@end

@implementation CDXNotifydNotifier

- (CDXNotifydNotifier)initWithNotificationName:(const char *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDXNotifydNotifier;
  result = [(CDXNotifydNotifier *)&v5 init];
  if (result) {
    result->_notificationName = a3;
  }
  return result;
}

- (void)postNotification
{
  v2 = [(CDXNotifydNotifier *)self notificationName];

  notify_post(v2);
}

- (const)notificationName
{
  return self->_notificationName;
}

@end
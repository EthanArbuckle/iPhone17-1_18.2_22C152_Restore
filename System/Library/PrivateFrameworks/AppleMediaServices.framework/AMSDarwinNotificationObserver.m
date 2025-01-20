@interface AMSDarwinNotificationObserver
- (AMSDarwinNotificationObserver)initWithNotificationName:(__CFString *)a3 additionalBehavior:(int64_t)a4;
- (__CFString)notificationName;
- (id)observerBlock;
- (void)dealloc;
- (void)setObserverBlock:(id)a3;
@end

@implementation AMSDarwinNotificationObserver

- (void)setObserverBlock:(id)a3
{
}

- (AMSDarwinNotificationObserver)initWithNotificationName:(__CFString *)a3 additionalBehavior:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AMSDarwinNotificationObserver;
  v6 = [(AMSDarwinNotificationObserver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_notificationName = a3;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_handleNotification, a3, 0, (CFNotificationSuspensionBehavior)(a4 | 0x400));
  }
  return v7;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, [(AMSDarwinNotificationObserver *)self notificationName], 0);
  v4.receiver = self;
  v4.super_class = (Class)AMSDarwinNotificationObserver;
  [(AMSDarwinNotificationObserver *)&v4 dealloc];
}

- (id)observerBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (__CFString)notificationName
{
  return self->_notificationName;
}

- (void).cxx_destruct
{
}

@end
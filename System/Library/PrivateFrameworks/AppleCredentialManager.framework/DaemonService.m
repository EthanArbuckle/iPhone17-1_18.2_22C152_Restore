@interface DaemonService
- (DaemonService)initWithNotificationQueue:(id)a3;
- (OS_dispatch_queue)notificationQueue;
@end

@implementation DaemonService

- (DaemonService)initWithNotificationQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  v8.receiver = self;
  v8.super_class = (Class)DaemonService;
  v5 = [(DaemonService *)&v8 init];
  notificationQueue = v5->_notificationQueue;
  v5->_notificationQueue = v4;

  return v5;
}

- (OS_dispatch_queue)notificationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end
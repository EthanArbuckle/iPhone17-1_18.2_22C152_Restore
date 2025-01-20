@interface VOTDebugManager
+ (id)sharedInstance;
- (VOTDebugManager)init;
- (VOTElementManagementProtocol)elementManager;
- (void)dealloc;
- (void)setElementManager:(id)a3;
@end

@implementation VOTDebugManager

+ (id)sharedInstance
{
  if (qword_1001EBC68 != -1) {
    dispatch_once(&qword_1001EBC68, &stru_1001B6E78);
  }
  v2 = (void *)qword_1001EBC60;

  return v2;
}

- (VOTDebugManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)VOTDebugManager;
  return [(VOTDebugManager *)&v3 init];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)VOTDebugManager;
  [(VOTDebugManager *)&v4 dealloc];
}

- (VOTElementManagementProtocol)elementManager
{
  return self->_elementManager;
}

- (void)setElementManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
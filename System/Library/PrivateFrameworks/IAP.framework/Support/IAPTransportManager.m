@interface IAPTransportManager
- (IAPTransportManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4;
- (NSNumber)portNumber;
- (int)accResistorID;
- (unsigned)service;
- (void)_setAccResistorID:(int)a3;
- (void)dealloc;
@end

@implementation IAPTransportManager

- (IAPTransportManager)initWithService:(unsigned int)a3 andNotificationPort:(IONotificationPort *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)IAPTransportManager;
  v6 = [(IAPTransportManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_accResistorID = -1;
    v6->_notificationPortRef = a4;
    v6->_service = a3;
    uint64_t v8 = IOObjectRetain(a3);
    if (v8) {
      NSLog(@"ERROR - %s:%s - %d IOObjectRetain failed %#x", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportManager.mm", "-[IAPTransportManager initWithService:andNotificationPort:]", 64, v8);
    }
    uint64_t v9 = IOServiceAddInterestNotification(v7->_notificationPortRef, v7->_service, "IOGeneralInterest", (IOServiceInterestCallback)sub_100007ABC, v7, &v7->_notification);
    if (v9) {
      NSLog(@"ERROR - %s:%s - %d couldn't add interest notification %#x", "/Library/Caches/com.apple.xbs/Sources/iapd/iaptransportd/IAPTransportManager.mm", "-[IAPTransportManager initWithService:andNotificationPort:]", 69, v9);
    }
    v7->_portNumber = (NSNumber *)[objc_alloc((Class)NSNumber) initWithInt:IOAccessoryManagerGetPrimaryPort()];
  }
  return v7;
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_io_object_t service = 0;
  }
  io_object_t notification = self->_notification;
  if (notification)
  {
    IOObjectRelease(notification);
    self->_io_object_t notification = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)IAPTransportManager;
  [(IAPTransportManager *)&v5 dealloc];
}

- (int)accResistorID
{
  if (!self->_service) {
    return 100;
  }
  int result = self->_accResistorID;
  if (result == -1)
  {
    int result = IOAccessoryManagerGetAccessoryID();
    self->_accResistorID = result;
  }
  if (result == -1) {
    return 100;
  }
  return result;
}

- (void)_setAccResistorID:(int)a3
{
  self->_accResistorID = a3;
}

- (unsigned)service
{
  return self->_service;
}

- (NSNumber)portNumber
{
  return self->_portNumber;
}

@end
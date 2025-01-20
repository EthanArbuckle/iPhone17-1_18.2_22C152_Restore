@interface CMHeadphoneMotionManagerInternal
- (CMAttitude)initialReferenceAttitude;
- (CMDeviceMotion)deviceMotion;
- (CMHeadphoneMotionManagerInternal)init;
- (void)connect;
- (void)connectStatus;
- (void)dealloc;
- (void)disconnect;
- (void)disconnectStatus;
- (void)setDeviceMotion:(id)a3;
- (void)setInitialReferenceAttitude:(id)a3;
@end

@implementation CMHeadphoneMotionManagerInternal

- (CMHeadphoneMotionManagerInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)CMHeadphoneMotionManagerInternal;
  v2 = [(CMHeadphoneMotionManagerInternal *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMHeadphoneMotionManager", v3);
    v2->_connectionClient = 0;
    *(_WORD *)&v2->_deviceMotionActive = 0;
    v2->_deviceConnected = 0;
    *(_WORD *)&v2->_statusActive = 0;
    v2->_deviceConnectionTimestamp = 0.0;
    v2->_firstValidDeviceMotionTimestamp = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMHeadphoneMotionManagerInternal;
  [(CMHeadphoneMotionManagerInternal *)&v3 dealloc];
}

- (void)connect
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_connectionClient)
  {
    objc_super v3 = (RMConnectionClient *)sub_19047CD80((id *)[RMConnectionClient alloc], self->_dispatchQueue, @"com.apple.relatived.public", &unk_1EDFD2780);
    self->_connectionClient = v3;
    sub_19047D4E0((uint64_t)v3);
  }
}

- (void)disconnect
{
  self->_connectionClient = 0;
}

- (void)connectStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_statusConnectionClient)
  {
    objc_super v3 = (RMConnectionClient *)sub_19047CD80((id *)[RMConnectionClient alloc], self->_dispatchQueue, @"com.apple.relatived.status", &unk_1EDFD31E0);
    self->_statusConnectionClient = v3;
    sub_19047D4E0((uint64_t)v3);
  }
}

- (void)disconnectStatus
{
  self->_statusConnectionClient = 0;
}

- (CMDeviceMotion)deviceMotion
{
  return (CMDeviceMotion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDeviceMotion:(id)a3
{
}

- (CMAttitude)initialReferenceAttitude
{
  return self->_initialReferenceAttitude;
}

- (void)setInitialReferenceAttitude:(id)a3
{
}

@end
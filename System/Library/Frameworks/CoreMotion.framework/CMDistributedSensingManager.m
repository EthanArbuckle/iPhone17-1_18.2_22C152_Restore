@interface CMDistributedSensingManager
+ (BOOL)isVehicleStateUpdatesAvailable;
- (CMDistributedSensingDelegate)delegate;
- (CMDistributedSensingManager)init;
- (CMDistributedSensingManagerInternal)_internal;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)subscribeToVehicleState;
- (void)unsubscribeToVehicleState;
@end

@implementation CMDistributedSensingManager

- (CMDistributedSensingManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMDistributedSensingManager;
  v2 = [(CMDistributedSensingManager *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMDistributedSensingManagerInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  clientQueue = internal->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904728F8;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_async(clientQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMDistributedSensingManager;
  [(CMDistributedSensingManager *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  internal = self->_internal;
  objc_storeWeak((id *)&internal->_delegate, a3);
  objc_storeWeak((id *)&internal->_manager, self);
  self->_delegate = (CMDistributedSensingDelegate *)a3;
}

+ (BOOL)isVehicleStateUpdatesAvailable
{
  if (sub_19046BC40()) {
    return 1;
  }
  sub_1902BAD40();
  if (sub_19046BCE8()) {
    return 1;
  }
  sub_1902BAD40();
  return 0;
}

- (void)subscribeToVehicleState
{
}

- (void)unsubscribeToVehicleState
{
  objc_msgSend__unregisterForVehicleStateUpdates(self->_internal, a2, v2);
}

- (CMDistributedSensingManagerInternal)_internal
{
  return self->_internal;
}

- (CMDistributedSensingDelegate)delegate
{
  return self->_delegate;
}

@end
@interface CMBatchedSensorManager
+ (BOOL)isAccelerometerSupported;
+ (BOOL)isDeviceMotionSupported;
+ (CMAuthorizationStatus)authorizationStatus;
- (BOOL)isAccelerometerActive;
- (BOOL)isDeviceMotionActive;
- (CMBatchedSensorManager)init;
- (NSArray)accelerometerBatch;
- (NSArray)deviceMotionBatch;
- (NSInteger)accelerometerDataFrequency;
- (NSInteger)deviceMotionDataFrequency;
- (void)dealloc;
- (void)startAccelerometerUpdates;
- (void)startAccelerometerUpdatesWithHandler:(void *)handler;
- (void)startDeviceMotionUpdates;
- (void)startDeviceMotionUpdatesWithHandler:(void *)handler;
- (void)stopAccelerometerUpdates;
- (void)stopDeviceMotionUpdates;
@end

@implementation CMBatchedSensorManager

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

- (CMBatchedSensorManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMBatchedSensorManager;
  uint64_t v2 = [(CMBatchedSensorManager *)&v4 init];
  if (v2) {
    v2->_internal = (CMBatchedSensorManagerInternal *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  internal = (dispatch_queue_t *)self->_internal;
  dispatch_queue_set_specific(internal[2], &unk_1E929E968, &unk_1E929E968, 0);
  if (dispatch_get_specific(&unk_1E929E968) == &unk_1E929E968)
  {
    objc_msgSend__teardown(internal, v4, v5);
  }
  else
  {
    v6 = internal[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1905D39B4;
    block[3] = &unk_1E568D118;
    block[4] = internal;
    dispatch_sync(v6, block);
  }

  v7.receiver = self;
  v7.super_class = (Class)CMBatchedSensorManager;
  [(CMBatchedSensorManager *)&v7 dealloc];
}

+ (BOOL)isAccelerometerSupported
{
  return objc_msgSend_areBatchedSensorsSupported(CMBatchedSensorManagerInternal, a2, v2);
}

- (BOOL)isAccelerometerActive
{
  return self->_internal->_accelActive;
}

- (NSInteger)accelerometerDataFrequency
{
  return 800;
}

- (void)startAccelerometerUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1905D3A54;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)startAccelerometerUpdatesWithHandler:(void *)handler
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1905D3B50;
  v3[3] = &unk_1E568D2F8;
  v3[4] = self;
  v3[5] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (void)stopAccelerometerUpdates
{
  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905D3C50;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSArray)accelerometerBatch
{
  return (NSArray *)((uint64_t (*)(CMBatchedSensorManagerInternal *, char *))MEMORY[0x1F4181798])(self->_internal, sel_accelBatch);
}

+ (BOOL)isDeviceMotionSupported
{
  return objc_msgSend_areBatchedSensorsSupported(CMBatchedSensorManagerInternal, a2, v2);
}

- (BOOL)isDeviceMotionActive
{
  return self->_internal->_deviceMotionActive;
}

- (NSInteger)deviceMotionDataFrequency
{
  return 200;
}

- (void)startDeviceMotionUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1905D3CFC;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)startDeviceMotionUpdatesWithHandler:(void *)handler
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1905D3DF8;
  v3[3] = &unk_1E568D2F8;
  v3[4] = self;
  v3[5] = handler;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v3);
}

- (void)stopDeviceMotionUpdates
{
  queue = self->_internal->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905D3EF8;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSArray)deviceMotionBatch
{
  return (NSArray *)((uint64_t (*)(CMBatchedSensorManagerInternal *, char *))MEMORY[0x1F4181798])(self->_internal, sel_deviceMotionBatch);
}

@end
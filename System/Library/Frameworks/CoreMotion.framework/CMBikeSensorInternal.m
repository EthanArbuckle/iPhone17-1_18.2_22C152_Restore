@interface CMBikeSensorInternal
- (CMBikeSensorInternal)init;
- (void)_feedBikeSensorData:(id)a3;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMBikeSensorInternal

- (CMBikeSensorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMBikeSensorInternal;
  v2 = [(CMBikeSensorInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMBikeSensor", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  v3.receiver = self;
  v3.super_class = (Class)CMBikeSensorInternal;
  [(CMBikeSensorInternal *)&v3 dealloc];
}

- (void)_teardown
{
  fLocationdConnection = self->fLocationdConnection;
  if (fLocationdConnection)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](fLocationdConnection, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_feedBikeSensorData:(id)a3
{
  if (!a3)
  {
    v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CMBikeSensor.mm", 78, @"Invalid parameter not satisfying: %@", @"bikeSensorData");
  }
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905272B0;
  block[3] = &unk_1E568D190;
  block[4] = a3;
  block[5] = self;
  dispatch_async(fInternalQueue, block);
}

@end
@interface CMHealthTrackerInternal
- (CMHealthTrackerInternal)init;
- (void)_queryMetMinutesFromDate:(id)a3 toDate:(id)a4 handler:(id)a5;
- (void)_queryVO2MaxInputsFromRecord:(id)a3 handler:(id)a4;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMHealthTrackerInternal

- (CMHealthTrackerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMHealthTrackerInternal;
  v2 = [(CMHealthTrackerInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMHealthTracker.InternalQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fInternalQueue);
  self->fInternalQueue = 0;
  dispatch_release((dispatch_object_t)self->fAppQueue);
  self->fAppQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMHealthTrackerInternal;
  [(CMHealthTrackerInternal *)&v3 dealloc];
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

- (void)_queryMetMinutesFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  fInternalQueue = self->fInternalQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19050DF48;
  v6[3] = &unk_1E568E708;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(fInternalQueue, v6);
}

- (void)_queryVO2MaxInputsFromRecord:(id)a3 handler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19050E6E4;
  block[3] = &unk_1E568D410;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

@end
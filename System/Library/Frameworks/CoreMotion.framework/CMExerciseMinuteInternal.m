@interface CMExerciseMinuteInternal
- (CMExerciseMinuteInternal)init;
- (void)_queryExerciseMinutesFromRecord:(id)a3 handler:(id)a4;
- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)_startUpdatesWithHandler:(id)a3;
- (void)_stopUpdates;
- (void)_teardown;
- (void)dealloc;
@end

@implementation CMExerciseMinuteInternal

- (CMExerciseMinuteInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMExerciseMinuteInternal;
  v2 = [(CMExerciseMinuteInternal *)&v4 init];
  if (v2)
  {
    v2->fInternalQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMExerciseMinute.InternalQueue", 0);
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
  v3.super_class = (Class)CMExerciseMinuteInternal;
  [(CMExerciseMinuteInternal *)&v3 dealloc];
}

- (void)_teardown
{
  self->fHandler = 0;
  self->fMostRecentRecord = 0;
  sub_1902C3F54(&__p, "kCLConnectionMessageExerciseMinuteUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
}

- (void)_startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  objc_msgSend__queryExerciseMinutesFromRecord_handler_(self, a2, (uint64_t)a3);
  objc_msgSend__startUpdatesWithHandler_(self, v7, (uint64_t)a4);

  self->fMostRecentRecord = 0;
  self->fMostRecentRecord = (CMExerciseMinuteData *)a3;
}

- (void)_stopUpdates
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904D9994;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);
}

- (void)_startUpdatesWithHandler:(id)a3
{
  fInternalQueue = self->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904D9CF0;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

- (void)_queryExerciseMinutesFromRecord:(id)a3 handler:(id)a4
{
  fInternalQueue = self->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904DA4A4;
  block[3] = &unk_1E568D410;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

@end
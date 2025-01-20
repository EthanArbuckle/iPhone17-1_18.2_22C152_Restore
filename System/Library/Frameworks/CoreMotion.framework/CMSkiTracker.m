@interface CMSkiTracker
+ (BOOL)isAvailable;
- (CMSkiTracker)init;
- (CMSkiTrackerInternal)_internal;
- (void)dealloc;
- (void)querySkiUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)startLiveUpdatesWithHandler:(id)a3;
- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)stopLiveUpdates;
- (void)stopUpdates;
@end

@implementation CMSkiTracker

- (CMSkiTracker)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSkiTracker;
  v2 = [(CMSkiTracker *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMSkiTrackerInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905864F0;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMSkiTracker;
  [(CMSkiTracker *)&v5 dealloc];
}

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMSkiTracker.mm", 377, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905865F4;
  v10[3] = &unk_1E568D398;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10);
}

- (void)stopUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1905866A8;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)querySkiUpdatesFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMSkiTracker.mm", 394, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1EB3BF608 != -1) {
    dispatch_once(&qword_1EB3BF608, &unk_1EDFD3E00);
  }
  if (qword_1EB3BF600 == 3)
  {
    uint64_t v6 = objc_msgSend__internal(self, a2, (uint64_t)a3);
    MEMORY[0x1F4181798](v6, sel__queryUpdatesFromRecord_handler_, a3);
  }
}

- (void)startLiveUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMSkiTracker.mm", 408, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905868BC;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)stopLiveUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_190586970;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (CMSkiTrackerInternal)_internal
{
  return self->_internal;
}

@end
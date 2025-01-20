@interface CMSleepTracker
+ (BOOL)isAvailable;
- (BOOL)isTracking;
- (CMSleepTracker)init;
- (CMSpringTrackerInternal)_internal;
- (void)dealloc;
- (void)querySleepDataFromRecord:(id)a3 handler:(id)a4;
- (void)startWithHandler:(id)a3;
- (void)stopWithHandler:(id)a3;
@end

@implementation CMSleepTracker

- (CMSleepTracker)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSleepTracker;
  v2 = [(CMSleepTracker *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMSpringTrackerInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904BE154;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMSleepTracker;
  [(CMSleepTracker *)&v5 dealloc];
}

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (BOOL)isTracking
{
  uint64_t v3 = objc_msgSend__internal(self, a2, v2);

  return MEMORY[0x1F4181798](v3, sel__isTracking, v4);
}

- (void)startWithHandler:(id)a3
{
  if (!a3)
  {
    v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMSleepTracker.mm", 261, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904BE278;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)stopWithHandler:(id)a3
{
  if (!a3)
  {
    v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMSleepTracker.mm", 270, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904BE384;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)querySleepDataFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMSleepTracker.mm", 279, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904BE498;
  v10[3] = &unk_1E568D398;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10);
}

- (CMSpringTrackerInternal)_internal
{
  return self->_internal;
}

@end
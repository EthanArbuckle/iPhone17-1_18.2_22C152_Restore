@interface CMSwimTracker
+ (BOOL)isAvailable;
+ (unint64_t)maxSwimDataEntries;
- (CMSwimTracker)init;
- (CMSwimTrackerInternal)_internal;
- (void)dealloc;
- (void)querySWOLFSummaryWithSessionID:(id)a3 handler:(id)a4;
- (void)querySwimUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)stopUpdates;
@end

@implementation CMSwimTracker

- (CMSwimTracker)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMSwimTracker;
  v2 = [(CMSwimTracker *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMSwimTrackerInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905CCBB4;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMSwimTracker;
  [(CMSwimTracker *)&v5 dealloc];
}

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

+ (unint64_t)maxSwimDataEntries
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CMSwimData, sel_maxSwimDataEntries);
}

- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMSwimTracker.mm", 401, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905CCCC4;
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
  v2[2] = sub_1905CCD78;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)querySwimUpdatesFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMSwimTracker.mm", 418, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1EB3BF778 != -1) {
    dispatch_once(&qword_1EB3BF778, &unk_1EDFD2B00);
  }
  if (qword_1EB3BF770 == 3)
  {
    uint64_t v6 = objc_msgSend__internal(self, a2, (uint64_t)a3);
    MEMORY[0x1F4181798](v6, sel__querySwimUpdatesFromRecord_handler_, a3);
  }
}

- (void)querySWOLFSummaryWithSessionID:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMSwimTracker.mm", 432, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1EB3BF788 != -1) {
    dispatch_once(&qword_1EB3BF788, &unk_1EDFD3E60);
  }
  if (qword_1EB3BF780 == 3)
  {
    uint64_t v6 = objc_msgSend__internal(self, a2, (uint64_t)a3);
    MEMORY[0x1F4181798](v6, sel__querySWOLFSummaryWithSessionID_handler_, a3);
  }
}

- (CMSwimTrackerInternal)_internal
{
  return self->_internal;
}

@end
@interface CMHealthTracker
+ (BOOL)isMetMinutesAvailable;
+ (BOOL)isVO2MaxDataAvailable;
+ (int64_t)isAuthorizedForMetMinutes;
+ (int64_t)isAuthorizedForVO2MaxData;
- (CMHealthTracker)init;
- (CMHealthTrackerInternal)_internal;
- (void)dealloc;
- (void)queryMetMinutesFromDate:(id)a3 toDate:(id)a4 handler:(id)a5;
- (void)queryVO2MaxInputsFromRecord:(id)a3 handler:(id)a4;
@end

@implementation CMHealthTracker

- (CMHealthTracker)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMHealthTracker;
  v2 = [(CMHealthTracker *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMHealthTrackerInternal);
  }
  return v2;
}

- (void)dealloc
{
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19050EEE0;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMHealthTracker;
  [(CMHealthTracker *)&v4 dealloc];
}

+ (BOOL)isMetMinutesAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

+ (int64_t)isAuthorizedForMetMinutes
{
  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, @"com.apple.locationd.metminutes");
}

- (void)queryMetMinutesFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMHealthTracker.mm", 221, @"Invalid parameter not satisfying: %@", @"toDate");
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMHealthTracker.mm", 220, @"Invalid parameter not satisfying: %@", @"fromDate");
  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CMHealthTracker.mm", 222, @"Invalid parameter not satisfying: %@", @"handler");
LABEL_4:
  uint64_t v10 = objc_msgSend__internal(self, a2, (uint64_t)a3);

  MEMORY[0x1F4181798](v10, sel__queryMetMinutesFromDate_toDate_handler_, a3);
}

+ (BOOL)isVO2MaxDataAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

+ (int64_t)isAuthorizedForVO2MaxData
{
  return objc_msgSend_isAuthorizedForEntitlement_(CMMotionUtils, a2, @"com.apple.locationd.vo2max");
}

- (void)queryVO2MaxInputsFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMHealthTracker.mm", 244, @"Invalid parameter not satisfying: %@", @"handler");
  }
  uint64_t v6 = objc_msgSend__internal(self, a2, (uint64_t)a3);

  MEMORY[0x1F4181798](v6, sel__queryVO2MaxInputsFromRecord_handler_, a3);
}

- (CMHealthTrackerInternal)_internal
{
  return self->_internal;
}

@end
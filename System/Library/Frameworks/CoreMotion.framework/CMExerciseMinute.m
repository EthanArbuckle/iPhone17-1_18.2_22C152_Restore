@interface CMExerciseMinute
+ (BOOL)isExerciseMinuteAvailable;
+ (id)maxExerciseMinuteDataEntries;
- (CMExerciseMinute)init;
- (CMExerciseMinuteInternal)_internal;
- (void)dealloc;
- (void)queryExerciseMinutesFromRecord:(id)a3 handler:(id)a4;
- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4;
- (void)startUpdatesWithHandler:(id)a3;
- (void)stopUpdates;
@end

@implementation CMExerciseMinute

- (CMExerciseMinute)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMExerciseMinute;
  v2 = [(CMExerciseMinute *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMExerciseMinuteInternal);
  }
  return v2;
}

- (void)dealloc
{
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904DACDC;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMExerciseMinute;
  [(CMExerciseMinute *)&v4 dealloc];
}

+ (BOOL)isExerciseMinuteAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  sub_1902BAD40();

  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageNatalimetryAvailable");
}

+ (id)maxExerciseMinuteDataEntries
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CMExerciseMinuteData, sel_maxExerciseMinuteDataEntries);
}

- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMExerciseMinute.mm", 277, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904DAE18;
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
  v2[2] = sub_1904DAECC;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)startUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMExerciseMinute.mm", 293, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904DAFC8;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)queryExerciseMinutesFromRecord:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMExerciseMinute.mm", 301, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1EB3BF278 != -1) {
    dispatch_once(&qword_1EB3BF278, &unk_1EDFD3BC0);
  }
  if (qword_1EB3BF270 == 3)
  {
    v7 = objc_msgSend__internal(self, a2, (uint64_t)a3);
    objc_msgSend__queryExerciseMinutesFromRecord_handler_(v7, v8, (uint64_t)a3, a4);
  }
}

- (CMExerciseMinuteInternal)_internal
{
  return self->_internal;
}

@end
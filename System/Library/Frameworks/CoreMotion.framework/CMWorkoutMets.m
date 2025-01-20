@interface CMWorkoutMets
+ (BOOL)isAvailable;
- (CMWorkoutMets)init;
- (CMWorkoutMetsInternal)_internal;
- (void)dealloc;
- (void)queryWorkoutMetsWithSessionId:(id)a3 handler:(id)a4;
@end

@implementation CMWorkoutMets

- (CMWorkoutMets)init
{
  if (!objc_msgSend_isAvailable(CMWorkoutMets, a2, v2)) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CMWorkoutMets;
  v4 = [(CMWorkoutMets *)&v6 init];
  if (v4) {
    v4->_internal = objc_alloc_init(CMWorkoutMetsInternal);
  }
  return v4;
}

- (void)dealloc
{
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19058E5BC;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMWorkoutMets;
  [(CMWorkoutMets *)&v4 dealloc];
}

+ (BOOL)isAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  sub_1902BAD40();
  sub_1902BAD40();
  if (sub_19046BC40()) {
    return 1;
  }

  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageNatalimetryAvailable");
}

- (void)queryWorkoutMetsWithSessionId:(id)a3 handler:(id)a4
{
  if (!a4)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutMets.mm", 165, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1EB3BF628 != -1) {
    dispatch_once(&qword_1EB3BF628, &unk_1EDFD3900);
  }
  if (qword_1EB3BF620 == 3)
  {
    uint64_t v6 = objc_msgSend__internal(self, a2, (uint64_t)a3);
    MEMORY[0x1F4181798](v6, sel__queryWorkoutMetsWithSessionId_handler_, a3);
  }
}

- (CMWorkoutMetsInternal)_internal
{
  return self->_internal;
}

@end
@interface CMWorkoutManager
+ (BOOL)isAvailable;
+ (unint64_t)supportedMetricsForWorkoutType:(int64_t)a3;
- (CMWorkoutManager)init;
- (CMWorkoutManagerDelegate)delegate;
- (CMWorkoutManagerInternal)_internal;
- (void)beginWorkoutSession:(id)a3 withWorkout:(id)a4 enableWorkoutChangeDetection:(BOOL)a5;
- (void)dealloc;
- (void)endWorkoutSession:(id)a3;
- (void)getPromptsNeededForWorkoutType:(int64_t)a3 handler:(id)a4;
- (void)muteReminderType:(int64_t)a3 mute:(BOOL)a4;
- (void)pauseWorkout:(id)a3;
- (void)resumeWorkout:(id)a3;
- (void)setCurrentWorkoutType:(id)a3 isManualTransition:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setSuggestedStopTimeout:(double)a3;
- (void)snapshotWithCompletion:(id)a3;
- (void)startWorkout:(id)a3;
- (void)stopWorkout:(id)a3;
- (void)triggerWorkoutLocationUpdateForTesting:(int64_t)a3;
- (void)userDismissedWorkoutAlert;
@end

@implementation CMWorkoutManager

- (CMWorkoutManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMWorkoutManager;
  v2 = [(CMWorkoutManager *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMWorkoutManagerInternal);
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F3DB8;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_sync(fInternalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CMWorkoutManager;
  [(CMWorkoutManager *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  internal = self->_internal;
  internal->fDelegate = (CMWorkoutManagerDelegate *)a3;
  internal->fSender = self;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F3E38;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_async(fInternalQueue, block);
}

- (CMWorkoutManagerDelegate)delegate
{
  return self->_internal->fDelegate;
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

- (void)startWorkout:(id)a3
{
  if (!a3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutManager.mm", 782, @"Invalid parameter not satisfying: %@", @"workout");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F3F7C;
  block[3] = &unk_1E568D190;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)stopWorkout:(id)a3
{
  if (!a3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutManager.mm", 791, @"Invalid parameter not satisfying: %@", @"workout");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4058;
  block[3] = &unk_1E568D190;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

+ (unint64_t)supportedMetricsForWorkoutType:(int64_t)a3
{
  unint64_t v4 = 0;
  switch(a3)
  {
    case 1:
    case 2:
    case 15:
    case 16:
    case 17:
    case 18:
    case 24:
    case 27:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 49:
      if (objc_msgSend_isPaceAvailable(CMPedometer, a2, a3)) {
        unint64_t v4 = 7;
      }
      else {
        unint64_t v4 = 3;
      }
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 22:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 40:
    case 47:
    case 48:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
      unint64_t v4 = 1;
      break;
    case 4:
    case 20:
    case 21:
    case 23:
    case 35:
    case 36:
    case 37:
    case 38:
      unint64_t v4 = 7;
      break;
    case 19:
      unint64_t v4 = 15;
      break;
    default:
      break;
  }
  if (sub_190520D28(a3) != 66)
  {
    sub_1902BAD40();
    if (sub_19046CD44()) {
      v4 |= 0x10uLL;
    }
  }
  return v4;
}

- (void)getPromptsNeededForWorkoutType:(int64_t)a3 handler:(id)a4
{
  if (!a4)
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CMWorkoutManager.mm", 901, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if ((unint64_t)(a3 - 66) <= 0xFFFFFFFFFFFFFFBELL)
  {
    v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMWorkoutManager.mm", 902, @"Invalid parameter not satisfying: %@", @"workoutType > kCMWorkoutTypeNoWorkout && workoutType < kCMWorkoutTypeMax");
  }
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4334;
  block[3] = &unk_1E568E590;
  void block[5] = a4;
  void block[6] = a3;
  block[4] = self;
  dispatch_async(fInternalQueue, block);
}

- (void)setSuggestedStopTimeout:(double)a3
{
  if (a3 <= 0.0)
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, @"CMWorkoutManager.mm", 911, @"Invalid parameter not satisfying: %@", @"seconds > 0");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4448;
  block[3] = &unk_1E568DB10;
  block[4] = internal;
  *(double *)&void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)userDismissedWorkoutAlert
{
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F44CC;
  block[3] = &unk_1E568D118;
  block[4] = internal;
  dispatch_async(fInternalQueue, block);
}

- (void)triggerWorkoutLocationUpdateForTesting:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutManager.mm", 928, @"Invalid parameter not satisfying: %@", @"workoutLocation >= kCMWorkoutLocationTypeUnknown && workoutLocation < kCMWorkoutLocationTypeTbd");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F45A8;
  block[3] = &unk_1E568DB10;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)muteReminderType:(int64_t)a3 mute:(BOOL)a4
{
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4630;
  block[3] = &unk_1E568E898;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(fInternalQueue, block);
}

- (CMWorkoutManagerInternal)_internal
{
  return self->_internal;
}

- (void)beginWorkoutSession:(id)a3 withWorkout:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  if (!a3)
  {
    v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CMWorkoutManager.mm", 948, @"Invalid parameter not satisfying: %@", @"overview");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMWorkoutManager.mm", 949, @"Invalid parameter not satisfying: %@", @"workout");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4774;
  block[3] = &unk_1E56905C8;
  block[4] = internal;
  void block[5] = a3;
  void block[6] = a4;
  BOOL v17 = a5;
  dispatch_async(fInternalQueue, block);
}

- (void)setCurrentWorkoutType:(id)a3 isManualTransition:(BOOL)a4
{
  if (!a3)
  {
    v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMWorkoutManager.mm", 958, @"Invalid parameter not satisfying: %@", @"workout");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4860;
  block[3] = &unk_1E568F468;
  block[4] = internal;
  void block[5] = a3;
  BOOL v13 = a4;
  dispatch_async(fInternalQueue, block);
}

- (void)endWorkoutSession:(id)a3
{
  if (!a3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutManager.mm", 967, @"Invalid parameter not satisfying: %@", @"workout");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4940;
  block[3] = &unk_1E568D190;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)pauseWorkout:(id)a3
{
  if (!a3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutManager.mm", 976, @"Invalid parameter not satisfying: %@", @"workout");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4A1C;
  block[3] = &unk_1E568D190;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)resumeWorkout:(id)a3
{
  if (!a3)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMWorkoutManager.mm", 985, @"Invalid parameter not satisfying: %@", @"workout");
  }
  internal = self->_internal;
  fInternalQueue = internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1905F4AF8;
  block[3] = &unk_1E568D190;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(fInternalQueue, block);
}

- (void)snapshotWithCompletion:(id)a3
{
  fInternalQueue = self->_internal->fInternalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1905F4B7C;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fInternalQueue, v4);
}

@end
@interface CMGenericWorkout
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)genericWorkoutInstance:(id)a3;
- (CMGenericWorkout)initWithCoder:(id)a3;
- (CMGenericWorkout)initWithSessionId:(id)a3 workoutLabel:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)workoutLabel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMGenericWorkout

+ (BOOL)isAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_isAvailable(CMWorkout, v2, v3);
}

- (CMGenericWorkout)initWithSessionId:(id)a3 workoutLabel:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CMGenericWorkout;
  result = [(CMWorkout *)&v6 initWithSessionId:a3 type:14];
  if (result) {
    result->fWorkoutLabel = a4;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMGenericWorkout;
  [(CMWorkout *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMGenericWorkout)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMGenericWorkout;
  v5 = -[CMWorkout initWithCoder:](&v8, sel_initWithCoder_);
  if (v5
    && objc_msgSend_containsValueForKey_(a3, v4, @"kCMWorkoutDataCodingKeyWorkoutLabel"))
  {
    v5->fWorkoutLabel = objc_msgSend_decodeIntegerForKey_(a3, v6, @"kCMWorkoutDataCodingKeyWorkoutLabel");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_sessionId(self, v8, v9);
  uint64_t v13 = objc_msgSend_workoutLabel(self, v11, v12);
  v15 = objc_msgSend_initWithSessionId_workoutLabel_(v7, v14, v10, v13);
  uint64_t v18 = objc_msgSend_appId(self, v16, v17);
  objc_msgSend_setAppId_(v15, v19, v18);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMGenericWorkout;
  -[CMWorkout encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fWorkoutLabel, @"kCMWorkoutDataCodingKeyWorkoutLabel");
}

- (unint64_t)workoutLabel
{
  return self->fWorkoutLabel;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_sessionId(self, v6, v7);
  uint64_t v11 = objc_msgSend_workoutLabel(self, v9, v10);
  return (id)objc_msgSend_stringWithFormat_(v3, v12, @"%@, <sessionId %@, label, %lu>", v5, v8, v11);
}

+ (id)genericWorkoutInstance:(id)a3
{
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(a3, v5, v4)) {
    return a3;
  }
  else {
    return 0;
  }
}

@end
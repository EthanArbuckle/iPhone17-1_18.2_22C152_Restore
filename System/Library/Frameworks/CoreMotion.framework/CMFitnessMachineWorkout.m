@interface CMFitnessMachineWorkout
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)fitnessMachineWorkoutInstance:(id)a3;
- (CMFitnessMachineWorkout)initWithCoder:(id)a3;
- (CMFitnessMachineWorkout)initWithSessionId:(id)a3 workoutType:(int64_t)a4 manufacturerName:(id)a5 model:(id)a6;
- (NSString)manufacturerName;
- (NSString)model;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMFitnessMachineWorkout

+ (BOOL)isAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_isAvailable(CMWorkout, v2, v3);
}

- (CMFitnessMachineWorkout)initWithSessionId:(id)a3 workoutType:(int64_t)a4 manufacturerName:(id)a5 model:(id)a6
{
  if ((unint64_t)a4 > 0x12 || ((1 << a4) & 0x51A20) == 0)
  {
    v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CMWorkout.mm", 1067, @"Invalid parameter not satisfying: %@", @"workoutType == kCMWorkoutTypeIndoorRunning || workoutType == kCMWorkoutTypeIndoorWalking || workoutType == kCMWorkoutTypeIndoorCycling || workoutType == kCMWorkoutTypeElliptical || workoutType == kCMWorkoutTypeStairClimbing || workoutType == kCMWorkoutTypeRowing");
  }
  v20.receiver = self;
  v20.super_class = (Class)CMFitnessMachineWorkout;
  v14 = [(CMWorkout *)&v20 initWithSessionId:a3 type:a4];
  if (v14)
  {
    v14->fManufacturerName = (NSString *)objc_msgSend_copy(a5, v12, v13);
    v14->fModel = (NSString *)objc_msgSend_copy(a6, v15, v16);
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMFitnessMachineWorkout;
  [(CMWorkout *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFitnessMachineWorkout)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMFitnessMachineWorkout;
  v4 = -[CMWorkout initWithCoder:](&v16, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMWorkoutDataCodingKeyFitnessMachineManufacturerName");
    v4->fManufacturerName = (NSString *)objc_msgSend_copy(v7, v8, v9);
    uint64_t v10 = objc_opt_class();
    v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kCMFitnessMachineWorkoutDataCodingKeyModel");
    v4->fModel = (NSString *)objc_msgSend_copy(v12, v13, v14);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_sessionId(self, v8, v9);
  uint64_t v13 = objc_msgSend_type(self, v11, v12);
  v15 = objc_msgSend_initWithSessionId_workoutType_manufacturerName_model_(v7, v14, v10, v13, self->fManufacturerName, self->fModel);
  uint64_t v18 = objc_msgSend_appId(self, v16, v17);
  objc_msgSend_setAppId_(v15, v19, v18);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMFitnessMachineWorkout;
  -[CMWorkout encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fManufacturerName, @"kCMWorkoutDataCodingKeyFitnessMachineManufacturerName");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fModel, @"kCMFitnessMachineWorkoutDataCodingKeyModel");
}

- (NSString)manufacturerName
{
  return self->fManufacturerName;
}

- (NSString)model
{
  return self->fModel;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_sessionId(self, v6, v7);
  uint64_t v11 = objc_msgSend_type(self, v9, v10);
  uint64_t v13 = objc_msgSend_workoutName_(CMWorkout, v12, v11);
  uint64_t v16 = objc_msgSend_manufacturerName(self, v14, v15);
  uint64_t v19 = objc_msgSend_model(self, v17, v18);
  return (id)objc_msgSend_stringWithFormat_(v3, v20, @"%@, <sessionId %@, type, %@, manufacturerName, %@, model, %@>", v5, v8, v13, v16, v19);
}

+ (id)fitnessMachineWorkoutInstance:(id)a3
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
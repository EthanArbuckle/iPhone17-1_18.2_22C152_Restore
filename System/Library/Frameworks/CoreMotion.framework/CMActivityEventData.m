@interface CMActivityEventData
+ (BOOL)supportsSecureCoding;
+ (id)actionName:(int64_t)a3;
+ (id)eventTypeName:(int64_t)a3;
+ (id)reasonName:(int64_t)a3;
- (CMActivityEventData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMActivityEventData)initWithCoder:(id)a3;
- (CMActivityEventData)initWithStartDate:(id)a3 eventType:(int64_t)a4 action:(int64_t)a5 reason:(int64_t)a6 workoutType:(int64_t)a7;
- (NSDate)startDate;
- (NSString)description;
- (double)heartRateRecoveryEndTime;
- (double)heartRateRecoveryStartTime;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (int64_t)action;
- (int64_t)eventType;
- (int64_t)reason;
- (int64_t)workoutType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setHeartRateRecoveryEndTime:(double)a3;
- (void)setHeartRateRecoveryStartTime:(double)a3;
@end

@implementation CMActivityEventData

- (CMActivityEventData)initWithStartDate:(id)a3 eventType:(int64_t)a4 action:(int64_t)a5 reason:(int64_t)a6 workoutType:(int64_t)a7
{
  v19.receiver = self;
  v19.super_class = (Class)CMActivityEventData;
  v12 = [(CMActivityEventData *)&v19 init];
  if (v12)
  {
    v12->_startDate = (NSDate *)a3;
    v12->_eventType = a4;
    v12->_action = a5;
    v12->_reason = a6;
    v12->_workoutType = a7;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v12->_heartRateRecoveryStartTime = _Q0;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMActivityEventData;
  [(CMActivityEventData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_initWithStartDate_eventType_action_reason_workoutType_(v7, v8, (uint64_t)self->_startDate, self->_eventType, self->_action, self->_reason, self->_workoutType);
  if (result)
  {
    *((void *)result + 6) = *(void *)&self->_heartRateRecoveryStartTime;
    *((void *)result + 7) = *(void *)&self->_heartRateRecoveryEndTime;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMActivityEventData)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMActivityEventData;
  v4 = [(CMActivityEventData *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCCMActivityEventDataCodingKeyStartDate");
    v4->_eventType = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMActivityEventDataCodingKeyEventType");
    v4->_action = objc_msgSend_decodeIntegerForKey_(a3, v8, @"kCMActivityEventDataCodingKeyAction");
    v4->_reason = objc_msgSend_decodeIntegerForKey_(a3, v9, @"kCMActivityEventDataCodingKeyReason");
    v4->_workoutType = objc_msgSend_decodeIntegerForKey_(a3, v10, @"kCMActivityEventDataCodingKeyWorkoutType");
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMActivityEventDataCodingKeyRecoveryStart");
    v4->_heartRateRecoveryStartTime = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, @"kCMActivityEventDataCodingKeyRecoveryEnd");
    v4->_heartRateRecoveryEndTime = v14;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_startDate, @"kCCMActivityEventDataCodingKeyStartDate");
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_eventType, @"kCMActivityEventDataCodingKeyEventType");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_action, @"kCMActivityEventDataCodingKeyAction");
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_reason, @"kCMActivityEventDataCodingKeyReason");
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_workoutType, @"kCMActivityEventDataCodingKeyWorkoutType");
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMActivityEventDataCodingKeyRecoveryStart", self->_heartRateRecoveryStartTime);
  double heartRateRecoveryEndTime = self->_heartRateRecoveryEndTime;

  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMActivityEventDataCodingKeyRecoveryEnd", heartRateRecoveryEndTime);
}

+ (id)eventTypeName:(int64_t)a3
{
  objc_super v3 = @"WorkoutPrediction";
  if (a3 != 1) {
    objc_super v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"BackgroundEscalation";
  }
}

+ (id)actionName:(int64_t)a3
{
  objc_super v3 = @"Stop";
  if (a3 != 1) {
    objc_super v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Start";
  }
}

+ (id)reasonName:(int64_t)a3
{
  if ((unint64_t)a3 > 0x16) {
    return 0;
  }
  else {
    return off_1E5690320[a3];
  }
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  startDate = self->_startDate;
  uint64_t v8 = objc_msgSend_eventTypeName_(CMActivityEventData, v7, self->_eventType);
  uint64_t v10 = objc_msgSend_actionName_(CMActivityEventData, v9, self->_action);
  uint64_t v12 = objc_msgSend_reasonName_(CMActivityEventData, v11, self->_reason);
  uint64_t v14 = objc_msgSend_workoutName_(CMWorkout, v13, self->_workoutType);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v15, @"%@, startDate %@, eventType %@, action %@, reason %@, workoutType %@, recoveryStart %f, recoveryEnd %f>", v5, startDate, v8, v10, v12, v14, *(void *)&self->_heartRateRecoveryStartTime, *(void *)&self->_heartRateRecoveryEndTime);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)action
{
  return self->_action;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)workoutType
{
  return self->_workoutType;
}

- (double)heartRateRecoveryStartTime
{
  return self->_heartRateRecoveryStartTime;
}

- (void)setHeartRateRecoveryStartTime:(double)a3
{
  self->_heartRateRecoveryStartTime = a3;
}

- (double)heartRateRecoveryEndTime
{
  return self->_heartRateRecoveryEndTime;
}

- (void)setHeartRateRecoveryEndTime:(double)a3
{
  self->_double heartRateRecoveryEndTime = a3;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMActivityEventData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMActivityEventData;
    v7 = [(CMActivityEventData *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        uint64_t v12 = (void *)v11;

        return (CMActivityEventData *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (id)sr_dictionaryRepresentation
{
  v43[7] = *MEMORY[0x1E4F143B8];
  v42[0] = @"startTime";
  v4 = NSNumber;
  started = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v6, v7);
  v43[0] = objc_msgSend_numberWithDouble_(v4, v8, v9);
  v42[1] = @"eventType";
  uint64_t v10 = NSNumber;
  uint64_t v13 = objc_msgSend_eventType(self, v11, v12);
  v43[1] = objc_msgSend_numberWithInteger_(v10, v14, v13);
  v42[2] = @"action";
  v15 = NSNumber;
  uint64_t v18 = objc_msgSend_action(self, v16, v17);
  v43[2] = objc_msgSend_numberWithInteger_(v15, v19, v18);
  v42[3] = @"reason";
  v20 = NSNumber;
  uint64_t v23 = objc_msgSend_reason(self, v21, v22);
  v43[3] = objc_msgSend_numberWithInteger_(v20, v24, v23);
  v42[4] = @"workoutType";
  v25 = NSNumber;
  uint64_t v28 = objc_msgSend_workoutType(self, v26, v27);
  v43[4] = objc_msgSend_numberWithInteger_(v25, v29, v28);
  v42[5] = @"recoveryStart";
  v30 = NSNumber;
  objc_msgSend_heartRateRecoveryStartTime(self, v31, v32);
  v43[5] = objc_msgSend_numberWithDouble_(v30, v33, v34);
  v42[6] = @"recoveryEnd";
  v35 = NSNumber;
  objc_msgSend_heartRateRecoveryEndTime(self, v36, v37);
  v43[6] = objc_msgSend_numberWithDouble_(v35, v38, v39);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v43, v42, 7);
}

@end
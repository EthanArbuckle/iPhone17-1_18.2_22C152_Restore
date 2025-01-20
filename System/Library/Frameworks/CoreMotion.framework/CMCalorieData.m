@interface CMCalorieData
+ (BOOL)supportsSecureCoding;
- (CMCalorieData)initWithCoder:(id)a3;
- (CMCalorieData)initWithWorkoutType:(int64_t)a3 duration:(double)a4 mets:(double)a5 basalMets:(double)a6 totalCalories:(double)a7 basalCalories:(double)a8;
- (NSNumber)basalCalories;
- (NSNumber)basalMets;
- (NSNumber)mets;
- (NSNumber)totalCalories;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)workoutType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMCalorieData

- (CMCalorieData)initWithWorkoutType:(int64_t)a3 duration:(double)a4 mets:(double)a5 basalMets:(double)a6 totalCalories:(double)a7 basalCalories:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CMCalorieData;
  result = [(CMCalorieData *)&v15 init];
  if (result)
  {
    result->fWorkoutType = a3;
    result->fDuration = a4;
    result->fMets = a5;
    result->fBasalMets = a6;
    result->fTotalCalories = a7;
    result->fBasalCalories = a8;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMCalorieData;
  [(CMCalorieData *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCalorieData)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CMCalorieData;
  v5 = [(CMCalorieData *)&v17 init];
  if (v5)
  {
    v5->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCalorieDataCodingKeyWorkoutType");
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCalorieDataCodingKeyDuration");
    v5->fDuration = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCalorieDataCodingKeyMets");
    v5->fMets = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, @"kCalorieDataCodingKeyBasalMets");
    v5->fBasalMets = v11;
    objc_msgSend_decodeDoubleForKey_(a3, v12, @"kCalorieDataCodingKeyTotalCalories");
    v5->fTotalCalories = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v14, @"kCalorieDataCodingKeyBasalCalories");
    v5->fBasalCalories = v15;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  double v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  int64_t fWorkoutType = self->fWorkoutType;
  double fDuration = self->fDuration;
  double fMets = self->fMets;
  double fBasalMets = self->fBasalMets;
  double fTotalCalories = self->fTotalCalories;
  double fBasalCalories = self->fBasalCalories;

  return (id)objc_msgSend_initWithWorkoutType_duration_mets_basalMets_totalCalories_basalCalories_(v7, v8, fWorkoutType, fDuration, fMets, fBasalMets, fTotalCalories, fBasalCalories);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fWorkoutType, @"kCalorieDataCodingKeyWorkoutType");
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCalorieDataCodingKeyDuration", self->fDuration);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCalorieDataCodingKeyMets", self->fMets);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCalorieDataCodingKeyBasalMets", self->fBasalMets);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCalorieDataCodingKeyTotalCalories", self->fTotalCalories);
  double fBasalCalories = self->fBasalCalories;

  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCalorieDataCodingKeyBasalCalories", fBasalCalories);
}

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (double)duration
{
  return self->fDuration;
}

- (NSNumber)mets
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fMets);
}

- (NSNumber)basalMets
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fBasalMets);
}

- (NSNumber)totalCalories
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fTotalCalories);
}

- (NSNumber)basalCalories
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fBasalCalories);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v7 = objc_msgSend_workoutName_(CMWorkout, v6, self->fWorkoutType);
  objc_msgSend_duration(self, v8, v9);
  uint64_t v11 = v10;
  v14 = objc_msgSend_mets(self, v12, v13);
  uint64_t v17 = objc_msgSend_stringValue(v14, v15, v16);
  v20 = objc_msgSend_basalMets(self, v18, v19);
  uint64_t v23 = objc_msgSend_stringValue(v20, v21, v22);
  v26 = objc_msgSend_totalCalories(self, v24, v25);
  uint64_t v29 = objc_msgSend_stringValue(v26, v27, v28);
  v32 = objc_msgSend_basalCalories(self, v30, v31);
  uint64_t v35 = objc_msgSend_stringValue(v32, v33, v34);
  return (id)objc_msgSend_stringWithFormat_(v3, v36, @"%@, <workoutType %@, duration %f, mets %@, basalmets, %@, totalCalories %@, basalCalories %@>", v5, v7, v11, v17, v23, v29, v35);
}

@end
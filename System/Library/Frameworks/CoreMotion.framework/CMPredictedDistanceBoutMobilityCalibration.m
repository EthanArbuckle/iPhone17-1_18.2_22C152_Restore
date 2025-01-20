@interface CMPredictedDistanceBoutMobilityCalibration
+ (BOOL)supportsSecureCoding;
+ (WalkingSpeedStrideCal)inputFromPreparedStatement:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CMPredictedDistanceBoutMobilityCalibration)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMPredictedDistanceBoutMobilityCalibration)initWithCoder:(id)a3;
- (CMPredictedDistanceBoutMobilityCalibration)initWithRecordId:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 cadenceWatch:(double)a6 cadenceGaitCycle:(double)a7 meanWalkingSpeed:(double)a8 gaitCycleYield:(double)a9;
- (CMPredictedDistanceBoutMobilityCalibration)initWithSample:(WalkingSpeedStrideCal *)a3 recordId:(unint64_t)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (double)cadenceGaitCycle;
- (double)cadenceWatch;
- (double)gaitCycleYield;
- (double)meanWalkingSpeed;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMPredictedDistanceBoutMobilityCalibration

- (id)sr_dictionaryRepresentation
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30[0] = @"startTime";
  v4 = NSNumber;
  started = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v6, v7);
  v31[0] = objc_msgSend_numberWithDouble_(v4, v8, v9);
  v30[1] = @"endTime";
  v10 = NSNumber;
  v13 = objc_msgSend_endDate(self, v11, v12);
  objc_msgSend_timeIntervalSinceReferenceDate(v13, v14, v15);
  v31[1] = objc_msgSend_numberWithDouble_(v10, v16, v17);
  v30[2] = @"cadenceWatch";
  v18 = NSNumber;
  objc_msgSend_cadenceWatch(self, v19, v20);
  v31[2] = objc_msgSend_numberWithDouble_(v18, v21, v22);
  v30[3] = @"meanWalkingSpeed";
  v23 = NSNumber;
  objc_msgSend_meanWalkingSpeed(self, v24, v25);
  v31[3] = objc_msgSend_numberWithDouble_(v23, v26, v27);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v31, v30, 4);
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithRecordId:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 cadenceWatch:(double)a6 cadenceGaitCycle:(double)a7 meanWalkingSpeed:(double)a8 gaitCycleYield:(double)a9
{
  v19.receiver = self;
  v19.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  v16 = [(CMPredictedDistanceBoutMobilityCalibration *)&v19 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->fRecordId = a3;
    v16->fStartDate = (NSDate *)a4;
    v17->fEndDate = (NSDate *)a5;
    v17->fCadenceWatch = a6;
    v17->fCadenceGaitCycle = a7;
    v17->fMeanWalkingSpeed = a8;
    v17->fGaitCycleYield = a9;
  }
  return v17;
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithSample:(WalkingSpeedStrideCal *)a3 recordId:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  v6 = [(CMPredictedDistanceBoutMobilityCalibration *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->fRecordId = a4;
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v7->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, a3->var0);
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v7->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v11, v12, v13, a3->var1);
    v7->fCadenceWatch = a3->var2;
    v7->fCadenceGaitCycle = a3->var3;
    v7->fMeanWalkingSpeed = a3->var4;
    v7->fGaitCycleYield = a3->var5;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  [(CMPredictedDistanceBoutMobilityCalibration *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
  v5 = [(CMPredictedDistanceBoutMobilityCalibration *)&v25 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    id v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyEndDate");
    v5->fEndDate = (NSDate *)objc_msgSend_copy(v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceWatch");
    v5->fCadenceWatch = v17;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceGaitCycle");
    v5->fCadenceGaitCycle = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyMeanWalkingSpeed");
    v5->fMeanWalkingSpeed = v21;
    objc_msgSend_decodeDoubleForKey_(a3, v22, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyGaitCycleYield");
    v5->fGaitCycleYield = v23;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3);
  uint64_t v6 = v5;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fEndDate, v7, v8);
  uint64_t v10 = v9;
  long long v18 = *(_OWORD *)&self->fCadenceWatch;
  double fMeanWalkingSpeed = self->fMeanWalkingSpeed;
  double fGaitCycleYield = self->fGaitCycleYield;
  uint64_t v13 = objc_opt_class();
  uint64_t v15 = objc_msgSend_allocWithZone_(v13, v14, (uint64_t)a3);
  v19[0] = v6;
  v19[1] = v10;
  long long v20 = v18;
  double v21 = fMeanWalkingSpeed;
  double v22 = fGaitCycleYield;
  return (id)objc_msgSend_initWithSample_recordId_(v15, v16, (uint64_t)v19, self->fRecordId);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fEndDate, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyEndDate");
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceWatch", self->fCadenceWatch);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyCadenceGaitCycle", self->fCadenceGaitCycle);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyMeanWalkingSpeed", self->fMeanWalkingSpeed);
  double fGaitCycleYield = self->fGaitCycleYield;

  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMPredictedDistanceBoutMobilityCalibrationCodingKeyGaitCycleYield", fGaitCycleYield);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = objc_msgSend_recordId(self, v5, v6);
  if (v7 != objc_msgSend_recordId(a3, v8, v9)) {
    goto LABEL_13;
  }
  if (!objc_msgSend_startDate(self, v10, v11) && !objc_msgSend_startDate(a3, v12, v13)
    || (started = objc_msgSend_startDate(self, v12, v13),
        uint64_t v17 = objc_msgSend_startDate(a3, v15, v16),
        (int isEqualToDate = objc_msgSend_isEqualToDate_(started, v18, v17)) != 0))
  {
    if (!objc_msgSend_endDate(self, v12, v13) && !objc_msgSend_endDate(a3, v20, v21)
      || (double v22 = objc_msgSend_endDate(self, v20, v21),
          uint64_t v25 = objc_msgSend_endDate(a3, v23, v24),
          (int isEqualToDate = objc_msgSend_isEqualToDate_(v22, v26, v25)) != 0))
    {
      objc_msgSend_cadenceWatch(self, v20, v21);
      double v28 = v27;
      objc_msgSend_cadenceWatch(a3, v29, v30);
      if (v28 == v33)
      {
        objc_msgSend_cadenceGaitCycle(self, v31, v32);
        double v35 = v34;
        objc_msgSend_cadenceGaitCycle(a3, v36, v37);
        if (v35 == v40)
        {
          objc_msgSend_meanWalkingSpeed(self, v38, v39);
          double v42 = v41;
          objc_msgSend_meanWalkingSpeed(a3, v43, v44);
          if (v42 == v47)
          {
            objc_msgSend_gaitCycleYield(self, v45, v46);
            double v49 = v48;
            objc_msgSend_gaitCycleYield(a3, v50, v51);
            LOBYTE(isEqualToDate) = v49 == v52;
            return isEqualToDate;
          }
        }
      }
LABEL_13:
      LOBYTE(isEqualToDate) = 0;
    }
  }
  return isEqualToDate;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (double)cadenceWatch
{
  return self->fCadenceWatch;
}

- (double)cadenceGaitCycle
{
  return self->fCadenceGaitCycle;
}

- (double)meanWalkingSpeed
{
  return self->fMeanWalkingSpeed;
}

- (double)gaitCycleYield
{
  return self->fGaitCycleYield;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_endDate(self, v12, v13);
  objc_msgSend_cadenceWatch(self, v15, v16);
  uint64_t v18 = v17;
  objc_msgSend_cadenceGaitCycle(self, v19, v20);
  uint64_t v22 = v21;
  objc_msgSend_meanWalkingSpeed(self, v23, v24);
  uint64_t v26 = v25;
  objc_msgSend_gaitCycleYield(self, v27, v28);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v29, @"%@, <recordId, %lu, startDate, %@, endDate, %@, cadenceWatch, %f, cadenceGaitCycle, %f, meanWalkingSpeed, %f, gaitCycleYield, %f>", v5, v8, started, v14, v18, v22, v26, v30);
}

+ (WalkingSpeedStrideCal)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_double(a4, 1);
  retstr->var1 = sqlite3_column_double(a4, 2);
  retstr->var2 = sqlite3_column_double(a4, 3);
  retstr->var3 = sqlite3_column_double(a4, 4);
  retstr->var4 = sqlite3_column_double(a4, 5);
  retstr->var5 = sqlite3_column_double(a4, 6);
  return result;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMPredictedDistanceBoutMobilityCalibration)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMPredictedDistanceBoutMobilityCalibration;
    uint64_t v7 = [(CMPredictedDistanceBoutMobilityCalibration *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        uint64_t v12 = (void *)v11;

        return (CMPredictedDistanceBoutMobilityCalibration *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

@end
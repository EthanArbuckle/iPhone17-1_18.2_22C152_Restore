@interface CMSmoothGaitMetrics
+ (BOOL)supportsSecureCoding;
+ (SmoothedGaitMetrics)inputFromPreparedStatement:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CMSmoothGaitMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMSmoothGaitMetrics)initWithCoder:(id)a3;
- (CMSmoothGaitMetrics)initWithRecordId:(unint64_t)a3 startDate:(id)a4 walkingSpeed:(double)a5 stepLength:(double)a6 cycleTime:(double)a7 distance:(double)a8 doubleSupportPercentage:(double)a9 asymmetryProbability:(double)a10 numGaitMetrics:(unsigned int)a11;
- (CMSmoothGaitMetrics)initWithSample:(SmoothedGaitMetrics *)a3;
- (NSDate)startDate;
- (NSString)description;
- (double)asymmetryProbability;
- (double)cycleTime;
- (double)distance;
- (double)doubleSupportPercentage;
- (double)stepLength;
- (double)walkingSpeed;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (unint64_t)recordId;
- (unsigned)numGaitMetrics;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSmoothGaitMetrics

- (id)sr_dictionaryRepresentation
{
  v35[5] = *MEMORY[0x1E4F143B8];
  v34[0] = @"startTime";
  v4 = NSNumber;
  started = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v6, v7);
  uint64_t v10 = objc_msgSend_numberWithDouble_(v4, v8, v9);
  v13 = &stru_1EDFD5D50;
  if (v10) {
    v13 = (__CFString *)v10;
  }
  v35[0] = v13;
  v34[1] = @"walkingSpeed";
  v14 = NSNumber;
  objc_msgSend_walkingSpeed(self, v11, v12);
  v35[1] = objc_msgSend_numberWithDouble_(v14, v15, v16);
  v34[2] = @"stepLength";
  v17 = NSNumber;
  objc_msgSend_stepLength(self, v18, v19);
  v35[2] = objc_msgSend_numberWithDouble_(v17, v20, v21);
  v34[3] = @"distance";
  v22 = NSNumber;
  objc_msgSend_distance(self, v23, v24);
  v35[3] = objc_msgSend_numberWithDouble_(v22, v25, v26);
  v34[4] = @"doubleSupportPercentage";
  v27 = NSNumber;
  objc_msgSend_doubleSupportPercentage(self, v28, v29);
  v35[4] = objc_msgSend_numberWithDouble_(v27, v30, v31);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v35, v34, 5);
}

- (CMSmoothGaitMetrics)initWithRecordId:(unint64_t)a3 startDate:(id)a4 walkingSpeed:(double)a5 stepLength:(double)a6 cycleTime:(double)a7 distance:(double)a8 doubleSupportPercentage:(double)a9 asymmetryProbability:(double)a10 numGaitMetrics:(unsigned int)a11
{
  v23.receiver = self;
  v23.super_class = (Class)CMSmoothGaitMetrics;
  v20 = [(CMSmoothGaitMetrics *)&v23 init];
  uint64_t v21 = v20;
  if (v20)
  {
    v20->fRecordId = a3;
    v20->fStartDate = (NSDate *)a4;
    v21->fWalkingSpeed = a5;
    v21->fStepLength = a6;
    v21->fCycleTime = a7;
    v21->fDistance = a8;
    v21->fDoubleSupportPercentage = a9;
    v21->fAsymmetryProbability = a10;
    v21->fNumGaitMetrics = a11;
  }
  return v21;
}

- (CMSmoothGaitMetrics)initWithSample:(SmoothedGaitMetrics *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CMSmoothGaitMetrics;
  v4 = [(CMSmoothGaitMetrics *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, a3->var1);
    float var3 = a3->var3;
    float var5 = a3->var5;
    double var4 = a3->var4;
    v5->fWalkingSpeed = a3->var2;
    v5->fStepLength = var4;
    int8x16_t v12 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3->var6);
    *(int8x16_t *)&v5->fCycleTime = vextq_s8(v12, v12, 8uLL);
    v5->fDoubleSupportPercentage = var3;
    v5->fAsymmetryProbability = var5;
    v5->fNumGaitMetrics = a3->var8;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMSmoothGaitMetrics;
  [(CMSmoothGaitMetrics *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSmoothGaitMetrics)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CMSmoothGaitMetrics;
  v5 = [(CMSmoothGaitMetrics *)&v25 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMSmoothGaitMetricsCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMSmoothGaitMetricsCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMSmoothGaitMetricsCodingKeyWalkingSpeed");
    v5->fWalkingSpeed = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, @"kCMSmoothGaitMetricsCodingKeyStepLength");
    v5->fStepLength = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v15, @"kCMSmoothGaitMetricsCodingKeyCycleTime");
    v5->fCycleTime = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v17, @"kCMSmoothGaitMetricsCodingKeyDistance");
    v5->fDistance = v18;
    objc_msgSend_decodeDoubleForKey_(a3, v19, @"kCMSmoothGaitMetricsCodingKeyDoubleSupportPercentage");
    v5->fDoubleSupportPercentage = v20;
    objc_msgSend_decodeDoubleForKey_(a3, v21, @"kCMSmoothGaitMetricsCodingKeyAsymmetryProbability");
    v5->fAsymmetryProbability = v22;
    v5->fNumGaitMetrics = objc_msgSend_decodeInt32ForKey_(a3, v23, @"kCMSmoothGaitMetricsCodingKeyNumGaitMetrics");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3);
  uint64_t v7 = v6;
  float fWalkingSpeed = self->fWalkingSpeed;
  float fDoubleSupportPercentage = self->fDoubleSupportPercentage;
  float fStepLength = self->fStepLength;
  float fAsymmetryProbability = self->fAsymmetryProbability;
  unsigned int fNumGaitMetrics = self->fNumGaitMetrics;
  int32x2_t v13 = (int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->fCycleTime);
  double v14 = objc_opt_class();
  double v16 = objc_msgSend_allocWithZone_(v14, v15, (uint64_t)a3);
  int v19 = fRecordId;
  uint64_t v20 = v7;
  float v21 = fWalkingSpeed;
  float v22 = fDoubleSupportPercentage;
  float v23 = fStepLength;
  float v24 = fAsymmetryProbability;
  int32x2_t v25 = vrev64_s32(v13);
  unsigned int v26 = fNumGaitMetrics;
  return (id)objc_msgSend_initWithSample_(v16, v17, (uint64_t)&v19);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMSmoothGaitMetricsCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMSmoothGaitMetricsCodingKeyStartDate");
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMSmoothGaitMetricsCodingKeyWalkingSpeed", self->fWalkingSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMSmoothGaitMetricsCodingKeyStepLength", self->fStepLength);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMSmoothGaitMetricsCodingKeyCycleTime", self->fCycleTime);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMSmoothGaitMetricsCodingKeyDistance", self->fDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMSmoothGaitMetricsCodingKeyDoubleSupportPercentage", self->fDoubleSupportPercentage);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"kCMSmoothGaitMetricsCodingKeyAsymmetryProbability", self->fAsymmetryProbability);
  uint64_t fNumGaitMetrics = self->fNumGaitMetrics;

  objc_msgSend_encodeInt32_forKey_(a3, v12, fNumGaitMetrics, @"kCMSmoothGaitMetricsCodingKeyNumGaitMetrics");
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
    objc_msgSend_walkingSpeed(self, v12, v13);
    double v21 = v20;
    objc_msgSend_walkingSpeed(a3, v22, v23);
    if (v21 == v26)
    {
      objc_msgSend_stepLength(self, v24, v25);
      double v28 = v27;
      objc_msgSend_stepLength(a3, v29, v30);
      if (v28 == v33)
      {
        objc_msgSend_cycleTime(self, v31, v32);
        double v35 = v34;
        objc_msgSend_cycleTime(a3, v36, v37);
        if (v35 == v40)
        {
          objc_msgSend_distance(self, v38, v39);
          double v42 = v41;
          objc_msgSend_distance(a3, v43, v44);
          if (v42 == v47)
          {
            objc_msgSend_doubleSupportPercentage(self, v45, v46);
            double v49 = v48;
            objc_msgSend_doubleSupportPercentage(a3, v50, v51);
            if (v49 == v54)
            {
              objc_msgSend_asymmetryProbability(self, v52, v53);
              double v56 = v55;
              objc_msgSend_asymmetryProbability(a3, v57, v58);
              if (v56 == v61)
              {
                int v62 = objc_msgSend_numGaitMetrics(self, v59, v60);
                LOBYTE(isEqualToDate) = v62 == objc_msgSend_numGaitMetrics(a3, v63, v64);
                return isEqualToDate;
              }
            }
          }
        }
      }
    }
LABEL_13:
    LOBYTE(isEqualToDate) = 0;
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

- (double)walkingSpeed
{
  return self->fWalkingSpeed;
}

- (double)stepLength
{
  return self->fStepLength;
}

- (double)cycleTime
{
  return self->fCycleTime;
}

- (double)distance
{
  return self->fDistance;
}

- (double)doubleSupportPercentage
{
  return self->fDoubleSupportPercentage;
}

- (double)asymmetryProbability
{
  return self->fAsymmetryProbability;
}

- (unsigned)numGaitMetrics
{
  return self->fNumGaitMetrics;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  objc_msgSend_walkingSpeed(self, v12, v13);
  uint64_t v15 = v14;
  objc_msgSend_stepLength(self, v16, v17);
  uint64_t v19 = v18;
  objc_msgSend_cycleTime(self, v20, v21);
  uint64_t v23 = v22;
  objc_msgSend_distance(self, v24, v25);
  uint64_t v27 = v26;
  objc_msgSend_doubleSupportPercentage(self, v28, v29);
  uint64_t v31 = v30;
  objc_msgSend_asymmetryProbability(self, v32, v33);
  uint64_t v35 = v34;
  uint64_t v38 = objc_msgSend_numGaitMetrics(self, v36, v37);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v39, @"%@, <recordId, %lu, startDate, %@, walkingSpeed, %f, stepLength, %f, cycleTime, %f, distance, %f, doubleSupportPercentage, %f, asymmetryProbability, %f, numGaitMetrics, %d>", v5, v8, started, v15, v19, v23, v27, v31, v35, v38);
}

+ (SmoothedGaitMetrics)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  float v6 = sqlite3_column_double(a4, 2);
  retstr->var2 = v6;
  float v7 = sqlite3_column_double(a4, 6);
  retstr->float var3 = v7;
  float v8 = sqlite3_column_double(a4, 3);
  retstr->double var4 = v8;
  float v9 = sqlite3_column_double(a4, 7);
  retstr->float var5 = v9;
  float v10 = sqlite3_column_double(a4, 5);
  retstr->var6 = v10;
  float v11 = sqlite3_column_double(a4, 4);
  retstr->var7 = v11;
  result = (SmoothedGaitMetrics *)sqlite3_column_int(a4, 8);
  retstr->var8 = result;
  return result;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMSmoothGaitMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMSmoothGaitMetrics;
    float v7 = [(CMSmoothGaitMetrics *)&v14 init];
    if (v7)
    {
      float v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        double v12 = (void *)v11;

        return (CMSmoothGaitMetrics *)v12;
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
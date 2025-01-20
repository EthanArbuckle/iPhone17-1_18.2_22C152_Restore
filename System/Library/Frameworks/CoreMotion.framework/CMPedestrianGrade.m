@interface CMPedestrianGrade
+ (BOOL)supportsSecureCoding;
+ (CLElevationGradeEntry)inputFromPreparedStatement:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CMPedestrianGrade)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMPedestrianGrade)initWithCoder:(id)a3;
- (CMPedestrianGrade)initWithRecordId:(unint64_t)a3 startDate:(id)a4 grade:(float)a5;
- (CMPedestrianGrade)initWithSample:(CLElevationGradeEntry *)a3;
- (NSDate)startDate;
- (NSString)description;
- (float)grade;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMPedestrianGrade

- (CMPedestrianGrade)initWithRecordId:(unint64_t)a3 startDate:(id)a4 grade:(float)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CMPedestrianGrade;
  v8 = [(CMPedestrianGrade *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->fRecordId = a3;
    v8->fStartDate = (NSDate *)a4;
    v9->fGrade = a5;
  }
  return v9;
}

- (CMPedestrianGrade)initWithSample:(CLElevationGradeEntry *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMPedestrianGrade;
  v4 = [(CMPedestrianGrade *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->fRecordId = a3->var0;
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, a3->var1);
    float var2 = a3->var2;
    v5->fGrade = var2;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPedestrianGrade;
  [(CMPedestrianGrade *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPedestrianGrade)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CMPedestrianGrade;
  v5 = [(CMPedestrianGrade *)&v14 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMPedestrianGradeCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMPedestrianGradeCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMPedestrianGradeCodingKeyGrade");
    *(float *)&double v12 = v12;
    v5->fGrade = *(float *)&v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t fRecordId = self->fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(self->fStartDate, a2, (uint64_t)a3);
  uint64_t v7 = v6;
  double fGrade = self->fGrade;
  v9 = objc_opt_class();
  objc_super v11 = objc_msgSend_allocWithZone_(v9, v10, (uint64_t)a3);
  v14[0] = fRecordId;
  v14[1] = v7;
  *(double *)&v14[2] = fGrade;
  return (id)objc_msgSend_initWithSample_(v11, v12, (uint64_t)v14);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMPedestrianGradeCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMPedestrianGradeCodingKeyStartDate");
  *(float *)&double v7 = self->fGrade;

  objc_msgSend_encodeFloat_forKey_(a3, v6, @"kCMPedestrianGradeCodingKeyGrade", v7);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v7 = objc_msgSend_recordId(self, v5, v6), v7 == objc_msgSend_recordId(a3, v8, v9)))
  {
    if (!objc_msgSend_startDate(self, v10, v11) && !objc_msgSend_startDate(a3, v12, v13)
      || (started = objc_msgSend_startDate(self, v12, v13),
          uint64_t v17 = objc_msgSend_startDate(a3, v15, v16),
          (int isEqualToDate = objc_msgSend_isEqualToDate_(started, v18, v17)) != 0))
    {
      objc_msgSend_grade(self, v12, v13);
      float v21 = v20;
      objc_msgSend_grade(a3, v22, v23);
      LOBYTE(isEqualToDate) = v21 == v24;
    }
  }
  else
  {
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

- (float)grade
{
  return self->fGrade;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  objc_msgSend_grade(self, v12, v13);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v15, @"%@, <recordId, %lu, startDate, %@, grade, %f>", v5, v8, started, v14);
}

+ (CLElevationGradeEntry)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  retstr->float var2 = sqlite3_column_double(a4, 2);
  return result;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMPedestrianGrade)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMPedestrianGrade;
    uint64_t v7 = [(CMPedestrianGrade *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        double v12 = (void *)v11;

        return (CMPedestrianGrade *)v12;
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
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = @"startTime";
  v4 = NSNumber;
  uint64_t started = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v6, v7);
  v17[1] = @"grade";
  v18[0] = objc_msgSend_numberWithDouble_(v4, v8, v9);
  uint64_t v10 = NSNumber;
  objc_msgSend_grade(self, v11, v12);
  v18[1] = objc_msgSend_numberWithFloat_(v10, v13, v14);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v18, v17, 2);
}

@end
@interface CMVO2MaxClassificationData
+ (BOOL)supportsSecureCoding;
- (CMVO2MaxClassificationData)initWithBiologicalSex:(int64_t)a3 ageLowerBound:(int64_t)a4 ageUpperBound:(int64_t)a5 classificationType:(int64_t)a6 vo2MaxLowerBound:(double)a7 vo2MaxUpperBound:(double)a8;
- (CMVO2MaxClassificationData)initWithCoder:(id)a3;
- (double)vo2MaxLowerBound;
- (double)vo2MaxUpperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)ageLowerBound;
- (int64_t)ageUpperBound;
- (int64_t)biologicalSex;
- (int64_t)classificationType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMVO2MaxClassificationData

- (CMVO2MaxClassificationData)initWithBiologicalSex:(int64_t)a3 ageLowerBound:(int64_t)a4 ageUpperBound:(int64_t)a5 classificationType:(int64_t)a6 vo2MaxLowerBound:(double)a7 vo2MaxUpperBound:(double)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CMVO2MaxClassificationData;
  result = [(CMVO2MaxClassificationData *)&v15 init];
  if (result)
  {
    result->_biologicalSex = a3;
    result->_ageLowerBound = a4;
    result->_ageUpperBound = a5;
    result->_classificationType = a6;
    result->_vo2MaxLowerBound = a7;
    result->_vo2MaxUpperBound = a8;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMVO2MaxClassificationData;
  [(CMVO2MaxClassificationData *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  int64_t biologicalSex = self->_biologicalSex;
  int64_t ageLowerBound = self->_ageLowerBound;
  int64_t ageUpperBound = self->_ageUpperBound;
  int64_t classificationType = self->_classificationType;
  double vo2MaxLowerBound = self->_vo2MaxLowerBound;
  double vo2MaxUpperBound = self->_vo2MaxUpperBound;

  return (id)objc_msgSend_initWithBiologicalSex_ageLowerBound_ageUpperBound_classificationType_vo2MaxLowerBound_vo2MaxUpperBound_(v7, v8, biologicalSex, ageLowerBound, ageUpperBound, classificationType, vo2MaxLowerBound, vo2MaxUpperBound);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVO2MaxClassificationData)initWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CMVO2MaxClassificationData;
  v5 = [(CMVO2MaxClassificationData *)&v22 init];
  if (v5)
  {
    v5->_int64_t biologicalSex = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMVO2MaxClassificationDataCodingKeyBiologicalSex");
    v5->_int64_t ageLowerBound = objc_msgSend_decodeIntegerForKey_(a3, v6, @"kCMVO2MaxClassificationDataCodingKeyAgeLowerBound");
    v5->_int64_t ageUpperBound = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMVO2MaxClassificationDataCodingKeyAgeUpperBound");
    v5->_int64_t classificationType = objc_msgSend_decodeIntegerForKey_(a3, v8, @"kCMVO2MaxClassificationDataCodingKeyClassificationType");
    uint64_t v9 = objc_opt_class();
    v11 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"kCMVO2MaxClassificationDataCodingKeyVO2MaxLowerBound");
    objc_msgSend_doubleValue(v11, v12, v13);
    v5->_double vo2MaxLowerBound = v14;
    uint64_t v15 = objc_opt_class();
    v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kCMVO2MaxClassificationDataCodingKeyVO2MaxUpperBound");
    objc_msgSend_doubleValue(v17, v18, v19);
    v5->_double vo2MaxUpperBound = v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_biologicalSex, @"kCMVO2MaxClassificationDataCodingKeyBiologicalSex");
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_ageLowerBound, @"kCMVO2MaxClassificationDataCodingKeyAgeLowerBound");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_ageUpperBound, @"kCMVO2MaxClassificationDataCodingKeyAgeUpperBound");
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_classificationType, @"kCMVO2MaxClassificationDataCodingKeyClassificationType");
  uint64_t v10 = objc_msgSend_numberWithDouble_(NSNumber, v8, v9, self->_vo2MaxLowerBound);
  objc_msgSend_encodeObject_forKey_(a3, v11, v10, @"kCMVO2MaxClassificationDataCodingKeyVO2MaxLowerBound");
  uint64_t v15 = objc_msgSend_numberWithDouble_(NSNumber, v12, v13, self->_vo2MaxUpperBound);

  objc_msgSend_encodeObject_forKey_(a3, v14, v15, @"kCMVO2MaxClassificationDataCodingKeyVO2MaxUpperBound");
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"%@,<biologicalSex %ld, ageLowerBound %lu, ageUpperBound %lu, classificationType %ld, vo2MaxLowerBound %f, vo2MaxUpperBound %f>", v5, self->_biologicalSex, self->_ageLowerBound, self->_ageUpperBound, self->_classificationType, *(void *)&self->_vo2MaxLowerBound, *(void *)&self->_vo2MaxUpperBound);
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (int64_t)ageLowerBound
{
  return self->_ageLowerBound;
}

- (int64_t)ageUpperBound
{
  return self->_ageUpperBound;
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

- (double)vo2MaxLowerBound
{
  return self->_vo2MaxLowerBound;
}

- (double)vo2MaxUpperBound
{
  return self->_vo2MaxUpperBound;
}

@end
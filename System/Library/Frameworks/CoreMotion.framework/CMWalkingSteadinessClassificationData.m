@interface CMWalkingSteadinessClassificationData
+ (BOOL)supportsSecureCoding;
- (CMWalkingSteadinessClassificationData)initWithCoder:(id)a3;
- (CMWalkingSteadinessClassificationData)initWithLowerBound:(double)a3 upperBound:(double)a4 classificationType:(int64_t)a5;
- (double)lowerBound;
- (double)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)classificationType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWalkingSteadinessClassificationData

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMWalkingSteadinessClassificationData;
  [(CMWalkingSteadinessClassificationData *)&v2 dealloc];
}

- (CMWalkingSteadinessClassificationData)initWithLowerBound:(double)a3 upperBound:(double)a4 classificationType:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CMWalkingSteadinessClassificationData;
  result = [(CMWalkingSteadinessClassificationData *)&v9 init];
  if (result)
  {
    result->_lowerBound = a3;
    result->_upperBound = a4;
    result->_classificationType = a5;
  }
  return result;
}

- (double)upperBound
{
  return self->_upperBound;
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  double lowerBound = self->_lowerBound;
  double upperBound = self->_upperBound;
  int64_t classificationType = self->_classificationType;

  return (id)objc_msgSend_initWithLowerBound_upperBound_classificationType_(v7, v8, classificationType, lowerBound, upperBound);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWalkingSteadinessClassificationData)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMWalkingSteadinessClassificationData;
  v5 = [(CMWalkingSteadinessClassificationData *)&v11 init];
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kCMWalkingSteadinessClassificationDataCodingKeyLowerBound");
    v5->_double lowerBound = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMWalkingSteadinessClassificationDataCodingKeyUpperBound");
    v5->_double upperBound = v8;
    v5->_int64_t classificationType = objc_msgSend_decodeIntegerForKey_(a3, v9, @"kCMWalkingSteadinessClassificationDataCodingKeyClassificationType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"kCMWalkingSteadinessClassificationDataCodingKeyLowerBound", self->_lowerBound);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMWalkingSteadinessClassificationDataCodingKeyUpperBound", self->_upperBound);
  int64_t classificationType = self->_classificationType;

  objc_msgSend_encodeInteger_forKey_(a3, v6, classificationType, @"kCMWalkingSteadinessClassificationDataCodingKeyClassificationType");
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"%@,<lowerBound %f, upperBound %f, classificationType %ld, >", v5, *(void *)&self->_lowerBound, *(void *)&self->_upperBound, self->_classificationType);
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

@end
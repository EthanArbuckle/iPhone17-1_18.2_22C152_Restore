@interface HMFDigest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMFDigest)init;
- (HMFDigest)initWithAlgorithm:(int64_t)a3 value:(id)a4;
- (HMFDigest)initWithCoder:(id)a3;
- (NSData)value;
- (NSString)propertyDescription;
- (int64_t)algorithm;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFDigest

- (HMFDigest)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFDigest)initWithAlgorithm:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMFDigest;
  id v7 = [(HMFDigest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_algorithm = a3;
    uint64_t v9 = [v6 copy];
    value = v8->_value;
    v8->_value = (NSData *)v9;
  }
  return v8;
}

- (NSString)propertyDescription
{
  uint64_t v3 = NSString;
  unint64_t v4 = [(HMFDigest *)self algorithm] - 2;
  if (v4 > 6) {
    v5 = @"Unknown";
  }
  else {
    v5 = off_1E59587A8[v4];
  }
  id v6 = [(HMFDigest *)self value];
  id v7 = [v3 stringWithFormat:@", Algorithm = %@, Value = %@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v2 = [(HMFDigest *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HMFDigest *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    id v7 = v6;
    if (v6 && self->_algorithm == v6->_algorithm)
    {
      v8 = [(HMFDigest *)self value];
      uint64_t v9 = [(HMFDigest *)v7 value];
      char v10 = HMFEqualObjects(v8, v9);
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (int64_t)algorithm
{
  unint64_t algorithm = self->_algorithm;
  if (algorithm > 8) {
    return 0;
  }
  else {
    return qword_19D611910[algorithm];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFDigest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HM.algorithm"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.value;"];

  id v7 = [(HMFDigest *)self initWithAlgorithm:v5 value:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t algorithm = self->_algorithm;
  id v5 = a3;
  [v5 encodeInteger:algorithm forKey:@"HM.algorithm"];
  id v6 = [(HMFDigest *)self value];
  [v5 encodeObject:v6 forKey:@"HM.value;"];
}

- (NSData)value
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end
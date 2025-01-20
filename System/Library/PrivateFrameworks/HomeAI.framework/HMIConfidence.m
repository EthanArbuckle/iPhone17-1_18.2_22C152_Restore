@interface HMIConfidence
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMIConfidence)initWithCoder:(id)a3;
- (HMIConfidence)initWithValue:(double)a3 levelThresholds:(id)a4;
- (NSArray)levelThresholds;
- (double)value;
- (id)description;
- (id)shortDescription;
- (int64_t)level;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIConfidence

- (HMIConfidence)initWithValue:(double)a3 levelThresholds:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMIConfidence;
  v8 = [(HMIConfidence *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    objc_storeStrong((id *)&v8->_levelThresholds, a4);
  }

  return v9;
}

- (int64_t)level
{
  [(HMIConfidence *)self value];
  double v4 = v3;
  v5 = [(HMIConfidence *)self levelThresholds];
  v6 = [v5 objectAtIndexedSubscript:1];
  [v6 doubleValue];
  double v8 = v7;

  if (v4 >= v8) {
    return 2;
  }
  [(HMIConfidence *)self value];
  double v10 = v9;
  objc_super v11 = [(HMIConfidence *)self levelThresholds];
  v12 = [v11 objectAtIndexedSubscript:0];
  [v12 doubleValue];
  int64_t v14 = v10 >= v13;

  return v14;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.4f", *(void *)&self->_value);
}

- (id)shortDescription
{
  v2 = NSString;
  double value = self->_value;
  int64_t v4 = [(HMIConfidence *)self level];
  v5 = @"Low";
  if (v4 == 1) {
    v5 = @"Medium";
  }
  if (v4 == 2) {
    v6 = @"High";
  }
  else {
    v6 = v5;
  }
  return (id)[v2 stringWithFormat:@"%.2f[%c]", *(void *)&value, -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0)];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (HMIConfidence *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(HMIConfidence *)self value];
      double v7 = v6;
      [(HMIConfidence *)v5 value];
      double v9 = v8;
      double v10 = [(HMIConfidence *)self levelThresholds];
      objc_super v11 = [(HMIConfidence *)v5 levelThresholds];

      char v12 = HMFEqualObjects();
      if (v7 == v9) {
        BOOL v13 = v12;
      }
      else {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  [(HMIConfidence *)self value];
  double v3 = -v2;
  if (v2 >= 0.0) {
    double v3 = v2;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIConfidence)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = NSStringFromSelector(sel_value);
  [v4 decodeDoubleForKey:v5];
  double v7 = v6;

  unint64_t v8 = (void *)MEMORY[0x263EFFA08];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  unint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  double v10 = [v8 setWithArray:v9];
  objc_super v11 = NSStringFromSelector(sel_levelThresholds);
  char v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];

  BOOL v13 = [[HMIConfidence alloc] initWithValue:v12 levelThresholds:v7];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(HMIConfidence *)self value];
  double v6 = v5;
  double v7 = NSStringFromSelector(sel_value);
  [v4 encodeDouble:v7 forKey:v6];

  id v9 = [(HMIConfidence *)self levelThresholds];
  unint64_t v8 = NSStringFromSelector(sel_levelThresholds);
  [v4 encodeObject:v9 forKey:v8];
}

- (double)value
{
  return self->_value;
}

- (NSArray)levelThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end
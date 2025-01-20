@interface MLOptimizationHints
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MLOptimizationHints)init;
- (MLOptimizationHints)initWithCoder:(id)a3;
- (double)hotHandDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reshapeFrequencyToString:(int64_t)a3;
- (id)specializationStrategyToString:(int64_t)a3;
- (int64_t)reshapeFrequency;
- (int64_t)specializationStrategy;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHotHandDuration:(double)a3;
- (void)setReshapeFrequency:(int64_t)a3;
- (void)setSpecializationStrategy:(int64_t)a3;
@end

@implementation MLOptimizationHints

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[MLOptimizationHints allocWithZone:a3] init];
  [(MLOptimizationHints *)v4 setReshapeFrequency:[(MLOptimizationHints *)self reshapeFrequency]];
  [(MLOptimizationHints *)self hotHandDuration];
  -[MLOptimizationHints setHotHandDuration:](v4, "setHotHandDuration:");
  [(MLOptimizationHints *)v4 setSpecializationStrategy:[(MLOptimizationHints *)self specializationStrategy]];
  return v4;
}

- (int64_t)reshapeFrequency
{
  return self->_reshapeFrequency;
}

- (int64_t)specializationStrategy
{
  return self->_specializationStrategy;
}

- (void)setSpecializationStrategy:(int64_t)a3
{
  self->_specializationStrategy = a3;
}

- (void)setReshapeFrequency:(int64_t)a3
{
  self->_reshapeFrequency = a3;
}

- (void)setHotHandDuration:(double)a3
{
  self->_hotHandDuration = a3;
}

- (double)hotHandDuration
{
  return self->_hotHandDuration;
}

- (MLOptimizationHints)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLOptimizationHints;
  result = [(MLOptimizationHints *)&v3 init];
  if (result)
  {
    result->_reshapeFrequency = 0;
    result->_specializationStrategy = 0;
    result->_hotHandDuration = 1.0;
  }
  return result;
}

- (MLOptimizationHints)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MLOptimizationHints;
  v5 = [(MLOptimizationHints *)&v8 init];
  if (v5)
  {
    v5->_reshapeFrequency = [v4 decodeIntegerForKey:@"reshapeFrequency"];
    [v4 decodeDoubleForKey:@"hotHandDuration"];
    v5->_hotHandDuration = v6;
    v5->_specializationStrategy = [v4 decodeIntegerForKey:@"specializationStrategy"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLOptimizationHints reshapeFrequency](self, "reshapeFrequency"), @"reshapeFrequency");
  [(MLOptimizationHints *)self hotHandDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"hotHandDuration");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLOptimizationHints specializationStrategy](self, "specializationStrategy"), @"specializationStrategy");
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:\n", v5];

  double v6 = [(MLOptimizationHints *)self reshapeFrequencyToString:[(MLOptimizationHints *)self reshapeFrequency]];
  [v3 appendFormat:@" reshapeFrequency %@\n", v6];

  [(MLOptimizationHints *)self hotHandDuration];
  objc_msgSend(v3, "appendFormat:", @" hotHandDuration %4.2f seconds\n", v7);
  objc_super v8 = [(MLOptimizationHints *)self specializationStrategyToString:[(MLOptimizationHints *)self specializationStrategy]];
  [v3 appendFormat:@" specializationStrategy %@\n", v8];

  return v3;
}

- (id)specializationStrategyToString:(int64_t)a3
{
  if (a3) {
    return @"FastPrediction";
  }
  else {
    return @"Default";
  }
}

- (id)reshapeFrequencyToString:(int64_t)a3
{
  if (a3 == 1) {
    return @"Infrequent";
  }
  else {
    return @"Frequent";
  }
}

- (unint64_t)hash
{
  int64_t v3 = [(MLOptimizationHints *)self reshapeFrequency];
  return [(MLOptimizationHints *)self specializationStrategy] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLOptimizationHints *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(MLOptimizationHints *)self reshapeFrequency];
      if (v6 == [(MLOptimizationHints *)v5 reshapeFrequency])
      {
        int64_t v7 = [(MLOptimizationHints *)self specializationStrategy];
        BOOL v8 = v7 == [(MLOptimizationHints *)v5 specializationStrategy];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface AVFloat64Range
+ (id)float64RangeWithAudioValueRange:(AudioValueRange)a3;
+ (id)float64RangeWithMinimum:(double)a3 maximum:(double)a4;
- (AVFloat64Range)initWithMinimum:(double)a3 maximum:(double)a4;
- (BOOL)isEqual:(id)a3;
- (double)maximum;
- (double)minimum;
- (id)description;
- (unint64_t)hash;
@end

@implementation AVFloat64Range

- (AVFloat64Range)initWithMinimum:(double)a3 maximum:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVFloat64Range;
  result = [(AVFloat64Range *)&v7 init];
  if (result)
  {
    result->_minimum = a3;
    result->_maximum = a4;
  }
  return result;
}

+ (id)float64RangeWithMinimum:(double)a3 maximum:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithMinimum:a3 maximum:a4];
  return v4;
}

+ (id)float64RangeWithAudioValueRange:(AudioValueRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithAudioValueRange:", a3.mMinimum, a3.mMaximum);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [a3 minimum];
  double v6 = v5;
  [(AVFloat64Range *)self minimum];
  if (v6 != v7) {
    return 0;
  }
  [a3 maximum];
  double v9 = v8;
  [(AVFloat64Range *)self maximum];
  return v9 == v10;
}

- (unint64_t)hash
{
  [(AVFloat64Range *)self minimum];
  unint64_t v4 = (unint64_t)v3;
  [(AVFloat64Range *)self maximum];
  return (unint64_t)v5 ^ v4;
}

- (id)description
{
  double v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(AVFloat64Range *)self minimum];
  uint64_t v7 = v6;
  [(AVFloat64Range *)self maximum];
  return (id)[v3 stringWithFormat:@"<%@: %p, minimum = %f, maximum = %f>", v5, self, v7, v8];
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end
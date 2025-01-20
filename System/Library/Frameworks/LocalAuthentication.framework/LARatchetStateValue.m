@interface LARatchetStateValue
- (BOOL)isEqual:(id)a3;
- (LARatchetStateValue)initWithDuration:(double)a3;
- (double)duration;
- (id)initInternal;
@end

@implementation LARatchetStateValue

- (id)initInternal
{
  return [(LARatchetStateValue *)self initWithDuration:-1.0];
}

- (LARatchetStateValue)initWithDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LARatchetStateValue;
  result = [(LARatchetStateValue *)&v5 init];
  if (result) {
    result->_duration = a3;
  }
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 duration];
    double v6 = v5;
    [(LARatchetStateValue *)self duration];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end
@interface LACSharedModeDataSourceTaskDecoratorRuntime
- (BOOL)isEqual:(id)a3;
- (LACSharedModeDataSourceTaskDecoratorRuntime)init;
- (LACSharedModeDataSourceTaskDecoratorRuntime)initWithMinValue:(double)a3 maxValue:(double)a4;
- (double)maxValue;
- (double)minValue;
- (id)description;
- (void)halveMaxValue;
- (void)resetMaxValue;
@end

@implementation LACSharedModeDataSourceTaskDecoratorRuntime

- (void)resetMaxValue
{
  self->_effectiveMaxValue = self->_maxValue;
}

- (double)minValue
{
  return self->_effectiveMinValue;
}

- (LACSharedModeDataSourceTaskDecoratorRuntime)init
{
  return [(LACSharedModeDataSourceTaskDecoratorRuntime *)self initWithMinValue:0.025 maxValue:0.2];
}

- (LACSharedModeDataSourceTaskDecoratorRuntime)initWithMinValue:(double)a3 maxValue:(double)a4
{
  if (a3 > a4)
  {
    [NSString stringWithFormat:@"Runtime minValue must be less than or equal to maxValue"];
    id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)LACSharedModeDataSourceTaskDecoratorRuntime;
  result = [(LACSharedModeDataSourceTaskDecoratorRuntime *)&v8 init];
  if (result)
  {
    result->_minValue = a3;
    result->_maxValue = a4;
    result->_effectiveMaxValue = a4;
    result->_effectiveMinValue = a3;
  }
  return result;
}

- (double)maxValue
{
  return self->_effectiveMaxValue;
}

- (void)halveMaxValue
{
  double minValue = self->_minValue;
  if (minValue < self->_effectiveMaxValue * 0.5) {
    double minValue = self->_effectiveMaxValue * 0.5;
  }
  self->_effectiveMaxValue = minValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(LACSharedModeDataSourceTaskDecoratorRuntime *)self minValue];
    double v7 = v6;
    [v5 minValue];
    if (v7 == v8)
    {
      [(LACSharedModeDataSourceTaskDecoratorRuntime *)self maxValue];
      double v11 = v10;
      [v5 maxValue];
      BOOL v9 = v11 == v12;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v12[0] = @"minValue";
  id v5 = NSNumber;
  [(LACSharedModeDataSourceTaskDecoratorRuntime *)self minValue];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v12[1] = @"maxValue";
  v13[0] = v6;
  double v7 = NSNumber;
  [(LACSharedModeDataSourceTaskDecoratorRuntime *)self maxValue];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v13[1] = v8;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  double v10 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v9];

  return v10;
}

@end
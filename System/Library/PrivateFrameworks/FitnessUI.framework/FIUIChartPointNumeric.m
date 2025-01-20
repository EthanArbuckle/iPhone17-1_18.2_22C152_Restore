@interface FIUIChartPointNumeric
+ (id)chartPointWithXValue:(id)a3 yValue:(id)a4;
- (FIUIChartPointNumeric)initWithXValue:(id)a3 yValue:(id)a4;
- (NSDate)xValue;
- (NSNumber)maxYValue;
- (NSNumber)minYValue;
- (NSNumber)yValue;
- (NSString)description;
- (void)setXValue:(id)a3;
- (void)setYValue:(id)a3;
@end

@implementation FIUIChartPointNumeric

+ (id)chartPointWithXValue:(id)a3 yValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithXValue:v7 yValue:v6];

  return v8;
}

- (FIUIChartPointNumeric)initWithXValue:(id)a3 yValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FIUIChartPointNumeric *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xValue, a3);
    objc_storeStrong((id *)&v10->_yValue, a4);
  }

  return v10;
}

- (NSNumber)minYValue
{
  return self->_yValue;
}

- (NSNumber)maxYValue
{
  return self->_yValue;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p, (%@, %@)>", objc_opt_class(), self, self->_xValue, self->_yValue];
}

- (NSDate)xValue
{
  return self->_xValue;
}

- (void)setXValue:(id)a3
{
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
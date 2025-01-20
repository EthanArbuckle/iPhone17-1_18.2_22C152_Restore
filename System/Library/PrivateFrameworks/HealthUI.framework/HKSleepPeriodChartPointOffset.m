@interface HKSleepPeriodChartPointOffset
+ (id)chartPointOffsetWithValue:(id)a3 continuation:(BOOL)a4;
- (BOOL)continuation;
- (HKSleepPeriodChartPointOffset)initWithValue:(id)a3 continuation:(BOOL)a4;
- (NSNumber)value;
@end

@implementation HKSleepPeriodChartPointOffset

+ (id)chartPointOffsetWithValue:(id)a3 continuation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithValue:v6 continuation:v4];

  return v7;
}

- (HKSleepPeriodChartPointOffset)initWithValue:(id)a3 continuation:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSleepPeriodChartPointOffset;
  v8 = [(HKSleepPeriodChartPointOffset *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_value, a3);
    v9->_continuation = a4;
  }

  return v9;
}

- (NSNumber)value
{
  return self->_value;
}

- (BOOL)continuation
{
  return self->_continuation;
}

- (void).cxx_destruct
{
}

@end
@interface HMDUserActivityReportSetValue
- (HMDUserActivityReport)value;
- (HMDUserActivityReportSetValue)initWithReport:(id)a3;
@end

@implementation HMDUserActivityReportSetValue

- (void).cxx_destruct
{
}

- (HMDUserActivityReport)value
{
  return self->_value;
}

- (HMDUserActivityReportSetValue)initWithReport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityReportSetValue;
  v6 = [(HMDUserActivityReportSetValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_value, a3);
  }

  return v7;
}

@end
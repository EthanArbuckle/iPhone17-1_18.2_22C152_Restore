@interface LCFELFeatureValueStatistic
- (NSNumber)count;
- (NSNumber)mean;
- (NSNumber)stddev;
- (NSString)featureName;
- (id)init:(id)a3 count:(id)a4 mean:(id)a5 stddev:(id)a6;
@end

@implementation LCFELFeatureValueStatistic

- (id)init:(id)a3 count:(id)a4 mean:(id)a5 stddev:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LCFELFeatureValueStatistic;
  v15 = [(LCFELFeatureValueStatistic *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureName, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSNumber)count
{
  return self->_count;
}

- (NSNumber)mean
{
  return self->_mean;
}

- (NSNumber)stddev
{
  return self->_stddev;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stddev, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
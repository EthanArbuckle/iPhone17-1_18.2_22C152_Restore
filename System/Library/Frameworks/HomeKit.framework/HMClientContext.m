@interface HMClientContext
- (HMClientContext)initWithMetricIdentifier:(id)a3;
- (NSString)metricIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setMetricIdentifier:(id)a3;
@end

@implementation HMClientContext

- (void).cxx_destruct
{
}

- (void)setMetricIdentifier:(id)a3
{
}

- (NSString)metricIdentifier
{
  return self->_metricIdentifier;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[HMMutableClientContext allocWithZone:a3];
  v5 = [(HMClientContext *)self metricIdentifier];
  v6 = [(HMMutableClientContext *)v4 initWithMetricIdentifier:v5];

  return v6;
}

- (HMClientContext)initWithMetricIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMClientContext;
  v5 = [(HMClientContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    metricIdentifier = v5->_metricIdentifier;
    v5->_metricIdentifier = (NSString *)v6;
  }
  return v5;
}

@end
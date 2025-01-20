@interface HMINMSConfiguration
- (HMINMSConfiguration)initWithThresholdWithLabels:(id)a3 metricWithLabels:(id)a4 thresholdDefault:(id)a5 metricDefault:(id)a6;
- (NSDictionary)metricWithLabels;
- (NSDictionary)thresholdWithLabels;
- (NSNumber)metricDefault;
- (NSNumber)thresholdDefault;
- (id)thresholdForLabel:(id)a3;
- (int64_t)metricForLabel:(id)a3;
@end

@implementation HMINMSConfiguration

- (HMINMSConfiguration)initWithThresholdWithLabels:(id)a3 metricWithLabels:(id)a4 thresholdDefault:(id)a5 metricDefault:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMINMSConfiguration;
  v15 = [(HMINMSConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_thresholdWithLabels, a3);
    objc_storeStrong((id *)&v16->_metricWithLabels, a4);
    objc_storeStrong((id *)&v16->_thresholdDefault, a5);
    objc_storeStrong((id *)&v16->_metricDefault, a6);
  }

  return v16;
}

- (id)thresholdForLabel:(id)a3
{
  id v4 = a3;
  v5 = [(HMINMSConfiguration *)self thresholdWithLabels];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(HMINMSConfiguration *)self thresholdDefault];
  }
  v8 = v7;

  return v8;
}

- (int64_t)metricForLabel:(id)a3
{
  id v4 = a3;
  v5 = [(HMINMSConfiguration *)self metricWithLabels];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(HMINMSConfiguration *)self metricWithLabels];
    v8 = [v7 objectForKeyedSubscript:v4];
    int v9 = [v8 intValue];
  }
  else
  {
    id v7 = [(HMINMSConfiguration *)self metricDefault];
    int v9 = [v7 intValue];
  }

  return v9;
}

- (NSDictionary)thresholdWithLabels
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)metricWithLabels
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)thresholdDefault
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)metricDefault
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricDefault, 0);
  objc_storeStrong((id *)&self->_thresholdDefault, 0);
  objc_storeStrong((id *)&self->_metricWithLabels, 0);
  objc_storeStrong((id *)&self->_thresholdWithLabels, 0);
}

@end
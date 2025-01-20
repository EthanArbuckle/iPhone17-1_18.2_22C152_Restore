@interface AFMyriadMetricsAdditionalContext
- (AFMyriadMetricsAdditionalContext)initWithRawGoodnessScore:(unsigned __int8)a3 goodnessScore:(unsigned __int8)a4 deviceClass:(unsigned __int8)a5 deviceProductType:(unsigned __int8)a6;
- (id)description;
- (unsigned)deviceClass;
- (unsigned)deviceProductType;
- (unsigned)goodnessScore;
- (unsigned)rawGoodnessScore;
@end

@implementation AFMyriadMetricsAdditionalContext

- (unsigned)deviceProductType
{
  return self->_deviceProductType;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"raw Goodness = %d, boosted goodness = %d  class = %d, product type = %d", -[AFMyriadMetricsAdditionalContext rawGoodnessScore](self, "rawGoodnessScore"), -[AFMyriadMetricsAdditionalContext goodnessScore](self, "goodnessScore"), -[AFMyriadMetricsAdditionalContext deviceClass](self, "deviceClass"), -[AFMyriadMetricsAdditionalContext deviceProductType](self, "deviceProductType")];
}

- (AFMyriadMetricsAdditionalContext)initWithRawGoodnessScore:(unsigned __int8)a3 goodnessScore:(unsigned __int8)a4 deviceClass:(unsigned __int8)a5 deviceProductType:(unsigned __int8)a6
{
  v11.receiver = self;
  v11.super_class = (Class)AFMyriadMetricsAdditionalContext;
  result = [(AFMyriadMetricsAdditionalContext *)&v11 init];
  if (result)
  {
    result->_rawGoodnessScore = a3;
    result->_goodnessScore = a4;
    result->_deviceClass = a5;
    result->_deviceProductType = a6;
  }
  return result;
}

@end
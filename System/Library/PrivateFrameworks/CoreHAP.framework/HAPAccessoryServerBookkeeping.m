@interface HAPAccessoryServerBookkeeping
- (HAPAccessoryServerBookkeeping)initWithDiscoveryMethod:(unint64_t)a3;
- (unint64_t)initialDiscoveryMethod;
- (unint64_t)lastDiscoveryMethod;
- (void)setLastDiscoveryMethod:(unint64_t)a3;
@end

@implementation HAPAccessoryServerBookkeeping

- (void)setLastDiscoveryMethod:(unint64_t)a3
{
  self->_lastDiscoveryMethod = a3;
}

- (unint64_t)lastDiscoveryMethod
{
  return self->_lastDiscoveryMethod;
}

- (unint64_t)initialDiscoveryMethod
{
  return self->_initialDiscoveryMethod;
}

- (HAPAccessoryServerBookkeeping)initWithDiscoveryMethod:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPAccessoryServerBookkeeping;
  result = [(HAPAccessoryServerBookkeeping *)&v5 init];
  if (result)
  {
    result->_lastDiscoveryMethod = a3;
    result->_initialDiscoveryMethod = a3;
  }
  return result;
}

@end
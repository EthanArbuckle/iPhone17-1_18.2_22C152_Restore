@interface HKHealthServiceDiscovery
- (HKHealthServiceDiscovery)initWithType:(int64_t)a3;
- (id)discoveryHandler;
- (id)initForAllTypes;
- (int64_t)serviceType;
- (unint64_t)discoveryIdentifier;
- (void)setDiscoveryHandler:(id)a3;
- (void)setDiscoveryIdentifier:(unint64_t)a3;
@end

@implementation HKHealthServiceDiscovery

- (HKHealthServiceDiscovery)initWithType:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HKHealthServiceDiscovery;
  v4 = [(HKHealthServiceDiscovery *)&v12 init];
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if ((unint64_t)a3 >= 4)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v7 raise:v8, @"%@, HKHealthServiceType parameter requires a valid type.", v10 format];

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v4->_serviceType = a3;
  v4->_discoveryIdentifier = 0;
  v6 = v4;
LABEL_6:

  return v6;
}

- (id)initForAllTypes
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthServiceDiscovery;
  v2 = [(HKHealthServiceDiscovery *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_serviceType = -2;
    v2->_discoveryIdentifier = 0;
    v4 = v2;
  }

  return v3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (unint64_t)discoveryIdentifier
{
  return self->_discoveryIdentifier;
}

- (void)setDiscoveryIdentifier:(unint64_t)a3
{
  self->_discoveryIdentifier = a3;
}

- (id)discoveryHandler
{
  return self->_discoveryHandler;
}

- (void)setDiscoveryHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
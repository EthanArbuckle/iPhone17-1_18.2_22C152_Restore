@interface IRSessionSpotOnLocationParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)resetAllBrokerDiscoveredCandidates;
- (IRSessionSpotOnLocationParameters)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setResetAllBrokerDiscoveredCandidates:(BOOL)a3;
@end

@implementation IRSessionSpotOnLocationParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(IRSessionSpotOnLocationParameters);
  v4->_resetAllBrokerDiscoveredCandidates = [(IRSessionSpotOnLocationParameters *)self resetAllBrokerDiscoveredCandidates];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  BOOL resetAllBrokerDiscoveredCandidates = self->_resetAllBrokerDiscoveredCandidates;
  id v5 = a3;
  id v6 = [v3 numberWithBool:resetAllBrokerDiscoveredCandidates];
  [v5 encodeObject:v6 forKey:@"resetAllBrokerDiscoveredCandidates"];
}

- (IRSessionSpotOnLocationParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRSessionSpotOnLocationParameters;
  id v5 = [(IRSessionSpotOnLocationParameters *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resetAllBrokerDiscoveredCandidates"];
    v7 = v6;
    if (v6)
    {
      char v8 = [(IRSessionSpotOnLocationParameters *)v6 BOOLValue];

      v5->_BOOL resetAllBrokerDiscoveredCandidates = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  v7 = [NSNumber numberWithBool:self->_resetAllBrokerDiscoveredCandidates];
  [v6 appendFormat:@", resetAllBrokerDiscoveredCandidates: %@", v7];

  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(IRSessionSpotOnLocationParameters *)self resetAllBrokerDiscoveredCandidates];
    char v7 = [v5 resetAllBrokerDiscoveredCandidates];

    char v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_resetAllBrokerDiscoveredCandidates ^ 0x1FLL;
}

- (BOOL)resetAllBrokerDiscoveredCandidates
{
  return self->_resetAllBrokerDiscoveredCandidates;
}

- (void)setResetAllBrokerDiscoveredCandidates:(BOOL)a3
{
  self->_BOOL resetAllBrokerDiscoveredCandidates = a3;
}

@end
@interface AXAuditObjectTransportPropertyEntry
- (NSString)transportKey;
- (id)localValueToTransportValue;
- (id)populateLocalObjectWithTransportValue;
- (void)setLocalValueToTransportValue:(id)a3;
- (void)setPopulateLocalObjectWithTransportValue:(id)a3;
- (void)setTransportKey:(id)a3;
@end

@implementation AXAuditObjectTransportPropertyEntry

- (NSString)transportKey
{
  return self->_transportKey;
}

- (void)setTransportKey:(id)a3
{
}

- (id)localValueToTransportValue
{
  return self->_localValueToTransportValue;
}

- (void)setLocalValueToTransportValue:(id)a3
{
}

- (id)populateLocalObjectWithTransportValue
{
  return self->_populateLocalObjectWithTransportValue;
}

- (void)setPopulateLocalObjectWithTransportValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_populateLocalObjectWithTransportValue, 0);
  objc_storeStrong(&self->_localValueToTransportValue, 0);

  objc_storeStrong((id *)&self->_transportKey, 0);
}

@end
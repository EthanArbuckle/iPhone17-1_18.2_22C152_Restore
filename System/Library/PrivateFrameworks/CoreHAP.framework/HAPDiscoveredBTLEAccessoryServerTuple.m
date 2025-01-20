@interface HAPDiscoveredBTLEAccessoryServerTuple
+ (id)discoveredAccessoryServerTupleWithAccessoryServer:(id)a3;
- (HAPAccessoryServerBTLE)accessoryServer;
- (double)lastSeen;
- (void)setLastSeen:(double)a3;
@end

@implementation HAPDiscoveredBTLEAccessoryServerTuple

- (void).cxx_destruct
{
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (HAPAccessoryServerBTLE)accessoryServer
{
  return self->_accessoryServer;
}

+ (id)discoveredAccessoryServerTupleWithAccessoryServer:(id)a3
{
  v3 = (HAPAccessoryServerBTLE *)a3;
  v4 = objc_alloc_init(HAPDiscoveredBTLEAccessoryServerTuple);
  accessoryServer = v4->_accessoryServer;
  v4->_accessoryServer = v3;

  [(HAPDiscoveredBTLEAccessoryServerTuple *)v4 setLastSeen:CFAbsoluteTimeGetCurrent()];

  return v4;
}

@end
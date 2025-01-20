@interface HMDAccessoryReachabilityTuple
+ (id)tupleWithAccessoryUUID:(id)a3 reachable:(BOOL)a4;
- (BOOL)currentReachability;
- (BOOL)isEqual:(id)a3;
- (BOOL)previouslySentReachability;
- (NSString)accessoryUUID;
- (id)description;
- (unint64_t)currentSuspendedState;
- (unint64_t)hash;
- (unint64_t)previouslySentSuspendedState;
- (void)setAccessoryUUID:(id)a3;
- (void)setCurrentReachability:(BOOL)a3;
- (void)setCurrentSuspendedState:(unint64_t)a3;
- (void)setPreviouslySentReachability:(BOOL)a3;
- (void)setPreviouslySentSuspendedState:(unint64_t)a3;
@end

@implementation HMDAccessoryReachabilityTuple

- (void).cxx_destruct
{
}

- (void)setCurrentSuspendedState:(unint64_t)a3
{
  self->_currentSuspendedState = a3;
}

- (unint64_t)currentSuspendedState
{
  return self->_currentSuspendedState;
}

- (void)setPreviouslySentSuspendedState:(unint64_t)a3
{
  self->_previouslySentSuspendedState = a3;
}

- (unint64_t)previouslySentSuspendedState
{
  return self->_previouslySentSuspendedState;
}

- (void)setCurrentReachability:(BOOL)a3
{
  self->_currentReachability = a3;
}

- (BOOL)currentReachability
{
  return self->_currentReachability;
}

- (void)setPreviouslySentReachability:(BOOL)a3
{
  self->_previouslySentReachability = a3;
}

- (BOOL)previouslySentReachability
{
  return self->_previouslySentReachability;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSString)accessoryUUID
{
  return self->_accessoryUUID;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDAccessoryReachabilityTuple *)self accessoryUUID];
  [(HMDAccessoryReachabilityTuple *)self previouslySentReachability];
  v5 = HMFBooleanToString();
  [(HMDAccessoryReachabilityTuple *)self currentReachability];
  v6 = HMFBooleanToString();
  v7 = [v3 stringWithFormat:@"AccessoryUUID: %@, initialReachability: %@, currentReachability: %@", v4, v5, v6];

  [(HMDAccessoryReachabilityTuple *)self previouslySentSuspendedState];
  v8 = HAPAccessorySuspendedStateDescription();
  [(HMDAccessoryReachabilityTuple *)self currentSuspendedState];
  v9 = HAPAccessorySuspendedStateDescription();
  v10 = [v7 stringByAppendingFormat:@", initialSuspendedState: %@, currentSuspendedState: '%@'", v8, v9];

  return v10;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryReachabilityTuple *)self accessoryUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryReachabilityTuple *)self accessoryUUID];
  v6 = [v4 accessoryUUID];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

+ (id)tupleWithAccessoryUUID:(id)a3 reachable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(HMDAccessoryReachabilityTuple);
  [(HMDAccessoryReachabilityTuple *)v6 setAccessoryUUID:v5];

  [(HMDAccessoryReachabilityTuple *)v6 setPreviouslySentReachability:v4 ^ 1];
  [(HMDAccessoryReachabilityTuple *)v6 setCurrentReachability:v4];
  return v6;
}

@end
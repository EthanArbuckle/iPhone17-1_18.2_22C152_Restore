@interface HMDAccessoryTransportReachabilityReport
- (BOOL)hasAdvertisement;
- (BOOL)reachable;
- (HMDAccessoryTransportReachabilityReport)initWithLinkType:(id)a3 hasAdvertisement:(BOOL)a4 protocol:(id)a5 protocolVersion:(id)a6 reachable:(BOOL)a7 reachableLastChangedTime:(id)a8 reason:(id)a9;
- (NSDate)reachableLastChangedTime;
- (NSString)linkType;
- (NSString)protocol;
- (NSString)protocolVersion;
- (NSString)reason;
- (void)setReason:(id)a3;
@end

@implementation HMDAccessoryTransportReachabilityReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_linkType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_reachableLastChangedTime, 0);
}

- (NSString)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)linkType
{
  return self->_linkType;
}

- (BOOL)hasAdvertisement
{
  return self->_hasAdvertisement;
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)reachableLastChangedTime
{
  return self->_reachableLastChangedTime;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (HMDAccessoryTransportReachabilityReport)initWithLinkType:(id)a3 hasAdvertisement:(BOOL)a4 protocol:(id)a5 protocolVersion:(id)a6 reachable:(BOOL)a7 reachableLastChangedTime:(id)a8 reason:(id)a9
{
  id v23 = a3;
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessoryTransportReachabilityReport;
  v18 = [(HMDAccessoryTransportReachabilityReport *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_linkType, a3);
    v19->_hasAdvertisement = a4;
    objc_storeStrong((id *)&v19->_protocol, a5);
    objc_storeStrong((id *)&v19->_protocolVersion, a6);
    v19->_reachable = a7;
    objc_storeStrong((id *)&v19->_reachableLastChangedTime, a8);
    objc_storeStrong((id *)&v19->_reason, a9);
  }

  return v19;
}

@end
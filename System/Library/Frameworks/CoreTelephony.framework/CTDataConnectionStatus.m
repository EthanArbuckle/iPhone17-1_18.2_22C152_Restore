@interface CTDataConnectionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)publicNetAllowed;
- (BOOL)suspended;
- (CTDataConnectionStatus)initWithCoder:(id)a3;
- (NSArray)qosFlows;
- (NSArray)trafficDescriptors;
- (NSNumber)pdp;
- (NSString)apnName;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)contextType;
- (int)ipFamily;
- (int)state;
- (int)transportType;
- (unsigned)wirelessTechnologyMask;
- (void)encodeWithCoder:(id)a3;
- (void)setApnName:(id)a3;
- (void)setContextType:(int)a3;
- (void)setInterfaceName:(id)a3;
- (void)setIpFamily:(int)a3;
- (void)setPdp:(id)a3;
- (void)setPublicNetAllowed:(BOOL)a3;
- (void)setQosFlows:(id)a3;
- (void)setState:(int)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTrafficDescriptors:(id)a3;
- (void)setTransportType:(int)a3;
- (void)setWirelessTechnologyMask:(unsigned int)a3;
@end

@implementation CTDataConnectionStatus

- (CTDataConnectionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTDataConnectionStatus;
  v5 = [(CTDataConnectionStatus *)&v23 init];
  if (v5)
  {
    v5->_suspended = [v4 decodeBoolForKey:@"suspended"];
    v5->_publicNetAllowed = [v4 decodeBoolForKey:@"pubNet"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pdp"];
    pdp = v5->_pdp;
    v5->_pdp = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interfaceName"];
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apnName"];
    apnName = v5->_apnName;
    v5->_apnName = (NSString *)v10;

    v5->_wirelessTechnologyMask = [v4 decodeIntForKey:@"wt"];
    v5->_state = [v4 decodeIntForKey:@"state"];
    v5->_ipFamily = [v4 decodeIntForKey:@"ipFamily"];
    v5->_contextType = [v4 decodeIntForKey:@"contextType"];
    v5->_transportType = [v4 decodeIntForKey:@"transportType"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"qosFlows"];
    qosFlows = v5->_qosFlows;
    v5->_qosFlows = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"trafficDescriptors"];
    trafficDescriptors = v5->_trafficDescriptors;
    v5->_trafficDescriptors = (NSArray *)v20;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTDataConnectionStatus *)self pdp];
  [v3 appendFormat:@", pdp=%@", v4];

  v5 = [(CTDataConnectionStatus *)self interfaceName];
  [v3 appendFormat:@", interfaceName=%@", v5];

  uint64_t v6 = [(CTDataConnectionStatus *)self apnName];
  [v3 appendFormat:@", apnName=%@", v6];

  [v3 appendFormat:@", wirelessTechnologyMask=%d", -[CTDataConnectionStatus wirelessTechnologyMask](self, "wirelessTechnologyMask")];
  [v3 appendFormat:@", state=%d", -[CTDataConnectionStatus state](self, "state")];
  [v3 appendFormat:@", ipFamily=%d", -[CTDataConnectionStatus ipFamily](self, "ipFamily")];
  [v3 appendFormat:@", suspended=%d", -[CTDataConnectionStatus suspended](self, "suspended")];
  [v3 appendFormat:@", publicNetAllowed=%d", -[CTDataConnectionStatus publicNetAllowed](self, "publicNetAllowed")];
  [v3 appendFormat:@", contextType=%d", -[CTDataConnectionStatus contextType](self, "contextType")];
  [v3 appendFormat:@", transportType=%d", -[CTDataConnectionStatus transportType](self, "transportType")];
  v7 = [(CTDataConnectionStatus *)self qosFlows];

  if (v7)
  {
    uint64_t v8 = [(CTDataConnectionStatus *)self qosFlows];
    [v3 appendFormat:@", qosFlows=[%@]", v8];
  }
  v9 = [(CTDataConnectionStatus *)self trafficDescriptors];

  if (v9)
  {
    uint64_t v10 = [(CTDataConnectionStatus *)self trafficDescriptors];
    [v3 appendFormat:@", trafficDescriptors=[%@]", v10];
  }
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[CTDataConnectionStatus suspended](self, "suspended"), @"suspended");
  objc_msgSend(v11, "encodeBool:forKey:", -[CTDataConnectionStatus publicNetAllowed](self, "publicNetAllowed"), @"pubNet");
  id v4 = [(CTDataConnectionStatus *)self pdp];
  [v11 encodeObject:v4 forKey:@"pdp"];

  v5 = [(CTDataConnectionStatus *)self interfaceName];
  [v11 encodeObject:v5 forKey:@"interfaceName"];

  uint64_t v6 = [(CTDataConnectionStatus *)self apnName];
  [v11 encodeObject:v6 forKey:@"apnName"];

  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus wirelessTechnologyMask](self, "wirelessTechnologyMask"), @"wt");
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus state](self, "state"), @"state");
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus ipFamily](self, "ipFamily"), @"ipFamily");
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus contextType](self, "contextType"), @"contextType");
  objc_msgSend(v11, "encodeInt:forKey:", -[CTDataConnectionStatus transportType](self, "transportType"), @"transportType");
  v7 = [(CTDataConnectionStatus *)self qosFlows];

  if (v7)
  {
    uint64_t v8 = [(CTDataConnectionStatus *)self qosFlows];
    [v11 encodeObject:v8 forKey:@"qosFlows"];
  }
  v9 = [(CTDataConnectionStatus *)self trafficDescriptors];

  if (v9)
  {
    uint64_t v10 = [(CTDataConnectionStatus *)self trafficDescriptors];
    [v11 encodeObject:v10 forKey:@"trafficDescriptors"];
  }
}

- (int)state
{
  return self->_state;
}

- (unsigned)wirelessTechnologyMask
{
  return self->_wirelessTechnologyMask;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSArray)trafficDescriptors
{
  return self->_trafficDescriptors;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (NSArray)qosFlows
{
  return self->_qosFlows;
}

- (BOOL)publicNetAllowed
{
  return self->_publicNetAllowed;
}

- (NSNumber)pdp
{
  return self->_pdp;
}

- (int)ipFamily
{
  return self->_ipFamily;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int)contextType
{
  return self->_contextType;
}

- (NSString)apnName
{
  return self->_apnName;
}

- (void)setWirelessTechnologyMask:(unsigned int)a3
{
  self->_wirelessTechnologyMask = a3;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void)setPublicNetAllowed:(BOOL)a3
{
  self->_publicNetAllowed = a3;
}

- (void)setIpFamily:(int)a3
{
  self->_ipFamily = a3;
}

- (void)setContextType:(int)a3
{
  self->_contextType = a3;
}

- (void)setTrafficDescriptors:(id)a3
{
}

- (void)setQosFlows:(id)a3
{
}

- (void)setPdp:(id)a3
{
}

- (void)setInterfaceName:(id)a3
{
}

- (void)setApnName:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDescriptors, 0);
  objc_storeStrong((id *)&self->_qosFlows, 0);
  objc_storeStrong((id *)&self->_apnName, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);

  objc_storeStrong((id *)&self->_pdp, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTDataConnectionStatus *)self pdp];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPdp:v6];

  v7 = [(CTDataConnectionStatus *)self interfaceName];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setInterfaceName:v8];

  v9 = [(CTDataConnectionStatus *)self apnName];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setApnName:v10];

  objc_msgSend(v4, "setWirelessTechnologyMask:", -[CTDataConnectionStatus wirelessTechnologyMask](self, "wirelessTechnologyMask"));
  objc_msgSend(v4, "setState:", -[CTDataConnectionStatus state](self, "state"));
  objc_msgSend(v4, "setIpFamily:", -[CTDataConnectionStatus ipFamily](self, "ipFamily"));
  objc_msgSend(v4, "setSuspended:", -[CTDataConnectionStatus suspended](self, "suspended"));
  objc_msgSend(v4, "setPublicNetAllowed:", -[CTDataConnectionStatus publicNetAllowed](self, "publicNetAllowed"));
  objc_msgSend(v4, "setContextType:", -[CTDataConnectionStatus contextType](self, "contextType"));
  objc_msgSend(v4, "setTransportType:", -[CTDataConnectionStatus transportType](self, "transportType"));
  id v11 = [(CTDataConnectionStatus *)self qosFlows];

  if (v11)
  {
    v12 = [(CTDataConnectionStatus *)self qosFlows];
    uint64_t v13 = (void *)[v12 copy];
    [v4 setQosFlows:v13];
  }
  v14 = [(CTDataConnectionStatus *)self trafficDescriptors];

  if (v14)
  {
    uint64_t v15 = [(CTDataConnectionStatus *)self trafficDescriptors];
    v16 = (void *)[v15 copy];
    [v4 setTrafficDescriptors:v16];
  }
  return v4;
}

@end
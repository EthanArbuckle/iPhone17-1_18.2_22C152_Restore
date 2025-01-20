@interface CTTrafficDescriptor
+ (BOOL)supportsSecureCoding;
- (CTTrafficDescriptor)initWithCoder:(id)a3;
- (NSNumber)ipProtocol;
- (NSNumber)llphs;
- (NSNumber)port;
- (NSNumber)portRangeLow;
- (NSNumber)portRangeUpper;
- (NSNumber)trafficClass;
- (NSString)accountId;
- (NSString)address;
- (NSString)appCategory;
- (NSString)bundleId;
- (NSString)dnn;
- (NSString)host;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAppCategory:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setDnn:(id)a3;
- (void)setHost:(id)a3;
- (void)setIpProtocol:(id)a3;
- (void)setLlphs:(id)a3;
- (void)setPort:(id)a3;
- (void)setPortRangeLow:(id)a3;
- (void)setPortRangeUpper:(id)a3;
- (void)setTrafficClass:(id)a3;
@end

@implementation CTTrafficDescriptor

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTTrafficDescriptor *)self bundleId];

  if (v4)
  {
    v5 = [(CTTrafficDescriptor *)self bundleId];
    [v3 appendFormat:@", bundleId=%@", v5];
  }
  v6 = [(CTTrafficDescriptor *)self accountId];

  if (v6)
  {
    v7 = [(CTTrafficDescriptor *)self accountId];
    [v3 appendFormat:@", accountId=%@", v7];
  }
  v8 = [(CTTrafficDescriptor *)self appCategory];

  if (v8)
  {
    v9 = [(CTTrafficDescriptor *)self appCategory];
    [v3 appendFormat:@", appCategory=%@", v9];
  }
  v10 = [(CTTrafficDescriptor *)self llphs];

  if (v10)
  {
    v11 = [(CTTrafficDescriptor *)self llphs];
    [v3 appendFormat:@", llphs=%@", v11];
  }
  v12 = [(CTTrafficDescriptor *)self host];

  if (v12)
  {
    v13 = [(CTTrafficDescriptor *)self host];
    [v3 appendFormat:@", host=%@", v13];
  }
  v14 = [(CTTrafficDescriptor *)self address];

  if (v14)
  {
    v15 = [(CTTrafficDescriptor *)self address];
    [v3 appendFormat:@", address=%@", v15];
  }
  v16 = [(CTTrafficDescriptor *)self port];

  if (v16)
  {
    v17 = [(CTTrafficDescriptor *)self port];
    [v3 appendFormat:@", port=%@", v17];
  }
  v18 = [(CTTrafficDescriptor *)self portRangeLow];

  if (v18)
  {
    v19 = [(CTTrafficDescriptor *)self portRangeLow];
    [v3 appendFormat:@", portRangeLow=%@", v19];
  }
  v20 = [(CTTrafficDescriptor *)self portRangeUpper];

  if (v20)
  {
    v21 = [(CTTrafficDescriptor *)self portRangeUpper];
    [v3 appendFormat:@", portRangeUpper=%@", v21];
  }
  v22 = [(CTTrafficDescriptor *)self ipProtocol];

  if (v22)
  {
    v23 = [(CTTrafficDescriptor *)self ipProtocol];
    [v3 appendFormat:@", ipProtocol=%@", v23];
  }
  v24 = [(CTTrafficDescriptor *)self trafficClass];

  if (v24)
  {
    v25 = [(CTTrafficDescriptor *)self trafficClass];
    [v3 appendFormat:@", trafficClass=%@", v25];
  }
  v26 = [(CTTrafficDescriptor *)self dnn];

  if (v26)
  {
    v27 = [(CTTrafficDescriptor *)self dnn];
    [v3 appendFormat:@", dnn=%@", v27];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTTrafficDescriptor *)self bundleId];

  if (v5)
  {
    v6 = [(CTTrafficDescriptor *)self bundleId];
    v7 = (void *)[v6 copy];
    [v4 setBundleId:v7];
  }
  v8 = [(CTTrafficDescriptor *)self accountId];

  if (v8)
  {
    v9 = [(CTTrafficDescriptor *)self accountId];
    v10 = (void *)[v9 copy];
    [v4 setAccountId:v10];
  }
  v11 = [(CTTrafficDescriptor *)self appCategory];

  if (v11)
  {
    v12 = [(CTTrafficDescriptor *)self appCategory];
    v13 = (void *)[v12 copy];
    [v4 setAppCategory:v13];
  }
  v14 = [(CTTrafficDescriptor *)self llphs];

  if (v14)
  {
    v15 = [(CTTrafficDescriptor *)self llphs];
    v16 = (void *)[v15 copy];
    [v4 setLlphs:v16];
  }
  v17 = [(CTTrafficDescriptor *)self host];

  if (v17)
  {
    v18 = [(CTTrafficDescriptor *)self host];
    v19 = (void *)[v18 copy];
    [v4 setHost:v19];
  }
  v20 = [(CTTrafficDescriptor *)self address];

  if (v20)
  {
    v21 = [(CTTrafficDescriptor *)self address];
    v22 = (void *)[v21 copy];
    [v4 setAddress:v22];
  }
  v23 = [(CTTrafficDescriptor *)self port];

  if (v23)
  {
    v24 = [(CTTrafficDescriptor *)self port];
    v25 = (void *)[v24 copy];
    [v4 setPort:v25];
  }
  v26 = [(CTTrafficDescriptor *)self portRangeLow];

  if (v26)
  {
    v27 = [(CTTrafficDescriptor *)self portRangeLow];
    v28 = (void *)[v27 copy];
    [v4 setPortRangeLow:v28];
  }
  v29 = [(CTTrafficDescriptor *)self portRangeUpper];

  if (v29)
  {
    v30 = [(CTTrafficDescriptor *)self portRangeUpper];
    v31 = (void *)[v30 copy];
    [v4 setPortRangeUpper:v31];
  }
  v32 = [(CTTrafficDescriptor *)self ipProtocol];

  if (v32)
  {
    v33 = [(CTTrafficDescriptor *)self ipProtocol];
    v34 = (void *)[v33 copy];
    [v4 setIpProtocol:v34];
  }
  v35 = [(CTTrafficDescriptor *)self trafficClass];

  if (v35)
  {
    v36 = [(CTTrafficDescriptor *)self trafficClass];
    v37 = (void *)[v36 copy];
    [v4 setTrafficClass:v37];
  }
  v38 = [(CTTrafficDescriptor *)self dnn];

  if (v38)
  {
    v39 = [(CTTrafficDescriptor *)self dnn];
    v40 = (void *)[v39 copy];
    [v4 setDnn:v40];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v28 = a3;
  v4 = [(CTTrafficDescriptor *)self bundleId];

  if (v4)
  {
    v5 = [(CTTrafficDescriptor *)self bundleId];
    [v28 encodeObject:v5 forKey:@"bundleId"];
  }
  v6 = [(CTTrafficDescriptor *)self accountId];

  if (v6)
  {
    v7 = [(CTTrafficDescriptor *)self accountId];
    [v28 encodeObject:v7 forKey:@"accountId"];
  }
  v8 = [(CTTrafficDescriptor *)self appCategory];

  if (v8)
  {
    v9 = [(CTTrafficDescriptor *)self appCategory];
    [v28 encodeObject:v9 forKey:@"appCategory"];
  }
  v10 = [(CTTrafficDescriptor *)self llphs];

  if (v10)
  {
    v11 = [(CTTrafficDescriptor *)self llphs];
    [v28 encodeObject:v11 forKey:@"llphs"];
  }
  v12 = [(CTTrafficDescriptor *)self host];

  if (v12)
  {
    v13 = [(CTTrafficDescriptor *)self host];
    [v28 encodeObject:v13 forKey:@"host"];
  }
  v14 = [(CTTrafficDescriptor *)self address];

  if (v14)
  {
    v15 = [(CTTrafficDescriptor *)self address];
    [v28 encodeObject:v15 forKey:@"address"];
  }
  v16 = [(CTTrafficDescriptor *)self port];

  if (v16)
  {
    v17 = [(CTTrafficDescriptor *)self port];
    [v28 encodeObject:v17 forKey:@"port"];
  }
  v18 = [(CTTrafficDescriptor *)self portRangeLow];

  if (v18)
  {
    v19 = [(CTTrafficDescriptor *)self portRangeLow];
    [v28 encodeObject:v19 forKey:@"portRangeLow"];
  }
  v20 = [(CTTrafficDescriptor *)self portRangeUpper];

  if (v20)
  {
    v21 = [(CTTrafficDescriptor *)self portRangeUpper];
    [v28 encodeObject:v21 forKey:@"portRangeUpper"];
  }
  v22 = [(CTTrafficDescriptor *)self ipProtocol];

  if (v22)
  {
    v23 = [(CTTrafficDescriptor *)self ipProtocol];
    [v28 encodeObject:v23 forKey:@"ipProtocol"];
  }
  v24 = [(CTTrafficDescriptor *)self trafficClass];

  if (v24)
  {
    v25 = [(CTTrafficDescriptor *)self trafficClass];
    [v28 encodeObject:v25 forKey:@"trafficClass"];
  }
  v26 = [(CTTrafficDescriptor *)self dnn];

  if (v26)
  {
    v27 = [(CTTrafficDescriptor *)self dnn];
    [v28 encodeObject:v27 forKey:@"dnn"];
  }
}

- (CTTrafficDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CTTrafficDescriptor;
  v5 = [(CTTrafficDescriptor *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountId"];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appCategory"];
    appCategory = v5->_appCategory;
    v5->_appCategory = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"host"];
    host = v5->_host;
    v5->_host = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"llphs"];
    llphs = v5->_llphs;
    v5->_llphs = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"port"];
    port = v5->_port;
    v5->_port = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portRangeLow"];
    portRangeLow = v5->_portRangeLow;
    v5->_portRangeLow = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"portRangeUpper"];
    portRangeUpper = v5->_portRangeUpper;
    v5->_portRangeUpper = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ipProtocol"];
    ipProtocol = v5->_ipProtocol;
    v5->_ipProtocol = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trafficClass"];
    trafficClass = v5->_trafficClass;
    v5->_trafficClass = (NSNumber *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dnn"];
    dnn = v5->_dnn;
    v5->_dnn = (NSString *)v28;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)appCategory
{
  return self->_appCategory;
}

- (void)setAppCategory:(id)a3
{
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSNumber)llphs
{
  return self->_llphs;
}

- (void)setLlphs:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (NSNumber)portRangeLow
{
  return self->_portRangeLow;
}

- (void)setPortRangeLow:(id)a3
{
}

- (NSNumber)portRangeUpper
{
  return self->_portRangeUpper;
}

- (void)setPortRangeUpper:(id)a3
{
}

- (NSNumber)ipProtocol
{
  return self->_ipProtocol;
}

- (void)setIpProtocol:(id)a3
{
}

- (NSNumber)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(id)a3
{
}

- (NSString)dnn
{
  return self->_dnn;
}

- (void)setDnn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnn, 0);
  objc_storeStrong((id *)&self->_trafficClass, 0);
  objc_storeStrong((id *)&self->_ipProtocol, 0);
  objc_storeStrong((id *)&self->_portRangeUpper, 0);
  objc_storeStrong((id *)&self->_portRangeLow, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_llphs, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_appCategory, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
@interface DMFSetAppExtensionUUIDsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetAppExtensionUUIDsRequest)initWithCoder:(id)a3;
- (NSString)DNSProxyUUIDString;
- (NSString)VPNUUIDString;
- (NSString)cellularSliceUUIDString;
- (NSString)contentFilterUUIDString;
- (NSString)relayUUIDString;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularSliceUUIDString:(id)a3;
- (void)setContentFilterUUIDString:(id)a3;
- (void)setDNSProxyUUIDString:(id)a3;
- (void)setRelayUUIDString:(id)a3;
- (void)setVPNUUIDString:(id)a3;
@end

@implementation DMFSetAppExtensionUUIDsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB970;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetAppExtensionUUIDsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFSetAppExtensionUUIDsRequest;
  v5 = [(DMFAppRequest *)&v22 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"VPNUUIDString"];
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"cellularSliceUUIDString"];
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"contentFilterUUIDString"];
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"DNSProxyUUIDString"];
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"relayUUIDString"];
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DMFSetAppExtensionUUIDsRequest;
  id v4 = a3;
  [(DMFAppRequest *)&v10 encodeWithCoder:v4];
  v5 = [(DMFSetAppExtensionUUIDsRequest *)self VPNUUIDString];
  [v4 encodeObject:v5 forKey:@"VPNUUIDString"];

  v6 = [(DMFSetAppExtensionUUIDsRequest *)self cellularSliceUUIDString];
  [v4 encodeObject:v6 forKey:@"cellularSliceUUIDString"];

  uint64_t v7 = [(DMFSetAppExtensionUUIDsRequest *)self contentFilterUUIDString];
  [v4 encodeObject:v7 forKey:@"contentFilterUUIDString"];

  v8 = [(DMFSetAppExtensionUUIDsRequest *)self DNSProxyUUIDString];
  [v4 encodeObject:v8 forKey:@"DNSProxyUUIDString"];

  v9 = [(DMFSetAppExtensionUUIDsRequest *)self relayUUIDString];
  [v4 encodeObject:v9 forKey:@"relayUUIDString"];
}

- (NSString)VPNUUIDString
{
  return self->_VPNUUIDString;
}

- (void)setVPNUUIDString:(id)a3
{
}

- (NSString)cellularSliceUUIDString
{
  return self->_cellularSliceUUIDString;
}

- (void)setCellularSliceUUIDString:(id)a3
{
}

- (NSString)contentFilterUUIDString
{
  return self->_contentFilterUUIDString;
}

- (void)setContentFilterUUIDString:(id)a3
{
}

- (NSString)DNSProxyUUIDString
{
  return self->_DNSProxyUUIDString;
}

- (void)setDNSProxyUUIDString:(id)a3
{
}

- (NSString)relayUUIDString
{
  return self->_relayUUIDString;
}

- (void)setRelayUUIDString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayUUIDString, 0);
  objc_storeStrong((id *)&self->_DNSProxyUUIDString, 0);
  objc_storeStrong((id *)&self->_contentFilterUUIDString, 0);
  objc_storeStrong((id *)&self->_cellularSliceUUIDString, 0);
  objc_storeStrong((id *)&self->_VPNUUIDString, 0);
}

@end
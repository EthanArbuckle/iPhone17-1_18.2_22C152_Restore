@interface COIDSDiscoveryRecord
- (BOOL)hasSameBackingDeviceAs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)producesElectionCapableTransport;
- (BOOL)requiresInquiry;
- (COIDSDiscoveryRecord)initWithIdsIdentifier:(id)a3 deviceTokenURI:(id)a4;
- (COIDSServiceDirector)serviceDirector;
- (COOnDemandIDSNodeCreationRequest)onDemandRequest;
- (NSString)IDSIdentifier;
- (NSString)description;
- (NSString)deviceTokenURI;
- (NSUUID)HomeKitIdentifier;
- (id)newTransportWithExecutionContext:(id)a3;
- (unint64_t)hash;
- (void)setOnDemandRequest:(id)a3;
- (void)setServiceDirector:(id)a3;
@end

@implementation COIDSDiscoveryRecord

- (COIDSDiscoveryRecord)initWithIdsIdentifier:(id)a3 deviceTokenURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)COIDSDiscoveryRecord;
  v8 = [(COIDSDiscoveryRecord *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    IDSIdentifier = v8->_IDSIdentifier;
    v8->_IDSIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    deviceTokenURI = v8->_deviceTokenURI;
    v8->_deviceTokenURI = (NSString *)v11;
  }
  return v8;
}

- (NSUUID)HomeKitIdentifier
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(COIDSDiscoveryRecord *)self IDSIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p, IDS: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4 = a3;
  v5 = [(COIDSDiscoveryRecord *)self IDSIdentifier];
  id v6 = [v4 IDSIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)producesElectionCapableTransport
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(COIDSDiscoveryRecord *)self IDSIdentifier];
  uint64_t v3 = [v2 hash];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (BOOL)requiresInquiry
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COIDSDiscoveryRecord *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(COIDSDiscoveryRecord *)self IDSIdentifier];
      unint64_t v6 = [(COIDSDiscoveryRecord *)v4 IDSIdentifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4 = a3;
  v5 = [(COIDSDiscoveryRecord *)self serviceDirector];
  unint64_t v6 = [v5 transportWithDiscoveryRecord:self withExecutionContext:v4];

  return v6;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (COIDSServiceDirector)serviceDirector
{
  return self->_serviceDirector;
}

- (void)setServiceDirector:(id)a3
{
}

- (NSString)deviceTokenURI
{
  return self->_deviceTokenURI;
}

- (COOnDemandIDSNodeCreationRequest)onDemandRequest
{
  return self->_onDemandRequest;
}

- (void)setOnDemandRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRequest, 0);
  objc_storeStrong((id *)&self->_deviceTokenURI, 0);
  objc_storeStrong((id *)&self->_serviceDirector, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

@end
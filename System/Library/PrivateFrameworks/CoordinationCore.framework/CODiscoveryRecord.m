@interface CODiscoveryRecord
+ (BOOL)supportsSecureCoding;
+ (CODiscoveryRecord)discoveryRecordWithConstituent:(id)a3 rapportIdentifier:(id)a4 IDSIdentifier:(id)a5 peerAddress:(id)a6 port:(int)a7;
+ (CODiscoveryRecord)discoveryRecordWithNode:(id)a3;
+ (CODiscoveryRecord)discoveryRecordWithNodeController:(id)a3;
+ (id)_destinationForPeerAddress:(id)a3 listeningPort:(unsigned __int16)a4;
- (BOOL)hasSameBackingDeviceAs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDiscoveryRecord:(id)a3;
- (BOOL)producesElectionCapableTransport;
- (BOOL)requiresInquiry;
- (BOOL)shouldAdvertise;
- (COConstituent)constituent;
- (CODiscoveryRecord)initWithCoder:(id)a3;
- (CODiscoveryRecord)initWithDiscoveryRecord:(id)a3;
- (CORapportTransport)sourceTransport;
- (COUnhandledRapportRequest)unhandledRequest;
- (NSOrderedSet)destinations;
- (NSString)IDSIdentifier;
- (NSString)description;
- (NSString)rapportIdentifier;
- (NSUUID)HomeKitIdentifier;
- (RPCompanionLinkDevice)companionLinkDevice;
- (id)_initWithConstituent:(id)a3 rapportIdentifier:(id)a4 IDSIdentifier:(id)a5 destinations:(id)a6;
- (id)companionLinkProvider;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newTransportWithExecutionContext:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCompanionLinkProvider:(id)a3;
- (void)setConstituent:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setSourceTransport:(id)a3;
- (void)setUnhandledRequest:(id)a3;
@end

@implementation CODiscoveryRecord

- (id)_initWithConstituent:(id)a3 rapportIdentifier:(id)a4 IDSIdentifier:(id)a5 destinations:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CODiscoveryRecord;
  v15 = [(CODiscoveryRecord *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_constituent, a3);
    objc_storeStrong((id *)&v16->_rapportIdentifier, a4);
    objc_storeStrong((id *)&v16->_IDSIdentifier, a5);
    objc_storeStrong((id *)&v16->_destinations, a6);
    objc_initWeak(&location, v16);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __87__CODiscoveryRecord__initWithConstituent_rapportIdentifier_IDSIdentifier_destinations___block_invoke;
    v20[3] = &unk_2645CE718;
    objc_copyWeak(&v21, &location);
    uint64_t v17 = MEMORY[0x223C8B4A0](v20);
    id companionLinkProvider = v16->_companionLinkProvider;
    v16->_id companionLinkProvider = (id)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v16;
}

id __87__CODiscoveryRecord__initWithConstituent_rapportIdentifier_IDSIdentifier_destinations___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x263F62B70];
    v4 = [WeakRetained companionLinkDevice];
    v5 = [v2 sourceTransport];
    v6 = [v5 client];
    v7 = [v6 dispatchQueue];
    v8 = objc_msgSend(v3, "co_companionLinkClientToDevice:dispatchQueue:", v4, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (CODiscoveryRecord)discoveryRecordWithNodeController:(id)a3
{
  id v4 = a3;
  v5 = [v4 node];
  v6 = [v5 remote];

  v7 = [v4 rapportTransport];

  v8 = [v7 client];
  v9 = [v8 destinationDevice];

  v10 = [v9 identifier];
  id v11 = [v9 idsDeviceIdentifier];
  id v12 = [v9 ipAddress];
  int v13 = [v9 listeningPort];
  if (v13 < 1)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = [a1 _destinationForPeerAddress:v12 listeningPort:(unsigned __int16)v13];
  }
  v15 = 0;
  if (v6 && v10 && v11 && v14)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithObject:v14];
    v15 = (void *)[objc_alloc((Class)a1) _initWithConstituent:v6 rapportIdentifier:v10 IDSIdentifier:v11 destinations:v16];
  }
  return (CODiscoveryRecord *)v15;
}

+ (CODiscoveryRecord)discoveryRecordWithNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 remote];
  v6 = [v4 client];
  v7 = [v6 destinationDevice];

  v8 = [v7 identifier];
  v9 = [v4 IDSIdentifier];

  v10 = [v7 ipAddress];
  int v11 = [v7 listeningPort];
  if (v11 < 1)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [a1 _destinationForPeerAddress:v10 listeningPort:(unsigned __int16)v11];
  }
  int v13 = 0;
  if (v5 && v8 && v9 && v12)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithObject:v12];
    int v13 = (void *)[objc_alloc((Class)a1) _initWithConstituent:v5 rapportIdentifier:v8 IDSIdentifier:v9 destinations:v14];
  }
  return (CODiscoveryRecord *)v13;
}

+ (CODiscoveryRecord)discoveryRecordWithConstituent:(id)a3 rapportIdentifier:(id)a4 IDSIdentifier:(id)a5 peerAddress:(id)a6 port:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [a1 _destinationForPeerAddress:a6 listeningPort:(unsigned __int16)a7];
  uint64_t v16 = [v15 length];
  if (!a7 || v16)
  {
    if (v15) {
      id v18 = (id)[objc_alloc(MEMORY[0x263EFF9D8]) initWithObject:v15];
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x263EFF9D8]);
    }
    v19 = v18;
    uint64_t v17 = (void *)[objc_alloc((Class)a1) _initWithConstituent:v12 rapportIdentifier:v13 IDSIdentifier:v14 destinations:v18];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return (CODiscoveryRecord *)v17;
}

- (CODiscoveryRecord)initWithDiscoveryRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 constituent];
  v6 = (void *)[v5 copy];
  v7 = [v4 rapportIdentifier];
  v8 = (void *)[v7 copy];
  v9 = [v4 IDSIdentifier];
  v10 = (void *)[v9 copy];
  int v11 = [v4 destinations];

  id v12 = (void *)[v11 copy];
  id v13 = [(CODiscoveryRecord *)self _initWithConstituent:v6 rapportIdentifier:v8 IDSIdentifier:v10 destinations:v12];

  return v13;
}

- (CODiscoveryRecord)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] == 1)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"constituent"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rapportIdentifier"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IDSIdentifier"];
    int v11 = [v4 decodeObjectOfClasses:v7 forKey:@"destinations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = (void *)[v11 copy];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        v19 = v7;
        v20 = v8;
        uint64_t v15 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              int v11 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_16:
        v7 = v19;
        v8 = v20;
      }

      if (!v8) {
        goto LABEL_22;
      }
    }
    else
    {

      int v11 = 0;
      if (!v8) {
        goto LABEL_22;
      }
    }
    if (v9 && v10 && v11)
    {
      uint64_t v17 = [(CODiscoveryRecord *)self _initWithConstituent:v8 rapportIdentifier:v9 IDSIdentifier:v10 destinations:v11];
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:

    uint64_t v17 = 0;
    goto LABEL_23;
  }

  uint64_t v17 = 0;
LABEL_24:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  v5 = [(CODiscoveryRecord *)self constituent];
  [v4 encodeObject:v5 forKey:@"constituent"];

  uint64_t v6 = [(CODiscoveryRecord *)self rapportIdentifier];
  [v4 encodeObject:v6 forKey:@"rapportIdentifier"];

  v7 = [(CODiscoveryRecord *)self IDSIdentifier];
  [v4 encodeObject:v7 forKey:@"IDSIdentifier"];

  id v8 = [(CODiscoveryRecord *)self destinations];
  [v4 encodeObject:v8 forKey:@"destinations"];
}

- (void)setCompanionLinkProvider:(id)a3
{
  self->_id companionLinkProvider = (id)MEMORY[0x223C8B4A0](a3, a2);
  MEMORY[0x270F9A758]();
}

- (id)companionLinkProvider
{
  v2 = (void *)MEMORY[0x223C8B4A0](self->_companionLinkProvider, a2);
  return v2;
}

- (NSUUID)HomeKitIdentifier
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = self->_HomeKitIdentifier;
  if (!v3)
  {
    id v4 = [(CODiscoveryRecord *)self IDSIdentifier];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v5 = [(CODiscoveryRecord *)self sourceTransport];
    uint64_t v6 = [v5 client];
    v7 = [v6 activeDevices];

    v3 = (NSUUID *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (NSUUID *)((char *)i + 1))
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v11 = [v10 idsDeviceIdentifier];
          if (v11 && ![v4 compare:v11 options:1])
          {
            id v12 = [v10 homeKitIdentifier];
            HomeKitIdentifier = self->_HomeKitIdentifier;
            self->_HomeKitIdentifier = v12;

            v3 = v12;
            goto LABEL_13;
          }
        }
        v3 = (NSUUID *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (BOOL)producesElectionCapableTransport
{
  v2 = [(CODiscoveryRecord *)self sourceTransport];
  v3 = [v2 executionContext];
  char v4 = [v3 leaderElectionConfigured];

  return v4;
}

- (BOOL)requiresInquiry
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  char v4 = [COMutableDiscoveryRecord alloc];
  return [(CODiscoveryRecord *)v4 initWithDiscoveryRecord:self];
}

- (NSString)description
{
  v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CODiscoveryRecord *)self constituent];
  v7 = [(CODiscoveryRecord *)self rapportIdentifier];
  uint64_t v8 = [(CODiscoveryRecord *)self IDSIdentifier];
  v9 = [(CODiscoveryRecord *)self destinations];
  v10 = [v3 stringWithFormat:@"<%@: %p, c(%@) r(%@) i(%@) d(%@)>", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (unint64_t)hash
{
  v2 = [(CODiscoveryRecord *)self constituent];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (CODiscoveryRecord *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(CODiscoveryRecord *)self isEqualToDiscoveryRecord:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4 = a3;
  v5 = [(CODiscoveryRecord *)self IDSIdentifier];
  BOOL v6 = [v4 IDSIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4 = a3;
  v5 = [[CORapportTransport alloc] initWithDiscoveryRecord:self executionContext:v4];

  BOOL v6 = [(CODiscoveryRecord *)self sourceTransport];
  [v6 setAsSink:v5];

  return v5;
}

- (BOOL)isEqualToDiscoveryRecord:(id)a3
{
  id v4 = a3;
  v5 = [(CODiscoveryRecord *)self constituent];
  BOOL v6 = [v4 constituent];
  if ([v5 isEqual:v6])
  {
    v7 = [(CODiscoveryRecord *)self rapportIdentifier];
    uint64_t v8 = [v4 rapportIdentifier];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(CODiscoveryRecord *)self IDSIdentifier];
      v10 = [v4 IDSIdentifier];
      if ([v9 isEqualToString:v10])
      {
        int v11 = [(CODiscoveryRecord *)self destinations];
        id v12 = [v4 destinations];
        char v13 = [v11 isEqualToOrderedSet:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)shouldAdvertise
{
  v2 = [(CODiscoveryRecord *)self destinations];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (RPCompanionLinkDevice)companionLinkDevice
{
  companionLinkDevice = self->_companionLinkDevice;
  if (!companionLinkDevice)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F62B80]);
    v5 = [(CODiscoveryRecord *)self rapportIdentifier];
    [v4 setIdentifier:v5];

    BOOL v6 = [(CODiscoveryRecord *)self destinations];
    v7 = [v6 firstObject];
    [v4 setIpAddress:v7];

    uint64_t v8 = self->_companionLinkDevice;
    self->_companionLinkDevice = (RPCompanionLinkDevice *)v4;

    companionLinkDevice = self->_companionLinkDevice;
  }
  return companionLinkDevice;
}

+ (id)_destinationForPeerAddress:(id)a3 listeningPort:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 length];
  v7 = 0;
  if (v4 && v6)
  {
    uint64_t v8 = [v5 componentsSeparatedByString:@":"];
    v9 = (void *)[v8 mutableCopy];

    if ((unint64_t)[v9 count] >= 2) {
      [v9 removeLastObject];
    }
    v10 = [v9 componentsJoinedByString:@":"];
    v7 = objc_msgSend(v10, "stringByAppendingFormat:", @":%hu", v4);
  }
  return v7;
}

- (COConstituent)constituent
{
  return self->_constituent;
}

- (void)setConstituent:(id)a3
{
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)IDSIdentifier
{
  return self->_IDSIdentifier;
}

- (NSOrderedSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (CORapportTransport)sourceTransport
{
  return self->_sourceTransport;
}

- (void)setSourceTransport:(id)a3
{
}

- (COUnhandledRapportRequest)unhandledRequest
{
  return self->_unhandledRequest;
}

- (void)setUnhandledRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhandledRequest, 0);
  objc_storeStrong((id *)&self->_sourceTransport, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_constituent, 0);
  objc_storeStrong(&self->_companionLinkProvider, 0);
  objc_storeStrong((id *)&self->_HomeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_companionLinkDevice, 0);
}

@end
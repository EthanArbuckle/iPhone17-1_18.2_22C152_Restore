@interface CORapportDevice
- (BOOL)hasSameBackingDeviceAs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)producesElectionCapableTransport;
- (BOOL)requiresInquiry;
- (CORapportDevice)initWithCompanionLinkDevice:(id)a3 sourceTransport:(id)a4;
- (CORapportTransport)sourceTransport;
- (NSString)IDSIdentifier;
- (NSString)description;
- (NSUUID)HomeKitIdentifier;
- (RPCompanionLinkDevice)device;
- (id)companionLinkProvider;
- (id)newTransportWithExecutionContext:(id)a3;
- (unint64_t)hash;
- (void)setCompanionLinkProvider:(id)a3;
- (void)setHomeKitIdentifier:(id)a3;
@end

@implementation CORapportDevice

- (CORapportDevice)initWithCompanionLinkDevice:(id)a3 sourceTransport:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CORapportDevice;
  v9 = [(CORapportDevice *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_sourceTransport, a4);
    objc_initWeak(&location, v10);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__CORapportDevice_initWithCompanionLinkDevice_sourceTransport___block_invoke;
    v14[3] = &unk_2645CBA90;
    objc_copyWeak(&v16, &location);
    id v15 = v7;
    uint64_t v11 = MEMORY[0x223C8B4A0](v14);
    id companionLinkProvider = v10->_companionLinkProvider;
    v10->_id companionLinkProvider = (id)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __63__CORapportDevice_initWithCompanionLinkDevice_sourceTransport___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x263F62B70];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = [WeakRetained sourceTransport];
    id v7 = [v6 client];
    id v8 = [v7 dispatchQueue];
    v9 = objc_msgSend(v4, "co_companionLinkClientToDevice:dispatchQueue:", v5, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(CORapportDevice *)self IDSIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p, IDS: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSString)IDSIdentifier
{
  IDSIdentifier = self->_IDSIdentifier;
  if (!IDSIdentifier)
  {
    v4 = [(CORapportDevice *)self device];
    uint64_t v5 = [v4 idsDeviceIdentifier];
    v6 = self->_IDSIdentifier;
    self->_IDSIdentifier = v5;

    IDSIdentifier = self->_IDSIdentifier;
  }
  return IDSIdentifier;
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
  uint64_t v21 = *MEMORY[0x263EF8340];
  HomeKitIdentifier = self->_HomeKitIdentifier;
  if (!HomeKitIdentifier)
  {
    v4 = [(CORapportDevice *)self device];
    uint64_t v5 = [v4 homeKitIdentifier];

    if (!v5)
    {
      v6 = [(CORapportDevice *)self IDSIdentifier];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = [(CORapportDevice *)self sourceTransport];
      id v8 = [v7 client];
      v9 = [v8 activeDevices];

      uint64_t v5 = (NSUUID *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v5; i = (NSUUID *)((char *)i + 1))
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v9);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            v13 = [v12 idsDeviceIdentifier];
            if (v13 && ![v6 compare:v13 options:1])
            {
              uint64_t v5 = [v12 homeKitIdentifier];

              goto LABEL_14;
            }
          }
          uint64_t v5 = (NSUUID *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    v14 = self->_HomeKitIdentifier;
    self->_HomeKitIdentifier = v5;

    HomeKitIdentifier = self->_HomeKitIdentifier;
  }
  return HomeKitIdentifier;
}

- (BOOL)producesElectionCapableTransport
{
  v2 = [(CORapportDevice *)self sourceTransport];
  v3 = [v2 executionContext];
  char v4 = [v3 leaderElectionConfigured];

  return v4;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CORapportTransport alloc] initWithDiscoveryRecord:self executionContext:v4];

  v6 = [(CORapportDevice *)self sourceTransport];
  [v6 setAsSink:v5];

  return v5;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CORapportDevice *)self IDSIdentifier];
  v6 = [v4 IDSIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CORapportDevice *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(CORapportDevice *)v4 conformsToProtocol:&unk_26D3EFB70])
  {
    v6 = [(CORapportDevice *)self IDSIdentifier];
    id v7 = [(CORapportDevice *)v5 IDSIdentifier];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CORapportDevice *)self IDSIdentifier];
  uint64_t v3 = [v2 hash];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (BOOL)requiresInquiry
{
  return 1;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setHomeKitIdentifier:(id)a3
{
}

- (CORapportTransport)sourceTransport
{
  return self->_sourceTransport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTransport, 0);
  objc_storeStrong((id *)&self->_HomeKitIdentifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_companionLinkProvider, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

@end
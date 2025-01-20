@interface CORapportCurrentDevice
- (BOOL)hasSameBackingDeviceAs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)producesElectionCapableTransport;
- (BOOL)requiresInquiry;
- (COCompanionLinkClientProtocol)client;
- (CORapportBrowser)browser;
- (CORapportCurrentDevice)initWithClient:(id)a3 browser:(id)a4;
- (NSString)IDSIdentifier;
- (NSString)description;
- (NSUUID)HomeKitIdentifier;
- (id)companionLinkProvider;
- (id)newTransportWithExecutionContext:(id)a3;
- (unint64_t)hash;
- (void)setCompanionLinkProvider:(id)a3;
@end

@implementation CORapportCurrentDevice

- (CORapportCurrentDevice)initWithClient:(id)a3 browser:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CORapportCurrentDevice;
  v9 = [(CORapportCurrentDevice *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    id v11 = objc_initWeak(&location, v8);
    objc_storeWeak((id *)&v10->_browser, v8);

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__CORapportCurrentDevice_initWithClient_browser___block_invoke;
    v15[3] = &unk_2645CDB80;
    id v16 = v7;
    uint64_t v12 = MEMORY[0x223C8B4A0](v15);
    id companionLinkProvider = v10->_companionLinkProvider;
    v10->_id companionLinkProvider = (id)v12;

    objc_destroyWeak(&location);
  }

  return v10;
}

id __49__CORapportCurrentDevice_initWithClient_browser___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(CORapportCurrentDevice *)self IDSIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p, IDS: %@", v5, self, v6];

  return (NSString *)v7;
}

- (NSString)IDSIdentifier
{
  IDSIdentifier = self->_IDSIdentifier;
  if (!IDSIdentifier)
  {
    v4 = [(CORapportCurrentDevice *)self client];
    v5 = [v4 localDevice];
    v6 = [v5 idsDeviceIdentifier];
    id v7 = self->_IDSIdentifier;
    self->_IDSIdentifier = v6;

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
  v2 = [(CORapportCurrentDevice *)self client];
  v3 = [v2 localDevice];
  v4 = [v3 homeKitIdentifier];

  return (NSUUID *)v4;
}

- (BOOL)producesElectionCapableTransport
{
  v2 = [(CORapportCurrentDevice *)self browser];
  v3 = [v2 sourceTransport];
  v4 = [v3 executionContext];
  char v5 = [v4 leaderElectionConfigured];

  return v5;
}

- (BOOL)requiresInquiry
{
  return 0;
}

- (id)newTransportWithExecutionContext:(id)a3
{
  id v4 = a3;
  char v5 = [[CORapportTransport alloc] initWithDiscoveryRecord:self executionContext:v4];

  v6 = [(CORapportCurrentDevice *)self browser];
  [v6 setSourceTransport:v5];

  return v5;
}

- (BOOL)hasSameBackingDeviceAs:(id)a3
{
  id v4 = a3;
  char v5 = [(CORapportCurrentDevice *)self IDSIdentifier];
  v6 = [v4 IDSIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CORapportCurrentDevice *)a3;
  char v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if ([(CORapportCurrentDevice *)v4 conformsToProtocol:&unk_26D3EFB70])
  {
    v6 = [(CORapportCurrentDevice *)self IDSIdentifier];
    id v7 = [(CORapportCurrentDevice *)v5 IDSIdentifier];
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
  v2 = [(CORapportCurrentDevice *)self IDSIdentifier];
  uint64_t v3 = [v2 hash];
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

- (COCompanionLinkClientProtocol)client
{
  return self->_client;
}

- (CORapportBrowser)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (CORapportBrowser *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_companionLinkProvider, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
}

@end
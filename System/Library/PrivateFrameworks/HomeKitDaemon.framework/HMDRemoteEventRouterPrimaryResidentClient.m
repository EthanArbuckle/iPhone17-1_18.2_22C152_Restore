@interface HMDRemoteEventRouterPrimaryResidentClient
- (BOOL)_clientIsEnabled:(id)a3;
- (id)dumpStateDescription;
- (unint64_t)messageTransportRestriction;
- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3;
@end

@implementation HMDRemoteEventRouterPrimaryResidentClient

- (void).cxx_destruct
{
}

- (id)dumpStateDescription
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)HMDRemoteEventRouterPrimaryResidentClient;
  v3 = [(HMDRemoteEventRouterClient *)&v6 dumpStateDescription];
  v4 = [v2 stringWithFormat:@"[HMDRemoteEventRouterPrimaryResidentClient: %@]", v3];

  return v4;
}

- (BOOL)_clientIsEnabled:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  dispatch_assert_queue_V2(v5);

  objc_super v6 = [(HMDRemoteEventRouterClient *)self dataSource];
  int v7 = [v6 clientIsEnabled:self];

  if (v7
    && ([(HMDRemoteEventRouterClient *)self eventRouterClient],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v4))
  {
    BOOL v9 = ![(HMDRemoteEventRouterClient *)self isPrimaryResident];
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemoteEventRouterClient *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __110__HMDRemoteEventRouterPrimaryResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __110__HMDRemoteEventRouterPrimaryResidentClient_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v15.receiver = *(id *)(a1 + 40);
  v15.super_class = (Class)HMDRemoteEventRouterPrimaryResidentClient;
  objc_msgSendSuper2(&v15, sel_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification_, v2);
  v3 = [*(id *)(a1 + 40) dataSource];
  id v4 = [v3 routerClientPrimaryResidentDeviceIdentifier:*(void *)(a1 + 40)];

  if (v4
    && ((id v6 = *(void **)(a1 + 40)) == 0 ? (Property = 0) : (Property = objc_getProperty(v6, v5, 112, 1)),
        (objc_msgSend(v4, "hmf_isEqualToUUID:", Property) & 1) == 0))
  {
    BOOL v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 40);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating primary resident identifier to: %@", buf, 0x16u);
    }
    v14 = *(void **)(a1 + 40);
    if (v14)
    {
      objc_setProperty_atomic_copy(v14, v13, v4, 112);
      v14 = *(void **)(a1 + 40);
    }
    id v8 = [v14 eventRouterClient];
    [v8 serverDidChangeWithServerIdentifier:v4];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) eventRouterClient];
    [v8 connectionCapabilityDidChange];
  }
}

- (unint64_t)messageTransportRestriction
{
  uint64_t v2 = self;
  v3 = [(HMDRemoteEventRouterClient *)self dataSource];
  LODWORD(v2) = [v3 routerClientShouldRestrictMessagingToLocalOnly:v2];

  if (v2) {
    return 8;
  }
  else {
    return -1;
  }
}

@end
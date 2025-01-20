@interface CNUIUserActionDiscoveringEnvironment
- (CNCapabilities)capabilities;
- (CNContactStore)contactStore;
- (CNLSApplicationWorkspace)applicationWorkspace;
- (CNMCProfileConnection)profileConnection;
- (CNSchedulerProvider)highLatencySchedulerProvider;
- (CNSchedulerProvider)schedulerProvider;
- (CNTUCallProviderManager)callProviderManager;
- (CNUIDefaultUserActionFetcher)defaultUserActionFetcher;
- (CNUIIDSContactPropertyResolver)idsContactPropertyResolver;
- (CNUIRTTUtilities)ttyUtilities;
- (CNUIUserActionDiscoveringEnvironment)init;
- (CNUIUserActionDiscoveringEnvironment)initWithApplicationWorkspace:(id)a3 callProviderManager:(id)a4 idsContactPropertyResolver:(id)a5 profileConnection:(id)a6 contactStore:(id)a7 schedulerProvider:(id)a8 highLatencySchedulerProvider:(id)a9 capabilities:(id)a10 defaultUserActionFetcher:(id)a11 ttyUtilities:(id)a12;
- (CNUIUserActionDiscoveringEnvironment)initWithIDSAvailabilityProvider:(id)a3 schedulerProvider:(id)a4 capabilities:(id)a5 defaultUserActionFetcher:(id)a6 applicationWorkspace:(id)a7;
- (CNUIUserActionTargetDiscovering)targetDiscoveringHelper;
- (id)copyWithContactStore:(id)a3 schedulerProvider:(id)a4;
- (id)nts_lazyContactStore;
@end

@implementation CNUIUserActionDiscoveringEnvironment

- (CNUIUserActionDiscoveringEnvironment)init
{
  v3 = objc_alloc_init(CNUIIDSAvailabilityProvider);
  v4 = [MEMORY[0x263F33668] defaultProvider];
  v5 = objc_alloc_init(CNCapabilities);
  v6 = objc_alloc_init(CNUIDefaultUserActionFetcher);
  v7 = objc_alloc_init(CNLSApplicationWorkspace);
  v8 = [(CNUIUserActionDiscoveringEnvironment *)self initWithIDSAvailabilityProvider:v3 schedulerProvider:v4 capabilities:v5 defaultUserActionFetcher:v6 applicationWorkspace:v7];

  return v8;
}

- (CNUIUserActionDiscoveringEnvironment)initWithIDSAvailabilityProvider:(id)a3 schedulerProvider:(id)a4 capabilities:(id)a5 defaultUserActionFetcher:(id)a6 applicationWorkspace:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v27 = (void *)[v11 newSerialSchedulerWithName:@"com.apple.contacts.ContactsUICore.CNUIUserActionDiscoveringHighLatencyScheduler"];
  id v16 = objc_alloc(MEMORY[0x263F33668]);
  v17 = [v11 mainThreadScheduler];
  v18 = [v11 immediateScheduler];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __149__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher_applicationWorkspace___block_invoke;
  v33[3] = &unk_264017E50;
  id v34 = v11;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __149__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher_applicationWorkspace___block_invoke_2;
  v31[3] = &unk_264017E50;
  id v32 = v34;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __149__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher_applicationWorkspace___block_invoke_3;
  v29[3] = &unk_2640186F0;
  id v30 = v32;
  id v19 = v32;
  v20 = (void *)[v16 initWithBackgroundScheduler:v27 mainThreadScheduler:v17 immediateScheduler:v18 serialSchedulerProvider:v33 synchronousSerialSchedulerProvider:v31 readerWriterSchedulerProvider:v29];

  v21 = objc_alloc_init(CNTUCallProviderManager);
  v22 = [[CNUIIDSContactPropertyResolver alloc] initWithIDSAvailabilityProvider:v15];

  v23 = objc_alloc_init(CNMCProfileConnection);
  v24 = +[CNUIRTTUtilities defaultUtilities];
  v25 = [(CNUIUserActionDiscoveringEnvironment *)self initWithApplicationWorkspace:v12 callProviderManager:v21 idsContactPropertyResolver:v22 profileConnection:v23 contactStore:0 schedulerProvider:v19 highLatencySchedulerProvider:v20 capabilities:v14 defaultUserActionFetcher:v13 ttyUtilities:v24];

  return v25;
}

id __149__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher_applicationWorkspace___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newSerialSchedulerWithName:a2];
  return v2;
}

id __149__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher_applicationWorkspace___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newSynchronousSerialSchedulerWithName:a2];
  return v2;
}

id __149__CNUIUserActionDiscoveringEnvironment_initWithIDSAvailabilityProvider_schedulerProvider_capabilities_defaultUserActionFetcher_applicationWorkspace___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newReaderWriterSchedulerWithName:a2];
  return v2;
}

- (CNUIUserActionDiscoveringEnvironment)initWithApplicationWorkspace:(id)a3 callProviderManager:(id)a4 idsContactPropertyResolver:(id)a5 profileConnection:(id)a6 contactStore:(id)a7 schedulerProvider:(id)a8 highLatencySchedulerProvider:(id)a9 capabilities:(id)a10 defaultUserActionFetcher:(id)a11 ttyUtilities:(id)a12
{
  id v36 = a3;
  id obj = a4;
  id v35 = a4;
  id v31 = a5;
  id v34 = a6;
  id v30 = a7;
  id v28 = a8;
  id v33 = a8;
  id v32 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  v37.receiver = self;
  v37.super_class = (Class)CNUIUserActionDiscoveringEnvironment;
  v21 = [(CNUIUserActionDiscoveringEnvironment *)&v37 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_applicationWorkspace, a3);
    objc_storeStrong((id *)&v22->_callProviderManager, obj);
    objc_storeStrong((id *)&v22->_idsContactPropertyResolver, a5);
    objc_storeStrong((id *)&v22->_profileConnection, a6);
    objc_storeStrong((id *)&v22->_contactStore, a7);
    objc_storeStrong((id *)&v22->_capabilities, a10);
    objc_storeStrong((id *)&v22->_schedulerProvider, v28);
    objc_storeStrong((id *)&v22->_highLatencySchedulerProvider, a9);
    objc_storeStrong((id *)&v22->_defaultUserActionFetcher, a11);
    objc_storeStrong((id *)&v22->_ttyUtilities, a12);
    v23 = [[CNUIUserActionTargetDiscovering alloc] initWithApplicationWorkspace:v36 callProviderManager:v35 profileConnection:v34 schedulerProvider:v33 highLatencySchedulerProvider:v32 capabilities:v18];
    targetDiscoveringHelper = v22->_targetDiscoveringHelper;
    v22->_targetDiscoveringHelper = v23;

    v25 = v22;
  }

  return v22;
}

- (id)copyWithContactStore:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v18 = [CNUIUserActionDiscoveringEnvironment alloc];
  v17 = [(CNUIUserActionDiscoveringEnvironment *)self applicationWorkspace];
  v8 = [(CNUIUserActionDiscoveringEnvironment *)self callProviderManager];
  v9 = [(CNUIUserActionDiscoveringEnvironment *)self idsContactPropertyResolver];
  v10 = [(CNUIUserActionDiscoveringEnvironment *)self profileConnection];
  id v11 = [(CNUIUserActionDiscoveringEnvironment *)self highLatencySchedulerProvider];
  id v12 = [(CNUIUserActionDiscoveringEnvironment *)self capabilities];
  id v13 = [(CNUIUserActionDiscoveringEnvironment *)self defaultUserActionFetcher];
  id v14 = [(CNUIUserActionDiscoveringEnvironment *)self ttyUtilities];
  id v15 = [(CNUIUserActionDiscoveringEnvironment *)v18 initWithApplicationWorkspace:v17 callProviderManager:v8 idsContactPropertyResolver:v9 profileConnection:v10 contactStore:v7 schedulerProvider:v6 highLatencySchedulerProvider:v11 capabilities:v12 defaultUserActionFetcher:v13 ttyUtilities:v14];

  return v15;
}

- (CNContactStore)contactStore
{
  v2 = cn_objectResultWithObjectLock();
  return (CNContactStore *)v2;
}

uint64_t __52__CNUIUserActionDiscoveringEnvironment_contactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactStore");
}

- (id)nts_lazyContactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (CNTUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CNUIIDSContactPropertyResolver)idsContactPropertyResolver
{
  return self->_idsContactPropertyResolver;
}

- (CNMCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (CNCapabilities)capabilities
{
  return self->_capabilities;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNSchedulerProvider)highLatencySchedulerProvider
{
  return self->_highLatencySchedulerProvider;
}

- (CNUIDefaultUserActionFetcher)defaultUserActionFetcher
{
  return self->_defaultUserActionFetcher;
}

- (CNUIRTTUtilities)ttyUtilities
{
  return self->_ttyUtilities;
}

- (CNUIUserActionTargetDiscovering)targetDiscoveringHelper
{
  return self->_targetDiscoveringHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDiscoveringHelper, 0);
  objc_storeStrong((id *)&self->_ttyUtilities, 0);
  objc_storeStrong((id *)&self->_defaultUserActionFetcher, 0);
  objc_storeStrong((id *)&self->_highLatencySchedulerProvider, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_idsContactPropertyResolver, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
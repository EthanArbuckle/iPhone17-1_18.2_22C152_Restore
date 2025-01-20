@interface AAMessagingService
+ (id)sharedService;
- (AAMessagingService)initWithServiceName:(id)a3;
- (AAMessagingServiceDelegate)custodianDelegate;
- (AAMessagingServiceDelegate)inheritanceDelegate;
- (NSMutableArray)pendingCustodianMessages;
- (NSMutableArray)pendingInheritanceMessages;
- (id)_createNewCapabilitySetFrom:(id)a3;
- (id)_optionsDictionaryWithResponseIdentifier:(id)a3 fireAndForget:(BOOL)a4 requiredCapabilities:(id)a5 lackingCapabilities:(id)a6;
- (id)sendMessage:(id)a3 destinations:(id)a4 responseIdentifier:(id)a5 fireAndForget:(BOOL)a6 requiredCapabilities:(id)a7 lackingCapabilities:(id)a8 error:(id *)a9;
- (void)_addMessageToPendingCustodianMessages:(id)a3;
- (void)_addMessageToPendingInheritanceMessages:(id)a3;
- (void)_getCurrentRemoteDevices:(id)a3 completion:(id)a4;
- (void)_processMessage:(id)a3;
- (void)_processPendingIDSMessagesOfType:(int64_t)a3;
- (void)doDestinations:(id)a3 haveIneligibleDeviceForCapability:(id)a4 completion:(id)a5;
- (void)fetchCapability:(id)a3 destinations:(id)a4 completion:(id)a5;
- (void)partitionByCapability:(id)a3 completion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setCustodianDelegate:(id)a3;
- (void)setInheritanceDelegate:(id)a3;
@end

@implementation AAMessagingService

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)sharedService_sharedService;

  return v2;
}

uint64_t __35__AAMessagingService_sharedService__block_invoke()
{
  sharedService_sharedService = [[AAMessagingService alloc] initWithServiceName:@"com.apple.private.alloy.accounts.representative"];

  return MEMORY[0x1F41817F8]();
}

- (AAMessagingService)initWithServiceName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AAMessagingService;
  v5 = [(AAMessagingService *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    uint64_t v8 = [objc_alloc((Class)getIDSServiceClass()) initWithService:v5->_serviceName];
    service = v5->_service;
    v5->_service = (IDSService *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.AAMessaging", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc_init((Class)getIDSServiceDelegatePropertiesClass());
    [v12 setWantsCrossAccountMessaging:1];
    [(IDSService *)v5->_service addDelegate:v5 withDelegateProperties:v12 queue:v5->_queue];
    uint64_t v13 = [getIDSIDQueryControllerClass() sharedInstance];
    queryController = v5->_queryController;
    v5->_queryController = (IDSIDQueryController *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.appleaccount.incomingMessageProcessing", 0);
    incomingMessageQueue = v5->_incomingMessageQueue;
    v5->_incomingMessageQueue = (OS_dispatch_queue *)v15;

    v5->_lock._os_unfair_lock_opaque = 0;
    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "Created AAMessagingService: %@", buf, 0xCu);
    }
  }
  return v5;
}

- (void)partitionByCapability:(id)a3 completion:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v16[0] = v8;
  dispatch_queue_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__AAMessagingService_partitionByCapability_completion___block_invoke;
  v13[3] = &unk_1E5A4A240;
  id v14 = v9;
  id v15 = v6;
  id v11 = v6;
  id v12 = v9;
  [(AAMessagingService *)self _getCurrentRemoteDevices:v10 completion:v13];
}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __55__AAMessagingService_partitionByCapability_completion___block_invoke_cold_1((uint64_t)v7, (uint64_t)v8, v9);
  }

  if (a2)
  {
    dispatch_queue_t v10 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __55__AAMessagingService_partitionByCapability_completion___block_invoke_34;
    v18 = &unk_1E5A4A218;
    id v19 = v10;
    id v20 = *(id *)(a1 + 32);
    id v11 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:&v15];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "copy", v15, v16, v17, v18);
    (*(void (**)(uint64_t, uint64_t, void *, void))(v12 + 16))(v12, 1, v13, 0);
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AAMessagingErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, void, id))(v14 + 16))(v14, 0, 0, v11);
  }
}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AAMessagingService_partitionByCapability_completion___block_invoke_2;
  v5[3] = &unk_1E5A4A1F0;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [a3 enumerateObjectsUsingBlock:v5];
}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 capabilities];
  BOOL v4 = [v3 valueForCapability:@"IDSRegistrationPropertySupportsCustodian"] == 1;

  v5 = [[AAMessagingCapability alloc] initWithCapabilityType:v4];
  [*(id *)(a1 + 32) addObject:v5];

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = NSNumber;
    id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "integerValue") + 1);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    [v9 setObject:&unk_1EF483E58 forKeyedSubscript:v10];
  }
}

- (void)fetchCapability:(id)a3 destinations:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke;
  v12[3] = &unk_1E5A4A240;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AAMessagingService *)self _getCurrentRemoteDevices:a4 completion:v12];
}

void __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a2)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_2;
    uint64_t v15 = &unk_1E5A4A218;
    id v16 = *(id *)(a1 + 32);
    id v7 = v6;
    id v17 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:&v12];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
    (*(void (**)(uint64_t, uint64_t, void *, void))(v8 + 16))(v8, 1, v9, 0);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AAMessagingErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v11);
  }
}

void __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_3;
  id v11 = &unk_1E5A4A268;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v15 + 24), v8, v9, v10, v11);
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];

  _Block_object_dispose(&v14, 8);
}

void __62__AAMessagingService_fetchCapability_destinations_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 capabilities];
  id v7 = [*(id *)(a1 + 32) capabilityString];
  uint64_t v8 = [v6 valueForCapability:v7];

  if (v8 == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)doDestinations:(id)a3 haveIneligibleDeviceForCapability:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke;
  v12[3] = &unk_1E5A4A240;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AAMessagingService *)self _getCurrentRemoteDevices:a3 completion:v12];
}

void __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a2)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_2;
    uint64_t v15 = &unk_1E5A4A218;
    id v16 = *(id *)(a1 + 32);
    id v7 = v6;
    id v17 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:&v12];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = objc_msgSend(v7, "copy", v12, v13, v14, v15);
    (*(void (**)(uint64_t, uint64_t, void *, void))(v8 + 16))(v8, 1, v9, 0);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AAMessagingErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v11);
  }
}

void __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_3;
  id v11 = &unk_1E5A4A268;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = &v14;
  [v6 enumerateObjectsUsingBlock:&v8];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)v15 + 24), v8, v9, v10, v11);
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];

  _Block_object_dispose(&v14, 8);
}

void __82__AAMessagingService_doDestinations_haveIneligibleDeviceForCapability_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 capabilities];
  id v7 = [*(id *)(a1 + 32) capabilityString];
  uint64_t v8 = [v6 valueForCapability:v7];

  if (v8 != 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_getCurrentRemoteDevices:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "aaf_map:", &__block_literal_global_44);
  queryController = self->_queryController;
  serviceName = self->_serviceName;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_2;
  v12[3] = &unk_1E5A4A2D8;
  id v13 = v6;
  id v11 = v6;
  [(IDSIDQueryController *)queryController currentRemoteDevicesForDestinations:v7 service:serviceName listenerID:serviceName queue:queue completionBlock:v12];
}

uint64_t __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination];
}

void __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_3;
    v9[3] = &unk_1E5A4A2B0;
    id v10 = v4;
    id v5 = v4;
    [v3 enumerateKeysAndObjectsUsingBlock:v9];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = (void *)[v5 copy];
    (*(void (**)(uint64_t, uint64_t, void *, void))(v6 + 16))(v6, 1, v7, 0);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.AAMessagingErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v5);
  }
}

void __58__AAMessagingService__getCurrentRemoteDevices_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[AAMessagingDestination alloc] initWithHandle:v6];

  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
}

- (id)_optionsDictionaryWithResponseIdentifier:(id)a3 fireAndForget:(BOOL)a4 requiredCapabilities:(id)a5 lackingCapabilities:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v13 = a3;
  id v14 = objc_alloc_init(v12);
  if (!v13)
  {
    uint64_t v15 = getIDSSendMessageOptionExpectsPeerResponseKey();
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v15];
  }
  uint64_t v16 = getIDSSendMessageOptionPeerResponseIdentifierKey();
  [v14 setObject:v13 forKeyedSubscript:v16];

  if (v7)
  {
    char v17 = getIDSSendMessageOptionFireAndForgetKey();
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v17];
  }
  if ([v10 count])
  {
    v18 = [(AAMessagingService *)self _createNewCapabilitySetFrom:v10];
    id v19 = getIDSSendMessageOptionRequireAllRegistrationPropertiesKey();
    [v14 setObject:v18 forKeyedSubscript:v19];
  }
  if ([v11 count])
  {
    id v20 = [(AAMessagingService *)self _createNewCapabilitySetFrom:v11];
    id v21 = getIDSSendMessageOptionRequireLackOfRegistrationPropertiesKey();
    [v14 setObject:v20 forKeyedSubscript:v21];
  }
  uint64_t v22 = (void *)[v14 copy];

  return v22;
}

- (id)sendMessage:(id)a3 destinations:(id)a4 responseIdentifier:(id)a5 fireAndForget:(BOOL)a6 requiredCapabilities:(id)a7 lackingCapabilities:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  char v17 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v18 = a8;
  id v19 = a7;
  id v20 = a4;
  id v21 = objc_alloc_init(v17);
  uint64_t v22 = [(AAMessagingService *)self _optionsDictionaryWithResponseIdentifier:v16 fireAndForget:v11 requiredCapabilities:v19 lackingCapabilities:v18];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __127__AAMessagingService_sendMessage_destinations_responseIdentifier_fireAndForget_requiredCapabilities_lackingCapabilities_error___block_invoke;
  v39[3] = &unk_1E5A4A300;
  id v23 = v21;
  id v40 = v23;
  [v20 enumerateObjectsUsingBlock:v39];

  v24 = @"message";
  if (v11) {
    v24 = @"fire-and-forget message";
  }
  v25 = v24;
  v26 = _AALogSystem();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (!v27) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138413058;
    v42 = v25;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2112;
    id v46 = v23;
    __int16 v47 = 2112;
    id v48 = v16;
    v28 = "Sending %@: %@ to %@ in response to %@";
    v29 = v26;
    uint32_t v30 = 42;
  }
  else
  {
    if (!v27) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412802;
    v42 = v25;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2112;
    id v46 = v23;
    v28 = "Sending %@: %@ to %@";
    v29 = v26;
    uint32_t v30 = 32;
  }
  _os_log_impl(&dword_1A11D8000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
LABEL_9:

  service = self->_service;
  id v38 = 0;
  int v32 = [(IDSService *)service sendData:v15 toDestinations:v23 priority:300 options:v22 identifier:&v38 error:a9];
  id v33 = v38;
  v34 = _AALogSystem();
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG);
  if (v32)
  {
    if (v35) {
      -[AAMessagingService sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:]();
    }
  }
  else if (v35)
  {
    -[AAMessagingService sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:]();
  }

  v36 = [MEMORY[0x1E4F29128] UUID];

  return v36;
}

void __127__AAMessagingService_sendMessage_destinations_responseIdentifier_fireAndForget_requiredCapabilities_lackingCapabilities_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 destinationURI];

  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v6 destinationURI];
    [v4 addObject:v5];
  }
}

- (void)setCustodianDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_custodianDelegate);

  if (WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"AAMessagingService.m" lineNumber:242 description:@"Custodian delegate already set!"];
  }
  uint64_t v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Setting custodian delegate %@", (uint8_t *)&v11, 0xCu);
  }

  if (v5)
  {
    objc_storeWeak((id *)&self->_custodianDelegate, v5);
    [(AAMessagingService *)self _processPendingIDSMessagesOfType:0];
  }
  else
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AAMessagingService setCustodianDelegate:]();
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setInheritanceDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inheritanceDelegate);

  if (WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"AAMessagingService.m" lineNumber:258 description:@"Inheritance delegate already set!"];
  }
  uint64_t v9 = _AALogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Setting inheritance delegate %@", (uint8_t *)&v11, 0xCu);
  }

  if (v5)
  {
    objc_storeWeak((id *)&self->_inheritanceDelegate, v5);
    [(AAMessagingService *)self _processPendingIDSMessagesOfType:1];
  }
  else
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AAMessagingService setInheritanceDelegate:]();
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_addMessageToPendingInheritanceMessages:(id)a3
{
  pendingInheritanceMessages = self->_pendingInheritanceMessages;
  if (pendingInheritanceMessages)
  {
    id v4 = a3;
    id v5 = pendingInheritanceMessages;
  }
  else
  {
    BOOL v7 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v8 = a3;
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(v7);
    id v10 = self->_pendingInheritanceMessages;
    self->_pendingInheritanceMessages = v9;

    id v5 = self->_pendingInheritanceMessages;
    id v4 = v8;
  }
  [(NSMutableArray *)v5 addObject:v4];
}

- (void)_addMessageToPendingCustodianMessages:(id)a3
{
  pendingCustodianMessages = self->_pendingCustodianMessages;
  if (pendingCustodianMessages)
  {
    id v4 = a3;
    id v5 = pendingCustodianMessages;
  }
  else
  {
    BOOL v7 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v8 = a3;
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(v7);
    id v10 = self->_pendingCustodianMessages;
    self->_pendingCustodianMessages = v9;

    id v5 = self->_pendingCustodianMessages;
    id v4 = v8;
  }
  [(NSMutableArray *)v5 addObject:v4];
}

- (void)_processPendingIDSMessagesOfType:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    uint64_t v5 = 80;
  }
  else {
    uint64_t v5 = 72;
  }
  id v6 = *(id *)((char *)&self->super.isa + v5);
  BOOL v7 = (void *)[*(id *)((char *)&self->super.isa + v5) copy];
  uint64_t v8 = [v7 count];
  uint64_t v9 = _AALogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v31 = a3;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "Processing pending messages of type %ld", buf, 0xCu);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          [(AAMessagingService *)self _processMessage:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v13);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = v11;
    uint64_t v16 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v6, "removeObject:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
        }
        uint64_t v17 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 134217984;
    int64_t v31 = a3;
    _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "No messages of type %ld for the delegate to process.", buf, 0xCu);
  }
}

- (void)_processMessage:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  incomingMessageQueue = self->_incomingMessageQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AAMessagingService__processMessage___block_invoke;
  block[3] = &unk_1E5A4A328;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(incomingMessageQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__AAMessagingService__processMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) type]) {
      id v3 = WeakRetained + 7;
    }
    else {
      id v3 = WeakRetained + 8;
    }
    id v5 = objc_loadWeakRetained(v3);
    id v6 = [*(id *)(a1 + 32) data];
    BOOL v7 = [*(id *)(a1 + 32) senderHandle];
    [v5 messageService:WeakRetained didReceiveMessage:v6 fromID:v7];
  }
  else
  {
    id v4 = _AALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38__AAMessagingService__processMessage___block_invoke_cold_1();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = _AALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    long long v22 = [v12 fromID];
    int v23 = 138412802;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2112;
    v28 = v22;
    _os_log_debug_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEBUG, "AAMessagingService: received data %@ from %@ and context %@. Calling delegates", (uint8_t *)&v23, 0x20u);
  }
  id v14 = [[AAPendingIDSMessage alloc] initInheritanceMessageFrom:v11 data:v10];
  id v15 = [[AAPendingIDSMessage alloc] initCustodianMessageFrom:v11 data:v10];
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inheritanceDelegate);

  uint64_t v17 = _AALogSystem();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (WeakRetained)
  {
    if (v18) {
      -[AAMessagingService service:account:incomingData:fromID:context:].cold.4();
    }

    [(AAMessagingService *)self _processMessage:v14];
  }
  else
  {
    if (v18) {
      -[AAMessagingService service:account:incomingData:fromID:context:]();
    }

    [(AAMessagingService *)self _addMessageToPendingInheritanceMessages:v14];
  }
  id v19 = objc_loadWeakRetained((id *)&self->_custodianDelegate);

  long long v20 = _AALogSystem();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v21) {
      -[AAMessagingService service:account:incomingData:fromID:context:]();
    }

    [(AAMessagingService *)self _processMessage:v15];
  }
  else
  {
    if (v21) {
      -[AAMessagingService service:account:incomingData:fromID:context:]();
    }

    [(AAMessagingService *)self _addMessageToPendingCustodianMessages:v15];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  id v13 = a8;
  id v14 = _AALogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [NSNumber numberWithBool:v10];
    int v16 = 138413058;
    id v17 = v11;
    __int16 v18 = 2112;
    id v19 = v15;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Did send message %@ success %@ error %@ context %@", (uint8_t *)&v16, 0x2Au);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "activeAccountsChanged: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "devicesChanged: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)_createNewCapabilitySetFrom:(id)a3
{
  return (id)objc_msgSend(a3, "aaf_map:", &__block_literal_global_70);
}

uint64_t __50__AAMessagingService__createNewCapabilitySetFrom___block_invoke(uint64_t a1, void *a2)
{
  return [a2 capabilityString];
}

- (AAMessagingServiceDelegate)inheritanceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inheritanceDelegate);

  return (AAMessagingServiceDelegate *)WeakRetained;
}

- (AAMessagingServiceDelegate)custodianDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_custodianDelegate);

  return (AAMessagingServiceDelegate *)WeakRetained;
}

- (NSMutableArray)pendingCustodianMessages
{
  return self->_pendingCustodianMessages;
}

- (NSMutableArray)pendingInheritanceMessages
{
  return self->_pendingInheritanceMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInheritanceMessages, 0);
  objc_storeStrong((id *)&self->_pendingCustodianMessages, 0);
  objc_destroyWeak((id *)&self->_custodianDelegate);
  objc_destroyWeak((id *)&self->_inheritanceDelegate);
  objc_storeStrong((id *)&self->_incomingMessageQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

void __55__AAMessagingService_partitionByCapability_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_1A11D8000, a2, a3, "Results of _getCurrentRemoteDevices: %@, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Request to send message with uuid %@ error %@");
}

- (void)sendMessage:destinations:responseIdentifier:fireAndForget:requiredCapabilities:lackingCapabilities:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Failed to send with uuid %@ error %@");
}

- (void)setCustodianDelegate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Attempted to add nil custodian delegate to the messaging service.", v2, v3, v4, v5, v6);
}

- (void)setInheritanceDelegate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "Attempted to add nil inheritance delegate to the messaging service.", v2, v3, v4, v5, v6);
}

void __38__AAMessagingService__processMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A11D8000, v0, v1, "MessagingService lost strong ref processing message", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingData:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "AAMessagingService: Delegate not available for custodian. Adding to message queue.", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingData:fromID:context:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "AAMessagingService: Delegate available for custodian. Processing message.", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingData:fromID:context:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "AAMessagingService: Delegate not available for inheritance. Adding to message queue.", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingData:fromID:context:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11D8000, v0, v1, "AAMessagingService: Delegate available for inheritance. Processing message.", v2, v3, v4, v5, v6);
}

@end
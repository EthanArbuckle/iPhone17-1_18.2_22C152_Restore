@interface DiagnosticLiaison
- (DiagnosticLiaison)init;
- (DiagnosticLiaisonDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)abcPayloadForIDSTransport:(BOOL)a3;
- (id)basicSignatureFrom:(id)a3;
- (id)caseSignatureForRemoteSignature:(id)a3 groupIdentifier:(id)a4;
- (id)homeKitAgent;
- (id)idsTransport;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteCasePayloadForIDSTransport:(id)a3 groupID:(id)a4;
- (void)checkForUIImpactScenarioForCase:(id)a3;
- (void)dealloc;
- (void)messageReceivedFromIDS:(id)a3;
- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (void)messageWithIdentifierHasBeenDelivered:(id)a3;
- (void)processPayloadFromIDSTransport:(id)a3 incomingTime:(id)a4;
- (void)processPayloadVersionOneFromIDSTransport:(id)a3 incomingTime:(id)a4;
- (void)processPayloadVersionTwoFromIDSTransport:(id)a3 incomingTime:(id)a4;
- (void)registerAdministrativeTransports;
- (void)registerAutoBugCaptureTransports:(id)a3;
- (void)remotelyDisableAutoBugCapture:(id)a3;
- (void)remotelyEnableAutoBugCapture:(id)a3;
- (void)remotelyTriggerSessionForSignature:(id)a3 groupIdentifier:(id)a4 event:(id)a5 queue:(id)a6 reply:(id)a7;
- (void)remotelyTriggerSessionWithSignature:(id)a3 forDestinations:(id)a4 groupIdentifier:(id)a5 validFor:(double)a6 queue:(id)a7 reply:(id)a8;
- (void)residentDevicesIDSIdentifiersWithReply:(id)a3;
- (void)sendPayloadToHomeKitRelays:(id)a3 additionalPredicate:(id)a4 toEndpoint:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)startRemotelyTriggeredSessionForSignature:(id)a3 groupIdentifier:(id)a4 events:(id)a5;
- (void)unregisterAllTransports:(id)a3;
- (void)unregisterAllTransportsSync;
@end

@implementation DiagnosticLiaison

- (DiagnosticLiaison)init
{
  v11.receiver = self;
  v11.super_class = (Class)DiagnosticLiaison;
  v2 = [(DiagnosticLiaison *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.symptoms.diagnostic_liaison", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_allowRemoteTrigger = 1;
    v6 = +[SystemProperties sharedInstance];
    int v7 = [v6 deviceClass];

    if (v7 == 7) {
      v2->_allowRemoteTrigger = 0;
    }
    uint64_t v8 = +[PrimaryInterfaceUtils sharedInstance];
    interfaceUtils = v2->_interfaceUtils;
    v2->_interfaceUtils = (PrimaryInterfaceUtils *)v8;
  }
  return v2;
}

- (void)dealloc
{
  [(DiagnosticLiaison *)self unregisterAllTransportsSync];
  idsTransport = self->_idsTransport;
  self->_idsTransport = 0;

  homeKitAgent = self->_homeKitAgent;
  self->_homeKitAgent = 0;

  v5.receiver = self;
  v5.super_class = (Class)DiagnosticLiaison;
  [(DiagnosticLiaison *)&v5 dealloc];
}

- (id)homeKitAgent
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  homeKitAgent = self->_homeKitAgent;
  if (!homeKitAgent)
  {
    dispatch_queue_t v4 = [(DiagnosticLiaison *)self idsTransport];
    objc_super v5 = [v4 idsService];

    v6 = liaisonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "Creating HomeKitAgent with IDSService %@", (uint8_t *)&v10, 0xCu);
    }

    int v7 = [[HomeKitAgent alloc] initWithIDSService:v5];
    uint64_t v8 = self->_homeKitAgent;
    self->_homeKitAgent = v7;

    homeKitAgent = self->_homeKitAgent;
  }

  return homeKitAgent;
}

- (id)idsTransport
{
  if (+[IDSCrossDeviceTransport isIDSEndpointEnabled]
    && !self->_idsTransport)
  {
    v3 = objc_alloc_init(IDSCrossDeviceTransport);
    idsTransport = self->_idsTransport;
    self->_idsTransport = v3;
  }
  objc_super v5 = self->_idsTransport;

  return v5;
}

- (void)registerAdministrativeTransports
{
  v3 = +[SystemProperties sharedInstance];
  if ([v3 deviceClass] == 7)
  {
    dispatch_queue_t v4 = +[ABCAdministrator sharedInstance];
    objc_super v5 = [v4 configurationManager];
    char v6 = [v5 autoBugCaptureAvailable];

    if (v6) {
      goto LABEL_4;
    }
  }
  int v7 = +[ABCAdministrator sharedInstance];
  uint64_t v8 = [v7 configurationManager];
  int v9 = [v8 autoBugCaptureEnabled];

  if (v9)
  {
LABEL_4:
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__DiagnosticLiaison_registerAdministrativeTransports__block_invoke;
    block[3] = &unk_263FC2DC0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __53__DiagnosticLiaison_registerAdministrativeTransports__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) idsTransport];
  if (v2)
  {
    id v3 = v2;
    [v2 registerIDSService];
    [v3 addDelegate:*(void *)(a1 + 32) endpoint:@"AutoBugCapture"];
    v2 = v3;
  }
}

- (void)registerAutoBugCaptureTransports:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__DiagnosticLiaison_registerAutoBugCaptureTransports___block_invoke;
  v7[3] = &unk_263FC2DE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __54__DiagnosticLiaison_registerAutoBugCaptureTransports___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) idsTransport];
  if (v2)
  {
    id v3 = liaisonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Registering with IDS service", v5, 2u);
    }

    [v2 registerIDSService];
    [v2 addDelegate:*(void *)(a1 + 32) endpoint:@"HomeKit"];
    [v2 addDelegate:*(void *)(a1 + 32) endpoint:@"Trigger"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)unregisterAllTransportsSync
{
  idsTransport = self->_idsTransport;
  if (idsTransport)
  {
    uint64_t v4 = idsTransport;
    [(IDSCrossDeviceTransport *)v4 removeDelegate:self endpoint:@"AutoBugCapture"];
    [(IDSCrossDeviceTransport *)v4 removeDelegate:self endpoint:@"HomeKit"];
    [(IDSCrossDeviceTransport *)v4 removeDelegate:self endpoint:@"Trigger"];
    [(IDSCrossDeviceTransport *)v4 unregisterIDSService];

    objc_super v5 = liaisonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Unregistered with IDS service", v6, 2u);
    }
  }
}

- (void)unregisterAllTransports:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__DiagnosticLiaison_unregisterAllTransports___block_invoke;
  v7[3] = &unk_263FC2DE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__DiagnosticLiaison_unregisterAllTransports___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unregisterAllTransportsSync];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)caseSignatureForRemoteSignature:(id)a3 groupIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  int v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:@"groupID"];
  }

  return v7;
}

- (void)startRemotelyTriggeredSessionForSignature:(id)a3 groupIdentifier:(id)a4 events:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a5;
  int v9 = [(DiagnosticLiaison *)self caseSignatureForRemoteSignature:a3 groupIdentifier:a4];
  int v10 = liaisonLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Ready to start remotely triggered case", (uint8_t *)&v13, 2u);
  }

  objc_super v11 = [(DiagnosticLiaison *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = liaisonLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "Starting a remotely triggered case with signature: %@", (uint8_t *)&v13, 0xCu);
    }

    [v11 requestSnapshotWithSignature:v9 flags:3 events:v8];
  }
}

- (void)remotelyTriggerSessionWithSignature:(id)a3 forDestinations:(id)a4 groupIdentifier:(id)a5 validFor:(double)a6 queue:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v19 = [MEMORY[0x263EFF9A0] dictionary];
  [v19 setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
  [v19 setObject:@"IDSTransportSend" forKeyedSubscript:@"name"];
  queue = self->_queue;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke;
  v27[3] = &unk_263FC2E60;
  id v28 = v15;
  v29 = self;
  id v30 = v19;
  id v31 = v14;
  double v35 = a6;
  id v33 = v17;
  id v34 = v18;
  id v32 = v16;
  id v21 = v17;
  id v22 = v18;
  id v23 = v16;
  id v24 = v14;
  id v25 = v19;
  id v26 = v15;
  dispatch_async(queue, v27);
}

void __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [*(id *)(a1 + 40) idsTransport];
    id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    [*(id *)(a1 + 48) setObject:v3 forKeyedSubscript:@"count"];

    [*(id *)(a1 + 48) setObject:@"Trigger" forKeyedSubscript:@"endpoint"];
    id v4 = [*(id *)(a1 + 40) remoteCasePayloadForIDSTransport:*(void *)(a1 + 56) groupID:*(void *)(a1 + 64)];
    id v5 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 32)];
    double v6 = *(double *)(a1 + 88);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_2;
    v11[3] = &unk_263FC2E38;
    id v14 = *(id *)(a1 + 80);
    id v12 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 48);
    [v2 sendMessage:v4 toIDSDevices:v5 toEndpoint:@"Trigger" validFor:v11 reply:v6];
  }
  else
  {
    if (!*(void *)(a1 + 80)) {
      return;
    }
    int v7 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_19;
    block[3] = &unk_263FC2DE8;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 80);
    dispatch_async(v7, block);

    v2 = v9;
  }
}

void __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (*(void *)(a1 + 48))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_3;
    block[3] = &unk_263FC2E10;
    id v9 = *(NSObject **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    char v15 = a2;
    id v12 = v7;
    id v13 = v8;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v9, block);
  }
}

uint64_t __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = NSNumber;
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  id v4 = objc_msgSend(v2, "numberWithDouble:");
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"timestamp"];

  id v5 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    [v5 setObject:@"In Progress" forKeyedSubscript:@"status"];
    double v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IDSMessageIdentifier"];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"IDSMessageIdentifier"];
  }
  else
  {
    [v5 setObject:@"failure" forKeyedSubscript:@"result"];
    [*(id *)(a1 + 32) setObject:@"Finished" forKeyedSubscript:@"status"];
    if (*(void *)(a1 + 48))
    {
      id v7 = liaisonLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 48);
        int v11 = 138412290;
        uint64_t v12 = v8;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Failed to send remote IDS trigger message with error %@", (uint8_t *)&v11, 0xCu);
      }

      [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:@"errorObj"];
      id v9 = [*(id *)(a1 + 48) localizedDescription];
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"error"];
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __110__DiagnosticLiaison_remotelyTriggerSessionWithSignature_forDestinations_groupIdentifier_validFor_queue_reply___block_invoke_19(uint64_t a1)
{
  v2 = liaisonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "No IDS destinations to send remote trigger.", v7, 2u);
  }

  id v3 = NSNumber;
  id v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  id v5 = objc_msgSend(v3, "numberWithDouble:");
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"timestamp"];

  [*(id *)(a1 + 32) setObject:@"failure" forKeyedSubscript:@"result"];
  [*(id *)(a1 + 32) setObject:@"Cancelled" forKeyedSubscript:@"status"];
  [*(id *)(a1 + 32) setObject:@"No valid destinations" forKeyedSubscript:@"error"];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)remotelyTriggerSessionForSignature:(id)a3 groupIdentifier:(id)a4 event:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (a5) {
    [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
  }
  else {
  id v16 = [MEMORY[0x263EFF9A0] dictionary];
  }
  [v16 setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
  [v16 setObject:@"failure" forKeyedSubscript:@"result"];
  id v17 = NSNumber;
  id v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSince1970];
  v19 = objc_msgSend(v17, "numberWithDouble:");
  [v16 setObject:v19 forKeyedSubscript:@"timestamp"];

  queue = self->_queue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke;
  v26[3] = &unk_263FC2F00;
  v26[4] = self;
  id v27 = v16;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v15;
  id v25 = v16;
  dispatch_async(queue, v26);
}

void __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a1[4] + 8))
  {
    id v15 = +[SystemProperties sharedInstance];
    uint64_t v16 = [v15 deviceClass];

    id v17 = liaisonLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v16;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "Remotely triggering sessions is not supported on this device (%d)", buf, 8u);
    }

    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported device class (%d)", v16);
    [a1[5] setObject:v18 forKeyedSubscript:@"error"];

    goto LABEL_22;
  }
  if (![a1[6] count])
  {
    v19 = liaisonLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = a1[6];
      *(_DWORD *)buf = 138412290;
      id v42 = v20;
      _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "Remote trigger requested for a case, but a valid signature was not provided. %@", buf, 0xCu);
    }

    id v21 = a1[5];
    id v22 = @"Empty Signature";
    goto LABEL_21;
  }
  uint64_t v2 = [a1[7] length];
  id v3 = liaisonLogHandle();
  id v4 = v3;
  if (!v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v23 = a1[6];
      *(_DWORD *)buf = 138412290;
      id v42 = v23;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "Remote trigger requested for a case, but a valid group identifier was not provided. %@", buf, 0xCu);
    }

    id v21 = a1[5];
    id v22 = @"Missing group identifier";
LABEL_21:
    [v21 setObject:v22 forKeyedSubscript:@"error"];
LABEL_22:
    id v24 = (void (**)(id, void, id))a1[9];
    if (v24) {
      v24[2](v24, 0, a1[5]);
    }
    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v6 = a1[6];
    id v5 = a1[7];
    *(_DWORD *)buf = 138412546;
    id v42 = v5;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "Remotely triggering a session for group identifier %@ and signature %@", buf, 0x16u);
  }

  id v7 = [a1[6] objectForKeyedSubscript:@"domain"];
  int v8 = [v7 isEqualToString:@"HomeKit"];

  if (v8)
  {
    id v9 = [*((id *)a1[4] + 5) idsService];

    if (v9)
    {
      id v10 = liaisonLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = a1[6];
        *(_DWORD *)buf = 138412290;
        id v42 = v11;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Cannot use IDS transport for signature %@", buf, 0xCu);
      }

      [a1[5] setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
      [a1[5] setObject:@"IDS transport not ready" forKeyedSubscript:@"error"];
      id v12 = a1[9];
      if (v12)
      {
        id v13 = a1[8];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_39;
        block[3] = &unk_263FC2E88;
        id v40 = v12;
        id v39 = a1[5];
        dispatch_async(v13, block);

        id v14 = v40;
LABEL_28:
      }
    }
    else
    {
      id v29 = [a1[4] remoteCasePayloadForIDSTransport:a1[6] groupID:a1[7]];
      id v30 = liaisonLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_INFO, "Selecting IDS transport for HomeKit cases", buf, 2u);
      }

      id v31 = a1[4];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_40;
      v35[3] = &unk_263FC2ED8;
      id v37 = a1[9];
      id v36 = a1[8];
      [v31 sendPayloadToHomeKitRelays:v29 additionalPredicate:0 toEndpoint:@"HomeKit" reply:v35];
    }
  }
  else
  {
    id v25 = liaisonLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = a1[6];
      *(_DWORD *)buf = 138412290;
      id v42 = v26;
      _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_ERROR, "Unable to determine appropriate transport for signature %@", buf, 0xCu);
    }

    [a1[5] setObject:@"No appropriate transport for signature" forKeyedSubscript:@"error"];
    id v27 = a1[9];
    if (v27)
    {
      id v28 = a1[8];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_45;
      v32[3] = &unk_263FC2E88;
      id v34 = v27;
      id v33 = a1[5];
      dispatch_async(v28, v32);

      id v14 = v34;
      goto LABEL_28;
    }
  }
}

uint64_t __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_40(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_2;
    block[3] = &unk_263FC2EB0;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __90__DiagnosticLiaison_remotelyTriggerSessionForSignature_groupIdentifier_event_queue_reply___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)sendPayloadToHomeKitRelays:(id)a3 additionalPredicate:(id)a4 toEndpoint:(id)a5 reply:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!self->_allowRemoteTrigger)
  {
    uint64_t v16 = liaisonLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = +[SystemProperties sharedInstance];
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = [v17 deviceClass];
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "Sending remote ABC messages are not supported on this device (%d)", buf, 8u);
    }
    goto LABEL_14;
  }
  if (![v12 length])
  {
    uint64_t v16 = liaisonLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v18 = "Missing or invalid endpoint";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v10 || ![v10 count])
  {
    uint64_t v16 = liaisonLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v18 = "Missing required message payload";
LABEL_13:
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, v18, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  self->_homekitRelayTimedOut = 0;
  homekitRelayTimer = self->_homekitRelayTimer;
  if (homekitRelayTimer)
  {
    dispatch_time_t v15 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(homekitRelayTimer, v15, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
  else
  {
    v19 = [(DiagnosticLiaison *)self queue];
    id v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v19);

    dispatch_time_t v21 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke;
    handler[3] = &unk_263FC2F28;
    handler[4] = self;
    id v32 = v12;
    id v33 = v13;
    dispatch_source_set_event_handler(v20, handler);
    id v22 = self->_homekitRelayTimer;
    self->_homekitRelayTimer = (OS_dispatch_source *)v20;
    id v23 = v20;

    dispatch_resume(v23);
  }
  id v24 = liaisonLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v11;
    _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_INFO, "Looking up IDS identifiers for HomeKit relay devices (additional predicate: %@)", buf, 0xCu);
  }

  id v25 = [(DiagnosticLiaison *)self homeKitAgent];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_49;
  v26[3] = &unk_263FC2FA0;
  v26[4] = self;
  id v27 = v11;
  id v28 = v10;
  id v29 = v12;
  id v30 = v13;
  [v25 fetchResidentDevicesIDSIdentifiersWithReply:v26];

LABEL_15:
}

uint64_t __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  *(unsigned char *)(a1[4] + 24) = 1;
  id v4 = liaisonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "Timed out waiting for all resident devices IDS Identifiers", v6, 2u);
  }

  [0 setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
  [0 setObject:a1[5] forKeyedSubscript:@"endpoint"];
  [0 setObject:@"failure" forKeyedSubscript:@"result"];
  [0 setObject:@"Timed out looking up HomeKit relay IDS Identifiers" forKeyedSubscript:@"error"];
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(dispatch_source_t **)(a1 + 32);
  if (v4[2])
  {
    dispatch_source_cancel(v4[2]);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    id v4 = *(dispatch_source_t **)(a1 + 32);
  }
  id v7 = [(dispatch_source_t *)v4 queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_2;
  v11[3] = &unk_263FC2F78;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v8;
  id v14 = v9;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v10 = v3;
  dispatch_async(v7, v11);
}

void __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = liaisonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v3;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "All IDS identifiers = %@", buf, 0xCu);
  }

  if (*(unsigned char *)(*(void *)(a1 + 40) + 24))
  {
    id v4 = liaisonLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "Relay service reply came in after timeout. Dropping";
      id v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_209DBA000, v6, v7, v5, buf, 2u);
    }
  }
  else
  {
    if (![*(id *)(a1 + 32) count])
    {
      id v4 = liaisonLogHandle();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      uint64_t v5 = "No IDS identifiers for HomeKit relay devices found.";
      id v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
      goto LABEL_6;
    }
    uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"uniqueID IN %@", *(void *)(a1 + 32)];
    id v4 = v8;
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      id v10 = (void *)MEMORY[0x263F08730];
      v21[0] = v8;
      v21[1] = v9;
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
      id v12 = [v10 andPredicateWithSubpredicates:v11];
    }
    else
    {
      id v12 = v8;
    }
    uint64_t v13 = [*(id *)(a1 + 40) idsTransport];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 64);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_56;
    v16[3] = &unk_263FC2F50;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 72);
    id v19 = *(id *)(a1 + 64);
    [v13 sendMessage:v14 toIDSDevicesMatching:v12 toEndpoint:v15 reply:v16];
  }
LABEL_14:
}

void __85__DiagnosticLiaison_sendPayloadToHomeKitRelays_additionalPredicate_toEndpoint_reply___block_invoke_56(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [a3 objectForKeyedSubscript:@"count"];
  uint64_t v9 = liaisonLogHandle();
  id v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 unsignedLongValue];
      uint64_t v12 = [*(id *)(a1 + 32) count];
      int v21 = 134218240;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Successfully sent payload to %ld device(s) (%lu total HomeKit relay devices)", (uint8_t *)&v21, 0x16u);
    }

    uint64_t v13 = liaisonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v21 = 138412290;
      uint64_t v22 = v14;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Message payload: %@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v15 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v8 unsignedLongValue];
      uint64_t v17 = [*(id *)(a1 + 32) count];
      int v21 = 134218498;
      uint64_t v22 = v16;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Failed to send payload to %ld devices(s) (%lu total HomeKit relay devices): %@", (uint8_t *)&v21, 0x20u);
    }

    id v18 = liaisonLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void *)(a1 + 40);
      int v21 = 138412290;
      uint64_t v22 = v19;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEBUG, "Message payload: %@", (uint8_t *)&v21, 0xCu);
    }

    if (v7)
    {
      uint64_t v15 = [v7 localizedDescription];
    }
    else
    {
      uint64_t v15 = @"No matching IDS devices.";
    }
  }
  if (*(void *)(a1 + 56))
  {
    [0 setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
    [0 setObject:@"IDSTransportSend" forKeyedSubscript:@"name"];
    [0 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"endpoint"];
    id v20 = kSymptomDiagnosticEventResultSuccess;
    if (!a2) {
      id v20 = kSymptomDiagnosticEventResultFailure;
    }
    [0 setObject:*v20 forKeyedSubscript:@"result"];
    [0 setObject:v8 forKeyedSubscript:@"count"];
    [0 setObject:v15 forKeyedSubscript:@"error"];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)remotelyEnableAutoBugCapture:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_allowRemoteTrigger)
  {
    uint64_t v5 = [(DiagnosticLiaison *)self idsTransport];

    if (v5)
    {
      id v6 = [(DiagnosticLiaison *)self abcPayloadForIDSTransport:1];
      id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelIdentifier BEGINSWITH 'AudioAccessory'"];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __50__DiagnosticLiaison_remotelyEnableAutoBugCapture___block_invoke;
      v9[3] = &unk_263FC2FC8;
      id v10 = v4;
      [(DiagnosticLiaison *)self sendPayloadToHomeKitRelays:v6 additionalPredicate:v7 toEndpoint:@"AutoBugCapture" reply:v9];
    }
    else
    {
      id v6 = liaisonLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "IDS transport is not available. Cannot remotely enable ABC.", buf, 2u);
      }
    }
  }
  else
  {
    id v6 = liaisonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = +[SystemProperties sharedInstance];
      *(_DWORD *)buf = 67109120;
      int v12 = [v8 deviceClass];
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Sending remote ABC toggle is not supported on this device (%d)", buf, 8u);
    }
  }
}

uint64_t __50__DiagnosticLiaison_remotelyEnableAutoBugCapture___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = liaisonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Success in sending remote ABC enable toggle", v4, 2u);
    }

    uint64_t result = *(void *)(v2 + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)remotelyDisableAutoBugCapture:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_allowRemoteTrigger)
  {
    uint64_t v5 = [(DiagnosticLiaison *)self idsTransport];

    if (v5)
    {
      id v6 = [(DiagnosticLiaison *)self abcPayloadForIDSTransport:0];
      id v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"modelIdentifier BEGINSWITH 'AudioAccessory'"];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __51__DiagnosticLiaison_remotelyDisableAutoBugCapture___block_invoke;
      v9[3] = &unk_263FC2FC8;
      id v10 = v4;
      [(DiagnosticLiaison *)self sendPayloadToHomeKitRelays:v6 additionalPredicate:v7 toEndpoint:@"AutoBugCapture" reply:v9];
    }
    else
    {
      id v6 = liaisonLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "IDS transport is not available. Cannot remotely disable ABC.", buf, 2u);
      }
    }
  }
  else
  {
    id v6 = liaisonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = +[SystemProperties sharedInstance];
      *(_DWORD *)buf = 67109120;
      int v12 = [v8 deviceClass];
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "sending remote ABC toggle is not supported on this device (%d)", buf, 8u);
    }
  }
}

uint64_t __51__DiagnosticLiaison_remotelyDisableAutoBugCapture___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t v3 = liaisonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Success in sending remote ABC enable toggle", v4, 2u);
    }

    uint64_t result = *(void *)(v2 + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)residentDevicesIDSIdentifiersWithReply:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(DiagnosticLiaison *)self homeKitAgent];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__DiagnosticLiaison_residentDevicesIDSIdentifiersWithReply___block_invoke;
    v6[3] = &unk_263FC2FF0;
    id v7 = v4;
    [v5 fetchResidentDevicesIDSIdentifiersWithReply:v6];
  }
}

uint64_t __60__DiagnosticLiaison_residentDevicesIDSIdentifiersWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)messageReceivedFromIDS:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = liaisonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Received message from IDS transport: %@", buf, 0xCu);
  }

  if (v4)
  {
    id v6 = [MEMORY[0x263EFF910] date];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__DiagnosticLiaison_messageReceivedFromIDS___block_invoke;
    block[3] = &unk_263FC3018;
    void block[4] = self;
    id v10 = v4;
    id v11 = v6;
    id v8 = v6;
    dispatch_async(queue, block);
  }
}

uint64_t __44__DiagnosticLiaison_messageReceivedFromIDS___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPayloadFromIDSTransport:*(void *)(a1 + 40) incomingTime:*(void *)(a1 + 48)];
}

- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v8 = a5;
  uint64_t v9 = [(DiagnosticLiaison *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v10 = [MEMORY[0x263EFF9A0] dictionary];
    [v10 setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
    [v10 setObject:@"IDSTransportSend" forKeyedSubscript:@"name"];
    [v10 setObject:@"Finished" forKeyedSubscript:@"status"];
    id v11 = kSymptomDiagnosticEventResultSuccess;
    if (!v6) {
      id v11 = kSymptomDiagnosticEventResultFailure;
    }
    [v10 setObject:*v11 forKeyedSubscript:@"result"];
    int v12 = NSNumber;
    id v13 = [MEMORY[0x263EFF910] date];
    [v13 timeIntervalSince1970];
    uint64_t v14 = objc_msgSend(v12, "numberWithDouble:");
    [v10 setObject:v14 forKeyedSubscript:@"timestamp"];

    [v10 setObject:v15 forKeyedSubscript:@"IDSMessageIdentifier"];
    if (v8) {
      [v10 setObject:v8 forKeyedSubscript:@"errorObj"];
    }
    [v9 remoteTriggerDeliveryUpdateEvent:v10];
  }
}

- (void)messageWithIdentifierHasBeenDelivered:(id)a3
{
  id v9 = a3;
  id v4 = [(DiagnosticLiaison *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    [v5 setObject:@"remoteTrigger" forKeyedSubscript:@"type"];
    [v5 setObject:@"IDSTransportDelivered" forKeyedSubscript:@"name"];
    BOOL v6 = NSNumber;
    id v7 = [MEMORY[0x263EFF910] date];
    [v7 timeIntervalSince1970];
    id v8 = objc_msgSend(v6, "numberWithDouble:");
    [v5 setObject:v8 forKeyedSubscript:@"timestamp"];

    [v5 setObject:v9 forKeyedSubscript:@"IDSMessageIdentifier"];
    [v4 remoteTriggerDeliveryUpdateEvent:v5];
  }
}

- (id)basicSignatureFrom:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"domain"];

  if (v5)
  {
    BOOL v6 = [v3 objectForKeyedSubscript:@"domain"];
    [v4 setObject:v6 forKeyedSubscript:@"domain"];
  }
  id v7 = [v3 objectForKeyedSubscript:@"type"];

  if (v7)
  {
    id v8 = [v3 objectForKeyedSubscript:@"type"];
    [v4 setObject:v8 forKeyedSubscript:@"type"];
  }
  id v9 = [v3 objectForKeyedSubscript:@"subtype"];

  if (v9)
  {
    id v10 = [v3 objectForKeyedSubscript:@"subtype"];
    [v4 setObject:v10 forKeyedSubscript:@"subtype"];
  }
  id v11 = [v3 objectForKeyedSubscript:@"additional"];

  if (v11)
  {
    int v12 = [v3 objectForKeyedSubscript:@"additional"];
    [v4 setObject:v12 forKeyedSubscript:@"additional"];
  }
  id v13 = [v3 objectForKeyedSubscript:@"detected"];

  if (v13)
  {
    uint64_t v14 = [v3 objectForKeyedSubscript:@"detected"];
    [v4 setObject:v14 forKeyedSubscript:@"detected"];
  }
  id v15 = [v3 objectForKeyedSubscript:@"effective"];

  if (v15)
  {
    uint64_t v16 = [v3 objectForKeyedSubscript:@"effective"];
    [v4 setObject:v16 forKeyedSubscript:@"effective"];
  }
  uint64_t v17 = [v3 objectForKeyedSubscript:@"threshval"];

  if (v17)
  {
    id v18 = [v3 objectForKeyedSubscript:@"threshval"];
    [v4 setObject:v18 forKeyedSubscript:@"threshval"];
  }

  return v4;
}

- (id)remoteCasePayloadForIDSTransport:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "length"))
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    [v8 setObject:@"remoteCase" forKeyedSubscript:@"type"];
    id v9 = [(DiagnosticLiaison *)self basicSignatureFrom:v6];
    [v8 setObject:v9 forKeyedSubscript:@"sig"];

    [v8 setObject:v7 forKeyedSubscript:@"gid"];
    id v10 = [MEMORY[0x263EFF910] date];
    [v8 setObject:v10 forKeyedSubscript:@"time"];

    [v8 setObject:&unk_26BDF5858 forKeyedSubscript:@"vers"];
  }
  else
  {
    int v12 = liaisonLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "IDS payload requires a signature dictionary and group identifier.", v13, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)abcPayloadForIDSTransport:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:@"AutoBugCapture" forKeyedSubscript:@"type"];
  uint64_t v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"UserConsent"];

  id v6 = [MEMORY[0x263EFF910] date];
  [v4 setObject:v6 forKeyedSubscript:@"time"];

  [v4 setObject:&unk_26BDF5858 forKeyedSubscript:@"vers"];

  return v4;
}

- (void)processPayloadFromIDSTransport:(id)a3 incomingTime:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 objectForKeyedSubscript:@"vers"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isEqual:&unk_26BDF5870])
  {
    [(DiagnosticLiaison *)self processPayloadVersionOneFromIDSTransport:v8 incomingTime:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isEqual:&unk_26BDF5858]) {
      [(DiagnosticLiaison *)self processPayloadVersionTwoFromIDSTransport:v8 incomingTime:v6];
    }
  }
}

- (void)processPayloadVersionOneFromIDSTransport:(id)a3 incomingTime:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = (__CFString *)a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF910] date];
  }
  id v7 = [(__CFString *)v5 objectForKeyedSubscript:@"sig"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
  }
  else
  {
    id v9 = liaisonLogHandle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v10)
      {
        id v11 = (objc_class *)objc_opt_class();
        int v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412802;
        id v40 = v7;
        __int16 v41 = 2112;
        id v42 = v12;
        __int16 v43 = 2112;
        id v44 = @"sig";
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Found unexpected object %@ (%@) for key %@ in IDS payload.", buf, 0x20u);
      }
    }
    else if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = @"sig";
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Missing object for key %@ in IDS payload.", buf, 0xCu);
    }

    id v8 = 0;
  }
  id v13 = [(__CFString *)v5 objectForKeyedSubscript:@"time"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = v13;
  }
  else
  {
    id v15 = liaisonLogHandle();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        uint64_t v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138412802;
        id v40 = v13;
        __int16 v41 = 2112;
        id v42 = v18;
        __int16 v43 = 2112;
        id v44 = @"time";
        _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Found unexpected object %@ (%@) for key %@ in IDS payload.", buf, 0x20u);
      }
    }
    else if (v16)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = @"sig";
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Missing object for key %@ in IDS payload.", buf, 0xCu);
    }

    uint64_t v14 = 0;
  }
  uint64_t v19 = [(__CFString *)v5 objectForKeyedSubscript:@"gid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if (!v14) {
      goto LABEL_31;
    }
  }
  else
  {
    int v21 = liaisonLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v22)
      {
        __int16 v23 = (objc_class *)objc_opt_class();
        uint64_t v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138412802;
        id v40 = v19;
        __int16 v41 = 2112;
        id v42 = v24;
        __int16 v43 = 2112;
        id v44 = @"gid";
        _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "Found unexpected object %@ (%@) for key %@ in IDS payload.", buf, 0x20u);
      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412290;
      id v40 = @"gid";
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "Missing object for key %@ in IDS payload.", buf, 0xCu);
    }

    id v20 = 0;
    if (!v14) {
      goto LABEL_31;
    }
  }
  if ([(__CFString *)v8 count] && [(__CFString *)v20 length])
  {
    id v32 = v7;
    v37[0] = @"type";
    v37[1] = @"name";
    v38[0] = @"remoteTrigger";
    v38[1] = @"IDSTransportSend";
    v37[2] = @"timestamp";
    __int16 v25 = NSNumber;
    [(__CFString *)v14 timeIntervalSince1970];
    id v26 = objc_msgSend(v25, "numberWithDouble:");
    v38[2] = v26;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

    v35[0] = @"type";
    v35[1] = @"name";
    v36[0] = @"remoteTrigger";
    v36[1] = @"IDSTransportReceive";
    v35[2] = @"timestamp";
    id v28 = NSNumber;
    [v6 timeIntervalSince1970];
    id v29 = objc_msgSend(v28, "numberWithDouble:");
    v36[2] = v29;
    id v30 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

    v34[0] = v27;
    v34[1] = v30;
    id v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    [(DiagnosticLiaison *)self startRemotelyTriggeredSessionForSignature:v8 groupIdentifier:v20 events:v31];

    id v7 = v32;
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v27 = liaisonLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v5;
    _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_ERROR, "Received a cross device trigger message over IDS that was malformed: %@", buf, 0xCu);
  }
LABEL_33:
}

- (void)processPayloadVersionTwoFromIDSTransport:(id)a3 incomingTime:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"type"];
  id v9 = v8;
  if (!v8) {
    goto LABEL_13;
  }
  if ([(__CFString *)v8 isEqualToString:@"remoteCase"])
  {
    [(DiagnosticLiaison *)self processPayloadVersionOneFromIDSTransport:v6 incomingTime:v7];
    goto LABEL_16;
  }
  if ([(__CFString *)v9 isEqualToString:@"AutoBugCapture"])
  {
    BOOL v10 = [v6 objectForKeyedSubscript:@"UserConsent"];
    int v11 = [v10 BOOLValue];

    int v12 = liaisonLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = @"NO";
      if (v11) {
        id v13 = @"YES";
      }
      int v17 = 138412290;
      id v18 = v13;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "Received an ABC IDS message with UserConsent = %@", (uint8_t *)&v17, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (v11) {
      CFStringRef v15 = @"com.apple.autobugcapture.UserConsentYES";
    }
    else {
      CFStringRef v15 = @"com.apple.autobugcapture.UserConsentNO";
    }
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v15, 0, 0, 4u);
  }
  else
  {
LABEL_13:
    BOOL v16 = liaisonLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, "Received an IDS message with unknown type: %@", (uint8_t *)&v17, 0xCu);
    }
  }
LABEL_16:
}

- (void)checkForUIImpactScenarioForCase:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(PrimaryInterfaceUtils *)self->_interfaceUtils interfaceBecamePrimaryDate];
  if (v5)
  {
    if ([(PrimaryInterfaceUtils *)self->_interfaceUtils primaryInterfaceType] == 1)
    {
      [v5 timeIntervalSinceNow];
      if (v6 > -180.0)
      {
        double v7 = -v6;
        id v8 = liaisonLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 134217984;
          double v23 = v7;
          _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "UIPerformance case seen within TH Period (%f since primary interface change)", (uint8_t *)&v22, 0xCu);
        }

        symptom_framework_init();
        symptom_new();
        symptom_set_qualifier();
        [(PrimaryInterfaceUtils *)self->_interfaceUtils primaryInterfaceType];
        symptom_set_qualifier();
        id v9 = [v4 signature];
        BOOL v10 = [v9 objectForKeyedSubscript:@"detected"];

        id v11 = v10;
        int v12 = (const char *)[v11 UTF8String];
        if (v12)
        {
          strlen(v12);
          symptom_set_additional_qualifier();
        }
        id v13 = [v4 signature];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"subtype"];

        id v15 = v14;
        BOOL v16 = (const char *)[v15 UTF8String];
        if (v16)
        {
          strlen(v16);
          symptom_set_additional_qualifier();
        }
        int v17 = [v4 deParametersFromPayloads];
        id v18 = v17;
        if (v17)
        {
          uint64_t v19 = [v17 objectForKeyedSubscript:@"com.apple.DiagnosticExtensions.tailspin"];
          if ([v19 count])
          {
            CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], v18, kCFPropertyListXMLFormat_v1_0, 0, 0);
            if (Data)
            {
              CFDataRef v21 = Data;
              CFDataGetLength(Data);
              CFDataGetBytePtr(v21);
              symptom_set_additional_qualifier();
              CFRelease(v21);
            }
          }
        }
        symptom_send();
      }
    }
  }
}

- (DiagnosticLiaisonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DiagnosticLiaisonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interfaceUtils, 0);
  objc_storeStrong((id *)&self->_idsTransport, 0);
  objc_storeStrong((id *)&self->_homeKitAgent, 0);

  objc_storeStrong((id *)&self->_homekitRelayTimer, 0);
}

@end
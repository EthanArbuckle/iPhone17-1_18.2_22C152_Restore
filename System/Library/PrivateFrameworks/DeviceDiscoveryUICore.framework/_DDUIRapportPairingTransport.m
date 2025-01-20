@interface _DDUIRapportPairingTransport
- (BOOL)listeningForResponses;
- (NSArray)availableDevices;
- (NSArray)previousAvailableDevices;
- (NSMapTable)transportSessionByUUID;
- (RPClient)rpClient;
- (RPCompanionLinkClient)client;
- (_DDUIRapportPairingTransport)initWithMode:(unint64_t)a3;
- (_DDUIRapportPairingTransport)initWithMode:(unint64_t)a3 companionLinkClient:(id)a4;
- (id)availableDevicesChangedHandler;
- (id)sessionForDevice:(id)a3 bundleID:(id)a4 serviceIdentifier:(id)a5 error:(id *)a6;
- (unsigned)wantedDeviceTypes;
- (void)_setupListeningForResponseMessagesIfNeeded;
- (void)activateForDeviceTypes:(unsigned int)a3 withCompletion:(id)a4;
- (void)createListenerMappingForDevice:(id)a3 forServiceIdentifier:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setAvailableDevicesChangedHandler:(id)a3;
- (void)setClient:(id)a3;
- (void)setListeningForResponses:(BOOL)a3;
- (void)setPreviousAvailableDevices:(id)a3;
- (void)setRpClient:(id)a3;
- (void)setTransportSessionByUUID:(id)a3;
- (void)setWantedDeviceTypes:(unsigned int)a3;
- (void)setupListeningForSessionsWithHandler:(id)a3;
- (void)shouldReauthenticateDevice:(id)a3 forServiceIdentifier:(id)a4 completion:(id)a5;
@end

@implementation _DDUIRapportPairingTransport

- (_DDUIRapportPairingTransport)initWithMode:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F946E0]);
  v6 = [(_DDUIRapportPairingTransport *)self initWithMode:a3 companionLinkClient:v5];

  return v6;
}

- (_DDUIRapportPairingTransport)initWithMode:(unint64_t)a3 companionLinkClient:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_DDUIRapportPairingTransport;
  v8 = [(_DDUIRapportPairingTransport *)&v18 init];
  if (v8)
  {
    v9 = (RPClient *)objc_alloc_init(MEMORY[0x1E4F946C8]);
    rpClient = v8->_rpClient;
    v8->_rpClient = v9;

    objc_storeStrong((id *)&v8->_client, a4);
    v11 = DDUICorePrimaryQueue();
    [(RPCompanionLinkClient *)v8->_client setDispatchQueue:v11];

    if (a3) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 4231174;
    }
    if (_os_feature_enabled_impl())
    {
      v13 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFC71000, v13, OS_LOG_TYPE_DEFAULT, "Starting discovery with AWDL enabled", buf, 2u);
      }
    }
    else
    {
      v12 |= 0x400000uLL;
    }
    [(RPCompanionLinkClient *)v8->_client setControlFlags:v12];
    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    transportSessionByUUID = v8->_transportSessionByUUID;
    v8->_transportSessionByUUID = (NSMapTable *)v14;

    v16 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v20 = v8;
      _os_log_impl(&dword_1CFC71000, v16, OS_LOG_TYPE_DEFAULT, "-[_DDUIRapportPairingTransport init] {self: %p}", buf, 0xCu);
    }
  }
  return v8;
}

- (NSArray)availableDevices
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25DADE0](self, a2);
  id v84 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v90 = self;
  v4 = [(RPCompanionLinkClient *)self->_client activeDevices];
  id v5 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v112 = v4;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "Finding available devices among %@", buf, 0xCu);
  }

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v104;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v104 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v103 + 1) + 8 * v9);
        v11 = [v10 model];
        int v12 = v90->_wantedDeviceTypes & DDUIDeviceTypeForModelString(v11);

        if (v12)
        {
          v13 = [v10 sourceVersion];
          if ([v13 length])
          {
            uint64_t v14 = [v10 sourceVersion];
            uint64_t v15 = [v14 integerValue];

            if (v15 < 400) {
              goto LABEL_34;
            }
            v16 = [v10 idsDeviceIdentifier];
            v17 = v88;
            if (v16)
            {
              v17 = [v10 idsDeviceIdentifier];
              if ([v84 containsObject:v17])
              {
                v88 = v17;

                goto LABEL_14;
              }
            }
            v26 = [v10 idsDeviceIdentifier];
            v88 = v17;
            if (v26)
            {

LABEL_26:
              if (v16)
              {
              }
            }
            else
            {
              uint64_t v29 = [v10 identifier];
              if (!v29) {
                goto LABEL_26;
              }
              v30 = (void *)v29;
              v31 = [v10 identifier];
              int v32 = [v84 containsObject:v31];

              if (v16)
              {

                if ((v32 & 1) == 0) {
                  goto LABEL_28;
                }
              }
              else if (!v32)
              {
                goto LABEL_28;
              }
LABEL_14:
              if (([v10 statusFlags] & 4) == 0) {
                goto LABEL_34;
              }
              if ([v3 count])
              {
                uint64_t v18 = 0;
                while (1)
                {
                  v19 = [v3 objectAtIndexedSubscript:v18];
                  v20 = [v19 idsDeviceIdentifier];
                  uint64_t v21 = [v10 idsDeviceIdentifier];
                  if (!v21) {
                    break;
                  }
                  v22 = (void *)v21;
                  int v23 = [v20 isEqual:v21];

                  if (v23) {
                    goto LABEL_19;
                  }
LABEL_20:
                  if (++v18 >= (unint64_t)[v3 count]) {
                    goto LABEL_28;
                  }
                }
                v24 = [v10 identifier];
                char v25 = [v20 isEqual:v24];

                if ((v25 & 1) == 0) {
                  goto LABEL_20;
                }
LABEL_19:
                [v3 removeObjectAtIndex:v18--];
                goto LABEL_20;
              }
            }
LABEL_28:
            v27 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v112 = v10;
              _os_log_impl(&dword_1CFC71000, v27, OS_LOG_TYPE_DEFAULT, "Found acceptable device %@", buf, 0xCu);
            }

            [v3 addObject:v10];
            v13 = [v10 idsDeviceIdentifier];
            if (v13)
            {
              [v84 addObject:v13];
            }
            else
            {
              v28 = [v10 identifier];
              [v84 addObject:v28];
            }
          }
        }
LABEL_34:
        ++v9;
      }
      while (v9 != v7);
      uint64_t v33 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
      uint64_t v7 = v33;
    }
    while (v33);
  }

  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v35 = [(_DDUIRapportPairingTransport *)v90 previousAvailableDevices];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v100 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        v41 = [v40 idsDeviceIdentifier];
        if (v41)
        {
          [v34 addObject:v41];
        }
        else
        {
          v42 = [v40 identifier];
          [v34 addObject:v42];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v37);
  }

  v89 = (void *)[v84 mutableCopy];
  [v89 minusSet:v34];
  v43 = (void *)[v34 mutableCopy];
  [v43 minusSet:v84];
  v82 = v34;
  v85 = (void *)[v34 mutableCopy];
  [v85 unionSet:v84];
  v44 = [(_DDUIRapportPairingTransport *)v90 previousAvailableDevices];
  v45 = (void *)[v44 mutableCopy];
  v46 = v45;
  if (v45)
  {
    id v47 = v45;
  }
  else
  {
    id v47 = [MEMORY[0x1E4F1CA48] array];
  }
  v48 = v47;

  if ([v48 count])
  {
    unint64_t v49 = 0;
    do
    {
      v50 = [v48 objectAtIndexedSubscript:v49];
      v51 = [v50 idsDeviceIdentifier];
      v52 = v51;
      if (v51)
      {
        id v53 = v51;
      }
      else
      {
        id v53 = [v50 identifier];
      }
      v54 = v53;

      if ([v43 containsObject:v54]) {
        [v48 removeObjectAtIndex:v49--];
      }

      ++v49;
    }
    while (v49 < [v48 count]);
  }
  v81 = v43;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  subsystem = (char *)v3;
  uint64_t v55 = [subsystem countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v96;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v96 != v57) {
          objc_enumerationMutation(subsystem);
        }
        v59 = *(void **)(*((void *)&v95 + 1) + 8 * j);
        uint64_t v60 = objc_msgSend(v59, "idsDeviceIdentifier", v81);
        if (v60)
        {
          v61 = (void *)v60;
          int v62 = [v89 containsObject:v60];

          if (v62) {
            goto LABEL_71;
          }
        }
        else
        {
          v63 = [v59 identifier];
          char v64 = [v89 containsObject:v63];

          if (v64)
          {
LABEL_71:
            [v48 addObject:v59];
            continue;
          }
        }
        v65 = [v59 idsDeviceIdentifier];
        int v66 = [v85 containsObject:v65];

        if (v66 && [v48 count])
        {
          uint64_t v67 = 0;
          while (1)
          {
            v68 = [v59 idsDeviceIdentifier];
            v69 = [v48 objectAtIndexedSubscript:v67];
            v70 = [v69 idsDeviceIdentifier];
            int v71 = [v68 isEqual:v70];

            if (v71) {
              break;
            }
            if (++v67 >= (unint64_t)[v48 count]) {
              goto LABEL_80;
            }
          }
          [v48 replaceObjectAtIndex:v67 withObject:v59];
        }
LABEL_80:
        ;
      }
      uint64_t v56 = [subsystem countByEnumeratingWithState:&v95 objects:v108 count:16];
    }
    while (v56);
  }

  v72 = (void *)[v48 copy];
  [(_DDUIRapportPairingTransport *)v90 setPreviousAvailableDevices:v72];
  id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v74 = v72;
  uint64_t v75 = [v74 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v92;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v92 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = [[_DDUIRapportDevice alloc] initWithRPCompanionLinkDevice:*(void *)(*((void *)&v91 + 1) + 8 * k)];
        [v73 addObject:v79];
      }
      uint64_t v76 = [v74 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v76);
  }

  return (NSArray *)v73;
}

- (void)invalidate
{
  [(RPCompanionLinkClient *)self->_client invalidate];
  client = self->_client;
  self->_client = 0;
}

- (void)setAvailableDevicesChangedHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_availableDevicesChangedHandler != v4)
  {
    id v5 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)MEMORY[0x1D25DB000](v4);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = self;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport set devices changed handler {self: %p, availableDevicesChangedHandler: %@}", buf, 0x16u);
    }
    uint64_t v7 = (void *)MEMORY[0x1D25DB000](v4);
    id availableDevicesChangedHandler = self->_availableDevicesChangedHandler;
    self->_id availableDevicesChangedHandler = v7;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke;
    v13[3] = &unk_1E685F930;
    objc_copyWeak(&v15, (id *)buf);
    id v9 = v4;
    id v14 = v9;
    [(RPCompanionLinkClient *)self->_client setDeviceFoundHandler:v13];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66___DDUIRapportPairingTransport_setAvailableDevicesChangedHandler___block_invoke_2;
    v10[3] = &unk_1E685F930;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v9;
    [(RPCompanionLinkClient *)self->_client setDeviceLostHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

- (id)sessionForDevice:(id)a3 bundleID:(id)a4 serviceIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 134218498;
    v31 = self;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_1CFC71000, v12, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport creating transport session {self: %p, device: %@, serviceIdentifier %@}", (uint8_t *)&v30, 0x20u);
  }

  v13 = [[_DDUIRapportOutgoingTransportSession alloc] initWithServiceIdentifier:v10];
  id v14 = objc_alloc_init(MEMORY[0x1E4F946E8]);
  id v15 = [v9 identifier];
  [v14 setIdentifier:v15];

  id v16 = objc_alloc_init(MEMORY[0x1E4F946E0]);
  [(_DDUIRapportOutgoingTransportSession *)v13 setClient:v16];

  __int16 v17 = DDUICorePrimaryQueue();
  uint64_t v18 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  [v18 setDispatchQueue:v17];

  uint64_t v19 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  [v19 setServiceType:@"com.apple.devicediscoveryui.rapportwake"];

  v20 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  [v20 setDestinationDevice:v14];

  uint64_t v21 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  [v21 setUseCase:327680];

  v22 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  [v22 setBleClientUseCase:327680];

  int v23 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  [v23 setAppID:v11];

  if (_os_feature_enabled_impl())
  {
    v24 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1CFC71000, v24, OS_LOG_TYPE_DEFAULT, "Creating session with AWDL enabled", (uint8_t *)&v30, 2u);
    }

    uint64_t v25 = 262;
  }
  else
  {
    uint64_t v25 = 4194566;
  }
  v26 = [(_DDUIRapportOutgoingTransportSession *)v13 client];
  objc_msgSend(v26, "setControlFlags:", objc_msgSend(v26, "controlFlags") | v25);

  transportSessionByUUID = self->_transportSessionByUUID;
  v28 = [(_DDUIRapportOutgoingTransportSession *)v13 sessionID];
  [(NSMapTable *)transportSessionByUUID setObject:v13 forKey:v28];

  [(_DDUIRapportPairingTransport *)self _setupListeningForResponseMessagesIfNeeded];
  return v13;
}

- (void)activateForDeviceTypes:(unsigned int)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = DDUIDeviceTypeString(a3);
    id v9 = (void *)MEMORY[0x1D25DB000](v6);
    *(_DWORD *)buf = 134218498;
    id v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1CFC71000, v7, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport activating {self: %p, deviceTypes: %@, completion: %@}", buf, 0x20u);
  }
  self->_wantedDeviceTypes = a3;
  client = self->_client;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70___DDUIRapportPairingTransport_activateForDeviceTypes_withCompletion___block_invoke;
  v12[3] = &unk_1E685F958;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(RPCompanionLinkClient *)client activateWithCompletion:v12];
}

- (void)_setupListeningForResponseMessagesIfNeeded
{
  if (!self->_listeningForResponses)
  {
    self->_listeningForResponses = 1;
    id location = 0;
    objc_initWeak(&location, self);
    client = self->_client;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __74___DDUIRapportPairingTransport__setupListeningForResponseMessagesIfNeeded__block_invoke;
    v4[3] = &unk_1E685F980;
    objc_copyWeak(&v5, &location);
    [(RPCompanionLinkClient *)client registerRequestID:@"DDUI-pair-resp" options:0 handler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)setupListeningForSessionsWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  id v5 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)MEMORY[0x1D25DB000](v4);
    *(_DWORD *)buf = 134218242;
    __int16 v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPairingTransport setup listening {self: %p, incomingSessionHandler: %@}", buf, 0x16u);
  }
  client = self->_client;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke;
  v13[3] = &unk_1E685F9A8;
  objc_copyWeak(&v15, &location);
  void v13[4] = self;
  id v8 = v4;
  id v14 = v8;
  [(RPCompanionLinkClient *)client registerRequestID:@"DDUI-pair-init" options:0 handler:v13];
  id v9 = self->_client;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69___DDUIRapportPairingTransport_setupListeningForSessionsWithHandler___block_invoke_33;
  v11[3] = &unk_1E685F9D0;
  v11[4] = self;
  id v10 = v8;
  id v12 = v10;
  [(RPCompanionLinkClient *)v9 registerRequestID:@"_ccConfirmStart" options:0 handler:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)shouldReauthenticateDevice:(id)a3 forServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_DDUIRapportPairingTransport *)self rpClient];
  id v12 = [v10 identifier];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91___DDUIRapportPairingTransport_shouldReauthenticateDevice_forServiceIdentifier_completion___block_invoke;
  v14[3] = &unk_1E685F9F8;
  id v15 = v8;
  id v13 = v8;
  [v11 queryDeviceToListenerMapping:v9 deviceID:v12 completion:v14];
}

- (void)createListenerMappingForDevice:(id)a3 forServiceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_DDUIRapportPairingTransport *)self rpClient];
  id v12 = [v10 identifier];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95___DDUIRapportPairingTransport_createListenerMappingForDevice_forServiceIdentifier_completion___block_invoke;
  v14[3] = &unk_1E685F9F8;
  id v15 = v8;
  id v13 = v8;
  [v11 createDeviceToListenerMapping:v9 deviceID:v12 completion:v14];
}

- (id)availableDevicesChangedHandler
{
  return self->_availableDevicesChangedHandler;
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (RPClient)rpClient
{
  return self->_rpClient;
}

- (void)setRpClient:(id)a3
{
}

- (NSMapTable)transportSessionByUUID
{
  return self->_transportSessionByUUID;
}

- (void)setTransportSessionByUUID:(id)a3
{
}

- (unsigned)wantedDeviceTypes
{
  return self->_wantedDeviceTypes;
}

- (void)setWantedDeviceTypes:(unsigned int)a3
{
  self->_wantedDeviceTypes = a3;
}

- (BOOL)listeningForResponses
{
  return self->_listeningForResponses;
}

- (void)setListeningForResponses:(BOOL)a3
{
  self->_listeningForResponses = a3;
}

- (NSArray)previousAvailableDevices
{
  return self->_previousAvailableDevices;
}

- (void)setPreviousAvailableDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAvailableDevices, 0);
  objc_storeStrong((id *)&self->_transportSessionByUUID, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_availableDevicesChangedHandler, 0);
}

@end
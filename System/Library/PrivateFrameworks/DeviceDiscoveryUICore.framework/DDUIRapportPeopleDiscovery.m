@interface DDUIRapportPeopleDiscovery
- (DDUIRapportPeopleDiscovery)initWithRemoteDisplayDiscovery:(id)a3 deviceSelectedHandler:(id)a4;
- (NSArray)previousAvailablePeople;
- (NSMutableDictionary)discoveredDevicesMap;
- (RPRemoteDisplayDevice)dedicatedDevice;
- (RPRemoteDisplayDiscovery)discovery;
- (id)availablePeople;
- (id)availablePeopleChangedHandler;
- (id)dedicatedDeviceChangedHandler;
- (id)discoverySessionChangedHandler;
- (id)getDiscoveredDevicesMap;
- (id)personDeclinedHandler;
- (unsigned)discoverySessionState;
- (void)activateDiscoveryWithCompletion:(id)a3;
- (void)attemptDedicatedDeviceConnection;
- (void)cancelPerson:(id)a3;
- (void)invalidate;
- (void)selectPerson:(id)a3 forDedicatedPairing:(BOOL)a4;
- (void)setAvailablePeopleChangedHandler:(id)a3;
- (void)setDedicatedDevice:(id)a3;
- (void)setDedicatedDeviceChangedHandler:(id)a3;
- (void)setDiscoveredDevicesMap:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setDiscoverySessionChangedHandler:(id)a3;
- (void)setPersonDeclinedHandler:(id)a3;
- (void)setPreviousAvailablePeople:(id)a3;
@end

@implementation DDUIRapportPeopleDiscovery

- (DDUIRapportPeopleDiscovery)initWithRemoteDisplayDiscovery:(id)a3 deviceSelectedHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_discovery, a3);
  [(RPRemoteDisplayDiscovery *)self->_discovery setDiscoveryFlags:[(RPRemoteDisplayDiscovery *)self->_discovery discoveryFlags] | 3];
  [(RPRemoteDisplayDiscovery *)self->_discovery setDeviceSelectedHandler:v8];
  id location = 0;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke;
  v14[3] = &unk_1E685FF80;
  objc_copyWeak(&v15, &location);
  [(RPRemoteDisplayDiscovery *)self->_discovery setDeviceFoundHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_1;
  v12[3] = &unk_1E685FFA8;
  objc_copyWeak(&v13, &location);
  [(RPRemoteDisplayDiscovery *)self->_discovery setDeviceChangedHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_3;
  v10[3] = &unk_1E685FF80;
  objc_copyWeak(&v11, &location);
  [(RPRemoteDisplayDiscovery *)self->_discovery setDeviceLostHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return self;
}

void __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "RPRemoteDisplayDevice found: %@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [WeakRetained discoveredDevicesMap];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [WeakRetained setDiscoveredDevicesMap:v7];
  }
  id v8 = [WeakRetained discoveredDevicesMap];
  v9 = [v3 idsDeviceIdentifier];
  [v8 setObject:v3 forKeyedSubscript:v9];
}

void __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "RPRemoteDisplayDevice changed: %@", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [WeakRetained discoveredDevicesMap];

  if (v6)
  {
    id v7 = [WeakRetained discoveredDevicesMap];
    id v8 = [v3 idsDeviceIdentifier];
    v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      int v10 = [WeakRetained discoveredDevicesMap];
      id v11 = [v3 idsDeviceIdentifier];
      [v10 setObject:v3 forKeyedSubscript:v11];
    }
  }
}

void __83__DDUIRapportPeopleDiscovery_initWithRemoteDisplayDiscovery_deviceSelectedHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "RPRemoteDisplayDevice lost: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [WeakRetained discoveredDevicesMap];

  if (v6)
  {
    id v7 = [WeakRetained discoveredDevicesMap];
    id v8 = [v3 idsDeviceIdentifier];
    [v7 removeObjectForKey:v8];
  }
}

- (void)activateDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  discovery = self->_discovery;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__DDUIRapportPeopleDiscovery_activateDiscoveryWithCompletion___block_invoke;
  v7[3] = &unk_1E685FFD0;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [(RPRemoteDisplayDiscovery *)discovery activateWithCompletion:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __62__DDUIRapportPeopleDiscovery_activateDiscoveryWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v17 = 134218242;
    uint64_t v18 = v5;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1CFC71000, v4, OS_LOG_TYPE_DEFAULT, "DDUIRapportPeopleDiscovery activated {self: %p, inError: %@}", (uint8_t *)&v17, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (!v3 && WeakRetained)
  {
    id v8 = [WeakRetained availablePeopleChangedHandler];

    if (v8)
    {
      id v9 = [v7 availablePeopleChangedHandler];
      id v10 = [v7 availablePeople];
      ((void (**)(void, void *))v9)[2](v9, v10);
    }
    uint64_t v11 = [v7 discoverySessionChangedHandler];

    if (v11)
    {
      int v12 = [v7 discoverySessionChangedHandler];
      id v13 = [v7 discovery];
      uint64_t v14 = [v13 currentState];
      id v15 = [v7 discovery];
      v16 = [v15 peerDeviceIdentifier];
      ((void (**)(void, uint64_t, void *))v12)[2](v12, v14, v16);
    }
  }
}

- (id)availablePeople
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25DADE0](self, a2);
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v50 = self;
  id v4 = [(RPRemoteDisplayDiscovery *)self->_discovery discoveredPeople];
  uint64_t v5 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v4;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "Finding available people among %@", buf, 0xCu);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v66 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v10 accountAltDSID];
          if (v11 && [v56 containsObject:v11] && objc_msgSend(v3, "count"))
          {
            unint64_t v12 = 0;
            do
            {
              id v13 = [v3 objectAtIndexedSubscript:v12];
              uint64_t v14 = [v13 accountAltDSID];
              int v15 = [v14 isEqual:v11];

              if (v15) {
                [v3 removeObjectAtIndex:v12--];
              }
              ++v12;
            }
            while (v12 < [v3 count]);
          }
          v16 = _DDUICoreRapportLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v73 = v10;
            _os_log_impl(&dword_1CFC71000, v16, OS_LOG_TYPE_DEFAULT, "Found acceptable person %@", buf, 0xCu);
          }

          [v3 addObject:v10];
          [v56 addObject:v11];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v7);
  }

  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v18 = [(DDUIRapportPeopleDiscovery *)v50 previousAvailablePeople];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        if (objc_opt_respondsToSelector())
        {
          v24 = [v23 accountAltDSID];
          [v17 addObject:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v20);
  }

  v53 = (void *)[v56 mutableCopy];
  [v53 minusSet:v17];
  v51 = (void *)[v17 mutableCopy];
  [v51 minusSet:v56];
  v52 = (void *)[v17 mutableCopy];
  [v52 unionSet:v56];
  v25 = [(DDUIRapportPeopleDiscovery *)v50 previousAvailablePeople];
  v26 = (void *)[v25 mutableCopy];
  v27 = v26;
  v48 = v17;
  if (v26)
  {
    id v28 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "array", v17, context);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;

  if ([v29 count])
  {
    unint64_t v30 = 0;
    do
    {
      v31 = objc_msgSend(v29, "objectAtIndexedSubscript:", v30, v48);
      if (objc_opt_respondsToSelector())
      {
        v32 = [v31 accountAltDSID];
        if ([v51 containsObject:v32]) {
          [v29 removeObjectAtIndex:v30--];
        }
      }
      ++v30;
    }
    while (v30 < [v29 count]);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v54 = v3;
  uint64_t v33 = [v54 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v54);
        }
        v37 = *(void **)(*((void *)&v57 + 1) + 8 * k);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v38 = v34;
          v39 = [v37 accountAltDSID];
          if ([v53 containsObject:v39])
          {
            [v29 addObject:v37];
          }
          else if ([v52 containsObject:v39] && objc_msgSend(v29, "count"))
          {
            uint64_t v40 = 0;
            while (1)
            {
              v41 = objc_msgSend(v29, "objectAtIndexedSubscript:", v40, v48);
              v42 = [v41 accountAltDSID];
              int v43 = [v39 isEqual:v42];

              if (v43) {
                break;
              }
              if (++v40 >= (unint64_t)[v29 count]) {
                goto LABEL_55;
              }
            }
            [v29 replaceObjectAtIndex:v40 withObject:v37];
          }
LABEL_55:

          uint64_t v34 = v38;
        }
      }
      uint64_t v34 = [v54 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v34);
  }

  v44 = (void *)[v29 copy];
  [(DDUIRapportPeopleDiscovery *)v50 setPreviousAvailablePeople:v44];
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v46 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v45;
    _os_log_impl(&dword_1CFC71000, v46, OS_LOG_TYPE_DEFAULT, "rapport people: %@", buf, 0xCu);
  }

  return v45;
}

- (id)getDiscoveredDevicesMap
{
  v2 = [(DDUIRapportPeopleDiscovery *)self discoveredDevicesMap];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)setAvailablePeopleChangedHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_availablePeopleChangedHandler != v4)
  {
    uint64_t v5 = _DDUICoreRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)MEMORY[0x1D25DB000](v4);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = self;
      __int16 v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPeopleDiscovery set people changed handler {self: %p, availableDevicesChangedHandler: %@}", buf, 0x16u);
    }
    uint64_t v7 = (void *)MEMORY[0x1D25DB000](v4);
    id availablePeopleChangedHandler = self->_availablePeopleChangedHandler;
    self->_id availablePeopleChangedHandler = v7;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke;
    v17[3] = &unk_1E685FFF8;
    objc_copyWeak(&v19, (id *)buf);
    id v9 = v4;
    id v18 = v9;
    [(RPRemoteDisplayDiscovery *)self->_discovery setPersonFoundHandler:v17];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_2;
    v14[3] = &unk_1E685FFF8;
    objc_copyWeak(&v16, (id *)buf);
    id v10 = v9;
    id v15 = v10;
    [(RPRemoteDisplayDiscovery *)self->_discovery setPersonChangedHandler:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_3;
    v11[3] = &unk_1E685FFF8;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v10;
    [(RPRemoteDisplayDiscovery *)self->_discovery setPersonLostHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    id v4 = [WeakRetained availablePeople];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id WeakRetained = v5;
  }
}

void __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    id v4 = [WeakRetained availablePeople];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id WeakRetained = v5;
  }
}

void __63__DDUIRapportPeopleDiscovery_setAvailablePeopleChangedHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = WeakRetained;
    id v4 = [WeakRetained availablePeople];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    id WeakRetained = v5;
  }
}

- (void)setDiscoverySessionChangedHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_discoverySessionChangedHandler != v4)
  {
    id v5 = _DDUICoreRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)MEMORY[0x1D25DB000](v4);
      int v9 = 134218242;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPeopleDiscovery set session changed handler {self: %p, discoverySessionStateChangedHandler: %@}", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = (void *)MEMORY[0x1D25DB000](v4);
    id discoverySessionChangedHandler = self->_discoverySessionChangedHandler;
    self->_id discoverySessionChangedHandler = v7;

    [(RPRemoteDisplayDiscovery *)self->_discovery setDiscoverySessionStateChangedHandler:self->_discoverySessionChangedHandler];
  }
}

- (unsigned)discoverySessionState
{
  return [(RPRemoteDisplayDiscovery *)self->_discovery currentState];
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  return (RPRemoteDisplayDevice *)[(RPRemoteDisplayDiscovery *)self->_discovery dedicatedDevice];
}

- (void)setDedicatedDevice:(id)a3
{
}

- (void)setDedicatedDeviceChangedHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_dedicatedDeviceChangedHandler != v4)
  {
    id v5 = _DDUICoreRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)MEMORY[0x1D25DB000](v4);
      int v9 = 134218242;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "_DDUIRapportPeopleDiscovery set dedicated device changed handler {self: %p, dedicatedDeviceChangedHandler: %@}", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = (void *)MEMORY[0x1D25DB000](v4);
    id dedicatedDeviceChangedHandler = self->_dedicatedDeviceChangedHandler;
    self->_id dedicatedDeviceChangedHandler = v7;

    [(RPRemoteDisplayDiscovery *)self->_discovery setDedicatedDeviceChangedHandler:self->_dedicatedDeviceChangedHandler];
  }
}

- (void)attemptDedicatedDeviceConnection
{
}

void __62__DDUIRapportPeopleDiscovery_attemptDedicatedDeviceConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1CFC71000, v3, OS_LOG_TYPE_DEFAULT, "requestDedicatedDeviceConfirmation completed with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setPersonDeclinedHandler:(id)a3
{
  if (self->_personDeclinedHandler != a3)
  {
    id v6 = a3;
    int v4 = (void *)MEMORY[0x1D25DB000]();
    id personDeclinedHandler = self->_personDeclinedHandler;
    self->_id personDeclinedHandler = v4;

    [(RPRemoteDisplayDiscovery *)self->_discovery setPersonDeclinedHandler:v6];
  }
}

- (void)cancelPerson:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "Canceling confirmation for person: %@", (uint8_t *)&v6, 0xCu);
  }

  [(RPRemoteDisplayDiscovery *)self->_discovery personCanceled:v4];
}

- (void)selectPerson:(id)a3 forDedicatedPairing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  -[RPRemoteDisplayDiscovery setPersonSelected:forDedicatedPairing:](self->_discovery, "setPersonSelected:forDedicatedPairing:", a3);
  int v6 = _DDUICoreRapportLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v7 = @"[dedicated]";
    }
    else {
      id v7 = &stru_1F264DD98;
    }
    uint64_t v8 = [(RPRemoteDisplayDiscovery *)self->_discovery personSelected];
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_1CFC71000, v6, OS_LOG_TYPE_DEFAULT, "Setting RPRemoteDisplayDiscovery person selected %{public}@ to %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)invalidate
{
  [(RPRemoteDisplayDiscovery *)self->_discovery invalidate];
  discovery = self->_discovery;
  self->_discovery = 0;
}

- (id)availablePeopleChangedHandler
{
  return self->_availablePeopleChangedHandler;
}

- (id)discoverySessionChangedHandler
{
  return self->_discoverySessionChangedHandler;
}

- (id)personDeclinedHandler
{
  return self->_personDeclinedHandler;
}

- (id)dedicatedDeviceChangedHandler
{
  return self->_dedicatedDeviceChangedHandler;
}

- (RPRemoteDisplayDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (NSMutableDictionary)discoveredDevicesMap
{
  return self->_discoveredDevicesMap;
}

- (void)setDiscoveredDevicesMap:(id)a3
{
}

- (NSArray)previousAvailablePeople
{
  return self->_previousAvailablePeople;
}

- (void)setPreviousAvailablePeople:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAvailablePeople, 0);
  objc_storeStrong((id *)&self->_discoveredDevicesMap, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong(&self->_dedicatedDeviceChangedHandler, 0);
  objc_storeStrong(&self->_personDeclinedHandler, 0);
  objc_storeStrong(&self->_discoverySessionChangedHandler, 0);
  objc_storeStrong(&self->_availablePeopleChangedHandler, 0);
}

@end
@interface CAMPeopleProximityRapportScanner
- (BOOL)_queue_shouldAdvertisePerson:(id)a3;
- (BOOL)isScanning;
- (CAMPeopleProximityRapportScanner)initWithQueue:(id)a3 delegate:(id)a4;
- (CAMPeopleProximityScannerDelegate)delegate;
- (NSMutableDictionary)_queue_discoveredIdentities;
- (NSMutableDictionary)_queue_discoveredPersons;
- (OS_dispatch_queue)queue;
- (RPPeopleDiscovery)_queue_peopleDiscovery;
- (unsigned)_queue_peopleDiscoverySessionID;
- (void)_queue_discoveryActivatedWithError:(id)a3 timeout:(double)a4 peopleDiscoverySessionID:(unsigned int)a5;
- (void)_queue_discoveryInterruptedWithPeopleDiscoverySessionID:(unsigned int)a3;
- (void)_queue_discoveryInvalidatedWithPeopleDiscoverySessionID:(unsigned int)a3;
- (void)_queue_discoveryPersonChanged:(id)a3 withChangeFlags:(unsigned int)a4 peopleDiscoverySessionID:(unsigned int)a5;
- (void)_queue_discoveryPersonFound:(id)a3 peopleDiscoverySessionID:(unsigned int)a4;
- (void)_queue_discoveryPersonLost:(id)a3 peopleDiscoverySessionID:(unsigned int)a4;
- (void)_queue_discoveryTimeoutForSessionID:(unsigned int)a3;
- (void)dealloc;
- (void)set_queue_discoveredIdentities:(id)a3;
- (void)set_queue_discoveredPersons:(id)a3;
- (void)set_queue_peopleDiscovery:(id)a3;
- (void)set_queue_peopleDiscoverySessionID:(unsigned int)a3;
- (void)startDiscoveryWithScanRate:(unint64_t)a3 timeout:(double)a4;
- (void)stopDiscovery;
@end

@implementation CAMPeopleProximityRapportScanner

- (CAMPeopleProximityRapportScanner)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMPeopleProximityRapportScanner;
  v9 = [(CAMPeopleProximityRapportScanner *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->__queue_peopleDiscoverySessionID = 1;
  }

  return v10;
}

- (void)dealloc
{
  v3 = self->__queue_peopleDiscovery;
  if (v3)
  {
    ++self->__queue_peopleDiscoverySessionID;
    queue_peopleDiscovery = self->__queue_peopleDiscovery;
    self->__queue_peopleDiscovery = 0;

    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__CAMPeopleProximityRapportScanner_dealloc__block_invoke;
    block[3] = &unk_263FA0208;
    id v8 = v3;
    dispatch_async(queue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMPeopleProximityRapportScanner;
  [(CAMPeopleProximityRapportScanner *)&v6 dealloc];
}

uint64_t __43__CAMPeopleProximityRapportScanner_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)isScanning
{
  return self->__queue_peopleDiscovery != 0;
}

- (void)startDiscoveryWithScanRate:(unint64_t)a3 timeout:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->__queue_peopleDiscovery)
  {
    unsigned int queue_peopleDiscoverySessionID = self->__queue_peopleDiscoverySessionID;
    CAMSignpostWithIDAndArgs(78, 0xEEEEB0B5B2B2EEEELL, queue_peopleDiscoverySessionID, 0, 0, 0);
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    queue_discoveredPersons = self->__queue_discoveredPersons;
    self->__queue_discoveredPersons = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    queue_discoveredIdentities = self->__queue_discoveredIdentities;
    self->__queue_discoveredIdentities = v9;

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2050000000;
    v11 = (void *)getRPPeopleDiscoveryClass_softClass;
    uint64_t v38 = getRPPeopleDiscoveryClass_softClass;
    if (!getRPPeopleDiscoveryClass_softClass)
    {
      location[0] = (id)MEMORY[0x263EF8330];
      location[1] = (id)3221225472;
      location[2] = __getRPPeopleDiscoveryClass_block_invoke;
      location[3] = &unk_263FA0AB0;
      location[4] = &v35;
      __getRPPeopleDiscoveryClass_block_invoke((uint64_t)location);
      v11 = (void *)v36[3];
    }
    objc_super v12 = v11;
    _Block_object_dispose(&v35, 8);
    v13 = (RPPeopleDiscovery *)objc_alloc_init(v12);
    queue_peopleDiscovery = self->__queue_peopleDiscovery;
    self->__queue_peopleDiscovery = v13;

    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setDispatchQueue:self->_queue];
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setDiscoveryMode:400];
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setDiscoveryFlags:24];
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setChangeFlags:6];
    objc_initWeak(location, self);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke;
    v31[3] = &unk_263FA0FC8;
    objc_copyWeak(&v32, location);
    unsigned int v33 = queue_peopleDiscoverySessionID;
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setPersonFoundHandler:v31];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_2;
    v28[3] = &unk_263FA0FC8;
    objc_copyWeak(&v29, location);
    unsigned int v30 = queue_peopleDiscoverySessionID;
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setPersonLostHandler:v28];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_3;
    v25[3] = &unk_263FA0FF0;
    objc_copyWeak(&v26, location);
    unsigned int v27 = queue_peopleDiscoverySessionID;
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setPersonChangedHandler:v25];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_4;
    v22[3] = &unk_263FA1018;
    objc_copyWeak(&v23, location);
    unsigned int v24 = queue_peopleDiscoverySessionID;
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setInvalidationHandler:v22];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_5;
    v19[3] = &unk_263FA1018;
    objc_copyWeak(&v20, location);
    unsigned int v21 = queue_peopleDiscoverySessionID;
    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery setInterruptionHandler:v19];
    v15 = self->__queue_peopleDiscovery;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_6;
    v16[3] = &unk_263FA1040;
    objc_copyWeak(v17, location);
    v17[1] = *(id *)&a4;
    unsigned int v18 = queue_peopleDiscoverySessionID;
    [(RPPeopleDiscovery *)v15 activateWithCompletion:v16];
    objc_destroyWeak(v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryPersonFound:peopleDiscoverySessionID:", v4, *(unsigned int *)(a1 + 40));
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryPersonLost:peopleDiscoverySessionID:", v4, *(unsigned int *)(a1 + 40));
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = (id *)(a1 + 32);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_queue_discoveryPersonChanged:withChangeFlags:peopleDiscoverySessionID:", v6, a3, *(unsigned int *)(a1 + 40));
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryInvalidatedWithPeopleDiscoverySessionID:", *(unsigned int *)(a1 + 40));
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryInterruptedWithPeopleDiscoverySessionID:", *(unsigned int *)(a1 + 40));
}

void __71__CAMPeopleProximityRapportScanner_startDiscoveryWithScanRate_timeout___block_invoke_6(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_queue_discoveryActivatedWithError:timeout:peopleDiscoverySessionID:", v4, *(unsigned int *)(a1 + 48), *(double *)(a1 + 40));
}

- (void)stopDiscovery
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscovery)
  {
    v3 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int queue_peopleDiscoverySessionID = self->__queue_peopleDiscoverySessionID;
      v9[0] = 67109120;
      v9[1] = queue_peopleDiscoverySessionID;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] discovery stop ID %u", (uint8_t *)v9, 8u);
    }

    [(RPPeopleDiscovery *)self->__queue_peopleDiscovery invalidate];
    queue_peopleDiscovery = self->__queue_peopleDiscovery;
    self->__queue_peopleDiscovery = 0;

    queue_discoveredPersons = self->__queue_discoveredPersons;
    self->__queue_discoveredPersons = 0;

    queue_discoveredIdentities = self->__queue_discoveredIdentities;
    self->__queue_discoveredIdentities = 0;

    ++self->__queue_peopleDiscoverySessionID;
    id v8 = [(CAMPeopleProximityRapportScanner *)self delegate];
    [v8 peopleProximityScannerDidStopDiscovery:self];
  }
}

- (void)_queue_discoveryActivatedWithError:(id)a3 timeout:(double)a4 peopleDiscoverySessionID:(unsigned int)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a5)
  {
    v9 = os_log_create("com.apple.camera", "SharedLibrary");
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CAMPeopleProximityRapportScanner _queue_discoveryActivatedWithError:timeout:peopleDiscoverySessionID:]((uint64_t)v8, v10);
      }

      [(CAMPeopleProximityRapportScanner *)self stopDiscovery];
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = a5;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] People discovery activated ID %u", (uint8_t *)&buf, 8u);
      }

      objc_initWeak(&buf, self);
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      objc_super v12 = [(CAMPeopleProximityRapportScanner *)self queue];
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __104__CAMPeopleProximityRapportScanner__queue_discoveryActivatedWithError_timeout_peopleDiscoverySessionID___block_invoke;
      v16 = &unk_263FA1018;
      objc_copyWeak(&v17, &buf);
      unsigned int v18 = a5;
      dispatch_after(v11, v12, &v13);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&buf);
    }
    CAMSignpostWithIDAndArgs(79, 0xEEEEB0B5B2B2EEEELL, a5, objc_msgSend(v8, "code", v13, v14, v15, v16), 0, 0);
  }
}

void __104__CAMPeopleProximityRapportScanner__queue_discoveryActivatedWithError_timeout_peopleDiscoverySessionID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_discoveryTimeoutForSessionID:", *(unsigned int *)(a1 + 40));
}

- (void)_queue_discoveryInvalidatedWithPeopleDiscoverySessionID:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] People discovery invalidated ID %u", (uint8_t *)v6, 8u);
    }

    [(CAMPeopleProximityRapportScanner *)self stopDiscovery];
  }
}

- (void)_queue_discoveryInterruptedWithPeopleDiscoverySessionID:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] People discovery interrupted ID %u", (uint8_t *)v6, 8u);
    }

    [(CAMPeopleProximityRapportScanner *)self stopDiscovery];
  }
}

- (void)_queue_discoveryPersonFound:(id)a3 peopleDiscoverySessionID:(unsigned int)a4
{
  id v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a4)
  {
    id v6 = +[CAMLibrarySelectionIdentity identityWithPerson:v15];
    uint64_t v7 = [(CAMPeopleProximityRapportScanner *)self delegate];
    int v8 = [v7 peopleProximityScanner:self shouldDiscoverIdentity:v6];

    if (v8
      && [(CAMPeopleProximityRapportScanner *)self _queue_shouldAdvertisePerson:v15])
    {
      v9 = [v15 identifier];
      [(NSMutableDictionary *)self->__queue_discoveredPersons setObject:v15 forKeyedSubscript:v9];
      [(NSMutableDictionary *)self->__queue_discoveredIdentities setObject:v6 forKeyedSubscript:v9];
      int v10 = [v15 proximity];
      uint64_t v11 = 20;
      uint64_t v12 = 10;
      if (v10 != 10) {
        uint64_t v12 = 0;
      }
      if (v10 != 20) {
        uint64_t v11 = v12;
      }
      if (v10 == 30) {
        uint64_t v13 = 30;
      }
      else {
        uint64_t v13 = v11;
      }
      uint64_t v14 = [(CAMPeopleProximityRapportScanner *)self delegate];
      [v14 peopleProximityScanner:self didDiscoverIdentity:v6 distance:v13 rssi:0];
    }
  }
}

- (void)_queue_discoveryPersonChanged:(id)a3 withChangeFlags:(unsigned int)a4 peopleDiscoverySessionID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  char v6 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == v5)
  {
    v9 = [v8 identifier];
    int v10 = [(NSMutableDictionary *)self->__queue_discoveredPersons objectForKeyedSubscript:v9];
    if (v10)
    {
      uint64_t v11 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CAMPeopleProximityRapportScanner _queue_discoveryPersonChanged:withChangeFlags:peopleDiscoverySessionID:]((uint64_t)v8, v6, v11);
      }

      [(NSMutableDictionary *)self->__queue_discoveredPersons setObject:v8 forKeyedSubscript:v9];
      int v12 = [v8 proximity];
      switch(v12)
      {
        case 30:
          uint64_t v13 = 30;
          break;
        case 20:
          uint64_t v13 = 20;
          break;
        case 10:
          uint64_t v13 = 10;
          break;
        default:
          uint64_t v13 = 0;
          break;
      }
      int v14 = [v10 proximity];
      switch(v14)
      {
        case 30:
          uint64_t v15 = 30;
          break;
        case 20:
          uint64_t v15 = 20;
          break;
        case 10:
          uint64_t v15 = 10;
          break;
        default:
          uint64_t v15 = 0;
          break;
      }
      if (v13 != v15)
      {
        v16 = [(NSMutableDictionary *)self->__queue_discoveredIdentities objectForKeyedSubscript:v9];
        id v17 = [(CAMPeopleProximityRapportScanner *)self delegate];
        [v17 peopleProximityScanner:self didDiscoverIdentity:v16 distance:v13 rssi:0];
      }
    }
    else
    {
      [(CAMPeopleProximityRapportScanner *)self _queue_discoveryPersonFound:v8 peopleDiscoverySessionID:v5];
    }
  }
}

- (void)_queue_discoveryPersonLost:(id)a3 peopleDiscoverySessionID:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a4)
  {
    uint64_t v7 = [v6 identifier];
    id v8 = [(NSMutableDictionary *)self->__queue_discoveredPersons objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138477827;
        id v13 = v6;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] Lost %{private}@", (uint8_t *)&v12, 0xCu);
      }

      int v10 = [(NSMutableDictionary *)self->__queue_discoveredIdentities objectForKeyedSubscript:v7];
      if (v10)
      {
        uint64_t v11 = [(CAMPeopleProximityRapportScanner *)self delegate];
        [v11 peopleProximityScanner:self didLoseIdentity:v10];
      }
      [(NSMutableDictionary *)self->__queue_discoveredPersons removeObjectForKey:v7];
      [(NSMutableDictionary *)self->__queue_discoveredIdentities removeObjectForKey:v7];
    }
  }
}

- (BOOL)_queue_shouldAdvertisePerson:(id)a3
{
  return 1;
}

- (void)_queue_discoveryTimeoutForSessionID:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->__queue_peopleDiscoverySessionID == a3)
  {
    uint64_t v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityRapportScanner] Discovery timeout sessionID:%u", (uint8_t *)v6, 8u);
    }

    [(CAMPeopleProximityRapportScanner *)self stopDiscovery];
  }
}

- (CAMPeopleProximityScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPeopleProximityScannerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RPPeopleDiscovery)_queue_peopleDiscovery
{
  return self->__queue_peopleDiscovery;
}

- (void)set_queue_peopleDiscovery:(id)a3
{
}

- (NSMutableDictionary)_queue_discoveredPersons
{
  return self->__queue_discoveredPersons;
}

- (void)set_queue_discoveredPersons:(id)a3
{
}

- (NSMutableDictionary)_queue_discoveredIdentities
{
  return self->__queue_discoveredIdentities;
}

- (void)set_queue_discoveredIdentities:(id)a3
{
}

- (unsigned)_queue_peopleDiscoverySessionID
{
  return self->__queue_peopleDiscoverySessionID;
}

- (void)set_queue_peopleDiscoverySessionID:(unsigned int)a3
{
  self->__unsigned int queue_peopleDiscoverySessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__queue_discoveredIdentities, 0);
  objc_storeStrong((id *)&self->__queue_discoveredPersons, 0);
  objc_storeStrong((id *)&self->__queue_peopleDiscovery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_queue_discoveryActivatedWithError:(uint64_t)a1 timeout:(NSObject *)a2 peopleDiscoverySessionID:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "[CAMPeopleProximityRapportScanner] People discovery start failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_discoveryPersonChanged:(uint64_t)a1 withChangeFlags:(char)a2 peopleDiscoverySessionID:(NSObject *)a3 .cold.1(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = v6;
  if (a2)
  {
    [v6 addObject:@"Attributes"];
    if ((a2 & 2) == 0)
    {
LABEL_3:
      if ((a2 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v7 addObject:@"Proximity"];
      if ((a2 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v7 addObject:@"Devices"];
  if ((a2 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((a2 & 8) != 0) {
LABEL_5:
  }
    [v7 addObject:@"Relative Location"];
LABEL_6:
  id v8 = [v7 componentsJoinedByString:@", "];

  int v9 = 138478083;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  int v12 = v8;
  _os_log_debug_impl(&dword_2099F8000, a3, OS_LOG_TYPE_DEBUG, "[CAMPeopleProximityRapportScanner] Getting person changes for %{private}@: %{public}@", (uint8_t *)&v9, 0x16u);
}

@end
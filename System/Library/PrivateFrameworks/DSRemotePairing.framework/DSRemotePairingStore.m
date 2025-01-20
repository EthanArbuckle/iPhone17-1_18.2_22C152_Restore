@interface DSRemotePairingStore
- (BOOL)isWifiSyncEnabled;
- (DSRemotePairingStore)init;
- (DSRemotePairingWrapper)remotePairingSwift;
- (OS_dispatch_queue)workQueue;
- (void)fetchPairedDevicesOnQueue:(id)a3 completion:(id)a4;
- (void)setRemotePairingSwift:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation DSRemotePairingStore

- (DSRemotePairingStore)init
{
  if (self)
  {
    dispatch_queue_t v3 = dispatch_queue_create("RemotePairingStoreQueue", 0);
    [(DSRemotePairingStore *)self setWorkQueue:v3];

    v4 = objc_alloc_init(DSRemotePairingWrapper);
    [(DSRemotePairingStore *)self setRemotePairingSwift:v4];
  }
  return self;
}

- (BOOL)isWifiSyncEnabled
{
  return MEMORY[0x270F99B88](self, a2);
}

- (void)fetchPairedDevicesOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DSRemotePairingStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke;
  block[3] = &unk_2652EC800;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3032000000;
  v67[3] = __Block_byref_object_copy_;
  v67[4] = __Block_byref_object_dispose_;
  id v68 = 0;
  dispatch_queue_t v3 = [*(id *)(a1 + 32) remotePairingSwift];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2;
  v66[3] = &unk_2652EC768;
  v66[4] = v67;
  v4 = [v3 getPairedDevicesWithCompletion:v66];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v9 = [v2 indexOfObject:v8];
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v2 addObject:v8];
        }
        else
        {
          v1 = [v2 objectAtIndexedSubscript:v9];
          id v10 = [v1 datePaired];
          v11 = [v8 datePaired];
          id v12 = [v10 earlierDate:v11];
          [v1 setDatePaired:v12];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v5);
  }

  v51 = (void *)lockdown_copy_paired_host_info();
  if (v51)
  {
    [v51 allKeys];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v47 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v47 countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (!v13) {
      goto LABEL_41;
    }
    uint64_t v50 = *(void *)v59;
    while (1)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v59 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * j);
        v16 = [v51 objectForKey:v15];
        v17 = [DSPairedComputer alloc];
        v18 = [v16 objectForKey:@"HostName"];
        v19 = [(DSPairedComputer *)v17 initWithDeviceName:v18];

        [(DSPairedComputer *)v19 setLockdownFrameworkKey:v15];
        v20 = [v16 objectForKey:@"SystemBUID"];
        [(DSPairedComputer *)v19 setLockdownFrameworkIdentifier:v20];

        v21 = [v16 objectForKey:@"SerialNumber"];

        if (v21)
        {
          v22 = [v16 objectForKey:@"SerialNumber"];
          if ([v22 length]) {
            [(DSPairedComputer *)v19 setSerialNumber:v22];
          }
        }
        v23 = [v16 objectForKey:@"MarketingName"];

        if (v23)
        {
          v24 = [v16 objectForKey:@"MarketingName"];
          [(DSPairedComputer *)v19 setMarketingName:v24];
        }
        v25 = [v16 objectForKey:@"WallTimeWhenCreated"];

        if (v25)
        {
          v26 = [v16 objectForKey:@"WallTimeWhenCreated"];
          unint64_t v27 = [v26 unsignedLongLongValue];

          v28 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v27];
          [(DSPairedComputer *)v19 setDatePaired:v28];
        }
        uint64_t v29 = [v2 indexOfObject:v19];
        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = [(DSPairedComputer *)v19 serialNumber];
          BOOL v31 = v30 == 0;

          if (!v31) {
            goto LABEL_29;
          }
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2;
          v56[3] = &unk_2652EC790;
          v32 = v19;
          v57 = v32;
          uint64_t v29 = [v2 indexOfObjectPassingTest:v56];
          if (v29 == 0x7FFFFFFFFFFFFFFFLL)
          {

LABEL_29:
            [v2 addObject:v19];
            goto LABEL_39;
          }
          v33 = [v2 objectAtIndexedSubscript:v29];
          NSLog(&cfstr_UsingSoftMatch.isa, v33, v32);
        }
        v34 = [v2 objectAtIndexedSubscript:v29];
        v35 = [v34 datePaired];
        v36 = [(DSPairedComputer *)v19 datePaired];
        v37 = [v35 earlierDate:v36];
        [v34 setDatePaired:v37];

        v38 = [(DSPairedComputer *)v19 marketingName];
        if (v38)
        {
          uint64_t v39 = [(DSPairedComputer *)v19 marketingName];
          v1 = (void *)v39;
        }
        else
        {
          uint64_t v39 = [v34 marketingName];
          v48 = (void *)v39;
        }
        [v34 setMarketingName:v39];
        v40 = v48;
        if (v38) {
          v40 = v1;
        }

        v41 = [v34 lockdownFrameworkIdentifier];

        if (v41) {
          NSLog(&cfstr_ErrorOverwriti.isa);
        }
        v42 = [(DSPairedComputer *)v19 lockdownFrameworkIdentifier];
        [v34 setLockdownFrameworkIdentifier:v42];

        v43 = [(DSPairedComputer *)v19 lockdownFrameworkKey];
        [v34 setLockdownFrameworkKey:v43];

LABEL_39:
      }
      uint64_t v13 = [v47 countByEnumeratingWithState:&v58 objects:v69 count:16];
      if (!v13)
      {
LABEL_41:

        break;
      }
    }
  }
  [v2 sortUsingComparator:&__block_literal_global];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_4;
  block[3] = &unk_2652EC7D8;
  v44 = *(NSObject **)(a1 + 40);
  id v54 = *(id *)(a1 + 48);
  v55 = v67;
  id v53 = v2;
  id v45 = v2;
  dispatch_async(v44, block);

  _Block_object_dispose(v67, 8);
}

void __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

BOOL __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) deviceName];
  id v5 = [v3 deviceName];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [v3 lockdownFrameworkIdentifier];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 datePaired];
  uint64_t v6 = [v4 datePaired];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (DSRemotePairingWrapper)remotePairingSwift
{
  return self->_remotePairingSwift;
}

- (void)setRemotePairingSwift:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remotePairingSwift, 0);
}

@end
@interface AppleFirmwareUpdateController
- (AppleFirmwareUpdateController)initWithRegistryEntryID:(id)a3 fwAssetDirectory:(id)a4;
- (BOOL)createFWAssetInfo;
- (BOOL)createFWAssetInfoInternal;
- (BOOL)getEarlyBootList:(id)a3;
- (BOOL)getEarlyBootListInternal:(id)a3;
- (BOOL)isFWDownloadNeeded:(id)a3;
- (BOOL)registerForPendingEarlyBootAccessories;
- (BOOL)registerForPendingEarlyBootAccessoriesInternal;
- (BOOL)shouldSkipImage4Download;
- (NSArray)fdrClasses;
- (NSNumber)fwAssetSize;
- (NSNumber)fwAssetVersion;
- (NSNumber)img4Tag;
- (NSString)fwAssetFile;
- (NSString)fwAssetSignatureType;
- (id)extractFDRDataWithClassKey:(id)a3 error:(id *)a4;
- (id)findFWAssetFromTag:(id)a3 tag:(unsigned int)a4 size:(unint64_t *)a5;
- (id)getPendingEarlyBootAccessories;
- (id)updateFirmwareWithOptions:(id)a3;
- (id)updateFirmwareWithOptionsInternal:(id)a3;
- (int64_t)sendFDRData:(unsigned int)a3;
- (unsigned)getConnectionForRegistryID:(int64_t *)a3;
- (unsigned)getServiceForRegistryID:(int64_t *)a3;
- (void)dealloc;
- (void)earlyBootAccessoryAttached:(unsigned int)a3;
- (void)earlyBootAccessoryAttachedInternal:(unsigned int)a3;
- (void)enableEarlyBootLoggingMode;
- (void)readCriticalEarlyBootEntries;
- (void)setDelegate:(id)a3;
- (void)setFdrClasses:(id)a3;
- (void)setFwAssetFile:(id)a3;
- (void)setFwAssetSignatureType:(id)a3;
- (void)setFwAssetSize:(id)a3;
- (void)setFwAssetVersion:(id)a3;
- (void)setImg4Tag:(id)a3;
- (void)sortEarlyBootListWithLoadingGroup:(id)a3;
@end

@implementation AppleFirmwareUpdateController

- (AppleFirmwareUpdateController)initWithRegistryEntryID:(id)a3 fwAssetDirectory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AppleFirmwareUpdateController;
  v9 = [(AppleFirmwareUpdateController *)&v19 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.accessoryfirmwareupdate", "default");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingCriticalEarlyBootEntriesInternal = v9->_pendingCriticalEarlyBootEntriesInternal;
    v9->_pendingCriticalEarlyBootEntriesInternal = v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.appleFirmwareUpdate.delegateQueue", 0);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.appleFirmwareUpdate.workQueue", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_registryEntryID, a3);
    objc_storeStrong((id *)&v9->_fwAssetDirectory, a4);
  }

  return v9;
}

- (void)dealloc
{
  iokitNotifyPort = self->_iokitNotifyPort;
  if (iokitNotifyPort)
  {
    IONotificationPortDestroy(iokitNotifyPort);
    self->_iokitNotifyPort = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AppleFirmwareUpdateController;
  [(AppleFirmwareUpdateController *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__AppleFirmwareUpdateController_setDelegate___block_invoke;
  v7[3] = &unk_2646EDA38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(workQueue, v7);
}

id __45__AppleFirmwareUpdateController_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)enableEarlyBootLoggingMode
{
}

- (BOOL)getEarlyBootList:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AppleFirmwareUpdateController_getEarlyBootList___block_invoke;
  block[3] = &unk_2646EDA60;
  id v9 = v4;
  os_log_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  LOBYTE(workQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)workQueue;
}

void __50__AppleFirmwareUpdateController_getEarlyBootList___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) getEarlyBootListInternal:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) sortEarlyBootListWithLoadingGroup:*(void *)(a1 + 40)];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 136315394;
    v5 = "-[AppleFirmwareUpdateController getEarlyBootList:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_224B2D000, v2, OS_LOG_TYPE_INFO, "%s: Ealyboot List: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sortEarlyBootListWithLoadingGroup:(id)a3
{
}

uint64_t __67__AppleFirmwareUpdateController_sortEarlyBootListWithLoadingGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 objectForKeyedSubscript:@"LoadingGroup"],
        __int16 v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"LoadingGroup"];
  }
  else
  {
    uint64_t v8 = &unk_26D7D76A0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 objectForKeyedSubscript:@"LoadingGroup"],
        id v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v10 = objc_opt_isKindOfClass(),
        v9,
        (v10 & 1) != 0))
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"LoadingGroup"];
  }
  else
  {
    uint64_t v11 = &unk_26D7D76A0;
  }
  uint64_t v12 = [v11 compare:v8];

  return v12;
}

- (BOOL)getEarlyBootListInternal:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v27 = a3;
  io_iterator_t existing = 0;
  FudLogSetMode(1);
  [(AppleFirmwareUpdateController *)self readCriticalEarlyBootEntries];
  CFDictionaryRef v4 = IOServiceMatching("AppleFirmwareUpdateKext");
  if (v4 && !IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], v4, &existing))
  {
    uint64_t v5 = 0;
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      io_registry_entry_t v7 = IOIteratorNext(existing);
      if (!v7)
      {
LABEL_23:
        if (v5) {
          goto LABEL_24;
        }
        goto LABEL_27;
      }
      io_registry_entry_t v14 = v7;
      uint64_t entryID = 0;
      if (IORegistryEntryGetRegistryEntryID(v7, &entryID)) {
        break;
      }
      v15 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
      if (!v15)
      {
        dispatch_queue_t v16 = 0;
LABEL_22:
        char v23 = 0;
        uint64_t v5 = 14;
        goto LABEL_18;
      }
      dispatch_queue_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
      if (!v16) {
        goto LABEL_22;
      }
      [v15 setObject:@"com.apple.mau.plugin.generickext" forKeyedSubscript:@"DeviceClassName"];
      v17 = [NSNumber numberWithUnsignedLongLong:entryID];
      [v16 setObject:v17 forKeyedSubscript:@"IOMatchLaunchServiceID"];

      [v15 setObject:v16 forKey:@"OptionsDict"];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v14, @"Image Tag", v6, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(NSMutableArray *)self->_pendingCriticalEarlyBootEntriesInternal removeObject:CFProperty];
      }
      objc_super v19 = (void *)IORegistryEntryCreateCFProperty(v14, @"LoadingGroup", v6, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = v15;
        v21 = v19;
      }
      else
      {
        v20 = v15;
        v21 = &unk_26D7D76A0;
      }
      [v20 setObject:v21 forKeyedSubscript:@"LoadingGroup"];
      [v27 addObject:v15];
      if (v5 == 1) {
        goto LABEL_14;
      }
LABEL_17:
      IOObjectRelease(v14);

      char v23 = 1;
LABEL_18:

      if ((v23 & 1) == 0) {
        goto LABEL_23;
      }
    }
    objc_super v19 = 0;
    CFProperty = 0;
    v15 = 0;
    dispatch_queue_t v16 = 0;
LABEL_14:
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[AppleFirmwareUpdateController getEarlyBootListInternal:]";
      __int16 v32 = 1024;
      LODWORD(v33) = v14;
      _os_log_impl(&dword_224B2D000, log, OS_LOG_TYPE_INFO, "%s: registry entry not found for service=%d", buf, 0x12u);
    }
    uint64_t v5 = 1;
    goto LABEL_17;
  }
  uint64_t v5 = 13;
LABEL_24:
  v24 = self->_log;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = errorString[v5];
    *(_DWORD *)buf = 136315650;
    v31 = "-[AppleFirmwareUpdateController getEarlyBootListInternal:]";
    __int16 v32 = 2112;
    v33 = v25;
    __int16 v34 = 2048;
    uint64_t v35 = v5;
    _os_log_impl(&dword_224B2D000, v24, OS_LOG_TYPE_INFO, "%s: Error:%@ code=0x%0lx", buf, 0x20u);
  }
  [v27 removeAllObjects];
LABEL_27:
  FudLog(7, @"%s: Pending critical earlyBoot entries %@", v8, v9, v10, v11, v12, v13, (uint64_t)"-[AppleFirmwareUpdateController getEarlyBootListInternal:]");

  return 0;
}

- (BOOL)registerForPendingEarlyBootAccessories
{
  uint64_t v6 = 0;
  io_registry_entry_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__AppleFirmwareUpdateController_registerForPendingEarlyBootAccessories__block_invoke;
  v5[3] = &unk_2646EDAA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__AppleFirmwareUpdateController_registerForPendingEarlyBootAccessories__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) registerForPendingEarlyBootAccessoriesInternal];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)registerForPendingEarlyBootAccessoriesInternal
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_pendingCriticalEarlyBootEntriesInternal count];
  if (v3)
  {
    uint64_t v20 = v3;
    if (!self->_iokitNotifyPort) {
      self->_iokitNotifyPort = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
    }
    io_iterator_t notification = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_pendingCriticalEarlyBootEntriesInternal;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          CFMutableDictionaryRef v9 = IOServiceMatching("AppleFirmwareUpdateKext");
          id v27 = @"Image Tag";
          uint64_t v28 = v8;
          uint64_t v10 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          [(__CFDictionary *)v9 setObject:v10 forKey:@"IOPropertyMatch"];

          iokitNotifyPort = self->_iokitNotifyPort;
          CFDictionaryRef v12 = v9;
          if (IOServiceAddMatchingNotification(iokitNotifyPort, "IOServiceMatched", v12, (IOServiceMatchingCallback)serviceRegistered, self, &notification))
          {
            FudLog(7, @"%s: Failed to registered for tag %@", v13, v14, v15, v16, v17, v18, (uint64_t)"-[AppleFirmwareUpdateController registerForPendingEarlyBootAccessoriesInternal]");
          }
          else
          {
            FudLog(7, @"%s: Registered for tag %@", v13, v14, v15, v16, v17, v18, (uint64_t)"-[AppleFirmwareUpdateController registerForPendingEarlyBootAccessoriesInternal]");
            if (notification)
            {
              -[AppleFirmwareUpdateController earlyBootAccessoryAttachedInternal:](self, "earlyBootAccessoryAttachedInternal:");
              IOObjectRelease(notification);
            }
          }
        }
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v5);
    }

    uint64_t v3 = v20;
  }
  return v3 != 0;
}

- (void)earlyBootAccessoryAttached:(unsigned int)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__AppleFirmwareUpdateController_earlyBootAccessoryAttached___block_invoke;
  v4[3] = &unk_2646EDAD0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(workQueue, v4);
}

uint64_t __60__AppleFirmwareUpdateController_earlyBootAccessoryAttached___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) earlyBootAccessoryAttachedInternal:*(unsigned int *)(a1 + 40)];
}

- (void)earlyBootAccessoryAttachedInternal:(unsigned int)a3
{
  FudLog(7, @"%s: %u", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)"-[AppleFirmwareUpdateController earlyBootAccessoryAttachedInternal:]");
  io_object_t v10 = IOIteratorNext(a3);
  if (v10)
  {
    io_object_t v11 = v10;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      uint64_t entryID = 0;
      if (IORegistryEntryGetRegistryEntryID(v11, &entryID))
      {
        IOObjectRelease(v11);
      }
      else
      {
        uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
        [v13 setObject:@"com.apple.mau.plugin.generickext" forKey:@"DeviceClassName"];
        uint64_t v15 = [NSNumber numberWithUnsignedLongLong:entryID];
        [v14 setObject:v15 forKey:@"IOMatchLaunchServiceID"];

        [v13 setObject:v14 forKey:@"OptionsDict"];
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v11, @"Image Tag", v12, 0);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(NSMutableArray *)self->_pendingCriticalEarlyBootEntriesInternal removeObject:CFProperty];
        }
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __68__AppleFirmwareUpdateController_earlyBootAccessoryAttachedInternal___block_invoke;
        block[3] = &unk_2646EDA38;
        block[4] = self;
        id v20 = v13;
        id v18 = v13;
        dispatch_async(delegateQueue, block);
        IOObjectRelease(v11);
      }
      io_object_t v11 = IOIteratorNext(a3);
    }
    while (v11);
  }
  if (![(NSMutableArray *)self->_pendingCriticalEarlyBootEntriesInternal count])
  {
    IONotificationPortDestroy(self->_iokitNotifyPort);
    self->_iokitNotifyPort = 0;
  }
}

void __68__AppleFirmwareUpdateController_earlyBootAccessoryAttachedInternal___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained earlyBootAccessoryAttached:*(void *)(a1 + 40)];
}

- (void)readCriticalEarlyBootEntries
{
  io_iterator_t iterator = 0;
  if (!IORegistryCreateIterator(0, "IODeviceTree", 1u, &iterator))
  {
    io_object_t v3 = IOIteratorNext(iterator);
    if (v3)
    {
      io_registry_entry_t v4 = v3;
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"aud-early-boot-critical", v5, 0);
        if (CFProperty)
        {
          uint64_t v7 = (void *)IORegistryEntryCreateCFProperty(v4, @"image-tag", v5, 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length] == 4)
          {
            unsigned int v16 = 0;
            [v7 getBytes:&v16 length:4];
            FudLog(7, @"%s: Critical earlyBoot entry: imageTag %u", v8, v9, v10, v11, v12, v13, (uint64_t)"-[AppleFirmwareUpdateController readCriticalEarlyBootEntries]");
            pendingCriticalEarlyBootEntriesInternal = self->_pendingCriticalEarlyBootEntriesInternal;
            uint64_t v15 = [NSNumber numberWithUnsignedInt:v16];
            [(NSMutableArray *)pendingCriticalEarlyBootEntriesInternal addObject:v15];
          }
        }
        IOObjectRelease(v4);

        io_registry_entry_t v4 = IOIteratorNext(iterator);
      }
      while (v4);
    }
    IOObjectRelease(iterator);
  }
}

- (id)getPendingEarlyBootAccessories
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__AppleFirmwareUpdateController_getPendingEarlyBootAccessories__block_invoke;
  v5[3] = &unk_2646EDAA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __63__AppleFirmwareUpdateController_getPendingEarlyBootAccessories__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 24)];
  return MEMORY[0x270F9A758]();
}

- (BOOL)createFWAssetInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__AppleFirmwareUpdateController_createFWAssetInfo__block_invoke;
  v5[3] = &unk_2646EDAA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__AppleFirmwareUpdateController_createFWAssetInfo__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) createFWAssetInfoInternal];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)createFWAssetInfoInternal
{
  v2 = self;
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  fwAssetDirectory = self->_fwAssetDirectory;
  if (fwAssetDirectory)
  {
    io_registry_entry_t v4 = fwAssetDirectory;
    id v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F53618] sharedDataAccessor];
    id v58 = 0;
    uint64_t v6 = (void *)[v7 copyPathForPersonalizedData:0 error:&v58];
    id v5 = v58;

    log = v2->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v62 = v6;
      _os_log_impl(&dword_224B2D000, log, OS_LOG_TYPE_DEFAULT, "personalizedDataPath: %@", buf, 0xCu);
    }
    if (!v6)
    {
      CFProperty = 0;
      BOOL v24 = 0;
      io_registry_entry_t v4 = 0;
      goto LABEL_34;
    }
    io_registry_entry_t v4 = [NSString stringWithFormat:@"%@/%@", v6, @"FUD"];
  }
  char v9 = v2->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v62 = v4;
    _os_log_impl(&dword_224B2D000, v9, OS_LOG_TYPE_DEFAULT, "Firmware directory path: %@", buf, 0xCu);
  }
  io_registry_entry_t v10 = [(AppleFirmwareUpdateController *)v2 getServiceForRegistryID:&v60];
  if (!v10)
  {
    CFProperty = 0;
    goto LABEL_41;
  }
  io_registry_entry_t v11 = v10;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v10, @"FDR Classes", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    io_registry_entry_t v49 = v11;
    v51 = v4;
    id v52 = v5;
    v53 = v6;
    v50 = CFProperty;
    [(AppleFirmwareUpdateController *)v2 setFdrClasses:CFProperty];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v14 = v2;
    uint64_t v15 = [(AppleFirmwareUpdateController *)v2 fdrClasses];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v73 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v55 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          long long v22 = v14->_log;
          BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          if ((isKindOfClass & 1) == 0)
          {
            if (v23)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_224B2D000, v22, OS_LOG_TYPE_INFO, "Invalid FDR class in registry entry", buf, 2u);
            }

            BOOL v24 = 0;
            id v5 = v52;
            uint64_t v6 = v53;
            CFProperty = v50;
            io_registry_entry_t v4 = v51;
            goto LABEL_34;
          }
          if (v23)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v62 = v20;
            _os_log_impl(&dword_224B2D000, v22, OS_LOG_TYPE_INFO, "FDR class from registry entry='%@'", buf, 0xCu);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v73 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    id v5 = v52;
    uint64_t v6 = v53;
    CFProperty = v50;
    io_registry_entry_t v4 = v51;
    v2 = v14;
    io_registry_entry_t v11 = v49;
  }
  if ([(AppleFirmwareUpdateController *)v2 shouldSkipImage4Download])
  {
    BOOL v24 = 1;
    goto LABEL_34;
  }
  long long v25 = (void *)IORegistryEntryCreateCFProperty(v11, @"Image Tag", v12, 0);
  [(AppleFirmwareUpdateController *)v2 setImg4Tag:v25];

  v26 = [(AppleFirmwareUpdateController *)v2 img4Tag];

  if (!v26)
  {
LABEL_41:
    BOOL v24 = 0;
    goto LABEL_34;
  }
  id v27 = [(AppleFirmwareUpdateController *)v2 img4Tag];
  uint64_t v28 = [v27 unsignedIntValue];

  if (!v28)
  {
    v45 = v2->_log;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v46 = "Zero tag value in registry entry";
      v47 = v45;
      uint32_t v48 = 2;
LABEL_40:
      _os_log_impl(&dword_224B2D000, v47, OS_LOG_TYPE_INFO, v46, buf, v48);
      goto LABEL_41;
    }
    goto LABEL_41;
  }
  v29 = [(AppleFirmwareUpdateController *)v2 findFWAssetFromTag:v4 tag:v28 size:&v59];
  [(AppleFirmwareUpdateController *)v2 setFwAssetFile:v29];

  uint64_t v30 = [(AppleFirmwareUpdateController *)v2 fwAssetFile];

  v31 = v2->_log;
  if (!v30)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v62 = v28;
      v46 = "FW asset for tag=0x%0x not found";
      v47 = v31;
      uint32_t v48 = 8;
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v32 = v31;
    v33 = [(AppleFirmwareUpdateController *)v2 fwAssetFile];
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v62 = v28;
    *(_WORD *)&v62[4] = 2112;
    *(void *)&v62[6] = v33;
    *(_WORD *)&v62[14] = 2048;
    *(void *)&v62[16] = v59;
    _os_log_impl(&dword_224B2D000, v32, OS_LOG_TYPE_DEFAULT, "Found FW file for tag=0x%0x - %@ [size=%zu]", buf, 0x1Cu);
  }
  __int16 v34 = [NSNumber numberWithUnsignedLongLong:v59];
  [(AppleFirmwareUpdateController *)v2 setFwAssetSize:v34];

  [(AppleFirmwareUpdateController *)v2 setFwAssetSignatureType:@"IMG4"];
  uint64_t v35 = [NSNumber numberWithLongLong:0];
  [(AppleFirmwareUpdateController *)v2 setFwAssetVersion:v35];

  uint64_t v36 = v2->_log;
  BOOL v24 = 1;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    fwAssetSize = v2->_fwAssetSize;
    img4Tag = v2->_img4Tag;
    registryEntryID = v2->_registryEntryID;
    v40 = v2->_fwAssetDirectory;
    fwAssetFile = v2->_fwAssetFile;
    fwAssetSignatureType = v2->_fwAssetSignatureType;
    fwAssetVersion = v2->_fwAssetVersion;
    *(_DWORD *)buf = 136316930;
    *(void *)v62 = "-[AppleFirmwareUpdateController createFWAssetInfoInternal]";
    *(_WORD *)&v62[8] = 2112;
    *(void *)&v62[10] = registryEntryID;
    *(_WORD *)&v62[18] = 2112;
    *(void *)&v62[20] = img4Tag;
    __int16 v63 = 2112;
    v64 = v40;
    __int16 v65 = 2112;
    v66 = fwAssetFile;
    __int16 v67 = 2112;
    v68 = fwAssetSignatureType;
    __int16 v69 = 2112;
    v70 = fwAssetVersion;
    __int16 v71 = 2112;
    v72 = fwAssetSize;
    _os_log_impl(&dword_224B2D000, v36, OS_LOG_TYPE_INFO, "%s:\n registryID=%@\n fwTag=%@ fwDirectory=%@ fwFile=%@\n fwSignType=%@\n fwVersion=%@\n fwSize=%@", buf, 0x52u);
  }
LABEL_34:

  return v24;
}

- (unsigned)getServiceForRegistryID:(int64_t *)a3
{
  kern_return_t v7;
  CFMutableDictionaryRef v8;
  BOOL v9;
  CFMutableDictionaryRef properties;

  properties = 0;
  *a3 = 0;
  CFDictionaryRef v4 = IORegistryEntryIDMatching([(NSNumber *)self->_registryEntryID unsignedLongLongValue]);
  if (v4 && (io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v4)) != 0)
  {
    unsigned int v6 = MatchingService;
    uint64_t v7 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    uint64_t v8 = properties;
    if (v7) {
      char v9 = 1;
    }
    else {
      char v9 = properties == 0;
    }
    if (!v9 || (*a3 = 2, v8)) {
      CFRelease(v8);
    }
  }
  else
  {
    unsigned int v6 = 0;
    *a3 = 2;
  }
  return v6;
}

- (id)updateFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__AppleFirmwareUpdateController_updateFirmwareWithOptions___block_invoke;
  block[3] = &unk_2646EDA60;
  id v10 = v4;
  io_registry_entry_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__AppleFirmwareUpdateController_updateFirmwareWithOptions___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) updateFirmwareWithOptionsInternal:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (id)updateFirmwareWithOptionsInternal:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v37 = 0;
  if (!self->_registryEntryID)
  {
    uint64_t v36 = 1;
    goto LABEL_35;
  }
  if ([(AppleFirmwareUpdateController *)self shouldSkipImage4Download]) {
    goto LABEL_9;
  }
  id v5 = [(AppleFirmwareUpdateController *)self fwAssetFile];

  if (!v5)
  {
    uint64_t v36 = 6;
    goto LABEL_35;
  }
  id v6 = [(AppleFirmwareUpdateController *)self fwAssetVersion];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    uint64_t v36 = 5;
    goto LABEL_35;
  }
  uint64_t v8 = [(AppleFirmwareUpdateController *)self fwAssetSize];
  uint64_t v9 = [v8 unsignedLongLongValue];

  if (!v9)
  {
    uint64_t v36 = 7;
    goto LABEL_35;
  }
  id v10 = [(AppleFirmwareUpdateController *)self fwAssetSignatureType];
  if ([v10 isEqualToString:@"IMG4"])
  {

    goto LABEL_9;
  }
  io_registry_entry_t v11 = [(AppleFirmwareUpdateController *)self fwAssetSignatureType];
  char v12 = [v11 isEqualToString:@"NONE"];

  if ((v12 & 1) == 0)
  {
    uint64_t v36 = 4;
LABEL_35:
    uint64_t v37 = v36;
    goto LABEL_22;
  }
LABEL_9:
  if (![(AppleFirmwareUpdateController *)self isFWDownloadNeeded:self->_registryEntryID])
  {
    uint64_t v36 = 15;
    goto LABEL_35;
  }
  uint64_t v13 = [(AppleFirmwareUpdateController *)self getConnectionForRegistryID:&v37];
  mach_port_t v14 = v13;
  uint64_t v15 = v37;
  if (v13 && !v37)
  {
    uint64_t v37 = [(AppleFirmwareUpdateController *)self sendFDRData:v13];
    if (!v37 && ![(AppleFirmwareUpdateController *)self shouldSkipImage4Download])
    {
      id v16 = [(AppleFirmwareUpdateController *)self fwAssetFile];
      int v17 = open((const char *)[v16 UTF8String], 0, 0);

      if (v17 == -1)
      {
        uint64_t v37 = 8;
      }
      else
      {
        uint64_t v18 = [(AppleFirmwareUpdateController *)self fwAssetSize];
        objc_super v19 = mmap(0, [v18 unsignedLongLongValue], 1, 2, v17, 0);

        if (v19 == (void *)-1)
        {
          uint64_t v37 = 9;
        }
        else
        {
          *(void *)input = v19;
          uint64_t v20 = [(AppleFirmwareUpdateController *)self fwAssetSize];
          *(void *)&input[8] = [v20 unsignedLongLongValue];
          v21 = [(AppleFirmwareUpdateController *)self fwAssetSignatureType];
          *(void *)&input[16] = [v21 isEqualToString:@"NONE"];
          long long v22 = [(AppleFirmwareUpdateController *)self fwAssetVersion];
          uint64_t v39 = [v22 unsignedLongLongValue];

          if (IOConnectCallScalarMethod(v14, 0, (const uint64_t *)input, 4u, 0, 0) == 1) {
            uint64_t v37 = 10;
          }
          BOOL v23 = [(AppleFirmwareUpdateController *)self fwAssetSize];
          munmap(v19, [v23 unsignedLongLongValue]);
        }
        close(v17);
      }
    }
    goto LABEL_20;
  }
  if (v13)
  {
LABEL_20:
    IOServiceClose(v14);
    uint64_t v15 = v37;
  }
  if (!v15)
  {
    v26 = 0;
    goto LABEL_29;
  }
LABEL_22:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    if (v37 > 16) {
      long long v25 = @"Unknown Error";
    }
    else {
      long long v25 = errorString[v37];
    }
    registryEntryID = self->_registryEntryID;
    *(_DWORD *)input = 138412802;
    *(void *)&input[4] = v25;
    *(_WORD *)&input[12] = 2048;
    *(void *)&input[14] = v37;
    *(_WORD *)&input[22] = 2112;
    uint64_t v39 = (uint64_t)registryEntryID;
    _os_log_impl(&dword_224B2D000, log, OS_LOG_TYPE_INFO, "Bootstrap Error:%@ code=0x%0lx registryEntryID=%@", input, 0x20u);
  }
  v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AppleFirmwareUpdate" code:v37 userInfo:0];
LABEL_29:
  uint64_t v28 = self->_log;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = self->_registryEntryID;
    fwAssetSize = self->_fwAssetSize;
    img4Tag = self->_img4Tag;
    fwAssetFile = self->_fwAssetFile;
    fwAssetSignatureType = self->_fwAssetSignatureType;
    fwAssetVersion = self->_fwAssetVersion;
    *(_DWORD *)input = 136317186;
    *(void *)&input[4] = "-[AppleFirmwareUpdateController updateFirmwareWithOptionsInternal:]";
    *(_WORD *)&input[12] = 2112;
    *(void *)&input[14] = v29;
    *(_WORD *)&input[22] = 2112;
    uint64_t v39 = (uint64_t)img4Tag;
    __int16 v40 = 2112;
    v41 = fwAssetFile;
    __int16 v42 = 2112;
    v43 = fwAssetSignatureType;
    __int16 v44 = 2112;
    v45 = fwAssetVersion;
    __int16 v46 = 2112;
    v47 = fwAssetSize;
    __int16 v48 = 2112;
    id v49 = v4;
    __int16 v50 = 2112;
    v51 = v26;
    _os_log_impl(&dword_224B2D000, v28, OS_LOG_TYPE_INFO, "%s:\n registryID=%@\n fwTag=%@ fwFile=%@\n fwSignType=%@\n fwVersion=%@\n fwSize=%@\n options=%@ error=%@", input, 0x5Cu);
  }

  return v26;
}

- (BOOL)isFWDownloadNeeded:(id)a3
{
  uint64_t v10 = 0;
  io_registry_entry_t v4 = [(AppleFirmwareUpdateController *)self getServiceForRegistryID:&v10];
  if (!v4) {
    return 1;
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"Need FUD Download", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v6 = [CFProperty BOOLValue];
  }
  else
  {
    log = self->_log;
    char v6 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_224B2D000, log, OS_LOG_TYPE_INFO, "download needed property not in registry entry", v9, 2u);
    }
  }

  return v6;
}

- (BOOL)shouldSkipImage4Download
{
  uint64_t v9 = 0;
  io_registry_entry_t v2 = [(AppleFirmwareUpdateController *)self getServiceForRegistryID:&v9];
  if (!v2) {
    return 0;
  }
  io_object_t v3 = v2;
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v2, @"skip-image-loading", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFBooleanRef v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v7 = 0;
  }
  IOObjectRelease(v3);
  return v7;
}

- (unsigned)getConnectionForRegistryID:(int64_t *)a3
{
  io_connect_t connect = 0;
  *a3 = 0;
  unsigned int result = -[AppleFirmwareUpdateController getServiceForRegistryID:](self, "getServiceForRegistryID:");
  if (result)
  {
    io_object_t v5 = result;
    if (IOServiceOpen(result, *MEMORY[0x263EF8960], 0, &connect)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = connect == 0;
    }
    if (v6) {
      *a3 = 3;
    }
    IOObjectRelease(v5);
    return connect;
  }
  return result;
}

- (id)findFWAssetFromTag:(id)a3 tag:(unsigned int)a4 size:(unint64_t *)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263F08850] defaultManager];
  id v51 = 0;
  uint64_t v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v51];
  id v9 = v51;
  if (!v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      LOWORD(v53[0]) = 0;
      _os_log_impl(&dword_224B2D000, log, OS_LOG_TYPE_INFO, "No asset files found", (uint8_t *)v53, 2u);
    }
    uint64_t v30 = 0;
    v29 = 0;
    goto LABEL_36;
  }
  __int16 v34 = v8;
  uint64_t v35 = v7;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v8;
  uint64_t v43 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v43)
  {
    v38 = v9;
    id v39 = 0;
    goto LABEL_35;
  }
  v33 = a5;
  id v39 = 0;
  uint64_t v10 = *(void *)v48;
  unint64_t v11 = 0x263F08000uLL;
  v38 = v9;
  uint64_t v40 = *(void *)v48;
  while (2)
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v48 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * v12);
      mach_port_t v14 = (void *)MEMORY[0x22A61E0D0]();
      uint64_t v15 = [v6 stringByAppendingPathComponent:v13];
      id v16 = [*(id *)(v11 + 2112) fileHandleForReadingAtPath:v15];
      id v46 = 0;
      int v17 = [v16 readDataUpToLength:64 error:&v46];
      id v18 = v46;
      [v16 closeFile];
      if (v17 && [v17 length] == 64)
      {
        id v19 = v6;
        *(void *)buf = 0;
        id v20 = v17;
        if (Img4DecodeParseLengthFromBuffer([v20 bytes], objc_msgSend(v20, "length"), buf))
        {
          v21 = self->_log;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v53[0]) = 138543362;
            *(void *)((char *)v53 + 4) = v15;
            _os_log_error_impl(&dword_224B2D000, v21, OS_LOG_TYPE_ERROR, "Failed decoding check for %{public}@", (uint8_t *)v53, 0xCu);
          }
        }
        else
        {
          id v45 = v38;
          BOOL v23 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v15 options:1 error:&v45];
          id v37 = v45;

          if (v23)
          {
            int v17 = v20;
            uint64_t v54 = 0;
            memset(v53, 0, sizeof(v53));
            id v39 = v23;
            Img4DecodeInit([v39 bytes], objc_msgSend(v39, "length"), (uint64_t)v53);
            if (!v24)
            {
              int v44 = 0;
              id v6 = v19;
              if (Img4DecodeGetPayloadType((uint64_t)v53, &v44))
              {
                id v27 = self->_log;
                uint64_t v10 = v40;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v15;
                  _os_log_impl(&dword_224B2D000, v27, OS_LOG_TYPE_INFO, "IMG4 get tag failed - %@", buf, 0xCu);
                }
              }
              else
              {
                uint64_t v10 = v40;
                if (v44 == a4)
                {
                  uint64_t v30 = v39;
                  if (v33) {
                    unint64_t *v33 = [v39 length];
                  }
                  v29 = objc_msgSend(v15, "copy", v33);

                  uint64_t v8 = v34;
                  BOOL v7 = v35;
                  id v9 = v37;
                  goto LABEL_36;
                }
              }
              v38 = v37;
              goto LABEL_14;
            }
            long long v25 = self->_log;
            id v6 = v19;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v15;
              _os_log_impl(&dword_224B2D000, v25, OS_LOG_TYPE_INFO, "IMG4 decode init failed - %@", buf, 0xCu);
            }
            v38 = v37;
LABEL_13:
            uint64_t v10 = v40;
LABEL_14:
            unint64_t v11 = 0x263F08000;
            goto LABEL_17;
          }
          v26 = self->_log;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v53[0]) = 138543618;
            *(void *)((char *)v53 + 4) = v15;
            WORD6(v53[0]) = 2114;
            *(void *)((char *)v53 + 14) = v37;
            _os_log_error_impl(&dword_224B2D000, v26, OS_LOG_TYPE_ERROR, "Failed to read %{public}@ with error %{public}@ ", (uint8_t *)v53, 0x16u);
          }
          v38 = v37;
          id v39 = 0;
        }
        id v6 = v19;
        goto LABEL_13;
      }
      long long v22 = self->_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v53[0]) = 138543618;
        *(void *)((char *)v53 + 4) = v15;
        WORD6(v53[0]) = 2114;
        *(void *)((char *)v53 + 14) = v18;
        _os_log_error_impl(&dword_224B2D000, v22, OS_LOG_TYPE_ERROR, "Failed to read file %{public}@ with error %{public}@", (uint8_t *)v53, 0x16u);
      }
LABEL_17:

      ++v12;
    }
    while (v43 != v12);
    uint64_t v28 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    uint64_t v43 = v28;
    if (v28) {
      continue;
    }
    break;
  }
LABEL_35:

  v29 = 0;
  id v9 = v38;
  uint64_t v30 = v39;
  uint64_t v8 = v34;
  BOOL v7 = v35;
LABEL_36:

  return v29;
}

- (int64_t)sendFDRData:(unsigned int)a3
{
  kern_return_t v17;
  NSObject *log;
  NSObject *v19;
  int v20;
  int64_t v21;
  kern_return_t v22;
  NSObject *v23;
  long long v25;
  AppleFirmwareUpdateController *v26;
  uint64_t v28;
  id obj;
  id v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  kern_return_t v40;
  unsigned char buf[24];
  long long v42;
  unsigned char v43[128];
  uint64_t v44;

  int v44 = *MEMORY[0x263EF8340];
  MEMORY[0x22A61DD40](fdrLogHandler, a2);
  v33 = 0u;
  __int16 v34 = 0u;
  v31 = 0u;
  __int16 v32 = 0u;
  id obj = [(AppleFirmwareUpdateController *)self fdrClasses];
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    long long v25 = 0x8400302uLL;
    v26 = self;
    while (2)
    {
      uint64_t v7 = 0;
      uint64_t v28 = v5;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        uint64_t v30 = 0;
        id v9 = -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:](self, "extractFDRDataWithClassKey:error:", v8, &v30, v25);
        id v10 = v30;
        unint64_t v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        if (v12)
        {
          mach_port_t v14 = [v8 dataUsingEncoding:4];
          uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v9, "length") + objc_msgSend(v8, "length"));
          [v15 appendData:v14];
          [v15 appendData:v9];
          id v16 = v15;
          *(void *)buf = [v16 bytes];
          *(void *)&buf[8] = [v16 length];
          *(void *)&uint8_t buf[16] = [v14 length];
          __int16 v42 = xmmword_224B387A0;
          int v17 = IOConnectCallScalarMethod(a3, 1u, (const uint64_t *)buf, 5u, 0, 0);
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            id v19 = log;
            id v20 = [v9 length];
            *(_DWORD *)uint64_t v35 = v25;
            uint64_t v36 = v8;
            id v37 = 1024;
            v38 = v20;
            id v39 = 1024;
            uint64_t v40 = v17;
            _os_log_impl(&dword_224B2D000, v19, OS_LOG_TYPE_INFO, "LoadFDR class='%@' with %u bytes ret=%d", v35, 0x18u);
          }
          uint64_t v5 = v28;
          self = v26;
          if (v17 == 1)
          {

            v21 = 16;
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v13 = self->_log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            _os_log_impl(&dword_224B2D000, v13, OS_LOG_TYPE_INFO, "Cannot find FDR data for class '%@': %@", buf, 0x16u);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v21 = 0;
LABEL_18:

  long long v22 = IOConnectCallScalarMethod(a3, 2u, 0, 0, 0, 0);
  BOOL v23 = self->_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v22;
    _os_log_impl(&dword_224B2D000, v23, OS_LOG_TYPE_INFO, "LoadFDRDataComplete ret=%d", buf, 8u);
  }
  return v21;
}

- (id)extractFDRDataWithClassKey:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    Value = 0;
    goto LABEL_16;
  }
  mach_port_t v14 = @"CopyAllowUnsealed";
  v15[0] = MEMORY[0x263EFFA88];
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  if ([v6 containsString:@"/"])
  {
    uint64_t v8 = [v6 componentsSeparatedByString:@"/"];
    if ([v8 count] == 2)
    {
      [v8 objectAtIndexedSubscript:0];

      uint64_t v9 = AMFDRSealingMapCopyLocalDictForClass();
      if (v9)
      {
        CFDictionaryRef v10 = (const __CFDictionary *)v9;
        unint64_t v11 = [v8 objectAtIndexedSubscript:1];

        Value = (void *)CFDictionaryGetValue(v10, v11);
        if (!a4) {
          goto LABEL_15;
        }
        goto LABEL_9;
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[AppleFirmwareUpdateController extractFDRDataWithClassKey:error:]();
    }

    Value = 0;
    goto LABEL_15;
  }
  Value = (void *)AMFDRSealingMapCopyLocalDataForClass();
  if (a4) {
LABEL_9:
  }
    *a4 = 0;
LABEL_15:

LABEL_16:
  return Value;
}

- (NSString)fwAssetFile
{
  return self->_fwAssetFile;
}

- (void)setFwAssetFile:(id)a3
{
}

- (NSString)fwAssetSignatureType
{
  return self->_fwAssetSignatureType;
}

- (void)setFwAssetSignatureType:(id)a3
{
}

- (NSNumber)fwAssetVersion
{
  return self->_fwAssetVersion;
}

- (void)setFwAssetVersion:(id)a3
{
}

- (NSNumber)fwAssetSize
{
  return self->_fwAssetSize;
}

- (void)setFwAssetSize:(id)a3
{
}

- (NSNumber)img4Tag
{
  return self->_img4Tag;
}

- (void)setImg4Tag:(id)a3
{
}

- (NSArray)fdrClasses
{
  return self->_fdrClasses;
}

- (void)setFdrClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fdrClasses, 0);
  objc_storeStrong((id *)&self->_img4Tag, 0);
  objc_storeStrong((id *)&self->_fwAssetSize, 0);
  objc_storeStrong((id *)&self->_fwAssetVersion, 0);
  objc_storeStrong((id *)&self->_fwAssetSignatureType, 0);
  objc_storeStrong((id *)&self->_fwAssetFile, 0);
  objc_storeStrong((id *)&self->_fwAssetDirectory, 0);
  objc_storeStrong((id *)&self->_registryEntryID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingCriticalEarlyBootEntriesInternal, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)extractFDRDataWithClassKey:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_224B2D000, v0, OS_LOG_TYPE_ERROR, "%s: localDict is NULL for key (%@).", (uint8_t *)v1, 0x16u);
}

- (void)extractFDRDataWithClassKey:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_224B2D000, v0, OS_LOG_TYPE_ERROR, "%s: key (%@) is not valid.", (uint8_t *)v1, 0x16u);
}

@end
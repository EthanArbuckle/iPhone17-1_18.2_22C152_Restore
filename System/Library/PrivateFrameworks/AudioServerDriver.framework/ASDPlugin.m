@interface ASDPlugin
- (ASDPlugin)init;
- (AudioServerPlugInDriverInterface)driverRef;
- (BOOL)deregisterForSystemSleepNotifications;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)registerForSystemSleepNotifications;
- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4;
- (NSString)bundleID;
- (id)arrayForKey:(id)a3;
- (id)audioDevices;
- (id)boxes;
- (id)clockDevices;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)dictionaryForKey:(id)a3;
- (id)driverClassName;
- (id)objectForObjectID:(unsigned int)a3;
- (unsigned)addRef;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)maximumNumberOfObjects;
- (unsigned)objectClass;
- (unsigned)objectIDForBoxUID:(id)a3;
- (unsigned)objectIDForClockDeviceUID:(id)a3;
- (unsigned)objectIDForDeviceUID:(id)a3;
- (unsigned)removeRef;
- (unsigned)transportType;
- (void)_handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(int64_t)a4;
- (void)addAudioDevice:(id)a3;
- (void)addAudioDevices:(id)a3;
- (void)addBox:(id)a3;
- (void)addCAObject:(id)a3;
- (void)addClockDevice:(id)a3;
- (void)addClockDevices:(id)a3;
- (void)addStreamRealTimeOperations:(id)a3;
- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4;
- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObjectID:(unsigned int)a4;
- (void)dealloc;
- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3;
- (void)removeAudioDevice:(id)a3;
- (void)removeAudioDevices:(id)a3;
- (void)removeBox:(id)a3;
- (void)removeCAObject:(id)a3;
- (void)removeClockDevice:(id)a3;
- (void)removeClockDevices:(id)a3;
- (void)removeStreamRealTimeOperations:(id)a3;
- (void)setArray:(id)a3 forKey:(id)a4;
- (void)setDictionary:(id)a3 forKey:(id)a4;
- (void)setMaximumNumberOfObjects:(unsigned int)a3;
- (void)setTransportType:(unsigned int)a3;
- (void)systemHasPoweredOn;
- (void)systemWillSleep;
@end

@implementation ASDPlugin

- (id)objectForObjectID:(unsigned int)a3
{
  if (a3 == 1)
  {
    v4 = self;
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    p_objectsLock = &self->_objectsLock;
    os_unfair_lock_lock(&self->_objectsLock);
    objects = self->_objects;
    v8 = [NSNumber numberWithUnsignedInt:v5];
    v4 = [(NSMapTable *)objects objectForKey:v8];

    os_unfair_lock_unlock(p_objectsLock);
  }
  return v4;
}

- (ASDPlugin)init
{
  v28.receiver = self;
  v28.super_class = (Class)ASDPlugin;
  v2 = [(ASDObject *)&v28 init];
  v3 = v2;
  if (v2)
  {
    [(ASDObject *)v2 setObjectID:1];
    v3->_nextObjectID = 2;
    v3->_transportType = 0;
    [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [(id)objc_claimAutoreleasedReturnValue() bundleIdentifier];
    bundleID = v3->_bundleID;
    v3->_bundleID = v4;
    v6 = v4;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    objects = v3->_objects;
    v3->_objects = (NSMapTable *)v7;

    v3->_objectsLock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    boxes = v3->_boxes;
    v3->_boxes = v9;

    id v11 = [NSString stringWithFormat:@"%@.boxes", v6];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    boxQueue = v3->_boxQueue;
    v3->_boxQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    audioDevices = v3->_audioDevices;
    v3->_audioDevices = v14;

    id v16 = [NSString stringWithFormat:@"%@.audioDevices", v6];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    audioDeviceQueue = v3->_audioDeviceQueue;
    v3->_audioDeviceQueue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clockDevices = v3->_clockDevices;
    v3->_clockDevices = v19;

    id v21 = [NSString stringWithFormat:@"%@.clockDevices", v6];
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    clockDeviceQueue = v3->_clockDeviceQueue;
    v3->_clockDeviceQueue = (OS_dispatch_queue *)v22;

    id v24 = [NSString stringWithFormat:@"%@.powerNotifications", v6];
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v24 UTF8String], 0);
    powerNotificationQueue = v3->_powerNotificationQueue;
    v3->_powerNotificationQueue = (OS_dispatch_queue *)v25;

    ASD_CreateDriverInterface(v3);
  }
  return 0;
}

- (void)dealloc
{
  ASD_DestroyDriverInterface((ASDPluginInterfaceInfo *)self->_interfacePtr);
  v3.receiver = self;
  v3.super_class = (Class)ASDPlugin;
  [(ASDObject *)&v3 dealloc];
}

- (void)setMaximumNumberOfObjects:(unsigned int)a3
{
  self->_maximumNumberOfObjects = a3;
  ASD_SetRealtimeOperationTableSize((uint64_t)self->_driverRef, a3);
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  self->_pluginHost = a3;
}

- (unsigned)objectClass
{
  return 1634757735;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  BOOL v4 = 1;
  if ((int)a3->mSelector > 1819107690)
  {
    if (mSelector - 1969841250 >= 3 && mSelector != 1819107691)
    {
      if (mSelector != 1920168547)
      {
LABEL_18:
        v9.receiver = self;
        v9.super_class = (Class)ASDPlugin;
        return -[ASDObject hasProperty:](&v9, sel_hasProperty_);
      }
      return 0;
    }
  }
  else if (mSelector != 1651472419 && mSelector != 1668049699 && mSelector != 1684370979)
  {
    goto LABEL_18;
  }
  return v4;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  unsigned int v7 = 8;
  if ((int)a3->mSelector <= 1870098019)
  {
    if (mSelector > 1684370978)
    {
      if (mSelector != 1684370979)
      {
        int v10 = 1819107691;
        goto LABEL_16;
      }
      if (a4) {
        goto LABEL_22;
      }
      uint64_t v21 = 0;
      dispatch_queue_t v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      audioDeviceQueue = self->_audioDeviceQueue;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
      v20[3] = &unk_264773158;
      v20[4] = self;
      v20[5] = &v21;
      objc_super v9 = v20;
    }
    else if (mSelector == 1651472419)
    {
      uint64_t v21 = 0;
      dispatch_queue_t v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      audioDeviceQueue = self->_boxQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
      v19[3] = &unk_264773158;
      v19[4] = self;
      v19[5] = &v21;
      objc_super v9 = v19;
    }
    else
    {
      if (mSelector != 1668049699) {
        goto LABEL_17;
      }
      uint64_t v21 = 0;
      dispatch_queue_t v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      audioDeviceQueue = self->_clockDeviceQueue;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4;
      v18[3] = &unk_264773158;
      v18[4] = self;
      v18[5] = &v21;
      objc_super v9 = v18;
    }
    goto LABEL_26;
  }
  if (mSelector <= 1969841249)
  {
    if (mSelector != 1870098020)
    {
      int v10 = 1920168547;
LABEL_16:
      if (mSelector == v10) {
        return v7;
      }
LABEL_17:
      v14.receiver = self;
      v14.super_class = (Class)ASDPlugin;
      return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v14, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
    }
    if (a4)
    {
LABEL_22:
      if ((a4 & 3) == 0)
      {
        uint64_t v21 = 0;
        dispatch_queue_t v22 = &v21;
        uint64_t v23 = 0x2020000000;
        uint64_t v24 = 0;
        _Block_object_dispose(&v21, 8);
      }
      return 0;
    }
    uint64_t v21 = 0;
    dispatch_queue_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    id v11 = self->_audioDeviceQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8;
    block[3] = &unk_264773158;
    block[4] = self;
    block[5] = &v21;
    dispatch_sync(v11, block);
    boxQueue = self->_boxQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9;
    v16[3] = &unk_264773158;
    v16[4] = self;
    v16[5] = &v21;
    dispatch_sync(boxQueue, v16);
    audioDeviceQueue = self->_clockDeviceQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_10;
    v15[3] = &unk_264773158;
    v15[4] = self;
    v15[5] = &v21;
    objc_super v9 = v15;
LABEL_26:
    dispatch_sync(audioDeviceQueue, v9);
    unsigned int v7 = 4 * *((_DWORD *)v22 + 6);
    _Block_object_dispose(&v21, 8);
    return v7;
  }
  if (mSelector != 1969841250 && mSelector != 1969841251 && mSelector != 1969841252) {
    goto LABEL_17;
  }
  return 4;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_8(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 96) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_9(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 80) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

uint64_t __68__ASDPlugin_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_10(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result = 0;
  if (!a3 || !a6 || !a7) {
    return result;
  }
  uint64_t v13 = *(void *)&a4;
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1870098019)
  {
    if (mSelector > 1684370978)
    {
      if (mSelector != 1684370979)
      {
        if (mSelector != 1819107691) {
          goto LABEL_47;
        }
        if (*a6 >= 8)
        {
          manufacturerName = self->_manufacturerName;
          *(void *)a7 = manufacturerName;
          if (manufacturerName) {
            CFRetain(manufacturerName);
          }
          unsigned int v19 = 8;
          goto LABEL_28;
        }
        return 0;
      }
      if (a4)
      {
        if ((a4 & 3) != 0) {
          return 0;
        }
        uint64_t v44 = 0;
        v45 = &v44;
        uint64_t v46 = 0x2020000000;
        uint64_t v47 = 0;
        unsigned int v32 = *a6;
        if (v32 >= [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])LABEL_38:[(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:v13 andQualifierData:a5]; {
LABEL_63:
        }
        *a6 = 4 * *((_DWORD *)v45 + 6);
        _Block_object_dispose(&v44, 8);
        return 1;
      }
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      unsigned int v30 = *a6;
      if (v30 >= [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5])unsigned int v31 = [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5]; {
      else
      }
        unsigned int v31 = *a6;
      uint64_t v36 = v31 >> 2;
      audioDeviceQueue = self->_audioDeviceQueue;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
      v43[3] = &unk_264773180;
      v43[4] = self;
      v43[5] = &v44;
      v43[6] = v36;
      v43[7] = a7;
      v26 = v43;
    }
    else if (mSelector == 1651472419)
    {
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      unsigned int v21 = *a6;
      if (v21 >= [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])unsigned int v22 = [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:v13 andQualifierData:a5]; {
      else
      }
        unsigned int v22 = *a6;
      uint64_t v27 = v22 >> 2;
      audioDeviceQueue = self->_boxQueue;
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
      v42[3] = &unk_264773180;
      v42[4] = self;
      v42[5] = &v44;
      v42[6] = v27;
      v42[7] = a7;
      v26 = v42;
    }
    else
    {
      if (mSelector != 1668049699) {
        goto LABEL_47;
      }
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      unsigned int v17 = *a6;
      if (v17 >= [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])unsigned int v18 = [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:v13 andQualifierData:a5]; {
      else
      }
        unsigned int v18 = *a6;
      uint64_t v24 = v18 >> 2;
      audioDeviceQueue = self->_clockDeviceQueue;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4;
      v41[3] = &unk_264773180;
      v41[4] = self;
      v41[5] = &v44;
      v41[6] = v24;
      v41[7] = a7;
      v26 = v41;
    }
LABEL_62:
    dispatch_sync(audioDeviceQueue, v26);
    goto LABEL_63;
  }
  if (mSelector <= 1969841249)
  {
    if (mSelector != 1870098020)
    {
      if (mSelector != 1953653102) {
        goto LABEL_47;
      }
      if (*a6 >= 4)
      {
        *(_DWORD *)a7 = [(ASDPlugin *)self transportType];
        unsigned int v19 = 4;
LABEL_28:
        *a6 = v19;
        return 1;
      }
      return 0;
    }
    if (a4)
    {
      if ((a4 & 3) != 0) {
        return 0;
      }
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      unsigned int v23 = *a6;
      if (v23 >= [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])goto LABEL_38; {
      goto LABEL_63;
      }
    }
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    unsigned int v28 = *a6;
    if (v28 >= [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5])unsigned int v29 = [(ASDPlugin *)self dataSizeForProperty:a3 withQualifierSize:0 andQualifierData:a5]; {
    else
    }
      unsigned int v29 = *a6;
    uint64_t v33 = v29 >> 2;
    v34 = self->_audioDeviceQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8;
    block[3] = &unk_264773180;
    block[4] = self;
    block[5] = &v44;
    void block[6] = v33;
    block[7] = a7;
    dispatch_sync(v34, block);
    v35 = self->_audioDeviceQueue;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9;
    v39[3] = &unk_264773180;
    v39[4] = self;
    v39[5] = &v44;
    v39[6] = v33;
    v39[7] = a7;
    dispatch_sync(v35, v39);
    audioDeviceQueue = self->_clockDeviceQueue;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10;
    v38[3] = &unk_264773180;
    v38[4] = self;
    v38[5] = &v44;
    v38[6] = v33;
    v38[7] = a7;
    v26 = v38;
    goto LABEL_62;
  }
  if (mSelector != 1969841250)
  {
    if (mSelector == 1969841251)
    {
      BOOL result = 0;
      if (a5 && a4 == 8 && *a6 >= 4)
      {
        *a6 = 4;
        unsigned int v16 = [(ASDPlugin *)self objectIDForClockDeviceUID:a5];
        goto LABEL_46;
      }
      return result;
    }
    if (mSelector == 1969841252)
    {
      BOOL result = 0;
      if (a5 && a4 == 8 && *a6 >= 4)
      {
        *a6 = 4;
        unsigned int v16 = [(ASDPlugin *)self objectIDForDeviceUID:a5];
LABEL_46:
        *(_DWORD *)a7 = v16;
        return 1;
      }
      return result;
    }
LABEL_47:
    v37.receiver = self;
    v37.super_class = (Class)ASDPlugin;
    return [(ASDObject *)&v37 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
  }
  BOOL result = 0;
  if (a5 && a4 == 8 && *a6 >= 4)
  {
    *a6 = 4;
    unsigned int v16 = [(ASDPlugin *)self objectIDForBoxUID:a5];
    goto LABEL_46;
  }
  return result;
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 96);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      v8 = objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 80);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      v8 = objc_msgSend(*(id *)(a1[4] + 80), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 112);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      v8 = objc_msgSend(*(id *)(a1[4] + 112), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_8(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 96);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      v8 = objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_9(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 96);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      v8 = objc_msgSend(*(id *)(a1[4] + 96), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __84__ASDPlugin_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_10(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1[4] + 112);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      if (*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
        break;
      }
      v8 = objc_msgSend(*(id *)(a1[4] + 112), "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
      *(_DWORD *)(a1[7] + 4 * (*(void *)(*(void *)(a1[5] + 8) + 24))++) = [v8 objectID];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unsigned)addRef
{
  unsigned int v2 = self->_pluginRefCount + 1;
  self->_pluginRefCount = v2;
  return v2;
}

- (unsigned)removeRef
{
  unsigned int v2 = self->_pluginRefCount - 1;
  self->_pluginRefCount = v2;
  return v2;
}

- (void)addCAObject:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock(&self->_objectsLock);
  for (uint64_t i = self->_nextObjectID; ; self->_nextObjectID = i)
  {
    objects = self->_objects;
    uint64_t v6 = [NSNumber numberWithUnsignedInt:i];
    uint64_t v7 = [(NSMapTable *)objects objectForKey:v6];

    uint64_t nextObjectID = self->_nextObjectID;
    if (!v7) {
      break;
    }
    uint64_t i = (nextObjectID + 1);
  }
  [v11 setObjectID:nextObjectID];
  ++self->_nextObjectID;
  long long v9 = self->_objects;
  long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "objectID"));
  [(NSMapTable *)v9 setObject:v11 forKey:v10];

  [v11 setPlugin:self];
  os_unfair_lock_unlock(&self->_objectsLock);
}

- (void)removeCAObject:(id)a3
{
  p_objectsLock = &self->_objectsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_objectsLock);
  objects = self->_objects;
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 objectID];

  long long v9 = [v7 numberWithUnsignedInt:v8];
  [(NSMapTable *)objects removeObjectForKey:v9];

  os_unfair_lock_unlock(p_objectsLock);
}

- (void)addAudioDevice:(id)a3
{
  id v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDPlugin_addAudioDevice___block_invoke;
  block[3] = &unk_2647731A8;
  block[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  char v9 = 0;
  __int16 v10 = 0;
  strcpy(v8, "#vedbolg");
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
  *(_DWORD *)uint64_t v8 = 1870098020;
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
}

void __28__ASDPlugin_addAudioDevice___block_invoke(uint64_t a1)
{
  MEMORY[0x22A63EEF0]();
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) deviceUID];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDPlugin.m" lineNumber:704 description:@"Device already exists"];
  }
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 96);
  id v7 = [v5 deviceUID];
  [v6 setObject:v5 forKey:v7];

  ASD_AddAudioDeviceRealTimeOperations([*(id *)(a1 + 32) driverRef], *(void **)(a1 + 40));
}

- (void)removeAudioDevice:(id)a3
{
  id v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_removeAudioDevice___block_invoke;
  block[3] = &unk_2647731A8;
  block[4] = self;
  id v12 = v5;
  SEL v13 = a2;
  id v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  char v9 = 0;
  __int16 v10 = 0;
  strcpy(v8, "#vedbolg");
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
  *(_DWORD *)uint64_t v8 = 1870098020;
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
}

void __31__ASDPlugin_removeAudioDevice___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)MEMORY[0x22A63EEF0]();
  id v3 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v4 = [*(id *)(a1 + 40) deviceUID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    char v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDPlugin.m" lineNumber:732 description:@"Device doesn't exist"];
  }
  [*(id *)(a1 + 40) systemHasPoweredOn];
  ASD_RemoveAudioDeviceRealTimeOperations([*(id *)(a1 + 32) driverRef], *(void **)(a1 + 40));
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 96);
  uint64_t v8 = [v6 deviceUID];
  [v7 removeObjectForKey:v8];
}

- (void)addAudioDevices:(id)a3
{
  id v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDPlugin_addAudioDevices___block_invoke;
  block[3] = &unk_2647731A8;
  id v12 = v5;
  SEL v13 = self;
  SEL v14 = a2;
  id v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  char v9 = 0;
  __int16 v10 = 0;
  strcpy(v8, "#vedbolg");
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
  *(_DWORD *)uint64_t v8 = 1870098020;
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
}

void __29__ASDPlugin_addAudioDevices___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A63EEF0]();
  memset(v11, 0, sizeof(v11));
  id v2 = *(id *)(a1 + 32);
  if ([v2 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    id v3 = (void *)**((void **)&v11[0] + 1);
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 96);
    id v5 = [**((id **)&v11[0] + 1) deviceUID];
    uint64_t v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      char v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"ASDPlugin.m" lineNumber:763 description:@"Device already exists"];
    }
    id v7 = *(void **)(*(void *)(a1 + 40) + 96);
    uint64_t v8 = [v3 deviceUID];
    [v7 setObject:v3 forKey:v8];

    ASD_AddAudioDeviceRealTimeOperations([*(id *)(a1 + 40) driverRef], v3);
  }
}

- (void)removeAudioDevices:(id)a3
{
  id v5 = a3;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ASDPlugin_removeAudioDevices___block_invoke;
  block[3] = &unk_2647731A8;
  id v12 = v5;
  uint64_t v13 = self;
  SEL v14 = a2;
  id v7 = v5;
  dispatch_sync(audioDeviceQueue, block);
  char v9 = 0;
  __int16 v10 = 0;
  strcpy(v8, "#vedbolg");
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
  *(_DWORD *)uint64_t v8 = 1870098020;
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
}

void __32__ASDPlugin_removeAudioDevices___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A63EEF0]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 96);
        char v9 = [v7 deviceUID];
        __int16 v10 = [v8 objectForKeyedSubscript:v9];

        if (!v10)
        {
          uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
          [v13 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"ASDPlugin.m" lineNumber:794 description:@"Device doesn't exist"];
        }
        [v7 systemHasPoweredOn];
        ASD_RemoveAudioDeviceRealTimeOperations([*(id *)(a1 + 40) driverRef], v7);
        id v11 = *(void **)(*(void *)(a1 + 40) + 96);
        id v12 = [v7 deviceUID];
        [v11 removeObjectForKey:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (id)audioDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__0;
  __int16 v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  audioDeviceQueue = self->_audioDeviceQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__ASDPlugin_audioDevices__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(audioDeviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__ASDPlugin_audioDevices__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 96) allValues];
  uint64_t v3 = [v2 arrayWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unsigned)objectIDForDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  audioDeviceQueue = self->_audioDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__ASDPlugin_objectIDForDeviceUID___block_invoke;
  block[3] = &unk_2647731D0;
  void block[4] = self;
  id v6 = v4;
  id v14 = v6;
  long long v15 = &v16;
  dispatch_sync(audioDeviceQueue, block);
  unsigned int v7 = *((_DWORD *)v17 + 6);
  if (!v7)
  {
    clockDeviceQueue = self->_clockDeviceQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__ASDPlugin_objectIDForDeviceUID___block_invoke_2;
    v10[3] = &unk_2647731D0;
    v10[4] = self;
    id v11 = v6;
    id v12 = &v16;
    dispatch_sync(clockDeviceQueue, v10);

    unsigned int v7 = *((_DWORD *)v17 + 6);
  }

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __34__ASDPlugin_objectIDForDeviceUID___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1[4] + 96) objectForKey:a1[5]];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v3 objectID];
}

void __34__ASDPlugin_objectIDForDeviceUID___block_invoke_2(void *a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1[4] + 112) objectForKey:a1[5]];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v3 objectID];
}

- (void)addStreamRealTimeOperations:(id)a3
{
}

- (void)removeStreamRealTimeOperations:(id)a3
{
  id v4 = a3;
  ASD_RemoveStreamRealTimeOperations((uint64_t)[(ASDPlugin *)self driverRef], v4);
}

- (void)addBox:(id)a3
{
  id v4 = a3;
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__ASDPlugin_addBox___block_invoke;
  block[3] = &unk_2647731F8;
  void block[4] = self;
  id v11 = v4;
  id v6 = v4;
  dispatch_sync(boxQueue, block);
  [v6 setOwner:self];
  char v8 = 0;
  __int16 v9 = 0;
  strcpy(v7, "#xobbolg");
  [(ASDPlugin *)self changedProperty:v7 forObject:self];
  *(_DWORD *)unsigned int v7 = 1870098020;
  [(ASDPlugin *)self changedProperty:v7 forObject:self];
}

void __20__ASDPlugin_addBox___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v3 + 80);
  id v6 = [v4 boxUID];
  [v5 setObject:v4 forKey:v6];
}

- (void)removeBox:(id)a3
{
  id v4 = a3;
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__ASDPlugin_removeBox___block_invoke;
  block[3] = &unk_2647731F8;
  void block[4] = self;
  id v11 = v4;
  id v6 = v4;
  dispatch_sync(boxQueue, block);
  char v8 = 0;
  __int16 v9 = 0;
  strcpy(v7, "#xobbolg");
  [(ASDPlugin *)self changedProperty:v7 forObject:self];
  *(_DWORD *)unsigned int v7 = 1870098020;
  [(ASDPlugin *)self changedProperty:v7 forObject:self];
}

void __23__ASDPlugin_removeBox___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v5 = [v3 boxUID];
  [v4 removeObjectForKey:v5];
}

- (id)boxes
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__0;
  __int16 v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  boxQueue = self->_boxQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __18__ASDPlugin_boxes__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(boxQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __18__ASDPlugin_boxes__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 80) allValues];
  uint64_t v3 = [v2 arrayWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unsigned)objectIDForBoxUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  boxQueue = self->_boxQueue;
  int v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_objectIDForBoxUID___block_invoke;
  block[3] = &unk_2647731D0;
  void block[4] = self;
  id v9 = v4;
  __int16 v10 = &v11;
  id v6 = v4;
  dispatch_sync(boxQueue, block);
  LODWORD(boxQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return boxQueue;
}

void __31__ASDPlugin_objectIDForBoxUID___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1[4] + 80) objectForKey:a1[5]];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v3 objectID];
}

- (void)addClockDevice:(id)a3
{
  id v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDPlugin_addClockDevice___block_invoke;
  block[3] = &unk_2647731A8;
  void block[4] = self;
  id v11 = v5;
  SEL v12 = a2;
  id v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  int v9 = 0;
  uint64_t v8 = 0x676C6F62636C6B23;
  [(ASDPlugin *)self changedProperty:&v8 forObject:self];
}

void __28__ASDPlugin_addClockDevice___block_invoke(uint64_t a1)
{
  MEMORY[0x22A63EEF0]();
  id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  uint64_t v3 = [*(id *)(a1 + 40) deviceUID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDPlugin.m" lineNumber:944 description:@"Clock Device already exists"];
  }
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 112);
  id v7 = [v5 deviceUID];
  [v6 setObject:v5 forKey:v7];

  ASD_AddClockDeviceRealTimeOperations([*(id *)(a1 + 32) driverRef], *(void **)(a1 + 40));
}

- (void)addClockDevices:(id)a3
{
  id v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDPlugin_addClockDevices___block_invoke;
  block[3] = &unk_2647731A8;
  id v12 = v5;
  uint64_t v13 = self;
  SEL v14 = a2;
  id v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  char v9 = 0;
  __int16 v10 = 0;
  strcpy(v8, "#klcbolg");
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
  *(_DWORD *)uint64_t v8 = 1870098020;
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
}

void __29__ASDPlugin_addClockDevices___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A63EEF0]();
  memset(v11, 0, sizeof(v11));
  id v2 = *(id *)(a1 + 32);
  if ([v2 countByEnumeratingWithState:v11 objects:v12 count:16])
  {
    uint64_t v3 = (void *)**((void **)&v11[0] + 1);
    id v4 = *(void **)(*(void *)(a1 + 40) + 112);
    id v5 = [**((id **)&v11[0] + 1) deviceUID];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      char v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"ASDPlugin.m" lineNumber:965 description:@"Device already exists"];
    }
    id v7 = *(void **)(*(void *)(a1 + 40) + 112);
    uint64_t v8 = [v3 deviceUID];
    [v7 setObject:v3 forKey:v8];

    ASD_AddClockDeviceRealTimeOperations([*(id *)(a1 + 40) driverRef], v3);
  }
}

- (void)removeClockDevice:(id)a3
{
  id v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_removeClockDevice___block_invoke;
  block[3] = &unk_2647731A8;
  void block[4] = self;
  id v11 = v5;
  SEL v12 = a2;
  id v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  int v9 = 0;
  uint64_t v8 = 0x676C6F62636C6B23;
  [(ASDPlugin *)self changedProperty:&v8 forObject:self];
}

void __31__ASDPlugin_removeClockDevice___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 112);
  id v4 = [*(id *)(a1 + 40) deviceUID];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    int v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"ASDPlugin.m" lineNumber:989 description:@"Clock Device doesn't exist"];
  }
  [*(id *)(a1 + 40) systemHasPoweredOn];
  ASD_RemoveClockDeviceRealTimeOperations([*(id *)(a1 + 32) driverRef], *(void **)(a1 + 40));
  id v6 = *(void **)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 112);
  uint64_t v8 = [v6 deviceUID];
  [v7 removeObjectForKey:v8];
}

- (void)removeClockDevices:(id)a3
{
  id v5 = a3;
  clockDeviceQueue = self->_clockDeviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ASDPlugin_removeClockDevices___block_invoke;
  block[3] = &unk_2647731A8;
  id v12 = v5;
  uint64_t v13 = self;
  SEL v14 = a2;
  id v7 = v5;
  dispatch_sync(clockDeviceQueue, block);
  char v9 = 0;
  __int16 v10 = 0;
  strcpy(v8, "#klcbolg");
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
  *(_DWORD *)uint64_t v8 = 1870098020;
  [(ASDPlugin *)self changedProperty:v8 forObject:self];
}

void __32__ASDPlugin_removeClockDevices___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x22A63EEF0]();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 112);
        char v9 = [v7 deviceUID];
        __int16 v10 = [v8 objectForKeyedSubscript:v9];

        if (!v10)
        {
          uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
          [v13 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"ASDPlugin.m" lineNumber:1011 description:@"Device doesn't exist"];
        }
        [v7 systemHasPoweredOn];
        ASD_RemoveClockDeviceRealTimeOperations([*(id *)(a1 + 40) driverRef], v7);
        id v11 = *(void **)(*(void *)(a1 + 40) + 112);
        id v12 = [v7 deviceUID];
        [v11 removeObjectForKey:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (id)clockDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__0;
  __int16 v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  clockDeviceQueue = self->_clockDeviceQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__ASDPlugin_clockDevices__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(clockDeviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__ASDPlugin_clockDevices__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFF8C0];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 112) allValues];
  uint64_t v3 = [v2 arrayWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (unsigned)objectIDForClockDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  clockDeviceQueue = self->_clockDeviceQueue;
  int v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__ASDPlugin_objectIDForClockDeviceUID___block_invoke;
  block[3] = &unk_2647731D0;
  void block[4] = self;
  id v9 = v4;
  __int16 v10 = &v11;
  id v6 = v4;
  dispatch_sync(clockDeviceQueue, block);
  LODWORD(clockDeviceQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return clockDeviceQueue;
}

void __39__ASDPlugin_objectIDForClockDeviceUID___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1[4] + 112) objectForKey:a1[5]];
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = [v3 objectID];
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (a3)
    {
      pluginHost = self->_pluginHost;
      if (pluginHost)
      {
        AudioObjectPropertySelector mSelector = a3->mSelector;
        if ((int)a3->mSelector > 1885762591)
        {
          if (mSelector == 1885762592) {
            goto LABEL_11;
          }
          int v9 = 1936092532;
        }
        else
        {
          if (mSelector == 1667523955) {
            goto LABEL_11;
          }
          int v9 = 1853059700;
        }
        if (mSelector != v9)
        {
          id v10 = v6;
          ((void (*)(AudioServerPlugInHostInterface *, uint64_t, uint64_t, const AudioObjectPropertyAddress *))pluginHost->PropertiesChanged)(pluginHost, [v6 objectID], 1, a3);
          id v6 = v10;
        }
      }
    }
  }
LABEL_11:
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObjectID:(unsigned int)a4
{
  if (a3)
  {
    pluginHost = self->_pluginHost;
    if (pluginHost)
    {
      AudioObjectPropertySelector mSelector = a3->mSelector;
      if ((int)a3->mSelector > 1885762591)
      {
        BOOL v6 = mSelector == 1885762592;
        int v7 = 1936092532;
      }
      else
      {
        BOOL v6 = mSelector == 1667523955;
        int v7 = 1853059700;
      }
      if (!v6 && mSelector != v7) {
        ((void (*)(AudioServerPlugInHostInterface *, void, uint64_t, const AudioObjectPropertyAddress *))pluginHost->PropertiesChanged)(pluginHost, *(void *)&a4, 1, a3);
      }
    }
  }
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  int v7 = (void *)MEMORY[0x22A63F100](a4);
  pluginHost = self->_pluginHost;
  if (pluginHost)
  {
    int v9 = ((uint64_t (*)(AudioServerPlugInHostInterface *, uint64_t, void, void *))pluginHost->RequestDeviceConfigurationChange)(pluginHost, [v6 objectID], 0, v7);
    if (!v9)
    {
      BOOL v12 = 1;
      goto LABEL_9;
    }
    int v10 = v9;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ASDPlugin requestConfigurationChangeForDevice:withBlock:](v10);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[ASDPlugin requestConfigurationChangeForDevice:withBlock:]();
  }
  uint64_t v11 = dispatch_get_global_queue(21, 0);
  dispatch_async(v11, v7);

  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (id)dictionaryForKey:(id)a3
{
  pluginHost = (void (**)(void *, id, id *))self->_pluginHost;
  if (pluginHost)
  {
    id v5 = 0;
    pluginHost[1](pluginHost, a3, &v5);
    pluginHost = (void (**)(void *, id, id *))v5;
  }
  return pluginHost;
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  pluginHost = self->_pluginHost;
  if (pluginHost)
  {
    if (v8) {
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->WriteToStorage)(pluginHost, v6);
    }
    else {
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->DeleteFromStorage)(pluginHost, v6);
    }
  }
}

- (id)arrayForKey:(id)a3
{
  pluginHost = (void (**)(void *, id, id *))self->_pluginHost;
  if (pluginHost)
  {
    id v5 = 0;
    pluginHost[1](pluginHost, a3, &v5);
    pluginHost = (void (**)(void *, id, id *))v5;
  }
  return pluginHost;
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  pluginHost = self->_pluginHost;
  if (pluginHost)
  {
    if (v8) {
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->WriteToStorage)(pluginHost, v6);
    }
    else {
      ((void (*)(AudioServerPlugInHostInterface *, id))pluginHost->DeleteFromStorage)(pluginHost, v6);
    }
  }
}

- (BOOL)registerForSystemSleepNotifications
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(ASDPlugin *)self bundleID];
    int v7 = 136315138;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s registered for system sleep notifications", (uint8_t *)&v7, 0xCu);
  }
  p_powerNotificationPort = &self->_powerNotificationPort;
  LODWORD(v5) = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)IOPowerNotifierCallback, &self->_powerNotifier);
  self->_powerConnection = v5;
  if (v5)
  {
    if (self->_powerNotifier)
    {
      id v5 = *p_powerNotificationPort;
      if (*p_powerNotificationPort)
      {
        IONotificationPortSetDispatchQueue(v5, (dispatch_queue_t)self->_powerNotificationQueue);
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)_handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  switch((v6 >> 4))
  {
    case 0u:
      IOAllowPowerChange(self->_powerConnection, a4);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(ASDPlugin *)self bundleID];
        int v14 = 136315138;
        uint64_t v15 = [v8 UTF8String];
        uint64_t v9 = &_os_log_internal;
        int v10 = "%s received power notification kIOMessageCanSystemSleep";
        goto LABEL_16;
      }
      break;
    case 1u:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(ASDPlugin *)self bundleID];
        int v14 = 136315138;
        uint64_t v15 = [v11 UTF8String];
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s received power notification kIOMessageSystemWillSleep", (uint8_t *)&v14, 0xCu);
      }
      [(ASDPlugin *)self systemWillSleep];
      IOAllowPowerChange(self->_powerConnection, a4);
      break;
    case 2u:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(ASDPlugin *)self bundleID];
        int v14 = 136315138;
        uint64_t v15 = [v8 UTF8String];
        uint64_t v9 = &_os_log_internal;
        int v10 = "%s received power notification kIOMessageSystemWillNotSleep";
        goto LABEL_16;
      }
      break;
    case 9u:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [(ASDPlugin *)self bundleID];
        int v14 = 136315138;
        uint64_t v15 = [v13 UTF8String];
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s received power notification kIOMessageSystemHasPoweredOn", (uint8_t *)&v14, 0xCu);
      }
      [(ASDPlugin *)self systemHasPoweredOn];
      break;
    case 0xBu:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(ASDPlugin *)self bundleID];
        int v14 = 136315138;
        uint64_t v15 = [v8 UTF8String];
        uint64_t v9 = &_os_log_internal;
        int v10 = "%s received power notification kIOMessageSystemWillPowerOn";
LABEL_16:
        uint32_t v12 = 12;
        goto LABEL_17;
      }
      break;
    default:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(ASDPlugin *)self bundleID];
        int v14 = 136315394;
        uint64_t v15 = [v8 UTF8String];
        __int16 v16 = 1024;
        unsigned int v17 = a3;
        uint64_t v9 = &_os_log_internal;
        int v10 = "%s received unhandled power notification 0x%x";
        uint32_t v12 = 18;
LABEL_17:
        _os_log_impl(&dword_225CD5000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
      }
      break;
  }
}

- (void)systemWillSleep
{
  id v3 = [MEMORY[0x263EFF980] array];
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDPlugin_systemWillSleep__block_invoke;
  block[3] = &unk_2647731F8;
  void block[4] = self;
  id v5 = v3;
  id v13 = v5;
  dispatch_sync(boxQueue, block);
  audioDeviceQueue = self->_audioDeviceQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __28__ASDPlugin_systemWillSleep__block_invoke_2;
  v10[3] = &unk_2647731F8;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  dispatch_sync(audioDeviceQueue, v10);
  clockDeviceQueue = self->_clockDeviceQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __28__ASDPlugin_systemWillSleep__block_invoke_3;
  v9[3] = &unk_264773220;
  v9[4] = self;
  dispatch_sync(clockDeviceQueue, v9);
}

void __28__ASDPlugin_systemWillSleep__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 systemWillSleep];
        uint64_t v9 = *(void **)(a1 + 40);
        int v10 = [v8 audioDevices];
        [v9 addObjectsFromArray:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __28__ASDPlugin_systemWillSleep__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0) {
          [v8 systemWillSleep];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __28__ASDPlugin_systemWillSleep__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) systemWillSleep];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)systemHasPoweredOn
{
  id v3 = [MEMORY[0x263EFF980] array];
  boxQueue = self->_boxQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDPlugin_systemHasPoweredOn__block_invoke;
  block[3] = &unk_2647731F8;
  void block[4] = self;
  id v5 = v3;
  id v13 = v5;
  dispatch_sync(boxQueue, block);
  audioDeviceQueue = self->_audioDeviceQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__ASDPlugin_systemHasPoweredOn__block_invoke_2;
  v10[3] = &unk_2647731F8;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  dispatch_sync(audioDeviceQueue, v10);
  clockDeviceQueue = self->_clockDeviceQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__ASDPlugin_systemHasPoweredOn__block_invoke_3;
  v9[3] = &unk_264773220;
  v9[4] = self;
  dispatch_sync(clockDeviceQueue, v9);
}

void __31__ASDPlugin_systemHasPoweredOn__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v8 systemHasPoweredOn];
        long long v9 = *(void **)(a1 + 40);
        long long v10 = [v8 audioDevices];
        [v9 addObjectsFromArray:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __31__ASDPlugin_systemHasPoweredOn__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([*(id *)(a1 + 40) containsObject:v8] & 1) == 0) {
          [v8 systemHasPoweredOn];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __31__ASDPlugin_systemHasPoweredOn__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) systemHasPoweredOn];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)deregisterForSystemSleepNotifications
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(ASDPlugin *)self bundleID];
    int v7 = 136315138;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s deregistered for system sleep notifications", (uint8_t *)&v7, 0xCu);
  }
  if (self->_powerNotifier)
  {
    IODeregisterForSystemPower(&self->_powerNotifier);
    self->_powerNotifier = 0;
  }
  io_connect_t powerConnection = self->_powerConnection;
  if (powerConnection)
  {
    IOServiceClose(powerConnection);
    self->_io_connect_t powerConnection = 0;
  }
  powerNotificationPort = self->_powerNotificationPort;
  if (powerNotificationPort)
  {
    IONotificationPortDestroy(powerNotificationPort);
    self->_powerNotificationPort = 0;
  }
  return 1;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASDPlugin;
  int v7 = [(ASDObject *)&v57 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  v43 = [v6 stringByAppendingString:@"|        "];
  id v8 = [(ASDPlugin *)self bundleID];
  [v7 appendFormat:@"%@|    Bundle ID: %s\n", v6, objc_msgSend(v8, "UTF8String")];

  uint64_t v44 = v6;
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, -[NSString UTF8String](self->_manufacturerName, "UTF8String")];
  uint64_t v9 = [(ASDPlugin *)self boxes];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    [v7 appendFormat:@"%@|    Box Objects:\n", v6];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v11 = [(ASDPlugin *)self boxes];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v11);
          }
          unsigned int v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if (v4)
          {
            id v18 = [*(id *)(*((void *)&v53 + 1) + 8 * i) diagnosticDescriptionWithIndent:v43 walkTree:1];
            [v7 appendString:v18];
          }
          else
          {
            uint64_t v19 = [*(id *)(*((void *)&v53 + 1) + 8 * i) objectID];
            id v18 = [v17 boxUID];
            [v7 appendFormat:@"%@|        %u: %u (%s)\n", v44, v14 + i, v19, objc_msgSend(v18, "UTF8String")];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v53 objects:v60 count:16];
        uint64_t v14 = (v14 + i);
      }
      while (v13);
    }
  }
  uint64_t v20 = [(ASDPlugin *)self audioDevices];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    [v7 appendFormat:@"%@|    Audio Device Objects:\n", v44];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    unsigned int v22 = [(ASDPlugin *)self audioDevices];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v22);
          }
          unsigned int v28 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          if (v4)
          {
            id v29 = [*(id *)(*((void *)&v49 + 1) + 8 * j) diagnosticDescriptionWithIndent:v43 walkTree:1];
            [v7 appendString:v29];
          }
          else
          {
            uint64_t v30 = [*(id *)(*((void *)&v49 + 1) + 8 * j) objectID];
            id v29 = [v28 deviceUID];
            [v7 appendFormat:@"%@|        %u: %u (%s)\n", v44, v25 + j, v30, objc_msgSend(v29, "UTF8String")];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
        uint64_t v25 = (v25 + j);
      }
      while (v24);
    }
  }
  unsigned int v31 = [(ASDPlugin *)self clockDevices];
  uint64_t v32 = [v31 count];

  if (v32)
  {
    [v7 appendFormat:@"%@|    Clock Device Objects:\n", v44];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v33 = [(ASDPlugin *)self clockDevices];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = 0;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v33);
          }
          v39 = *(void **)(*((void *)&v45 + 1) + 8 * k);
          if (v4)
          {
            id v40 = [*(id *)(*((void *)&v45 + 1) + 8 * k) diagnosticDescriptionWithIndent:v43 walkTree:1];
            [v7 appendString:v40];
          }
          else
          {
            uint64_t v41 = [*(id *)(*((void *)&v45 + 1) + 8 * k) objectID];
            id v40 = [v39 deviceUID];
            [v7 appendFormat:@"%@|        %u: %u (%s)\n", v44, v36 + k, v41, objc_msgSend(v40, "UTF8String")];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v45 objects:v58 count:16];
        uint64_t v36 = (v36 + k);
      }
      while (v35);
    }
  }
  return v7;
}

- (id)driverClassName
{
  return @"AudioPlugin";
}

- (AudioServerPlugInDriverInterface)driverRef
{
  return self->_driverRef;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unsigned int)a3
{
  self->_transportType = a3;
}

- (unsigned)maximumNumberOfObjects
{
  return self->_maximumNumberOfObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_powerNotificationQueue, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_clockDeviceQueue, 0);
  objc_storeStrong((id *)&self->_clockDevices, 0);
  objc_storeStrong((id *)&self->_audioDeviceQueue, 0);
  objc_storeStrong((id *)&self->_audioDevices, 0);
  objc_storeStrong((id *)&self->_boxQueue, 0);
  objc_storeStrong((id *)&self->_boxes, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

- (void)requestConfigurationChangeForDevice:withBlock:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "request config change with no plugin host", v0, 2u);
}

- (void)requestConfigurationChangeForDevice:(int)a1 withBlock:.cold.2(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "request config change error %u", (uint8_t *)v1, 8u);
}

@end
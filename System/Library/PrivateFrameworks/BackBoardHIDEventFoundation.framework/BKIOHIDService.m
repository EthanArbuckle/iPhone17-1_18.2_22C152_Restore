@interface BKIOHIDService
- (BKIOHIDService)initWithHIDServiceRef:(__IOHIDService *)a3;
- (BKSHIDEventSenderDescriptor)senderDescriptor;
- (BOOL)claimsToConformToUsagePage:(unsigned __int16)a3 usage:(unsigned __int16)a4;
- (BOOL)isAuthenticated;
- (BOOL)isBuiltIn;
- (BOOL)isVirtualService;
- (BOOL)setProperties:(id)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSString)description;
- (NSString)displayUUID;
- (NSString)uniqueProductIdentifier;
- (__IOHIDService)IOHIDService;
- (id)_disappearanceObservers;
- (id)_initForTestingWithSenderID:(unint64_t)a3 setUpInitialProperties:(BOOL)a4;
- (id)_workQueue;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initForSimulatorWithDisplayUUID:(id)a3;
- (id)propertyForKey:(id)a3;
- (id)propertyOfClass:(Class)a3 forKey:(id)a4;
- (id)senderDescriptorForEventType:(unsigned int)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)eventSource;
- (int64_t)serviceStatus;
- (uint64_t)_isProbablyHeadset;
- (unint64_t)senderID;
- (unsigned)primaryUsage;
- (unsigned)primaryUsagePage;
- (void)_serviceWasRemoved;
- (void)_setUpInitialProperties;
- (void)_workQueue_startIOServiceRemovalNotifications;
- (void)_workQueue_stopIOServiceRemovalNotifications;
- (void)addDisappearanceObserver:(id)a3 queue:(id)a4;
- (void)asyncSetProperties:(id)a3;
- (void)asyncSetProperty:(id)a3 forKey:(id)a4;
- (void)asyncSetProperty:(id)a3 forKey:(id)a4 andDelayForSeconds:(double)a5;
- (void)dealloc;
- (void)removeDisappearanceObserver:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBuiltIn:(BOOL)a3;
- (void)setDisplayUUID:(id)a3;
- (void)setElementValue:(unsigned int)a3 forUsagePage:(unsigned int)a4 usage:(unsigned int)a5;
- (void)setEventSource:(int)a3;
- (void)setIOHIDService:(__IOHIDService *)a3;
- (void)setPrimaryUsage:(unsigned int)a3;
- (void)setPrimaryUsagePage:(unsigned int)a3;
- (void)setSenderDescriptor:(id)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setServiceStatus:(int64_t)a3;
@end

@implementation BKIOHIDService

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (id)senderDescriptorForEventType:(unsigned int)a3
{
  uint64_t v3 = 80;
  if (a3 == 3) {
    uint64_t v3 = 56;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

- (NSString)description
{
  return (NSString *)[(BKIOHIDService *)self descriptionWithMultilinePrefix:0];
}

- (BKSHIDEventSenderDescriptor)senderDescriptor
{
  return self->_senderDescriptor;
}

- (BOOL)isBuiltIn
{
  return self->_builtIn;
}

- (int)eventSource
{
  return self->_eventSource;
}

uint64_t __33__BKIOHIDService_propertyForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = IOHIDServiceGetProperty();

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__BKIOHIDService__workQueue_serviceWasRemoved__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) serviceDidDisappear:*(void *)(a1 + 40)];
}

uint64_t __32__BKIOHIDService_setProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 96);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__BKIOHIDService_setProperties___block_invoke_2;
  v5[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
  v5[4] = v3;
  return [v1 enumerateKeysAndObjectsUsingBlock:v5];
}

uint64_t __36__BKIOHIDService__serviceWasRemoved__block_invoke(uint64_t result)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(result + 32), "_workQueue_stopIOServiceRemovalNotifications");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v2 = *(id *)(v1 + 48);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v15;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = *(NSObject **)(*((void *)&v14 + 1) + 8 * v6);
          if (v7)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&v7[1].isa);
            v7 = objc_loadWeakRetained((id *)&v7[2].isa);
            if (v7) {
              BOOL v9 = WeakRetained == 0;
            }
            else {
              BOOL v9 = 1;
            }
            if (!v9)
            {
              v11[0] = MEMORY[0x1E4F143A8];
              v11[1] = 3221225472;
              v11[2] = __46__BKIOHIDService__workQueue_serviceWasRemoved__block_invoke;
              v11[3] = &unk_1E68718D8;
              id WeakRetained = WeakRetained;
              id v12 = WeakRetained;
              uint64_t v13 = v1;
              dispatch_async(v7, v11);
            }
          }
          else
          {
            id WeakRetained = 0;
          }

          ++v6;
        }
        while (v4 != v6);
        uint64_t v10 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v4 = v10;
      }
      while (v10);
    }

    return [*(id *)(v1 + 48) removeAllObjects];
  }
  return result;
}

- (void)_workQueue_stopIOServiceRemovalNotifications
{
  uint64_t v3 = -[BKIOHIDService _workQueue]((uint64_t)self);
  dispatch_assert_queue_V2(v3);

  workQueue_removalNotification = self->_workQueue_removalNotification;
  if (workQueue_removalNotification)
  {
    CFRelease(workQueue_removalNotification);
    self->_workQueue_removalNotification = 0;
    workQueue_willTerminateNotification = self->_workQueue_willTerminateNotification;
    if (!workQueue_willTerminateNotification) {
      goto LABEL_6;
    }
  }
  else
  {
    workQueue_willTerminateNotification = self->_workQueue_willTerminateNotification;
    if (!workQueue_willTerminateNotification) {
      return;
    }
  }
  CFRelease(workQueue_willTerminateNotification);
  self->_workQueue_willTerminateNotification = 0;
LABEL_6:
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;
}

uint64_t __32__BKIOHIDService_setProperties___block_invoke_2()
{
  return IOHIDServiceSetProperty();
}

- (void)asyncSetProperty:(id)a3 forKey:(id)a4
{
}

- (BOOL)setProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[BKIOHIDService _workQueue]((uint64_t)self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__BKIOHIDService_setProperties___block_invoke;
  v8[3] = &unk_1E68718D8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(v5, v8);

  return 0;
}

- (void)asyncSetProperty:(id)a3 forKey:(id)a4 andDelayForSeconds:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  uint64_t v10 = -[BKIOHIDService _workQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__BKIOHIDService_asyncSetProperty_forKey_andDelayForSeconds___block_invoke;
  block[3] = &unk_1E6871328;
  objc_copyWeak(v16, &location);
  id v14 = v9;
  id v15 = v8;
  v16[1] = *(id *)&a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = -[BKIOHIDService _workQueue]((uint64_t)self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__BKIOHIDService_setProperty_forKey___block_invoke;
  v12[3] = &unk_1E68712E0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (BKIOHIDService)initWithHIDServiceRef:(__IOHIDService *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hidService"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v10 = NSStringFromSelector(a2);
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544642;
      id v15 = v10;
      __int16 v16 = 2114;
      long long v17 = v12;
      __int16 v18 = 2048;
      char v19 = self;
      __int16 v20 = 2114;
      v21 = @"BKIOHIDService.m";
      __int16 v22 = 1024;
      int v23 = 240;
      __int16 v24 = 2114;
      v25 = v9;
      _os_log_error_impl(&dword_1CFDE2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CFDED1ECLL);
  }
  v13.receiver = self;
  v13.super_class = (Class)BKIOHIDService;
  uint64_t v5 = [(BKIOHIDService *)&v13 init];
  if (v5)
  {
    CFRetain(a3);
    v5->_IOHIDService = a3;
    id v6 = IOHIDServiceGetRegistryID();
    v5->_senderID = [v6 unsignedLongLongValue];
    [(BKIOHIDService *)v5 _setUpInitialProperties];
  }
  return v5;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)addDisappearanceObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[BKIOHIDService _workQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BKIOHIDService_addDisappearanceObserver_queue___block_invoke;
  block[3] = &unk_1E6871848;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)_serviceWasRemoved
{
  [(BKIOHIDService *)self setServiceStatus:2];
  uint64_t v3 = -[BKIOHIDService _workQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__BKIOHIDService__serviceWasRemoved__block_invoke;
  block[3] = &unk_1E68713E0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)setServiceStatus:(int64_t)a3
{
  self->_serviceStatus = a3;
}

void __49__BKIOHIDService_addDisappearanceObserver_queue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    uint64_t v5 = -[BKIOHIDService _workQueue]((uint64_t)v1);
    dispatch_assert_queue_V2(v5);

    if ([v1 serviceStatus] == 2)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__BKIOHIDService__workQueue_addDisappearanceObserver_queue___block_invoke;
      v10[3] = &unk_1E68718D8;
      id v11 = v3;
      id v12 = v1;
      dispatch_async(v4, v10);
    }
    else
    {
      if (!v1[6])
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v7 = v1[6];
        v1[6] = v6;
      }
      id v8 = objc_alloc_init(_BKIOHIDServiceDisappearanceObserverInfo);
      p_isa = (id *)&v8->super.isa;
      if (v8)
      {
        objc_storeWeak((id *)&v8->_observer, v3);
        objc_storeWeak(p_isa + 2, v4);
      }
      [v1[6] addObject:p_isa];
      objc_msgSend(v1, "_workQueue_startIOServiceRemovalNotifications");
    }
  }
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)_workQueue_startIOServiceRemovalNotifications
{
  id v3 = -[BKIOHIDService _workQueue]((uint64_t)self);
  dispatch_assert_queue_V2(v3);

  if (!self->_workQueue_removalNotification)
  {
    objc_storeStrong((id *)&self->_strongSelf, self);
    self->_workQueue_removalNotification = (__IOHIDNotification *)IOHIDServiceCreateRemovalNotification();
    self->_workQueue_willTerminateNotification = (__IOHIDNotification *)IOHIDServiceCreateRequestTerminationNotification();
  }
}

- (void)_setUpInitialProperties
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(BKIOHIDService *)self propertyForKey:@"displayUUID"];
  id v4 = (NSString *)[v3 copy];
  displayUUID = self->_displayUUID;
  self->_displayUUID = v4;

  id v6 = [(BKIOHIDService *)self propertyForKey:@"PrimaryUsagePage"];
  self->_uint64_t primaryUsagePage = [v6 intValue];

  id v7 = [(BKIOHIDService *)self propertyForKey:@"PrimaryUsage"];
  self->_unsigned int primaryUsage = [v7 intValue];

  id v8 = [(BKIOHIDService *)self propertyForKey:@"Authenticated"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v8 BOOLValue]) {
        self->_authenticated = 1;
      }
    }
  }
  id v9 = [(BKIOHIDService *)self propertyForKey:@"Built-In"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 BOOLValue]) {
        self->_builtIn = 1;
      }
    }
  }
  id v10 = [(BKIOHIDService *)self propertyForKey:@"IAPHIDAccessoryCategory"];
  if (v10)
  {
    id v11 = [(BKIOHIDService *)self propertyForKey:@"DeviceTypeHint"];
    if ([v11 isEqualToString:@"Mouse"])
    {
      int v12 = 11;
    }
    else
    {
      if (![v11 isEqualToString:@"Trackpad"])
      {

        unsigned int v13 = [v10 intValue];
        if (v13 > 6) {
          int v14 = 5;
        }
        else {
          int v14 = dword_1CFE05140[v13];
        }
        self->_eventSource = v14;
        goto LABEL_24;
      }
      int v12 = 12;
    }
    self->_eventSource = v12;

LABEL_24:
    self->_authenticated = 1;
    goto LABEL_25;
  }
  if (self->_builtIn)
  {
    self->_eventSource = 0;
    goto LABEL_24;
  }
  id v15 = self;
  if (![(BKIOHIDService *)v15 claimsToConformToUsagePage:1 usage:2])
  {

    if (v15->_authenticated)
    {
      if ([(BKIOHIDService *)v15 claimsToConformToUsagePage:1 usage:5])
      {
        int v21 = 4;
LABEL_83:
        v15->_eventSource = v21;
        goto LABEL_25;
      }
      if (v15->_authenticated)
      {
        if ([(BKIOHIDService *)v15 claimsToConformToUsagePage:1 usage:6])
        {
          int v21 = 3;
          goto LABEL_83;
        }
        if (v15->_authenticated)
        {
          int v21 = 5;
          goto LABEL_83;
        }
      }
    }
    v32 = [(BKIOHIDService *)v15 propertyForKey:@"AppleBluetoothRemote"];
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v33 = [v32 BOOLValue];

      if (v33)
      {
        int v21 = 8;
        goto LABEL_83;
      }
    }
    else
    {
    }
    if ([(BKIOHIDService *)v15 claimsToConformToUsagePage:1 usage:5])
    {
      int v21 = 9;
    }
    else if ([(BKIOHIDService *)v15 claimsToConformToUsagePage:1 usage:15])
    {
      int v21 = 10;
    }
    else if ([(BKIOHIDService *)v15 claimsToConformToUsagePage:11 usage:5])
    {
      int v21 = 7;
    }
    else if (-[BKIOHIDService _isProbablyHeadset](v15))
    {
      int v21 = 6;
    }
    else
    {
      if ([(BKIOHIDService *)v15 claimsToConformToUsagePage:1 usage:6])
      {
        v15->_eventSource = 1;
        goto LABEL_25;
      }
      int v21 = 2;
    }
    goto LABEL_83;
  }
  __int16 v16 = [(BKIOHIDService *)v15 propertyForKey:@"DeviceTypeHint"];
  if ([v16 isEqualToString:@"Mouse"])
  {
    int v17 = 11;
  }
  else if ([v16 isEqualToString:@"Trackpad"])
  {
    int v17 = 12;
  }
  else
  {
    int v17 = 11;
    if (self->_primaryUsagePage == 13)
    {
      if (self->_primaryUsage == 12) {
        int v17 = 12;
      }
      else {
        int v17 = 11;
      }
    }
  }
  v15->_eventSource = v17;

LABEL_25:
  id v18 = objc_alloc_init(MEMORY[0x1E4F4F388]);
  [v18 setAuthenticated:self->_authenticated];
  switch(self->_eventSource)
  {
    case 0:
      int v19 = 0;
      uint64_t v20 = 1;
      break;
    case 1:
    case 3:
      int v19 = 0;
      uint64_t v20 = 3;
      break;
    case 2:
    case 5:
      int v19 = 0;
      uint64_t v20 = 2;
      break;
    case 4:
    case 9:
      int v19 = 0;
      uint64_t v20 = 4;
      break;
    case 6:
    case 7:
      int v19 = 0;
      uint64_t v20 = 5;
      break;
    case 8:
      int v19 = 0;
      uint64_t v20 = 6;
      break;
    case 0xA:
      int v19 = 0;
      uint64_t v20 = 7;
      break;
    case 0xB:
      int v19 = 0;
      uint64_t v20 = 8;
      break;
    case 0xC:
      int v19 = 1;
      uint64_t v20 = 9;
      break;
    case 0xD:
      int v19 = 0;
      uint64_t v20 = 10;
      break;
    default:
      int v19 = 0;
      uint64_t v20 = 0;
      break;
  }
  if (self->_displayUUID)
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F4F2D0], "displayWithHardwareIdentifier:");
  }
  else
  {
    int v23 = [(BKIOHIDService *)self propertyOfClass:objc_opt_class() forKey:@"DisplayIntegrated"];
    int v24 = [v23 BOOLValue];

    if (!v24) {
      goto LABEL_45;
    }
    uint64_t v22 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
  }
  v25 = (void *)v22;
  [v18 setAssociatedDisplay:v22];

LABEL_45:
  [v18 setSenderID:self->_senderID];
  [v18 setHardwareType:v20];
  [v18 setAuthenticated:self->_authenticated];
  uint64_t primaryUsagePage = self->_primaryUsagePage;
  if (primaryUsagePage)
  {
    [v18 setPrimaryPage:primaryUsagePage primaryUsage:self->_primaryUsage];
  }
  else
  {
    v27 = BKLogHID();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      unsigned int primaryUsage = self->_primaryUsage;
      v34[0] = 67109378;
      v34[1] = primaryUsage;
      __int16 v35 = 2114;
      v36 = self;
      _os_log_error_impl(&dword_1CFDE2000, v27, OS_LOG_TYPE_ERROR, "strangeness: primary page is zero; primary usage is:%X %{public}@",
        (uint8_t *)v34,
        0x12u);
    }
  }
  objc_storeStrong((id *)&self->_senderDescriptor, v18);
  if (v19 && [(BKIOHIDService *)self claimsToConformToUsagePage:1 usage:6])
  {
    v28 = (void *)[v18 mutableCopy];
    [v28 setHardwareType:3];
    senderDescriptorForKeyboardEvents = self->_senderDescriptorForKeyboardEvents;
    self->_senderDescriptorForKeyboardEvents = (BKSHIDEventSenderDescriptor *)v28;
  }
  else
  {
    v30 = (BKSHIDEventSenderDescriptor *)v18;
    senderDescriptorForKeyboardEvents = self->_senderDescriptorForKeyboardEvents;
    self->_senderDescriptorForKeyboardEvents = v30;
  }
}

- (id)propertyForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  __int16 v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = -[BKIOHIDService _workQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BKIOHIDService_propertyForKey___block_invoke;
  block[3] = &unk_1E68712B8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_workQueue
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    id v3 = (id *)(a1 + 24);
    id Serial = *(id *)(a1 + 24);
    if (!Serial)
    {
      uint64_t v5 = [NSString stringWithFormat:@"%@-%p.workQueue", objc_opt_class(), a1];
      id Serial = (id)BSDispatchQueueCreateSerial();

      objc_storeStrong(v3, Serial);
    }
    os_unfair_lock_unlock(v2);
  }
  else
  {
    id Serial = 0;
  }

  return Serial;
}

- (id)propertyOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(BKIOHIDService *)self propertyForKey:v6];
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = BKLogHID();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      id v12 = v6;
      __int16 v13 = 2114;
      Class v14 = a3;
      __int16 v15 = 2114;
      id v16 = (id)objc_opt_class();
      id v10 = v16;
      _os_log_error_impl(&dword_1CFDE2000, v8, OS_LOG_TYPE_ERROR, "expected %{public}@ to be of class kind %{public}@, got %{public}@ instead", (uint8_t *)&v11, 0x20u);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BKIOHIDService *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKIOHIDService *)self succinctDescriptionBuilder];
  unint64_t serviceStatus = self->_serviceStatus;
  if (serviceStatus >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<bogus:%d>", self->_serviceStatus);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E68713C0[serviceStatus];
  }
  id v7 = (id)[v4 appendObject:v6 withName:@"serviceStatus"];

  id v8 = (id)[v4 appendObject:self->_IOHIDService withName:@"IOHIDService"];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"0x%llX", self->_senderID);
  id v10 = (id)[v4 appendObject:v9 withName:@"senderID"];

  id v11 = (id)[v4 appendObject:self->_displayUUID withName:@"displayUUID"];
  id v12 = NSStringFromBKSHIDEventSource();
  id v13 = (id)[v4 appendObject:v12 withName:@"eventSource"];

  Class v14 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", self->_primaryUsagePage);
  id v15 = (id)[v4 appendObject:v14 withName:@"primaryUsagePage"];

  id v16 = objc_msgSend(NSString, "stringWithFormat:", @"0x%X", self->_primaryUsage);
  id v17 = (id)[v4 appendObject:v16 withName:@"primaryUsage"];

  id v18 = (id)[v4 appendBool:self->_authenticated withName:@"authenticated"];
  id v19 = (id)[v4 appendBool:self->_builtIn withName:@"builtIn"];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)dealloc
{
  IOHIDService = self->_IOHIDService;
  if (IOHIDService) {
    CFRelease(IOHIDService);
  }
  workQueue_removalNotification = self->_workQueue_removalNotification;
  if (workQueue_removalNotification) {
    CFRelease(workQueue_removalNotification);
  }
  workQueue_willTerminateNotification = self->_workQueue_willTerminateNotification;
  if (workQueue_willTerminateNotification) {
    CFRelease(workQueue_willTerminateNotification);
  }
  v6.receiver = self;
  v6.super_class = (Class)BKIOHIDService;
  [(BKIOHIDService *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_senderDescriptorForKeyboardEvents, 0);
  objc_storeStrong((id *)&self->_workQueue_disappearanceObservers, 0);
  objc_storeStrong((id *)&self->_workQueue_do_not_touch_directly, 0);

  objc_storeStrong((id *)&self->_strongSelf, 0);
}

uint64_t __37__BKIOHIDService_setProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t result = IOHIDServiceSetProperty();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result != 0;
  return result;
}

void __61__BKIOHIDService_asyncSetProperty_forKey_andDelayForSeconds___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    IOHIDServiceSetProperty();
    id WeakRetained = v4;
    double v3 = *(double *)(a1 + 56);
    if (v3 > 0.0)
    {
      usleep((v3 * 1000000.0));
      id WeakRetained = v4;
    }
  }
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setPrimaryUsage:(unsigned int)a3
{
  self->_unsigned int primaryUsage = a3;
}

- (void)setPrimaryUsagePage:(unsigned int)a3
{
  self->_uint64_t primaryUsagePage = a3;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void)setEventSource:(int)a3
{
  self->_eventSource = a3;
}

- (void)setDisplayUUID:(id)a3
{
}

- (void)setIOHIDService:(__IOHIDService *)a3
{
  self->_IOHIDService = a3;
}

- (__IOHIDService)IOHIDService
{
  return self->_IOHIDService;
}

- (void)setSenderDescriptor:(id)a3
{
}

- (id)_disappearanceObservers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  double v3 = -[BKIOHIDService _workQueue]((uint64_t)self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__BKIOHIDService__disappearanceObservers__block_invoke;
  v6[3] = &unk_1E68713A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__BKIOHIDService__disappearanceObservers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (NSString)uniqueProductIdentifier
{
  double v3 = [(BKIOHIDService *)self propertyForKey:@"VendorID"];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v6 = v5;
    }
    else {
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
  }
  id v7 = v6;

  id v8 = [(BKIOHIDService *)self propertyForKey:@"ProductID"];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = v11;

  id v13 = [(BKIOHIDService *)self propertyForKey:@"HIDVirtualDevice"];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = v16;

  if ([v17 BOOLValue]) {
    [NSString stringWithFormat:@"%@-%@-v%@", v7, v12, v17];
  }
  else {
  id v18 = [NSString stringWithFormat:@"%@-%@", v7, v12, v20];
  }

  return (NSString *)v18;
}

- (void)removeDisappearanceObserver:(id)a3
{
  id v4 = a3;
  id v5 = -[BKIOHIDService _workQueue]((uint64_t)self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__BKIOHIDService_removeDisappearanceObserver___block_invoke;
  v7[3] = &unk_1E68718D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__BKIOHIDService_removeDisappearanceObserver___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    double v3 = -[BKIOHIDService _workQueue]((uint64_t)v1);
    dispatch_assert_queue_V2(v3);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v1[6];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(id **)(*((void *)&v13 + 1) + 8 * v8);
          if (v9) {
            id WeakRetained = objc_loadWeakRetained(v9 + 1);
          }
          else {
            id WeakRetained = 0;
          }

          if (WeakRetained == v2)
          {
            id v12 = v9;

            if (!v9) {
              goto LABEL_17;
            }
            objc_msgSend(v1[6], "removeObject:", v12, (void)v13);
            goto LABEL_18;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v11 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v6 = v11;
        if (v11) {
          continue;
        }
        break;
      }
    }

LABEL_17:
    id v12 = 0;
LABEL_18:
    if (!objc_msgSend(v1[6], "count", (void)v13)) {
      objc_msgSend(v1, "_workQueue_stopIOServiceRemovalNotifications");
    }
  }
}

uint64_t __60__BKIOHIDService__workQueue_addDisappearanceObserver_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) serviceDidDisappear:*(void *)(a1 + 40)];
}

- (void)setElementValue:(unsigned int)a3 forUsagePage:(unsigned int)a4 usage:(unsigned int)a5
{
  uint64_t v9 = -[BKIOHIDService _workQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__BKIOHIDService_setElementValue_forUsagePage_usage___block_invoke;
  block[3] = &unk_1E6871378;
  void block[4] = self;
  unsigned int v11 = a4;
  unsigned int v12 = a5;
  unsigned int v13 = a3;
  dispatch_async(v9, block);
}

void __53__BKIOHIDService_setElementValue_forUsagePage_usage___block_invoke(_DWORD *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = IOHIDServiceSetElementValue();
  if (v2)
  {
    int v3 = v2;
    id v4 = BKLogHID();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = a1[11];
      int v5 = a1[12];
      int v7 = a1[10];
      v8[0] = 67109888;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = v7;
      __int16 v11 = 1024;
      int v12 = v6;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_error_impl(&dword_1CFDE2000, v4, OS_LOG_TYPE_ERROR, "setElementValue:(%X) page:%X usage:%X failed:%X", (uint8_t *)v8, 0x1Au);
    }
  }
}

- (void)asyncSetProperties:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = -[BKIOHIDService _workQueue]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__BKIOHIDService_asyncSetProperties___block_invoke;
  block[3] = &unk_1E6871350;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__BKIOHIDService_asyncSetProperties___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 12);
    int v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__BKIOHIDService_asyncSetProperties___block_invoke_2;
    v6[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
    v6[4] = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v6];
  }
}

uint64_t __37__BKIOHIDService_asyncSetProperties___block_invoke_2()
{
  return IOHIDServiceSetProperty();
}

- (BOOL)isVirtualService
{
  int v2 = [(BKIOHIDService *)self propertyOfClass:objc_opt_class() forKey:@"HIDVirtualDevice"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)claimsToConformToUsagePage:(unsigned __int16)a3 usage:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_primaryUsagePage == a3 && self->_primaryUsage == a4) {
    return 1;
  }
  [(BKIOHIDService *)self propertyForKey:@"DeviceUsagePairs"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v29 = v4;
    uint64_t v9 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        __int16 v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        id v13 = v11;
        if (v12)
        {
          if (objc_opt_isKindOfClass()) {
            int v14 = v13;
          }
          else {
            int v14 = 0;
          }
        }
        else
        {
          int v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          long long v16 = [v15 objectForKeyedSubscript:@"DeviceUsagePage"];
          uint64_t v17 = objc_opt_class();
          id v18 = v16;
          if (v17) {
            id v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v18 : 0;
          }
          else {
            id v19 = 0;
          }
          id v20 = v19;

          int v21 = [v15 objectForKeyedSubscript:@"DeviceUsage"];
          uint64_t v22 = objc_opt_class();
          id v23 = v21;
          if (v22) {
            id v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;
          }
          else {
            id v24 = 0;
          }
          id v25 = v24;

          unsigned __int16 v26 = [v20 intValue];
          unsigned __int16 v27 = [v25 intValue];

          if (v5 == v26 && v27 == v29)
          {

            BOOL v6 = 1;
            goto LABEL_31;
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 0;
LABEL_31:

  return v6;
}

- (id)succinctDescription
{
  int v2 = [(BKIOHIDService *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

- (id)initForSimulatorWithDisplayUUID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKIOHIDService;
  int v5 = [(BKIOHIDService *)&v11 init];
  BOOL v6 = v5;
  if (v5)
  {
    if (v5->_IOHIDService)
    {
      uint64_t v7 = IOHIDServiceGetRegistryID();
      v6->_senderID = [v7 unsignedLongLongValue];
    }
    uint64_t v8 = [v4 copy];
    displayUUID = v6->_displayUUID;
    v6->_displayUUID = (NSString *)v8;
  }
  return v6;
}

- (id)_initForTestingWithSenderID:(unint64_t)a3 setUpInitialProperties:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)BKIOHIDService;
  BOOL v6 = [(BKIOHIDService *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_senderID = a3;
    if (v4) {
      [(BKIOHIDService *)v6 _setUpInitialProperties];
    }
  }
  return v7;
}

- (uint64_t)_isProbablyHeadset
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 propertyForKey:@"DeviceTypeHint"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v2 = [v1 isEqual:@"Headset"];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end
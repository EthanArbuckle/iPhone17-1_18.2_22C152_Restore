@interface CUTNetworkInterfaceListener
+ (id)sharedInstance;
- (CUTNetworkInterfaceListener)allocWithZone:(_NSZone *)a3;
- (CUTNetworkInterfaceListener)init;
- (NSSet)IPv4Addresses;
- (NSSet)IPv6Addresses;
- (int)cellState;
- (int)wifiState;
- (void)_handleNetworkChange:(id)a3;
- (void)_notifyDelegatesOfAddressChange:(id)a3 isIPv6:(BOOL)a4;
- (void)_notifyDelegatesOfCellChange:(int)a3;
- (void)_notifyDelegatesOfWifiChange:(int)a3;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
@end

@implementation CUTNetworkInterfaceListener

+ (id)sharedInstance
{
  if (qword_1EB272A88 != -1) {
    dispatch_once(&qword_1EB272A88, &unk_1EF6C4240);
  }
  v2 = (void *)qword_1E95CDE60;
  return v2;
}

- (CUTNetworkInterfaceListener)init
{
  v13.receiver = self;
  v13.super_class = (Class)CUTNetworkInterfaceListener;
  id v2 = [(CUTNetworkInterfaceListener *)&v13 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A6249B10]();
    *((void *)v2 + 4) = -1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cut.delegate", 0);
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    context.version = 0;
    context.info = v2;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    context.copyDescription = 0;
    SCDynamicStoreRef v6 = SCDynamicStoreCreate(0, @"com.apple.cutnetworkinterfacelistener", (SCDynamicStoreCallBack)sub_1A35591A0, &context);
    *((void *)v2 + 1) = v6;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"State:/Network/Interface/[^/]+/IPv4", @"State:/Network/Interface/[^/]+/IPv6", 0);
      CFArrayRef v7 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(*((SCDynamicStoreRef *)v2 + 1), 0, v7))
      {
        v8 = (const __SCDynamicStore *)*((void *)v2 + 1);
        v9 = dispatch_get_global_queue(0, 0);
        SCDynamicStoreSetDispatchQueue(v8, v9);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
          sub_1A3564A90();
        }
        CFRelease(*((CFTypeRef *)v2 + 1));
        *((void *)v2 + 1) = 0;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      sub_1A3564A48();
    }
    id v10 = v2;
  }

  return (CUTNetworkInterfaceListener *)v2;
}

- (void)dealloc
{
  CFRelease(self->_dynamicStore);
  v3.receiver = self;
  v3.super_class = (Class)CUTNetworkInterfaceListener;
  [(CUTNetworkInterfaceListener *)&v3 dealloc];
}

- (CUTNetworkInterfaceListener)allocWithZone:(_NSZone *)a3
{
  return (CUTNetworkInterfaceListener *)(id)qword_1E95CDE60;
}

- (void)_handleNetworkChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      uint64_t v19 = v5;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(__CFString **)(*((void *)&v21 + 1) + 8 * v7);
        int v9 = [(__CFString *)v8 hasPrefix:@"State:/Network/Interface/en", v19];
        int v10 = [(__CFString *)v8 hasPrefix:@"State:/Network/Interface/pdp_ip"];
        int v11 = v10;
        if ((v9 & 1) != 0 || v10)
        {
          uint64_t v12 = [(__CFString *)v8 hasSuffix:@"/IPv6"];
          CFPropertyListRef v13 = SCDynamicStoreCopyValue((SCDynamicStoreRef)self->_dynamicStore, v8);
          if (v13)
          {
            v14 = (void *)v13;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (TypeID == CFGetTypeID(v14))
            {
              v16 = [v14 objectForKey:@"Addresses"];
              v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
              [(CUTNetworkInterfaceListener *)self _notifyDelegatesOfAddressChange:v17 isIPv6:v12];
            }
            CFRelease(v14);
            uint64_t v18 = 1;
            uint64_t v5 = v19;
            if (v11)
            {
LABEL_12:
              [(CUTNetworkInterfaceListener *)self _notifyDelegatesOfCellChange:v18];
              goto LABEL_16;
            }
          }
          else
          {
            uint64_t v18 = 0;
            if (v11) {
              goto LABEL_12;
            }
          }
          if (v9) {
            [(CUTNetworkInterfaceListener *)self _notifyDelegatesOfWifiChange:v18];
          }
        }
LABEL_16:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)_notifyDelegatesOfWifiChange:(int)a3
{
  delegateQueue = self->_delegateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A355947C;
  v4[3] = &unk_1E5AFEBC0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(delegateQueue, v4);
}

- (void)_notifyDelegatesOfCellChange:(int)a3
{
  delegateQueue = self->_delegateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A3559630;
  v4[3] = &unk_1E5AFEBC0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(delegateQueue, v4);
}

- (void)_notifyDelegatesOfAddressChange:(id)a3 isIPv6:(BOOL)a4
{
  id v6 = a3;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A3559814;
  block[3] = &unk_1E5AFEBE8;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, block);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A3559A28;
  v7[3] = &unk_1E5AFEC10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A3559B44;
  v7[3] = &unk_1E5AFEC10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, v7);
}

- (int)wifiState
{
  return self->_wifiState;
}

- (int)cellState
{
  return self->_cellState;
}

- (NSSet)IPv6Addresses
{
  return self->_IPv6Addresses;
}

- (NSSet)IPv4Addresses
{
  return self->_IPv4Addresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IPv4Addresses, 0);
  objc_storeStrong((id *)&self->_IPv6Addresses, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegateMap, 0);
}

@end
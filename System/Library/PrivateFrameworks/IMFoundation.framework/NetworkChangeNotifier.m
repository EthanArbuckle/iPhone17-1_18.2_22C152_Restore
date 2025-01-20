@interface NetworkChangeNotifier
+ (BOOL)enableNotifications;
+ (id)sharedInstance;
+ (void)disableNotifications;
- (BOOL)_listenForChanges;
- (BOOL)isNetworkUp;
- (BOOL)isPrimaryCellular;
- (BOOL)lastPostedNetworkUp;
- (IMConnectionMonitor)connectionMonitor;
- (NSArray)myIPAddresses;
- (NSArray)myIPs;
- (NSString)myGatewayAddress;
- (NSString)myIP;
- (NSString)myIPAddress;
- (NetworkChangeNotifier)init;
- (__SCDynamicStore)getDynamicStore;
- (__SCDynamicStore)store;
- (id)primaryInterfaceName;
- (int)linkQualityValueForInterface:(id)a3;
- (int)linkQualityValueForInterfaceType:(unint64_t)a3;
- (unint64_t)linkQualityForInterfaceType:(unint64_t)a3;
- (void)_clearIPCache;
- (void)connectionMonitorDidUpdate:(id)a3;
- (void)dealloc;
- (void)setConnectionMonitor:(id)a3;
- (void)setLastPostedNetworkUp:(BOOL)a3;
- (void)setMyIP:(id)a3;
- (void)setMyIPs:(id)a3;
- (void)setStore:(__SCDynamicStore *)a3;
@end

@implementation NetworkChangeNotifier

+ (id)sharedInstance
{
  objc_msgSend_enableNotifications(a1, a2, v2, v3);
  v4 = (void *)qword_1EB273838;
  return v4;
}

+ (BOOL)enableNotifications
{
  uint64_t v2 = qword_1EB273838;
  if (!qword_1EB273838)
  {
    id v3 = objc_alloc_init((Class)a1);
    v4 = (void *)qword_1EB273838;
    qword_1EB273838 = (uint64_t)v3;

    uint64_t v2 = qword_1EB273838;
  }
  return v2 != 0;
}

+ (void)disableNotifications
{
  uint64_t v2 = (void *)qword_1EB273838;
  qword_1EB273838 = 0;
}

- (void)_clearIPCache
{
  myIPs = self->_myIPs;
  self->_myIPs = 0;

  myIP = self->_myIP;
  self->_myIP = 0;
}

- (BOOL)_listenForChanges
{
  if (self->_store)
  {
    _IMWarn(@"Illegal second call to _listenForChanges", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v40);
    return 1;
  }
  else
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    v10 = SCDynamicStoreCreate(0, @"com.apple.messagingagent", (SCDynamicStoreCallBack)sub_1918B5EFC, &context);
    self->_store = v10;
    if (v10)
    {
      v18 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
      v20 = CFArrayCreateMutable(0, 0, v18);
      SCDynamicStoreSetDispatchQueue(self->_store, MEMORY[0x1E4F14428]);
      CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F41AC8];
      CFStringRef v22 = (const __CFString *)*MEMORY[0x1E4F41B10];
      CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
      CFArrayAppendValue(Mutable, NetworkGlobalEntity);
      if (NetworkGlobalEntity) {
        CFRelease(NetworkGlobalEntity);
      }
      CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v21, (CFStringRef)*MEMORY[0x1E4F41AB8], v22);
      CFArrayAppendValue(v20, NetworkInterfaceEntity);
      if (NetworkInterfaceEntity) {
        CFRelease(NetworkInterfaceEntity);
      }
      CFStringRef v25 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v21, (CFStringRef)*MEMORY[0x1E4F41B08]);
      CFArrayAppendValue(Mutable, v25);
      if (v25) {
        CFRelease(v25);
      }
      CFStringRef v26 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v21, (CFStringRef)*MEMORY[0x1E4F41B40]);
      CFArrayAppendValue(Mutable, v26);
      if (v26) {
        CFRelease(v26);
      }
      int v34 = SCDynamicStoreSetNotificationKeys(self->_store, Mutable, v20);
      BOOL v8 = v34 != 0;
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v20) {
        CFRelease(v20);
      }
      if (!v34) {
        _IMWarn(@"*** SCDynamicStoreSetNotificationKeys() failed", v27, v28, v29, v30, v31, v32, v33, v40);
      }
      v35 = [IMConnectionMonitor alloc];
      v37 = (IMConnectionMonitor *)objc_msgSend_initWithRemoteHost_delegate_(v35, v36, 0, (uint64_t)self);
      connectionMonitor = self->_connectionMonitor;
      self->_connectionMonitor = v37;
    }
    else
    {
      _IMWarn(@"*** %s:%d SCDynamicStoreCreate() failed", v11, v12, v13, v14, v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/IMFoundation/IMFoundation/NetworkChangeNotifier.m");
      return 0;
    }
  }
  return v8;
}

- (NetworkChangeNotifier)init
{
  v20.receiver = self;
  v20.super_class = (Class)NetworkChangeNotifier;
  uint64_t v2 = [(NetworkChangeNotifier *)&v20 init];
  uint64_t v6 = v2;
  if (v2)
  {
    if (!objc_msgSend__listenForChanges(v2, v3, v4, v5))
    {
      v18 = 0;
      goto LABEL_7;
    }
    v10 = objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
    objc_msgSend__addEarlyListener_(v10, v11, (uint64_t)v6, v12);

    if (_IMWillLog(@"Network")) {
      _IMAlwaysLog(0, @"Network", @"Now listening for network changes", v13, v14, v15, v16, v17, (char)v20.receiver);
    }
  }
  v18 = v6;
LABEL_7:

  return v18;
}

- (void)dealloc
{
  objc_msgSend_clear(self->_connectionMonitor, a2, v2, v3);
  objc_msgSend_setDelegate_(self->_connectionMonitor, v5, 0, v6);
  v10 = objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
  objc_msgSend__removeEarlyListener_(v10, v11, (uint64_t)self, v12);

  uint64_t v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
  objc_msgSend_removeObserver_name_object_(v16, v17, (uint64_t)self, 0, 0);

  store = self->_store;
  if (store)
  {
    SCDynamicStoreSetDispatchQueue(store, 0);
    v19 = self->_store;
    if (v19)
    {
      CFRelease(v19);
      self->_store = 0;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)NetworkChangeNotifier;
  [(NetworkChangeNotifier *)&v20 dealloc];
}

- (NSArray)myIPAddresses
{
  myIPs = self->_myIPs;
  if (myIPs) {
    uint64_t v3 = myIPs;
  }
  return myIPs;
}

- (NSString)myGatewayAddress
{
  uint64_t v4 = objc_msgSend_sharedInstance(NetworkChangeNotifier, a2, v2, v3);
  DynamicStore = (const __SCDynamicStore *)objc_msgSend_getDynamicStore(v4, v5, v6, v7);

  if (DynamicStore)
  {
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
    uint64_t v12 = (void *)SCDynamicStoreCopyValue(DynamicStore, NetworkGlobalEntity);
    if (NetworkGlobalEntity) {
      CFRelease(NetworkGlobalEntity);
    }
    if (v12)
    {
      uint64_t v13 = objc_msgSend_objectForKey_(v12, v10, @"Router", v11);
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  return (NSString *)v13;
}

- (NSString)myIPAddress
{
  return 0;
}

- (__SCDynamicStore)getDynamicStore
{
  return self->_store;
}

- (int)linkQualityValueForInterfaceType:(unint64_t)a3
{
  if (a3 == 3) {
    uint64_t v3 = @"pdp_ip0";
  }
  else {
    uint64_t v3 = @"en0";
  }
  return ((uint64_t (*)(NetworkChangeNotifier *, char *, __CFString *))MEMORY[0x1F4181798])(self, sel_linkQualityValueForInterface_, v3);
}

- (int)linkQualityValueForInterface:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  int valuePtr = 0;
  uint64_t v5 = (const void *)*MEMORY[0x1E4F41B38];
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], v4, (CFStringRef)*MEMORY[0x1E4F41B38]);
  CFDictionaryRef v7 = (const __CFDictionary *)SCDynamicStoreCopyValue(self->_store, NetworkInterfaceEntity);
  CFDictionaryRef v8 = v7;
  if (v7)
  {
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFDictionaryGetTypeID())
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v8, v5);
      if (Value)
      {
        CFNumberRef v11 = Value;
        CFTypeID v12 = CFGetTypeID(Value);
        if (v12 == CFNumberGetTypeID()) {
          CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
        }
      }
    }
  }
  if (NetworkInterfaceEntity) {
    CFRelease(NetworkInterfaceEntity);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (_IMWillLog(@"Network")) {
    _IMAlwaysLog(0, @"Network", @"Link quality for interface %@ is %d", v13, v14, v15, v16, v17, (char)v4);
  }
  int v18 = valuePtr;

  return v18;
}

- (unint64_t)linkQualityForInterfaceType:(unint64_t)a3
{
  int v4 = objc_msgSend_linkQualityValueForInterfaceType_(self, a2, a3, v3);
  if (v4 <= 99) {
    return v4 > 49;
  }
  else {
    return 2;
  }
}

- (void)connectionMonitorDidUpdate:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (self->_connectionMonitor == a3)
  {
    uint64_t isImmediatelyReachable = objc_msgSend_isImmediatelyReachable(a3, a2, (uint64_t)a3, v3);
    if (_IMWillLog(@"Network"))
    {
      uint64_t v13 = @"NO";
      if (isImmediatelyReachable) {
        uint64_t v13 = @"YES";
      }
      _IMAlwaysLog(0, @"Network", @"NetworkChangeNotifier isNetworkUp: %@", v8, v9, v10, v11, v12, (char)v13);
    }
    if (self->_lastPostedNetworkUp != isImmediatelyReachable)
    {
      self->_lastPostedNetworkUp = isImmediatelyReachable;
      uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
      CFStringRef v21 = @"__kIMNetworkChangedNotificationNetworkAvailableKey";
      uint64_t v17 = objc_msgSend_numberWithBool_(NSNumber, v15, isImmediatelyReachable, v16);
      v22[0] = v17;
      v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v22, (uint64_t)&v21, 1);
      objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v14, v20, @"__kIMNetworkChangedNotification", 0, v19);
    }
  }
}

- (BOOL)isNetworkUp
{
  return objc_msgSend_isImmediatelyReachable(self->_connectionMonitor, a2, v2, v3);
}

- (BOOL)isPrimaryCellular
{
  BOOL v3 = 0;
  sub_1918B6510(self->_store, (char *)&v3, 0);
  return v3;
}

- (id)primaryInterfaceName
{
  id v4 = 0;
  sub_1918B6510(self->_store, 0, (CFTypeRef *)&v4);
  id v2 = v4;
  return v2;
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void)setStore:(__SCDynamicStore *)a3
{
  self->_store = a3;
}

- (NSString)myIP
{
  return self->_myIP;
}

- (void)setMyIP:(id)a3
{
}

- (NSArray)myIPs
{
  return self->_myIPs;
}

- (void)setMyIPs:(id)a3
{
}

- (IMConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (BOOL)lastPostedNetworkUp
{
  return self->_lastPostedNetworkUp;
}

- (void)setLastPostedNetworkUp:(BOOL)a3
{
  self->_lastPostedNetworkUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_myIPs, 0);
  objc_storeStrong((id *)&self->_myIP, 0);
}

@end
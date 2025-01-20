@interface IDSClientDelegate
- (BOOL)updateDeviceSet:(id)a3 withMessage:(id)a4 withIdentifier:(id *)a5;
- (BOOL)validateSWonDevice:(id)a3;
- (IDSClientDelegate)initWithServiceName:(id)a3 codeName:(const char *)a4 localService:(BOOL)a5 validate:(id)a6 callback:(id)a7 devices:(id)a8 queue:(dispatch_queue_s *)object registry:(const void *)a10;
- (NSArray)fBootstrappedDeviceUuids;
- (NSArray)fConnectedDevices;
- (NSArray)fRegisteredDevices;
- (NSArray)fSupportedDevices;
- (NSMutableArray)fPreBootstrappedDeviceUuids;
- (NSMutableDictionary)fBootstrapInfo;
- (NSMutableDictionary)fCachedUpdate;
- (NSMutableDictionary)fSentMsgs;
- (NSString)fPersistedDeviceListKey;
- (const)getLogPrefix;
- (id).cxx_construct;
- (id)checkAgainstSupported:(id)a3;
- (id)copyWatchDeviceID;
- (id)targetDevices;
- (id)validateSWonDevices:(id)a3;
- (void)addBootstrappedDevice:(id)a3;
- (void)checkForBootstrapDevices;
- (void)dealloc;
- (void)device:(id)a3 updatedWithIdentifier:(id)a4;
- (void)dumpState;
- (void)invalidateBootstrapDevicesIfNeeded;
- (void)invokeCallbackOnDevsChanged;
- (void)invokeCallbackWithDict:(id)a3 changedKeys:(id)a4;
- (void)recalculateConnectedDevices;
- (void)recalculateSupportedDevices;
- (void)sendMessage:(id)a3;
- (void)sendMessageToDevice:(id)a3 withName:(id)a4 andValue:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setBootstrapInformation:(id)a3;
- (void)setFBootstrapInfo:(id)a3;
- (void)setFBootstrappedDeviceUuids:(id)a3;
- (void)setFCachedUpdate:(id)a3;
- (void)setFConnectedDevices:(id)a3;
- (void)setFPersistedDeviceListKey:(id)a3;
- (void)setFPreBootstrappedDeviceUuids:(id)a3;
- (void)setFRegisteredDevices:(id)a3;
- (void)setFSentMsgs:(id)a3;
- (void)setFSupportedDevices:(id)a3;
- (void)setupBootstrappedDevices;
- (void)update:(id)a3 withValue:(id)a4;
- (void)updateBoostrapInformation:(id)a3;
- (void)updateBootstrappedDevices:(id)a3;
- (void)updateDeviceWithBootstrapInfo:(id)a3;
- (void)updateWithDict:(id)a3;
- (void)watchDidPair:(id)a3;
@end

@implementation IDSClientDelegate

- (const)getLogPrefix
{
  return (const char *)*((void *)self + 2);
}

- (void)invokeCallbackWithDict:(id)a3 changedKeys:(id)a4
{
  v7 = (const void *)*((void *)self + 5);
  if (v7) {
    v8 = _Block_copy(v7);
  }
  else {
    v8 = 0;
  }
  CFArrayRef v32 = (const __CFArray *)a4;
  CFDictionaryRef v33 = 0;
  if (a4) {
    CFRetain(a4);
  }
  if (a3)
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)a3);
    v10 = (void **)v33;
    CFDictionaryRef v33 = MutableCopy;
    keys = v10;
    sub_10005717C((const void **)&keys);
    int v11 = CFDictionaryContainsKey(v33, @"BootstrapPacket");
    BOOL v12 = v11 != 0;
    if (v11)
    {
      CFDictionaryRemoveValue(v33, @"BootstrapPacket");
      if (v32 ? sub_100083F10 : 0)
      {
        CFMutableArrayRef theArray = CFArrayCreateMutableCopy(0, 0, v32);
        v34.length = CFArrayGetCount(theArray);
        v34.location = 0;
        CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(theArray, v34, @"BootstrapPacket");
        if (FirstIndexOfValue != -1)
        {
          CFArrayRemoveValueAtIndex(theArray, FirstIndexOfValue);
          sub_100044D6C(&v31, (CFTypeRef *)&theArray);
          keys = (void **)v32;
          CFArrayRef v15 = v31;
          CFArrayRef v31 = 0;
          CFArrayRef v32 = v15;
          sub_100044D00((const void **)&keys);
          sub_100044D00((const void **)&v31);
        }
        sub_1000440D4((const void **)&theArray);
      }
    }
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a3);
    keys = 0;
    v29 = 0;
    uint64_t v30 = 0;
    sub_10019E8F0(&keys, Count);
    CFMutableArrayRef theArray = 0;
    CFMutableArrayRef v26 = 0;
    uint64_t v27 = 0;
    sub_10004EE3C(&theArray, Count);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)a3, (const void **)keys, (const void **)theArray);
    if (Count >= 1)
    {
      for (uint64_t i = 0; i != Count; ++i)
      {
        CFTypeID v18 = CFGetTypeID(*((CFTypeRef *)theArray + i));
        if (v18 == CFStringGetTypeID()) {
          CFDictionaryRemoveValue(v33, keys[i]);
        }
      }
    }
    if (theArray)
    {
      CFMutableArrayRef v26 = theArray;
      operator delete(theArray);
    }
    if (keys)
    {
      v29 = keys;
      operator delete(keys);
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10029BBCC;
  block[3] = &unk_1019B33B8;
  if (v8) {
    v19 = _Block_copy(v8);
  }
  else {
    v19 = 0;
  }
  aBlock = v19;
  CFDictionaryRef v22 = v33;
  if (v33) {
    CFRetain(v33);
  }
  CFArrayRef v23 = v32;
  if (v32) {
    CFRetain(v32);
  }
  BOOL v24 = v12;
  dispatch_async(*((dispatch_queue_t *)self + 3), block);
  sub_100044D00((const void **)&v23);
  sub_10005717C((const void **)&v22);
  if (aBlock) {
    _Block_release(aBlock);
  }
  sub_100044D00((const void **)&v32);
  sub_10005717C((const void **)&v33);
  if (v8) {
    _Block_release(v8);
  }
}

- (void)invokeCallbackOnDevsChanged
{
  v2 = (const void *)*((void *)self + 6);
  if (v2)
  {
    _Block_copy(v2);
    operator new();
  }
}

- (IDSClientDelegate)initWithServiceName:(id)a3 codeName:(const char *)a4 localService:(BOOL)a5 validate:(id)a6 callback:(id)a7 devices:(id)a8 queue:(dispatch_queue_s *)object registry:(const void *)a10
{
  v25.receiver = self;
  v25.super_class = (Class)IDSClientDelegate;
  CFArrayRef v15 = [(IDSClientDelegate *)&v25 init];
  v16 = v15;
  if (v15)
  {
    *((void *)v15 + 2) = a4;
    if (a6) {
      v17 = _Block_copy(a6);
    }
    else {
      v17 = 0;
    }
    CFTypeID v18 = (const void *)*((void *)v16 + 4);
    *((void *)v16 + 4) = v17;
    if (v18) {
      _Block_release(v18);
    }
    if (a7) {
      v19 = _Block_copy(a7);
    }
    else {
      v19 = 0;
    }
    v20 = (const void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = v19;
    if (v20) {
      _Block_release(v20);
    }
    if (a8) {
      v21 = _Block_copy(a8);
    }
    else {
      v21 = 0;
    }
    CFDictionaryRef v22 = (const void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v21;
    if (v22) {
      _Block_release(v22);
    }
    if (object) {
      dispatch_retain((dispatch_object_t)object);
    }
    CFArrayRef v23 = *((void *)v16 + 3);
    *((void *)v16 + 3) = object;
    if (v23) {
      dispatch_release(v23);
    }
    *((unsigned char *)v16 + 56) = a5;
    *((_DWORD *)v16 + 15) = 0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];
  [*((id *)self + 1) removeDelegate:self];

  *((void *)self + 1) = 0;
  [(IDSClientDelegate *)self setFBootstrapInfo:0];
  [(IDSClientDelegate *)self setFSupportedDevices:0];
  [(IDSClientDelegate *)self setFConnectedDevices:0];
  [(IDSClientDelegate *)self setFRegisteredDevices:0];
  [(IDSClientDelegate *)self setFPreBootstrappedDeviceUuids:0];
  [(IDSClientDelegate *)self setFBootstrappedDeviceUuids:0];
  [(IDSClientDelegate *)self setFPersistedDeviceListKey:0];
  [(IDSClientDelegate *)self setFSentMsgs:0];
  [(IDSClientDelegate *)self setFCachedUpdate:0];
  v4.receiver = self;
  v4.super_class = (Class)IDSClientDelegate;
  [(IDSClientDelegate *)&v4 dealloc];
}

- (void)watchDidPair:(id)a3
{
  v3 = *((void *)self + 3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10029CE78;
  block[3] = &unk_1019B3470;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)recalculateConnectedDevices
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = [(IDSClientDelegate *)self fSupportedDevices];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        if (v9 && [*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) isConnected]) {
          [v3 addObject:v9];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v6);
  }
  v10 = (os_log_t *)*((void *)self + 8);
  int v11 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(IDSClientDelegate *)self getLogPrefix];
    id v13 = [v3 count];
    *(_DWORD *)buf = 136315650;
    v19 = v12;
    __int16 v20 = 2080;
    v21 = " ";
    __int16 v22 = 2048;
    id v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%sSet of connected devices: %lu devices", buf, 0x20u);
    v10 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029CAF8(v10, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], v3);
  [(IDSClientDelegate *)self setFConnectedDevices:v3];
}

- (void)recalculateSupportedDevices
{
  id v3 = (id)objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v4 = [(IDSClientDelegate *)self fRegisteredDevices];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v9 modelIdentifier];
        int v11 = *((unsigned __int8 *)self + 56);
        unsigned __int8 v12 = [v10 containsString:@"Phone"];
        if (v11)
        {
          if (((v12 & 1) != 0 || [v10 containsString:@"Watch"])
            && ([v9 isDefaultPairedDevice] & 1) != 0)
          {
LABEL_15:
            [v3 addObject:v9];
            continue;
          }
        }
        else if ((v12 & 1) != 0 {
               || ([v10 containsString:@"iPad"] & 1) != 0
        }
               || ([v10 containsString:@"iPod"] & 1) != 0
               || [v10 containsString:@"Mac"])
        {
          goto LABEL_15;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }
  [(IDSClientDelegate *)self setFSupportedDevices:v3];
  id v13 = (os_log_t *)*((void *)self + 8);
  long long v14 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [(IDSClientDelegate *)self getLogPrefix];
    NSUInteger v16 = [(NSArray *)[(IDSClientDelegate *)self fSupportedDevices] count];
    *(_DWORD *)buf = 136315650;
    id v23 = v15;
    __int16 v24 = 2080;
    objc_super v25 = " ";
    __int16 v26 = 2048;
    NSUInteger v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sset of supported devices: %lu devices", buf, 0x20u);
    id v13 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029CAF8(v13, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fSupportedDevices]);
}

- (id)checkAgainstSupported:(id)a3
{
  id v4 = (id)objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = [v9 uniqueIDOverride];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        int v11 = [(IDSClientDelegate *)self fSupportedDevices];
        id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              if (objc_msgSend(v10, "isEqualToString:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)j), "uniqueIDOverride")))objc_msgSend(v4, "addObject:", v9); {
            }
              }
            id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)targetDevices
{
  if (*((unsigned char *)self + 56)) {
    return [(IDSClientDelegate *)self fConnectedDevices];
  }
  else {
    return [(IDSClientDelegate *)self fSupportedDevices];
  }
}

- (void)updateWithDict:(id)a3
{
  id v5 = (os_log_t *)*((void *)self + 8);
  id v6 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v43 = 2080;
    v44 = " ";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating with dict:", buf, 0x16u);
    id v5 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029D9CC(v5, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], a3);
  id v7 = [(IDSClientDelegate *)self validateSWonDevices:[(IDSClientDelegate *)self targetDevices]];
  if ([(IDSClientDelegate *)self fBootstrapInfo])
  {
    id v8 = (id)objc_opt_new();
    objc_msgSend(v8, "addObjectsFromArray:", -[IDSClientDelegate fBootstrappedDeviceUuids](self, "fBootstrappedDeviceUuids"));
    [(IDSClientDelegate *)self updateBoostrapInformation:a3];
    [(IDSClientDelegate *)self updateBootstrappedDevices:0];
    [(NSMutableArray *)[(IDSClientDelegate *)self fPreBootstrappedDeviceUuids] removeAllObjects];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = (id)objc_opt_new();
  id v10 = (id)objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = [v7 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v7);
        }
        long long v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v16 = [v15 uniqueIDOverride];
        long long v17 = v9;
        if (v8)
        {
          if ([v8 containsObject:v16]) {
            long long v17 = v9;
          }
          else {
            long long v17 = v10;
          }
        }
        [v17 addObject:v15];
      }
      id v12 = [v7 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v12);
  }
  if ([v9 count])
  {
    *(void *)buf = 0;
    if ([(IDSClientDelegate *)self updateDeviceSet:v9 withMessage:a3 withIdentifier:buf])
    {
      if ([(IDSClientDelegate *)self fBootstrapInfo])
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v18 = [v9 countByEnumeratingWithState:&v34 objects:v48 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v9);
              }
              [(IDSClientDelegate *)self device:*(void *)(*((void *)&v34 + 1) + 8 * (void)j) updatedWithIdentifier:*(void *)buf];
            }
            id v19 = [v9 countByEnumeratingWithState:&v34 objects:v48 count:16];
          }
          while (v19);
        }
      }
    }
  }
  if ([v10 count])
  {
    *(void *)buf = 0;
    if ([(IDSClientDelegate *)self updateDeviceSet:v10 withMessage:[(IDSClientDelegate *)self fBootstrapInfo] withIdentifier:buf])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v22 = [v10 countByEnumeratingWithState:&v30 objects:v47 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v10);
            }
            [(IDSClientDelegate *)self device:*(void *)(*((void *)&v30 + 1) + 8 * (void)k) updatedWithIdentifier:*(void *)buf];
          }
          id v23 = [v10 countByEnumeratingWithState:&v30 objects:v47 count:16];
        }
        while (v23);
      }
    }
  }
  if ([(IDSClientDelegate *)self fBootstrapInfo])
  {
    long long v26 = **((void **)self + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v27 = [(IDSClientDelegate *)self getLogPrefix];
      id v28 = [(NSMutableArray *)[(IDSClientDelegate *)self fPreBootstrappedDeviceUuids] count];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v27;
      __int16 v43 = 2080;
      v44 = " ";
      __int16 v45 = 2048;
      id v46 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdate set of pre-bootstrapped uuids: %lu devices", buf, 0x20u);
    }
  }
}

- (void)update:(id)a3 withValue:(id)a4
{
  uint64_t v8 = *((void *)self + 4);
  if (v8 && !(*(unsigned int (**)(uint64_t, id, void))(v8 + 16))(v8, a3, 0))
  {
    uint64_t v14 = **((void **)self + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v17 = [(IDSClientDelegate *)self getLogPrefix];
      __int16 v18 = 2080;
      id v19 = " ";
      __int16 v20 = 2080;
      id v21 = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating record: %s -- skipped (dup)", buf, 0x20u);
    }
    [(IDSClientDelegate *)self checkForBootstrapDevices];
  }
  else
  {
    id v9 = **((void **)self + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v17 = [(IDSClientDelegate *)self getLogPrefix];
      __int16 v18 = 2080;
      id v19 = " ";
      __int16 v20 = 2080;
      id v21 = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating record: %s", buf, 0x20u);
    }
    if (![(IDSClientDelegate *)self fCachedUpdate]) {
      [(IDSClientDelegate *)self setFCachedUpdate:(id)objc_opt_new()];
    }
    id v10 = [(IDSClientDelegate *)self fCachedUpdate];
    if (a4) {
      CFStringRef v11 = (const __CFString *)a4;
    }
    else {
      CFStringRef v11 = @"DeleteKey";
    }
    [(NSMutableDictionary *)v10 setObject:v11 forKey:a3];
    ++*((_DWORD *)self + 15);
    dispatch_time_t v12 = dispatch_time(0, 500000000);
    uint64_t v13 = *((void *)self + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10029DD28;
    block[3] = &unk_1019B3470;
    void block[4] = self;
    dispatch_after(v12, v13, block);
  }
}

- (void)sendMessageToDevice:(id)a3 withName:(id)a4 andValue:(id)a5
{
  id v9 = [(IDSClientDelegate *)self validateSWonDevices:[(IDSClientDelegate *)self targetDevices]];
  id v10 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v16 = [v15 uniqueIDOverride];
        if (!a3 || [v16 isEqualToString:a3]) {
          [v10 addObject:v15];
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v12);
  }
  id v17 = [v10 count];
  __int16 v18 = **((void **)self + 8);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      __int16 v20 = [(IDSClientDelegate *)self getLogPrefix];
      id v21 = [a4 UTF8String];
      id v22 = [a3 UTF8String];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v20;
      __int16 v35 = 2080;
      long long v36 = " ";
      __int16 v37 = 2080;
      id v38 = v21;
      __int16 v39 = 2080;
      id v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%sSending message '%s' to device: %s", buf, 0x2Au);
    }
    id v32 = a4;
    id v33 = a5;
    id v23 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *(void *)buf = 0;
    [(IDSClientDelegate *)self updateDeviceSet:v10 withMessage:v23 withIdentifier:buf];
  }
  else if (v19)
  {
    uint64_t v24 = [(IDSClientDelegate *)self getLogPrefix];
    id v25 = [a4 UTF8String];
    id v26 = [a3 UTF8String];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v24;
    __int16 v35 = 2080;
    long long v36 = " ";
    __int16 v37 = 2080;
    id v38 = v25;
    __int16 v39 = 2080;
    id v40 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%sNo destination found for message '%s' to device: %s", buf, 0x2Au);
  }
}

- (void)sendMessage:(id)a3
{
  id v6 = **((void **)self + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)&v8[4] = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v9 = 2080;
    id v10 = " ";
    __int16 v11 = 2080;
    id v12 = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sSending message: %s", v8, 0x20u);
  }
  id v7 = [(IDSClientDelegate *)self validateSWonDevices:[(IDSClientDelegate *)self targetDevices]];
  *(void *)uint64_t v8 = 0;
  [(IDSClientDelegate *)self updateDeviceSet:v7 withMessage:a3 withIdentifier:v8];
}

- (void)updateDeviceWithBootstrapInfo:(id)a3
{
  if ([(IDSClientDelegate *)self validateSWonDevice:a3])
  {
    uint64_t v6 = 0;
    id v7 = a3;
    if ([(IDSClientDelegate *)self updateDeviceSet:+[NSArray arrayWithObjects:&v7 count:1] withMessage:[(IDSClientDelegate *)self fBootstrapInfo] withIdentifier:&v6])
    {
      [(IDSClientDelegate *)self device:a3 updatedWithIdentifier:v6];
    }
  }
}

- (BOOL)updateDeviceSet:(id)a3 withMessage:(id)a4 withIdentifier:(id *)a5
{
  if (a3 && [a3 count])
  {
    __int16 v39 = a5;
    id v40 = a4;
    __int16 v9 = (os_log_t *)*((void *)self + 8);
    long long v41 = self;
    id v10 = [(IDSClientDelegate *)self getLogPrefix];
    id v11 = +[NSMutableSet set];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v12 = (char *)[a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(a3);
          }
          id v16 = (id)IDSCopyIDForDevice();
          if (v16)
          {
            [v11 addObject:v16];
          }
          else
          {
            id v17 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v47 = v10;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s IDSCopyForDevice returned nil in sCreateDestinationSet", buf, 0xCu);
            }
          }
        }
        uint64_t v13 = (char *)[a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v13);
    }
    __int16 v18 = (os_log_t *)*((void *)v41 + 8);
    BOOL v19 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = [(IDSClientDelegate *)v41 getLogPrefix];
      id v21 = [v11 count];
      id v22 = [v40 count];
      *(_DWORD *)v48 = 136315906;
      v49 = v20;
      __int16 v50 = 2080;
      v51 = " ";
      __int16 v52 = 2048;
      id v53 = v21;
      __int16 v54 = 2048;
      id v55 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdating %lu devices with message ((%lu record(s))", v48, 0x2Au);
      __int16 v18 = (os_log_t *)*((void *)v41 + 8);
    }
    sub_10029CAF8(v18, (uint64_t)[(IDSClientDelegate *)v41 getLogPrefix], a3);
    id v23 = objc_msgSend(objc_msgSend(*((id *)v41 + 1), "accounts"), "anyObject");
    if ([v40 objectForKey:@"BootstrapPacket"]) {
      uint64_t v24 = +[NSDictionary dictionaryWithObject:@"BootstrapPacket" forKey:IDSSendMessageOptionQueueOneIdentifierKey];
    }
    else {
      uint64_t v24 = 0;
    }
    *(void *)&long long v42 = 0;
    unsigned int v26 = [*((id *)v41 + 1) sendMessage:v40 fromAccount:v23 toDestinations:v11 priority:300 options:v24 identifier:v39 error:&v42];
    NSUInteger v27 = (os_log_t *)*((void *)v41 + 8);
    long long v28 = *v27;
    BOOL v29 = os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v29)
      {
        long long v30 = [(IDSClientDelegate *)v41 getLogPrefix];
        id v31 = [v11 count];
        id v32 = [*v39 UTF8String];
        *(_DWORD *)v48 = 136315906;
        v49 = v30;
        __int16 v50 = 2080;
        v51 = " ";
        __int16 v52 = 2048;
        id v53 = v31;
        __int16 v54 = 2080;
        id v55 = v32;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%s => Sending message to %lu destinations Identifier: %s; callback will follow with result",
          v48,
          0x2Au);
        NSUInteger v27 = (os_log_t *)*((void *)v41 + 8);
      }
      sub_10029D9CC(v27, (uint64_t)[(IDSClientDelegate *)v41 getLogPrefix], v40);
    }
    else if (v29)
    {
      id v33 = [(IDSClientDelegate *)v41 getLogPrefix];
      id v34 = objc_msgSend(objc_msgSend((id)v42, "description"), "UTF8String");
      *(_DWORD *)v48 = 136315650;
      v49 = v33;
      __int16 v50 = 2080;
      v51 = " ";
      __int16 v52 = 2080;
      id v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#I %s%sError sending: %s", v48, 0x20u);
    }
    __int16 v35 = **((void **)v41 + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      long long v36 = [(IDSClientDelegate *)v41 getLogPrefix];
      id v37 = objc_msgSend(objc_msgSend(v40, "description"), "UTF8String");
      *(_DWORD *)v48 = 136315650;
      v49 = v36;
      __int16 v50 = 2080;
      v51 = " ";
      __int16 v52 = 2080;
      id v53 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "#I %s%sFull sent message: %s", v48, 0x20u);
    }
  }
  else
  {
    id v25 = **((void **)self + 8);
    LOBYTE(v26) = 0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v48 = 136315394;
      v49 = [(IDSClientDelegate *)self getLogPrefix];
      __int16 v50 = 2080;
      v51 = " ";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#I %s%sSkipping update because no devices were specified.", v48, 0x16u);
      LOBYTE(v26) = 0;
    }
  }
  return v26;
}

- (void)device:(id)a3 updatedWithIdentifier:(id)a4
{
  if ([(IDSClientDelegate *)self fBootstrapInfo])
  {
    id v7 = [a3 uniqueIDOverride];
    [(NSMutableDictionary *)[(IDSClientDelegate *)self fSentMsgs] setValue:a4 forKey:v7];
    uint64_t v8 = [(IDSClientDelegate *)self fPreBootstrappedDeviceUuids];
    [(NSMutableArray *)v8 addObject:v7];
  }
}

- (void)setBootstrapInformation:(id)a3
{
  id v5 = (os_log_t *)*((void *)self + 8);
  uint64_t v6 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    id v17 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v18 = 2080;
    BOOL v19 = " ";
    __int16 v20 = 2048;
    id v21 = [a3 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sBootstrap info set (%lu record(s))", (uint8_t *)&v16, 0x20u);
    id v5 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029D9CC(v5, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], a3);
  [(IDSClientDelegate *)self setFBootstrapInfo:(id)objc_opt_new()];
  [(NSMutableDictionary *)[(IDSClientDelegate *)self fBootstrapInfo] setObject:&__kCFBooleanTrue forKey:@"BootstrapPacket"];
  id v8 = [a3 keyEnumerator];
  id v9 = [v8 nextObject];
  if (v9)
  {
    id v10 = v9;
    do
    {
      uint64_t v11 = *((void *)self + 4);
      if (!v11 || (*(unsigned int (**)(uint64_t, id, void))(v11 + 16))(v11, v10, 0)) {
        -[NSMutableDictionary setObject:forKey:](-[IDSClientDelegate fBootstrapInfo](self, "fBootstrapInfo"), "setObject:forKey:", [a3 objectForKey:v10], v10);
      }
      id v10 = [v8 nextObject];
    }
    while (v10);
  }
  id v12 = (os_log_t *)*((void *)self + 8);
  uint64_t v13 = *v12;
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(IDSClientDelegate *)self getLogPrefix];
    id v15 = [(NSMutableDictionary *)[(IDSClientDelegate *)self fBootstrapInfo] count];
    int v16 = 136315650;
    id v17 = v14;
    __int16 v18 = 2080;
    BOOL v19 = " ";
    __int16 v20 = 2048;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I %s%sinitial Bootstrap info has (%lu record(s))", (uint8_t *)&v16, 0x20u);
    id v12 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029D9CC(v12, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fBootstrapInfo]);
  [(IDSClientDelegate *)self checkForBootstrapDevices];
}

- (void)updateBoostrapInformation:(id)a3
{
  id v6 = [a3 keyEnumerator];
  id v7 = [v6 nextObject];
  if (v7)
  {
    id v8 = v7;
    do
    {
      uint64_t v9 = *((void *)self + 4);
      if (!v9 || (*(unsigned int (**)(uint64_t, id, void))(v9 + 16))(v9, v8, 0))
      {
        id v10 = [a3 objectForKey:v8];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v10 isEqualToString:@"DeleteKey"])
        {
          [(NSMutableDictionary *)[(IDSClientDelegate *)self fBootstrapInfo] removeObjectForKey:v8];
        }
        else
        {
          [(NSMutableDictionary *)[(IDSClientDelegate *)self fBootstrapInfo] setObject:v10 forKey:v8];
        }
      }
      id v8 = [v6 nextObject];
    }
    while (v8);
  }
  uint64_t v11 = (os_log_t *)*((void *)self + 8);
  id v12 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    uint64_t v14 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v15 = 2080;
    int v16 = " ";
    __int16 v17 = 2048;
    id v18 = [(NSMutableDictionary *)[(IDSClientDelegate *)self fBootstrapInfo] count];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%supdated Bootstrap info has (%lu record(s))", (uint8_t *)&v13, 0x20u);
    uint64_t v11 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029D9CC(v11, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fBootstrapInfo]);
}

- (void)dumpState
{
  id v3 = (os_log_t *)*((void *)self + 8);
  id v4 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315650;
    id v25 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v26 = 2080;
    NSUInteger v27 = " ";
    __int16 v28 = 2048;
    NSUInteger v29 = [(NSArray *)[(IDSClientDelegate *)self fRegisteredDevices] count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sRegistered Devices: %lu", (uint8_t *)&v24, 0x20u);
    id v3 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029CAF8(v3, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fRegisteredDevices]);
  if (*((unsigned char *)self + 56))
  {
    id v5 = (os_log_t *)*((void *)self + 8);
    id v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(IDSClientDelegate *)self getLogPrefix];
      NSUInteger v8 = [(NSArray *)[(IDSClientDelegate *)self fConnectedDevices] count];
      int v24 = 136315650;
      id v25 = v7;
      __int16 v26 = 2080;
      NSUInteger v27 = " ";
      __int16 v28 = 2048;
      NSUInteger v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%sConnected Devices: %lu", (uint8_t *)&v24, 0x20u);
      id v5 = (os_log_t *)*((void *)self + 8);
    }
    sub_10029CAF8(v5, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fConnectedDevices]);
  }
  uint64_t v9 = (os_log_t *)*((void *)self + 8);
  id v10 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(IDSClientDelegate *)self getLogPrefix];
    NSUInteger v12 = [(NSArray *)[(IDSClientDelegate *)self fSupportedDevices] count];
    int v24 = 136315650;
    id v25 = v11;
    __int16 v26 = 2080;
    NSUInteger v27 = " ";
    __int16 v28 = 2048;
    NSUInteger v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%sSupported devices: %lu devices", (uint8_t *)&v24, 0x20u);
    uint64_t v9 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029CAF8(v9, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fSupportedDevices]);
  int v13 = (os_log_t *)*((void *)self + 8);
  uint64_t v14 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [(IDSClientDelegate *)self getLogPrefix];
    NSUInteger v16 = [(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] count];
    int v24 = 136315650;
    id v25 = v15;
    __int16 v26 = 2080;
    NSUInteger v27 = " ";
    __int16 v28 = 2048;
    NSUInteger v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%sBootstrapped Device Uuids: %lu", (uint8_t *)&v24, 0x20u);
    int v13 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029F048(v13, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fBootstrappedDeviceUuids]);
  __int16 v17 = (os_log_t *)*((void *)self + 8);
  id v18 = *v17;
  if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v19 = [(IDSClientDelegate *)self getLogPrefix];
    id v20 = [(NSMutableArray *)[(IDSClientDelegate *)self fPreBootstrappedDeviceUuids] count];
    int v24 = 136315650;
    id v25 = v19;
    __int16 v26 = 2080;
    NSUInteger v27 = " ";
    __int16 v28 = 2048;
    NSUInteger v29 = (NSUInteger)v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%sPreBootstrapped Device Uuids: %lu", (uint8_t *)&v24, 0x20u);
    __int16 v17 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029F048(v17, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fPreBootstrappedDeviceUuids]);
  id v21 = **((void **)self + 8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [(IDSClientDelegate *)self getLogPrefix];
    id v23 = [(NSMutableDictionary *)[(IDSClientDelegate *)self fBootstrapInfo] count];
    int v24 = 136315650;
    id v25 = v22;
    __int16 v26 = 2080;
    NSUInteger v27 = " ";
    __int16 v28 = 2048;
    NSUInteger v29 = (NSUInteger)v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I %s%sBootstrap info: %lu record(s)", (uint8_t *)&v24, 0x20u);
  }
}

- (BOOL)validateSWonDevice:(id)a3
{
  if ([a3 isDefaultPairedDevice])
  {
    if ([+[NRPairedDeviceRegistry sharedInstance] getActivePairedDevice])
    {
      unsigned int v4 = NRWatchOSVersionForRemoteDevice();
      id v5 = **((void **)self + 8);
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v4 >= 0x20000)
      {
        if (v6)
        {
          int v10 = 136315394;
          uint64_t v11 = [(IDSClientDelegate *)self getLogPrefix];
          __int16 v12 = 2080;
          int v13 = " ";
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sWatch is of compatible version", (uint8_t *)&v10, 0x16u);
        }
        goto LABEL_6;
      }
      if (!v6) {
        return v6;
      }
      int v10 = 136315394;
      uint64_t v11 = [(IDSClientDelegate *)self getLogPrefix];
      __int16 v12 = 2080;
      int v13 = " ";
      NSUInteger v8 = "#I %s%sWatch is of old version - ignore";
    }
    else
    {
      id v5 = **((void **)self + 8);
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      LOBYTE(v6) = 0;
      if (!v7) {
        return v6;
      }
      int v10 = 136315394;
      uint64_t v11 = [(IDSClientDelegate *)self getLogPrefix];
      __int16 v12 = 2080;
      int v13 = " ";
      NSUInteger v8 = "#I %s%sWatch is of unknown version - ignore";
    }
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    LOBYTE(v6) = 0;
    return v6;
  }
LABEL_6:
  LOBYTE(v6) = 1;
  return v6;
}

- (id)validateSWonDevices:(id)a3
{
  id v5 = (id)objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(IDSClientDelegate *)self validateSWonDevice:v10]) {
          [v5 addObject:v10];
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)copyWatchDeviceID
{
  if (*((unsigned char *)self + 56)) {
    id v3 = [(IDSClientDelegate *)self fConnectedDevices];
  }
  else {
    id v3 = [(IDSClientDelegate *)self fRegisteredDevices];
  }
  unsigned int v4 = v3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id result = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([v9 isDefaultPairedDevice])
        {
          if ([(IDSClientDelegate *)self validateSWonDevice:v9]) {
            return [v9 uniqueIDOverride];
          }
          else {
            return 0;
          }
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)checkForBootstrapDevices
{
  if (![(IDSClientDelegate *)self fBootstrapInfo])
  {
    id v22 = **((void **)self + 8);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    id v31 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v32 = 2080;
    id v33 = " ";
    id v23 = "#I %s%sNo bootstrap info, no need to update remote devices";
    goto LABEL_23;
  }
  id v3 = [(IDSClientDelegate *)self validateSWonDevices:[(IDSClientDelegate *)self targetDevices]];
  if (!v3 || (unsigned int v4 = v3, ![v3 count]))
  {
    id v22 = **((void **)self + 8);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    id v31 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v32 = 2080;
    id v33 = " ";
    id v23 = "#I %s%sNo connected devices; no need to send any updates.";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
    return;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v40 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v6 = 136316162;
    long long v24 = v6;
    id v25 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "uniqueIDOverride", v24);
        if ([(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] containsObject:v11]|| [(NSMutableArray *)[(IDSClientDelegate *)self fPreBootstrappedDeviceUuids] containsObject:v11])
        {
          long long v12 = **((void **)self + 8);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            long long v13 = [(IDSClientDelegate *)self getLogPrefix];
            id v14 = [v11 UTF8String];
            id v15 = objc_msgSend(objc_msgSend(v10, "name"), "UTF8String");
            id v16 = objc_msgSend(objc_msgSend(v10, "modelIdentifier"), "UTF8String");
            *(_DWORD *)buf = v24;
            id v31 = v13;
            __int16 v32 = 2080;
            id v33 = " ";
            __int16 v34 = 2080;
            id v35 = v14;
            __int16 v36 = 2080;
            id v37 = v15;
            unsigned int v4 = v25;
            __int16 v38 = 2080;
            id v39 = v16;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I %s%sSkipping device, will not send bootstrap info; uuid=%s name=%s model=%s",
              buf,
              0x34u);
          }
        }
        else
        {
          __int16 v17 = **((void **)self + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [(IDSClientDelegate *)self getLogPrefix];
            id v19 = [v11 UTF8String];
            id v20 = objc_msgSend(objc_msgSend(v10, "name"), "UTF8String");
            id v21 = objc_msgSend(objc_msgSend(v10, "modelIdentifier"), "UTF8String");
            *(_DWORD *)buf = v24;
            id v31 = v18;
            unsigned int v4 = v25;
            __int16 v32 = 2080;
            id v33 = " ";
            __int16 v34 = 2080;
            id v35 = v19;
            __int16 v36 = 2080;
            id v37 = v20;
            __int16 v38 = 2080;
            id v39 = v21;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I %s%sNew bootstrapped device detected! uuid=%s name=%s model=%s", buf, 0x34u);
          }
          [(IDSClientDelegate *)self updateDeviceWithBootstrapInfo:v10];
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v26 objects:v40 count:16];
    }
    while (v7);
  }
}

- (void)setupBootstrappedDevices
{
  CFTypeRef cf = 0;
  [(IDSClientDelegate *)self fPersistedDeviceListKey];
  uint64_t v9 = 0;
  DevicePersistentCopyValue();
  sub_100044D6C(&cf, (CFTypeRef *)buf);
  sub_1000577C4((const void **)buf);
  sub_1000577C4(&v9);
  CFTypeRef v3 = cf;
  CFTypeRef v8 = cf;
  if (cf) {
    CFRetain(cf);
  }
  [(IDSClientDelegate *)self setFBootstrappedDeviceUuids:v3];
  sub_100044D00(&v8);
  unsigned int v4 = (os_log_t *)*((void *)self + 8);
  id v5 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    long long v6 = [(IDSClientDelegate *)self getLogPrefix];
    NSUInteger v7 = [(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] count];
    *(_DWORD *)buf = 136315650;
    long long v12 = v6;
    __int16 v13 = 2080;
    id v14 = " ";
    __int16 v15 = 2048;
    NSUInteger v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sInitial set of bootstrapped uuids: %lu devices", buf, 0x20u);
    unsigned int v4 = (os_log_t *)*((void *)self + 8);
  }
  sub_10029F048(v4, (uint64_t)[(IDSClientDelegate *)self getLogPrefix], [(IDSClientDelegate *)self fBootstrappedDeviceUuids]);
  [(IDSClientDelegate *)self setFPreBootstrappedDeviceUuids:(id)objc_opt_new()];
  sub_100044D00(&cf);
}

- (void)updateBootstrappedDevices:(id)a3
{
  [(IDSClientDelegate *)self setFBootstrappedDeviceUuids:a3];
  unsigned int v4 = **((void **)self + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    long long v6 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v7 = 2080;
    CFTypeRef v8 = " ";
    __int16 v9 = 2048;
    NSUInteger v10 = [(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sUpdate set of bootstrapped uuids: %lu devices", (uint8_t *)&v5, 0x20u);
  }
  DevicePersistentSaveValue((const __CFString *)[(IDSClientDelegate *)self fPersistedDeviceListKey], [(IDSClientDelegate *)self fBootstrappedDeviceUuids]);
}

- (void)addBootstrappedDevice:(id)a3
{
  if (![(IDSClientDelegate *)self fBootstrappedDeviceUuids]) {
    [(IDSClientDelegate *)self setFBootstrappedDeviceUuids:(id)objc_opt_new()];
  }
  if (![(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] containsObject:a3])
  {
    [(IDSClientDelegate *)self setFBootstrappedDeviceUuids:[(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] arrayByAddingObject:a3]];
    int v5 = **((void **)self + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      __int16 v7 = [(IDSClientDelegate *)self getLogPrefix];
      __int16 v8 = 2080;
      __int16 v9 = " ";
      __int16 v10 = 2080;
      id v11 = [a3 UTF8String];
      __int16 v12 = 2048;
      NSUInteger v13 = [(NSArray *)[(IDSClientDelegate *)self fBootstrappedDeviceUuids] count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I %s%sAdd bootstrapped uuid: %s. %lu devices", (uint8_t *)&v6, 0x2Au);
    }
    DevicePersistentSaveValue((const __CFString *)[(IDSClientDelegate *)self fPersistedDeviceListKey], [(IDSClientDelegate *)self fBootstrappedDeviceUuids]);
  }
  [(NSMutableArray *)[(IDSClientDelegate *)self fPreBootstrappedDeviceUuids] removeObject:a3];
}

- (void)invalidateBootstrapDevicesIfNeeded
{
  id v26 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  CFTypeRef v3 = [(IDSClientDelegate *)self fBootstrappedDeviceUuids];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        __int16 v9 = [(IDSClientDelegate *)self fRegisteredDevices];
        id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v36;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v9);
            }
            if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v13), "uniqueIDOverride"), "isEqual:", v8))break; {
            if (v11 == (id)++v13)
            }
            {
              id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v45 count:16];
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:
          [v26 addObject:v8];
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v5);
  }
  if ([v26 count])
  {
    id v14 = +[NSMutableArray arrayWithArray:[(IDSClientDelegate *)self fBootstrappedDeviceUuids]];
    [(NSMutableArray *)v14 removeObjectsInArray:v26];
    [(IDSClientDelegate *)self updateBootstrappedDevices:v14];
  }
  [v26 removeAllObjects];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  __int16 v15 = [(IDSClientDelegate *)self fPreBootstrappedDeviceUuids];
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v21 = [(IDSClientDelegate *)self fRegisteredDevices];
        id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v28;
LABEL_26:
          uint64_t v25 = 0;
          while (1)
          {
            if (*(void *)v28 != v24) {
              objc_enumerationMutation(v21);
            }
            if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v25), "uniqueIDOverride"), "isEqual:", v20))break; {
            if (v23 == (id)++v25)
            }
            {
              id v23 = [(NSArray *)v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
              if (v23) {
                goto LABEL_26;
              }
              goto LABEL_32;
            }
          }
        }
        else
        {
LABEL_32:
          [v26 addObject:v20];
        }
      }
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }
  if ([v26 count]) {
    [(NSMutableArray *)[(IDSClientDelegate *)self fPreBootstrappedDeviceUuids] removeObjectsInArray:v26];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v19 = self;
  if (objc_msgSend(a3, "deviceForFromID:", a6, a4))
  {
    id v10 = **((void **)self + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = [(IDSClientDelegate *)self getLogPrefix];
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = " ";
      __int16 v21 = 2048;
      id v22 = [a5 count];
      __int16 v23 = 2080;
      id v24 = [a6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I %s%s <= Incoming message: %lu keys; from device '%s'",
        buf,
        0x2Au);
    }
    id v11 = [a5 keyEnumerator];
    id v12 = [v11 nextObject];
    if (v12)
    {
      *(void *)&long long v13 = 136315650;
      long long v18 = v13;
      do
      {
        id v14 = **((void **)self + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = [(IDSClientDelegate *)self getLogPrefix];
          id v16 = [v12 UTF8String];
          *(_DWORD *)buf = v18;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = " ";
          __int16 v21 = 2080;
          id v22 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I %s%s         '%s'", buf, 0x20u);
        }
        id v12 = objc_msgSend(v11, "nextObject", v18);
      }
      while (v12);
    }
    id v17 = **((void **)self + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I Full received message:", buf, 2u);
    }
    *(void *)buf = off_1019B3540;
    *(void *)&buf[8] = &v19;
    id v22 = buf;
    logger::CFTypeRefLogger();
    sub_10012C330(buf);
    -[IDSClientDelegate invokeCallbackWithDict:changedKeys:](v19, "invokeCallbackWithDict:changedKeys:", a5, [a5 allKeys]);
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = sub_10029C7F8(*((os_log_t **)self + 8), a4);
  uint64_t v6 = v5;
  __int16 v7 = *((void *)self + 3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002A0440;
  v8[3] = &unk_1019B3420;
  v8[4] = self;
  v8[5] = v5;
  dispatch_async(v7, v8);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5 = sub_10029C7F8(*((os_log_t **)self + 8), a4);
  uint64_t v6 = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002A0618;
  v7[3] = &unk_1019B3420;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(*((dispatch_queue_t *)self + 3), v7);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11 = **((void **)self + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(IDSClientDelegate *)self getLogPrefix];
    uint64_t v13 = asStringBool(a6);
    id v14 = [a5 UTF8String];
    if (a7) {
      __int16 v15 = (const char *)objc_msgSend(objc_msgSend(a7, "description"), "UTF8String");
    }
    else {
      __int16 v15 = "no";
    }
    *(_DWORD *)buf = 136316162;
    __int16 v23 = v12;
    __int16 v24 = 2080;
    uint64_t v25 = " ";
    __int16 v26 = 2080;
    uint64_t v27 = v13;
    __int16 v28 = 2080;
    id v29 = v14;
    __int16 v30 = 2080;
    long long v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I %s%s -- didSendWithSuccess: %s identifier: %s error: %s", buf, 0x34u);
  }
  if (a5)
  {
    id v16 = a5;
    id v17 = *((void *)self + 3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002A0970;
    block[3] = &unk_1019B3498;
    void block[4] = self;
    void block[5] = a5;
    BOOL v21 = a6;
    dispatch_async(v17, block);
  }
  else
  {
    long long v18 = **((void **)self + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(IDSClientDelegate *)self getLogPrefix];
      *(_DWORD *)buf = 136315394;
      __int16 v23 = v19;
      __int16 v24 = 2080;
      uint64_t v25 = " ";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I %s%s -- didSendWithSuccess: without valid identifier", buf, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  __int16 v9 = **((void **)self + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v12 = 2080;
    uint64_t v13 = " ";
    __int16 v14 = 2048;
    id v15 = [a5 length];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s -- incomingData: %lu bytes", (uint8_t *)&v10, 0x20u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  __int16 v9 = **((void **)self + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v12 = 2080;
    uint64_t v13 = " ";
    __int16 v14 = 2048;
    id v15 = objc_msgSend(objc_msgSend(a5, "data"), "length");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I %s%s -- incomingUnhandledProtobuf: %lu bytes", (uint8_t *)&v10, 0x20u);
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v6 = **((void **)self + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    uint64_t v8 = [(IDSClientDelegate *)self getLogPrefix];
    __int16 v9 = 2080;
    int v10 = " ";
    __int16 v11 = 2048;
    id v12 = [a4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I %s%s -- activeAccountsChanged: %lu accounts", (uint8_t *)&v7, 0x20u);
  }
}

- (NSMutableDictionary)fBootstrapInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFBootstrapInfo:(id)a3
{
}

- (NSArray)fBootstrappedDeviceUuids
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFBootstrappedDeviceUuids:(id)a3
{
}

- (NSMutableArray)fPreBootstrappedDeviceUuids
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFPreBootstrappedDeviceUuids:(id)a3
{
}

- (NSArray)fConnectedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFConnectedDevices:(id)a3
{
}

- (NSArray)fRegisteredDevices
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFRegisteredDevices:(id)a3
{
}

- (NSArray)fSupportedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFSupportedDevices:(id)a3
{
}

- (NSString)fPersistedDeviceListKey
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFPersistedDeviceListKey:(id)a3
{
}

- (NSMutableDictionary)fSentMsgs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFSentMsgs:(id)a3
{
}

- (NSMutableDictionary)fCachedUpdate
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFCachedUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  sub_100119D1C((ctu::OsLogLogger **)self + 8, 0);
  CFTypeRef v3 = (const void *)*((void *)self + 6);
  if (v3) {
    _Block_release(v3);
  }
  id v4 = (const void *)*((void *)self + 5);
  if (v4) {
    _Block_release(v4);
  }
  id v5 = (const void *)*((void *)self + 4);
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v6 = *((void *)self + 3);
  if (v6)
  {
    dispatch_release(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
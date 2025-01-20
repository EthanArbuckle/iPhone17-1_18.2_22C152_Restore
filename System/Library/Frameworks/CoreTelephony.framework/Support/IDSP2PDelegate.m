@interface IDSP2PDelegate
- (BOOL)isWhitelisted:(id)a3;
- (BOOL)updateDeviceSet:(id)a3 withMessage:(id)a4 named:(id)a5 withOptions:(id)a6 withIdentifier:(id *)a7;
- (BOOL)updateDeviceSet:(id)a3 withURL:(id)a4 withMessage:(id)a5 named:(id)a6 withOptions:(id)a7 withIdentifier:(id *)a8;
- (BOOL)validateDevice:(id)a3;
- (CFSharedRef<const)getWhitelistInfo:(id)a3;
- (CFSharedRef<const)sendFile:(id)a3 withMessage:(id)a4 withName:(id)a5 withOptions:(id)a6 withAck:(id)a7 toDevice:(id)a8;
- (CFSharedRef<const)sendMessage:(id)a3 withName:(id)a4 withOptions:(id)a5 withAck:(id)a6 toDevice:(id)a7;
- (IDSP2PDelegate)initWithServiceName:(id)a3 logPrefix:(const char *)a4 onDeviceState:(id)a5 onActiveDeviceChange:(id)a6 onMessage:(id)a7 onURL:(id)a8 queue:(dispatch_queue_s *)a9 registry:(shared_ptr<Registry>)a10 capable:(BOOL)a11;
- (NSArray)fBlacklistedDeviceUuids;
- (NSArray)fConnectedDevices;
- (NSDictionary)fIntroInfo;
- (NSMutableArray)fInvitedDevices;
- (NSMutableArray)fWhitelistedDeviceUuids;
- (NSString)fBlacklistedDeviceUuidsKey;
- (NSString)fTopic;
- (NSString)fWhitelistedDevicesKey;
- (id).cxx_construct;
- (id)compileDestinationSet:(id)a3;
- (id)compileWhitelistedDestinationSet:(id)a3;
- (id)uniqueDeviceIdFromIncomingDevId:(id)a3;
- (id)validateDevices:(id)a3;
- (shared_ptr<P2PDeviceDescr>)getDeviceInProximity;
- (vector<std::string,)getAllRegisteredDevicesUuids;
- (void)blacklistDevice:(id)a3;
- (void)dealloc;
- (void)introduceMyselfIfNeeded:(id)a3;
- (void)inviteDeviceIfNeeded:(id)a3;
- (void)invokeAckCallbackFor:(id)a3 withSuccess:(BOOL)a4 withError:(id)a5;
- (void)invokeDeviceChangedCallback:(id)a3;
- (void)invokeOnFileCallbackWithURL:(id)a3 withMessage:(id)a4 andName:(id)a5 andId:(id)a6;
- (void)invokeOnMessageCallbackWithDict:(id)a3 andName:(id)a4 andId:(id)a5;
- (void)postActiveDeviceIdOnStart;
- (void)processControlPacket:(id)a3 from:(id)a4;
- (void)processIntroductionPacket:(id)a3 from:(id)a4;
- (void)processInvitationPacketFrom:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setFBlacklistedDeviceUuids:(id)a3;
- (void)setFBlacklistedDeviceUuidsKey:(id)a3;
- (void)setFConnectedDevices:(id)a3;
- (void)setFIntroInfo:(id)a3;
- (void)setFInvitedDevices:(id)a3;
- (void)setFTopic:(id)a3;
- (void)setFWhitelistedDeviceUuids:(id)a3;
- (void)setFWhitelistedDevicesKey:(id)a3;
- (void)setIntroductionInfo:(id)a3;
- (void)watchDidPair:(id)a3;
- (void)whitelistDevice:(id)a3 with:(id)a4;
@end

@implementation IDSP2PDelegate

- (IDSP2PDelegate)initWithServiceName:(id)a3 logPrefix:(const char *)a4 onDeviceState:(id)a5 onActiveDeviceChange:(id)a6 onMessage:(id)a7 onURL:(id)a8 queue:(dispatch_queue_s *)a9 registry:(shared_ptr<Registry>)a10 capable:(BOOL)a11
{
  v30.receiver = self;
  v30.super_class = (Class)IDSP2PDelegate;
  id v16 = [(IDSP2PDelegate *)&v30 init];
  if (v16)
  {
    if (a7) {
      v17 = _Block_copy(a7);
    }
    else {
      v17 = 0;
    }
    v18 = (const void *)*((void *)v16 + 3);
    *((void *)v16 + 3) = v17;
    if (v18) {
      _Block_release(v18);
    }
    if (a5) {
      v19 = _Block_copy(a5);
    }
    else {
      v19 = 0;
    }
    v20 = (const void *)*((void *)v16 + 4);
    *((void *)v16 + 4) = v19;
    if (v20) {
      _Block_release(v20);
    }
    if (a6) {
      v21 = _Block_copy(a6);
    }
    else {
      v21 = 0;
    }
    v22 = (const void *)*((void *)v16 + 5);
    *((void *)v16 + 5) = v21;
    if (v22) {
      _Block_release(v22);
    }
    if (a8) {
      v23 = _Block_copy(a8);
    }
    else {
      v23 = 0;
    }
    v24 = (const void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v23;
    if (v24) {
      _Block_release(v24);
    }
    if (a9) {
      dispatch_retain((dispatch_object_t)a9);
    }
    v25 = *((void *)v16 + 2);
    *((void *)v16 + 2) = a9;
    if (v25) {
      dispatch_release(v25);
    }
    uint64_t v27 = *(void *)a10.__ptr_;
    uint64_t v26 = *((void *)a10.__ptr_ + 1);
    if (v26) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v26 + 8), 1uLL, memory_order_relaxed);
    }
    v28 = (std::__shared_weak_count *)*((void *)v16 + 10);
    *((void *)v16 + 9) = v27;
    *((void *)v16 + 10) = v26;
    if (v28) {
      sub_10004D2C8(v28);
    }
    *((void *)v16 + 7) = a4;
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
  [(IDSP2PDelegate *)self setFConnectedDevices:0];
  [(IDSP2PDelegate *)self setFBlacklistedDeviceUuidsKey:0];
  [(IDSP2PDelegate *)self setFBlacklistedDeviceUuids:0];
  [(IDSP2PDelegate *)self setFWhitelistedDevicesKey:0];
  [(IDSP2PDelegate *)self setFWhitelistedDeviceUuids:0];
  [(IDSP2PDelegate *)self setFInvitedDevices:0];
  [(IDSP2PDelegate *)self setFIntroInfo:0];
  [(IDSP2PDelegate *)self setFTopic:0];
  v4.receiver = self;
  v4.super_class = (Class)IDSP2PDelegate;
  [(IDSP2PDelegate *)&v4 dealloc];
}

- (shared_ptr<P2PDeviceDescr>)getDeviceInProximity
{
  uint64_t v3 = *((void *)self + 12);
  void *v2 = *((void *)self + 11);
  v2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (P2PDeviceDescr *)self;
  return result;
}

- (vector<std::string,)getAllRegisteredDevicesUuids
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  id v6 = [*((id *)self + 1) devices];
  context = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v10)
        {
          id v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) uniqueIDOverride];
          if (v11)
          {
            v12 = (char *)[v11 UTF8String];
            *(void *)buf = v12;
            var1 = (char *)retstr->var1;
            if (var1 >= retstr->var2.var0)
            {
              v14 = (void *)sub_100F8F464((uint64_t *)retstr, (char **)buf);
            }
            else
            {
              sub_100058DB0((void *)retstr->var1, v12);
              v14 = var1 + 24;
              retstr->var1 = var1 + 24;
            }
            retstr->var1 = v14;
          }
          else
          {
            v15 = **((void **)self + 8);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v10;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I ignored device with incomplete descripton: %@", buf, 0xCu);
            }
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v7);
  }
  return result;
}

- (void)invokeDeviceChangedCallback:(id)a3
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = (char *)[a3 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (!v5)
  {
LABEL_39:
    v25 = 0;
    goto LABEL_40;
  }
  uint64_t v6 = *(void *)v36;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v36 != v6) {
      objc_enumerationMutation(a3);
    }
    uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
    if (v8)
    {
      if ([*(id *)(*((void *)&v35 + 1) + 8 * v7) isLocallyPaired]
        && [(IDSP2PDelegate *)self validateDevice:v8])
      {
        break;
      }
    }
    if (v5 == (char *)++v7)
    {
      v5 = (char *)[a3 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v5) {
        goto LABEL_3;
      }
      goto LABEL_39;
    }
  }
  id v9 = [v8 uniqueIDOverride];
  uint64_t v10 = (capabilities::ct *)[(IDSP2PDelegate *)self isWhitelisted:v9];
  int v11 = (int)v10;
  v12 = (capabilities::ct *)capabilities::ct::supportsP2PAsPhone(v10);
  if (((v12 ^ 1 | v11) & 1) == 0)
  {
    [(IDSP2PDelegate *)self inviteDeviceIfNeeded:v9];
    goto LABEL_28;
  }
  if (capabilities::ct::supportsP2PAsGizmo(v12)) {
    goto LABEL_27;
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v13, *((Registry **)self + 9));
  v15 = ServiceMap;
  if (v16 < 0)
  {
    v17 = (unsigned __int8 *)(v16 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v18 = 5381;
    do
    {
      uint64_t v16 = v18;
      unsigned int v19 = *v17++;
      uint64_t v18 = (33 * v18) ^ v19;
    }
    while (v19);
  }
  std::mutex::lock(ServiceMap);
  v39 = (const void *)v16;
  long long v20 = sub_10004D37C(&v15[1].__m_.__sig, (unint64_t *)&v39);
  if (v20)
  {
    v22 = (GestaltUtilityInterface *)v20[3];
    long long v21 = (std::__shared_weak_count *)v20[4];
    if (v21)
    {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v15);
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v21);
      goto LABEL_23;
    }
  }
  else
  {
    v22 = 0;
  }
  std::mutex::unlock(v15);
  long long v21 = 0;
LABEL_23:
  int isWatch = GestaltUtilityInterface::isWatch(v22);
  char v24 = isWatch;
  if (!v21)
  {
    if (!isWatch) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  sub_10004D2C8(v21);
  if (v24) {
LABEL_27:
  }
    [(IDSP2PDelegate *)self introduceMyselfIfNeeded:v9];
LABEL_28:
  if (!v11
    || ![+[NRPairedDeviceRegistry sharedInstance] deviceForIDSDevice:v8])
  {
    v5 = 0;
    goto LABEL_39;
  }
  v5 = (char *)operator new(0x68uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)v5 = off_101A77390;
  *(_OWORD *)(v5 + 24) = 0u;
  v25 = (void **)(v5 + 24);
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *((_DWORD *)v5 + 12) = NRWatchOSVersionForRemoteDevice();
  [v8 modelIdentifier];
  v39 = 0;
  long long v40 = 0uLL;
  ctu::cf::assign();
  uint64_t v26 = v39;
  v41[0] = v40;
  *(void *)((char *)v41 + 7) = *(void *)((char *)&v40 + 7);
  char v27 = HIBYTE(v40);
  if (v5[47] < 0) {
    operator delete(*v25);
  }
  uint64_t v28 = v41[0];
  *((void *)v5 + 3) = v26;
  *((void *)v5 + 4) = v28;
  *(void *)(v5 + 39) = *(void *)((char *)v41 + 7);
  v5[47] = v27;
  [v8 uniqueIDOverride];
  v39 = 0;
  long long v40 = 0uLL;
  ctu::cf::assign();
  v29 = v39;
  v41[0] = v40;
  *(void *)((char *)v41 + 7) = *(void *)((char *)&v40 + 7);
  char v30 = HIBYTE(v40);
  if (v5[79] < 0) {
    operator delete(*((void **)v5 + 7));
  }
  uint64_t v31 = v41[0];
  *((void *)v5 + 7) = v29;
  *((void *)v5 + 8) = v31;
  *(void *)(v5 + 71) = *(void *)((char *)v41 + 7);
  v5[79] = v30;
  v5[80] = [v8 isConnected];
  v39 = 0;
  if (self)
  {
    [(IDSP2PDelegate *)self getWhitelistInfo:v9];
    if (v39) {
      v32 = sub_100080778;
    }
    else {
      v32 = 0;
    }
  }
  else
  {
    v32 = 0;
  }
  if (v32) {
    sub_100058140((const void **)v5 + 11, &v39);
  }
  sub_100057D78(&v39);
LABEL_40:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100F899EC;
  block[3] = &unk_101A77088;
  block[4] = self;
  block[5] = v25;
  v34 = (std::__shared_weak_count *)v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v5 + 1, 1uLL, memory_order_relaxed);
  }
  dispatch_async(*((dispatch_queue_t *)self + 2), block);
  if (v34) {
    sub_10004D2C8(v34);
  }
  if (v5) {
    sub_10004D2C8((std::__shared_weak_count *)v5);
  }
}

- (void)invokeOnMessageCallbackWithDict:(id)a3 andName:(id)a4 andId:(id)a5
{
  id v15 = a3;
  if (a3) {
    CFRetain(a3);
  }
  id v14 = a4;
  if (a4) {
    CFRetain(a4);
  }
  id v13 = a5;
  if (a5) {
    CFRetain(a5);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100F89E00;
  block[3] = &unk_101A770C0;
  block[4] = self;
  id v10 = a5;
  if (a5) {
    CFRetain(a5);
  }
  id v11 = a4;
  if (a4) {
    CFRetain(a4);
  }
  id v12 = a3;
  if (a3) {
    CFRetain(a3);
  }
  dispatch_async(*((dispatch_queue_t *)self + 2), block);
  sub_1000577C4((const void **)&v12);
  sub_1000558F4((const void **)&v11);
  sub_1000558F4((const void **)&v10);
  sub_1000558F4((const void **)&v13);
  sub_1000558F4((const void **)&v14);
  sub_1000577C4((const void **)&v15);
}

- (void)invokeOnFileCallbackWithURL:(id)a3 withMessage:(id)a4 andName:(id)a5 andId:(id)a6
{
  id v19 = a3;
  if (a3) {
    CFRetain(a3);
  }
  id v18 = a4;
  if (a4) {
    CFRetain(a4);
  }
  id v17 = a5;
  if (a5) {
    CFRetain(a5);
  }
  id v16 = a6;
  if (a6) {
    CFRetain(a6);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100F8A084;
  block[3] = &unk_101A77130;
  block[4] = self;
  id v12 = a6;
  if (a6) {
    CFRetain(a6);
  }
  id v13 = a5;
  if (a5) {
    CFRetain(a5);
  }
  id v14 = a4;
  if (a4) {
    CFRetain(a4);
  }
  id v15 = a3;
  if (a3) {
    CFRetain(a3);
  }
  dispatch_async(*((dispatch_queue_t *)self + 2), block);
  sub_1000FE824((const void **)&v15);
  sub_1000577C4((const void **)&v14);
  sub_1000558F4((const void **)&v13);
  sub_1000558F4((const void **)&v12);
  sub_1000558F4((const void **)&v16);
  sub_1000558F4((const void **)&v17);
  sub_1000577C4((const void **)&v18);
  sub_1000FE824((const void **)&v19);
}

- (void)invokeAckCallbackFor:(id)a3 withSuccess:(BOOL)a4 withError:(id)a5
{
  id v14 = a3;
  if (a3) {
    CFRetain(a3);
  }
  id v13 = a5;
  if (a5) {
    CFRetain(a5);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_100F8A644;
  v9[3] = &unk_101A77168;
  v9[4] = self;
  id v10 = a3;
  if (a3) {
    CFRetain(a3);
  }
  BOOL v12 = a4;
  id v11 = a5;
  if (a5) {
    CFRetain(a5);
  }
  dispatch_async(*((dispatch_queue_t *)self + 2), v9);
  sub_100127D74((const void **)&v11);
  sub_1000558F4((const void **)&v10);
  sub_100127D74((const void **)&v13);
  sub_1000558F4((const void **)&v14);
}

- (void)watchDidPair:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100F8A930;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(*((dispatch_queue_t *)self + 2), block);
}

- (void)setIntroductionInfo:(id)a3
{
  if ((a3 != 0) == ([(IDSP2PDelegate *)self fIntroInfo] == 0)
    || ([(NSDictionary *)[(IDSP2PDelegate *)self fIntroInfo] isEqual:a3] & 1) == 0)
  {
    [(IDSP2PDelegate *)self setFIntroInfo:a3];
    *((unsigned char *)self + 128) = 1;
    [(IDSP2PDelegate *)self introduceMyselfIfNeeded:0];
  }
}

- (void)whitelistDevice:(id)a3 with:(id)a4
{
  [(NSMutableArray *)[(IDSP2PDelegate *)self fWhitelistedDeviceUuids] addObject:a3];
  CFDictionaryRef theDict = 0;
  DevicePersistentCopyValue((uint64_t *)buf, (const __CFString *)[(IDSP2PDelegate *)self fWhitelistedDevicesKey], 0);
  sub_10004EFE4(&theDict, (CFTypeRef *)buf);
  sub_1000577C4((const void **)buf);
  CFMutableDictionaryRef v13 = 0;
  if (theDict) {
    uint64_t v7 = sub_100080778;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v7)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!MutableCopy) {
      goto LABEL_8;
    }
  }
  CFMutableDictionaryRef v9 = v13;
  CFMutableDictionaryRef v13 = MutableCopy;
  *(void *)buf = v9;
  sub_10005717C((const void **)buf);
LABEL_8:
  if (a4) {
    id v10 = a4;
  }
  else {
    id v10 = &__NSDictionary0__struct;
  }
  CFDictionarySetValue(v13, a3, v10);
  DevicePersistentSaveValue((const __CFString *)[(IDSP2PDelegate *)self fWhitelistedDevicesKey], v13);
  id v11 = **((void **)self + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [a3 UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I  Device %s whitelisted", buf, 0xCu);
  }
  sub_10005717C((const void **)&v13);
  sub_100057D78((const void **)&theDict);
}

- (CFSharedRef<const)getWhitelistInfo:(id)a3
{
  v5 = v3;
  CFDictionaryRef theDict = 0;
  DevicePersistentCopyValue((uint64_t *)&v11, (const __CFString *)[(IDSP2PDelegate *)self fWhitelistedDevicesKey], 0);
  sub_10004EFE4(&theDict, &v11);
  sub_1000577C4(&v11);
  if (theDict) {
    uint64_t v6 = sub_100080778;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6
    && (Value = CFDictionaryGetValue(theDict, a3), (uint64_t v8 = Value) != 0)
    && (CFTypeID v9 = CFGetTypeID(Value), v9 == CFDictionaryGetTypeID()))
  {
    void *v5 = v8;
    CFRetain(v8);
  }
  else
  {
    void *v5 = 0;
  }
  return (CFSharedRef<const __CFDictionary>)sub_100057D78((const void **)&theDict);
}

- (BOOL)isWhitelisted:(id)a3
{
  objc_super v4 = [(IDSP2PDelegate *)self fWhitelistedDeviceUuids];

  return [(NSMutableArray *)v4 containsObject:a3];
}

- (void)blacklistDevice:(id)a3
{
  if ([(IDSP2PDelegate *)self fBlacklistedDeviceUuids]) {
    id v5 = [(NSArray *)[(IDSP2PDelegate *)self fBlacklistedDeviceUuids] mutableCopy];
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  [v6 addObject:a3];
  [(IDSP2PDelegate *)self setFBlacklistedDeviceUuids:v6];
  if (*((unsigned char *)self + 130)) {
    DevicePersistentSaveValue((const __CFString *)[(IDSP2PDelegate *)self fBlacklistedDeviceUuidsKey], [(IDSP2PDelegate *)self fBlacklistedDeviceUuids]);
  }
  uint64_t v7 = **((void **)self + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I  Device %s blacklisted", (uint8_t *)&v8, 0xCu);
  }
}

- (void)inviteDeviceIfNeeded:(id)a3
{
  if (([(NSMutableArray *)[(IDSP2PDelegate *)self fInvitedDevices] containsObject:a3] & 1) == 0)
  {
    id v6 = [(IDSP2PDelegate *)self compileDestinationSet:a3];
    uint64_t v7 = **((void **)self + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      aBlock[0] = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I  Sending INVITE to %s", buf, 0xCu);
    }
    int v8 = +[NSString stringWithFormat:@"%@.%@", [(IDSP2PDelegate *)self fTopic], @"You are invited"];
    CFStringRef v25 = @"You are invited";
    CFStringRef v26 = @"control";
    CFStringRef v24 = @"type";
    char v27 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v9 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v22[0] = IDSSendMessageOptionQueueOneIdentifierKey;
    v22[1] = IDSSendMessageOptionNonWakingKey;
    v23[0] = v8;
    v23[1] = &__kCFBooleanTrue;
    CFTypeRef cf = 0;
    if ([(IDSP2PDelegate *)self updateDeviceSet:v6 withMessage:v9 named:@"You are invited" withOptions:+[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2] withIdentifier:&cf])
    {
      CFTypeRef v18 = cf;
      if (cf) {
        CFRetain(cf);
      }
      id v17 = a3;
      if (a3) {
        CFRetain(a3);
      }
      id v15 = a3;
      id v16 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3321888768;
      v14[2] = sub_100F8B258;
      v14[3] = &unk_101A771A0;
      v14[4] = self;
      if (a3) {
        CFRetain(a3);
      }
      id v16 = v14;
      sub_100F8F56C((uint64_t)buf, &v18, (void **)&v16);
      sub_100F8B398((uint64_t **)self + 13, (CFStringRef *)buf);
      if (*(void *)((char *)aBlock + 4)) {
        _Block_release(*(const void **)((char *)aBlock + 4));
      }
      sub_1000558F4((const void **)buf);
      if (![(IDSP2PDelegate *)self fInvitedDevices]) {
        [(IDSP2PDelegate *)self setFInvitedDevices:(id)objc_opt_new()];
      }
      [(NSMutableArray *)[(IDSP2PDelegate *)self fInvitedDevices] addObject:a3];
      id v10 = (os_log_t *)*((void *)self + 8);
      id v11 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(NSMutableArray *)[(IDSP2PDelegate *)self fInvitedDevices] count];
        *(_DWORD *)buf = 134217984;
        aBlock[0] = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I  Set of InvitedDevices become: %lu devices", buf, 0xCu);
        id v10 = (os_log_t *)*((void *)self + 8);
      }
      sub_100F88B74(v10, [(IDSP2PDelegate *)self fInvitedDevices]);
      sub_1000558F4((const void **)&v15);
      sub_1000558F4((const void **)&v17);
      sub_1000558F4(&v18);
    }
    else
    {
      CFMutableDictionaryRef v13 = **((void **)self + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I  INVITE sending failed", buf, 2u);
      }
    }
  }
}

- (void)introduceMyselfIfNeeded:(id)a3
{
  if (*((unsigned char *)self + 128))
  {
    id v4 = a3;
    CFTypeRef v25 = 0;
    if (a3)
    {
LABEL_3:
      if ([(IDSP2PDelegate *)self isWhitelisted:v4] || !*((unsigned char *)self + 129))
      {
        id v8 = [(IDSP2PDelegate *)self compileDestinationSet:v4];
        id v9 = **((void **)self + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v10 = (const __CFString *)[v4 UTF8String];
          LODWORD(buf[0]) = 136315138;
          *(CFStringRef *)((char *)buf + 4) = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I  Sending INTRO to %s", (uint8_t *)buf, 0xCu);
        }
        id v11 = +[NSString stringWithFormat:@"%@.%@", [(IDSP2PDelegate *)self fTopic], @"I am"];
        CFStringRef v33 = @"control";
        v31[0] = @"type";
        v31[1] = @"capable";
        id v12 = &__kCFBooleanFalse;
        if (*((unsigned char *)self + 129)) {
          id v12 = &__kCFBooleanTrue;
        }
        v32[0] = @"I am";
        v32[1] = v12;
        v31[2] = @"devinfo";
        CFMutableDictionaryRef v13 = [(IDSP2PDelegate *)self fIntroInfo];
        id v14 = (NSDictionary *)&__NSDictionary0__struct;
        if (v13) {
          id v14 = v13;
        }
        v32[2] = v14;
        v34 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
        id v15 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v29[0] = IDSSendMessageOptionQueueOneIdentifierKey;
        v29[1] = IDSSendMessageOptionNonWakingKey;
        v30[0] = v11;
        v30[1] = &__kCFBooleanTrue;
        id v16 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        CFTypeRef cf = 0;
        if ([(IDSP2PDelegate *)self updateDeviceSet:v8 withMessage:v15 named:@"I am" withOptions:v16 withIdentifier:&cf])
        {
          CFStringRef v26 = (__CFString *)cf;
          if (cf) {
            CFRetain(cf);
          }
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          void v22[2] = sub_100F8B980;
          v22[3] = &unk_101A771D8;
          v22[4] = self;
          CFStringRef v24 = (char *)v22;
          *((unsigned char *)self + 128) = 0;
          sub_100F8F56C((uint64_t)buf, (const void **)&v26, (void **)&v24);
          sub_100F8B398((uint64_t **)self + 13, buf);
          if (buf[1]) {
            _Block_release(buf[1]);
          }
          sub_1000558F4((const void **)buf);
          sub_1000558F4((const void **)&v26);
          goto LABEL_42;
        }
        id v6 = **((void **)self + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          uint64_t v7 = "#I  INTRO sending failed";
          goto LABEL_41;
        }
      }
      else
      {
        id v6 = **((void **)self + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          uint64_t v7 = "#I  INTRO suppressed";
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, 2u);
        }
      }
LABEL_42:
      sub_1000558F4(&v25);
      return;
    }
    id v17 = (char *)*((void *)self + 11);
    if (!v17) {
      goto LABEL_30;
    }
    CFTypeRef v18 = (const __CFString **)(v17 + 32);
    if (v17[55] < 0)
    {
      id v17 = (char *)*((void *)v17 + 5);
      if (!v17) {
        goto LABEL_30;
      }
      CFTypeRef v18 = (const __CFString **)*v18;
    }
    else if (!v17[55])
    {
      id v17 = 0;
LABEL_30:
      CFStringRef v20 = 0;
      goto LABEL_31;
    }
    CFStringRef v26 = 0;
    CFTypeRef cf = 0;
    if (ctu::cf::convert_copy((ctu::cf *)&cf, v18, (const char *)0x8000100, kCFAllocatorDefault, v3))
    {
      CFStringRef v19 = v26;
      CFStringRef v26 = (__CFString *)cf;
      buf[0] = v19;
      sub_1000558F4((const void **)buf);
    }
    CFStringRef v24 = (char *)v26;
    CFStringRef v26 = 0;
    sub_1000558F4((const void **)&v26);
    id v17 = v24;
    CFStringRef v20 = (const __CFString *)v25;
LABEL_31:
    buf[0] = v20;
    CFStringRef v24 = 0;
    CFTypeRef v25 = v17;
    sub_1000558F4((const void **)buf);
    sub_1000558F4((const void **)&v24);
    if (v25) {
      long long v21 = sub_1000810B8;
    }
    else {
      long long v21 = 0;
    }
    if (v21)
    {
      CFTypeRef v23 = v25;
      if (v25)
      {
        CFRetain(v25);
        id v4 = (id)v23;
        sub_1000558F4(&v23);
        if (v4) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_1000558F4(&v23);
      }
    }
    id v6 = **((void **)self + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      uint64_t v7 = "#I Not sending INTRO, companion is out of proximity";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
}

- (void)processInvitationPacketFrom:(id)a3
{
  id v7 = a3;
  if (a3) {
    CFRetain(a3);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_100F8BACC;
  v5[3] = &unk_101A77200;
  v5[4] = self;
  v5[5] = a3;
  id v6 = a3;
  if (a3) {
    CFRetain(a3);
  }
  dispatch_async(*((dispatch_queue_t *)self + 2), v5);
  sub_1000558F4((const void **)&v6);
  sub_1000558F4((const void **)&v7);
}

- (void)processIntroductionPacket:(id)a3 from:(id)a4
{
  id v11 = a3;
  if (a3) {
    CFRetain(a3);
  }
  id v10 = a4;
  if (a4) {
    CFRetain(a4);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100F8BC60;
  block[3] = &unk_101A77238;
  id v8 = a3;
  if (a3) {
    CFRetain(a3);
  }
  block[4] = self;
  id v9 = a4;
  if (a4) {
    CFRetain(a4);
  }
  dispatch_async(*((dispatch_queue_t *)self + 2), block);
  sub_1000558F4((const void **)&v9);
  sub_100057D78((const void **)&v8);
  sub_1000558F4((const void **)&v10);
  sub_100057D78((const void **)&v11);
}

- (void)processControlPacket:(id)a3 from:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [a3 objectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([@"You are invited" isEqualToString:v7])
      {
        -[IDSP2PDelegate processInvitationPacketFrom:](self, "processInvitationPacketFrom:", a4, v8);
      }
      else if ([@"I am" isEqualToString:v7])
      {
        [(IDSP2PDelegate *)self processIntroductionPacket:a3 from:a4];
      }
    }
  }
}

- (BOOL)updateDeviceSet:(id)a3 withMessage:(id)a4 named:(id)a5 withOptions:(id)a6 withIdentifier:(id *)a7
{
  if (a3 && [a3 count])
  {
    CFMutableDictionaryRef v13 = (os_log_t *)*((void *)self + 8);
    id v14 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v28 = [a3 count];
      __int16 v29 = 2048;
      id v30 = [a4 count];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I  Updating %lu device(s) with message (%lu records(s))", buf, 0x16u);
      CFMutableDictionaryRef v13 = (os_log_t *)*((void *)self + 8);
    }
    sub_100F8C1D4(v13, a3);
    id v15 = objc_msgSend(objc_msgSend(*((id *)self + 1), "accounts"), "anyObject");
    id v16 = (void *)*((void *)self + 1);
    id v26 = 0;
    unsigned int v17 = [v16 sendMessage:a4 fromAccount:v15 toDestinations:a3 priority:300 options:a6 identifier:a7 error:&v26];
    CFTypeRef v18 = (os_log_t *)*((void *)self + 8);
    CFStringRef v19 = *v18;
    if (v17)
    {
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [a5 UTF8String];
        id v21 = [*a7 UTF8String];
        *(_DWORD *)buf = 136315394;
        id v28 = v20;
        __int16 v29 = 2080;
        id v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I   => Sending message '%s'. Identifier: %s; callback will follow with result",
          buf,
          0x16u);
      }
    }
    else if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
    {
      id v24 = [a5 UTF8String];
      id v25 = objc_msgSend(objc_msgSend(v26, "description"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      id v28 = v24;
      __int16 v29 = 2080;
      id v30 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error sending message '%s': %s", buf, 0x16u);
    }
  }
  else
  {
    v22 = **((void **)self + 8);
    LOBYTE(v17) = 0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#E  Skipping update because no devices were specified.", buf, 2u);
      LOBYTE(v17) = 0;
    }
  }
  return v17;
}

- (BOOL)updateDeviceSet:(id)a3 withURL:(id)a4 withMessage:(id)a5 named:(id)a6 withOptions:(id)a7 withIdentifier:(id *)a8
{
  if (a3 && [a3 count])
  {
    id v15 = (os_log_t *)*((void *)self + 8);
    id v16 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v29 = [a3 count];
      __int16 v30 = 2080;
      id v31 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I  Updating %lu devices with resource %s", buf, 0x16u);
      id v15 = (os_log_t *)*((void *)self + 8);
    }
    sub_100F8C1D4(v15, a3);
    unsigned int v17 = (void *)*((void *)self + 1);
    id v27 = 0;
    unsigned int v18 = [v17 sendResourceAtURL:a4 metadata:a5 toDestinations:a3 priority:300 options:a7 identifier:a8 error:&v27];
    CFStringRef v19 = (os_log_t *)*((void *)self + 8);
    id v20 = *v19;
    if (v18)
    {
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [a6 UTF8String];
        id v22 = [*a8 UTF8String];
        *(_DWORD *)buf = 136315394;
        id v29 = v21;
        __int16 v30 = 2080;
        id v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I   => Sending resource '%s'. Identifier: %s; callback will follow with result",
          buf,
          0x16u);
      }
    }
    else if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
    {
      id v25 = [a6 UTF8String];
      id v26 = objc_msgSend(objc_msgSend(v27, "description"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      id v29 = v25;
      __int16 v30 = 2080;
      id v31 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, " Error sending resource '%s': %s", buf, 0x16u);
    }
  }
  else
  {
    CFTypeRef v23 = **((void **)self + 8);
    LOBYTE(v18) = 0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#E  Skipping update because no devices were specified.", buf, 2u);
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (BOOL)validateDevice:(id)a3
{
  id v5 = [a3 uniqueIDOverride];
  id v6 = (capabilities::ct *)[a3 modelIdentifier];
  if (!v5 || (id v7 = v6) == 0)
  {
    unsigned int v18 = **((void **)self + 8);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v10) = 0;
    if (!v19) {
      return v10;
    }
    int v22 = 138412290;
    id v23 = a3;
    id v15 = "#I ignored device with incomplete descripton: %@";
    id v16 = v18;
    uint32_t v17 = 12;
    goto LABEL_15;
  }
  if (capabilities::ct::supportsP2PAsPhone(v6) && [a3 isLocallyPaired])
  {
    if (![+[NRPairedDeviceRegistry sharedInstance] deviceForIDSDevice:a3])
    {
      id v11 = **((void **)self + 8);
      BOOL v20 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      LOBYTE(v10) = 0;
      if (!v20) {
        return v10;
      }
      int v22 = 136315394;
      id v23 = [v5 UTF8String];
      __int16 v24 = 2080;
      id v25 = [(capabilities::ct *)v7 UTF8String];
      id v15 = "#I  Device %s (%s - watch?)  is of unknown version - ignore";
      goto LABEL_12;
    }
    unsigned int v8 = NRWatchOSVersionForRemoteDevice();
    id v9 = **((void **)self + 8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 < 0x40000)
    {
      if (!v10) {
        return v10;
      }
      int v22 = 136315650;
      id v23 = [v5 UTF8String];
      __int16 v24 = 2080;
      id v25 = [(capabilities::ct *)v7 UTF8String];
      __int16 v26 = 1024;
      unsigned int v27 = v8;
      id v15 = "#I  Watch %s (%s) is of old version (%u) - ignore";
      id v16 = v9;
      uint32_t v17 = 28;
      goto LABEL_15;
    }
    if (v10)
    {
      int v22 = 136315650;
      id v23 = [v5 UTF8String];
      __int16 v24 = 2080;
      id v25 = [(capabilities::ct *)v7 UTF8String];
      __int16 v26 = 1024;
      unsigned int v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I  Watch %s (%s) is compatible, version %u", (uint8_t *)&v22, 0x1Cu);
    }
  }
  if (![(NSArray *)[(IDSP2PDelegate *)self fBlacklistedDeviceUuids] containsObject:v5])
  {
    LOBYTE(v10) = 1;
    return v10;
  }
  id v11 = **((void **)self + 8);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v10) = 0;
  if (v12)
  {
    id v13 = [v5 UTF8String];
    id v14 = [(capabilities::ct *)v7 UTF8String];
    int v22 = 136315394;
    id v23 = v13;
    __int16 v24 = 2080;
    id v25 = v14;
    id v15 = "#I  Device %s (%s) is blacklisted";
LABEL_12:
    id v16 = v11;
    uint32_t v17 = 22;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v22, v17);
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (id)validateDevices:(id)a3
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
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ([(IDSP2PDelegate *)self validateDevice:v10]) {
          [v5 addObject:v10];
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v5;
}

- (id)compileDestinationSet:(id)a3
{
  if (a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(IDSP2PDelegate *)self fConnectedDevices];
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v10, "uniqueIDOverride"), "isEqualToString:", a3))
          {
            unsigned int v18 = v10;
            long long v12 = +[NSArray arrayWithObjects:&v18 count:1];
            goto LABEL_13;
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
        id v11 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    long long v12 = [(IDSP2PDelegate *)self fConnectedDevices];
LABEL_13:
    id v11 = v12;
  }
  return sub_100F8CB04(*((os_log_t **)self + 8), [(IDSP2PDelegate *)self validateDevices:v11]);
}

- (id)compileWhitelistedDestinationSet:(id)a3
{
  if (a3)
  {
    if (-[IDSP2PDelegate isWhitelisted:](self, "isWhitelisted:")
      && (long long v26 = 0u,
          long long v27 = 0u,
          long long v24 = 0u,
          long long v25 = 0u,
          id v5 = [(IDSP2PDelegate *)self fConnectedDevices],
          (id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v30 count:16]) != 0))
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v10, "uniqueIDOverride"), "isEqualToString:", a3))
          {
            id v29 = v10;
            id v11 = +[NSArray arrayWithObjects:&v29 count:1];
            return sub_100F8CB04(*((os_log_t **)self + 8), [(IDSP2PDelegate *)self validateDevices:v11]);
          }
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
        id v11 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    long long v12 = (NSArray *)(id)objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v13 = [(IDSP2PDelegate *)self fConnectedDevices];
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          unsigned int v18 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
          if (-[IDSP2PDelegate isWhitelisted:](self, "isWhitelisted:", [v18 uniqueIDOverride])) {
            [(NSArray *)v12 addObject:v18];
          }
        }
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }
    if ([(NSArray *)v12 count]) {
      id v11 = v12;
    }
    else {
      id v11 = 0;
    }
  }
  return sub_100F8CB04(*((os_log_t **)self + 8), [(IDSP2PDelegate *)self validateDevices:v11]);
}

- (CFSharedRef<const)sendMessage:(id)a3 withName:(id)a4 withOptions:(id)a5 withAck:(id)a6 toDevice:(id)a7
{
  long long v13 = v7;
  id v20 = a6;
  *id v7 = 0;
  id v15 = [(IDSP2PDelegate *)self compileWhitelistedDestinationSet:a7];
  uint64_t v16 = **((void **)self + 8);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = [a4 UTF8String];
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I  Sending message '%s': %s", buf, 0x16u);
  }
  v21[0] = @"msg.name";
  v21[1] = @"msg.body";
  v22[0] = a4;
  v22[1] = a3;
  uint64_t v19 = 0;
  if ([(IDSP2PDelegate *)self updateDeviceSet:v15 withMessage:+[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2] named:a4 withOptions:a5 withIdentifier:&v19])
  {
    *(void *)buf = v19;
    sub_100013168(v13, (CFTypeRef *)buf);
    sub_100F8F56C((uint64_t)buf, v13, &v20);
    sub_100F8B398((uint64_t **)self + 13, (CFStringRef *)buf);
    if (*(void *)&buf[8]) {
      _Block_release(*(const void **)&buf[8]);
    }
    sub_1000558F4((const void **)buf);
  }
  else
  {
    long long v17 = **((void **)self + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I  Sending message failed", buf, 2u);
    }
  }
  return v18;
}

- (CFSharedRef<const)sendFile:(id)a3 withMessage:(id)a4 withName:(id)a5 withOptions:(id)a6 withAck:(id)a7 toDevice:(id)a8
{
  id v15 = v8;
  id v22 = a7;
  *uint64_t v8 = 0;
  id v16 = [(IDSP2PDelegate *)self compileWhitelistedDestinationSet:a8];
  long long v17 = **((void **)self + 8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = [a5 UTF8String];
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = objc_msgSend(objc_msgSend(a3, "description"), "UTF8String");
    __int16 v26 = 2080;
    id v27 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I  Sending URL '%s': %s and msg: '%s'", buf, 0x20u);
  }
  v23[0] = @"msg.name";
  v23[1] = @"msg.body";
  v24[0] = a5;
  v24[1] = a4;
  uint64_t v21 = 0;
  if ([(IDSP2PDelegate *)self updateDeviceSet:v16 withURL:a3 withMessage:+[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2] named:a5 withOptions:a6 withIdentifier:&v21])
  {
    *(void *)buf = v21;
    sub_100013168(v15, (CFTypeRef *)buf);
    sub_100F8F56C((uint64_t)buf, v15, &v22);
    sub_100F8B398((uint64_t **)self + 13, (CFStringRef *)buf);
    if (*(void *)&buf[8]) {
      _Block_release(*(const void **)&buf[8]);
    }
    sub_1000558F4((const void **)buf);
  }
  else
  {
    CFSharedRef<const __CFString> v18 = **((void **)self + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I  Sending URL failed", buf, 2u);
    }
  }
  return v19;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100F8D3CC;
  v7[3] = &unk_1019B3420;
  v7[4] = a4;
  v7[5] = self;
  dispatch_async(*((dispatch_queue_t *)self + 2), v7);
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100F8DADC;
  v5[3] = &unk_101A6B1A0;
  v5[4] = a3;
  v5[5] = a4;
  void v5[6] = self;
  v5[7] = a5;
  dispatch_async(*((dispatch_queue_t *)self + 2), v5);
}

- (void)postActiveDeviceIdOnStart
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100F8DE94;
  block[3] = &unk_1019B3470;
  block[4] = self;
  dispatch_async(*((dispatch_queue_t *)self + 2), block);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6 = objc_msgSend(a4, "count", a3);
  id v7 = (os_log_t *)*((void *)self + 8);
  uint64_t v8 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I  Set of connected devices changed: %lu device(s)", buf, 0xCu);
    id v7 = (os_log_t *)*((void *)self + 8);
  }
  sub_100F89054(v7, a4);
  id v9 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100F8E2AC;
  v10[3] = &unk_1019B3420;
  v10[4] = self;
  v10[5] = a4;
  dispatch_async(*((dispatch_queue_t *)self + 2), v10);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v11 = **((void **)self + 8);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (a7)
  {
    if (v12)
    {
      if (v8) {
        long long v13 = "true";
      }
      else {
        long long v13 = "false";
      }
      *(_DWORD *)CFSharedRef<const __CFString> v18 = 136315650;
      *(void *)&v18[4] = v13;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = [a5 UTF8String];
      *(_WORD *)&v18[22] = 2080;
      id v19 = objc_msgSend(objc_msgSend(a7, "description"), "UTF8String");
      id v14 = "#I   -- didSendWithSuccess: %s identifier: %s error: %s";
      id v15 = v11;
      uint32_t v16 = 32;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, v18, v16);
    }
  }
  else if (v12)
  {
    if (v8) {
      long long v17 = "true";
    }
    else {
      long long v17 = "false";
    }
    *(_DWORD *)CFSharedRef<const __CFString> v18 = 136315394;
    *(void *)&v18[4] = v17;
    *(_WORD *)&v18[12] = 2080;
    *(void *)&v18[14] = [a5 UTF8String];
    id v14 = "#I   -- didSendWithSuccess: %s identifier: %s";
    id v15 = v11;
    uint32_t v16 = 22;
    goto LABEL_12;
  }
  -[IDSP2PDelegate invokeAckCallbackFor:withSuccess:withError:](self, "invokeAckCallbackFor:withSuccess:withError:", a5, v8, a7, *(_OWORD *)v18, *(void *)&v18[16], v19);
}

- (id)uniqueDeviceIdFromIncomingDevId:(id)a3
{
  id v4 = [*((id *)self + 1) deviceForFromID:a3];
  if (v4)
  {
    return [v4 uniqueIDOverride];
  }
  else
  {
    id v6 = **((void **)self + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I from device not found", v7, 2u);
    }
    return 0;
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  long long v17 = self;
  if (objc_msgSend(a3, "deviceForFromID:", a6, a4))
  {
    id v10 = [a5 objectForKey:@"control"];
    id v11 = [a5 objectForKey:@"msg.name"];
    if (!v11 && v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v10 objectForKey:@"type"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v12;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
    }
    long long v13 = **((void **)self + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = [v11 UTF8String];
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = [a5 count];
      __int16 v19 = 2080;
      id v20 = [a6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I   <= Incoming message '%s': %lu keys; from device '%s'",
        buf,
        0x20u);
      long long v13 = **((void **)self + 8);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Full received message:", buf, 2u);
    }
    *(void *)buf = off_101A77458;
    *(void *)&buf[8] = &v17;
    id v20 = buf;
    logger::CFTypeRefLogger();
    sub_10012C330(buf);
    id v14 = v17;
    if (v10)
    {
      [(IDSP2PDelegate *)v17 processControlPacket:v10 from:[(IDSP2PDelegate *)v17 uniqueDeviceIdFromIncomingDevId:a6]];
    }
    else
    {
      id v15 = [a5 objectForKey:@"msg.body"];
      id v16 = [a5 objectForKey:@"msg.name"];
      [(IDSP2PDelegate *)v14 invokeOnMessageCallbackWithDict:v15 andName:v16 andId:[(IDSP2PDelegate *)v17 uniqueDeviceIdFromIncomingDevId:a6]];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  if (!objc_msgSend(a3, "deviceForFromID:", a7, a4)) {
    return;
  }
  id v12 = **((void **)self + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a6, "objectForKey:", @"msg.name"), "UTF8String");
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    *(_WORD *)&unsigned char buf[22] = 2080;
    id v43 = objc_msgSend(objc_msgSend(objc_msgSend(a6, "objectForKey:", @"msg.body"), "description"), "UTF8String");
    __int16 v44 = 2080;
    id v45 = [a7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I   <= Incoming resource: '%s', URL '%s', meta: %s; from device '%s'",
      buf,
      0x2Au);
  }
  id v35 = a6;
  v39 = &off_101A0BD40;
  long long v13 = (const char *)[a5 fileSystemRepresentation];
  __p = 0;
  long long v38 = 0uLL;
  do
  {
    while (1)
    {
      id v14 = NSTemporaryDirectory();
      +[NSString stringWithFormat:@"%@/%s.%d", v14, *((void *)self + 7), rand()];
      memset(buf, 0, sizeof(buf));
      ctu::cf::assign();
      id v15 = *(void ***)buf;
      v41[0] = *(void *)&buf[8];
      *(void *)((char *)v41 + 7) = *(void *)&buf[15];
      int v16 = (char)buf[23];
      if (SHIBYTE(v38) < 0) {
        operator delete(__p);
      }
      __p = v15;
      *(void *)&long long v38 = v41[0];
      *(void *)((char *)&v38 + 7) = *(void *)((char *)v41 + 7);
      HIBYTE(v38) = v16;
      long long v17 = (char *)(v16 >= 0 ? &__p : v15);
      sub_100058DB0(buf, v17);
      unsigned __int8 v18 = sub_1007ECCD4((uint64_t)&v39, (uint64_t *)buf);
      unsigned __int8 v19 = v18;
      if ((char)buf[23] < 0) {
        break;
      }
      if ((v18 & 1) == 0) {
        goto LABEL_14;
      }
    }
    operator delete(*(void **)buf);
  }
  while ((v19 & 1) != 0);
LABEL_14:
  if (v38 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  uid_t v21 = getuid();
  gid_t v22 = getgid();
  int v23 = sub_1007EC674(v13, (uint64_t)p_p, v21, v22, 1);
  long long v24 = **((void **)self + 8);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (v25)
    {
      id v27 = strerror(v23);
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v27;
      id v28 = "#I  copying failed with err: (%s)";
      id v29 = v24;
      uint32_t v30 = 12;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    }
  }
  else if (v25)
  {
    id v31 = &__p;
    if (v38 < 0) {
      id v31 = __p;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = v31;
    id v28 = "#I  copied %s to %s";
    id v29 = v24;
    uint32_t v30 = 22;
    goto LABEL_24;
  }
  if (v38 >= 0) {
    v32 = (const __CFString **)&__p;
  }
  else {
    v32 = (const __CFString **)__p;
  }
  long long v40 = 0;
  v41[0] = 0;
  if (ctu::cf::convert_copy((ctu::cf *)v41, v32, (const char *)0x8000100, kCFAllocatorDefault, v26))
  {
    CFStringRef v33 = v40;
    long long v40 = (const void *)v41[0];
    *(void *)buf = v33;
    sub_1000558F4((const void **)buf);
  }
  v34 = v40;
  long long v36 = v40;
  long long v40 = 0;
  sub_1000558F4(&v40);
  -[IDSP2PDelegate invokeOnFileCallbackWithURL:withMessage:andName:andId:](self, "invokeOnFileCallbackWithURL:withMessage:andName:andId:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v34, 0), [v35 objectForKey:@"msg.body"], objc_msgSend(v35, "objectForKey:", @"msg.name"), -[IDSP2PDelegate uniqueDeviceIdFromIncomingDevId:](self, "uniqueDeviceIdFromIncomingDevId:", a7));
  sub_1000558F4(&v36);
  if (SHIBYTE(v38) < 0) {
    operator delete(__p);
  }
  FileSystemInterface::~FileSystemInterface((FileSystemInterface *)&v39);
}

- (NSString)fTopic
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFTopic:(id)a3
{
}

- (NSArray)fConnectedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFConnectedDevices:(id)a3
{
}

- (NSString)fBlacklistedDeviceUuidsKey
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFBlacklistedDeviceUuidsKey:(id)a3
{
}

- (NSArray)fBlacklistedDeviceUuids
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFBlacklistedDeviceUuids:(id)a3
{
}

- (NSString)fWhitelistedDevicesKey
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFWhitelistedDevicesKey:(id)a3
{
}

- (NSMutableArray)fWhitelistedDeviceUuids
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFWhitelistedDeviceUuids:(id)a3
{
}

- (NSMutableArray)fInvitedDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFInvitedDevices:(id)a3
{
}

- (NSDictionary)fIntroInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFIntroInfo:(id)a3
{
}

- (void).cxx_destruct
{
  sub_100F8FC48(*((void **)self + 14));
  CFAllocatorRef v3 = (std::__shared_weak_count *)*((void *)self + 12);
  if (v3) {
    sub_10004D2C8(v3);
  }
  id v4 = (std::__shared_weak_count *)*((void *)self + 10);
  if (v4) {
    sub_10004D2C8(v4);
  }
  sub_100119D1C((ctu::OsLogLogger **)self + 8, 0);
  id v5 = (const void *)*((void *)self + 6);
  if (v5) {
    _Block_release(v5);
  }
  id v6 = (const void *)*((void *)self + 5);
  if (v6) {
    _Block_release(v6);
  }
  id v7 = (const void *)*((void *)self + 4);
  if (v7) {
    _Block_release(v7);
  }
  BOOL v8 = (const void *)*((void *)self + 3);
  if (v8) {
    _Block_release(v8);
  }
  id v9 = *((void *)self + 2);
  if (v9)
  {
    dispatch_release(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = (char *)self + 112;
  return self;
}

@end
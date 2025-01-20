@interface CPNetworkObserver
+ (id)sharedNetworkObserver;
- (BOOL)isNetworkReachable;
- (BOOL)isWiFiEnabled;
- (CPNetworkObserver)init;
- (void)_networkObserversInitialize;
- (void)_networkReachableCallBack:(unsigned int)a3;
- (void)_networkReachableFirstCallBack:(id)a3;
- (void)_wifiCallBack:(unsigned int)a3;
- (void)_wifiFirstCallBack:(id)a3;
- (void)_wifiObserversInitialize;
- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4;
- (void)addObserver:(id)a3 selector:(SEL)a4 forHostname:(id)a5;
- (void)addWiFiObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)removeNetworkReachableObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 forHostname:(id)a4;
- (void)removeWiFiObserver:(id)a3;
@end

@implementation CPNetworkObserver

- (CPNetworkObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPNetworkObserver;
  v2 = [(CPNetworkObserver *)&v4 init];
  if (v2) {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  }
  return v2;
}

- (void)dealloc
{
  wifiPreferences = self->_wifiPreferences;
  objc_super v4 = (CFStringRef *)MEMORY[0x1E4F1D410];
  if (wifiPreferences)
  {
    SCPreferencesSetCallback(wifiPreferences, 0, 0);
    v5 = self->_wifiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(v5, Main, *v4);
    CFRelease(self->_wifiPreferences);
  }
  networkReach = self->_networkReach;
  if (networkReach)
  {
    SCNetworkReachabilitySetCallback(networkReach, 0, 0);
    v8 = self->_networkReach;
    v9 = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(v8, v9, *v4);
    CFRelease(self->_networkReach);
  }
  [(NSLock *)self->_lock lock];
  wifiObservers = self->_wifiObservers;
  if (wifiObservers)
  {
    CFRelease(wifiObservers);
    self->_wifiObservers = 0;
  }
  networkObservers = self->_networkObservers;
  if (networkObservers)
  {
    CFRelease(networkObservers);
    self->_networkObservers = 0;
  }
  [(NSLock *)self->_lock unlock];

  v12.receiver = self;
  v12.super_class = (Class)CPNetworkObserver;
  [(CPNetworkObserver *)&v12 dealloc];
}

+ (id)sharedNetworkObserver
{
  return (id)_CPNetworkObserverShared;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 forHostname:(id)a5
{
  [(NSLock *)self->_lock lock];
  reachabilityRequests = self->_reachabilityRequests;
  if (!reachabilityRequests)
  {
    reachabilityRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_reachabilityRequests = reachabilityRequests;
  }
  v10 = (_ReachabilityRequest *)[(NSMutableDictionary *)reachabilityRequests objectForKey:a5];
  if (!v10)
  {
    v10 = [[_ReachabilityRequest alloc] initWithHostname:a5];
    [(NSMutableDictionary *)self->_reachabilityRequests setObject:v10 forKey:[(_ReachabilityRequest *)v10 hostname]];
  }
  [(_ReachabilityRequest *)v10 addObserver:a3 selector:a4];
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)removeObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_lock lock];
  reachabilityRequests = self->_reachabilityRequests;
  if (!reachabilityRequests)
  {
    reachabilityRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_reachabilityRequests = reachabilityRequests;
  }
  v6 = (void *)[(NSMutableDictionary *)reachabilityRequests allKeys];
  [(NSLock *)self->_lock unlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CPNetworkObserver *)self removeObserver:a3 forHostname:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)removeObserver:(id)a3 forHostname:(id)a4
{
  [(NSLock *)self->_lock lock];
  reachabilityRequests = self->_reachabilityRequests;
  if (!reachabilityRequests)
  {
    reachabilityRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_reachabilityRequests = reachabilityRequests;
  }
  uint64_t v8 = (void *)[(NSMutableDictionary *)reachabilityRequests objectForKey:a4];
  if (v8)
  {
    uint64_t v9 = v8;
    [v8 removeObserver:a3];
    if (([v9 hasObservers] & 1) == 0) {
      -[NSMutableDictionary removeObjectForKey:](self->_reachabilityRequests, "removeObjectForKey:", [v9 hostname]);
    }
  }
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_networkObserversInitialize
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  self->_networkObservers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  sockaddr address = (sockaddr)xmmword_18FBB7490;
  objc_super v4 = SCNetworkReachabilityCreateWithAddress(v3, &address);
  self->_networkReach = v4;
  SCNetworkReachabilityGetFlags(v4, &self->_networkReachability);
  self->_networkReachable = (self->_networkReachability & 2) != 0;
  -[CPNetworkObserver performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__networkReachableFirstCallBack_, [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_networkReachability length:4], 0);
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  SCNetworkReachabilitySetCallback(self->_networkReach, (SCNetworkReachabilityCallBack)_NetworkReachabilityCallBack, &v7);
  networkReach = self->_networkReach;
  Main = CFRunLoopGetMain();
  SCNetworkReachabilityScheduleWithRunLoop(networkReach, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
}

- (void)_networkReachableCallBack:(unsigned int)a3
{
  if ((a3 & 2) != 0 && (self->_networkReachability & 2) != 0)
  {
    v14[0] = 0;
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 0;
  v14[v4] = (a3 & 2) >> 1;
  v6 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
  self->_networkReachability = a3;
  uint64_t v7 = v4 + 1;
  CFAllocatorRef v8 = *v6;
  do
  {
    int v9 = v14[v5];
    if (v9 != self->_networkReachable || !self->_networkNotified)
    {
      self->_networkNotified = 1;
      self->_networkReachable = v9;
      [(NSLock *)self->_lock lock];
      networkObservers = self->_networkObservers;
      if (networkObservers && CFDictionaryGetCount(networkObservers) > 0)
      {
        CFDictionaryRef Copy = CFDictionaryCreateCopy(v8, self->_networkObservers);
        [(NSLock *)self->_lock unlock];
        if (Copy)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_networkReachable), @"CPNetworkObserverReachable");
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_NotifyObserver, (void *)[MEMORY[0x1E4F28EA0] notificationWithName:@"CPNetworkObserverNetworkReachableNotification" object:0 userInfo:v13]);
          CFRelease(Copy);
          [v12 drain];
        }
      }
      else
      {
        [(NSLock *)self->_lock unlock];
      }
    }
    ++v5;
  }
  while (v7 != v5);
}

- (void)_networkReachableFirstCallBack:(id)a3
{
  uint64_t v4 = *(unsigned int *)[a3 bytes];
  [(CPNetworkObserver *)self _networkReachableCallBack:v4];
}

- (BOOL)isNetworkReachable
{
  [(NSLock *)self->_lock lock];
  if (!self->_networkObservers) {
    [(CPNetworkObserver *)self _networkObserversInitialize];
  }
  BOOL networkReachable = self->_networkReachable;
  [(NSLock *)self->_lock unlock];
  return networkReachable;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  [(NSLock *)self->_lock lock];
  networkObservers = self->_networkObservers;
  if (!networkObservers)
  {
    [(CPNetworkObserver *)self _networkObserversInitialize];
    networkObservers = self->_networkObservers;
  }
  CFDictionaryAddValue(networkObservers, a3, a4);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)removeNetworkReachableObserver:(id)a3
{
  [(NSLock *)self->_lock lock];
  networkObservers = self->_networkObservers;
  if (!networkObservers)
  {
    [(CPNetworkObserver *)self _networkObserversInitialize];
    networkObservers = self->_networkObservers;
  }
  CFDictionaryRemoveValue(networkObservers, a3);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)_wifiObserversInitialize
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  self->_wifiObservers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle && (CFStringRef Identifier = CFBundleGetIdentifier(MainBundle)) != 0)
  {
    CFStringRef v6 = Identifier;
    CFRetain(Identifier);
  }
  else
  {
    uint64_t v7 = getprogname();
    uint64_t v8 = getpid();
    CFStringRef v6 = CFStringCreateWithFormat(v3, 0, @"%s (%d)", v7, v8);
  }
  self->_wifiPreferences = SCPreferencesCreate(v3, v6, @"com.apple.wifi.plist");
  CFRelease(v6);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  SCPreferencesSetCallback(self->_wifiPreferences, (SCPreferencesCallBack)_WiFiCallBack, &context);
  wifiPreferences = self->_wifiPreferences;
  Main = CFRunLoopGetMain();
  SCPreferencesScheduleWithRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x1E4F1D410]);
  self->_wifiEnabled = _WiFiIsSettingEnabled(self->_wifiPreferences);
  int v11 = 1;
  -[CPNetworkObserver performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__wifiFirstCallBack_, [MEMORY[0x1E4F1C9B8] dataWithBytes:&v11 length:4], 0);
}

- (void)_wifiCallBack:(unsigned int)a3
{
  if (a3)
  {
    BOOL IsSettingEnabled = _WiFiIsSettingEnabled(self->_wifiPreferences);
    BOOL v5 = IsSettingEnabled;
    if (self->_wifiEnabled != IsSettingEnabled || !self->_wifiNotified)
    {
      self->_wifiEnabled = IsSettingEnabled;
      self->_wifiNotified = 1;
      [(NSLock *)self->_lock lock];
      wifiObservers = self->_wifiObservers;
      if (wifiObservers && CFDictionaryGetCount(wifiObservers) > 0)
      {
        CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_wifiObservers);
        [(NSLock *)self->_lock unlock];
        if (Copy)
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
          uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v5), @"CPNetworkObserverWiFiEnabled");
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_NotifyObserver, (void *)[MEMORY[0x1E4F28EA0] notificationWithName:@"CPNetworkObserverWiFiNotification" object:0 userInfo:v9]);
          CFRelease(Copy);
          [v8 drain];
        }
      }
      else
      {
        lock = self->_lock;
        [(NSLock *)lock unlock];
      }
    }
  }
}

- (void)_wifiFirstCallBack:(id)a3
{
  uint64_t v4 = *(unsigned int *)[a3 bytes];
  [(CPNetworkObserver *)self _wifiCallBack:v4];
}

- (BOOL)isWiFiEnabled
{
  [(NSLock *)self->_lock lock];
  if (!self->_wifiObservers) {
    [(CPNetworkObserver *)self _wifiObserversInitialize];
  }
  BOOL wifiEnabled = self->_wifiEnabled;
  [(NSLock *)self->_lock unlock];
  return wifiEnabled;
}

- (void)addWiFiObserver:(id)a3 selector:(SEL)a4
{
  [(NSLock *)self->_lock lock];
  wifiObservers = self->_wifiObservers;
  if (!wifiObservers)
  {
    [(CPNetworkObserver *)self _wifiObserversInitialize];
    wifiObservers = self->_wifiObservers;
  }
  CFDictionaryAddValue(wifiObservers, a3, a4);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)removeWiFiObserver:(id)a3
{
  [(NSLock *)self->_lock lock];
  wifiObservers = self->_wifiObservers;
  if (!wifiObservers)
  {
    [(CPNetworkObserver *)self _wifiObserversInitialize];
    wifiObservers = self->_wifiObservers;
  }
  CFDictionaryRemoveValue(wifiObservers, a3);
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

@end
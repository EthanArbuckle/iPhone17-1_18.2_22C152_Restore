@interface HAPAccessoryServerBrowser
- (BOOL)isPaired:(id)a3;
- (BOOL)recommendBrowserReset;
- (BOOL)remoteBrowsingEnabled;
- (HAPAccessoryServerBrowser)initWithQueue:(id)a3;
- (HAPKeyStore)keyStore;
- (HAPMetricsDispatcher)logEvent;
- (NSMutableSet)pairedAccessoryIdentifiers;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (int64_t)linkType;
- (void)deRegisterAccessoryWithIdentifier:(id)a3;
- (void)discoverAccessoryServerWithIdentifier:(id)a3;
- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5;
- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5;
- (void)registerPairedAccessoryWithIdentifier:(id)a3;
- (void)resetPairedAccessories;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setKeyStore:(id)a3;
- (void)setPairedAccessoryIdentifiers:(id)a3;
- (void)setRemoteBrowsingEnabled:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)startConfirmingPairedAccessoryReachability;
- (void)startDiscoveringAccessoryServers;
- (void)stopConfirmingPairedAccessoryReachability;
- (void)stopDiscoveringAccessoryServers;
@end

@implementation HAPAccessoryServerBrowser

- (void)registerPairedAccessoryWithIdentifier:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HAPAccessoryServerBrowser *)self pairedAccessoryIdentifiers];
  [v5 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableSet)pairedAccessoryIdentifiers
{
  return self->_pairedAccessoryIdentifiers;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_pairedAccessoryIdentifiers, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (HAPMetricsDispatcher)logEvent
{
  return self->_logEvent;
}

- (void)setKeyStore:(id)a3
{
}

- (HAPKeyStore)keyStore
{
  return self->_keyStore;
}

- (void)setPairedAccessoryIdentifiers:(id)a3
{
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setWorkQueue:(id)a3
{
}

- (id)logIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)recommendBrowserReset
{
  return 0;
}

- (void)stopConfirmingPairedAccessoryReachability
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)startConfirmingPairedAccessoryReachability
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)indicateNotificationFromServer:(id)a3 notifyType:(unint64_t)a4 withDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  v11 = NSString;
  v12 = NSStringFromSelector(a2);
  v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (BOOL)isPaired:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HAPAccessoryServerBrowser *)self pairedAccessoryIdentifiers];
  char v7 = [v6 containsObject:v4];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)resetPairedAccessories
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HAPAccessoryServerBrowser *)self pairedAccessoryIdentifiers];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)deRegisterAccessoryWithIdentifier:(id)a3
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = [(HAPAccessoryServerBrowser *)self pairedAccessoryIdentifiers];
  [v5 removeObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)matchAccessoryServerWithSetupID:(id)a3 serverIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  v13 = NSString;
  id v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (void)discoverAccessoryServerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  char v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)remoteBrowsingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_remoteBrowsingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRemoteBrowsingEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_remoteBrowsingEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)stopDiscoveringAccessoryServers
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)startDiscoveringAccessoryServers
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  id v10 = NSString;
  v11 = NSStringFromSelector(a2);
  uint64_t v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (HAPAccessoryServerBrowser)initWithQueue:(id)a3
{
  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPAccessoryServerBrowser;
  id v6 = [(HAPAccessoryServerBrowser *)&v15 init];
  if (v6)
  {
    dispatch_queue_t v7 = v5;
    if (!v5)
    {
      uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.HAPAccessoryBrowser", v3);
    }
    objc_storeStrong((id *)&v6->_workQueue, v7);
    if (!v5)
    {
    }
    uint64_t v8 = +[HAPSystemKeychainStore systemStore];
    keyStore = v6->_keyStore;
    v6->_keyStore = (HAPKeyStore *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    pairedAccessoryIdentifiers = v6->_pairedAccessoryIdentifiers;
    v6->_pairedAccessoryIdentifiers = (NSMutableSet *)v10;

    v6->_remoteBrowsingEnabled = 0;
    uint64_t v12 = +[HAPMetricsDispatcher sharedInstance];
    logEvent = v6->_logEvent;
    v6->_logEvent = (HAPMetricsDispatcher *)v12;
  }
  return v6;
}

@end
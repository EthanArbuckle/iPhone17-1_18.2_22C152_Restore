@interface ADLoggingProfileMonitor
- (ADLoggingProfileMonitor)init;
- (BOOL)_hasRelevantProfileChanged:(id)a3;
- (NSSet)profileIdentifiers;
- (OS_dispatch_queue)initQueue;
- (id)fetchInstalledProfileIdentifiers;
- (void)_beginMonitoring;
- (void)_fetchInstalledProfilesAndListen;
- (void)_profilesChanged:(id)a3;
- (void)setInitQueue:(id)a3;
- (void)setProfileIdentifiers:(id)a3;
@end

@implementation ADLoggingProfileMonitor

- (ADLoggingProfileMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADLoggingProfileMonitor;
  v2 = [(ADLoggingProfileMonitor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ADLoggingProfileMonitor *)v2 _fetchInstalledProfilesAndListen];
  }
  return v3;
}

- (void)_fetchInstalledProfilesAndListen
{
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ap.adprivacyd.ADLoggingProfileMonitor.init", 0);
  initQueue = self->_initQueue;
  self->_initQueue = v3;

  objc_initWeak(&location, self);
  objc_super v5 = self->_initQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__ADLoggingProfileMonitor__fetchInstalledProfilesAndListen__block_invoke;
  v6[3] = &unk_26466A0A0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__ADLoggingProfileMonitor__fetchInstalledProfilesAndListen__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v6 = -1;
    v2 = ADCopyDataFromKeychain();
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"Error %d reading installed profile data", 0xFFFFFFFFLL);
    _ADLog();

    if (!WeakRetained[1])
    {
      v4 = [NSString stringWithFormat:@"Reading installed profile list from MDM"];
      _ADLog();

      objc_super v5 = [WeakRetained fetchInstalledProfileIdentifiers];
      [WeakRetained setProfileIdentifiers:v5];
    }
    [WeakRetained _profilesChanged:0];
    [WeakRetained _beginMonitoring];
    [WeakRetained setInitQueue:0];
  }
  else
  {
    v2 = [NSString stringWithFormat:@"self == nil in [ADLoggingProfileMonitor _fetchInstalledProfilesAndListen]. Profile changes will not be monitored."];
    _ADLog();
  }
}

- (void)_profilesChanged:(id)a3
{
  v4 = [NSString stringWithFormat:@"Received profile list changed notification"];
  _ADLog();

  objc_super v5 = [(ADLoggingProfileMonitor *)self fetchInstalledProfileIdentifiers];
  BOOL v6 = [(ADLoggingProfileMonitor *)self _hasRelevantProfileChanged:v5];
  objc_storeStrong((id *)&self->_profileIdentifiers, v5);
  profileIdentifiers = self->_profileIdentifiers;
  id v13 = 0;
  v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:profileIdentifiers requiringSecureCoding:1 error:&v13];
  id v9 = v13;
  ADWriteDataToKeychain();

  if (v9)
  {
    v10 = [NSString stringWithFormat:@"Error writing installed profiles to keychain: %@", v9];
    _ADLog();
  }
  if (v6)
  {
    v11 = [NSString stringWithFormat:@"Ad Platforms logging profile has been removed or Personalized Ads profiles was installed/removed."];
    _ADLog();

    v12 = [MEMORY[0x263F241D8] sharedInstance];
    [v12 performOperationWhenNotReconciling:&__block_literal_global_6];
  }
}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke()
{
  v0 = [NSString stringWithFormat:@"Rolling all identifiers in response to profile removal/install."];
  _ADLog();

  id v1 = [MEMORY[0x263F241D8] sharedInstance];
  [v1 deleteRecords:&__block_literal_global_41];
}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke_2()
{
  id v2 = [MEMORY[0x263F241D8] sharedInstance];
  v0 = [MEMORY[0x263F241C0] sharedInstance];
  id v1 = [v0 iTunesAccountDSID];
  [v2 setDSID:v1 completionHandler:&__block_literal_global_44];
}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke_3()
{
  id v0 = [MEMORY[0x263F241D8] sharedInstance];
  [v0 reconcile:&__block_literal_global_47];
}

void __44__ADLoggingProfileMonitor__profilesChanged___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = [NSString stringWithFormat:@"There was an error reconciling after profile change. Error: %@. Please file a radar.", a2];
    _ADLog();
  }
}

- (BOOL)_hasRelevantProfileChanged:(id)a3
{
  v4 = NSString;
  profileIdentifiers = self->_profileIdentifiers;
  id v6 = a3;
  id v7 = [v4 stringWithFormat:@"Existing profile list\n%@", profileIdentifiers];
  char v8 = 1;
  _ADLog();

  id v9 = (id)[(NSSet *)self->_profileIdentifiers mutableCopy];
  [v9 minusSet:v6];
  v10 = (void *)[v6 mutableCopy];
  [v10 minusSet:v9];
  v11 = [NSString stringWithFormat:@"Installed profiles:\n%@", v6];

  _ADLog();
  v12 = [NSString stringWithFormat:@"Removed profiles:\n%@", v9];
  _ADLog();

  if (([v9 containsObject:@"com.apple.adplatforms.logging"] & 1) == 0
    && ([v9 containsObject:@"com.apple.dms.restrictions.allowApplePersonalizedAdvertising"] & 1) == 0)
  {
    char v8 = [v10 containsObject:@"com.apple.dms.restrictions.allowApplePersonalizedAdvertising"];
  }

  return v8;
}

- (id)fetchInstalledProfileIdentifiers
{
  id v2 = (void *)MEMORY[0x263EFF9C0];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  v4 = [v3 installedProfileIdentifiers];
  objc_super v5 = [v2 setWithArray:v4];

  return v5;
}

- (void)_beginMonitoring
{
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F53B18];
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  [v5 addObserver:self selector:sel__profilesChanged_ name:v3 object:v4];
}

- (NSSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (void)setProfileIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)initQueue
{
  initQueue = self->_initQueue;

  return initQueue;
}

- (void)setInitQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initQueue, 0);

  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
}

@end
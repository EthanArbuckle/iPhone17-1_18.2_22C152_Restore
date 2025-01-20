@interface _KSiCloudDeviceListMonitor
+ (id)iCloudDeviceListMonitor;
- (ACAccount)account;
- (ACAccountStore)accountStore;
- (BOOL)canMigrateToCloudKit;
- (BOOL)isSWVersionCloudKitSyncCompatible:(id)a3;
- (_KSiCloudDeviceListMonitor)init;
- (int64_t)majorVersForCloudKitSyncMacOS;
- (int64_t)majorVersForCloudKitSynciOS;
- (int64_t)minorSubversionForCloudKitSyncMacOS;
- (int64_t)minorVersForCloudKitSyncMacOS;
- (int64_t)minorVersForCloudKitSynciOS;
- (void)dealloc;
- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3;
- (void)fetchICloudDevicesWithCompletionBlock:(id)a3;
- (void)isAccountCompatibleForCloudKitSyncingWithCompletionBlock:(id)a3;
- (void)queryMigrationState;
- (void)resetDataNoAccount;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setMajorVersForCloudKitSyncMacOS:(int64_t)a3;
- (void)setMajorVersForCloudKitSynciOS:(int64_t)a3;
- (void)setMinorSubversionForCloudKitSyncMacOS:(int64_t)a3;
- (void)setMinorVersForCloudKitSyncMacOS:(int64_t)a3;
- (void)setMinorVersForCloudKitSynciOS:(int64_t)a3;
@end

@implementation _KSiCloudDeviceListMonitor

+ (id)iCloudDeviceListMonitor
{
  if (iCloudDeviceListMonitor_onceToken != -1) {
    dispatch_once(&iCloudDeviceListMonitor_onceToken, &__block_literal_global);
  }
  v2 = (void *)iCloudDeviceListMonitor_sharedInstance;
  return v2;
}

- (_KSiCloudDeviceListMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)_KSiCloudDeviceListMonitor;
  v2 = [(_KSiCloudDeviceListMonitor *)&v11 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    +[_KSTextReplacementHelper fetchConfigurationPlistIfNeeded];
    id v5 = objc_alloc(MEMORY[0x263EFFA40]);
    v6 = +[_KSUtilities userDefaultsSuiteName];
    v7 = (void *)[v5 initWithSuiteName:v6];

    uint64_t v8 = [(ACAccountStore *)v2->_accountStore aa_primaryAppleAccount];
    account = v2->_account;
    v2->_account = (ACAccount *)v8;

    -[_KSiCloudDeviceListMonitor setMajorVersForCloudKitSynciOS:](v2, "setMajorVersForCloudKitSynciOS:", [v7 integerForKey:@"iOSMajorVersForCloudKitSync"]);
    -[_KSiCloudDeviceListMonitor setMinorVersForCloudKitSynciOS:](v2, "setMinorVersForCloudKitSynciOS:", [v7 integerForKey:@"iOSMinorVersForCloudKitSync"]);
    -[_KSiCloudDeviceListMonitor setMajorVersForCloudKitSyncMacOS:](v2, "setMajorVersForCloudKitSyncMacOS:", [v7 integerForKey:@"osxMajorVersForCloudKitSync"]);
    -[_KSiCloudDeviceListMonitor setMinorVersForCloudKitSyncMacOS:](v2, "setMinorVersForCloudKitSyncMacOS:", [v7 integerForKey:@"osxMinorVersForCloudKitSync"]);
    -[_KSiCloudDeviceListMonitor setMinorSubversionForCloudKitSyncMacOS:](v2, "setMinorSubversionForCloudKitSyncMacOS:", [v7 integerForKey:@"osxMinorSubversionForCloudKitSync"]);
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_KSiCloudDeviceListMonitor;
  [(_KSiCloudDeviceListMonitor *)&v4 dealloc];
}

- (void)resetDataNoAccount
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v3 = +[_KSUtilities userDefaultsSuiteName];
  id v4 = (id)[v2 initWithSuiteName:v3];

  [v4 setBool:0 forKey:@"_KSTRCloudKitMigratable"];
  [v4 removeObjectForKey:@"_KSCKMigrationPreviousCheckDate"];
}

- (BOOL)isSWVersionCloudKitSyncCompatible:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (([v4 containsString:@"OSX"] & 1) != 0
      || [v5 containsString:@"iOS"])
    {
      int v6 = [v5 hasPrefix:@"OSX"];
      if (v6)
      {
        int64_t v7 = [(_KSiCloudDeviceListMonitor *)self majorVersForCloudKitSyncMacOS];
        int64_t v8 = [(_KSiCloudDeviceListMonitor *)self minorVersForCloudKitSyncMacOS];
        int64_t v9 = [(_KSiCloudDeviceListMonitor *)self minorSubversionForCloudKitSyncMacOS];
      }
      else
      {
        int64_t v7 = [(_KSiCloudDeviceListMonitor *)self majorVersForCloudKitSynciOS];
        int64_t v8 = [(_KSiCloudDeviceListMonitor *)self minorVersForCloudKitSynciOS];
        int64_t v9 = 0;
      }
      objc_super v11 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v5];
      v12 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
      v13 = [v12 invertedSet];
      [v11 setCharactersToBeSkipped:v13];

      uint64_t v16 = 0;
      int v15 = 0;
      BOOL v10 = [v11 scanInt:(char *)&v16 + 4]
         && [v11 scanInt:&v16]
         && (v7 < SHIDWORD(v16)
          || v7 == SHIDWORD(v16)
          && (((v8 <= (int)v16) & ~v6) != 0
           || v8 < (int)v16
           || v8 == (int)v16 && (!v9 || [v11 scanInt:&v15] && v9 <= v15)));
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)canMigrateToCloudKit
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  id v4 = +[_KSUtilities userDefaultsSuiteName];
  id v5 = (void *)[v3 initWithSuiteName:v4];

  char v6 = [v5 BOOLForKey:@"_KSTRCloudKitMigratable"];
  if ((v6 & 1) == 0)
  {
    int64_t v7 = [v5 objectForKey:@"_KSCKMigrationPreviousCheckDate"];
    int64_t v8 = v7;
    if (!v7 || ([v7 timeIntervalSinceNow], fabs(v9) > 216000.0)) {
      [(_KSiCloudDeviceListMonitor *)self queryMigrationState];
    }
  }
  return v6;
}

- (void)fetchCloudKitDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F257B8]);
  char v6 = [(_KSiCloudDeviceListMonitor *)self account];
  int64_t v7 = (void *)[v5 initWithAccount:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70___KSiCloudDeviceListMonitor_fetchCloudKitDevicesWithCompletionBlock___block_invoke;
  v9[3] = &unk_264890798;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performRequestWithHandler:v9];
}

- (void)fetchICloudDevicesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F25830]);
  char v6 = [(_KSiCloudDeviceListMonitor *)self account];
  int64_t v7 = (void *)[v5 initWithAccount:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68___KSiCloudDeviceListMonitor_fetchICloudDevicesWithCompletionBlock___block_invoke;
  v9[3] = &unk_2648907C0;
  id v10 = v4;
  id v8 = v4;
  [v7 performRequestWithHandler:v9];
}

- (void)queryMigrationState
{
  if (queryMigrationState_onceToken != -1) {
    dispatch_once(&queryMigrationState_onceToken, &__block_literal_global_147);
  }
  id v3 = [(_KSiCloudDeviceListMonitor *)self account];

  if (v3)
  {
    [(_KSiCloudDeviceListMonitor *)self isAccountCompatibleForCloudKitSyncingWithCompletionBlock:&__block_literal_global_157];
  }
}

- (void)isAccountCompatibleForCloudKitSyncingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87___KSiCloudDeviceListMonitor_isAccountCompatibleForCloudKitSyncingWithCompletionBlock___block_invoke;
  v6[3] = &unk_264890808;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_KSiCloudDeviceListMonitor *)self fetchCloudKitDevicesWithCompletionBlock:v6];
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (int64_t)majorVersForCloudKitSyncMacOS
{
  return self->_majorVersForCloudKitSyncMacOS;
}

- (void)setMajorVersForCloudKitSyncMacOS:(int64_t)a3
{
  self->_majorVersForCloudKitSyncMacOS = a3;
}

- (int64_t)minorVersForCloudKitSyncMacOS
{
  return self->_minorVersForCloudKitSyncMacOS;
}

- (void)setMinorVersForCloudKitSyncMacOS:(int64_t)a3
{
  self->_minorVersForCloudKitSyncMacOS = a3;
}

- (int64_t)minorSubversionForCloudKitSyncMacOS
{
  return self->_minorSubversionForCloudKitSyncMacOS;
}

- (void)setMinorSubversionForCloudKitSyncMacOS:(int64_t)a3
{
  self->_minorSubversionForCloudKitSyncMacOS = a3;
}

- (int64_t)majorVersForCloudKitSynciOS
{
  return self->_majorVersForCloudKitSynciOS;
}

- (void)setMajorVersForCloudKitSynciOS:(int64_t)a3
{
  self->_majorVersForCloudKitSynciOS = a3;
}

- (int64_t)minorVersForCloudKitSynciOS
{
  return self->_minorVersForCloudKitSynciOS;
}

- (void)setMinorVersForCloudKitSynciOS:(int64_t)a3
{
  self->_minorVersForCloudKitSynciOS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
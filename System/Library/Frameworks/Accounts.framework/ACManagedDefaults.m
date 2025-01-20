@interface ACManagedDefaults
+ (id)sharedInstance;
- (id)_readManagedDefaults;
- (id)valueForManagedDefault:(id)a3;
- (void)_writeManagedDefaults:(id)a3;
- (void)setValue:(id)a3 forManagedDefault:(id)a4;
@end

@implementation ACManagedDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_managedDefaults;

  return v2;
}

uint64_t __35__ACManagedDefaults_sharedInstance__block_invoke()
{
  sharedInstance_managedDefaults = objc_alloc_init(ACManagedDefaults);

  return MEMORY[0x1F41817F8]();
}

- (id)_readManagedDefaults
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/.GlobalPreferences.plist"];
}

- (void)_writeManagedDefaults:(id)a3
{
  _CFPreferencesWriteManagedDomainForUser();
  _CFPreferencesPostValuesChangedInDomains();

  MEMORY[0x1F40D8F88](&unk_1EFA15670);
}

- (id)valueForManagedDefault:(id)a3
{
  id v4 = a3;
  v5 = [(ACManagedDefaults *)self _readManagedDefaults];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    if ([v6 isNSNumber])
    {
      id v7 = v6;
LABEL_6:
      v8 = v7;
      goto LABEL_8;
    }
    if ([v6 isNSString])
    {
      id v7 = (id)objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v6, "intValue"));
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (void)setValue:(id)a3 forManagedDefault:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(ACManagedDefaults *)self _readManagedDefaults];
  v8 = (void *)[v7 mutableCopy];

  if ([v9 intValue] == -1)
  {
    [v8 removeObjectForKey:v6];
  }
  else
  {
    if (!v8)
    {
      v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    [v8 setValue:v9 forKey:v6];
  }
  [(ACManagedDefaults *)self _writeManagedDefaults:v8];
}

@end
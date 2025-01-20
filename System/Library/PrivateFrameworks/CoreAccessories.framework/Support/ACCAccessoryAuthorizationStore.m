@interface ACCAccessoryAuthorizationStore
+ (BOOL)removeAccessory:(id)a3;
+ (BOOL)storeAccessory:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4;
+ (id)sharedStore;
+ (id)storedAccessories;
+ (id)storedCertSerialStrings;
- (ACCAccessoryAuthorizationStore)init;
- (void)dealloc;
@end

@implementation ACCAccessoryAuthorizationStore

- (ACCAccessoryAuthorizationStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACCAccessoryAuthorizationStore;
  v2 = [(ACCAccessoryAuthorizationStore *)&v5 init];
  if (v2)
  {
    v3 = +[NSDistributedNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"knownAccessoriesDidChange:" name:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.CoreAccessories"];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ACCAccessoryAuthorizationStore;
  [(ACCAccessoryAuthorizationStore *)&v4 dealloc];
}

+ (id)sharedStore
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__ACCAccessoryAuthorizationStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStore_once != -1) {
    dispatch_once(&sharedStore_once, block);
  }
  v2 = (void *)sharedStore_sharedInstance;

  return v2;
}

uint64_t __45__ACCAccessoryAuthorizationStore_sharedStore__block_invoke(uint64_t a1)
{
  sharedStore_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

+ (id)storedAccessories
{
  v17 = +[NSMutableSet set];
  v2 = +[ACCUserDefaults sharedDefaults];
  v3 = [v2 dictionaryForKey:@"KnownAccessories"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0;
    v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v4 objectForKey:v11];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:v11 withAccessoryDict:v12];

            [v17 addObject:v13];
            v7 = (void *)v12;
            v8 = (void *)v13;
          }
          else
          {
            v7 = (void *)v12;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  id v14 = [v17 count];
  if (v14)
  {
    id v14 = +[NSSet setWithSet:v17];
  }
  id v15 = v14;

  return v15;
}

+ (id)storedCertSerialStrings
{
  v2 = +[NSMutableSet set];
  v3 = +[ACCUserDefaults sharedDefaults];
  id v4 = [v3 dictionaryForKey:@"KnownAccessories"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v10, (void)v13);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v2 count])
  {
    uint64_t v11 = +[NSSet setWithSet:v2];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (BOOL)storeAccessory:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 certSerialString],
        id v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 length],
        v4,
        v5))
  {
    v20[0] = @"displayName";
    id v6 = [v3 displayName];
    v21[0] = v6;
    v20[1] = @"authorized";
    id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 authorized]);
    v21[1] = v7;
    v20[2] = @"modified";
    uint64_t v8 = +[NSNumber numberWithLongLong:systemInfo_getCurrentUnixTime()];
    v21[2] = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

    id v10 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v11 = +[ACCUserDefaults sharedDefaults];
    uint64_t v12 = [v11 dictionaryForKey:@"KnownAccessories"];
    id v13 = [v10 initWithDictionary:v12];

    long long v14 = [v3 certSerialString];
    [v13 setObject:v9 forKey:v14];

    long long v15 = +[ACCUserDefaults sharedDefaults];
    [v15 setObject:v13 forKey:@"KnownAccessories"];

    long long v16 = +[NSDistributedNotificationCenter defaultCenter];
    [v16 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.CoreAccessories"];

    v17 = +[ACCUserDefaults sharedDefaults];
    unsigned __int8 v18 = [v17 synchronize];
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

+ (BOOL)removeAccessory:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableDictionary);
  id v5 = +[ACCUserDefaults sharedDefaults];
  id v6 = [v5 objectForKey:@"KnownAccessories"];
  id v7 = [v4 initWithDictionary:v6];

  uint64_t v8 = [v3 certSerialString];

  [v7 removeObjectForKey:v8];
  uint64_t v9 = +[ACCUserDefaults sharedDefaults];
  [v9 setObject:v7 forKey:@"KnownAccessories"];

  id v10 = +[NSDistributedNotificationCenter defaultCenter];
  [v10 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.CoreAccessories"];

  uint64_t v11 = +[ACCUserDefaults sharedDefaults];
  LOBYTE(v8) = [v11 synchronize];

  return (char)v8;
}

+ (id)authorizationEntryForCertSerial:(id)a3
{
  id v3 = a3;
  id v4 = +[ACCUserDefaults sharedDefaults];
  id v5 = [v4 dictionaryForKey:@"KnownAccessories"];

  id v6 = [v5 objectForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:v3 withAccessoryDict:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(ACCAccessoryAuthorizationEntry);
  [(ACCAccessoryAuthorizationEntry *)v7 setCertSerialString:v6];

  uint64_t v8 = [v5 objectForKey:@"displayName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ACCAccessoryAuthorizationEntry *)v7 setDisplayName:v8];
  }
  uint64_t v9 = [v5 objectForKey:@"authorized"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[ACCAccessoryAuthorizationEntry setAuthorized:](v7, "setAuthorized:", [v9 BOOLValue]);
  }

  return v7;
}

@end
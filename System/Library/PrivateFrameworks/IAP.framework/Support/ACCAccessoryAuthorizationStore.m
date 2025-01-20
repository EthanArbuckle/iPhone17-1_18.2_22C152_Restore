@interface ACCAccessoryAuthorizationStore
+ (BOOL)removeAccessory:(id)a3;
+ (BOOL)storeAccessory:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3;
+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4;
+ (id)sharedStore;
+ (id)storedAccessories;
+ (id)storedCertSerialStrings;
- (ACCAccessoryAuthorizationStore)init;
- (NSUserDefaults)userDefaults;
- (void)dealloc;
- (void)setUserDefaults:(id)a3;
@end

@implementation ACCAccessoryAuthorizationStore

- (ACCAccessoryAuthorizationStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACCAccessoryAuthorizationStore;
  v2 = [(ACCAccessoryAuthorizationStore *)&v10 init];
  if (v2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 bundleIdentifier];
    unsigned int v5 = [@"com.apple.iapd" isEqualToString:v4];

    if (v5)
    {
      v6 = +[NSUserDefaults standardUserDefaults];
    }
    else
    {
      v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.iapd"];
    }
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v6;

    v8 = +[NSDistributedNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"knownAccessoriesDidChange:" name:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.iapd"];
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
  block[2] = sub_1000ED0F0;
  block[3] = &unk_100121CE8;
  block[4] = a1;
  if (qword_10013C7B8 != -1) {
    dispatch_once(&qword_10013C7B8, block);
  }
  v2 = (void *)qword_10013C7B0;
  return v2;
}

+ (id)storedAccessories
{
  v18 = +[NSMutableSet set];
  v2 = +[ACCAccessoryAuthorizationStore sharedStore];
  v3 = [v2 userDefaults];
  objc_super v4 = [v3 dictionaryForKey:@"KnownAccessories"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v5 objectForKey:v12];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:v12 withAccessoryDict:v13];

            [v18 addObject:v14];
            v8 = (void *)v13;
            v9 = (void *)v14;
          }
          else
          {
            v8 = (void *)v13;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  id v15 = [v18 count];
  if (v15)
  {
    id v15 = +[NSSet setWithSet:v18];
  }
  id v16 = v15;

  return v16;
}

+ (id)storedCertSerialStrings
{
  v2 = +[NSMutableSet set];
  v3 = +[ACCAccessoryAuthorizationStore sharedStore];
  objc_super v4 = [v3 userDefaults];
  id v5 = [v4 dictionaryForKey:@"KnownAccessories"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v11, (void)v14);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v2 count])
  {
    uint64_t v12 = +[NSSet setWithSet:v2];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)storeAccessory:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 certSerialString],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 length],
        v4,
        v5))
  {
    v22[0] = @"displayName";
    id v6 = [v3 displayName];
    v22[1] = @"authorized";
    v23[0] = v6;
    id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 authorized]);
    v23[1] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v9 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v10 = +[ACCAccessoryAuthorizationStore sharedStore];
    uint64_t v11 = [v10 userDefaults];
    uint64_t v12 = [v11 dictionaryForKey:@"KnownAccessories"];
    id v13 = [v9 initWithDictionary:v12];

    long long v14 = [v3 certSerialString];
    [v13 setObject:v8 forKey:v14];

    long long v15 = +[ACCAccessoryAuthorizationStore sharedStore];
    long long v16 = [v15 userDefaults];
    [v16 setObject:v13 forKey:@"KnownAccessories"];

    long long v17 = +[NSDistributedNotificationCenter defaultCenter];
    [v17 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.iapd"];

    v18 = +[ACCAccessoryAuthorizationStore sharedStore];
    long long v19 = [v18 userDefaults];
    unsigned __int8 v20 = [v19 synchronize];
  }
  else
  {
    unsigned __int8 v20 = 0;
  }

  return v20;
}

+ (BOOL)removeAccessory:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableDictionary);
  id v5 = +[ACCAccessoryAuthorizationStore sharedStore];
  id v6 = [v5 userDefaults];
  id v7 = [v6 objectForKey:@"KnownAccessories"];
  id v8 = [v4 initWithDictionary:v7];

  id v9 = [v3 certSerialString];

  [v8 removeObjectForKey:v9];
  uint64_t v10 = +[ACCAccessoryAuthorizationStore sharedStore];
  uint64_t v11 = [v10 userDefaults];
  [v11 setObject:v8 forKey:@"KnownAccessories"];

  uint64_t v12 = +[NSDistributedNotificationCenter defaultCenter];
  [v12 postNotificationName:@"ACCKnownAccessoriesDidChangeNotification" object:@"com.apple.iapd"];

  id v13 = +[ACCAccessoryAuthorizationStore sharedStore];
  long long v14 = [v13 userDefaults];
  LOBYTE(v6) = [v14 synchronize];

  return (char)v6;
}

+ (id)authorizationEntryForCertSerial:(id)a3
{
  id v3 = a3;
  id v4 = +[ACCAccessoryAuthorizationStore sharedStore];
  id v5 = [v4 userDefaults];
  id v6 = [v5 dictionaryForKey:@"KnownAccessories"];

  id v7 = [v6 objectForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:v3 withAccessoryDict:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)authorizationEntryForCertSerial:(id)a3 withAccessoryDict:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(ACCAccessoryAuthorizationEntry);
  [(ACCAccessoryAuthorizationEntry *)v7 setCertSerialString:v6];

  id v8 = [v5 objectForKey:@"displayName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ACCAccessoryAuthorizationEntry *)v7 setDisplayName:v8];
  }
  id v9 = [v5 objectForKey:@"authorized"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[ACCAccessoryAuthorizationEntry setAuthorized:](v7, "setAuthorized:", [v9 BOOLValue]);
  }

  return v7;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
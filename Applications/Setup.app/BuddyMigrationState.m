@interface BuddyMigrationState
+ (BOOL)hasStateFromPreferences:(id)a3;
+ (id)loadFromPreferences:(id)a3;
+ (void)removeFromPreferences:(id)a3;
- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4;
- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4 persistDate:(id)a5;
- (NSDate)persistDate;
- (NSString)productBuild;
- (id)description;
- (unint64_t)intent;
- (void)persistUsingPreferences:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setPersistDate:(id)a3;
- (void)setProductBuild:(id)a3;
@end

@implementation BuddyMigrationState

- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4 persistDate:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v13 = a4;
  id obj = 0;
  objc_storeStrong(&obj, a5);
  id v7 = v15;
  id v15 = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyMigrationState;
  v8 = [(BuddyMigrationState *)&v11 init];
  id v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8)
  {
    objc_storeStrong((id *)v15 + 1, location[0]);
    *((void *)v15 + 2) = v13;
    objc_storeStrong((id *)v15 + 3, obj);
  }
  v9 = (BuddyMigrationState *)v15;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = v9;
  id v9 = 0;
  id v9 = [v5 initWithProductBuild:location[0] intent:a4 persistDate:0, a4];
  objc_storeStrong(&v9, v9);
  v6 = (BuddyMigrationState *)v9;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v6;
}

+ (id)loadFromPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = [location[0] objectForKey:@"showMigrationOnLaunch" includeCache:0];
  id v16 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [v17 objectForKeyedSubscript:@"productBuild"];
    id v14 = [v17 objectForKeyedSubscript:@"intent"];
    id v13 = [v17 objectForKeyedSubscript:@"persistDate"];
    v3 = -[BuddyMigrationState initWithProductBuild:intent:persistDate:]([BuddyMigrationState alloc], "initWithProductBuild:intent:persistDate:", v15, [v14 unsignedIntegerValue], v13);
    id v4 = v16;
    id v16 = v3;

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  if (!v16)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v11 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v5 = oslog;
      os_log_type_t v6 = v11;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "Missing or corrupt data when restoring migration state!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_10004BB7C((uint64_t)v19, (uint64_t)v17);
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Raw data: %{public}@", v19, 0xCu);
    }
    objc_storeStrong((id *)&v9, 0);
  }
  id v7 = v16;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (BOOL)hasStateFromPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] objectForKey:@"showMigrationOnLaunch"];
  BOOL v4 = v3 != 0;

  objc_storeStrong(location, 0);
  return v4;
}

- (void)persistUsingPreferences:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = [(BuddyMigrationState *)v8 productBuild];

  if (v3)
  {
    BOOL v4 = [(BuddyMigrationState *)v8 productBuild];
    [v6 setObject:v4 forKeyedSubscript:@"productBuild"];
  }
  id v5 = +[NSNumber numberWithUnsignedInteger:[(BuddyMigrationState *)v8 intent]];
  [v6 setObject:v5 forKeyedSubscript:@"intent"];

  [location[0] setObject:v6 forKey:@"showMigrationOnLaunch" persistImmediately:1];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

+ (void)removeFromPreferences:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] removeObjectForKey:@"showMigrationOnLaunch" onlyFromMemory:0];
  objc_storeStrong(location, 0);
}

- (id)description
{
  uint64_t v2 = objc_opt_class();
  id v3 = [(BuddyMigrationState *)self productBuild];
  BOOL v4 = +[NSString stringWithFormat:@"<%@ : %p> Build: %@ Intent: %ld", v2, self, v3, [(BuddyMigrationState *)self intent], a2];

  return v4;
}

- (NSString)productBuild
{
  return self->_productBuild;
}

- (void)setProductBuild:(id)a3
{
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (NSDate)persistDate
{
  return self->_persistDate;
}

- (void)setPersistDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
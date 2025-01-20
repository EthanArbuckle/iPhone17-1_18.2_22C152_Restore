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
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BuddyMigrationState;
  v11 = [(BuddyMigrationState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_productBuild, a3);
    v12->_intent = a4;
    objc_storeStrong((id *)&v12->_persistDate, a5);
  }

  return v12;
}

- (BuddyMigrationState)initWithProductBuild:(id)a3 intent:(unint64_t)a4
{
  return [(BuddyMigrationState *)self initWithProductBuild:a3 intent:a4 persistDate:0];
}

+ (id)loadFromPreferences:(id)a3
{
  v3 = [a3 objectForKey:@"showMigrationOnLaunch" includeCache:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_3;
  }
  v4 = [v3 objectForKeyedSubscript:@"productBuild"];
  v5 = [v3 objectForKeyedSubscript:@"intent"];
  v6 = [v3 objectForKeyedSubscript:@"persistDate"];
  v7 = -[BuddyMigrationState initWithProductBuild:intent:persistDate:]([BuddyMigrationState alloc], "initWithProductBuild:intent:persistDate:", v4, [v5 unsignedIntegerValue], v6);

  if (!v7)
  {
LABEL_3:
    v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_16318(v8);
    }

    id v9 = _BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_161C0((uint64_t)v3, v9);
    }

    v7 = 0;
  }

  return v7;
}

+ (BOOL)hasStateFromPreferences:(id)a3
{
  v3 = [a3 objectForKey:@"showMigrationOnLaunch"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)persistUsingPreferences:(id)a3
{
  id v4 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [(BuddyMigrationState *)self productBuild];

  if (v5)
  {
    v6 = [(BuddyMigrationState *)self productBuild];
    [v8 setObject:v6 forKeyedSubscript:@"productBuild"];
  }
  v7 = +[NSNumber numberWithUnsignedInteger:[(BuddyMigrationState *)self intent]];
  [v8 setObject:v7 forKeyedSubscript:@"intent"];

  [v4 setObject:v8 forKey:@"showMigrationOnLaunch" persistImmediately:1];
}

+ (void)removeFromPreferences:(id)a3
{
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(BuddyMigrationState *)self productBuild];
  v5 = +[NSString stringWithFormat:@"<%@ : %p> Build: %@ Intent: %ld", v3, self, v4, [(BuddyMigrationState *)self intent]];

  return v5;
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
  objc_storeStrong((id *)&self->_persistDate, 0);

  objc_storeStrong((id *)&self->_productBuild, 0);
}

@end
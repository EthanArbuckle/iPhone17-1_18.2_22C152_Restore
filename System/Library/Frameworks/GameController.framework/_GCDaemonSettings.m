@interface _GCDaemonSettings
+ (id)instance;
- (_GCDaemonSettings)init;
- (id)anonymizedIdentifierForControllerIdentifier:(id)a3;
- (id)newAnonymizedIdentifiersDictionary:(id)a3;
@end

@implementation _GCDaemonSettings

+ (id)instance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __29___GCDaemonSettings_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher_1 != -1) {
    dispatch_once(&instance_dispatcher_1, block);
  }
  v2 = (void *)instance_sharedInstance_1;

  return v2;
}

- (_GCDaemonSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDaemonSettings;
  v2 = [(_GCDaemonSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUserDefaults standardUserDefaults];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (id)newAnonymizedIdentifiersDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)&off_26D2B4CF0);
  [v4 setObject:&unk_26D287680 forKeyedSubscript:@"nextIdentifier"];
  [v4 setObject:v3 forKeyedSubscript:@"currentCycle"];

  [v4 setObject:&__NSDictionary0__struct forKeyedSubscript:@"identifiers"];
  return v4;
}

- (id)anonymizedIdentifierForControllerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (gc_isInternalBuild())
  {
    v24 = getGCDLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_220998000, v24, OS_LOG_TYPE_INFO, "anonymizedIdentifierForControllerIdentifier: %@", buf, 0xCu);
    }
  }
  objc_super v6 = +[NSDate date];
  [v6 timeIntervalSince1970];
  v8 = +[NSNumber numberWithLong:vcvtmd_s64_f64(v7 / 86400.0 / 91.0)];
  v9 = [(NSUserDefaults *)v5->_defaults objectForKey:@"anonymizedIdentifiers"];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 objectForKeyedSubscript:@"currentCycle"];
    int v12 = [v11 isEqualToNumber:v8];
    if (v12)
    {
      uint64_t v13 = +[NSMutableDictionary dictionaryWithDictionary:v10];
    }
    else
    {
      uint64_t v13 = [(_GCDaemonSettings *)v5 newAnonymizedIdentifiersDictionary:v8];
    }
    id v14 = (id)v13;

    int v15 = v12 ^ 1;
  }
  else
  {
    id v14 = [(_GCDaemonSettings *)v5 newAnonymizedIdentifiersDictionary:v8];
    int v15 = 1;
  }
  v16 = [v14 objectForKeyedSubscript:@"identifiers"];
  v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];

  v18 = [v17 objectForKeyedSubscript:v4];
  LODWORD(v16) = v18 == 0;

  if (v16)
  {
    v19 = [v14 objectForKeyedSubscript:@"nextIdentifier"];
    v20 = +[NSString stringWithFormat:@"controller-%@", v19];
    [v17 setObject:v20 forKeyedSubscript:v4];

    v21 = +[NSNumber numberWithInt:](&off_26D2B68C8, "numberWithInt:", [v19 intValue] + 1);
    [v14 setObject:v21 forKeyedSubscript:@"nextIdentifier"];

    int v15 = 1;
  }
  [v14 setObject:v17 forKeyedSubscript:@"identifiers"];
  if (v15)
  {
    if (gc_isInternalBuild())
    {
      v25 = getGCDLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v14;
        _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "Storing the following anonymizedIdentifiers: %@", buf, 0xCu);
      }
    }
    [(NSUserDefaults *)v5->_defaults setObject:v14 forKey:@"anonymizedIdentifiers"];
  }
  else if (gc_isInternalBuild())
  {
    v26 = getGCDLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v10;
      _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_INFO, "Values didn't change. Stored anonymizedIdentifiers are: %@", buf, 0xCu);
    }
  }
  v22 = [v17 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v22;
}

- (void).cxx_destruct
{
}

@end
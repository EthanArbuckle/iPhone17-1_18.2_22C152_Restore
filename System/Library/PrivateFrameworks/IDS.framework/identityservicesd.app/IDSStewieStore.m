@interface IDSStewieStore
- (BOOL)isEmpty;
- (BOOL)persistedStewieEnabledFlag;
- (IDSPersistentMap)persistentMap;
- (IDSStewieStore)init;
- (IDSStewieStore)initWithPersister:(id)a3;
- (id)persistedDeviceInfo;
- (id)persistedNextHeartbeat;
- (id)persistedNextRollKeys;
- (id)persistedNextRollSMSConfig;
- (id)persistedPhoneNumberInfos;
- (id)persistedSMSConfig;
- (id)persistedSPSEnvironment;
- (id)persistedStewieLoggingGUID;
- (void)clearPersistentMap;
- (void)persistDeviceInfo:(id)a3;
- (void)persistNextHeartbeat:(id)a3;
- (void)persistNextRollKeys:(id)a3;
- (void)persistNextRollSMSConfig:(id)a3;
- (void)persistPhoneNumberInfos:(id)a3;
- (void)persistSMSConfig:(id)a3;
- (void)persistSPSEnvironment:(id)a3;
- (void)persistStewieEnabled;
- (void)rollAndPersistStewieLoggingGUIDIfNeeded;
- (void)setPersistentMap:(id)a3;
@end

@implementation IDSStewieStore

- (IDSStewieStore)init
{
  v3 = +[IDSPersistentMap defaultPersisterForIdentifier:@"com.apple.identityservicesd.stewie.store" dataProtectionClass:0];
  v4 = [IDSPersistentMapDiskPersister alloc];
  v5 = objc_alloc_init(IDSKeychainWrapper);
  v6 = +[IMSystemMonitor sharedInstance];
  v7 = [(IDSPersistentMapDiskPersister *)v4 initWithIdentifier:@"com.apple.identityservicesd.stewie.store.v2" dataProtectionClass:0 keychainWrapper:v5 systemMonitor:v6 fileDirectory:@"/Library/IdentityServices/Persistence/DoNotBackup/"];

  v8 = [[IDSPersistentMigratingPersister alloc] initWithOriginPersister:v3 destinationPersister:v7];
  v9 = [(IDSStewieStore *)self initWithPersister:v8];

  return v9;
}

- (IDSStewieStore)initWithPersister:(id)a3
{
  id v4 = a3;
  v5 = [IDSPersistentMap alloc];
  v6 = sub_1003C6EBC();
  v7 = [(IDSPersistentMap *)v5 initWithIdentifier:@"com.apple.identityservicesd.stewie.store.v2" versionNumber:1 decodableClasses:v6 persister:v4 migrationBlock:0 allowBackup:0];

  v8 = (IDSStewieStore *)sub_1003C711C((id *)&self->super.isa, v7);
  return v8;
}

- (BOOL)isEmpty
{
  id v4 = [(IDSStewieStore *)self persistentMap];
  uint64_t v5 = [v4 objectForKey:@"StewieEnabled"];

  v6 = [(IDSStewieStore *)self persistentMap];
  uint64_t v7 = [v6 objectForKey:@"SPSEnvironment"];

  if (!CUTIsInternalInstall())
  {
    if (!v5
      || ([(IDSStewieStore *)self persistentMap],
          v6 = objc_claimAutoreleasedReturnValue(),
          [v6 allKeys],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 count] != (id)1))
    {
      v13 = [(IDSStewieStore *)self persistentMap];
      v14 = [v13 allKeys];
      BOOL v12 = [v14 count] == 0;

      if (!v5) {
        return v12;
      }
LABEL_14:

      return v12;
    }
LABEL_12:
    BOOL v12 = 1;
    goto LABEL_14;
  }
  BOOL v8 = (v5 | v7) == 0;
  if (!(v5 | v7))
  {
    int v9 = 0;
    goto LABEL_4;
  }
  v6 = [(IDSStewieStore *)self persistentMap];
  v2 = [v6 allKeys];
  if ([v2 count] == (id)1) {
    goto LABEL_12;
  }
  int v9 = 0;
  if (v5 && v7)
  {
    uint64_t v5 = [(IDSStewieStore *)self persistentMap];
    uint64_t v7 = [(id)v5 allKeys];
    if ([(id)v7 count] == (id)2)
    {

      goto LABEL_12;
    }
    int v9 = 1;
  }
LABEL_4:
  v10 = [(IDSStewieStore *)self persistentMap];
  v11 = [v10 allKeys];
  BOOL v12 = [v11 count] == 0;

  if (v9)
  {
  }
  if (!v8) {
    goto LABEL_14;
  }
  return v12;
}

- (id)persistedDeviceInfo
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"DeviceInfo"];

  return v3;
}

- (id)persistedPhoneNumberInfos
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"PhoneNumbers"];

  return v3;
}

- (id)persistedNextHeartbeat
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"NextHeartbeat"];

  if (v3)
  {
    [v3 doubleValue];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)persistedNextRollKeys
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"NextRollKeys"];

  if (v3)
  {
    [v3 doubleValue];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)persistedNextRollSMSConfig
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"NextRollSMSConfig"];

  if (v3)
  {
    [v3 doubleValue];
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)persistedStewieEnabledFlag
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"StewieEnabled"];

  return v3 != 0;
}

- (id)persistedSPSEnvironment
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"SPSEnvironment"];

  return v3;
}

- (void)persistDeviceInfo:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieStore *)self persistentMap];
  uint64_t v5 = v4;
  if (v6) {
    [v4 setObject:v6 forKey:@"DeviceInfo"];
  }
  else {
    [v4 removeObjectForKey:@"DeviceInfo"];
  }
}

- (void)persistPhoneNumberInfos:(id)a3
{
  id v7 = a3;
  id v4 = [v7 count];
  uint64_t v5 = [(IDSStewieStore *)self persistentMap];
  id v6 = v5;
  if (v4) {
    [v5 setObject:v7 forKey:@"PhoneNumbers"];
  }
  else {
    [v5 removeObjectForKey:@"PhoneNumbers"];
  }
}

- (void)persistNextHeartbeat:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieStore *)self persistentMap];
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v5 forKey:@"NextHeartbeat"];
  }
  else
  {
    [v4 removeObjectForKey:@"NextHeartbeat"];
  }
}

- (void)persistNextRollKeys:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieStore *)self persistentMap];
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v5 forKey:@"NextRollKeys"];
  }
  else
  {
    [v4 removeObjectForKey:@"NextRollKeys"];
  }
}

- (void)persistNextRollSMSConfig:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieStore *)self persistentMap];
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 setObject:v5 forKey:@"NextRollSMSConfig"];
  }
  else
  {
    [v4 removeObjectForKey:@"NextRollSMSConfig"];
  }
}

- (id)persistedSMSConfig
{
  v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"SMSConfig"];

  return v3;
}

- (void)persistSMSConfig:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieStore *)self persistentMap];
  uint64_t v5 = v4;
  if (v6) {
    [v4 setObject:v6 forKey:@"SMSConfig"];
  }
  else {
    [v4 removeObjectForKey:@"SMSConfig"];
  }
}

- (void)persistStewieEnabled
{
  id v2 = [(IDSStewieStore *)self persistentMap];
  [v2 setObject:&__kCFBooleanTrue forKey:@"StewieEnabled"];
}

- (void)persistSPSEnvironment:(id)a3
{
  id v6 = a3;
  id v4 = [(IDSStewieStore *)self persistentMap];
  uint64_t v5 = v4;
  if (v6) {
    [v4 setObject:v6 forKey:@"SPSEnvironment"];
  }
  else {
    [v4 removeObjectForKey:@"SPSEnvironment"];
  }
}

- (void)rollAndPersistStewieLoggingGUIDIfNeeded
{
  v3 = [(IDSStewieStore *)self persistentMap];
  id v16 = [v3 objectForKey:@"LoggingGUIDExpiry"];

  if (!v16) {
    goto LABEL_3;
  }
  id v4 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v16 unsignedLongLongValue]);
  uint64_t v5 = +[NSDate date];
  id v6 = [v5 compare:v4];

  id v7 = v16;
  if (v6 == (id)1)
  {
LABEL_3:
    BOOL v8 = +[NSDate date];
    int v9 = [v8 dateByAddingTimeInterval:2419200.0];
    [v9 timeIntervalSince1970];
    double v11 = v10;

    BOOL v12 = [(IDSStewieStore *)self persistentMap];
    v13 = +[NSString stringGUID];
    [v12 setObject:v13 forKey:@"LoggingGUID"];

    v14 = [(IDSStewieStore *)self persistentMap];
    v15 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v11];
    [v14 setObject:v15 forKey:@"LoggingGUIDExpiry"];

    id v7 = v16;
  }
}

- (id)persistedStewieLoggingGUID
{
  id v2 = [(IDSStewieStore *)self persistentMap];
  v3 = [v2 objectForKey:@"LoggingGUID"];

  return v3;
}

- (void)clearPersistentMap
{
  if (![(IDSStewieStore *)self isEmpty])
  {
    v3 = [(IDSStewieStore *)self persistentMap];
    [v3 removeAllObjects];

    id v4 = [(IDSStewieStore *)self persistentMap];
    [v4 persistImmediately];
  }
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
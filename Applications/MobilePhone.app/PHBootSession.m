@interface PHBootSession
- (BOOL)isInDifferentBootSession;
- (id)getBootSessionUUID;
- (id)lastKnownBootSessionID;
- (void)persistBootSessionID;
@end

@implementation PHBootSession

- (BOOL)isInDifferentBootSession
{
  v3 = [(PHBootSession *)self lastKnownBootSessionID];
  v4 = [(PHBootSession *)self getBootSessionUUID];
  char v5 = [v3 isEqualToString:v4] ^ 1;

  return v5;
}

- (void)persistBootSessionID
{
  id v2 = [(PHBootSession *)self getBootSessionUUID];
  PHPreferencesSetValueInDomain(@"PHLastBootUUIDKey", v2, TUBundleIdentifierMobilePhoneApplication);
}

- (id)getBootSessionUUID
{
  if (getBootSessionUUID_onceToken != -1) {
    dispatch_once(&getBootSessionUUID_onceToken, &__block_literal_global_37);
  }
  id v2 = (void *)getBootSessionUUID_bootUUID;

  return v2;
}

- (id)lastKnownBootSessionID
{
  id v2 = PHPreferencesGetValueInDomain(@"PHLastBootUUIDKey", TUBundleIdentifierMobilePhoneApplication);
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    char v5 = objc_opt_new();
    id v4 = [v5 UUIDString];
  }

  return v4;
}

void __35__PHBootSession_getBootSessionUUID__block_invoke(id a1)
{
  memset(v4, 0, sizeof(v4));
  size_t v3 = 37;
  if (!sysctlbyname("kern.bootsessionuuid", v4, &v3, 0, 0))
  {
    uint64_t v1 = +[NSString stringWithUTF8String:v4];
    id v2 = (void *)getBootSessionUUID_bootUUID;
    getBootSessionUUID_bootUUID = v1;
  }
}

@end
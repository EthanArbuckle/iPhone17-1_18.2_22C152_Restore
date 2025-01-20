@interface AADataclassManager
- (BOOL)_isHiddenDataclass:(id)a3;
- (BOOL)appIsNeitherInstalledOrPlaceholder:(id)a3;
- (BOOL)isAppRestrictedOnThisDevice:(id)a3;
- (BOOL)shouldShowSpecifierForDataclass:(id)a3 forAccount:(id)a4;
@end

@implementation AADataclassManager

- (BOOL)_isHiddenDataclass:(id)a3
{
  uint64_t v3 = qword_8FFD0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_8FFD0, &stru_754D0);
  }
  unsigned __int8 v5 = [(id)qword_8FFC8 containsObject:v4];

  return v5;
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((+[AADeviceInfo isMultiUserMode] & 1) != 0
    || (+[AADataclassManager sharedManager],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 isSystemAppMCRestrictedOrRemovedForDataclass:v6 forAccount:v7],
        v8,
        (v9 & 1) != 0)
    || [(AADataclassManager *)self _isHiddenDataclass:v6]
    || [v6 isEqualToString:ACAccountDataclassSharedStreams]
    && ([v7 isProvisionedForDataclass:ACAccountDataclassMediaStream] & 1) != 0
    || [(AADataclassManager *)self isAppRestrictedOnThisDevice:v6])
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    unsigned __int8 v10 = [v7 isProvisionedForDataclass:v6];
  }

  return v10;
}

- (BOOL)appIsNeitherInstalledOrPlaceholder:(id)a3
{
  id v3 = a3;
  id v4 = +[AADataclassManager sharedManager];
  unsigned __int8 v5 = [v4 appBundleIdentifierForDataclass:v3];

  id v6 = +[LSApplicationProxy applicationProxyForIdentifier:v5];
  id v7 = [v6 appState];
  if ([v7 isInstalled])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    unsigned __int8 v9 = [v6 appState];
    unsigned int v8 = [v9 isPlaceholder] ^ 1;
  }
  return v8;
}

- (BOOL)isAppRestrictedOnThisDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v3 isEqualToString:ACAccountDataclassHealth];
  }

  return 0;
}

@end
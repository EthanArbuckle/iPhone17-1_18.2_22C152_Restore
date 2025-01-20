@interface SynchronizeContactProvidersService
+ (BOOL)synchronizeAllContactProviderExtensions:(id *)a3;
+ (const)activityIdentifier;
+ (void)run;
@end

@implementation SynchronizeContactProvidersService

+ (const)activityIdentifier
{
  return "com.apple.contactsd.SynchronizeContactProvidersService";
}

+ (void)run
{
  v3 = +[CNContactsDaemonLogs synchronizeContactProviders];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ is running to synchronize all Contact Provider extensions.", buf, 0xCu);
  }
  id v10 = 0;
  unsigned int v5 = [a1 synchronizeAllContactProviderExtensions:&v10];
  id v6 = v10;
  v7 = +[CNContactsDaemonLogs synchronizeContactProviders];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ has finished synchronizing all Contact Provider extensions.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100016230(a1, (uint64_t)v6, v8);
  }
}

+ (BOOL)synchronizeAllContactProviderExtensions:(id *)a3
{
  id v4 = objc_alloc_init((Class)CNContactProviderSupportSession);
  [v4 setSynchronizationReason:CNContactProviderSupportSynchronizationReasonScheduledEvent];
  unsigned int v5 = +[CNContactProviderSupportModerator synchronizeAllUsingSession:v4];
  id v10 = 0;
  id v6 = [v5 result:&v10];
  id v7 = v10;
  v8 = v7;
  if (a3 && v7) {
    *a3 = v7;
  }

  return v8 == 0;
}

@end
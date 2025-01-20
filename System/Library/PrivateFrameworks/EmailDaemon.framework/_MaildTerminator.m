@interface _MaildTerminator
- (void)applicationsDidInstall:(id)a3;
@end

@implementation _MaildTerminator

- (void)applicationsDidInstall:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = kMFMobileMailBundleIdentifier;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) bundleIdentifier];
        unsigned int v9 = [v8 isEqualToString:v6];

        if (v9)
        {
          v10 = +[DaemonAppController log];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v11 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MobileMail was installed, terminating...", v11, 2u);
          }

          xpc_transaction_exit_clean();
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

@end
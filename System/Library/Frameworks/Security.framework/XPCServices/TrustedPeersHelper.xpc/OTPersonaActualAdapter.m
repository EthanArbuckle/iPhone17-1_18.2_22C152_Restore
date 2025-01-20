@interface OTPersonaActualAdapter
- (BOOL)currentThreadIsForPrimaryiCloudAccount;
- (OTPersonaActualAdapter)init;
- (id)currentThreadPersonaUniqueString;
- (void)performBlockWithPersonaIdentifier:(id)a3 block:(id)a4;
- (void)prepareThreadForKeychainAPIUseForPersonaIdentifier:(id)a3;
@end

@implementation OTPersonaActualAdapter

- (void)performBlockWithPersonaIdentifier:(id)a3 block:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(void))a4;
  v7 = [(OTPersonaActualAdapter *)self currentThreadPersonaUniqueString];
  if ([v8 isEqualToString:v7])
  {
    v6[2](v6);
  }
  else
  {
    [(OTPersonaActualAdapter *)self prepareThreadForKeychainAPIUseForPersonaIdentifier:v8];
    v6[2](v6);
    [(OTPersonaActualAdapter *)self prepareThreadForKeychainAPIUseForPersonaIdentifier:v7];
  }
}

- (void)prepareThreadForKeychainAPIUseForPersonaIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[UMUserPersona currentPersona];
  v5 = [v4 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  v6 = secLogObjForScope();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to adopt persona %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Adopted persona for id '%@'", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)currentThreadIsForPrimaryiCloudAccount
{
  v2 = +[UMUserManager sharedManager];
  id v3 = [v2 currentPersona];

  unint64_t v4 = (unint64_t)[v3 userPersonaType];
  BOOL v5 = 1;
  if (v4 <= 6)
  {
    if (((1 << v4) & 0x29) != 0) {
      goto LABEL_9;
    }
    if (((1 << v4) & 0x44) != 0)
    {
LABEL_8:
      BOOL v5 = 0;
      goto LABEL_9;
    }
  }
  if (v4 != 1000)
  {
    v6 = secLogObjForScope();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v3 userPersonaUniqueString];
      int v9 = 138412546;
      __int16 v10 = v7;
      __int16 v11 = 1024;
      unsigned int v12 = [v3 userPersonaType];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received unexpected Universal/Managed/other persona; treating as not for primary account: %@(%d)",
        (uint8_t *)&v9,
        0x12u);
    }
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)currentThreadPersonaUniqueString
{
  v2 = +[UMUserManager sharedManager];
  id v3 = [v2 currentPersona];

  unint64_t v4 = [v3 userPersonaUniqueString];

  return v4;
}

- (OTPersonaActualAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)OTPersonaActualAdapter;
  return [(OTPersonaActualAdapter *)&v3 init];
}

@end
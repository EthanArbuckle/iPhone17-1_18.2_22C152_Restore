@interface IDSStewiePhoneNumberManager
- (IDSPushHandler)pushHandler;
- (IDSRegistrationController)registrationController;
- (IDSRegistrationKeychainManager)registrationKeychainManager;
- (IDSStewiePhoneNumberManager)initWithDelegate:(id)a3 queue:(id)a4 userStore:(id)a5;
- (IDSStewiePhoneNumberManager)initWithDelegate:(id)a3 queue:(id)a4 userStore:(id)a5 registrationKeychainManager:(id)a6 registrationController:(id)a7 pushHandler:(id)a8;
- (IDSStewiePhoneNumberManagerDelegate)delegate;
- (IDSUserStore)userStore;
- (NSMutableDictionary)inProgressRegistrations;
- (NSMutableDictionary)phoneInfos;
- (id)createPhoneInfoForUser:(id)a3 cert:(id)a4;
- (void)clearCredentialsForInfo:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)obtainAuthCertForUser:(id)a3;
- (void)performInitialPhoneInfoCheck;
- (void)registrationController:(id)a3 registrationFailed:(id)a4 error:(int64_t)a5 info:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setInProgressRegistrations:(id)a3;
- (void)setPhoneInfos:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setRegistrationKeychainManager:(id)a3;
- (void)setUserStore:(id)a3;
- (void)userStore:(id)a3 didAddAuthenticationCertificate:(id)a4 forUser:(id)a5;
- (void)userStore:(id)a3 didAddUser:(id)a4;
- (void)userStore:(id)a3 didRemoveAuthenticationCertificateForUser:(id)a4;
- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5;
@end

@implementation IDSStewiePhoneNumberManager

- (IDSStewiePhoneNumberManager)initWithDelegate:(id)a3 queue:(id)a4 userStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[IDSRegistrationKeychainManager sharedInstance];
  v12 = +[IDSRegistrationController sharedInstance];
  v13 = +[IDSPushHandler sharedInstance];
  v14 = [(IDSStewiePhoneNumberManager *)self initWithDelegate:v10 queue:v9 userStore:v8 registrationKeychainManager:v11 registrationController:v12 pushHandler:v13];

  return v14;
}

- (IDSStewiePhoneNumberManager)initWithDelegate:(id)a3 queue:(id)a4 userStore:(id)a5 registrationKeychainManager:(id)a6 registrationController:(id)a7 pushHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)IDSStewiePhoneNumberManager;
  v19 = [(IDSStewiePhoneNumberManager *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_delegate, v14);
    objc_storeStrong((id *)&v20->_userStore, a5);
    [(IDSUserStore *)v20->_userStore addActionListener:v20 forRealm:0];
    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    phoneInfos = v20->_phoneInfos;
    v20->_phoneInfos = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inProgressRegistrations = v20->_inProgressRegistrations;
    v20->_inProgressRegistrations = v23;

    objc_storeStrong((id *)&v20->_registrationController, a7);
    [(IDSRegistrationController *)v20->_registrationController addListener:v20];
    objc_storeStrong((id *)&v20->_registrationKeychainManager, a6);
    objc_storeStrong((id *)&v20->_pushHandler, a8);
    [(IDSPushHandler *)v20->_pushHandler addListener:v20 topics:0 commands:0 queue:v15];
  }

  return v20;
}

- (void)dealloc
{
  [(IDSUserStore *)self->_userStore removeActionListener:self];
  [(IDSPushHandler *)self->_pushHandler removeListener:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSStewiePhoneNumberManager;
  [(IDSStewiePhoneNumberManager *)&v3 dealloc];
}

- (void)performInitialPhoneInfoCheck
{
  objc_super v3 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing initial stewie phone info check", buf, 2u);
  }

  v4 = [(IDSStewiePhoneNumberManager *)self userStore];
  v5 = [v4 usersWithRealm:0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[IDSStewiePhoneNumberManager obtainAuthCertForUser:](self, "obtainAuthCertForUser:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)clearCredentialsForInfo:(id)a3
{
  id v4 = a3;
  v5 = [(IDSStewiePhoneNumberManager *)self userStore];
  id v6 = [v4 uniqueIdentifier];
  id v7 = [v5 userWithUniqueIdentifier:v6];

  if (v7)
  {
    id v8 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      long long v14 = v7;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing auth cert for user { user: %@, info: %@ }", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v9 = [(IDSStewiePhoneNumberManager *)self phoneInfos];
    id v10 = [v4 uniqueIdentifier];
    [v9 setObject:0 forKeyedSubscript:v10];

    long long v11 = +[IDSPACStateTracker sharedInstance];
    [v11 notePhoneAuthCertLost:3];

    long long v12 = [(IDSStewiePhoneNumberManager *)self userStore];
    [v12 setAuthenticationCertificate:0 forUser:v7];
  }
}

- (void)obtainAuthCertForUser:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  im_dispatch_after_primary_queue();
}

- (id)createPhoneInfoForUser:(id)a3 cert:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[IDSStewiePhoneNumberInfo alloc] initWithUser:v6 authenticationCertificate:v5];

  return v7;
}

- (void)userStore:(id)a3 didAddUser:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Added user, obtaining auth cert { user: %@ }", (uint8_t *)&v7, 0xCu);
  }

  [(IDSStewiePhoneNumberManager *)self obtainAuthCertForUser:v5];
}

- (void)userStore:(id)a3 didRemoveUser:(id)a4 withAuthenticationCertificate:(id)a5
{
  id v6 = a4;
  int v7 = [v6 uniqueIdentifier];

  if (v7)
  {
    id v8 = [(IDSStewiePhoneNumberManager *)self phoneInfos];
    uint64_t v9 = [v6 uniqueIdentifier];
    [v8 setObject:0 forKeyedSubscript:v9];

    id v10 = [(IDSStewiePhoneNumberManager *)self inProgressRegistrations];
    long long v11 = [v6 uniqueIdentifier];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    int v13 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removed user, removing auth cert { user: %@ }", (uint8_t *)&v14, 0xCu);
    }

    sub_1002CD924(self, v12);
    sub_1002CD718(self);
  }
}

- (void)userStore:(id)a3 didAddAuthenticationCertificate:(id)a4 forUser:(id)a5
{
  id v6 = a5;
  int v7 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Obtained auth cert { user: %@ }", (uint8_t *)&v14, 0xCu);
  }

  id v8 = [v6 uniqueIdentifier];

  if (v8)
  {
    uint64_t v9 = [(IDSStewiePhoneNumberManager *)self inProgressRegistrations];
    id v10 = [v6 uniqueIdentifier];
    long long v11 = [v9 objectForKeyedSubscript:v10];

    [v11 removeFromKeychain];
    long long v12 = [(IDSStewiePhoneNumberManager *)self inProgressRegistrations];
    int v13 = [v6 uniqueIdentifier];
    [v12 setObject:0 forKeyedSubscript:v13];

    [(IDSStewiePhoneNumberManager *)self obtainAuthCertForUser:v6];
  }
}

- (void)userStore:(id)a3 didRemoveAuthenticationCertificateForUser:(id)a4
{
  id v5 = a4;
  id v6 = +[IDSFoundationLog stewieProvisioning];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified auth cert was removed. Reobtaining... { user: %@ }", (uint8_t *)&v10, 0xCu);
  }

  int v7 = [v5 uniqueIdentifier];

  if (v7)
  {
    id v8 = [(IDSStewiePhoneNumberManager *)self phoneInfos];
    uint64_t v9 = [v5 uniqueIdentifier];
    [v8 setObject:0 forKeyedSubscript:v9];

    [(IDSStewiePhoneNumberManager *)self obtainAuthCertForUser:v5];
  }
}

- (void)registrationController:(id)a3 registrationFailed:(id)a4 error:(int64_t)a5 info:(id)a6
{
  id v8 = a4;
  uint64_t v9 = [(IDSStewiePhoneNumberManager *)self inProgressRegistrations];
  int v10 = [v8 userUniqueIdentifier];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    long long v12 = +[IDSFoundationLog stewieProvisioning];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10071DB50((uint64_t)v8, a5, v12);
    }

    sub_1002CD924(self, v11);
    sub_1002CD718(self);
  }
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  id v5 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(IDSStewiePhoneNumberManager *)self inProgressRegistrations];
  int v7 = [v6 allKeys];

  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v9 = 138412290;
    long long v18 = v9;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v12);
        int v14 = [(IDSStewiePhoneNumberManager *)self inProgressRegistrations];
        id v15 = [v14 objectForKeyedSubscript:v13];

        id v16 = [v15 pushToken];

        if (!v16)
        {
          id v17 = +[IDSFoundationLog stewieProvisioning];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v24 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Notified push token obtained. Kicking registration { registration: %@ }", buf, 0xCu);
          }

          [v15 setPushToken:v5];
          sub_1002CD600(self, v15);
        }

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }
}

- (IDSStewiePhoneNumberManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSStewiePhoneNumberManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (IDSRegistrationKeychainManager)registrationKeychainManager
{
  return self->_registrationKeychainManager;
}

- (void)setRegistrationKeychainManager:(id)a3
{
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (NSMutableDictionary)phoneInfos
{
  return self->_phoneInfos;
}

- (void)setPhoneInfos:(id)a3
{
}

- (NSMutableDictionary)inProgressRegistrations
{
  return self->_inProgressRegistrations;
}

- (void)setInProgressRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressRegistrations, 0);
  objc_storeStrong((id *)&self->_phoneInfos, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_userStore, 0);
  objc_storeStrong((id *)&self->_registrationKeychainManager, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
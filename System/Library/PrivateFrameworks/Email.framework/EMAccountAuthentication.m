@interface EMAccountAuthentication
+ (id)log;
- (BOOL)_hostnamesHaveSameTopLevelDomain:(id)a3 deliveryAccount:(id)a4;
- (BOOL)_shouldAutoUpdateDeliveryAccount:(id)a3 forChangedReceivingAccount:(id)a4;
- (BOOL)_updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:(id)a3;
- (BOOL)_updateDeliveryAccountCredentialIfNecessaryForReceivingAccount:(id)a3;
- (BOOL)updateDeliveryAccountCredentialIfNecessaryForAccountWithIdentifier:(id)a3;
- (BOOL)updateDeliveryAccountCredentialIfNecessaryForAccountWithSystemAccount:(id)a3;
- (EDAccountFactory)accountFactory;
- (EMAccountAuthentication)initWithAccountFactory:(id)a3;
@end

@implementation EMAccountAuthentication

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EMAccountAuthentication_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return v2;
}

void __30__EMAccountAuthentication_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (EMAccountAuthentication)initWithAccountFactory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMAccountAuthentication;
  v6 = [(EMAccountAuthentication *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountFactory, a3);
  }

  return v7;
}

- (BOOL)updateDeliveryAccountCredentialIfNecessaryForAccountWithSystemAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(EMAccountAuthentication *)self accountFactory];
  v6 = [v5 accountWithSystemAccount:v4];
  LOBYTE(self) = [(EMAccountAuthentication *)self _updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:v6];

  return (char)self;
}

- (BOOL)updateDeliveryAccountCredentialIfNecessaryForAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(EMAccountAuthentication *)self accountFactory];
  v6 = [v5 accountWithIdentifier:v4];
  LOBYTE(self) = [(EMAccountAuthentication *)self _updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:v6];

  return (char)self;
}

- (BOOL)_updateDeliveryAccountCredentialIfNecessaryForAccountWithAccount:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 conformsToProtocol:&unk_1F1A86690])
  {
    BOOL v6 = [(EMAccountAuthentication *)self _updateDeliveryAccountCredentialIfNecessaryForReceivingAccount:v5];
  }
  else
  {
    v7 = +[EMAccountAuthentication log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 identifier];
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1BEFDB000, v7, OS_LOG_TYPE_DEFAULT, "Account is not a receiving account. No delivery account to update: %@", (uint8_t *)&v10, 0xCu);
    }
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_updateDeliveryAccountCredentialIfNecessaryForReceivingAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 deliveryAccount];
  BOOL v6 = +[EMAccountAuthentication log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 identifier];
    int v19 = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1BEFDB000, v6, OS_LOG_TYPE_DEFAULT, "Receiving account password changed: %@", (uint8_t *)&v19, 0xCu);
  }
  v8 = +[EMAccountAuthentication log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v5;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "Attempt to update password if needed for delivery account %@", (uint8_t *)&v19, 0xCu);
  }

  if (!v5)
  {
    int v10 = +[EMAccountAuthentication log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v11 = "No delivery account password found. Nothing to do";
LABEL_13:
      _os_log_impl(&dword_1BEFDB000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 2u);
    }
LABEL_14:
    char v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (![(EMAccountAuthentication *)self _shouldAutoUpdateDeliveryAccount:v5 forChangedReceivingAccount:v4])
  {
    int v10 = +[EMAccountAuthentication log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v11 = "Should not try to update delivery account password";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (([v5 canAuthenticateWithCurrentCredentials] & 1) == 0)
  {
    int v10 = [v5 password];
    v13 = [v4 password];
    v14 = [v5 systemAccount];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v13];
    [v14 setCredential:v15];
    char v9 = [v5 canAuthenticateWithCurrentCredentials];
    if (v9)
    {
      [v5 savePersistentAccount];
      v16 = +[EMAccountAuthentication log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1BEFDB000, v16, OS_LOG_TYPE_DEFAULT, "Updating password worked for delivery account: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      v17 = +[EMAccountAuthentication log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEFAULT, "Updating password for %@ did not work. Reverting password", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F179C0]) initWithPassword:v10];
      v15 = (void *)v18;
      [v14 setCredential:v18];
    }

    goto LABEL_15;
  }
  char v9 = 1;
LABEL_16:

  return v9;
}

- (BOOL)_shouldAutoUpdateDeliveryAccount:(id)a3 forChangedReceivingAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v7 hasPasswordCredential]
    && [v6 hasPasswordCredential]
    && [(EMAccountAuthentication *)self _hostnamesHaveSameTopLevelDomain:v7 deliveryAccount:v6];

  return v8;
}

- (BOOL)_hostnamesHaveSameTopLevelDomain:(id)a3 deliveryAccount:(id)a4
{
  id v5 = a4;
  id v6 = [a3 hostname];
  id v7 = [v5 hostname];
  if ([v6 isEqualToString:v7])
  {
    char v8 = 1;
  }
  else
  {
    char v9 = [v6 componentsSeparatedByString:@"."];
    int v10 = [v7 componentsSeparatedByString:@"."];
    unint64_t v11 = [v9 count];
    unint64_t v12 = [v10 count];
    char v8 = 0;
    if (v11 >= 3)
    {
      unint64_t v13 = v12;
      if (v12 >= 3)
      {
        v14 = [v9 objectAtIndexedSubscript:v11 - 1];
        v15 = [v10 objectAtIndexedSubscript:v13 - 1];
        if ([v14 isEqualToString:v15])
        {
          v16 = [v9 objectAtIndexedSubscript:v11 - 2];
          v17 = [v10 objectAtIndexedSubscript:v13 - 2];
          char v8 = [v16 isEqualToString:v17];
        }
        else
        {
          char v8 = 0;
        }
      }
    }
  }
  return v8;
}

- (EDAccountFactory)accountFactory
{
  return self->_accountFactory;
}

- (void).cxx_destruct
{
}

@end
@interface AKAccountStore
- (BOOL)isAccountDaemonConnectionError:(id)a3;
- (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4;
- (id)accountTypeWithAccountTypeIdentifier:(id)a3 error:(id *)a4;
- (id)accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)credentialForAccount:(id)a3 error:(id *)a4;
- (id)credentialForAccount:(id)a3 serviceID:(id)a4 error:(id *)a5;
@end

@implementation AKAccountStore

- (BOOL)isAccountDaemonConnectionError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == 10002)
  {
    v4 = [v3 domain];
    char v5 = [v4 isEqualToString:*MEMORY[0x1E4F178E8]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AKAccountStore;
  char v5 = [(AKAccountStore *)&v7 accountsWithAccountType:a3 options:a4 error:a5];

  return v5;
}

- (id)accountTypeWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAccountStore;
  objc_super v7 = [(AKAccountStore *)&v14 accountTypeWithAccountTypeIdentifier:v6 error:a4];
  if (a4 && [(AKAccountStore *)self isAccountDaemonConnectionError:*a4])
  {
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Retrying fetching account type operation...", buf, 2u);
    }

    v12.receiver = self;
    v12.super_class = (Class)AKAccountStore;
    id v9 = [(AKAccountStore *)&v12 accountTypeWithAccountTypeIdentifier:v6 error:0];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (id)credentialForAccount:(id)a3 serviceID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AKAccountStore;
  v10 = [(AKAccountStore *)&v17 credentialForAccount:v8 serviceID:v9 error:a5];
  if (a5 && [(AKAccountStore *)self isAccountDaemonConnectionError:*a5])
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v11, OS_LOG_TYPE_DEFAULT, "Retrying credential fetch with service id...", buf, 2u);
    }

    v15.receiver = self;
    v15.super_class = (Class)AKAccountStore;
    id v12 = [(AKAccountStore *)&v15 credentialForAccount:v8 serviceID:v9 error:0];
  }
  else
  {
    id v12 = v10;
  }
  v13 = v12;

  return v13;
}

- (id)credentialForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAccountStore;
  objc_super v7 = [(AKAccountStore *)&v14 credentialForAccount:v6 error:a4];
  if (a4 && [(AKAccountStore *)self isAccountDaemonConnectionError:*a4])
  {
    id v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193494000, v8, OS_LOG_TYPE_DEFAULT, "Retrying credential fetch operation...", buf, 2u);
    }

    v12.receiver = self;
    v12.super_class = (Class)AKAccountStore;
    id v9 = [(AKAccountStore *)&v12 credentialForAccount:v6 error:0];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (BOOL)saveVerifiedAccount:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AKAccountStore;
  return [(AKAccountStore *)&v5 saveVerifiedAccount:a3 error:a4];
}

@end
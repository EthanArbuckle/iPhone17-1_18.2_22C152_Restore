@interface IDSAccountController
- (IDSAccountController)initWithService:(id)a3;
- (NSSet)accounts;
- (id)_initWithService:(id)a3;
- (id)_initWithService:(id)a3 onIDSQueue:(BOOL)a4;
- (id)_internal;
- (id)accountWithLoginID:(id)a3 service:(id)a4;
- (id)accountWithUniqueID:(id)a3;
- (id)enabledAccounts;
- (id)serviceName;
- (void)_disableAccount:(id)a3;
- (void)_enableAccount:(id)a3;
- (void)_removeAccount:(id)a3;
- (void)addAccount:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)disableAccount:(id)a3;
- (void)enableAccount:(id)a3;
- (void)removeAccount:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setupAccountWithLoginID:(id)a3 aliases:(id)a4 password:(id)a5 completionHandler:(id)a6;
- (void)setupAccountWithLoginID:(id)a3 password:(id)a4 completionHandler:(id)a5;
- (void)setupAccountWithSetupParameters:(id)a3 aliases:(id)a4 completionHandler:(id)a5;
@end

@implementation IDSAccountController

- (id)_initWithService:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2EF40();
    }
  }
  id v8 = [(IDSAccountController *)self _initWithService:v4 onIDSQueue:1];

  return v8;
}

- (id)_initWithService:(id)a3 onIDSQueue:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (_IDSRunningInDaemon())
  {
    v7 = +[IDSLogging IDSAccountController];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2EC8C((uint64_t)self, v7);
    }

    uint64_t v4 = 0;
    goto LABEL_21;
  }
  id v8 = +[IDSInternalQueueController sharedInstance];
  v9 = v8;
  if (v4)
  {
    int v10 = [v8 assertQueueIsCurrent];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A2ED2C();
      }
LABEL_12:
    }
  }
  else
  {
    int v12 = [v8 assertQueueIsNotCurrent];

    if (v12)
    {
      v11 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A2EDC8();
      }
      goto LABEL_12;
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)IDSAccountController;
  v13 = [(IDSAccountController *)&v36 init];
  if (!v13) {
    goto LABEL_20;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1919186F0;
  v34 = sub_191918598;
  id v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = sub_1919114AC;
  v21 = &unk_1E572AE10;
  v24 = &v30;
  id v22 = v6;
  v25 = &v26;
  self = v13;
  v23 = self;
  uint64_t v14 = MEMORY[0x192FE03B0](&v18);
  v15 = (void *)v14;
  if (v4)
  {
    (*(void (**)(uint64_t))(v14 + 16))(v14);
  }
  else
  {
    uint64_t v4 = +[IDSInternalQueueController sharedInstance];
    [(id)v4 performBlock:v15 waitUntilDone:1];
  }
  int v16 = *((unsigned __int8 *)v27 + 24);
  if (*((unsigned char *)v27 + 24)) {
    uint64_t v4 = (uint64_t)(id)v31[5];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  if (!v16)
  {
LABEL_20:
    self = v13;
    uint64_t v4 = (uint64_t)self;
  }
LABEL_21:

  return (id)v4;
}

- (id)_internal
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A2F160();
    }
  }
  internal = self->_internal;

  return internal;
}

- (IDSAccountController)initWithService:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsNotCurrent];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A2EFD8();
    }
  }
  id v8 = [(IDSAccountController *)self _initWithService:v4 onIDSQueue:0];

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_191A2F0E8((uint64_t)self, v3);
  }

  id v4 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_191A2F070((uint64_t)self, v4);
  }

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1919186F0;
  v8[4] = sub_191918598;
  v9 = (_IDSAccountController *)0xAAAAAAAAAAAAAAAALL;
  v9 = self->_internal;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19196522C;
  v7[3] = &unk_1E5728DD0;
  v7[4] = v8;
  [v5 performBlock:v7 waitUntilDone:0];

  _Block_object_dispose(v8, 8);
  v6.receiver = self;
  v6.super_class = (Class)IDSAccountController;
  [(IDSAccountController *)&v6 dealloc];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_191965338;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11 waitUntilDone:1];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919653F8;
  v6[3] = &unk_1E5729BB0;
  v6[4] = self;
  v6[5] = v4;
  [v5 performBlock:v6 waitUntilDone:1];
}

- (NSSet)accounts
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1919186F0;
  id v12 = sub_191918598;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191965548;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (id)enabledAccounts
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1919186F0;
  id v12 = sub_191918598;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919656DC;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)serviceName
{
  v3 = +[IDSDaemonController sharedInstance];
  [v3 blockUntilConnected];

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1919186F0;
  id v12 = sub_191918598;
  id v13 = 0;
  id v4 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191965870;
  v7[3] = &unk_1E5728DF8;
  v7[4] = self;
  void v7[5] = &v8;
  [v4 performBlock:v7 waitUntilDone:1];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)accountWithLoginID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSDaemonController sharedInstance];
  [v8 blockUntilConnected];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1919186F0;
  id v22 = sub_191918598;
  id v23 = 0;
  id v9 = +[IDSInternalQueueController sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_191965A58;
  v14[3] = &unk_1E5729D90;
  v17 = &v18;
  v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  [v9 performBlock:v14 waitUntilDone:1];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)accountWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSDaemonController sharedInstance];
  [v5 blockUntilConnected];

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1919186F0;
  v17 = sub_191918598;
  id v18 = 0;
  id v6 = +[IDSInternalQueueController sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_191965C18;
  v10[3] = &unk_1E5729190;
  id v12 = &v13;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  [v6 performBlock:v10 waitUntilDone:1];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setupAccountWithLoginID:(id)a3 aliases:(id)a4 password:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[IDSInternalQueueController sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_191965D90;
  v19[3] = &unk_1E572AE38;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 performBlock:v19];
}

- (void)setupAccountWithLoginID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSInternalQueueController sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_191965EAC;
  v15[3] = &unk_1E5729A88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

- (void)setupAccountWithSetupParameters:(id)a3 aliases:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl(&dword_19190B000, v11, OS_LOG_TYPE_DEFAULT, "* Request to setup account with aliases: %@ and parameters:", buf, 0xCu);
  }

  [v8 enumerateKeysAndObjectsUsingBlock:&unk_1EE2464E8];
  id v12 = +[IDSInternalQueueController sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_191966178;
  v16[3] = &unk_1E5729A88;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 performBlock:v16];
}

- (void)addAccount:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSAccountController *)self serviceName];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "* Request to add account: %@   service: %@", buf, 0x16u);
  }
  id v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919662E8;
  v9[3] = &unk_1E57291B8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

- (void)removeAccount:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSAccountController *)self serviceName];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "* Request to remove account: %@   service: %@", buf, 0x16u);
  }
  id v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_191966450;
  v9[3] = &unk_1E57291B8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

- (void)_removeAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191966514;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)enableAccount:(id)a3
{
}

- (void)disableAccount:(id)a3
{
}

- (void)_enableAccount:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSAccountController *)self serviceName];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "* Request to enable account: %@   service: %@", buf, 0x16u);
  }
  id v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_191966684;
  v9[3] = &unk_1E57291B8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

- (void)_disableAccount:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSAccountController *)self serviceName];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "* Request to disable account: %@   service: %@", buf, 0x16u);
  }
  id v7 = +[IDSInternalQueueController sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1919667EC;
  v9[3] = &unk_1E57291B8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

- (void).cxx_destruct
{
}

@end
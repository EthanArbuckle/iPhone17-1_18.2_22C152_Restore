@interface IDSPinnedIdentityManager
- (void)clearAllPinnedIdentities;
- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3;
- (void)fetchIdentityForPinningWithCompletion:(id)a3;
- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSPinnedIdentityManager

- (void)fetchIdentityForPinningWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F6B460] IDSPinnedIdentity];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Client requested identity for pinning.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19198FBC8;
  v6[3] = &unk_1E572A940;
  id v7 = v3;
  id v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v6];
}

- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6B460] IDSPinnedIdentity];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "Client requested to pin identity {identityBlob: %@}", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_19198FDC8;
  v10[3] = &unk_1E5729FE8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[IDSXPCDaemonController performDaemonControllerTask:v10];
}

- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F6B460] IDSPinnedIdentity];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19190B000, v4, OS_LOG_TYPE_DEFAULT, "Client requested all pinned identities", buf, 2u);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19198FF68;
  v6[3] = &unk_1E572A940;
  id v7 = v3;
  id v5 = v3;
  +[IDSXPCDaemonController performDaemonControllerTask:v6];
}

- (void)clearAllPinnedIdentities
{
  v2 = [MEMORY[0x1E4F6B460] IDSPinnedIdentity];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_19190B000, v2, OS_LOG_TYPE_DEFAULT, "Client requested to clear all pinned identities", v3, 2u);
  }

  +[IDSXPCDaemonController performDaemonControllerTask:&unk_1EE246E08];
}

@end
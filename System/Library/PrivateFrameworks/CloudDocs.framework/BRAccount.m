@interface BRAccount
+ (BOOL)_refreshCurrentLoggedInAccountForcingRefresh:(BOOL)a3 personaID:(id)a4 error:(id *)a5;
+ (BOOL)refreshCurrentLoggedInAccount;
+ (BOOL)refreshCurrentLoggedInAccountWithError:(id *)a3;
+ (id)currentCachedLoggedInAccountWithError:(id *)a3;
+ (id)currentLoggedInAccountWithError:(id *)a3;
+ (void)startAccountTokenChangeObserverIfNeeded;
- (BOOL)getEvictableSpace:(id *)a3 error:(id *)a4;
- (BOOL)hasOptimizeStorageWithError:(id *)a3;
- (BOOL)iCloudDesktopSettingsChangedWithAttributes:(id)a3 error:(id *)a4;
- (BOOL)setOptimizeStorageEnabled:(BOOL)a3 error:(id *)a4;
- (BRAccount)init;
- (BRAccount)initWithAccountID:(id)a3;
- (NSData)perAppAccountIdentifier;
- (id)containerWithPendingChanges;
- (void)containerWithPendingChanges;
- (void)evictOldDocumentsWithHandler:(id)a3;
- (void)setPerAppAccountIdentifier:(id)a3;
@end

@implementation BRAccount

+ (BOOL)_refreshCurrentLoggedInAccountForcingRefresh:(BOOL)a3 personaID:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!currentLoggedInAccountOrNullByPersonaID)
  {
    uint64_t v9 = objc_opt_new();
    v10 = (void *)currentLoggedInAccountOrNullByPersonaID;
    currentLoggedInAccountOrNullByPersonaID = v9;
  }
  if (a5) {
    *a5 = 0;
  }
  [a1 startAccountTokenChangeObserverIfNeeded];
  v11 = [(id)currentLoggedInAccountOrNullByPersonaID objectForKeyedSubscript:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  v13 = v12;
  if (!v11 || v6)
  {
    uint64_t v41 = brc_monotonic_time_now();
    v15 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v16 = [v15 bundleIdentifier];
    v44 = v15;
    v17 = [v15 infoDictionary];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"CFBundleShortVersionString"];

    id v19 = [[BRDaemonConnection alloc] initUsingUserLocalDaemonTokenService];
    v20 = (void *)[v19 newSyncTokenProxy];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __74__BRAccount__refreshCurrentLoggedInAccountForcingRefresh_personaID_error___block_invoke;
    v45[3] = &unk_1E59AD3F8;
    id v21 = v20;
    id v46 = v21;
    v42 = (void *)v18;
    v43 = (void *)v16;
    [v21 currentAccountCopyTokenWithBundleID:v16 version:v18 reply:v45];
    v22 = [v21 result];
    if (a5)
    {
      *a5 = [v21 error];
    }
    v23 = [v21 error];

    if (v23)
    {
      v24 = brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 109);
      v25 = brc_default_log(0);
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        +[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:](v21, (uint64_t)v24, v25);
      }
    }
    [v19 invalidate];
    v26 = [(BRAccount *)v13 perAppAccountIdentifier];
    if (v22 == v26 || ([v22 isEqual:v26] & 1) != 0)
    {
      if (!v11)
      {
        v27 = [MEMORY[0x1E4F1CA98] null];
        [(id)currentLoggedInAccountOrNullByPersonaID setObject:v27 forKeyedSubscript:v8];
      }
      BOOL v14 = 0;
    }
    else
    {
      v28 = brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 122);
      v29 = brc_default_log(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v48 = v26;
        __int16 v49 = 2112;
        v50 = v22;
        __int16 v51 = 2112;
        v52 = v28;
        _os_log_debug_impl(&dword_19ED3F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] got an account change (previous token %@, new token %@)%@", buf, 0x20u);
      }

      v30 = +[BRDaemonConnection defaultConnectionIfExists];
      v31 = [v30 remoteObjectProxy];
      [v31 updatePrivilegesDescriptor];

      v32 = +[BRDaemonConnection secondaryConnectionIfExists];
      v33 = [v32 remoteObjectProxy];
      [v33 updatePrivilegesDescriptor];

      if (v22)
      {
        v34 = objc_alloc_init(BRAccount);

        [(BRAccount *)v34 setPerAppAccountIdentifier:v22];
        [(id)currentLoggedInAccountOrNullByPersonaID setObject:v34 forKeyedSubscript:v8];
        BOOL v14 = 1;
        v13 = v34;
      }
      else
      {
        v35 = [MEMORY[0x1E4F1CA98] null];
        [(id)currentLoggedInAccountOrNullByPersonaID setObject:v35 forKeyedSubscript:v8];

        BOOL v14 = 1;
      }
    }
    uint64_t v36 = brc_monotonic_time_now();
    double v37 = brc_monotonic_time_diff_to_interval(v36 - v41);
    if (v37 <= 0.5 || qos_class_self() < QOS_CLASS_USER_INITIATED)
    {
      v38 = brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 143);
      v39 = brc_default_log(1);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        +[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]();
      }
    }
    else
    {
      v38 = brc_bread_crumbs((uint64_t)"+[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:]", 141);
      v39 = brc_default_log(0);
      if (os_log_type_enabled(v39, (os_log_type_t)0x90u)) {
        +[BRAccount _refreshCurrentLoggedInAccountForcingRefresh:personaID:error:](v37);
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)startAccountTokenChangeObserverIfNeeded
{
  if (startAccountTokenChangeObserverIfNeeded_onceToken != -1) {
    dispatch_once(&startAccountTokenChangeObserverIfNeeded_onceToken, &__block_literal_global_69);
  }
}

+ (id)currentCachedLoggedInAccountWithError:(id *)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  BOOL v6 = objc_msgSend(v5, "br_currentPersonaID");

  [v4 _refreshCurrentLoggedInAccountForcingRefresh:0 personaID:v6 error:a3];
  v7 = [(id)currentLoggedInAccountOrNullByPersonaID objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  objc_sync_exit(v4);

  return v8;
}

- (NSData)perAppAccountIdentifier
{
  return self->_perAppAccountIdentifier;
}

- (void)setPerAppAccountIdentifier:(id)a3
{
}

- (BRAccount)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRAccount;
  v2 = [(BRAccount *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v4 = objc_msgSend(v3, "br_currentPersonaID");
    personaID = v2->_personaID;
    v2->_personaID = (NSString *)v4;
  }
  return v2;
}

uint64_t __74__BRAccount__refreshCurrentLoggedInAccountForcingRefresh_personaID_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke()
{
  uint64_t v21 = 0;
  v22 = (int *)&v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("account-token-change-observer", v1);

  v3 = (void *)startAccountTokenChangeObserverIfNeeded_tokenChangeObserverQueue;
  startAccountTokenChangeObserverIfNeeded_tokenChangeObserverQueue = (uint64_t)v2;

  BRAccountTokenChangedNotification();
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (const char *)[v4 UTF8String];
  BOOL v6 = v22;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2;
  id v19 = &unk_1E59AD470;
  v20 = &v21;
  objc_super v7 = (id)startAccountTokenChangeObserverIfNeeded_tokenChangeObserverQueue;
  id v8 = &v16;
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB36F8], "sharedManager", v16, v17, v18, v19, v20);
  v10 = objc_msgSend(v9, "br_currentPersonaID");

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __br_notify_register_dispatch_block_invoke;
  handler[3] = &unk_1E59AD580;
  id v11 = v10;
  id v26 = v11;
  v28 = v5;
  v12 = v8;
  v27 = v12;
  uint32_t v13 = notify_register_dispatch(v5, v6 + 6, v7, handler);

  if (v13)
  {
    BOOL v14 = brc_bread_crumbs((uint64_t)"+[BRAccount(BRPrivate) startAccountTokenChangeObserverIfNeeded]_block_invoke", 273);
    v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_cold_1((uint64_t)v14, v13, v15);
    }
  }
  _Block_object_dispose(&v21, 8);
}

+ (id)currentLoggedInAccountWithError:(id *)a3
{
  [a1 refreshCurrentLoggedInAccount];

  return (id)[a1 currentCachedLoggedInAccountWithError:a3];
}

+ (BOOL)refreshCurrentLoggedInAccountWithError:(id *)a3
{
  id v4 = a1;
  objc_sync_enter(v4);
  memset(v11, 0, sizeof(v11));
  __brc_create_section(0, (uint64_t)"+[BRAccount refreshCurrentLoggedInAccountWithError:]", 172, v11);
  v5 = brc_bread_crumbs((uint64_t)"+[BRAccount refreshCurrentLoggedInAccountWithError:]", 172);
  BOOL v6 = brc_default_log(1);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[BRAccount refreshCurrentLoggedInAccountWithError:](v11);
  }

  objc_super v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v8 = objc_msgSend(v7, "br_currentPersonaID");

  char v9 = [v4 _refreshCurrentLoggedInAccountForcingRefresh:1 personaID:v8 error:a3];
  __brc_leave_section((uint64_t)v11);
  objc_sync_exit(v4);

  return v9;
}

+ (BOOL)refreshCurrentLoggedInAccount
{
  return [a1 refreshCurrentLoggedInAccountWithError:0];
}

- (BRAccount)initWithAccountID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRAccount;
  BOOL v6 = [(BRAccount *)&v12 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountID, a3);
    id v8 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v9 = objc_msgSend(v8, "br_currentPersonaID");
    personaID = v7->_personaID;
    v7->_personaID = (NSString *)v9;
  }
  return v7;
}

- (id)containerWithPendingChanges
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (v3 = self->_personaID) == 0)
  {
    if (containerWithPendingChanges___personaOnceToken != -1) {
      dispatch_once(&containerWithPendingChanges___personaOnceToken, &__block_literal_global_0);
    }
    id v4 = (NSString *)(id)containerWithPendingChanges___personalPersona;
    int v5 = 1;
  }
  else
  {
    id v4 = v3;
    int v5 = 0;
  }
  BOOL v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  objc_super v7 = [v6 currentPersona];

  id v35 = 0;
  id v8 = [v7 userPersonaUniqueString];
  uint64_t v9 = v8;
  if (v8 == v4 || [(NSString *)v8 isEqualToString:v4])
  {
    v10 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v34 = 0;
    v22 = (void *)[v7 copyCurrentPersonaContextWithError:&v34];
    id v23 = v34;
    id v24 = v35;
    id v35 = v22;

    if (v23)
    {
      v25 = brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
      id v26 = brc_default_log(0);
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
        -[BRAccount containerWithPendingChanges]();
      }
    }
    v10 = [v7 generateAndRestorePersonaContextWithPersonaUniqueString:v4];

    if (v10)
    {
      v27 = brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
      v28 = brc_default_log(0);
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = personaID;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        v38 = v27;
        _os_log_error_impl(&dword_19ED3F000, v28, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_35:
    }
  }
  else
  {
    if (v5 && ([v7 isDataSeparatedPersona] & 1) == 0)
    {
      v27 = brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
      v28 = brc_default_log(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
      v10 = 0;
      goto LABEL_35;
    }
    v30 = brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 209);
    v31 = brc_default_log(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BRAccount containerWithPendingChanges].cold.4();
    }

    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRAccount containerWithPendingChanges]", 211, buf);
  id v11 = brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 211);
  objc_super v12 = brc_default_log(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[BRAccount containerWithPendingChanges](buf);
  }

  uint32_t v13 = +[BRDaemonConnection defaultConnection];
  BOOL v14 = (void *)[v13 newSyncProxy];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __40__BRAccount_containerWithPendingChanges__block_invoke_34;
  v32[3] = &unk_1E59AD420;
  id v15 = v14;
  id v33 = v15;
  [v15 getContainersNeedingUpload:v32];
  uint64_t v16 = [v15 result];
  uint64_t v17 = [v15 error];

  if (v17)
  {
    uint64_t v18 = brc_bread_crumbs((uint64_t)"-[BRAccount containerWithPendingChanges]", 218);
    id v19 = brc_default_log(0);
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v20 = [v15 error];
      [(BRAccount *)v20 containerWithPendingChanges];
    }
  }
  __brc_leave_section((uint64_t)buf);

  _BRRestorePersona(&v35);

  return v16;
}

void __40__BRAccount_containerWithPendingChanges__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)containerWithPendingChanges___personalPersona;
  containerWithPendingChanges___personalPersona = v0;
}

uint64_t __40__BRAccount_containerWithPendingChanges__block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

- (BOOL)iCloudDesktopSettingsChangedWithAttributes:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (objc_super v7 = self->_personaID) == 0)
  {
    if (iCloudDesktopSettingsChangedWithAttributes_error____personaOnceToken != -1) {
      dispatch_once(&iCloudDesktopSettingsChangedWithAttributes_error____personaOnceToken, &__block_literal_global_37);
    }
    id v8 = (NSString *)(id)iCloudDesktopSettingsChangedWithAttributes_error____personalPersona;
    int v9 = 1;
  }
  else
  {
    id v8 = v7;
    int v9 = 0;
  }
  v10 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v11 = [v10 currentPersona];

  id v34 = 0;
  objc_super v12 = [v11 userPersonaUniqueString];
  uint32_t v13 = v12;
  if (v12 == v8 || [(NSString *)v12 isEqualToString:v8])
  {
    BOOL v14 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v33 = 0;
    uint64_t v21 = (void *)[v11 copyCurrentPersonaContextWithError:&v33];
    id v22 = v33;
    id v23 = v34;
    id v34 = v21;

    if (v22)
    {
      id v24 = brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
      v25 = brc_default_log(0);
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        -[BRAccount containerWithPendingChanges]();
      }
    }
    BOOL v14 = [v11 generateAndRestorePersonaContextWithPersonaUniqueString:v8];

    if (v14)
    {
      id v26 = brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
      v27 = brc_default_log(0);
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        uint64_t v36 = personaID;
        __int16 v37 = 2112;
        v38 = v14;
        __int16 v39 = 2112;
        v40 = v26;
        _os_log_error_impl(&dword_19ED3F000, v27, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v9 && ([v11 isDataSeparatedPersona] & 1) == 0)
    {
      id v26 = brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
      v27 = brc_default_log(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
      BOOL v14 = 0;
      goto LABEL_29;
    }
    v29 = brc_bread_crumbs((uint64_t)"-[BRAccount iCloudDesktopSettingsChangedWithAttributes:error:]", 227);
    v30 = brc_default_log(1);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRAccount containerWithPendingChanges].cold.4();
    }

    BOOL v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  id v15 = +[BRDaemonConnection defaultConnection];
  uint64_t v16 = (void *)[v15 newSyncProxy];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __62__BRAccount_iCloudDesktopSettingsChangedWithAttributes_error___block_invoke_38;
  v31[3] = &unk_1E59AD448;
  id v17 = v16;
  id v32 = v17;
  [v17 iCloudDesktopSettingsChangedWithAttributes:v6 reply:v31];
  if (a4)
  {
    *a4 = [v17 error];
  }
  uint64_t v18 = [v17 error];
  BOOL v19 = v18 == 0;

  _BRRestorePersona(&v34);
  return v19;
}

void __62__BRAccount_iCloudDesktopSettingsChangedWithAttributes_error___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)iCloudDesktopSettingsChangedWithAttributes_error____personalPersona;
  iCloudDesktopSettingsChangedWithAttributes_error____personalPersona = v0;
}

void __62__BRAccount_iCloudDesktopSettingsChangedWithAttributes_error___block_invoke_38(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = NSNumber;
  BOOL v4 = a2 == 0;
  id v5 = a2;
  id v6 = [v3 numberWithInt:v4];
  [v2 setObjResult:v6 error:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_personaID, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2()
{
  uint64_t v0 = brc_bread_crumbs((uint64_t)"+[BRAccount(BRPrivate) startAccountTokenChangeObserverIfNeeded]_block_invoke_2", 258);
  v1 = brc_default_log(1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2_cold_1();
  }

  id v2 = (void *)MEMORY[0x19F3C4670]();
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"BRAccountTokenWillChangeNotification" object:0];

  BOOL v4 = (void *)MEMORY[0x19F3C4670]();
  +[BRAccount refreshCurrentLoggedInAccount];
  id v5 = [MEMORY[0x1E4F179C8] defaultStore];
  [v5 invalidateAccountForPersonaCache];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"BRAccountTokenDidChangeNotification" object:0];
}

- (BOOL)hasOptimizeStorageWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (BOOL v4 = self->_personaID) == 0)
  {
    if (hasOptimizeStorageWithError____personaOnceToken != -1) {
      dispatch_once(&hasOptimizeStorageWithError____personaOnceToken, &__block_literal_global_75);
    }
    id v5 = (NSString *)(id)hasOptimizeStorageWithError____personalPersona;
    int v6 = 1;
  }
  else
  {
    id v5 = v4;
    int v6 = 0;
  }
  objc_super v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v8 = [v7 currentPersona];

  id v36 = 0;
  int v9 = [v8 userPersonaUniqueString];
  v10 = v9;
  if (v9 == v5 || [(NSString *)v9 isEqualToString:v5])
  {
    id v11 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v35 = 0;
    uint64_t v21 = (void *)[v8 copyCurrentPersonaContextWithError:&v35];
    id v22 = v35;
    id v23 = v36;
    id v36 = v21;

    if (v22)
    {
      id v24 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
      v25 = brc_default_log(0);
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        -[BRAccount containerWithPendingChanges]();
      }
    }
    id v11 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    if (v11)
    {
      id v26 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
      v27 = brc_default_log(0);
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v38 = (const char *)personaID;
        __int16 v39 = 2112;
        v40 = v11;
        __int16 v41 = 2112;
        v42 = v26;
        _os_log_error_impl(&dword_19ED3F000, v27, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:
    }
  }
  else
  {
    if (v6 && ([v8 isDataSeparatedPersona] & 1) == 0)
    {
      id v26 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
      v27 = brc_default_log(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
      id v11 = 0;
      goto LABEL_32;
    }
    v29 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 282);
    v30 = brc_default_log(1);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRAccount containerWithPendingChanges].cold.4();
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  objc_super v12 = +[BRDaemonConnection defaultConnection];
  uint32_t v13 = (void *)[v12 newSyncProxy];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __52__BRAccount_BRPrivate__hasOptimizeStorageWithError___block_invoke_76;
  v33[3] = &unk_1E59AD498;
  id v14 = v13;
  id v34 = v14;
  [v14 hasOptimizeStorageWithReply:v33];
  id v15 = [v14 result];
  char v16 = [v15 BOOLValue];

  id v17 = [v14 error];
  if (v17)
  {
    uint64_t v18 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]", 290);
    BOOL v19 = brc_default_log(0);
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v31 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v38 = "-[BRAccount(BRPrivate) hasOptimizeStorageWithError:]";
      __int16 v39 = 2080;
      if (!a3) {
        v31 = "(ignored by caller)";
      }
      v40 = v31;
      __int16 v41 = 2112;
      v42 = v17;
      __int16 v43 = 2112;
      v44 = v18;
      _os_log_error_impl(&dword_19ED3F000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a3) {
    *a3 = v17;
  }

  _BRRestorePersona(&v36);
  return v16;
}

void __52__BRAccount_BRPrivate__hasOptimizeStorageWithError___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)hasOptimizeStorageWithError____personalPersona;
  hasOptimizeStorageWithError____personalPersona = v0;
}

uint64_t __52__BRAccount_BRPrivate__hasOptimizeStorageWithError___block_invoke_76(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

- (BOOL)setOptimizeStorageEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (int v6 = self->_personaID) == 0)
  {
    if (setOptimizeStorageEnabled_error____personaOnceToken != -1) {
      dispatch_once(&setOptimizeStorageEnabled_error____personaOnceToken, &__block_literal_global_81);
    }
    objc_super v7 = (NSString *)(id)setOptimizeStorageEnabled_error____personalPersona;
    int v8 = 1;
  }
  else
  {
    objc_super v7 = v6;
    int v8 = 0;
  }
  int v9 = [MEMORY[0x1E4FB36F8] sharedManager];
  v10 = [v9 currentPersona];

  id v38 = 0;
  id v11 = [v10 userPersonaUniqueString];
  objc_super v12 = v11;
  if (v11 == v7 || [(NSString *)v11 isEqualToString:v7])
  {
    uint32_t v13 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v37 = 0;
    id v22 = (void *)[v10 copyCurrentPersonaContextWithError:&v37];
    id v23 = v37;
    id v24 = v38;
    id v38 = v22;

    if (v23)
    {
      v25 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
      id v26 = brc_default_log(0);
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
        -[BRAccount containerWithPendingChanges]();
      }
    }
    uint32_t v13 = [v10 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

    if (v13)
    {
      v27 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
      v28 = brc_default_log(0);
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        v40 = (const char *)personaID;
        __int16 v41 = 2112;
        v42 = v13;
        __int16 v43 = 2112;
        v44 = v27;
        _os_log_error_impl(&dword_19ED3F000, v28, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:
    }
  }
  else
  {
    if (v8 && ([v10 isDataSeparatedPersona] & 1) == 0)
    {
      v27 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
      v28 = brc_default_log(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
      uint32_t v13 = 0;
      goto LABEL_32;
    }
    v30 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 296);
    v31 = brc_default_log(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BRAccount containerWithPendingChanges].cold.4();
    }

    uint32_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  id v14 = +[BRDaemonConnection defaultConnection];
  id v15 = (void *)[v14 newSyncProxy];

  objc_initWeak(&location, v15);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __56__BRAccount_BRPrivate__setOptimizeStorageEnabled_error___block_invoke_82;
  v34[3] = &unk_1E59AD4C0;
  objc_copyWeak(&v35, &location);
  [v15 setStorageOpimizationEnabled:v4 reply:v34];
  char v16 = [v15 error];
  if (v16)
  {
    id v17 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]", 304);
    uint64_t v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      id v32 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v40 = "-[BRAccount(BRPrivate) setOptimizeStorageEnabled:error:]";
      __int16 v41 = 2080;
      if (!a4) {
        id v32 = "(ignored by caller)";
      }
      v42 = v32;
      __int16 v43 = 2112;
      v44 = v16;
      __int16 v45 = 2112;
      id v46 = v17;
      _os_log_error_impl(&dword_19ED3F000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v16;
  }

  BOOL v19 = [v15 error];
  BOOL v20 = v19 == 0;

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  _BRRestorePersona(&v38);
  return v20;
}

void __56__BRAccount_BRPrivate__setOptimizeStorageEnabled_error___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)setOptimizeStorageEnabled_error____personalPersona;
  setOptimizeStorageEnabled_error____personalPersona = v0;
}

void __56__BRAccount_BRPrivate__setOptimizeStorageEnabled_error___block_invoke_82(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setBoolResult:v3 == 0 error:v3];
}

- (BOOL)getEvictableSpace:(id *)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!BRIsFPFSEnabled(self, a2))
  {
    if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
      || (id v11 = self->_personaID) == 0)
    {
      if (getEvictableSpace_error____personaOnceToken != -1) {
        dispatch_once(&getEvictableSpace_error____personaOnceToken, &__block_literal_global_86);
      }
      id v7 = (id)getEvictableSpace_error____personalPersona;
      int v12 = 1;
    }
    else
    {
      id v7 = v11;
      int v12 = 0;
    }
    uint32_t v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v14 = [v13 currentPersona];

    id v38 = 0;
    id v15 = [v14 userPersonaUniqueString];
    char v16 = v15;
    if (v15 == v7 || ([v15 isEqualToString:v7] & 1) != 0)
    {
      id v17 = 0;
      goto LABEL_16;
    }
    if (voucher_process_can_use_arbitrary_personas())
    {
      id v37 = 0;
      id v24 = (void *)[v14 copyCurrentPersonaContextWithError:&v37];
      id v25 = v37;
      id v26 = v38;
      id v38 = v24;

      if (v25)
      {
        v27 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
        v28 = brc_default_log(0);
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
          -[BRAccount containerWithPendingChanges]();
        }
      }
      id v17 = [v14 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

      if (v17)
      {
        v29 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
        v30 = brc_default_log(0);
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          personaID = self->_personaID;
          *(_DWORD *)buf = 138412802;
          v40 = (const char *)personaID;
          __int16 v41 = 2112;
          v42 = v17;
          __int16 v43 = 2112;
          id v44 = v29;
          _os_log_error_impl(&dword_19ED3F000, v30, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
LABEL_40:
      }
    }
    else
    {
      if (v12 && ([v14 isDataSeparatedPersona] & 1) == 0)
      {
        v29 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
        v30 = brc_default_log(1);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[BRAccount containerWithPendingChanges].cold.5();
        }
        id v17 = 0;
        goto LABEL_40;
      }
      id v32 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 315);
      id v33 = brc_default_log(1);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.4();
      }

      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    }
LABEL_16:
    uint64_t v18 = +[BRDaemonConnection defaultConnection];
    BOOL v19 = (void *)[v18 newLegacySyncProxy];

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __48__BRAccount_BRPrivate__getEvictableSpace_error___block_invoke_87;
    v35[3] = &unk_1E59AD4E8;
    id v20 = v19;
    id v36 = v20;
    [v20 getEvictableSpaceWithReply:v35];
    uint64_t v21 = [v20 error];

    BOOL v10 = v21 == 0;
    if (v21)
    {
      if (!a4)
      {
LABEL_22:

        _BRRestorePersona(&v38);
        goto LABEL_23;
      }
      id v22 = [v20 error];
    }
    else
    {
      id v22 = [v20 result];
      a4 = a3;
    }
    *a4 = v22;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_getEvictableSpaceWithReply_);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    int v8 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) getEvictableSpace:error:]", 311);
    int v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      id v34 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v40 = "-[BRAccount(BRPrivate) getEvictableSpace:error:]";
      __int16 v41 = 2080;
      if (!a4) {
        id v34 = "(ignored by caller)";
      }
      v42 = v34;
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      id v46 = v8;
      _os_log_error_impl(&dword_19ED3F000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4)
  {
    id v7 = v7;
    BOOL v10 = 0;
    *a4 = v7;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_23:

  return v10;
}

void __48__BRAccount_BRPrivate__getEvictableSpace_error___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)getEvictableSpace_error____personalPersona;
  getEvictableSpace_error____personalPersona = v0;
}

void __48__BRAccount_BRPrivate__getEvictableSpace_error___block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithUnsignedLongLong:a2];
  [v4 setObjResult:v7 error:v6];
}

- (void)evictOldDocumentsWithHandler:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->_personaID isEqualToString:@"__defaultPersonaID__"]
    || (id v5 = self->_personaID) == 0)
  {
    if (evictOldDocumentsWithHandler____personaOnceToken != -1) {
      dispatch_once(&evictOldDocumentsWithHandler____personaOnceToken, &__block_literal_global_90);
    }
    id v6 = (NSString *)(id)evictOldDocumentsWithHandler____personalPersona;
    int v7 = 1;
  }
  else
  {
    id v6 = v5;
    int v7 = 0;
  }
  int v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v9 = [v8 currentPersona];

  id v32 = 0;
  BOOL v10 = [v9 userPersonaUniqueString];
  id v11 = v10;
  if (v10 == v6 || [(NSString *)v10 isEqualToString:v6])
  {
    int v12 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v31 = 0;
    id v17 = (void *)[v9 copyCurrentPersonaContextWithError:&v31];
    id v18 = v31;
    id v19 = v32;
    id v32 = v17;

    if (v18)
    {
      id v20 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
      uint64_t v21 = brc_default_log(0);
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
        -[BRAccount containerWithPendingChanges]();
      }
    }
    int v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

    if (v12)
    {
      id v22 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
      id v23 = brc_default_log(0);
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
      {
        personaID = self->_personaID;
        *(_DWORD *)buf = 138412802;
        id v34 = personaID;
        __int16 v35 = 2112;
        id v36 = v12;
        __int16 v37 = 2112;
        id v38 = v22;
        _os_log_error_impl(&dword_19ED3F000, v23, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_27:
    }
  }
  else
  {
    if (v7 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      id v22 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
      id v23 = brc_default_log(1);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[BRAccount containerWithPendingChanges].cold.5();
      }
      int v12 = 0;
      goto LABEL_27;
    }
    id v25 = brc_bread_crumbs((uint64_t)"-[BRAccount(BRPrivate) evictOldDocumentsWithHandler:]", 345);
    id v26 = brc_default_log(1);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[BRAccount containerWithPendingChanges].cold.4();
    }

    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_10:
  uint32_t v13 = +[BRDaemonConnection defaultConnection];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_91;
  v29[3] = &unk_1E59AD510;
  id v14 = v4;
  id v30 = v14;
  id v15 = [v13 remoteObjectProxyWithErrorHandler:v29];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_2;
  v27[3] = &unk_1E59AD510;
  id v16 = v14;
  id v28 = v16;
  [v15 evictOldDocumentsWithReply:v27];

  _BRRestorePersona(&v32);
}

void __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  v1 = (void *)evictOldDocumentsWithHandler____personalPersona;
  evictOldDocumentsWithHandler____personalPersona = v0;
}

uint64_t __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_91(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __53__BRAccount_BRPrivate__evictOldDocumentsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)_refreshCurrentLoggedInAccountForcingRefresh:(double)a1 personaID:error:.cold.1(double a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  double v4 = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_19ED3F000, v1, v2, "[ERROR] Took %0.2fs to get the token%@", (uint8_t *)&v3);
}

+ (void)_refreshCurrentLoggedInAccountForcingRefresh:personaID:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_19ED3F000, v0, v1, "[DEBUG] token fetch returned in %0.2fs%@", v2, v3, v4, v5, 2u);
}

+ (void)_refreshCurrentLoggedInAccountForcingRefresh:(void *)a1 personaID:(uint64_t)a2 error:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 error];
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_5(&dword_19ED3F000, a3, v6, "[ERROR] error while getting ubiquityIdentityToken: %@%@", (uint8_t *)&v7);
}

+ (void)refreshCurrentLoggedInAccountWithError:(void *)a1 .cold.1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v1, v2, "[DEBUG] ┏%llx refreshing current logged in account%@", (void)v3, DWORD2(v3));
}

- (void)containerWithPendingChanges
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v2, v3, v4, v5, v6);
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] can't register to account token changed; error: %d%@",
    (uint8_t *)v3,
    0x12u);
}

void __63__BRAccount_BRPrivate__startAccountTokenChangeObserverIfNeeded__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19ED3F000, v0, v1, "[DEBUG] account state changed, notifying clients%@", v2, v3, v4, v5, v6);
}

@end
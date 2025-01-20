@interface CUIKSubscribedCalendarManager
- (id)_accountDescriptionForCalendar:(id)a3;
- (id)_createCalDAVChildSubCalAccountForCalendar:(id)a3 inAccountStore:(id)a4;
- (id)_createLocalSubCalAccountForCalendar:(id)a3 inAccountStore:(id)a4;
- (id)_createSubcalAccountForCalendar:(id)a3 inAccountStore:(id)a4 newAccountNeedsSaving:(BOOL *)a5;
- (void)_saveAccount:(id)a3 inStore:(id)a4 updated:(BOOL)a5;
- (void)_updateAccount:(id)a3 inAccountStore:(id)a4 withCalendar:(id)a5 oldAccount:(id)a6 newAccountDirty:(BOOL)a7 newUsername:(id)a8 newPassword:(id)a9 newAllowsInsecureConnections:(BOOL)a10;
- (void)restartDAAfterAccountUpdates;
- (void)restartDAAfterCalendarUpdates;
- (void)shutdownDAForAccountUpdates;
- (void)shutdownDAForCalendarUpdates;
- (void)updateOrCreateAccountWithCalendar:(id)a3 previousAccountID:(id)a4 newUsername:(id)a5 newPassword:(id)a6 newAllowsInsecureConnections:(BOOL)a7;
@end

@implementation CUIKSubscribedCalendarManager

- (void)shutdownDAForCalendarUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_calendarSaveMonitoringToken)
  {
    v3 = [MEMORY[0x1E4F5E950] sharedConnection];
    self->_unint64_t calendarSaveMonitoringToken = [v3 requestDaemonStopMonitoringAgents];

    v4 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t calendarSaveMonitoringToken = self->_calendarSaveMonitoringToken;
      int v6 = 134217984;
      unint64_t v7 = calendarSaveMonitoringToken;
      _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_DEFAULT, "Requesting DA stop monitoring agents for calendar updates with token %lu", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)restartDAAfterCalendarUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_calendarSaveMonitoringToken)
  {
    v3 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t calendarSaveMonitoringToken = self->_calendarSaveMonitoringToken;
      int v6 = 134217984;
      unint64_t v7 = calendarSaveMonitoringToken;
      _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_DEFAULT, "Requesting DA start monitoring agents for calendar updates with token %lu", (uint8_t *)&v6, 0xCu);
    }

    v5 = [MEMORY[0x1E4F5E950] sharedConnection];
    [v5 requestDaemonStartMonitoringAgentsWithToken:self->_calendarSaveMonitoringToken];

    self->_unint64_t calendarSaveMonitoringToken = 0;
  }
}

- (void)shutdownDAForAccountUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_accountsSaveMonitoringToken)
  {
    v3 = [MEMORY[0x1E4F5E950] sharedConnection];
    self->_unint64_t accountsSaveMonitoringToken = [v3 requestDaemonStopMonitoringAgents];

    v4 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t accountsSaveMonitoringToken = self->_accountsSaveMonitoringToken;
      int v6 = 134217984;
      unint64_t v7 = accountsSaveMonitoringToken;
      _os_log_impl(&dword_1BDF08000, v4, OS_LOG_TYPE_DEFAULT, "Requesting DA stop monitoring agents for account updates with token %lu", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)restartDAAfterAccountUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_accountsSaveMonitoringToken)
  {
    v3 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t accountsSaveMonitoringToken = self->_accountsSaveMonitoringToken;
      int v6 = 134217984;
      unint64_t v7 = accountsSaveMonitoringToken;
      _os_log_impl(&dword_1BDF08000, v3, OS_LOG_TYPE_DEFAULT, "Requesting DA start monitoring agents for account updates with token %lu", (uint8_t *)&v6, 0xCu);
    }

    v5 = [MEMORY[0x1E4F5E950] sharedConnection];
    [v5 requestDaemonStartMonitoringAgentsWithToken:self->_accountsSaveMonitoringToken];

    self->_unint64_t accountsSaveMonitoringToken = 0;
  }
}

- (void)updateOrCreateAccountWithCalendar:(id)a3 previousAccountID:(id)a4 newUsername:(id)a5 newPassword:(id)a6 newAllowsInsecureConnections:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (([v12 isSubscribedHolidayCalendar] & 1) == 0)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F179C8]);
    v17 = v16;
    if (v13)
    {
      v18 = [v16 accountWithIdentifier:v13];
      if (v18) {
        goto LABEL_8;
      }
      v19 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CUIKSubscribedCalendarManager updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:]();
      }
    }
    v18 = 0;
LABEL_8:
    v20 = [v12 subcalAccountID];
    if (v20)
    {
      uint64_t v21 = [v17 accountWithIdentifier:v20];
      if (v21)
      {
        v22 = (void *)v21;
        BOOL v23 = 0;
        HIBYTE(v25) = 0;
LABEL_15:
        LOBYTE(v25) = a7;
        [(CUIKSubscribedCalendarManager *)self _updateAccount:v22 inAccountStore:v17 withCalendar:v12 oldAccount:v18 newAccountDirty:v23 newUsername:v14 newPassword:v15 newAllowsInsecureConnections:v25];

        goto LABEL_16;
      }
      v24 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CUIKSubscribedCalendarManager updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:]();
      }
    }
    HIBYTE(v25) = 0;
    [(CUIKSubscribedCalendarManager *)self shutdownDAForAccountUpdates];
    v22 = [(CUIKSubscribedCalendarManager *)self _createSubcalAccountForCalendar:v12 inAccountStore:v17 newAccountNeedsSaving:(char *)&v25 + 7];
    BOOL v23 = HIBYTE(v25) != 0;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_updateAccount:(id)a3 inAccountStore:(id)a4 withCalendar:(id)a5 oldAccount:(id)a6 newAccountDirty:(BOOL)a7 newUsername:(id)a8 newPassword:(id)a9 newAllowsInsecureConnections:(BOOL)a10
{
  BOOL v11 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = v19;
  id v22 = v20;
  BOOL v23 = v22;
  v62 = v22;
  v63 = v21;
  if (v18)
  {
    uint64_t v24 = [v18 username];

    uint64_t v25 = [v18 credential];
    v64 = [v25 password];

    v26 = [MEMORY[0x1E4F5E990] SubCalInsecureConnectionApproved];
    v27 = [v18 objectForKeyedSubscript:v26];
    int v28 = [v27 BOOLValue];

    if (!v24) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v28 = a10;
  v64 = v22;
  uint64_t v24 = (uint64_t)v21;
  if (v21)
  {
LABEL_3:
    [v15 setUsername:v24];
    BOOL v11 = 1;
  }
LABEL_4:
  if (v64)
  {
    v29 = objc_msgSend(MEMORY[0x1E4F179C0], "credentialWithPassword:");
    [v15 setCredential:v29];

    BOOL v11 = 1;
  }
  v61 = (void *)v24;
  if (v28)
  {
    v30 = [MEMORY[0x1E4F5E990] SubCalInsecureConnectionApproved];
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v30];

    BOOL v11 = 1;
  }
  v31 = [MEMORY[0x1E4F5E7E8] daAccountSubclassWithBackingAccountInfo:v15];
  v32 = (void *)MEMORY[0x1E4F1CB10];
  v33 = [v17 subcalURL];
  v34 = [v32 URLWithString:v33];

  if (v34)
  {
    id v57 = v18;
    id v58 = v16;
    id v59 = v15;
    v35 = [v34 scheme];
    uint64_t v36 = [v35 isEqualToString:@"https"];

    v37 = [v34 scheme];
    uint64_t v38 = [v37 isEqualToString:@"ftp"];

    v39 = [MEMORY[0x1E4F577E0] hostStringFromURL:v34];
    v40 = [v34 user];
    v41 = [v40 stringByRemovingPercentEncoding];

    v42 = [v34 password];
    v43 = [v42 stringByRemovingPercentEncoding];

    if (v36 != [v31 useSSL])
    {
      [v31 setUseSSL:v36];
      BOOL v11 = 1;
    }
    if (v38 != [v31 useFTP])
    {
      [v31 setUseFTP:v38];
      BOOL v11 = 1;
    }
    v44 = [v31 host];
    char v45 = [v44 isEqualToString:v39];

    if ((v45 & 1) == 0)
    {
      [v31 setHost:v39];
      BOOL v11 = 1;
    }
    id v18 = v57;
    if ([v41 length])
    {
      v46 = [v31 username];
      char v47 = [v41 isEqualToString:v46];

      if ((v47 & 1) == 0)
      {
        [v31 setUsername:v41];
        BOOL v11 = 1;
      }
    }
    if ([v43 length])
    {
      v48 = [v31 password];
      char v49 = [v43 isEqualToString:v48];

      if ((v49 & 1) == 0)
      {
        [v31 setPassword:v43];
        BOOL v11 = 1;
      }
    }

    id v16 = v58;
    id v15 = v59;
  }
  v50 = [v31 calendarExternalId];
  v51 = [v17 externalID];
  char v52 = [v51 isEqualToString:v50];

  if ((v52 & 1) == 0) {
    [v17 setExternalID:v50];
  }
  uint64_t v53 = [v17 stripAlarms];
  if (v53 != [v31 shouldRemoveAlarms])
  {
    [v31 setShouldRemoveAlarms:v53];
    BOOL v11 = 1;
  }
  uint64_t v54 = [v17 stripAttachments];
  if (v54 != [v31 shouldRemoveAttachments])
  {
    [v31 setShouldRemoveAttachments:v54];
    BOOL v11 = 1;
  }
  double v55 = (double)(int)[v17 refreshInterval];
  [v31 refreshInterval];
  if (v56 != v55)
  {
    [v31 setRefreshInterval:v55];
    BOOL v11 = 1;
  }
  if (v18)
  {
    [(CUIKSubscribedCalendarManager *)self shutdownDAForAccountUpdates];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke;
    v65[3] = &unk_1E6369658;
    id v66 = v18;
    v67 = self;
    id v68 = v15;
    id v69 = v16;
    BOOL v70 = v11;
    [v69 removeAccount:v66 withCompletionHandler:v65];
  }
  else
  {
    [(CUIKSubscribedCalendarManager *)self _saveAccount:v15 inStore:v16 updated:v11];
  }
}

void __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke_cold_1(a1);
    }
  }
  [*(id *)(a1 + 40) _saveAccount:*(void *)(a1 + 48) inStore:*(void *)(a1 + 56) updated:*(unsigned __int8 *)(a1 + 64)];
}

- (void)_saveAccount:(id)a3 inStore:(id)a4 updated:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    [(CUIKSubscribedCalendarManager *)self shutdownDAForAccountUpdates];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke;
    v12[3] = &unk_1E6369680;
    id v13 = v8;
    id v14 = self;
    [v9 saveAccount:v13 withCompletionHandler:v12];
  }
  else
  {
    v10 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = [v8 identifier];
      *(_DWORD *)buf = 138543362;
      id v16 = v11;
      _os_log_impl(&dword_1BDF08000, v10, OS_LOG_TYPE_INFO, "No accounts changes required saving subscribed calendar for account %{public}@", buf, 0xCu);
    }
    [(CUIKSubscribedCalendarManager *)self restartDAAfterAccountUpdates];
  }
}

void __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke_cold_1(a1);
    }
  }
  [*(id *)(a1 + 40) restartDAAfterAccountUpdates];
}

- (id)_createSubcalAccountForCalendar:(id)a3 inAccountStore:(id)a4 newAccountNeedsSaving:(BOOL *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 source];
  if ([v10 sourceType] == 2)
  {
    *a5 = 0;
    [(CUIKSubscribedCalendarManager *)self _createCalDAVChildSubCalAccountForCalendar:v9 inAccountStore:v8];
  }
  else
  {
    *a5 = 1;
    [(CUIKSubscribedCalendarManager *)self _createLocalSubCalAccountForCalendar:v9 inAccountStore:v8];
  BOOL v11 = };

  return v11;
}

- (id)_createCalDAVChildSubCalAccountForCalendar:(id)a3 inAccountStore:(id)a4
{
  v51[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v35 = [v6 source];
  v37 = [v35 externalID];
  id v8 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v37;
    _os_log_impl(&dword_1BDF08000, v8, OS_LOG_TYPE_DEFAULT, "Adding subscription calendar account to parent account ID %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v36 = [v7 accountWithIdentifier:v37];
  uint64_t v38 = [MEMORY[0x1E4F5E7E8] daAccountSubclassWithBackingAccountInfo:v36];
  if ([v38 conformsToProtocol:&unk_1F18CAAA0])
  {
    id v9 = v38;
    v34 = [v6 externalIDTag];
    if (!v34)
    {
      v10 = [MEMORY[0x1E4F29128] UUID];
      v34 = [v10 UUIDString];
      [v6 setExternalIDTag:v34];
    }
    BOOL v11 = [v9 mainPrincipal];
    v33 = [v11 calendarHomeURL];

    id v12 = [v34 appendSlashIfNeeded];
    v32 = [v33 URLByAppendingPathComponent:v12];

    id v13 = [v32 path];
    v31 = [v13 appendSlashIfNeeded];

    v50[0] = *MEMORY[0x1E4F57940];
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "stripAttachments"));
    v51[0] = v14;
    v50[1] = *MEMORY[0x1E4F57938];
    id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "stripAlarms"));
    v51[1] = v15;
    v50[2] = *MEMORY[0x1E4F57958];
    id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "refreshInterval"));
    v51[2] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
    id v18 = (void *)[v17 mutableCopy];

    id v19 = [v6 subcalURL];
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F57968]];

    id v20 = [(CUIKSubscribedCalendarManager *)self _accountDescriptionForCalendar:v6];
    [v18 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F57970]];

    id v21 = [v9 subscribedCalendars];
    id v22 = (id)[v21 mutableCopy];

    if (!v22) {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [v22 setObject:v18 forKeyedSubscript:v31];
    [v9 setSubscribedCalendars:v22];
    [(CUIKSubscribedCalendarManager *)self shutdownDAForAccountUpdates];
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x3032000000;
    char v47 = __Block_byref_object_copy_;
    v48 = __Block_byref_object_dispose_;
    id v49 = 0;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke;
    v39[3] = &unk_1E63696A8;
    uint64_t v24 = v23;
    v40 = v24;
    id v41 = v7;
    id v42 = v36;
    id v25 = v31;
    id v43 = v25;
    p_long long buf = &buf;
    [v41 saveAccount:v42 withCompletionHandler:v39];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    v26 = *(void **)(*((void *)&buf + 1) + 40);
    if (v26)
    {
      v27 = [v26 identifier];
      [v6 setSubcalAccountID:v27];

      int v28 = *(void **)(*((void *)&buf + 1) + 40);
    }
    else
    {
      int v28 = 0;
    }
    id v29 = v28;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v9 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CUIKSubscribedCalendarManager _createCalDAVChildSubCalAccountForCalendar:inAccountStore:]();
    }
    id v29 = 0;
  }

  return v29;
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v26 = 0;
    id v8 = [v6 childAccountsForAccount:v7 error:&v26];
    id v9 = v26;
    v10 = v9;
    if (v8)
    {
      id v21 = v9;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        uint64_t v15 = *MEMORY[0x1E4F57928];
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v18 = [v17 objectForKeyedSubscript:v15];
            if ([v18 isEqualToString:*(void *)(a1 + 56)])
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v17);

              goto LABEL_16;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      v10 = v21;
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        goto LABEL_22;
      }
      id v20 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_2(v20);
      }
    }
    else
    {
      id v20 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_1();
      }
    }

LABEL_22:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

    goto LABEL_23;
  }
  id v19 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_3();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_23:
}

- (id)_createLocalSubCalAccountForCalendar:(id)a3 inAccountStore:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17858]];
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v7];
    id v9 = [(CUIKSubscribedCalendarManager *)self _accountDescriptionForCalendar:v6];
    [v8 setAccountDescription:v9];

    [v8 setSupportsAuthentication:1];
    [v8 setAuthenticated:1];
    [v8 setEnabled:1 forDataclass:*MEMORY[0x1E4F17A80]];
    v10 = [v8 identifier];
    [v6 setSubcalAccountID:v10];

    id v11 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v8 identifier];
      int v14 = 138543362;
      uint64_t v15 = v12;
      _os_log_impl(&dword_1BDF08000, v11, OS_LOG_TYPE_DEFAULT, "Creating local subscription calendar account ID %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    id v11 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CUIKSubscribedCalendarManager _createLocalSubCalAccountForCalendar:inAccountStore:](v11);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)_accountDescriptionForCalendar:(id)a3
{
  id v3 = a3;
  v4 = [v3 title];
  if (![v4 length])
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [v3 subcalURL];
    uint64_t v7 = [v5 URLWithString:v6];

    uint64_t v8 = [MEMORY[0x1E4F577E0] hostStringFromURL:v7];

    v4 = (void *)v8;
  }

  return v4;
}

- (void)updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Unable to find account with ID %{public}@", v2, v3, v4, v5, v6);
}

- (void)updateOrCreateAccountWithCalendar:previousAccountID:newUsername:newPassword:newAllowsInsecureConnections:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Unable to find previous account with ID %{public}@", v2, v3, v4, v5, v6);
}

void __156__CUIKSubscribedCalendarManager__updateAccount_inAccountStore_withCalendar_oldAccount_newAccountDirty_newUsername_newPassword_newAllowsInsecureConnections___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BDF08000, v2, v3, "Failed to remove old subcal account %{public}@; %@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void __62__CUIKSubscribedCalendarManager__saveAccount_inStore_updated___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BDF08000, v2, v3, "Failed to save subcal account %{public}@; %@", v4, v5, v6, v7, v8);
}

- (void)_createCalDAVChildSubCalAccountForCalendar:inAccountStore:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "The parent account for the subscribed calendar (%@) does not appear to be a CalDAV account. This is not going to work.", v2, v3, v4, v5, v6);
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Error fetching child accounts after updating parent CalDAVAccount: %@", v2, v3, v4, v5, v6);
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "No child account found after updating parent", v1, 2u);
}

void __91__CUIKSubscribedCalendarManager__createCalDAVChildSubCalAccountForCalendar_inAccountStore___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDF08000, v0, v1, "Error saving parent CalDAV account while adding subscription calendar: %@", v2, v3, v4, v5, v6);
}

- (void)_createLocalSubCalAccountForCalendar:(os_log_t)log inAccountStore:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "Couldn't get subscribed calendar account type; won't create account",
    v1,
    2u);
}

@end
@interface EKUIAccountErrorDisplayer
+ (BOOL)_reauthorizeForAccount:(id)a3 usingViewController:(id)a4 completion:(id)a5;
+ (BOOL)errorIsActionable:(unint64_t)a3;
+ (unint64_t)moreSevereErrorOfError:(unint64_t)a3 andError:(unint64_t)a4;
+ (unint64_t)severityForError:(unint64_t)a3;
+ (void)handleContinueSyncingForAccount:(id)a3 calendars:(id)a4 error:(unint64_t)a5;
+ (void)presentAlertForAccount:(id)a3 error:(unint64_t)a4 usingViewController:(id)a5 completion:(id)a6;
+ (void)presentAlertForOfflineErrorUsingViewController:(id)a3;
@end

@implementation EKUIAccountErrorDisplayer

+ (unint64_t)severityForError:(unint64_t)a3
{
  return [MEMORY[0x1E4F57650] severityForError:a3];
}

+ (unint64_t)moreSevereErrorOfError:(unint64_t)a3 andError:(unint64_t)a4
{
  unint64_t v6 = +[EKUIAccountErrorDisplayer severityForError:](EKUIAccountErrorDisplayer, "severityForError:");
  if (+[EKUIAccountErrorDisplayer severityForError:a4] <= v6) {
    return a3;
  }
  else {
    return a4;
  }
}

+ (void)presentAlertForAccount:(id)a3 error:(unint64_t)a4 usingViewController:(id)a5 completion:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = [v10 externalID];
    *(_DWORD *)buf = 138543618;
    v74 = v15;
    __int16 v75 = 2048;
    unint64_t v76 = a4;
    _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_DEFAULT, "Presenting an alert for source with external ID %{public}@ with error %lu", buf, 0x16u);
  }
  v16 = EventKitUIBundle();
  v61 = [v16 localizedStringForKey:@"OK" value:&stru_1F0CC2140 table:0];

  switch(a4)
  {
    case 7uLL:
      id v59 = v11;
      v60 = v10;
      v22 = [v10 calendarsForEntityType:0];
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v20 = v22;
      uint64_t v24 = [v20 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v69 != v26) {
              objc_enumerationMutation(v20);
            }
            v28 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if ([v28 lastSyncError] == 7) {
              [v23 addObject:v28];
            }
          }
          uint64_t v25 = [v20 countByEnumeratingWithState:&v68 objects:v72 count:16];
        }
        while (v25);
      }

      id v29 = v23;
      uint64_t v30 = [v29 count];
      BOOL v31 = v30 != 0;
      if (v30)
      {
        v32 = EventKitUIBundle();
        v18 = [v32 localizedStringForKey:@"Insecure connection" value:&stru_1F0CC2140 table:0];

        v33 = EventKitUIBundle();
        uint64_t v58 = [v33 localizedStringForKey:@"Continue" value:&stru_1F0CC2140 table:0];

        v62 = [v29 firstObject];
        uint64_t v34 = [v29 count] - 1;
        v35 = EventKitUIBundle();
        v36 = v35;
        if (v34)
        {
          v37 = [v35 localizedStringForKey:@"“%@” and %d other calendars cannot connect with a secure connection. Would you like to continue syncing them anyway?" value:&stru_1F0CC2140 table:0];

          v38 = NSString;
          v39 = [v62 title];
          objc_msgSend(v38, "localizedStringWithFormat:", v37, v39, v34);
        }
        else
        {
          v37 = [v35 localizedStringForKey:@"“%@” cannot connect with a secure connection. Would you like to continue syncing it anyway?" value:&stru_1F0CC2140 table:0];

          v46 = NSString;
          v39 = [v62 title];
          objc_msgSend(v46, "localizedStringWithFormat:", v37, v39, v57);
        v41 = };
        id v11 = v59;

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__EKUIAccountErrorDisplayer_presentAlertForAccount_error_usingViewController_completion___block_invoke;
        aBlock[3] = &unk_1E6089DF8;
        id v66 = a1;
        id v64 = v60;
        id v65 = v29;
        uint64_t v67 = 7;
        v42 = _Block_copy(aBlock);

        v61 = (void *)v58;
      }
      else
      {
        v45 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3F4C000, v45, OS_LOG_TYPE_ERROR, "Trying to present an alert for EKAccountErrorInsecureConnectionNotAllowed, but there are no calendars with errors.", buf, 2u);
        }
        v42 = 0;
        v41 = 0;
        v18 = 0;
        id v11 = v59;
      }

LABEL_29:
      id v43 = v12;

      id v44 = v11;
      if (v18 && v41) {
        goto LABEL_32;
      }
      goto LABEL_31;
    case 3uLL:
      v60 = v10;
      v40 = EventKitUIBundle();
      v18 = [v40 localizedStringForKey:@"No internet connection" value:&stru_1F0CC2140 table:0];

      v19 = EventKitUIBundle();
      id v20 = v19;
      v21 = @"Unable to connect to account.";
LABEL_21:
      v41 = [v19 localizedStringForKey:v21 value:&stru_1F0CC2140 table:0];
      BOOL v31 = 0;
      v42 = 0;
      goto LABEL_29;
    case 2uLL:
      if ([a1 _reauthorizeForAccount:v10 usingViewController:v11 completion:v12]) {
        goto LABEL_35;
      }
      v60 = v10;
      v17 = EventKitUIBundle();
      v18 = [v17 localizedStringForKey:@"Incorrect password" value:&stru_1F0CC2140 table:0];

      v19 = EventKitUIBundle();
      id v20 = v19;
      v21 = @"Your username or password is incorrect.";
      goto LABEL_21;
  }
  id v43 = v12;
  id v44 = v11;
  v60 = v10;
  v18 = 0;
  v41 = 0;
  v42 = 0;
  BOOL v31 = 0;
LABEL_31:
  v47 = EventKitUIBundle();
  uint64_t v48 = [v47 localizedStringForKey:@"Unknown Error" value:&stru_1F0CC2140 table:0];

  v49 = EventKitUIBundle();
  uint64_t v50 = [v49 localizedStringForKey:@"There was an unknown error while updating this account." value:&stru_1F0CC2140 table:0];

  v41 = (void *)v50;
  v18 = (void *)v48;
LABEL_32:
  v51 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v18 message:v41 preferredStyle:1];
  v52 = [MEMORY[0x1E4FB1410] actionWithTitle:v61 style:0 handler:v42];
  [v51 addAction:v52];
  if (v31)
  {
    v53 = EventKitUIBundle();
    v54 = [v53 localizedStringForKey:@"Cancel" value:&stru_1F0CC2140 table:0];

    v55 = [MEMORY[0x1E4FB1410] actionWithTitle:v54 style:1 handler:0];
    [v51 addAction:v55];
  }
  id v11 = v44;
  v56 = v44;
  id v12 = v43;
  [v56 presentViewController:v51 animated:1 completion:v43];

  id v10 = v60;
LABEL_35:
}

uint64_t __89__EKUIAccountErrorDisplayer_presentAlertForAccount_error_usingViewController_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) handleContinueSyncingForAccount:*(void *)(a1 + 32) calendars:*(void *)(a1 + 40) error:*(void *)(a1 + 56)];
}

+ (void)handleContinueSyncingForAccount:(id)a3 calendars:(id)a4 error:(unint64_t)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v39;
    *(void *)&long long v8 = 138412802;
    long long v32 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v33 = v9;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "subcalAccountID", v32);
        if (v13)
        {
          v14 = [v6 accountWithIdentifier:v13];
          v15 = v14;
          if (v14)
          {
            [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SubCalInsecureConnectionApproved"];
            [v15 setAuthenticated:1];
            v16 = (void *)kEKUILogHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v16;
              v18 = [v12 title];
              v19 = [v12 calendarIdentifier];
              [v12 externalID];
              uint64_t v20 = v10;
              v22 = id v21 = v6;
              *(_DWORD *)buf = 138544130;
              id v43 = v13;
              __int16 v44 = 2112;
              v45 = v18;
              __int16 v46 = 2114;
              v47 = v19;
              __int16 v48 = 2112;
              v49 = v22;
              _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_DEFAULT, "Allowing insecure connections for account %{public}@ for subscribed calendar (title = %@; calendarIdenti"
                "fier = %{public}@; externalID = %@)",
                buf,
                0x2Au);

              id v6 = v21;
              uint64_t v10 = v20;

              uint64_t v9 = v33;
            }
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __77__EKUIAccountErrorDisplayer_handleContinueSyncingForAccount_calendars_error___block_invoke;
            v35[3] = &unk_1E60895B0;
            id v36 = v13;
            v37 = v12;
            [v6 saveAccount:v15 withCompletionHandler:v35];
          }
          else
          {
            v27 = (void *)kEKUILogHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
            {
              v28 = v27;
              id v29 = [v12 title];
              uint64_t v30 = [v12 calendarIdentifier];
              BOOL v31 = [v12 externalID];
              *(_DWORD *)buf = 138544130;
              id v43 = v13;
              __int16 v44 = 2112;
              v45 = v29;
              __int16 v46 = 2114;
              v47 = v30;
              __int16 v48 = 2112;
              v49 = v31;
              _os_log_impl(&dword_1B3F4C000, v28, OS_LOG_TYPE_ERROR, "Unable to find account for subscribed calendar (accountID = %{public}@; title = %@; calendarIdentifier ="
                " %{public}@; externalId = %@)",
                buf,
                0x2Au);

              uint64_t v9 = v33;
            }
          }
        }
        else
        {
          id v23 = (void *)kEKUILogHandle;
          if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_16;
          }
          v15 = v23;
          uint64_t v24 = [v12 title];
          uint64_t v25 = [v12 calendarIdentifier];
          uint64_t v26 = [v12 externalID];
          *(_DWORD *)buf = v32;
          id v43 = v24;
          __int16 v44 = 2114;
          v45 = v25;
          __int16 v46 = 2112;
          v47 = v26;
          _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_ERROR, "Trying to allow insecure syncing for a calendar without a subcal account ID. (title = %@; calendarIdentifier"
            " = %{public}@; externalId = %@)",
            buf,
            0x20u);
        }
LABEL_16:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v9);
  }

  [MEMORY[0x1E4F57B48] temporarilyIgnoreInsecureConnectionErrorsForCalendars:obj];
}

void __77__EKUIAccountErrorDisplayer_handleContinueSyncingForAccount_calendars_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)kEKUILogHandle;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v9 = v6;
      uint64_t v10 = [v7 title];
      uint64_t v11 = [*(id *)(a1 + 40) calendarIdentifier];
      id v12 = [*(id *)(a1 + 40) externalID];
      int v19 = 138544130;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2114;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v12;
      v13 = "Successfully updated account %{public}@ to allow insecure connections for subscribed calendar (title = %@; c"
            "alendarIdentifier = %{public}@; externalID = %@)";
      v14 = v9;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 42;
LABEL_6:
      _os_log_impl(&dword_1B3F4C000, v14, v15, v13, (uint8_t *)&v19, v16);
    }
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    uint64_t v9 = v6;
    uint64_t v10 = [v17 title];
    uint64_t v11 = [*(id *)(a1 + 40) calendarIdentifier];
    id v12 = [*(id *)(a1 + 40) externalID];
    int v19 = 138544386;
    uint64_t v20 = v18;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2114;
    uint64_t v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    __int16 v27 = 2112;
    id v28 = v5;
    v13 = "Unable to update account %{public}@ to allow insecure connections for subscribed calendar (title = %@; calenda"
          "rIdentifier = %{public}@; externalID = %@). Error = %@";
    v14 = v9;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 52;
    goto LABEL_6;
  }
}

+ (BOOL)_reauthorizeForAccount:(id)a3 usingViewController:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v12 = [v8 externalID];
  v13 = [v11 accountWithIdentifier:v12];

  v14 = (void *)kEKUILogHandle;
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v15 = v14;
      uint32_t v16 = [v8 externalID];
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_DEFAULT, "Renewing credentials for sourceAccount with ID: %{public}@", buf, 0xCu);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke;
    v20[3] = &unk_1E6089E48;
    id v21 = v8;
    id v24 = a1;
    id v22 = v9;
    id v23 = v10;
    [v11 renewCredentialsForAccount:v13 completion:v20];
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v17 = v14;
    uint64_t v18 = [v8 externalID];
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v18;
    _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "Can't renew credentials for sourceAccount because no ACAccount could be found with ID: %{public}@", buf, 0xCu);
  }
  return v13 != 0;
}

void __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 externalID];
    *(_DWORD *)buf = 138543874;
    v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_DEFAULT, "Finished renewing credentials for account with ID %{public}@. Result=%li, error=%@", buf, 0x20u);
  }
  if (!a2)
  {
    id v10 = (id *)v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_2;
    v11[3] = &unk_1E6089E20;
    v11[4] = *(id *)(a1 + 32);
    goto LABEL_7;
  }
  if (a2 == 2)
  {
    id v10 = (id *)v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_58;
    v12[3] = &unk_1E60881C8;
    v12[6] = *(void *)(a1 + 56);
    v12[4] = *(id *)(a1 + 40);
LABEL_7:
    v10[5] = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 48) presentAlertForAccount:0 error:2 usingViewController:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F57B48] temporarilyIgnoreInvalidCredentialsErrorForSource:*(void *)(a1 + 32)];
  v2 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_3;
  block[3] = &unk_1E6087570;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__EKUIAccountErrorDisplayer__reauthorizeForAccount_usingViewController_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventStore];
  [v2 refreshSource:*(void *)(a1 + 32) userRequested:1];
}

+ (void)presentAlertForOfflineErrorUsingViewController:(id)a3
{
}

+ (BOOL)errorIsActionable:(unint64_t)a3
{
  return a3 == 2 || a3 == 7;
}

@end
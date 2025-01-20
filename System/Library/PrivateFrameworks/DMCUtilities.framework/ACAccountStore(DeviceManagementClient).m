@interface ACAccountStore(DeviceManagementClient)
- (BOOL)_dmc_updateAccount:()DeviceManagementClient error:updateBlock:;
- (DMCHangDetectionQueue)_dmc_workerQueue;
- (id)_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()DeviceManagementClient;
- (id)_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()DeviceManagementClient altDSID:;
- (id)_dmc_accountWithType:()DeviceManagementClient error:criteria:;
- (id)dmc_RemoteManagementAccounts;
- (id)dmc_accountsWithPredicateBlock:()DeviceManagementClient;
- (id)dmc_iCloudAccountWithUsername:()DeviceManagementClient;
- (id)dmc_remoteManagementAccountForAltDSID:()DeviceManagementClient;
- (id)dmc_remoteManagementAccountForDSID:()DeviceManagementClient;
- (id)dmc_remoteManagementAccountForEnrollmentURL:()DeviceManagementClient;
- (id)dmc_remoteManagementAccountForIdentifier:()DeviceManagementClient;
- (id)dmc_remoteManagementAccountForManagementProfileIdentifier:()DeviceManagementClient;
- (id)dmc_visibleRemoteManagementAccounts;
- (id)dmc_visibleSecondaryRemoteManagementAccounts;
- (uint64_t)_dmc_missingAccountError;
- (uint64_t)dmc_RemoteManagementAccountType;
- (uint64_t)dmc_conflictingAccountsExistWithAltDSID:()DeviceManagementClient error:;
- (uint64_t)dmc_conflictingAccountsExistWithUsername:()DeviceManagementClient error:;
- (uint64_t)dmc_hasPrimaryAccount:()DeviceManagementClient;
- (uint64_t)dmc_iCloudAccountForRemoteManagingAccount;
- (uint64_t)dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:()DeviceManagementClient;
- (uint64_t)dmc_iTunesAccountForRemoteManagingAccount;
- (uint64_t)dmc_iTunesAccountForRemoteManagingAccountWithAltDSID:()DeviceManagementClient;
- (uint64_t)dmc_primaryiCloudAccount;
- (uint64_t)dmc_updateAccountWithIdentifier:()DeviceManagementClient error:updateBlock:;
- (uint64_t)dmc_updateAccountWithTypeIdentifier:()DeviceManagementClient altDSID:error:updateBlock:;
- (uint64_t)dmc_updateAppleAccountWithPersonaID:()DeviceManagementClient error:updateBlock:;
- (void)dmc_removeAccountWithIdentifier:()DeviceManagementClient asynchronous:;
- (void)dmc_removeAccounts:()DeviceManagementClient asynchronous:;
- (void)dmc_removeMAIDRelatedAccountsWithAltDSID:()DeviceManagementClient asynchronous:;
- (void)dmc_removeMAIDRelatedAccountsWithPersonaID:()DeviceManagementClient asynchronous:;
@end

@implementation ACAccountStore(DeviceManagementClient)

- (id)dmc_visibleSecondaryRemoteManagementAccounts
{
  v1 = objc_msgSend(a1, "dmc_visibleRemoteManagementAccounts");
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2];
  v3 = [v1 filteredArrayUsingPredicate:v2];

  return v3;
}

- (id)dmc_visibleRemoteManagementAccounts
{
  v1 = objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global];
    v3 = [v1 filteredArrayUsingPredicate:v2];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)dmc_RemoteManagementAccounts
{
  v2 = objc_msgSend(a1, "dmc_RemoteManagementAccountType");
  v3 = [a1 accountsWithAccountType:v2];

  return v3;
}

- (uint64_t)dmc_RemoteManagementAccountType
{
  return [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17848]];
}

- (uint64_t)dmc_primaryiCloudAccount
{
  return objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", *MEMORY[0x1E4F17750], 0, &__block_literal_global_6);
}

- (uint64_t)dmc_iCloudAccountForRemoteManagingAccount
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:", *MEMORY[0x1E4F17750]);
}

- (uint64_t)dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:()DeviceManagementClient
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", *MEMORY[0x1E4F17750], a3);
}

- (uint64_t)dmc_iTunesAccountForRemoteManagingAccount
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:", *MEMORY[0x1E4F17890]);
}

- (uint64_t)dmc_iTunesAccountForRemoteManagingAccountWithAltDSID:()DeviceManagementClient
{
  return objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", *MEMORY[0x1E4F17890], a3);
}

- (id)_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()DeviceManagementClient
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  v6 = [v5 firstObject];

  if (v6)
  {
    v7 = objc_msgSend(v6, "dmc_altDSID");
    v8 = objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", v4, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:()DeviceManagementClient altDSID:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v23 = 0;
  v9 = [a1 accountsWithAccountTypeIdentifiers:v8 preloadedProperties:0 error:&v23];
  id v10 = v23;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v9;
  id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "dmc_altDSID", (void)v19);
        char v17 = [v16 isEqualToString:v7];

        if (v17)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)dmc_remoteManagementAccountForAltDSID:()DeviceManagementClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "dmc_altDSID", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForDSID:()DeviceManagementClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "dmc_DSID", (void)v13);
        char v11 = [v10 isEqualToNumber:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForIdentifier:()DeviceManagementClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForEnrollmentURL:()DeviceManagementClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "dmc_enrollmentURL", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dmc_remoteManagementAccountForManagementProfileIdentifier:()DeviceManagementClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(a1, "dmc_RemoteManagementAccounts");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "dmc_managementProfileIdentifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)dmc_hasPrimaryAccount:()DeviceManagementClient
{
  v28[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F17750];
  uint64_t v6 = *MEMORY[0x1E4F17890];
  v28[0] = *MEMORY[0x1E4F17750];
  v28[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v8 = [a1 accountsWithAccountTypeIdentifiers:v7 error:a3];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "accountType", (void)v23);
        long long v16 = [v15 identifier];
        if ([v16 isEqualToString:v5])
        {
          char v17 = objc_msgSend(v14, "dmc_isPrimaryAccount");

          if (v17) {
            goto LABEL_17;
          }
        }
        else
        {
        }
        uint64_t v18 = [v14 accountType];
        long long v19 = [v18 identifier];
        if ([v19 isEqualToString:v6])
        {
          char v20 = [v14 isActive];

          if (v20)
          {
LABEL_17:
            uint64_t v21 = 1;
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v21 = 0;
LABEL_18:

  return v21;
}

- (uint64_t)dmc_conflictingAccountsExistWithUsername:()DeviceManagementClient error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F17750];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke;
  v22[3] = &unk_1E5CFD4A8;
  id v9 = v7;
  id v23 = v9;
  uint64_t v10 = objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v8, a4, v22);
  uint64_t v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v12 = *MEMORY[0x1E4F17890];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __89__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithUsername_error___block_invoke_2;
    v20[3] = &unk_1E5CFD4A8;
    id v4 = &v21;
    id v21 = v9;
    uint64_t v11 = objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v12, a4, v20);
    if (!v11)
    {
      uint64_t v18 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  long long v13 = *DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = v13;
    long long v15 = [v11 identifier];
    long long v16 = [v11 accountType];
    char v17 = [v16 accountTypeDescription];
    *(_DWORD *)buf = 138543874;
    id v25 = v9;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_DEFAULT, "Conflicting account with username (%{public}@) exists. Identifier: %@, type: %{public}@", buf, 0x20u);
  }
  uint64_t v18 = 1;
  if (!v10) {
    goto LABEL_8;
  }
LABEL_9:

  return v18;
}

- (uint64_t)dmc_conflictingAccountsExistWithAltDSID:()DeviceManagementClient error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = *MEMORY[0x1E4F17750];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke;
  v22[3] = &unk_1E5CFD4A8;
  id v9 = v7;
  id v23 = v9;
  uint64_t v10 = objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v8, a4, v22);
  uint64_t v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v12 = *MEMORY[0x1E4F17890];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__ACAccountStore_DeviceManagementClient__dmc_conflictingAccountsExistWithAltDSID_error___block_invoke_2;
    v20[3] = &unk_1E5CFD4A8;
    id v4 = &v21;
    id v21 = v9;
    uint64_t v11 = objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v12, a4, v20);
    if (!v11)
    {
      uint64_t v18 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  long long v13 = *DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = v13;
    long long v15 = [v11 identifier];
    long long v16 = [v11 accountType];
    char v17 = [v16 accountTypeDescription];
    *(_DWORD *)buf = 138543874;
    id v25 = v9;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_DEFAULT, "Conflicting account with altDSID (%{public}@) exists. Identifier: %@, type: %{public}@", buf, 0x20u);
  }
  uint64_t v18 = 1;
  if (!v10) {
    goto LABEL_8;
  }
LABEL_9:

  return v18;
}

- (id)dmc_iCloudAccountWithUsername:()DeviceManagementClient
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F17750];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ACAccountStore_DeviceManagementClient__dmc_iCloudAccountWithUsername___block_invoke;
  v9[3] = &unk_1E5CFD4A8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v5, 0, v9);

  return v7;
}

- (id)_dmc_accountWithType:()DeviceManagementClient error:criteria:
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v30[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v26 = 0;
  uint64_t v11 = [a1 accountsWithAccountTypeIdentifiers:v10 error:&v26];
  id v12 = v26;

  if (v12)
  {
    long long v13 = *DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v12;
      _os_log_impl(&dword_1A7863000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch accounts with error: %{public}@", buf, 0xCu);
    }
    if (a4)
    {
      id v14 = 0;
      *a4 = v12;
      goto LABEL_17;
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          char v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (v9[2](v9, v20))
          {
            id v14 = v20;

            goto LABEL_17;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
  }
  id v14 = 0;
LABEL_17:

  return v14;
}

- (uint64_t)dmc_updateAccountWithTypeIdentifier:()DeviceManagementClient altDSID:error:updateBlock:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = objc_msgSend(a1, "_dmc_AccountAssociatedWithRemoteManagementWithAccountTypeIdentifier:altDSID:", v10, v11);
  if (v13)
  {
    uint64_t v14 = objc_msgSend(a1, "_dmc_updateAccount:error:updateBlock:", v13, a5, v12);
  }
  else
  {
    id v15 = *DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = v10;
      __int16 v19 = 2114;
      id v20 = v11;
      _os_log_impl(&dword_1A7863000, v15, OS_LOG_TYPE_ERROR, "Couldn't find account with type: %{public}@, altDSID: %{public}@.", (uint8_t *)&v17, 0x16u);
    }
    if (a5)
    {
      objc_msgSend(a1, "_dmc_missingAccountError");
      uint64_t v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v14 = 0;
    }
  }

  return v14;
}

- (uint64_t)dmc_updateAccountWithIdentifier:()DeviceManagementClient error:updateBlock:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_msgSend(a1, "dmc_remoteManagementAccountForIdentifier:", v8);
  if (v10)
  {
    uint64_t v11 = objc_msgSend(a1, "_dmc_updateAccount:error:updateBlock:", v10, a4, v9);
  }
  else
  {
    id v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v8;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Couldn't find account with identifier: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    if (a4)
    {
      objc_msgSend(a1, "_dmc_missingAccountError");
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (uint64_t)dmc_updateAppleAccountWithPersonaID:()DeviceManagementClient error:updateBlock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F17750];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__ACAccountStore_DeviceManagementClient__dmc_updateAppleAccountWithPersonaID_error_updateBlock___block_invoke;
  v16[3] = &unk_1E5CFD4A8;
  id v11 = v8;
  id v17 = v11;
  id v12 = objc_msgSend(a1, "_dmc_accountWithType:error:criteria:", v10, a4, v16);
  if (v12)
  {
    uint64_t v13 = objc_msgSend(a1, "_dmc_updateAccount:error:updateBlock:", v12, a4, v9);
  }
  else
  {
    int v14 = *DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_1A7863000, v14, OS_LOG_TYPE_ERROR, "Couldn't find apple account with persona ID: %{public}@", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)_dmc_updateAccount:()DeviceManagementClient error:updateBlock:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    id v12 = [v8 accountType];
    uint64_t v13 = [v12 accountTypeDescription];
    int v14 = objc_msgSend(v8, "dmc_altDSID");
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_DEFAULT, "Will update account with type: %{public}@, altDSID: %{public}@.", buf, 0x16u);
  }
  v9[2](v9, v8);
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  id v15 = objc_msgSend(a1, "_dmc_workerQueue");
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = __79__ACAccountStore_DeviceManagementClient___dmc_updateAccount_error_updateBlock___block_invoke;
  long long v23 = &unk_1E5CFD4F8;
  long long v24 = a1;
  id v16 = v8;
  id v25 = v16;
  id v26 = &v28;
  v27 = buf;
  [v15 queueBlock:&v20];

  id v17 = objc_msgSend(a1, "_dmc_workerQueue", v20, v21, v22, v23, v24);
  [v17 waitUntilAllBlocksAreFinished];

  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
  BOOL v18 = *((unsigned char *)v29 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (void)dmc_removeMAIDRelatedAccountsWithAltDSID:()DeviceManagementClient asynchronous:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_INFO, "Will sign out accounts with altDSID: %{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithAltDSID_asynchronous___block_invoke;
  v10[3] = &unk_1E5CFD520;
  id v11 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(a1, "dmc_accountsWithPredicateBlock:", v10);
  objc_msgSend(a1, "dmc_removeAccounts:asynchronous:", v9, a4);
}

- (void)dmc_removeMAIDRelatedAccountsWithPersonaID:()DeviceManagementClient asynchronous:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = *DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1A7863000, v7, OS_LOG_TYPE_INFO, "Will remove accounts with personaID: %{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__ACAccountStore_DeviceManagementClient__dmc_removeMAIDRelatedAccountsWithPersonaID_asynchronous___block_invoke;
  v10[3] = &unk_1E5CFD520;
  id v11 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(a1, "dmc_accountsWithPredicateBlock:", v10);
  objc_msgSend(a1, "dmc_removeAccounts:asynchronous:", v9, a4);
}

- (void)dmc_removeAccountWithIdentifier:()DeviceManagementClient asynchronous:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(a1, "accountWithIdentifier:");
  id v7 = (void *)v6;
  if (v6)
  {
    v9[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    objc_msgSend(a1, "dmc_removeAccounts:asynchronous:", v8, a4);
  }
}

- (id)dmc_accountsWithPredicateBlock:()DeviceManagementClient
{
  v21[7] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F17808];
  v21[0] = *MEMORY[0x1E4F17890];
  v21[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F17760];
  v21[2] = *MEMORY[0x1E4F17750];
  v21[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F17848];
  v21[4] = *MEMORY[0x1E4F177E0];
  v21[5] = v7;
  v21[6] = *MEMORY[0x1E4F177B8];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:7];
  id v18 = 0;
  id v9 = [a1 accountsWithAccountTypeIdentifiers:v8 preloadedProperties:0 error:&v18];
  id v10 = v18;
  if (v10)
  {
    id v11 = *DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_ERROR, "Fetching accounts failed with error: %{public}@", buf, 0xCu);
    }
    id v12 = 0;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:v4];
    uint64_t v14 = [v9 filteredArrayUsingPredicate:v13];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__ACAccountStore_DeviceManagementClient__dmc_accountsWithPredicateBlock___block_invoke;
    v16[3] = &unk_1E5CFD548;
    id v17 = v8;
    id v12 = [v14 sortedArrayUsingComparator:v16];
  }
  return v12;
}

- (void)dmc_removeAccounts:()DeviceManagementClient asynchronous:
{
  v30[7] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F17750];
  v30[0] = *MEMORY[0x1E4F17848];
  v30[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F177B8];
  v30[2] = *MEMORY[0x1E4F17808];
  void v30[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F17760];
  v30[4] = *MEMORY[0x1E4F17890];
  v30[5] = v8;
  v30[6] = *MEMORY[0x1E4F177E0];
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a3;
  id v11 = [v9 arrayWithObjects:v30 count:7];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke;
  v27[3] = &unk_1E5CFD548;
  id v20 = v11;
  id v28 = v20;
  id v12 = [v10 sortedArrayUsingComparator:v27];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
        id v18 = objc_msgSend(a1, "_dmc_workerQueue");
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __74__ACAccountStore_DeviceManagementClient__dmc_removeAccounts_asynchronous___block_invoke_2;
        v22[3] = &unk_1E5CFD598;
        void v22[4] = v17;
        v22[5] = a1;
        [v18 queueBlock:v22];

        if ((a4 & 1) == 0)
        {
          id v19 = objc_msgSend(a1, "_dmc_workerQueue");
          [v19 waitUntilAllBlocksAreFinished];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v14);
  }
}

- (DMCHangDetectionQueue)_dmc_workerQueue
{
  objc_getAssociatedObject(a1, a2);
  id v4 = (DMCHangDetectionQueue *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = [[DMCHangDetectionQueue alloc] initWithQoS:-1 hangThreshold:@"ACAccountStore+DMC" owner:65.0];
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (uint64_t)_dmc_missingAccountError
{
  return [MEMORY[0x1E4F28C58] DMCErrorWithDomain:@"DMCStoreErrorDomain" code:30002 descriptionArray:0 errorType:@"DMCFatalError"];
}

@end
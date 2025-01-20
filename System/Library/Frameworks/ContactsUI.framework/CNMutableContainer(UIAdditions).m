@interface CNMutableContainer(UIAdditions)
- (uint64_t)addContainerInStore:()UIAdditions toAccountWithIdentifier:saveRequest:;
- (uint64_t)deleteContainerInStore:()UIAdditions saveRequest:;
- (uint64_t)updateContainerInStore:()UIAdditions saveRequest:;
@end

@implementation CNMutableContainer(UIAdditions)

- (uint64_t)deleteContainerInStore:()UIAdditions saveRequest:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"CNContainer+UIAdditions.m" lineNumber:57 description:@"A store is needed here"];
  }
  v9 = CNUILogAccountsAndGroupsList();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = a1;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "[CNContainer+UIAdditions] deleting container %@ in store %@", buf, 0x16u);
  }

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  }
  [v8 deleteContainer:a1];
  id v16 = 0;
  uint64_t v10 = [v7 executeSaveRequest:v8 error:&v16];
  id v11 = v16;
  if ((v10 & 1) == 0)
  {
    v12 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [a1 identifier];
      *(_DWORD *)buf = 138544130;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = a1;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "[CNContainer+UIAdditions] Could not delete container with identifer %{public}@, error %{public}@, store %{public}@, full container %@", buf, 0x2Au);
    }
  }

  return v10;
}

- (uint64_t)updateContainerInStore:()UIAdditions saveRequest:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"CNContainer+UIAdditions.m" lineNumber:38 description:@"A store is needed here"];
  }
  v9 = CNUILogAccountsAndGroupsList();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = a1;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "[CNContainer+UIAdditions] updating container %@ in store %@", buf, 0x16u);
  }

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  }
  [v8 updateContainer:a1];
  id v16 = 0;
  uint64_t v10 = [v7 executeSaveRequest:v8 error:&v16];
  id v11 = v16;
  if ((v10 & 1) == 0)
  {
    v12 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [a1 identifier];
      *(_DWORD *)buf = 138544130;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = a1;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "[CNContainer+UIAdditions] Could not update container with identifer %{public}@, error %{public}@, store %{public}@, full container %@", buf, 0x2Au);
    }
  }

  return v10;
}

- (uint64_t)addContainerInStore:()UIAdditions toAccountWithIdentifier:saveRequest:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"CNContainer+UIAdditions.m" lineNumber:18 description:@"A store is needed here"];
  }
  v12 = CNUILogAccountsAndGroupsList();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    __int16 v21 = a1;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "[CNContainer+UIAdditions] adding container %@ to account %@ in store %@", buf, 0x20u);
  }

  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  }
  [v11 addContainer:a1 toAccountWithIdentifier:v10];
  id v19 = 0;
  uint64_t v13 = [v9 executeSaveRequest:v11 error:&v19];
  id v14 = v19;
  if ((v13 & 1) == 0)
  {
    v15 = CNUILogAccountsAndGroupsList();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [a1 identifier];
      *(_DWORD *)buf = 138544386;
      __int16 v21 = v17;
      __int16 v22 = 2114;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2112;
      v29 = a1;
      _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "[CNContainer+UIAdditions] Could not add container with identifer %{public}@ to account %{public}@, error %{public}@, store %{public}@, full container %@", buf, 0x34u);
    }
  }

  return v13;
}

@end
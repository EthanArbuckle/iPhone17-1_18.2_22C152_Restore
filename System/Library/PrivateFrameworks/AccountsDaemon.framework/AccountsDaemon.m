void sub_2183B0550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183B06F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ac_unfair_lock_perform_with_result(os_unfair_lock_s *a1, void *a2)
{
  v3 = a2;
  os_unfair_lock_lock(a1);
  v4 = v3[2](v3);
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_2183B0D74(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B0D88(_Unwind_Exception *a1)
{
}

id ac_unfair_lock_perform_with_result_0(os_unfair_lock_s *a1, void *a2)
{
  v3 = a2;
  os_unfair_lock_lock(a1);
  v4 = v3[2](v3);
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_2183B0E0C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B0E20(_Unwind_Exception *a1)
{
}

id ac_unfair_lock_perform_with_result_1(os_unfair_lock_s *a1, void *a2)
{
  v3 = a2;
  os_unfair_lock_lock(a1);
  v4 = v3[2](v3);
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_2183B0EA4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B0EB8(_Unwind_Exception *a1)
{
}

void sub_2183B1E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2183B26DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ACDLogSystem()
{
  if (_ACDLogSystem_onceToken != -1) {
    dispatch_once(&_ACDLogSystem_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)_ACDLogSystem_log;

  return v0;
}

void sub_2183B2A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2183B36D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id obj, id *a12, id *a13, id *a14, id *location)
{
}

id _ACDConnectionLogSystem()
{
  if (_ACDConnectionLogSystem_onceToken != -1) {
    dispatch_once(&_ACDConnectionLogSystem_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_ACDConnectionLogSystem_log;

  return v0;
}

id -[ACDAccountStore _block_accountWithIdentifier:](ACDAccountStore *self, SEL a2, id a3)
{
  v4 = [(ACDAccountStore *)self _accountWithIdentifier:a3];
  if (v4) {
    v5 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:v4 accountStore:self];
  }
  else {
    v5 = 0;
  }

  return v5;
}

void sub_2183B4DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183B5BF4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B5C04()
{
}

void sub_2183B5C2C()
{
}

void sub_2183B5E14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2183B5F64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2183B61E0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2183B6354(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2183B6888(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B689C(_Unwind_Exception *a1)
{
}

id -[ACDAccountStore _block_accountsWithAccountType:options:error:](ACDAccountStore *self, SEL a2, id a3, unint64_t a4, id *a5)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  databaseConnection = self->_databaseConnection;
  v10 = [v8 objectID];
  v11 = [(ACDDatabaseConnection *)databaseConnection managedObjectIDForURI:v10];

  if (v11)
  {
    id v29 = v8;
    uint64_t v12 = [(ACDAccountStore *)self _predicateForFetchingAccountsWithManagedAccountTypeID:v11 options:a4];
    v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:1];
    uint64_t v14 = self->_databaseConnection;
    uint64_t v15 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
    v28 = (void *)v12;
    uint64_t v16 = [(ACDDatabaseConnection *)v14 fetchObjectsForEntityNamed:@"Account" withPredicate:v12 sortDescriptor:v13 prefetchKeypaths:v15];

    id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = (void *)[objc_alloc(MEMORY[0x263EFB1F8]) initWithManagedAccount:*(void *)(*((void *)&v30 + 1) + 8 * i) accountStore:self];
          if (v23) {
            [v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v24 = 0;
    id v8 = v29;
  }
  else
  {
    v25 = _ACDLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ACDAccountStore _block_accountsWithAccountType:options:error:]();
    }

    v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:4 userInfo:0];
    id v24 = v26;
    id v17 = 0;
    if (a5 && v26)
    {
      id v24 = v26;
      id v17 = 0;
      *a5 = v24;
    }
  }

  return v17;
}

void sub_2183B6F98()
{
}

id -[ACDAccountStore _block_accountsWithAccountTypeIdentifiers:preloadedProperties:](ACDAccountStore *self, SEL a2, id a3, id a4)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 count];
    v9 = (void *)MEMORY[0x263F08A98];
    if (v8 == 1)
    {
      v10 = [v6 firstObject];
      v11 = [v9 predicateWithFormat:@"accountType.identifier == %@", v10];
    }
    else
    {
      v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"accountType.identifier IN %@", v6];
    }
  }
  else
  {
    v11 = 0;
  }
  unint64_t v12 = 0x263EFB000uLL;
  v13 = [MEMORY[0x263EFB1F8] keypathsRequiredForInitialization];
  uint64_t v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = *MEMORY[0x263EFB148];
  if ([v7 containsObject:*MEMORY[0x263EFB148]]) {
    [v14 addObject:v15];
  }
  uint64_t v16 = *MEMORY[0x263EFB158];
  if ([v7 containsObject:*MEMORY[0x263EFB158]]) {
    [v14 addObject:v16];
  }
  id v17 = [(ACDDatabaseConnection *)self->_databaseConnection fetchObjectsForEntityNamed:@"Account" withPredicate:v11 sortDescriptor:0 prefetchKeypaths:v14];
  if ([v17 count])
  {
    v80 = v14;
    v81 = v11;
    id v82 = v6;
    id v89 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v86 = [v7 containsObject:v15];
    int v85 = [v7 containsObject:v16];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v79 = v17;
    obuint64_t j = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v107;
      id v83 = v7;
      uint64_t v84 = *(void *)v107;
      do
      {
        uint64_t v21 = 0;
        uint64_t v87 = v19;
        do
        {
          if (*(void *)v107 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v106 + 1) + 8 * v21);
          v23 = (void *)[objc_alloc(*(Class *)(v12 + 504)) initWithManagedAccount:v22];
          if (v23)
          {
            [v89 addObject:v23];
            if ([v7 count])
            {
              if (v86)
              {
                id v24 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                long long v102 = 0u;
                long long v103 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                v25 = [v22 enabledDataclasses];
                uint64_t v26 = [v25 countByEnumeratingWithState:&v102 objects:v113 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = *(void *)v103;
                  do
                  {
                    for (uint64_t i = 0; i != v27; ++i)
                    {
                      if (*(void *)v103 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      long long v30 = [*(id *)(*((void *)&v102 + 1) + 8 * i) name];
                      [v24 addObject:v30];
                    }
                    uint64_t v27 = [v25 countByEnumeratingWithState:&v102 objects:v113 count:16];
                  }
                  while (v27);
                }

                long long v31 = [MEMORY[0x263EFB288] setWithSet:v24];
                [v23 setTrackedEnabledDataclasses:v31];

                long long v32 = [v23 accountType];
                long long v33 = [v22 accountType];
                v34 = [v33 syncableDataclassStrings];
                [v32 setSyncableDataclasses:v34];

                uint64_t v35 = [v23 parentAccount];

                if (v35)
                {
                  id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                  long long v98 = 0u;
                  long long v99 = 0u;
                  long long v100 = 0u;
                  long long v101 = 0u;
                  v37 = [v22 parentAccount];
                  v38 = [v37 enabledDataclasses];

                  uint64_t v39 = [v38 countByEnumeratingWithState:&v98 objects:v112 count:16];
                  if (v39)
                  {
                    uint64_t v40 = v39;
                    uint64_t v41 = *(void *)v99;
                    do
                    {
                      for (uint64_t j = 0; j != v40; ++j)
                      {
                        if (*(void *)v99 != v41) {
                          objc_enumerationMutation(v38);
                        }
                        v43 = [*(id *)(*((void *)&v98 + 1) + 8 * j) name];
                        [v36 addObject:v43];
                      }
                      uint64_t v40 = [v38 countByEnumeratingWithState:&v98 objects:v112 count:16];
                    }
                    while (v40);
                  }

                  v44 = [MEMORY[0x263EFB288] setWithSet:v36];
                  v45 = [v23 parentAccount];
                  [v45 setTrackedEnabledDataclasses:v44];

                  v46 = [v23 parentAccount];
                  v47 = [v46 accountType];
                  v48 = [v22 parentAccount];
                  v49 = [v48 accountType];
                  v50 = [v49 syncableDataclassStrings];
                  [v47 setSyncableDataclasses:v50];

                  id v7 = v83;
                }

                unint64_t v12 = 0x263EFB000;
                uint64_t v20 = v84;
                uint64_t v19 = v87;
              }
              if (v85)
              {
                id v51 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                long long v94 = 0u;
                long long v95 = 0u;
                long long v96 = 0u;
                long long v97 = 0u;
                v52 = [v22 provisionedDataclasses];
                uint64_t v53 = [v52 countByEnumeratingWithState:&v94 objects:v111 count:16];
                if (v53)
                {
                  uint64_t v54 = v53;
                  uint64_t v55 = *(void *)v95;
                  do
                  {
                    for (uint64_t k = 0; k != v54; ++k)
                    {
                      if (*(void *)v95 != v55) {
                        objc_enumerationMutation(v52);
                      }
                      v57 = [*(id *)(*((void *)&v94 + 1) + 8 * k) name];
                      [v51 addObject:v57];
                    }
                    uint64_t v54 = [v52 countByEnumeratingWithState:&v94 objects:v111 count:16];
                  }
                  while (v54);
                }

                v58 = [MEMORY[0x263EFB288] setWithSet:v51];
                [v23 setTrackedProvisionedDataclasses:v58];

                v59 = [v23 accountType];
                v60 = [v22 accountType];
                v61 = [v60 supportedDataclassStrings];
                [v59 setSupportedDataclasses:v61];

                v62 = [v23 parentAccount];

                if (v62)
                {
                  id v63 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                  long long v90 = 0u;
                  long long v91 = 0u;
                  long long v92 = 0u;
                  long long v93 = 0u;
                  v64 = [v22 parentAccount];
                  v65 = [v64 provisionedDataclasses];

                  uint64_t v66 = [v65 countByEnumeratingWithState:&v90 objects:v110 count:16];
                  if (v66)
                  {
                    uint64_t v67 = v66;
                    uint64_t v68 = *(void *)v91;
                    do
                    {
                      for (uint64_t m = 0; m != v67; ++m)
                      {
                        if (*(void *)v91 != v68) {
                          objc_enumerationMutation(v65);
                        }
                        v70 = [*(id *)(*((void *)&v90 + 1) + 8 * m) name];
                        [v63 addObject:v70];
                      }
                      uint64_t v67 = [v65 countByEnumeratingWithState:&v90 objects:v110 count:16];
                    }
                    while (v67);
                  }

                  v71 = [MEMORY[0x263EFB288] setWithSet:v63];
                  v72 = [v23 parentAccount];
                  [v72 setTrackedProvisionedDataclasses:v71];

                  v73 = [v23 parentAccount];
                  v74 = [v73 accountType];
                  v75 = [v22 parentAccount];
                  v76 = [v75 accountType];
                  v77 = [v76 supportedDataclassStrings];
                  [v74 setSupportedDataclasses:v77];

                  id v7 = v83;
                }

                unint64_t v12 = 0x263EFB000;
                uint64_t v20 = v84;
                uint64_t v19 = v87;
              }
            }
          }

          ++v21;
        }
        while (v21 != v19);
        uint64_t v19 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
      }
      while (v19);
    }

    v11 = v81;
    id v6 = v82;
    id v17 = v79;
    uint64_t v14 = v80;
  }
  else
  {
    id v89 = 0;
  }

  return v89;
}

void sub_2183B7B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2183B7F00(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B7F14(_Unwind_Exception *a1)
{
}

void sub_2183B8030(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183B85F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *tetheredSyncSourceTypeForDataType()
{
  if (lockdown_connect())
  {
    uint64_t v0 = lockdown_copy_value();
    if (v0)
    {
      CFDictionaryRef v1 = (const __CFDictionary *)v0;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v1))
      {
        v3 = CFDictionaryGetValue(v1, @"SyncingOS");
        v4 = v3;
        if (v3) {
          v5 = v3;
        }
        else {
          v5 = @"iPhone";
        }
      }
      else
      {
        v5 = @"iPhone";
      }
      CFRelease(v1);
    }
    else
    {
      v5 = @"iPhone";
    }
    lockdown_disconnect();
  }
  else
  {
    v5 = @"iPhone";
  }

  return v5;
}

uint64_t syncDataTypeForDataclass(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263EFB438]])
  {
    uint64_t v2 = kACDSyncDataTypeMailAccounts;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EFB3F0]])
  {
    uint64_t v2 = kACDSyncDataTypeContacts;
  }
  else if (([v1 isEqualToString:*MEMORY[0x263EFB3E0]] & 1) != 0 {
         || [v1 isEqualToString:*MEMORY[0x263EFB478]])
  }
  {
    uint64_t v2 = kACDSyncDataTypeCalendars;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EFB3C0]])
  {
    uint64_t v2 = kACDSyncDataTypeBookmarks;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263EFB460]])
  {
    uint64_t v2 = kACDSyncDataTypeNotes;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_2183B8C38(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B8C4C(_Unwind_Exception *a1)
{
}

void sub_2183B8F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183B9330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183B949C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183B94B0(_Unwind_Exception *a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_2183BA540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2183BB650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2183BBDB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2183BC328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183BC8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183BD070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2183BD6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2183BDE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183BE9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_2183BF4C0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183BF4D0()
{
}

void sub_2183BF4F8()
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2183BF7E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2183BF8D8(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183BF8EC(_Unwind_Exception *a1)
{
}

void sub_2183BFA9C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183BFAB0(_Unwind_Exception *a1)
{
}

void sub_2183BFD64(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183BFD78(_Unwind_Exception *a1)
{
}

void sub_2183BFF80(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183BFF90()
{
}

void sub_2183BFFB8()
{
}

void sub_2183C0674(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C070C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C07E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C089C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C0938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C09D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C0A54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183C0CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2183CB5F0(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CB604(_Unwind_Exception *a1)
{
}

void sub_2183CB6F4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CB708(_Unwind_Exception *a1)
{
}

void sub_2183CB960(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CB974(_Unwind_Exception *a1)
{
}

void sub_2183CBB34(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CBB48(_Unwind_Exception *a1)
{
}

void sub_2183CBCF4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CBD08(_Unwind_Exception *a1)
{
}

void sub_2183CBFF4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CC008(_Unwind_Exception *a1)
{
}

void sub_2183CC248(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CC25C(_Unwind_Exception *a1)
{
}

id _ACDManagedObjectModel()
{
  if (_ACDManagedObjectModel_onceToken != -1) {
    dispatch_once(&_ACDManagedObjectModel_onceToken, &__block_literal_global);
  }
  uint64_t v0 = (void *)_ACDManagedObjectModel_managedObjectModel;

  return v0;
}

void sub_2183CD1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_2183CD3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2183CD56C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __CFString *a11, id a12, __CFString *a13, id a14, long long buf)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    id v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_2183AD000, v17, OS_LOG_TYPE_DEFAULT, "\"Caught an exception during the first attempt to open the Accounts DB: %@\"", (uint8_t *)&buf, 0xCu);
    }

    if (v15)
    {
      uint64_t v18 = [v16 userInfo];
      uint64_t v19 = *MEMORY[0x263EFF150];
      uint64_t v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263EFF150]];

      v23 = (void *)MEMORY[0x263F087E8];
      if (v20)
      {
        uint64_t v21 = [v20 integerValue];
        a13 = @"TriggeringException";
        a14 = v16;
        v22 = [NSDictionary dictionaryWithObjects:&a14 forKeys:&a13 count:1];
        [v23 errorWithDomain:v19 code:v21 userInfo:v22];
      }
      else
      {
        a11 = @"TriggeringException";
        a12 = v16;
        v22 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
        [v23 errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:v22];
      }
      *uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_end_catch();
    JUMPOUT(0x2183CD50CLL);
  }
  _Unwind_Resume(a1);
}

void sub_2183CDC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2183CE490(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __CFString *a11, id a12, __CFString *a13, id a14, long long buf)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(a1);
    id v17 = _ACDLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_2183AD000, v17, OS_LOG_TYPE_DEFAULT, "\"Caught an exception during the first attempt to open the Accounts DB: %@\"", (uint8_t *)&buf, 0xCu);
    }

    if (v15)
    {
      uint64_t v18 = [v16 userInfo];
      uint64_t v19 = *MEMORY[0x263EFF150];
      uint64_t v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263EFF150]];

      v23 = (void *)MEMORY[0x263F087E8];
      if (v20)
      {
        uint64_t v21 = [v20 integerValue];
        a13 = @"TriggeringException";
        a14 = v16;
        v22 = [NSDictionary dictionaryWithObjects:&a14 forKeys:&a13 count:1];
        [v23 errorWithDomain:v19 code:v21 userInfo:v22];
      }
      else
      {
        a11 = @"TriggeringException";
        a12 = v16;
        v22 = [NSDictionary dictionaryWithObjects:&a12 forKeys:&a11 count:1];
        [v23 errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:v22];
      }
      *uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_end_catch();
    JUMPOUT(0x2183CE430);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2183CEB14(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_2183CEB24()
{
}

void sub_2183CEB4C()
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2183CF158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183CF728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D425C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D45E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D48C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D4AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D4ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2183D5640(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2183D5E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D61A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D65A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2183D6B34(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2183D6F68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2183D716C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D742C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D771C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D7A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D7F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D82EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D85FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D87F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D8B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2183D90D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183D9500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2183D9930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183DA318(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183DA59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2183DACE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183DC3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183DC7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183DD58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183DDB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183DEBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2183DF418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_22(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_25(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2112;
  *(void *)(a4 + 14) = v4;
  return result;
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_29(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

id ExplicitAllowedPluginsByChangeType()
{
  if (ExplicitAllowedPluginsByChangeType_onceToken != -1) {
    dispatch_once(&ExplicitAllowedPluginsByChangeType_onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)ExplicitAllowedPluginsByChangeType_explicitAllowedPluginsForChangeType;

  return v0;
}

void __ExplicitAllowedPluginsByChangeType_block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = &unk_26C998970;
  v3[0] = &unk_26C998A48;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:&v2 count:1];
  uint64_t v1 = (void *)ExplicitAllowedPluginsByChangeType_explicitAllowedPluginsForChangeType;
  ExplicitAllowedPluginsByChangeType_explicitAllowedPluginsForChangeType = v0;
}

__CFString *ACDStringFromChangeType(int a1)
{
  if ((a1 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_264321540[a1 - 1];
  }
}

void sub_2183E2090(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_2183E20B8(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x2183E20C4);
}

void sub_2183E2AB8(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_2183E2AE0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x2183E2AECLL);
}

void sub_2183E324C(_Unwind_Exception *a1)
{
}

void sub_2183E326C(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x2183E3278);
}

void sub_2183E39D8(_Unwind_Exception *a1)
{
}

void sub_2183E39F8(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x2183E3A04);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2183E4F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_2183E539C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _ACDKeychainLogSystem()
{
  if (_ACDKeychainLogSystem_onceToken != -1) {
    dispatch_once(&_ACDKeychainLogSystem_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)_ACDKeychainLogSystem_log;

  return v0;
}

id _ACDNotificationLogSystem()
{
  if (_ACDNotificationLogSystem_onceToken != -1) {
    dispatch_once(&_ACDNotificationLogSystem_onceToken, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)_ACDNotificationLogSystem_log;

  return v0;
}

id _ACDPluginLogSystem()
{
  if (_ACDPluginLogSystem_onceToken != -1) {
    dispatch_once(&_ACDPluginLogSystem_onceToken, &__block_literal_global_13);
  }
  uint64_t v0 = (void *)_ACDPluginLogSystem_log;

  return v0;
}

id _ACDSaveLogSystem()
{
  if (_ACDSaveLogSystem_onceToken != -1) {
    dispatch_once(&_ACDSaveLogSystem_onceToken, &__block_literal_global_16);
  }
  uint64_t v0 = (void *)_ACDSaveLogSystem_log;

  return v0;
}

id _ACDEntitlementLogSystem()
{
  if (_ACDEntitlementLogSystem_onceToken != -1) {
    dispatch_once(&_ACDEntitlementLogSystem_onceToken, &__block_literal_global_19);
  }
  uint64_t v0 = (void *)_ACDEntitlementLogSystem_log;

  return v0;
}

id _ACDNotificationSignpostSystem()
{
  if (_ACDNotificationSignpostSystem_onceToken != -1) {
    dispatch_once(&_ACDNotificationSignpostSystem_onceToken, &__block_literal_global_22);
  }
  uint64_t v0 = (void *)_ACDNotificationSignpostSystem_log;

  return v0;
}

void ACDLogAccessRequest(void *a1, void *a2, int a3, uint64_t a4, double a5)
{
  id v9 = a2;
  uint64_t v10 = (objc_class *)MEMORY[0x263EFF9A0];
  id v11 = a1;
  uint64_t v12 = (void *)[[v10 alloc] initWithCapacity:5];
  uint64_t v13 = +[ACDTCCUtilities _TCCServiceForAccountTypeID:v11];

  if (v9 && v13)
  {
    [v12 setObject:&unk_26C9989A0 forKey:v9];
    [v12 setObject:&unk_26C9989A0 forKey:v13];
    if (a3) {
      uint64_t v14 = &unk_26C9989A0;
    }
    else {
      uint64_t v14 = &unk_26C9989B8;
    }
    [v12 setObject:v14 forKey:@"response"];
    uint64_t v15 = [NSNumber numberWithBool:a4];
    [v12 setObject:v15 forKey:@"jitVisible"];

    uint64_t v16 = [NSNumber numberWithInt:(int)-a5];
    [v12 setObject:v16 forKey:@"jitVisibleTime"];

    if (ACDLogAccessRequest_onceToken != -1) {
      dispatch_once(&ACDLogAccessRequest_onceToken, &__block_literal_global_37);
    }
    if (ACDLogAccessRequest__loadedCRLogStructuredData)
    {
      ACDLogAccessRequest__loadedCRLogStructuredData(167, v12);
    }
    else
    {
      id v17 = _ACDLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        ACDLogAccessRequest_cold_1(v17);
      }
    }
  }
}

void *__ACDLogAccessRequest_block_invoke()
{
  uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  result = dlsym(v0, "CRLogStructuredData");
  ACDLogAccessRequest__loadedCRLogStructuredData = (uint64_t (*)(void, void))result;
  return result;
}

void _ACDLazyArrayInitializeIfNecessary(void *a1)
{
  int v1 = a1;
  uint64_t v8 = v1;
  if (!v1)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    id v7 = [NSString stringWithUTF8String:"void _ACDLazyArrayInitializeIfNecessary(ACDLazyArray * _Nonnull __strong)"];
    [v6 handleFailureInFunction:v7, @"ACDLazyArray.m", 65, @"Invalid parameter not satisfying: %@", @"self" file lineNumber description];

    int v1 = 0;
  }
  os_unfair_lock_lock(v1 + 2);
  uint64_t v2 = *(void *)&v8[4]._os_unfair_lock_opaque;
  if (v2)
  {
    uint64_t v3 = (*(void (**)(void))(v2 + 16))();
    uint64_t v4 = *(void **)&v8[6]._os_unfair_lock_opaque;
    *(void *)&v8[6]._os_unfair_lock_opaque = v3;

    uint64_t v5 = *(void **)&v8[4]._os_unfair_lock_opaque;
    *(void *)&v8[4]._os_unfair_lock_opaque = 0;
  }
  os_unfair_lock_unlock(v8 + 2);
}

id OUTLINED_FUNCTION_0_4(id a1)
{
  return a1;
}

void sub_2183EB504(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE(int a1, uint64_t a2, void *a3, const char *a4)
{
  id v7 = a3;
  if (!a2 && a1)
  {
    uint64_t v8 = _ACDPluginLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE_cold_1(v7, a4, v8);
    }
  }
}

void sub_2183EC874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_2183EC9F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2183ECD28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2183EDADC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183EE3B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_2183EEEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2183EF460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2183EF708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183EFA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id decodeString(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v2 = [v1 length];
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v11 - v3;
  id v5 = v1;
  uint64_t v6 = [v5 UTF8String];
  if (v2 < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = v2;
    do
    {
      v4[v7] = *(unsigned char *)(v6 + v7) - ((v7 + 1) & 1);
      ++v7;
    }
    while (v2 != v7);
  }
  v4[v8] = 0;
  id v9 = [NSString stringWithUTF8String:v4];

  return v9;
}

void sub_2183F2A9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183F2B74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183F2CD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183F2E8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183F2F40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183F300C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183F30D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __HandleLanguageChangeNotification(uint64_t a1, void *a2)
{
  uint64_t v3 = _ACLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __HandleLanguageChangeNotification_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id v11 = a2;
  if (objc_opt_respondsToSelector()) {
    [v11 _handleLanguageChangedDarwinNotification];
  }
}

void sub_2183F3B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

id OUTLINED_FUNCTION_4_0(uint64_t a1)
{
  int v2 = (id *)(a1 + 56);
  return objc_loadWeakRetained(v2);
}

void sub_2183F60E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_2183F67B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2183F6D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183F71F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183F76E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)a1 + 8) + 40);
}

void sub_2183F85C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_2183FA240(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183FA56C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183FABC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183FAECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183FB150(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_2183FD2D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183FD380(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183FD7FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2183FD9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = __CrashReporterSupportLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264321D18;
    uint64_t v6 = 0;
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  int v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary) {
    __getSimulateCrashSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSimulateCrashSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CrashReporterSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CrashReporterSupportLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2183FE7B8(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2 == 1)
  {
    id v22 = objc_begin_catch(exc_buf);
    v23 = _ACDLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ACDDatabaseMigrator runReturningError:]();
    }

    id v24 = (void *)MEMORY[0x263F087E8];
    *(void *)(v20 - 72) = @"TriggeringException";
    *(void *)(v20 - 64) = v22;
    v25 = [NSDictionary dictionaryWithObjects:v20 - 64 forKeys:v20 - 72 count:1];
    [v24 errorWithDomain:*MEMORY[0x263EFB070] code:10000 userInfo:v25];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    if (!v18) {
      JUMPOUT(0x2183FE730);
    }
    JUMPOUT(0x2183FE724);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose((const void *)(v20 - 104), 8);
  _Unwind_Resume(exc_buf);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_2183FF460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183FF688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2183FF960(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2183FF814);
  }
  _Unwind_Resume(a1);
}

const char *OUTLINED_FUNCTION_3_2()
{
  return sel_getName(v0);
}

void sub_2184060E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_218406288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21840650C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_218406830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_218406B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_218406E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21840718C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2184087C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_218408A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ACDAccountSyncEnabled()
{
  uint64_t v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ACDAccountSyncEnabled_cold_1();
  }

  return 0;
}

uint64_t ACDAccountSyncAccountIsSyncable()
{
  uint64_t v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ACDAccountSyncEnabled_cold_1();
  }

  return 0;
}

uint64_t ACDAccountSyncDevices()
{
  uint64_t v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ACDAccountSyncDevices_cold_1();
  }

  return MEMORY[0x263EFFA68];
}

uint64_t ACDAccountSyncRemoveTombstones()
{
  uint64_t v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ACDAccountSyncRemoveTombstones_cold_1();
  }

  return MEMORY[0x263EFFA68];
}

uint64_t ACDAccountSyncMarkAccountCreated()
{
  uint64_t v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ACDAccountSyncMarkAccountCreated_cold_1();
  }

  return 0;
}

uint64_t ACDAccountSyncMarkAccountDeleted()
{
  uint64_t v0 = _ACDLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ACDAccountSyncMarkAccountDeleted_cold_1();
  }

  return 0;
}

uint64_t SetTetheredSyncingDisabledForDatatype(uint64_t a1, char a2, CFStringRef *a3)
{
  char valuePtr = a2;
  uint64_t v5 = lockdown_connect();
  if (v5 && (uint64_t v6 = lockdown_copy_value()) != 0)
  {
    CFDictionaryRef v7 = (const __CFDictionary *)v6;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v7) && CFDictionaryGetCount(v7) >= 1) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v7);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFDictionaryRef Mutable = MutableCopy;
    CFRelease(v7);
  }
  else
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFNumberRef v11 = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, @"DisableTethered");
  if (Value && CFNumberCompare(v11, Value, 0) == kCFCompareEqualTo)
  {
    int v13 = 0;
    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFDictionarySetValue(Mutable, @"DisableTethered", v11);
  int v13 = 1;
  if (v11) {
LABEL_12:
  }
    CFRelease(v11);
LABEL_13:
  if (!v13 || (uint64_t v14 = lockdown_set_value(), !v14))
  {
    uint64_t v16 = 0;
    if (!v5) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v15 = v14;
  NSLog(&cfstr_CouldNotSetThe.isa, a1, Mutable, @"com.apple.mobile.tethered_sync", v14);
  if (a3) {
    *a3 = CFStringCreateWithFormat(0, 0, @"Could not set the lockdown key %@ with %@ for %@: %d", a1, Mutable, @"com.apple.mobile.tethered_sync", v15);
  }
  uint64_t v16 = 0xFFFFFFFFLL;
  if (v5) {
LABEL_20:
  }
    lockdown_disconnect();
LABEL_21:
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v16;
}

uint64_t GetTetheredSyncingDisabledForDataType(uint64_t a1, unsigned char *a2)
{
  if (a2)
  {
    *a2 = 0;
    uint64_t result = lockdown_connect();
    if (result)
    {
      uint64_t v4 = lockdown_copy_value();
      if (v4)
      {
        CFDictionaryRef v5 = (const __CFDictionary *)v4;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v5))
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"DisableTethered");
          if (Value) {
            CFNumberGetValue(Value, kCFNumberCharType, a2);
          }
        }
        lockdown_disconnect();
        CFRelease(v5);
      }
      else
      {
        lockdown_disconnect();
      }
      return 0;
    }
  }
  else
  {
    NSLog(&cfstr_NoOutDisabledB.isa);
    return 4294967293;
  }
  return result;
}

uint64_t SetAccountNameEnabledForDataType(const __CFString *a1, uint64_t a2, int a3, CFStringRef *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = lockdown_connect();
  if (v8 && (uint64_t v9 = lockdown_copy_value()) != 0)
  {
    CFDictionaryRef v10 = (const __CFDictionary *)v9;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v10) && CFDictionaryGetCount(v10) >= 1) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v10);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFDictionaryRef Mutable = MutableCopy;
    CFRelease(v10);
  }
  else
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"AccountNames");
  if (Value) {
    CFArrayRef v16 = CFArrayCreateMutableCopy(0, 0, Value);
  }
  else {
    CFArrayRef v16 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  }
  id v17 = v16;
  CFIndex v18 = _externalSourcesArrayIndexOfExternalSource(v16, a1);
  if (a3 || v18 < 0)
  {
    uint64_t v13 = 0;
    if (a3 != 1 || v18 != -1) {
      goto LABEL_24;
    }
    CFArrayAppendValue(v17, a1);
  }
  else
  {
    CFArrayRemoveValueAtIndex(v17, v18);
  }
  CFDictionarySetValue(Mutable, @"AccountNames", v17);
  uint64_t v19 = lockdown_set_value();
  if (!v19)
  {
    uint64_t v13 = 0;
    if (!v8) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v20 = v19;
  NSLog(&cfstr_CouldNotSetThe.isa, a2, Mutable, @"com.apple.mobile.data_sync", v19);
  if (a4) {
    *a4 = CFStringCreateWithFormat(0, 0, @"Could not set the lockdown key %@ with %@ for %@: %d", a2, Mutable, @"com.apple.mobile.data_sync", v20);
  }
  uint64_t v13 = 0xFFFFFFFFLL;
LABEL_24:
  if (v8) {
LABEL_25:
  }
    lockdown_disconnect();
LABEL_26:
  if (v17) {
    CFRelease(v17);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v13;
}

uint64_t _externalSourcesArrayIndexOfExternalSource(const __CFArray *a1, const __CFString *a2)
{
  if (!a1) {
    return -1;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return -1;
  }
  CFIndex v5 = Count;
  CFIndex v6 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
    if (ValueAtIndex)
    {
      if (CFEqual(a2, ValueAtIndex)) {
        break;
      }
    }
    if (v5 == ++v6) {
      return -1;
    }
  }
  return v6;
}

uint64_t SetExternalSourceEnabledForDataType(const __CFString *a1, uint64_t a2, int a3, CFStringRef *a4)
{
  uint64_t v8 = lockdown_connect();
  if (v8 && (uint64_t v9 = lockdown_copy_value()) != 0)
  {
    CFDictionaryRef v10 = (const __CFDictionary *)v9;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v10) && CFDictionaryGetCount(v10) >= 1) {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v10);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    }
    CFDictionaryRef Mutable = MutableCopy;
    CFRelease(v10);
  }
  else
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(Mutable, @"Sources");
  if (Value) {
    CFArrayRef v15 = CFArrayCreateMutableCopy(0, 0, Value);
  }
  else {
    CFArrayRef v15 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  }
  CFArrayRef v16 = v15;
  CFIndex v17 = _externalSourcesArrayIndexOfExternalSource(v15, a1);
  if (a3 || v17 < 0)
  {
    uint64_t v18 = 0;
    if (a3 != 1 || v17 != -1) {
      goto LABEL_22;
    }
    CFArrayAppendValue(v16, a1);
  }
  else
  {
    CFArrayRemoveValueAtIndex(v16, v17);
  }
  CFDictionarySetValue(Mutable, @"Sources", v16);
  uint64_t v19 = lockdown_set_value();
  if (v19)
  {
    uint64_t v20 = v19;
    NSLog(&cfstr_CouldNotSetThe.isa, a2, Mutable, @"com.apple.mobile.data_sync", v19);
    if (a4) {
      *a4 = CFStringCreateWithFormat(0, 0, @"Could not set the lockdown key %@ with %@ for %@: %d", a2, Mutable, @"com.apple.mobile.data_sync", v20);
    }
    uint64_t v18 = 0xFFFFFFFFLL;
LABEL_22:
    if (!v8) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  uint64_t v18 = 0;
  if (v8) {
LABEL_23:
  }
    lockdown_disconnect();
LABEL_24:
  if (v16) {
    CFRelease(v16);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v18;
}

uint64_t CopyExternalSourcesEnabledForDataType(const void *a1, void *a2, void *a3)
{
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)_copyLockdownDataSourceDictForDataType(a1);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    if (a2)
    {
      CFArrayRef Value = CFDictionaryGetValue(v4, @"Sources");
      *a2 = Value;
      if (Value) {
        CFRetain(Value);
      }
    }
    CFRelease(v5);
  }
  return 0;
}

const void *_copyLockdownDataSourceDictForDataType(const void *a1)
{
  if (!lockdown_connect()) {
    return 0;
  }
  uint64_t v2 = lockdown_copy_value();
  if (!v2)
  {
LABEL_9:
    lockdown_disconnect();
    return 0;
  }
  uint64_t v3 = (const void *)v2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3) || CFDictionaryGetCount((CFDictionaryRef)v3) <= 0)
  {
    CFRelease(v3);
    goto LABEL_9;
  }
  lockdown_disconnect();
  CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)v3, a1);
  CFIndex v6 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v3);
  return v6;
}

uint64_t CopyAccountNamesEnabledForDataType(const void *a1, void *a2)
{
  CFDictionaryRef v3 = (const __CFDictionary *)_copyLockdownDataSourceDictForDataType(a1);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    if (a2)
    {
      CFArrayRef Value = CFDictionaryGetValue(v3, @"AccountNames");
      *a2 = Value;
      if (Value) {
        CFRetain(Value);
      }
    }
    CFRelease(v4);
  }
  return 0;
}

void sub_21840A008(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _ACDSetForKeyInBundle(void *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 objectForInfoDictionaryKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    id v8 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v9 = objc_msgSend(v8, "initWithArray:", v3, v11);
  }
  else
  {
LABEL_12:
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_21840A210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21840A298(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21840A320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21840A730()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_218420CB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x263F8EE88];
  uint64_t v11 = MEMORY[0x263F8EE88];
  uint64_t v7 = MEMORY[0x21D46AA60](v1);
  if (v7 == sub_218420C08())
  {
    swift_unknownObjectRetain();
    uint64_t v8 = sub_218420CC8();
    MEMORY[0x270FA5388](v8);
    *(&v10 - 2) = (uint64_t)v5;
    *(&v10 - 1) = (uint64_t)&v11;
    sub_218420CA8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v11;
  }
  return v6;
}

uint64_t sub_21840A880(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x21D46AA60](a2);
  uint64_t result = sub_218420C28();
  if (v2 == result)
  {
    uint64_t result = sub_218420CD8();
    if (v4)
    {
      sub_21840FE58(&v5, result, v4);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t XPCEventSubscriberFlags.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t XPCEventSubscriberFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static XPCEventSubscriberFlags.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static XPCEventSubscriberFlags.entitled.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void *sub_21840A938@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_21840A944(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_21840A94C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_21840A960@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_21840A974@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_21840A988(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_21840A9B8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_21840A9E4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_21840AA08(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_21840AA1C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_21840AA30(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_21840AA44@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_21840AA58(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_21840AA6C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_21840AA80(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_21840AA94()
{
  return *v0 == 0;
}

uint64_t sub_21840AAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_21840AABC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_21840AAD0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_21840AAE0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_21840AAEC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21840AB04@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

id XPCEventSubscriber.init(handle:descriptor:flags:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED538);
  MEMORY[0x270FA5388](v8 - 8);
  id v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_218420C58();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a3;
  swift_unknownObjectRetain();
  sub_218420C78();
  uint64_t v53 = v13;
  uint64_t v15 = sub_218420C48();
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v45 = v14;
    uint64_t v46 = v11;
    uint64_t v47 = v10;
    uint64_t v48 = a2;
    uint64_t v49 = a1;
    v50 = a4;
    CFIndex v17 = self;
    uint64_t v18 = 0;
    uint64_t v44 = v15;
    uint64_t v19 = v15 + 32;
    uint64_t v54 = MEMORY[0x263F8EE80];
    uint64_t v52 = v15 + 32;
    while (1)
    {
      uint64_t v20 = (uint64_t *)(v19 + 16 * v18);
      uint64_t v22 = *v20;
      uint64_t v21 = v20[1];
      swift_bridgeObjectRetain();
      id result = objc_msgSend(v17, sel_allIdentifiers, v44);
      if (!result) {
        break;
      }
      id v24 = result;
      uint64_t v25 = sub_218420E68();

      if (*(void *)(v25 + 16)
        && (sub_218421058(),
            sub_218420D98(),
            uint64_t v26 = sub_218421068(),
            uint64_t v27 = -1 << *(unsigned char *)(v25 + 32),
            unint64_t v28 = v26 & ~v27,
            ((*(void *)(v25 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) != 0))
      {
        id v29 = v17;
        uint64_t v30 = *(void *)(v25 + 48);
        long long v31 = (void *)(v30 + 16 * v28);
        BOOL v32 = *v31 == v22 && v31[1] == v21;
        if (v32 || (sub_218421008() & 1) != 0)
        {
LABEL_13:
          swift_bridgeObjectRelease();
          uint64_t v33 = (uint64_t)v51;
          sub_218420C68();
          sub_21840AFD8(v33, (uint64_t)v56);
          char v34 = v56[0];
          uint64_t v36 = v57;
          uint64_t v35 = v58;
          uint64_t v37 = v59;
          uint64_t v38 = v54;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v55 = v38;
          sub_21841261C(v34, v36, v35, v37, v22, v21, isUniquelyReferenced_nonNull_native);
          uint64_t v54 = v55;
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v40 = ~v27;
          while (1)
          {
            unint64_t v28 = (v28 + 1) & v40;
            if (((*(void *)(v25 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v28) & 1) == 0) {
              break;
            }
            uint64_t v41 = (void *)(v30 + 16 * v28);
            BOOL v42 = *v41 == v22 && v41[1] == v21;
            if (v42 || (sub_218421008() & 1) != 0) {
              goto LABEL_13;
            }
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        CFIndex v17 = v29;
        uint64_t v19 = v52;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      if (++v18 == v16)
      {
        swift_bridgeObjectRelease();
        a1 = v49;
        a4 = v50;
        uint64_t v10 = v47;
        uint64_t v14 = v45;
        uint64_t v11 = v46;
        uint64_t v43 = v54;
        goto LABEL_26;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = MEMORY[0x263F8EE80];
LABEL_26:
    swift_unknownObjectRelease();
    id result = (id)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v53, v10);
    *a4 = a1;
    a4[1] = v14;
    a4[2] = v43;
  }
  return result;
}

BOOL sub_21840AF08(unsigned int a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = MEMORY[0x21D469A10](*(void *)(a2 + 40), a1, 4);
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(_DWORD *)(v8 + 4 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_21840AFD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_218420CB8();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED538);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v42 = (uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v38 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v38 - v15;
  sub_218416318(a1, (uint64_t)&v38 - v15, (uint64_t *)&unk_26ABED538);
  uint64_t v17 = sub_218420C58();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v16, 1, v17) == 1)
  {
    sub_2184154CC((uint64_t)v16, (uint64_t *)&unk_26ABED538);
    char v20 = 0;
  }
  else
  {
    uint64_t v21 = a1;
    char v22 = sub_218420C88();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v17);
    char v20 = v22 & 1;
    a1 = v21;
  }
  char v44 = v20;
  uint64_t v43 = MEMORY[0x263F8EE88];
  sub_218416318(a1, (uint64_t)v14, (uint64_t *)&unk_26ABED538);
  if (v19(v14, 1, v17) == 1)
  {
    sub_2184154CC((uint64_t)v14, (uint64_t *)&unk_26ABED538);
  }
  else
  {
    uint64_t v23 = a1;
    uint64_t v24 = sub_218420C98();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v17);
    if (v24)
    {
      uint64_t v25 = MEMORY[0x21D46AA60](v24);
      if (v25 == sub_218420C08())
      {
        swift_unknownObjectRetain();
        uint64_t v26 = sub_218420CC8();
        uint64_t v38 = (uint64_t)&v38;
        MEMORY[0x270FA5388](v26);
        *(&v38 - 2) = (uint64_t)v5;
        *(&v38 - 1) = (uint64_t)&v43;
        sub_218420CA8();
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v5, v40);
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    a1 = v23;
  }
  uint64_t v27 = v43;
  sub_218416318(a1, (uint64_t)v11, (uint64_t *)&unk_26ABED538);
  unsigned int v28 = v19(v11, 1, v17);
  swift_bridgeObjectRetain();
  if (v28 == 1)
  {
    sub_2184154CC((uint64_t)v11, (uint64_t *)&unk_26ABED538);
  }
  else
  {
    uint64_t v29 = sub_218420C98();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v17);
    if (v29)
    {
      uint64_t v30 = sub_21840A730();
      swift_unknownObjectRelease();
      goto LABEL_17;
    }
  }
  uint64_t v30 = MEMORY[0x263F8EE88];
LABEL_17:
  uint64_t v31 = sub_21840BCE0(v30);
  swift_bridgeObjectRelease();
  uint64_t v32 = sub_218414C14(v31);
  swift_bridgeObjectRelease();
  uint64_t v33 = v42;
  sub_218416318(a1, v42, (uint64_t *)&unk_26ABED538);
  if (v19((char *)v33, 1, v17) == 1)
  {
    sub_2184154CC(v33, (uint64_t *)&unk_26ABED538);
LABEL_21:
    uint64_t v35 = MEMORY[0x263F8EE88];
    goto LABEL_22;
  }
  uint64_t v34 = sub_218420C98();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v33, v17);
  if (!v34) {
    goto LABEL_21;
  }
  uint64_t v35 = sub_21840A730();
  swift_unknownObjectRelease();
LABEL_22:
  uint64_t v36 = v41;
  sub_2184154CC(a1, (uint64_t *)&unk_26ABED538);
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)uint64_t v36 = v44;
  *(void *)(v36 + 8) = v27;
  *(void *)(v36 + 16) = v35;
  *(void *)(v36 + 24) = v32;
  return result;
}

void XPCEventSubscriber.caresAbout(account:changeType:)(void *a1, unsigned int a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  id v6 = objc_msgSend(a1, sel_accountType);
  if (!v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, sel_identifier);

  if (!v8)
  {
LABEL_8:
    __break(1u);
    return;
  }
  uint64_t v9 = sub_218420D68();
  uint64_t v11 = v10;

  if (*(void *)(v5 + 16) && (sub_218411D98(v9, v11), (v12 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_21840B66C(a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21840B66C(void *a1, unsigned int a2)
{
  if (*(unsigned char *)v2) {
    return 1;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  if (sub_21840AF08(a2, *(void *)(v2 + 8))) {
    return 1;
  }
  id v6 = objc_msgSend(a1, sel_dirtyProperties);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_218420E68();

    uint64_t v9 = *(void *)(sub_218412ED0(v4, v8, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_2184136F4)+ 16);
    swift_release();
    if (v9) {
      return 1;
    }
  }
  id v10 = objc_msgSend(a1, sel_dirtyAccountProperties);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_218420E68();

    uint64_t v13 = *(void *)(sub_218412ED0(v4, v12, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_2184136F4)+ 16);
    swift_release();
    if (v13) {
      return 1;
    }
  }
  id v14 = objc_msgSend(a1, sel_dirtyDataclassProperties);
  if (v14)
  {
    uint64_t v15 = v14;
    type metadata accessor for Dataclass(0);
    sub_218415BC8((unint64_t *)&unk_26ABED5D0, type metadata accessor for Dataclass);
    uint64_t v16 = sub_218420E68();

    uint64_t v17 = *(void *)(sub_218412ED0(v5, v16, (uint64_t (*)(char *, unint64_t, uint64_t, uint64_t))sub_21841306C)+ 16);
    swift_release();
    if (v17) {
      return 1;
    }
  }
  uint64_t v49 = v5 + 56;
  uint64_t v18 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & *(void *)(v5 + 56);
  int64_t v50 = (unint64_t)(v18 + 63) >> 6;
  uint64_t v21 = (void *)*MEMORY[0x263EFB018];
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v23 = 0;
  uint64_t v51 = v5;
  if (v20) {
    goto LABEL_15;
  }
LABEL_17:
  int64_t v29 = v23 + 1;
  if (!__OFADD__(v23, 1))
  {
    if (v29 < v50)
    {
      unint64_t v30 = *(void *)(v49 + 8 * v29);
      ++v23;
      if (v30) {
        goto LABEL_30;
      }
      int64_t v23 = v29 + 1;
      if (v29 + 1 >= v50) {
        goto LABEL_45;
      }
      unint64_t v30 = *(void *)(v49 + 8 * v23);
      if (v30) {
        goto LABEL_30;
      }
      int64_t v23 = v29 + 2;
      if (v29 + 2 >= v50) {
        goto LABEL_45;
      }
      unint64_t v30 = *(void *)(v49 + 8 * v23);
      if (v30)
      {
LABEL_30:
        unint64_t v20 = (v30 - 1) & v30;
        for (unint64_t i = __clz(__rbit64(v30)) + (v23 << 6); ; unint64_t i = v26 | (v23 << 6))
        {
          id v32 = *(id *)(*(void *)(v5 + 48) + 8 * i);
          id v33 = objc_msgSend(a1, sel_changeTypeForEnabledDataclass_, v32);
          if (!v33) {
            goto LABEL_43;
          }
          uint64_t v34 = v33;
          uint64_t v35 = sub_218420D68();
          uint64_t v37 = v36;
          if (v35 == sub_218420D68() && v37 == v38)
          {
            id v42 = v21;

            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v40 = sub_218421008();
            id v41 = v21;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v40 & 1) == 0) {
              goto LABEL_43;
            }
          }
          id v43 = objc_msgSend(a1, sel_changeTypeForProvisionedDataclass_, v32);
          if (!v43)
          {
LABEL_43:
            swift_release();

            return 1;
          }
          char v44 = v43;
          uint64_t v45 = sub_218420D68();
          uint64_t v47 = v46;
          if (v45 == sub_218420D68() && v47 == v48)
          {
            id v28 = v21;

            uint64_t result = swift_bridgeObjectRelease_n();
            uint64_t v5 = v51;
            if (!v20) {
              goto LABEL_17;
            }
          }
          else
          {
            char v24 = sub_218421008();
            id v25 = v21;

            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            uint64_t v5 = v51;
            if ((v24 & 1) == 0)
            {
              swift_release();
              return 1;
            }
            if (!v20) {
              goto LABEL_17;
            }
          }
LABEL_15:
          unint64_t v26 = __clz(__rbit64(v20));
          v20 &= v20 - 1;
        }
      }
      int64_t v31 = v29 + 3;
      if (v31 < v50)
      {
        unint64_t v30 = *(void *)(v49 + 8 * v31);
        if (v30)
        {
          int64_t v23 = v31;
          goto LABEL_30;
        }
        while (1)
        {
          int64_t v23 = v31 + 1;
          if (__OFADD__(v31, 1)) {
            goto LABEL_48;
          }
          if (v23 >= v50) {
            break;
          }
          unint64_t v30 = *(void *)(v49 + 8 * v23);
          ++v31;
          if (v30) {
            goto LABEL_30;
          }
        }
      }
    }
LABEL_45:
    swift_release();
    return 0;
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t XPCEventSubscriber.description.getter()
{
  return 0x203A656C646E6168;
}

uint64_t static XPCEventSubscriberAccountType.keys.allChanges.getter()
{
  return 0x676E6168436C6C41;
}

uint64_t static XPCEventSubscriberAccountType.keys.changeTypes.getter()
{
  return 0x795465676E616843;
}

unint64_t static XPCEventSubscriberAccountType.keys.accountProperties.getter()
{
  return 0xD000000000000011;
}

uint64_t static XPCEventSubscriberAccountType.keys.dataclasses.getter()
{
  return 0x73616C6361746144;
}

uint64_t sub_21840BCE0(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  for (v4 &= v4 - 1; ; uint64_t v4 = (v10 - 1) & v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_218420D38();
    swift_bridgeObjectRelease();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_21840F624(0, v8[2] + 1, 1, v8, (uint64_t *)&unk_267BC9CC0, (void (*)(void, int64_t, void *, void *))sub_218414B0C);
      uint64_t v8 = (void *)result;
    }
    unint64_t v14 = v8[2];
    unint64_t v13 = v8[3];
    if (v14 >= v13 >> 1)
    {
      uint64_t result = (uint64_t)sub_21840F624((void *)(v13 > 1), v14 + 1, 1, v8, (uint64_t *)&unk_267BC9CC0, (void (*)(void, int64_t, void *, void *))sub_218414B0C);
      uint64_t v8 = (void *)result;
    }
    v8[2] = v14 + 1;
    v8[v14 + 4] = v12;
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v9 >= v5) {
      goto LABEL_27;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      int64_t v7 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_27;
      }
      uint64_t v10 = *(void *)(v1 + 8 * v7);
      if (!v10)
      {
        int64_t v7 = v9 + 2;
        if (v9 + 2 >= v5) {
          goto LABEL_27;
        }
        uint64_t v10 = *(void *)(v1 + 8 * v7);
        if (!v10)
        {
          int64_t v7 = v9 + 3;
          if (v9 + 3 >= v5) {
            goto LABEL_27;
          }
          uint64_t v10 = *(void *)(v1 + 8 * v7);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_20:
    ;
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_27:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v10 = *(void *)(v1 + 8 * v11);
  if (v10)
  {
    int64_t v7 = v11;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_27;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v7);
    ++v11;
    if (v10) {
      goto LABEL_20;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t XPCEventSubscriberAccountType.description.getter()
{
  return 0;
}

uint64_t XPCEventSubscriberFlags.description.getter()
{
  if ((*v0 & 2) != 0)
  {
    uint64_t v1 = sub_21840F514(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v3 = v1[2];
    unint64_t v2 = v1[3];
    if (v3 >= v2 >> 1) {
      uint64_t v1 = sub_21840F514((void *)(v2 > 1), v3 + 1, 1, v1);
    }
    v1[2] = v3 + 1;
    uint64_t v4 = &v1[2 * v3];
    v4[4] = 0x64656C7469746E65;
    v4[5] = 0xE800000000000000;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED598);
  sub_2184164AC(&qword_26ABED5A0, &qword_26ABED598);
  uint64_t v5 = sub_218420D28();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21840C240()
{
  uint64_t v1 = sub_218420BF8();
  v0[17] = v1;
  v0[18] = *(void *)(v1 - 8);
  v0[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21840C2FC);
}

uint64_t sub_21840C2FC()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = sub_218416804();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_218420BD8();
  os_log_type_t v6 = sub_218420E98();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl(&dword_2183AD000, v5, v6, "ACDXPCEventPublisher: registering in task", v7, 2u);
    MEMORY[0x21D46A830](v7, -1, -1);
  }
  uint64_t v9 = v0[18];
  uint64_t v8 = v0[19];
  uint64_t v10 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  if (qword_26ABED6C0 != -1) {
    swift_once();
  }
  v0[20] = qword_26ABED798;
  return MEMORY[0x270FA2498](sub_21840C474);
}

uint64_t sub_21840C474()
{
  uint64_t v1 = v0[20];
  if ((*(unsigned char *)(v1 + 128) & 1) == 0)
  {
    *(unsigned char *)(v1 + 128) = 1;
    v0[6] = sub_21840CF48;
    v0[7] = 0;
    v0[2] = MEMORY[0x263EF8330];
    v0[3] = 1107296256;
    v0[4] = sub_21840D0E4;
    v0[5] = &block_descriptor_47;
    uint64_t v2 = _Block_copy(v0 + 2);
    xpc_event_publisher_set_error_handler();
    _Block_release(v2);
    v0[12] = sub_2184165B4;
    v0[13] = v1;
    v0[8] = MEMORY[0x263EF8330];
    v0[9] = 1107296256;
    v0[10] = sub_21840D480;
    v0[11] = &block_descriptor_50;
    uint64_t v3 = _Block_copy(v0 + 8);
    swift_retain();
    swift_release();
    xpc_event_publisher_set_handler();
    _Block_release(v3);
    xpc_event_publisher_activate();
  }
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_21840C5FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED548);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_218416318(a1, (uint64_t)v7, (uint64_t *)&unk_26ABED548);
  uint64_t v8 = sub_218420E58();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2184154CC((uint64_t)v7, (uint64_t *)&unk_26ABED548);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_218420E38();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_218420E48();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t static ACDXPCEventPublisherWrapper.notifySubscribersOfAccountChange(_:type:)(void *a1, int a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED548);
  uint64_t result = MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v7 = sub_218420E58();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0;
    *(void *)(v8 + 24) = 0;
    *(void *)(v8 + 32) = a1;
    *(_DWORD *)(v8 + 40) = a2;
    id v9 = a1;
    sub_21840C5FC((uint64_t)v6, (uint64_t)&unk_267BC9BA8, v8);

    swift_release();
    return sub_2184154CC((uint64_t)v6, (uint64_t *)&unk_26ABED548);
  }
  return result;
}

uint64_t sub_21840C920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(v5 + 32) = a5;
  *(void *)(v5 + 16) = a4;
  return MEMORY[0x270FA2498](sub_21840C944);
}

uint64_t sub_21840C944()
{
  if (qword_26ABED6C0 != -1) {
    swift_once();
  }
  *(void *)(v0 + 24) = qword_26ABED798;
  return MEMORY[0x270FA2498](sub_21840C9DC);
}

uint64_t sub_21840C9DC()
{
  sub_21840E4C8(*(void **)(v0 + 16), *(_DWORD *)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id ACDXPCEventPublisherWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ACDXPCEventPublisherWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ACDXPCEventPublisherWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ACDXPCEventPublisherWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ACDXPCEventPublisherWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21840CC54()
{
  type metadata accessor for ACDXPCEventPublisher();
  uint64_t v0 = swift_allocObject();
  id result = sub_21840CC94();
  qword_26ABED798 = v0;
  return result;
}

id sub_21840CC94()
{
  v8[0] = sub_218420ED8();
  uint64_t v1 = *(void *)(v8[0] - 8);
  MEMORY[0x270FA5388](v8[0]);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_218420EC8();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_218420D08();
  MEMORY[0x270FA5388](v5 - 8);
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 128) = 0;
  *(unsigned char *)(v0
           + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_initialBarrierRecieved) = 0;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)(v0
            + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers) = MEMORY[0x263F8EE78];
  *(void *)(v0
            + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers) = MEMORY[0x263F8EE80];
  sub_21841646C();
  sub_218420CF8();
  v8[1] = v6;
  sub_218415BC8(&qword_26ABED5C0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED5A8);
  sub_2184164AC((unint64_t *)&unk_26ABED5B0, &qword_26ABED5A8);
  sub_218420F28();
  (*(void (**)(char *, void, void))(v1 + 104))(v3, *MEMORY[0x263F8F130], v8[0]);
  *(void *)(v0 + 120) = sub_218420EE8();
  id result = (id)xpc_event_publisher_create();
  if (result)
  {
    *(void *)(v0 + 112) = result;
    return (id)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21840CF48(int a1)
{
  uint64_t v2 = sub_218420BF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_218416804();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_218420BD8();
  os_log_type_t v8 = sub_218420EA8();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v9 = 67109120;
    v11[1] = a1;
    sub_218420EF8();
    _os_log_impl(&dword_2183AD000, v7, v8, "ACDXPCEventPublisher: error %d", v9, 8u);
    MEMORY[0x21D46A830](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21840D0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_21840D138(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED548);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_218420BF8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_218416804();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v16 = sub_218420BD8();
  os_log_type_t v17 = sub_218420E98();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = a3;
    uint64_t v28 = a2;
    uint64_t v19 = a4;
    int v20 = a1;
    uint64_t v21 = v18;
    *(_DWORD *)uint64_t v18 = 134217984;
    sub_218420EF8();
    _os_log_impl(&dword_2183AD000, v16, v17, "ACDXPCEventPublisher: Pending subscriber %llu", v21, 0xCu);
    char v22 = v21;
    a1 = v20;
    a4 = v19;
    a3 = v27;
    MEMORY[0x21D46A830](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v23 = sub_218420E58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = 0;
  *(void *)(v24 + 24) = 0;
  *(void *)(v24 + 32) = a4;
  *(_DWORD *)(v24 + 40) = a1;
  *(void *)(v24 + 48) = a2;
  *(void *)(v24 + 56) = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_21840C5FC((uint64_t)v10, (uint64_t)&unk_267BC9CA0, v24);
  swift_release();
  return sub_2184154CC((uint64_t)v10, (uint64_t *)&unk_26ABED548);
}

uint64_t sub_21840D3F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 24) = a6;
  *(void *)(v7 + 32) = a7;
  *(_DWORD *)(v7 + 40) = a5;
  *(void *)(v7 + 16) = a4;
  return MEMORY[0x270FA2498](sub_21840D418);
}

uint64_t sub_21840D418()
{
  sub_21840D500(*(_DWORD *)(v0 + 40), *(void *)(v0 + 24), *(uint64_t ***)(v0 + 32));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21840D480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v7(a2, a3, a4);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_21840D500(int a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_218420BF8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 2)
  {
    *(unsigned char *)(v4
             + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_initialBarrierRecieved) = 1;
    return result;
  }
  if (a1 != 1)
  {
    if (a1) {
      return result;
    }
    uint64_t v13 = (uint64_t *)(v4
                    + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers);
    swift_beginAccess();
    uint64_t v14 = *v13;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t *v13 = v14;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
  uint64_t v21 = sub_218416804();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v21, v8);
  char v22 = sub_218420BD8();
  os_log_type_t v23 = sub_218420EB8();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134217984;
    uint64_t v43 = a2;
    sub_218420EF8();
    _os_log_impl(&dword_2183AD000, v22, v23, "ACDXPCEventPublisher: Removing subscriber %llu", v24, 0xCu);
    MEMORY[0x21D46A830](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  a3 = (uint64_t **)(v4
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers);
  uint64_t result = swift_beginAccess();
  uint64_t v13 = *a3;
  unint64_t v25 = (*a3)[2];
  if (!v25) {
    goto LABEL_18;
  }
  if (v13[4] == a2)
  {
    uint64_t v14 = 0;
  }
  else
  {
    if (v25 == 1)
    {
      uint64_t v14 = 1;
      goto LABEL_38;
    }
    uint64_t v33 = 5;
    while (1)
    {
      uint64_t v14 = v33 - 4;
      if (v13[v33] == a2) {
        break;
      }
      uint64_t v34 = v33 - 3;
      if (__OFADD__(v14, 1)) {
        goto LABEL_47;
      }
      ++v33;
      if (v34 == v25)
      {
        uint64_t v14 = (*a3)[2];
        goto LABEL_38;
      }
    }
  }
  uint64_t v26 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
    return result;
  }
  if (v26 != v25)
  {
    uint64_t v27 = v14 + 5;
    while ((v26 & 0x8000000000000000) == 0)
    {
      if (v27 - 4 >= v25) {
        goto LABEL_45;
      }
      uint64_t v30 = v13[v27];
      if (v30 != a2)
      {
        if (v27 - 4 != v14)
        {
          if (v14 >= v25) {
            goto LABEL_48;
          }
          uint64_t v31 = v13[v14 + 4];
          char v32 = swift_isUniquelyReferenced_nonNull_native();
          *a3 = v13;
          if ((v32 & 1) == 0)
          {
            uint64_t v13 = sub_218414AC8(v13);
            *a3 = v13;
          }
          v13[v14 + 4] = v30;
          (*a3)[v27] = v31;
          uint64_t v13 = *a3;
        }
        if (__OFADD__(v14++, 1)) {
          goto LABEL_46;
        }
        unint64_t v25 = v13[2];
      }
      uint64_t v29 = v27 - 3;
      ++v27;
      if (v29 == v25) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    uint64_t v14 = (uint64_t)sub_21840F624(0, *(void *)(v14 + 16) + 1, 1, (void *)v14, &qword_26ABED620, (void (*)(void, int64_t, void *, void *))sub_218415E00);
    uint64_t *v13 = v14;
LABEL_5:
    unint64_t v17 = *(void *)(v14 + 16);
    unint64_t v16 = *(void *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = (uint64_t)sub_21840F624((void *)(v16 > 1), v17 + 1, 1, (void *)v14, &qword_26ABED620, (void (*)(void, int64_t, void *, void *))sub_218415E00);
      uint64_t *v13 = v14;
    }
    *(void *)(v14 + 16) = v17 + 1;
    *(void *)(v14 + 8 * v17 + 32) = a2;
    swift_endAccess();
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "MessageType", "ping");
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v4;
    v19[3] = a3;
    v19[4] = a2;
    aBlock[4] = sub_2184160A4;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21840DC6C;
    aBlock[3] = &block_descriptor;
    int v20 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    xpc_event_publisher_fire_with_reply();
    _Block_release(v20);
    return swift_unknownObjectRelease_n();
  }
LABEL_16:
  if ((uint64_t)v25 < v14)
  {
    __break(1u);
LABEL_18:
    uint64_t v14 = 0;
  }
LABEL_38:
  sub_218415EEC(v14, v25);
  swift_endAccess();
  uint64_t v35 = (uint64_t *)(v4
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers);
  swift_beginAccess();
  unint64_t v36 = sub_218411E10(a2);
  if (v37)
  {
    unint64_t v38 = v36;
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v40 = *v35;
    uint64_t v42 = *v35;
    *uint64_t v35 = 0x8000000000000000;
    if ((v39 & 1) == 0)
    {
      sub_218412D14();
      uint64_t v40 = v42;
    }
    sub_218412470(v38, v40);
    *uint64_t v35 = v40;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21840DAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED548);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_218420E58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a2;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_21840C5FC((uint64_t)v10, (uint64_t)&unk_267BC9C68, (uint64_t)v12);
  swift_release();
  return sub_2184154CC((uint64_t)v10, (uint64_t *)&unk_26ABED548);
}

uint64_t sub_21840DBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return MEMORY[0x270FA2498](sub_21840DC08);
}

uint64_t sub_21840DC08()
{
  sub_21840DCCC(v0[3], v0[4], v0[5]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_21840DC6C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_21840DCCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_218420BF8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t *)((char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v60 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v60 - v15;
  unint64_t v17 = (uint64_t *)(v3
                  + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher_pendingSubscribers);
  swift_beginAccess();
  if ((sub_21840E464(a2, *v17) & 1) == 0)
  {
LABEL_8:
    uint64_t v22 = sub_218416804();
    swift_beginAccess();
    (*(void (**)(void *, uint64_t, uint64_t))(v8 + 16))(v11, v22, v7);
    os_log_type_t v23 = sub_218420BD8();
    os_log_type_t v24 = sub_218420EB8();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = v7;
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 134217984;
      v69[0] = a2;
      sub_218420EF8();
      _os_log_impl(&dword_2183AD000, v23, v24, "ACDXPCEventPublisher: Unexpected reply from previously pending subscriber %llu", v26, 0xCu);
      uint64_t v27 = v26;
      uint64_t v7 = v25;
      MEMORY[0x21D46A830](v27, -1, -1);
    }

    return (*(uint64_t (**)(void *, uint64_t))(v8 + 8))(v11, v7);
  }
  swift_beginAccess();
  uint64_t v11 = (void *)*v17;
  unint64_t v18 = *(void *)(*v17 + 16);
  uint64_t v63 = v3;
  uint64_t v65 = a3;
  uint64_t v66 = v8;
  if (!v18)
  {
    uint64_t v19 = 0;
    goto LABEL_31;
  }
  if (v11[4] == a2)
  {
    uint64_t v62 = v7;
    uint64_t v19 = 0;
    uint64_t v20 = 1;
    goto LABEL_5;
  }
  if (v18 == 1)
  {
    uint64_t v19 = 1;
    goto LABEL_31;
  }
  uint64_t v34 = 5;
  do
  {
    uint64_t v19 = v34 - 4;
    if (v11[v34] == a2)
    {
      uint64_t v62 = v7;
      uint64_t v20 = v34 - 3;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
        goto LABEL_48;
      }
LABEL_5:
      uint64_t v21 = v16;
      uint64_t v64 = a1;
      if (v20 == v18)
      {
LABEL_6:
        uint64_t v7 = v62;
        a1 = v64;
        unint64_t v16 = v21;
        if ((uint64_t)v18 >= v19) {
          goto LABEL_31;
        }
        __break(1u);
        goto LABEL_8;
      }
      uint64_t v29 = v19 + 5;
      while ((v20 & 0x8000000000000000) == 0)
      {
        if (v29 - 4 >= v18) {
          goto LABEL_49;
        }
        uint64_t v32 = v11[v29];
        if (v32 != a2)
        {
          if (v29 - 4 != v19)
          {
            if (v19 >= v18) {
              goto LABEL_52;
            }
            uint64_t v8 = v11[v19 + 4];
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *unint64_t v17 = (uint64_t)v11;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v11 = sub_218414AC8(v11);
              *unint64_t v17 = (uint64_t)v11;
            }
            v11[v19 + 4] = v32;
            *(void *)(*v17 + 8 * v29) = v8;
            uint64_t v11 = (void *)*v17;
          }
          if (__OFADD__(v19++, 1)) {
            goto LABEL_50;
          }
          unint64_t v18 = v11[2];
        }
        uint64_t v31 = v29 - 3;
        ++v29;
        if (v31 == v18) {
          goto LABEL_6;
        }
      }
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
    }
    uint64_t v35 = v34 - 3;
    if (__OFADD__(v19, 1)) {
      goto LABEL_51;
    }
    ++v34;
  }
  while (v35 != v18);
  uint64_t v19 = v18;
LABEL_31:
  sub_218415EEC(v19, v18);
  swift_endAccess();
  uint64_t v36 = MEMORY[0x21D46AA60](v65);
  if (v36 == sub_218420C38())
  {
    long long v70 = 0u;
    long long v71 = 0u;
    xpc_dictionary_get_audit_token();
    sub_218420D68();
    sub_218420D78();
    swift_bridgeObjectRelease();
    uint64_t v42 = (void *)xpc_copy_entitlement_for_token();
    uint64_t result = swift_release();
    uint64_t v43 = v66;
    if (v42 && (value = xpc_BOOL_get_value(v42), uint64_t result = swift_unknownObjectRelease(), value))
    {
      uint64_t v45 = 2;
      if (!a1) {
        return result;
      }
    }
    else
    {
      uint64_t v45 = 0;
      if (!a1) {
        return result;
      }
    }
    v68[0] = v45;
    swift_unknownObjectRetain_n();
    uint64_t v64 = a1;
    XPCEventSubscriber.init(handle:descriptor:flags:)(a2, a1, v68, v69);
    uint64_t v46 = v69[0];
    uint64_t v65 = v69[1];
    uint64_t v47 = v69[2];
    uint64_t v48 = sub_218416804();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v16, v48, v7);
    uint64_t v49 = v47;
    swift_bridgeObjectRetain_n();
    int64_t v50 = sub_218420BD8();
    os_log_type_t v51 = sub_218420EB8();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = swift_slowAlloc();
      uint64_t v62 = v46;
      uint64_t v53 = v52;
      uint64_t v61 = swift_slowAlloc();
      uint64_t v67 = v61;
      v68[0] = a2;
      *(_DWORD *)uint64_t v53 = 134218242;
      sub_218420EF8();
      *(_WORD *)(v53 + 12) = 2080;
      v68[0] = v62;
      v68[1] = v65;
      v68[2] = v47;
      uint64_t v54 = XPCEventSubscriber.description.getter();
      v68[0] = sub_21840F784(v54, v55, &v67);
      sub_218420EF8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2183AD000, v50, v51, "ACDXPCEventPublisher: Added new subscriber %llu\n%s", (uint8_t *)v53, 0x16u);
      uint64_t v56 = v61;
      swift_arrayDestroy();
      MEMORY[0x21D46A830](v56, -1, -1);
      uint64_t v57 = v53;
      uint64_t v46 = v62;
      MEMORY[0x21D46A830](v57, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v43 + 8))(v16, v7);
    uint64_t v58 = (uint64_t *)(v63
                    + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers);
    swift_beginAccess();
    char v59 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v67 = *v58;
    uint64_t *v58 = 0x8000000000000000;
    sub_2184127B0(v46, v65, v49, a2, v59);
    uint64_t *v58 = v67;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v37 = sub_218416804();
    swift_beginAccess();
    uint64_t v38 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v14, v37, v7);
    char v39 = sub_218420BD8();
    os_log_type_t v40 = sub_218420EB8();
    if (os_log_type_enabled(v39, v40))
    {
      id v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v41 = 0;
      _os_log_impl(&dword_2183AD000, v39, v40, "Invalid object type received from subscriber", v41, 2u);
      MEMORY[0x21D46A830](v41, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v14, v7);
  }
}

uint64_t sub_21840E464(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21840E4C8(void *a1, unsigned int a2)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  uint64_t v5 = sub_218420BF8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v72 - v10;
  uint64_t v74 = v2;
  int64_t v12 = v2 + OBJC_IVAR____TtC14AccountsDaemonP33_FDFD93D7EED093E0E5ECCF78D163DEF220ACDXPCEventPublisher__subscribers;
  swift_beginAccess();
  uint64_t v13 = *(void *)(*(void *)v12 + 16);
  uint64_t v14 = sub_218416804();
  uint64_t v15 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  if (v13)
  {
    int64_t v79 = v12;
    swift_beginAccess();
    (*v15)(v9, v14, v5);
    id v16 = a1;
    unint64_t v17 = sub_218420BD8();
    os_log_type_t v18 = sub_218420E98();
    BOOL v19 = os_log_type_enabled(v17, v18);
    v78 = v16;
    if (v19)
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v76 = v5;
      uint64_t v21 = v20;
      v73 = (void *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      *(void *)&long long bytes = v75;
      *(_DWORD *)uint64_t v21 = 138412546;
      uint64_t v80 = (uint64_t)v78;
      uint64_t v22 = v78;
      sub_218420EF8();
      os_log_type_t v23 = v73;
      void *v73 = v78;

      *(_WORD *)(v21 + 12) = 2080;
      uint64_t v24 = sub_2184168A0(a2);
      uint64_t v80 = sub_21840F784(v24, v25, (uint64_t *)&bytes);
      sub_218420EF8();
      id v16 = v78;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2183AD000, v17, v18, "ACDXPCEventPublisher: Publishing changes for account %@, type: %s", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED5F0);
      swift_arrayDestroy();
      MEMORY[0x21D46A830](v23, -1, -1);
      uint64_t v26 = v75;
      swift_arrayDestroy();
      MEMORY[0x21D46A830](v26, -1, -1);
      MEMORY[0x21D46A830](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v76);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    xpc_object_t v31 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v31, "MessageType", "AccountChange");
    xpc_dictionary_set_uint64(v31, "ChangeType", a2);
    uint64_t v32 = self;
    *(void *)&long long bytes = 0;
    id v33 = objc_msgSend(v32, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v16, 1, &bytes);
    id v34 = (id)bytes;
    unsigned int v77 = a2;
    uint64_t v75 = (uint64_t)v31;
    if (v33)
    {
      uint64_t v35 = sub_218420BC8();
      unint64_t v37 = v36;

      switch(v37 >> 62)
      {
        case 1uLL:
          if (v35 >> 32 < (int)v35) {
            goto LABEL_51;
          }
          swift_unknownObjectRetain();
          sub_218415CA0(v35, v37);
          swift_unknownObjectRetain();
          sub_218415CA0(v35, v37);
          sub_2184149BC((int)v35, v35 >> 32, v37 & 0x3FFFFFFFFFFFFFFFLL, v31, v35, v37);
LABEL_17:
          sub_218415CF8(v35, v37);
          swift_unknownObjectRelease();
          id v16 = v78;
          break;
        case 2uLL:
          uint64_t v42 = *(void *)(v35 + 16);
          uint64_t v43 = *(void *)(v35 + 24);
          swift_unknownObjectRetain();
          sub_218415CA0(v35, v37);
          swift_unknownObjectRetain();
          sub_218415CA0(v35, v37);
          swift_retain();
          swift_retain();
          sub_2184149BC(v42, v43, v37 & 0x3FFFFFFFFFFFFFFFLL, v31, v35, v37);
          swift_release();
          swift_release();
          goto LABEL_17;
        case 3uLL:
          *(void *)((char *)&bytes + 6) = 0;
          *(void *)&long long bytes = 0;
          uint64_t v38 = (void *)swift_unknownObjectRetain_n();
          size_t v39 = 0;
          goto LABEL_14;
        default:
          *(void *)&long long bytes = v35;
          WORD4(bytes) = v37;
          BYTE10(bytes) = BYTE2(v37);
          BYTE11(bytes) = BYTE3(v37);
          BYTE12(bytes) = BYTE4(v37);
          BYTE13(bytes) = BYTE5(v37);
          uint64_t v38 = (void *)swift_unknownObjectRetain_n();
          size_t v39 = BYTE6(v37);
LABEL_14:
          xpc_dictionary_set_data(v38, "AccountData", &bytes, v39);
          sub_218415CF8(v35, v37);
          swift_unknownObjectRelease();
          sub_218415CF8(v35, v37);
          swift_unknownObjectRelease();
          break;
      }
      v73 = 0;
      sub_218415CF8(v35, v37);
    }
    else
    {
      os_log_type_t v40 = v34;
      id v41 = (void *)sub_218420BB8();

      swift_willThrow();
      v73 = 0;
    }
    uint64_t v44 = *(void *)v79;
    uint64_t v45 = *(void *)v79 + 64;
    uint64_t v46 = 1 << *(unsigned char *)(*(void *)v79 + 32);
    uint64_t v47 = -1;
    if (v46 < 64) {
      uint64_t v47 = ~(-1 << v46);
    }
    unint64_t v48 = v47 & *(void *)(*(void *)v79 + 64);
    int64_t v79 = (unint64_t)(v46 + 63) >> 6;
    swift_bridgeObjectRetain();
    int64_t v49 = 0;
    uint64_t v76 = v44;
    while (1)
    {
      if (v48)
      {
        unint64_t v50 = __clz(__rbit64(v48));
        v48 &= v48 - 1;
        unint64_t v51 = v50 | (v49 << 6);
      }
      else
      {
        if (__OFADD__(v49++, 1))
        {
          __break(1u);
          goto LABEL_50;
        }
        if (v49 >= v79) {
          goto LABEL_47;
        }
        unint64_t v53 = *(void *)(v45 + 8 * v49);
        if (!v53)
        {
          int64_t v54 = v49 + 1;
          if (v49 + 1 >= v79) {
            goto LABEL_47;
          }
          unint64_t v53 = *(void *)(v45 + 8 * v54);
          if (!v53)
          {
            int64_t v54 = v49 + 2;
            if (v49 + 2 >= v79) {
              goto LABEL_47;
            }
            unint64_t v53 = *(void *)(v45 + 8 * v54);
            if (!v53)
            {
              int64_t v54 = v49 + 3;
              if (v49 + 3 >= v79)
              {
LABEL_47:
                swift_unknownObjectRelease();
                return swift_release();
              }
              unint64_t v53 = *(void *)(v45 + 8 * v54);
              if (!v53)
              {
                while (1)
                {
                  int64_t v49 = v54 + 1;
                  if (__OFADD__(v54, 1)) {
                    break;
                  }
                  if (v49 >= v79) {
                    goto LABEL_47;
                  }
                  unint64_t v53 = *(void *)(v45 + 8 * v49);
                  ++v54;
                  if (v53) {
                    goto LABEL_35;
                  }
                }
LABEL_50:
                __break(1u);
LABEL_51:
                __break(1u);
LABEL_52:
                __break(1u);
LABEL_53:
                __break(1u);
              }
            }
          }
          int64_t v49 = v54;
        }
LABEL_35:
        unint64_t v48 = (v53 - 1) & v53;
        unint64_t v51 = __clz(__rbit64(v53)) + (v49 << 6);
      }
      uint64_t v55 = *(void *)(v44 + 56) + 24 * v51;
      if ((*(unsigned char *)(v55 + 8) & 2) != 0)
      {
        uint64_t v56 = *(void *)(v55 + 16);
        swift_bridgeObjectRetain();
        id v57 = objc_msgSend(v16, sel_accountType);
        if (!v57) {
          goto LABEL_52;
        }
        uint64_t v58 = v57;
        id v59 = objc_msgSend(v57, sel_identifier);

        if (!v59) {
          goto LABEL_53;
        }
        uint64_t v60 = sub_218420D68();
        uint64_t v62 = v61;

        if (*(void *)(v56 + 16) && (unint64_t v63 = sub_218411D98(v60, v62), (v64 & 1) != 0))
        {
          uint64_t v65 = *(void *)(v56 + 56) + 32 * v63;
          char v66 = *(unsigned char *)v65;
          uint64_t v67 = *(void *)(v65 + 8);
          uint64_t v68 = *(void *)(v65 + 16);
          uint64_t v69 = v45;
          uint64_t v70 = *(void *)(v65 + 24);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          LOBYTE(bytes) = v66;
          *((void *)&bytes + 1) = v67;
          uint64_t v82 = v68;
          uint64_t v83 = v70;
          char v71 = sub_21840B66C(v78, v77);
          swift_bridgeObjectRelease();
          uint64_t v45 = v69;
          uint64_t v44 = v76;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          id v16 = v78;
          swift_bridgeObjectRelease();
          if (v71) {
            xpc_event_publisher_fire();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  swift_beginAccess();
  (*v15)(v11, v14, v5);
  uint64_t v27 = sub_218420BD8();
  os_log_type_t v28 = sub_218420E98();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_2183AD000, v27, v28, "ACDXPCEventPublisher: no subscribers, not publishing change", v29, 2u);
    MEMORY[0x21D46A830](v29, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_21840EE70()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_21840EED0()
{
  return v0;
}

uint64_t sub_21840EEDC(uint64_t a1, uint64_t a2)
{
  return sub_21840EFD4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_21840EEF4()
{
  sub_218420D68();
  sub_218420D98();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21840EF48()
{
  sub_218420D68();
  sub_218421058();
  sub_218420D98();
  uint64_t v0 = sub_218421068();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21840EFBC(uint64_t a1, uint64_t a2)
{
  return sub_21840EFD4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_21840EFD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_218420D68();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21840F018(uint64_t a1, id *a2)
{
  uint64_t result = sub_218420D48();
  *a2 = 0;
  return result;
}

uint64_t sub_21840F090(uint64_t a1, id *a2)
{
  char v3 = sub_218420D58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21840F110@<X0>(uint64_t *a1@<X8>)
{
  sub_218420D68();
  uint64_t v2 = sub_218420D38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_21840F154(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21840F168()
{
  uint64_t v0 = sub_218420D68();
  uint64_t v2 = v1;
  if (v0 == sub_218420D68() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_218421008();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_DWORD *sub_21840F1F4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_21840F204(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21840F210@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_218420D38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21840F258@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_218420D68();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21840F284(uint64_t a1)
{
  uint64_t v2 = sub_218415BC8((unint64_t *)&unk_26ABED5D0, type metadata accessor for Dataclass);
  uint64_t v3 = sub_218415BC8(&qword_267BC9BF8, type metadata accessor for Dataclass);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_21840F340(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_21840F41C;
  return v6(a1);
}

uint64_t sub_21840F41C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_21840F514(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED608);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2184150E0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21840F624(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, void (*a6)(void, int64_t, void *, void *))
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  int64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v10 = a2;
    }
LABEL_8:
    int64_t v11 = a4[2];
    if (v10 <= v11) {
      int64_t v12 = a4[2];
    }
    else {
      int64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v13 = (void *)swift_allocObject();
      int64_t v14 = _swift_stdlib_malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 25;
      }
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      id v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      id v16 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    a6(0, v11, v16, a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21840F784(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21840F858(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_218415DA0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_218415DA0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21840F858(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_218420F08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21840FA14(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_218420F98();
  if (!v8)
  {
    sub_218420FA8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_218420FD8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_21840FA14(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21840FAAC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21840FD08(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21840FD08(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21840FAAC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_21840FC24(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_218420F88();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_218420FA8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_218420DB8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_218420FD8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_218420FA8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21840FC24(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED618);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21840FC8C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_218420E08();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x21D4697B0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_21840FD08(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED618);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_218420FD8();
  __break(1u);
  return result;
}

uint64_t sub_21840FE58(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_218421058();
  swift_bridgeObjectRetain();
  sub_218420D98();
  uint64_t v8 = sub_218421068();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_218421008() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      os_log_type_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_218421008() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_218410BB4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_218410008(void *a1, void *a2)
{
  char v3 = v2;
  uint64_t v6 = *v2;
  sub_218420D68();
  sub_218421058();
  swift_bridgeObjectRetain();
  sub_218420D98();
  uint64_t v7 = sub_218421068();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    void *v3 = 0x8000000000000000;
    id v24 = a2;
    sub_218410D50((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    void *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = sub_218420D68();
  uint64_t v12 = v11;
  if (v10 == sub_218420D68() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_218421008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = sub_218420D68();
        uint64_t v19 = v18;
        if (v17 == sub_218420D68() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = sub_218421008();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

uint64_t sub_218410234(_DWORD *a1, uint64_t a2)
{
  char v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = MEMORY[0x21D469A10](*(void *)(v6 + 40), a2, 4);
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_218410F80(a2, v9, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(_DWORD *)(v10 + 4 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(_DWORD *)(v10 + 4 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_218410338()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB0);
  uint64_t v3 = sub_218420F58();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_218421058();
      sub_218420D98();
      uint64_t result = sub_218421068();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_218410618()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB8);
  uint64_t v3 = sub_218420F58();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    BOOL v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      sub_218420D68();
      sub_218421058();
      sub_218420D98();
      uint64_t v18 = sub_218421068();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_21841092C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED628);
  uint64_t result = sub_218420F58();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    BOOL v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      unsigned int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
      uint64_t result = MEMORY[0x21D469A10](*(void *)(v4 + 40), v18, 4);
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_218410BB4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  int64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_218410338();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_2184110A8();
      goto LABEL_22;
    }
    sub_2184115A0();
  }
  uint64_t v11 = *v4;
  sub_218421058();
  sub_218420D98();
  uint64_t result = sub_218421068();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_218421008(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_218421018();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unsigned int v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_218421008();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_218410D50(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_218410618();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_21841125C();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_218411850();
  }
  uint64_t v9 = *v3;
  sub_218420D68();
  sub_218421058();
  sub_218420D98();
  uint64_t v10 = sub_218421068();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = sub_218420D68();
  uint64_t v14 = v13;
  if (v12 == sub_218420D68() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = sub_218421008();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = sub_218420D68();
      uint64_t v21 = v20;
      if (v19 == sub_218420D68() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = sub_218421008();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for Dataclass(0);
  uint64_t result = sub_218421018();
  __break(1u);
  return result;
}

uint64_t sub_218410F80(uint64_t result, unint64_t a2, char a3)
{
  unsigned int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_21841092C();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_218411408();
      goto LABEL_14;
    }
    sub_218411B30();
  }
  uint64_t v8 = *v3;
  uint64_t result = MEMORY[0x21D469A10](*(void *)(*v3 + 40), v5, 4);
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_218421018();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(_DWORD *)(v10 + 4 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(void *)(v12 + 48) + 4 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_2184110A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218420F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_21841125C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218420F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    char v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_218411408()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED628);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218420F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2184115A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB0);
  uint64_t v3 = sub_218420F58();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_218421058();
    swift_bridgeObjectRetain();
    sub_218420D98();
    uint64_t result = sub_218421068();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_218411850()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB8);
  uint64_t v3 = sub_218420F58();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  BOOL v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    sub_218420D68();
    sub_218421058();
    id v18 = v17;
    sub_218420D98();
    uint64_t v19 = sub_218421068();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_218411B30()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ABED628);
  uint64_t result = sub_218420F58();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    unsigned int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    uint64_t result = MEMORY[0x21D469A10](*(void *)(v4 + 40), v18, 4);
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_218411D98(uint64_t a1, uint64_t a2)
{
  sub_218421058();
  sub_218420D98();
  uint64_t v4 = sub_218421068();

  return sub_2184129A0(a1, a2, v4);
}

unint64_t sub_218411E10(uint64_t a1)
{
  uint64_t v2 = sub_218421048();

  return sub_218412A84(a1, v2);
}

uint64_t sub_218411E54(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED5F8);
  char v40 = a2;
  uint64_t v6 = sub_218420FC8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v37 = v2;
  int64_t v38 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v38) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v39 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v38) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v39 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v38)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v37;
          if ((v40 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v39 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v38) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v39 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(v5 + 56) + 32 * v21;
    char v34 = *(unsigned char *)v33;
    long long v41 = *(_OWORD *)(v33 + 8);
    uint64_t v35 = *(void *)(v33 + 24);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_218421058();
    sub_218420D98();
    uint64_t result = sub_218421068();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unsigned int v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unsigned int v18 = v32;
    v18[1] = v31;
    uint64_t v19 = *(void *)(v7 + 56) + 32 * v17;
    *(unsigned char *)uint64_t v19 = v34;
    *(_OWORD *)(v19 + 8) = v41;
    *(void *)(v19 + 24) = v35;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v37;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v36;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_2184121A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED558);
  uint64_t result = sub_218420FC8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v33 = (uint64_t *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v30 = -1 << v9;
    uint64_t v31 = v9;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if (a2)
              {
                if (v31 >= 64) {
                  bzero(v33, 8 * v32);
                }
                else {
                  *uint64_t v33 = v30;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v28 = *(void *)(v5 + 56) + 24 * v19;
      long long v34 = *(_OWORD *)v28;
      uint64_t v29 = *(void *)(v28 + 16);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_218421048();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      uint64_t v17 = *(void *)(v7 + 56) + 24 * v16;
      *(_OWORD *)uint64_t v17 = v34;
      *(void *)(v17 + 16) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_218412470(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_218420F38();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(a2 + 48);
        unint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t result = sub_218421048();
        unint64_t v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            unint64_t v15 = (void *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1) {
              *unint64_t v15 = *v11;
            }
            uint64_t v16 = *(void *)(a2 + 56);
            unint64_t v17 = v16 + 24 * v3;
            unint64_t v18 = (long long *)(v16 + 24 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 24))
            {
              long long v9 = *v18;
              *(void *)(v17 + 16) = *((void *)v18 + 2);
              *(_OWORD *)unint64_t v17 = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21841261C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  unint64_t v8 = (void **)v7;
  unint64_t v15 = (void *)*v7;
  unint64_t v17 = sub_218411D98(a5, a6);
  uint64_t v18 = v15[2];
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v21 = v16;
  uint64_t v22 = v15[3];
  if (v22 >= v20 && (a7 & 1) != 0)
  {
LABEL_7:
    BOOL v23 = *v8;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = v23[7] + 32 * v17;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      *(unsigned char *)uint64_t v24 = a1 & 1;
      *(void *)(v24 + 8) = a2;
      *(void *)(v24 + 16) = a3;
      *(void *)(v24 + 24) = a4;
      return result;
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a7 & 1) == 0)
  {
    sub_218412B20();
    goto LABEL_7;
  }
  sub_218411E54(v20, a7 & 1);
  unint64_t v26 = sub_218411D98(a5, a6);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_15:
    uint64_t result = sub_218421028();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  BOOL v23 = *v8;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  sub_2184128FC(v17, a5, a6, a1 & 1, a2, a3, a4, v23);

  return swift_bridgeObjectRetain();
}

unint64_t sub_2184127B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  unint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_218411E10(a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      char v21 = (uint64_t *)(v20[7] + 24 * v14);
      unint64_t result = swift_bridgeObjectRelease();
      *char v21 = a1;
      v21[1] = a2;
      v21[2] = a3;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_218412D14();
    goto LABEL_7;
  }
  sub_2184121A4(v17, a5 & 1);
  unint64_t v23 = sub_218411E10(a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_15:
    unint64_t result = sub_218421028();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:

  return sub_218412950(v14, a4, a1, a2, a3, v20);
}

unint64_t sub_2184128FC(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  a8[(result >> 6) + 8] |= 1 << result;
  unint64_t v8 = (void *)(a8[6] + 16 * result);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a8[7] + 32 * result;
  *(unsigned char *)uint64_t v9 = a4;
  *(void *)(v9 + 8) = a5;
  *(void *)(v9 + 16) = a6;
  *(void *)(v9 + 24) = a7;
  uint64_t v10 = a8[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a8[2] = v12;
  }
  return result;
}

unint64_t sub_218412950(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  *(void *)(a6[6] + 8 * result) = a2;
  unint64_t v6 = (void *)(a6[7] + 24 * result);
  *unint64_t v6 = a3;
  v6[1] = a4;
  v6[2] = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

unint64_t sub_2184129A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_218421008() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_218421008() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_218412A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_218412B20()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED5F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218420FB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    char v22 = *(unsigned char *)v21;
    uint64_t v23 = *(void *)(v21 + 24);
    char v24 = (void *)(*(void *)(v4 + 48) + v16);
    long long v25 = *(_OWORD *)(v21 + 8);
    *char v24 = v19;
    v24[1] = v18;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(unsigned char *)uint64_t v26 = v22;
    *(_OWORD *)(v26 + 8) = v25;
    *(void *)(v26 + 24) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_218412D14()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED558);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218420FB8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 24 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    uint64_t v20 = *(void *)(v19 + 16);
    long long v21 = *(_OWORD *)v19;
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = *(void *)(v4 + 56) + v18;
    *(_OWORD *)uint64_t v22 = v21;
    *(void *)(v22 + 16) = v20;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_218412ED0(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, unint64_t, uint64_t, uint64_t))
{
  v12[1] = *MEMORY[0x263EF8340];
  char v6 = *(unsigned char *)(a2 + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v8 = 8 * v7;
  if (v6 & 0x3Fu) <= 0xD || (swift_stdlib_isStackAllocationSafe())
  {
    MEMORY[0x270FA5388]();
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    uint64_t v9 = a3((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a2, a1);
    swift_release();
  }
  else
  {
    uint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    uint64_t v9 = a3((char *)v10, v7, a2, a1);
    swift_release();
    MEMORY[0x21D46A830](v10, -1, -1);
  }
  return v9;
}

void sub_21841306C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v68 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v69 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v71 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          uint64_t v74 = (v9 - 1) & v9;
          int64_t v76 = v6;
          unint64_t v11 = __clz(__rbit64(v9)) | (v6 << 6);
        }
        else
        {
          int64_t v12 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_85;
          }
          if (v12 >= v69) {
            goto LABEL_83;
          }
          unint64_t v13 = *(void *)(v68 + 8 * v12);
          int64_t v14 = v6 + 1;
          if (!v13)
          {
            int64_t v14 = v6 + 2;
            if (v6 + 2 >= v69) {
              goto LABEL_83;
            }
            unint64_t v13 = *(void *)(v68 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v6 + 3;
              if (v6 + 3 >= v69) {
                goto LABEL_83;
              }
              unint64_t v13 = *(void *)(v68 + 8 * v14);
              if (!v13)
              {
                uint64_t v15 = v6 + 4;
                if (v6 + 4 >= v69) {
                  goto LABEL_83;
                }
                unint64_t v13 = *(void *)(v68 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_87;
                    }
                    if (v14 >= v69) {
                      goto LABEL_83;
                    }
                    unint64_t v13 = *(void *)(v68 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v14 = v6 + 4;
              }
            }
          }
LABEL_22:
          uint64_t v74 = (v13 - 1) & v13;
          int64_t v76 = v14;
          unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        }
        uint64_t v16 = *(void **)(*(void *)(v4 + 48) + 8 * v11);
        sub_218420D68();
        sub_218421058();
        id v72 = v16;
        sub_218420D98();
        uint64_t v17 = sub_218421068();
        swift_bridgeObjectRelease();
        uint64_t v18 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v19 = v17 & ~v18;
        unint64_t v20 = v19 >> 6;
        uint64_t v21 = 1 << v19;
        if (((1 << v19) & *(void *)(v10 + 8 * (v19 >> 6))) != 0) {
          break;
        }
LABEL_6:

        int64_t v6 = v76;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
        unint64_t v9 = v74;
      }
      uint64_t v22 = sub_218420D68();
      uint64_t v24 = v23;
      if (v22 == sub_218420D68() && v24 == v25)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v27 = sub_218421008();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0)
        {
          uint64_t v28 = ~v18;
          for (unint64_t i = v19 + 1; ; unint64_t i = v30 + 1)
          {
            unint64_t v30 = i & v28;
            if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
              break;
            }
            uint64_t v5 = a3;
            uint64_t v31 = sub_218420D68();
            uint64_t v33 = v32;
            if (v31 == sub_218420D68() && v33 == v34)
            {
              swift_bridgeObjectRelease_n();
LABEL_38:

              unint64_t v20 = v30 >> 6;
              uint64_t v21 = 1 << v30;
              goto LABEL_39;
            }
            char v36 = sub_218421008();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v36) {
              goto LABEL_38;
            }
          }
          goto LABEL_6;
        }
      }

      uint64_t v5 = a3;
LABEL_39:
      a1[v20] |= v21;
      BOOL v37 = __OFADD__(v71++, 1);
      uint64_t v4 = a4;
      unint64_t v9 = v74;
      int64_t v6 = v76;
      if (v37) {
        goto LABEL_86;
      }
    }
  }
  int64_t v38 = 0;
  uint64_t v70 = a3 + 56;
  uint64_t v71 = 0;
  uint64_t v39 = 1 << *(unsigned char *)(a3 + 32);
  if (v39 < 64) {
    uint64_t v40 = ~(-1 << v39);
  }
  else {
    uint64_t v40 = -1;
  }
  unint64_t v41 = v40 & *(void *)(a3 + 56);
  int64_t v73 = (unint64_t)(v39 + 63) >> 6;
  uint64_t v42 = a4 + 56;
  while (1)
  {
    if (v41)
    {
      unint64_t v43 = __clz(__rbit64(v41));
      v41 &= v41 - 1;
      int64_t v77 = v38;
      unint64_t v44 = v43 | (v38 << 6);
      goto LABEL_65;
    }
    int64_t v45 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }
    if (v45 >= v73) {
      goto LABEL_83;
    }
    unint64_t v46 = *(void *)(v70 + 8 * v45);
    int64_t v47 = v38 + 1;
    if (!v46)
    {
      int64_t v47 = v38 + 2;
      if (v38 + 2 >= v73) {
        goto LABEL_83;
      }
      unint64_t v46 = *(void *)(v70 + 8 * v47);
      if (!v46)
      {
        int64_t v47 = v38 + 3;
        if (v38 + 3 >= v73) {
          goto LABEL_83;
        }
        unint64_t v46 = *(void *)(v70 + 8 * v47);
        if (!v46) {
          break;
        }
      }
    }
LABEL_64:
    unint64_t v41 = (v46 - 1) & v46;
    int64_t v77 = v47;
    unint64_t v44 = __clz(__rbit64(v46)) + (v47 << 6);
LABEL_65:
    int64_t v49 = *(void **)(*(void *)(v5 + 48) + 8 * v44);
    sub_218420D68();
    sub_218421058();
    id v75 = v49;
    sub_218420D98();
    uint64_t v50 = sub_218421068();
    swift_bridgeObjectRelease();
    uint64_t v51 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v52 = v50 & ~v51;
    if (((*(void *)(v42 + ((v52 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v52) & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v53 = sub_218420D68();
    uint64_t v55 = v54;
    if (v53 == sub_218420D68() && v55 == v56)
    {
LABEL_79:
      swift_bridgeObjectRelease_n();
      goto LABEL_80;
    }
    char v58 = sub_218421008();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v58)
    {
LABEL_80:

      *(unint64_t *)((char *)a1 + ((v44 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v44;
      BOOL v37 = __OFADD__(v71++, 1);
      int64_t v38 = v77;
      uint64_t v5 = a3;
      if (v37)
      {
        __break(1u);
LABEL_83:
        swift_retain();
        sub_218413C34(a1, a2, v71, v5);
        return;
      }
    }
    else
    {
      uint64_t v59 = ~v51;
      while (1)
      {
        unint64_t v52 = (v52 + 1) & v59;
        if (((*(void *)(v42 + ((v52 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v52) & 1) == 0) {
          break;
        }
        uint64_t v60 = sub_218420D68();
        uint64_t v62 = v61;
        if (v60 == sub_218420D68() && v62 == v63) {
          goto LABEL_79;
        }
        char v65 = sub_218421008();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v65) {
          goto LABEL_80;
        }
      }
LABEL_48:

      int64_t v38 = v77;
      uint64_t v5 = a3;
    }
  }
  uint64_t v48 = v38 + 4;
  if (v38 + 4 >= v73) {
    goto LABEL_83;
  }
  unint64_t v46 = *(void *)(v70 + 8 * v48);
  if (v46)
  {
    int64_t v47 = v38 + 4;
    goto LABEL_64;
  }
  while (1)
  {
    int64_t v47 = v48 + 1;
    if (__OFADD__(v48, 1)) {
      break;
    }
    if (v47 >= v73) {
      goto LABEL_83;
    }
    unint64_t v46 = *(void *)(v70 + 8 * v47);
    ++v48;
    if (v46) {
      goto LABEL_64;
    }
  }
LABEL_88:
  __break(1u);
}

uint64_t sub_2184136F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_218421058();
        swift_bridgeObjectRetain();
        sub_218420D98();
        uint64_t v20 = sub_218421068();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        unint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      uint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_218421008() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_218421008() & 1) != 0)
          {
            unint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      unint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    unint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_218421058();
    swift_bridgeObjectRetain();
    sub_218420D98();
    uint64_t v47 = sub_218421068();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_218421008() & 1) != 0)
    {
LABEL_76:
      unint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_218413ED0(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_218421008() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_218413C34(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB8);
  uint64_t result = sub_218420F68();
  uint64_t v9 = result;
  unint64_t v30 = a1;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= v31) {
      goto LABEL_36;
    }
    unint64_t v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_36;
      }
      unint64_t v16 = v30[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_36;
        }
        unint64_t v16 = v30[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void **)(*(void *)(v4 + 48) + 8 * v14);
    sub_218420D68();
    sub_218421058();
    id v19 = v18;
    sub_218420D98();
    uint64_t v20 = sub_218421068();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(void *)(*(void *)(v9 + 48) + 8 * v24) = v19;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= v31) {
    goto LABEL_36;
  }
  unint64_t v16 = v30[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v31) {
      goto LABEL_36;
    }
    unint64_t v16 = v30[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_218413ED0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC9CB0);
  uint64_t result = sub_218420F68();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_218421058();
    swift_bridgeObjectRetain();
    sub_218420D98();
    uint64_t result = sub_218421068();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_218414168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218420E18();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_2184144D0();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_218420F98();
  }
LABEL_7:
  uint64_t v11 = sub_218414250(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_218414250(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v16 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v17 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v18 = a3 + 55;
        }
        else
        {
          unsigned __int8 v17 = 97;
          unsigned __int8 v18 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v19 = a3 + 48;
        }
        else {
          unsigned __int8 v19 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          uint64_t v20 = result + 1;
          do
          {
            unsigned int v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v21 < 0x61 || v21 >= v17) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v22 = -87;
              }
              else
              {
                char v22 = -55;
              }
            }
            else
            {
              char v22 = -48;
            }
            unint64_t v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v24 = v21 + v22;
            unsigned int v8 = v23 + v24;
            if (__CFADD__(v23, v24)) {
              goto LABEL_72;
            }
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          unsigned __int8 v13 = 0;
          unsigned int v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned int v12 = 0;
      unsigned __int8 v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v25 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v26 = a3 + 55;
        }
        else
        {
          unsigned __int8 v25 = 97;
          unsigned __int8 v26 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v27 = a3 + 48;
        }
        else {
          unsigned __int8 v27 = 58;
        }
        if (result)
        {
          unsigned int v28 = 0;
          do
          {
            unsigned int v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v29 < 0x61 || v29 >= v25) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v30 = -87;
              }
              else
              {
                char v30 = -55;
              }
            }
            else
            {
              char v30 = -48;
            }
            unint64_t v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v32 = v29 + v30;
            unsigned int v28 = v31 + v32;
            if (__CFADD__(v31, v32)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          unsigned __int8 v13 = 0;
          unsigned int v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          unsigned int v8 = 0;
          unint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned int v12 = 0;
                unsigned __int8 v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            unint64_t v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0) {
              goto LABEL_72;
            }
            unsigned __int8 v15 = v10 + v11;
            unsigned int v8 = v14 - v15;
            if (v14 < v15) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned int v12 = 0;
        unsigned __int8 v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2184144D0()
{
  unint64_t v0 = sub_218420E28();
  uint64_t v4 = sub_218414550(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_218414550(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_2184146A8(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_21840FC24(v9, 0);
      unint64_t v12 = sub_2184147A8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_218420F98();
LABEL_4:
        JUMPOUT(0x21D469760);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x21D469760](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x21D469760]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_2184146A8(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_21840FC8C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_21840FC8C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_2184147A8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_21840FC8C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_218420DF8();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_218420F98();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_21840FC8C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_218420DC8();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_2184149BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  uint64_t v10 = sub_218420B88();
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = sub_218420BA8();
    if (__OFSUB__(a1, v12))
    {
      __break(1u);
LABEL_12:
      __break(1u);
LABEL_13:
      __break(1u);
      JUMPOUT(0x218414AB8);
    }
    uint64_t v13 = (const void *)(v11 + a1 - v12);
    sub_218420B98();
    size_t v14 = 0;
    switch(a6 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a5), a5)) {
          goto LABEL_12;
        }
        size_t v14 = HIDWORD(a5) - (int)a5;
LABEL_9:
        xpc_dictionary_set_data(a4, "AccountData", v13, v14);
        break;
      case 2uLL:
        uint64_t v16 = *(void *)(a5 + 16);
        uint64_t v15 = *(void *)(a5 + 24);
        size_t v14 = v15 - v16;
        if (!__OFSUB__(v15, v16)) {
          goto LABEL_9;
        }
        goto LABEL_13;
      case 3uLL:
        goto LABEL_9;
      default:
        size_t v14 = BYTE6(a6);
        goto LABEL_9;
    }
  }
  else
  {
    sub_218420B98();
  }
  swift_unknownObjectRelease();
  return sub_218415CF8(a5, a6);
}

void *sub_218414AC8(void *a1)
{
  return sub_21840F624(0, a1[2], 0, a1, &qword_26ABED620, (void (*)(void, int64_t, void *, void *))sub_218415E00);
}

uint64_t sub_218414B0C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for Dataclass(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_218420FD8();
  __break(1u);
  return result;
}

uint64_t sub_218414C14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for Dataclass(0);
  sub_218415BC8((unint64_t *)&unk_26ABED5D0, type metadata accessor for Dataclass);
  uint64_t result = sub_218420E88();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      unint64_t v5 = *v4++;
      sub_218410008(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_218414CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x21D46AA60](a2);
  if (v4 == sub_218420C18())
  {
    unint64_t v16 = sub_2184166C4();
    MEMORY[0x21D4696C0](&v35, a1, MEMORY[0x263F8E5C0], v16);
    if ((v36 & 1) == 0)
    {
      uint64_t v17 = v35;
      if (v35 <= 5)
      {
        if ((v35 & 0x8000000000000000) == 0) {
          return sub_218410234(&v35, v17);
        }
LABEL_72:
        uint64_t result = sub_218420FA8();
        __break(1u);
        return result;
      }
    }
  }
  uint64_t v5 = MEMORY[0x21D46AA60](a2);
  uint64_t result = sub_218420C28();
  if (v5 == result)
  {
    uint64_t result = sub_218420CD8();
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = HIBYTE(v7) & 0xF;
      uint64_t v10 = result & 0xFFFFFFFFFFFFLL;
      if ((v8 & 0x2000000000000000) != 0) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = result & 0xFFFFFFFFFFFFLL;
      }
      if (!v11) {
        return swift_bridgeObjectRelease();
      }
      if ((v8 & 0x1000000000000000) == 0)
      {
        if ((v8 & 0x2000000000000000) == 0)
        {
          if ((result & 0x1000000000000000) != 0) {
            uint64_t v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else {
            uint64_t v12 = (unsigned __int8 *)sub_218420F98();
          }
          uint64_t v13 = sub_218414250(v12, v10, 10);
          char v37 = BYTE4(v13) & 1;
          char v14 = BYTE4(v13) & 1;
          uint64_t v15 = (uint64_t)v13;
LABEL_44:
          uint64_t result = swift_bridgeObjectRelease();
          if (v14) {
            return result;
          }
          goto LABEL_45;
        }
        uint64_t v35 = result;
        uint64_t v36 = v8 & 0xFFFFFFFFFFFFFFLL;
        if (result == 43)
        {
          if (v9)
          {
            if (v9 != 1)
            {
              uint64_t v15 = (BYTE1(result) - 48);
              if (v15 <= 9)
              {
                if (v9 == 2) {
                  goto LABEL_43;
                }
                if ((BYTE2(result) - 48) <= 9u)
                {
                  uint64_t v15 = 10 * v15 + (BYTE2(result) - 48);
                  uint64_t v21 = v9 - 3;
                  if (v21)
                  {
                    uint64_t v22 = (unsigned __int8 *)&v35 + 3;
                    while (1)
                    {
                      unsigned int v23 = *v22 - 48;
                      if (v23 > 9) {
                        goto LABEL_40;
                      }
                      uint64_t v24 = 10 * v15;
                      if ((v24 & 0xFFFFFFFF00000000) != 0) {
                        goto LABEL_40;
                      }
                      uint64_t v15 = v24 + v23;
                      if (__CFADD__(v24, v23)) {
                        goto LABEL_40;
                      }
                      char v14 = 0;
                      ++v22;
                      if (!--v21) {
                        goto LABEL_44;
                      }
                    }
                  }
                  goto LABEL_43;
                }
              }
            }
            goto LABEL_40;
          }
        }
        else
        {
          if (result != 45)
          {
            if (v9)
            {
              uint64_t v15 = (result - 48);
              if (v15 <= 9)
              {
                if (v9 == 1) {
                  goto LABEL_43;
                }
                if ((BYTE1(result) - 48) <= 9u)
                {
                  uint64_t v15 = 10 * v15 + (BYTE1(result) - 48);
                  uint64_t v25 = v9 - 2;
                  if (v25)
                  {
                    uint64_t v26 = (unsigned __int8 *)&v35 + 2;
                    while (1)
                    {
                      unsigned int v27 = *v26 - 48;
                      if (v27 > 9) {
                        goto LABEL_40;
                      }
                      uint64_t v28 = 10 * v15;
                      if ((v28 & 0xFFFFFFFF00000000) != 0) {
                        goto LABEL_40;
                      }
                      uint64_t v15 = v28 + v27;
                      if (__CFADD__(v28, v27)) {
                        goto LABEL_40;
                      }
                      char v14 = 0;
                      ++v26;
                      if (!--v25) {
                        goto LABEL_44;
                      }
                    }
                  }
                  goto LABEL_43;
                }
              }
            }
LABEL_40:
            uint64_t v15 = 0;
LABEL_41:
            char v14 = 1;
            goto LABEL_44;
          }
          if (v9)
          {
            if (v9 != 1)
            {
              unsigned __int8 v18 = BYTE1(result) - 48;
              if ((BYTE1(result) - 48) <= 9u)
              {
                uint64_t v15 = 0;
                BOOL v19 = v18 == 0;
                uint64_t v20 = -v18;
                if (!v19) {
                  goto LABEL_41;
                }
                if (v9 == 2)
                {
                  char v14 = 0;
                  uint64_t v15 = v20;
                  goto LABEL_44;
                }
                unsigned __int8 v29 = BYTE2(result) - 48;
                if ((BYTE2(result) - 48) <= 9u)
                {
                  uint64_t v30 = 10 * v20;
                  if ((v30 & 0xFFFFFFFF00000000) == 0)
                  {
                    uint64_t v15 = v30 - v29;
                    if (v30 >= v29)
                    {
                      uint64_t v31 = v9 - 3;
                      if (v31)
                      {
                        unsigned __int8 v32 = (unsigned __int8 *)&v35 + 3;
                        while (1)
                        {
                          unsigned int v33 = *v32 - 48;
                          if (v33 > 9) {
                            goto LABEL_40;
                          }
                          uint64_t v34 = 10 * v15;
                          if ((v34 & 0xFFFFFFFF00000000) != 0) {
                            goto LABEL_40;
                          }
                          uint64_t v15 = v34 - v33;
                          if (v34 < v33) {
                            goto LABEL_40;
                          }
                          char v14 = 0;
                          ++v32;
                          if (!--v31) {
                            goto LABEL_44;
                          }
                        }
                      }
LABEL_43:
                      char v14 = 0;
                      goto LABEL_44;
                    }
                  }
                }
              }
            }
            goto LABEL_40;
          }
          __break(1u);
        }
        __break(1u);
        goto LABEL_72;
      }
      uint64_t v15 = sub_218414168(result, v8, 10);
      uint64_t result = swift_bridgeObjectRelease();
      if ((v15 & 0x100000000) == 0)
      {
LABEL_45:
        uint64_t v17 = v15;
        return sub_218410234(&v35, v17);
      }
    }
  }
  return result;
}

void type metadata accessor for Dataclass(uint64_t a1)
{
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2184150E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_218420FD8();
  __break(1u);
  return result;
}

uint64_t _s14AccountsDaemon27ACDXPCEventPublisherWrapperC26registerSubscriberListeneryyFZ_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26ABED548);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_218420BF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_218416804();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_218420BD8();
  os_log_type_t v9 = sub_218420E98();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2183AD000, v8, v9, "ACDXPCEventPublisher: registering", v10, 2u);
    MEMORY[0x21D46A830](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v11 = sub_218420E58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v2, 1, 1, v11);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  sub_21840C5FC((uint64_t)v2, (uint64_t)&unk_267BC9C90, v12);
  swift_release();
  return sub_2184154CC((uint64_t)v2, (uint64_t *)&unk_26ABED548);
}

uint64_t sub_21841541C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = *(_DWORD *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(_DWORD *)(v4 + 32) = v3;
  *(void *)(v4 + 8) = sub_21841678C;
  *(void *)(v4 + 16) = v2;
  return MEMORY[0x270FA2498](sub_21840C944);
}

uint64_t sub_2184154CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ACDXPCEventPublisherWrapper()
{
  return self;
}

unint64_t sub_218415550()
{
  unint64_t result = qword_267BC9BB0;
  if (!qword_267BC9BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC9BB0);
  }
  return result;
}

unint64_t sub_2184155A8()
{
  unint64_t result = qword_267BC9BB8;
  if (!qword_267BC9BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC9BB8);
  }
  return result;
}

unint64_t sub_218415600()
{
  unint64_t result = qword_267BC9BC0;
  if (!qword_267BC9BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC9BC0);
  }
  return result;
}

unint64_t sub_218415658()
{
  unint64_t result = qword_267BC9BC8;
  if (!qword_267BC9BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC9BC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEventSubscriberFlags()
{
  return &type metadata for XPCEventSubscriberFlags;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCEventSubscriber(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for XPCEventSubscriber()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for XPCEventSubscriber(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for XPCEventSubscriber(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEventSubscriber(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCEventSubscriber(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEventSubscriber()
{
  return &type metadata for XPCEventSubscriber;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCEventSubscriberAccountType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for XPCEventSubscriberAccountType()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for XPCEventSubscriberAccountType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for XPCEventSubscriberAccountType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for XPCEventSubscriberAccountType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEventSubscriberAccountType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCEventSubscriberAccountType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEventSubscriberAccountType()
{
  return &type metadata for XPCEventSubscriberAccountType;
}

ValueMetadata *type metadata accessor for XPCEventSubscriberAccountType.keys()
{
  return &type metadata for XPCEventSubscriberAccountType.keys;
}

ValueMetadata *type metadata accessor for AccountsXPCPublisherFirer()
{
  return &type metadata for AccountsXPCPublisherFirer;
}

uint64_t sub_218415A9C()
{
  return type metadata accessor for ACDXPCEventPublisher();
}

uint64_t type metadata accessor for ACDXPCEventPublisher()
{
  uint64_t result = qword_26ABED7A0;
  if (!qword_26ABED7A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_218415AF0()
{
  return swift_updateClassMetadata2();
}

void type metadata accessor for ACAccountChangeType(uint64_t a1)
{
}

uint64_t sub_218415B80()
{
  return sub_218415BC8(&qword_267BC9BE0, type metadata accessor for Dataclass);
}

uint64_t sub_218415BC8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_218415C10()
{
  return sub_218415BC8((unint64_t *)&unk_267BC9BE8, type metadata accessor for Dataclass);
}

uint64_t sub_218415C58()
{
  return sub_218415BC8(&qword_26ABED5E0, type metadata accessor for Dataclass);
}

uint64_t sub_218415CA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_218415CF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_218415DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_218415E00(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_218420FD8();
  __break(1u);
  return result;
}

char *sub_218415EEC(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = (char *)sub_21840F624(result, v11, 1, v4, &qword_26ABED620, (void (*)(void, int64_t, void *, void *))sub_218415E00);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[8 * a1 + 32];
    uint64_t v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 8 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *unint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_218420FD8();
  __break(1u);
  return result;
}

uint64_t sub_218416064()
{
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2184160A4(uint64_t a1)
{
  return sub_21840DAA4(a1, v1[2], v1[3], v1[4]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2184160C8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_218416118()
{
  uint64_t v2 = *(void *)(v0 + 32);
  long long v6 = *(_OWORD *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 40) = v3;
  *(_OWORD *)(v4 + 24) = v6;
  *(void *)(v4 + 8) = sub_2184161E0;
  *(void *)(v4 + 16) = v2;
  return MEMORY[0x270FA2498](sub_21840DC08);
}

uint64_t sub_2184161E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 44, 7);
}

uint64_t sub_218416318(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21841637C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2184163B4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2184161E0;
  long long v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267BC9C78 + dword_267BC9C78);
  return v6(a1, v4);
}

unint64_t sub_21841646C()
{
  unint64_t result = qword_26ABED5C8;
  if (!qword_26ABED5C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ABED5C8);
  }
  return result;
}

uint64_t sub_2184164AC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2184164F0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_218416528()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_21841678C;
  return sub_21840C240();
}

uint64_t sub_2184165B4(int a1, uint64_t a2, uint64_t a3)
{
  return sub_21840D138(a1, a2, a3, v3);
}

uint64_t sub_2184165BC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_218416604()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = *(_DWORD *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *(void *)uint64_t v6 = v1;
  *(void *)(v6 + 24) = v5;
  *(void *)(v6 + 32) = v4;
  *(_DWORD *)(v6 + 40) = v3;
  *(void *)(v6 + 8) = sub_21841678C;
  *(void *)(v6 + 16) = v2;
  return MEMORY[0x270FA2498](sub_21840D418);
}

unint64_t sub_2184166C4()
{
  unint64_t result = qword_26ABED630;
  if (!qword_26ABED630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ABED630);
  }
  return result;
}

void type metadata accessor for xpc_event_publisher_action_t(uint64_t a1)
{
}

void sub_21841672C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_218416790()
{
  uint64_t v0 = sub_218420BF8();
  __swift_allocate_value_buffer(v0, qword_26ABED9D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26ABED9D8);
  return sub_218420BE8();
}

uint64_t sub_218416804()
{
  if (qword_26ABED6B8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_218420BF8();

  return __swift_project_value_buffer(v0, (uint64_t)qword_26ABED9D8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2184168A0(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = 0x6465646461;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6465696669646F6DLL;
      break;
    case 2:
      uint64_t result = 0x646574656C6564;
      break;
    case 3:
      uint64_t result = 0x64656C696166;
      break;
    case 4:
      uint64_t result = 0x55676E696D726177;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountsDaemonLogging()
{
  return &type metadata for AccountsDaemonLogging;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void ACDLogAccessRequest_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_2183AD000, log, OS_LOG_TYPE_ERROR, "\"ACDLogAccessRequest failed, probably because our dynamic lookup failed.\"", v1, 2u);
}

void _ACCOUNTS_IS_VALIDATING_PLUGIN_RESPONSE_cold_1(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 136315394;
  ClassName = object_getClassName(a1);
  __int16 v7 = 2080;
  Name = sel_getName(a2);
  _os_log_fault_impl(&dword_2183AD000, a3, OS_LOG_TYPE_FAULT, "Authentication plugin '%s' indicated failure but provided no error! (selector: %s)", (uint8_t *)&v5, 0x16u);
}

void __HandleLanguageChangeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getSimulateCrashSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ACDEventLedger.m", 16, @"%s", *a1);

  __break(1u);
}

#error "218420330: call analysis failed (funcsize=41)"

void ACDAccountSyncEnabled_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account Sync - ACDAccountSyncAccountIsSyncable is deprecated, returning NO\"", v2, v3, v4, v5, v6);
}

void ACDAccountSyncDevices_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account Sync - ACDAccountSyncAccountIsSyncable is deprecated, returning empty array\"", v2, v3, v4, v5, v6);
}

void ACDAccountSyncRemoveTombstones_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account Sync - ACDAccountSyncRemoveTombstones is deprecated, returning empty array\"", v2, v3, v4, v5, v6);
}

void ACDAccountSyncMarkAccountCreated_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account Sync - ACDAccountSyncMarkAccountCreated is deprecated, returning NO\"", v2, v3, v4, v5, v6);
}

void ACDAccountSyncMarkAccountDeleted_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account Sync - ACDAccountSyncMarkAccountDeleted is deprecated, returning NO\"", v2, v3, v4, v5, v6);
}

uint64_t sub_218420B88()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_218420B98()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_218420BA8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_218420BB8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_218420BC8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_218420BD8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_218420BE8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_218420BF8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_218420C08()
{
  return MEMORY[0x270FA19C0]();
}

uint64_t sub_218420C18()
{
  return MEMORY[0x270FA19E0]();
}

uint64_t sub_218420C28()
{
  return MEMORY[0x270FA1A00]();
}

uint64_t sub_218420C38()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_218420C48()
{
  return MEMORY[0x270FA1C98]();
}

uint64_t sub_218420C58()
{
  return MEMORY[0x270FA1CB0]();
}

uint64_t sub_218420C68()
{
  return MEMORY[0x270FA1CD0]();
}

uint64_t sub_218420C78()
{
  return MEMORY[0x270FA1CE0]();
}

uint64_t sub_218420C88()
{
  return MEMORY[0x270FA1CE8]();
}

uint64_t sub_218420C98()
{
  return MEMORY[0x270FA1CF0]();
}

uint64_t sub_218420CA8()
{
  return MEMORY[0x270FA1DA8]();
}

uint64_t sub_218420CB8()
{
  return MEMORY[0x270FA1DB0]();
}

uint64_t sub_218420CC8()
{
  return MEMORY[0x270FA1DC0]();
}

uint64_t sub_218420CD8()
{
  return MEMORY[0x270FA1DC8]();
}

uint64_t sub_218420CE8()
{
  return MEMORY[0x270FA1DE0]();
}

uint64_t sub_218420CF8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_218420D08()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_218420D18()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_218420D28()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_218420D38()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_218420D48()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_218420D58()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_218420D68()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_218420D78()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_218420D88()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_218420D98()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_218420DA8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_218420DB8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_218420DC8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_218420DD8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_218420DF8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_218420E08()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_218420E18()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_218420E28()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_218420E38()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_218420E48()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_218420E58()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_218420E68()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_218420E78()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_218420E88()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_218420E98()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_218420EA8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_218420EB8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_218420EC8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_218420ED8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_218420EE8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_218420EF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_218420F08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_218420F28()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_218420F38()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_218420F48()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_218420F58()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_218420F68()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_218420F78()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_218420F88()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_218420F98()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_218420FA8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_218420FB8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_218420FC8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_218420FD8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_218420FF8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_218421008()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_218421018()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_218421028()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_218421038()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_218421048()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_218421058()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_218421068()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t ACDGetAdamOrDisplayIDForPID()
{
  return MEMORY[0x270EE0658]();
}

uint64_t ACDGetProcNameForPID()
{
  return MEMORY[0x270EE0660]();
}

uint64_t ACIsInternal()
{
  return MEMORY[0x270EE0668]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x270EE4CB0](applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x270F25408]();
}

uint64_t DMPerformMigrationReturningAfterPlugin()
{
  return MEMORY[0x270F25410]();
}

uint64_t GSSRuleAddMatch()
{
  return MEMORY[0x270EF2D00]();
}

uint64_t GSSRuleGetMatch()
{
  return MEMORY[0x270EF2D08]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x270EFD650](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x270EFD660]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

CFTypeID SecTrustGetTypeID(void)
{
  return MEMORY[0x270EFDD88]();
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x270EFDD98]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x270F795C0]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x270F79628]();
}

uint64_t TCCAccessResetForBundle()
{
  return MEMORY[0x270F79630]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x270F79658]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x270EE0670]();
}

uint64_t _ACSignpostCreate()
{
  return MEMORY[0x270EE0678]();
}

uint64_t _ACSignpostGetNanoseconds()
{
  return MEMORY[0x270EE0680]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x270EE55A0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x270F9B448]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t lockdown_connect()
{
  return MEMORY[0x270F99B20]();
}

uint64_t lockdown_copy_value()
{
  return MEMORY[0x270F99B38]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x270F99B50]();
}

uint64_t lockdown_set_value()
{
  return MEMORY[0x270F99B78]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

uint64_t serializeSecCertificates()
{
  return MEMORY[0x270EE0688]();
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t unserializeSecCertificates()
{
  return MEMORY[0x270EE0690]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x270EDC1A8]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x270EDC1B0]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x270EDC418]();
}
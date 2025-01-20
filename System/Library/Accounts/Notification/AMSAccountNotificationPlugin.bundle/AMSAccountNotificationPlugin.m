id sub_24054E204(void *a1, const char *a2)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v2 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"lastAuthenticated");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }

  return v3;
}

uint64_t sub_24054E278(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_setObject_forKeyedSubscript_(a1, a2, a3, @"lastAuthenticated");
}

void sub_24054E6B0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], a2, a3);
  if (!v6)
  {
    v6 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v4, v5);
  }
  v7 = objc_msgSend_OSLogObject(v6, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = AMSLogKey();
    int v52 = 138543618;
    uint64_t v53 = v8;
    __int16 v54 = 2114;
    v55 = v9;
    _os_log_impl(&dword_24054C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing the change.", (uint8_t *)&v52, 0x16u);
  }
  int v11 = *(_DWORD *)(a1 + 64);
  switch(v11)
  {
    case 3:
      objc_msgSend__processAccountDeletion_inStore_(*(void **)(a1 + 32), v10, *(void *)(a1 + 56), *(void *)(a1 + 48));
      break;
    case 2:
      objc_msgSend__processAccountModification_oldAccount_inStore_(*(void **)(a1 + 32), v10, *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
      break;
    case 1:
      objc_msgSend__processAccountAddition_inStore_(*(void **)(a1 + 32), v10, *(void *)(a1 + 40), *(void *)(a1 + 48));
      break;
  }
  objc_msgSend__processAccountFlagsForAccount_oldAccount_(*(void **)(a1 + 32), v10, *(void *)(a1 + 40), *(void *)(a1 + 56));
  objc_msgSend__processPrivacyAcknowledgementForAccount_oldAccount_(*(void **)(a1 + 32), v12, *(void *)(a1 + 40), *(void *)(a1 + 56));
  v13 = *(void **)(a1 + 40);
  if (!v13) {
    v13 = *(void **)(a1 + 56);
  }
  id v14 = v13;
  if (objc_msgSend_ams_isiTunesAccount(v14, v15, v16))
  {
    v19 = objc_opt_class();
    objc_msgSend__postAccountsChangedNotificationsIfNeededForAccount_oldAccount_changeType_(v19, v20, *(void *)(a1 + 40), *(void *)(a1 + 56), *(unsigned int *)(a1 + 64));
    int isActive = objc_msgSend_isActive(*(void **)(a1 + 56), v21, v22);
    if (isActive != objc_msgSend_isActive(*(void **)(a1 + 40), v24, v25))
    {
      v26 = objc_opt_class();
      objc_msgSend__postActiveAccountChangedNotification(v26, v27, v28);
      objc_msgSend_registerTokensIfNeeded(MEMORY[0x263F27E50], v29, v30);
    }
    v31 = objc_opt_class();
    objc_msgSend__postStorefontChangedNotificationIfNeededForAccount_oldAccount_store_(v31, v32, *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
    if (*(_DWORD *)(a1 + 64) != 3)
    {
      v33 = objc_opt_class();
      objc_msgSend__updateLocalAccountStorefrontIfNeededForAccount_store_(v33, v34, *(void *)(a1 + 40), *(void *)(a1 + 48));
      if (*(_DWORD *)(a1 + 64) == 2)
      {
        v35 = objc_opt_class();
        objc_msgSend__postEligibilityOverrideNotificationIfNeededForAccount_oldAccount_(v35, v36, *(void *)(a1 + 40), *(void *)(a1 + 56));
      }
    }
    Class v37 = NSClassFromString(&cfstr_Amsaccountscha.isa);
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend_performSelector_withObject_(v37, v38, (uint64_t)sel__processChangedAccount_, v14);
    }
    else
    {
      v42 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v38, v39);
      if (!v42)
      {
        v42 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v40, v41);
      }
      v43 = objc_msgSend_OSLogObject(v42, v40, v41);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = objc_opt_class();
        v45 = AMSLogKey();
        int v52 = 138543618;
        uint64_t v53 = v44;
        __int16 v54 = 2114;
        v55 = v45;
        _os_log_impl(&dword_24054C000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to notify AMSAccountsChangedObservables of the change.", (uint8_t *)&v52, 0x16u);
      }
    }
  }
  v48 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v17, v18);
  if (!v48)
  {
    v48 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v46, v47);
  }
  v49 = objc_msgSend_OSLogObject(v48, v46, v47);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v50 = objc_opt_class();
    v51 = AMSLogKey();
    int v52 = 138543618;
    uint64_t v53 = v50;
    __int16 v54 = 2114;
    v55 = v51;
    _os_log_impl(&dword_24054C000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished processing account:didChange:.", (uint8_t *)&v52, 0x16u);
  }
}

uint64_t sub_24054F3C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend_isActive(v3, v4, v5)) {
    uint64_t isDuplicate = 0;
  }
  else {
    uint64_t isDuplicate = objc_msgSend_ams_isDuplicate_(*(void **)(a1 + 32), v6, (uint64_t)v3);
  }

  return isDuplicate;
}

void sub_24054F860(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if ((objc_msgSend_isActive(v5, v6, v7) & 1) == 0
    && objc_msgSend_ams_isDuplicate_(*(void **)(a1 + 32), v8, (uint64_t)v5))
  {
    v13 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v9, v10);
    if (!v13)
    {
      v13 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v11, v12);
    }
    id v14 = objc_msgSend_OSLogObject(v13, v11, v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = AMSLogKey();
      v17 = AMSHashIfNeeded();
      uint64_t v18 = AMSHashIfNeeded();
      int v20 = 138544130;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      v23 = v16;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      v27 = v18;
      _os_log_impl(&dword_24054C000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found a non-active account that is a duplicate of the account we’re trying to save. Ignoring. account = %{public}@ | existingAccount = %{public}@", (uint8_t *)&v20, 0x2Au);
    }
    objc_msgSend_removeObjectAtIndex_(*(void **)(a1 + 48), v19, a3);
  }
}

void sub_240550114(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_240550584;
  v45[3] = &unk_2650C06A8;
  id v5 = v3;
  id v46 = v5;
  uint64_t v7 = objc_msgSend_ams_firstObjectPassingTest_(v4, v6, (uint64_t)v45);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  v42 = sub_240550590;
  v43 = &unk_2650C06A8;
  id v9 = v5;
  id v44 = v9;
  v13 = objc_msgSend_ams_firstObjectPassingTest_(v8, v10, (uint64_t)&v40);
  if (v7 && (objc_msgSend_containsObject_(*(void **)(a1 + 48), v11, (uint64_t)v7, v40, v41, v42, v43) & 1) != 0
    || v13 && (objc_msgSend_containsObject_(*(void **)(a1 + 48), v11, (uint64_t)v13) & 1) != 0)
  {
    goto LABEL_33;
  }
  unint64_t v14 = 0x263F27000uLL;
  if (!v7)
  {
    v19 = objc_msgSend_sharedAccountsOversizeConfig(MEMORY[0x263F27CB8], v11, v12);
    if (!v19)
    {
      v19 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v25, v26);
    }
    int v20 = objc_msgSend_OSLogObject(v19, v25, v26, v40, v41, v42, v43);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    uint64_t v27 = objc_opt_class();
    __int16 v22 = AMSLogKey();
    AMSHashIfNeeded();
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    uint64_t v48 = v27;
    unint64_t v14 = 0x263F27000uLL;
    __int16 v49 = 2114;
    uint64_t v50 = v22;
    __int16 v51 = 2114;
    int v52 = v23;
    _os_log_impl(&dword_24054C000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cookie ADDED. cookie = %{public}@", buf, 0x20u);
    goto LABEL_15;
  }
  if (objc_msgSend_isEqual_(v7, v11, (uint64_t)v13)) {
    goto LABEL_17;
  }
  v19 = objc_msgSend_sharedAccountsOversizeConfig(MEMORY[0x263F27CB8], v15, v16);
  if (!v19)
  {
    v19 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v17, v18);
  }
  int v20 = objc_msgSend_OSLogObject(v19, v17, v18, v40, v41, v42, v43);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    __int16 v22 = AMSLogKey();
    AMSHashIfNeeded();
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    __int16 v24 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v48 = v21;
    unint64_t v14 = 0x263F27000;
    __int16 v49 = 2114;
    uint64_t v50 = v22;
    __int16 v51 = 2114;
    int v52 = v23;
    __int16 v53 = 2114;
    __int16 v54 = v24;
    _os_log_impl(&dword_24054C000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cookie MODIFIED. oldCookie = %{public}@ | newCookie = %{public}@", buf, 0x2Au);

LABEL_15:
  }
LABEL_16:

LABEL_17:
  if ((objc_msgSend_ams_isExpired(v13, v15, v16, v40, v41, v42, v43) & 1) != 0
    || objc_msgSend_ams_isDeleted(v13, v28, v29))
  {
    if (objc_msgSend_ams_isDeleted(v13, v28, v29))
    {
      v32 = @"DELETED";
    }
    else if (objc_msgSend_ams_isExpired(v13, v30, v31))
    {
      v32 = @"EXPIRED";
    }
    else
    {
      v32 = @"UNKNOWN";
    }
    v35 = objc_msgSend_sharedAccountsOversizeConfig(*(void **)(v14 + 3256), v30, v31);
    if (!v35)
    {
      v35 = objc_msgSend_sharedConfig(*(void **)(v14 + 3256), v33, v34);
    }
    v36 = objc_msgSend_OSLogObject(v35, v33, v34);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = objc_opt_class();
      v38 = AMSLogKey();
      uint64_t v39 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138544130;
      uint64_t v48 = v37;
      __int16 v49 = 2114;
      uint64_t v50 = v38;
      __int16 v51 = 2114;
      int v52 = v32;
      __int16 v53 = 2114;
      __int16 v54 = v39;
      _os_log_impl(&dword_24054C000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cookie DELETED. reason = %{public}@ | cookie = %{public}@", buf, 0x2Au);
    }
  }
  if (v7) {
    objc_msgSend_addObject_(*(void **)(a1 + 48), v28, (uint64_t)v7);
  }
  if (v13) {
    objc_msgSend_addObject_(*(void **)(a1 + 48), v28, (uint64_t)v13);
  }
LABEL_33:
}

uint64_t sub_240550584(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a2, sel_ams_isEquivalent_, *(void *)(a1 + 32));
}

uint64_t sub_240550590(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a2, sel_ams_isEquivalent_, *(void *)(a1 + 32));
}

void sub_240550660(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if ((objc_msgSend_isEqualToString_(v4, v6, @"cookies") & 1) == 0)
  {
    int v11 = objc_msgSend_sharedAccountsOversizeConfig(MEMORY[0x263F27CB8], v7, v8);
    if (!v11)
    {
      int v11 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v9, v10);
    }
    uint64_t v12 = objc_msgSend_OSLogObject(v11, v9, v10);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      unint64_t v14 = AMSLogKey();
      v17 = objc_msgSend_first(v5, v15, v16);
      uint64_t v18 = AMSHashIfNeeded();
      uint64_t v21 = objc_msgSend_second(v5, v19, v20);
      __int16 v22 = AMSHashIfNeeded();
      int v23 = 138544386;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      id v28 = v4;
      __int16 v29 = 2114;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      v32 = v22;
      _os_log_impl(&dword_24054C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@: value = %{public}@ | oldValue = %{public}@", (uint8_t *)&v23, 0x34u);
    }
  }
}

id sub_2405509C4(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F08888];
  id v3 = a2;
  id v4 = [v2 alloc];
  v6 = objc_msgSend_initWithProperties_(v4, v5, (uint64_t)v3);

  return v6;
}

void sub_240550A1C(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08888];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v7 = objc_msgSend_initWithProperties_(v5, v6, (uint64_t)v4);

  uint64_t v8 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_240550AEC;
  v12[3] = &unk_2650C06A8;
  id v13 = v7;
  id v9 = v7;
  objc_msgSend_ams_removeObjectsPassingTest_(v8, v10, (uint64_t)v12);
  objc_msgSend_addObject_(*(void **)(a1 + 32), v11, (uint64_t)v9);
}

uint64_t sub_240550AEC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a2, sel_ams_isEquivalent_, *(void *)(a1 + 32));
}

uint64_t sub_240550AF8(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend_ams_isExpired(v2, v3, v4)) {
    uint64_t isDeleted = 1;
  }
  else {
    uint64_t isDeleted = objc_msgSend_ams_isDeleted(v2, v5, v6);
  }

  return isDeleted;
}

void sub_240552244(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_ams_sharedAccountStore(MEMORY[0x263EFB210], a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAccount_withCompletionHandler_(v5, v4, *(void *)(a1 + 32), &unk_26F4A31E8);
}

void sub_240552354(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_ams_sharedAccountStore(MEMORY[0x263EFB210], a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)objc_msgSend_ams_saveAccount_(v6, v4, *(void *)(a1 + 32));
}

void sub_240552F18(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], a2, a3);
  if (!v5)
  {
    id v5 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v3, v4);
  }
  id v6 = objc_msgSend_OSLogObject(v5, v3, v4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = AMSLogKey();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_24054C000, v6, OS_LOG_TYPE_DEFAULT, "AMSAccountNotificationPlugin: [%{public}@] Successfully authenticated the iCloud account with iTunes.", (uint8_t *)&v8, 0xCu);
  }
}

void sub_240553000(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v7 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v3, v4);
  if (!v7)
  {
    uint64_t v7 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v5, v6);
  }
  int v8 = objc_msgSend_OSLogObject(v7, v5, v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = AMSLogKey();
    uint64_t v10 = AMSLogableError();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    unint64_t v14 = v10;
    _os_log_impl(&dword_24054C000, v8, OS_LOG_TYPE_ERROR, "AMSAccountNotificationPlugin: [%{public}@] Failed to authenticate the iCloud account with iTunes. error = %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

id sub_24055311C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_268C88260;
  uint64_t v7 = qword_268C88260;
  if (!qword_268C88260)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_240557270;
    v3[3] = &unk_2650C08A8;
    v3[4] = &v4;
    sub_240557270((uint64_t)v3);
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_24055C594();
  }
  v1 = *v0;
  return v1;
}

void sub_2405531E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240553200(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], a2, a3);
  if (!v5)
  {
    id v5 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v3, v4);
  }
  uint64_t v6 = objc_msgSend_OSLogObject(v5, v3, v4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = AMSLogKey();
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_24054C000, v6, OS_LOG_TYPE_DEFAULT, "AMSAccountNotificationPlugin: [%{public}@] Apple ID GDPR acknowledgement recorded.", (uint8_t *)&v8, 0xCu);
  }
}

void sub_2405532E8(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v7 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v3, v4);
  if (!v7)
  {
    uint64_t v7 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v5, v6);
  }
  int v8 = objc_msgSend_OSLogObject(v7, v5, v6);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = AMSLogKey();
    uint64_t v10 = AMSLogableError();
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    unint64_t v14 = v10;
    _os_log_impl(&dword_24054C000, v8, OS_LOG_TYPE_ERROR, "AMSAccountNotificationPlugin: [%{public}@] Failed to recording Apple ID GDPR acknowledgement.. error = %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

void sub_2405542A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2405542C0(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v6 = objc_msgSend_domain(v3, v4, v5);
  if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F27850]))
  {
    uint64_t v10 = objc_msgSend_code(v3, v8, v9);

    if (v10 == 7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v15 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v11, v12);
  if (!v15)
  {
    uint64_t v15 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v13, v14);
  }
  uint64_t v16 = objc_msgSend_OSLogObject(v15, v13, v14);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v18 = objc_opt_class();
    id v19 = v18;
    uint64_t v20 = AMSLogKey();
    int v21 = 138543618;
    __int16 v22 = v18;
    __int16 v23 = 2114;
    uint64_t v24 = v20;
    _os_log_impl(&dword_24054C000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to remove follow-ups after signing out of an account.", (uint8_t *)&v21, 0x16u);
  }
LABEL_10:
}

void sub_240554438(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v19, v23, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v3);
        }
        int v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = *(void **)(a1 + 32);
        __int16 v13 = objc_msgSend_identifier(v11, v6, v7);
        uint64_t v16 = objc_msgSend_account(v11, v14, v15);
        id v18 = (id)objc_msgSend_clearFollowUpWithIdentifier_account_(v12, v17, (uint64_t)v13, v16);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v19, v23, 16);
    }
    while (v8);
  }
}

void sub_240554690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240554B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240555118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_240557224(uint64_t a1)
{
  id v2 = (id)AMSSetLogKey();
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void *sub_240557270(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!qword_268C88268)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = sub_2405573B0;
    v5[4] = &unk_2650C08E0;
    v5[5] = v5;
    long long v6 = xmmword_2650C08C8;
    uint64_t v7 = 0;
    qword_268C88268 = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)qword_268C88268;
    if (qword_268C88268)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_268C88268;
LABEL_5:
  result = dlsym(v2, "OBPrivacyAppleIDIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268C88260 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2405573B0()
{
  uint64_t result = _sl_dlopen();
  qword_268C88268 = result;
  return result;
}

Class sub_240557424(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268C88278)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = sub_240557568;
    v3[4] = &unk_2650C08E0;
    void v3[5] = v3;
    long long v4 = xmmword_2650C0900;
    uint64_t v5 = 0;
    qword_268C88278 = _sl_dlopen();
    if (!qword_268C88278)
    {
      abort_report_np();
LABEL_8:
      sub_24055C5B8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("RadioModel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_268C88270 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_240557568()
{
  uint64_t result = _sl_dlopen();
  qword_268C88278 = result;
  return result;
}

Class sub_2405575DC(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268C88288)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = sub_240557720;
    v3[4] = &unk_2650C08E0;
    void v3[5] = v3;
    long long v4 = xmmword_2650C0918;
    uint64_t v5 = 0;
    qword_268C88288 = _sl_dlopen();
    if (!qword_268C88288)
    {
      abort_report_np();
LABEL_8:
      sub_24055C5E0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SSVSubscriptionStatusCoordinator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_268C88280 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_240557720()
{
  uint64_t result = _sl_dlopen();
  qword_268C88288 = result;
  return result;
}

Class sub_240557794(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268C88298)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = sub_2405578D8;
    v3[4] = &unk_2650C08E0;
    void v3[5] = v3;
    long long v4 = xmmword_2650C0930;
    uint64_t v5 = 0;
    qword_268C88298 = _sl_dlopen();
    if (!qword_268C88298)
    {
      abort_report_np();
LABEL_8:
      sub_24055C608();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_268C88290 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2405578D8()
{
  uint64_t result = _sl_dlopen();
  qword_268C88298 = result;
  return result;
}

id sub_24055794C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend_ams_isLocalAccount(v4, v5, v6))
  {
    uint64_t v9 = (void *)MEMORY[0x263F27B58];
    uint64_t v10 = AMSError();
    uint64_t v12 = objc_msgSend_promiseWithError_(v9, v11, (uint64_t)v10);
  }
  else
  {
    uint64_t v15 = objc_msgSend_sharedPrivacyConfig(MEMORY[0x263F27CB8], v7, v8);
    if (!v15)
    {
      uint64_t v15 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v13, v14);
    }
    uint64_t v16 = objc_msgSend_OSLogObject(v15, v13, v14);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = AMSLogKey();
      long long v19 = AMSHashIfNeeded();
      long long v22 = objc_msgSend_ams_privacyAcknowledgement(v4, v20, v21);
      *(_DWORD *)buf = 138544130;
      uint64_t v59 = v17;
      __int16 v60 = 2114;
      v61 = v18;
      __int16 v62 = 2114;
      v63 = v19;
      __int16 v64 = 2114;
      v65 = v22;
      _os_log_impl(&dword_24054C000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing privacy acknowledgement. account = %{public}@ | privacyAcknowledgement = %{public}@", buf, 0x2Au);
    }
    __int16 v53 = objc_msgSend_ams_bagForProcessInfo_(MEMORY[0x263F27B28], v23, 0);
    id v24 = objc_alloc(MEMORY[0x263F27ED8]);
    uint64_t v26 = objc_msgSend_initWithBag_(v24, v25, (uint64_t)v53);
    objc_msgSend_setAccount_(v26, v27, (uint64_t)v4);
    objc_msgSend_setDialogOptions_(v26, v28, 1);
    __int16 v29 = AMSLogKey();
    objc_msgSend_setLogUUID_(v26, v30, (uint64_t)v29);

    id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v34 = objc_msgSend_deviceGUID(MEMORY[0x263F27BF8], v32, v33);
    objc_msgSend_ams_setNullableObject_forKey_(v31, v35, (uint64_t)v34, *MEMORY[0x263F27AC8]);

    v38 = objc_msgSend_ams_privacyAcknowledgement(v4, v36, v37);
    objc_msgSend_ams_setNullableObject_forKey_(v31, v39, (uint64_t)v38, @"privacyAcknowledgement");

    uint64_t v41 = objc_msgSend_URLForKey_(v53, v40, @"privacyAcknowledgementUrl");
    v43 = objc_msgSend_requestWithMethod_bagURL_parameters_(v26, v42, 4, v41, v31);
    v45 = objc_msgSend_thenWithBlock_(v43, v44, (uint64_t)&unk_26F4A3288);
    id v46 = AMSLogKey();
    objc_initWeak((id *)buf, a1);
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = sub_240557D9C;
    v54[3] = &unk_2650C0998;
    id v47 = v46;
    id v55 = v47;
    objc_copyWeak(&v57, (id *)buf);
    id v56 = v4;
    __int16 v49 = objc_msgSend_thenWithBlock_(v45, v48, (uint64_t)v54);
    uint64_t v12 = objc_msgSend_binaryPromiseAdapter(v49, v50, v51);

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);
  }
  return v12;
}

void sub_240557D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_240557D2C(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F27EF0];
  id v3 = a2;
  uint64_t v6 = objc_msgSend_defaultSession(v2, v4, v5);
  uint64_t v8 = objc_msgSend_dataTaskPromiseWithRequest_(v6, v7, (uint64_t)v3);

  return v8;
}

id sub_240557D9C(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id)AMSSetLogKey();
  uint64_t v7 = objc_msgSend_object(v3, v5, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  uint64_t v11 = objc_msgSend_sharedPrivacyConfig(MEMORY[0x263F27CB8], v9, v10);
  uint64_t v14 = (void *)v11;
  if (v8)
  {
    if (!v11)
    {
      uint64_t v14 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v12, v13);
    }
    uint64_t v15 = objc_msgSend_OSLogObject(v14, v12, v13);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v17 = objc_opt_class();
      id v18 = AMSLogKey();
      int v47 = 138543618;
      uint64_t v48 = v17;
      __int16 v49 = 2114;
      uint64_t v50 = v18;
      _os_log_impl(&dword_24054C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the privacy acknowledgement.", (uint8_t *)&v47, 0x16u);
    }
    if (objc_msgSend_ams_mergePrivacyAcknowledgement_(*(void **)(a1 + 40), v19, (uint64_t)v8))
    {
      id v24 = objc_msgSend_sharedPrivacyConfig(MEMORY[0x263F27CB8], v20, v21);
      if (!v24)
      {
        id v24 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v22, v23);
      }
      uint64_t v25 = objc_msgSend_OSLogObject(v24, v22, v23);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = objc_loadWeakRetained((id *)(a1 + 48));
        uint64_t v27 = objc_opt_class();
        id v28 = AMSLogKey();
        int v47 = 138543618;
        uint64_t v48 = v27;
        __int16 v49 = 2114;
        uint64_t v50 = v28;
        _os_log_impl(&dword_24054C000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server sent updated privacy acknowledgement.", (uint8_t *)&v47, 0x16u);
      }
      objc_msgSend_ams_setDisablePrivacyAcknowledgementSync_(*(void **)(a1 + 40), v29, 1);
      v32 = objc_msgSend_ams_sharedAccountStore(MEMORY[0x263EFB210], v30, v31);
      id v34 = (id)objc_msgSend_ams_saveAccount_verifyCredentials_(v32, v33, *(void *)(a1 + 40), 0);
    }
    v35 = objc_msgSend_promiseWithResult_(MEMORY[0x263F27E10], v20, MEMORY[0x263EFFA88]);
  }
  else
  {
    if (!v11)
    {
      uint64_t v14 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v12, v13);
    }
    v36 = objc_msgSend_OSLogObject(v14, v12, v13);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v38 = objc_opt_class();
      uint64_t v39 = AMSLogKey();
      v42 = objc_msgSend_object(v3, v40, v41);
      int v47 = 138543874;
      uint64_t v48 = v38;
      __int16 v49 = 2114;
      uint64_t v50 = v39;
      __int16 v51 = 2114;
      int v52 = v42;
      _os_log_impl(&dword_24054C000, v36, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", (uint8_t *)&v47, 0x20u);
    }
    v43 = (void *)MEMORY[0x263F27E10];
    id v44 = AMSError();
    v35 = objc_msgSend_promiseWithError_(v43, v45, (uint64_t)v44);
  }
  return v35;
}

uint64_t sub_240558154()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F27B28], sel_bagForProfile_profileVersion_processInfo_, @"Accounts");
}

void sub_2405582A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2405583A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_2405583C0(uint64_t a1, void *a2)
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = (id)AMSSetLogKey();
  uint64_t v9 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v5, v6);
  if (!v9)
  {
    uint64_t v9 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v7, v8);
  }
  uint64_t v10 = objc_msgSend_OSLogObject(v9, v7, v8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v120 = v11;
    __int16 v121 = 2114;
    v122 = v12;
    _os_log_impl(&dword_24054C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Running the logout task.", buf, 0x16u);
  }
  uint64_t v14 = objc_msgSend_ams_bagForProcessInfo_(MEMORY[0x263F27B28], v13, 0);
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v18 = objc_msgSend_account(*(void **)(a1 + 40), v16, v17);
  int isLocalAccount = objc_msgSend_ams_isLocalAccount(v18, v19, v20);

  if (isLocalAccount)
  {
    id v26 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v22, v23);
    if (!v26)
    {
      id v26 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v24, v25);
    }
    uint64_t v27 = objc_msgSend_OSLogObject(v26, v24, v25);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_opt_class();
      __int16 v29 = AMSLogKey();
      v32 = objc_msgSend_account(*(void **)(a1 + 40), v30, v31);
      uint64_t v33 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v120 = v28;
      __int16 v121 = 2114;
      v122 = v29;
      __int16 v123 = 2114;
      v124 = v33;
      _os_log_impl(&dword_24054C000, v27, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Preventing attempted logout of local account. account = %{public}@", buf, 0x20u);
    }
    AMSError();
    uint64_t v34 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  id v118 = 0;
  uint64_t v34 = objc_msgSend__revokeMusicKitUserTokensWithError_(WeakRetained, v22, (uint64_t)&v118);
  id v37 = v118;
  if ((v34 & 1) == 0)
  {
    uint64_t v40 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v35, v36);
    if (!v40)
    {
      uint64_t v40 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v38, v39);
    }
    uint64_t v41 = objc_msgSend_OSLogObject(v40, v38, v39);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = objc_opt_class();
      AMSLogKey();
      v43 = v113 = v14;
      id v44 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v120 = v42;
      __int16 v121 = 2114;
      v122 = v43;
      __int16 v123 = 2114;
      v124 = v44;
      _os_log_impl(&dword_24054C000, v41, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error revoking user music token. error = %{public}@", buf, 0x20u);
    }
    objc_msgSend_ams_addNullableObject_(v15, v45, (uint64_t)v37);

    id v37 = 0;
  }
  id v117 = v37;
  char v46 = objc_msgSend__disableAutomaticDownloadKindsWithError_(WeakRetained, v35, (uint64_t)&v117, v113);
  id v47 = v117;

  if ((v46 & 1) == 0)
  {
    int v52 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v48, v49);
    if (!v52)
    {
      int v52 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v50, v51);
    }
    uint64_t v53 = objc_msgSend_OSLogObject(v52, v50, v51);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      uint64_t v54 = objc_opt_class();
      id v55 = AMSLogKey();
      id v56 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v120 = v54;
      __int16 v121 = 2114;
      v122 = v55;
      __int16 v123 = 2114;
      v124 = v56;
      _os_log_impl(&dword_24054C000, v53, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error disabling automatic download kinds. error = %{public}@", buf, 0x20u);
    }
    objc_msgSend_ams_addNullableObject_(v15, v57, (uint64_t)v47);

    uint64_t v34 = 0;
    id v47 = 0;
  }
  id v116 = v47;
  char v58 = objc_msgSend__disableBookkeeperWithBag_error_(WeakRetained, v48, (uint64_t)v14, &v116);
  id v59 = v116;

  if ((v58 & 1) == 0)
  {
    __int16 v64 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v60, v61);
    if (!v64)
    {
      __int16 v64 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v62, v63);
    }
    v65 = objc_msgSend_OSLogObject(v64, v62, v63);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      uint64_t v66 = objc_opt_class();
      v67 = AMSLogKey();
      v68 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v120 = v66;
      __int16 v121 = 2114;
      v122 = v67;
      __int16 v123 = 2114;
      v124 = v68;
      _os_log_impl(&dword_24054C000, v65, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error disabling bookkeeper. error = %{public}@", buf, 0x20u);
    }
    objc_msgSend_ams_addNullableObject_(v15, v69, (uint64_t)v59);

    uint64_t v34 = 0;
    id v59 = 0;
  }
  id v115 = v59;
  char v70 = objc_msgSend__sendLogoutRequestWithBag_error_(WeakRetained, v60, (uint64_t)v14, &v115);
  id v71 = v115;

  if ((v70 & 1) == 0)
  {
    v76 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v72, v73);
    if (!v76)
    {
      v76 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v74, v75);
    }
    v77 = objc_msgSend_OSLogObject(v76, v74, v75);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      uint64_t v78 = objc_opt_class();
      v79 = AMSLogKey();
      v80 = AMSLogableError();
      *(_DWORD *)buf = 138543874;
      uint64_t v120 = v78;
      __int16 v121 = 2114;
      v122 = v79;
      __int16 v123 = 2114;
      v124 = v80;
      _os_log_impl(&dword_24054C000, v77, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error sending logout request. error = %{public}@", buf, 0x20u);
    }
    objc_msgSend_ams_addNullableObject_(v15, v81, (uint64_t)v71);

    uint64_t v34 = 0;
    id v71 = 0;
  }
  if ((unint64_t)objc_msgSend_count(v15, v72, v73) >= 2)
  {
    uint64_t v84 = AMSErrorWithMultipleUnderlyingErrors();
LABEL_39:
    v86 = (void *)v84;

    id v71 = v86;
    goto LABEL_40;
  }
  if (objc_msgSend_count(v15, v82, v83) == 1)
  {
    uint64_t v84 = objc_msgSend_objectAtIndexedSubscript_(v15, v85, 0);
    goto LABEL_39;
  }
LABEL_40:
  id v87 = v71;
  *a2 = v87;
  v88 = objc_opt_class();
  v91 = objc_msgSend_account(WeakRetained, v89, v90);
  v94 = objc_msgSend_ams_DSID(v91, v92, v93);
  objc_msgSend__resetServerDataCacheForAccountWithDSID_(v88, v95, (uint64_t)v94);

  v96 = objc_opt_class();
  v99 = objc_msgSend_account(WeakRetained, v97, v98);
  v102 = objc_msgSend_ams_accountID(v99, v100, v101);
  objc_msgSend__performDaemonSignOutTasksForAccountWithID_(v96, v103, (uint64_t)v102);

  v108 = objc_msgSend_sharedAccountsNotificationPluginConfig(MEMORY[0x263F27CB8], v104, v105);
  if (!v108)
  {
    v108 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v106, v107);
  }
  v109 = objc_msgSend_OSLogObject(v108, v106, v107);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v110 = objc_opt_class();
    v111 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v120 = v110;
    __int16 v121 = 2114;
    v122 = v111;
    _os_log_impl(&dword_24054C000, v109, OS_LOG_TYPE_DEFAULT, "%{public}@ [%{public}@] Finished running the logout task.", buf, 0x16u);
  }
LABEL_45:

  return v34;
}

Class sub_2405597AC(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268C882A8)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = sub_2405598F0;
    v3[4] = &unk_2650C08E0;
    void v3[5] = v3;
    long long v4 = xmmword_2650C0A08;
    uint64_t v5 = 0;
    qword_268C882A8 = _sl_dlopen();
    if (!qword_268C882A8)
    {
      abort_report_np();
LABEL_8:
      sub_24055C630();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("ICCloudServiceStatusMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_268C882A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2405598F0()
{
  uint64_t result = _sl_dlopen();
  qword_268C882A8 = result;
  return result;
}

id sub_240559B38(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = (char *)a2;
  uint64_t v146 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_account(*(void **)(a1 + 32), a2, a3);
  int isLocalAccount = objc_msgSend_ams_isLocalAccount(v5, v6, v7);

  if (isLocalAccount)
  {
    AMSError();
    uint64_t v11 = 0;
    *(void *)id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  uint64_t v14 = objc_msgSend_sharedAccountsConfig(MEMORY[0x263F27CB8], v9, v10);
  if (!v14)
  {
    uint64_t v14 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v12, v13);
  }
  id v15 = objc_msgSend_OSLogObject(v14, v12, v13);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = AMSLogKey();
    objc_msgSend_account(*(void **)(a1 + 32), v18, v19);
    uint64_t v20 = v134 = v3;
    uint64_t v21 = AMSHashIfNeeded();
    id v24 = objc_msgSend_account(*(void **)(a1 + 32), v22, v23);
    uint64_t v27 = objc_msgSend_ams_accountFlags(v24, v25, v26);
    uint64_t v28 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v139 = v16;
    __int16 v140 = 2114;
    v141 = v17;
    __int16 v142 = 2114;
    v143 = v21;
    __int16 v144 = 2114;
    v145 = v28;
    _os_log_impl(&dword_24054C000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

    id v3 = v134;
  }

  id v29 = objc_alloc(MEMORY[0x263F27ED8]);
  v32 = objc_msgSend_bag(*(void **)(a1 + 32), v30, v31);
  uint64_t v34 = objc_msgSend_initWithBag_(v29, v33, (uint64_t)v32);

  id v37 = objc_msgSend_account(*(void **)(a1 + 32), v35, v36);
  objc_msgSend_setAccount_(v34, v38, (uint64_t)v37);

  objc_msgSend_setRequestEncoding_(v34, v39, 3);
  uint64_t v40 = AMSLogKey();
  objc_msgSend_setLogUUID_(v34, v41, (uint64_t)v40);

  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v45 = objc_msgSend_account(*(void **)(a1 + 32), v43, v44);
  uint64_t v48 = objc_msgSend_ams_accountFlags(v45, v46, v47);
  uint64_t v50 = (void *)v48;
  if (v48) {
    objc_msgSend_setObject_forKeyedSubscript_(v42, v49, v48, @"accountFlags");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v42, v49, MEMORY[0x263EFFA78], @"accountFlags");
  }

  uint64_t v53 = objc_msgSend_deviceGUID(MEMORY[0x263F27BF8], v51, v52);
  objc_msgSend_ams_setNullableObject_forKey_(v42, v54, (uint64_t)v53, *MEMORY[0x263F27AC8]);

  id v57 = objc_msgSend_bag(*(void **)(a1 + 32), v55, v56);
  id v59 = objc_msgSend_URLForKey_(v57, v58, @"account-flags");

  if (_os_feature_enabled_impl()) {
    objc_msgSend_requestWithMethod_bagURL_parameters_(v34, v60, 2, v59, 0);
  }
  else {
  uint64_t v61 = objc_msgSend_requestWithMethod_bagURL_parameters_(v34, v60, 4, v59, v42);
  }
  id v137 = 0;
  uint64_t v63 = objc_msgSend_resultWithError_(v61, v62, (uint64_t)&v137);
  id v64 = v137;
  if (v64)
  {
    id v67 = v64;
    v68 = 0;
  }
  else
  {
    v133 = v59;
    v69 = objc_msgSend_defaultSession(MEMORY[0x263F27EF0], v65, v66);
    uint64_t v70 = (uint64_t)v63;
    id v71 = v69;
    v135 = (void *)v70;
    uint64_t v73 = objc_msgSend_dataTaskPromiseWithRequest_(v69, v72, v70);
    id v136 = 0;
    v68 = objc_msgSend_resultWithError_(v73, v74, (uint64_t)&v136);
    id v67 = v136;

    if (!v67)
    {
      v132 = v68;
      v79 = objc_msgSend_object(v68, v75, v76);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v77 = v79;
      }
      else {
        id v77 = 0;
      }
      uint64_t v63 = v135;

      uint64_t v82 = objc_msgSend_ams_accountFlags(v77, v80, v81);
      uint64_t v85 = objc_msgSend_sharedAccountsConfig(MEMORY[0x263F27CB8], v83, v84);
      v88 = (void *)v85;
      if (v82)
      {
        if (!v85)
        {
          v88 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v86, v87);
        }
        v89 = objc_msgSend_OSLogObject(v88, v86, v87);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v90 = objc_opt_class();
          v91 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v139 = v90;
          __int16 v140 = 2114;
          v141 = v91;
          _os_log_impl(&dword_24054C000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);
        }
        v92 = [AMSSyncAccountFlagsResult alloc];
        uint64_t v11 = objc_msgSend_initWithAccountFlags_(v92, v93, v82);
        v96 = objc_msgSend_account(*(void **)(a1 + 32), v94, v95);
        uint64_t v99 = objc_msgSend_ams_accountFlags(v96, v97, v98);
        v100 = (void *)v82;
        uint64_t v101 = (void *)v99;
        v130 = v100;
        char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v100, v102, v99);

        v68 = v132;
        id v59 = v133;
        if ((isEqualToDictionary & 1) == 0)
        {
          v108 = objc_msgSend_sharedAccountsConfig(MEMORY[0x263F27CB8], v104, v105);
          if (!v108)
          {
            v108 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v106, v107);
          }
          v109 = objc_msgSend_OSLogObject(v108, v106, v107);
          if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
          {
            log = v109;
            uint64_t v110 = objc_opt_class();
            v111 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v139 = v110;
            v109 = log;
            __int16 v140 = 2114;
            v141 = v111;
            _os_log_impl(&dword_24054C000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

            v68 = v132;
          }

          v114 = objc_msgSend_account(*(void **)(a1 + 32), v112, v113);
          objc_msgSend_ams_setAccountFlags_(v114, v115, (uint64_t)v130);

          id v118 = objc_msgSend_ams_sharedAccountStore(MEMORY[0x263EFB210], v116, v117);
          __int16 v121 = objc_msgSend_account(*(void **)(a1 + 32), v119, v120);
          id v123 = (id)objc_msgSend_ams_saveAccount_verifyCredentials_(v118, v122, (uint64_t)v121, 0);
        }
        uint64_t v63 = v135;
      }
      else
      {
        if (!v85)
        {
          v88 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v86, v87);
        }
        v124 = objc_msgSend_OSLogObject(v88, v86, v87);
        v68 = v132;
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          uint64_t v131 = objc_opt_class();
          uint64_t v125 = AMSLogKey();
          v128 = objc_msgSend_object(v132, v126, v127);
          *(_DWORD *)buf = 138543874;
          uint64_t v139 = v131;
          __int16 v140 = 2114;
          v141 = v125;
          __int16 v142 = 2114;
          v143 = v128;
          _os_log_impl(&dword_24054C000, v124, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

          uint64_t v63 = v135;
        }

        AMSError();
        uint64_t v11 = 0;
        *(void *)id v3 = (id)objc_claimAutoreleasedReturnValue();
        id v59 = v133;
      }
      goto LABEL_18;
    }
    uint64_t v63 = v135;
  }
  id v77 = v67;
  uint64_t v11 = 0;
  *(void *)id v3 = v77;
LABEL_18:

LABEL_19:
  return v11;
}

id sub_24055A36C(void *a1, const char *a2)
{
  uint64_t v2 = objc_msgSend_objectForKeyedSubscript_(a1, a2, @"accountFlags");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_24055A3E0()
{
  uint64_t v0 = sub_24055C6C8();
  sub_24055BF04(v0, qword_268C882B8);
  sub_24055BE88(v0, (uint64_t)qword_268C882B8);
  return sub_24055C698();
}

void sub_24055A42C(void *a1)
{
  sub_24055A454(a1);
  sub_24055A6EC();
}

uint64_t sub_24055A454(void *a1)
{
  uint64_t v4 = sub_24055C6C8();
  sub_24055C49C();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24055BEC0(&qword_268C88208);
  MEMORY[0x270FA5388]();
  sub_24055C518();
  id v9 = objc_msgSend(a1, sel_ams_DSID);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = sub_24055C728();
    sub_24055BF68(v2, 1, 1, v11);
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = 0;
    v12[3] = 0;
    void v12[4] = v1;
    v12[5] = v10;
    sub_24055B3D4(v2, (uint64_t)&unk_268C88218, (uint64_t)v12);
    return swift_release();
  }
  else
  {
    if (qword_268C882B0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_24055BE88(v4, (uint64_t)qword_268C882B8);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v4);
    sub_24055BEC0(&qword_268C88200);
    uint64_t v15 = sub_24055C688();
    sub_24055C45C(v15);
    sub_24055C554();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_24055D340;
    id v16 = (id)AMSSetLogKeyIfNeeded();
    sub_24055C6E8();

    type metadata accessor for AccountStorefrontChangeResponder();
    sub_24055C678();
    swift_bridgeObjectRelease();
    sub_24055C658();
    sub_24055C6A8();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  }
}

void sub_24055A6EC()
{
  uint64_t v1 = sub_24055C6C8();
  sub_24055C49C();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388]();
  sub_24055C518();
  id v4 = objc_msgSend(self, sel_createBagForSubProfile);
  if (v4)
  {
    uint64_t v11 = v4;
    if (qword_268C882B0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24055BE88(v1, (uint64_t)qword_268C882B8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
    sub_24055BEC0(&qword_268C88200);
    uint64_t v6 = sub_24055C688();
    sub_24055C45C(v6);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_24055D340;
    id v7 = (id)AMSSetLogKeyIfNeeded();
    sub_24055C6E8();

    type metadata accessor for AccountStorefrontChangeResponder();
    sub_24055C678();
    swift_bridgeObjectRelease();
    sub_24055C658();
    sub_24055C6B8();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27C68]), sel_init);
    objc_msgSend(v8, sel_setOrigin_, *MEMORY[0x263F27840]);
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27C28]), sel_initWithBag_, v11);
    id v10 = objc_msgSend(v9, sel_syncWithRequest_, v8);
  }
}

uint64_t sub_24055A9C0()
{
  sub_24055C474();
  v0[15] = v1;
  v0[16] = v2;
  uint64_t v3 = sub_24055C6C8();
  v0[17] = v3;
  sub_24055C45C(v3);
  v0[18] = v4;
  v0[19] = swift_task_alloc();
  sub_24055C57C();
  return MEMORY[0x270FA2498](v5, v6, v7);
}

uint64_t sub_24055AA54()
{
  sub_24055C474();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27E78]), sel_init);
  v0[5] = sub_24055C30C();
  v0[6] = &off_26F4A32A8;
  v0[2] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = v2;
  void *v2 = v0;
  v2[1] = sub_24055AB20;
  uint64_t v3 = v0[16];
  return sub_24055B01C(v3, (uint64_t)(v0 + 2));
}

uint64_t sub_24055AB20()
{
  sub_24055C474();
  sub_24055C444();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_24055C480();
  *uint64_t v5 = v4;
  *(void *)(v3 + 16_Block_object_dispose(&a9, 8) = v0;
  swift_task_dealloc();
  if (!v0) {
    sub_24055C34C(v3 + 16);
  }
  sub_24055C57C();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_24055AC08()
{
  if (qword_268C882B0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = sub_24055BE88(v3, (uint64_t)qword_268C882B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  sub_24055BEC0(&qword_268C88200);
  uint64_t v5 = sub_24055C688();
  sub_24055C45C(v5);
  sub_24055C554();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24055D340;
  id v6 = (id)AMSSetLogKeyIfNeeded();
  sub_24055C6E8();

  type metadata accessor for AccountStorefrontChangeResponder();
  sub_24055C678();
  swift_bridgeObjectRelease();
  sub_24055C658();
  sub_24055C6B8();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_24055C4C4();
  v8(v7);
  swift_task_dealloc();
  sub_24055C4B8();
  return v9();
}

uint64_t sub_24055ADBC()
{
  sub_24055C34C((uint64_t)(v0 + 2));
  if (qword_268C882B0 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[21];
  uint64_t v3 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v4 = v0[17];
  uint64_t v5 = sub_24055BE88(v4, (uint64_t)qword_268C882B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  sub_24055BEC0(&qword_268C88200);
  uint64_t v6 = sub_24055C688();
  sub_24055C45C(v6);
  sub_24055C554();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24055D340;
  id v7 = (id)AMSSetLogKeyIfNeeded();
  sub_24055C6E8();

  type metadata accessor for AccountStorefrontChangeResponder();
  sub_24055C678();
  swift_bridgeObjectRelease();
  sub_24055C738();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_24055C748();
  sub_24055C6F8();
  swift_bridgeObjectRelease();
  v0[10] = MEMORY[0x263F8D310];
  v0[7] = 0xD000000000000016;
  v0[8] = 0x800000024055DD50;
  sub_24055C668();
  sub_24055C39C((uint64_t)(v0 + 7), &qword_268C88240);
  sub_24055C6A8();
  swift_bridgeObjectRelease();

  uint64_t v8 = sub_24055C4C4();
  v9(v8);
  swift_task_dealloc();
  sub_24055C4B8();
  return v10();
}

uint64_t sub_24055B01C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return sub_24055C490((uint64_t)sub_24055B034);
}

uint64_t sub_24055B034()
{
  sub_24055C3F8(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_24055B128;
  uint64_t v2 = sub_24055C4EC();
  return v3(v2);
}

uint64_t sub_24055B128()
{
  sub_24055C474();
  sub_24055C444();
  uint64_t v2 = *v1;
  sub_24055C480();
  *uint64_t v3 = v2;
  swift_task_dealloc();
  if (v0)
  {
    sub_24055C4B8();
    return v4();
  }
  else
  {
    sub_24055C57C();
    return MEMORY[0x270FA2498](v6, v7, v8);
  }
}

uint64_t sub_24055B220()
{
  sub_24055C3F8(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_24055B314;
  uint64_t v2 = sub_24055C4EC();
  return v3(v2);
}

uint64_t sub_24055B314()
{
  sub_24055C474();
  sub_24055C444();
  uint64_t v1 = *v0;
  sub_24055C480();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24055C4B8();
  return v3();
}

uint64_t sub_24055B3D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24055C728();
  if (sub_24055C060(a1, 1, v6) == 1)
  {
    sub_24055C39C(a1, &qword_268C88208);
  }
  else
  {
    sub_24055C718();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24055C708();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

id sub_24055B544()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountStorefrontChangeResponder();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_24055B59C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountStorefrontChangeResponder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24055B5D0(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 12_Block_object_dispose(&a9, 8) = v1;
  return sub_24055C490((uint64_t)sub_24055B5E8);
}

uint64_t sub_24055B5E8()
{
  sub_24055C4E0();
  id v4 = objc_msgSend((id)sub_24055C564(), sel_setUpCacheForAccountDSID_);
  v0[17] = v4;
  v0[2] = v0;
  v0[7] = v3;
  v0[3] = sub_24055B6F0;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24055B8EC;
  v0[13] = &unk_2650C0AF0;
  v0[14] = v5;
  objc_msgSend(v4, sel_resultWithCompletion_, v2);
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_24055B6F0()
{
  sub_24055C474();
  sub_24055C444();
  *(void *)(v1 + 144) = *(void *)(v0 + 48);
  sub_24055C57C();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24055B7D4()
{
  sub_24055C4E0();
  uint64_t v1 = (void *)*(unsigned __int8 *)(v0 + 152);

  if (v1)
  {
    sub_24055C508();
  }
  else
  {
    sub_24055C6D8();
    (id)sub_24055C530();

    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v2();
}

uint64_t sub_24055B884()
{
  sub_24055C4E0();
  uint64_t v1 = *(void **)(v0 + 136);
  swift_willThrow();

  sub_24055C4B8();
  return v2();
}

uint64_t sub_24055B8EC(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    id v4 = a3;
    return sub_24055B94C(v3, (uint64_t)v4);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    return sub_24055B9B0(v6, a2);
  }
}

uint64_t sub_24055B94C(uint64_t a1, uint64_t a2)
{
  sub_24055BEC0(&qword_268C88250);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x270FA2410](a1, v4);
}

uint64_t sub_24055B9B0(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(a1 + 64) + 40) = a2;
  return MEMORY[0x270FA2408]();
}

uint64_t sub_24055B9D0(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 12_Block_object_dispose(&a9, 8) = v1;
  return sub_24055C490((uint64_t)sub_24055B9E8);
}

uint64_t sub_24055B9E8()
{
  sub_24055C4E0();
  id v4 = objc_msgSend((id)sub_24055C564(), sel_tearDownCacheForAccountDSID_);
  v0[17] = v4;
  v0[2] = v0;
  v0[7] = v3;
  v0[3] = sub_24055BAF0;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24055B8EC;
  v0[13] = &unk_2650C0B08;
  v0[14] = v5;
  objc_msgSend(v4, sel_resultWithCompletion_, v2);
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_24055BAF0()
{
  sub_24055C474();
  sub_24055C444();
  *(void *)(v1 + 144) = *(void *)(v0 + 48);
  sub_24055C57C();
  return MEMORY[0x270FA2498](v2, v3, v4);
}

uint64_t sub_24055BBD4()
{
  sub_24055C4E0();
  uint64_t v1 = (void *)*(unsigned __int8 *)(v0 + 152);

  if (v1)
  {
    sub_24055C508();
  }
  else
  {
    sub_24055C6D8();
    (id)sub_24055C530();

    swift_willThrow();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v2();
}

uint64_t sub_24055BC84()
{
  sub_24055C474();
  uint64_t v1 = v0;
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24055C588(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24055C440;
  return sub_24055B9D0(v1);
}

uint64_t sub_24055BD14()
{
  sub_24055C474();
  uint64_t v1 = v0;
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = (void *)sub_24055C588(v2);
  *uint64_t v3 = v4;
  v3[1] = sub_24055BDA4;
  return sub_24055B5D0(v1);
}

uint64_t sub_24055BDA4()
{
  sub_24055C474();
  sub_24055C444();
  uint64_t v1 = *v0;
  sub_24055C480();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24055C4B8();
  return v3();
}

uint64_t type metadata accessor for AccountStorefrontChangeResponder()
{
  return self;
}

uint64_t sub_24055BE88(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24055BEC0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_24055BF04(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24055BF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24055BF90()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24055BFD0()
{
  sub_24055C474();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_24055C588(v0);
  void *v1 = v2;
  v1[1] = sub_24055BDA4;
  return sub_24055A9C0();
}

uint64_t sub_24055C060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24055C088(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24055C164;
  return v6(a1);
}

uint64_t sub_24055C164()
{
  sub_24055C474();
  sub_24055C444();
  uint64_t v1 = *v0;
  sub_24055C480();
  void *v2 = v1;
  swift_task_dealloc();
  sub_24055C508();
  return v3();
}

uint64_t sub_24055C224()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24055C25C()
{
  sub_24055C4E0();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_24055C588(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_24055BDA4;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268C88220 + dword_268C88220);
  return v7(v2, v3);
}

unint64_t sub_24055C30C()
{
  unint64_t result = qword_268C88230;
  if (!qword_268C88230)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_268C88230);
  }
  return result;
}

uint64_t sub_24055C34C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24055C39C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24055BEC0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_24055C3F8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24055C45C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_24055C490(uint64_t a1)
{
  return MEMORY[0x270FA2498](a1, 0, 0);
}

uint64_t sub_24055C4B8()
{
  return v0 + 8;
}

uint64_t sub_24055C4C4()
{
  return *(void *)(v0 + 152);
}

uint64_t sub_24055C4EC()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_24055C508()
{
  return v0 + 8;
}

uint64_t sub_24055C530()
{
  return AMSError();
}

uint64_t sub_24055C564()
{
  return *(void *)(v0 + 128);
}

uint64_t sub_24055C588(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void sub_24055C594()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_24055C5B8(v0);
}

void sub_24055C5B8()
{
  uint64_t v0 = abort_report_np();
  sub_24055C5E0(v0);
}

void sub_24055C5E0()
{
  uint64_t v0 = abort_report_np();
  sub_24055C608(v0);
}

void sub_24055C608()
{
  uint64_t v0 = abort_report_np();
  sub_24055C630(v0);
}

void sub_24055C630()
{
}

uint64_t sub_24055C658()
{
  return MEMORY[0x270F0E508]();
}

uint64_t sub_24055C668()
{
  return MEMORY[0x270F0E518]();
}

uint64_t sub_24055C678()
{
  return MEMORY[0x270F0E520]();
}

uint64_t sub_24055C688()
{
  return MEMORY[0x270F0E530]();
}

uint64_t sub_24055C698()
{
  return MEMORY[0x270F0E5F0]();
}

uint64_t sub_24055C6A8()
{
  return MEMORY[0x270F0E608]();
}

uint64_t sub_24055C6B8()
{
  return MEMORY[0x270F0E620]();
}

uint64_t sub_24055C6C8()
{
  return MEMORY[0x270F0E650]();
}

uint64_t sub_24055C6D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24055C6E8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24055C6F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24055C708()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24055C718()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24055C728()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24055C738()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24055C748()
{
  return MEMORY[0x270EF2680]();
}

uint64_t AMSError()
{
  return MEMORY[0x270F0E690]();
}

uint64_t AMSErrorWithMultipleUnderlyingErrors()
{
  return MEMORY[0x270F0E6A8]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x270F0E6B8]();
}

uint64_t AMSLogKey()
{
  return MEMORY[0x270F0E6C0]();
}

uint64_t AMSLogableError()
{
  return MEMORY[0x270F0E6C8]();
}

uint64_t AMSSetLogKey()
{
  return MEMORY[0x270F0E6E0]();
}

uint64_t AMSSetLogKeyIfNeeded()
{
  return MEMORY[0x270F0E6E8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}
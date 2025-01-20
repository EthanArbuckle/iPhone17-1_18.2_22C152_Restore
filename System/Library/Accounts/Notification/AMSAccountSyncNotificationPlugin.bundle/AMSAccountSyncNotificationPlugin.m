id sub_240566158(void *a1, const char *a2)
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

uint64_t sub_2405661CC(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_setObject_forKeyedSubscript_(a1, a2, a3, @"lastAuthenticated");
}

void sub_240566418(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend_sharedAccountsSyncPluginConfig(MEMORY[0x263F27CB8], a2, a3);
  if (!v6)
  {
    v6 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v4, v5);
  }
  v7 = objc_msgSend_OSLogObject(v6, v4, v5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v9 = AMSLogKey();
    int v10 = *(_DWORD *)(a1 + 64);
    v11 = AMSHashIfNeeded();
    int v22 = 138544130;
    uint64_t v23 = v8;
    __int16 v24 = 2114;
    v25 = v9;
    __int16 v26 = 1024;
    int v27 = v10;
    __int16 v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_240565000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing a change. changeType = %u | account = %{public}@", (uint8_t *)&v22, 0x26u);
  }
  int v13 = *(_DWORD *)(a1 + 64);
  switch(v13)
  {
    case 3:
      objc_msgSend__synciTunesAccountDeletion_inStore_(*(void **)(a1 + 32), v12, *(void *)(a1 + 48), *(void *)(a1 + 56));
      break;
    case 2:
      v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 56);
      v18 = objc_opt_class();
      uint64_t shouldConsiderAccountActive = objc_msgSend__shouldConsiderAccountActive_(v18, v19, *(void *)(a1 + 40));
      objc_msgSend__synciTunesAccountModification_oldAccount_inStore_allowAccountRepair_(v14, v21, v15, v16, v17, shouldConsiderAccountActive);
      break;
    case 1:
      objc_msgSend__synciTunesAccountAddition_inStore_allowAccountRepair_(*(void **)(a1 + 32), v12, *(void *)(a1 + 40), *(void *)(a1 + 56), 1);
      break;
  }
}

void sub_240566AD0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_sharedAccountsSyncPluginConfig(MEMORY[0x263F27CB8], a2, a3);
  if (!v5)
  {
    uint64_t v5 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v3, v4);
  }
  v6 = objc_msgSend_OSLogObject(v5, v3, v4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = AMSLogKey();
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_240565000, v6, OS_LOG_TYPE_DEFAULT, "AMSAccountSyncNotificationPlugin: [%{public}@] Successfully sent the remote device command.", (uint8_t *)&v8, 0xCu);
  }
}

void sub_240566BB8(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263EFB070];
  if ((!objc_msgSend_ams_hasDomain_code_(v3, v5, *MEMORY[0x263EFB070], 5)
     || (objc_msgSend_isEqualToString_(*(void **)(a1 + 32), v6, *MEMORY[0x263EFB178]) & 1) == 0)
    && (!objc_msgSend_ams_hasDomain_code_(v3, v6, v4, 6)
     || (objc_msgSend_isEqualToString_(*(void **)(a1 + 32), v7, *MEMORY[0x263EFB1A8]) & 1) == 0))
  {
    int hasDomain_code = objc_msgSend_ams_hasDomain_code_(v3, v7, *MEMORY[0x263F49E40], 7);
    uint64_t v11 = objc_msgSend_sharedAccountsSyncPluginConfig(MEMORY[0x263F27CB8], v9, v10);
    v14 = (void *)v11;
    if (hasDomain_code)
    {
      if (!v11)
      {
        v14 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v12, v13);
      }
      uint64_t v15 = objc_msgSend_OSLogObject(v14, v12, v13);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      uint64_t v16 = AMSLogKey();
      int v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_240565000, v15, OS_LOG_TYPE_INFO, "AMSAccountSyncNotificationPlugin: [%{public}@] The phone isn't paired to a watch.", (uint8_t *)&v18, 0xCu);
    }
    else
    {
      if (!v11)
      {
        v14 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v12, v13);
      }
      uint64_t v15 = objc_msgSend_OSLogObject(v14, v12, v13);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      uint64_t v16 = AMSLogKey();
      uint64_t v17 = AMSLogableError();
      int v18 = 138543618;
      v19 = v16;
      __int16 v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_240565000, v15, OS_LOG_TYPE_ERROR, "AMSAccountSyncNotificationPlugin: [%{public}@] Failed to send the remote device command. error = %{public}@", (uint8_t *)&v18, 0x16u);
    }
LABEL_15:
  }
}

uint64_t sub_240566DCC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_finishWithSuccess_error_, a2);
}

uint64_t sub_240567E6C(uint64_t a1)
{
  id v2 = (id)AMSSetLogKey();
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t sub_240567EB8()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F27B28], sel_bagForProfile_profileVersion_processInfo_, @"Accounts");
}

id sub_2405680AC(uint64_t a1, const char *a2, uint64_t a3)
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
  v14 = objc_msgSend_sharedAccountsConfig(MEMORY[0x263F27CB8], v9, v10);
  if (!v14)
  {
    v14 = objc_msgSend_sharedConfig(MEMORY[0x263F27CB8], v12, v13);
  }
  uint64_t v15 = objc_msgSend_OSLogObject(v14, v12, v13);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = AMSLogKey();
    objc_msgSend_account(*(void **)(a1 + 32), v18, v19);
    __int16 v20 = v134 = v3;
    v21 = AMSHashIfNeeded();
    __int16 v24 = objc_msgSend_account(*(void **)(a1 + 32), v22, v23);
    int v27 = objc_msgSend_ams_accountFlags(v24, v25, v26);
    __int16 v28 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v139 = v16;
    __int16 v140 = 2114;
    v141 = v17;
    __int16 v142 = 2114;
    v143 = v21;
    __int16 v144 = 2114;
    v145 = v28;
    _os_log_impl(&dword_240565000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing account flags. account = %{public}@ | flags = %{public}@", buf, 0x2Au);

    id v3 = v134;
  }

  id v29 = objc_alloc(MEMORY[0x263F27ED8]);
  v32 = objc_msgSend_bag(*(void **)(a1 + 32), v30, v31);
  v34 = objc_msgSend_initWithBag_(v29, v33, (uint64_t)v32);

  v37 = objc_msgSend_account(*(void **)(a1 + 32), v35, v36);
  objc_msgSend_setAccount_(v34, v38, (uint64_t)v37);

  objc_msgSend_setRequestEncoding_(v34, v39, 3);
  v40 = AMSLogKey();
  objc_msgSend_setLogUUID_(v34, v41, (uint64_t)v40);

  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v45 = objc_msgSend_account(*(void **)(a1 + 32), v43, v44);
  uint64_t v48 = objc_msgSend_ams_accountFlags(v45, v46, v47);
  v50 = (void *)v48;
  if (v48) {
    objc_msgSend_setObject_forKeyedSubscript_(v42, v49, v48, @"accountFlags");
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v42, v49, MEMORY[0x263EFFA78], @"accountFlags");
  }

  v53 = objc_msgSend_deviceGUID(MEMORY[0x263F27BF8], v51, v52);
  objc_msgSend_ams_setNullableObject_forKey_(v42, v54, (uint64_t)v53, *MEMORY[0x263F27AC8]);

  v57 = objc_msgSend_bag(*(void **)(a1 + 32), v55, v56);
  v59 = objc_msgSend_URLForKey_(v57, v58, @"account-flags");

  if (_os_feature_enabled_impl()) {
    objc_msgSend_requestWithMethod_bagURL_parameters_(v34, v60, 2, v59, 0);
  }
  else {
  v61 = objc_msgSend_requestWithMethod_bagURL_parameters_(v34, v60, 4, v59, v42);
  }
  id v137 = 0;
  v63 = objc_msgSend_resultWithError_(v61, v62, (uint64_t)&v137);
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
    v71 = v69;
    v135 = (void *)v70;
    v73 = objc_msgSend_dataTaskPromiseWithRequest_(v69, v72, v70);
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
      v63 = v135;

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
          _os_log_impl(&dword_240565000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully synced the account flags.", buf, 0x16u);
        }
        v92 = [AMSSyncAccountFlagsResult alloc];
        uint64_t v11 = objc_msgSend_initWithAccountFlags_(v92, v93, v82);
        v96 = objc_msgSend_account(*(void **)(a1 + 32), v94, v95);
        uint64_t v99 = objc_msgSend_ams_accountFlags(v96, v97, v98);
        v100 = (void *)v82;
        v101 = (void *)v99;
        v130 = v100;
        char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v100, v102, v99);

        v68 = v132;
        v59 = v133;
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
            _os_log_impl(&dword_240565000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The server provided updated account flags.", buf, 0x16u);

            v68 = v132;
          }

          v114 = objc_msgSend_account(*(void **)(a1 + 32), v112, v113);
          objc_msgSend_ams_setAccountFlags_(v114, v115, (uint64_t)v130);

          v118 = objc_msgSend_ams_sharedAccountStore(MEMORY[0x263EFB210], v116, v117);
          v121 = objc_msgSend_account(*(void **)(a1 + 32), v119, v120);
          id v123 = (id)objc_msgSend_ams_saveAccount_verifyCredentials_(v118, v122, (uint64_t)v121, 0);
        }
        v63 = v135;
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
          v125 = AMSLogKey();
          v128 = objc_msgSend_object(v132, v126, v127);
          *(_DWORD *)buf = 138543874;
          uint64_t v139 = v131;
          __int16 v140 = 2114;
          v141 = v125;
          __int16 v142 = 2114;
          v143 = v128;
          _os_log_impl(&dword_240565000, v124, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The response was invalid. response = %{public}@", buf, 0x20u);

          v63 = v135;
        }

        AMSError();
        uint64_t v11 = 0;
        *(void *)id v3 = (id)objc_claimAutoreleasedReturnValue();
        v59 = v133;
      }
      goto LABEL_18;
    }
    v63 = v135;
  }
  id v77 = v67;
  uint64_t v11 = 0;
  *(void *)id v3 = v77;
LABEL_18:

LABEL_19:
  return v11;
}

uint64_t AMSError()
{
  return MEMORY[0x270F0E690]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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
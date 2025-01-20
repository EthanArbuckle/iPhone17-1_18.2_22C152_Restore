void sub_240526898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2405268B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2405268C4(uint64_t a1)
{
}

void sub_2405268CC(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_240526C30(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_urlConfiguration(AASetupAssistantService, a2, a3, a4, a5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240526D4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  id v7 = objc_alloc(MEMORY[0x263F25948]);
  v8 = *(uint64_t **)(a1 + 32);
  if (v2)
  {
    v9 = objc_msgSend_initWithAccount_(v7, v3, v8[5], v5, v6);
    id v10 = objc_alloc(MEMORY[0x263F25838]);
    v14 = objc_msgSend_initWithAccount_(v10, v11, *(void *)(*(void *)(a1 + 32) + 40), v12, v13);
    objc_msgSend_addProvisioningInfoToAARequest_(v14, v15, (uint64_t)v9, v16, v17);
  }
  else
  {
    v14 = objc_msgSend_appleID(v8, v3, v4, v5, v6);
    v22 = objc_msgSend_password(*(void **)(a1 + 32), v18, v19, v20, v21);
    v9 = objc_msgSend_initWithUsername_password_(v7, v23, (uint64_t)v14, (uint64_t)v22, v24);
  }
  objc_msgSend_setCookieStorage_(v9, v25, *(void *)(*(void *)(a1 + 32) + 48), v26, v27);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_240526E84;
  v31[3] = &unk_2650BEAA0;
  id v32 = *(id *)(a1 + 40);
  objc_msgSend_performRequestWithHandler_(v9, v28, (uint64_t)v31, v29, v30);
}

void sub_240526E84(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_240526F34;
  v6[3] = &unk_2650BEA78;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void sub_240526F34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_error(v6, a2, a3, a4, a5);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_240527050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4, a6);
  }
  return result;
}

void sub_24052718C(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_mutableCopy(a1[4], a2, a3, a4, a5);
  v11 = objc_msgSend_appleID(a1[5], v7, v8, v9, v10);
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, @"apple-id", v13);

  v18 = objc_msgSend_password(a1[5], v14, v15, v16, v17);
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, @"password", v20);

  v25 = objc_msgSend_appleIDClientIdentifier(MEMORY[0x263F25820], v21, v22, v23, v24);
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, @"client-id", v27);

  id v28 = objc_alloc(MEMORY[0x263F25958]);
  uint64_t v29 = a1[5];
  uint64_t v30 = v29[5];
  v35 = objc_msgSend__signingSession(v29, v31, v32, v33, v34);
  v37 = objc_msgSend_initWithAccount_withAppleIDParameters_signingSession_(v28, v36, v30, (uint64_t)v6, (uint64_t)v35);

  v42 = (void *)*((void *)a1[5] + 5);
  if (v42)
  {
    v43 = objc_msgSend_aa_personID(v42, v38, v39, v40, v41);

    if (v43)
    {
      id v44 = objc_alloc(MEMORY[0x263F25838]);
      v48 = objc_msgSend_initWithAccount_(v44, v45, *((void *)a1[5] + 5), v46, v47);
      objc_msgSend_addProvisioningInfoToAARequest_(v48, v49, (uint64_t)v37, v50, v51);
    }
  }
  objc_msgSend_setCookieStorage_(v37, v38, *((void *)a1[5] + 6), v40, v41);
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = sub_240527350;
  v55[3] = &unk_2650BEAA0;
  id v56 = a1[6];
  objc_msgSend_performRequestWithHandler_(v37, v52, (uint64_t)v55, v53, v54);
}

void sub_240527350(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_statusCode(v6, v8, v9, v10, v11) != 401)
  {
    if (!v6)
    {
      v14 = 0;
      uint64_t v15 = 0;
      int v16 = 0;
      uint64_t v13 = v7;
      goto LABEL_13;
    }
    id v17 = v6;
    uint64_t v22 = objc_msgSend_status(v17, v18, v19, v20, v21);
    if (v22
      && (uint64_t v27 = (void *)v22,
          objc_msgSend_status(v17, v23, v24, v25, v26),
          id v28 = objc_claimAutoreleasedReturnValue(),
          int v33 = objc_msgSend_intValue(v28, v29, v30, v31, v32),
          v28,
          v27,
          !v33))
    {
      uint64_t v15 = objc_msgSend_personID(v17, v23, v24, v25, v26);
      v14 = objc_msgSend_appleID(v17, v58, v59, v60, v61);
      int v16 = 1;
    }
    else
    {
      uint64_t v15 = objc_msgSend_statusMessage(v17, v23, v24, v25, v26);

      if (v15)
      {
        v38 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v34, v35, v36, v37);
        v43 = objc_msgSend_statusMessage(v17, v39, v40, v41, v42);
        objc_msgSend_setObject_forKey_(v38, v44, (uint64_t)v43, *MEMORY[0x263F08320], v45);

        uint64_t v46 = (void *)MEMORY[0x263F087E8];
        uint64_t v51 = objc_msgSend_status(v17, v47, v48, v49, v50);
        int v56 = objc_msgSend_intValue(v51, v52, v53, v54, v55);
        uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(v46, v57, @"com.apple.appleaccount", v56, (uint64_t)v38);

        v14 = 0;
        uint64_t v15 = 0;
        int v16 = 0;
        goto LABEL_12;
      }
      v14 = 0;
      int v16 = 0;
    }
    uint64_t v13 = v7;
    goto LABEL_12;
  }
  uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v12, @"com.apple.appleaccount", 401, 0);
  v14 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  id v17 = v7;
LABEL_12:

LABEL_13:
  v62 = _AALogSystem();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63[0] = 67109378;
    v63[1] = v16;
    __int16 v64 = 2112;
    v65 = v13;
    _os_log_impl(&dword_240524000, v62, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v63, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24052770C(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = objc_msgSend_mutableCopy(a1[4], a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_appleID(a1[5], v7, v8, v9, v10);
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, @"apple-id", v13);

  v18 = objc_msgSend_password(a1[5], v14, v15, v16, v17);
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, @"password", v20);

  uint64_t v25 = objc_msgSend_appleIDClientIdentifier(MEMORY[0x263F25820], v21, v22, v23, v24);
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, @"client-id", v27);

  id v28 = objc_alloc(MEMORY[0x263F25978]);
  uint64_t v29 = a1[5];
  uint64_t v30 = v29[5];
  uint64_t v35 = objc_msgSend__signingSession(v29, v31, v32, v33, v34);
  uint64_t v37 = objc_msgSend_initWithAccount_withAppleIDParameters_signingSession_(v28, v36, v30, (uint64_t)v6, (uint64_t)v35);

  uint64_t v41 = a1[5];
  if (v41[5])
  {
    id v42 = objc_alloc(MEMORY[0x263F25838]);
    uint64_t v46 = objc_msgSend_initWithAccount_(v42, v43, *((void *)a1[5] + 5), v44, v45);
    objc_msgSend_addProvisioningInfoToAARequest_(v46, v47, (uint64_t)v37, v48, v49);

    uint64_t v41 = a1[5];
  }
  objc_msgSend_setCookieStorage_(v37, v38, v41[6], v39, v40);
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = sub_2405278BC;
  v53[3] = &unk_2650BEAA0;
  id v54 = a1[6];
  objc_msgSend_performRequestWithHandler_(v37, v50, (uint64_t)v53, v51, v52);
}

void sub_2405278BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    id v54 = 0;
    id v28 = 0;
    int v55 = 0;
    uint64_t v53 = v9;
    goto LABEL_11;
  }
  id v11 = v8;
  uint64_t v16 = objc_msgSend_status(v11, v12, v13, v14, v15);
  if (v16)
  {
    uint64_t v21 = (void *)v16;
    uint64_t v22 = objc_msgSend_status(v11, v17, v18, v19, v20);
    int v27 = objc_msgSend_intValue(v22, v23, v24, v25, v26);

    if (!v27)
    {
      id v28 = objc_msgSend_personID(v11, v17, v18, v19, v20);
      id v54 = objc_msgSend_appleID(v11, v56, v57, v58, v59);
      int v55 = 1;
      goto LABEL_9;
    }
  }
  id v28 = objc_msgSend_statusMessage(v11, v17, v18, v19, v20);

  if (!v28)
  {
    id v54 = 0;
    int v55 = 0;
LABEL_9:
    uint64_t v53 = v10;
    goto LABEL_10;
  }
  uint64_t v33 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v29, v30, v31, v32);
  v38 = objc_msgSend_statusMessage(v11, v34, v35, v36, v37);
  objc_msgSend_setObject_forKey_(v33, v39, (uint64_t)v38, *MEMORY[0x263F08320], v40);

  uint64_t v41 = (void *)MEMORY[0x263F087E8];
  uint64_t v46 = objc_msgSend_status(v11, v42, v43, v44, v45);
  int v51 = objc_msgSend_intValue(v46, v47, v48, v49, v50);
  uint64_t v53 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v52, @"com.apple.appleaccount", v51, (uint64_t)v33);

  id v54 = 0;
  id v28 = 0;
  int v55 = 0;
LABEL_10:

LABEL_11:
  uint64_t v60 = _AALogSystem();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    v61[0] = 67109378;
    v61[1] = v55;
    __int16 v62 = 2112;
    v63 = v53;
    _os_log_impl(&dword_240524000, v60, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters calling handler with success %d error %@", (uint8_t *)v61, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240527C44(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend_setValue_forKey_(v2, v3, *(void *)(a1 + 32), @"delegates", v4);
  id v9 = objc_msgSend_appleID(*(void **)(a1 + 40), v5, v6, v7, v8);
  objc_msgSend_setValue_forKey_(v2, v10, (uint64_t)v9, @"apple-id", v11);

  uint64_t v16 = objc_msgSend_password(*(void **)(a1 + 40), v12, v13, v14, v15);
  objc_msgSend_setValue_forKey_(v2, v17, (uint64_t)v16, @"password", v18);

  uint64_t v23 = objc_msgSend_emailChoice(*(void **)(a1 + 40), v19, v20, v21, v22);
  objc_msgSend_setValue_forKey_(v2, v24, (uint64_t)v23, @"email-choice", v25);

  uint64_t v30 = objc_msgSend_appleIDClientIdentifier(MEMORY[0x263F25820], v26, v27, v28, v29);
  objc_msgSend_setValue_forKey_(v2, v31, (uint64_t)v30, @"client-id", v32);

  id v33 = objc_alloc(MEMORY[0x263F25968]);
  uint64_t v34 = *(void **)(a1 + 40);
  uint64_t v35 = v34[5];
  uint64_t v40 = objc_msgSend__signingSession(v34, v36, v37, v38, v39);
  id v42 = objc_msgSend_initWithAccount_withSetupParameters_signingSession_(v33, v41, v35, (uint64_t)v2, (uint64_t)v40);

  uint64_t v46 = *(void *)(a1 + 40);
  if (*(void *)(v46 + 40))
  {
    id v47 = objc_alloc(MEMORY[0x263F25838]);
    int v51 = objc_msgSend_initWithAccount_(v47, v48, *(void *)(*(void *)(a1 + 40) + 40), v49, v50);
    objc_msgSend_addProvisioningInfoToAARequest_(v51, v52, (uint64_t)v42, v53, v54);

    uint64_t v46 = *(void *)(a1 + 40);
  }
  objc_msgSend_setCookieStorage_(v42, v43, *(void *)(v46 + 48), v44, v45);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = sub_240527E30;
  v58[3] = &unk_2650BEAA0;
  id v59 = *(id *)(a1 + 48);
  objc_msgSend_performRequestWithHandler_(v42, v55, (uint64_t)v58, v56, v57);
}

void sub_240527E30(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8)
  {
    uint64_t v54 = 0;
    uint64_t v53 = v9;
    goto LABEL_11;
  }
  id v11 = v8;
  uint64_t v16 = objc_msgSend_status(v11, v12, v13, v14, v15);
  if (v16)
  {
    uint64_t v21 = (void *)v16;
    uint64_t v22 = objc_msgSend_status(v11, v17, v18, v19, v20);
    int v27 = objc_msgSend_intValue(v22, v23, v24, v25, v26);

    if (!v27)
    {
      uint64_t v54 = objc_msgSend_responseParameters(v11, v17, v18, v19, v20);
      goto LABEL_9;
    }
  }
  uint64_t v28 = objc_msgSend_statusMessage(v11, v17, v18, v19, v20);

  if (!v28)
  {
    uint64_t v54 = 0;
LABEL_9:
    uint64_t v53 = v10;
    goto LABEL_10;
  }
  id v33 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v29, v30, v31, v32);
  uint64_t v38 = objc_msgSend_statusMessage(v11, v34, v35, v36, v37);
  objc_msgSend_setObject_forKey_(v33, v39, (uint64_t)v38, *MEMORY[0x263F08320], v40);

  uint64_t v41 = (void *)MEMORY[0x263F087E8];
  uint64_t v46 = objc_msgSend_status(v11, v42, v43, v44, v45);
  int v51 = objc_msgSend_intValue(v46, v47, v48, v49, v50);
  uint64_t v53 = objc_msgSend_errorWithDomain_code_userInfo_(v41, v52, @"com.apple.appleaccount", v51, (uint64_t)v33);

  uint64_t v54 = 0;
LABEL_10:

LABEL_11:
  int v55 = _AALogSystem();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    int v56 = 138412290;
    uint64_t v57 = v53;
    _os_log_impl(&dword_240524000, v55, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters calling handler with error %@", (uint8_t *)&v56, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240528170(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend_setValue_forKey_(v2, v3, *(void *)(a1 + 32), @"delegates", v4);
  id v9 = objc_msgSend_appleID(*(void **)(a1 + 40), v5, v6, v7, v8);
  objc_msgSend_setValue_forKey_(v2, v10, (uint64_t)v9, @"apple-id", v11);

  uint64_t v16 = objc_msgSend_password(*(void **)(a1 + 40), v12, v13, v14, v15);
  objc_msgSend_setValue_forKey_(v2, v17, (uint64_t)v16, @"password", v18);

  uint64_t v23 = objc_msgSend_emailChoice(*(void **)(a1 + 40), v19, v20, v21, v22);
  objc_msgSend_setValue_forKey_(v2, v24, (uint64_t)v23, @"email-choice", v25);

  uint64_t v30 = objc_msgSend_appleIDClientIdentifier(MEMORY[0x263F25820], v26, v27, v28, v29);
  objc_msgSend_setValue_forKey_(v2, v31, (uint64_t)v30, @"client-id", v32);

  id v33 = objc_alloc(MEMORY[0x263F258C0]);
  uint64_t v34 = *(void **)(a1 + 40);
  uint64_t v35 = v34[5];
  uint64_t v40 = objc_msgSend__signingSession(v34, v36, v37, v38, v39);
  id v42 = objc_msgSend_initWithAccount_parameters_signingSession_(v33, v41, v35, (uint64_t)v2, (uint64_t)v40);

  uint64_t v46 = *(void *)(a1 + 40);
  if (*(void *)(v46 + 40))
  {
    id v47 = objc_alloc(MEMORY[0x263F25838]);
    int v51 = objc_msgSend_initWithAccount_(v47, v48, *(void *)(*(void *)(a1 + 40) + 40), v49, v50);
    objc_msgSend_addProvisioningInfoToAARequest_(v51, v52, (uint64_t)v42, v53, v54);

    uint64_t v46 = *(void *)(a1 + 40);
  }
  objc_msgSend_setCookieStorage_(v42, v43, *(void *)(v46 + 48), v44, v45);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = sub_24052835C;
  v58[3] = &unk_2650BEAA0;
  id v59 = *(id *)(a1 + 48);
  objc_msgSend_performRequestWithHandler_(v42, v55, (uint64_t)v58, v56, v57);
}

void sub_24052835C(uint64_t a1, void *a2, void *a3, void *a4)
{
  v53[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v15 = v9;
  uint64_t v16 = v15;
  if (v10)
  {
    uint64_t v17 = objc_msgSend_status(v10, v11, v12, v13, v14);
    if (!v17
      || (uint64_t v22 = (void *)v17,
          objc_msgSend_status(v10, v18, v19, v20, v21),
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          int v28 = objc_msgSend_intValue(v23, v24, v25, v26, v27),
          v23,
          v22,
          uint64_t v16 = v15,
          v28))
    {
      uint64_t v29 = objc_msgSend_statusMessage(v10, v18, v19, v20, v21);

      uint64_t v16 = v15;
      if (v29)
      {
        uint64_t v52 = *MEMORY[0x263F08320];
        uint64_t v34 = objc_msgSend_statusMessage(v10, v30, v31, v32, v33);
        v53[0] = v34;
        uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v35, (uint64_t)v53, (uint64_t)&v52, 1);

        uint64_t v37 = (void *)MEMORY[0x263F087E8];
        id v42 = objc_msgSend_status(v10, v38, v39, v40, v41);
        int v47 = objc_msgSend_intValue(v42, v43, v44, v45, v46);
        uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(v37, v48, @"com.apple.appleaccount", v47, (uint64_t)v36);
      }
    }
  }
  uint64_t v49 = _AALogSystem();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    int v50 = 138412290;
    int v51 = v16;
    _os_log_impl(&dword_240524000, v49, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters calling completion handler with error %@", (uint8_t *)&v50, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2405285FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_24052877C(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F25970]);
  id v9 = objc_msgSend_initWithAccount_(v2, v3, *(void *)(*(void *)(a1 + 32) + 40), v4, v5);
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    id v10 = objc_alloc(MEMORY[0x263F25838]);
    uint64_t v14 = objc_msgSend_initWithAccount_(v10, v11, *(void *)(*(void *)(a1 + 32) + 40), v12, v13);
    objc_msgSend_addProvisioningInfoToAARequest_(v14, v15, (uint64_t)v9, v16, v17);
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    objc_msgSend_setCustomHeaders_(v9, v6, v18, v7, v8);
  }
  objc_msgSend_setCookieStorage_(v9, v6, *(void *)(*(void *)(a1 + 32) + 48), v7, v8);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_240528884;
  v22[3] = &unk_2650BEAA0;
  id v23 = *(id *)(a1 + 48);
  objc_msgSend_performRequestWithHandler_(v9, v19, (uint64_t)v22, v20, v21);
}

void sub_240528884(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v11 = a4;
  if (v6)
  {
    uint64_t v12 = objc_msgSend_xmlUIData(v6, v7, v8, v9, v10);
    uint64_t v13 = _AALogSystem();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_240524000, v13, OS_LOG_TYPE_DEFAULT, "We got the new iCloud Terms from the server", (uint8_t *)&v16, 2u);
      }
    }
    else if (v14)
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_240524000, v13, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_240524000, v15, OS_LOG_TYPE_DEFAULT, "Fetching iCloud Terms failed with error: %@", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_240528C14(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
    uint64_t v13 = objc_msgSend_upgradeStatus(v8, v9, v10, v11, v12);
    BOOL v14 = _AALogSystem();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_240524000, v14, OS_LOG_TYPE_DEFAULT, "We got the upgrade status from the server", (uint8_t *)&v28, 2u);
      }

      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v25 = objc_msgSend_BOOLValue(v13, v21, v22, v23, v24);
      (*(void (**)(uint64_t, uint64_t, id))(v20 + 16))(v20, v25, v7);
    }
    else
    {
      if (v15)
      {
        uint64_t v27 = objc_msgSend_responseDictionary(v8, v16, v17, v18, v19);
        int v28 = 138412546;
        id v29 = v7;
        __int16 v30 = 2112;
        uint64_t v31 = v27;
        _os_log_impl(&dword_240524000, v14, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status failed with error: %@ response: %@", (uint8_t *)&v28, 0x16u);
      }
      (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, v7);
    }
  }
  else
  {
    uint64_t v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v7;
      _os_log_impl(&dword_240524000, v26, OS_LOG_TYPE_DEFAULT, "Fetching upgrade status got no response and error: %@", (uint8_t *)&v28, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_240529CF8(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v8 = objc_msgSend_parentAccountIdentifier(v3, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_identifier(*(void **)(a1 + 32), v9, v10, v11, v12);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v14, (uint64_t)v13, v15, v16);

  if (isEqualToString) {
    goto LABEL_10;
  }
  uint64_t v22 = objc_msgSend_username(v3, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_username(*(void **)(a1 + 32), v23, v24, v25, v26);
  int v31 = objc_msgSend_isEqualToString_(v22, v28, (uint64_t)v27, v29, v30);

  if (v31)
  {
    uint64_t v36 = _AALogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = *(void *)(a1 + 32);
      uint64_t v37 = *(void *)(a1 + 40);
      int v54 = 138412546;
      uint64_t v55 = v37;
      __int16 v56 = 2112;
      uint64_t v57 = v38;
      uint64_t v39 = "Found an orphaned accountType %@ for username of AppleAccount %@";
LABEL_8:
      _os_log_impl(&dword_240524000, v36, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&v54, 0x16u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  uint64_t v40 = objc_msgSend_aa_appleIDAliases(*(void **)(a1 + 32), v32, v33, v34, v35);
  uint64_t v45 = objc_msgSend_username(v3, v41, v42, v43, v44);
  int v49 = objc_msgSend_containsObject_(v40, v46, (uint64_t)v45, v47, v48);

  if (!v49)
  {
LABEL_10:
    uint64_t v52 = 0;
    goto LABEL_11;
  }
  uint64_t v36 = _AALogSystem();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v51 = *(void *)(a1 + 32);
    uint64_t v50 = *(void *)(a1 + 40);
    int v54 = 138412546;
    uint64_t v55 = v50;
    __int16 v56 = 2112;
    uint64_t v57 = v51;
    uint64_t v39 = "Found an orphaned accountType %@ for alias of AppleAccount %@";
    goto LABEL_8;
  }
LABEL_9:

  uint64_t v52 = 1;
LABEL_11:

  return v52;
}

void sub_24052AE34(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _AALogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = v11;
      uint64_t v12 = "Successfully sent AK account %@. Now moving on to main account.";
      uint64_t v13 = v9;
      uint32_t v14 = 12;
LABEL_6:
      _os_log_impl(&dword_240524000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else if (v10)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v55 = v15;
    __int16 v56 = 2112;
    id v57 = v8;
    uint64_t v12 = "Failed to send AK account %@ to paired device. Error: %@";
    uint64_t v13 = v9;
    uint32_t v14 = 22;
    goto LABEL_6;
  }

  uint64_t v20 = objc_msgSend_copy(*(void **)(a1 + 40), v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend__aa_rawPassword(*(void **)(a1 + 40), v21, v22, v23, v24);
  objc_msgSend__aa_setRawPassword_(v20, v26, (uint64_t)v25, v27, v28);

  objc_msgSend_setAuthenticated_(v20, v29, 0, v30, v31);
  uint64_t v36 = objc_msgSend_sharedInstance(MEMORY[0x263F290F0], v32, v33, v34, v35);
  uint64_t v40 = objc_msgSend_securityLevelForAccount_(v36, v37, *(void *)(a1 + 32), v38, v39);

  uint64_t v45 = 0;
  if (a2 && v40 == 4)
  {
    uint64_t v45 = objc_msgSend__saveOptionsForProxiedDeviceAuth(*(void **)(a1 + 48), v41, v42, v43, v44);
  }
  uint64_t v46 = objc_msgSend_remoteDeviceProxy(*(void **)(a1 + 56), v41, v42, v43, v44);
  uint64_t v47 = *(void *)(a1 + 64);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = sub_24052B070;
  v51[3] = &unk_2650BEB68;
  id v48 = *(id *)(a1 + 40);
  uint64_t v49 = *(void *)(a1 + 48);
  id v52 = v48;
  uint64_t v53 = v49;
  objc_msgSend_sendCommand_withAccount_options_completion_(v46, v50, v47, (uint64_t)v20, (uint64_t)v45, v51);
}

void sub_24052B070(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = v8;
  if (a2)
  {
    uint32_t v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v34 = 138412290;
      uint64_t v35 = v15;
      uint64_t v16 = "Successfully signed in with account %@ on remote device!";
      uint64_t v17 = v14;
      uint32_t v18 = 12;
LABEL_12:
      _os_log_impl(&dword_240524000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v34, v18);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  uint64_t v19 = objc_msgSend_domain(v8, v9, v10, v11, v12);
  if (!objc_msgSend_isEqualToString_(v19, v20, @"com.apple.appleaccount", v21, v22))
  {

LABEL_10:
    uint32_t v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      int v34 = 138412546;
      uint64_t v35 = v33;
      __int16 v36 = 2112;
      uint64_t v37 = v13;
      uint64_t v16 = "Error encountered with signing in with account %@ on remote device: %@";
      uint64_t v17 = v14;
      uint32_t v18 = 22;
      goto LABEL_12;
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v27 = objc_msgSend_code(v13, v23, v24, v25, v26);

  if (v27 != -5) {
    goto LABEL_10;
  }
  uint64_t v28 = _AALogSystem();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = *(void *)(a1 + 32);
    int v34 = 138412290;
    uint64_t v35 = v29;
    _os_log_impl(&dword_240524000, v28, OS_LOG_TYPE_DEFAULT, "Error! Cannot sign in with account %@. Two-factor auth is required.", (uint8_t *)&v34, 0xCu);
  }

  objc_msgSend__showRedirectToBridgeAlertForAccount_(*(void **)(a1 + 40), v30, *(void *)(a1 + 32), v31, v32);
LABEL_14:
}

void sub_24052B6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    uint64_t v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint32_t v14 = 0;
      _os_log_impl(&dword_240524000, v5, OS_LOG_TYPE_DEFAULT, "We're sending the user to Bridge... wheeeeeeee!", v14, 2u);
    }

    uint64_t v9 = objc_msgSend_URLWithString_(NSURL, v6, @"bridge:tab=SETTINGS&root=GENERAL_LINK&path=LINK_WITH_ICLOUD_LINK", v7, v8);
    uint64_t v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_24052B7F8;
    block[3] = &unk_2650BEBD8;
    id v13 = v9;
    id v11 = v9;
    dispatch_async(v10, block);
  }
}

void sub_24052B7F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_defaultWorkspace(MEMORY[0x263F01880], a2, a3, a4, a5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openSensitiveURL_withOptions_(v8, v6, *(void *)(a1 + 32), 0, v7);
}

void sub_24052B9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24052B9E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend_numberWithBool_(NSNumber, v6, a2, v7, v8);
    int v10 = 138412546;
    id v11 = v9;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_240524000, v5, OS_LOG_TYPE_DEFAULT, "clearBridgeAppleIDFollowUp result : %@ error: %@", (uint8_t *)&v10, 0x16u);
  }
}

Class sub_24052BAC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11[0] = 0;
  if (!qword_268C87BC8)
  {
    v11[1] = (void *)MEMORY[0x263EF8330];
    v11[2] = (void *)3221225472;
    v11[3] = sub_24052BBF0;
    v11[4] = &unk_2650BEC68;
    v11[5] = v11;
    long long v12 = xmmword_2650BEC50;
    uint64_t v13 = 0;
    qword_268C87BC8 = _sl_dlopen();
  }
  if (!qword_268C87BC8) {
    sub_24052E658(v11, a2, a3, a4, a5);
  }
  if (v11[0]) {
    free(v11[0]);
  }
  Class result = objc_getClass("FLFollowUpController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_24052E6D8((uint64_t)result, v7, v8, v9, v10);
  }
  qword_268C87BC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24052BBF0()
{
  uint64_t result = _sl_dlopen();
  qword_268C87BC8 = result;
  return result;
}

void sub_24052BDA8(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F25808]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = nullsub_1;
  v6[3] = &unk_2650BEC90;
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  objc_msgSend_handleAppleAccountDeleteForAccount_completion_(v2, v4, v3, (uint64_t)v6, v5);
}

void sub_24052C43C(uint64_t a1)
{
  id v13 = objc_alloc_init(MEMORY[0x263F29118]);
  uint64_t v6 = objc_msgSend_aa_altDSID(*(void **)(a1 + 32), v2, v3, v4, v5);
  objc_msgSend_setAppleIDWithAltDSID_inUse_forService_(v13, v7, (uint64_t)v6, 1, 1);

  id v8 = objc_alloc_init((Class)sub_24052D5DC());
  uint64_t v9 = sub_24052D858();
  objc_msgSend_didCompleteFlow_(v8, v10, (uint64_t)v9, v11, v12);
}

void sub_24052C4DC(uint64_t a1)
{
  id v8 = objc_alloc_init(MEMORY[0x263F29118]);
  uint64_t v6 = objc_msgSend_aa_altDSID(*(void **)(a1 + 32), v2, v3, v4, v5);
  objc_msgSend_setAppleIDWithAltDSID_inUse_forService_(v8, v7, (uint64_t)v6, 0, 1);
}

void sub_24052C72C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend_setWarmingUp_(*(void **)(a1 + 32), a2, 0, a4, a5);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v15 = 0;
  int v10 = objc_msgSend_saveVerifiedAccount_error_(v6, v8, v7, (uint64_t)&v15, v9);
  id v11 = v15;
  uint64_t v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = @"NO";
    *(_DWORD *)buf = 138412802;
    if (v10) {
      uint64_t v14 = @"YES";
    }
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_240524000, v12, OS_LOG_TYPE_DEFAULT, "Ended account warmup for account %@ with success: %@, error: %@", buf, 0x20u);
  }
}

uint64_t sub_24052C99C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_childAccountsWithAccountTypeIdentifier_(*(void **)(a1 + 32), a2, *MEMORY[0x263EFAEA8], a4, a5);
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    return MEMORY[0x270F9A6D0](AAFindMyAccountController, sel_updateDeviceLocatorChildAccountForAppleAccount_, v14, v12, v13);
  }
  else
  {
    id v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v21 = 138412290;
      uint64_t v22 = v16;
      _os_log_impl(&dword_240524000, v15, OS_LOG_TYPE_DEFAULT, "AppleAccount (%@) does not have a device locator child account.", (uint8_t *)&v21, 0xCu);
    }

    return objc_msgSend_addDeviceLocatorChildAccountToAppleAccount_(AAFindMyAccountController, v17, *(void *)(a1 + 32), v18, v19);
  }
}

uint64_t sub_24052CAD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_childAccountsWithAccountTypeIdentifier_(*(void **)(a1 + 32), a2, *MEMORY[0x263EFAED0], a4, a5);
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    return MEMORY[0x270F9A6D0](AAFindMyAccountController, sel_updateFMFChildAccountForAppleAccount_, v14, v12, v13);
  }
  else
  {
    id v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v21 = 138412290;
      uint64_t v22 = v16;
      _os_log_impl(&dword_240524000, v15, OS_LOG_TYPE_DEFAULT, "AppleAccount (%@) does not have a FMF child account.", (uint8_t *)&v21, 0xCu);
    }

    return objc_msgSend_addFMFChildAccountToAppleAccount_(AAFindMyAccountController, v17, *(void *)(a1 + 32), v18, v19);
  }
}

void sub_24052CEE8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v18[12] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263EFAEE0];
  v18[0] = *MEMORY[0x263EFAE58];
  v18[1] = v6;
  uint64_t v7 = *MEMORY[0x263EFAF20];
  v18[2] = *MEMORY[0x263EFB000];
  v18[3] = v7;
  uint64_t v8 = *MEMORY[0x263EFAF00];
  v18[4] = *MEMORY[0x263EFAEA0];
  v18[5] = v8;
  uint64_t v9 = *MEMORY[0x263EFAEB8];
  v18[6] = *MEMORY[0x263EFAE68];
  v18[7] = v9;
  uint64_t v10 = *MEMORY[0x263EFAF10];
  v18[8] = *MEMORY[0x263EFAF18];
  v18[9] = v10;
  uint64_t v11 = *MEMORY[0x263EFAE80];
  v18[10] = *MEMORY[0x263EFAE90];
  v18[11] = v11;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v18, 12, a5);
  uint64_t v16 = objc_msgSend_setWithArray_(v5, v13, (uint64_t)v12, v14, v15);
  uint64_t v17 = (void *)qword_268C87BD0;
  qword_268C87BD0 = v16;
}

void sub_24052D090(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24052D0AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_24052D0D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_24052D0F0()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_268C87BE0;
  uint64_t v5 = qword_268C87BE0;
  if (!qword_268C87BE0)
  {
    long long v6 = xmmword_2650BED20;
    long long v7 = *(_OWORD *)&off_2650BED30;
    v3[3] = _sl_dlopen();
    qword_268C87BE0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_24052D200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24052D218(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268C87BE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24052D2A8()
{
  uint64_t v5 = 0;
  uint64_t result = sub_24052D0F0();
  if (!result) {
    sub_24052EBF4(&v5, v1, v2, v3, v4);
  }
  return result;
}

uint64_t sub_24052D2FC()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_268C87BE8;
  uint64_t v6 = qword_268C87BE8;
  if (!qword_268C87BE8)
  {
    v1 = (void *)sub_24052D2A8();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantIsRunningSilentTokenUpgrade");
    qword_268C87BE8 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24052D3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_24052D3EC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_24052D2A8();
  uint64_t result = dlsym(v2, "BYSetupAssistantIsRunningSilentTokenUpgrade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268C87BE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24052D43C()
{
  uint64_t v0 = (uint64_t (*)(void))sub_24052D2FC();
  if (!v0) {
    sub_24052EC74(0, v1, v2, v3, v4);
  }
  return v0();
}

uint64_t sub_24052D46C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_268C87BF0;
  uint64_t v6 = qword_268C87BF0;
  if (!qword_268C87BF0)
  {
    v1 = (void *)sub_24052D2A8();
    v4[3] = (uint64_t)dlsym(v1, "BYSetupAssistantHasCompletedInitialRun");
    qword_268C87BF0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24052D544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_24052D55C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_24052D2A8();
  uint64_t result = dlsym(v2, "BYSetupAssistantHasCompletedInitialRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268C87BF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24052D5AC()
{
  uint64_t v0 = (uint64_t (*)(void))sub_24052D46C();
  if (!v0) {
    sub_24052ECEC(0, v1, v2, v3, v4);
  }
  return v0();
}

id sub_24052D5DC()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_268C87BF8;
  uint64_t v7 = qword_268C87BF8;
  if (!qword_268C87BF8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_24052D6C0;
    v3[3] = &unk_2650BEC30;
    v3[4] = &v4;
    sub_24052D6C0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24052D6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_24052D6C0(uint64_t a1)
{
  sub_24052D2A8();
  Class result = objc_getClass("BYFlowSkipController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_24052ED64((uint64_t)result, v3, v4, v5, v6);
  }
  qword_268C87BF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24052D718()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_268C87C00;
  uint64_t v6 = qword_268C87C00;
  if (!qword_268C87C00)
  {
    id v1 = (void *)sub_24052D2A8();
    v4[3] = (uint64_t)dlsym(v1, "BYFlowSkipIdentifierAppleID");
    qword_268C87C00 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24052D7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_24052D808(uint64_t a1)
{
  uint64_t v2 = (void *)sub_24052D2A8();
  Class result = dlsym(v2, "BYFlowSkipIdentifierAppleID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268C87C00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_24052D858()
{
  uint64_t v0 = (void **)sub_24052D718();
  if (!v0) {
    sub_24052EDE0(0, v1, v2, v3, v4);
  }
  uint64_t v5 = *v0;
  return v5;
}

void sub_24052DBE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v7, OS_LOG_TYPE_DEFAULT, "Found primary apple account, no reason to follow up.", buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = _AALogSystem();
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_24052EE58((uint64_t)v6, v9);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_240524000, v9, OS_LOG_TYPE_DEFAULT, "No primary apple account found, following up with user!", v11, 2u);
      }

      objc_msgSend_postFollowUpWithIdentifier_userInfo_completion_(*(void **)(*(void *)(a1 + 32) + 8), v10, *MEMORY[0x263F25698], 0, 0);
    }
  }
}

void sub_24052DD0C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_24052EED0((uint64_t)v6, v7);
    }
LABEL_4:
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v5;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v10)
    {
      uint64_t v15 = v10;
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend_isActive(*(void **)(*((void *)&v24 + 1) + 8 * i), v11, v12, v13, v14))
          {

            uint64_t v7 = _AALogSystem();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v23 = 0;
              _os_log_impl(&dword_240524000, v7, OS_LOG_TYPE_DEFAULT, "Secondary accounts still present, leaving the follow up", v23, 2u);
            }
            goto LABEL_4;
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v24, (uint64_t)v28, 16);
        if (v15) {
          continue;
        }
        break;
      }
    }

    uint64_t v18 = _AALogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_240524000, v18, OS_LOG_TYPE_DEFAULT, "No active secondary accounts found, removing our follow up.", v23, 2u);
    }

    objc_msgSend__dismissStartUsingFollowUp(*(void **)(a1 + 32), v19, v20, v21, v22);
  }
}

void sub_24052E250(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend_aa_appleAccounts(*(void **)(a1 + 32), a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_aaf_firstObjectPassingTest_(v6, v7, (uint64_t)&unk_26F49EC88, v8, v9);

  uint64_t v11 = _AALogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v16 = 138412290;
      uint64_t v17 = v10;
      _os_log_impl(&dword_240524000, v11, OS_LOG_TYPE_DEFAULT, "Found another account needing terms: %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend_postFollowUpWithIdentifier_forAccount_userInfo_completion_(*(void **)(*(void *)(a1 + 40) + 8), v13, *MEMORY[0x263F256A0], (uint64_t)v10, 0, 0);
  }
  else
  {
    if (v12)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_240524000, v11, OS_LOG_TYPE_DEFAULT, "No other accounts need terms, dismissing...", (uint8_t *)&v16, 2u);
    }

    objc_msgSend_dismissFollowUpWithIdentifier_completion_(*(void **)(*(void *)(a1 + 40) + 8), v14, *MEMORY[0x263F256A0], 0, v15);
  }
}

uint64_t sub_24052E3A0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend_aa_needsToVerifyTerms(v2, v3, v4, v5, v6)) {
    uint64_t hasOptionalTerms = 1;
  }
  else {
    uint64_t hasOptionalTerms = objc_msgSend_aa_hasOptionalTerms(v2, v7, v8, v9, v10);
  }

  return hasOptionalTerms;
}

void sub_24052E480(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263EFB000];
  v13[0] = *MEMORY[0x263EFAEE0];
  v13[1] = v6;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v13, 2, a5);
  uint64_t v11 = objc_msgSend_setWithArray_(v5, v8, (uint64_t)v7, v9, v10);
  BOOL v12 = (void *)qword_268C87C08;
  qword_268C87C08 = v11;
}

void sub_24052E5E0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_240524000, a2, OS_LOG_TYPE_ERROR, "AppleAccount for %@ is not on disk. Unable to assign parent. Stopping.", (uint8_t *)&v2, 0xCu);
}

void sub_24052E658(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *CoreFollowUpLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"AABridgeFollowUpController.m", 19, @"%s", *a1);

  __break(1u);
}

void sub_24052E6D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getFLFollowUpControllerClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"AABridgeFollowUpController.m", 20, @"Unable to find class %s", "FLFollowUpController");

  __break(1u);
}

void sub_24052E754()
{
  sub_24052D084();
  sub_24052D090(&dword_240524000, v0, v1, "This account has already been warmed up! Failing save.", v2, v3, v4, v5, v6);
}

void sub_24052E788()
{
  sub_24052D084();
  sub_24052D090(&dword_240524000, v0, v1, "Found an existing AppleAccount with matching IDs, bailing!", v2, v3, v4, v5, v6);
}

void sub_24052E7BC()
{
  sub_24052D0C8();
  sub_24052D0D4(&dword_240524000, v0, v1, "Found an existing primary account (%@), failing new account save!", v2, v3, v4, v5, v6);
}

void sub_24052E824()
{
  sub_24052D0C8();
  sub_24052D0D4(&dword_240524000, v0, v1, "Account %{public}@ is not valid, missing username!", v2, v3, v4, v5, v6);
}

void sub_24052E88C()
{
  sub_24052D0C8();
  sub_24052D0D4(&dword_240524000, v0, v1, "Account %{public}@ is not valid, missing altDSID!", v2, v3, v4, v5, v6);
}

void sub_24052E8F4(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend_aa_accountClass(a1, a2, a3, a4, a5);
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_240524000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Updated account class for account: %@ (%@)", (uint8_t *)&v8, 0x16u);
}

void sub_24052E9A4()
{
  sub_24052D084();
  sub_24052D0AC(&dword_240524000, v0, v1, "Clear Apple Account Information Properties in AAPrefsDomain.", v2, v3, v4, v5, v6);
}

void sub_24052E9D8()
{
  sub_24052D084();
  sub_24052D0AC(&dword_240524000, v0, v1, "Not setting AppleAccountInformationCache values", v2, v3, v4, v5, v6);
}

void sub_24052EA0C()
{
  sub_24052D084();
  sub_24052D0AC(&dword_240524000, v0, v1, "Profile picture cache deleted successfully.", v2, v3, v4, v5, v6);
}

void sub_24052EA40(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend_localizedDescription(a1, a2, a3, a4, a5);
  sub_24052D0C8();
  _os_log_error_impl(&dword_240524000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Profile picture cache could not be deleted. Error: %@", v7, 0xCu);
}

void sub_24052EAD4()
{
  sub_24052D084();
  sub_24052D090(&dword_240524000, v0, v1, "Profile picture cache does not exist.", v2, v3, v4, v5, v6);
}

void sub_24052EB08()
{
  sub_24052D084();
  sub_24052D0AC(&dword_240524000, v0, v1, "isSignedIn is true. Not writing to cache", v2, v3, v4, v5, v6);
}

void sub_24052EB3C()
{
  sub_24052D084();
  sub_24052D090(&dword_240524000, v0, v1, "Creation date is nil for comparison.", v2, v3, v4, v5, v6);
}

void sub_24052EB70()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_24052D0C8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_240524000, v1, OS_LOG_TYPE_ERROR, "Error deleting unsupported account (%@): %@", v2, 0x16u);
}

void sub_24052EBF4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint8_t v6 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  __int16 v10 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)"void *SetupAssistantLibrary(void)", v8, v9);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, (uint64_t)v10, @"AASetupAssistantSoftLink.m", 12, @"%s", *a1);

  __break(1u);
}

void sub_24052EC74(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"BOOL SBYSetupAssistantIsRunningSilentTokenUpgrade(void)", v7, v8);
  __int16 v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AASetupAssistantSoftLink.m", 13, @"%s", v10);

  __break(1u);
}

void sub_24052ECEC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"BOOL SBYSetupAssistantHasCompletedInitialRun(void)", v7, v8);
  __int16 v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AASetupAssistantSoftLink.m", 14, @"%s", v10);

  __break(1u);
}

void sub_24052ED64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"Class getBYFlowSkipControllerClass(void)_block_invoke", v7, v8);
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v10, (uint64_t)v9, @"AASetupAssistantSoftLink.m", 17, @"Unable to find class %s", "BYFlowSkipController");

  __break(1u);
}

void sub_24052EDE0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, a3, a4, a5);
  uint64_t v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)"typeof (((typeof (BYFlowSkipIdentifierAppleID) (*)(void))0)()) getBYFlowSkipIdentifierAppleID(void)", v7, v8);
  __int16 v10 = dlerror();
  objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v5, v11, (uint64_t)v9, @"AASetupAssistantSoftLink.m", 18, @"%s", v10);

  __break(1u);
}

void sub_24052EE58(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_240524000, a2, OS_LOG_TYPE_ERROR, "Failed to query for primary account, error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_24052EED0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_240524000, a2, OS_LOG_TYPE_ERROR, "Failed to determine if we have any secondary accounts, error: %@", (uint8_t *)&v2, 0xCu);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t _AALogSystem()
{
  return MEMORY[0x270F0CE28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}
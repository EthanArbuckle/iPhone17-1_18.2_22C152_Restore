uint64_t sub_240502240(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v2 = objc_alloc(MEMORY[0x263F08B88]);
  v4 = objc_msgSend_initWithTarget_selector_object_(v2, v3, *(void *)(a1 + 32), sel_parkBackgroundThread_, 0);
  v5 = (void *)qword_268C877A8;
  qword_268C877A8 = v4;

  v7 = qword_268C877A8;
  return MEMORY[0x270F9A6D0](v7, sel_start, v6);
}

uint64_t sub_2405029A0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_discoverInitialPropertiesWithConsumer_, *(void *)(a1 + 40));
}

void sub_240502D34(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_240500000, v2, v3, "Delaying release of account %@ by terrible means", (uint8_t *)&v5, 0xCu);
  }
}

void sub_240503210(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 32);
  if (a2 != (const char *)1)
  {
    char isAuthenticated = objc_msgSend_isAuthenticated(v4, a2, a3);
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = sub_2405038E8;
    v71[3] = &unk_2650BCD08;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v72 = v8;
    uint64_t v73 = v9;
    id v74 = *(id *)(a1 + 32);
    id v75 = *(id *)(a1 + 56);
    char v77 = isAuthenticated;
    id v76 = *(id *)(a1 + 64);
    v12 = (void *)MEMORY[0x2455E98C0](v71);
    if (a2 == (const char *)2)
    {
      if (!*(unsigned char *)(a1 + 72))
      {
        v13 = DALoggingwithCategory();
        os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
        if (!os_log_type_enabled(v13, v14))
        {
LABEL_24:

          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          goto LABEL_25;
        }
        v15 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v79 = v15;
        v16 = "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@ Networking Error";
LABEL_23:
        _os_log_impl(&dword_240500000, v13, v14, v16, buf, 0xCu);
        goto LABEL_24;
      }
    }
    else if (!*(unsigned char *)(a1 + 72))
    {
      if (!objc_msgSend_isAuthenticated(*(void **)(a1 + 32), v10, v11))
      {
        if (!*(unsigned char *)(a1 + 73))
        {
          uint64_t v40 = *MEMORY[0x263F3B980];
          objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v31, *MEMORY[0x263F3B980]);
          v41 = (char *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend__currentDateString(*(void **)(a1 + 48), v42, v43);
          v45 = DALoggingwithCategory();
          uint64_t v46 = MEMORY[0x263F38F90];
          os_log_type_t v47 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
          if (os_log_type_enabled(v45, v47))
          {
            v48 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            v79 = v48;
            __int16 v80 = 2112;
            v81 = v41;
            __int16 v82 = 2112;
            v83 = v44;
            _os_log_impl(&dword_240500000, v45, v47, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Last prompt date %@. Current date %@", buf, 0x20u);
          }

          if (v41 && objc_msgSend_isEqualToString_(v44, v49, (uint64_t)v41))
          {
            v50 = DALoggingwithCategory();
            os_log_type_t v51 = *(unsigned char *)(v46 + 3);
            if (os_log_type_enabled(v50, v51))
            {
              v52 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v79 = v52;
              _os_log_impl(&dword_240500000, v50, v51, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Not presenting an Auth prompt.", buf, 0xCu);
            }

            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          else
          {
            v53 = DALoggingwithCategory();
            os_log_type_t v54 = *(unsigned char *)(v46 + 3);
            if (os_log_type_enabled(v53, v54))
            {
              v55 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v79 = v55;
              _os_log_impl(&dword_240500000, v53, v54, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Presenting an Auth prompt.", buf, 0xCu);
            }

            objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v56, (uint64_t)v44, v40);
            v57 = *(void **)(a1 + 56);
            uint64_t v58 = *(void *)(a1 + 32);
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = sub_240503AE8;
            v60[3] = &unk_2650BCD80;
            id v61 = v12;
            objc_msgSend_saveAccount_withHandler_(v57, v59, v58, v60);
          }
          goto LABEL_25;
        }
        v13 = DALoggingwithCategory();
        os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
        if (!os_log_type_enabled(v13, v14)) {
          goto LABEL_24;
        }
        v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v79 = v39;
        v16 = "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Reporting Credential failed error back.";
        goto LABEL_23;
      }
      v32 = DALoggingwithCategory();
      os_log_type_t v33 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v32, v33))
      {
        v34 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v79 = v34;
        _os_log_impl(&dword_240500000, v32, v33, "Authenticator FAILED Trying To Refresh OAuth2 credentials for account %@. Marking Account as UnAuthenticated and Saving.", buf, 0xCu);
      }

      objc_msgSend_setAuthenticated_(*(void **)(a1 + 32), v35, 0);
      v36 = *(void **)(a1 + 56);
      uint64_t v37 = *(void *)(a1 + 32);
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = sub_240503AB8;
      v62[3] = &unk_2650BCD58;
      char v65 = *(unsigned char *)(a1 + 73);
      id v63 = v12;
      id v64 = *(id *)(a1 + 64);
      objc_msgSend_saveAccount_withHandler_(v36, v38, v37, v62);

      v30 = v63;
LABEL_15:

LABEL_25:
      return;
    }
    if (!objc_msgSend_migrationStatus(*(void **)(a1 + 32), v10, v11)) {
      objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v17, 3);
    }
    v18 = DALoggingwithCategory();
    os_log_type_t v19 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v18, v19))
    {
      v22 = *(void **)(a1 + 32);
      v23 = objc_msgSend_migrationStatusString(v22, v20, v21);
      *(_DWORD *)buf = 138412802;
      v79 = v22;
      __int16 v80 = 2048;
      v81 = a2;
      __int16 v82 = 2112;
      v83 = v23;
      _os_log_impl(&dword_240500000, v18, v19, "Authenticator FAILED to migrate the account %@, saving with status %lu, migration state: %@", buf, 0x20u);
    }
    v24 = *(void **)(a1 + 56);
    v25 = *(void **)(a1 + 32);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = sub_240503994;
    v66[3] = &unk_2650BCD30;
    id v26 = v25;
    uint64_t v27 = *(void *)(a1 + 48);
    v28 = *(void **)(a1 + 56);
    id v67 = v26;
    uint64_t v68 = v27;
    id v69 = v28;
    id v70 = *(id *)(a1 + 64);
    objc_msgSend_saveAccount_withHandler_(v24, v29, (uint64_t)v26, v66);

    v30 = v67;
    goto LABEL_15;
  }
  objc_msgSend_setCredential_(v4, (const char *)1, a3);
  int v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  v5();
}

void sub_2405038E8(uint64_t a1, const char *a2)
{
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), a2, *MEMORY[0x263EFB378]);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  os_log_type_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = objc_msgSend_client(*(void **)(a1 + 56), v5, v6);
  v10 = objc_msgSend_localizedAppName(v7, v8, v9);
  objc_msgSend__displayBadCredentialsAlertForAccount_clientName_reason_accountStore_resetAuthenticatedOnAlertFailure_handler_(v3, v11, v4, v10, v12, *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 64));
}

void sub_240503994(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = @"with";
    if (!v4) {
      uint64_t v7 = @"without";
    }
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_240500000, v5, v6, "Account saved %@ error: %@", (uint8_t *)&v11, 0x16u);
  }

  if (objc_msgSend_migrationStatus(*(void **)(a1 + 32), v8, v9) == 1) {
    objc_msgSend__displayMigrationPendingAlertForAccount_accountStore_handler_(*(void **)(a1 + 40), v10, *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_240503AB8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_240503AE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240504188(uint64_t a1, const char *a2)
{
  os_log_type_t v3 = objc_msgSend_openIDrequestURLFor_(MEMORY[0x263F38920], a2, *(void *)(a1 + 32));
  os_log_type_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend__setNonAppInitiated_(v6, v7, 1);
  v10 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v8, v9);
  int v11 = *(void **)(a1 + 40);
  id v14 = objc_msgSend_identifier(*(void **)(a1 + 48), v12, v13);
  objc_msgSend__assignConnectionPropertiesToSessionConfiguration_withAccountId_(v11, v15, (uint64_t)v10, v14);

  v17 = objc_msgSend_sessionWithConfiguration_(MEMORY[0x263F08BF8], v16, (uint64_t)v10);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2405042C4;
  v22[3] = &unk_2650BCDD0;
  id v23 = *(id *)(a1 + 56);
  os_log_type_t v19 = objc_msgSend_dataTaskWithRequest_completionHandler_(v17, v18, (uint64_t)v6, v22);
  objc_msgSend_resume(v19, v20, v21);
}

void sub_2405042C4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (objc_class *)MEMORY[0x263F38928];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 alloc];
  id v35 = (id)objc_msgSend_initWithData_urlResponse_error_(v11, v12, (uint64_t)v10, v9, v8);

  v17 = objc_msgSend_error(v35, v13, v14);
  if (v17) {
    goto LABEL_2;
  }
  uint64_t v22 = objc_msgSend_tokenRequestURI(v35, v15, v16);
  if (!v22) {
    goto LABEL_3;
  }
  v17 = (void *)v22;
  uint64_t v23 = objc_msgSend_jwksURI(v35, v18, v19);
  if (!v23)
  {
LABEL_2:

LABEL_3:
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = objc_msgSend_error(v35, v18, v19);
    (*(void (**)(uint64_t, void, void, void, void *))(v20 + 16))(v20, 0, 0, 0, v21);
    goto LABEL_4;
  }
  id v26 = (void *)v23;
  uint64_t v27 = objc_msgSend_issuer(v35, v24, v25);

  if (!v27) {
    goto LABEL_3;
  }
  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v21 = objc_msgSend_tokenRequestURI(v35, v18, v19);
  v31 = objc_msgSend_jwksURI(v35, v29, v30);
  v34 = objc_msgSend_issuer(v35, v32, v33);
  (*(void (**)(uint64_t, void *, void *, void *, void))(v28 + 16))(v28, v21, v31, v34, 0);

LABEL_4:
}

void sub_240504560(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F089E0]);
  id v3 = objc_alloc(MEMORY[0x263EFFA30]);
  uint64_t v5 = objc_msgSend_initWithString_(v3, v4, *(void *)(a1 + 32));
  uint64_t v7 = objc_msgSend_initWithURL_(v2, v6, (uint64_t)v5);

  objc_msgSend__setNonAppInitiated_(v7, v8, 1);
  id v11 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v9, v10);
  id v12 = *(void **)(a1 + 40);
  uint64_t v15 = objc_msgSend_identifier(*(void **)(a1 + 48), v13, v14);
  objc_msgSend__assignConnectionPropertiesToSessionConfiguration_withAccountId_(v12, v16, (uint64_t)v11, v15);

  v18 = objc_msgSend_sessionWithConfiguration_(MEMORY[0x263F08BF8], v17, (uint64_t)v11);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_2405046B4;
  v23[3] = &unk_2650BCDD0;
  id v24 = *(id *)(a1 + 56);
  uint64_t v20 = objc_msgSend_dataTaskWithRequest_completionHandler_(v18, v19, (uint64_t)v7, v23);
  objc_msgSend_resume(v20, v21, v22);
}

uint64_t sub_2405046B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2405047E0(uint64_t a1, const char *a2)
{
  id v3 = objc_msgSend_emptyBearerRequestForHost_(MEMORY[0x263F38930], a2, *(void *)(a1 + 32));
  os_log_type_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend__setNonAppInitiated_(v6, v7, 1);
  uint64_t v10 = objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x263F08C00], v8, v9);
  id v11 = *(void **)(a1 + 40);
  uint64_t v14 = objc_msgSend_identifier(*(void **)(a1 + 48), v12, v13);
  objc_msgSend__assignConnectionPropertiesToSessionConfiguration_withAccountId_(v11, v15, (uint64_t)v10, v14);

  v17 = objc_msgSend_sessionWithConfiguration_(MEMORY[0x263F08BF8], v16, (uint64_t)v10);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_24050491C;
  v22[3] = &unk_2650BCDD0;
  id v23 = *(id *)(a1 + 56);
  uint64_t v19 = objc_msgSend_dataTaskWithRequest_completionHandler_(v17, v18, (uint64_t)v6, v22);
  objc_msgSend_resume(v19, v20, v21);
}

void sub_24050491C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (objc_class *)MEMORY[0x263F38938];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 alloc];
  id v17 = (id)objc_msgSend_initWithData_urlResponse_error_(v11, v12, (uint64_t)v10, v9, v8);

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v16 = objc_msgSend_authURI(v17, v14, v15);
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v16, v8);
}

void sub_240505338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_24050538C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x263F38910];
  id v9 = a3;
  id v10 = a2;
  id v11 = [v8 alloc];
  uint64_t v13 = objc_msgSend_initWithData_urlResponse_error_(v11, v12, (uint64_t)v10, v9, v7);

  v18 = objc_msgSend_error(v13, v14, v15);
  if (v18 || objc_msgSend_statusCode(v13, v16, v17) != 200)
  {

    goto LABEL_8;
  }
  uint64_t v21 = objc_msgSend_accessToken(v13, v19, v20);
  if (!v21
    || (id v24 = (void *)v21,
        objc_msgSend_idToken(v13, v22, v23),
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24,
        !v25))
  {
LABEL_8:
    if (objc_msgSend_statusCode(v13, v22, v23) >= 400 && objc_msgSend_statusCode(v13, v35, v36) <= 499)
    {
      if (objc_msgSend_migrationStatus(*(void **)(a1 + 32), v35, v36))
      {
        os_log_type_t v39 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
      }
      else
      {
        char v65 = objc_msgSend_errorName(v13, v37, v38);
        int isEqualToString = objc_msgSend_isEqualToString_(v65, v66, (uint64_t)@"invalid_grant");

        uint64_t v68 = DALoggingwithCategory();
        os_log_type_t v39 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
        BOOL v69 = os_log_type_enabled(v68, v39);
        if (isEqualToString)
        {
          if (v69)
          {
            id v72 = objc_msgSend_errorName(v13, v70, v71);
            id v75 = objc_msgSend_errorMessage(v13, v73, v74);
            *(_DWORD *)buf = 138412546;
            id v151 = v72;
            __int16 v152 = 2112;
            uint64_t v153 = (uint64_t)v75;
            _os_log_impl(&dword_240500000, v68, v39, "Received an invalid_grant error. %@ %@", buf, 0x16u);
          }
          id v76 = DALoggingwithCategory();
          if (os_log_type_enabled(v76, v39))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_240500000, v76, v39, "Switching migration status from 'Attempting' to 'Pending'", buf, 2u);
          }

          objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v77, 1);
        }
        else
        {
          if (v69)
          {
            v78 = objc_msgSend_errorName(v13, v70, v71);
            v81 = objc_msgSend_errorMessage(v13, v79, v80);
            *(_DWORD *)buf = 138412546;
            id v151 = v78;
            __int16 v152 = 2112;
            uint64_t v153 = (uint64_t)v81;
            _os_log_impl(&dword_240500000, v68, v39, "Received an error. %@ %@", buf, 0x16u);
          }
          __int16 v82 = DALoggingwithCategory();
          if (os_log_type_enabled(v82, v39))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_240500000, v82, v39, "Switching migration status from 'Attempting' to 'Failure'", buf, 2u);
          }

          objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v83, 3);
        }
      }
      objc_msgSend_setOauthRefreshToken_(*(void **)(a1 + 48), v37, 0);
      objc_msgSend_setCredential_(*(void **)(a1 + 32), v84, *(void *)(a1 + 48));
      v85 = DALoggingwithCategory();
      if (os_log_type_enabled(v85, v39))
      {
        *(_DWORD *)buf = 138412290;
        id v151 = v7;
        _os_log_impl(&dword_240500000, v85, v39, "Received an Error: refreshing OAuth Token failed with Error %@", buf, 0xCu);
      }

      uint64_t v86 = *(void *)(a1 + 32);
      v141[0] = MEMORY[0x263EF8330];
      v141[1] = 3221225472;
      v141[2] = sub_24050680C;
      v141[3] = &unk_2650BCD80;
      v87 = *(void **)(a1 + 56);
      id v142 = *(id *)(a1 + 64);
      objc_msgSend_saveAccount_withHandler_(v87, v88, v86, v141);
      id v64 = v142;
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v40 = objc_msgSend_error(v13, v35, v36);
    if (v40)
    {
    }
    else if (objc_msgSend_statusCode(v13, v41, v42) != 200)
    {
      v55 = DALoggingwithCategory();
      os_log_type_t v56 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
      if (os_log_type_enabled(v55, v56))
      {
        *(_DWORD *)buf = 138412290;
        id v151 = v7;
        _os_log_impl(&dword_240500000, v55, v56, "Received a response.error nil and response.status != 200. refreshing OAuth Token failed with Error %@", buf, 0xCu);
      }

      if (!objc_msgSend_migrationStatus(*(void **)(a1 + 32), v57, v58))
      {
        v59 = DALoggingwithCategory();
        if (os_log_type_enabled(v59, v56))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_240500000, v59, v56, "Switching migration status from 'Attempting' to 'Failure'", buf, 2u);
        }

        objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v60, 3);
      }
      uint64_t v61 = *(void *)(a1 + 32);
      v139[0] = MEMORY[0x263EF8330];
      v139[1] = 3221225472;
      v139[2] = sub_240506824;
      v139[3] = &unk_2650BCD80;
      v62 = *(void **)(a1 + 56);
      id v140 = *(id *)(a1 + 64);
      objc_msgSend_saveAccount_withHandler_(v62, v63, v61, v139);
      id v64 = v140;
      goto LABEL_45;
    }
    v45 = *(void **)(a1 + 40);
    uint64_t v46 = objc_msgSend_error(v13, v43, v44);
    int isTransientNetworkError = objc_msgSend__isTransientNetworkError_(v45, v47, (uint64_t)v46);

    v49 = DALoggingwithCategory();
    os_log_type_t v50 = *(unsigned char *)(MEMORY[0x263F38F90] + 4);
    BOOL v51 = os_log_type_enabled(v49, v50);
    if (isTransientNetworkError)
    {
      if (v51)
      {
        *(_DWORD *)buf = 138412290;
        id v151 = v7;
        _os_log_impl(&dword_240500000, v49, v50, "Received a Transient Network Error: refreshing OAuth Token failed with Error %@", buf, 0xCu);
      }

      os_log_type_t v54 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      goto LABEL_23;
    }
    if (v51)
    {
      *(_DWORD *)buf = 138412546;
      id v151 = v7;
      __int16 v152 = 2048;
      uint64_t v153 = objc_msgSend_code(v7, v52, v53);
      _os_log_impl(&dword_240500000, v49, v50, "Received a unknown error %@ with code %ld. Failing Token refresh", buf, 0x16u);
    }

LABEL_22:
    os_log_type_t v54 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_23:
    v54();
    goto LABEL_46;
  }
  id v26 = objc_msgSend_accountType(*(void **)(a1 + 32), v22, v23);
  v29 = objc_msgSend_identifier(v26, v27, v28);
  char v31 = objc_msgSend_isEqualToString_(v29, v30, *MEMORY[0x263EFAEF8]);

  if ((v31 & 1) == 0)
  {
    v89 = objc_msgSend_accountType(*(void **)(a1 + 32), v32, v33);
    v92 = objc_msgSend_identifier(v89, v90, v91);
    int v94 = objc_msgSend_isEqualToString_(v92, v93, *MEMORY[0x263EFAEB0]);

    if (v94)
    {
      if (*(unsigned char *)(a1 + 80))
      {
        objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v95, *MEMORY[0x263F3B970]);
      }
      else
      {
        uint64_t v104 = objc_msgSend__accountOAuthVersion_(*(void **)(a1 + 40), v95, *(void *)(a1 + 32));
        uint64_t v106 = *MEMORY[0x263F3B970];
        if (v104 != 1)
        {
          v107 = (void *)MEMORY[0x263F388F8];
          v108 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v105, *MEMORY[0x263F3B970]);
          v110 = objc_msgSend_upgradeAuthorizationEndpoint_(v107, v109, (uint64_t)v108);
          objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v111, (uint64_t)v110, v106);

          objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v112, (uint64_t)@"2", *MEMORY[0x263F3B978]);
        }
        objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v105, v106);
      }
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v34) {
        goto LABEL_57;
      }
      os_log_type_t v97 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    }
    else
    {
      v96 = DALoggingwithCategory();
      os_log_type_t v97 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v96, v97))
      {
        v100 = objc_msgSend_accountType(*(void **)(a1 + 32), v98, v99);
        v103 = objc_msgSend_identifier(v100, v101, v102);
        *(_DWORD *)buf = 138412290;
        id v151 = v103;
        _os_log_impl(&dword_240500000, v96, v97, "Account type is neither Hotmail nor Exchange. Account type: %@", buf, 0xCu);
      }
    }
    v138 = DALoggingwithCategory();
    if (os_log_type_enabled(v138, v97))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240500000, v138, v97, "Cannot refresh token for account. oauthURI is nil.", buf, 2u);
    }

    goto LABEL_22;
  }
  v34 = @"https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize/";
LABEL_57:
  if (*(unsigned char *)(a1 + 80))
  {
    v113 = DALoggingwithCategory();
    os_log_type_t v114 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v113, v114))
    {
      v115 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v151 = v115;
      _os_log_impl(&dword_240500000, v113, v114, "Successfully refreshed the OAuth token for on prem OAuth account %@", buf, 0xCu);
    }

    v118 = objc_msgSend_refreshToken(v13, v116, v117);
    if (!v118)
    {
      v119 = DALoggingwithCategory();
      if (os_log_type_enabled(v119, v114))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240500000, v119, v114, "Refresh OAuth token response does not contain a refresh token. Keeping the previous refresh token.", buf, 2u);
      }

      v118 = objc_msgSend_oauthRefreshToken(*(void **)(a1 + 48), v120, v121);
    }
    id v122 = objc_alloc(MEMORY[0x263EFB200]);
    v125 = objc_msgSend_accessToken(v13, v123, v124);
    v128 = objc_msgSend_expiryDate(v13, v126, v127);
    refreshed = objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(v122, v129, (uint64_t)v125, v118, v128);

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v132 = *(void *)(a1 + 32);
    v131 = *(void **)(a1 + 40);
    v143[0] = MEMORY[0x263EF8330];
    v143[1] = 3221225472;
    v143[2] = sub_240505E18;
    v143[3] = &unk_2650BCE48;
    id v148 = *(id *)(a1 + 64);
    id v144 = *(id *)(a1 + 32);
    id v133 = v13;
    uint64_t v134 = *(void *)(a1 + 40);
    id v145 = v133;
    uint64_t v146 = v134;
    uint64_t v135 = *(void *)(a1 + 72);
    v147 = v34;
    uint64_t v149 = v135;
    v136 = v34;
    objc_msgSend__retrieveOpenIDMetadataForAccount_fromURI_withCompletion_(v131, v137, v132, v136, v143);
  }
LABEL_46:
}

void sub_240505E18(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v14 = a5;
  if (v14)
  {
    uint64_t v15 = DALoggingwithCategory();
    os_log_type_t v16 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (!os_log_type_enabled(v15, v16))
    {
LABEL_5:

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_6;
    }
    uint64_t v17 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    v108 = v17;
    __int16 v109 = 2112;
    id v110 = v14;
    v18 = "Couldn't retrieve OpenID metadata from URI: %@ Error: %@";
    uint64_t v19 = v15;
    os_log_type_t v20 = v16;
    uint32_t v21 = 22;
LABEL_4:
    _os_log_impl(&dword_240500000, v19, v20, v18, buf, v21);
    goto LABEL_5;
  }
  if (!v10)
  {
    uint64_t v15 = DALoggingwithCategory();
    os_log_type_t v30 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (!os_log_type_enabled(v15, v30)) {
      goto LABEL_5;
    }
    *(_WORD *)buf = 0;
    v18 = "Cannot refresh token for account. jwksURI is nil.";
    uint64_t v19 = v15;
    os_log_type_t v20 = v30;
    uint32_t v21 = 2;
    goto LABEL_4;
  }
  uint64_t v22 = objc_msgSend_accountType(*(void **)(a1 + 32), v12, v13);
  uint64_t v25 = objc_msgSend_identifier(v22, v23, v24);
  char isEqualToString = objc_msgSend_isEqualToString_(v25, v26, *MEMORY[0x263EFAEB0]);

  if (isEqualToString)
  {
    objc_msgSend_clientIDForOAuthType_(MEMORY[0x263F388F0], v28, 1);
  }
  else
  {
    char v31 = objc_msgSend_accountType(*(void **)(a1 + 32), v28, v29);
    v34 = objc_msgSend_identifier(v31, v32, v33);
    char v36 = objc_msgSend_isEqualToString_(v34, v35, *MEMORY[0x263EFAEF8]);

    if ((v36 & 1) == 0)
    {
      uint64_t v15 = DALoggingwithCategory();
      os_log_type_t v82 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v15, v82))
      {
        v85 = *(void **)(a1 + 32);
        v95 = objc_msgSend_accountType(v85, v83, v84);
        v88 = objc_msgSend_identifier(v95, v86, v87);
        *(_DWORD *)buf = 138412546;
        v108 = v85;
        __int16 v109 = 2112;
        id v110 = v88;
        _os_log_impl(&dword_240500000, v15, v82, "Could not find account identifier %@ for account %@", buf, 0x16u);
      }
      goto LABEL_5;
    }
    objc_msgSend_clientIDForOAuthType_(MEMORY[0x263F388F0], v37, 0);
  uint64_t v38 = };
  int v94 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v39, *MEMORY[0x263F3B938]);
  id v40 = objc_alloc(MEMORY[0x263F38900]);
  uint64_t v43 = objc_msgSend_idToken(*(void **)(a1 + 40), v41, v42);
  v45 = objc_msgSend_initWithIdToken_(v40, v44, (uint64_t)v43);

  if (objc_msgSend__jwksDataCacheValidForAccount_(*(void **)(a1 + 48), v46, *(void *)(a1 + 32))
    && objc_msgSend_idTokenValidWithJWKS_withAudience_withIssuer_(v45, v47, (uint64_t)v94, v38, v11))
  {
    v92 = v38;
    v48 = DALoggingwithCategory();
    os_log_type_t v49 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
    if (os_log_type_enabled(v48, v49))
    {
      os_log_type_t v50 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v108 = v50;
      _os_log_impl(&dword_240500000, v48, v49, "Successfully refreshed the OAuth token for Account %@", buf, 0xCu);
    }

    id v51 = objc_alloc(MEMORY[0x263EFB200]);
    os_log_type_t v54 = objc_msgSend_accessToken(*(void **)(a1 + 40), v52, v53);
    v57 = objc_msgSend_refreshToken(*(void **)(a1 + 40), v55, v56);
    v60 = objc_msgSend_expiryDate(*(void **)(a1 + 40), v58, v59);
    refreshed = objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(v51, v61, (uint64_t)v54, v57, v60);

    if (!v11 || !v9 || !*(void *)(a1 + 56) || !v94)
    {
      v89 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v63, v64);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v89, v90, *(void *)(a1 + 72), *(void *)(a1 + 48), @"ESAccountAuthenticator.m", 541, @"We have used these objects to fetch and verify the tokens, neither of these should be empty");
    }
    uint64_t v91 = v45;
    if ((unint64_t)objc_msgSend_migrationStatus(*(void **)(a1 + 32), v63, v64) <= 1)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v65, MEMORY[0x263EFFA88], *MEMORY[0x263F38E58]);
      uint64_t v68 = objc_msgSend_username(*(void **)(a1 + 32), v66, v67);
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v69, (uint64_t)v68, *MEMORY[0x263EFADB0]);

      objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v70, 2);
    }
    uint64_t v71 = *(void **)(a1 + 32);
    id v72 = *(void **)(a1 + 48);
    uint64_t v73 = *(void *)(a1 + 56);
    uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v71, v65, *MEMORY[0x263F3B948]);
    objc_msgSend__addPropertiesToAccount_oauthURI_tokenRequestURI_jwksURI_issuer_oauthVersion_jwksData_jwksDataCacheDate_(v72, v75, (uint64_t)v71, v73, v9, v10, v11, @"2", v94, v74);

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    v45 = v91;
    uint64_t v38 = v92;
  }
  else
  {
    id v76 = *(void **)(a1 + 48);
    uint64_t v77 = *(void *)(a1 + 32);
    v96[0] = MEMORY[0x263EF8330];
    v96[1] = 3221225472;
    v96[2] = sub_240506478;
    v96[3] = &unk_2650BCE20;
    id v97 = v45;
    id v98 = v38;
    id v99 = v11;
    id v100 = *(id *)(a1 + 32);
    id v101 = *(id *)(a1 + 40);
    id v102 = *(id *)(a1 + 56);
    id v103 = v9;
    id v78 = v10;
    uint64_t v79 = *(void *)(a1 + 48);
    id v104 = v78;
    uint64_t v105 = v79;
    long long v93 = *(_OWORD *)(a1 + 64);
    id v80 = (id)v93;
    long long v106 = v93;
    objc_msgSend__retrieveJWKSDataForAccount_fromURI_withCompletion_(v76, v81, v77, v78, v96);

    refreshed = v97;
  }

LABEL_6:
}

void sub_240506478(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = DALoggingwithCategory();
    os_log_type_t v9 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = *(void *)(a1 + 88);
      *(_DWORD *)buf = 138412546;
      uint64_t v58 = v10;
      __int16 v59 = 2112;
      id v60 = v7;
      id v11 = "Couldn't retrieve JWKS data from URI: %@ Error: %@";
      id v12 = v8;
      os_log_type_t v13 = v9;
      uint32_t v14 = 22;
LABEL_17:
      _os_log_impl(&dword_240500000, v12, v13, v11, buf, v14);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  int v15 = objc_msgSend_idTokenValidWithJWKS_withAudience_withIssuer_(*(void **)(a1 + 32), v6, (uint64_t)v5, *(void *)(a1 + 40), *(void *)(a1 + 48));
  os_log_type_t v16 = DALoggingwithCategory();
  id v8 = v16;
  if (!v15)
  {
    int v52 = *(unsigned __int8 *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v16, *(os_log_type_t *)(MEMORY[0x263F38F90] + 3)))
    {
      *(_WORD *)buf = 0;
      id v11 = "Could not validate the id_token received from the server";
      id v12 = v8;
      os_log_type_t v13 = v52;
      uint32_t v14 = 2;
      goto LABEL_17;
    }
LABEL_18:

    (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    goto LABEL_19;
  }
  os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    uint64_t v58 = v18;
    _os_log_impl(&dword_240500000, v8, v17, "Successfully refreshed the OAuth token for Account %@", buf, 0xCu);
  }

  id v19 = objc_alloc(MEMORY[0x263EFB200]);
  uint64_t v22 = objc_msgSend_accessToken(*(void **)(a1 + 64), v20, v21);
  uint64_t v25 = objc_msgSend_refreshToken(*(void **)(a1 + 64), v23, v24);
  uint64_t v28 = objc_msgSend_expiryDate(*(void **)(a1 + 64), v26, v27);
  refreshed = objc_msgSend_initWithOAuth2Token_refreshToken_expiryDate_(v19, v29, (uint64_t)v22, v25, v28);

  if (!*(void *)(a1 + 72) || !*(void *)(a1 + 80) || !*(void *)(a1 + 88) || !v5 || !*(void *)(a1 + 48))
  {
    uint64_t v53 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v30, v31);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, *(void *)(a1 + 112), *(void *)(a1 + 96), @"ESAccountAuthenticator.m", 571, @"We have used these objects to fetch and verify the tokens, neither of these should be empty");
  }
  if ((unint64_t)objc_msgSend_migrationStatus(*(void **)(a1 + 56), v30, v31) <= 1)
  {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 56), v32, MEMORY[0x263EFFA88], *MEMORY[0x263F38E58]);
    char v36 = objc_msgSend_username(*(void **)(a1 + 56), v34, v35);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 56), v37, (uint64_t)v36, *MEMORY[0x263EFADB0]);

    objc_msgSend_setMigrationStatus_(*(void **)(a1 + 56), v38, 2);
  }
  uint64_t v39 = *(void *)(a1 + 80);
  uint64_t v55 = *(void *)(a1 + 72);
  uint64_t v41 = *(void *)(a1 + 88);
  id v40 = *(void **)(a1 + 96);
  uint64_t v43 = *(void *)(a1 + 48);
  uint64_t v42 = *(void *)(a1 + 56);
  uint64_t v44 = (void *)MEMORY[0x263F08A18];
  v45 = objc_msgSend_date(MEMORY[0x263EFF910], v32, v33);
  objc_msgSend_timeIntervalSince1970(v45, v46, v47);
  os_log_type_t v50 = objc_msgSend_numberWithDouble_(v44, v48, v49);
  objc_msgSend__addPropertiesToAccount_oauthURI_tokenRequestURI_jwksURI_issuer_oauthVersion_jwksData_jwksDataCacheDate_(v40, v51, v42, v55, v39, v41, v43, @"2", v5, v50);

  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
LABEL_19:
}

uint64_t sub_24050680C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_240506824(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_24050683C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_24050684C(uint64_t a1)
{
}

void sub_240506854(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v6, (uint64_t)v5, *MEMORY[0x263F3B970]);
    }
    else
    {
      id v11 = objc_msgSend_upgradeAuthorizationEndpoint_(MEMORY[0x263F388F8], v6, (uint64_t)v5);
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v12, (uint64_t)v11, *MEMORY[0x263F3B970]);
    }
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v8, (uint64_t)@"2", *MEMORY[0x263F3B978]);
    os_log_type_t v13 = *(void **)(a1 + 32);
    uint32_t v14 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_2405069F4;
    v18[3] = &unk_2650BCE98;
    id v15 = v13;
    char v23 = *(unsigned char *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 64);
    id v19 = v15;
    uint64_t v22 = v16;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    objc_msgSend__retrieveOpenIDMetadataForAccount_fromURI_withCompletion_(v14, v17, (uint64_t)v15, v5, v18);
  }
  else
  {
    objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v6, 3);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
}

void sub_2405069F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    objc_msgSend_upgradeTokenEndpoint_(MEMORY[0x263F388F8], v4, (uint64_t)v3);
    id v45 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc_init(MEMORY[0x263F08BA0]);
    objc_msgSend_setScheme_(v6, v7, (uint64_t)@"https");
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v8, *MEMORY[0x263F38E30]);
    objc_msgSend_setHost_(v6, v10, (uint64_t)v9);

    os_log_type_t v13 = objc_msgSend_URL(v6, v11, v12);
    uint64_t v16 = objc_msgSend_absoluteString(v13, v14, v15);
    uint64_t v17 = *MEMORY[0x263F3B8E8];
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v18, (uint64_t)v16, *MEMORY[0x263F3B8E8]);

    id v21 = objc_msgSend_URL(v6, v19, v20);
    uint64_t v24 = objc_msgSend_absoluteString(v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v25, (uint64_t)v24, *MEMORY[0x263F3B8E0]);

    id v26 = (void *)MEMORY[0x263F388F0];
    uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v27, v17);
    os_log_type_t v30 = objc_msgSend_defaultScopeForOAuthType_withResourceIdentifier_isOnPrem_(v26, v29, 1, v28, *(unsigned __int8 *)(a1 + 64));

    uint64_t v31 = (void *)MEMORY[0x263F388E8];
    v34 = objc_msgSend_username(*(void **)(a1 + 32), v32, v33);
    uint64_t v37 = objc_msgSend_password(*(void **)(a1 + 40), v35, v36);
    uint64_t v39 = objc_msgSend_urlRequestForOAuthTokenFromUsername_tokenRequestURI_password_scope_(v31, v38, (uint64_t)v34, v45, v37, v30);
    uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v41 = *(void **)(v40 + 40);
    *(void *)(v40 + 40) = v39;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend_setMigrationStatus_(*(void **)(a1 + 32), v4, 3);
    uint64_t v42 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v43 = *(void **)(v42 + 40);
    *(void *)(v42 + 40) = 0;

    uint64_t v44 = *(NSObject **)(a1 + 48);
    dispatch_semaphore_signal(v44);
  }
}

void sub_240507948(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_backgroundThread(v4, a2, a3);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_240507A5C;
  v10[3] = &unk_2650BCF10;
  v10[4] = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v9;
  long long v13 = v9;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 72);
  id v7 = (void *)MEMORY[0x2455E98C0](v10);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(v4, v8, (uint64_t)sel_invokeAndReleaseBlock_, v5, v7, 0);
}

void sub_240507A5C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F3B8C0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_240507B40;
  v5[3] = &unk_2650BCEE8;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 72);
  objc_msgSend_showUserNotification_groupIdentifier_withCompletionBlock_(v2, v4, v3, 0, v5);
  CFRelease(*(CFTypeRef *)(a1 + 64));
}

uint64_t sub_240507B40(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__handlePasswordNotification_response_callback_account_accountStore_resetAuthenticatedOnAlertFailure_, a2);
}

uint64_t sub_240507B5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240508214(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      objc_msgSend_setAuthenticated_(*(void **)(a1 + 32), a2, 1);
      uint64_t v7 = *(void *)(a1 + 32);
      id v6 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = sub_2405084B8;
      v24[3] = &unk_2650BCF38;
      id v25 = *(id *)(a1 + 48);
      uint64_t v26 = 2;
      objc_msgSend_saveAccount_withHandler_(v6, v8, v7, v24);

      return;
    }
  }
  else
  {
    if (a3)
    {
      char v9 = DALoggingwithCategory();
      os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240500000, v9, v10, "User requested transfer to settings from OAuth authentication alert", buf, 2u);
      }

      id v11 = (void *)MEMORY[0x263EFFA30];
      id v12 = (void *)MEMORY[0x263F08B40];
      uint64_t v15 = objc_msgSend_identifier(*(void **)(a1 + 32), v13, v14);
      uint64_t v17 = objc_msgSend_stringWithFormat_(v12, v16, (uint64_t)@"prefs:root=MAIL&path=ACCOUNTS/%@&%@=%@", v15, @"easOAuthAction", @"showAuthSheet");
      id v4 = objc_msgSend_URLWithString_(v11, v18, (uint64_t)v17);

      id v19 = DALoggingwithCategory();
      if (os_log_type_enabled(v19, v10))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v4;
        _os_log_impl(&dword_240500000, v19, v10, "Launch URL : %@", buf, 0xCu);
      }

      uint64_t v22 = objc_msgSend_defaultWorkspace(MEMORY[0x263F01880], v20, v21);
      objc_msgSend_openSensitiveURL_withOptions_(v22, v23, (uint64_t)v4, 0);
    }
    else
    {
      id v4 = DALoggingwithCategory();
      os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 7);
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_240500000, v4, v5, "User cancelled out of Hotmail authentication alert", buf, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_2405084B8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_240508690(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t sub_240508BDC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x270EE54F0](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x270F25140]();
}

uint64_t DAShouldLogPassword()
{
  return MEMORY[0x270F25148]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            objc_msgSend_setCredentialForAccount_(v79, v83, (uint64_t)v82);

      v57 = 0;
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v84 = DALoggingwithCategory();
    if (os_log_type_enabled(v84, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240500000, v84, v18, "Password rejected because it is blank", buf, 2u);
    }

    goto LABEL_28;
  }
  if (!v8)
  {
LABEL_16:
    v57 = 2;
LABEL_30:
    v13[2](v13, v57, 0);
    goto LABEL_31;
  }
  id v25 = DALoggingwithCategory();
  uint64_t v26 = *(unsigned char *)(v17 + 4);
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v29 = objc_msgSend_backingAccountInfo(v14, v27, v28);
    v32 = objc_msgSend_identifier(v29, v30, v31);
    uint64_t v35 = objc_msgSend_backingAccountInfo(v14, v33, v34);
    uint64_t v38 = objc_msgSend_username(v35, v36, v37);
    *(_DWORD *)buf = 138412546;
    v89 = (unint64_t)v32;
    v90 = 2112;
    uint64_t v91 = v38;
    _os_log_impl(&dword_240500000, v25, v26, "Calling _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", buf, 0x16u);
  }
  uint64_t v41 = objc_msgSend_backingAccountInfo(v14, v39, v40);
  objc_msgSend_setAuthenticated_(v41, v42, 1);

  id v45 = objc_msgSend_backingAccountInfo(v14, v43, v44);
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = sub_240508BDC;
  v85[3] = &unk_2650BCF38;
  uint64_t v86 = v13;
  uint64_t v87 = 2;
  objc_msgSend_saveAccount_withHandler_(v15, v46, (uint64_t)v45, v85);

LABEL_31:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIDToAccount, 0);
  objc_storeStrong((id *)&self->_accountIDToVerificationHandler, 0);
}

@end
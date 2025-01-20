uint64_t sub_21E617790(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = (void *)qword_26AC13808;
  qword_26AC13808 = v2;

  v4 = BLDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = qword_26AC13808;
    _os_log_impl(&dword_21E616000, v4, OS_LOG_TYPE_DEFAULT, "[DownloadQueue]: using singelton instance: %@", (uint8_t *)&v8, 0xCu);
  }

  return objc_msgSend_overrideSharedInstance_(*(void **)(a1 + 32), v5, qword_26AC13808, v6);
}

id sub_21E617908()
{
  if (qword_267D3AFB0 != -1) {
    dispatch_once(&qword_267D3AFB0, &unk_26CF8F9E0);
  }
  v0 = (void *)qword_267D3AFA8;
  return v0;
}

uint64_t sub_21E61795C()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A48]);
  v1 = (void *)qword_267D3AFA8;
  qword_267D3AFA8 = (uint64_t)v0;

  objc_msgSend_setMaxConcurrentOperationCount_((void *)qword_267D3AFA8, v2, -1, v3);
  objc_msgSend_setQualityOfService_((void *)qword_267D3AFA8, v4, 25, v5);
  uint64_t v7 = qword_267D3AFA8;
  return MEMORY[0x270F9A6D0](v7, sel_setName_, @"com.apple.BookLibrary.NSOperationQueue.HLS", v6);
}

void sub_21E617BDC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_uiManagerDelegate(*(void **)(a1 + 32), a2, a3, a4);
  v9 = objc_msgSend_downloadQueue(*(void **)(a1 + 32), v6, v7, v8);
  v13 = objc_msgSend_request(*(void **)(a1 + 32), v10, v11, v12);
  v14 = BLDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl(&dword_21E616000, v14, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: most recent uiManagerDelegate: %@", buf, 0xCu);
  }

  if (!v5)
  {
LABEL_6:
    objc_msgSend__topMostViewController(*(void **)(a1 + 32), v15, v16, v17);
    v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_7:
    sub_21E619CD8();
    if (objc_opt_class())
    {
      if (v19)
      {
        v23 = BLDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v19;
          _os_log_impl(&dword_21E616000, v23, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: use in-process authenticate with presenter %@", buf, 0xCu);
        }

        sub_21E619CD8();
        id v24 = objc_alloc((Class)objc_opt_class());
        v26 = objc_msgSend_initWithRequest_presentingViewController_(v24, v25, *(void *)(a1 + 40), (uint64_t)v19);
        v30 = objc_msgSend_performAuthentication(v26, v27, v28, v29);
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = sub_21E617F00;
        v35[3] = &unk_2644B5560;
        id v36 = *(id *)(a1 + 48);
        objc_msgSend_addFinishBlock_(v30, v31, (uint64_t)v35, v32);
      }
      else
      {
        v30 = objc_msgSend_fallback(*(void **)(a1 + 32), v20, v21, v22);
        objc_msgSend_handleAuthenticateRequest_withReply_(v30, v34, *(void *)(a1 + 40), *(void *)(a1 + 48));
      }
    }
    else
    {
      v30 = BLDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E616000, v30, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link AMSUI!", buf, 2u);
      }
    }
    goto LABEL_19;
  }
  if (objc_msgSend_downloadQueue_shouldShowAuthenticateForRequest_(v5, v15, (uint64_t)v9, (uint64_t)v13))
  {
    objc_msgSend_downloadQueue_viewControllerToPresentAuthenticateUIForRequest_(v5, v18, (uint64_t)v9, (uint64_t)v13);
    v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v19) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v33 = BLDefaultLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E616000, v33, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: client rejected authenticate request.", buf, 2u);
  }

  v19 = (void (**)(void, void, void))MEMORY[0x223C2CBB0](*(void *)(a1 + 48));
  if (v19)
  {
    v30 = BLError();
    ((void (**)(void, void, NSObject *))v19)[2](v19, 0, v30);
LABEL_19:
  }
}

void sub_21E617F00(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C2CBB0](*(void *)(a1 + 32));
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

uint64_t sub_21E617F80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E6180E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_uiManagerDelegate(*(void **)(a1 + 32), a2, a3, a4);
  v9 = objc_msgSend_downloadQueue(*(void **)(a1 + 32), v6, v7, v8);
  uint64_t v16 = objc_msgSend_request(*(void **)(a1 + 32), v10, v11, v12);
  if (!v5)
  {
LABEL_4:
    objc_msgSend__topMostViewController(*(void **)(a1 + 32), v13, v14, v15);
    v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
LABEL_5:
    sub_21E619E14();
    if (objc_opt_class())
    {
      sub_21E619F50();
      if (objc_opt_class())
      {
        if (v18)
        {
          uint64_t v22 = BLDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v18;
            _os_log_impl(&dword_21E616000, v22, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use in-process dialog with presenter %@", buf, 0xCu);
          }

          sub_21E619E14();
          id v23 = objc_alloc((Class)objc_opt_class());
          v25 = objc_msgSend_initWithRequest_presentingViewController_(v23, v24, *(void *)(a1 + 40), (uint64_t)v18);
          uint64_t v29 = objc_msgSend_present(v25, v26, v27, v28);
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = sub_21E6183E0;
          v36[3] = &unk_2644B55D8;
          id v37 = *(id *)(a1 + 40);
          id v38 = *(id *)(a1 + 48);
          objc_msgSend_addFinishBlock_(v29, v30, (uint64_t)v36, v31);
        }
        else
        {
          v34 = objc_msgSend_fallback(*(void **)(a1 + 32), v19, v20, v21);
          objc_msgSend_handleDialogRequest_withReply_(v34, v35, *(void *)(a1 + 40), *(void *)(a1 + 48));
        }
        goto LABEL_18;
      }
    }
    uint64_t v32 = BLDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E616000, v32, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link AMSUI!", buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend_downloadQueue_shouldShowDialogForRequest_(v5, v13, (uint64_t)v9, (uint64_t)v16))
  {
    objc_msgSend_downloadQueue_viewControllerToPresentDialogUIForRequest_(v5, v17, (uint64_t)v9, (uint64_t)v16);
    v18 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (v18) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v33 = BLDefaultLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E616000, v33, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: client rejected dialog request.", buf, 2u);
  }

  v18 = (void (**)(void, void, void))MEMORY[0x223C2CBB0](*(void *)(a1 + 48));
  if (v18)
  {
    uint64_t v32 = BLError();
    ((void (**)(void, void, NSObject *))v18)[2](v18, 0, v32);
    goto LABEL_17;
  }
LABEL_18:
}

void sub_21E6183E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = BLDefaultLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v16 = 138412290;
    id v17 = v6;
    v9 = "[UIHostServiceProxy] received error from AMSSystemAlertDialogTask:  %@";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v13 = *(void **)(a1 + 32);
    int v16 = 138412546;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v5;
    v9 = "[UIHostServiceProxy] received result from AMSSystemAlertDialogTask for request %@ and calling replay block with result %@";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 22;
  }
  _os_log_impl(&dword_21E616000, v10, v11, v9, (uint8_t *)&v16, v12);
LABEL_7:

  uint64_t v14 = MEMORY[0x223C2CBB0](*(void *)(a1 + 40));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

uint64_t sub_21E618528(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E61868C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_uiManagerDelegate(*(void **)(a1 + 32), a2, a3, a4);
  v9 = objc_msgSend_downloadQueue(*(void **)(a1 + 32), v6, v7, v8);
  v13 = objc_msgSend_request(*(void **)(a1 + 32), v10, v11, v12);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = sub_21E61883C;
  uint64_t v27 = &unk_2644B5628;
  id v14 = v5;
  id v28 = v14;
  id v15 = v9;
  id v29 = v15;
  id v16 = v13;
  id v30 = v16;
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(a1 + 40);
  id v33 = v17;
  uint64_t v31 = v18;
  id v32 = v19;
  uint64_t v20 = (void (**)(void, void))MEMORY[0x223C2CBB0](&v24);
  if (!v14) {
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t shouldShowEngagementForRequest = objc_msgSend_downloadQueue_shouldShowEngagementForRequest_(v14, v22, (uint64_t)v15, (uint64_t)v16, v24, v25, v26, v27, v28, v29, v30, v31);
      v20[2](v20, shouldShowEngagementForRequest);
      goto LABEL_7;
    }
LABEL_6:
    v20[2](v20, 1);
    goto LABEL_7;
  }
  objc_msgSend_downloadQueue_shouldShowEngagementForRequest_engagementRequest_completion_(v14, v21, (uint64_t)v15, (uint64_t)v16, *(void *)(a1 + 40), v20, v24, v25, v26, v27, v28, v29, v30, v31);
LABEL_7:
}

void sub_21E61883C(uint64_t a1, const char *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a2)
  {
    objc_msgSend_downloadQueue_viewControllerToPresentEngagementUIForRequest_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
    id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend__topMostViewController(*(void **)(a1 + 56), v3, v4, v5);
      id v6 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    }
    sub_21E61A08C();
    if (objc_opt_class())
    {
      uint64_t v7 = BLDefaultLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v6;
          _os_log_impl(&dword_21E616000, v7, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: use in-process engagement with presenter %@", buf, 0xCu);
        }

        uint64_t v12 = objc_msgSend_defaultBag(MEMORY[0x263F2BA48], v9, v10, v11);
        sub_21E61A08C();
        id v13 = objc_alloc((Class)objc_opt_class());
        id v15 = objc_msgSend_initWithRequest_bag_presentingViewController_(v13, v14, *(void *)(a1 + 64), (uint64_t)v12, v6);
        objc_msgSend_presentEngagement(v15, v16, v17, v18);
        id v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E616000, v7, OS_LOG_TYPE_DEFAULT, "[UIHostServiceProxy]: Presenter not found for engagement request", buf, 2u);
        }

        id v23 = (void *)MEMORY[0x263F27E10];
        uint64_t v12 = BLError();
        objc_msgSend_promiseWithError_(v23, v24, (uint64_t)v12, v25);
        id v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      }

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_21E618B6C;
      v28[3] = &unk_2644B5600;
      id v29 = *(id *)(a1 + 72);
      objc_msgSend_addFinishBlock_(v19, v26, (uint64_t)v28, v27);
    }
    else
    {
      uint64_t v21 = BLDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E616000, v21, OS_LOG_TYPE_ERROR, "[UIHostServiceProxy]: failed to soft link AMSUI!", buf, 2u);
      }

      id v19 = (void (**)(void, void, void))MEMORY[0x223C2CBB0](*(void *)(a1 + 72));
      if (v19)
      {
        uint64_t v22 = BLError();
        ((void (**)(void, void, void *))v19)[2](v19, 0, v22);
      }
    }
    goto LABEL_21;
  }
  uint64_t v20 = BLDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E616000, v20, OS_LOG_TYPE_DEBUG, "[UIHostServiceProxy]: client rejected engagement request.", buf, 2u);
  }

  id v6 = (void (**)(void, void, void))MEMORY[0x223C2CBB0](*(void *)(a1 + 72));
  if (v6)
  {
    BLError();
    id v19 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v19);
LABEL_21:
  }
}

void sub_21E618B6C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C2CBB0](*(void *)(a1 + 32));
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

uint64_t sub_21E618BEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E618E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E618E1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E618E2C(uint64_t a1)
{
}

void sub_21E618E34(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  sub_21E619460();
  v2 = objc_opt_class();
  uint64_t v6 = objc_msgSend_sharedApplication(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_connectedScenes(v6, v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v75, (uint64_t)v79, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v76;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v76 != v17) {
          objc_enumerationMutation(v10);
        }
        id v19 = *(void **)(*((void *)&v75 + 1) + 8 * v18);
        if (!objc_msgSend_activationState(v19, v13, v14, v15))
        {
          uint64_t v20 = objc_msgSend_session(v19, v13, v14, v15);
          uint64_t v24 = objc_msgSend_role(v20, v21, v22, v23);
          uint64_t v25 = sub_21E619A90();
          int isEqualToString = objc_msgSend_isEqualToString_(v24, v26, (uint64_t)v25, v27);

          if (isEqualToString)
          {
            id v29 = objc_msgSend_delegate(v19, v13, v14, v15);
            if ((objc_opt_respondsToSelector() & 1) == 0
              || (objc_msgSend_window(v29, v30, v31, v32),
                  id v33 = objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_rootViewController(v33, v34, v35, v36),
                  id v37 = (id)objc_claimAutoreleasedReturnValue(),
                  v33,
                  !v37))
            {
              id v41 = 0;
              goto LABEL_13;
            }
            if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
            {
              id v41 = v37;
LABEL_13:

              goto LABEL_14;
            }
            while (2)
            {
              v43 = objc_msgSend_presentedViewController(v37, v38, v39, v40);

              if (v43)
              {
                uint64_t v47 = objc_msgSend_presentedViewController(v37, v44, v45, v46);
                goto LABEL_31;
              }
              sub_21E61959C();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v47 = objc_msgSend_visibleViewController(v37, v48, v49, v50);
                goto LABEL_31;
              }
              sub_21E6196D8();
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v37 = v37;
                v74 = objc_msgSend_viewControllerForColumn_(v37, v51, 2, v52);
                v55 = objc_msgSend_viewControllerForColumn_(v37, v53, 3, v54);
                v59 = objc_msgSend_traitCollection(v37, v56, v57, v58);
                uint64_t v63 = v17;
                v64 = v29;
                uint64_t v65 = a1;
                v66 = v10;
                uint64_t v67 = objc_msgSend_horizontalSizeClass(v59, v60, v61, v62);

                if (v55) {
                  BOOL v68 = v67 == 1;
                }
                else {
                  BOOL v68 = 0;
                }
                uint64_t v10 = v66;
                a1 = v65;
                id v29 = v64;
                uint64_t v17 = v63;
                if (v68) {
                  v69 = v55;
                }
                else {
                  v69 = v74;
                }
                id v41 = v69;
              }
              else
              {
                sub_21E619814();
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v47 = objc_msgSend_selectedViewController(v37, v70, v71, v72);
LABEL_31:
                  id v41 = (id)v47;
                }
                else
                {
                  uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 8);
                  id v41 = v37;
                  id v37 = *(id *)(v42 + 40);
                  *(void *)(v42 + 40) = v41;
                }
              }

              id v37 = v41;
              if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
                goto LABEL_13;
              }
              continue;
            }
          }
        }
LABEL_14:
        ++v18;
      }
      while (v18 != v16);
      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v75, (uint64_t)v79, 16);
      uint64_t v16 = v73;
    }
    while (v73);
  }
}

uint64_t sub_21E61924C()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_267D3AFB8;
  uint64_t v5 = qword_267D3AFB8;
  if (!qword_267D3AFB8)
  {
    long long v6 = xmmword_2644B5670;
    long long v7 = *(_OWORD *)&off_2644B5680;
    v3[3] = _sl_dlopen();
    qword_267D3AFB8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21E61935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E619374(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3AFB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E619404()
{
  uint64_t v0 = sub_21E61924C();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_21E619460()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3AFC0;
  uint64_t v7 = qword_267D3AFC0;
  if (!qword_267D3AFC0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E619544;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E619544((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E619544(uint64_t a1)
{
  sub_21E619404();
  Class result = objc_getClass("UIApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E62172C();
  }
  qword_267D3AFC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61959C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3AFC8;
  uint64_t v7 = qword_267D3AFC8;
  if (!qword_267D3AFC8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E619680;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E619680((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E619668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E619680(uint64_t a1)
{
  sub_21E619404();
  Class result = objc_getClass("UINavigationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E621754();
  }
  qword_267D3AFC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E6196D8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3AFD0;
  uint64_t v7 = qword_267D3AFD0;
  if (!qword_267D3AFD0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E6197BC;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E6197BC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E6197A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E6197BC(uint64_t a1)
{
  sub_21E619404();
  Class result = objc_getClass("UISplitViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E62177C();
  }
  qword_267D3AFD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E619814()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3AFD8;
  uint64_t v7 = qword_267D3AFD8;
  if (!qword_267D3AFD8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E6198F8;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E6198F8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E6198E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E6198F8(uint64_t a1)
{
  sub_21E619404();
  Class result = objc_getClass("UITabBarController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E6217A4();
  }
  qword_267D3AFD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E619950()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_267D3AFE0;
  uint64_t v6 = qword_267D3AFE0;
  if (!qword_267D3AFE0)
  {
    id v1 = (void *)sub_21E619404();
    v4[3] = (uint64_t)dlsym(v1, "UIWindowSceneSessionRoleApplication");
    qword_267D3AFE0 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E619A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E619A40(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E619404();
  Class result = dlsym(v2, "UIWindowSceneSessionRoleApplication");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3AFE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E619A90()
{
  uint64_t v0 = (void **)sub_21E619950();
  if (!v0) {
    sub_21E6217CC();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_21E619AC4()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_267D3AFE8;
  uint64_t v5 = qword_267D3AFE8;
  if (!qword_267D3AFE8)
  {
    long long v6 = xmmword_2644B56B8;
    long long v7 = *(_OWORD *)&off_2644B56C8;
    v3[3] = _sl_dlopen();
    qword_267D3AFE8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21E619BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E619BEC(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3AFE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E619C7C()
{
  uint64_t v0 = sub_21E619AC4();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_21E619CD8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3AFF0;
  uint64_t v7 = qword_267D3AFF0;
  if (!qword_267D3AFF0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E619DBC;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E619DBC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E619DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E619DBC(uint64_t a1)
{
  sub_21E619C7C();
  Class result = objc_getClass("AMSUIAuthenticateTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E6217F0();
  }
  qword_267D3AFF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E619E14()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3AFF8;
  uint64_t v7 = qword_267D3AFF8;
  if (!qword_267D3AFF8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E619EF8;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E619EF8((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E619EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E619EF8(uint64_t a1)
{
  sub_21E619C7C();
  Class result = objc_getClass("AMSUIAlertDialogTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E621818();
  }
  qword_267D3AFF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E619F50()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3B000;
  uint64_t v7 = qword_267D3B000;
  if (!qword_267D3B000)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E61A034;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E61A034((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61A01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E61A034(uint64_t a1)
{
  sub_21E619C7C();
  Class result = objc_getClass("AMSSystemAlertDialogTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E621840();
  }
  qword_267D3B000 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61A08C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3B008;
  uint64_t v7 = qword_267D3B008;
  if (!qword_267D3B008)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E61A170;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E61A170((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61A158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E61A170(uint64_t a1)
{
  sub_21E619C7C();
  Class result = objc_getClass("AMSUIEngagementTask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E621868();
  }
  qword_267D3B008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E61A1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](a1, sel_initWithBlock_, &unk_26CF8FA00, a4);
}

void sub_21E61A1D4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F893C0];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_activeAccount(v2, v4, v5, v6);
  objc_msgSend_setIdentity_(v3, v8, (uint64_t)v7, v9);

  id v13 = objc_msgSend_defaultIdentityStore(MEMORY[0x263F893C8], v10, v11, v12);
  objc_msgSend_setIdentityStore_(v3, v14, (uint64_t)v13, v15);

  id v16 = objc_alloc(MEMORY[0x263F890C0]);
  id v19 = objc_msgSend_initWithSystemApplicationType_(v16, v17, 2, v18);
  objc_msgSend_setClientInfo_(v3, v20, (uint64_t)v19, v21);

  id v22 = objc_alloc(MEMORY[0x263F89370]);
  id v36 = (id)objc_msgSend_initWithUserInteractionLevel_(v22, v23, 5, v24);
  objc_msgSend_setAuthenticationProvider_(v3, v25, (uint64_t)v36, v26);
  id v27 = objc_alloc_init(MEMORY[0x263F89338]);
  objc_msgSend_setAllowsHandlingNonAuthenticationDialogs_(v27, v28, 0, v29);
  id v30 = objc_alloc(MEMORY[0x263F89330]);
  id v33 = objc_msgSend_initWithConfiguration_(v30, v31, (uint64_t)v27, v32);
  objc_msgSend_setStoreDialogResponseHandler_(v3, v34, (uint64_t)v33, v35);
}

void sub_21E61A42C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 304);
  *(void *)(v2 + 304) = 0;
}

void sub_21E61A558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E61A57C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (!v6 || v7)
  {
    uint64_t v12 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_21E616000, v12, OS_LOG_TYPE_ERROR, "Failed to retrieve acquireSlot URL from the bag.", v15, 2u);
    }

    if (!v7)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v13, *MEMORY[0x263F2BA28], 28, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_finishWithError_(v11, v13, (uint64_t)v7, v14);
  }
  else
  {
    objc_msgSend__acquireSlotWithURL_(WeakRetained, v9, (uint64_t)v6, v10);
  }
}

void sub_21E61A97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E61A9AC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F2BA28];
    id v13 = objc_msgSend_userInfo(v6, v7, v8, v9);
    uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(v11, v14, v12, 40, v13);
  }
  else
  {
    objc_opt_class();
    id v19 = objc_msgSend_parsedBodyDictionary(v5, v16, v17, v18);
    id v22 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"status", v21);
    uint64_t v23 = BUDynamicCast();
    uint64_t v27 = objc_msgSend_integerValue(v23, v24, v25, v26);

    if (!v27) {
      goto LABEL_9;
    }
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F2BA28];
    id v13 = objc_msgSend_parsedBodyDictionary(v5, v28, v29, v30);
    uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v33, v32, 40, v13);
  }

  if (v15)
  {
    v34 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v41 = 138412290;
      uint64_t v42 = v15;
      _os_log_impl(&dword_21E616000, v34, OS_LOG_TYPE_ERROR, "AcquireSlot returned an error. %@", (uint8_t *)&v41, 0xCu);
    }

    objc_msgSend_finishWithError_(WeakRetained, v35, (uint64_t)v15, v36);
    goto LABEL_12;
  }
LABEL_9:
  id v37 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    LOWORD(v41) = 0;
    _os_log_impl(&dword_21E616000, v37, OS_LOG_TYPE_INFO, "AcquireSlot was successful.", (uint8_t *)&v41, 2u);
  }

  objc_msgSend_finish(WeakRetained, v38, v39, v40);
LABEL_12:
}

uint64_t sub_21E61AC30()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_26AC137E8;
  uint64_t v5 = qword_26AC137E8;
  if (!qword_26AC137E8)
  {
    long long v6 = xmmword_2644B5770;
    long long v7 = *(_OWORD *)&off_2644B5780;
    v3[3] = _sl_dlopen();
    qword_26AC137E8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21E61AD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E61AD58(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26AC137E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E61ADE8()
{
  uint64_t v0 = sub_21E61AC30();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_21E61AE44()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3B010;
  uint64_t v7 = qword_267D3B010;
  if (!qword_267D3B010)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E61AF28;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E61AF28((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61AF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E61AF28(uint64_t a1)
{
  sub_21E61ADE8();
  Class result = objc_getClass("MPMediaItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E621890();
  }
  qword_267D3B010 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61AF80()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3B018;
  uint64_t v7 = qword_267D3B018;
  if (!qword_267D3B018)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E61B064;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E61B064((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61B04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E61B064(uint64_t a1)
{
  sub_21E61ADE8();
  Class result = objc_getClass("MPMediaPlaylist");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E6218B8();
  }
  qword_267D3B018 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61B0BC()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_267D3B020;
  uint64_t v7 = qword_267D3B020;
  if (!qword_267D3B020)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E61B1A0;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E61B1A0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61B188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E61B1A0(uint64_t a1)
{
  sub_21E61ADE8();
  Class result = objc_getClass("MPMediaPropertyPredicate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E6218E0();
  }
  qword_267D3B020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61B1F8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_26AC137F0;
  uint64_t v7 = qword_26AC137F0;
  if (!qword_26AC137F0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E61B2DC;
    v3[3] = &unk_2644B5650;
    v3[4] = &v4;
    sub_21E61B2DC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E61B2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E61B2DC(uint64_t a1)
{
  sub_21E61ADE8();
  Class result = objc_getClass("MPMediaQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_21E621908();
  }
  qword_26AC137F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E61B334()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_267D3B028;
  uint64_t v6 = qword_267D3B028;
  if (!qword_267D3B028)
  {
    id v1 = (void *)sub_21E61ADE8();
    v4[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyBitRate");
    qword_267D3B028 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E61B40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E61B424(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E61ADE8();
  Class result = dlsym(v2, "MPMediaItemPropertyBitRate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3B028 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61B474()
{
  uint64_t v0 = (void **)sub_21E61B334();
  if (!v0) {
    sub_21E6217CC();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_21E61B4A8()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_267D3B030;
  uint64_t v6 = qword_267D3B030;
  if (!qword_267D3B030)
  {
    id v1 = (void *)sub_21E61ADE8();
    v4[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyHLSOfflinePlaybackKeys");
    qword_267D3B030 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E61B580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E61B598(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E61ADE8();
  Class result = dlsym(v2, "MPMediaItemPropertyHLSOfflinePlaybackKeys");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3B030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61B5E8()
{
  uint64_t v0 = (void **)sub_21E61B4A8();
  if (!v0) {
    sub_21E6217CC();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_21E61B61C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_267D3B038;
  uint64_t v6 = qword_267D3B038;
  if (!qword_267D3B038)
  {
    id v1 = (void *)sub_21E61ADE8();
    v4[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyHLSPlaylistURL");
    qword_267D3B038 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E61B6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E61B70C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E61ADE8();
  Class result = dlsym(v2, "MPMediaItemPropertyHLSPlaylistURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3B038 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61B75C()
{
  uint64_t v0 = (void **)sub_21E61B61C();
  if (!v0) {
    sub_21E6217CC();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_21E61B790()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_267D3B040;
  uint64_t v6 = qword_267D3B040;
  if (!qword_267D3B040)
  {
    id v1 = (void *)sub_21E61ADE8();
    v4[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyStoreRedownloadParameters");
    qword_267D3B040 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E61B868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E61B880(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E61ADE8();
  Class result = dlsym(v2, "MPMediaItemPropertyStoreRedownloadParameters");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3B040 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61B8D0()
{
  uint64_t v0 = (void **)sub_21E61B790();
  if (!v0) {
    sub_21E6217CC();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_21E61B904()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_267D3B048;
  uint64_t v6 = qword_267D3B048;
  if (!qword_267D3B048)
  {
    id v1 = (void *)sub_21E61ADE8();
    v4[3] = (uint64_t)dlsym(v1, "MPMediaItemPropertyPersistentID");
    qword_267D3B048 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E61B9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E61B9F4(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E61ADE8();
  Class result = dlsym(v2, "MPMediaItemPropertyPersistentID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_267D3B048 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_21E61BA44()
{
  uint64_t v0 = (void **)sub_21E61B904();
  if (!v0) {
    sub_21E6217CC();
  }
  id v1 = *v0;
  return v1;
}

uint64_t sub_21E61BBB0()
{
  qword_267D3B050 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

void sub_21E61BD98(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 134217984;
    uint64_t v9 = v5;
    _os_log_impl(&dword_21E616000, v4, OS_LOG_TYPE_DEFAULT, "Fetch completed for online keys for %llu.", (uint8_t *)&v8, 0xCu);
  }

  if (v3)
  {
    uint64_t v6 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 134218242;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_21E616000, v6, OS_LOG_TYPE_ERROR, "Failed to load streaming HLS key for %llu with error  %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_21E61C190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_msgSend_title(*(void **)(a1 + 32), v8, v9, v10);
    int v19 = 138412290;
    uint64_t v20 = v11;
    _os_log_impl(&dword_21E616000, v7, OS_LOG_TYPE_DEFAULT, "Fetch completed for offline keys for '%@'.", (uint8_t *)&v19, 0xCu);
  }
  if (v6)
  {
    uint64_t v12 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend_title(*(void **)(a1 + 32), v13, v14, v15);
      int v19 = 138412546;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_21E616000, v12, OS_LOG_TYPE_ERROR, "Failed to load offline HLS key for '%@' with error  %@", (uint8_t *)&v19, 0x16u);
    }
  }
  uint64_t v17 = MEMORY[0x223C2CBB0](*(void *)(a1 + 40));
  uint64_t v18 = (void *)v17;
  if (v17) {
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v5, v6);
  }
}

void sub_21E61C65C(uint64_t a1)
{
  uint64_t v2 = [BLUIHostServiceProxy alloc];
  id v11 = (id)objc_msgSend_initWithUIManager_forRequest_inDownloadQueue_(v2, v3, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  if (*(void *)(a1 + 56)) {
    uint64_t v4 = *(void **)(a1 + 56);
  }
  else {
    uint64_t v4 = &unk_26CF8FA20;
  }
  id v5 = (void *)MEMORY[0x223C2CBB0](v4);
  uint64_t v9 = objc_msgSend_serviceProxy(*(void **)(a1 + 48), v6, v7, v8);
  objc_msgSend_requestDownloadsWithManifestRequest_uiHostProxy_reply_(v9, v10, *(void *)(a1 + 40), (uint64_t)v11, v5);
}

void sub_21E61C844(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = *(void **)(a1 + 48);
  }
  else {
    uint64_t v2 = &unk_26CF8FA40;
  }
  id v11 = (id)MEMORY[0x223C2CBB0](v2);
  id v3 = [BLUIHostServiceProxy alloc];
  id v5 = objc_msgSend_initWithUIManager_forRequest_inDownloadQueue_(v3, v4, *(void *)(a1 + 32), 0, *(void *)(a1 + 40));
  uint64_t v9 = objc_msgSend_serviceProxy(*(void **)(a1 + 40), v6, v7, v8);
  objc_msgSend_setAutomaticDownloadEnabled_uiHostProxy_reply_(v9, v10, *(unsigned __int8 *)(a1 + 56), (uint64_t)v5, v11);
}

void sub_21E61CAD8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_msgSend_setDelegate_queue_(*(void **)(*(void *)(a1 + 32) + 304), v2, 0, 0);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 352);
  *(void *)(v3 + 352) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 360);
  *(void *)(v5 + 360) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 304);
  *(void *)(v7 + 304) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 328);
  *(void *)(v9 + 328) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 344);
  *(void *)(v11 + 344) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 392);
  *(void *)(v13 + 392) = 0;
}

void sub_21E61CE20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v9 = objc_msgSend_bodyData(a2, v6, v7, v8);
  if (objc_msgSend_length(v9, v10, v11, v12))
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 336), v9);
    objc_msgSend__createSPCData(*(void **)(a1 + 32), v13, v14, v15);
  }
  else
  {
    id v16 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_21E616000, v16, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to load certificate data with error:  %@", buf, 0x16u);
    }

    int v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F88F00];
    if (v5)
    {
      uint64_t v26 = *MEMORY[0x263F08608];
      id v27 = v5;
      __int16 v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)&v27, (uint64_t)&v26, 1);
      uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v22, v20, -7300, v21);
    }
    else
    {
      uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v18, *MEMORY[0x263F88F00], -7300, 0);
    }
    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v24, (uint64_t)v23, v25);
  }
}

uint64_t sub_21E61D020()
{
  qword_267D3B058 = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

void sub_21E61D768(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 312);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E61D854;
  v12[3] = &unk_2644B58B8;
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void sub_21E61D854(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_parsedBodyDictionary(*(void **)(a1 + 32), a2, a3, a4);
  if (objc_msgSend_count(v5, v6, v7, v8))
  {
    id v11 = objc_msgSend_objectForKey_(v5, v9, @"fairplay-streaming-response", v10);
    if (!_NSIsNSDictionary())
    {
      v34 = BLHLSKeyFetchingLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        uint64_t v94 = v35;
        _os_log_impl(&dword_21E616000, v34, OS_LOG_TYPE_ERROR, "[%{public}@]: Invalid response format.", buf, 0xCu);
      }

      id v14 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v36, *MEMORY[0x263F2BA28], 39, 0);
      objc_msgSend_finishWithError_(*(void **)(a1 + 48), v37, (uint64_t)v14, v38);
LABEL_35:

      goto LABEL_36;
    }
    id v14 = objc_msgSend_objectForKey_(v11, v12, @"streaming-keys", v13);
    if (_NSIsNSArray())
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v15 = v14;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v87, (uint64_t)v97, 16);
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v88;
LABEL_6:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v88 != v19) {
            objc_enumerationMutation(v15);
          }
          __int16 v21 = *(void **)(*((void *)&v87 + 1) + 8 * v20);
          if (_NSIsNSDictionary()) {
            break;
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v22, (uint64_t)&v87, (uint64_t)v97, 16);
            if (v18) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        id v42 = v21;

        if (!v42) {
          goto LABEL_30;
        }
        objc_opt_class();
        uint64_t v45 = objc_msgSend_objectForKey_(v42, v43, @"status", v44);
        uint64_t v46 = BUDynamicCast();

        if (objc_opt_respondsToSelector())
        {
          uint64_t v50 = objc_msgSend_integerValue(v46, v47, v48, v49);
          if (v50 == -1004)
          {
            uint64_t v73 = BLHLSKeyFetchingLog();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              uint64_t v74 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              uint64_t v94 = v74;
              __int16 v95 = 2114;
              id v96 = v42;
              _os_log_impl(&dword_21E616000, v73, OS_LOG_TYPE_ERROR, "[%{public}@]: Received transfer lock in response: %{public}@", buf, 0x16u);
            }

            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v75, *MEMORY[0x263F2BA28], 40, 0);
          }
          else
          {
            if (!v50) {
              goto LABEL_28;
            }
            long long v76 = BLHLSKeyFetchingLog();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              uint64_t v77 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              uint64_t v94 = v77;
              __int16 v95 = 2114;
              id v96 = v42;
              _os_log_impl(&dword_21E616000, v76, OS_LOG_TYPE_ERROR, "[%{public}@]: Received failure in response: %{public}@", buf, 0x16u);
            }

            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v78, *MEMORY[0x263F2BA28], 39, 0);
          v51 = };
          objc_msgSend_finishWithError_(*(void **)(a1 + 48), v79, (uint64_t)v51, v80);
LABEL_59:

          goto LABEL_34;
        }
LABEL_28:
        v51 = objc_msgSend_objectForKey_(v42, v47, @"ckc", v49);
        if (_NSIsNSString())
        {
          id v52 = objc_alloc(MEMORY[0x263EFF8F8]);
          id v54 = (id)objc_msgSend_initWithBase64EncodedString_options_(v52, v53, (uint64_t)v51, 0);
        }
        else
        {
          if (!_NSIsNSData()) {
            goto LABEL_44;
          }
          id v54 = v51;
        }
        v60 = v54;
        if (v54)
        {
          uint64_t v61 = *(void **)(a1 + 40);
          id v86 = 0;
          uint64_t v62 = objc_msgSend_persistableContentKeyFromKeyVendorResponse_options_error_(v61, v55, (uint64_t)v60, 0, &v86);
          id v63 = v86;

          if (v63)
          {
            v64 = BLHLSKeyFetchingLog();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
            {
              uint64_t v65 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543362;
              uint64_t v94 = v65;
              _os_log_impl(&dword_21E616000, v64, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to create persistable content key from content key context data.", buf, 0xCu);
            }

            objc_msgSend_finishWithError_(*(void **)(a1 + 48), v66, (uint64_t)v63, v67);
          }
          else
          {
            objc_storeStrong((id *)(*(void *)(a1 + 48) + 328), v62);
            v81 = BLHLSKeyFetchingLog();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              uint64_t v82 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543362;
              uint64_t v94 = v82;
              _os_log_impl(&dword_21E616000, v81, OS_LOG_TYPE_INFO, "[%{public}@]: Loaded successfully.", buf, 0xCu);
            }

            objc_msgSend_finish(*(void **)(a1 + 48), v83, v84, v85);
          }

LABEL_58:
          goto LABEL_59;
        }
LABEL_44:
        BOOL v68 = BLHLSKeyFetchingLog();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138543362;
          uint64_t v94 = v69;
          _os_log_impl(&dword_21E616000, v68, OS_LOG_TYPE_ERROR, "[%{public}@]: Missing content key context data in response.", buf, 0xCu);
        }

        uint64_t v62 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v70, *MEMORY[0x263F2BA28], 39, 0);
        objc_msgSend_finishWithError_(*(void **)(a1 + 48), v71, (uint64_t)v62, v72);
        goto LABEL_58;
      }
LABEL_12:

LABEL_30:
      uint64_t v39 = BLHLSKeyFetchingLog();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      uint64_t v56 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v94 = v56;
      int v41 = "[%{public}@]: Missing streaming key dictionary in response.";
    }
    else
    {
      uint64_t v39 = BLHLSKeyFetchingLog();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_33;
      }
      uint64_t v40 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v94 = v40;
      int v41 = "[%{public}@]: Missing second-level dictionary key in response.";
    }
    _os_log_impl(&dword_21E616000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
LABEL_33:

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v57, *MEMORY[0x263F2BA28], 39, 0);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(*(void **)(a1 + 48), v58, (uint64_t)v42, v59);
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v23 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    uint64_t v94 = v24;
    __int16 v95 = 2112;
    id v96 = v25;
    _os_log_impl(&dword_21E616000, v23, OS_LOG_TYPE_ERROR, "[%{public}@]: Key server request returned error:  %@", buf, 0x16u);
  }

  id v27 = (void *)MEMORY[0x263F087E8];
  uint64_t v28 = *MEMORY[0x263F2BA28];
  uint64_t v29 = *(void *)(a1 + 56);
  if (v29)
  {
    uint64_t v91 = *MEMORY[0x263F08608];
    uint64_t v92 = v29;
    __int16 v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v26, (uint64_t)&v92, (uint64_t)&v91, 1);
    id v11 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v31, v28, 39, v30);
  }
  else
  {
    id v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v26, *MEMORY[0x263F2BA28], 39, 0);
  }
  objc_msgSend_finishWithError_(*(void **)(a1 + 48), v32, (uint64_t)v11, v33);
LABEL_36:
}

void sub_21E61E2D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 312);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E61E3B8;
  v11[3] = &unk_2644B58B8;
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t sub_21E61E3B8(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && !*(void *)(a1 + 40))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    return MEMORY[0x270F9A6D0](v9, sel__ksq_fetchCKCDataUsingSPC_forKeyRequest_, v2, v10);
  }
  else
  {
    uint64_t v3 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 384);
      int v11 = 138412546;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_impl(&dword_21E616000, v3, OS_LOG_TYPE_ERROR, "Failed to create SPC data for %@ with error:  %@", (uint8_t *)&v11, 0x16u);
    }

    return objc_msgSend_processContentKeyResponseError_(*(void **)(a1 + 56), v6, *(void *)(a1 + 40), v7);
  }
}

void sub_21E61E8F0(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = BLServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend_URLRequest(a1, v9, v10, v11);
    *(_DWORD *)buf = 134218242;
    id v22 = a1;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_21E616000, v8, OS_LOG_TYPE_DEFAULT, "[DownloadManifestRequest] Start download manifest request %p: urlRequest=%@", buf, 0x16u);
  }
  id v16 = objc_msgSend_sharedInstance(BLDownloadQueue, v13, v14, v15);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_21E61EA64;
  v19[3] = &unk_2644B5930;
  v19[4] = a1;
  id v20 = v6;
  id v17 = v6;
  objc_msgSend_addDownloadsWithManifestRequest_uiManager_completion_(v16, v18, (uint64_t)a1, (uint64_t)v7, v19);
}

void sub_21E61EA64(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = BLServiceLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v16 = 134218242;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    uint64_t v10 = "[DownloadManifestRequest] addDownloadsWithManifestRequest for request %p returned error:  %@";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    int v16 = 134218242;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v5;
    uint64_t v10 = "[DownloadManifestRequest] addDownloadsWithManifestRequest for request %p completed with response %@.";
    uint64_t v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_21E616000, v11, v12, v10, (uint8_t *)&v16, 0x16u);
LABEL_7:

  uint64_t v14 = MEMORY[0x223C2CBB0](*(void *)(a1 + 40));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void sub_21E61F3C0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 304);
  *(void *)(v2 + 304) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 312);
  *(void *)(v4 + 312) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 328);
  *(void *)(v8 + 328) = 0;
}

void sub_21E61F52C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 320);
      int v17 = 138412546;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_21E616000, v9, OS_LOG_TYPE_ERROR, "Metadata request for item %@ failed with error  %@", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v11, (uint64_t)v8, v12);
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = objc_msgSend_hlsAsset(a2, v5, v6, v7);
    objc_msgSend__performStreamingKeyRequestForHLSAsset_(v13, v15, (uint64_t)v14, v16);
  }
}

void sub_21E61F784(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 328);
  id v9 = a3;
  objc_msgSend_finishAssetResourceLoadingRequest_withError_(a2, v6, v5, (uint64_t)v9);
  objc_msgSend_finishWithError_(*(void **)(a1 + 32), v7, (uint64_t)v9, v8);
}

void sub_21E61F9C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(a1 + 32) + 328))
  {
    uint64_t v4 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_21E616000, v4, OS_LOG_TYPE_DEFAULT, "metadata request - returning nil store metadata", v13, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 320);
  *(void *)(v5 + 320) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 304);
  *(void *)(v7 + 304) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 328);
  *(void *)(v9 + 328) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 312);
  *(void *)(v11 + 312) = 0;
}

void sub_21E61FC68(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      uint64_t v9 = BLError();
    }
    id v37 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v9;
      _os_log_impl(&dword_21E616000, v37, OS_LOG_TYPE_ERROR, "Failed to retreive bag with error  %@", buf, 0xCu);
    }

    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v38, (uint64_t)v9, v39);
  }
  else
  {
    uint64_t v9 = objc_msgSend_stringForBagKey_(v5, v7, @"fps-cert", v8);
    uint64_t v12 = objc_msgSend_stringForBagKey_(v5, v10, @"audiobook-fps-request", v11);
    uint64_t v13 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = objc_msgSend_title(*(void **)(*(void *)(a1 + 32) + 312), v14, v15, v16);
      *(_DWORD *)buf = 138412290;
      v64 = v17;
      _os_log_impl(&dword_21E616000, v13, OS_LOG_TYPE_DEFAULT, "Received bag for '%@'.", buf, 0xCu);
    }
    if (objc_msgSend_length(v9, v18, v19, v20) && objc_msgSend_length(v12, v21, v22, v23))
    {
      uint64_t v25 = objc_msgSend__responseDictionaryForKeyCertificateURL_keyServerURL_(*(void **)(a1 + 32), v24, (uint64_t)v9, (uint64_t)v12);
      id v26 = objc_alloc(MEMORY[0x263F89358]);
      uint64_t v28 = objc_msgSend_initWithItemResponseDictionary_urlBag_(v26, v27, (uint64_t)v25, (uint64_t)v5);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 328), v28);
      uint64_t v29 = BLHLSKeyFetchingLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = objc_msgSend_title(*(void **)(*(void *)(a1 + 32) + 312), v30, v31, v32);
        *(_DWORD *)buf = 138412290;
        v64 = v33;
        _os_log_impl(&dword_21E616000, v29, OS_LOG_TYPE_DEFAULT, "Successfully read meta data for '%@' from the bag", buf, 0xCu);
      }
      objc_msgSend_finish(*(void **)(a1 + 32), v34, v35, v36);
    }
    else
    {
      uint64_t v40 = *(void **)(*(void *)(a1 + 32) + 312);
      int v41 = sub_21E61B8D0();
      uint64_t v25 = objc_msgSend_valueForProperty_(v40, v42, (uint64_t)v41, v43);

      if (!objc_msgSend_length(v25, v44, v45, v46))
      {
        uint64_t v47 = BLHLSKeyFetchingLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v51 = objc_msgSend_title(*(void **)(*(void *)(a1 + 32) + 312), v48, v49, v50);
          *(_DWORD *)buf = 138412290;
          v64 = v51;
          _os_log_impl(&dword_21E616000, v47, OS_LOG_TYPE_ERROR, "Missing buy parameters for item %@", buf, 0xCu);
        }
      }
      id v52 = objc_alloc(MEMORY[0x263F890B8]);
      uint64_t v54 = objc_msgSend_initWithRequestContext_buyParametersString_includeKeybagSyncData_(v52, v53, *(void *)(a1 + 40), (uint64_t)v25, 1);
      uint64_t v55 = *(void *)(a1 + 32);
      uint64_t v56 = *(void **)(v55 + 320);
      *(void *)(v55 + 320) = v54;

      uint64_t v57 = *(void *)(a1 + 32);
      uint64_t v58 = *(void **)(v57 + 320);
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = sub_21E620050;
      v61[3] = &unk_2644B59D0;
      v61[4] = v57;
      id v62 = v5;
      objc_msgSend_performRequestWithResponseHandler_(v58, v59, (uint64_t)v61, v60);
    }
  }
}

void sub_21E620050(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 312);
      int v36 = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_21E616000, v7, OS_LOG_TYPE_ERROR, "Purchase request for item %@ failed with error  %@", (uint8_t *)&v36, 0x16u);
    }

    objc_msgSend_finishWithError_(*(void **)(a1 + 32), v9, (uint64_t)v6, v10);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F89198]);
    uint64_t v15 = objc_msgSend_date(MEMORY[0x263EFF910], v12, v13, v14);
    int v17 = objc_msgSend_initWithResponseDictionary_requestDate_urlBag_(v11, v16, (uint64_t)v5, (uint64_t)v15, *(void *)(a1 + 40));

    uint64_t v21 = objc_msgSend_items(v17, v18, v19, v20);
    uint64_t v25 = objc_msgSend_firstObject(v21, v22, v23, v24);
    uint64_t v26 = *(void *)(a1 + 32);
    id v27 = *(void **)(v26 + 328);
    *(void *)(v26 + 328) = v25;

    uint64_t v28 = BLHLSKeyFetchingLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_msgSend_title(*(void **)(*(void *)(a1 + 32) + 312), v29, v30, v31);
      int v36 = 138412290;
      id v37 = v32;
      _os_log_impl(&dword_21E616000, v28, OS_LOG_TYPE_DEFAULT, "Successfully fetched meta data from buy product request for '%@'", (uint8_t *)&v36, 0xCu);
    }
    objc_msgSend_finish(*(void **)(a1 + 32), v33, v34, v35);
  }
}

void sub_21E6208B8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = objc_msgSend_defaultIdentityStore(MEMORY[0x263F893C8], v2, v3, v4);
  objc_msgSend_synchronize(v5, v6, v7, v8);

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 352);
  *(void *)(v9 + 352) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 304);
  *(void *)(v11 + 304) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 312);
  *(void *)(v13 + 312) = 0;

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void **)(v15 + 344);
  *(void *)(v15 + 344) = 0;
}

void sub_21E620B28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_hlsAsset(v5, v7, v8, v9);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 320);
  *(void *)(v11 + 320) = v10;

  uint64_t v13 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = objc_msgSend_title(*(void **)(*(void *)(a1 + 32) + 336), v14, v15, v16);
    int v32 = 138412802;
    uint64_t v33 = v17;
    __int16 v34 = 2112;
    id v35 = v5;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_21E616000, v13, OS_LOG_TYPE_DEFAULT, "Received asset info for '%@' (%@, %@).", (uint8_t *)&v32, 0x20u);
  }
  if (!v6)
  {
    uint64_t v28 = *(void **)(a1 + 32);
    if (v28[40])
    {
      objc_msgSend__performOfflineKeyRequest(v28, v18, v19, v20);
      goto LABEL_9;
    }
    BLError();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend__performOfflineKeyRequest(*(void **)(a1 + 32), v29, v30, v31);
      goto LABEL_9;
    }
  }
  uint64_t v21 = BLHLSKeyFetchingLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = objc_msgSend_title(*(void **)(*(void *)(a1 + 32) + 336), v22, v23, v24);
    int v32 = 138412546;
    uint64_t v33 = v25;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_21E616000, v21, OS_LOG_TYPE_ERROR, "Metadata request for '%@' failed with error  %@", (uint8_t *)&v32, 0x16u);
  }
  objc_msgSend_finishWithError_(*(void **)(a1 + 32), v26, (uint64_t)v6, v27);

LABEL_9:
}

void sub_21E621040(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 352), a2);
  id v6 = a2;
  id v9 = a3;
  objc_msgSend_finishWithError_(*(void **)(a1 + 32), v7, (uint64_t)v9, v8);
}

void sub_21E621298(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C2CBB0](*(void *)(a1 + 32));
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

void sub_21E621444(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = BLDefaultLog();
  id v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v16 = 138412290;
    id v17 = v6;
    id v9 = "[UIHostServiceProxy] received error from AMSSystemAlertDialogTask:  %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v13 = *(void **)(a1 + 32);
    int v16 = 138412546;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v5;
    id v9 = "[UIHostServiceProxy] received result from AMSSystemAlertDialogTask for request %@ and calling replay block with result %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 22;
  }
  _os_log_impl(&dword_21E616000, v10, v11, v9, (uint8_t *)&v16, v12);
LABEL_7:

  uint64_t v14 = MEMORY[0x223C2CBB0](*(void *)(a1 + 40));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void sub_21E6216AC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C2CBB0](*(void *)(a1 + 32));
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

void sub_21E62172C()
{
  uint64_t v0 = abort_report_np();
  sub_21E621754(v0);
}

void sub_21E621754()
{
  uint64_t v0 = abort_report_np();
  sub_21E62177C(v0);
}

void sub_21E62177C()
{
  uint64_t v0 = abort_report_np();
  sub_21E6217A4(v0);
}

void sub_21E6217A4()
{
  uint64_t v0 = abort_report_np();
  sub_21E6217CC(v0);
}

void sub_21E6217CC()
{
}

void sub_21E6217F0()
{
  uint64_t v0 = abort_report_np();
  sub_21E621818(v0);
}

void sub_21E621818()
{
  uint64_t v0 = abort_report_np();
  sub_21E621840(v0);
}

void sub_21E621840()
{
  uint64_t v0 = abort_report_np();
  sub_21E621868(v0);
}

void sub_21E621868()
{
  uint64_t v0 = abort_report_np();
  sub_21E621890(v0);
}

void sub_21E621890()
{
  uint64_t v0 = abort_report_np();
  sub_21E6218B8(v0);
}

void sub_21E6218B8()
{
  uint64_t v0 = abort_report_np();
  sub_21E6218E0(v0);
}

void sub_21E6218E0()
{
}

void sub_21E621908()
{
}

uint64_t BLDefaultLog()
{
  return MEMORY[0x270F127B8]();
}

uint64_t BLError()
{
  return MEMORY[0x270F127C0]();
}

uint64_t BLHLSKeyFetchingLog()
{
  return MEMORY[0x270F127C8]();
}

uint64_t BLServiceLog()
{
  return MEMORY[0x270F127D0]();
}

uint64_t BUDynamicCast()
{
  return MEMORY[0x270F127E8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x270EE57B0]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x270EE57B8]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x270EE57C8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x270EE57D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}
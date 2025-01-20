void sub_21DFE4444(uint64_t a1, void *a2)
{
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id WeakRetained;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  unsigned char v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x263EF8340];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = a2;
  v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v2, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v3)
  {
    v7 = v3;
    v8 = *(void *)v46;
    v42 = *(void *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_msgSend_state(v10, v4, v5, v6) == 4)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          v15 = objc_msgSend_storeIdentifier(v10, v12, v13, v14);
          v19 = objc_msgSend_storePlaylistIdentifier(v10, v16, v17, v18);
          v23 = objc_msgSend_permlink(v10, v20, v21, v22);
          v27 = objc_msgSend_downloadID(v10, v24, v25, v26);
          v31 = objc_msgSend_title(v10, v28, v29, v30);
          v35 = objc_msgSend_collectionTitle(v10, v32, v33, v34);
          v39 = objc_msgSend_kind(v10, v36, v37, v38);
          LOBYTE(v41) = 1;
          objc_msgSend_sendInitialProgressNotificationForDownloadWithStoreID_storePlaylistID_orPermlink_downloadID_title_collectionTitle_assetKind_isPaused_targetObserver_(WeakRetained, v40, (uint64_t)v15, (uint64_t)v19, v23, v27, v31, v35, v39, v41, *(void *)(a1 + 32));

          v8 = v42;
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v7);
  }
}

void sub_21DFE477C()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (qword_26AB40060) {
    id v0 = (id)qword_26AB40060;
  }
  else {
    id v0 = (id)objc_opt_new();
  }
  v1 = (void *)qword_26AB40080;
  qword_26AB40080 = (uint64_t)v0;

  v2 = BLDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = qword_26AB40080;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "[DownloadQueueNonUI]: using singelton instance: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_21DFE4850(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v3 = BLDownloadQueueServiceProgressMonitorLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v2;
      uint64_t v5 = "[BLDownloadQueueServerProgressObserver] Failed registering to monitor progress:  %@";
      v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_21DFE3000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    uint64_t v5 = "[BLDownloadQueueServerProgressObserver] Successfully registered to monitor progress.";
    v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

void sub_21DFE4E28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21DFE5134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DFE5558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFE5570(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_state(*(void **)(a1 + 32), a2, a3, a4);
  if (v5) {
    BOOL v6 = v5 == 4;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    os_log_type_t v7 = BLServiceProxyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] Creating connection to bookassetd.", (uint8_t *)buf, 2u);
    }

    int v9 = objc_msgSend_connectionWithMachServiceName_options_(BLServiceProxyConnectionFactory, v8, @"com.apple.ibooks.BLService", 0);
    objc_msgSend_setConnection_(*(void **)(a1 + 32), v10, (uint64_t)v9, v11);

    v15 = objc_msgSend_mainInterface(BLServiceInterface, v12, v13, v14);
    v19 = objc_msgSend_connection(*(void **)(a1 + 32), v16, v17, v18);
    objc_msgSend_setRemoteObjectInterface_(v19, v20, (uint64_t)v15, v21);

    objc_initWeak(buf, *(id *)(a1 + 32));
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = sub_21DFFA860;
    v72[3] = &unk_26448B8F8;
    objc_copyWeak(&v73, buf);
    v25 = objc_msgSend_connection(*(void **)(a1 + 32), v22, v23, v24);
    objc_msgSend_setInterruptionHandler_(v25, v26, (uint64_t)v72, v27);

    uint64_t v70 = MEMORY[0x263EF8330];
    objc_copyWeak(&v71, buf);
    v31 = objc_msgSend_connection(*(void **)(a1 + 32), v28, v29, v30, v70, 3221225472, sub_21DFFA9D4, &unk_26448B8F8);
    objc_msgSend_setInvalidationHandler_(v31, v32, (uint64_t)&v70, v33);

    v37 = objc_msgSend_progressReceiver(*(void **)(a1 + 32), v34, v35, v36);

    if (v37)
    {
      v41 = objc_msgSend_progressInterface(BLServiceInterface, v38, v39, v40);
      v45 = objc_msgSend_connection(*(void **)(a1 + 32), v42, v43, v44);
      objc_msgSend_setExportedInterface_(v45, v46, (uint64_t)v41, v47);

      v51 = objc_msgSend_progressReceiver(*(void **)(a1 + 32), v48, v49, v50);
      v55 = objc_msgSend_connection(*(void **)(a1 + 32), v52, v53, v54);
      objc_msgSend_setExportedObject_(v55, v56, (uint64_t)v51, v57);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend_state(*(void **)(a1 + 32), v38, v39, v40) != 0;
    objc_msgSend_setState_(*(void **)(a1 + 32), v58, 2, v59);
    v63 = objc_msgSend_connection(*(void **)(a1 + 32), v60, v61, v62);
    objc_msgSend_resume(v63, v64, v65, v66);

    objc_destroyWeak(&v71);
    objc_destroyWeak(&v73);
    objc_destroyWeak(buf);
  }
  else if (v5 == 3)
  {
    v67 = BLServiceProxyLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21DFE3000, v67, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] Attempting to reconnect to bookassetd after interruption.", (uint8_t *)buf, 2u);
    }

    objc_msgSend_setState_(*(void **)(a1 + 32), v68, 2, v69);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_21DFE5884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id BLServiceProxyLog()
{
  if (qword_26AB400E0 != -1) {
    dispatch_once(&qword_26AB400E0, &unk_26CED3AB0);
  }
  id v0 = (void *)qword_26AB400E8;

  return v0;
}

id BLDefaultLog()
{
  if (qword_26AB400D0 != -1) {
    dispatch_once(&qword_26AB400D0, &unk_26CED3AD0);
  }
  id v0 = (void *)qword_26AB400D8;

  return v0;
}

id BLDownloadQueueServiceProgressMonitorLog()
{
  if (qword_26AB40070 != -1) {
    dispatch_once(&qword_26AB40070, &unk_26CED3950);
  }
  id v0 = (void *)qword_26AB40068;

  return v0;
}

id BLJaliscoLog()
{
  if (qword_26AB3FF60 != -1) {
    dispatch_once(&qword_26AB3FF60, &unk_26CED3BB0);
  }
  id v0 = (void *)qword_26AB3FF58;

  return v0;
}

id BLServiceLog()
{
  if (qword_26AB3FFF8 != -1) {
    dispatch_once(&qword_26AB3FFF8, &unk_26CED3930);
  }
  id v0 = (void *)qword_26AB40038;

  return v0;
}

id BLServiceDownloadManagerLog()
{
  if (qword_26AB3FFF0 != -1) {
    dispatch_once(&qword_26AB3FFF0, &unk_26CED39D0);
  }
  id v0 = (void *)qword_26AB40020;

  return v0;
}

id BLDaemonLog()
{
  if (qword_26AB3FFE0 != -1) {
    dispatch_once(&qword_26AB3FFE0, &unk_26CED3AF0);
  }
  id v0 = (void *)qword_26AB3FFD8;

  return v0;
}

id BLServicePurchaseManagerLog()
{
  if (qword_26AB3FEE8 != -1) {
    dispatch_once(&qword_26AB3FEE8, &unk_26CED3990);
  }
  id v0 = (void *)qword_26AB3FEF8;

  return v0;
}

uint64_t sub_21DFE5B6C()
{
  qword_26AB400E8 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLServiceProxy");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFE5BB0()
{
  qword_26AB40068 = (uint64_t)os_log_create("com.apple.bookassetd", "BLDownloadQueueServiceProgressMonitor");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFE5BF4()
{
  qword_26AB400D8 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BookLibrary");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFE5C38(uint64_t a1)
{
  uint64_t v2 = [BLDownloadQueueServerProgressObserver alloc];
  qword_26AB3FFC0 = objc_msgSend_initWithDownloadQueue_(v2, v3, *(void *)(a1 + 32), v4);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFE6968()
{
  qword_26AB40090 = (uint64_t)dispatch_queue_create("default_book_library", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFE6A38(uint64_t result)
{
  if (!qword_26AB40088)
  {
    id v1 = objc_alloc(*(Class *)(result + 32));
    qword_26AB40088 = objc_msgSend__init(v1, v2, v3, v4);
    return MEMORY[0x270F9A758]();
  }
  return result;
}

void sub_21DFE76F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21DFE7750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21DFE7760(uint64_t a1)
{
}

uint64_t sub_21DFE7768(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_permlink(a2, (const char *)a2, a3, a4);
  uint64_t isEqual = objc_msgSend_isEqual_(v5, v6, *(void *)(a1 + 32), v7);

  return isEqual;
}

void sub_21DFE77AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint32_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_21DFE7AA8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_permlink(a2, (const char *)a2, a3, a4);
  uint64_t isEqual = objc_msgSend_isEqual_(v5, v6, *(void *)(a1 + 32), v7);

  return isEqual;
}

void sub_21DFE7D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DFE7DBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  objc_msgSend__allPlists(*(void **)(a1 + 32), a2, a3, a4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v61, (uint64_t)v69, 16);
  if (v55)
  {
    v56 = 0;
    uint64_t v54 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v62 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v10 = objc_msgSend__bookItemsFromPlist_(*(void **)(a1 + 32), v6, (uint64_t)v9, v7);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v11 = v10;
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v57, (uint64_t)v68, 16);
        if (v13)
        {
          uint64_t v17 = v13;
          uint64_t v18 = *(void *)v58;
LABEL_8:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v58 != v18) {
              objc_enumerationMutation(v11);
            }
            v20 = *(void **)(*((void *)&v57 + 1) + 8 * v19);
            uint64_t v21 = objc_msgSend_identifier(v20, v14, v15, v16);
            char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, *(void *)(a1 + 40), v23);

            if (isEqualToString) {
              break;
            }
            if (v17 == ++v19)
            {
              uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v57, (uint64_t)v68, 16);
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v25 = v9;
          uint64_t v29 = objc_msgSend_path(v20, v26, v27, v28);

          if (!v25)
          {
            v56 = v29;
            continue;
          }

          uint64_t v33 = objc_msgSend_lastPathComponent(v29, v30, v31, v32);
          v67 = v33;
          uint64_t v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)&v67, 1);
          objc_msgSend_addDeletedFiles_(v25, v36, (uint64_t)v35, v37);

          if ((objc_msgSend__isMultiUser(*(void **)(a1 + 32), v38, v39, v40) & 1) == 0)
          {
            uint64_t v44 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v41, v42, v43);
            objc_msgSend_removeItemAtPath_error_(v44, v45, (uint64_t)v29, *(void *)(a1 + 64));
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_28;
        }
LABEL_14:
      }
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v61, (uint64_t)v69, 16);
      if (v55) {
        continue;
      }
      break;
    }
  }
  else
  {
    v56 = 0;
  }

  if (*(void *)(a1 + 64))
  {
    uint64_t v47 = (void *)MEMORY[0x263F087E8];
    v48 = &stru_26CED4330;
    if (*(void *)(a1 + 40)) {
      v48 = *(__CFString **)(a1 + 40);
    }
    uint64_t v65 = @"identifier";
    uint64_t v66 = v48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)&v66, (uint64_t)&v65, 1);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v49, @"BLLibraryErrorDomain", -1000, v25);
    uint64_t v51 = *(void *)(*(void *)(a1 + 56) + 8);
    v52 = *(void **)(v51 + 40);
    *(void *)(v51 + 40) = v50;

    uint64_t v29 = v56;
LABEL_28:
  }
  else
  {
    uint64_t v29 = v56;
  }
}

void sub_21DFE8254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DFE8278(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  objc_msgSend__allPlists(*(void **)(a1 + 32), a2, a3, a4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v61, (uint64_t)v69, 16);
  if (v55)
  {
    v56 = 0;
    uint64_t v54 = *(void *)v62;
    while (2)
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v62 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v10 = objc_msgSend__bookItemsFromPlist_(*(void **)(a1 + 32), v6, (uint64_t)v9, v7);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v11 = v10;
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v57, (uint64_t)v68, 16);
        if (v13)
        {
          uint64_t v17 = v13;
          uint64_t v18 = *(void *)v58;
LABEL_8:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v58 != v18) {
              objc_enumerationMutation(v11);
            }
            v20 = *(void **)(*((void *)&v57 + 1) + 8 * v19);
            uint64_t v21 = objc_msgSend_path(v20, v14, v15, v16);
            char isEqualToString = objc_msgSend_isEqualToString_(v21, v22, *(void *)(a1 + 40), v23);

            if (isEqualToString) {
              break;
            }
            if (v17 == ++v19)
            {
              uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v57, (uint64_t)v68, 16);
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v25 = v9;
          uint64_t v29 = objc_msgSend_path(v20, v26, v27, v28);

          if (!v25)
          {
            v56 = v29;
            continue;
          }

          uint64_t v33 = objc_msgSend_lastPathComponent(v29, v30, v31, v32);
          v67 = v33;
          uint64_t v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v34, (uint64_t)&v67, 1);
          objc_msgSend_addDeletedFiles_(v25, v36, (uint64_t)v35, v37);

          if ((objc_msgSend__isMultiUser(*(void **)(a1 + 32), v38, v39, v40) & 1) == 0)
          {
            uint64_t v44 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v41, v42, v43);
            objc_msgSend_removeItemAtPath_error_(v44, v45, (uint64_t)v29, *(void *)(a1 + 64));
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          goto LABEL_28;
        }
LABEL_14:
      }
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v61, (uint64_t)v69, 16);
      if (v55) {
        continue;
      }
      break;
    }
  }
  else
  {
    v56 = 0;
  }

  if (*(void *)(a1 + 64))
  {
    uint64_t v47 = (void *)MEMORY[0x263F087E8];
    v48 = &stru_26CED4330;
    if (*(void *)(a1 + 40)) {
      v48 = *(__CFString **)(a1 + 40);
    }
    uint64_t v65 = @"path";
    uint64_t v66 = v48;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)&v66, (uint64_t)&v65, 1);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v49, @"BLLibraryErrorDomain", -1000, v25);
    uint64_t v51 = *(void *)(*(void *)(a1 + 56) + 8);
    v52 = *(void **)(v51 + 40);
    *(void *)(v51 + 40) = v50;

    uint64_t v29 = v56;
LABEL_28:
  }
  else
  {
    uint64_t v29 = v56;
  }
}

uint64_t sub_21DFE8A4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = objc_msgSend_storeIdentifier(v3, v4, v5, v6);
  if (objc_msgSend_isEqualToString_(v7, v8, *(void *)(a1 + 32), v9))
  {
    uint64_t isEqual = 1;
  }
  else
  {
    uint64_t v14 = objc_msgSend_permlink(v3, v10, v11, v12);
    uint64_t isEqual = objc_msgSend_isEqual_(v14, v15, *(void *)(a1 + 40), v16);
  }
  return isEqual;
}

uint64_t sub_21DFE8BBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_permlink(a2, (const char *)a2, a3, a4);
  uint64_t isEqual = objc_msgSend_isEqual_(v5, v6, *(void *)(a1 + 32), v7);

  return isEqual;
}

void sub_21DFE9250(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[4];
      int v10 = 138412546;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "Failed to add permalink %@. Error:  %@", (uint8_t *)&v10, 0x16u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v7 = [BLBookItem alloc];
    uint64_t v9 = objc_msgSend_initWithPeristentIdentifier_permlink_title_(v7, v8, @"0", a1[4], a1[5]);
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_21DFE94DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DFE9500(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  unint64_t v5 = 0x26448A000uLL;
  uint64_t v6 = objc_msgSend_sharedPlist(*(void **)(a1 + 32), a2, a3, a4);
  int v10 = objc_msgSend_contents(v6, v7, v8, v9);
  id v13 = objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v11, (uint64_t)v10, v12);

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v14 = v13;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v102, (uint64_t)v109, 16);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v103;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v103 != v18) {
          objc_enumerationMutation(v14);
        }
        objc_opt_class();
        v22 = BUDynamicCast();
        if (v22)
        {
          uint64_t v23 = objc_msgSend_permlinkFromPlistEntry_(IMLibraryPlist, v20, (uint64_t)v22, v21);
          char isEqual = objc_msgSend_isEqual_(v23, v24, *(void *)(a1 + 40), v25);

          if (isEqual)
          {

            v41 = objc_msgSend_purchasedPlist(*(void **)(a1 + 32), v38, v39, v40);
            uint64_t v45 = objc_msgSend_contents(v41, v42, v43, v44);

            v100 = (void *)v45;
            v48 = objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v46, v45, v47);
            v52 = v48;
            if (v48) {
              uint64_t v53 = objc_msgSend_mutableCopy(v48, v49, v50, v51);
            }
            else {
              uint64_t v53 = objc_opt_new();
            }
            long long v57 = v53;
            id v101 = v14;
            uint64_t v58 = objc_msgSend_count(v53, v54, v55, v56);
            if (v58 - 1 >= 0)
            {
              uint64_t v61 = v58;
              do
              {
                --v61;
                objc_opt_class();
                long long v64 = objc_msgSend_objectAtIndexedSubscript_(v57, v62, v61, v63);
                uint64_t v65 = BUDynamicCast();

                unint64_t v66 = v5;
                uint64_t v69 = objc_msgSend_permlinkFromPlistEntry_(*(void **)(v5 + 2688), v67, (uint64_t)v65, v68);
                int v72 = objc_msgSend_isEqual_(v69, v70, *(void *)(a1 + 40), v71);

                if (v72) {
                  objc_msgSend_removeObjectAtIndex_(v57, v73, v61, v74);
                }

                unint64_t v5 = v66;
              }
              while (v61 > 0);
            }
            objc_msgSend_addObject_(v57, v59, (uint64_t)v22, v60);
            v78 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v75, v76, v77);
            objc_msgSend_setBooksArray_toPlistEntry_(*(void **)(v5 + 2688), v79, (uint64_t)v57, (uint64_t)v78);
            v83 = objc_msgSend_purchasedPlist(*(void **)(a1 + 32), v80, v81, v82);
            v87 = objc_msgSend_path(v83, v84, v85, v86);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_writeToFile_atomically_(v78, v88, (uint64_t)v87, 1);

            v91 = objc_msgSend_folderNameFromPlistEntry_(*(void **)(v5 + 2688), v89, (uint64_t)v22, v90);
            v95 = objc_msgSend_purchasedPlist(*(void **)(a1 + 32), v92, v93, v94);
            v108 = v91;
            v97 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v96, (uint64_t)&v108, 1);
            objc_msgSend_removeDeletedPaths_(v95, v98, (uint64_t)v97, v99);

            id v14 = v101;
            goto LABEL_24;
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v27, (uint64_t)&v102, (uint64_t)v109, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }

  if (*(void *)(a1 + 64))
  {
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    v106 = @"BLLibraryErrorPermlink";
    uint64_t v32 = *(void **)(a1 + 40);
    v22 = v32;
    if (!v32)
    {
      v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v28, v29, v30);
    }
    v107 = v22;
    uint64_t v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v107, (uint64_t)&v106, 1);
    uint64_t v35 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, @"BLLibraryErrorDomain", -1003, v33);
    uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;

    if (!v32) {
LABEL_24:
    }
  }
}

void sub_21DFE9C24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((*(void *)(a1 + 32) || *(void *)(a1 + 40))
    && objc_msgSend__isMultiUser(*(void **)(a1 + 48), a2, a3, a4))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v27 = 0;
    uint64_t v9 = objc_msgSend__bookItemFromStoreID_permlink_error_(v6, v5, v8, v7, &v27);
    id v12 = v27;
    if (v9)
    {
      uint64_t v13 = *(void *)(a1 + 56);
      if (v13)
      {
        objc_msgSend_setLastUserAccessDate_(v9, v10, v13, v11);
      }
      else
      {
        uint64_t v16 = objc_msgSend_date(MEMORY[0x263EFF910], v10, 0, v11);
        objc_msgSend_setLastUserAccessDate_(v9, v17, (uint64_t)v16, v18);
      }
      if (objc_msgSend__bookItemIsShared_(*(void **)(a1 + 48), v14, (uint64_t)v9, v15))
      {
        uint64_t v22 = *(void *)(a1 + 56);
        uint64_t v23 = objc_msgSend_sharedPlist(*(void **)(a1 + 48), v19, v20, v21);
        id v26 = v12;
        objc_msgSend__addDate_toPlist_bookItem_error_(BLLibrary, v24, v22, (uint64_t)v23, v9, &v26);
        id v25 = v26;

        id v12 = v25;
      }
    }
  }
}

void sub_21DFE9EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21DFE9F14(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend_contents(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v8 = objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v6, (uint64_t)v5, v7);

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v9 = v8;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v59, (uint64_t)v64, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v60;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v60 != v13) {
        objc_enumerationMutation(v9);
      }
      objc_opt_class();
      uint64_t v15 = BUDynamicCast();
      if (sub_21DFEA20C(v15, *(void **)(a1 + 40))) {
        break;
      }

      if (v12 == ++v14)
      {
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v19, (uint64_t)&v59, (uint64_t)v64, 16);
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v21 = objc_msgSend_mutableCopy(v15, v16, v17, v18, v59);
    objc_msgSend_setAccessDate_toPlistEntry_(IMLibraryPlist, v22, *(void *)(a1 + 48), (uint64_t)v21);

    if (!v21) {
      goto LABEL_17;
    }
    id v25 = objc_msgSend_mutableCopy(v9, v20, v23, v24);
    uint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);
    if (v29 - 1 >= 0)
    {
      uint64_t v32 = v29;
      do
      {
        --v32;
        objc_opt_class();
        uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(v25, v33, v32, v34);
        uint64_t v36 = BUDynamicCast();

        if (sub_21DFEA20C(v36, *(void **)(a1 + 40))) {
          objc_msgSend_removeObjectAtIndex_(v25, v37, v32, v38);
        }
      }
      while (v32 > 0);
    }
    objc_msgSend_addObject_(v25, v30, (uint64_t)v21, v31);
    uint64_t v42 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v39, v40, v41);
    objc_msgSend_setBooksArray_toPlistEntry_(IMLibraryPlist, v43, (uint64_t)v25, (uint64_t)v42);
    uint64_t v47 = objc_msgSend_path(*(void **)(a1 + 32), v44, v45, v46);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend_writeToFile_atomically_(v42, v48, (uint64_t)v47, 1);

    uint64_t v51 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v49, (uint64_t)v21, v50);
    v52 = *(void **)(a1 + 32);
    uint64_t v63 = v51;
    uint64_t v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v53, (uint64_t)&v63, 1);
    objc_msgSend_removeDeletedPaths_(v52, v55, (uint64_t)v54, v56);

    goto LABEL_19;
  }
LABEL_9:

LABEL_17:
  if (*(void *)(a1 + 72))
  {
    uint64_t v57 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v20, @"BLLibraryErrorDomain", -1000, 0);
    uint64_t v58 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v21 = *(void **)(v58 + 40);
    *(void *)(v58 + 40) = v57;
LABEL_19:
  }
}

uint64_t sub_21DFEA20C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v8 = v4;
  uint64_t v9 = 0;
  if (v3 && v4)
  {
    int v10 = objc_msgSend_storeIdentifier(v4, v5, v6, v7);
    uint64_t v14 = objc_msgSend_length(v10, v11, v12, v13);

    if (v14)
    {
      uint64_t v18 = objc_msgSend_storeIdFromPlistEntry_(IMLibraryPlist, v15, (uint64_t)v3, v17);
      uint64_t v22 = objc_msgSend_storeIdentifier(v8, v19, v20, v21);
      uint64_t isEqualToString = objc_msgSend_isEqualToString_(v18, v23, (uint64_t)v22, v24);
    }
    else
    {
      id v26 = objc_msgSend_permlink(v8, v15, v16, v17);

      if (!v26)
      {
        uint64_t v9 = 0;
        goto LABEL_8;
      }
      uint64_t v18 = objc_msgSend_permlinkFromPlistEntry_(IMLibraryPlist, v27, (uint64_t)v3, v28);
      uint64_t v22 = objc_msgSend_permlink(v8, v29, v30, v31);
      uint64_t isEqualToString = objc_msgSend_isEqual_(v18, v32, (uint64_t)v22, v33);
    }
    uint64_t v9 = isEqualToString;
  }
LABEL_8:

  return v9;
}

id BLError(int a1, __CFString *a2, __CFString *a3)
{
  v16[2] = *MEMORY[0x263EF8340];
  unint64_t v5 = @"Unknown Error";
  if (a3) {
    unint64_t v5 = a3;
  }
  v15[0] = @"message";
  v15[1] = @"title";
  uint64_t v6 = @"BLService error";
  if (a2) {
    uint64_t v6 = a2;
  }
  v16[0] = v5;
  v16[1] = v6;
  uint64_t v7 = NSDictionary;
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v7, v10, (uint64_t)v16, (uint64_t)v15, 2);
  uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v12, @"BLErrorDomain", a1, v11);

  return v13;
}

id BLErrorWithUserInfo(int a1, __CFString *a2, __CFString *a3, void *a4)
{
  id v9 = a4;
  if (a3) {
    int v10 = a3;
  }
  else {
    int v10 = @"Unknown Error";
  }
  uint64_t v11 = @"BLService error";
  if (a2) {
    uint64_t v11 = a2;
  }
  uint64_t v12 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v7, (uint64_t)v10, v8, @"message", v11, @"title", 0);
  uint64_t v15 = v12;
  if (v9) {
    objc_msgSend_addEntriesFromDictionary_(v12, v13, (uint64_t)v9, v14);
  }
  uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v13, @"BLErrorDomain", a1, v15);

  return v16;
}

uint64_t BLErrorIsEqual(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v9 = a2;
  if (v5 && objc_msgSend_code(v5, v6, v7, v8) == a3)
  {
    uint64_t v13 = objc_msgSend_domain(v5, v10, v11, v12);
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v13, v14, (uint64_t)v9, v15);
  }
  else
  {
    uint64_t isEqualToString = 0;
  }

  return isEqualToString;
}

id BLErrorWithDomain(void *a1, uint64_t a2, __CFString *a3, __CFString *a4)
{
  v19[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = @"Unknown Error";
  if (a4) {
    uint64_t v7 = a4;
  }
  v18[0] = @"message";
  v18[1] = @"title";
  uint64_t v8 = @"BLService error";
  if (a3) {
    uint64_t v8 = a3;
  }
  v19[0] = v7;
  v19[1] = v8;
  id v9 = NSDictionary;
  int v10 = a4;
  uint64_t v11 = a3;
  id v12 = a1;
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v9, v13, (uint64_t)v19, (uint64_t)v18, 2);
  uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v15, (uint64_t)v12, a2, v14);

  return v16;
}

id BLUnknownDownloadError(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_stringWithFormat_(NSString, a2, @"unknown download id (%@)", a4, a1);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v5 = BLError(23, 0, v4);

  return v5;
}

uint64_t sub_21DFEF5DC()
{
  qword_26AB40038 = (uint64_t)os_log_create("com.apple.bookassetd", "BLService");

  return MEMORY[0x270F9A758]();
}

id BLServiceDownloadQueueLog()
{
  if (qword_26AB40030 != -1) {
    dispatch_once(&qword_26AB40030, &unk_26CED3970);
  }
  id v0 = (void *)qword_26AB40028;

  return v0;
}

uint64_t sub_21DFEF674()
{
  qword_26AB40028 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceDownloadQueue");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFEF6B8()
{
  qword_26AB3FEF8 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServicePurchaseManager");

  return MEMORY[0x270F9A758]();
}

id BLServiceMediaLibraryManagerLog()
{
  if (qword_267D252F0 != -1) {
    dispatch_once(&qword_267D252F0, &unk_26CED39B0);
  }
  id v0 = (void *)qword_267D252E8;

  return v0;
}

uint64_t sub_21DFEF750()
{
  qword_267D252E8 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceMediaLibraryManagerLog");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFEF794()
{
  qword_26AB40020 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceDownloadManager");

  return MEMORY[0x270F9A758]();
}

id BLServiceDownloadPipelineLog()
{
  if (qword_267D25300 != -1) {
    dispatch_once(&qword_267D25300, &unk_26CED39F0);
  }
  id v0 = (void *)qword_267D252F8;

  return v0;
}

uint64_t sub_21DFEF82C()
{
  qword_267D252F8 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceDownloadPipeline");

  return MEMORY[0x270F9A758]();
}

id BLServiceDatabaseManagerLog()
{
  if (qword_26AB3FFE8 != -1) {
    dispatch_once(&qword_26AB3FFE8, &unk_26CED3A10);
  }
  id v0 = (void *)qword_26AB40018;

  return v0;
}

uint64_t sub_21DFEF8C4()
{
  qword_26AB40018 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceDatabaseManager");

  return MEMORY[0x270F9A758]();
}

id BLServiceDownloadFilesystemLog()
{
  if (qword_267D25310 != -1) {
    dispatch_once(&qword_267D25310, &unk_26CED3A30);
  }
  id v0 = (void *)qword_267D25308;

  return v0;
}

uint64_t sub_21DFEF95C()
{
  qword_267D25308 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceDownloadFilesystem");

  return MEMORY[0x270F9A758]();
}

id BLServiceDownloadStreamingZipLog()
{
  if (qword_267D25320 != -1) {
    dispatch_once(&qword_267D25320, &unk_26CED3A50);
  }
  id v0 = (void *)qword_267D25318;

  return v0;
}

uint64_t sub_21DFEF9F4()
{
  qword_267D25318 = (uint64_t)os_log_create("com.apple.bookassetd", "BLServiceDownloadStreamingZip");

  return MEMORY[0x270F9A758]();
}

id BLServiceNotificationLog()
{
  if (qword_26AB40000 != -1) {
    dispatch_once(&qword_26AB40000, &unk_26CED3A70);
  }
  id v0 = (void *)qword_26AB40040;

  return v0;
}

uint64_t sub_21DFEFA8C()
{
  qword_26AB40040 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLServiceNotification");

  return MEMORY[0x270F9A758]();
}

id BLServiceMetadataStoreLog()
{
  if (qword_26AB3FF10 != -1) {
    dispatch_once(&qword_26AB3FF10, &unk_26CED3A90);
  }
  id v0 = (void *)qword_26AB3FF18;

  return v0;
}

uint64_t sub_21DFEFB24()
{
  qword_26AB3FF18 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLServiceMetadataStore");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFEFB68()
{
  qword_26AB3FFD8 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLDaemon");

  return MEMORY[0x270F9A758]();
}

id BLBookInstallLog()
{
  if (qword_26AB3FFD0 != -1) {
    dispatch_once(&qword_26AB3FFD0, &unk_26CED3B10);
  }
  id v0 = (void *)qword_26AB40010;

  return v0;
}

uint64_t sub_21DFEFC00()
{
  qword_26AB40010 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLBookInstallLog");

  return MEMORY[0x270F9A758]();
}

id BLBookCacheDeleteLog()
{
  if (qword_26AB3FFC8 != -1) {
    dispatch_once(&qword_26AB3FFC8, &unk_26CED3B30);
  }
  id v0 = (void *)qword_26AB40008;

  return v0;
}

uint64_t sub_21DFEFC98()
{
  qword_26AB40008 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLBookCacheDeleteLog");

  return MEMORY[0x270F9A758]();
}

id BLUtilitiesLog()
{
  if (qword_267D25330 != -1) {
    dispatch_once(&qword_267D25330, &unk_26CED3B50);
  }
  id v0 = (void *)qword_267D25328;

  return v0;
}

uint64_t sub_21DFEFD30()
{
  qword_267D25328 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLUtilitiesLog");

  return MEMORY[0x270F9A758]();
}

id BLAudiobookSyncLog()
{
  if (qword_267D25340 != -1) {
    dispatch_once(&qword_267D25340, &unk_26CED3B70);
  }
  id v0 = (void *)qword_267D25338;

  return v0;
}

uint64_t sub_21DFEFDC8()
{
  qword_267D25338 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLAudiobookSyncLog");

  return MEMORY[0x270F9A758]();
}

id BLHLSKeyFetchingLog()
{
  if (qword_267D25350 != -1) {
    dispatch_once(&qword_267D25350, &unk_26CED3B90);
  }
  id v0 = (void *)qword_267D25348;

  return v0;
}

uint64_t sub_21DFEFE60()
{
  qword_267D25348 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BookLibrary.HLSStreaming");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFEFEA4()
{
  qword_26AB3FF58 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLJalisco");

  return MEMORY[0x270F9A758]();
}

id BLFamilyLog()
{
  if (qword_267D25360 != -1) {
    dispatch_once(&qword_267D25360, &unk_26CED3BD0);
  }
  id v0 = (void *)qword_267D25358;

  return v0;
}

uint64_t sub_21DFEFF3C()
{
  qword_267D25358 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLFamily");

  return MEMORY[0x270F9A758]();
}

id BLAudiobookMLImporterLog()
{
  if (qword_267D25370 != -1) {
    dispatch_once(&qword_267D25370, &unk_26CED3BF0);
  }
  id v0 = (void *)qword_267D25368;

  return v0;
}

uint64_t sub_21DFEFFD4()
{
  qword_267D25368 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLAudiobookMLImporter");

  return MEMORY[0x270F9A758]();
}

id BLBooksAskPermissionExtensionLog()
{
  if (qword_267D25380 != -1) {
    dispatch_once(&qword_267D25380, &unk_26CED3C10);
  }
  id v0 = (void *)qword_267D25378;

  return v0;
}

uint64_t sub_21DFF006C()
{
  qword_267D25378 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLBooksAskPermissionExtensionLog");

  return MEMORY[0x270F9A758]();
}

id BLBooksDiagnosticExtensionLog()
{
  if (qword_267D25390 != -1) {
    dispatch_once(&qword_267D25390, &unk_26CED3C30);
  }
  id v0 = (void *)qword_267D25388;

  return v0;
}

uint64_t sub_21DFF0104()
{
  qword_267D25388 = (uint64_t)os_log_create("com.apple.iBooks.BookLibrary", "BLBooksDiagnosticExtensionLog");

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFF0A9C()
{
  qword_267D253A0 = objc_alloc_init(BLEduCloudContainer);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFF0C78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(a1 + 32) + 24) = objc_msgSend_URLForUbiquityContainerIdentifier_(*(void **)(a1 + 40), a2, @"iCloud.com.apple.iBooks.iTunesU", a4);

  return MEMORY[0x270F9A758]();
}

void sub_21DFF0D80(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_containerURL(*(void **)(a1 + 32), a2, a3, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_URLByAppendingPathComponent_(v10, v5, @"Documents", v6);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v7;
}

void sub_21DFF1684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_21DFF16E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21DFF16F0(uint64_t a1)
{
}

void sub_21DFF16F8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = objc_msgSend_path(a2, (const char *)a2, a3, a4);
  uint64_t v7 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v7 + 40);
  char v9 = objc_msgSend_writeBinaryPropertyList_toPath_error_(BLLibraryUtility, v8, v5, (uint64_t)v6, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
}

id deleteItemAtURLCoordinated(void *a1)
{
  id v1 = (void *)MEMORY[0x263F08850];
  id v2 = a1;
  uint64_t v6 = objc_msgSend_defaultManager(v1, v3, v4, v5);
  id v7 = objc_alloc(MEMORY[0x263F08830]);
  id v10 = objc_msgSend_initWithFilePresenter_(v7, v8, 0, v9);
  uint64_t v18 = v6;
  id v19 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21DFF1BF4;
  v17[3] = &unk_26448B778;
  id v11 = v6;
  objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(v10, v12, (uint64_t)v2, 1, &v19, v17);

  id v13 = v19;
  uint64_t v14 = v18;
  id v15 = v13;

  return v15;
}

void sub_21DFF1BF4(uint64_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  id v7 = 0;
  char v3 = objc_msgSend_removeItemAtURL_error_(v2, a2, (uint64_t)a2, (uint64_t)&v7);
  id v4 = v7;
  uint64_t v5 = v4;
  if ((v3 & 1) == 0 && v4)
  {
    uint64_t v6 = BLDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_ERROR, "Failed to delete iTunesU file with error:  %@", buf, 0xCu);
    }
  }
}

void sub_21DFF2628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFF2654(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21DFF26FC;
  v9[3] = &unk_26448B7A0;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v4;
  v9[4] = v5;
  id v6 = v3;
  id v8 = (id)objc_msgSend_performMetadataActionOnCloudURL_action_(v5, v7, (uint64_t)v6, (uint64_t)v9);
}

void sub_21DFF26FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void **)(a1 + 32);
  objc_msgSend_dictionaryWithDictionary_(NSDictionary, a2, (uint64_t)a2, a4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend_path(*(void **)(a1 + 40), v6, v7, v8);
  uint64_t v11 = objc_msgSend_dictionaryAsBookItem_path_(v5, v10, (uint64_t)v14, (uint64_t)v9);
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_21DFF2798(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = BLDefaultLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v19 = 138412546;
      id v20 = v3;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_ERROR, "Encountered error doing a coordinated read of %@. Error:  %@", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_DEBUG, "coordinated read taken for: %@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v11 = objc_msgSend_lastPathComponent(v3, v8, v9, v10);
    id v15 = objc_msgSend_pathExtension(v11, v12, v13, v14);
    int isEqualToString = objc_msgSend_isEqualToString_(@"cloudItem", v16, (uint64_t)v15, v17);

    if (isEqualToString) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_21DFF2A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFF2AA4(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1[4])
  {
    id v2 = BLDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = a1[6];
      uint64_t v4 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_ERROR, "Encountered error doing a coordinated read of %@. Error:  %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = (void *)a1[5];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_21DFF2BEC;
    v10[3] = &unk_26448B7A0;
    v10[4] = v5;
    long long v9 = *((_OWORD *)a1 + 3);
    id v6 = (id)v9;
    long long v11 = v9;
    id v8 = (id)objc_msgSend_performMetadataActionOnCloudURL_action_(v5, v7, (uint64_t)v6, (uint64_t)v10);
  }
}

void sub_21DFF2BEC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void **)(a1 + 32);
  objc_msgSend_dictionaryWithDictionary_(NSDictionary, a2, (uint64_t)a2, a4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  long long v9 = objc_msgSend_path(*(void **)(a1 + 40), v6, v7, v8);
  uint64_t v11 = objc_msgSend_dictionaryAsBookItem_path_(v5, v10, (uint64_t)v14, (uint64_t)v9);
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void sub_21DFF34DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [BLHLSGroup alloc];
  id v11 = (id)objc_msgSend_initWithGroupID_media_(v7, v8, (uint64_t)v6, (uint64_t)v5);

  objc_msgSend_addObject_(*(void **)(a1 + 32), v9, (uint64_t)v11, v10);
}

uint64_t sub_21DFF42E0(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F08B08];
  id v2 = a1;
  id v3 = [v1 alloc];
  id v6 = objc_msgSend_initWithString_(v3, v4, (uint64_t)v2, v5);

  uint64_t v11 = 0;
  objc_msgSend_scanUnsignedLongLong_(v6, v7, (uint64_t)&v11, v8);
  uint64_t v9 = v11;

  return v9;
}

uint64_t sub_21DFF59D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v4, a1, v5);
  uint64_t v9 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v7, (uint64_t)v3, v8);

  if (v6)
  {
    if (v9) {
      uint64_t v12 = objc_msgSend_compare_(v6, v10, (uint64_t)v9, v11);
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else if (v9)
  {
    uint64_t v12 = -1;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t sub_21DFF5B60()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = (void *)qword_26AB3FF48;
  qword_26AB3FF48 = (uint64_t)v0;

  uint64_t v4 = (void *)qword_26AB3FF48;

  return objc_msgSend_setDateFormat_(v4, v2, @"~~~~~HH:mm:ss;yyyy-MM-dd", v3);
}

uint64_t sub_21DFF6118(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v7 = objc_msgSend_lastPathComponent(v2, v4, v5, v6);
  uint64_t isEqual = objc_msgSend_isEqual_(v3, v8, (uint64_t)v7, v9);

  return isEqual;
}

uint64_t sub_21DFF7C78()
{
  id v0 = objc_alloc(NSDictionary);
  qword_267D253B0 = objc_msgSend_initWithObjectsAndKeys_(v0, v1, @"zh", v2, @"chinese", @"tr", @"turkish", @"pl", @"polish", @"uk", @"ukrainian", 0);

  return MEMORY[0x270F9A758]();
}

void sub_21DFF9564(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_bu_booksRepositoryURL(NSURL, a2, a3, a4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_path(v12, v4, v5, v6);
  uint64_t v10 = objc_msgSend_stringByAppendingPathComponent_(v7, v8, @"Purchases", v9);
  uint64_t v11 = (void *)qword_26AB400B8;
  qword_26AB400B8 = v10;
}

void sub_21DFF9634()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    uint64_t v2 = (void *)v0;
    id v3 = objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(NSURL, v1, v0, 1, 0);
    uint64_t v6 = objc_msgSend_URLByAppendingPathComponent_(v3, v4, @"Library", v5);

    free(v2);
  }
  else
  {
    uint64_t v10 = BLDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "systemgroup.com.apple.media.books.managed";
      __int16 v15 = 2048;
      uint64_t v16 = 1;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_ERROR, "Error getting system group container: %s => %llu", buf, 0x16u);
    }

    uint64_t v6 = 0;
  }
  uint64_t v11 = objc_msgSend_path(v6, v7, v8, v9);
  id v12 = (void *)qword_26AB400A8;
  qword_26AB400A8 = v11;
}

void sub_21DFF9838()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    uint64_t v2 = (void *)v0;
    uint64_t v3 = objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(NSURL, v1, v0, 1, 0);
    uint64_t v4 = (void *)qword_26AB40048;
    qword_26AB40048 = v3;

    free(v2);
  }
  else
  {
    uint64_t v5 = BLDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v7 = "systemgroup.com.apple.media.shared.books";
      __int16 v8 = 2048;
      uint64_t v9 = 1;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "Error getting system group container: %s => %llu", buf, 0x16u);
    }
  }
}

void sub_21DFF99E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (objc_msgSend__isMultiUser(BLLibraryUtility, a2, a3, a4))
  {
    uint64_t v4 = objc_opt_class();
    __int16 v8 = objc_msgSend_sharedContainerURL(v4, v5, v6, v7);
    uint64_t v11 = objc_msgSend_URLByAppendingPathComponent_(v8, v9, @"Library", v10);

    id v33 = 0;
    uint64_t v12 = *MEMORY[0x263EFF6B0];
    id v32 = 0;
    int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v11, v13, (uint64_t)&v33, v12, &v32);
    id v15 = v33;
    id v19 = v32;
    if (ResourceValue_forKey_error)
    {
      if (v15 && (objc_msgSend_BOOLValue(v15, v16, v17, v18) & 1) != 0) {
        goto LABEL_13;
      }
      id v31 = v19;
      char v22 = objc_msgSend_setResourceValue_forKey_error_(v11, v16, MEMORY[0x263EFFA88], v12, &v31);
      id v23 = v31;

      if (v22)
      {
LABEL_12:
        id v19 = v23;
LABEL_13:
        uint64_t v29 = objc_msgSend_path(v11, v16, v20, v21);
        uint64_t v30 = (void *)qword_267D253B8;
        qword_267D253B8 = v29;

        return;
      }
      uint64_t v24 = BLDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = objc_msgSend_lastPathComponent(v11, v25, v26, v27);
        *(_DWORD *)buf = 138412546;
        id v35 = v28;
        __int16 v36 = 2112;
        id v37 = v23;
        _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_ERROR, "Error excluding %@ from backup:  %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v24 = BLDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v19;
        _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_ERROR, "Error encountered accessing resource value for backup exclusion key. Error:  %@", buf, 0xCu);
      }
      id v23 = v19;
    }

    goto LABEL_12;
  }
}

id BLBundle()
{
  if (qword_267D253D0 != -1) {
    dispatch_once(&qword_267D253D0, &unk_26CED3D30);
  }
  uint64_t v0 = (void *)qword_267D253C8;

  return v0;
}

uint64_t sub_21DFF9CCC()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  qword_267D253C8 = objc_msgSend_bundleForClass_(v0, v2, v1, v3);

  return MEMORY[0x270F9A758]();
}

void sub_21DFFA6E0(uint64_t a1)
{
  uint64_t v2 = BLServiceProxyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] bookassetd has started.", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__createAndStartConnection(WeakRetained, v4, v5, v6);
}

void sub_21DFFA860(uint64_t a1)
{
  uint64_t v2 = BLServiceProxyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] The connection to bookassetd was interrupted.", buf, 2u);
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    uint64_t v7 = sub_21DFFA990;
    __int16 v8 = &unk_26448B8F8;
    objc_copyWeak(&v9, v3);
    uint64_t v5 = v6;
    os_unfair_lock_lock(WeakRetained + 2);
    v7((uint64_t)v5);
    os_unfair_lock_unlock(WeakRetained + 2);

    objc_destroyWeak(&v9);
  }
}

void sub_21DFFA97C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21DFFA990(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setState_(WeakRetained, v1, 3, v2);
}

void sub_21DFFA9D4(uint64_t a1)
{
  uint64_t v2 = BLServiceProxyLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_ERROR, "[BLServiceProxy] The connection to bookassetd was invalidated.", buf, 2u);
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    uint64_t v7 = sub_21DFFAB04;
    __int16 v8 = &unk_26448B8F8;
    objc_copyWeak(&v9, v3);
    uint64_t v5 = v6;
    os_unfair_lock_lock(WeakRetained + 2);
    v7((uint64_t)v5);
    os_unfair_lock_unlock(WeakRetained + 2);

    objc_destroyWeak(&v9);
  }
}

void sub_21DFFAAF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21DFFAB04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend_state(WeakRetained, v1, v2, v3) != 1) {
    objc_msgSend_setState_(WeakRetained, v4, 4, v5);
  }
  objc_msgSend_setConnection_(WeakRetained, v4, 0, v5);
}

void sub_21DFFAB64(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = BLServiceProxyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_ERROR, "Remote proxy hit an error:  %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_21DFFAD04(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = BLServiceProxyLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_ERROR, "Synchronous Remote proxy hit an error:  %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_21DFFADE4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFAF60(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFB468(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, void, id))(v3 + 16))(v3, 0, 0, v5);
  }
}

void sub_21DFFB604(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFB780(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFB90C(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFBA98(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFBC14(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFBDAC(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFBF14(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, MEMORY[0x263EFFA68], v5);
  }
}

void sub_21DFFC0A4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void sub_21DFFC374(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFC650(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFC7CC(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFC948(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

void sub_21DFFCF4C(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void, id))(v3 + 16))(v3, 0, 0, 0, 0, v5);
  }
}

void sub_21DFFD208(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v5);
  }
}

uint64_t sub_21DFFD354()
{
  qword_26AB3FF30 = objc_alloc_init(BLPrivacyInfo);

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21DFFE6E0(void *a1)
{
  id v1 = a1;
  if (qword_267D253E8 != -1) {
    dispatch_once(&qword_267D253E8, &unk_26CED3D90);
  }
  if (objc_opt_isKindOfClass()) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

Class sub_21E000E28()
{
  qword_267D253E0 = (uint64_t)NSClassFromString(&cfstr_Ssdownloadmana.isa);
  Class result = NSClassFromString(&cfstr_Ssdownloadmana_0.isa);
  qword_267D253D8 = (uint64_t)result;
  return result;
}

uint64_t sub_21E000F04()
{
  qword_26AB3FFB0 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

uint64_t alignedSInt8FromByte(char *a1)
{
  return *a1;
}

uint64_t alignedUInt8FromByte(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t alignedUInt16FromByte(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t alignedSInt16FromByte(__int16 *a1)
{
  return *a1;
}

uint64_t alignedUInt32FromByte(unsigned int *a1)
{
  return *a1;
}

uint64_t alignedUInt64FromByte(uint64_t a1)
{
  return *(void *)a1;
}

void sub_21E0092E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E0092FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E00930C(uint64_t a1)
{
}

void sub_21E009314(uint64_t a1, void *a2)
{
}

void sub_21E009494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E0094BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_21E00975C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E009784(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_21E009920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E009938(uint64_t a1, void *a2)
{
}

void sub_21E009B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E009BA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E009BB8(uint64_t a1)
{
}

void sub_21E009BC0(uint64_t a1, void *a2)
{
}

void sub_21E009D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E009D5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_21E009EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E009EF4(uint64_t a1, void *a2)
{
}

void sub_21E00A35C(uint64_t a1, void *a2, void *a3, void *a4)
{
  v61[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    objc_opt_class();
    uint64_t v13 = BUDynamicCast();
    uint64_t v12 = v13;
    if (v13
      && (objc_msgSend_statusCode(v13, v14, v15, v16) < 200 || objc_msgSend_statusCode(v12, v17, v18, v19) >= 300))
    {
      BLAudiobookSyncLog();
      uint64_t v20 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
        sub_21E03ADF8(v12, v20, v21, v22);
      }

      id v26 = (id)MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
      if (!v26) {
        goto LABEL_21;
      }
      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      long long v60 = @"BLKeyHTTPResponseCode";
      uint64_t v28 = NSNumber;
      uint64_t v29 = objc_msgSend_statusCode(v12, v23, v24, v25);
      id v32 = objc_msgSend_numberWithInteger_(v28, v30, v29, v31);
      v61[0] = v32;
      uint64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v61, (uint64_t)&v60, 1);
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v35, @"BLErrorDomain", 39, v34);
      __int16 v36 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void))v26 + 2))(v26, 0, v36);
    }
    else
    {
      id v37 = BLAudiobookSyncLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFE3000, v37, OS_LOG_TYPE_DEFAULT, "Downloaded master playlist, about to parse it.", buf, 2u);
      }

      id v55 = 0;
      id v32 = objc_msgSend_playlistParsingURL_error_(BLHLSPlaylist, v38, (uint64_t)v7, (uint64_t)&v55);
      id v26 = v55;
      uint64_t v34 = objc_msgSend_preferredStreamFromMasterPlaylist_(BLHLSAudiobookFetcher, v39, (uint64_t)v32, v40);
      if (v34)
      {
        uint64_t v41 = BLAudiobookSyncLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = objc_msgSend_streamInfs(v32, v42, v43, v44);
          uint64_t v49 = objc_msgSend_count(v45, v46, v47, v48);
          *(_DWORD *)buf = 134218242;
          uint64_t v57 = v49;
          __int16 v58 = 2112;
          long long v59 = v34;
          _os_log_impl(&dword_21DFE3000, v41, OS_LOG_TYPE_DEFAULT, "Parsed master playlist. Out of a total of %lu choices, using streamInf: %@", buf, 0x16u);
        }
        uint64_t v50 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
        __int16 v36 = (void (**)(void, void, void))v50;
        if (v50) {
          (*(void (**)(uint64_t, void *, void))(v50 + 16))(v50, v34, 0);
        }
      }
      else
      {
        uint64_t v51 = BLAudiobookSyncLog();
        BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
        if (v32)
        {
          if (v52) {
            sub_21E03AD90();
          }

          uint64_t v51 = v26;
          id v26 = 0;
        }
        else if (v52)
        {
          sub_21E03AD28();
        }

        __int16 v36 = (void (**)(void, void, void))MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
        if (v36)
        {
          uint64_t v54 = objc_msgSend_bu_errorWithDomain_code_description_underlyingError_(MEMORY[0x263F087E8], v53, @"BLErrorDomain", 2, @"Unable to parse master HLS Playlist", v26);
          ((void (**)(void, void, void *))v36)[2](v36, 0, v54);
        }
      }
    }

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v10 = BLAudiobookSyncLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_21E03AE70();
  }

  uint64_t v11 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v9);
  }
LABEL_22:
}

void sub_21E00A840(uint64_t a1, void *a2, void *a3, void *a4)
{
  v47[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    objc_opt_class();
    uint64_t v13 = BUDynamicCast();
    uint64_t v12 = v13;
    if (v13
      && (objc_msgSend_statusCode(v13, v14, v15, v16) < 200 || objc_msgSend_statusCode(v12, v17, v18, v19) >= 300))
    {
      BLAudiobookSyncLog();
      uint64_t v20 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
        sub_21E03ADF8(v12, v20, v21, v22);
      }

      id v26 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
      if (!v26) {
        goto LABEL_23;
      }
      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = @"BLKeyHTTPResponseCode";
      uint64_t v28 = NSNumber;
      uint64_t v29 = objc_msgSend_statusCode(v12, v23, v24, v25);
      id v32 = objc_msgSend_numberWithInteger_(v28, v30, v29, v31);
      v47[0] = v32;
      uint64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v47, (uint64_t)&v46, 1);
      __int16 v36 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v35, @"BLErrorDomain", 39, v34);
      ((void (*)(NSObject *, void, void *))v26[2].isa)(v26, 0, v36);
    }
    else
    {
      id v37 = BLAudiobookSyncLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFE3000, v37, OS_LOG_TYPE_DEFAULT, "Downloaded master playlist, about to parse it to get racGUID.", buf, 2u);
      }

      id v44 = 0;
      uint64_t v34 = objc_msgSend_playlistParsingURL_error_(BLHLSPlaylist, v38, (uint64_t)v7, (uint64_t)&v44);
      id v26 = v44;
      if (v34)
      {
        id v32 = objc_msgSend_racGUID(v34, v39, v40, v41);
        uint64_t v42 = v26;
        id v26 = 0;
      }
      else
      {
        uint64_t v42 = BLAudiobookSyncLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_21E03AD28();
        }
        id v32 = 0;
      }

      uint64_t v43 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
      __int16 v36 = (void *)v43;
      if (v43) {
        (*(void (**)(uint64_t, void *, NSObject *))(v43 + 16))(v43, v32, v26);
      }
    }

LABEL_23:
    goto LABEL_24;
  }
  uint64_t v10 = BLAudiobookSyncLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_21E03AE70();
  }

  uint64_t v11 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v9);
  }
LABEL_24:
}

void sub_21E00AB68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21E00AB90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21E00ABB0(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_valueForKey_(a1, v7, (uint64_t)v14, v8);
  uint64_t v12 = v9;
  if (v6)
  {
    if ((objc_msgSend_isEqualToString_(v9, v10, (uint64_t)v6, v11) & 1) == 0) {
      objc_msgSend_setValue_forKey_(a1, v13, (uint64_t)v6, (uint64_t)v14);
    }
  }
  else if (v9)
  {
    objc_msgSend_setValue_forKey_(a1, v10, 0, (uint64_t)v14);
  }
}

void sub_21E00AC58(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_valueForKey_(a1, v7, (uint64_t)v14, v8);
  uint64_t v12 = v9;
  if (v6)
  {
    if ((objc_msgSend_isEqualToNumber_(v9, v10, (uint64_t)v6, v11) & 1) == 0) {
      objc_msgSend_setValue_forKey_(a1, v13, (uint64_t)v6, (uint64_t)v14);
    }
  }
  else if (v9)
  {
    objc_msgSend_setValue_forKey_(a1, v10, 0, (uint64_t)v14);
  }
}

void sub_21E00AD00(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_valueForKey_(a1, v7, (uint64_t)v14, v8);
  uint64_t v12 = v9;
  if (v6)
  {
    if ((objc_msgSend_isEqualToDate_(v9, v10, (uint64_t)v6, v11) & 1) == 0) {
      objc_msgSend_setValue_forKey_(a1, v13, (uint64_t)v6, (uint64_t)v14);
    }
  }
  else if (v9)
  {
    objc_msgSend_setValue_forKey_(a1, v10, 0, (uint64_t)v14);
  }
}

void sub_21E00ADA8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_valueForKey_(a1, v7, (uint64_t)v14, v8);
  uint64_t v12 = v9;
  if (v6)
  {
    if ((objc_msgSend_isEqualToDictionary_(v9, v10, (uint64_t)v6, v11) & 1) == 0) {
      objc_msgSend_setValue_forKey_(a1, v13, (uint64_t)v6, (uint64_t)v14);
    }
  }
  else if (v9)
  {
    objc_msgSend_setValue_forKey_(a1, v10, 0, (uint64_t)v14);
  }
}

void *sub_21E00AE50(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    return objc_msgSend_setValue_forKey_(a1, a2, a3, a4);
  }
  return a1;
}

uint64_t BLItemImageSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  uint64_t result = 1;
  if (a2 != 0.0 && a1 != 0.0 && a4 != 0.0 && a3 != 0.0 && a1 / a2 != a3 / a4) {
    return 0;
  }
  return result;
}

__CFString *NSStringFromBLDownloadState(unint64_t a1)
{
  if (a1 > 0x10) {
    return @"BLDownloadStateUnknown";
  }
  else {
    return off_26448BB50[a1];
  }
}

id BLDownloadSupportedDownloadKinds()
{
  if (qword_26AB3FF00 != -1) {
    dispatch_once(&qword_26AB3FF00, &unk_26CED3DB0);
  }
  uint64_t v0 = (void *)qword_26AB3FF08;

  return v0;
}

void sub_21E00C7E8(uint64_t a1, const char *a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"book";
  v4[1] = @"ebook";
  v4[2] = @"pdf";
  uint64_t v2 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v4, 3);
  uint64_t v3 = (void *)qword_26AB3FF08;
  qword_26AB3FF08 = v2;
}

void sub_21E00E568(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

void sub_21E00E714(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = BLDefaultLog();
  id v8 = v7;
  if (v6)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v16 = 138412290;
    id v17 = v6;
    uint64_t v9 = "[UIHostServiceProxy] received error from AMSSystemAlertDialogTask:  %@";
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
    uint64_t v9 = "[UIHostServiceProxy] received result from AMSSystemAlertDialogTask for request %@ and calling replay block with result %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 22;
  }
  _os_log_impl(&dword_21DFE3000, v10, v11, v9, (uint8_t *)&v16, v12);
LABEL_7:

  uint64_t v14 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void sub_21E00E97C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
}

void sub_21E00EDA8()
{
  uint64_t v0 = BLDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_21DFE3000, v0, OS_LOG_TYPE_FAULT, "Failed to complete backgound task after file lock. This will most likely result in a crash", v1, 2u);
  }
}

uint64_t sub_21E00F0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CED3DF0, a4);
}

uint64_t sub_21E00F0E0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v9 = a4;
  if (a3 == 6)
  {
    uint64_t v10 = (uint64_t *)MEMORY[0x263F27850];
  }
  else
  {
    if (a3 != 16)
    {
      uint64_t isEqualToString = 0;
      goto LABEL_7;
    }
    uint64_t v10 = (uint64_t *)BLErrorDomain;
  }
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v10, v8);
LABEL_7:

  return isEqualToString;
}

BOOL sub_21E00F164(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_domain(a1, a2, a3, a4);
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, *MEMORY[0x263F27850], v7);

  if (!isEqualToString) {
    return 0;
  }
  objc_opt_class();
  uint32_t v12 = objc_msgSend_userInfo(a1, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, *MEMORY[0x263F27870], v14);
  int v16 = BUDynamicCast();

  BOOL v20 = objc_msgSend_longValue(v16, v17, v18, v19) == 401;
  return v20;
}

id sub_21E00F228(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_userInfo(a1, a2, a3, a4);
  if (objc_msgSend_count(v5, v6, v7, v8))
  {
    uint64_t v53 = a1;
    uint32_t v12 = objc_msgSend_mutableCopy(v5, v9, v10, v11);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v54 = v5;
    id v13 = v5;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v56, (uint64_t)v64, 16);
    unint64_t v18 = 0x263F08000uLL;
    if (v15)
    {
      uint64_t v19 = v15;
      uint64_t v20 = *(void *)v57;
      uint64_t v55 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v57 != v20) {
            objc_enumerationMutation(v13);
          }
          uint64_t v22 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          id v23 = objc_msgSend_objectForKeyedSubscript_(v13, v16, v22, v17);
          objc_opt_class();
          uint64_t v24 = BUDynamicCast();
          uint64_t v28 = v24;
          if (v24)
          {
            uint64_t v29 = objc_msgSend_bl_securelyCodableError(v24, v25, v26, v27);
            objc_msgSend_setObject_forKeyedSubscript_(v12, v30, (uint64_t)v29, v22);
          }
          else
          {
            objc_opt_class();
            uint64_t v29 = BUClassAndProtocolCast();
            uint64_t v31 = objc_opt_class();
            if ((objc_msgSend_supportsSecureCoding(v31, v32, v33, v34, &unk_26CEE5BF0) & 1) == 0)
            {
              unint64_t v35 = v18;
              __int16 v36 = BLDefaultLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                id v37 = (objc_class *)objc_opt_class();
                Name = class_getName(v37);
                *(_DWORD *)buf = 138412546;
                uint64_t v61 = v22;
                __int16 v62 = 2080;
                uint64_t v63 = Name;
                _os_log_impl(&dword_21DFE3000, v36, OS_LOG_TYPE_ERROR, "userInfo[%@] of class '%s' does not support NSSecureCoding", buf, 0x16u);
              }

              objc_msgSend_removeObjectForKey_(v12, v39, v22, v40);
              unint64_t v18 = v35;
              uint64_t v20 = v55;
            }
          }
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v56, (uint64_t)v64, 16);
      }
      while (v19);
    }

    uint64_t v41 = *(void **)(v18 + 2024);
    uint64_t v45 = objc_msgSend_domain(v53, v42, v43, v44);
    uint64_t v49 = objc_msgSend_code(v53, v46, v47, v48);
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v50, (uint64_t)v45, v49, v12);
    id v51 = (id)objc_claimAutoreleasedReturnValue();

    id v5 = v54;
  }
  else
  {
    id v51 = a1;
  }

  return v51;
}

uint64_t BLGetItemIdentifierFromValue()
{
  return MEMORY[0x270F12808]();
}

uint64_t BLGetUnsignedLongLongFromValue()
{
  return MEMORY[0x270F12808]();
}

id BLGetNSNumberFromValue(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    id v6 = (const char *)objc_msgSend_UTF8String(v2, v3, v4, v5);
    unint64_t v7 = strtoull(v6, 0, 10);
    objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v8, v7, v9);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v1;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

id sub_21E00FC8C(xmlTextReader *a1)
{
  String = xmlTextReaderReadString(a1);
  if (String || (String = xmlTextReaderReadInnerXml(a1)) != 0)
  {
    id v3 = [NSString alloc];
    id v6 = objc_msgSend_initWithUTF8String_(v3, v4, (uint64_t)String, v5);
    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(String);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_21E010608(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int buf,long long a26)
{
  if (a2 == 1)
  {
    id v27 = objc_begin_catch(exc_buf);
    uint64_t v28 = BLDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      buf = 138412546;
      WORD2(a26) = 2112;
      *(void *)((char *)&a26 + 6) = v27;
      _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_ERROR, "Encountered exception parsing %@. %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x21E010538);
  }
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(exc_buf);
}

uint64_t sub_21E010778(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E010788(uint64_t a1)
{
}

void sub_21E010790(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = BLDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_ERROR, "Error creating zip archive at %@. error:  %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_21E010FF8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_sharedManager(MEMORY[0x263F841A8], a2, a3, a4);
  objc_msgSend_currentUser(v4, v5, v6, v7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  byte_26AB3FEF0 = objc_msgSend_userType(v11, v8, v9, v10) == 1;
}

id sub_21E011070(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_dataUsingEncoding_(a1, a2, 2483028224, a4);
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  unint64_t v8 = objc_msgSend_length(v4, v5, v6, v7);
  id v9 = v4;
  uint64_t v13 = objc_msgSend_bytes(v9, v10, v11, v12);
  if (v8)
  {
    __int16 v14 = (char *)v13;
    do
    {
      if (v8 >= 0xFFFFFFFF) {
        uint64_t v15 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v15 = v8;
      }
      CC_MD5_Update(&c, v14, v15);
      v14 += v15;
      v8 -= v15;
    }
    while (v8);
  }
  CC_MD5_Final(md, &c);
  objc_msgSend_stringWithFormat_(NSString, (const char *)v20, @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", v22, md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], v20, v21, v22, v23, v24,
  uint64_t v16 = v25);

  return v16;
}

id sub_21E0111EC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend_dataUsingEncoding_(a1, a2, 2483028224, a4);
  id v4 = objc_claimAutoreleasedReturnValue();
  unint64_t v8 = (const void *)objc_msgSend_bytes(v4, v5, v6, v7);
  CC_LONG v12 = objc_msgSend_length(v4, v9, v10, v11);
  CC_SHA1(v8, v12, md);
  unint64_t v18 = objc_msgSend_string(MEMORY[0x263F089D8], v13, v14, v15);
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend_appendFormat_(v18, v16, @"%02x", v17, md[i]);

  return v18;
}

id sub_21E0112E0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4 = objc_msgSend_absoluteString(a1, a2, a3, a4);
  unint64_t v8 = objc_msgSend_bl_sha1(v4, v5, v6, v7);

  return v8;
}

void sub_21E0114FC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = BLServiceLog();
  unint64_t v8 = v7;
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
  _os_log_impl(&dword_21DFE3000, v11, v12, v10, (uint8_t *)&v16, 0x16u);
LABEL_7:

  uint64_t v14 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
  }
}

void sub_21E0119C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_UUID(MEMORY[0x263F08C38], a2, a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_UUIDString(v9, v4, v5, v6);
  unint64_t v8 = (void *)qword_267D253F0;
  qword_267D253F0 = v7;
}

uint64_t sub_21E012B00(void *a1, void *a2)
{
  id v3 = a2;
  objc_msgSend_imageSize(a1, v4, v5, v6);
  double v8 = v7;
  objc_msgSend_imageSize(v3, v9, v10, v11);
  double v13 = v12;

  if (v8 < v13) {
    return -1;
  }
  else {
    return v8 > v13;
  }
}

uint64_t sub_21E013490(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = *MEMORY[0x263EFF710];
  id v11 = 0;
  objc_msgSend_getResourceValue_forKey_error_(a1, a2, (uint64_t)&v12, v3, &v11);
  id v4 = v12;
  id v7 = v11;
  if (v7)
  {
    double v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Error -[NSURL bl_isUbiquitous]:  %@", buf, 0xCu);
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend_bl_BOOLFromResourceValue_(a1, v5, (uint64_t)v4, v6);
  }

  return v9;
}

uint64_t sub_21E01359C(void *a1, const char *a2)
{
  uint64_t v6 = 0;
  objc_msgSend_getResourceValue_forKey_error_(a1, a2, (uint64_t)&v6, *MEMORY[0x263EFF7B8], 0);
  return objc_msgSend_BOOLValue(v6, v2, v3, v4);
}

uint64_t sub_21E0135DC(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = *MEMORY[0x263EFF7B0];
  id v11 = 0;
  objc_msgSend_getResourceValue_forKey_error_(a1, a2, (uint64_t)&v12, v3, &v11);
  id v4 = v12;
  id v7 = v11;
  if (v7)
  {
    double v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Error -[NSURL bl_isDownloaded]:  %@", buf, 0xCu);
    }

    uint64_t isDownloadedWithResourceValue = 0;
  }
  else
  {
    uint64_t isDownloadedWithResourceValue = objc_msgSend_bl_isDownloadedWithResourceValue_(a1, v5, (uint64_t)v4, v6);
  }

  return isDownloadedWithResourceValue;
}

uint64_t sub_21E0136E8(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = 0;
  uint64_t v3 = *MEMORY[0x263EFF7C0];
  id v11 = 0;
  objc_msgSend_getResourceValue_forKey_error_(a1, a2, (uint64_t)&v12, v3, &v11);
  id v4 = v12;
  id v7 = v11;
  if (v7)
  {
    double v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Error -[NSURL bl_isDownloading]:  %@", buf, 0xCu);
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend_bl_BOOLFromResourceValue_(a1, v5, (uint64_t)v4, v6);
  }

  return v9;
}

uint64_t sub_21E0137F4(void *a1, const char *a2)
{
  uint64_t v6 = 0;
  objc_msgSend_getResourceValue_forKey_error_(a1, a2, (uint64_t)&v6, *MEMORY[0x263EFF7D8], 0);
  return objc_msgSend_BOOLValue(v6, v2, v3, v4);
}

uint64_t sub_21E013834(void *a1, const char *a2)
{
  uint64_t v6 = 0;
  objc_msgSend_getResourceValue_forKey_error_(a1, a2, (uint64_t)&v6, *MEMORY[0x263EFF7E0], 0);
  return objc_msgSend_BOOLValue(v6, v2, v3, v4);
}

uint64_t sub_21E013874(void *a1, const char *a2)
{
  v34[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFF710];
  uint64_t v4 = *MEMORY[0x263EFF7B0];
  v34[0] = *MEMORY[0x263EFF710];
  v34[1] = v4;
  uint64_t v5 = *MEMORY[0x263EFF7C0];
  v34[2] = *MEMORY[0x263EFF7C0];
  uint64_t v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v34, 3);
  id v31 = 0;
  double v8 = objc_msgSend_resourceValuesForKeys_error_(a1, v7, (uint64_t)v6, (uint64_t)&v31);
  id v9 = v31;

  if (v9)
  {
    id v12 = BLDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v9;
      _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "Error querying bl_isUbiquitousPromise  %@", buf, 0xCu);
    }

    uint64_t v13 = 0;
  }
  else
  {
    id v14 = objc_msgSend_objectForKeyedSubscript_(v8, v10, v3, v11);
    int v17 = objc_msgSend_bl_BOOLFromResourceValue_(a1, v15, (uint64_t)v14, v16);

    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v8, v18, v5, v19);
    int v23 = objc_msgSend_bl_BOOLFromResourceValue_(a1, v21, (uint64_t)v20, v22);

    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v8, v24, v4, v25);
    int isDownloadedWithResourceValue = objc_msgSend_bl_isDownloadedWithResourceValue_(a1, v27, (uint64_t)v26, v28);

    if (v17) {
      uint64_t v13 = (v23 | isDownloadedWithResourceValue) ^ 1u;
    }
    else {
      uint64_t v13 = 0;
    }
  }

  return v13;
}

uint64_t sub_21E013A44(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = BUDynamicCast();

  uint64_t v8 = objc_msgSend_BOOLValue(v4, v5, v6, v7);
  return v8;
}

uint64_t sub_21E013AA0(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = BUDynamicCast();

  if (objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x263EFF7A0], v6)) {
    uint64_t isEqualToString = 1;
  }
  else {
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v4, v7, *MEMORY[0x263EFF7A8], v8);
  }

  return isEqualToString;
}

void sub_21E0142E0(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  uint64_t v6 = objc_msgSend_bundleForClass_(v2, v4, v3, v5);
  uint64_t v8 = objc_msgSend_pathForResource_ofType_(v6, v7, @"BKPurchases", @"momd");

  if (!v8) {
    objc_msgSend_raise_format_(MEMORY[0x263EFF940], v9, @"[BLJaliscoServerSource managedObjectModel]", @"[[NSBundle bundleForClass:[self class]] pathForResource:@'BKPurchases' ofType:@'momd'] failed");
  }
  objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v9, (uint64_t)v8, 1);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = objc_alloc(MEMORY[0x263EFF298]);
  uint64_t v13 = objc_msgSend_initWithContentsOfURL_(v10, v11, (uint64_t)v16, v12);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v13;
}

void sub_21E014A70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend__persistentStoreOptions(*(void **)(a1 + 32), a2, a3, a4);
  int v9 = objc_msgSend_p_databaseExistsAtSharediBooksContainerLocation(*(void **)(a1 + 32), v6, v7, v8);
  int v13 = objc_msgSend_p_databaseExistsAtPrivateiBooksContainerLocation(*(void **)(a1 + 32), v10, v11, v12);
  if ((v9 | v13 ^ 1))
  {
    if ((v13 & 1) == 0) {
      objc_msgSend_p_createPersistentDirectoryIfNeeded(*(void **)(a1 + 32), v14, v15, v16);
    }
    id v17 = 0;
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x263EFF320]);
    uint64_t v22 = objc_msgSend_managedObjectModel(*(void **)(a1 + 32), v19, v20, v21);
    uint64_t v25 = objc_msgSend_initWithManagedObjectModel_(v18, v23, (uint64_t)v22, v24);

    uint64_t v26 = NSURL;
    uint64_t v30 = objc_msgSend_p_persistentStoreFullPathAtPrivateiBooksLocation(*(void **)(a1 + 32), v27, v28, v29);
    id v32 = objc_msgSend_fileURLWithPath_isDirectory_(v26, v31, (uint64_t)v30, 0);

    id v33 = NSURL;
    id v37 = objc_msgSend_p_persistentStoreFullPathAtSharediBooksLocation(*(void **)(a1 + 32), v34, v35, v36);
    uint64_t v39 = objc_msgSend_fileURLWithPath_isDirectory_(v33, v38, (uint64_t)v37, 0);

    objc_msgSend_p_createPersistentDirectoryIfNeeded(*(void **)(a1 + 32), v40, v41, v42);
    uint64_t v43 = *MEMORY[0x263EFF168];
    id v98 = 0;
    uint64_t v45 = objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(v25, v44, v43, 0, v32, v5, &v98);
    id v46 = v98;
    id v97 = v46;
    uint64_t v48 = objc_msgSend_migratePersistentStore_toURL_options_withType_error_(v25, v47, (uint64_t)v45, (uint64_t)v39, 0, v43, &v97);
    id v17 = v97;

    if (!v48 || v17)
    {
      uint64_t v49 = BLJaliscoLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v100 = v17;
        _os_log_impl(&dword_21DFE3000, v49, OS_LOG_TYPE_ERROR, "It looks like the migration failed:  %@", buf, 0xCu);
      }
    }
  }
  id v50 = objc_alloc(MEMORY[0x263EFF320]);
  uint64_t v54 = objc_msgSend_managedObjectModel(*(void **)(a1 + 32), v51, v52, v53);
  uint64_t v57 = objc_msgSend_initWithManagedObjectModel_(v50, v55, (uint64_t)v54, v56);
  uint64_t v58 = *(void *)(a1 + 32);
  long long v59 = *(void **)(v58 + 24);
  *(void *)(v58 + 24) = v57;

  long long v60 = NSURL;
  long long v64 = objc_msgSend_p_persistentStoreFullPathAtSharediBooksLocation(*(void **)(a1 + 32), v61, v62, v63);
  unint64_t v66 = objc_msgSend_fileURLWithPath_isDirectory_(v60, v65, (uint64_t)v64, 0);

  v67 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v68 = *MEMORY[0x263EFF168];
  id v96 = v17;
  uint64_t v70 = objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(v67, v69, v68, 0, v66, v5, &v96);
  uint64_t v71 = v96;

  if (v70)
  {
    id v73 = v71;
LABEL_22:
    uint64_t v85 = BLJaliscoLog();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      v89 = objc_msgSend_identifier(v70, v86, v87, v88);
      *(_DWORD *)buf = 138412546;
      id v100 = v66;
      __int16 v101 = 2112;
      long long v102 = v89;
      _os_log_impl(&dword_21DFE3000, v85, OS_LOG_TYPE_DEFAULT, "Added jalisco Persistent Store: %@ persistentstoreID:%@", buf, 0x16u);
    }
    goto LABEL_29;
  }
  if (v71)
  {
    uint64_t v74 = BLJaliscoLog();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v100 = v66;
      __int16 v101 = 2112;
      long long v102 = v71;
      _os_log_impl(&dword_21DFE3000, v74, OS_LOG_TYPE_ERROR, "Error adding local Persistent Store at URL: %@. Trying to recover %@", buf, 0x16u);
    }
  }
  v75 = *(void **)(*(void *)(a1 + 32) + 24);
  id v95 = 0;
  char v76 = objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(v75, v72, (uint64_t)v66, v68, 0, &v95);
  v80 = v95;
  if ((v76 & 1) == 0)
  {
    uint64_t v81 = BLJaliscoLog();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v100 = v66;
      __int16 v101 = 2112;
      long long v102 = v80;
      _os_log_impl(&dword_21DFE3000, v81, OS_LOG_TYPE_ERROR, "Could not remove local Persistent Store at URL: %@ %@", buf, 0x16u);
    }
  }
  objc_msgSend_p_createPersistentDirectoryIfNeeded(*(void **)(a1 + 32), v77, v78, v79);
  uint64_t v82 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v94 = v71;
  uint64_t v70 = objc_msgSend_addPersistentStoreWithType_configuration_URL_options_error_(v82, v83, v68, 0, v66, v5, &v94);
  id v73 = v94;

  if (v70) {
    goto LABEL_22;
  }
  uint64_t v90 = objc_msgSend_bu_errorWithDomain_code_description_underlyingError_(MEMORY[0x263F087E8], v84, @"BLJaliscoDAAPClientError", 2, @"Failed to add jalisco Persistent Store: %@", v73);
  uint64_t v85 = v90;
  if (*(void *)(a1 + 40)) {
    **(void **)(a1 + 40) = v90;
  }
  v91 = BLJaliscoLog();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v100 = v66;
    __int16 v101 = 2112;
    long long v102 = v85;
    _os_log_impl(&dword_21DFE3000, v91, OS_LOG_TYPE_ERROR, "Failed to add jalisco Persistent Store: %@ %@", buf, 0x16u);
  }

  uint64_t v92 = *(void *)(a1 + 32);
  uint64_t v93 = *(void **)(v92 + 24);
  *(void *)(v92 + 24) = 0;

  uint64_t v70 = 0;
LABEL_29:
}

void sub_21E014FF8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, void *a19)
{
  if (a2 == 1)
  {
    id v20 = objc_begin_catch(a1);
    id v27 = objc_msgSend_userInfo(v20, v21, v22, v23);
    if (v27)
    {
      uint64_t v28 = objc_msgSend_userInfo(v20, v24, v25, v26);
      id v31 = objc_msgSend_objectForKeyedSubscript_(v28, v29, *MEMORY[0x263F08608], v30);
    }
    else
    {
      id v31 = 0;
    }

    id v33 = objc_msgSend_bu_errorWithDomain_code_description_underlyingError_(MEMORY[0x263F087E8], v32, @"BLJaliscoDAAPClientError", 2, @"Unable to bring up jalisco core data stack", v31);
    uint64_t v34 = v33;
    if (*(void *)(v19 + 40)) {
      **(void **)(v19 + 40) = v33;
    }
    uint64_t v35 = *(void *)(v19 + 32);
    uint64_t v36 = *(void **)(v35 + 24);
    *(void *)(v35 + 24) = 0;

    id v37 = BLJaliscoLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = objc_msgSend_name(v20, v38, v39, v40);
      uint64_t v45 = objc_msgSend_reason(v20, v42, v43, v44);
      uint64_t v49 = objc_msgSend_userInfo(v20, v46, v47, v48);
      LODWORD(buf) = 138543874;
      *(void *)((char *)&buf + 4) = v41;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v45;
      a18 = 2114;
      a19 = v49;
      _os_log_impl(&dword_21DFE3000, v37, OS_LOG_TYPE_ERROR, "[BLJaliscoServerSource persistentStoreCoordinatorWithError]: Unable to bring up jalisco core data stack. Exception: %{public}@ %{public}@ %{public}@", (uint8_t *)&buf, 0x20u);
    }
    objc_end_catch();
    JUMPOUT(0x21E014FBCLL);
  }
  _Unwind_Resume(a1);
}

void sub_21E017944(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_userInfo(a1, a2, a3, a4);
  uint64_t v7 = objc_msgSend_objectForKey_(v4, v5, @"NSDetailedErrors", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v7, v8, v9, v10))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v7;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_logRecursively(v17, v18, v19, v20, (void)v21);
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v18, (uint64_t)&v21, (uint64_t)v25, 16);
      }
      while (v14);
    }
  }
}

unint64_t sub_21E017AAC(void *a1)
{
  id v1 = a1;
  uint64_t v5 = (const char *)objc_msgSend_UTF8String(v1, v2, v3, v4);

  return strtoull(v5, 0, 0);
}

void sub_21E0196B0()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  uint64_t v4 = objc_msgSend_bundleForClass_(v0, v2, v1, v3);
  objc_msgSend_objectForInfoDictionaryKey_(v4, v5, @"CFBundleShortVersionString", v6);
  id v11 = (char *)objc_claimAutoreleasedReturnValue();

  id v7 = [NSString alloc];
  uint64_t v9 = objc_msgSend_initWithFormat_(v7, v11, @"1.2/iBooks-%@", v8, v11);
  uint64_t v10 = (void *)qword_26AB3FF78;
  qword_26AB3FF78 = v9;
}

uint64_t sub_21E0197A8()
{
  id v0 = [NSString alloc];
  qword_26AB3FF68 = objc_msgSend_initWithFormat_(v0, v1, @"%d.%d", v2, 3, 13);

  return MEMORY[0x270F9A758]();
}

void IMStreamingHashWithFilePath(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a1;
  uint64_t v8 = a3;
  id v11 = a4;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  if (a2 == 1) {
    operator new();
  }
  if (!a2) {
    operator new();
  }
  uint64_t v65 = 0;
  objc_msgSend_stringWithFormat_(NSString, v9, @"IMStreamingHash.%p", v10, v63[3]);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (const char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
  id v17 = dispatch_queue_create(v16, 0);

  dispatch_set_target_queue(v17, v8);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  int v61 = 0;
  id v18 = v7;
  long long v22 = (const char *)objc_msgSend_fileSystemRepresentation(v18, v19, v20, v21);
  cleanup_handler[0] = MEMORY[0x263EF8330];
  cleanup_handler[1] = 3221225472;
  cleanup_handler[2] = sub_21E01A0E0;
  cleanup_handler[3] = &unk_26448BD80;
  uint64_t v58 = v60;
  long long v59 = &v62;
  long long v23 = v17;
  uint64_t v56 = v23;
  id v24 = v11;
  id v57 = v24;
  dispatch_io_t v25 = dispatch_io_create_with_path(0, v22, 0, 0, v23, cleanup_handler);
  dispatch_io_t v28 = v25;
  if (v25)
  {
    uint64_t v46 = 0;
    uint64_t v47 = (id *)&v46;
    uint64_t v48 = 0x3042000000;
    uint64_t v49 = sub_21E01A300;
    id v50 = sub_21E01A30C;
    id v51 = 0;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = sub_21E01A314;
    v40[3] = &unk_26448BDD0;
    uint64_t v43 = v60;
    uint64_t v29 = v25;
    uint64_t v41 = v29;
    uint64_t v30 = v23;
    uint64_t v42 = v30;
    uint64_t v44 = &v46;
    uint64_t v45 = &v62;
    id v34 = (id)objc_msgSend_copy(v40, v31, v32, v33);
    objc_storeWeak(v47 + 5, v34);
    dispatch_io_read(v29, 0, 0x10000uLL, v30, v34);

    _Block_object_dispose(&v46, 8);
    objc_destroyWeak(&v51);
  }
  else
  {
    uint64_t v35 = v63[3];
    if (v35) {
      (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
    }
    uint64_t v36 = (void *)MEMORY[0x263F087E8];
    id v37 = objc_msgSend_dictionaryWithObjectsAndKeys_(NSDictionary, v26, @"dispatch_io_create_with_path() returned NULL", v27, *MEMORY[0x263F08320], v18, @"path", 0);
    uint64_t v39 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v38, @"IMStreamingHash", 1, v37);

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E01A2E8;
    block[3] = &unk_26448BDA8;
    id v53 = v39;
    id v54 = v24;
    id v34 = v39;
    dispatch_async(v23, block);
  }
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(&v62, 8);
}

void sub_21E019FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  MEMORY[0x223C1E8D0](v16, 0x1081C401A844EABLL);

  _Unwind_Resume(a1);
}

void sub_21E01A0E0(uint64_t a1, const char *a2)
{
  if (a2 || (a2 = (const char *)*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), a2))
  {
    uint64_t v3 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], a2, *MEMORY[0x263F08438], (int)a2, 0);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    (*(void (**)(uint64_t))(*(void *)v10 + 40))(v10);
    id v11 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 24))(v12);
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 16))(v14);
    uint64_t v4 = objc_msgSend_dataWithBytes_length_(v11, v16, v13, v15);
    uint64_t v3 = 0;
  }
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01A2D0;
  block[3] = &unk_26448BD58;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v19 = v3;
  id v20 = v7;
  id v18 = v4;
  id v8 = v3;
  id v9 = v4;
  dispatch_async(v6, block);
}

uint64_t sub_21E01A2D0(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_21E01A2E8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_21E01A300(uint64_t a1, uint64_t a2)
{
}

void sub_21E01A30C(uint64_t a1)
{
}

void sub_21E01A314(void *a1, int a2, void *a3, int a4)
{
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  }
  else
  {
    if (a2 && dispatch_data_get_size(v7))
    {
      id v9 = a1[4];
      uint64_t v10 = a1[5];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[7] + 8) + 40));
      dispatch_io_read(v9, 0, 0x10000uLL, v10, WeakRetained);
    }
    uint64_t v12 = *(void *)(*(void *)(a1[8] + 8) + 24);
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = sub_21E01ACC0;
    applier[3] = &unk_26448BE68;
    applier[4] = v12;
    dispatch_data_apply(v8, applier);
  }
}

void IMStreamingHashStringWithFilePath(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E01A4DC;
  v9[3] = &unk_26448BDF8;
  id v10 = v7;
  id v8 = v7;
  IMStreamingHashWithFilePath(a1, a2, a3, v9);
}

void sub_21E01A4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E01A4DC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = sub_21E01A574(a2);
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);
}

void sub_21E01A554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *sub_21E01A574(void *a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    id v7 = (unsigned __int8 *)objc_msgSend_bytes(v3, v4, v5, v6);
    uint64_t v11 = objc_msgSend_length(v3, v8, v9, v10);
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = 2 * v11;
      MEMORY[0x270FA5388]();
      bzero((char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 2 * v12);
      uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0) + 1;
      do
      {
        unsigned int v15 = *v7++;
        *(v14 - 1) = a0123456789abcd[(unint64_t)v15 >> 4];
        unsigned char *v14 = a0123456789abcd[v15 & 0xF];
        v14 += 2;
        --v12;
      }
      while (v12);
      id v16 = [NSString alloc];
      id v18 = (__CFString *)objc_msgSend_initWithBytes_length_encoding_(v16, v17, (uint64_t)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v13, 4);
    }
    else
    {
      id v18 = &stru_26CED4330;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void sub_21E01A6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id IMStreamingHashWithFilePathSync(void *a1, int a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_21E01A8E4;
  dispatch_io_t v25 = sub_21E01A8F4;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_21E01A8E4;
  id v19 = sub_21E01A8F4;
  id v20 = 0;
  id v7 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E01A8FC;
  v11[3] = &unk_26448BE20;
  uint64_t v13 = &v21;
  uint64_t v14 = &v15;
  id v8 = v6;
  uint64_t v12 = v8;
  IMStreamingHashWithFilePath(v5, a2, v7, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void sub_21E01A89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_21E01A8E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E01A8F4(uint64_t a1)
{
}

void sub_21E01A8FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id IMStreamingHashStringWithFilePathSync(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_21E01A8E4;
  dispatch_io_t v25 = sub_21E01A8F4;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_21E01A8E4;
  id v19 = sub_21E01A8F4;
  id v20 = 0;
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E01ABA4;
  v11[3] = &unk_26448BE48;
  uint64_t v13 = &v21;
  uint64_t v14 = &v15;
  id v8 = v6;
  id v12 = v8;
  IMStreamingHashStringWithFilePath(v5, a2, v7, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void sub_21E01AB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_21E01ABA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E01AC44()
{
}

uint64_t sub_21E01AC58()
{
  return 16;
}

uint64_t sub_21E01AC60(uint64_t a1)
{
  return a1 + 100;
}

uint64_t sub_21E01AC68(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_MD5_Update((CC_MD5_CTX *)(a1 + 8), a2, a3);
}

uint64_t sub_21E01AC70(uint64_t a1)
{
  return CC_MD5_Final((unsigned __int8 *)(a1 + 100), (CC_MD5_CTX *)(a1 + 8));
}

void sub_21E01AC84()
{
}

uint64_t sub_21E01AC98()
{
  return 20;
}

uint64_t sub_21E01ACA0(uint64_t a1)
{
  return a1 + 104;
}

uint64_t sub_21E01ACA8(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 8), a2, a3);
}

uint64_t sub_21E01ACB0(uint64_t a1)
{
  return CC_SHA1_Final((unsigned __int8 *)(a1 + 104), (CC_SHA1_CTX *)(a1 + 8));
}

uint64_t sub_21E01ACC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return 1;
}

BOOL _BLStoreDemoModeEnabled()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t sub_21E01B2B0(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 68) = *(unsigned char *)(result + 40);
  return result;
}

void sub_21E01B390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E01B3A8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 68);
  return result;
}

uint64_t sub_21E01B44C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 60) = *(unsigned char *)(result + 40);
  return result;
}

void sub_21E01B52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E01B544(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 60);
  return result;
}

uint64_t sub_21E01B5CC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32)) {
    *(unsigned char *)(v1 + 33) = 0;
  }
  return result;
}

void sub_21E01B6FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend__allPurchaseDAAPServers(*(void **)(a1 + 32), a2, a3, a4, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_updateItemImageURLsIgnoringCache_completion_(*(void **)(*((void *)&v11 + 1) + 8 * v10++), v7, 0, 0);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v8);
  }
}

void sub_21E01B88C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = sub_21E01B9A4;
  long long v13 = sub_21E01B9B4;
  id v14 = 0;
  id v5 = objc_msgSend_dsidQueue(*(void **)(a1 + 32), a2, a3, a4);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E01B9BC;
  v8[3] = &unk_26448B920;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  uint64_t v7 = (void *)v10[5];
  if (v7) {
    objc_msgSend_updateItemImageURLsIgnoringCache_completion_(v7, v6, 0, *(void *)(a1 + 40));
  }
  _Block_object_dispose(&v9, 8);
}

void sub_21E01B98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E01B9A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E01B9B4(uint64_t a1)
{
}

void sub_21E01B9BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  if (v5[1])
  {
    objc_msgSend_swqDSIDToDAAPServer(v5, a2, a3, a4);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v11, v6, *(void *)(*(void *)(a1 + 32) + 8), v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_21E01BB08(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_fetchRequestForStoreIDs_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 136);
  id v18 = 0;
  uint64_t v9 = objc_msgSend_executeFetchRequest_error_(v7, v8, (uint64_t)v5, (uint64_t)&v18);
  id v10 = v18;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E01BC30;
  void v16[3] = &unk_26448BF20;
  id v11 = v6;
  id v17 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v12, (uint64_t)v16, v13);

  uint64_t v14 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v11, v10);
  }
}

void sub_21E01BC30(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E01BD70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, a4);
  uint64_t v8 = objc_msgSend_fetchRequestForAllStoreIDs_(v5, v6, *(void *)(a1 + 32), v7);

  uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 136);
  id v17 = 0;
  id v11 = objc_msgSend_executeFetchRequest_error_(v9, v10, (uint64_t)v8, (uint64_t)&v17);
  id v12 = v17;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = sub_21E01BE64;
  v15[3] = &unk_26448BF20;
  id v16 = *(id *)(a1 + 48);
  objc_msgSend_enumerateObjectsUsingBlock_(v11, v13, (uint64_t)v15, v14);
}

void sub_21E01BE64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E01BFC0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, a4);
  uint64_t v8 = objc_msgSend_fetchRequestForAllBookletsIDsWithParentStoreIDs_(v5, v6, *(void *)(a1 + 32), v7);

  uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 136);
  id v17 = 0;
  id v11 = objc_msgSend_executeFetchRequest_error_(v9, v10, (uint64_t)v8, (uint64_t)&v17);
  id v12 = v17;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = sub_21E01C0B4;
  v15[3] = &unk_26448BF98;
  id v16 = *(id *)(a1 + 48);
  objc_msgSend_enumerateObjectsUsingBlock_(v11, v13, (uint64_t)v15, v14);
}

uint64_t sub_21E01C0B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_objectForKey_(a2, (const char *)a2, @"storeID", a4);
  id v5 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v5, (uint64_t)v5, v6);
  }

  return MEMORY[0x270F9A758]();
}

void sub_21E01C1E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_fetchRequestForBuyParameters_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 136);
  id v18 = 0;
  uint64_t v9 = objc_msgSend_executeFetchRequest_error_(v7, v8, (uint64_t)v5, (uint64_t)&v18);
  id v10 = v18;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E01C308;
  void v16[3] = &unk_26448BF20;
  id v11 = v6;
  id v17 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v12, (uint64_t)v16, v13);

  uint64_t v14 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v11, v10);
  }
}

void sub_21E01C308(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E01C434(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_21E01B9A4;
  uint64_t v14 = sub_21E01B9B4;
  id v15 = 0;
  id v5 = objc_msgSend_dsidQueue(*(void **)(a1 + 32), a2, a3, a4);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E01C564;
  v9[3] = &unk_26448B920;
  void v9[4] = *(void *)(a1 + 32);
  void v9[5] = &v10;
  dispatch_sync(v5, v9);

  id v7 = (void *)v11[5];
  if (v7)
  {
    objc_msgSend_hideItemsWithStoreIDs_completion_(v7, v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
  _Block_object_dispose(&v10, 8);
}

void sub_21E01C54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E01C564(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  if (v5[1])
  {
    objc_msgSend_swqDSIDToDAAPServer(v5, a2, a3, a4);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v11, v6, *(void *)(*(void *)(a1 + 32) + 8), v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void sub_21E01C684(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_fetchRequestForHiddenItems(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 136);
  id v18 = 0;
  uint64_t v9 = objc_msgSend_executeFetchRequest_error_(v7, v8, (uint64_t)v5, (uint64_t)&v18);
  id v10 = v18;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21E01C7A8;
  void v16[3] = &unk_26448BF20;
  id v11 = v6;
  id v17 = v11;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v12, (uint64_t)v16, v13);

  uint64_t v14 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  id v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v11, v10);
  }
}

void sub_21E01C7A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_storeID(a2, (const char *)a2, a3, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v10, v5, v6, v7)) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v10, v9);
  }
}

void sub_21E01CF5C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v31[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v6 = BLJaliscoLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_INFO, "UpdatePolitely was successful. Clearing storeAuthenticationRequired, isGDPRPrivacyAcknowledgementRequired", v27, 2u);
    }

    objc_msgSend_setIsGDPRPrivacyAcknowledgementRequired_(*(void **)(a1 + 32), v7, 0, v8);
    objc_msgSend_setStoreAuthenticationRequired_(*(void **)(a1 + 32), v9, 0, v10);
  }
  int isGDPRPrivacyAcknowledgementRequired = objc_msgSend_isGDPRPrivacyAcknowledgementRequired(*(void **)(a1 + 32), a2, a3, a4);
  id v15 = (uint64_t *)MEMORY[0x263F08320];
  if (isGDPRPrivacyAcknowledgementRequired)
  {
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = @"GDPR acknowledgement required";
    id v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v31, (uint64_t)&v30, 1);
    id v19 = objc_msgSend_errorWithDomain_code_userInfo_(v16, v18, @"BLJaliscoDAAPClientError", 6, v17);
  }
  else
  {
    id v19 = 0;
  }
  if (objc_msgSend_storeAuthenticationRequired(*(void **)(a1 + 32), v12, v13, v14))
  {
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *v15;
    uint64_t v29 = @"need store auth to get jalisco items";
    long long v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)&v29, (uint64_t)&v28, 1);
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, @"BLJaliscoDAAPClientError", 5, v22);

    id v19 = (void *)v24;
  }
  uint64_t v25 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  id v26 = (void *)v25;
  if (v25) {
    (*(void (**)(uint64_t, const char *, void *))(v25 + 16))(v25, a2, v19);
  }
}

void sub_21E01D1EC(uint64_t a1)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  uint64_t v99 = 0;
  id v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v95 = 0;
  id v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 112);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01D8EC;
  block[3] = &unk_26448BFE8;
  void block[4] = v2;
  block[5] = &v99;
  block[6] = &v95;
  dispatch_sync(v3, block);
  if (*((unsigned char *)v96 + 24))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v9 = objc_msgSend_copy(v7, v4, v5, v6);
      objc_msgSend_addObject_(v8, v10, (uint64_t)v9, v11);
    }
    uint64_t v12 = objc_msgSend__currentPurchaseDAAPServers(*(void **)(a1 + 32), v4, v5, v6);
    v80 = objc_msgSend_valueForKey_(v12, v13, @"dsid", v14);
    id v15 = BLJaliscoLog();
    uint64_t v79 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v16;
      *(_WORD *)v111 = 2048;
      *(void *)&v111[2] = v17;
      *(_WORD *)&v111[10] = 2112;
      *(void *)&v111[12] = v80;
      _os_log_impl(&dword_21DFE3000, v15, OS_LOG_TYPE_DEFAULT, "[BLJaliscoDAAPClient] updatePolitely:%{BOOL}d reason:%ld will update for DSIDs:(%@)", buf, 0x1Cu);
    }

    if (objc_msgSend_count(v80, v18, v19, v20))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v21 + 33))
      {
        long long v22 = dispatch_get_global_queue(0, 0);
        v92[0] = MEMORY[0x263EF8330];
        v92[1] = 3221225472;
        v92[2] = sub_21E01DA04;
        v92[3] = &unk_26448B6E0;
        v92[4] = v21;
        id v93 = v80;
        dispatch_async(v22, v92);
      }
      *(void *)buf = 0;
      *(void *)v111 = buf;
      *(void *)&v111[8] = 0x2020000000;
      v111[16] = 1;
      uint64_t v23 = dispatch_group_create();
      uint64_t v24 = BLJaliscoLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_currentThread(MEMORY[0x263F08B88], v25, v26, v27, v12);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v29, v30, v31);
        uint64_t v36 = objc_msgSend_count(v32, v33, v34, v35);
        *(_DWORD *)uint64_t v103 = 138412546;
        id v104 = v28;
        __int16 v105 = 2048;
        uint64_t v106 = v36;
        _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_INFO, "Dispatch group: creation thread %@ purchaseDAAPSyncsInFlight %lu - updatePolitely", v103, 0x16u);
      }
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id obj = v79;
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v88, (uint64_t)v109, 16);
      if (v41)
      {
        uint64_t v42 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v89 != v42) {
              objc_enumerationMutation(obj);
            }
            uint64_t v44 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            uint64_t v45 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v38, v39, v40, v79);
            char v48 = objc_msgSend_containsObject_(v45, v46, (uint64_t)v44, v47);

            if ((v48 & 1) == 0)
            {
              uint64_t v49 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v38, v39, v40);
              objc_msgSend_addObject_(v49, v50, (uint64_t)v44, v51);

              dispatch_group_enter(v23);
              uint64_t v52 = BLJaliscoLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                objc_msgSend_currentThread(MEMORY[0x263F08B88], v53, v54, v55);
                id v56 = (id)objc_claimAutoreleasedReturnValue();
                long long v60 = objc_msgSend_dsid(v44, v57, v58, v59);
                uint64_t v64 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v61, v62, v63);
                uint64_t v68 = objc_msgSend_count(v64, v65, v66, v67);
                *(_DWORD *)uint64_t v103 = 138412802;
                id v104 = v56;
                __int16 v105 = 2112;
                uint64_t v106 = (uint64_t)v60;
                __int16 v107 = 2048;
                uint64_t v108 = v68;
                _os_log_impl(&dword_21DFE3000, v52, OS_LOG_TYPE_INFO, "Dispatch group: entry thread %@ dsid:%@ purchaseDAAPSyncsInFlight %lu - updatePolitely", v103, 0x20u);
              }
              uint64_t v69 = *(void *)(a1 + 48);
              uint64_t v70 = *(void *)(a1 + 32);
              uint64_t v71 = *(void *)(v70 + 40);
              v83[0] = MEMORY[0x263EF8330];
              v83[1] = 3221225472;
              v83[2] = sub_21E01DBEC;
              v83[3] = &unk_26448C088;
              char v87 = *(unsigned char *)(a1 + 56);
              v83[4] = v44;
              v83[5] = v70;
              uint64_t v85 = buf;
              uint64_t v86 = v69;
              v84 = v23;
              objc_msgSend_setupWithReason_queue_completion_(v44, v72, v69, v71, v83);
            }
          }
          uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v88, (uint64_t)v109, 16);
        }
        while (v41);
      }

      uint64_t v73 = *(void *)(a1 + 32);
      uint64_t v74 = *(NSObject **)(v73 + 40);
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = sub_21E01E1B8;
      v82[3] = &unk_26448C0B0;
      v82[4] = v73;
      v82[5] = buf;
      v82[6] = &v99;
      dispatch_group_notify(v23, v74, v82);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v77 = BLJaliscoLog();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFE3000, v77, OS_LOG_TYPE_DEFAULT, "[BLJaliscoDAAPClient] no update - no signed in user", buf, 2u);
      }

      objc_msgSend__sendCompletionHandlersWithSuccess_generation_(*(void **)(a1 + 32), v78, 1, v100[3], v12);
    }
  }
  else
  {
    v75 = BLJaliscoLog();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v75, OS_LOG_TYPE_DEFAULT, "No update required", buf, 2u);
    }

    uint64_t v76 = *(void *)(a1 + 40);
    if (v76) {
      (*(void (**)(uint64_t, uint64_t))(v76 + 16))(v76, 1);
    }
  }
  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
}

void sub_21E01D880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_21E01D8EC(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 88);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 96) != *(void *)(a1[4] + 88);
  uint64_t v2 = BLJaliscoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v5 = *(void *)(v3 + 88);
    uint64_t v4 = *(void *)(v3 + 96);
    int v6 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);
    int v7 = 134218496;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "Need update test: currentGeneration:%lu pendingGeneration:%lu Needs update:%{BOOL}d", (uint8_t *)&v7, 0x1Cu);
  }

  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *(void *)(a1[4] + 96) = *(void *)(a1[4] + 88);
  }
}

void sub_21E01DA04(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_newManagedObjectContext(*(void **)(a1 + 32), a2, a3, a4);
  __int16 v9 = objc_msgSend_sharedSource(BLJaliscoServerSource, v6, v7, v8);
  int v12 = objc_msgSend_itemsFetchRequestForDSIDs_(v9, v10, *(void *)(a1 + 40), v11);

  objc_msgSend_setFetchLimit_(v12, v13, 1, v14);
  id v22 = 0;
  uint64_t Request_error = objc_msgSend_countForFetchRequest_error_(v5, v15, (uint64_t)v12, (uint64_t)&v22);
  id v17 = v22;
  if (Request_error == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v20 = BLJaliscoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "DAAP Setup: Couldn't count items.  %@", buf, 0xCu);
    }
  }
  else if (!Request_error)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(NSObject **)(v18 + 40);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_21E01DB94;
    v21[3] = &unk_26448B708;
    v21[4] = v18;
    dispatch_async(v19, v21);
  }
}

uint64_t sub_21E01DB94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_willChangeValueForKey_(*(void **)(a1 + 32), a2, @"initiallyLoadingJalisco", a4);
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  uint64_t v7 = *(void **)(a1 + 32);

  return objc_msgSend_didChangeValueForKey_(v7, v5, @"initiallyLoadingJalisco", v6);
}

void sub_21E01DBEC(uint64_t a1, int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v4 = BLJaliscoLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_msgSend_dsid(*(void **)(a1 + 32), v5, v6, v7);
    *(_DWORD *)buf = 138412546;
    id v28 = v8;
    __int16 v29 = 1024;
    int v30 = a2;
    _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_INFO, "DAAP Setup, dsid: %@, success: %d", buf, 0x12u);
  }
  if (a2)
  {
    uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 64);
    int v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(v11 + 40);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_21E01DDE0;
    v25[3] = &unk_26448C038;
    v25[4] = v12;
    v25[5] = v11;
    uint64_t v14 = (id *)&v26;
    long long v21 = *(_OWORD *)(a1 + 48);
    id v15 = (id)v21;
    long long v26 = v21;
    objc_msgSend_fetchAllItemsPolitely_reason_queue_completion_(v12, v16, v9, v10, v13, v25);
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(NSObject **)(v17 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E01E080;
    block[3] = &unk_26448C060;
    uint64_t v19 = *(void *)(a1 + 32);
    void block[4] = v17;
    block[5] = v19;
    uint64_t v14 = (id *)&v24;
    long long v22 = *(_OWORD *)(a1 + 48);
    id v20 = (id)v22;
    long long v24 = v22;
    dispatch_async(v18, block);
  }
}

void sub_21E01DDE0(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = BLJaliscoLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_msgSend_dsid(*(void **)(a1 + 32), v5, v6, v7);
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_INFO, "DAAP Update, dsid: %@, success: %d", buf, 0x12u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(NSObject **)(v9 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01DF34;
  block[3] = &unk_26448C010;
  char v16 = a2;
  uint64_t v11 = *(void *)(a1 + 32);
  void block[4] = v9;
  block[5] = v11;
  long long v13 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v13;
  long long v15 = v13;
  dispatch_async(v10, block);
}

void sub_21E01DF34(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  char v6 = *(unsigned char *)(v5 + 24);
  if (v6) {
    char v6 = *(unsigned char *)(a1 + 64) != 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  uint64_t v7 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_removeObject_(v7, v8, *(void *)(a1 + 40), v9);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  uint64_t v10 = BLJaliscoLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = objc_msgSend_currentThread(MEMORY[0x263F08B88], v11, v12, v13);
    uint64_t v18 = objc_msgSend_dsid(*(void **)(a1 + 40), v15, v16, v17);
    long long v22 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v19, v20, v21);
    int v26 = 138412802;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    __int16 v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = objc_msgSend_count(v22, v23, v24, v25);
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_INFO, "Dispatch group:leave thread %@ dsid:%@  purchaseDAAPSyncsInFlight %lu - after DAAP update", (uint8_t *)&v26, 0x20u);
  }
}

void sub_21E01E080(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t v5 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_removeObject_(v5, v6, *(void *)(a1 + 40), v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  uint64_t v8 = BLJaliscoLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = objc_msgSend_currentThread(MEMORY[0x263F08B88], v9, v10, v11);
    uint64_t v16 = objc_msgSend_dsid(*(void **)(a1 + 40), v13, v14, v15);
    uint64_t v20 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v17, v18, v19);
    int v24 = 138412802;
    uint64_t v25 = v12;
    __int16 v26 = 2112;
    uint64_t v27 = v16;
    __int16 v28 = 2048;
    uint64_t v29 = objc_msgSend_count(v20, v21, v22, v23);
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_INFO, "Dispatch group:leave thread %@ dsid:%@ purchaseDAAPSyncsInFlight %lu - NO DAAP update", (uint8_t *)&v24, 0x20u);
  }
}

uint64_t sub_21E01E1B8(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = BLJaliscoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    char v6 = objc_msgSend_currentThread(MEMORY[0x263F08B88], v3, v4, v5);
    uint64_t v10 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v7, v8, v9);
    int v16 = 138412546;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = objc_msgSend_count(v10, v11, v12, v13);
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_INFO, "Dispatch group:NOTIFY thread %@  purchaseDAAPSyncsInFlight %lu - updatePolitely", (uint8_t *)&v16, 0x16u);
  }
  return objc_msgSend__sendCompletionHandlersWithSuccess_generation_(*(void **)(a1 + 32), v14, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
}

void sub_21E01E49C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 32), a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v4, v5, v6);
}

void sub_21E01E694(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 120), a2, *(void *)(*(void *)(a1 + 32) + 8), a4);

  if (!v5)
  {
    uint64_t v8 = objc_msgSend__newPurchaseDAAPServerWithDSID_(*(void **)(a1 + 32), v6, *(void *)(*(void *)(a1 + 32) + 8), v7);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 120), v9, (uint64_t)v8, *(void *)(*(void *)(a1 + 32) + 8));

    uint64_t v10 = BLJaliscoLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 8);
      uint64_t v13 = *(void *)(v11 + 88);
      int v19 = 138412546;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v13;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser Created daap server for dsid:(%@) currentServerGen:(%lu)", (uint8_t *)&v19, 0x16u);
    }

    ++*(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v14 = *(void *)(a1 + 32);
    if (*(void *)(v14 + 88) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v14 + 88) = 0x8000000000000000;
    }
    uint64_t v15 = BLJaliscoLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(v16 + 8);
      uint64_t v18 = *(void *)(v16 + 88);
      int v19 = 138412546;
      uint64_t v20 = v17;
      __int16 v21 = 2048;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21DFE3000, v15, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser Finished for dsid:(%@) currentServerGen:(%lu)", (uint8_t *)&v19, 0x16u);
    }
  }
}

void sub_21E01EAC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v31[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v6 = BLJaliscoLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_INFO, "updateFamilyPolitely was successful. Clearing storeAuthenticationRequired, isGDPRPrivacyAcknowledgementRequired", v27, 2u);
    }

    objc_msgSend_setIsGDPRPrivacyAcknowledgementRequired_(*(void **)(a1 + 32), v7, 0, v8);
    objc_msgSend_setStoreAuthenticationRequired_(*(void **)(a1 + 32), v9, 0, v10);
  }
  int isGDPRPrivacyAcknowledgementRequired = objc_msgSend_isGDPRPrivacyAcknowledgementRequired(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v15 = (uint64_t *)MEMORY[0x263F08320];
  if (isGDPRPrivacyAcknowledgementRequired)
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = @"GDPR acknowledgement required";
    uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)v31, (uint64_t)&v30, 1);
    int v19 = objc_msgSend_errorWithDomain_code_userInfo_(v16, v18, @"BLJaliscoDAAPClientError", 6, v17);
  }
  else
  {
    int v19 = 0;
  }
  if (objc_msgSend_storeAuthenticationRequired(*(void **)(a1 + 32), v12, v13, v14))
  {
    __int16 v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *v15;
    uint64_t v29 = @"need store auth to get family jalisco items";
    uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v20, (uint64_t)&v29, (uint64_t)&v28, 1);
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, @"BLJaliscoDAAPClientError", 5, v22);

    int v19 = (void *)v24;
  }
  uint64_t v25 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  __int16 v26 = (void *)v25;
  if (v25) {
    (*(void (**)(uint64_t, const char *, void *))(v25 + 16))(v25, a2, v19);
  }
}

void sub_21E01EF14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_21E01EF40(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21E01EFE8;
  v4[3] = &unk_26448C128;
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  char v7 = *(unsigned char *)(a1 + 56);
  dispatch_async(v2, v4);
}

void sub_21E01EFE8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 24);
    char v7 = objc_msgSend_copy(v5, a2, a3, a4);
    objc_msgSend_addObject_(v6, v8, (uint64_t)v7, v9);
  }
  uint64_t v10 = objc_msgSend__familyPurchaseDAAPServers(*(void **)(a1 + 32), a2, a3, a4);
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  char v60 = 1;
  uint64_t v11 = dispatch_group_create();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v12 = v10;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v55, (uint64_t)v63, 16);
  if (v17)
  {
    uint64_t v19 = *(void *)v56;
    *(void *)&long long v18 = 138412290;
    long long v48 = v18;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v56 != v19) {
          objc_enumerationMutation(v12);
        }
        __int16 v21 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
        uint64_t v22 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v14, v15, v16, v48);
        int v25 = objc_msgSend_containsObject_(v22, v23, (uint64_t)v21, v24);

        if (v25)
        {
          uint64_t v29 = BLJaliscoLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = objc_msgSend_dsid(v21, v30, v31, v32);
            *(_DWORD *)buf = v48;
            uint64_t v62 = v33;
            _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_DEFAULT, "Skipping family purchase history update for %@ (already in-flight)", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v34 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v26, v27, v28);
          objc_msgSend_addObject_(v34, v35, (uint64_t)v21, v36);

          dispatch_group_enter(v11);
          id v37 = BLJaliscoLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v41 = objc_msgSend_dsid(v21, v38, v39, v40);
            *(_DWORD *)buf = v48;
            uint64_t v62 = v41;
            _os_log_impl(&dword_21DFE3000, v37, OS_LOG_TYPE_DEFAULT, "Setting up family purchase history request for %@", buf, 0xCu);
          }
          uint64_t v42 = *(void *)(a1 + 48);
          uint64_t v43 = *(void *)(a1 + 32);
          uint64_t v44 = *(void *)(v43 + 40);
          v50[0] = MEMORY[0x263EF8330];
          v50[1] = 3221225472;
          v50[2] = sub_21E01F39C;
          v50[3] = &unk_26448C088;
          char v54 = *(unsigned char *)(a1 + 56);
          v50[4] = v21;
          v50[5] = v43;
          uint64_t v52 = v59;
          uint64_t v53 = v42;
          uint64_t v51 = v11;
          objc_msgSend_setupWithReason_queue_completion_(v21, v45, v42, v44, v50);
        }
        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v55, (uint64_t)v63, 16);
    }
    while (v17);
  }

  uint64_t v46 = *(void *)(a1 + 32);
  uint64_t v47 = *(NSObject **)(v46 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E01F790;
  block[3] = &unk_26448BED0;
  void block[4] = v46;
  block[5] = v59;
  dispatch_group_notify(v11, v47, block);

  _Block_object_dispose(v59, 8);
}

void sub_21E01F364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_21E01F39C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v3 = *(void *)(a1 + 64);
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(v4 + 40);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = sub_21E01F4E8;
    v18[3] = &unk_26448C100;
    v18[4] = v4;
    v18[5] = v5;
    char v7 = (id *)&v19;
    long long v14 = *(_OWORD *)(a1 + 48);
    id v8 = (id)v14;
    long long v19 = v14;
    objc_msgSend_fetchAllItemsPolitely_reason_queue_completion_(v5, v9, v2, v3, v6, v18);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v10 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E01F6A0;
    block[3] = &unk_26448C060;
    uint64_t v12 = *(void *)(a1 + 32);
    void block[4] = v10;
    block[5] = v12;
    char v7 = (id *)&v17;
    long long v15 = *(_OWORD *)(a1 + 48);
    id v13 = (id)v15;
    long long v17 = v15;
    dispatch_async(v11, block);
  }
}

void sub_21E01F4E8(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  long long v6 = *(_OWORD *)(a1 + 32);
  block[2] = sub_21E01F58C;
  block[3] = &unk_26448C010;
  char v8 = a2;
  id v3 = (id)v4;
  long long v7 = v4;
  dispatch_async(v2, block);
}

void sub_21E01F58C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  char v6 = *(unsigned char *)(v5 + 24);
  if (v6) {
    char v6 = *(unsigned char *)(a1 + 64) != 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  long long v7 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_removeObject_(v7, v8, *(void *)(a1 + 40), v9);

  uint64_t v10 = BLJaliscoLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    long long v14 = objc_msgSend_dsid(*(void **)(a1 + 40), v11, v12, v13);
    int v15 = *(unsigned __int8 *)(a1 + 64);
    int v16 = 138412546;
    long long v17 = v14;
    __int16 v18 = 1024;
    int v19 = v15;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "Family purchase history update completed for %@ (%d)", (uint8_t *)&v16, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_21E01F6A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t v5 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_removeObject_(v5, v6, *(void *)(a1 + 40), v7);

  char v8 = BLJaliscoLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = objc_msgSend_dsid(*(void **)(a1 + 40), v9, v10, v11);
    int v13 = 138412290;
    long long v14 = v12;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Family purchase history setup failed for %@", (uint8_t *)&v13, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_21E01F790(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = BLJaliscoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      char v6 = @"successfully";
    }
    else {
      char v6 = @"with error";
    }
    uint64_t v7 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v3, v4, v5);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = objc_msgSend_count(v7, v8, v9, v10);
    _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "Jalisco family purchase updates completed %{public}@ (%lu)", buf, 0x16u);
  }
  long long v14 = objc_msgSend_purchaseDAAPSyncsInFlight(*(void **)(a1 + 32), v11, v12, v13);
  uint64_t v18 = objc_msgSend_count(v14, v15, v16, v17);

  if (!v18)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = sub_21E01F908;
    v20[3] = &unk_26448B920;
    long long v21 = *(_OWORD *)(a1 + 32);
    int v19 = (void (**)(void))MEMORY[0x223C1EDC0](v20);
    v19[2]();
  }
}

uint64_t sub_21E01F908(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v5);
  }

  return objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 24), v9, v10, v11, (void)v13);
}

void sub_21E01FA1C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend__processFamilyCircleAdded_removed_unchanged_completion_(WeakRetained, v11, (uint64_t)v10, (uint64_t)v9, v8, *(void *)(a1 + 32));
}

void sub_21E02039C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, a4);
  id v9 = objc_msgSend__dsids(*(void **)(a1 + 32), v6, v7, v8);
  uint64_t v12 = objc_msgSend_allItemsFetchRequestForDSIDs_(v5, v10, (uint64_t)v9, v11);

  if (objc_msgSend_count(*(void **)(a1 + 40), v13, v14, v15))
  {
    int v19 = objc_msgSend_sharedSource(BLJaliscoServerSource, v16, v17, v18);
    uint64_t v20 = *(void *)(a1 + 40);
    __int16 v24 = objc_msgSend__dsids(*(void **)(a1 + 32), v21, v22, v23);
    uint64_t v26 = objc_msgSend_fetchRequestForStoreIDs_dsids_(v19, v25, v20, (uint64_t)v24);

    uint64_t v12 = (void *)v26;
  }
  uint64_t v27 = BLJaliscoLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v12;
    _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_ERROR, "Deleting items %@", buf, 0xCu);
  }

  uint64_t v28 = *(void **)(*(void *)(a1 + 32) + 136);
  id v59 = 0;
  uint64_t v30 = objc_msgSend_executeFetchRequest_error_(v28, v29, (uint64_t)v12, (uint64_t)&v59);
  id v31 = v59;
  if (v31)
  {
    id v35 = v31;
    uint64_t v36 = BLJaliscoLog();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412290;
    id v63 = v35;
    id v37 = "Couldn't fetch items to delete Error: %@";
    uint64_t v38 = v36;
    uint32_t v39 = 12;
    goto LABEL_8;
  }
  if (objc_msgSend_count(v30, v32, v33, v34))
  {
    uint64_t v36 = objc_msgSend_firstObject(v30, v40, v41, v42);
    objc_msgSend_deleteObject_(*(void **)(*(void *)(a1 + 32) + 136), v43, (uint64_t)v36, v44);
    uint64_t v45 = *(void **)(*(void *)(a1 + 32) + 136);
    id v58 = 0;
    objc_msgSend_save_(v45, v46, (uint64_t)&v58, v47);
    id v35 = v58;
    long long v48 = BLJaliscoLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = objc_msgSend_storeID(v36, v49, v50, v51);
      *(_DWORD *)buf = 138412546;
      id v63 = v52;
      __int16 v64 = 2112;
      id v65 = v35;
      _os_log_impl(&dword_21DFE3000, v48, OS_LOG_TYPE_ERROR, "Deleted jalisco items %@. Error: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v53 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F08320];
    int v61 = @"Can't delete jalisco items. Nothing to delete.";
    char v54 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v40, (uint64_t)&v61, (uint64_t)&v60, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v53, v55, @"BLJaliscoDAAPClientError", 1, v54);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v36 = BLJaliscoLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v63 = v30;
      __int16 v64 = 2112;
      id v65 = v35;
      id v37 = "Fail to delete jalisco items %@. Error: %@";
      uint64_t v38 = v36;
      uint32_t v39 = 22;
LABEL_8:
      _os_log_impl(&dword_21DFE3000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    }
  }
LABEL_15:

  uint64_t v56 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
  long long v57 = (void *)v56;
  if (v56) {
    (*(void (**)(uint64_t, id))(v56 + 16))(v56, v35);
  }
}

void sub_21E0207E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, a4);
  uint64_t v8 = objc_msgSend_fetchRequestForNeedsImport_(v5, v6, *(unsigned __int8 *)(a1 + 48), v7);

  id v9 = *(void **)(*(void *)(a1 + 32) + 136);
  id v17 = 0;
  uint64_t v11 = objc_msgSend_executeFetchRequest_error_(v9, v10, (uint64_t)v8, (uint64_t)&v17);
  id v12 = v17;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = sub_21E0208D8;
  v15[3] = &unk_26448BF20;
  id v16 = *(id *)(a1 + 40);
  objc_msgSend_enumerateObjectsUsingBlock_(v11, v13, (uint64_t)v15, v14);
}

void sub_21E0208D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E020A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E020A5C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 32), a2, a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_allValues(v11, v5, v6, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void sub_21E020BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E020BE0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5[1])
  {
    uint64_t v6 = objc_msgSend_swqDSIDToDAAPServer(v5, a2, a3, a4);
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *(void *)(*(void *)(a1 + 32) + 8), v8);

    if (v9)
    {
      v14[0] = v9;
      uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v10, (uint64_t)v14, 1);
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
  }
}

void sub_21E020DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E020DC0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_allValues(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_mutableCopy(v9, v10, v11, v12);
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  int v19 = *(void **)(a1 + 32);
  if (v19[1])
  {
    uint64_t v20 = objc_msgSend_swqDSIDToDAAPServer(v19, v16, v17, v18);
    objc_msgSend_objectForKeyedSubscript_(v20, v21, *(void *)(*(void *)(a1 + 32) + 8), v22);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v25 = v26;
    if (v26)
    {
      objc_msgSend_removeObject_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v23, (uint64_t)v26, v24);
      uint64_t v25 = v26;
    }
  }
}

void sub_21E020FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E020FBC(uint64_t a1, const char *a2)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    v5[0] = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v5, 1);
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (v3) {
}
  }

void sub_21E0211EC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_setByAddingObjectsFromSet_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  uint64_t v9 = objc_msgSend_allObjects(v5, v6, v7, v8);

  id v10 = BLJaliscoLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "Adding family member BLPurchaseDAAPServer objects for %@", (uint8_t *)&buf, 0xCu);
  }

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v12 = *(id *)(a1 + 32);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v118, (uint64_t)v133, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v119 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void *)(*((void *)&v118 + 1) + 8 * i);
        long long v21 = objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 48), v14, v15, v16);
        uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, v20, v23);
        BOOL v25 = v24 == 0;

        if (v25)
        {
          id v26 = objc_msgSend__newPurchaseDAAPServerWithDSID_(*(void **)(a1 + 48), v14, v20, v16);
          uint64_t v30 = objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 48), v27, v28, v29);
          objc_msgSend_setObject_forKeyedSubscript_(v30, v31, (uint64_t)v26, v20);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v118, (uint64_t)v133, 16);
    }
    while (v17);
  }

  uint64_t v32 = BLJaliscoLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = *(void *)(a1 + 56);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v33;
    _os_log_impl(&dword_21DFE3000, v32, OS_LOG_TYPE_DEFAULT, "Removing family member BLPurchaseDAAPServer objects for %@", (uint8_t *)&buf, 0xCu);
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v34 = *(id *)(a1 + 56);
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v114, (uint64_t)v132, 16);
  if (v39)
  {
    uint64_t v40 = *(void *)v115;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v115 != v40) {
          objc_enumerationMutation(v34);
        }
        uint64_t v42 = *(void *)(*((void *)&v114 + 1) + 8 * j);
        uint64_t v43 = objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 48), v36, v37, v38);
        objc_msgSend_setObject_forKeyedSubscript_(v43, v44, 0, v42);
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v114, (uint64_t)v132, 16);
    }
    while (v39);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v128 = 0x3032000000;
  v129 = sub_21E01B9A4;
  v130 = sub_21E01B9B4;
  id v131 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = sub_21E01B9A4;
  uint64_t v112 = sub_21E01B9B4;
  id v113 = 0;
  uint64_t v45 = *(void *)(a1 + 48);
  uint64_t v46 = *(void **)(v45 + 136);
  v104[0] = MEMORY[0x263EF8330];
  v104[1] = 3221225472;
  v104[2] = sub_21E0219AC;
  v104[3] = &unk_26448C1C8;
  v104[4] = v45;
  id v47 = v9;
  id v105 = v47;
  uint64_t v106 = &v108;
  p_long long buf = &buf;
  objc_msgSend_performBlockAndWait_(v46, v48, (uint64_t)v104, v49);
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v53 = BLJaliscoLog();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
LABEL_25:

      goto LABEL_26;
    }
    char v54 = *(void **)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v123 = 138412546;
    uint64_t v124 = (uint64_t)v47;
    __int16 v125 = 2112;
    v126 = v54;
    long long v55 = "_processFamilyCircle: Failed to fetch jalisco objects excluding current family members: %@,  %@";
    uint64_t v56 = v53;
    os_log_type_t v57 = OS_LOG_TYPE_ERROR;
    uint32_t v58 = 22;
LABEL_24:
    _os_log_impl(&dword_21DFE3000, v56, v57, v55, v123, v58);
    goto LABEL_25;
  }
  if (!objc_msgSend_count((void *)v109[5], v50, v51, v52))
  {
    uint64_t v53 = BLJaliscoLog();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_WORD *)v123 = 0;
    long long v55 = "_processFamilyCircle: No items up for deletion";
    uint64_t v56 = v53;
    os_log_type_t v57 = OS_LOG_TYPE_INFO;
    uint32_t v58 = 2;
    goto LABEL_24;
  }
  __int16 v64 = BLJaliscoLog();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v68 = objc_msgSend_count((void *)v109[5], v65, v66, v67);
    uint64_t v71 = objc_msgSend_valueForKey_((void *)v109[5], v69, @"storeID", v70);
    v75 = objc_msgSend_bu_arrayByRemovingDuplicates(v71, v72, v73, v74);
    *(_DWORD *)v123 = 134218242;
    uint64_t v124 = v68;
    __int16 v125 = 2112;
    v126 = v75;
    _os_log_impl(&dword_21DFE3000, v64, OS_LOG_TYPE_DEBUG, "_processFamilyCircle: Deleting %lu jalisco objects that are no longer accessible: %@", v123, 0x16u);
  }
  long long v103 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v100 = 0u;
  id v76 = (id)v109[5];
  uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v100, (uint64_t)v122, 16);
  if (v80)
  {
    uint64_t v81 = *(void *)v101;
    do
    {
      for (uint64_t k = 0; k != v80; ++k)
      {
        if (*(void *)v101 != v81) {
          objc_enumerationMutation(v76);
        }
        objc_msgSend_deleteObject_(*(void **)(*(void *)(a1 + 48) + 136), v78, *(void *)(*((void *)&v100 + 1) + 8 * k), v79);
      }
      uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v78, (uint64_t)&v100, (uint64_t)v122, 16);
    }
    while (v80);
  }

  if (objc_msgSend_hasChanges(*(void **)(*(void *)(a1 + 48) + 136), v83, v84, v85))
  {
    long long v88 = *(void **)(*(void *)(a1 + 48) + 136);
    id v99 = 0;
    char v89 = objc_msgSend_save_(v88, v86, (uint64_t)&v99, v87);
    uint64_t v53 = v99;
    if (v53) {
      char v90 = v89;
    }
    else {
      char v90 = 1;
    }
    if ((v90 & 1) == 0)
    {
      long long v91 = BLJaliscoLog();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v123 = 138412290;
        uint64_t v124 = (uint64_t)v53;
        _os_log_impl(&dword_21DFE3000, v91, OS_LOG_TYPE_ERROR, "Moc Save Error:  %@", v123, 0xCu);
      }
    }
    goto LABEL_25;
  }
LABEL_26:
  id v59 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E021A6C;
  block[3] = &unk_26448C1F0;
  id v93 = *(id *)(a1 + 32);
  id v60 = *(id *)(a1 + 56);
  uint64_t v61 = *(void *)(a1 + 48);
  id v94 = v60;
  uint64_t v95 = v61;
  id v62 = *(id *)(a1 + 64);
  id v97 = 0;
  id v98 = v62;
  id v96 = v47;
  id v63 = v47;
  dispatch_async(v59, block);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&buf, 8);
}

void sub_21E021958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_21E0219AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend__fetchRequestForNotInStoreAccountIDs_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  objc_opt_class();
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 136);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v9 = objc_msgSend_executeFetchRequest_error_(v6, v8, (uint64_t)v5, (uint64_t)&obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v10 = BUDynamicCast();
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void sub_21E021A6C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4) || *(void *)(a1 + 40))
  {
    uint64_t v8 = objc_msgSend_delegate(*(void **)(a1 + 48), v5, v6, v7);
    objc_msgSend_clientDetectedPredicateChange_(v8, v9, *(void *)(a1 + 48), v10);
  }
  uint64_t v11 = (void (**)(void, void, void))MEMORY[0x223C1EDC0](*(void *)(a1 + 72));
  if (v11)
  {
    if (*(void *)(a1 + 64)) {
      uint64_t v12 = *(void *)(a1 + 64);
    }
    else {
      uint64_t v12 = MEMORY[0x263EFFA68];
    }
    id v13 = v11;
    v11[2](v11, *(void *)(a1 + 56), v12);
    uint64_t v11 = (void (**)(void, void, void))v13;
  }
}

void sub_21E021B80(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 112);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E021D94;
  block[3] = &unk_26448C240;
  void block[4] = v2;
  block[5] = &v24;
  void block[6] = *(void *)(a1 + 40);
  dispatch_sync(v3, block);
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 32) && *((unsigned char *)v25 + 24))
  {
    objc_msgSend_willChangeValueForKey_((void *)v6, v4, @"initiallyLoadingJalisco", v5);
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    objc_msgSend_didChangeValueForKey_(*(void **)(a1 + 32), v7, @"initiallyLoadingJalisco", v8);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  uint64_t v9 = *(void **)(v6 + 16);
  if (v9 && *((unsigned char *)v25 + 24))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, (uint64_t)v28, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * i));
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v15, (uint64_t)&v19, (uint64_t)v28, 16);
      }
      while (v12);
    }

    objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 16), v16, v17, v18, (void)v19);
  }
  _Block_object_dispose(&v24, 8);
}

void sub_21E021D68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
}

void *sub_21E021D94(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 96) == result[6];
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    *(void *)(result[4] + 96) = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void sub_21E0223F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_swqDSIDToDAAPServer(*(void **)(a1 + 32), a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v4, v5, v6);
}

void sub_21E02243C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 120), a2, *(void *)(*(void *)(a1 + 32) + 8), a4);

  if (!v5)
  {
    uint64_t v8 = objc_msgSend__newPurchaseDAAPServerWithDSID_(*(void **)(a1 + 32), v6, *(void *)(*(void *)(a1 + 32) + 8), v7);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(void *)(a1 + 32) + 120), v9, (uint64_t)v8, *(void *)(*(void *)(a1 + 32) + 8));

    ++*(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(v10 + 88) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v10 + 8_Block_object_dispose(&STACK[0x230], 8) = 0x8000000000000000;
    }
  }
}

void sub_21E022798(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a2)
  {
    uint64_t v8 = objc_msgSend_createDaapURL_(*(void **)(a1 + 32), v5, a2, v6);
    uint64_t v9 = [BLURLRequestEncoder alloc];
    uint64_t v11 = objc_msgSend_initWithBag_withURLRequest_(v9, v10, *(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 32));
    uint64_t v15 = objc_msgSend_requestMethod(*(void **)(a1 + 32), v12, v13, v14);
    long long v19 = objc_msgSend_body(*(void **)(a1 + 32), v16, v17, v18);
    long long v21 = objc_msgSend_requestWithMethod_URL_parameters_(v11, v20, v15, (uint64_t)v8, v19);

    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = sub_21E022A24;
    v39[3] = &unk_26448C290;
    long long v22 = *(void **)(a1 + 40);
    v39[4] = *(void *)(a1 + 32);
    id v40 = v22;
    objc_msgSend_resultWithCompletion_(v21, v23, (uint64_t)v39, v24);

    BOOL v25 = v7;
  }
  else
  {
    uint64_t v26 = BLJaliscoLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v44 = v27;
      _os_log_impl(&dword_21DFE3000, v26, OS_LOG_TYPE_ERROR, "%@: No URL to configure with.", buf, 0xCu);
    }

    if (v7)
    {
      uint64_t v41 = @"Underlying Error Description";
      id v31 = objc_msgSend_description(v7, v28, v29, v30);
      uint64_t v42 = v31;
      uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)&v42, (uint64_t)&v41, 1);
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v33 = NSString;
    id v34 = objc_msgSend_description(*(void **)(a1 + 32), v28, v29, v30);
    objc_msgSend_stringWithFormat_(v33, v35, @"AMS bag error - no url for request %@", v36, v34);
    uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v25 = BLErrorWithUserInfo(3, 0, v37, v8);

    uint64_t v38 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    uint64_t v11 = (void *)v38;
    if (v38) {
      (*(void (**)(uint64_t, void, void *))(v38 + 16))(v38, 0, v25);
    }
  }
}

void sub_21E022A24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = v6;
  if (v5)
  {
    if (!v6)
    {
      uint64_t v28 = 0;
      goto LABEL_12;
    }
    id v35 = @"Underlying Error Description";
    uint64_t v11 = objc_msgSend_description(v6, v7, v8, v9);
    uint64_t v36 = v11;
    uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v12, (uint64_t)&v36, (uint64_t)&v35, 1);

    uint64_t v14 = NSString;
    uint64_t v18 = objc_msgSend_description(*(void **)(a1 + 32), v15, v16, v17);
    objc_msgSend_stringWithFormat_(v14, v19, @"AMS error with creating request in %@", v20, v18);
  }
  else
  {
    long long v21 = BLJaliscoLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v40 = v22;
      __int16 v41 = 2112;
      uint64_t v42 = v10;
      _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_ERROR, "Error with BLURLRequestEncoder creating request %@ %@", buf, 0x16u);
    }

    if (v10)
    {
      uint64_t v37 = @"Underlying Error Description";
      uint64_t v26 = objc_msgSend_description(v10, v23, v24, v25);
      uint64_t v38 = v26;
      uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v38, (uint64_t)&v37, 1);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v29 = NSString;
    uint64_t v18 = objc_msgSend_description(*(void **)(a1 + 32), v23, v24, v25);
    objc_msgSend_stringWithFormat_(v29, v30, @"AMS error - nil request %@", v31, v18);
  }
  uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = BLErrorWithUserInfo(3, 0, v32, v13);

LABEL_12:
  uint64_t v33 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  id v34 = (void *)v33;
  if (v33) {
    (*(void (**)(uint64_t, id, void *))(v33 + 16))(v33, v5, v28);
  }
}

void sub_21E022D70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v9 = a3;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_sharedSession(BLPurchaseDAAPServer, v6, v7, v8);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = sub_21E022F28;
    uint64_t v23 = &unk_26448C2E0;
    id v24 = v5;
    id v25 = *(id *)(a1 + 40);
    uint64_t v12 = objc_msgSend_dataTaskWithRequest_completionHandler_(v10, v11, (uint64_t)v24, (uint64_t)&v20);

    objc_msgSend_resume(v12, v13, v14, v15, v20, v21, v22, v23);
    id v16 = v24;
  }
  else
  {
    uint64_t v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "%@: Cannot execute request because request is nil %@", buf, 0x16u);
    }

    uint64_t v19 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    id v16 = (id)v19;
    if (v19) {
      (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v9);
    }
  }
}

void sub_21E022F28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = BLJaliscoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_ERROR, "daapURL request failed - Request %@, error:  %@", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v9 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      uint64_t v11 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v11();
    }
  }
  else
  {
    uint64_t v12 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    uint64_t v10 = (void *)v12;
    if (v12)
    {
      uint64_t v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_8;
    }
  }
}

void sub_21E0231D0(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = (void (**)(void, void, void))MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    if (v11)
    {
      uint64_t v12 = objc_msgSend_URLWithString_(NSURL, v9, (uint64_t)v22, v10);
      ((void (**)(void, void *, id))v11)[2](v11, v12, v5);
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      int v13 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v6, v7, v8);
      int isUserSignedInToiTunes = objc_msgSend_isUserSignedInToiTunes(v13, v14, v15, v16);

      if (isUserSignedInToiTunes)
      {
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(void **)(v18 + 8);
        *(void *)(v18 + _Block_object_dispose(&STACK[0x230], 8) = 0;

        objc_msgSend__URLWithRetry_completion_(*(void **)(a1 + 32), v20, 0, *(void *)(a1 + 40));
        goto LABEL_10;
      }
    }
    uint64_t v21 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    uint64_t v11 = (void (**)(void, void, void))v21;
    if (v21) {
      (*(void (**)(uint64_t, void, id))(v21 + 16))(v21, 0, v5);
    }
  }

LABEL_10:
}

void sub_21E0233C4(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v7 = a3;
  if (v17)
  {
    uint64_t v8 = objc_msgSend_stringByAppendingString_(@"iBooks-", v5, *(void *)(a1 + 32), v6);
    uint64_t v11 = objc_msgSend_objectForKey_(v17, v9, (uint64_t)v8, v10);

    if (!v11)
    {
      uint64_t v11 = objc_msgSend_objectForKey_(v17, v12, *(void *)(a1 + 32), v13);
    }
    uint64_t v14 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    uint64_t v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v11, v7);
    }
  }
  else
  {
    uint64_t v16 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
    uint64_t v11 = (void *)v16;
    if (v16) {
      (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v7);
    }
  }
}

void sub_21E02359C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = BLJaliscoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      uint64_t v12 = @"purchase-daap";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Error fetching %@:  %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v9 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  uint64_t v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
  }
}

uint64_t BLBookTypeFromPathExtension(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_lowercaseString(a1, a2, a3, a4);
  if (objc_msgSend_isEqualToString_(@"pdf", v5, (uint64_t)v4, v6))
  {
    uint64_t v9 = 2;
  }
  else if (objc_msgSend_isEqualToString_(@"epub", v7, (uint64_t)v4, v8))
  {
    uint64_t v9 = 0;
  }
  else if (objc_msgSend_isEqualToString_(@"ibooks", v10, (uint64_t)v4, v11))
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 3;
  }

  return v9;
}

void sub_21E024D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E024D60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E024D70(uint64_t a1)
{
}

uint64_t sub_21E024D78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend_dataWithContentsOfURL_(MEMORY[0x263EFF8F8], a2, (uint64_t)a2, a4);

  return MEMORY[0x270F9A758]();
}

void sub_21E0252C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E0252F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend_path(*(void **)(a1 + 40), a2, a3, a4);
  uint64_t v7 = objc_msgSend_writeToFile_atomically_(v4, v6, (uint64_t)v5, 1);

  return v7;
}

void sub_21E025340(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 40);
  objc_msgSend_path(*(void **)(a1 + 32), a2, a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_21E0253AC(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08850];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v6 + 40);
  objc_msgSend_removeItemAtURL_error_(v5, v7, (uint64_t)v4, (uint64_t)&obj);

  objc_storeStrong((id *)(v6 + 40), obj);
}

__CFString *BLPathExtensionFromBookType(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_26CED4330;
  }
  else {
    return off_26448C4B0[a1];
  }
}

void sub_21E0260C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_defaultSessionConfiguration(MEMORY[0x263F08C00], a2, a3, a4);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeoutIntervalForRequest_(v21, v4, v5, v6, 90.0);
  objc_msgSend_setTimeoutIntervalForResource_(v21, v7, v8, v9, 90.0);
  __int16 v13 = objc_msgSend__clientIdentifier(BLPurchaseDAAPServer, v10, v11, v12);
  objc_msgSend_set_sourceApplicationBundleIdentifier_(v21, v14, (uint64_t)v13, v15);

  id v16 = objc_alloc(MEMORY[0x263F27EF0]);
  uint64_t v19 = objc_msgSend_initWithConfiguration_(v16, v17, (uint64_t)v21, v18);
  uint64_t v20 = (void *)qword_26AB3FF88;
  qword_26AB3FF88 = v19;
}

void sub_21E02617C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E026264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E026288(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (v11)
  {
    uint64_t v5 = objc_msgSend_stringByAppendingString_(@"iBooks-", v3, *(void *)(a1 + 32), v4);
    uint64_t v8 = objc_msgSend_objectForKey_(v11, v6, (uint64_t)v5, v7);

    if (!v8)
    {
      uint64_t v8 = objc_msgSend_objectForKey_(v11, v9, *(void *)(a1 + 32), v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_21E026350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E026424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E02643C(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void *)(a1 + 32);
  v8.n128_u64[0] = 0;
  if (isKindOfClass) {
    objc_msgSend_doubleValue(v9, v4, v5, v6, 0.0);
  }
  (*(void (**)(uint64_t, __n128))(v7 + 16))(v7, v8);
}

void sub_21E0264BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E02656C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E026584(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void *)(a1 + 32);
  if (isKindOfClass) {
    uint64_t v8 = objc_msgSend_BOOLValue(v9, v4, v5, v6);
  }
  else {
    uint64_t v8 = 1;
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v8);
}

void sub_21E02660C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E0266BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_21E0266D4(uint64_t a1, const char *a2, double a3)
{
  if (a3 <= 0.0) {
    return objc_msgSend_timeIntervalFromDAAPBagKey_completion_(*(void **)(a1 + 32), a2, @"update-polling-frequency-secs", *(void *)(a1 + 40));
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_21E02679C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E0267B4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3);
}

void sub_21E026830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E0268E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_21E0268F8(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 60.0);
}

uint64_t sub_21E026984(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_setIsServerSetup_(*(void **)(a1 + 32), a2, 0, a4);
  objc_msgSend_setIsServerSetupPending_(*(void **)(a1 + 32), v5, 0, v6);
  id v9 = *(void **)(a1 + 32);

  return objc_msgSend__setSessionID_(v9, v7, 0, v8);
}

void sub_21E026AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E026AD0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = BLJaliscoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      uint64_t v10 = @"purchase-daap";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Error fetching %@:  %@", (uint8_t *)&v9, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_21E026BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E027068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E02730C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_21E027350(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (objc_msgSend_isServerSetup(*(void **)(a1 + 32), a2, a3, a4))
    {
      uint64_t v8 = objc_msgSend_bagDatabaseID(*(void **)(a1 + 32), v5, v6, v7);

      if (v8)
      {
        int v9 = objc_msgSend__dataForArtRequest_(*(void **)(a1 + 32), v5, *(unsigned __int8 *)(a1 + 56), v7);
        if (v9)
        {
          uint64_t v10 = [BLDAAPArtRequest alloc];
          id v14 = objc_msgSend_dsid(*(void **)(a1 + 32), v11, v12, v13);
          uint64_t v18 = objc_msgSend_bagDatabaseID(*(void **)(a1 + 32), v15, v16, v17);
          uint64_t v20 = objc_msgSend_initWithDSID_databaseID_body_(v10, v19, (uint64_t)v14, (uint64_t)v18, v9);

          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = sub_21E027630;
          v33[3] = &unk_26448C610;
          objc_copyWeak(&v35, (id *)(a1 + 48));
          char v36 = *(unsigned char *)(a1 + 56);
          id v21 = *(id *)(a1 + 40);
          v33[4] = *(void *)(a1 + 32);
          id v34 = v21;
          objc_msgSend_executeWithCompletionHandler_(v20, v22, (uint64_t)v33, v23);

          objc_destroyWeak(&v35);
        }
        else
        {
          uint64_t v32 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
          uint64_t v20 = (void *)v32;
          if (v32) {
            (*(void (**)(uint64_t))(v32 + 16))(v32);
          }
        }

        goto LABEL_22;
      }
    }
  }
  else
  {
    id v24 = BLJaliscoLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_DEBUG, "Art Request: will not make request", buf, 2u);
    }
  }
  if ((objc_msgSend_isServerSetup(*(void **)(a1 + 32), v5, v6, v7) & 1) == 0)
  {
    __int16 v28 = BLJaliscoLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_DEBUG, "Art Request: Server isn't setup. Can't do this right now.", buf, 2u);
    }
  }
  id v29 = objc_msgSend_bagDatabaseID(*(void **)(a1 + 32), v25, v26, v27);

  if (!v29)
  {
    uint64_t v30 = BLJaliscoLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v30, OS_LOG_TYPE_DEBUG, "Art Request: Can't make request. No DB ID.", buf, 2u);
    }
  }
  uint64_t v31 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  int v9 = (void *)v31;
  if (v31) {
    (*(void (**)(uint64_t))(v31 + 16))(v31);
  }
LABEL_22:
}

void sub_21E0275E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E027630(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)MEMORY[0x223C1EB90]();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E02777C;
  v13[3] = &unk_26448C5E8;
  v13[4] = WeakRetained;
  char v18 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v5;
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  objc_msgSend__preProcessResponse_error_responseBlock_(WeakRetained, v12, (uint64_t)v10, (uint64_t)v11, v13);
}

void sub_21E027744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02777C(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 2:
      id v9 = BLJaliscoLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = objc_msgSend_dsid(*(void **)(a1 + 32), v10, v11, v12);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v46 = v13;
        _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_INFO, "Art Request: dsid: %@ succeeded", buf, 0xCu);
      }
      id v14 = *(void **)(a1 + 32);
      char v18 = objc_msgSend_data(*(void **)(a1 + 48), v15, v16, v17);
      id v21 = objc_msgSend__processResponse_(v14, v19, (uint64_t)v18, v20);

      if (v21)
      {
        id v25 = objc_msgSend_sharedSource(BLJaliscoServerSource, v22, v23, v24);
        id v29 = objc_msgSend_newManagedObjectContext(v25, v26, v27, v28);

        uint64_t v30 = (void *)MEMORY[0x223C1EB90]();
        uint64_t v31 = *(void *)(a1 + 56);
        uint64_t v32 = *(NSObject **)(v31 + 64);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_21E027AC0;
        block[3] = &unk_26448C5C0;
        void block[4] = v31;
        id v43 = v29;
        uint64_t v33 = v21;
        uint64_t v44 = v33;
        id v34 = v29;
        dispatch_async(v32, block);
      }
      else
      {
        uint64_t v33 = 0;
      }
      goto LABEL_14;
    case 1:
      uint64_t v33 = BLJaliscoLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = objc_msgSend_dsid(*(void **)(a1 + 32), v35, v36, v37);
        uint64_t v39 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v46 = v38;
        __int16 v47 = 2112;
        uint64_t v48 = v39;
        _os_log_impl(&dword_21DFE3000, v33, OS_LOG_TYPE_ERROR, "Art Request: %@, Error getting response:  %@", buf, 0x16u);
      }
LABEL_14:

      break;
    case 0:
      id v3 = BLJaliscoLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = objc_msgSend_dsid(*(void **)(a1 + 32), v4, v5, v6);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v46 = v7;
        _os_log_impl(&dword_21DFE3000, v3, OS_LOG_TYPE_DEBUG, "Art Request: dsid: %@, RETRY", buf, 0xCu);
      }
      objc_msgSend_updateItemImageURLsIgnoringCache_completion_(*(void **)(a1 + 32), v8, *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 64));
      return;
  }
  uint64_t v40 = MEMORY[0x223C1EDC0](*(void *)(a1 + 64));
  __int16 v41 = (void *)v40;
  if (v40) {
    (*(void (**)(uint64_t))(v40 + 16))(v40);
  }
}

void sub_21E027A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E027AC0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v112[1] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, a4);
  uint64_t v8 = objc_msgSend_dsid(*(void **)(a1 + 32), v5, v6, v7);
  v112[0] = v8;
  id v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v9, (uint64_t)v112, 1);
  uint64_t v95 = objc_msgSend_itemsFetchRequestForDSIDs_(v4, v11, (uint64_t)v10, v12);

  uint64_t v13 = *(void **)(a1 + 40);
  id v106 = 0;
  uint64_t v15 = objc_msgSend_executeFetchRequest_error_(v13, v14, (uint64_t)v95, (uint64_t)&v106);
  id v93 = v106;
  id v94 = (void *)v15;
  if (v15)
  {
    uint64_t v92 = objc_msgSend_objectForKey_(*(void **)(a1 + 48), v16, @"dmap.listing", v17);
    char v18 = NSDictionary;
    id v21 = objc_msgSend_valueForKey_(v94, v19, @"cloudID", v20);
    id v99 = objc_msgSend_dictionaryWithObjects_forKeys_(v18, v22, (uint64_t)v94, (uint64_t)v21);

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v23 = v92;
    id obj = v23;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v102, (uint64_t)v111, 16);
    if (v28)
    {
      char v29 = 0;
      uint64_t v98 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v103 != v98) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          uint64_t v32 = objc_msgSend_itemID(v31, v25, v26, v27);
          id v35 = objc_msgSend_stringWithFormat_(NSString, v33, @"%llu", v34, v32);
          uint64_t v38 = objc_msgSend_objectForKey_(v99, v36, (uint64_t)v35, v37);

          if (v38)
          {
            __int16 v41 = objc_msgSend_objectForKey_(v31, v39, @"full-token", v40);
            uint64_t v44 = objc_msgSend_objectForKey_(v31, v42, @"full-url", v43);
            if (objc_msgSend_length(v41, v45, v46, v47) && objc_msgSend_length(v44, v48, v49, v50))
            {
              os_log_type_t v57 = objc_msgSend_artworkTokenCode(v38, v51, v52, v53);
              if (v57)
              {
                uint32_t v58 = objc_msgSend_artworkTokenCode(v38, v54, v55, v56);
                char isEqualToString = objc_msgSend_isEqualToString_(v58, v59, (uint64_t)v41, v60);

                if ((isEqualToString & 1) == 0)
                {
                  id v63 = objc_msgSend_sharedClient(BLJaliscoDAAPClient, v54, v62, v56);
                  uint64_t v67 = objc_msgSend_imageManagerDelegate(v63, v64, v65, v66);
                  uint64_t v71 = objc_msgSend_storeID(v38, v68, v69, v70);
                  id v101 = 0;
                  char v73 = objc_msgSend_removeImageForStoreID_error_(v67, v72, (uint64_t)v71, (uint64_t)&v101);
                  id v74 = v101;

                  if ((v73 & 1) == 0)
                  {
                    v75 = BLJaliscoLog();
                    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v108 = v74;
                      _os_log_impl(&dword_21DFE3000, v75, OS_LOG_TYPE_ERROR, "ERROR removing time-bombed artwork:  %@", buf, 0xCu);
                    }
                  }
                }
              }
              objc_msgSend_setArtworkTokenCode_(v38, v54, (uint64_t)v41, v56);
              objc_msgSend_setArtworkURLString_(v38, v76, (uint64_t)v44, v77);
              char v29 = 1;
            }
            else
            {
              uint64_t v78 = BLJaliscoLog();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v82 = objc_msgSend_storeID(v38, v79, v80, v81);
                uint64_t v86 = objc_msgSend_additionalInfo(v31, v83, v84, v85);
                *(_DWORD *)long long buf = 138412546;
                id v108 = v82;
                __int16 v109 = 2112;
                uint64_t v110 = v86;
                _os_log_impl(&dword_21DFE3000, v78, OS_LOG_TYPE_DEBUG, "Incomplete artwork response for %@ -- %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v102, (uint64_t)v111, 16);
      }
      while (v28);

      if ((v29 & 1) == 0) {
        goto LABEL_30;
      }
      long long v88 = *(void **)(a1 + 32);
      uint64_t v89 = *(void *)(a1 + 40);
      id v100 = 0;
      char v90 = objc_msgSend__saveInMoc_error_(v88, v87, v89, (uint64_t)&v100);
      id v23 = v100;
      if ((v90 & 1) == 0)
      {
        long long v91 = BLJaliscoLog();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v108 = v23;
          _os_log_impl(&dword_21DFE3000, v91, OS_LOG_TYPE_ERROR, "Error saving artwork state %@", buf, 0xCu);
        }
      }
    }

LABEL_30:
  }
}

void sub_21E027FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_21E02847C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21E0286F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E0288CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  _Unwind_Resume(a1);
}

void sub_21E02891C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (objc_msgSend_isServerSetup(*(void **)(a1 + 32), a2, a3, a4))
    {
      uint64_t v8 = objc_msgSend_bagDatabaseID(*(void **)(a1 + 32), v5, v6, v7);

      if (v8)
      {
        id v9 = objc_msgSend__dataForHideItemsRequestWithStoreIDs_(*(void **)(a1 + 32), v5, *(void *)(a1 + 40), v7);
        if (v9)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
          uint64_t v11 = [BLDAAPHideItemsRequest alloc];
          uint64_t v15 = objc_msgSend_dsid(WeakRetained, v12, v13, v14);
          uint64_t v19 = objc_msgSend_bagDatabaseID(WeakRetained, v16, v17, v18);
          id v21 = objc_msgSend_initWithDSID_databaseID_body_(v11, v20, (uint64_t)v15, (uint64_t)v19, v9);

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = sub_21E028C50;
          v34[3] = &unk_26448C688;
          void v34[4] = WeakRetained;
          id v35 = *(id *)(a1 + 40);
          id v36 = *(id *)(a1 + 48);
          objc_msgSend_executeWithCompletionHandler_(v21, v22, (uint64_t)v34, v23);
        }
        else
        {
          uint64_t v32 = BLJaliscoLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_21DFE3000, v32, OS_LOG_TYPE_DEBUG, "HideItems: Can't make request. Can't create request body", buf, 2u);
          }

          uint64_t v33 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
          id WeakRetained = (id)v33;
          if (v33) {
            (*(void (**)(uint64_t, void))(v33 + 16))(v33, 0);
          }
        }

        goto LABEL_24;
      }
    }
  }
  else
  {
    uint64_t v24 = BLJaliscoLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_DEBUG, "HideItems: will not make request", buf, 2u);
    }
  }
  if ((objc_msgSend_isServerSetup(*(void **)(a1 + 32), v5, v6, v7) & 1) == 0)
  {
    uint64_t v28 = BLJaliscoLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_DEBUG, "HideItems: Server isn't setup. Can't do this right now.", buf, 2u);
    }
  }
  char v29 = objc_msgSend_bagDatabaseID(*(void **)(a1 + 32), v25, v26, v27);

  if (!v29)
  {
    uint64_t v30 = BLJaliscoLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v30, OS_LOG_TYPE_DEBUG, "HideItems: Can't make request. No DB ID.", buf, 2u);
    }
  }
  uint64_t v31 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
  id v9 = (void *)v31;
  if (v31) {
    (*(void (**)(uint64_t, void))(v31 + 16))(v31, 0);
  }
LABEL_24:
}

void sub_21E028BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E028C50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E028D7C;
  v12[3] = &unk_26448C660;
  v12[4] = v7;
  id v13 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v8;
  id v14 = v6;
  id v9 = v5;
  id v10 = v6;
  objc_msgSend__preProcessResponse_error_responseBlock_(v7, v11, (uint64_t)v9, (uint64_t)v10, v12);
}

void sub_21E028D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_21E028D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 2:
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = objc_msgSend_data(*(void **)(a1 + 56), (const char *)2, a3, a4);
      uint64_t v11 = objc_msgSend__processResponse_(v7, v9, (uint64_t)v8, v10);

      oslog = v11;
      objc_msgSend__updateVersionAfterHideRequest_(*(void **)(a1 + 32), v12, (uint64_t)v11, v13);
      id v16 = objc_msgSend_objectForKey_(v11, v14, @"dmap.listing", v15);
      uint64_t v17 = objc_opt_new();
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v18 = v16;
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v107, (uint64_t)v113, 16, v16);
      if (v23)
      {
        uint64_t v24 = *(void *)v108;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v108 != v24) {
              objc_enumerationMutation(v18);
            }
            uint64_t v26 = *(void **)(*((void *)&v107 + 1) + 8 * i);
            uint64_t v27 = objc_msgSend_additionalInfo(v26, v20, v21, v22);
            uint64_t v30 = objc_msgSend_objectForKey_(v27, v28, @"dmap.status", v29);

            if (objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33) == 200)
            {
              uint64_t v37 = NSNumber;
              uint64_t v38 = objc_msgSend_itemID(v26, v34, v35, v36);
              __int16 v41 = objc_msgSend_numberWithUnsignedLongLong_(v37, v39, v38, v40);
              objc_msgSend_addObject_(v17, v42, (uint64_t)v41, v43);
            }
          }
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v107, (uint64_t)v113, 16);
        }
        while (v23);
      }

      uint64_t v47 = objc_msgSend_sharedSource(BLJaliscoServerSource, v44, v45, v46);
      uint64_t v51 = objc_msgSend_newManagedObjectContext(v47, v48, v49, v50);

      id v6 = objc_opt_new();
      if (objc_msgSend_count(v17, v52, v53, v54))
      {
        uint64_t v55 = BLJaliscoLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v115 = v17;
          _os_log_impl(&dword_21DFE3000, v55, OS_LOG_TYPE_DEFAULT, "HideItems: Finding corresponding jalisco items with cloudIDs(%@)", buf, 0xCu);
        }

        id v59 = objc_msgSend_sharedSource(BLJaliscoServerSource, v56, v57, v58);
        id v63 = objc_msgSend_dsid(*(void **)(a1 + 32), v60, v61, v62);
        uint64_t v112 = v63;
        uint64_t v65 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v64, (uint64_t)&v112, 1);
        uint64_t v98 = objc_msgSend_fetchRequestForAllCloudIDs_dsids_(v59, v66, (uint64_t)v17, (uint64_t)v65);

        id v106 = 0;
        uint64_t v68 = objc_msgSend_executeFetchRequest_error_(v51, v67, (uint64_t)v98, (uint64_t)&v106);
        id v97 = v106;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v69 = v68;
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v102, (uint64_t)v111, 16);
        if (v73)
        {
          uint64_t v74 = *(void *)v103;
          uint64_t v75 = MEMORY[0x263EFFA88];
          do
          {
            for (uint64_t j = 0; j != v73; ++j)
            {
              if (*(void *)v103 != v74) {
                objc_enumerationMutation(v69);
              }
              uint64_t v77 = *(void **)(*((void *)&v102 + 1) + 8 * j);
              objc_msgSend_setIsHidden_(v77, v71, v75, v72);
              v83 = objc_msgSend_storeID(v77, v78, v79, v80);
              if (v83) {
                objc_msgSend_addObject_(v6, v81, (uint64_t)v83, v82);
              }
            }
            uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v71, (uint64_t)&v102, (uint64_t)v111, 16);
          }
          while (v73);
        }

        if (objc_msgSend_hasChanges(v51, v84, v85, v86))
        {
          uint64_t v87 = BLJaliscoLog();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v115 = v6;
            _os_log_impl(&dword_21DFE3000, v87, OS_LOG_TYPE_DEFAULT, "HideItems: Hiding items locally in database:(%@)", buf, 0xCu);
          }

          long long v88 = *(void **)(a1 + 32);
          id v101 = 0;
          char v90 = objc_msgSend__saveInMoc_error_(v88, v89, (uint64_t)v51, (uint64_t)&v101);
          id v91 = v101;
          if ((v90 & 1) == 0)
          {
            uint64_t v92 = BLJaliscoLog();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v115 = v91;
              _os_log_impl(&dword_21DFE3000, v92, OS_LOG_TYPE_ERROR, "Error saving items after hiding.  %@", buf, 0xCu);
            }
          }
        }
      }
      id v93 = BLJaliscoLog();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v115 = v6;
        _os_log_impl(&dword_21DFE3000, v93, OS_LOG_TYPE_DEFAULT, "HideItems: success %@", buf, 0xCu);
      }

      goto LABEL_44;
    case 1:
      oslog = BLJaliscoLog();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v94 = *(void **)(a1 + 48);
        *(_DWORD *)long long buf = 138412290;
        id v115 = v94;
        _os_log_impl(&dword_21DFE3000, oslog, OS_LOG_TYPE_ERROR, "HideItems: Error getting response:  %@", buf, 0xCu);
      }
      id v6 = 0;
LABEL_44:

      goto LABEL_45;
    case 0:
      id v4 = BLJaliscoLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_DEBUG, "HideItems: retry", buf, 2u);
      }

      objc_msgSend_hideItemsWithStoreIDs_completion_(*(void **)(a1 + 32), v5, *(void *)(a1 + 40), *(void *)(a1 + 64));
      break;
  }
  id v6 = 0;
LABEL_45:
  uint64_t v95 = MEMORY[0x223C1EDC0](*(void *)(a1 + 64));
  id v96 = (void *)v95;
  if (v95) {
    (*(void (**)(uint64_t, void *))(v95 + 16))(v95, v6);
  }
}

void sub_21E02939C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21E0295A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int isServerSetup = objc_msgSend_isServerSetup(*(void **)(a1 + 32), a2, a3, a4);
  id v9 = *(void **)(a1 + 48);
  if (isServerSetup)
  {
    uint64_t v27 = (void (**)(id, uint64_t))MEMORY[0x223C1EDC0](v9);
    if (v27) {
      v27[2](v27, 1);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 40);
      if (!v10)
      {
        id v11 = objc_alloc(MEMORY[0x263EFF9C0]);
        uint64_t v14 = objc_msgSend_initWithCapacity_(v11, v12, 1, v13);
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 40);
        id v9 = *(void **)(a1 + 48);
      }
      uint64_t v17 = objc_msgSend_copy(v9, v5, v6, v7);
      objc_msgSend_addObject_(v10, v18, (uint64_t)v17, v19);
    }
    if ((objc_msgSend_isServerSetupPending(*(void **)(a1 + 32), v5, v6, v7) & 1) == 0)
    {
      objc_msgSend_setIsServerSetupPending_(*(void **)(a1 + 32), v20, 1, v21);
      uint64_t v22 = *(void *)(a1 + 56);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = sub_21E02974C;
      v28[3] = &unk_26448C750;
      uint64_t v23 = *(void **)(a1 + 32);
      id v24 = *(id *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 32);
      id v29 = v24;
      uint64_t v30 = v25;
      uint64_t v31 = *(void *)(a1 + 56);
      objc_msgSend__configureWithReason_completion_(v23, v26, v22, (uint64_t)v28);
    }
  }
}

void sub_21E02971C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E02974C(int8x16_t *a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E0297E4;
  block[3] = &unk_26448C728;
  char v6 = a2;
  uint64_t v5 = a1[3].i64[0];
  int8x16_t v2 = a1[2];
  int8x16_t v4 = vextq_s8(v2, v2, 8uLL);
  dispatch_async((dispatch_queue_t)(id)v2.i64[0], block);
}

void sub_21E0297E4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_21E0298F4;
    v11[3] = &unk_26448C700;
    id v3 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v12 = v4;
    uint64_t v13 = v5;
    objc_msgSend__loginWithReason_completion_(v3, v6, v2, (uint64_t)v11);
  }
  else
  {
    uint64_t v7 = BLJaliscoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_ERROR, "DAAP Server-Info failed.", v10, 2u);
    }

    objc_msgSend__sendSetupConfigurationHandlersWithSuccess_(*(void **)(a1 + 32), v8, 0, v9);
  }
}

void sub_21E0298E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21E0298F4(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_21E02996C;
  v3[3] = &unk_26448C6D8;
  char v4 = a2;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t sub_21E02996C(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(unsigned char *)(a1 + 40) != 0;
  char v4 = BLJaliscoLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = objc_msgSend_dsid(*(void **)(a1 + 32), v6, v7, v8);
      int v22 = 138412290;
      uint64_t v23 = v9;
      _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_INFO, "DAAP Login success for dsid: %@. Kicking off artwork fetch..", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v5 = objc_msgSend_sharedClient(BLJaliscoDAAPClient, v10, v11, v12);
    id v16 = objc_msgSend_imageManagerDelegate(v5, v13, v14, v15);
    objc_msgSend_fetchAllImageAssetsIgnoringLocalCache_(v16, v17, 0, v18);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_ERROR, "DAAP Login failed.", (uint8_t *)&v22, 2u);
  }

  return objc_msgSend__sendSetupConfigurationHandlersWithSuccess_(*(void **)(a1 + 32), v19, v2 != 0, v20);
}

void sub_21E029AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E029C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E029CA4(uint64_t a1)
{
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  int v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  BOOL v3 = *(void **)(a1 + 32);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = sub_21E02A00C;
  v37[3] = &unk_26448C7A0;
  uint64_t v39 = v41;
  char v4 = v2;
  uint64_t v38 = v4;
  objc_msgSend_appRefreshesOnLaunchWithCompletionHandler_(v3, v5, (uint64_t)v37, v6);
  dispatch_group_enter(v4);
  uint64_t v7 = *(void **)(a1 + 32);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_21E02A020;
  v34[3] = &unk_26448C7C8;
  uint64_t v36 = v43;
  uint64_t v8 = v4;
  uint64_t v35 = v8;
  objc_msgSend_forcedRefreshFrequencyWithCompletionHandler_(v7, v9, (uint64_t)v34, v10);
  dispatch_group_enter(v8);
  uint64_t v11 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  void v31[2] = sub_21E02A034;
  v31[3] = &unk_26448C7C8;
  uint64_t v33 = v40;
  uint64_t v12 = v8;
  uint64_t v32 = v12;
  objc_msgSend_pollingFrequencyWithCompletionHandler_(v11, v13, (uint64_t)v31, v14);
  dispatch_group_enter(v12);
  uint64_t v15 = *(void **)(a1 + 32);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = sub_21E02A048;
  v29[3] = &unk_26448C7F0;
  v29[4] = v15;
  id v16 = v12;
  uint64_t v30 = v16;
  objc_msgSend_databaseIDWithCompletionHandler_(v15, v17, (uint64_t)v29, v18);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_21E02A088;
  v21[3] = &unk_26448C958;
  uint64_t v19 = *(NSObject **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  uint64_t v24 = v40;
  uint64_t v25 = v43;
  uint64_t v26 = v41;
  uint64_t v20 = *(void **)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 56);
  char v28 = *(unsigned char *)(a1 + 64);
  id v23 = v20;
  id v22 = *(id *)(a1 + 40);
  dispatch_group_notify(v16, v19, v21);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void sub_21E029FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  _Block_object_dispose((const void *)(v38 - 176), 8);
  _Block_object_dispose((const void *)(v38 - 144), 8);
  _Block_object_dispose((const void *)(v38 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E02A00C(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E02A020(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E02A034(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E02A048(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_setBagDatabaseID_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
  uint64_t v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void sub_21E02A088(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_dsid(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, @"kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary", v11);
  id v16 = objc_msgSend_stringValue(v5, v13, v14, v15);
  uint64_t v19 = objc_msgSend_objectForKey_(v12, v17, (uint64_t)v16, v18);

  id v23 = objc_msgSend_dateByAddingTimeInterval_(*(void **)(*(void *)(a1 + 32) + 8), v20, v21, v22, *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  uint64_t v27 = objc_msgSend_dateByAddingTimeInterval_(v19, v24, v25, v26, *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  uint64_t v31 = (void *)v27;
  if (!v23
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 7)
  {
    BOOL v32 = 1;
    if (!v27) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v33 = objc_msgSend_date(MEMORY[0x263EFF910], v28, v29, v30);
    BOOL v32 = objc_msgSend_compare_(v23, v34, (uint64_t)v33, v35) == -1;

    if (!v31) {
      goto LABEL_9;
    }
  }
  uint64_t v36 = objc_msgSend_date(MEMORY[0x263EFF910], v28, v29, v30);
  uint64_t v39 = objc_msgSend_compare_(v31, v37, (uint64_t)v36, v38);

  if (v39 != -1)
  {
    int v40 = 0;
    goto LABEL_10;
  }
LABEL_9:
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
  int v40 = 1;
LABEL_10:
  __int16 v41 = BLJaliscoLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v45 = objc_msgSend_dsid(*(void **)(a1 + 32), v42, v43, v44);
    *(_DWORD *)long long buf = 138413058;
    id v69 = v19;
    __int16 v70 = 2112;
    uint64_t v71 = v23;
    __int16 v72 = 2112;
    uint64_t v73 = v31;
    __int16 v74 = 2112;
    uint64_t v75 = v45;
    _os_log_impl(&dword_21DFE3000, v41, OS_LOG_TYPE_DEFAULT, "1. [BLPurchaseDAAPServer] FetchItemsPolitely: dsid:%@ lastFullRefreshedAt:%@ nextUpdateAt:%@ nextFullRefreshAt:%@", buf, 0x2Au);
  }
  if (*(unsigned char *)(a1 + 88)) {
    int v46 = v32;
  }
  else {
    int v46 = 1;
  }
  if ((v40 | v46))
  {
    uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v49 = *(void **)(a1 + 32);
    uint64_t v48 = *(void **)(a1 + 40);
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = sub_21E02A4FC;
    void v60[3] = &unk_26448C930;
    id v50 = v48;
    uint64_t v51 = *(void *)(a1 + 32);
    id v61 = v50;
    uint64_t v62 = v51;
    uint64_t v65 = *(void *)(a1 + 80);
    char v66 = v40;
    char v67 = *(unsigned char *)(a1 + 88);
    id v64 = *(id *)(a1 + 48);
    id v63 = v5;
    objc_msgSend_setupWithReason_queue_completion_(v49, v52, v47, (uint64_t)v50, v60);

    uint64_t v53 = v61;
  }
  else
  {
    uint64_t v54 = BLJaliscoLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v58 = objc_msgSend_date(MEMORY[0x263EFF910], v55, v56, v57);
      *(_DWORD *)long long buf = 138412546;
      id v69 = v23;
      __int16 v70 = 2112;
      uint64_t v71 = v58;
      _os_log_impl(&dword_21DFE3000, v54, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] FetchItemsPolitely: Being polite and NOT updating at the current time. %@ > %@", buf, 0x16u);
    }
    uint64_t v59 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
    uint64_t v53 = (void *)v59;
    if (v59) {
      (*(void (**)(uint64_t, uint64_t))(v59 + 16))(v59, 1);
    }
  }
}

void sub_21E02A444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02A4FC(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E02A5D8;
  block[3] = &unk_26448C908;
  char v10 = a2;
  uint64_t v9 = *(void *)(a1 + 64);
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  BOOL v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  __int16 v11 = *(_WORD *)(a1 + 72);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void sub_21E02A5D8(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  BOOL v2 = *(unsigned char *)(a1 + 72) == 0;
  BOOL v3 = BLJaliscoLog();
  int8x16_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = objc_msgSend_dsid(*(void **)(a1 + 32), v17, v18, v19);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v30 = v20;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_ERROR, "[BLPurchaseDAAPServer] FetchItemsPolitely fail for %@", buf, 0xCu);
    }
    uint64_t v21 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
    id v16 = (void *)v21;
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend_dsid(*(void **)(a1 + 32), v5, v6, v7);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v9;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_DEFAULT, "2. [BLPurchaseDAAPServer] dsid: %@ Setup server with reason %ld. Now polling", buf, 0x16u);
    }
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_21E02A83C;
    v23[3] = &unk_26448C8E0;
    __int16 v11 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v24 = v12;
    uint64_t v25 = v13;
    __int16 v28 = *(_WORD *)(a1 + 73);
    long long v22 = *(_OWORD *)(a1 + 56);
    id v14 = (id)v22;
    long long v27 = v22;
    id v26 = *(id *)(a1 + 48);
    objc_msgSend__pollLatestRevisionWithReason_completion_(v11, v15, v10, (uint64_t)v23);

    id v16 = v24;
  }
}

void sub_21E02A7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02A83C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E02A930;
  block[3] = &unk_26448C8B8;
  char v14 = a2;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  id v9 = v5;
  __int16 v15 = *(_WORD *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v10 = v6;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async(v6, block);
}

void sub_21E02A930(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 80))
  {
    id v5 = objc_msgSend_sharedSource(BLJaliscoServerSource, a2, a3, a4);
    id v9 = objc_msgSend_newManagedObjectContext(v5, v6, v7, v8);

    id v12 = objc_msgSend__localServerDatabaseRevisionInMoc_(*(void **)(a1 + 32), v10, (uint64_t)v9, v11);
    uint64_t v13 = BLJaliscoLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_msgSend_dsid(*(void **)(a1 + 32), v14, v15, v16);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)long long buf = 138413058;
      char v67 = v17;
      __int16 v68 = 2112;
      *(void *)id v69 = v19;
      *(_WORD *)&v69[8] = 2114;
      *(void *)&v69[10] = v18;
      __int16 v70 = 2114;
      uint64_t v71 = v12;
      _os_log_impl(&dword_21DFE3000, v13, OS_LOG_TYPE_DEFAULT, "3. [BLPurchaseDAAPServer] dsid: %@ Last poll before this at:(%@). Finished POLLING, latestVersion:%{public}@ localServerRevision:%{public}@ Fetching database", buf, 0x2Au);
    }
    uint64_t v23 = objc_msgSend_date(MEMORY[0x263EFF910], v20, v21, v22);
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void **)(v24 + 8);
    *(void *)(v24 + _Block_object_dispose(&STACK[0x230], 8) = v23;

    if (!*(unsigned char *)(a1 + 81)
      && *(unsigned char *)(a1 + 82)
      && (uint64_t v49 = *(void *)(a1 + 40)) != 0
      && (objc_msgSend_isEqualToNumber_(v12, v26, v49, v27) & 1) != 0)
    {
      id v50 = BLJaliscoLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v54 = objc_msgSend_dsid(*(void **)(a1 + 32), v51, v52, v53);
        uint64_t v55 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412802;
        char v67 = v54;
        __int16 v68 = 2114;
        *(void *)id v69 = v55;
        *(_WORD *)&v69[8] = 2114;
        *(void *)&v69[10] = v12;
        _os_log_impl(&dword_21DFE3000, v50, OS_LOG_TYPE_DEFAULT, "4b. [BLPurchaseDAAPServer] FetchItemsPolitely No update required, we have the latest revision for dsid:(%@): latest:%{public}@ -- local:%{public}@", buf, 0x20u);
      }
      uint64_t v56 = MEMORY[0x223C1EDC0](*(void *)(a1 + 64));
      char v42 = (void *)v56;
      if (v56) {
        (*(void (**)(uint64_t, uint64_t))(v56 + 16))(v56, 1);
      }
    }
    else
    {
      __int16 v28 = BLJaliscoLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = objc_msgSend_dsid(*(void **)(a1 + 32), v29, v30, v31);
        int v33 = *(unsigned __int8 *)(a1 + 82);
        *(_DWORD *)long long buf = 138412802;
        char v67 = v32;
        __int16 v68 = 1024;
        *(_DWORD *)id v69 = v33;
        *(_WORD *)&v69[4] = 2112;
        *(void *)&v69[6] = v12;
        _os_log_impl(&dword_21DFE3000, v28, OS_LOG_TYPE_DEFAULT, "4a. [BLPurchaseDAAPServer] dsid: %@ Need to fetch a new database politely:%{BOOL}d localServerRevision %@", buf, 0x1Cu);
      }
      uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      uint64_t v36 = *(void **)(a1 + 32);
      uint64_t v35 = *(void *)(a1 + 40);
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = sub_21E02AE08;
      v57[3] = &unk_26448C890;
      id v37 = *(id *)(a1 + 48);
      uint64_t v38 = *(void *)(a1 + 32);
      id v58 = v37;
      uint64_t v59 = v38;
      id v60 = v9;
      id v64 = *(id *)(a1 + 64);
      id v61 = v12;
      id v39 = *(id *)(a1 + 40);
      uint64_t v40 = *(void *)(a1 + 72);
      id v62 = v39;
      uint64_t v65 = v40;
      id v63 = *(id *)(a1 + 56);
      objc_msgSend__fetchDatabaseWithReason_localServerRevision_latestVersion_completionHandler_(v36, v41, v34, (uint64_t)v61, v35, v57);

      char v42 = v58;
    }
  }
  else
  {
    uint64_t v43 = BLJaliscoLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v47 = objc_msgSend_dsid(*(void **)(a1 + 32), v44, v45, v46);
      *(_DWORD *)long long buf = 138412290;
      char v67 = v47;
      _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_ERROR, "[BLPurchaseDAAPServer] FetchItemsPolitely Error polling latest version for dsid:%@.", buf, 0xCu);
    }
    uint64_t v48 = MEMORY[0x223C1EDC0](*(void *)(a1 + 64));
    id v9 = (void *)v48;
    if (v48) {
      (*(void (**)(uint64_t, void))(v48 + 16))(v48, 0);
    }
  }
}

void sub_21E02AD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02AE08(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E02AF34;
  v11[3] = &unk_26448C868;
  char v20 = a2;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 48);
  void v11[4] = *(void *)(a1 + 40);
  id v12 = v5;
  id v13 = v7;
  id v18 = *(id *)(a1 + 80);
  id v14 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 88);
  id v15 = v8;
  uint64_t v19 = v9;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 72);
  id v10 = v5;
  dispatch_async(v6, v11);
}

void sub_21E02AF34(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  BOOL v1 = *(unsigned char *)(a1 + 104) == 0;
  BOOL v2 = BLJaliscoLog();
  BOOL v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v3, OS_LOG_TYPE_ERROR, "[BLPurchaseDAAPServer] FetchItemsPolitely DAAP Database failed", buf, 2u);
    }

    uint64_t v73 = MEMORY[0x223C1EDC0](*(void *)(a1 + 88));
    uint64_t v78 = (void *)v73;
    if (v73) {
      (*(void (**)(uint64_t, void))(v73 + 16))(v73, 0);
    }
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_msgSend_dsid(*(void **)(a1 + 32), v4, v5, v6);
      id v8 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412546;
      id v97 = v7;
      __int16 v98 = 2112;
      id v99 = v8;
      _os_log_impl(&dword_21DFE3000, v3, OS_LOG_TYPE_DEFAULT, "5. [BLPurchaseDAAPServer] dsid: %@ Got database %@", buf, 0x16u);
    }
    id v12 = objc_msgSend_sharedSource(BLJaliscoServerSource, v9, v10, v11);
    id v16 = objc_msgSend_dsid(*(void **)(a1 + 32), v13, v14, v15);
    uint64_t v95 = v16;
    id v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v17, (uint64_t)&v95, 1);
    uint64_t v78 = objc_msgSend_itemsFetchRequestForDSIDs_(v12, v19, (uint64_t)v18, v20);

    uint64_t v80 = objc_msgSend_set(MEMORY[0x263EFF9C0], v21, v22, v23);
    v94[0] = @"purchasedTokenCode";
    v94[1] = @"cloudID";
    uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v24, (uint64_t)v94, 2);
    objc_msgSend_setPropertiesToFetch_(v78, v26, (uint64_t)v25, v27);

    __int16 v28 = *(void **)(a1 + 48);
    id v92 = 0;
    uint64_t v30 = objc_msgSend_executeFetchRequest_error_(v28, v29, (uint64_t)v78, (uint64_t)&v92);
    uint64_t v76 = v30;
    id v77 = v92;
    if (v30)
    {
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v31 = v30;
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v88, (uint64_t)v93, 16);
      if (v36)
      {
        uint64_t v37 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v89 != v37) {
              objc_enumerationMutation(v31);
            }
            id v39 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            uint64_t v40 = objc_msgSend_cloudID(v39, v33, v34, v35);
            BOOL v41 = v40 == 0;

            if (!v41)
            {
              id v42 = objc_alloc(MEMORY[0x263EFF9A0]);
              uint64_t v45 = objc_msgSend_initWithCapacity_(v42, v43, 2, v44);
              uint64_t v49 = objc_msgSend_purchasedTokenCode(v39, v46, v47, v48);
              BOOL v50 = v49 == 0;

              if (!v50)
              {
                uint64_t v54 = objc_msgSend_purchasedTokenCode(v39, v51, v52, v53);
                objc_msgSend_setObject_forKey_(v45, v55, (uint64_t)v54, @"tokenCode");
              }
              uint64_t v56 = objc_msgSend_cloudID(v39, v51, v52, v53);
              objc_msgSend_setObject_forKey_(v45, v57, (uint64_t)v56, @"clientID");

              objc_msgSend_addObject_(v80, v58, (uint64_t)v45, v59);
            }
          }
          uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v33, (uint64_t)&v88, (uint64_t)v93, 16);
        }
        while (v36);
      }

      id v60 = BLJaliscoLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        id v64 = objc_msgSend_dsid(*(void **)(a1 + 32), v61, v62, v63);
        *(_DWORD *)long long buf = 138412546;
        id v97 = v64;
        __int16 v98 = 2112;
        id v99 = v80;
        _os_log_impl(&dword_21DFE3000, v60, OS_LOG_TYPE_DEFAULT, "6. [BLPurchaseDAAPServer] dsid: %@ Fetching items _fetchItemsWithLocalVersion with pairs:%@", buf, 0x16u);
      }
      uint64_t v65 = *(void **)(a1 + 32);
      uint64_t v66 = *(void *)(a1 + 56);
      uint64_t v67 = *(void *)(a1 + 64);
      uint64_t v68 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = sub_21E02B5E0;
      v81[3] = &unk_26448C840;
      id v69 = *(id *)(a1 + 72);
      uint64_t v70 = *(void *)(a1 + 32);
      id v82 = v69;
      uint64_t v83 = v70;
      id v84 = *(id *)(a1 + 64);
      id v85 = *(id *)(a1 + 40);
      id v87 = *(id *)(a1 + 88);
      id v86 = *(id *)(a1 + 80);
      objc_msgSend__fetchItemsWithLocalVersion_serverVersion_reason_tokenPairs_completionHandler_(v65, v71, v66, v67, v68, v80, v81);

      uint64_t v72 = v82;
    }
    else
    {
      __int16 v74 = BLJaliscoLog();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v97 = v77;
        _os_log_impl(&dword_21DFE3000, v74, OS_LOG_TYPE_ERROR, "Couldn't find existing items.  %@", buf, 0xCu);
      }

      uint64_t v75 = MEMORY[0x223C1EDC0](*(void *)(a1 + 88));
      uint64_t v72 = (void *)v75;
      if (v75) {
        (*(void (**)(uint64_t, void))(v75 + 16))(v75, 0);
      }
    }
  }
}

void sub_21E02B4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E02B5E0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E02B6DC;
  block[3] = &unk_26448C818;
  char v15 = a2;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v10 = v7;
  id v11 = *(id *)(a1 + 56);
  id v12 = v5;
  id v14 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 64);
  id v8 = v5;
  dispatch_async(v6, block);
}

void sub_21E02B6DC(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 80))
  {
    BOOL v2 = BLJaliscoLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = objc_msgSend_dsid(*(void **)(a1 + 32), v3, v4, v5);
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138413058;
      id v75 = v6;
      __int16 v76 = 2112;
      id v77 = v7;
      __int16 v78 = 2112;
      uint64_t v79 = v8;
      __int16 v80 = 2112;
      uint64_t v81 = v9;
      _os_log_impl(&dword_21DFE3000, v2, OS_LOG_TYPE_DEFAULT, "7. [BLPurchaseDAAPServer] dsid: %@ Fetch items succesful. Saving latestVersion:%@ database:%@ items:%@", buf, 0x2Au);
    }
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v73 = 0;
    char updated = objc_msgSend__updatePersistentServerRevision_database_items_error_(v10, v14, v11, v12, v13, &v73);
    id v16 = v73;
    if ((updated & 1) == 0)
    {
      id v60 = BLJaliscoLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v75 = v16;
        _os_log_impl(&dword_21DFE3000, v60, OS_LOG_TYPE_ERROR, "Error updating database. %@", buf, 0xCu);
      }

      objc_msgSend_logRecursively(v16, v61, v62, v63);
      uint64_t v64 = MEMORY[0x223C1EDC0](*(void *)(a1 + 72));
      uint64_t v65 = (void *)v64;
      if (v64) {
        (*(void (**)(uint64_t, void))(v64 + 16))(v64, 0);
      }
      goto LABEL_28;
    }
    id v17 = BLJaliscoLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_msgSend_dsid(*(void **)(a1 + 32), v18, v19, v20);
      *(_DWORD *)long long buf = 138412546;
      id v75 = v21;
      __int16 v76 = 2112;
      id v77 = v16;
      _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_DEFAULT, "7. [BLPurchaseDAAPServer] dsid: %@ CoreData Save items sucess! %@", buf, 0x16u);
    }
    uint64_t v25 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v22, v23, v24);
    __int16 v28 = objc_msgSend_objectForKey_((void *)v25, v26, @"kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary", v27);
    uint64_t v32 = objc_msgSend_mutableCopy(v28, v29, v30, v31);

    uint64_t v36 = objc_msgSend_stringValue(*(void **)(a1 + 64), v33, v34, v35);
    LOBYTE(v25) = v36 == 0;

    if ((v25 & 1) == 0)
    {
      uint64_t v40 = objc_msgSend_date(MEMORY[0x263EFF910], v37, v38, v39);
      uint64_t v44 = objc_msgSend_stringValue(*(void **)(a1 + 64), v41, v42, v43);
      objc_msgSend_setObject_forKey_(v32, v45, (uint64_t)v40, (uint64_t)v44);
    }
    uint64_t v46 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v37, v38, v39);
    objc_msgSend_setObject_forKey_((void *)v46, v47, (uint64_t)v32, @"kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary");

    uint64_t v51 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v48, v49, v50);
    LOBYTE(v46) = objc_msgSend_synchronize(v51, v52, v53, v54);

    if (v46)
    {
      uint64_t v55 = BLJaliscoLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v75 = v32;
        uint64_t v56 = "8. FetchItemsPolitely: Updated kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary user default to %@";
        uint64_t v57 = v55;
        os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
        uint32_t v59 = 12;
LABEL_23:
        _os_log_impl(&dword_21DFE3000, v57, v58, v56, buf, v59);
      }
    }
    else
    {
      uint64_t v55 = BLJaliscoLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        uint64_t v56 = "Error writing kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary to preferences.";
        uint64_t v57 = v55;
        os_log_type_t v58 = OS_LOG_TYPE_ERROR;
        uint32_t v59 = 2;
        goto LABEL_23;
      }
    }

    uint64_t v66 = BLJaliscoLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v70 = objc_msgSend_dsid(*(void **)(a1 + 32), v67, v68, v69);
      *(_DWORD *)long long buf = 138412290;
      id v75 = v70;
      _os_log_impl(&dword_21DFE3000, v66, OS_LOG_TYPE_DEFAULT, "FetchItemsPolitely %@ completed!", buf, 0xCu);
    }
    uint64_t v71 = MEMORY[0x223C1EDC0](*(void *)(a1 + 72));
    uint64_t v65 = (void *)v71;
    if (v71) {
      (*(void (**)(uint64_t, uint64_t))(v71 + 16))(v71, 1);
    }
LABEL_28:

    return;
  }
  uint64_t v72 = (void (**)(id, void))MEMORY[0x223C1EDC0](*(void *)(a1 + 72));
  if (v72) {
    v72[2](v72, 0);
  }
}

void sub_21E02BB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_21E02BE0C(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_21E02BF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)BLPurchaseDAAPServer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21E02BF44(void *a1)
{
}

void sub_21E02C014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E02C110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02C304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_21E02C4E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E02C4F4(uint64_t a1)
{
}

void sub_21E02C4FC(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_msgSend_objectForKey_(*(void **)(a1 + 32), v2, @"dmap.serverrevision", v4);
    if (v5) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
    }
  }
  uint64_t v6 = objc_msgSend_sharedSource(BLJaliscoServerSource, v2, v3, v4);
  id v10 = objc_msgSend_newManagedObjectContext(v6, v7, v8, v9);

  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v33 = 0;
  id v14 = objc_msgSend__updatePersistentServerRevision_moc_error_(v11, v13, v12, (uint64_t)v10, &v33);
  id v15 = v33;
  id v17 = v15;
  if (v14)
  {
    id v18 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    id v32 = v17;
    uint64_t v20 = objc_msgSend__updatePersistentDatabase_server_moc_error_(v18, v16, v19, (uint64_t)v14, v10, &v32);
    id v21 = v32;

    if (v20)
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v23 = *(void **)(a1 + 40);
      id v31 = v21;
      uint64_t v25 = objc_msgSend__updatePersistentItems_moc_database_error_(v23, v22, v24, (uint64_t)v10, v20, &v31);
      id v26 = v31;

      uint64_t v27 = BLJaliscoLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v35 = v25;
        _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_DEFAULT, "_updatePersistentServerRevision updating local db with items %@", buf, 0xCu);
      }

      if (v25)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend__saveInMoc_error_(*(void **)(a1 + 40), v28, (uint64_t)v10, *(void *)(a1 + 72));
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          uint64_t v29 = BLJaliscoLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = **(void ***)(a1 + 72);
            *(_DWORD *)long long buf = 138412290;
            uint64_t v35 = v30;
            _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_ERROR, "_updatePersistentServerRevision failed %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (*(void *)(a1 + 72)) {
          **(void **)(a1 + 72) = v26;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }

      id v21 = v26;
    }
    else
    {
      if (*(void *)(a1 + 72)) {
        **(void **)(a1 + 72) = v21;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }

    id v17 = v21;
  }
  else
  {
    if (*(void *)(a1 + 72)) {
      **(void **)(a1 + 72) = v15;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void sub_21E02C7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02C9A0(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_21E02CBB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02DBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_21E02E0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02E26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02E31C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void ***)(a1 + 32);
  if (!v5[6]) {
    goto LABEL_4;
  }
  if (objc_msgSend_hasBackedOff(v5[6], a2, a3, a4))
  {
    uint64_t v5 = *(void ***)(a1 + 32);
LABEL_4:
    if (objc_msgSend__isGDPRPrivacyAcknowledgementRequired(v5, a2, a3, a4))
    {
      objc_msgSend_delegate(*(void **)(a1 + 32), v6, v7, v8);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25) {
        objc_msgSend_purchaseServerRequestGDPRPrivacyAcknowledgementRequired(v25, v9, v10, v11);
      }
      uint64_t v12 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
      uint64_t v13 = (void *)v12;
      if (v12) {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
      }
    }
    else
    {
      id v25 = (id)MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
      if (v25)
      {
        uint64_t DAAPRequest = objc_msgSend__canMakeDAAPRequest(*(void **)(a1 + 32), v14, v15, v16);
        (*((void (**)(id, uint64_t))v25 + 2))(v25, DAAPRequest);
      }
    }

    return;
  }
  id v18 = BLJaliscoLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = objc_msgSend_backoffUntil(*(void **)(*(void *)(a1 + 32) + 48), v19, v20, v21);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v27 = v22;
    _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_INFO, "Ignoring request due to backoff being in effect. Will resume %@", buf, 0xCu);
  }
  uint64_t v23 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  uint64_t v24 = (void *)v23;
  if (v23) {
    (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
  }
}

void sub_21E02E4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E02E608(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_response(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_domain(*(void **)(a1 + 40), v6, v7, v8);
  if (objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x263F08570], v11)) {
    BOOL v15 = objc_msgSend_code(*(void **)(a1 + 40), v12, v13, v14) == -1001;
  }
  else {
    BOOL v15 = 0;
  }

  BOOL v22 = objc_msgSend_responseStatusCode(*(void **)(a1 + 32), v16, v17, v18) >= 500
     && objc_msgSend_responseStatusCode(*(void **)(a1 + 32), v19, v20, v21) < 600;
  if (objc_msgSend_responseStatusCode(*(void **)(a1 + 32), v19, v20, v21) == 403)
  {
    id v26 = objc_msgSend_allHeaderFields(v5, v23, v24, v25);
    uint64_t v29 = objc_msgSend_objectForKey_(v26, v27, @"retry-after", v28);
    BOOL v30 = v29 != 0;
  }
  else
  {
    BOOL v30 = 0;
  }
  if (objc_msgSend_statusCode(v5, v23, v24, v25) == 403)
  {
    uint64_t v34 = objc_msgSend_allHeaderFields(v5, v31, v32, v33);
    uint64_t v37 = objc_msgSend_objectForKey_(v34, v35, @"cloud-daap-client-expired", v36);
    BOOL v38 = v37 != 0;
  }
  else
  {
    BOOL v38 = 0;
  }
  if (objc_msgSend_statusCode(v5, v31, v32, v33) == 401) {
    int isAMSStatusCode401 = 1;
  }
  else {
    int isAMSStatusCode401 = objc_msgSend_bl_isAMSStatusCode401(*(void **)(a1 + 40), v39, v40, v41);
  }
  objc_msgSend_domain(*(void **)(a1 + 40), v39, v40, v41);
  uint64_t v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  BOOL v47 = v46 == @"BLErrorDomain" && objc_msgSend_code(*(void **)(a1 + 40), v43, v44, v45) == 3;

  if (*(void *)(a1 + 40))
  {
    uint64_t v51 = BLJaliscoLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = &stru_26CED4330;
      uint64_t v53 = *(void *)(a1 + 40);
      if (v47) {
        uint64_t v52 = @"invalid request";
      }
      *(_DWORD *)long long buf = 138412546;
      v139 = v52;
      __int16 v140 = 2112;
      uint64_t v141 = v53;
      _os_log_impl(&dword_21DFE3000, v51, OS_LOG_TYPE_ERROR, "failed with error: %@ %@", buf, 0x16u);
    }
  }
  if (v15 || v22 || v47)
  {
    objc_msgSend_failureIntervals_(*(void **)(*(void *)(a1 + 48) + 48), v48, 1, v50);
    int hasBackedOff = objc_msgSend_hasBackedOff(*(void **)(*(void *)(a1 + 48) + 48), v54, v55, v56);
    uint64_t v58 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
    uint32_t v59 = (void *)v58;
    if (hasBackedOff)
    {
      if (v58) {
        (*(void (**)(uint64_t, void))(v58 + 16))(v58, 0);
      }
      goto LABEL_71;
    }
    if (!v58) {
      goto LABEL_71;
    }
LABEL_31:
    (*(void (**)(uint64_t, uint64_t))(v58 + 16))(v58, 1);
    goto LABEL_71;
  }
  if (v38)
  {
    objc_msgSend_handleClientExpired(*(void **)(a1 + 48), v48, v49, v50);
    uint64_t v58 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
    uint32_t v59 = (void *)v58;
    if (!v58) {
      goto LABEL_71;
    }
    goto LABEL_31;
  }
  if (v30)
  {
    id v60 = objc_msgSend_allHeaderFields(v5, v48, v49, v50);
    uint32_t v59 = objc_msgSend_objectForKey_(v60, v61, @"retry-after", v62);

    if (v59)
    {
      objc_msgSend_doubleValue(v59, v63, v64, v65);
      if (v66 > 0.0)
      {
        id v67 = objc_alloc(MEMORY[0x263EFF910]);
        objc_msgSend_doubleValue(v59, v68, v69, v70);
        uint64_t v74 = objc_msgSend_initWithTimeIntervalSinceNow_(v67, v71, v72, v73);
        uint64_t v75 = *(void *)(a1 + 48);
        __int16 v76 = *(void **)(v75 + 16);
        *(void *)(v75 + 16) = v74;
      }
    }
    id v77 = BLJaliscoLog();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      __int16 v78 = *(__CFString **)(*(void *)(a1 + 48) + 16);
      *(_DWORD *)long long buf = 138412290;
      v139 = v78;
      _os_log_impl(&dword_21DFE3000, v77, OS_LOG_TYPE_INFO, "Server requested backoff. Trying again at %@", buf, 0xCu);
    }

    uint64_t v79 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
    __int16 v80 = (void *)v79;
    if (!v79) {
      goto LABEL_70;
    }
LABEL_39:
    (*(void (**)(uint64_t, uint64_t))(v79 + 16))(v79, 1);
LABEL_70:

    goto LABEL_71;
  }
  uint64_t v81 = *(void **)(*(void *)(a1 + 48) + 48);
  if (isAMSStatusCode401)
  {
    objc_msgSend_clear(v81, v48, v49, v50);
    uint32_t v59 = objc_msgSend_delegate(*(void **)(a1 + 48), v82, v83, v84);
    if (!objc_msgSend_isPrimaryAccount(*(void **)(a1 + 48), v85, v86, v87))
    {
      uint64_t v79 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
      __int16 v80 = (void *)v79;
      if (!v79) {
        goto LABEL_70;
      }
      goto LABEL_39;
    }
    long long v88 = BLJaliscoLog();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_dsid(*(void **)(a1 + 48), v89, v90, v91);
      id v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      v139 = v92;
      _os_log_impl(&dword_21DFE3000, v88, OS_LOG_TYPE_DEFAULT, "Requestenting silent auth for %@", buf, 0xCu);
    }
    id v96 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], v93, v94, v95);
    uint64_t v100 = objc_msgSend_activeStoreAccount(v96, v97, v98, v99);
    __int16 v80 = objc_msgSend_username(v100, v101, v102, v103);

    long long v107 = objc_msgSend__newDefaultAuthenticateOptions(*(void **)(a1 + 48), v104, v105, v106);
    id v108 = objc_alloc(MEMORY[0x263F27B08]);
    uint64_t v112 = objc_msgSend_dsid(*(void **)(a1 + 48), v109, v110, v111);
    long long v114 = objc_msgSend_initWithDSID_altDSID_username_options_(v108, v113, (uint64_t)v112, 0, v80, v107);

    id v115 = objc_alloc(MEMORY[0x263F27B18]);
    long long v118 = objc_msgSend_initWithRequest_(v115, v116, (uint64_t)v114, v117);
    v122 = objc_msgSend_performAuthentication(v118, v119, v120, v121);
    id v137 = 0;
    __int16 v125 = objc_msgSend_resultWithTimeout_error_(v122, v123, (uint64_t)&v137, v124, 90.0);
    id v126 = v137;

    v127 = BLJaliscoLog();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
    {
      if (v125) {
        BOOL v128 = v126 == 0;
      }
      else {
        BOOL v128 = 0;
      }
      int v129 = v128;
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v139) = v129;
      _os_log_impl(&dword_21DFE3000, v127, OS_LOG_TYPE_DEFAULT, "Silent auth returned: %{BOOL}d", buf, 8u);
    }

    if (!v125 || v126)
    {
      if (!v59)
      {
        v136 = BLJaliscoLog();
        if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_21DFE3000, v136, OS_LOG_TYPE_ERROR, "No fallback for authentication", buf, 2u);
        }

        uint64_t v133 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
        uint64_t v134 = (void *)v133;
        if (!v133) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
      objc_msgSend_purchaseServerRequestITunesAuthentication(v59, v130, v131, v132);
      uint64_t v133 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
      uint64_t v134 = (void *)v133;
      if (v133) {
LABEL_68:
      }
        (*(void (**)(uint64_t, uint64_t))(v133 + 16))(v133, 1);
    }
    else
    {
      uint64_t v133 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
      uint64_t v134 = (void *)v133;
      if (v133) {
        goto LABEL_68;
      }
    }
LABEL_69:

    goto LABEL_70;
  }
  objc_msgSend_clear(v81, v48, v49, v50);
  uint64_t v135 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
  uint32_t v59 = (void *)v135;
  if (v135) {
    (*(void (**)(uint64_t, uint64_t))(v135 + 16))(v135, 2);
  }
LABEL_71:
}

void sub_21E02ED04(_Unwind_Exception *a1)
{
  uint64_t v10 = v3;

  _Unwind_Resume(a1);
}

void sub_21E02EED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02F0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02F17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E02F29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02F3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21E02F3D8(uint64_t a1, char a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = [BLDAAPServerInfoRequest alloc];
    uint64_t v7 = objc_msgSend_dsid(*(void **)(a1 + 40), v4, v5, v6);
    uint64_t v9 = objc_msgSend_initWithDSID_reason_(v3, v8, (uint64_t)v7, *(void *)(a1 + 56));

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = sub_21E02F5B0;
    v18[3] = &unk_26448CA48;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(a1 + 48);
    id v19 = v10;
    uint64_t v20 = v11;
    uint64_t v22 = *(void *)(a1 + 56);
    id v21 = v12;
    objc_msgSend_executeWithCompletionHandler_(v9, v13, (uint64_t)v18, v14);
  }
  else
  {
    BOOL v15 = BLJaliscoLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v16;
      _os_log_impl(&dword_21DFE3000, v15, OS_LOG_TYPE_DEBUG, "%@ will not make request", buf, 0xCu);
    }

    uint64_t v17 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
    uint64_t v9 = (void *)v17;
    if (v17) {
      (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
    }
  }
}

void sub_21E02F570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02F5B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = BLJaliscoLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = objc_msgSend_dsid(*(void **)(a1 + 40), v8, v9, v10);
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v29 = v11;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2048;
    uint64_t v33 = v13;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "%@ dsid:%@ reason:%ld", buf, 0x20u);
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_21E02F7B0;
  v21[3] = &unk_26448CA20;
  uint64_t v14 = *(void **)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(void **)(a1 + 48);
  id v22 = v15;
  uint64_t v23 = v16;
  uint64_t v27 = *(void *)(a1 + 56);
  id v26 = v17;
  id v18 = v6;
  id v24 = v18;
  id v19 = v5;
  id v25 = v19;
  objc_msgSend__preProcessResponse_error_responseBlock_(v14, v20, (uint64_t)v19, (uint64_t)v18, v21);
}

void sub_21E02F760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02F7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 2:
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = objc_msgSend_data(*(void **)(a1 + 56), (const char *)2, a3, a4);
      uint64_t v12 = objc_msgSend__processResponse_(v8, v10, (uint64_t)v9, v11);

      BOOL v13 = v12 != 0;
      if (v12)
      {
LABEL_14:

        goto LABEL_16;
      }
      uint64_t v14 = BLJaliscoLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = *(__CFString **)(a1 + 32);
        int v27 = 138412290;
        uint64_t v28 = v15;
        _os_log_impl(&dword_21DFE3000, v14, OS_LOG_TYPE_ERROR, "%@ Error no response data", (uint8_t *)&v27, 0xCu);
      }

LABEL_13:
      BOOL v13 = 0;
      goto LABEL_14;
    case 1:
      uint64_t v12 = BLJaliscoLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(__CFString **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 48);
        int v27 = 138412546;
        uint64_t v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v17;
        _os_log_impl(&dword_21DFE3000, v12, OS_LOG_TYPE_ERROR, "%@ Error getting response:  %@", (uint8_t *)&v27, 0x16u);
      }
      goto LABEL_13;
    case 0:
      id v5 = BLJaliscoLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = *(__CFString **)(a1 + 32);
        int v27 = 138412290;
        uint64_t v28 = v6;
        _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "%@ retry", (uint8_t *)&v27, 0xCu);
      }

      objc_msgSend__configureWithReason_completion_(*(void **)(a1 + 40), v7, *(void *)(a1 + 72), *(void *)(a1 + 64));
      return;
  }
  BOOL v13 = 0;
LABEL_16:
  id v18 = BLJaliscoLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = objc_msgSend_dsid(*(void **)(a1 + 40), v19, v20, v21);
    uint64_t v23 = (void *)v22;
    id v24 = @"with error";
    if (v13) {
      id v24 = @"successfully";
    }
    int v27 = 138543618;
    uint64_t v28 = v24;
    __int16 v29 = 2112;
    uint64_t v30 = v22;
    _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_INFO, "PurchaseDAAPServer Server Info request completed %{public}@ for (%@)", (uint8_t *)&v27, 0x16u);
  }
  uint64_t v25 = MEMORY[0x223C1EDC0](*(void *)(a1 + 64));
  id v26 = (void *)v25;
  if (v25) {
    (*(void (**)(uint64_t, BOOL))(v25 + 16))(v25, v13);
  }
}

void sub_21E02FA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02FB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E02FBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21E02FC14(uint64_t a1, char a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_21E02FD64;
    v10[3] = &unk_26448C688;
    int8x16_t v9 = *(int8x16_t *)(a1 + 32);
    id v3 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    id v12 = *(id *)(a1 + 48);
    objc_msgSend_executeWithCompletionHandler_(v3, v4, (uint64_t)v10, v5);
  }
  else
  {
    id v6 = BLJaliscoLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_DEBUG, "Configure(login) will not make request", buf, 2u);
    }

    uint64_t v7 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
    uint64_t v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

void sub_21E02FD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E02FD64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = sub_21E02FE8C;
  v14[3] = &unk_26448C660;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = *(id *)(a1 + 48);
  id v18 = v5;
  id v19 = v10;
  id v17 = v6;
  id v11 = v5;
  id v12 = v6;
  objc_msgSend__preProcessResponse_error_responseBlock_(v7, v13, (uint64_t)v11, (uint64_t)v12, v14);
}

void sub_21E02FE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_21E02FE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 2:
      id v15 = objc_msgSend_data(*(void **)(a1 + 56), (const char *)2, a3, a4);
      id v18 = objc_msgSend_decodeData_(BLPurchaseDAAPParser, v16, (uint64_t)v15, v17);

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        objc_msgSend__setSessionID_(*(void **)(a1 + 40), v19, (uint64_t)v18, v20);
      }
      else
      {
        int v27 = BLJaliscoLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = *(void *)(a1 + 48);
          int v38 = 138412546;
          uint64_t v39 = v18;
          __int16 v40 = 2112;
          uint64_t v41 = v28;
          _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_ERROR, "Configure(login) parsed data unrecognized %@ %@", (uint8_t *)&v38, 0x16u);
        }
      }
      goto LABEL_16;
    case 1:
      id v18 = BLJaliscoLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = objc_msgSend_dsid(*(void **)(a1 + 40), v22, v23, v24);
        uint64_t v26 = *(void *)(a1 + 48);
        int v38 = 138412546;
        uint64_t v39 = v25;
        __int16 v40 = 2112;
        uint64_t v41 = v26;
        _os_log_impl(&dword_21DFE3000, v18, OS_LOG_TYPE_ERROR, "Configure(login) dsid: %@, Error getting response %@", (uint8_t *)&v38, 0x16u);
      }
      char isKindOfClass = 0;
LABEL_16:

      goto LABEL_17;
    case 0:
      id v5 = BLJaliscoLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = objc_msgSend_DSID(*(void **)(a1 + 32), v6, v7, v8);
        uint64_t v13 = objc_msgSend_reason(*(void **)(a1 + 32), v10, v11, v12);
        int v38 = 138412546;
        uint64_t v39 = v9;
        __int16 v40 = 2048;
        uint64_t v41 = v13;
        _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "Configure(login) dsid: %@, Reason: %ld RETRY", (uint8_t *)&v38, 0x16u);
      }
      objc_msgSend__loginWithRequest_completion_(*(void **)(a1 + 40), v14, *(void *)(a1 + 32), *(void *)(a1 + 64));
      return;
  }
  char isKindOfClass = 0;
LABEL_17:
  __int16 v29 = BLJaliscoLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = objc_msgSend_dsid(*(void **)(a1 + 40), v30, v31, v32);
    uint64_t v34 = (void *)v33;
    uint64_t v35 = @"with error";
    if (isKindOfClass) {
      uint64_t v35 = @"successfully";
    }
    int v38 = 138543618;
    uint64_t v39 = v35;
    __int16 v40 = 2112;
    uint64_t v41 = v33;
    _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_INFO, "PurchaseDAAPServer login request completed %{public}@ for (%@)", (uint8_t *)&v38, 0x16u);
  }
  uint64_t v36 = MEMORY[0x223C1EDC0](*(void *)(a1 + 64));
  uint64_t v37 = (void *)v36;
  if (v36) {
    (*(void (**)(uint64_t, void))(v36 + 16))(v36, isKindOfClass & 1);
  }
}

void sub_21E030178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E030268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21E030280(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v5 = objc_msgSend_sessionID(*(void **)(a1 + 32), a2, a3, a4);

    if (v5)
    {
      uint64_t v9 = objc_msgSend_sharedSource(BLJaliscoServerSource, v6, v7, v8);
      uint64_t v13 = objc_msgSend_newManagedObjectContext(v9, v10, v11, v12);

      uint64_t v17 = objc_msgSend_sharedSource(BLJaliscoServerSource, v14, v15, v16);
      uint64_t v21 = objc_msgSend_dsid(*(void **)(a1 + 32), v18, v19, v20);
      id v53 = 0;
      uint64_t v23 = objc_msgSend_serverInfoForDSID_fromManagedObjectContext_error_(v17, v22, (uint64_t)v21, (uint64_t)v13, &v53);
      id v24 = v53;

      uint64_t v28 = objc_msgSend_databaseVersion(v23, v25, v26, v27);
      if (v28) {
        __int16 v29 = (__CFString *)v28;
      }
      else {
        __int16 v29 = &stru_26CED4330;
      }
      uint64_t v30 = [BLDAAPUpdateRequest alloc];
      uint64_t v34 = objc_msgSend_dsid(*(void **)(a1 + 32), v31, v32, v33);
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v39 = objc_msgSend_sessionID(*(void **)(a1 + 32), v36, v37, v38);
      uint64_t v41 = objc_msgSend_initWithDSID_reason_sessionID_localVersion_(v30, v40, (uint64_t)v34, v35, v39, v29);

      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = sub_21E03059C;
      v50[3] = &unk_26448CAE8;
      uint64_t v43 = *(void **)(a1 + 40);
      uint64_t v42 = *(void *)(a1 + 48);
      v50[4] = *(void *)(a1 + 32);
      uint64_t v52 = v42;
      id v51 = v43;
      objc_msgSend_executeWithCompletionHandler_(v41, v44, (uint64_t)v50, v45);

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v46 = BLJaliscoLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v46, OS_LOG_TYPE_DEBUG, "Poll update will not make request", buf, 2u);
    }
  }
  BOOL v47 = objc_msgSend_sessionID(*(void **)(a1 + 32), v6, v7, v8);

  if (!v47)
  {
    uint64_t v48 = BLJaliscoLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21DFE3000, v48, OS_LOG_TYPE_DEBUG, "Poll update: No Session ID to fetch session with.", buf, 2u);
    }
  }
  uint64_t v49 = MEMORY[0x223C1EDC0](*(void *)(a1 + 40));
  uint64_t v13 = (void *)v49;
  if (v49) {
    (*(void (**)(uint64_t, void, void))(v49 + 16))(v49, 0, 0);
  }
LABEL_16:
}

void sub_21E03051C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E03059C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E0306B0;
  v12[3] = &unk_26448CAC0;
  uint64_t v7 = a1[6];
  uint64_t v8 = (void *)a1[5];
  uint64_t v13 = (void *)a1[4];
  uint64_t v17 = v7;
  id v15 = v5;
  id v16 = v8;
  id v14 = v6;
  id v9 = v5;
  id v10 = v6;
  objc_msgSend__preProcessResponse_error_responseBlock_(v13, v11, (uint64_t)v9, (uint64_t)v10, v12);
}

void sub_21E030684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_21E0306B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      uint64_t v8 = BLJaliscoLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_dsid(*(void **)(a1 + 32), v9, v10, v11);
        uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = *(void **)(a1 + 40);
        int v36 = 138412546;
        uint64_t v37 = v12;
        __int16 v38 = 2112;
        uint64_t v39 = v13;
        _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Poll Update: Error getting response for %@ %@", (uint8_t *)&v36, 0x16u);
      }
    }
    else if (!a2)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 64);
      objc_msgSend__pollLatestRevisionWithReason_completion_(v5, 0, v6, v7);
      return;
    }
    goto LABEL_14;
  }
  id v14 = *(void **)(a1 + 32);
  id v15 = objc_msgSend_data(*(void **)(a1 + 48), (const char *)2, a3, a4);
  id v18 = objc_msgSend__processResponse_(v14, v16, (uint64_t)v15, v17);

  objc_msgSend_objectForKey_(v18, v19, @"dmap.serverrevision", v20);
  uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = BLJaliscoLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412290;
    uint64_t v37 = v21;
    _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_DEFAULT, "Poll Update success LATEST VERSION:%@", (uint8_t *)&v36, 0xCu);
  }

  if (!v21)
  {
LABEL_14:
    id v24 = BLJaliscoLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_dsid(*(void **)(a1 + 32), v25, v26, v27);
      uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v36 = 138412290;
      uint64_t v37 = v28;
      _os_log_impl(&dword_21DFE3000, v24, OS_LOG_TYPE_ERROR, "Poll Update: Failed for %@", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v21 = 0;
    uint64_t v23 = @"with error";
    goto LABEL_17;
  }
  uint64_t v23 = @"successfully";
LABEL_17:
  __int16 v29 = BLJaliscoLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    uint64_t v33 = objc_msgSend_dsid(*(void **)(a1 + 32), v30, v31, v32);
    int v36 = 138543618;
    uint64_t v37 = v23;
    __int16 v38 = 2112;
    uint64_t v39 = v33;
    _os_log_impl(&dword_21DFE3000, v29, OS_LOG_TYPE_INFO, "PurchaseDAAPServer Poll Update completed %{public}@ for (%@)", (uint8_t *)&v36, 0x16u);
  }
  uint64_t v34 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
  uint64_t v35 = (void *)v34;
  if (v34) {
    (*(void (**)(uint64_t, BOOL, __CFString *))(v34 + 16))(v34, v21 != 0, v21);
  }
}

void sub_21E0309A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E030BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E030DDC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21E030E28(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_21E030FD0;
    v10[3] = &unk_26448CB60;
    id v3 = *(void **)(a1 + 40);
    void v10[4] = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 56);
    objc_msgSend_executeWithCompletionHandler_(v3, v4, (uint64_t)v10, v5);
  }
  else
  {
    uint64_t v6 = BLJaliscoLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v7;
      _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_DEBUG, "%@ will not make request", buf, 0xCu);
    }

    uint64_t v8 = MEMORY[0x223C1EDC0](*(void *)(a1 + 56));
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
    }
  }
}

void sub_21E030F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E030FD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  void v14[2] = sub_21E031114;
  v14[3] = &unk_26448CB38;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v19 = v5;
  id v20 = v10;
  id v18 = v6;
  id v11 = v5;
  id v12 = v6;
  objc_msgSend__preProcessResponse_error_responseBlock_(v7, v13, (uint64_t)v11, (uint64_t)v12, v14);
}

void sub_21E0310D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_21E031114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 2:
      uint64_t v16 = *(void **)(a1 + 40);
      id v17 = objc_msgSend_data(*(void **)(a1 + 64), (const char *)2, a3, a4);
      id v20 = objc_msgSend__processResponse_(v16, v18, (uint64_t)v17, v19);

      uint64_t v21 = BLJaliscoLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = objc_msgSend_dsid(*(void **)(a1 + 40), v22, v23, v24);
        uint64_t v29 = objc_msgSend_reason(*(void **)(a1 + 48), v26, v27, v28);
        int v45 = 138412802;
        uint64_t v46 = v25;
        __int16 v47 = 2048;
        uint64_t v48 = v29;
        __int16 v49 = 2112;
        uint64_t v50 = (uint64_t)v20;
        _os_log_impl(&dword_21DFE3000, v21, OS_LOG_TYPE_DEFAULT, "_fetchDatabaseWithRequest dsid: %@, Reason: %ld data:%@", (uint8_t *)&v45, 0x20u);
      }
      if (v20)
      {
        uint64_t v32 = objc_msgSend_objectForKey_(v20, v30, @"dmap.listing", v31);
        int v36 = objc_msgSend_lastObject(v32, v33, v34, v35);

LABEL_14:
        goto LABEL_16;
      }
LABEL_13:
      int v36 = 0;
      goto LABEL_14;
    case 1:
      id v20 = BLJaliscoLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v40 = *(void **)(a1 + 32);
        uint64_t v41 = objc_msgSend_dsid(*(void **)(a1 + 40), v37, v38, v39);
        uint64_t v42 = *(void *)(a1 + 56);
        int v45 = 138412802;
        uint64_t v46 = v40;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v41;
        __int16 v49 = 2112;
        uint64_t v50 = v42;
        _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_ERROR, "%@ dsid: %@, Error getting response:  %@", (uint8_t *)&v45, 0x20u);
      }
      goto LABEL_13;
    case 0:
      id v5 = BLJaliscoLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = *(void **)(a1 + 32);
        id v10 = objc_msgSend_dsid(*(void **)(a1 + 40), v6, v7, v8);
        uint64_t v14 = objc_msgSend_reason(*(void **)(a1 + 48), v11, v12, v13);
        int v45 = 138412802;
        uint64_t v46 = v9;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v10;
        __int16 v49 = 2048;
        uint64_t v50 = v14;
        _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "%@ dsid: %@, Reason: %ld RETRY", (uint8_t *)&v45, 0x20u);
      }
      objc_msgSend__fetchDatabaseWithRequest_completionHandler_(*(void **)(a1 + 40), v15, *(void *)(a1 + 48), *(void *)(a1 + 72));
      return;
  }
  int v36 = 0;
LABEL_16:
  uint64_t v43 = MEMORY[0x223C1EDC0](*(void *)(a1 + 72));
  uint64_t v44 = (void *)v43;
  if (v43) {
    (*(void (**)(uint64_t, BOOL, void *))(v43 + 16))(v43, v36 != 0, v36);
  }
}

void sub_21E0313B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E031640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E031750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E031898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21E0318C8(void **a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = objc_msgSend_date(MEMORY[0x263EFF910], v4, v5, v6);
  objc_msgSend_timeIntervalSince1970(v7, v8, v9, v10);
  double v12 = v11;

  objc_msgSend_writeUInt32_withCode_(v3, v13, v12, 1836282979);
  id v17 = objc_msgSend_daapMetaDataFilterString(a1[4], v14, v15, v16);
  objc_msgSend_writeString_withCode_(v3, v18, (uint64_t)v17, 1835365473);

  uint64_t v22 = objc_msgSend_daapQueryFilterString(a1[4], v19, v20, v21);
  objc_msgSend_writeString_withCode_(v3, v23, (uint64_t)v22, 1836152165);

  uint64_t v27 = objc_msgSend_sessionID(a1[4], v24, v25, v26);
  uint64_t v31 = objc_msgSend_unsignedIntValue(v27, v28, v29, v30);
  objc_msgSend_writeUInt32_withCode_(v3, v32, v31, 1835821412);

  uint64_t v36 = objc_msgSend_unsignedIntValue(a1[5], v33, v34, v35);
  objc_msgSend_writeUInt32_withCode_(v3, v37, v36, 1836413810);
  uint64_t v41 = objc_msgSend_unsignedIntValue(a1[6], v38, v39, v40);
  objc_msgSend_writeUInt32_withCode_(v3, v42, v41, 1835296114);
  objc_msgSend_writeUInt8_withCode_(v3, v43, 1, 1634355568);
  objc_msgSend_writeUInt8_withCode_(v3, v44, 1, 1835559268);
  if (objc_msgSend_count(a1[7], v45, v46, v47))
  {
    id v48 = a1[7];
    ICDAAPUtilitiesWriteContainer();
  }
}

void sub_21E031A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E031ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E031B7C;
  v8[3] = &unk_26448CBD8;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v6, (uint64_t)v8, v7);
}

void sub_21E031B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E031B7C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = objc_msgSend_objectForKey_(v2, v3, @"tokenCode", v4);
  uint64_t v8 = objc_msgSend_objectForKey_(v2, v6, @"clientID", v7);
  id v9 = NSNumber;
  uint64_t v13 = objc_msgSend_unsignedLongLongValue(v5, v10, v11, v12);
  uint64_t v16 = objc_msgSend_numberWithUnsignedLongLong_(v9, v14, v13, v15);
  id v17 = NSNumber;
  uint64_t v21 = objc_msgSend_unsignedLongLongValue(v8, v18, v19, v20);
  uint64_t v25 = objc_msgSend_numberWithUnsignedLongLong_(v17, v22, v21, v23);
  id v26 = v16;
  id v24 = v25;
  ICDAAPUtilitiesWriteContainer();
}

void sub_21E031CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21E031D1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  ICDAAPUtilitiesWriteProperty();
  ICDAAPUtilitiesWriteProperty();
}

void sub_21E031D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E032004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E032078(uint64_t a1, const char *a2)
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = objc_msgSend__dataForItemsRequestWithLocalVersion_serverVersion_tokenPairs_(*(void **)(a1 + 40), a2, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
    uint64_t v4 = [BLDAAPItemsRequest alloc];
    uint64_t v8 = objc_msgSend_dsid(*(void **)(a1 + 40), v5, v6, v7);
    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t v13 = objc_msgSend_bagDatabaseID(*(void **)(a1 + 40), v10, v11, v12);
    uint64_t v15 = objc_msgSend_initWithDSID_reason_databaseID_body_(v4, v14, (uint64_t)v8, v9, v13, v3);

    objc_initWeak(location, *(id *)(a1 + 40));
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = sub_21E03233C;
    v25[3] = &unk_26448CC78;
    objc_copyWeak(v32, location);
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    id v26 = v16;
    uint64_t v27 = v17;
    id v28 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void **)(a1 + 80);
    id v29 = v18;
    v32[1] = v19;
    id v30 = *(id *)(a1 + 64);
    id v31 = *(id *)(a1 + 72);
    objc_msgSend_executeWithCompletionHandler_(v15, v20, (uint64_t)v25, v21);

    objc_destroyWeak(v32);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v22 = BLJaliscoLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void **)(a1 + 32);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v23;
      _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_DEBUG, "%@ will not make request", (uint8_t *)location, 0xCu);
    }

    uint64_t v24 = MEMORY[0x223C1EDC0](*(void *)(a1 + 72));
    id v3 = (void *)v24;
    if (v24) {
      (*(void (**)(uint64_t, void, void))(v24 + 16))(v24, 0, 0);
    }
  }
}

void sub_21E0322C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E03233C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = sub_21E0324D4;
  v15[3] = &unk_26448CC50;
  id v16 = *(id *)(a1 + 32);
  id v17 = WeakRetained;
  uint64_t v8 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = v8;
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 88);
  id v20 = v9;
  uint64_t v25 = v10;
  id v21 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  id v23 = v5;
  id v24 = v11;
  id v22 = v6;
  id v12 = v5;
  id v13 = v6;
  objc_msgSend__preProcessResponse_error_responseBlock_(WeakRetained, v14, (uint64_t)v12, (uint64_t)v13, v15);
}

void sub_21E032484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_21E0324D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 2:
      id v12 = *(void **)(a1 + 40);
      id v13 = objc_msgSend_data(*(void **)(a1 + 88), (const char *)2, a3, a4);
      id v16 = objc_msgSend__processResponse_(v12, v14, (uint64_t)v13, v15);

      if (v16)
      {
        id v16 = v16;
        id v17 = BLJaliscoLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = objc_msgSend_dsid(*(void **)(a1 + 40), v18, v19, v20);
          int v31 = 138412546;
          uint64_t v32 = v21;
          __int16 v33 = 2112;
          uint64_t v34 = v16;
          _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_DEFAULT, "[BLPurchaseDAAPServer] _fetchItemsWithLocalVersion dsid:%@ items: %@ SUCCEEDED", (uint8_t *)&v31, 0x16u);
        }
      }
      id v22 = v16;
      goto LABEL_15;
    case 1:
      id v16 = BLJaliscoLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v26 = *(void **)(a1 + 32);
        uint64_t v27 = objc_msgSend_dsid(*(void **)(a1 + 40), v23, v24, v25);
        uint64_t v28 = *(void *)(a1 + 80);
        int v31 = 138412802;
        uint64_t v32 = v26;
        __int16 v33 = 2112;
        uint64_t v34 = v27;
        __int16 v35 = 2112;
        uint64_t v36 = v28;
        _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_ERROR, "%@ dsid: %@, Error getting response:  %@", (uint8_t *)&v31, 0x20u);
      }
      id v22 = 0;
LABEL_15:

      goto LABEL_17;
    case 0:
      id v5 = BLJaliscoLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v9 = *(void **)(a1 + 32);
        uint64_t v10 = objc_msgSend_dsid(*(void **)(a1 + 40), v6, v7, v8);
        int v31 = 138412546;
        uint64_t v32 = v9;
        __int16 v33 = 2112;
        uint64_t v34 = v10;
        _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "%@ dsid: %@, RETRY", (uint8_t *)&v31, 0x16u);
      }
      objc_msgSend__fetchItemsWithLocalVersion_serverVersion_reason_tokenPairs_completionHandler_(*(void **)(a1 + 48), v11, *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 104), *(void *)(a1 + 72), *(void *)(a1 + 96));
      return;
  }
  id v22 = 0;
LABEL_17:
  uint64_t v29 = MEMORY[0x223C1EDC0](*(void *)(a1 + 96));
  id v30 = (void *)v29;
  if (v29) {
    (*(void (**)(uint64_t, BOOL, NSObject *))(v29 + 16))(v29, v22 != 0, v22);
  }
}

void sub_21E032734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E032974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E032A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BLAudiobookStreamingEnabled()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v1 = *MEMORY[0x263F2BA30];
  id v5 = objc_msgSend_bu_booksGroupContainerURL(NSURL, v2, v3, v4);
  uint64_t v7 = objc_msgSend__initWithSuiteName_container_(v0, v6, v1, (uint64_t)v5);
  uint64_t v10 = objc_msgSend_BOOLForKey_(v7, v8, @"BKAudiobookStreamingDisabled", v9) ^ 1;

  return v10;
}

uint64_t BLPaymentSheetEnabled()
{
  return 0;
}

uint64_t BLPaymentSheetRequestDelegateEnabled()
{
  return 0;
}

uint64_t BLPaymentViewServiceEnabled()
{
  return 0;
}

uint64_t sub_21E032E68(uint64_t result, const char *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a3 + a4;
  if (a3 < a3 + a4)
  {
    unint64_t v5 = a3;
    uint64_t v7 = result;
    do
    {
      uint64_t result = objc_msgSend_consumeBytes_length_(*(void **)(v7 + 32), a2, (uint64_t)&a2[v5], v4 - v5);
      v5 += result;
    }
    while (v5 < v4);
  }
  return result;
}

void sub_21E0349F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = objc_msgSend_p_allItemsFetchRequestForDSIDs_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  id v6 = *(void **)(*(void *)(a1 + 32) + 24);
  id v14 = 0;
  uint64_t v8 = objc_msgSend_executeFetchRequest_error_(v6, v7, (uint64_t)v5, (uint64_t)&v14);
  id v9 = v14;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E034AD8;
  v12[3] = &unk_26448BF20;
  id v13 = *(id *)(a1 + 48);
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)v12, v11);
}

void sub_21E034AD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E034CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E034CC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E034CD0(uint64_t a1)
{
}

void sub_21E034CD8(uint64_t a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_p_allItemsFetchRequestForDSIDs_matchingSearchString_isExplicitRestricted_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v11 = 0;
  uint64_t v6 = objc_msgSend_executeFetchRequest_error_(v4, v5, (uint64_t)v3, (uint64_t)&v11);
  id v7 = v11;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E034DB0;
  v10[3] = &unk_26448CD00;
  void v10[4] = *(void *)(a1 + 56);
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v8, (uint64_t)v10, v9);
}

void sub_21E034DB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E034F1C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263EFF260];
  uint64_t v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  id v7 = objc_msgSend_fetchRequestWithEntityName_(v2, v5, (uint64_t)v4, v6);

  objc_msgSend_setPredicate_(v7, v8, *(void *)(a1 + 32), v9);
  objc_msgSend_setSortDescriptors_(v7, v10, *(void *)(a1 + 40), v11);
  id v12 = *(void **)(*(void *)(a1 + 48) + 24);
  id v20 = 0;
  id v14 = objc_msgSend_executeFetchRequest_error_(v12, v13, (uint64_t)v7, (uint64_t)&v20);
  id v15 = v20;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = sub_21E035038;
  v18[3] = &unk_26448BF20;
  id v19 = *(id *)(a1 + 56);
  objc_msgSend_enumerateObjectsUsingBlock_(v14, v16, (uint64_t)v18, v17);
}

void sub_21E035038(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E03519C(uint64_t a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_p_fetchRequestForStoreIDs_dsids_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v12 = 0;
  uint64_t v6 = objc_msgSend_executeFetchRequest_error_(v4, v5, (uint64_t)v3, (uint64_t)&v12);
  id v7 = v12;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E03527C;
  v10[3] = &unk_26448BF20;
  id v11 = *(id *)(a1 + 56);
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v8, (uint64_t)v10, v9);
}

void sub_21E03527C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E0353BC(uint64_t a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_p_fetchRequestForStoreIDs_dsids_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), MEMORY[0x263EFFA68]);
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v12 = 0;
  uint64_t v6 = objc_msgSend_executeFetchRequest_error_(v4, v5, (uint64_t)v3, (uint64_t)&v12);
  id v7 = v12;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E0354A4;
  v10[3] = &unk_26448BF20;
  id v11 = *(id *)(a1 + 48);
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v8, (uint64_t)v10, v9);
}

void sub_21E0354A4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E035618(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend__itemsFetchRequestForDSIDs_excludeStoreIDs_isExplicitRestricted_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  unint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  id v13 = 0;
  uint64_t v6 = objc_msgSend_executeFetchRequest_error_(v4, v5, (uint64_t)v3, (uint64_t)&v13);
  id v7 = v13;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_21E035788;
  v11[3] = &unk_26448BF20;
  id v12 = *(id *)(a1 + 56);
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v8, (uint64_t)v11, v9);

  if (v7)
  {
    uint64_t v10 = BLJaliscoLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_ERROR, "BLJaliscoReadOnlyDAAPClient fetchItemsForDSIDs:excludeStoreIDs:isExplicitRestricted %@ failed. Error: %@", buf, 0x16u);
    }
  }
}

void sub_21E035788(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    objc_msgSend_itemWithServerItem_(BLJaliscoItem, a2, (uint64_t)a2, a4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v4, v5, (uint64_t)v7, v6);
  }
}

void sub_21E035C98(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, void *a15)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    __int16 v16 = BLJaliscoLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend_name(v15, v17, v18, v19);
      uint64_t v24 = objc_msgSend_reason(v15, v21, v22, v23);
      uint64_t v28 = objc_msgSend_userInfo(v15, v25, v26, v27);
      LODWORD(buf) = 138543874;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2114;
      *(void *)((char *)&buf + 14) = v24;
      a14 = 2114;
      a15 = v28;
      _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_ERROR, "BLJaliscoReadOnlyDAAPClient: Unable to bring up jalisco core data stack. Exception: %{public}@ %{public}@ %{public}@", (uint8_t *)&buf, 0x20u);
    }
    objc_end_catch();
    JUMPOUT(0x21E035AECLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21E0369C0()
{
  qword_26AB40058 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

void sub_21E036D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E036D1C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = BLFamilyLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_ERROR, "Error looking up family info:  %@", buf, 0xCu);
    }
  }
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E036E8C;
  block[3] = &unk_26448CD78;
  id v11 = v5;
  id v9 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v12 = *(id *)(a1 + 40);
  dispatch_async(v8, block);

  objc_destroyWeak(&v13);
}

void sub_21E036E8C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_familyMembers(*(void **)(a1 + 32), a2, a3, a4);
  if ((objc_msgSend_isHeadOfHouseholdSharingPayment(*(void **)(a1 + 32), v6, v7, v8) & 1) == 0)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = objc_msgSend_familyMembers(*(void **)(a1 + 32), v9, v10, v11, 0);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v34, (uint64_t)v45, 16);
    if (v14)
    {
      uint64_t v18 = v14;
      uint64_t v19 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v12);
          }
          id v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_msgSend_isCurrentSignedInUser(v21, v15, v16, v17))
          {
            uint64_t v44 = v21;
            uint64_t v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)&v44, 1);

            id v5 = (void *)v22;
            goto LABEL_12;
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v34, (uint64_t)v45, 16);
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  uint64_t v23 = BLFamilyLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = objc_msgSend_count(v5, v24, v25, v26);
    int isHeadOfHouseholdSharingPayment = objc_msgSend_isHeadOfHouseholdSharingPayment(*(void **)(a1 + 32), v28, v29, v30);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v39 = v5;
    __int16 v40 = 2048;
    uint64_t v41 = v27;
    __int16 v42 = 1024;
    int v43 = isHeadOfHouseholdSharingPayment;
    _os_log_impl(&dword_21DFE3000, v23, OS_LOG_TYPE_DEFAULT, "AMS Family fetched: %@ (count: %lu Family-wide sharing allowed: %d)", buf, 0x1Cu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend_dq_processFamilyCircle_completion_(WeakRetained, v33, (uint64_t)v5, *(void *)(a1 + 40));
}

void sub_21E037D3C(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    id v2 = *(void **)(a1 + 56);
  }
  else {
    id v2 = &unk_26CED3F90;
  }
  uint64_t v3 = (void (**)(void, void, void, void))MEMORY[0x223C1EDC0](v2);
  uint64_t v7 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 32), v4, v5, v6);
  objc_msgSend_notifyPurchaseAttemptForRequest_(v7, v8, *(void *)(a1 + 40), v9);

  id v13 = objc_msgSend_buyParameters(*(void **)(a1 + 40), v10, v11, v12);
  uint64_t v17 = objc_msgSend_length(v13, v14, v15, v16);

  if (v17)
  {
    id v21 = objc_msgSend_serviceProxy(*(void **)(a1 + 32), v18, v19, v20);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_21E037EB0;
    v28[3] = &unk_26448CE40;
    int v31 = v3;
    id v24 = *(id *)(a1 + 40);
    uint64_t v25 = *(void *)(a1 + 32);
    id v29 = v24;
    uint64_t v30 = v25;
    objc_msgSend_purchaseWithRequest_uiHostProxy_reply_(v21, v26, v22, v23, v28);
  }
  else
  {
    uint64_t v27 = BLError(13, @"missing purchase parameters", @"purchase parameters are required by this API");
    ((void (**)(void, void, void, void *))v3)[2](v3, 0, 0, v27);
  }
}

void sub_21E037EB0(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v10 = BLDefaultLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = @"<UNKNOWN>";
      if (v7) {
        uint64_t v12 = v7;
      }
      *(_DWORD *)long long buf = 138543618;
      v144 = v12;
      __int16 v145 = 2112;
      id v146 = v9;
      _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: error issuing a purchase request: %@", buf, 0x16u);
    }

    if (v7)
    {
      uint64_t v16 = objc_msgSend_serviceProxy(*(void **)(a1 + 40), v13, v14, v15);
      v137[0] = MEMORY[0x263EF8330];
      v137[1] = 3221225472;
      v137[2] = sub_21E0384C8;
      v137[3] = &unk_26448CE18;
      uint64_t v17 = v7;
      v138 = v17;
      objc_msgSend_cancelDownloadWithID_withReply_(v16, v18, (uint64_t)v17, (uint64_t)v137);

      uint64_t v22 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 40), v19, v20, v21);
      objc_msgSend_sendCancelCompletionNotificationForDownloadWithDownloadID_(v22, v23, (uint64_t)v17, v24);
    }
    uint64_t v25 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 40), v13, v14, v15);
    objc_msgSend_purchaseDidFailedWithResponse_(v25, v26, (uint64_t)v8, v27);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      v144 = v7;
      _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue] purchaseWithBuyParameters completed without error", buf, 0xCu);
    }

    if (objc_msgSend_isPreOrder(*(void **)(a1 + 32), v28, v29, v30))
    {
      long long v34 = BLDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        v144 = v7;
        _os_log_impl(&dword_21DFE3000, v34, OS_LOG_TYPE_DEBUG, "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: this is a preorder purchase download", buf, 0xCu);
      }
    }
    else if (objc_msgSend_isAudiobook(*(void **)(a1 + 32), v31, v32, v33))
    {
      long long v141 = 0u;
      long long v142 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v34 = objc_msgSend_purchaseResponseItems(v8, v35, v36, v37);
      uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v38, (uint64_t)&v139, (uint64_t)v147, 16);
      if (v136)
      {
        id v131 = v8;
        uint64_t v132 = v7;
        id obj = v34;
        uint64_t v134 = *(void *)v140;
        uint64_t v135 = a1;
        do
        {
          for (uint64_t i = 0; i != v136; ++i)
          {
            if (*(void *)v140 != v134) {
              objc_enumerationMutation(obj);
            }
            int v43 = *(void **)(*((void *)&v139 + 1) + 8 * i);
            uint64_t v44 = objc_msgSend_metadata(v43, v39, v40, v41);
            uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v44, v45, @"itemId", v46);

            uint64_t v51 = objc_msgSend_metadata(v43, v48, v49, v50);
            uint64_t v54 = objc_msgSend_objectForKeyedSubscript_(v51, v52, @"playlistId", v53);

            objc_opt_class();
            uint64_t v58 = objc_msgSend_metadata(v43, v55, v56, v57);
            id v61 = objc_msgSend_objectForKeyedSubscript_(v58, v59, @"itemName", v60);
            uint64_t v62 = BUDynamicCast();

            objc_opt_class();
            double v66 = objc_msgSend_metadata(v43, v63, v64, v65);
            uint64_t v69 = objc_msgSend_objectForKeyedSubscript_(v66, v67, @"playlistName", v68);
            uint64_t v70 = BUDynamicCast();

            objc_opt_class();
            uint64_t v74 = objc_msgSend_metadata(v43, v71, v72, v73);
            id v77 = objc_msgSend_objectForKeyedSubscript_(v74, v75, @"kind", v76);
            __int16 v78 = BUDynamicCast();

            uint64_t v82 = objc_msgSend_serverProgressObserver(*(void **)(v135 + 40), v79, v80, v81);
            uint64_t v83 = NSNumber;
            uint64_t v87 = objc_msgSend_longLongValue(v47, v84, v85, v86);
            uint64_t v90 = objc_msgSend_numberWithLongLong_(v83, v88, v87, v89);
            uint64_t v91 = NSNumber;
            uint64_t v95 = objc_msgSend_longLongValue(v54, v92, v93, v94);
            uint64_t v98 = objc_msgSend_numberWithLongLong_(v91, v96, v95, v97);
            uint64_t v102 = objc_msgSend_downloadID(v43, v99, v100, v101);
            LOBYTE(v130) = 0;
            objc_msgSend_sendInitialProgressNotificationForDownloadWithStoreID_storePlaylistID_orPermlink_downloadID_title_collectionTitle_assetKind_isPaused_targetObserver_(v82, v103, (uint64_t)v90, (uint64_t)v98, 0, v102, v62, v70, v78, v130, 0);
          }
          long long v34 = obj;
          uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v139, (uint64_t)v147, 16);
        }
        while (v136);
        id v8 = v131;
        uint64_t v7 = v132;
        id v9 = 0;
        a1 = v135;
      }
    }
    else
    {
      long long v104 = objc_msgSend_purchaseResponseItems(v8, v35, v36, v37);
      long long v34 = objc_msgSend_firstObject(v104, v105, v106, v107);

      objc_opt_class();
      uint64_t v111 = objc_msgSend_metadata(v34, v108, v109, v110);
      long long v114 = objc_msgSend_objectForKeyedSubscript_(v111, v112, @"kind", v113);
      id v115 = BUDynamicCast();

      long long v119 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 40), v116, v117, v118);
      v123 = objc_msgSend_storeIdentifier(*(void **)(a1 + 32), v120, v121, v122);
      objc_msgSend_sendInitialProgressNotificationForDownloadWithStoreID_storePlaylistID_orPermlink_downloadID_title_collectionTitle_assetKind_isPaused_targetObserver_(v119, v124, (uint64_t)v123, 0, 0, v7, 0, 0, v115, 0, 0);
    }
    uint64_t v25 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 40), v125, v126, v127);
    objc_msgSend_purchaseDidCompleteWithResponse_(v25, v128, (uint64_t)v8, v129);
  }
}

void sub_21E0384C8(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = BLDefaultLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      uint64_t v7 = "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: error cancelling download: %@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_21DFE3000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v11;
    uint64_t v7 = "(dID=%{public}@) [DownloadQueue]: purchaseWithBuyParameters: cancelled download";
    id v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_21E0387C8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  uint64_t v7 = MEMORY[0x223C1EDC0](*(void *)(a1 + 32));
  id v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
  }
}

void sub_21E038ADC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (!v6)
  {
    uint64_t v18 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 32), v7, v8, v9);
    uint64_t v22 = objc_msgSend_path(*(void **)(a1 + 40), v19, v20, v21);
    char v36 = 0;
    objc_msgSend_sendInitialProgressNotificationForDownloadWithStoreID_storePlaylistID_orPermlink_downloadID_title_collectionTitle_assetKind_isPaused_targetObserver_(v18, v23, 0, 0, v22, v5, *(void *)(a1 + 48), 0, @"ebook", v36, 0);

    uint64_t v24 = [BLBookItem alloc];
    id v17 = (id)objc_msgSend_initWithPeristentIdentifier_permlink_title_(v24, v25, (uint64_t)v5, *(void *)(a1 + 40), *(void *)(a1 + 48));
    uint64_t v29 = objc_msgSend_defaultBookLibrary(BLLibrary, v26, v27, v28);
    id v39 = 0;
    objc_msgSend__addBookItemToEduContainer_error_(v29, v30, (uint64_t)v17, (uint64_t)&v39);
    id v6 = v39;

    if (v6)
    {
      int v31 = BLDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_permlink(v17, v32, v33, v34);
        long long v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 138412290;
        uint64_t v41 = v35;
        _os_log_impl(&dword_21DFE3000, v31, OS_LOG_TYPE_DEBUG, "[DownloadQueue]: addDownloadWithPermlink: could not add permlink to container %@.  It may already exist", buf, 0xCu);
      }
    }
    goto LABEL_12;
  }
  uint32_t v10 = BLDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = @"<UNKNOWN>";
    if (v5) {
      uint64_t v11 = v5;
    }
    *(_DWORD *)long long buf = 138543618;
    uint64_t v41 = v11;
    __int16 v42 = 2112;
    id v43 = v6;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: addDownloadWithPermlink: error issuing a permlink download: %@", buf, 0x16u);
  }

  if (v5)
  {
    id v15 = objc_msgSend_serviceProxy(*(void **)(a1 + 32), v12, v13, v14);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = sub_21E038D7C;
    v37[3] = &unk_26448CE18;
    uint64_t v38 = v5;
    objc_msgSend_cancelDownloadWithID_withReply_(v15, v16, (uint64_t)v38, (uint64_t)v37);

    id v17 = v38;
LABEL_12:
  }
}

void sub_21E038D7C(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = BLDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: addDownloadWithPermlink: error cancelling download: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  id v6 = BLDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_21DFE3000, v6, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [DownloadQueue]: addDownloadWithPermlink: cancelled download.", (uint8_t *)&v8, 0xCu);
  }
}

void sub_21E0391F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x223C1EDC0](*(void *)(a1 + 48));
  uint64_t v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }

  uint64_t v9 = objc_msgSend_serviceProxy(*(void **)(a1 + 32), v6, v7, v8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E0392D8;
  v12[3] = &unk_26448CF00;
  __int16 v10 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v10;
  objc_msgSend_fetchDownloadFromDownloadID_withReply_(v9, v11, (uint64_t)v13, (uint64_t)v12);
}

void sub_21E0392D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  __int16 v10 = v6;
  if (v5)
  {
    if (v6)
    {
      id v11 = BLDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v52 = v12;
        __int16 v53 = 2112;
        uint64_t v54 = v10;
        _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: error issuing a permlink download.  Error: %@", buf, 0x16u);
      }

      uint64_t v19 = objc_msgSend_downloadID(v5, v13, v14, v15);
      if (v19)
      {
        uint64_t v20 = objc_msgSend_serviceProxy(*(void **)(a1 + 32), v16, v17, v18);
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = sub_21E03957C;
        v49[3] = &unk_26448CE18;
        uint64_t v50 = v19;
        objc_msgSend_cancelDownloadWithID_withReply_(v20, v21, (uint64_t)v50, (uint64_t)v49);
      }
    }
    else
    {
      uint64_t v19 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 32), v7, v8, v9);
      uint64_t v26 = objc_msgSend_storeIdentifier(v5, v23, v24, v25);
      uint64_t v30 = objc_msgSend_storePlaylistIdentifier(v5, v27, v28, v29);
      uint64_t v34 = objc_msgSend_permlink(v5, v31, v32, v33);
      uint64_t v35 = *(void *)(a1 + 40);
      id v39 = objc_msgSend_title(v5, v36, v37, v38);
      id v43 = objc_msgSend_collectionTitle(v5, v40, v41, v42);
      uint64_t v47 = objc_msgSend_kind(v5, v44, v45, v46);
      objc_msgSend_sendInitialProgressNotificationForDownloadWithStoreID_storePlaylistID_orPermlink_downloadID_title_collectionTitle_assetKind_isPaused_targetObserver_(v19, v48, (uint64_t)v26, (uint64_t)v30, v34, v35, v39, v43, v47, 0, 0);
    }
  }
  else
  {
    uint64_t v19 = BLDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v52 = v22;
      __int16 v53 = 2112;
      uint64_t v54 = v10;
      _os_log_impl(&dword_21DFE3000, v19, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [DownloadQueue]: error fetching download from downloadID:  %@", buf, 0x16u);
    }
  }
}

void sub_21E03957C(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = BLDefaultLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      uint64_t v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: error cancelling download with id: %@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_21DFE3000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v11;
    uint64_t v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: cancelled download.";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_21E039918(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = BLDefaultLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      uint64_t v6 = "[DownloadQueue]: Error encountered cancelling active downloads: %@";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_21DFE3000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    uint64_t v6 = "[DownloadQueue]: Finished Cancelling all active book downloads.";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E039BB0(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = BLDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_ERROR, "[DownloadQueue]: Error encountered preparing BookLibrary for app removal. %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E03A054(uint64_t a1)
{
  uint32_t v9 = objc_alloc_init(BLUIHostServiceNonUI);
  if (*(void *)(a1 + 48)) {
    id v2 = *(void **)(a1 + 48);
  }
  else {
    id v2 = &unk_26CED4090;
  }
  id v3 = (void *)MEMORY[0x223C1EDC0](v2);
  uint64_t v7 = objc_msgSend_serviceProxy(*(void **)(a1 + 32), v4, v5, v6);
  objc_msgSend_requestDownloadsWithManifestRequest_uiHostProxy_reply_(v7, v8, *(void *)(a1 + 40), (uint64_t)v9, v3);
}

void sub_21E03A5CC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (v6)
  {
    int v10 = BLDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_ERROR, "[DownloadQueue]: downloadWithMetadata: error issuing a download request with metadata.  Error: %@", buf, 0xCu);
    }

    if (v5)
    {
      __int16 v14 = objc_msgSend_serviceProxy(*(void **)(a1 + 32), v11, v12, v13);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      void v18[2] = sub_21E03A76C;
      v18[3] = &unk_26448CE18;
      id v19 = v5;
      objc_msgSend_cancelDownloadWithID_withReply_(v14, v15, (uint64_t)v19, (uint64_t)v18);
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_serverProgressObserver(*(void **)(a1 + 32), v7, v8, v9);
    objc_msgSend_sendInitialProgressNotificationForDownloadWithStoreID_storePlaylistID_orPermlink_downloadID_title_collectionTitle_assetKind_isPaused_targetObserver_(v16, v17, *(void *)(a1 + 40), *(void *)(a1 + 48), 0, v5, 0, 0, *(void *)(a1 + 56), 0, 0);
  }
}

void sub_21E03A76C(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = BLDefaultLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      id v15 = v3;
      uint64_t v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: error cancelling download: %@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_21DFE3000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138543362;
    uint64_t v13 = v11;
    uint64_t v7 = "(dID=%{public}@) [DownloadQueue]: resumeDownloadWithID: cancelled download";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

void sub_21E03ACC0()
{
  sub_21E00AB84();
  sub_21E00AB68(&dword_21DFE3000, v0, v1, "no streamInfs on masterPlaylist: %@", v2, v3, v4, v5, v6);
}

void sub_21E03AD28()
{
  sub_21E00AB84();
  sub_21E00AB68(&dword_21DFE3000, v0, v1, "Unable to parse master HLS Playlist: %@", v2, v3, v4, v5, v6);
}

void sub_21E03AD90()
{
  sub_21E00AB84();
  sub_21E00AB68(&dword_21DFE3000, v0, v1, "Parsed master HLS Playlist but it had no valid media playlist (error was %@)", v2, v3, v4, v5, v6);
}

void sub_21E03ADF8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_statusCode(a1, a2, a3, a4);
  sub_21E00AB84();
  sub_21E00AB90(&dword_21DFE3000, v4, v5, "Bad HTTP response when downloading master playlist: %ld", v6, v7, v8, v9, v10);
}

void sub_21E03AE70()
{
  sub_21E00AB84();
  sub_21E00AB68(&dword_21DFE3000, v0, v1, "Error downloading master playlist: %@", v2, v3, v4, v5, v6);
}

uint64_t BUClassAndProtocolCast()
{
  return MEMORY[0x270F127E0]();
}

uint64_t BUDynamicCast()
{
  return MEMORY[0x270F127E8]();
}

uint64_t BUIsGDPRAcknowledgementNeededForBooks()
{
  return MEMORY[0x270F127F0]();
}

uint64_t BUIsRunningTests()
{
  return MEMORY[0x270F127F8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t GSMainScreenScaleFactor()
{
  return MEMORY[0x270F30680]();
}

uint64_t ICDAAPUtilitiesCreateDataForContainer()
{
  return MEMORY[0x270F88A58]();
}

uint64_t ICDAAPUtilitiesWriteContainer()
{
  return MEMORY[0x270F88A60]();
}

uint64_t ICDAAPUtilitiesWriteProperty()
{
  return MEMORY[0x270F88A68]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x270ED93A0](type, path, *(void *)&oflag, mode, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x270F9BD30](node, name);
}

xmlTextReaderPtr xmlNewTextReaderFilename(const char *URI)
{
  return (xmlTextReaderPtr)MEMORY[0x270F9BED0](URI);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x270F9BFE0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return MEMORY[0x270F9C110](str1, str2);
}

const xmlChar *__cdecl xmlTextReaderConstLocalName(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x270F9C190](reader);
}

const xmlChar *__cdecl xmlTextReaderConstNamespaceUri(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x270F9C198](reader);
}

int xmlTextReaderDepth(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1A8](reader);
}

xmlChar *__cdecl xmlTextReaderGetAttribute(xmlTextReaderPtr reader, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x270F9C1B8](reader, name);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1F0](reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return MEMORY[0x270F9C1F8](reader);
}

xmlChar *__cdecl xmlTextReaderReadInnerXml(xmlTextReaderPtr reader)
{
  return (xmlChar *)MEMORY[0x270F9C200](reader);
}

xmlChar *__cdecl xmlTextReaderReadString(xmlTextReaderPtr reader)
{
  return (xmlChar *)MEMORY[0x270F9C208](reader);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D8](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x270F9C458](doc);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x270F9C538](ctxt, prefix, ns_uri);
}
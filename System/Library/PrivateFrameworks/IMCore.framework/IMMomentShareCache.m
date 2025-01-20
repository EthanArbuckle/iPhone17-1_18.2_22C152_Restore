@interface IMMomentShareCache
+ (IMMomentShareCache)sharedInstance;
- (IMMomentShareCache)init;
- (id)_momentShareForURLString:(id)a3 error:(id *)a4;
- (id)momentShareForURLString:(id)a3 error:(id *)a4;
- (void)_ensureLibraryRegistration;
- (void)_processFetchedMomentShare:(id)a3 forURLString:(id)a4 error:(id)a5 completionHandlers:(id)a6;
- (void)momentShareForURLString:(id)a3 completionHandler:(id)a4;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation IMMomentShareCache

- (IMMomentShareCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)IMMomentShareCache;
  v2 = [(IMMomentShareCache *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v2->_cache;
    v2->_cache = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.messages.MomentShareLibraryRegistration", 0);
    libraryRegistrationQueue = v2->_libraryRegistrationQueue;
    v2->_libraryRegistrationQueue = (OS_dispatch_queue *)v7;

    v9 = v2->_libraryRegistrationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C85800;
    block[3] = &unk_1E5B7ACD0;
    v12 = v2;
    dispatch_async(v9, block);
  }
  return v2;
}

+ (IMMomentShareCache)sharedInstance
{
  if (qword_1E965E798 != -1) {
    dispatch_once(&qword_1E965E798, &unk_1EF8E5918);
  }
  v2 = (void *)qword_1EB3F2490;

  return (IMMomentShareCache *)v2;
}

- (void)momentShareForURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_msgSend_objectForKeyedSubscript_(self->_completionHandlers, v8, (uint64_t)v6, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v10, v11, v12, v13))
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1A4CBA620();
    }

    v16 = _Block_copy(v7);
    objc_msgSend_addObject_(v10, v17, (uint64_t)v16, v18);
  }
  else
  {
    id v54 = 0;
    v19 = objc_msgSend__momentShareForURLString_error_(self, v14, (uint64_t)v6, (uint64_t)&v54);
    id v20 = v54;
    v16 = v20;
    if (v19)
    {
      (*((void (**)(id, void *, void))v7 + 2))(v7, v19, 0);
    }
    else if (IMMomentShareCacheErrorIsPermanent(v20))
    {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
    }
    else
    {
      if (!v10)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_msgSend_setObject_forKeyedSubscript_(self->_completionHandlers, v21, (uint64_t)v10, (uint64_t)v6);
      }
      v22 = _Block_copy(v7);
      objc_msgSend_addObject_(v10, v23, (uint64_t)v22, v24);

      v25 = IMLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_1A4CBA5B8();
      }

      v28 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v26, (uint64_t)v6, v27);
      uint64_t v32 = objc_msgSend__ensureLibraryRegistration(self, v29, v30, v31);
      id v36 = sub_1A4C858AC(v32, v33, v34, v35);
      v40 = objc_msgSend_sharedMomentSharePhotoLibrary(v36, v37, v38, v39);
      v44 = objc_msgSend_librarySpecificFetchOptions(v40, v41, v42, v43);

      id v49 = sub_1A4C85DE4(v45, v46, v47, v48);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = sub_1A4C85EC8;
      v51[3] = &unk_1E5B7F928;
      v51[4] = self;
      id v52 = v6;
      id v10 = v10;
      id v53 = v10;
      objc_msgSend_fetchMomentShareFromShareURL_options_completionHandler_(v49, v50, (uint64_t)v28, (uint64_t)v44, v51);
    }
  }
}

- (id)momentShareForURLString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_completionHandlers, v7, (uint64_t)v6, v8);
  if (!objc_msgSend_count(v9, v10, v11, v12))
  {
    id v18 = 0;
    v16 = objc_msgSend__momentShareForURLString_error_(self, v13, (uint64_t)v6, (uint64_t)&v18);
    id v15 = v18;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1A4CBA688();
  }

  sub_1A4C86120(-1000, 0);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (a4)
  {
LABEL_7:
    if (!v16) {
      *a4 = v15;
    }
  }
LABEL_9:

  return v16;
}

- (void)_ensureLibraryRegistration
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!self->_hasRegisteredForLibraryChanges)
  {
    libraryRegistrationQueue = self->_libraryRegistrationQueue;
    dispatch_sync(libraryRegistrationQueue, &unk_1EF8E6AC8);
  }
}

- (id)_momentShareForURLString:(id)a3 error:(id *)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_1A4B3462C;
  v72 = sub_1A4B343FC;
  id v73 = 0;
  uint64_t v62 = 0;
  v63 = (id *)&v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_1A4B3462C;
  v66 = sub_1A4B343FC;
  id v67 = 0;
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(self->_cache, v7, (uint64_t)v6, v8);
  uint64_t v13 = v9;
  if (v9)
  {
    objc_msgSend_first(v9, v10, v11, v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      id v18 = IMLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = v18;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v23 = objc_msgSend_uuid(v17, v20, v21, v22);
          sub_1A4CBA758(v23, (uint64_t)v6, buf, v19);
        }
      }
      uint64_t v24 = v69;
      id v17 = v17;
      id v25 = (id)v24[5];
      v24[5] = (uint64_t)v17;
    }
    else
    {
      objc_msgSend_second(v13, v14, v15, v16);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v56 = IMLogHandleForCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v76 = v25;
          __int16 v77 = 2112;
          id v78 = v6;
          _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_DEFAULT, "Returning cached permanent error: %@, for URL: %@", buf, 0x16u);
        }

        objc_storeStrong(v63 + 5, v25);
      }
    }
  }
  else
  {
    v26 = IMLogHandleForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_1A4CBA6F0();
    }

    objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v27, (uint64_t)v6, v28);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = objc_msgSend__ensureLibraryRegistration(self, v29, v30, v31);
    id v36 = sub_1A4C858AC(v32, v33, v34, v35);
    v40 = objc_msgSend_sharedMomentSharePhotoLibrary(v36, v37, v38, v39);
    v44 = objc_msgSend_librarySpecificFetchOptions(v40, v41, v42, v43);

    id v49 = sub_1A4C85DE4(v45, v46, v47, v48);
    id v61 = 0;
    v51 = objc_msgSend_fetchLocalMomentShareFromShareURL_error_options_(v49, v50, (uint64_t)v17, (uint64_t)&v61, v44);
    id v25 = v61;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = sub_1A4C86698;
    v60[3] = &unk_1E5B7F950;
    v60[4] = &v68;
    v60[5] = &v62;
    id v52 = _Block_copy(v60);
    v74 = v52;
    id v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v53, (uint64_t)&v74, 1);
    objc_msgSend__processFetchedMomentShare_forURLString_error_completionHandlers_(self, v55, (uint64_t)v51, (uint64_t)v6, v25, v54);
  }
  v57 = (void *)v69[5];
  if (a4 && !v57)
  {
    *a4 = v63[5];
    v57 = (void *)v69[5];
  }
  id v58 = v57;

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  return v58;
}

- (void)_processFetchedMomentShare:(id)a3 forURLString:(id)a4 error:(id)a5 completionHandlers:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (char *)a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = sub_1A4C869EC(v10);
    objc_msgSend_setObject_forKeyedSubscript_(self->_cache, v15, (uint64_t)v14, (uint64_t)v11);

    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1A4CBA8B4(v10, v11, (uint64_t)v16, v17);
    }

    id v18 = v10;
    v19 = 0;
  }
  else
  {
    id v20 = v12;
    uint64_t v24 = v20;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    id v25 = (uint64_t (*)(void *))off_1E965EDA0;
    id v52 = off_1E965EDA0;
    if (!off_1E965EDA0)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = sub_1A4C87128;
      uint64_t v47 = &unk_1E5B7C7B8;
      uint64_t v48 = &v49;
      v26 = (void *)sub_1A4C87178((uint64_t)v20, v21, v22, v23);
      v50[3] = (uint64_t)dlsym(v26, "PXIsMomentShareErrorPermanent");
      off_1E965EDA0 = *(_UNKNOWN **)(v48[1] + 24);
      id v25 = (uint64_t (*)(void *))v50[3];
    }
    _Block_object_dispose(&v49, 8);
    if (!v25) {
      sub_1A4CBA7C0(v27, v28, v29, v30);
    }
    int v31 = v25(v24);

    if (v31) {
      uint64_t v32 = -1001;
    }
    else {
      uint64_t v32 = -1000;
    }
    v33 = sub_1A4C86120(v32, v24);
    v19 = v33;
    if (v31)
    {
      uint64_t v34 = sub_1A4C86A40(v33);
      objc_msgSend_setObject_forKeyedSubscript_(self->_cache, v35, (uint64_t)v34, (uint64_t)v11);
    }
    id v36 = IMLogHandleForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_1A4CBA838();
    }
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_1A4C86A94;
  v41[3] = &unk_1E5B7F978;
  id v42 = v10;
  id v43 = v19;
  id v37 = v19;
  id v38 = v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v13, v39, (uint64_t)v41, v40);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A4C86B44;
  v6[3] = &unk_1E5B7B130;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
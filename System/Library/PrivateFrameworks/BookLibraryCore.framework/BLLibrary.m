@interface BLLibrary
+ (BOOL)_addDate:(id)a3 toPlist:(id)a4 bookItem:(id)a5 error:(id *)a6;
+ (id)_bookItemsFromPlist:(id)a3 sharedPlist:(id)a4;
+ (id)defaultBookLibrary;
+ (void)initialize;
- (BOOL)_addBookItemToEduContainer:(id)a3 error:(id *)a4;
- (BOOL)_addSharedBookToPurchasesPlistWithPermlink:(id)a3 error:(id *)a4;
- (BOOL)_bookItemIsShared:(id)a3;
- (BOOL)_isMultiUser;
- (BOOL)_isShareableBook:(id)a3;
- (BOOL)_removeBookFromLibraryWithPath:(id)a3 error:(id *)a4;
- (BOOL)removeBookFromLibraryWithIdentifier:(id)a3 error:(id *)a4;
- (IMLibraryPlist)booksPlist;
- (IMLibraryPlist)managedPlist;
- (IMLibraryPlist)purchasedPlist;
- (IMLibraryPlist)sharedPlist;
- (OS_dispatch_queue)dispatchQueue;
- (id)_allPlists;
- (id)_bookItemFromPermlink:(id)a3 error:(id *)a4;
- (id)_bookItemFromStoreID:(id)a3 permlink:(id)a4 error:(id *)a5;
- (id)_bookItemsFromPlist:(id)a3;
- (id)_findBookItemWithTestBlock:(id)a3 foundWhere:(int64_t *)a4;
- (id)_init;
- (id)_initWithBooksPlist:(id)a3 purchasedPlist:(id)a4 managedPlist:(id)a5 sharedPlist:(id)a6;
- (id)_list:(id)a3 testBlock:(id)a4;
- (id)_lookupBookItemExhaustiveFromPermlink:(id)a3 error:(id *)a4;
- (id)_perUserBookURLForBookURL:(id)a3;
- (id)allBookItems;
- (id)bookIdentifierFromURL:(id)a3 error:(id *)a4;
- (void)_bookWasOpenedWithStoreID:(id)a3 permlink:(id)a4 date:(id)a5;
- (void)_downloadWithPermalink:(id)a3 title:(id)a4 result:(id)a5;
- (void)addITunesUBookToLibraryWithPermlink:(id)a3 title:(id)a4 result:(id)a5;
- (void)setBooksPlist:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setManagedPlist:(id)a3;
- (void)setPurchasedPlist:(id)a3;
- (void)setSharedPlist:(id)a3;
@end

@implementation BLLibrary

+ (void)initialize
{
  if (qword_26AB400A0 != -1) {
    dispatch_once(&qword_26AB400A0, &unk_26CED3910);
  }
}

+ (id)defaultBookLibrary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21DFE6A38;
  block[3] = &unk_26448ACA0;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_26AB40090, block);
  v2 = (void *)qword_26AB40088;

  return v2;
}

- (id)_initWithBooksPlist:(id)a3 purchasedPlist:(id)a4 managedPlist:(id)a5 sharedPlist:(id)a6
{
  v30[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)BLLibrary;
  v15 = [(BLLibrary *)&v28 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_purchasedPlist, a4);
    objc_storeStrong((id *)&v16->_booksPlist, a3);
    objc_storeStrong((id *)&v16->_managedPlist, a5);
    objc_storeStrong((id *)&v16->_sharedPlist, a6);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.BookLibrary.BLLibrary", 0);
    dispatchQueue = v16->_dispatchQueue;
    v16->_dispatchQueue = (OS_dispatch_queue *)v17;

    v29 = @"BLLibraryAllowsDownloadsViaBookAssetDaemonForITunesUBooks";
    v30[0] = MEMORY[0x263EFFA80];
    v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v30, (uint64_t)&v29, 1);
    v24 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v21, v22, v23);
    objc_msgSend_registerDefaults_(v24, v25, (uint64_t)v20, v26);
  }
  return v16;
}

- (id)_init
{
  v4 = objc_msgSend_libraryPlistWithKind_(IMLibraryPlist, a2, 1, v2);
  v7 = objc_msgSend_libraryPlistWithKind_(IMLibraryPlist, v5, 0, v6);
  v10 = objc_msgSend_libraryPlistWithKind_(IMLibraryPlist, v8, 2, v9);
  id v13 = objc_msgSend_libraryPlistWithKind_(IMLibraryPlist, v11, 3, v12);
  v15 = objc_msgSend__initWithBooksPlist_purchasedPlist_managedPlist_sharedPlist_(self, v14, (uint64_t)v7, (uint64_t)v4, v10, v13);

  return v15;
}

- (id)_bookItemsFromPlist:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_sharedPlist(self, v5, v6, v7);
  v10 = objc_msgSend__bookItemsFromPlist_sharedPlist_(BLLibrary, v9, (uint64_t)v4, (uint64_t)v8);

  return v10;
}

+ (id)_bookItemsFromPlist:(id)a3 sharedPlist:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v10 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8, v9);
  v62 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13);
  objc_msgSend_contents(v5, v14, v15, v16);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v57 = unint64_t v17 = 0x26448A000uLL;
  objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v18, (uint64_t)v57, v19);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v63, (uint64_t)v67, 16);
  if (v61)
  {
    uint64_t v60 = *(void *)v64;
    id v58 = v6;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v64 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v25 = objc_msgSend_folderNameFromPlistEntry_(*(void **)(v17 + 2688), v21, v24, v22);
        v29 = objc_msgSend_directory(v5, v26, v27, v28);
        v32 = objc_msgSend_stringByAppendingPathComponent_(v29, v30, (uint64_t)v25, v31);
        char v35 = objc_msgSend_fileExistsAtPath_(v62, v33, (uint64_t)v32, v34);
        if (v6 && (v35 & 1) == 0)
        {
          v39 = v10;
          id v40 = v5;
          v41 = objc_msgSend_directory(v6, v36, v37, v38);
          v44 = objc_msgSend_stringByAppendingPathComponent_(v41, v42, (uint64_t)v25, v43);

          if (objc_msgSend_fileExistsAtPath_(v62, v45, (uint64_t)v44, v46))
          {
            uint64_t v50 = objc_msgSend_directory(v6, v47, v48, v49);

            v29 = (void *)v50;
          }

          id v5 = v40;
          v10 = v39;
          unint64_t v17 = 0x26448A000;
          id v6 = v58;
        }
        v51 = [BLBookItem alloc];
        v53 = objc_msgSend_initWithEntry_basePath_(v51, v52, v24, (uint64_t)v29);
        objc_msgSend_addObject_(v10, v54, (uint64_t)v53, v55);
      }
      uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v63, (uint64_t)v67, 16);
    }
    while (v61);
  }

  return v10;
}

- (id)allBookItems
{
  id v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3);
  uint64_t v9 = objc_msgSend_iTunesSyncLockFile(BLLockFile, v6, v7, v8);
  if (objc_msgSend_tryLock_(v9, v10, 0, v11))
  {
    uint64_t v15 = objc_msgSend_purchasedPlist(self, v12, v13, v14);
    v18 = objc_msgSend__bookItemsFromPlist_(self, v16, (uint64_t)v15, v17);
    objc_msgSend_addObjectsFromArray_(v5, v19, (uint64_t)v18, v20);

    uint64_t v24 = objc_msgSend_booksPlist(self, v21, v22, v23);
    uint64_t v27 = objc_msgSend__bookItemsFromPlist_(self, v25, (uint64_t)v24, v26);
    objc_msgSend_addObjectsFromArray_(v5, v28, (uint64_t)v27, v29);

    v33 = objc_msgSend_managedPlist(self, v30, v31, v32);
    v36 = objc_msgSend__bookItemsFromPlist_(self, v34, (uint64_t)v33, v35);
    objc_msgSend_addObjectsFromArray_(v5, v37, (uint64_t)v36, v38);
  }
  else
  {
    v39 = BLDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_21DFE3000, v39, OS_LOG_TYPE_ERROR, "Failed to obtain the iTunes Sync lock.", v41, 2u);
    }
  }

  return v5;
}

- (void)addITunesUBookToLibraryWithPermlink:(id)a3 title:(id)a4 result:(id)a5
{
  v66[2] = *(id *)MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = (void (**)(id, uint64_t, void))a5;
  if (v8)
  {
    *(void *)&long long v62 = 0;
    *((void *)&v62 + 1) = &v62;
    uint64_t v63 = 0x3032000000;
    long long v64 = sub_21DFE7750;
    long long v65 = sub_21DFE7760;
    v66[0] = 0;
    uint64_t v54 = 0;
    uint64_t v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = sub_21DFE7750;
    id v58 = sub_21DFE7760;
    id obj = 0;
    uint64_t v12 = objc_msgSend__bookItemFromPermlink_error_(self, v10, (uint64_t)v8, (uint64_t)&obj);
    objc_storeStrong(v66, obj);
    id v59 = v12;
    if (!v55[5]) {
      goto LABEL_42;
    }
    uint64_t v16 = BLDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_DEFAULT, "Book already exists in local library.", buf, 2u);
    }

    if (!v55[5])
    {
LABEL_42:
      if (objc_msgSend__isMultiUser(self, v13, v14, v15))
      {
        uint64_t v17 = objc_msgSend_sharedPlist(self, v13, v14, v15);
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = sub_21DFE7768;
        v51[3] = &unk_26448ACC8;
        id v18 = v8;
        id v52 = v18;
        uint64_t v20 = objc_msgSend__list_testBlock_(self, v19, (uint64_t)v17, (uint64_t)v51);
        v21 = (void *)v55[5];
        v55[5] = v20;

        if (v55[5])
        {
          uint64_t v22 = BLDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DFE3000, v22, OS_LOG_TYPE_DEFAULT, "Book exists locally in shared container but not in current users library.", buf, 2u);
          }

          id v50 = 0;
          char v24 = objc_msgSend__addSharedBookToPurchasesPlistWithPermlink_error_(self, v23, (uint64_t)v18, (uint64_t)&v50);
          id v25 = v50;
          if ((v24 & 1) == 0)
          {
            uint64_t v26 = BLDefaultLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v61 = v25;
              _os_log_impl(&dword_21DFE3000, v26, OS_LOG_TYPE_ERROR, "Error adding shared entry to local plist.  %@", buf, 0xCu);
            }
          }
        }
      }
    }
    if (v55[5]) {
      goto LABEL_30;
    }
    if (objc_msgSend__isMultiUser(self, v13, v14, v15))
    {
      uint64_t v27 = BLDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v28 = "Book does not exist in current users library or the shared library, triggering a download.";
LABEL_28:
        _os_log_impl(&dword_21DFE3000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
      }
    }
    else
    {
      uint64_t v27 = BLDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v28 = "Book does not exist in library, triggering a download.";
        goto LABEL_28;
      }
    }

    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = sub_21DFE77AC;
    v46[3] = &unk_26448ACF0;
    uint64_t v48 = &v54;
    uint64_t v49 = &v62;
    uint64_t v32 = v31;
    v47 = v32;
    objc_msgSend__downloadWithPermalink_title_result_(self, v33, (uint64_t)v8, (uint64_t)v9, v46);
    dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);

LABEL_30:
    uint64_t v34 = objc_msgSend_sharedEduCloudContainer(BLEduCloudContainer, v13, v14, v15);
    uint64_t v38 = v34;
    if (v55[5])
    {
      if (objc_msgSend_isSignedIn(v34, v35, v36, v37))
      {
        uint64_t v40 = v55[5];
        uint64_t v41 = *((void *)&v62 + 1);
        id v45 = *(id *)(*((void *)&v62 + 1) + 40);
        char v42 = objc_msgSend_addBookItem_error_(v38, v39, v40, (uint64_t)&v45);
        objc_storeStrong((id *)(v41 + 40), v45);
        if ((v42 & 1) == 0)
        {
          uint64_t v43 = BLDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v44 = *(void **)(*((void *)&v62 + 1) + 40);
            *(_DWORD *)buf = 138412290;
            id v61 = v44;
            _os_log_impl(&dword_21DFE3000, v43, OS_LOG_TYPE_ERROR, "Failed to add to the cloud. Error:  %@", buf, 0xCu);
          }
        }
      }
    }
    if (v11) {
      v11[2](v11, v55[5], *(void *)(*((void *)&v62 + 1) + 40));
    }

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v62, 8);

    goto LABEL_39;
  }
  uint64_t v29 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, @"BLLibraryErrorDomain", -1002, 0);
  if (v11)
  {
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v29);
  }
  else
  {
    v30 = BLDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v62) = 138412290;
      *(void *)((char *)&v62 + 4) = v29;
      _os_log_impl(&dword_21DFE3000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter.  %@", (uint8_t *)&v62, 0xCu);
    }
  }
LABEL_39:
}

- (id)_lookupBookItemExhaustiveFromPermlink:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, @"BLLibraryErrorDomain", -1002, 0);
      uint64_t v12 = 0;
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  uint64_t v8 = objc_msgSend__bookItemFromPermlink_error_(self, v6, (uint64_t)v7, (uint64_t)a4);
  if (v8)
  {
    uint64_t v12 = (void *)v8;
LABEL_16:
    id v13 = 0;
    goto LABEL_17;
  }
  if (!objc_msgSend__isMultiUser(self, v9, v10, v11))
  {
LABEL_15:
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  uint64_t v17 = objc_msgSend_sharedPlist(self, v14, v15, v16);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_21DFE7AA8;
  v26[3] = &unk_26448ACC8;
  id v18 = v7;
  id v27 = v18;
  uint64_t v12 = objc_msgSend__list_testBlock_(self, v19, (uint64_t)v17, (uint64_t)v26);

  if (v12)
  {
    uint64_t v20 = BLDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DFE3000, v20, OS_LOG_TYPE_INFO, "Book exists locally in shared container but not in current users library.", buf, 2u);
    }

    id v25 = 0;
    char v22 = objc_msgSend__addSharedBookToPurchasesPlistWithPermlink_error_(self, v21, (uint64_t)v18, (uint64_t)&v25);
    id v13 = v25;
    if ((v22 & 1) == 0)
    {
      uint64_t v23 = BLDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v13;
        _os_log_impl(&dword_21DFE3000, v23, OS_LOG_TYPE_ERROR, "Error adding shared entry to local plist.  %@", buf, 0xCu);
      }

      if (a4)
      {
        id v13 = v13;
        *a4 = v13;
      }
    }
  }
  else
  {
    id v13 = 0;
  }

LABEL_17:

  return v12;
}

- (BOOL)_addBookItemToEduContainer:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v9 = objc_msgSend_sharedEduCloudContainer(BLEduCloudContainer, v6, v7, v8);
  id v13 = v9;
  if (!v5 || !objc_msgSend_isSignedIn(v9, v10, v11, v12))
  {
    id v16 = 0;
    goto LABEL_9;
  }
  id v20 = 0;
  char v15 = objc_msgSend_addBookItem_error_(v13, v14, (uint64_t)v5, (uint64_t)&v20);
  id v16 = v20;
  if (v15)
  {
LABEL_9:
    BOOL v18 = 1;
    goto LABEL_10;
  }
  uint64_t v17 = BLDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v16;
    _os_log_impl(&dword_21DFE3000, v17, OS_LOG_TYPE_ERROR, "Failed to add to the cloud. Error:  %@", buf, 0xCu);
  }

  if (a4)
  {
    id v16 = v16;
    BOOL v18 = 0;
    *a4 = v16;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_10:

  return v18;
}

- (BOOL)removeBookFromLibraryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = sub_21DFE7750;
  id v25 = sub_21DFE7760;
  id v26 = 0;
  uint64_t v10 = objc_msgSend_iTunesSyncLockFile(BLLockFile, v7, v8, v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21DFE7DBC;
  v16[3] = &unk_26448AD18;
  v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  BOOL v18 = &v27;
  uint64_t v19 = &v21;
  id v20 = a4;
  objc_msgSend_lockWithBlock_error_(v10, v12, (uint64_t)v16, (uint64_t)a4);
  if (a4)
  {
    id v13 = (void *)v22[5];
    if (v13) {
      *a4 = v13;
    }
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)_removeBookFromLibraryWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = sub_21DFE7750;
  id v25 = sub_21DFE7760;
  id v26 = 0;
  uint64_t v10 = objc_msgSend_iTunesSyncLockFile(BLLockFile, v7, v8, v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21DFE8278;
  v16[3] = &unk_26448AD18;
  v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  BOOL v18 = &v27;
  uint64_t v19 = &v21;
  id v20 = a4;
  objc_msgSend_lockWithBlock_error_(v10, v12, (uint64_t)v16, (uint64_t)a4);
  if (a4)
  {
    id v13 = (void *)v22[5];
    if (v13) {
      *a4 = v13;
    }
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)bookIdentifierFromURL:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend_path(a3, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v7 = objc_msgSend_identifierFromBookPath_error_(BLLibraryUtility, v6, (uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (id)_allPlists
{
  v23[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_booksPlist(self, a2, v2, v3);
  uint64_t v9 = (void *)v5;
  uint64_t v10 = MEMORY[0x263EFFA68];
  if (v5) {
    objc_msgSend_purchasedPlist(self, v6, v7, v8, v5);
  }
  else {
  uint64_t v11 = objc_msgSend_purchasedPlist(self, v6, v7, v8, MEMORY[0x263EFFA68]);
  }
  char v15 = (void *)v11;
  if (v11) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = v10;
  }
  v23[1] = v16;
  uint64_t v17 = objc_msgSend_managedPlist(self, v12, v13, v14);
  uint64_t v19 = (void *)v17;
  if (v17) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = v10;
  }
  v23[2] = v20;
  uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v18, (uint64_t)v23, 3);

  return v21;
}

- (id)_list:(id)a3 testBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, void *))a4;
  objc_msgSend__bookItemsFromPlist_(self, v7, (uint64_t)a3, v8);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v6[2](v6, v14))
        {
          id v11 = v14;
          goto LABEL_11;
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v15, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)_findBookItemWithTestBlock:(id)a3 foundWhere:(int64_t *)a4
{
  id v6 = a3;
  uint64_t v12 = objc_msgSend__allPlists(self, v7, v8, v9);
  if (a4) {
    *a4 = 3;
  }
  uint64_t v13 = 0;
  while (1)
  {
    uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(v12, v10, v13, v11);
    uint64_t v16 = objc_msgSend__list_testBlock_(self, v15, (uint64_t)v14, (uint64_t)v6);

    if (v16) {
      break;
    }
    if (++v13 == 3) {
      goto LABEL_9;
    }
  }
  if (a4) {
    *a4 = v13;
  }
LABEL_9:

  return v16;
}

- (id)_bookItemFromStoreID:(id)a3 permlink:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = sub_21DFE8A4C;
  long long v20 = &unk_26448AD40;
  id v10 = v8;
  id v21 = v10;
  id v11 = v9;
  id v22 = v11;
  uint64_t v13 = objc_msgSend__findBookItemWithTestBlock_foundWhere_(self, v12, (uint64_t)&v17, 0);
  char v15 = (void *)v13;
  if (a5 && !v13)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v14, *MEMORY[0x263F07F70], 4, 0, v17, v18, v19, v20, v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_bookItemFromPermlink:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21DFE8BBC;
  v13[3] = &unk_26448ACC8;
  id v7 = v6;
  id v14 = v7;
  uint64_t v9 = objc_msgSend__findBookItemWithTestBlock_foundWhere_(self, v8, (uint64_t)v13, 0);
  id v11 = (void *)v9;
  if (a4 && !v9)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, *MEMORY[0x263F07F70], 4, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)_isMultiUser
{
  return objc_msgSend__isMultiUser(BLLibraryUtility, a2, v2, v3);
}

- (BOOL)_isShareableBook:(id)a3
{
  id v3 = a3;
  id v6 = objc_msgSend_storeIdFromPlistEntry_(IMLibraryPlist, v4, (uint64_t)v3, v5);
  uint64_t v9 = objc_msgSend_isSampleFromPlistEntry_(IMLibraryPlist, v7, (uint64_t)v3, v8);
  char v13 = objc_msgSend_BOOLValue(v9, v10, v11, v12);

  int isSupplementalContentFromPlistEntry = objc_msgSend_isSupplementalContentFromPlistEntry_(IMLibraryPlist, v14, (uint64_t)v3, v15);
  int isPDFFromPlistEntry = objc_msgSend_isPDFFromPlistEntry_(IMLibraryPlist, v17, (uint64_t)v3, v18);
  BOOL v23 = 0;
  if ((v13 & 1) == 0 && (isSupplementalContentFromPlistEntry & isPDFFromPlistEntry & 1) == 0)
  {
    if (objc_msgSend_length(v6, v20, v21, v22))
    {
      BOOL v23 = 1;
    }
    else
    {
      id v26 = objc_msgSend_permlinkFromPlistEntry_(IMLibraryPlist, v24, (uint64_t)v3, v25);
      BOOL v23 = v26 != 0;
    }
  }

  return v23;
}

- (id)_perUserBookURLForBookURL:(id)a3
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_path(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_stringByStandardizingPath(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_sharedPlist(self, v13, v14, v15);
  long long v20 = objc_msgSend_path(v16, v17, v18, v19);
  char v24 = objc_msgSend_stringByDeletingLastPathComponent(v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_stringByStandardizingPath(v24, v25, v26, v27);

  uint64_t v32 = objc_msgSend_stringByDeletingLastPathComponent(v12, v29, v30, v31);
  LODWORD(v20) = objc_msgSend_isEqualToString_(v32, v33, (uint64_t)v28, v34);

  if (!v20) {
    goto LABEL_30;
  }
  uint64_t v38 = objc_msgSend_lastPathComponent(v12, v35, v36, v37);
  char v42 = objc_msgSend_sharedPlist(self, v39, v40, v41);
  uint64_t v46 = objc_msgSend_contents(v42, v43, v44, v45);
  uint64_t v49 = objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v47, (uint64_t)v46, v48);

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id obj = v49;
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v128, (uint64_t)v133, 16);
  v120 = self;
  if (v51)
  {
    uint64_t v54 = v51;
    uint64_t v55 = *(void *)v129;
    while (2)
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v129 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v57 = *(void *)(*((void *)&v128 + 1) + 8 * i);
        id v58 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v52, v57, v53);
        if (objc_msgSend_isEqualToString_(v58, v59, (uint64_t)v38, v60))
        {
          uint64_t v63 = objc_msgSend_assetIDFromPlistEntry_(IMLibraryPlist, v61, v57, v62);
          v122 = objc_msgSend_temporaryItemIdentifierFromPlistEntry_(IMLibraryPlist, v64, v57, v65);

          goto LABEL_12;
        }
      }
      uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v128, (uint64_t)v133, 16);
      if (v54) {
        continue;
      }
      break;
    }
    v122 = 0;
    uint64_t v63 = 0;
LABEL_12:
    self = v120;
  }
  else
  {
    v122 = 0;
    uint64_t v63 = 0;
  }

  if (objc_msgSend_length(v63, v66, v67, v68) || objc_msgSend_length(v122, v69, v70, v71))
  {
    v119 = v28;
    v72 = objc_msgSend_purchasedPlist(self, v69, v70, v71);
    v76 = objc_msgSend_contents(v72, v73, v74, v75);
    v79 = objc_msgSend_booksArrayFromPlistEntry_(IMLibraryPlist, v77, (uint64_t)v76, v78);

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v80 = v79;
    uint64_t v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v124, (uint64_t)v132, 16);
    if (v82)
    {
      uint64_t v85 = v82;
      uint64_t v86 = *(void *)v125;
      v117 = v12;
      id v118 = v4;
      while (2)
      {
        for (uint64_t j = 0; j != v85; ++j)
        {
          if (*(void *)v125 != v86) {
            objc_enumerationMutation(v80);
          }
          uint64_t v88 = *(void *)(*((void *)&v124 + 1) + 8 * j);
          v89 = objc_msgSend_assetIDFromPlistEntry_(IMLibraryPlist, v83, v88, v84);
          v92 = objc_msgSend_temporaryItemIdentifierFromPlistEntry_(IMLibraryPlist, v90, v88, v91);
          if ((objc_msgSend_isEqualToString_(v63, v93, (uint64_t)v89, v94) & 1) != 0
            || objc_msgSend_isEqualToString_(v122, v95, (uint64_t)v92, v97))
          {
            v116 = NSURL;
            v121 = objc_msgSend_purchasedPlist(v120, v95, v96, v97);
            v102 = objc_msgSend_path(v121, v99, v100, v101);
            v106 = objc_msgSend_stringByDeletingLastPathComponent(v102, v103, v104, v105);
            v109 = objc_msgSend_folderNameFromPlistEntry_(IMLibraryPlist, v107, v88, v108);
            v112 = objc_msgSend_stringByAppendingPathComponent_(v106, v110, (uint64_t)v109, v111);
            objc_msgSend_fileURLWithPath_(v116, v113, (uint64_t)v112, v114);
            id v98 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v12 = v117;
            id v4 = v118;
            goto LABEL_28;
          }
        }
        uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v124, (uint64_t)v132, 16);
        id v98 = 0;
        uint64_t v12 = v117;
        id v4 = v118;
        if (v85) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v98 = 0;
    }
LABEL_28:

    uint64_t v28 = v119;
  }
  else
  {
    id v98 = 0;
  }

  if (!v98) {
LABEL_30:
  }
    id v98 = v4;

  return v98;
}

- (void)_downloadWithPermalink:(id)a3 title:(id)a4 result:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v13 = objc_msgSend_sharedInstance(BLDownloadQueueNonUI, v10, v11, v12);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21DFE9250;
  v18[3] = &unk_26448AD68;
  id v19 = v7;
  id v20 = v8;
  id v21 = v9;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  objc_msgSend_addDownloadWithPermlink_title_completion_(v13, v17, (uint64_t)v16, (uint64_t)v15, v18);
}

- (BOOL)_addSharedBookToPurchasesPlistWithPermlink:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = sub_21DFE7750;
  uint64_t v25 = sub_21DFE7760;
  id v26 = 0;
  uint64_t v10 = objc_msgSend_iTunesSyncLockFile(BLLockFile, v7, v8, v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21DFE9500;
  v16[3] = &unk_26448AD18;
  v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  uint64_t v18 = &v27;
  id v19 = &v21;
  id v20 = a4;
  objc_msgSend_lockWithBlock_error_(v10, v12, (uint64_t)v16, (uint64_t)a4);
  if (a4)
  {
    char v13 = (void *)v22[5];
    if (v13) {
      *a4 = v13;
    }
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)_bookItemIsShared:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v8 = objc_msgSend_sharedPlist(self, v5, v6, v7, 0);
  id v11 = objc_msgSend__bookItemsFromPlist_(self, v9, (uint64_t)v8, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v17 = v4;
        id v18 = v16;
        uint64_t v22 = objc_msgSend_permlink(v17, v19, v20, v21);
        if (v22
          && (id v26 = (void *)v22,
              objc_msgSend_permlink(v18, v23, v24, v25),
              uint64_t v27 = objc_claimAutoreleasedReturnValue(),
              v27,
              v26,
              v27))
        {
          uint64_t v28 = objc_msgSend_permlink(v17, v23, v24, v25);
          uint64_t v32 = objc_msgSend_permlink(v18, v29, v30, v31);
          char isEqual = objc_msgSend_isEqual_(v28, v33, (uint64_t)v32, v34);
        }
        else
        {
          uint64_t v36 = objc_msgSend_storeIdentifier(v17, v23, v24, v25);
          if (!v36
            || (uint64_t v40 = (void *)v36,
                objc_msgSend_storeIdentifier(v18, v37, v38, v39),
                uint64_t v41 = objc_claimAutoreleasedReturnValue(),
                v41,
                v40,
                !v41))
          {

            continue;
          }
          uint64_t v28 = objc_msgSend_storeIdentifier(v17, v42, v43, v44);
          uint64_t v32 = objc_msgSend_storeIdentifier(v18, v45, v46, v47);
          char isEqual = objc_msgSend_isEqualToString_(v28, v48, (uint64_t)v32, v49);
        }
        char v50 = isEqual;

        if (v50)
        {
          LOBYTE(v13) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v51, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v13);
  }
LABEL_17:

  return v13;
}

- (void)_bookWasOpenedWithStoreID:(id)a3 permlink:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_dispatchQueue(self, v11, v12, v13);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_21DFE9C24;
  v18[3] = &unk_26448AD90;
  id v19 = v8;
  id v20 = v9;
  uint64_t v21 = self;
  id v22 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  dispatch_async(v14, v18);
}

+ (BOOL)_addDate:(id)a3 toPlist:(id)a4 bookItem:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_21DFE7750;
  uint64_t v34 = sub_21DFE7760;
  id v35 = 0;
  id v15 = objc_msgSend_iTunesSyncLockFile(BLLockFile, v12, v13, v14);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_21DFE9F14;
  v23[3] = &unk_26448ADB8;
  id v16 = v10;
  id v24 = v16;
  id v17 = v11;
  id v25 = v17;
  id v18 = v9;
  id v26 = v18;
  uint64_t v27 = &v36;
  uint64_t v28 = &v30;
  uint64_t v29 = a6;
  objc_msgSend_lockWithBlock_error_(v15, v19, (uint64_t)v23, (uint64_t)a6);
  if (a6)
  {
    id v20 = (void *)v31[5];
    if (v20) {
      *a6 = v20;
    }
  }
  char v21 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v21;
}

- (IMLibraryPlist)booksPlist
{
  return self->_booksPlist;
}

- (void)setBooksPlist:(id)a3
{
}

- (IMLibraryPlist)purchasedPlist
{
  return self->_purchasedPlist;
}

- (void)setPurchasedPlist:(id)a3
{
}

- (IMLibraryPlist)managedPlist
{
  return self->_managedPlist;
}

- (void)setManagedPlist:(id)a3
{
}

- (IMLibraryPlist)sharedPlist
{
  return self->_sharedPlist;
}

- (void)setSharedPlist:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sharedPlist, 0);
  objc_storeStrong((id *)&self->_managedPlist, 0);
  objc_storeStrong((id *)&self->_purchasedPlist, 0);

  objc_storeStrong((id *)&self->_booksPlist, 0);
}

@end
@interface CKDMMCS
+ (id)MMCSWrapperForApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)_errorWithMMCSError:(id)a3 description:(id)a4 operationType:(int64_t)a5;
+ (id)_errorWithMMCSError:(id)a3 path:(id)a4 description:(id)a5 operationType:(int64_t)a6;
+ (id)_userInfoFromMMCSRetryableError:(id)a3;
+ (id)assetKeyWithType:(unint64_t)a3 error:(id *)a4;
+ (id)protocolHeaders;
+ (id)protocolVersion;
+ (id)referenceSignatureFromAssetKey:(id)a3;
+ (id)sharedWrappersByPath;
+ (id)zeroSizeFileSignature;
+ (int64_t)_commonErrorCodeWithMMCSError:(id)a3;
+ (int64_t)_errorCodeWithMMCSGetError:(id)a3;
+ (int64_t)_errorCodeWithMMCSPutError:(id)a3;
+ (int64_t)_errorCodeWithMMCSRegisterError:(id)a3;
+ (void)purgeMMCSDirectoryWithPath:(id)a3;
- (BOOL)_getRegisteredItemsGreaterThan:(unint64_t)a3 itemIds:(unint64_t *)a4 itemCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)didDrop;
- (BOOL)isTrackingItemID:(unint64_t)a3;
- (BOOL)registeredItemCount:(unint64_t *)a3 error:(id *)a4;
- (CKDAssetCache)assetCache;
- (CKDMMCS)initWithMMCSEngineContext:(id)a3 directoryContext:(id)a4;
- (CKDMMCSEngineContext)MMCSEngineContext;
- (NSURL)path;
- (NSURL)temporaryDirectory;
- (_mmcs_engine)getMMCSEngine;
- (id)CKStatusReportArray;
- (id)_contextToGetItemGroup:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 command:(id)a7 completionHandler:(id)a8;
- (id)_contextToGetSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)_contextToPutItemGroup:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)_contextToPutSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)_contextToRegisterItemGroup:(id)a3 operation:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)_referenceIdentifierFromAssetKey:(id)a3;
- (id)getItemGroupSet:(id)a3 operation:(id)a4 shouldFetchAssetContentInMemory:(BOOL)a5 options:(id)a6 progress:(id)a7 command:(id)a8 completionHandler:(id)a9;
- (id)getSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)putItemGroupSet:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)putSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)registerItemGroupSet:(id)a3 operation:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (id)registeredMMCSItemForRereferencedAsset:(id)a3;
- (id)retrieveChunkWithSignature:(id)a3;
- (int64_t)checkoutCount;
- (unsigned)getMaxChunkCountForSection;
- (void)_logMMCSOptions:(id)a3;
- (void)_unregisterItemIDs:(id)a3;
- (void)dealloc;
- (void)drop;
- (void)performOperationCleanup;
- (void)setAssetCache:(id)a3;
- (void)setCheckoutCount:(int64_t)a3;
- (void)setDidDrop:(BOOL)a3;
- (void)setMMCSEngineContext:(id)a3;
- (void)showRegisteredItemsInContainer:(id)a3;
- (void)startTrackingItemIDsForMMCSItems:(id)a3;
- (void)stopTrackingItemIDsForMMCSItems:(id)a3;
- (void)unregisterItemIDs:(id)a3;
@end

@implementation CKDMMCS

- (void)drop
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v4 = (os_log_t *)MEMORY[0x1E4F1A500];
  v5 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v18 = v5;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = objc_msgSend_checkoutCount(self, v19, v20);
    _os_log_debug_impl(&dword_1C4CFF000, v18, OS_LOG_TYPE_DEBUG, "%@ dropping with count %lld", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v8 = objc_msgSend_MMCSEngineContext(self, v6, v7);
  v11 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v9, v10);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = sub_1C4EC4DCC;
  v24 = &unk_1E64F4F40;
  v25 = self;
  v27 = buf;
  v28 = &v29;
  id v12 = v8;
  id v26 = v12;
  dispatch_sync(v11, &v21);

  v13 = self;
  objc_sync_enter(v13);
  if (*(unsigned char *)(*(void *)&buf[8] + 24) && (objc_msgSend_didDrop(v13, v14, v15, v21, v22, v23, v24, v25) & 1) == 0) {
    objc_msgSend_setDidDrop_(v13, v16, 1);
  }
  objc_sync_exit(v13);

  if (*(unsigned char *)(*(void *)&buf[8] + 24) && !*((unsigned char *)v30 + 24))
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v33 = 138412290;
      v34 = v13;
      _os_log_error_impl(&dword_1C4CFF000, v17, OS_LOG_TYPE_ERROR, "%@ actually dropping but did not tear down", v33, 0xCu);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);
}

+ (id)zeroSizeFileSignature
{
  if (qword_1EBBCFF00 != -1) {
    dispatch_once(&qword_1EBBCFF00, &unk_1F2043DB0);
  }
  v2 = (void *)qword_1EBBCFEF8;
  return v2;
}

+ (id)protocolVersion
{
  v3 = objc_msgSend_protocolHeaders(a1, a2, v2);
  v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"x-apple-mmcs-proto-version");

  return v5;
}

+ (id)protocolHeaders
{
  objc_msgSend__appID(CKDMMCSEngineContext, a2, v2);
  v3 = (void *)MMCSICloudRequestHeadersCopy();
  return v3;
}

+ (id)_userInfoFromMMCSRetryableError:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v6 = objc_msgSend_userInfo(v3, v4, v5);
  v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x1E4F73828]);

  v11 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], v9, v10);
  uint64_t v14 = objc_msgSend_defaultRetryAfter(v11, v12, v13);

  uint64_t v15 = *MEMORY[0x1E4F73820];
  v17 = objc_msgSend_objectForKeyedSubscript_(v8, v16, *MEMORY[0x1E4F73820]);
  uint64_t v20 = v17;
  if (v17)
  {
    uint64_t v14 = objc_msgSend_intValue(v17, v18, v19);
    if ((v14 - 0x7FFFFFFF) <= 0x80000001)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      uint64_t v21 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v29 = v20;
        __int16 v30 = 2114;
        uint64_t v31 = v15;
        __int16 v32 = 2112;
        id v33 = v3;
        _os_log_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_INFO, "Warn: Invalid value (%{public}@) for %{public}@ key in error %@", buf, 0x20u);
      }
    }
  }
  uint64_t v22 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v18, v14, *MEMORY[0x1E4F19C60]);
  v27 = v22;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)&v27, &v26, 1);

  return v24;
}

+ (int64_t)_commonErrorCodeWithMMCSError:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_code(v3, v4, v5);
  int64_t v9 = 0;
  if (v6 <= 22)
  {
    switch(v6)
    {
      case 3:
        goto LABEL_12;
      case 4:
        int64_t v9 = 1;
        break;
      case 7:
        uint64_t v10 = objc_msgSend_userInfo(v3, v7, v8);
        id v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x1E4F28A50]);

        if (v12)
        {
          uint64_t v15 = objc_msgSend_domain(v12, v13, v14);
          if (objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E4F73818]))
          {
            if (objc_msgSend_code(v12, v17, v18) == 11) {
              int64_t v9 = 3003;
            }
            else {
              int64_t v9 = 1013;
            }
          }
          else
          {
            int64_t v9 = 1013;
          }
        }
        else
        {
          int64_t v9 = 1013;
        }

        break;
      case 8:
        int64_t v9 = 2003;
        break;
      case 9:
        int64_t v9 = 3002;
        break;
      case 13:
        goto LABEL_11;
      case 15:
        int64_t v9 = 1003;
        break;
      default:
        goto LABEL_30;
    }
    goto LABEL_30;
  }
  if (v6 <= 32)
  {
    if (v6 != 23)
    {
      if (v6 == 25) {
LABEL_11:
      }
        int64_t v9 = 2000;
      goto LABEL_30;
    }
LABEL_12:
    int64_t v9 = 1013;
    goto LABEL_30;
  }
  if (v6 == 33) {
    goto LABEL_12;
  }
  if (v6 != 35)
  {
    if (v6 != 38) {
      goto LABEL_30;
    }
    goto LABEL_12;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v19 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v21 = 0;
    _os_log_fault_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_FAULT, "Programmer error starting MMCS request.", v21, 2u);
  }
  int64_t v9 = 2022;
LABEL_30:

  return v9;
}

+ (int64_t)_errorCodeWithMMCSGetError:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_code(v3, v4, v5);
  if (v6 > 28)
  {
    if (v6 > 38)
    {
      if (v6 == 39)
      {
        id v12 = objc_msgSend_userInfo(v3, v7, v8);
        uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, *MEMORY[0x1E4F28A50]);

        if (v14
          && (objc_msgSend_domain(v14, v15, v16),
              v17 = objc_claimAutoreleasedReturnValue(),
              int isEqualToString = objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E4F1D160]),
              v17,
              isEqualToString))
        {
          if (objc_msgSend_code(v14, v20, v21) == 69)
          {
            int64_t v11 = 3007;
          }
          else if (objc_msgSend_code(v14, v22, v23) == 28)
          {
            int64_t v11 = 3008;
          }
          else
          {
            int64_t v11 = 0;
          }
        }
        else
        {
          int64_t v11 = 0;
        }
      }
      else if (v6 == 48)
      {
        int64_t v11 = 3013;
      }
      else
      {
        int64_t v11 = 0;
      }
    }
    else if (v6 == 29 || v6 == 32)
    {
      int64_t v11 = 3006;
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v9 = 2000;
    uint64_t v10 = 3006;
    if (v6 != 28) {
      uint64_t v10 = 0;
    }
    if (v6 != 12) {
      uint64_t v9 = v10;
    }
    if ((unint64_t)(v6 - 20) >= 2) {
      int64_t v11 = v9;
    }
    else {
      int64_t v11 = 3006;
    }
  }

  return v11;
}

+ (int64_t)_errorCodeWithMMCSPutError:(id)a3
{
  uint64_t v3 = objc_msgSend_code(a3, a2, (uint64_t)a3);
  int64_t result = 0;
  if (v3 > 26)
  {
    switch(v3)
    {
      case 27:
        return 3006;
      case 28:
        return 3003;
      case 29:
        return 3006;
    }
  }
  else
  {
    switch(v3)
    {
      case 11:
      case 12:
        return 3003;
      case 13:
      case 14:
      case 15:
      case 16:
        return result;
      case 17:
        int64_t result = 2000;
        break;
      case 18:
        return 3006;
      default:
        if (v3 == 2) {
          return 3006;
        }
        if (v3 == 5) {
          int64_t result = 1013;
        }
        else {
          int64_t result = 0;
        }
        break;
    }
  }
  return result;
}

+ (int64_t)_errorCodeWithMMCSRegisterError:(id)a3
{
  uint64_t v3 = objc_msgSend_code(a3, a2, (uint64_t)a3);
  int64_t v4 = 3003;
  uint64_t v5 = 3006;
  if (v3 != 18) {
    uint64_t v5 = 0;
  }
  if (v3 != 28) {
    int64_t v4 = v5;
  }
  if (v3 == 29) {
    return 3006;
  }
  else {
    return v4;
  }
}

+ (id)_errorWithMMCSError:(id)a3 path:(id)a4 description:(id)a5 operationType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  uint64_t v16 = v13;
  uint64_t v17 = *MEMORY[0x1E4F73818];
  uint64_t v18 = (uint64_t *)MEMORY[0x1E4F19DD8];
  if (!v13)
  {
LABEL_8:
    v41 = objc_msgSend_domain(v16, v14, v15);
    int isEqualToString = objc_msgSend_isEqualToString_(v41, v42, v17);

    if (!isEqualToString)
    {
      v24 = 0;
      uint64_t v46 = 3001;
      goto LABEL_23;
    }
    uint64_t v45 = objc_msgSend__commonErrorCodeWithMMCSError_(a1, v44, (uint64_t)v16);
    if (v45)
    {
      uint64_t v46 = v45;
LABEL_22:
      v24 = 0;
      goto LABEL_23;
    }
    if ((unint64_t)a6 <= 6)
    {
      if (((1 << a6) & 0xA) != 0)
      {
        uint64_t v47 = objc_msgSend__errorCodeWithMMCSPutError_(a1, v44, (uint64_t)v16);
      }
      else if (((1 << a6) & 0x14) != 0)
      {
        uint64_t v47 = objc_msgSend__errorCodeWithMMCSGetError_(a1, v44, (uint64_t)v16);
      }
      else
      {
        if (((1 << a6) & 0x60) == 0) {
          goto LABEL_28;
        }
        uint64_t v47 = objc_msgSend__errorCodeWithMMCSRegisterError_(a1, v44, (uint64_t)v16);
      }
      uint64_t v46 = v47;
      if (v47) {
        goto LABEL_22;
      }
    }
LABEL_28:
    v24 = objc_msgSend__userInfoFromMMCSRetryableError_(a1, v44, (uint64_t)v16);
    uint64_t v46 = 2022;
LABEL_23:
    v48 = objc_msgSend_secureCodableError_(MEMORY[0x1E4F1A280], v44, (uint64_t)v16);
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(MEMORY[0x1E4F1A280], v49, *v18, v46, v24, v48, v11, 0, v12);

LABEL_24:
    goto LABEL_25;
  }
  int64_t v51 = a6;
  id v52 = a1;
  id v53 = v12;
  id v19 = v11;
  uint64_t v20 = *MEMORY[0x1E4F19C40];
  uint64_t v21 = *MEMORY[0x1E4F19DD8];
  uint64_t v22 = *MEMORY[0x1E4F28A50];
  uint64_t v23 = v13;
  while (1)
  {
    v24 = objc_msgSend_domain(v23, v14, v15);
    if (objc_msgSend_isEqualToString_(v24, v25, v20))
    {
      id v11 = v19;
      id v12 = v53;
      goto LABEL_24;
    }
    v28 = objc_msgSend_domain(v23, v26, v27);
    char v30 = objc_msgSend_isEqualToString_(v28, v29, v21);

    if (v30) {
      break;
    }
    id v33 = objc_msgSend_domain(v23, v31, v32);
    int v35 = objc_msgSend_isEqualToString_(v33, v34, v17);

    if (v35)
    {
      v38 = objc_msgSend_userInfo(v23, v36, v37);
      uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v38, v39, v22);

      uint64_t v23 = (void *)v40;
      if (v40) {
        continue;
      }
    }
    id v11 = v19;
    a1 = v52;
    id v12 = v53;
    uint64_t v18 = (uint64_t *)MEMORY[0x1E4F19DD8];
    a6 = v51;

    goto LABEL_8;
  }
  id v11 = v19;
  id v12 = v53;
LABEL_25:

  return v23;
}

+ (id)_errorWithMMCSError:(id)a3 description:(id)a4 operationType:(int64_t)a5
{
  return (id)objc_msgSend__errorWithMMCSError_path_description_operationType_(CKDMMCS, a2, (uint64_t)a3, 0, a4, a5);
}

+ (id)sharedWrappersByPath
{
  if (qword_1EBBCFF10 != -1) {
    dispatch_once(&qword_1EBBCFF10, &unk_1F2043DD0);
  }
  uint64_t v2 = (void *)qword_1EBBCFF08;
  return v2;
}

+ (void)purgeMMCSDirectoryWithPath:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v42 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v42, v43, (uint64_t)a2, a1, @"CKDMMCS.m", 413, @"Expected non-nil path: %@", 0);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
  isDirectory = objc_msgSend_initFileURLWithPath_isDirectory_(v8, v9, (uint64_t)v7, 1);
  id v46 = 0;
  uint64_t v11 = *MEMORY[0x1E4F1C628];
  id v45 = 0;
  int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(isDirectory, v12, (uint64_t)&v46, v11, &v45);
  id v14 = v46;
  id v17 = v45;
  if (ResourceValue_forKey_error) {
    BOOL v18 = v14 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18 && (objc_msgSend_BOOLValue(v14, v15, v16) & 1) != 0)
  {
    uint64_t v21 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v19, v20);
    id v44 = v17;
    char v23 = objc_msgSend_removeItemAtPath_error_(v21, v22, (uint64_t)v7, &v44);
    id v24 = v44;

    v25 = (void *)*MEMORY[0x1E4F1A548];
    if (v23)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v25);
      }
      uint64_t v26 = (void *)*MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      uint64_t v27 = v26;
      char v30 = objc_msgSend_CKSanitizedPath(v7, v28, v29);
      *(_DWORD *)buf = 138543362;
      v48 = v30;
      uint64_t v31 = "Removed dir at %{public}@";
      uint64_t v32 = v27;
      uint32_t v33 = 12;
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v25);
      }
      int v35 = (void *)*MEMORY[0x1E4F1A500];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      uint64_t v27 = v35;
      char v30 = objc_msgSend_CKSanitizedPath(v7, v36, v37);
      *(_DWORD *)buf = 138543618;
      v48 = v30;
      __int16 v49 = 2112;
      id v50 = v24;
      uint64_t v31 = "Warn: Failed to remove dir at %{public}@: %@";
      uint64_t v32 = v27;
      uint32_t v33 = 22;
    }
    _os_log_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_INFO, v31, buf, v33);

LABEL_23:
    goto LABEL_24;
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v34 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v38 = v34;
    v41 = objc_msgSend_CKSanitizedPath(v7, v39, v40);
    *(_DWORD *)buf = 138543874;
    v48 = v41;
    __int16 v49 = 2112;
    id v50 = v17;
    __int16 v51 = 2114;
    id v52 = v14;
    _os_log_debug_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_DEBUG, "Skipping remove dir at %{public}@: %@ %{public}@", buf, 0x20u);
  }
  id v24 = v17;
LABEL_24:
}

+ (id)MMCSWrapperForApplicationBundleID:(id)a3 directoryContext:(id)a4 database:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v15 = a5;
  if (!v11)
  {
    char v23 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, a1, @"CKDMMCS.m", 432, @"Expected non-nil application bundle ID");
  }
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1C4EC615C;
  v43 = sub_1C4EC616C;
  id v44 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = sub_1C4EC615C;
  uint64_t v37 = sub_1C4EC616C;
  id v38 = 0;
  uint64_t v16 = objc_msgSend_sharedContextsQueue(CKDMMCSEngineContext, v13, v14);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EC6174;
  block[3] = &unk_1E64F4F68;
  uint64_t v29 = &v33;
  id v17 = v12;
  id v26 = v17;
  char v30 = &v45;
  id v18 = v11;
  id v27 = v18;
  id v19 = v15;
  id v28 = v19;
  uint64_t v31 = &v39;
  id v32 = a1;
  dispatch_sync(v16, block);

  if (!*((unsigned char *)v46 + 24))
  {
    uint64_t v20 = (void *)v34[5];
    v34[5] = 0;

    if (a6) {
      *a6 = (id) v40[5];
    }
  }
  id v21 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v21;
}

+ (id)assetKeyWithType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 > 1)
  {
    id v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, a1, @"CKDMMCS.m", 504, @"Unsupported CKDMMCSAssetKeyType");
  }
  else
  {
    uint64_t v5 = (void *)MMCSReferenceObjectCreateWithType();
    if (v5) {
      goto LABEL_12;
    }
  }
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  id v10 = *MEMORY[0x1E4F1A528];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A528], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = 0;
    _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "MMCSReferenceObjectCreateWithType failed with error %@", buf, 0xCu);
    if (a4) {
      goto LABEL_9;
    }
  }
  else if (a4)
  {
LABEL_9:
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E4F1A280], v11, *MEMORY[0x1E4F19DD8], 5003, 0, @"MMCSReferenceObjectCreateWithType failed");
    uint64_t v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  uint64_t v5 = 0;
LABEL_12:
  return v5;
}

+ (id)referenceSignatureFromAssetKey:(id)a3
{
  if (a3)
  {
    int64_t v4 = (void *)MMCSReferenceSignatureCreateWithReferenceObject();
    if (!v4) {
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = 0;
  }
  return v4;
}

- (CKDMMCS)initWithMMCSEngineContext:(id)a3 directoryContext:(id)a4
{
  id v8 = a3;
  id v11 = a4;
  if (!v8)
  {
    v25 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v25, v26, (uint64_t)a2, self, @"CKDMMCS.m", 529, @"Expected non-nil MMCS engine context");
  }
  v27.receiver = self;
  v27.super_class = (Class)CKDMMCS;
  id v12 = [(CKDMMCS *)&v27 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_MMCSEngineContext, a3);
    uint64_t v16 = objc_msgSend_mmcsWorkingDirectory(v11, v14, v15);
    path = v13->_path;
    v13->_path = (NSURL *)v16;

    uint64_t v20 = objc_msgSend_temporaryDirectory(v11, v18, v19);
    temporaryDirectory = v13->_temporaryDirectory;
    v13->_temporaryDirectory = (NSURL *)v20;

    uint64_t v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    trackedItemIDs = v13->_trackedItemIDs;
    v13->_trackedItemIDs = v22;
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v3 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v2;
      _os_log_error_impl(&dword_1C4CFF000, v3, OS_LOG_TYPE_ERROR, "Failed to drop %@", buf, 0xCu);
    }
    if (!v2->_didDrop) {
      __assert_rtn("-[CKDMMCS dealloc]", "CKDMMCS.m", 543, "_didDrop && \"Failed to drop CKDMMCS dealloc\"");
    }
  }
  objc_sync_exit(v2);

  v4.receiver = v2;
  v4.super_class = (Class)CKDMMCS;
  [(CKDMMCS *)&v4 dealloc];
}

- (_mmcs_engine)getMMCSEngine
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v20 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v21 = v20;
      uint64_t v22 = NSStringFromSelector(a2);
      int v23 = 138412546;
      id v24 = self;
      __int16 v25 = 2114;
      id v26 = v22;
      _os_log_error_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v23, 0x16u);
    }
    __assert_rtn("-[CKDMMCS getMMCSEngine]", "CKDMMCS.m", 551, "0 && \"already dropped\"");
  }
  uint64_t v5 = objc_msgSend_MMCSEngineContext(self, a2, v2);

  if (!v5)
  {
    id v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CKDMMCS.m", 552, @"Expected non-nil MMCS engine context");
  }
  id v8 = objc_msgSend_MMCSEngineContext(self, v6, v7);
  objc_msgSend_assertMMCSSerialized(v8, v9, v10);

  id v13 = objc_msgSend_MMCSEngineContext(self, v11, v12);
  uint64_t v16 = (_mmcs_engine *)objc_msgSend_MMCSEngine(v13, v14, v15);

  return v16;
}

- (unsigned)getMaxChunkCountForSection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v15;
      id v17 = NSStringFromSelector(a2);
      int v18 = 138412546;
      uint64_t v19 = self;
      __int16 v20 = 2114;
      id v21 = v17;
      _os_log_error_impl(&dword_1C4CFF000, v16, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v18, 0x16u);
    }
    __assert_rtn("-[CKDMMCS getMaxChunkCountForSection]", "CKDMMCS.m", 559, "0 && \"already dropped\"");
  }
  uint64_t v5 = objc_msgSend_MMCSEngineContext(self, a2, v2);

  if (!v5)
  {
    id v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CKDMMCS.m", 560, @"Expected non-nil MMCS engine context");
  }
  id v8 = objc_msgSend_MMCSEngineContext(self, v6, v7);
  unsigned int v11 = objc_msgSend_maxChunkCountForSection(v8, v9, v10);

  return v11;
}

- (id)_referenceIdentifierFromAssetKey:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v19 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = v19;
      id v21 = NSStringFromSelector(a2);
      int v22 = 138412546;
      int v23 = self;
      __int16 v24 = 2114;
      *(void *)__int16 v25 = v21;
      _os_log_error_impl(&dword_1C4CFF000, v20, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v22, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _referenceIdentifierFromAssetKey:]", "CKDMMCS.m", 566, "0 && \"already dropped\"");
  }
  id v8 = v5;
  if (v5)
  {
    *(_DWORD *)&v25[2] = 0;
    uint64_t v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, 0, 0, *(void *)&v25[2], v26);
    CC_LONG v12 = objc_msgSend_length(v8, v10, v11);
    CC_SHA1(v9, v12, (unsigned __int8 *)&v22);
    uint64_t v14 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v13, (uint64_t)&v22, 20);
    objc_msgSend_CKLowercaseHexStringWithoutSpaces(v14, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_logMMCSOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v10 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v10;
      CC_LONG v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v12;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _logMMCSOptions:]", "CKDMMCS.m", 584, "0 && \"already dropped\"");
  }
  uint64_t v7 = v5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4EC73D4;
  v13[3] = &unk_1E64F4FB8;
  v13[4] = self;
  objc_msgSend_CKMapKeysAndValues_(v5, v6, (uint64_t)v13);
  id v8 = (CKDMMCS *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v9 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1C4CFF000, v9, OS_LOG_TYPE_INFO, "Using MMCS options: %{public}@", buf, 0xCu);
  }
}

- (void)performOperationCleanup
{
  objc_super v4 = objc_msgSend_MMCSEngineContext(self, a2, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4EC7800;
  v6[3] = &unk_1E64F05C8;
  v6[4] = self;
  objc_msgSend_MMCSSerializeSyncRecursive_(v4, v5, (uint64_t)v6);
}

- (id)_contextToRegisterItemGroup:(id)a3 operation:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v39 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v39;
      uint64_t v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v41;
      _os_log_error_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _contextToRegisterItemGroup:operation:options:completionHandler:]", "CKDMMCS.m", 964, "0 && \"already dropped\"");
  }
  __int16 v16 = v13;
  id v17 = objc_msgSend_operationID(v12, v14, v15);
  __int16 v20 = objc_msgSend_container(v12, v18, v19);
  int v23 = objc_msgSend_containerID(v20, v21, v22);
  uint64_t v26 = objc_msgSend_containerIdentifier(v23, v24, v25);

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v54 = 0;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  id v44 = sub_1C4EC7B60;
  uint64_t v45 = &unk_1E64F5030;
  unint64_t v51 = a5;
  id v27 = v11;
  id v46 = v27;
  BOOL v52 = (a5 & 4) != 0;
  id v28 = v17;
  id v47 = v28;
  id v50 = buf;
  id v29 = v26;
  id v48 = v29;
  __int16 v49 = self;
  char v30 = _Block_copy(&aBlock);
  uint64_t v31 = [CKDMMCSItemGroupContext alloc];
  started = objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v31, v32, (uint64_t)self, v27, v12, 0, 0, v30, v16, aBlock, v43, v44, v45);
  uint64_t v34 = [CKDRegisterOperationInfo alloc];
  char v36 = objc_msgSend_initWithOptions_(v34, v35, a5);
  objc_msgSend_setOperationInfo_(started, v37, (uint64_t)v36);

  _Block_object_dispose(buf, 8);
  return started;
}

- (id)registerItemGroupSet:(id)a3 operation:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v38 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = v38;
      uint64_t v40 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v49 = self;
      __int16 v50 = 2114;
      unint64_t v51 = v40;
      _os_log_error_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS registerItemGroupSet:operation:options:completionHandler:]", "CKDMMCS.m", 1055, "0 && \"already dropped\"");
  }
  id v14 = v13;
  uint64_t v15 = [CKDMMCSItemGroupSetContext alloc];
  uint64_t v41 = v14;
  id v17 = objc_msgSend_initWithItemGroupSet_itemGroupSetCompletionBlock_(v15, v16, (uint64_t)v11, v14);
  uint64_t v19 = v17;
  if ((a5 & 0x42) != 0) {
    objc_msgSend_setMmcsOperationType_(v17, v18, 6);
  }
  else {
    objc_msgSend_setMmcsOperationType_(v17, v18, 5);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v42 = v11;
  uint64_t v22 = objc_msgSend_allItemGroups(v11, v20, v21);
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, v47, 16);
  if (v24)
  {
    uint64_t v27 = v24;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v22);
        }
        uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v31 = objc_msgSend_itemGroupCompletionBlock(v19, v25, v26);
        uint64_t v33 = objc_msgSend__contextToRegisterItemGroup_operation_options_completionHandler_(self, v32, v30, v12, a5, v31);

        objc_msgSend_addItemGroupContext_(v19, v34, (uint64_t)v33);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, v47, 16);
    }
    while (v27);
  }

  objc_msgSend_start(v19, v35, v36);
  return v19;
}

- (id)_contextToGetItemGroup:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 command:(id)a7 completionHandler:(id)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v44 = a6;
  id v17 = a7;
  id v18 = a8;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v41 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v42 = v41;
      long long v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      char v54 = self;
      __int16 v55 = 2114;
      v56 = v43;
      _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _contextToGetItemGroup:operation:options:progress:command:completionHandler:]", "CKDMMCS.m", 1080, "0 && \"already dropped\"");
  }
  uint64_t v21 = v18;
  uint64_t v22 = objc_msgSend_operationID(v15, v19, v20);
  uint64_t v25 = objc_msgSend_container(v15, v23, v24);
  uint64_t v28 = objc_msgSend_containerID(v25, v26, v27);
  uint64_t v31 = objc_msgSend_containerIdentifier(v28, v29, v30);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4EC89FC;
  aBlock[3] = &unk_1E64F5058;
  id v47 = v14;
  id v48 = v22;
  id v49 = v16;
  __int16 v50 = self;
  id v51 = v31;
  SEL v52 = a2;
  id v32 = v31;
  id v33 = v16;
  id v34 = v22;
  id v35 = v14;
  uint64_t v36 = _Block_copy(aBlock);
  uint64_t v37 = [CKDMMCSItemGroupContext alloc];
  started = objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v37, v38, (uint64_t)self, v35, v15, v44, v17, v36, v21);

  return started;
}

- (id)getItemGroupSet:(id)a3 operation:(id)a4 shouldFetchAssetContentInMemory:(BOOL)a5 options:(id)a6 progress:(id)a7 command:(id)a8 completionHandler:(id)a9
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v15 = (CKDMMCS *)a3;
  id v16 = a4;
  id v17 = a6;
  id v65 = a7;
  id v69 = a8;
  id v18 = a9;
  v68 = self;
  uint64_t v19 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v20 = *MEMORY[0x1E4F1A550];
  if (self->_didDrop)
  {
    if (v20 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v19);
    }
    v60 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      v62 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v76 = self;
      __int16 v77 = 2114;
      v78 = v62;
      _os_log_error_impl(&dword_1C4CFF000, v61, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS getItemGroupSet:operation:shouldFetchAssetContentInMemory:options:progress:command:completionHandler:]", "CKDMMCS.m", 1208, "0 && \"already dropped\"");
  }
  id v21 = v18;
  if (v20 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v19);
  }
  uint64_t v22 = v65;
  int v23 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v56 = v23;
    v59 = objc_msgSend_operationID(v16, v57, v58);
    *(_DWORD *)buf = 138412802;
    v76 = v15;
    __int16 v77 = 2114;
    v78 = v59;
    __int16 v79 = 2112;
    id v80 = v17;
    _os_log_debug_impl(&dword_1C4CFF000, v56, OS_LOG_TYPE_DEBUG, "Getting MMCS item group set %@ for operationID:%{public}@ with options %@", buf, 0x20u);
  }
  uint64_t v24 = [CKDMMCSItemGroupSetContext alloc];
  v63 = v21;
  uint64_t v26 = objc_msgSend_initWithItemGroupSet_itemGroupSetCompletionBlock_(v24, v25, (uint64_t)v15, v21);
  objc_msgSend_setMmcsOperationType_(v26, v27, 2);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v64 = v15;
  objc_msgSend_allItemGroups(v15, v28, v29);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v70, v74, 16);
  if (v31)
  {
    uint64_t v34 = v31;
    uint64_t v35 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v71 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        id v38 = objc_msgSend_itemGroupCompletionBlock(v26, v32, v33);
        uint64_t v40 = objc_msgSend__contextToGetItemGroup_operation_options_progress_command_completionHandler_(v68, v39, v37, v16, v17, v22, v69, v38);

        long long v43 = objc_alloc_init(CKDMMCSGetOperationInfo);
        if (a5)
        {
          objc_msgSend_setDestination_(v43, v41, 1);
        }
        else
        {
          long long v45 = objc_msgSend_operationInfo(v16, v41, v42);
          id v48 = v17;
          int v49 = objc_msgSend_usesAssetDownloadStagingManager(v45, v46, v47);

          BOOL v51 = v49 == 0;
          id v17 = v48;
          uint64_t v22 = v65;
          if (v51) {
            objc_msgSend_setDestination_(v43, v50, 0);
          }
          else {
            objc_msgSend_setDestination_(v43, v50, 2);
          }
        }
        objc_msgSend_setOperationInfo_(v40, v44, (uint64_t)v43);
        objc_msgSend_addItemGroupContext_(v26, v52, (uint64_t)v40);
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v32, (uint64_t)&v70, v74, 16);
    }
    while (v34);
  }

  objc_msgSend_start(v26, v53, v54);
  return v26;
}

- (id)_contextToPutItemGroup:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v39 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = v39;
      uint64_t v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      BOOL v51 = self;
      __int16 v52 = 2114;
      uint64_t v53 = v41;
      _os_log_error_impl(&dword_1C4CFF000, v40, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _contextToPutItemGroup:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1237, "0 && \"already dropped\"");
  }
  uint64_t v19 = v16;
  uint64_t v20 = objc_msgSend_operationID(v13, v17, v18);
  int v23 = objc_msgSend_container(v13, v21, v22);
  uint64_t v26 = objc_msgSend_containerID(v23, v24, v25);
  uint64_t v29 = objc_msgSend_containerIdentifier(v26, v27, v28);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4EC9B18;
  aBlock[3] = &unk_1E64F5058;
  id v44 = v12;
  id v45 = v20;
  id v46 = v14;
  uint64_t v47 = self;
  id v48 = v29;
  SEL v49 = a2;
  id v30 = v29;
  id v31 = v14;
  id v32 = v20;
  id v33 = v12;
  uint64_t v34 = _Block_copy(aBlock);
  uint64_t v35 = [CKDMMCSItemGroupContext alloc];
  started = objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v35, v36, (uint64_t)self, v33, v13, v15, 0, v34, v19);

  return started;
}

- (id)putItemGroupSet:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = (CKDMMCS *)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v53 = self;
  uint64_t v18 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v19 = *MEMORY[0x1E4F1A550];
  if (self->_didDrop)
  {
    if (v19 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v18);
    }
    id v48 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      SEL v49 = v48;
      __int16 v50 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v50;
      _os_log_error_impl(&dword_1C4CFF000, v49, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS putItemGroupSet:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1342, "0 && \"already dropped\"");
  }
  id v20 = v17;
  if (v19 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v18);
  }
  id v21 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v44 = v21;
    uint64_t v47 = objc_msgSend_operationID(v14, v45, v46);
    *(_DWORD *)buf = 138412802;
    v60 = v13;
    __int16 v61 = 2114;
    v62 = v47;
    __int16 v63 = 2112;
    id v64 = v15;
    _os_log_debug_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_DEBUG, "Putting MMCS item group set %@ for operationID:%{public}@ with options %@", buf, 0x20u);
  }
  uint64_t v22 = [CKDMMCSItemGroupSetContext alloc];
  BOOL v51 = v20;
  uint64_t v24 = objc_msgSend_initWithItemGroupSet_itemGroupSetCompletionBlock_(v22, v23, (uint64_t)v13, v20);
  objc_msgSend_setMmcsOperationType_(v24, v25, 1);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  __int16 v52 = v13;
  uint64_t v28 = objc_msgSend_allItemGroups(v13, v26, v27);
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v54, v58, 16);
  if (v30)
  {
    uint64_t v33 = v30;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v28);
        }
        uint64_t v36 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v37 = objc_msgSend_itemGroupCompletionBlock(v24, v31, v32);
        uint64_t v39 = objc_msgSend__contextToPutItemGroup_operation_options_progress_completionHandler_(v53, v38, v36, v14, v15, v16, v37);

        objc_msgSend_addItemGroupContext_(v24, v40, (uint64_t)v39);
      }
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v54, v58, 16);
    }
    while (v33);
  }

  objc_msgSend_start(v24, v41, v42);
  return v24;
}

- (id)retrieveChunkWithSignature:(id)a3
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v7 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v45 = self;
    __int16 v46 = 2112;
    id v47 = v4;
    _os_log_debug_impl(&dword_1C4CFF000, v7, OS_LOG_TYPE_DEBUG, "[%@ retrieveChunkWithSignature:%@] starting", buf, 0x16u);
  }
  id v8 = [C3DownloadChunkContext alloc];
  uint64_t v10 = objc_msgSend_initWithMMCS_(v8, v9, (uint64_t)self);
  v52[0] = v4;
  id v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v52, 1);
  id v13 = objc_opt_new();
  id v16 = objc_msgSend_MMCSEngineContext(self, v14, v15);
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  id v38 = sub_1C4ECAA60;
  uint64_t v39 = &unk_1E64F0DF0;
  uint64_t v40 = self;
  id v17 = v10;
  id v41 = v17;
  id v18 = v13;
  id v42 = v18;
  id v19 = v12;
  id v43 = v19;
  objc_msgSend_MMCSSerializeSyncRecursive_(v16, v20, (uint64_t)&v36);

  int v23 = objc_msgSend_signatureToMutableData(v17, v21, v22, v36, v37, v38, v39, v40);
  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v4);

  if (*v5 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  os_log_t v26 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v26;
    uint64_t v35 = objc_msgSend_signatureToMutableData(v17, v33, v34);
    *(_DWORD *)buf = 138413058;
    id v45 = self;
    __int16 v46 = 2112;
    id v47 = v4;
    __int16 v48 = 2112;
    SEL v49 = v25;
    __int16 v50 = 2112;
    BOOL v51 = v35;
    _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "[%@ retrieveChunkWithSignature:%@] found %@ with %@", buf, 0x2Au);
  }
  if (objc_msgSend_length(v25, v27, v28)) {
    uint64_t v29 = v25;
  }
  else {
    uint64_t v29 = 0;
  }
  id v30 = v29;

  return v30;
}

- (id)registeredMMCSItemForRereferencedAsset:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1C4EC615C;
  id v19 = sub_1C4EC616C;
  id v20 = 0;
  uint64_t v7 = objc_msgSend_MMCSEngineContext(self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4ECAE04;
  v12[3] = &unk_1E64F30F0;
  id v14 = &v15;
  v12[4] = self;
  id v8 = v4;
  id v13 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v7, v9, (uint64_t)v12);

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)CKStatusReportArray
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    id v10 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v11 = v10;
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_error_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS CKStatusReportArray]", "CKDMMCS.m", 1389, "0 && \"already dropped\"");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v16 = sub_1C4EC615C;
  uint64_t v17 = sub_1C4EC616C;
  id v18 = @"Empty MMCS Status";
  id v4 = objc_msgSend_MMCSEngineContext(self, a2, v2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C4ECB168;
  v13[3] = &unk_1E64F1BC0;
  v13[4] = self;
  void v13[5] = buf;
  objc_msgSend_MMCSSerializeSyncRecursive_(v4, v5, (uint64_t)v13);

  uint64_t v14 = *(void *)(*(void *)&buf[8] + 40);
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)&v14, 1);
  _Block_object_dispose(buf, 8);

  return v7;
}

- (BOOL)_getRegisteredItemsGreaterThan:(unint64_t)a3 itemIds:(unint64_t *)a4 itemCount:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v9 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      id v11 = NSStringFromSelector(a2);
      v12[0] = 138412546;
      *(void *)&v12[1] = self;
      __int16 v13 = 2114;
      uint64_t v14 = v11;
      _os_log_error_impl(&dword_1C4CFF000, v10, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)v12, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _getRegisteredItemsGreaterThan:itemIds:itemCount:error:]", "CKDMMCS.m", 1398, "0 && \"already dropped\"");
  }
  objc_msgSend_getMMCSEngine(self, a2, a3);
  return MMCSGetRegisteredItems() != 0;
}

- (BOOL)registeredItemCount:(unint64_t *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v13 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = v13;
      uint64_t v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_error_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS registeredItemCount:error:]", "CKDMMCS.m", 1414, "0 && \"already dropped\"");
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v22 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v7 = objc_msgSend_MMCSEngineContext(self, a2, (uint64_t)a3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4ECB594;
  v16[3] = &unk_1E64F50A8;
  v16[4] = self;
  v16[5] = buf;
  v16[6] = &v17;
  v16[7] = a3;
  objc_msgSend_MMCSSerializeSyncRecursive_(v7, v8, (uint64_t)v16);

  uint64_t v9 = (void *)v18[3];
  if (v9)
  {
    if (a4)
    {
      *a4 = v9;
    }
    else
    {
      CFRelease(v9);
      v18[3] = 0;
    }
  }
  char v10 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(buf, 8);
  return v10;
}

- (void)showRegisteredItemsInContainer:(id)a3
{
  v89[2] = *(id *)MEMORY[0x1E4F143B8];
  id v59 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    long long v54 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      long long v55 = v54;
      long long v56 = NSStringFromSelector(a2);
      *(_DWORD *)v86 = 138412546;
      *(void *)&v86[4] = self;
      *(_WORD *)&v86[12] = 2114;
      *(void *)&v86[14] = v56;
      _os_log_error_impl(&dword_1C4CFF000, v55, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", v86, 0x16u);
    }
    __assert_rtn("-[CKDMMCS showRegisteredItemsInContainer:]", "CKDMMCS.m", 1432, "0 && \"already dropped\"");
  }
  id obj = 0;
  unint64_t v77 = 0;
  *(void *)v86 = 0;
  *(void *)&v86[8] = v86;
  *(void *)&v86[16] = 0x3032000000;
  v87 = sub_1C4EC615C;
  v88 = sub_1C4EC616C;
  v89[0] = 0;
  char v6 = objc_msgSend_registeredItemCount_error_(self, v5, (uint64_t)&v77, &obj);
  objc_storeStrong(v89, obj);
  uint64_t v7 = (void *)*MEMORY[0x1E4F1A548];
  if (v6)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    id v8 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v83) = 134217984;
      *(void *)((char *)&v83 + 4) = v77;
      _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "MMCS has %llu registered items.", (uint8_t *)&v83, 0xCu);
    }
    unint64_t v9 = v77;
    if (v77 <= 0x64) {
      unint64_t v9 = 100;
    }
    *(void *)&long long v83 = 0;
    *((void *)&v83 + 1) = &v83;
    if (v9 >= 0x3E8) {
      uint64_t v10 = 1000;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v84 = 0x2020000000;
    uint64_t v85 = 0;
    __int16 v13 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    unint64_t v14 = 0;
    uint64_t v72 = 0;
    long long v73 = &v72;
    uint64_t v74 = 0x2020000000;
    char v75 = 0;
    uint64_t v15 = *((void *)&v83 + 1);
    *(void *)&long long v16 = 134218240;
    long long v58 = v16;
    uint64_t v60 = v10;
    while (1)
    {
      *(void *)(v15 + 24) = v10;
      uint64_t v17 = objc_msgSend_MMCSEngineContext(self, v11, v12, v58);
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = sub_1C4ECBE78;
      v71[3] = &unk_1E64F50D0;
      v71[4] = self;
      v71[5] = &v72;
      v71[8] = v14;
      v71[9] = v13;
      v71[6] = &v83;
      v71[7] = v86;
      objc_msgSend_MMCSSerializeSyncRecursive_(v17, v18, (uint64_t)v71);

      if (!*((unsigned char *)v73 + 24)) {
        break;
      }
      if (*(void *)(*((void *)&v83 + 1) + 24))
      {
        uint64_t v19 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12);
        if (*(int *)(*((void *)&v83 + 1) + 24) >= 1)
        {
          uint64_t v20 = 0;
          while (1)
          {
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            id v21 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              unint64_t v26 = v13[v20];
              *(_DWORD *)buf = 134217984;
              unint64_t v80 = v26;
              _os_log_debug_impl(&dword_1C4CFF000, v21, OS_LOG_TYPE_DEBUG, "MMCS itemID %llu registered.", buf, 0xCu);
            }
            unint64_t v22 = v13[v20];
            if (v14 >= v22) {
              break;
            }
            uint64_t v23 = objc_alloc_init(CKDMMCSItem);
            objc_msgSend_setItemID_(v23, v24, v13[v20]);
            objc_msgSend_addObject_(v19, v25, (uint64_t)v23);

            ++v20;
            unint64_t v14 = v22;
            if (v20 >= *(int *)(*((void *)&v83 + 1) + 24)) {
              goto LABEL_29;
            }
          }
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          uint64_t v27 = *MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v50 = v13[v20];
            *(_DWORD *)buf = v58;
            unint64_t v80 = v14;
            __int16 v81 = 2048;
            uint64_t v82 = v50;
            _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "Expected registered item IDs to be ordered ascending: Previous itemId %llu is not less than %llu.", buf, 0x16u);
          }
        }
        unint64_t v22 = v14;
LABEL_29:
        uint64_t v28 = [CKDMMCSItemGroupSet alloc];
        id v64 = objc_msgSend_initWithItems_(v28, v29, (uint64_t)v19);
        id v30 = [CKDOperation alloc];
        id v31 = objc_opt_new();
        __int16 v63 = objc_msgSend_initWithOperationInfo_container_(v30, v32, (uint64_t)v31, v59);

        dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = sub_1C4ECBEEC;
        v69[3] = &unk_1E64F50F8;
        uint64_t v34 = v33;
        long long v70 = v34;
        v62 = objc_msgSend_registerItemGroupSet_operation_options_completionHandler_(self, v35, (uint64_t)v64, v63, 4, v69);
        __int16 v61 = v34;
        dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v38 = objc_msgSend_allItemGroups(v64, v36, v37);
        uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v65, v78, 16);
        if (v42)
        {
          uint64_t v43 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v66 != v43) {
                objc_enumerationMutation(v38);
              }
              id v45 = objc_msgSend_items(*(void **)(*((void *)&v65 + 1) + 8 * i), v40, v41);
              __int16 v48 = objc_msgSend_assetCache(self, v46, v47);
              objc_msgSend_checkAssetHandlesForRegisteredMMCSItems_(v48, v49, (uint64_t)v45);
            }
            uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v65, v78, 16);
          }
          while (v42);
        }

        unint64_t v14 = v22;
      }
      uint64_t v10 = v60;
      uint64_t v15 = *((void *)&v83 + 1);
      if (*(void *)(*((void *)&v83 + 1) + 24) != v60) {
        goto LABEL_47;
      }
    }
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v53 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      unint64_t v57 = *(void *)(*(void *)&v86[8] + 40);
      *(_DWORD *)buf = 138412290;
      unint64_t v80 = v57;
      _os_log_error_impl(&dword_1C4CFF000, v53, OS_LOG_TYPE_ERROR, "Error enumerating registered items %@", buf, 0xCu);
    }
LABEL_47:
    free(v13);
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(&v83, 8);
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v7);
    }
    BOOL v51 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = *(void *)(*(void *)&v86[8] + 40);
      LODWORD(v83) = 138412290;
      *(void *)((char *)&v83 + 4) = v52;
      _os_log_debug_impl(&dword_1C4CFF000, v51, OS_LOG_TYPE_DEBUG, "Error counting registered items %@", (uint8_t *)&v83, 0xCu);
    }
  }
  _Block_object_dispose(v86, 8);
}

- (void)_unregisterItemIDs:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_didDrop)
  {
    uint64_t v36 = self;
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v37 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      id v38 = v37;
      uint64_t v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v50 = v36;
      __int16 v51 = 2114;
      uint64_t v52 = v39;
      _os_log_error_impl(&dword_1C4CFF000, v38, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _unregisterItemIDs:]", "CKDMMCS.m", 1493, "0 && \"already dropped\"");
  }
  id v8 = v5;
  size_t v9 = objc_msgSend_count(v5, v6, v7);
  if (v9)
  {
    size_t v10 = v9;
    uint64_t v40 = self;
    uint64_t v43 = malloc_type_calloc(8uLL, v9, 0xFD49D4EBuLL);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v41 = v8;
    id obj = v8;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v44, v48, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      int v16 = 0;
      uint64_t v17 = *(void *)v45;
      id v18 = (void **)MEMORY[0x1E4F1A548];
      uint64_t v19 = (dispatch_once_t *)MEMORY[0x1E4F1A550];
      uint64_t v20 = (os_log_t *)MEMORY[0x1E4F1A500];
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = objc_msgSend_unsignedLongLongValue(*(void **)(*((void *)&v44 + 1) + 8 * v21), v13, v14, v40);
          uint64_t v23 = *v18;
          dispatch_once_t v24 = *v19;
          if (v22)
          {
            uint64_t v25 = v22;
            if (v24 != -1) {
              dispatch_once(v19, v23);
            }
            unint64_t v26 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v50 = (CKDMMCS *)v25;
              _os_log_debug_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_DEBUG, "Unregistering itemID=%llu with MMCS", buf, 0xCu);
            }
            v43[v16++] = v25;
          }
          else
          {
            if (v24 != -1) {
              dispatch_once(v19, v23);
            }
            uint64_t v27 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C4CFF000, v27, OS_LOG_TYPE_ERROR, "_unregisterItemIDs Zero itemID", buf, 2u);
            }
            --v10;
          }
          ++v21;
        }
        while (v15 != v21);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v44, v48, 16);
      }
      while (v15);
    }

    objc_msgSend_getMMCSEngine(v40, v28, v29);
    if (HIDWORD(v10))
    {
      uint64_t v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v30, v31);
      uint64_t v34 = objc_msgSend_stringWithUTF8String_(NSString, v33, (uint64_t)"uint32_t CKDownsizeOrDie(NSUInteger)");
      objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v32, v35, (uint64_t)v34, @"CloudKit-Prefix.pch", 34, @"That number was ridiculous");
    }
    MMCSUnregisterFiles();
    free(v43);
    id v8 = v41;
  }
}

- (void)unregisterItemIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v12 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = v12;
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v18 = self;
      __int16 v19 = 2114;
      uint64_t v20 = v14;
      _os_log_error_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS unregisterItemIDs:]", "CKDMMCS.m", 1515, "0 && \"already dropped\"");
  }
  id v8 = v5;
  size_t v9 = objc_msgSend_MMCSEngineContext(self, v6, v7);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C4ECC458;
  v15[3] = &unk_1E64F0948;
  v15[4] = self;
  id v16 = v8;
  id v10 = v8;
  objc_msgSend_MMCSSerializeSyncRecursive_(v9, v11, (uint64_t)v15);
}

- (id)_contextToPutSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v57 = a6;
  id v56 = a7;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v51 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = v51;
      uint64_t v53 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v71 = self;
      __int16 v72 = 2114;
      long long v73 = v53;
      _os_log_error_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _contextToPutSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1526, "0 && \"already dropped\"");
  }
  id v18 = objc_msgSend_operationID(v14, v16, v17);
  uint64_t v21 = objc_msgSend_container(v14, v19, v20);
  dispatch_once_t v24 = objc_msgSend_containerID(v21, v22, v23);
  uint64_t v27 = objc_msgSend_containerIdentifier(v24, v25, v26);

  if (v27) {
    uint64_t v28 = (__CFString *)v27;
  }
  else {
    uint64_t v28 = &stru_1F2044F30;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4ECC820;
  aBlock[3] = &unk_1E64F5058;
  id v29 = v13;
  SEL v68 = a2;
  id v63 = v29;
  id v64 = self;
  long long v55 = self;
  id v54 = v15;
  id v65 = v54;
  id v30 = v28;
  long long v66 = v30;
  id v31 = v18;
  id v67 = v31;
  uint64_t v32 = _Block_copy(aBlock);
  dispatch_semaphore_t v33 = [CKDMMCSItemGroup alloc];
  uint64_t v35 = objc_msgSend_tupleForItem_(CKDMMCSItemGroup, v34, (uint64_t)v29);
  uint64_t v37 = objc_msgSend_initWithTuple_(v33, v36, (uint64_t)v35);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v40 = objc_msgSend_sectionItems(v29, v38, v39);
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v58, v69, 16);
  if (v42)
  {
    uint64_t v44 = v42;
    uint64_t v45 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v59 != v45) {
          objc_enumerationMutation(v40);
        }
        objc_msgSend_addItem_(v37, v43, *(void *)(*((void *)&v58 + 1) + 8 * i));
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v58, v69, 16);
    }
    while (v44);
  }

  long long v47 = [CKDMMCSItemGroupContext alloc];
  started = objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v47, v48, (uint64_t)v55, v37, v14, v57, 0, v32, v56);

  return started;
}

- (id)putSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = (CKDMMCS *)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v19 = *MEMORY[0x1E4F1A550];
  if (self->_didDrop)
  {
    if (v19 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v18);
    }
    uint64_t v36 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = v36;
      id v38 = NSStringFromSelector(a2);
      int v39 = 138412546;
      uint64_t v40 = self;
      __int16 v41 = 2114;
      uint64_t v42 = v38;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v39, 0x16u);
    }
    __assert_rtn("-[CKDMMCS putSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1617, "0 && \"already dropped\"");
  }
  uint64_t v20 = v17;
  if (v19 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v18);
  }
  uint64_t v21 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v21;
    uint64_t v35 = objc_msgSend_operationID(v14, v33, v34);
    int v39 = 138412802;
    uint64_t v40 = v13;
    __int16 v41 = 2114;
    uint64_t v42 = v35;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Putting MMCS section item %@ for operationID:%{public}@ with options %@", (uint8_t *)&v39, 0x20u);
  }
  uint64_t v23 = objc_msgSend__contextToPutSectionItem_operation_options_progress_completionHandler_(self, v22, (uint64_t)v13, v14, v15, v16, v20);
  objc_msgSend_setMmcsOperationType_(v23, v24, 3);
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v14, v25, v26);
  objc_msgSend_setShouldCloneFileInAssetCache_(v23, v28, shouldCloneFileInAssetCache);
  objc_msgSend_start(v23, v29, v30);

  return v23;
}

- (id)_contextToGetSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v57 = a6;
  id v56 = a7;
  if (self->_didDrop)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    __int16 v51 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v52 = v51;
      uint64_t v53 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      long long v71 = self;
      __int16 v72 = 2114;
      long long v73 = v53;
      _os_log_error_impl(&dword_1C4CFF000, v52, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", buf, 0x16u);
    }
    __assert_rtn("-[CKDMMCS _contextToGetSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1632, "0 && \"already dropped\"");
  }
  id v18 = objc_msgSend_operationID(v14, v16, v17);
  uint64_t v21 = objc_msgSend_container(v14, v19, v20);
  dispatch_once_t v24 = objc_msgSend_containerID(v21, v22, v23);
  uint64_t v27 = objc_msgSend_containerIdentifier(v24, v25, v26);

  if (v27) {
    uint64_t v28 = (__CFString *)v27;
  }
  else {
    uint64_t v28 = &stru_1F2044F30;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4ECD49C;
  aBlock[3] = &unk_1E64F5058;
  id v29 = v13;
  SEL v68 = a2;
  id v63 = v29;
  id v64 = self;
  long long v55 = self;
  id v54 = v15;
  id v65 = v54;
  uint64_t v30 = v28;
  long long v66 = v30;
  id v31 = v18;
  id v67 = v31;
  uint64_t v32 = _Block_copy(aBlock);
  dispatch_semaphore_t v33 = [CKDMMCSItemGroup alloc];
  uint64_t v35 = objc_msgSend_tupleForItem_(CKDMMCSItemGroup, v34, (uint64_t)v29);
  uint64_t v37 = objc_msgSend_initWithTuple_(v33, v36, (uint64_t)v35);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v40 = objc_msgSend_sectionItems(v29, v38, v39);
  uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v58, v69, 16);
  if (v42)
  {
    uint64_t v44 = v42;
    uint64_t v45 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v59 != v45) {
          objc_enumerationMutation(v40);
        }
        objc_msgSend_addItem_(v37, v43, *(void *)(*((void *)&v58 + 1) + 8 * i));
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v58, v69, 16);
    }
    while (v44);
  }

  long long v47 = [CKDMMCSItemGroupContext alloc];
  started = objc_msgSend_initWithMMCS_itemGroup_operation_progress_command_start_groupCompletion_(v47, v48, (uint64_t)v55, v37, v14, v57, 0, v32, v56);

  return started;
}

- (id)getSectionItem:(id)a3 operation:(id)a4 options:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = (CKDMMCS *)a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void *)*MEMORY[0x1E4F1A548];
  uint64_t v19 = *MEMORY[0x1E4F1A550];
  if (self->_didDrop)
  {
    if (v19 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], v18);
    }
    uint64_t v36 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = v36;
      id v38 = NSStringFromSelector(a2);
      int v39 = 138412546;
      uint64_t v40 = self;
      __int16 v41 = 2114;
      uint64_t v42 = v38;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "already dropped %@ in %{public}@", (uint8_t *)&v39, 0x16u);
    }
    __assert_rtn("-[CKDMMCS getSectionItem:operation:options:progress:completionHandler:]", "CKDMMCS.m", 1739, "0 && \"already dropped\"");
  }
  uint64_t v20 = v17;
  if (v19 != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], v18);
  }
  uint64_t v21 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v21;
    uint64_t v35 = objc_msgSend_operationID(v14, v33, v34);
    int v39 = 138412802;
    uint64_t v40 = v13;
    __int16 v41 = 2114;
    uint64_t v42 = v35;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Getting MMCS section item %@ for operationID:%{public}@ with options %@", (uint8_t *)&v39, 0x20u);
  }
  uint64_t v23 = objc_msgSend__contextToGetSectionItem_operation_options_progress_completionHandler_(self, v22, (uint64_t)v13, v14, v15, v16, v20);
  objc_msgSend_setMmcsOperationType_(v23, v24, 4);
  uint64_t shouldCloneFileInAssetCache = objc_msgSend_shouldCloneFileInAssetCache(v14, v25, v26);
  objc_msgSend_setShouldCloneFileInAssetCache_(v23, v28, shouldCloneFileInAssetCache);
  objc_msgSend_start(v23, v29, v30);

  return v23;
}

- (void)startTrackingItemIDsForMMCSItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_trackedItemIDs;
  objc_sync_enter(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        trackedItemIDs = self->_trackedItemIDs;
        id v14 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v15 = objc_msgSend_itemID(*(void **)(*((void *)&v19 + 1) + 8 * v12), v8, v9, (void)v19);
        id v17 = objc_msgSend_numberWithUnsignedLongLong_(v14, v16, v15);
        objc_msgSend_addObject_(trackedItemIDs, v18, (uint64_t)v17);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v19, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (void)stopTrackingItemIDsForMMCSItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_trackedItemIDs;
  objc_sync_enter(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, v23, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        trackedItemIDs = self->_trackedItemIDs;
        id v14 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v15 = objc_msgSend_itemID(*(void **)(*((void *)&v19 + 1) + 8 * v12), v8, v9, (void)v19);
        id v17 = objc_msgSend_numberWithUnsignedLongLong_(v14, v16, v15);
        objc_msgSend_removeObject_(trackedItemIDs, v18, (uint64_t)v17);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v19, v23, 16);
    }
    while (v10);
  }

  objc_sync_exit(v5);
}

- (BOOL)isTrackingItemID:(unint64_t)a3
{
  id v5 = self->_trackedItemIDs;
  objc_sync_enter(v5);
  trackedItemIDs = self->_trackedItemIDs;
  id v8 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E4F28ED0], v7, a3);
  LOBYTE(trackedItemIDs) = objc_msgSend_containsObject_(trackedItemIDs, v9, (uint64_t)v8);

  objc_sync_exit(v5);
  return (char)trackedItemIDs;
}

- (NSURL)path
{
  return self->_path;
}

- (NSURL)temporaryDirectory
{
  return self->_temporaryDirectory;
}

- (CKDAssetCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
}

- (BOOL)didDrop
{
  return self->_didDrop;
}

- (void)setDidDrop:(BOOL)a3
{
  self->_didDrop = a3;
}

- (int64_t)checkoutCount
{
  return self->_checkoutCount;
}

- (void)setCheckoutCount:(int64_t)a3
{
  self->_checkoutCount = a3;
}

- (CKDMMCSEngineContext)MMCSEngineContext
{
  return self->_MMCSEngineContext;
}

- (void)setMMCSEngineContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSEngineContext, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_trackedItemIDs, 0);
}

@end
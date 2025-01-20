@interface FPFileProviderModule
- (BOOL)FPSetValue:(id)a3 forAttribute:(id)a4 onItemAtURL:(id)a5 error:(id *)a6;
- (id)FPBookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4;
- (id)FPDocumentURLFromBookmarkableString:(id)a3 error:(id *)a4;
- (id)FPTrashURLForItemAtURL:(id)a3 error:(id *)a4;
- (id)_originalDocumentURLForURL:(id)a3;
- (unsigned)responsibleForURL:(id)a3;
- (void)FPBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)FPDocumentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4;
- (void)FPDocumentURLFromUniversalBookmarkableString:(id)a3 completionHandler:(id)a4;
- (void)FPEvictItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)FPExtendBookmarkForDocumentURL:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5;
- (void)FPFileProviderServiceEndpointCreatingForItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)FPFileProviderServiceEndpointCreatingForItemAtURL:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)FPFileProviderServiceEndpointCreatingWithName:(id)a3 itemAtURL:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6;
- (void)FPStateForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)FPUniversalBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)FPValuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5;
@end

@implementation FPFileProviderModule

- (id)FPBookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_responsibleForURL_(self, v7, (uint64_t)v6, v8, v9))
  {
    v14 = objc_msgSend_sharedConnection(MEMORY[0x263F05448], v10, v11, v12, v13);
    v17 = objc_msgSend_bookmarkableStringFromDocumentURL_error_(v14, v15, (uint64_t)v6, (uint64_t)a4, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unsigned)responsibleForURL:(id)a3
{
  return FPURLMightBeInFileProvider();
}

- (void)FPBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (objc_msgSend_responsibleForURL_(self, v7, (uint64_t)v17, v8, v9))
  {
    v14 = objc_msgSend_sharedConnection(MEMORY[0x263F05448], v10, v11, v12, v13);
    objc_msgSend_bookmarkableStringFromDocumentURL_completionHandler_(v14, v15, (uint64_t)v17, (uint64_t)v6, v16);
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)FPDocumentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  if (objc_msgSend_rangeOfString_options_(v15, v6, @"fp:", 8, v7))
  {
    if (v5) {
      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_sharedConnection(MEMORY[0x263F05448], v8, v9, v10, v11);
    objc_msgSend_documentURLFromBookmarkableString_completionHandler_(v12, v13, (uint64_t)v15, (uint64_t)v5, v14);
  }
}

- (id)FPDocumentURLFromBookmarkableString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (objc_msgSend_rangeOfString_options_(v5, v6, @"fp:", 8, v7))
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend_sharedConnection(MEMORY[0x263F05448], v8, v9, v10, v11);
    uint64_t v12 = objc_msgSend_documentURLFromBookmarkableString_error_(v13, v14, (uint64_t)v5, (uint64_t)a4, v15);
  }

  return v12;
}

- (id)_originalDocumentURLForURL:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  objc_msgSend_getResourceValue_forKey_error_(v3, v4, (uint64_t)&v9, *MEMORY[0x263F05338], 0);
  id v5 = v9;
  if (v5)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_24335C9E0((uint64_t)v5, (uint64_t)v3, v6);
    }

    id v7 = v5;
    id v3 = v7;
  }

  return v3;
}

- (void)FPExtendBookmarkForDocumentURL:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_msgSend__originalDocumentURLForURL_(self, v10, (uint64_t)a3, v11, v12);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_responsibleForURL_(self, v13, (uint64_t)v22, v14, v15))
  {
    v20 = objc_msgSend_sharedConnection(MEMORY[0x263F05448], v16, v17, v18, v19);
    objc_msgSend_extendBookmarkForFileURL_toConsumerID_completionHandler_(v20, v21, (uint64_t)v22, (uint64_t)v8, (uint64_t)v9);
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)FPFileProviderServiceEndpointCreatingForItemAtURL:(id)a3 completionHandler:(id)a4
{
}

- (void)FPFileProviderServiceEndpointCreatingForItemAtURL:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (FPURLMightBeInFileProvider())
  {
    uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F054C0], v9, v10, v11, v12);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_24335AF8C;
    v15[3] = &unk_26517E800;
    id v16 = v8;
    objc_msgSend_fetchServicesWithName_itemAtURL_synchronously_handler_(v13, v14, 0, (uint64_t)v7, v6, v15);
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v8 + 2))(v8, 0, 0, 0, 0);
  }
}

- (void)FPFileProviderServiceEndpointCreatingWithName:(id)a3 itemAtURL:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (FPURLMightBeInFileProvider())
  {
    id v16 = objc_msgSend_defaultManager(MEMORY[0x263F054C0], v12, v13, v14, v15);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_24335B21C;
    v18[3] = &unk_26517E800;
    id v19 = v11;
    objc_msgSend_fetchServicesWithName_itemAtURL_synchronously_handler_(v16, v17, (uint64_t)v9, (uint64_t)v10, v7, v18);
  }
  else
  {
    (*((void (**)(id, void, void, void))v11 + 2))(v11, 0, 0, 0);
  }
}

- (void)FPValuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5
{
  BOOL v7 = (void *)MEMORY[0x263F05448];
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v15 = objc_msgSend_sharedConnection(v7, v11, v12, v13, v14);
  id v19 = 0;
  uint64_t v17 = objc_msgSend_valuesForAttributes_forItemAtURL_error_(v15, v16, (uint64_t)v10, (uint64_t)v9, (uint64_t)&v19);

  id v18 = v19;
  v8[2](v8, v17, v18);
}

- (BOOL)FPSetValue:(id)a3 forAttribute:(id)a4 onItemAtURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (objc_msgSend_isEqualToString_(a4, v11, *MEMORY[0x263EFF7C8], v12, v13))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v9;
      id v15 = v10;
      v20 = (const char *)objc_msgSend_fileSystemRepresentation(v15, v16, v17, v18, v19);
      if (v20)
      {
        int v21 = open(v20, 2097156);
        if (v21 < 0)
        {
          if (a6)
          {
            v28 = (void *)MEMORY[0x263F087E8];
            v29 = __error();
            objc_msgSend_fp_errorWithPOSIXCode_(v28, v30, *v29, v31, v32);
            BOOL v27 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        else
        {
          int v26 = v21;
          objc_msgSend_BOOLValue(v14, v22, v23, v24, v25);
          if ((fpfs_set_is_ignore_root() & 0x80000000) == 0)
          {
            close(v26);
            BOOL v27 = 1;
LABEL_14:

            goto LABEL_15;
          }
          if (a6)
          {
            v33 = (void *)MEMORY[0x263F087E8];
            v34 = __error();
            objc_msgSend_fp_errorWithPOSIXCode_(v33, v35, *v34, v36, v37);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          close(v26);
        }
      }
      BOOL v27 = 0;
      goto LABEL_14;
    }
  }
  BOOL v27 = 0;
LABEL_15:

  return v27;
}

- (void)FPUniversalBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
}

- (void)FPDocumentURLFromUniversalBookmarkableString:(id)a3 completionHandler:(id)a4
{
}

- (id)FPTrashURLForItemAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v10 = objc_msgSend_fp_fpfsRootURL(v5, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_fp_relationshipToItemAtURL_(v10, v11, (uint64_t)v5, v12, v13);

  if (v14 == 1)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v19 = objc_msgSend_URLByAppendingPathComponent_(v10, v15, @".Trash", v16, v17);
    uint64_t v18 = v19;
    if (v19)
    {
      id v20 = v19;
    }
    else if (a4)
    {
      FPNotSupportedError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v18;
}

- (void)FPEvictItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (FPURLMightBeInFileProvider())
  {
    id v11 = objc_msgSend_synchronousSharedConnectionProxy(MEMORY[0x263F05448], v7, v8, v9, v10);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_24335B75C;
    v14[3] = &unk_26517E828;
    id v15 = v6;
    id v13 = (id)objc_msgSend_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_completionHandler_(v11, v12, (uint64_t)v5, 1, 0, v14);
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)FPStateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = (void *)MEMORY[0x263F05448];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_sharedConnection(v5, v8, v9, v10, v11);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stateForDomainWithID_completionHandler_(v14, v12, (uint64_t)v7, (uint64_t)v6, v13);
}

@end
@interface CKDClonedFileCache
- (CKDClonedFileCache)initWithCacheDirectory:(id)a3 limit:(unint64_t)a4;
- (id)cacheEntries;
- (id)cloneFileDescriptor:(int)a3 filename:(id)a4 error:(id *)a5;
- (id)cloneMMCSItem:(id)a3 error:(id *)a4;
- (id)filenameForMMCSItem:(id)a3;
- (unint64_t)entryCount;
- (void)prune;
@end

@implementation CKDClonedFileCache

- (CKDClonedFileCache)initWithCacheDirectory:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDClonedFileCache;
  v9 = [(CKDClonedFileCache *)&v17 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_copy(v6, v7, v8);
    cacheDirectory = v9->_cacheDirectory;
    v9->_cacheDirectory = (NSURL *)v10;

    v9->_entryLimit = a4;
    uint64_t v14 = objc_msgSend_cacheEntries(v9, v12, v13);
    entries = v9->_entries;
    v9->_entries = (NSMutableArray *)v14;
  }
  return v9;
}

- (id)cacheEntries
{
  v58[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2);
  CKCreateDirectoryAtURL();
  cacheDirectory = self->_cacheDirectory;
  uint64_t v6 = *MEMORY[0x1E4F1C540];
  v58[0] = *MEMORY[0x1E4F1C540];
  uint64_t v8 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v58, 1);
  v47 = v4;
  uint64_t v10 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v4, v9, (uint64_t)cacheDirectory, v8, 3, 0);

  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v48 = self;
  v49 = objc_msgSend_initWithCapacity_(v11, v12, self->_entryLimit);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v13 = v10;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v52, v57, 16);
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v53;
    uint64_t v19 = *MEMORY[0x1E4F1C6E8];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(v13);
        }
        v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v51 = 0;
        int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v21, v16, (uint64_t)&v51, v19, 0);
        id v24 = v51;
        v25 = 0;
        if (ResourceValue_forKey_error)
        {
          id v50 = 0;
          int v26 = objc_msgSend_getResourceValue_forKey_error_(v21, v23, (uint64_t)&v50, v6, 0);
          id v27 = v50;
          v25 = v27;
          if (v26)
          {
            v56[0] = v27;
            v56[1] = v24;
            v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v28, (uint64_t)v56, 2);
            objc_msgSend_addObject_(v49, v30, (uint64_t)v29);
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v52, v57, 16);
    }
    while (v17);
  }

  objc_msgSend_sortUsingComparator_(v49, v31, (uint64_t)&unk_1F20428B0);
  uint64_t v34 = objc_msgSend_count(v49, v32, v33);
  if (v34)
  {
    uint64_t v35 = v34;
    for (uint64_t j = 0; j != v35; ++j)
    {
      v37 = (void *)MEMORY[0x1C8789E70]();
      v39 = objc_msgSend_objectAtIndex_(v49, v38, j);
      v41 = objc_msgSend_objectAtIndex_(v39, v40, 1);
      objc_msgSend_replaceObjectAtIndex_withObject_(v49, v42, j, v41);
      v44 = objc_msgSend_URLByAppendingPathComponent_(v48->_cacheDirectory, v43, (uint64_t)v41);
      objc_msgSend_CKMarkFilePurgeable_(v44, v45, 0);
    }
  }

  return v49;
}

- (void)prune
{
  unint64_t v4 = objc_msgSend_count(self->_entries, a2, v2);
  if (v4 > self->_entryLimit)
  {
    unint64_t v7 = v4;
    objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v5, v6);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      cacheDirectory = self->_cacheDirectory;
      uint64_t v10 = objc_msgSend_objectAtIndex_(self->_entries, v8, 0);
      v12 = objc_msgSend_URLByAppendingPathComponent_(cacheDirectory, v11, (uint64_t)v10);

      objc_msgSend_removeItemAtURL_error_(v15, v13, (uint64_t)v12, 0);
      objc_msgSend_removeObjectAtIndex_(self->_entries, v14, 0);
      --v7;
    }
    while (v7 > self->_entryLimit);
  }
}

- (id)cloneFileDescriptor:(int)a3 filename:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = 0;
  char v11 = 0;
  v12 = 0;
  int v13 = -10;
  while (1)
  {
    if (v9)
    {
      uint64_t v14 = v10;
      id v10 = v9;
    }
    else
    {
      uint64_t v14 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v7, v8);
      uint64_t v17 = objc_msgSend_UUIDString(v14, v15, v16);

      id v10 = (id)v17;
    }

    uint64_t v19 = objc_msgSend_URLByAppendingPathComponent_(self->_cacheDirectory, v18, (uint64_t)v10);

    v22 = (const char *)objc_msgSend_fileSystemRepresentation(v19, v20, v21);
    if (!fclonefileat(a3, -1, v22, 0)) {
      break;
    }
    if (*__error() != 17)
    {
      v32 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v33 = *MEMORY[0x1E4F19DD8];
      uint64_t v34 = __error();
      uint64_t v35 = strerror(*v34);
      v36 = __error();
      objc_msgSend_errorWithDomain_code_format_(v32, v37, v33, 1017, @"could not clone file: %s (errno=%d)", v35, *v36);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v29 = a5;

      uint64_t v19 = 0;
LABEL_18:
      if (!v29) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    if (v9)
    {
      unlink(v22);
      char v11 = 1;
    }
    v12 = v19;
    if (__CFADD__(v13++, 1))
    {
      id v25 = 0;
      goto LABEL_17;
    }
  }
  id v41 = 0;
  char v26 = objc_msgSend_CKMarkFilePurgeable_(v19, v23, (uint64_t)&v41);
  id v25 = v41;
  if (v26)
  {
    v29 = a5;
    if ((v11 & 1) == 0)
    {
      objc_msgSend_addObject_(self->_entries, v27, (uint64_t)v10);
      objc_msgSend_prune(self, v30, v31);
      if (!a5) {
        goto LABEL_22;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v39 = (const char *)objc_msgSend_fileSystemRepresentation(v19, v27, v28);
  unlink(v39);

  uint64_t v19 = 0;
  v29 = a5;
  if (!a5) {
    goto LABEL_22;
  }
LABEL_19:
  if (!v19 && v25) {
    id *v29 = v25;
  }
LABEL_22:

  return v19;
}

- (id)filenameForMMCSItem:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_recordID(v3, v4, v5);
  id v9 = objc_msgSend_recordName(v6, v7, v8);

  v12 = objc_msgSend_recordKey(v3, v10, v11);
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendString_(v13, v14, (uint64_t)v9);
  objc_msgSend_appendString_(v13, v15, @"_");
  objc_msgSend_appendString_(v13, v16, (uint64_t)v12);
  uint64_t v19 = objc_msgSend_asset(v3, v17, v18);
  v22 = v19;
  if (v19)
  {
    uint64_t v23 = objc_msgSend_arrayIndex(v19, v20, v21);
    if (v23 != -1) {
      objc_msgSend_appendFormat_(v13, v20, @"_a:%ld", v23);
    }
  }
  if (objc_msgSend_isPackageManifest(v3, v20, v21)) {
    objc_msgSend_appendString_(v13, v24, @"_m");
  }
  uint64_t v26 = objc_msgSend_packageIndex(v3, v24, v25);
  if (v26 != -1) {
    objc_msgSend_appendFormat_(v13, v27, @"_p:%ld", v26);
  }
  uint64_t v29 = objc_msgSend_length(v13, v27, v28);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v13, v30, @"/", @"__", 2, 0, v29);

  return v13;
}

- (id)cloneMMCSItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v9 = objc_msgSend_fileHandle(v6, v7, v8);
  if (v9)
  {
    v12 = v9;
    id v13 = 0;
    uint64_t v14 = objc_msgSend_fileDescriptor(v9, v10, v11);
  }
  else
  {
    id v26 = 0;
    uint64_t v16 = objc_msgSend_openWithError_(v6, v10, (uint64_t)&v26);
    id v13 = v26;
    v12 = objc_msgSend_fileHandle(v16, v17, v18);

    if (!v12)
    {
      id v24 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    uint64_t v14 = objc_msgSend_fileDescriptor(v12, v19, v20);
  }
  uint64_t v21 = v14;
  v22 = objc_msgSend_filenameForMMCSItem_(self, v15, (uint64_t)v6);
  id v24 = objc_msgSend_cloneFileDescriptor_filename_error_(self, v23, v21, v22, a4);

  if (!a4) {
    goto LABEL_9;
  }
LABEL_6:
  if (!v24 && v13) {
    *a4 = v13;
  }
LABEL_9:

  return v24;
}

- (unint64_t)entryCount
{
  return objc_msgSend_count(self->_entries, a2, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
}

@end
@interface BUSimpleFileCopier
+ (BOOL)countFilesAndSizesInDirectory:(id)a3 totalFileSize:(unint64_t *)a4 totalFileCount:(unint64_t *)a5 totalFileCountExcludeDir:(unint64_t *)a6;
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)countTotalFileSize:(unint64_t *)a3 totalFileCount:(unint64_t *)a4;
- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5;
- (BUFileCopierDelegate)delegate;
- (BUSimpleFileCopier)initWithURL:(id)a3;
- (NSURL)currentCopyItemURL;
- (NSURL)fromURL;
- (void)_finishCurrentCopyItem;
- (void)setCurrentCopyItemURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFromURL:(id)a3;
@end

@implementation BUSimpleFileCopier

- (BUSimpleFileCopier)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUSimpleFileCopier;
  v6 = [(BUSimpleFileCopier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fromURL, a3);
  }

  return v7;
}

- (BOOL)countTotalFileSize:(unint64_t *)a3 totalFileCount:(unint64_t *)a4
{
  v6 = objc_msgSend_fromURL(self, a2, (uint64_t)a3);
  objc_super v9 = objc_msgSend_path(v6, v7, v8);

  LOBYTE(a4) = objc_msgSend_countFilesAndSizesInDirectory_totalFileSize_totalFileCount_totalFileCountExcludeDir_(BUSimpleFileCopier, v10, (uint64_t)v9, a3, 0, a4);
  return (char)a4;
}

- (void)_finishCurrentCopyItem
{
  v4 = objc_msgSend_currentCopyItemURL(self, a2, v2);
  v7 = v4;
  if (v4)
  {
    uint64_t v8 = objc_msgSend_path(v4, v5, v6);
    v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v9, v10);
    id v32 = 0;
    v13 = objc_msgSend_attributesOfItemAtPath_error_(v11, v12, (uint64_t)v8, &v32);
    id v14 = v32;

    if (!v14)
    {
      v16 = objc_msgSend_objectForKeyedSubscript_(v13, v15, *MEMORY[0x263F080D8]);
      char isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x263F080E0]);

      if ((isEqualToString & 1) == 0)
      {
        v20 = objc_msgSend_objectForKeyedSubscript_(v13, v19, *MEMORY[0x263F080B8]);
        uint64_t v23 = objc_msgSend_longLongValue(v20, v21, v22);
        v26 = objc_msgSend_delegate(self, v24, v25);
        char v27 = objc_opt_respondsToSelector();

        if (v27)
        {
          v30 = objc_msgSend_delegate(self, v28, v29);
          objc_msgSend_didCopyItemToURL_fileSize_(v30, v31, (uint64_t)v7, v23);
        }
      }
    }
  }
  objc_msgSend_setCurrentCopyItemURL_(self, v5, 0);
}

- (BOOL)fileManager:(id)a3 shouldCopyItemAtURL:(id)a4 toURL:(id)a5
{
  id v6 = a5;
  objc_msgSend__finishCurrentCopyItem(self, v7, v8);
  v11 = objc_msgSend_delegate(self, v9, v10);
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && (objc_msgSend_delegate(self, v13, v14),
        v15 = objc_claimAutoreleasedReturnValue(),
        int shouldCopyItemToURL = objc_msgSend_shouldCopyItemToURL_(v15, v16, (uint64_t)v6),
        v15,
        !shouldCopyItemToURL))
  {
    BOOL v18 = 0;
  }
  else
  {
    objc_msgSend_setCurrentCopyItemURL_(self, v13, (uint64_t)v6);
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x263F08850];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  objc_msgSend_setDelegate_(v8, v9, (uint64_t)self);
  char v12 = objc_msgSend_fromURL(self, v10, v11);
  v15 = objc_msgSend_path(v12, v13, v14);

  BOOL v18 = objc_msgSend_path(v7, v16, v17);

  v21 = objc_msgSend_fromURL(self, v19, v20);
  id v38 = 0;
  uint64_t v22 = *MEMORY[0x263EFF6A8];
  id v37 = 0;
  char ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v21, v23, (uint64_t)&v38, v22, &v37);
  id v25 = v38;
  id v26 = v37;

  if (ResourceValue_forKey_error)
  {
    id v36 = v26;
    char v28 = objc_msgSend_copyItemAtPath_toPath_error_(v8, v27, (uint64_t)v15, v18, &v36);
    id v29 = v36;

    objc_msgSend__finishCurrentCopyItem(self, v30, v31);
    if (v28)
    {
      BOOL v32 = 1;
      id v26 = v29;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    id v26 = v29;
  }
  else
  {
    v33 = BookUtilityLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1474(self, (const char *)v26, v33);
    }
  }
  v34 = BookUtilityLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    sub_21E1F13FC((uint64_t)v26, v34);
  }

  BOOL v32 = 0;
  if (a4) {
LABEL_12:
  }
    *a4 = v26;
LABEL_13:

  return v32;
}

+ (BOOL)countFilesAndSizesInDirectory:(id)a3 totalFileSize:(unint64_t *)a4 totalFileCount:(unint64_t *)a5 totalFileCountExcludeDir:(unint64_t *)a6
{
  id v9 = a3;
  char v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11);
  uint64_t v14 = objc_msgSend_enumeratorAtPath_(v12, v13, (uint64_t)v9);

  if (v14)
  {
    v39 = a4;
    v40 = a5;
    v41 = a6;
    id v42 = v9;
    uint64_t v17 = objc_msgSend_nextObject(v14, v15, v16);

    if (v17)
    {
      unint64_t v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = 0;
      uint64_t v23 = *MEMORY[0x263F080D8];
      uint64_t v24 = *MEMORY[0x263F080E0];
      uint64_t v25 = *MEMORY[0x263F080B8];
      do
      {
        id v26 = objc_msgSend_fileAttributes(v14, v18, v19);
        char v28 = objc_msgSend_objectForKeyedSubscript_(v26, v27, v23);
        char isEqualToString = objc_msgSend_isEqualToString_(v28, v29, v24);

        if ((isEqualToString & 1) == 0)
        {
          ++v22;
          BOOL v32 = objc_msgSend_objectForKeyedSubscript_(v26, v31, v25);
          v20 += objc_msgSend_longLongValue(v32, v33, v34);
        }
        id v37 = objc_msgSend_nextObject(v14, v35, v36);

        ++v21;
      }
      while (v37);
    }
    else
    {
      unint64_t v22 = 0;
      unint64_t v21 = 0;
      unint64_t v20 = 0;
    }
    if (v39) {
      unint64_t *v39 = v20;
    }
    if (v40) {
      unint64_t *v40 = v21;
    }
    id v9 = v42;
    if (v41) {
      unint64_t *v41 = v22;
    }
  }

  return v14 != 0;
}

- (BUFileCopierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BUFileCopierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)fromURL
{
  return self->_fromURL;
}

- (void)setFromURL:(id)a3
{
}

- (NSURL)currentCopyItemURL
{
  return self->_currentCopyItemURL;
}

- (void)setCurrentCopyItemURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCopyItemURL, 0);
  objc_storeStrong((id *)&self->_fromURL, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
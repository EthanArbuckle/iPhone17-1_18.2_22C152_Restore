@interface SKGJournalReader
+ (BOOL)processJournalRecordWithFd:(int)a3 atOffset:(unint64_t)a4 withSize:(unint64_t)a5 usingBlock:(id)a6;
- (BOOL)enumerateItemsOfJournalAtPath:(id)a3 itemAdds:(id)a4 itemUpdates:(id)a5 itemDeletes:(id)a6 cancelBlock:(id)a7;
- (BOOL)removeJournalPath:(id)a3 error:(id *)a4;
- (SKGJournalReader)initWithResourceDirectoryPath:(id)a3;
- (id)eventJournalPaths;
- (id)journalPaths;
- (id)journalReaderResourcePath;
@end

@implementation SKGJournalReader

+ (BOOL)processJournalRecordWithFd:(int)a3 atOffset:(unint64_t)a4 withSize:(unint64_t)a5 usingBlock:(id)a6
{
  id v9 = a6;
  off_t v10 = -(uint64_t)vm_page_size & a4;
  size_t v11 = ((a4 + a5 + vm_page_size - 1) & -(uint64_t)vm_page_size) + v10;
  char v44 = 0;
  v12 = mmap(0, v11, 1, 1, a3, v10);
  if (v12 != (void *)-1)
  {
    v13 = v12;
    v14 = v12;
    makeThreadId();
    v43[0] = v13;
    v43[1] = v11;
    v43[2] = 0;
    uint64_t v41 = 1;
    v42 = v43;
    atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
    long long v15 = sMappingExceptionCallbacks[1];
    long long v34 = sMappingExceptionCallbacks[0];
    long long v35 = v15;
    long long v16 = sMappingExceptionCallbacks[3];
    long long v36 = sMappingExceptionCallbacks[2];
    long long v37 = v16;
    uint64_t v17 = setThreadIdAndInfo();
    unsigned int v39 = HIDWORD(v17);
    int v40 = v17;
    unint64_t v38 = __PAIR64__(v18, v19);
    uint64_t v20 = threadData[9 * v17 + 1];
    uint64_t v21 = v20 + 320 * HIDWORD(v17);
    *(unsigned char *)(v21 + 216) = 0;
    int v22 = *(_DWORD *)(v21 + 312);
    v23 = *(void (**)(void))(v21 + 224);
    if (v23) {
      v23(*(void *)(v20 + 320 * HIDWORD(v17) + 288));
    }
    LODWORD(v34) = v40;
    unsigned int v33 = v39;
    unint64_t v32 = v38;
    if (_setjmp((int *)v21))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10009FF8C();
      }
      *(_DWORD *)(v21 + 312) = v22;
      CIOnThreadCleanUpReset();
      dropThreadId();
      CICleanUpReset();
    }
    else
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000119A0;
      v30[3] = &unk_1000D9AA8;
      id v31 = v9;
      char v44 = sub_1000104C0((uint64_t)v13 + a4 - v10, a5, 0, 0, v30);
      uint64_t v24 = threadData[9 * v34 + 1];
      unsigned int v25 = v33;
      uint64_t v26 = v24 + 320 * v33;
      *(_DWORD *)(v26 + 312) = v22;
      v27 = *(void (**)(void))(v26 + 232);
      if (v27) {
        v27(*(void *)(v24 + 320 * v25 + 288));
      }
      dropThreadId();
    }
    munmap(v14, v11);
  }
  BOOL v28 = v44;

  return v28;
}

- (SKGJournalReader)initWithResourceDirectoryPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKGJournalReader;
  v6 = [(SKGJournalReader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resourcePath, a3);
  }

  return v7;
}

- (id)journalReaderResourcePath
{
  return self->_resourcePath;
}

- (id)journalPaths
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  unsigned int v18 = [(SKGJournalReader *)self journalReaderResourcePath];
  v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 isReadableFileAtPath:v18];

  if (v3)
  {
    uint64_t v17 = +[NSURL URLWithString:v18];
    v4 = +[NSFileManager defaultManager];
    id v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLCreationDateKey, 0);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100020F48;
    v24[3] = &unk_1000D9A08;
    v24[4] = &v25;
    long long v16 = [v4 enumeratorAtURL:v17 includingPropertiesForKeys:v5 options:4 errorHandler:v24];

    if (*((unsigned char *)v26 + 24))
    {
      id v6 = objc_alloc_init((Class)NSMutableDictionary);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = v16;
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v21;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v7);
            }
            size_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v12 = [v11 lastPathComponent];
            unsigned int v13 = [v12 hasPrefix:@"skg_"];

            if (v13)
            {
              id v19 = 0;
              [v11 getResourceValue:&v19 forKey:NSURLCreationDateKey error:0];
              id v14 = v19;
              [v6 setObject:v14 forKey:v11];
            }
          }
          id v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v8);
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  _Block_object_dispose(&v25, 8);

  return v6;
}

- (id)eventJournalPaths
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v2 = [(SKGJournalReader *)self journalReaderResourcePath];
  id v19 = +[NSURL URLWithString:v2];
  unsigned int v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 isReadableFileAtPath:v2];
  unsigned int v18 = (void *)v2;

  if (v4)
  {
    id v5 = +[NSFileManager defaultManager];
    NSURLResourceKey v31 = NSURLNameKey;
    id v6 = +[NSArray arrayWithObjects:&v31 count:1];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002128C;
    v25[3] = &unk_1000D9A08;
    v25[4] = &v26;
    id v7 = [v5 enumeratorAtURL:v19 includingPropertiesForKeys:v6 options:4 errorHandler:v25];

    id v20 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v13 = [v12 path];
          id v14 = [v13 lastPathComponent];
          if ([v14 hasPrefix:@"evt_"])
          {
            unsigned int v15 = [v13 hasSuffix:@".journal"];

            if (v15) {
              [v20 addObject:v12];
            }
          }
          else
          {
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v9);
    }

    if (*((unsigned char *)v27 + 24)) {
      id v16 = [v20 copy];
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(&v26, 8);

  return v16;
}

- (BOOL)enumerateItemsOfJournalAtPath:(id)a3 itemAdds:(id)a4 itemUpdates:(id)a5 itemDeletes:(id)a6 cancelBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v52 = a7;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  makeThreadId();
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10002199C;
  v58[3] = &unk_1000D9A58;
  id v15 = v14;
  id v59 = v15;
  v60 = v61;
  id v16 = objc_retainBlock(v58);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100021C18;
  v54[3] = &unk_1000D9A80;
  id v17 = v13;
  id v55 = v17;
  v57 = v61;
  id v18 = v12;
  id v56 = v18;
  id v19 = objc_retainBlock(v54);
  id v20 = [v11 path];
  long long v21 = (const char *)[v20 UTF8String];

  int v22 = open(v21, 0);
  if (v22 == -1)
  {
    long long v34 = sub_100050A28();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v35 = __error();
      sub_10009FE70(v35, (uint64_t)v21, (uint8_t *)&v64, v34);
    }

    BOOL v36 = 0;
  }
  else
  {
    int v23 = v22;
    memset(&v64, 0, sizeof(v64));
    if (fstat(v22, &v64) == -1)
    {
      long long v37 = sub_100050A28();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        unint64_t v38 = __error();
        sub_10009FECC(v38, (uint64_t)buf, v37);
      }
      goto LABEL_22;
    }
    unint64_t st_size = v64.st_size;
    if (v64.st_size)
    {
      size_t v51 = v64.st_size;
      uint64_t v25 = (int *)mmap(0, v64.st_size, 1, 1, v23, 0);
      if (v25 != (int *)-1)
      {
        char v53 = 0;
        v50 = v25;
        atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
        long long v26 = sMappingExceptionCallbacks[1];
        buf[0] = sMappingExceptionCallbacks[0];
        buf[1] = v26;
        long long v27 = sMappingExceptionCallbacks[3];
        buf[2] = sMappingExceptionCallbacks[2];
        buf[3] = v27;
        uint64_t v28 = setThreadIdAndInfo();
        uint64_t v29 = v28;
        uint64_t v30 = threadData[9 * v28 + 1];
        uint64_t v31 = v30 + 320 * HIDWORD(v28);
        *(unsigned char *)(v31 + 216) = 0;
        int v49 = *(_DWORD *)(v31 + 312);
        unint64_t v32 = *(void (**)(void))(v31 + 224);
        if (v32) {
          v32(*(void *)(v30 + 320 * HIDWORD(v28) + 288));
        }
        LODWORD(buf[0]) = v29;
        if (_setjmp((int *)v31))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10009FF8C();
          }
          *(_DWORD *)(v31 + 312) = v49;
          CIOnThreadCleanUpReset();
          dropThreadId();
          CICleanUpReset();
          int v33 = 1;
LABEL_40:
          if (!v53)
          {
            v46 = sub_100050A28();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v47 = __error();
              sub_10009FF4C(v47, (uint64_t)buf, v46);
            }

            int v33 = 0;
          }
          munmap(v50, v51);
          goto LABEL_45;
        }
        int v33 = 1;
        if (st_size < 0xD) {
          goto LABEL_37;
        }
        int v41 = *v50;
        if (*v50 > -262275348)
        {
          if (v41 > -261161236)
          {
            if (v41 == -260112659) {
              goto LABEL_36;
            }
            int v42 = -261161235;
          }
          else
          {
            if (v41 == -262275347) {
              goto LABEL_36;
            }
            int v42 = -262209811;
          }
        }
        else
        {
          if (v41 <= -263323924)
          {
            if (v41 != -264372499)
            {
              int v42 = -264306963;
              goto LABEL_35;
            }
LABEL_36:
            int v33 = sub_1000104C0((uint64_t)v50, v51, v16, v19, 0);
            goto LABEL_37;
          }
          if (v41 == -263323923) {
            goto LABEL_36;
          }
          int v42 = -263258387;
        }
LABEL_35:
        int v33 = 1;
        if (v41 == v42) {
          goto LABEL_36;
        }
LABEL_37:
        char v53 = 1;
        uint64_t v43 = threadData[9 * LODWORD(buf[0]) + 1];
        uint64_t v44 = v43 + 320 * HIDWORD(v29);
        *(_DWORD *)(v44 + 312) = v49;
        v45 = *(void (**)(void))(v44 + 232);
        if (v45) {
          v45(*(void *)(v43 + 320 * HIDWORD(v29) + 288));
        }
        dropThreadId();
        goto LABEL_40;
      }
      long long v37 = sub_100050A28();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v40 = __error();
        sub_10009FF0C(v40, (uint64_t)buf, v37);
      }
LABEL_22:

      int v33 = 0;
LABEL_45:
      close(v23);
      BOOL v36 = v33 != 0;
      goto LABEL_46;
    }
    unsigned int v39 = sub_100050A28();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "zero-length journal file", (uint8_t *)buf, 2u);
    }

    close(v23);
    BOOL v36 = 1;
  }
LABEL_46:

  _Block_object_dispose(v61, 8);
  return v36;
}

- (BOOL)removeJournalPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  id v9 = 0;
  [v6 removeItemAtURL:v5 error:&v9];

  id v7 = v9;
  if (a4 && v7) {
    *a4 = v7;
  }

  return v7 == 0;
}

- (void).cxx_destruct
{
}

@end
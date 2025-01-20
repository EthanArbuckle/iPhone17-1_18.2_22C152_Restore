@interface AMSStreamHTTPArchiveEntryController
+ (AMSCircularBuffer)buffer;
+ (BOOL)_shouldWriteEntryDirectlyToDiskForURLString:(id)a3;
+ (BOOL)_writeData:(id)a3 enumeratingBytesToStream:(id)a4;
+ (BOOL)_writeFooterToStream:(id)a3;
+ (BOOL)_writeHeaderToStream:(id)a3;
+ (id)_createNewFileNameForCombining:(BOOL)a3 extension:(id)a4;
+ (id)_createNewFileWithFileName:(id)a3 outputDirectory:(id)a4 error:(id *)a5;
+ (id)_footerData;
+ (id)_harFileURLsInPath:(id)a3;
+ (id)_headerData;
+ (id)ams_combineEntriesForPath:(id)a3 error:(id *)a4;
+ (void)_moveTemporaryFileURL:(id)a3 toFinalFileURL:(id)a4;
+ (void)_performCombiningFiles:(id)a3 toStream:(id)a4;
+ (void)_periodicCleanup;
+ (void)_streamToDiskWithEntries:(id)a3;
+ (void)_updateMaxBufferSize;
+ (void)_writeEntries:(id)a3 toStream:(id)a4;
+ (void)ams_addEntriesForTaskInfo:(id)a3;
+ (void)ams_streamEntriesToDisk;
+ (void)initialize;
@end

@implementation AMSStreamHTTPArchiveEntryController

+ (void)ams_streamEntriesToDisk
{
  v3 = [a1 buffer];
  id v4 = [v3 flush];

  if ([v4 count]) {
    [a1 _streamToDiskWithEntries:v4];
  }
}

+ (void)ams_addEntriesForTaskInfo:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[AMSHTTPArchiveController _disabled])
  {
    v5 = AMSSetLogKeyIfNeeded();
    v6 = [[AMSStreamHTTPArchiveEntry alloc] initWithHTTPArchiveTaskInfo:v4];
    v9 = (void *)MEMORY[0x1E4F1CB10];
    v10 = [(AMSStreamHTTPArchiveEntry *)v6 urlString];
    v8 = [v9 URLWithString:v10];

    uint64_t v11 = +[AMSHTTPArchiveController harURLFilters];
    if (!v11) {
      goto LABEL_14;
    }
    v12 = (void *)v11;
    v13 = +[AMSHTTPArchiveController harURLFilters];
    uint64_t v14 = [v13 count];

    if (!v14) {
      goto LABEL_14;
    }
    v15 = [(AMSStreamHTTPArchiveEntry *)v6 urlString];
    int v16 = [a1 _shouldWriteEntryDirectlyToDiskForURLString:v15];

    if (v16)
    {
      v17 = +[AMSLogConfig sharedConfig];
      if (!v17)
      {
        v17 = +[AMSLogConfig sharedConfig];
      }
      v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_opt_class();
        v20 = AMSLogableURL(v8);
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v19;
        __int16 v29 = 2114;
        v30 = v5;
        __int16 v31 = 2114;
        v32 = v20;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing filtered HAR entries to disk for URL string: %{public}@", buf, 0x20u);
      }
      v26 = v6;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [a1 _streamToDiskWithEntries:v21];
    }
    else
    {
LABEL_14:
      v22 = +[AMSLogConfig sharedConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_opt_class();
        v25 = AMSLogableURL(v8);
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v24;
        __int16 v29 = 2114;
        v30 = v5;
        __int16 v31 = 2114;
        v32 = v25;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Write HTTP Stream Entry to buffer for URL string: %{public}@", buf, 0x20u);
      }
      v21 = [a1 buffer];
      [v21 addObject:v6];
    }

    goto LABEL_20;
  }
  v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v7;
    __int16 v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_18D554000, &v6->super, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Error adding HAR, disabled", buf, 0x16u);
LABEL_20:
  }
}

+ (AMSCircularBuffer)buffer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38DF78 != -1) {
    dispatch_once(&qword_1EB38DF78, block);
  }
  v2 = (void *)_MergedGlobals_143;
  return (AMSCircularBuffer *)v2;
}

+ (void)initialize
{
  id v4 = [[AMSObserver alloc] initWithResultBlock:&__block_literal_global_122];
  +[AMSMemoryPressure subscribe:v4];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_AMSHTTPArchiveControllerShouldSaveToDisk, @"SSHTTPArchiveShouldSaveToDiskNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_AMSHTTPArchiveControllerShouldSaveToDiskDecompressed, @"SSHTTPArchiveShouldSaveToDiskDecompressedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __49__AMSStreamHTTPArchiveEntryController_initialize__block_invoke()
{
  return +[AMSStreamHTTPArchiveEntryController _updateMaxBufferSize];
}

void __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke(uint64_t a1)
{
  v2 = [[AMSCircularBuffer alloc] initWithMaxSize:0];
  v3 = (void *)_MergedGlobals_143;
  _MergedGlobals_143 = (uint64_t)v2;

  id v4 = dispatch_get_global_queue(-32768, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

uint64_t __45__AMSStreamHTTPArchiveEntryController_buffer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaxBufferSize];
}

+ (id)ams_combineEntriesForPath:(id)a3 error:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 _harFileURLsInPath:v6];
  v8 = [a1 _createNewFileNameForCombining:1 extension:@".har"];
  id v47 = 0;
  v9 = [a1 _createNewFileWithFileName:v8 outputDirectory:v6 error:&v47];

  id v10 = v47;
  uint64_t v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    AMSLogKey();
    v44 = v8;
    v15 = uint64_t v14 = v7;
    AMSLogableURL(v9);
    int v16 = a4;
    id v17 = v10;
    uint64_t v19 = v18 = v9;
    *(_DWORD *)buf = 138543874;
    uint64_t v49 = v13;
    __int16 v50 = 2114;
    id v51 = v15;
    __int16 v52 = 2114;
    v53 = v19;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Combining HAR entries to fileURL: %{public}@", buf, 0x20u);

    v9 = v18;
    id v10 = v17;
    a4 = v16;

    uint64_t v7 = v14;
    v8 = v44;
  }

  if (v10)
  {
    v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = objc_msgSend(v20, "OSLogObject", v44);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = (uint64_t)v22;
      __int16 v50 = 2114;
      id v51 = v10;
      v23 = v9;
      id v24 = v22;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create a new HAR file. error = %{public}@", buf, 0x16u);

      v9 = v23;
    }

    id v25 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v9 append:0];
    [v26 open];
    if ([a1 _writeHeaderToStream:v26])
    {
      [a1 _performCombiningFiles:v7 toStream:v26];
      if ([a1 _writeFooterToStream:v26])
      {
        [v26 close];
        id v25 = v7;
      }
      else
      {
        v35 = v9;
        v36 = +[AMSLogConfig sharedConfig];
        if (!v36)
        {
          v36 = +[AMSLogConfig sharedConfig];
        }
        v37 = objc_msgSend(v36, "OSLogObject", v44);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = objc_opt_class();
          id v46 = v38;
          AMSLogableURL(v35);
          v39 = a4;
          v40 = v8;
          v42 = v41 = v7;
          *(_DWORD *)buf = 138543618;
          uint64_t v49 = (uint64_t)v38;
          __int16 v50 = 2114;
          id v51 = v42;
          _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create footer for new fileURL: %{public}@", buf, 0x16u);

          uint64_t v7 = v41;
          v8 = v40;
          a4 = v39;
        }
        id v25 = 0;
        if (a4) {
          *a4 = 0;
        }
        v9 = v35;
      }
    }
    else
    {
      v27 = +[AMSLogConfig sharedConfig];
      if (!v27)
      {
        v27 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v28 = objc_msgSend(v27, "OSLogObject", v44);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = a4;
        v30 = v9;
        __int16 v31 = objc_opt_class();
        id v45 = v31;
        AMSLogableURL(v30);
        v32 = v8;
        v34 = uint64_t v33 = v7;
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = (uint64_t)v31;
        v9 = v30;
        a4 = v29;
        __int16 v50 = 2114;
        id v51 = v34;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create header for new fileURL: %{public}@", buf, 0x16u);

        uint64_t v7 = v33;
        v8 = v32;
      }
      id v25 = 0;
      if (a4) {
        *a4 = 0;
      }
    }
  }
  return v25;
}

+ (BOOL)_shouldWriteEntryDirectlyToDiskForURLString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = +[AMSHTTPArchiveController harURLFilters];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([v3 containsString:*(void *)(*((void *)&v9 + 1) + 8 * i)])
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

+ (void)_streamToDiskWithEntries:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!+[AMSHTTPArchiveController _disabled])
  {
    uint64_t v5 = [a1 _createNewFileNameForCombining:0 extension:@".temp"];
    uint64_t v6 = +[AMSHTTPArchive directory];
    id v37 = a1;
    id v39 = 0;
    uint64_t v7 = [a1 _createNewFileWithFileName:v5 outputDirectory:v6 error:&v39];
    id v8 = v39;

    long long v9 = [v5 stringByReplacingOccurrencesOfString:@".temp" withString:@".har"];
    long long v10 = (void *)MEMORY[0x1E4F1CB10];
    long long v11 = +[AMSHTTPArchive directory];
    long long v12 = [v10 fileURLWithPath:v11];
    uint64_t v13 = [v12 URLByAppendingPathComponent:v9];

    uint64_t v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v13;
      int v16 = v9;
      id v17 = v5;
      id v18 = v4;
      id v19 = v8;
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      v22 = AMSLogableURL(v7);
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v20;
      id v8 = v19;
      id v4 = v18;
      uint64_t v5 = v17;
      long long v9 = v16;
      uint64_t v13 = v36;
      __int16 v42 = 2114;
      id v43 = v21;
      __int16 v44 = 2114;
      id v45 = v22;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Writing HAR entries to temporary fileURL: %{public}@", buf, 0x20u);
    }
    if (v8)
    {
      v23 = +[AMSLogConfig sharedConfig];
      if (!v23)
      {
        v23 = +[AMSLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = (uint64_t)v25;
        __int16 v42 = 2114;
        id v43 = v8;
        id v26 = v25;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create a new HAR file. error = %{public}@", buf, 0x16u);
      }
      goto LABEL_25;
    }
    v23 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:v7 append:0];
    [v23 open];
    if ([v37 _writeHeaderToStream:v23])
    {
      [v37 _writeEntries:v4 toStream:v23];
      if ([v37 _writeFooterToStream:v23])
      {
        [v23 close];
        [v37 _moveTemporaryFileURL:v7 toFinalFileURL:v13];
        [v37 _periodicCleanup];
LABEL_25:

        goto LABEL_26;
      }
      v27 = v7;
      uint64_t v28 = +[AMSLogConfig sharedConfig];
      if (!v28)
      {
        uint64_t v28 = +[AMSLogConfig sharedConfig];
      }
      __int16 v29 = [v28 OSLogObject];
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        uint64_t v7 = v27;
        goto LABEL_25;
      }
      v35 = objc_opt_class();
      v38 = v9;
      id v31 = v35;
      AMSLogableURL(v27);
      uint64_t v33 = v32 = v13;
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = (uint64_t)v35;
      __int16 v42 = 2114;
      id v43 = v33;
      v34 = "%{public}@: Failed to create footer for temporary fileURL: %{public}@";
    }
    else
    {
      v27 = v7;
      uint64_t v28 = +[AMSLogConfig sharedConfig];
      if (!v28)
      {
        uint64_t v28 = +[AMSLogConfig sharedConfig];
      }
      __int16 v29 = [v28 OSLogObject];
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      v30 = objc_opt_class();
      v38 = v9;
      id v31 = v30;
      AMSLogableURL(v27);
      uint64_t v33 = v32 = v13;
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = (uint64_t)v30;
      __int16 v42 = 2114;
      id v43 = v33;
      v34 = "%{public}@: Failed to create header for temporary fileURL: %{public}@";
    }
    _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_ERROR, v34, buf, 0x16u);

    uint64_t v13 = v32;
    id v8 = 0;
    long long v9 = v38;
    goto LABEL_24;
  }
LABEL_26:
}

+ (void)_moveTemporaryFileURL:(id)a3 toFinalFileURL:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v5 absoluteString];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    long long v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = 0;
    char v12 = [v11 moveItemAtURL:v5 toURL:v6 error:&v18];
    id v10 = v18;

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_opt_class();
        id v16 = v15;
        id v17 = [v10 localizedDescription];
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v15;
        __int16 v21 = 2114;
        id v22 = v6;
        __int16 v23 = 2114;
        id v24 = v17;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to move temporary har file to final path: %{public}@, error: %{public}@", buf, 0x20u);
      }
    }
  }
}

+ (id)_createNewFileNameForCombining:(BOOL)a3 extension:(id)a4
{
  BOOL v4 = a3;
  id v5 = NSString;
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = [v6 date];
  [v8 timeIntervalSinceReferenceDate];
  id v10 = &stru_1EDCA7308;
  if (v4) {
    id v10 = @"_amscombined";
  }
  long long v11 = [v5 stringWithFormat:@"%@_%f_streamwrite%@%@", @"amstoold", v9, v10, v7];

  return v11;
}

+ (id)_createNewFileWithFileName:(id)a3 outputDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    id v11 = 0;
LABEL_4:
    uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    v15 = [v14 URLByAppendingPathComponent:v7];

    goto LABEL_5;
  }
  char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = 0;
  char v13 = [v12 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v11 = v17;

  if (v13) {
    goto LABEL_4;
  }
  if (a5)
  {
    id v11 = v11;
    v15 = 0;
    *a5 = v11;
  }
  else
  {
    v15 = 0;
  }
LABEL_5:

  return v15;
}

+ (void)_writeEntries:(id)a3 toStream:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v6;
  uint64_t v26 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v37;
    unint64_t v9 = 0x1E4F29000uLL;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v8);
        }
        uint64_t v27 = v10;
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id obj = [v11 entries];
        uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v30)
        {
          uint64_t v29 = *(void *)v33;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v33 != v29) {
                objc_enumerationMutation(obj);
              }
              char v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
              context = (void *)MEMORY[0x192FA47D0]();
              uint64_t v14 = objc_msgSend(v13, "ams_decompressedData");
              [a1 _writeData:v14 enumeratingBytesToStream:v7];
              v15 = [v8 lastObject];
              if (v11 == v15)
              {
                id v16 = [v11 entries];
                [v16 lastObject];
                unint64_t v17 = v9;
                id v18 = v7;
                id v19 = a1;
                v21 = id v20 = v8;

                BOOL v22 = v13 == v21;
                id v8 = v20;
                a1 = v19;
                id v7 = v18;
                unint64_t v9 = v17;
                if (v22) {
                  goto LABEL_15;
                }
              }
              else
              {
              }
              __int16 v23 = [*(id *)(v9 + 24) stringWithFormat:@","];
              id v24 = [v23 dataUsingEncoding:4];
              [a1 _writeData:v24 enumeratingBytesToStream:v7];

LABEL_15:
              ++v12;
            }
            while (v30 != v12);
            uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v30);
        }

        uint64_t v10 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v26);
  }
}

+ (BOOL)_writeHeaderToStream:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _headerData];
  LOBYTE(a1) = [a1 _writeData:v5 enumeratingBytesToStream:v4];

  return (char)a1;
}

+ (id)_headerData
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"{\"name\":\"AppleMediaServices\",\"version\":\"2.0\"}"];
  id v3 = [NSString stringWithFormat:@"{\"creator\":%@", v2];
  id v4 = [NSString stringWithFormat:@"{\"log\":%@,\"entries\":[", v3];
  id v5 = [v4 dataUsingEncoding:4];

  return v5;
}

+ (BOOL)_writeFooterToStream:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _footerData];
  LOBYTE(a1) = [a1 _writeData:v5 enumeratingBytesToStream:v4];

  return (char)a1;
}

+ (id)_footerData
{
  v2 = [NSString stringWithFormat:@"],\"version\":\"1.2\"}}"];
  id v3 = [v2 dataUsingEncoding:4];

  return v3;
}

+ (BOOL)_writeData:(id)a3 enumeratingBytesToStream:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__AMSStreamHTTPArchiveEntryController__writeData_enumeratingBytesToStream___block_invoke;
  v10[3] = &unk_1E55A6C68;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v5 enumerateByteRangesUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __75__AMSStreamHTTPArchiveEntryController__writeData_enumeratingBytesToStream___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "write:maxLength:", a2);
  if (!result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

+ (void)_updateMaxBufferSize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSMemoryPressure lastKnownStatus];
  if ([v3 isEqualToString:0])
  {
    id v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = 25;
      goto LABEL_15;
    }
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = 25;
    char v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:25];
    *(_DWORD *)id v11 = 138543618;
    *(void *)&v11[4] = v6;
    *(_WORD *)&v11[12] = 2112;
    *(void *)&v11[14] = v8;
LABEL_11:
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Received memory warning, writing to disk to flush the buffer. Current max: %@", v11, 0x16u);

LABEL_15:
    objc_msgSend(a1, "ams_streamEntriesToDisk");
    goto LABEL_16;
  }
  if ([v3 isEqualToString:0])
  {
    id v4 = +[AMSLogConfig sharedConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = 12;
      goto LABEL_15;
    }
    uint64_t v9 = objc_opt_class();
    uint64_t v7 = 12;
    char v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:12];
    *(_DWORD *)id v11 = 138543618;
    *(void *)&v11[4] = v9;
    *(_WORD *)&v11[12] = 2112;
    *(void *)&v11[14] = v8;
    goto LABEL_11;
  }
  uint64_t v7 = 50;
LABEL_16:
  uint64_t v10 = objc_msgSend(a1, "buffer", *(_OWORD *)v11, *(void *)&v11[16]);
  [v10 setMaxSize:v7];
}

+ (void)_periodicCleanup
{
  v2 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v2, &__block_literal_global_55_3);
}

AMSKeepAlive *__55__AMSStreamHTTPArchiveEntryController__periodicCleanup__block_invoke()
{
  return +[AMSKeepAlive keepAliveWithName:@"AMSHTTPArchiveController" style:2 block:&__block_literal_global_61_1];
}

void __55__AMSStreamHTTPArchiveEntryController__periodicCleanup__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F1C9C8] date];
  id v1 = [v0 dateByAddingTimeInterval:-86400.0];

  +[AMSHTTPArchive removeHTTPArchiveFilesOlderThanDate:v1];
}

+ (id)_harFileURLsInPath:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v26 = AMSSetLogKeyIfNeeded();
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v25 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [v6 enumeratorAtPath:v3];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    char v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v24 = v3;
      uint64_t v11 = *(void *)v28;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
          if (!objc_msgSend(v13, "containsString:", @"_streamwrite.har", v24)
            || ([v13 containsString:@"_amscombined"] & 1) != 0
            || [v13 containsString:@".temp"])
          {
            uint64_t v14 = +[AMSLogConfig sharedConfig];
            if (!v14)
            {
              uint64_t v14 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v15 = [v14 OSLogObject];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              char v16 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              id v32 = v16;
              __int16 v33 = 2114;
              long long v34 = v26;
              __int16 v35 = 2114;
              long long v36 = v13;
              _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping HAR combining for: %{public}@.", buf, 0x20u);
            }
          }
          else
          {
            unint64_t v17 = +[AMSLogConfig sharedConfig];
            if (!v17)
            {
              unint64_t v17 = +[AMSLogConfig sharedConfig];
            }
            id v18 = [v17 OSLogObject];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              id v32 = v19;
              __int16 v33 = 2114;
              long long v34 = v26;
              __int16 v35 = 2114;
              long long v36 = v13;
              _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Logging HAR for fileName: %{public}@.", buf, 0x20u);
            }

            uint64_t v14 = [v24 stringByAppendingPathComponent:v13];
            [v25 addObject:v14];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v20 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
        uint64_t v10 = v20;
      }
      while (v20);
      __int16 v21 = v8;
      id v3 = v24;
    }
    else
    {
      __int16 v21 = v8;
    }
  }
  else
  {
    __int16 v21 = +[AMSLogConfig sharedConfig];
    if (!v21)
    {
      __int16 v21 = +[AMSLogConfig sharedConfig];
    }
    char v8 = [v21 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2114;
      long long v34 = v26;
      id v22 = v32;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Directory containing HAR files does not exist.", buf, 0x16u);
    }
    id v25 = 0;
  }

  return v25;
}

+ (void)_performCombiningFiles:(id)a3 toStream:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  uint64_t v7 = [a1 _headerData];
  unint64_t v8 = [v7 length];

  id v35 = a1;
  uint64_t v9 = [a1 _footerData];
  uint64_t v10 = [v9 length];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v32)
  {
    id v11 = 0;
    uint64_t v28 = -(uint64_t)(v8 + v10);
    uint64_t v29 = *(void *)v43;
    uint64_t v30 = v10;
    unint64_t v31 = v8;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v41 = 0;
        long long v34 = v13;
        uint64_t v14 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v28];
        id v40 = 0;
        [v14 seekToEndReturningOffset:&v41 error:&v40];
        id v15 = v40;

        uint64_t v16 = v41;
        unint64_t v17 = v41 - v10;
        id v39 = 0;
        [v14 seekToOffset:v8 error:&v39];
        id v11 = v39;

        id v18 = (void *)MEMORY[0x192FA47D0]();
        if (v8 < v17)
        {
          unint64_t v19 = v28 + v16;
          unint64_t v20 = v8;
          while (1)
          {
            uint64_t v21 = v19 >= 0x400 ? 1024 : v19;
            id v38 = 0;
            id v22 = [v14 readDataUpToLength:v21 error:&v38];
            id v23 = v38;

            [v35 _writeData:v22 enumeratingBytesToStream:v36];
            if (v19 < 0x401) {
              break;
            }
            v20 += 1024;
            id v37 = 0;
            [v14 seekToOffset:v20 error:&v37];
            id v11 = v37;

            id v18 = (void *)MEMORY[0x192FA47D0]();
            v19 -= 1024;
            if (v20 >= v17) {
              goto LABEL_15;
            }
          }

          id v11 = v23;
        }
LABEL_15:
        id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v24 removeItemAtPath:v34 error:0];

        id v25 = [obj lastObject];

        if (v34 != v25)
        {
          uint64_t v26 = [NSString stringWithFormat:@","];
          long long v27 = [v26 dataUsingEncoding:4];
          [v35 _writeData:v27 enumeratingBytesToStream:v36];
        }
        unint64_t v8 = v31;
        uint64_t v10 = v30;
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v32);
  }
}

@end
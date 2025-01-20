@interface __NSCFLocalDownloadTask
+ (NSMutableURLRequest)_requestFromResumeDataDictionary:(uint64_t)a1;
+ (id)_expandResumeData:(id)a3;
+ (id)_requestFromResumeDataDictionary:(uint64_t)a3 key:;
- (BOOL)_keepDownloadTaskFile;
- (BOOL)isKindOfClass:(Class)a3;
- (_BYTE)initWithTaskGroup:(uint64_t)a3 request:(uint64_t)a4 filePath:(uint64_t)a5 ident:;
- (__CFDictionary)_copySocketStreamProperties;
- (__NSCFLocalDownloadFile)downloadFile;
- (id)createResumeInformation:(id)a3;
- (id)explicitDownloadDirectory;
- (int)openItemForPath:(id)a3 mode:(int)a4;
- (uint64_t)setupForNewDownload:(unsigned char *)a1;
- (void)_onqueue_cancelByProducingResumeData:(id)a3;
- (void)_onqueue_completeInitialization;
- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4;
- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4;
- (void)_private_completionAfterMetrics;
- (void)_private_fileCompletion;
- (void)_supplyExtractorWithData:(uint64_t)a3 completion:;
- (void)_task_onqueue_didFinish;
- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4;
- (void)cancelByProducingResumeData:(id)a3;
- (void)checkWrite;
- (void)dealloc;
- (void)reportProgress:(void *)self;
- (void)setDownloadFile:(id)a3;
- (void)set_keepDownloadTaskFile:(BOOL)a3;
- (void)terminateExtractorWithError:(id)a3 completion:(id)a4;
@end

@implementation __NSCFLocalDownloadTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFLocalDownloadTask;
  if (-[__NSCFLocalDownloadTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)_task_onqueue_didFinish
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_extractorFinishedSuccessfully && [(NSURLSessionTask *)self error])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v3 = 138543618;
      v4 = [(NSURLSessionTask *)self _loggableDescription];
      __int16 v5 = 2048;
      NSInteger v6 = [(NSError *)[(NSURLSessionTask *)self error] code];
      _os_log_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ extractor finished successfully, discarding previous error [%ld]", (uint8_t *)&v3, 0x16u);
    }
    [(NSURLSessionTask *)self setError:0];
  }
  if (!self->_needFinish)
  {
    self->_needFinish = 1;
    [(__NSCFLocalDownloadTask *)self checkWrite];
  }
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSURLSessionTask *)self _extractor]
    && ![(NSURLSessionTask *)self _extractorFinishedDecoding])
  {
    v10 = [(NSURLSessionTask *)self session];
    if (v10
      && CFEqual([(NSURLSessionConfiguration *)v10->_local_immutable_configuration_ivar disposition], &unk_1EC0A58A8)|| [(NSURLSessionTask *)self _extractorPreparedForExtraction])
    {
      -[__NSCFLocalDownloadTask _supplyExtractorWithData:completion:](self, a3, (uint64_t)a4);
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v21 = __Block_byref_object_copy__604;
      v22 = __Block_byref_object_dispose__605;
      v23 = 0;
      v23 = [(__NSCFLocalDownloadFile *)[(__NSCFLocalDownloadTask *)self downloadFile] path];
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v13 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v24 = 138412546;
        *(void *)&v24[4] = v18;
        *(_WORD *)&v24[12] = 2112;
        *(void *)&v24[14] = self;
        _os_log_debug_impl(&dword_184085000, v13, OS_LOG_TYPE_DEBUG, "StreamingZip - preparing for extraction to %@ for task %@", v24, 0x16u);
      }
      v14 = [(NSURLSessionTask *)self _extractor];
      uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __82____NSCFLocalDownloadTask__task_onqueue_didReceiveDispatchData_completionHandler___block_invoke;
      v19[3] = &unk_1E5252CA0;
      v19[6] = a4;
      v19[7] = buf;
      v19[4] = self;
      v19[5] = a3;
      [(STExtractor *)v14 prepareForExtractionToPath:v15 completionBlock:v19];
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if ([(NSURLSessionTask *)self _extractor]
      && [(NSURLSessionTask *)self _extractorFinishedDecoding])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      uint64_t v7 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = dispatch_data_get_size((dispatch_data_t)a3);
        _os_log_impl(&dword_184085000, v7, OS_LOG_TYPE_INFO, "StreamingZip Info - using SZExtractor which finished decoding for task %@, but we received more bytes.  Dropping %lu bytes.", buf, 0x16u);
      }
      goto LABEL_9;
    }
    writeBuffer = self->_writeBuffer;
    if (writeBuffer)
    {
      self->_writeBuffer = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_writeBuffer, (dispatch_data_t)a3);
      dispatch_release(writeBuffer);
    }
    else
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_writeBuffer = (OS_dispatch_data *)a3;
    }
    if (self->_canWrite)
    {
      [(__NSCFLocalDownloadTask *)self checkWrite];
LABEL_9:
      (*((void (**)(id))a4 + 2))(a4);
      return;
    }
    if (self->_ioSuspend) {
      goto LABEL_9;
    }
    v11 = self->_writeBuffer;
    if (dispatch_data_get_size(v11) <= 0x80000)
    {
      *(void *)v24 = 0;
      *(void *)&v24[8] = v24;
      *(void *)&v24[16] = 0x2020000000;
      uint64_t v25 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL13countSegmentsPU27objcproto16OS_dispatch_data8NSObject_block_invoke;
      v21 = (void (*)(uint64_t, uint64_t))&unk_1E5257648;
      v22 = (void (*)(uint64_t))v24;
      dispatch_data_apply(v11, buf);
      unint64_t v16 = *(void *)(*(void *)&v24[8] + 24);
      _Block_object_dispose(v24, 8);
      if (v16 < 0x1F) {
        goto LABEL_9;
      }
      unint64_t ioSuspend = self->_ioSuspend;
      self->_unint64_t ioSuspend = ioSuspend + 1;
      if (ioSuspend) {
        goto LABEL_9;
      }
    }
    else
    {
      self->_unint64_t ioSuspend = 1;
    }
    objc_setProperty_atomic_copy(self, v12, a4, 1016);
    [(__NSCFLocalSessionTask *)self _onqueue_suspend];
  }
}

- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4
{
}

- (__CFDictionary)_copySocketStreamProperties
{
  v8.receiver = self;
  v8.super_class = (Class)__NSCFLocalDownloadTask;
  int v3 = [(NSURLSessionTask *)&v8 _copySocketStreamProperties];
  if (CFDictionaryContainsKey(v3, &unk_1EC09F7C0)) {
    return v3;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex Count = CFDictionaryGetCount(v3);
  MutableCopy = CFDictionaryCreateMutableCopy(v5, Count + 1, v3);
  if (v3) {
    CFRelease(v3);
  }
  CFDictionarySetValue(MutableCopy, &unk_1EC09F7C0, (const void *)*MEMORY[0x1E4F1CFD0]);
  [(NSURLSessionTask *)self set_cachedSocketStreamProperties:MutableCopy];
  return MutableCopy;
}

- (void)_private_completionAfterMetrics
{
  v62[9] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if ([a1 error] && !objc_getProperty(a1, v2, 976, 1))
  {
    unint64_t v16 = (void *)[a1 error];
    if (v16)
    {
      uint64_t v18 = v16;
      v19 = (void *)[v16 domain];
      if ((([v19 isEqualToString:*MEMORY[0x1E4F289A0]] & 1) != 0
         || [v19 isEqualToString:@"_nsurlsessiondErrorDomain"])
        && [v18 code] != -999)
      {
        v20 = (void *)[v18 userInfo];
        if (!v20 || ![v20 objectForKey:@"NSURLSessionDownloadTaskResumeData"])
        {
          uint64_t v21 = [a1 createResumeInformation:0];
          if (v21)
          {
            uint64_t v22 = v21;
            v23 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
            [v23 encodeObject:v22 forKey:@"NSKeyedArchiveRootObjectKey"];
            uint64_t v24 = [v23 encodedData];
            uint64_t v25 = objc_msgSend((id)objc_msgSend(a1, "error"), "userInfo");
            if (v25)
            {
              id v26 = (id)[v25 mutableCopy];
              [v26 setObject:v24 forKey:@"NSURLSessionDownloadTaskResumeData"];
            }
            else
            {
              id v26 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v24 forKey:@"NSURLSessionDownloadTaskResumeData"];
            }

            objc_msgSend(a1, "setError:", objc_msgSend(MEMORY[0x1E4F290A8], "errorWithDomain:code:userInfo:", objc_msgSend((id)objc_msgSend(a1, "error"), "domain"), objc_msgSend((id)objc_msgSend(a1, "error"), "code"), v26));
          }
        }
      }
    }
    if (!objc_getProperty(a1, v17, 936, 1)) {
      goto LABEL_45;
    }
    id Property = objc_getProperty(a1, v49, 936, 1);
    v51 = _Block_copy(Property);
    objc_setProperty_atomic_copy(a1, v52, 0, 936);
    if ([a1 _callCompletionHandlerInline])
    {
      (*((void (**)(void *, void *, void, uint64_t, uint64_t))v51 + 2))(v51, a1, 0, [a1 response], objc_msgSend(a1, "error"));
      _Block_release(v51);
      [(NSURLSessionTask *)(uint64_t)a1 _resetTaskDelegate];
    }
    else
    {
      uint64_t v54 = [a1 session];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __63____NSCFLocalDownloadTask__private_errorCompletionAfterMetrics__block_invoke;
      v62[3] = &unk_1E5258028;
      v62[4] = a1;
      v62[5] = v51;
      -[NSURLSession runDelegateBlock:](v54, v62);
    }
  }
  else
  {
    if (objc_getProperty(a1, v2, 976, 1))
    {
      uint64_t v3 = [a1 createResumeInformation:0];
      if (v3)
      {
        uint64_t v5 = v3;
        NSInteger v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
        [v6 encodeObject:v5 forKey:@"NSKeyedArchiveRootObjectKey"];
        uint64_t v7 = [v6 encodedData];
      }
      else
      {
        uint64_t v7 = 0;
      }
      id v27 = objc_getProperty(a1, v4, 976, 1);
      v28 = _Block_copy(v27);
      objc_setProperty_atomic_copy(a1, v29, 0, 976);
      v30 = (void *)[a1 error:*MEMORY[0x1E4F289A0] code:-999];
      v31 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
      objc_msgSend(v31, "addEntriesFromDictionary:", objc_msgSend(v30, "userInfo"));
      if (v7) {
        [v31 setObject:v7 forKey:@"NSURLSessionDownloadTaskResumeData"];
      }
      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F290A8], "errorWithDomain:code:userInfo:", objc_msgSend(v30, "domain"), objc_msgSend(v30, "code"), v31);
      uint64_t v33 = [a1 session];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke;
      v61[3] = &unk_1E5258028;
      v61[4] = v7;
      v61[5] = v28;
      -[NSURLSession runDelegateBlock:](v33, v61);
      [a1 setError:v32];
      if (objc_getProperty(a1, v34, 936, 1))
      {
        id v36 = objc_getProperty(a1, v35, 936, 1);
        v37 = _Block_copy(v36);
        objc_setProperty_atomic_copy(a1, v38, 0, 936);
        if ([a1 _callCompletionHandlerInline])
        {
          (*((void (**)(void *, void *, void, uint64_t, uint64_t))v37 + 2))(v37, a1, 0, [a1 response], objc_msgSend(a1, "error"));
          _Block_release(v37);
          [a1 setState:3];
          [(NSURLSessionTask *)(uint64_t)a1 _resetTaskDelegate];
        }
        else
        {
          uint64_t v40 = [a1 session];
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_2;
          v60[3] = &unk_1E5258028;
          v60[4] = a1;
          v60[5] = v37;
          -[NSURLSession runDelegateBlock:](v40, v60);
        }
      }
      else
      {
        -[NSURLSession _onqueue_didCompleteTask:withError:]([a1 session], a1, objc_msgSend(a1, "error"));
      }
      goto LABEL_53;
    }
    if (a1[119]) {
      __assert_rtn("-[__NSCFLocalDownloadTask _private_completionAfterMetrics]", "LocalDownloadTask.mm", 940, "_writeBuffer == NULL");
    }
    objc_super v8 = (void *)[a1 downloadFile];
    if (v8) {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend((id)objc_msgSend(v8, "path"), "UTF8String"), 0, 0);
    }
    else {
      uint64_t v10 = 0;
    }
    if (objc_getProperty(a1, v9, 936, 1))
    {
      id v12 = objc_getProperty(a1, v11, 936, 1);
      v13 = (void (**)(void *, void *, uint64_t, uint64_t, uint64_t))_Block_copy(v12);
      objc_setProperty_atomic_copy(a1, v14, 0, 936);
      if ([a1 _callCompletionHandlerInline])
      {
        v13[2](v13, a1, v10, [a1 response], objc_msgSend(a1, "error"));
        _Block_release(v13);
        [a1 setState:3];
        [(NSURLSessionTask *)(uint64_t)a1 _resetTaskDelegate];
      }
      else
      {
        uint64_t v48 = [a1 session];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_3;
        v59[3] = &unk_1E52581A0;
        v59[5] = v10;
        v59[6] = v13;
        v59[4] = a1;
        -[NSURLSession runDelegateBlock:](v48, v59);
      }
      goto LABEL_53;
    }
    uint64_t v41 = a1[88];
    if (!v41) {
      uint64_t v41 = a1[87];
    }
    char v42 = [(__NSCFURLSessionDelegateWrapper *)v41 didFinishDownloadingToURL];
    char v44 = v42;
    if (a1[125])
    {
      uint64_t v45 = a1[88];
      if (!v45) {
        uint64_t v45 = a1[87];
      }
      char v46 = [(__NSCFURLSessionDelegateWrapper *)v45 didWriteData];
      if ((v44 & 1) == 0)
      {
        [a1 setDownloadFile:0];
        if (v46)
        {
          newValue[0] = MEMORY[0x1E4F143A8];
          newValue[1] = 3221225472;
          newValue[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_4;
          newValue[3] = &unk_1E5258228;
          newValue[4] = a1;
          objc_setProperty_atomic_copy(a1, v47, newValue, 1008);
          -[__NSCFLocalDownloadTask reportProgress:](a1, 0);
          goto LABEL_53;
        }
LABEL_45:
        -[NSURLSession _onqueue_didCompleteTask:withError:]([a1 session], a1, objc_msgSend(a1, "error"));
        goto LABEL_53;
      }
    }
    else
    {
      if ((v42 & 1) == 0)
      {
        [a1 setDownloadFile:0];
        goto LABEL_45;
      }
      char v46 = 0;
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5;
    v57[3] = &unk_1E5257FB0;
    v57[4] = a1;
    v57[5] = v10;
    if (v46)
    {
      objc_setProperty_atomic_copy(a1, v43, v57, 1008);
      -[__NSCFLocalDownloadTask reportProgress:](a1, 0);
    }
    else
    {
      __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5((uint64_t)v57);
    }
  }
LABEL_53:
  if ([a1 _callCompletionHandlerInline])
  {
    [a1 setState:3];
  }
  else
  {
    uint64_t v55 = [a1 session];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_7;
    v56[3] = &unk_1E5258228;
    v56[4] = a1;
    -[NSURLSession runDelegateBlock:](v55, v56);
  }
  -[__NSURLSessionLocal removeUnresumedTask:]([a1 session], (uint64_t)a1);
}

- (void)_onqueue_completeInitialization
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(__NSURLSessionTaskGroupForConfiguration *)[(NSURLSessionTask *)self _taskGroup] _groupConfiguration];
  if ([(NSURLSessionTask *)self _pathToDownloadTaskFile]
    && ![(NSString *)[(NSURLSessionTask *)self _pathToDownloadTaskFile] isEqualToString:[(__NSCFLocalDownloadFile *)[(__NSCFLocalDownloadTask *)self downloadFile] path]])
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138543874;
      *(void *)&buf.st_mode = [(NSURLSessionTask *)self _loggableDescription];
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)[(NSURLSessionTask *)self _pathToDownloadTaskFile];
      HIWORD(buf.st_gid) = 2112;
      *(void *)&buf.st_rdev = [(__NSCFLocalDownloadFile *)[(__NSCFLocalDownloadTask *)self downloadFile] path];
      _os_log_impl(&dword_184085000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ _pathToDownloadTaskFile set to %@ and current path was %@- reconstructing downloadfile object", (uint8_t *)&buf, 0x20u);
    }
    uint64_t v5 = [__NSCFLocalDownloadFile alloc];
    -[__NSCFLocalDownloadTask setDownloadFile:](self, "setDownloadFile:", -[__NSCFLocalDownloadFile initWithFullPath:protectionType:](v5, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), 0), objc_msgSend(v3, "_downloadFileProtectionType")));
    NSInteger v6 = [(__NSCFLocalDownloadTask *)self downloadFile];
    if (v6 && v6->_error == 17 && [(NSURLSessionTask *)self _extractor]) {
      [(__NSCFLocalDownloadFile *)[(__NSCFLocalDownloadTask *)self downloadFile] setPath:[(NSURLSessionTask *)self _pathToDownloadTaskFile]];
    }
    uint64_t v7 = [(__NSCFLocalDownloadTask *)self downloadFile];
    if (v7) {
      v7->_skipUnlink = 1;
    }
  }
  if ([v3 _requiresClientToOpenFiles]
    && self->_originalResumeInfo
    && ![(NSURLSessionTask *)self _extractor])
  {
    id v8 = (id)[(NSURLRequest *)[(NSURLSessionTask *)self currentRequest] mutableCopy];
    int v9 = [(__NSCFLocalDownloadTask *)self openItemForPath:[(__NSCFLocalDownloadFile *)[(__NSCFLocalDownloadTask *)self downloadFile] path] mode:0];
    if (v9 >= 1)
    {
      int v10 = v9;
      memset(&buf, 0, sizeof(buf));
      if (fstat(v9, &buf))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v11 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          int v14 = *__error();
          *(_DWORD *)unint64_t v16 = 67109120;
          int v17 = v14;
          _os_log_error_impl(&dword_184085000, v11, OS_LOG_TYPE_ERROR, "Download task fstat resulted in error %d", v16, 8u);
        }
        close(v10);
      }
      else
      {
        off_t st_size = buf.st_size;
        close(v10);
        if (st_size >= 1)
        {
          self->_initialResumeSize = st_size;
          self->_totalWrote = st_size;
          uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", st_size);
          goto LABEL_24;
        }
      }
    }
    uint64_t v12 = 0;
    self->_initialResumeSize = 0;
    self->_totalWrote = 0;
LABEL_24:
    [v8 setValue:v12 forHTTPHeaderField:0x1EC0A2700];
    [(NSURLSessionTask *)self updateCurrentRequest:v8];
  }
  v15.receiver = self;
  v15.super_class = (Class)__NSCFLocalDownloadTask;
  [(__NSCFLocalSessionTask *)&v15 _onqueue_completeInitialization];
}

- (void)reportProgress:(void *)self
{
  if (self)
  {
    self[121] += a2;
    self[125] += a2;
    if (!*((unsigned char *)self + 1029))
    {
      *((unsigned char *)self + 1029) = 1;
      if (!objc_getProperty(self, a2, 936, 1))
      {
        uint64_t v4 = self[88];
        if (!v4) {
          uint64_t v4 = self[87];
        }
        if ([(__NSCFURLSessionDelegateWrapper *)v4 didWriteData])
        {
          uint64_t v5 = self[125];
          self[125] = 0;
          if (v5)
          {
            uint64_t v6 = self[88];
            if (!v6) {
              uint64_t v6 = self[87];
            }
            uint64_t v7 = self[121];
            uint64_t v8 = [self countOfBytesExpectedToReceive];
            v9[0] = MEMORY[0x1E4F143A8];
            v9[1] = 3221225472;
            v9[2] = __42____NSCFLocalDownloadTask_reportProgress___block_invoke;
            v9[3] = &unk_1E5258228;
            v9[4] = self;
            -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:](v6, self, v5, v7, v8, v9);
          }
          else
          {
            *((unsigned char *)self + 1029) = 0;
          }
        }
      }
    }
  }
}

- (void)set_keepDownloadTaskFile:(BOOL)a3
{
  uint64_t v4 = [(__NSCFLocalDownloadTask *)self downloadFile];
  if (v4) {
    v4->_skipUnlink = a3;
  }
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  uint64_t v6 = self;
  *(void *)&v27[5] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    [(NSURLSessionTask *)self setResponse:a3];
    -[NSURLSessionTask setCountOfBytesExpectedToReceive:](v6, "setCountOfBytesExpectedToReceive:", [a3 expectedContentLength]);
    self = (__NSCFLocalDownloadTask *)v6->super.super._internalDelegateWrapper;
    if (!self) {
      self = (__NSCFLocalDownloadTask *)v6->super.super._publicDelegateWrapper;
    }
  }
  -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:]((uint64_t)self, v6, a3);
  uint64_t v7 = [(__NSCFLocalDownloadTask *)v6 downloadFile];
  if (v7)
  {
    uint64_t v8 = v7;
    if (v7->_createdPlaceholder
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", -[__NSCFLocalDownloadFile path](v7, "path")) & 1) == 0)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      int v9 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        *(void *)id v27 = [(__NSCFLocalDownloadFile *)v8 path];
        _os_log_impl(&dword_184085000, v9, OS_LOG_TYPE_DEFAULT, "LocalDownloadFile placeholder %@ does not exist, recreating.", buf, 0xCu);
      }
      int v10 = open([(NSString *)[(__NSCFLocalDownloadFile *)v8 path] UTF8String], 2561, 438);
      if (v10 < 0)
      {
        v8->_int error = *__error();
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v13 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          int error = v8->_error;
          uint64_t v23 = [(__NSCFLocalDownloadFile *)v8 path];
          *(_DWORD *)stat buf = 67109378;
          v27[0] = error;
          LOWORD(v27[1]) = 2112;
          *(void *)((char *)&v27[1] + 2) = v23;
          _os_log_error_impl(&dword_184085000, v13, OS_LOG_TYPE_ERROR, "LocalDownloadFile: error %d recreating placeholder %@", buf, 0x12u);
        }
      }
      else
      {
        int v12 = v10;
        [(__NSCFLocalDownloadFile *)v8 setFileDataProtection];
        close(v12);
      }
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = [a3 statusCode];
    if ((unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFED3 && (dyld_program_sdk_at_least() & 1) == 0)
    {
      if ((unint64_t)(v14 - 401) > 6) {
        uint64_t v15 = -1100;
      }
      else {
        uint64_t v15 = qword_18430BA10[v14 - 401];
      }
      if (v6) {
        uint64_t v21 = [(__NSCFLocalSessionTask *)v6 error:*MEMORY[0x1E4F289A0] code:v15];
      }
      else {
        uint64_t v21 = 0;
      }
      [(__NSCFLocalSessionTask *)v6 _onqueue_cancel_with_error:v21];
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v14 = 200;
  }
  int64_t initialResumeSize = v6->_initialResumeSize;
  if (v14 != 206 && initialResumeSize != -1)
  {
    v6->_int64_t initialResumeSize = 0;
    v6->_totalWrote = 0;
    -[__NSCFLocalDownloadFile truncate]((uint64_t)[(__NSCFLocalDownloadTask *)v6 downloadFile]);
    int64_t initialResumeSize = v6->_initialResumeSize;
  }
  if ((initialResumeSize & 0x8000000000000000) == 0)
  {
    [(NSURLSessionTask *)v6 setCountOfBytesReceived:v6->_initialResumeSize + [(NSURLSessionTask *)v6 countOfBytesReceived]];
    if (([(NSURLSessionTask *)v6 countOfBytesExpectedToReceive] & 0x8000000000000000) == 0) {
      [(NSURLSessionTask *)v6 setCountOfBytesExpectedToReceive:v6->_initialResumeSize + [(NSURLSessionTask *)v6 countOfBytesExpectedToReceive]];
    }
    uint64_t internalDelegateWrapper = (uint64_t)v6->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      uint64_t internalDelegateWrapper = (uint64_t)v6->super.super._publicDelegateWrapper;
    }
    -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](internalDelegateWrapper, v6, [(NSURLSessionTask *)v6 countOfBytesReceived], [(NSURLSessionTask *)v6 countOfBytesExpectedToReceive]);
  }
LABEL_32:
  uint64_t v18 = [(NSURLSessionTask *)v6 _extractor];
  char v19 = 0;
  if (v14 >= 500 && v18)
  {
    if ([a3 valueForHTTPHeaderField:@"X-Apple-Cache-Session"])
    {
      char v19 = 0;
    }
    else
    {
      if (v6) {
        uint64_t v20 = [(__NSCFLocalSessionTask *)v6 error:*MEMORY[0x1E4F289A0] code:-1011];
      }
      else {
        uint64_t v20 = 0;
      }
      [(__NSCFLocalSessionTask *)v6 _onqueue_cancel_with_error:v20];
      char v19 = 1;
    }
  }
  char v24 = v19;
  *(void *)&v25[15] = 10;
  *(_OWORD *)uint64_t v25 = xmmword_18430B9F9;
  (*((void (**)(id, char *))a4 + 2))(a4, &v24);
}

- (uint64_t)setupForNewDownload:(unsigned char *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_taskGroup"), "_groupConfiguration");
  int v5 = [v4 _requiresClientToOpenFiles];
  if (a2 && v5)
  {
    uint64_t v6 = [__NSCFLocalDownloadFile alloc];
    if (v6)
    {
      uint64_t v7 = -[__NSCFLocalDownloadFile initQueues](v6);
      uint64_t v8 = v7;
      if (v7)
      {
        [v7 setPath:a2];
        v8[24] = a1;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    [a1 setDownloadFile:v8];
    -[__NSCFLocalDownloadFile truncate]([a1 downloadFile]);
  }
  else
  {
    uint64_t v9 = [a1 _pathToDownloadTaskFile];
    int v10 = [__NSCFLocalDownloadFile alloc];
    if (v9)
    {
      p_isa = -[__NSCFLocalDownloadFile initWithFullPath:protectionType:](v10, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend(a1, "_pathToDownloadTaskFile"), 0), objc_msgSend(v4, "_downloadFileProtectionType"));
    }
    else
    {
      id v12 = -[__NSCFLocalDownloadTask explicitDownloadDirectory](a1);
      uint64_t v13 = [v4 _downloadFileProtectionType];
      if (v10)
      {
        uint64_t v14 = (void *)v13;
        uint64_t v15 = (__NSCFLocalDownloadFile *)-[__NSCFLocalDownloadFile initQueues](v10);
        int v10 = v15;
        if (v15)
        {
          objc_setProperty_atomic_copy(v15, v16, v14, 208);
          if (v12) {
            int v17 = (NSString *)[v12 path];
          }
          else {
            int v17 = NSTemporaryDirectory();
          }
          snprintf(__str, 0x400uLL, "%s", [[(NSString *)v17 stringByAppendingPathComponent:@"CFNetworkDownload_XXXXXX.tmp"] UTF8String]);
          int v18 = mkstemps(__str, 4);
          if (v18 < 0)
          {
            v10->_int error = *__error();
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            uint64_t v21 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              int error = v10->_error;
              *(_DWORD *)stat buf = 67109378;
              int v28 = error;
              __int16 v29 = 2080;
              v30 = __str;
              _os_log_error_impl(&dword_184085000, v21, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d creating temp file: %s", buf, 0x12u);
            }
          }
          else
          {
            int v19 = v18;
            -[__NSCFLocalDownloadFile setPath:](v10, "setPath:", (id)[[NSString alloc] initWithUTF8String:__str]);
            [(__NSCFLocalDownloadFile *)v10 setFileDataProtection];
            close(v19);
            v10->_createdPlaceholder = 1;
          }
        }
      }
      p_isa = &v10->super.isa;
    }
    [a1 setDownloadFile:p_isa];
  }
  char v22 = objc_msgSend(v4, "skip_download_unlink");
  uint64_t v23 = [a1 downloadFile];
  if (v23) {
    *(unsigned char *)(v23 + 185) = v22;
  }
  if ([a1 _pathToDownloadTaskFile])
  {
    uint64_t v24 = [a1 downloadFile];
    if (v24) {
      *(unsigned char *)(v24 + 185) = 1;
    }
  }
  a1[1028] = [a1 downloadFile] != 0;
  return a1[1028];
}

- (void)checkWrite
{
  if (self && self[1028])
  {
    uint64_t v3 = *((void *)self + 119);
    if (!v3) {
      goto LABEL_36;
    }
    self[1028] = 0;
    size_t size = dispatch_data_get_size(v3);
    int v5 = *((_DWORD *)self + 256);
    *((_DWORD *)self + 256) = v5 + 1;
    uint64_t v6 = [self downloadFile];
    uint64_t v7 = [self session];
    if (v7) {
      uint64_t v8 = *(NSObject **)(v7 + 120);
    }
    else {
      uint64_t v8 = 0;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __41____NSCFLocalDownloadTask_writeAndResume__block_invoke;
    v22[3] = &unk_1E5252C50;
    int v23 = v5;
    int v24 = 0;
    v22[4] = self;
    v22[5] = size;
    if (v6)
    {
      if (-[__NSCFLocalDownloadFile ioChannel](v6))
      {
        uint64_t v9 = *(NSObject **)(v6 + 152);
        int v10 = *(NSObject **)(v6 + 160);
        uint64_t io_handler = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        id v27 = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke_2;
        int v28 = &unk_1E5255520;
        uint64_t v29 = v6;
        v30 = v8;
        v31 = v22;
        dispatch_io_write(v9, 0, v3, v10, &io_handler);
      }
      else
      {
        uint64_t io_handler = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        id v27 = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke;
        int v28 = &unk_1E5258028;
        uint64_t v29 = v6;
        v30 = v22;
        dispatch_async(v8, &io_handler);
      }
    }
    dispatch_release(*((dispatch_object_t *)self + 119));
    *((void *)self + 119) = 0;
    if (self[1028])
    {
LABEL_36:
      if (!*((void *)self + 120)) {
        goto LABEL_37;
      }
      *((void *)self + 120) = 0;
      if (objc_getProperty(self, a2, 1016, 1))
      {
        id Property = objc_getProperty(self, v11, 1016, 1);
        uint64_t v13 = (void (**)(void))_Block_copy(Property);
        objc_setProperty_atomic_copy(self, v14, 0, 1016);
        v13[2](v13);
        _Block_release(v13);
      }
      objc_msgSend(self, "_onqueue_resume");
      if (self[1028])
      {
LABEL_37:
        if (self[1030])
        {
          if (!self[1031])
          {
            [self _finishProgressReporting];
            self[1031] = 1;
            if ([self session])
            {
              uint64_t v15 = [self session];
              if (v15)
              {
                if (*(void *)(v15 + 120))
                {
                  if ([self _extractor])
                  {
                    uint64_t v16 = [self downloadFile];
                    if (v16) {
                      *(unsigned char *)(v16 + 168) = 1;
                    }
                    int v17 = (void *)MEMORY[0x18531D6D0]();
                    -[__NSCFLocalDownloadTask _private_fileCompletion](self);
                  }
                  else
                  {
                    if ([self error]) {
                      -[__NSCFLocalDownloadFile markPurgeable]([self downloadFile]);
                    }
                    int v18 = (unsigned char *)[self downloadFile];
                    uint64_t v19 = [self session];
                    if (v19) {
                      uint64_t v20 = *(NSObject **)(v19 + 120);
                    }
                    else {
                      uint64_t v20 = 0;
                    }
                    v21[0] = MEMORY[0x1E4F143A8];
                    v21[1] = 3221225472;
                    v21[2] = __37____NSCFLocalDownloadTask_checkWrite__block_invoke;
                    v21[3] = &unk_1E5258228;
                    v21[4] = self;
                    -[__NSCFLocalDownloadFile finishOnQueue:completion:](v18, v20, v21);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (__NSCFLocalDownloadFile)downloadFile
{
  return (__NSCFLocalDownloadFile *)objc_getProperty(self, a2, 944, 1);
}

- (void)dealloc
{
  if (self) {
    objc_setProperty_atomic_copy(self, a2, 0, 936);
  }
  [(__NSCFLocalDownloadTask *)self setDownloadFile:0];
  writeBuffer = self->_writeBuffer;
  if (writeBuffer) {
    dispatch_release(writeBuffer);
  }

  objc_setProperty_atomic_copy(self, v4, 0, 976);
  objc_setProperty_atomic_copy(self, v5, 0, 1016);
  objc_setProperty_atomic_copy(self, v6, 0, 1008);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFLocalDownloadTask;
  [(__NSCFLocalSessionTask *)&v7 dealloc];
}

- (void)setDownloadFile:(id)a3
{
}

- (void)_private_fileCompletion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a1 _extractor]
      && [a1 _extractorPreparedForExtraction]
      && ([a1 _extractorFinishedDecoding] & 1) == 0)
    {
      if ([a1 error])
      {
        if ([a1 _extractor])
        {
          v2 = dispatch_semaphore_create(0);
          uint64_t v3 = (void *)[a1 _extractor];
          *(void *)stat buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __43____NSCFLocalDownloadTask_suspendExtractor__block_invoke;
          uint64_t v9 = &unk_1E5252C78;
          int v10 = a1;
          v11 = v2;
          [v3 suspendStreamWithCompletionBlock:buf];
          dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v2);
        }
      }
      else
      {
        objc_msgSend(a1, "setError:", objc_msgSend(a1, "error:code:", *MEMORY[0x1E4F289A0], -3007));
        objc_msgSend(a1, "terminateExtractorWithError:completion:", objc_msgSend(a1, "error"), &__block_literal_global_589);
      }
    }
    if (a1[1032] && [a1 error])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = [a1 _loggableDescription];
        uint64_t v5 = objc_msgSend((id)objc_msgSend(a1, "error"), "code");
        *(_DWORD *)stat buf = 138543618;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ extractor finished successfully, discarding previous error [%ld]", buf, 0x16u);
      }
      [a1 setError:0];
    }
    -[__CFN_TaskMetrics completeWithError:]([a1 _metrics], objc_msgSend(a1, "error"));
    if ([a1 _needSendingMetrics])
    {
      [a1 _didSendMetrics];
      SEL v6 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], (void *)[a1 _metrics]);
      -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]((uint64_t)v6, &v7, objc_msgSend(a1, "workQueue", MEMORY[0x1E4F143A8], 3221225472, __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_57, &unk_1E5257FB0, a1, v6));
    }
    else
    {
      -[__NSCFLocalDownloadTask _private_completionAfterMetrics](a1);
    }
  }
}

- (id)explicitDownloadDirectory
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_taskGroup"), "_groupConfiguration"), "_directoryForDownloadedFiles");
  if (!result)
  {
    if (a1)
    {
      uint64_t v3 = a1[88];
      if (!v3) {
        uint64_t v3 = a1[87];
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    return -[__NSCFURLSessionDelegateWrapper _downloadTaskNeedsDownloadDirectory:](v3, a1);
  }
  return result;
}

- (id)createResumeInformation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSURLSessionTask *)self currentRequest];
  SEL v6 = [[(NSURLRequest *)v5 URL] scheme];
  if ([(NSString *)v6 caseInsensitiveCompare:@"http"]
    && [(NSString *)v6 caseInsensitiveCompare:@"https"]
    || [(NSString *)[(NSURLRequest *)v5 HTTPMethod] caseInsensitiveCompare:@"GET"])
  {
    return 0;
  }
  [(NSURLSessionTask *)self response];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(NSURLSessionTask *)self response];
    int v10 = [(NSURLResponse *)v9 allHeaderFields];
    uint64_t v11 = [(NSDictionary *)v10 objectForKey:0x1EC0A2268];
    uint64_t v12 = [(NSDictionary *)v10 objectForKey:0x1EC0A2428];
    if (!(v12 | v11)) {
      return 0;
    }
    uint64_t v13 = v12;
    uint64_t v33 = 0;
    if (a3)
    {
      SEL v14 = (NSString *)[a3 copy];
      uint64_t v15 = [(NSURLSessionTask *)self _extractor];
      BOOL v16 = v15 == 0;
      if (v14)
      {
        if (!v15)
        {
          uint64_t v32 = 0;
          int v17 = (void *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
          if (([v17 getResourceValue:&v33 forKey:*MEMORY[0x1E4F1C5F8] error:&v32] & 1) == 0)
          {
            if (CFNLog::onceToken != -1) {
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
            }
            int v18 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)stat buf = 138412290;
              v35 = v32;
              _os_log_error_impl(&dword_184085000, v18, OS_LOG_TYPE_ERROR, "Failed to size file %@", buf, 0xCu);
            }
          }
        }
        goto LABEL_29;
      }
    }
    else
    {
      BOOL v16 = [(NSURLSessionTask *)self _extractor] == 0;
    }
    char v22 = [(__NSCFLocalDownloadTask *)self downloadFile];
    if (v22)
    {
      int v23 = v22;
      if (!v22->_finished) {
        __assert_rtn("-[__NSCFLocalDownloadFile captureFile:outStat:]", "LocalDownloadFile.mm", 315, "_finished");
      }
      v22->_skipUnlink = 1;
      SEL v14 = [(__NSCFLocalDownloadFile *)v22 path];
      off_t st_size = v23->_stat.st_size;
    }
    else
    {
      SEL v14 = 0;
      off_t st_size = 0;
    }
    uint64_t v33 = [NSNumber numberWithLongLong:st_size];
    if (!v14) {
      return 0;
    }
LABEL_29:
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    [v7 setObject:&unk_1ECFD1A58 forKey:@"NSURLSessionResumeInfoVersion"];
    objc_msgSend(v7, "setObject:forKey:", -[NSString lastPathComponent](v14, "lastPathComponent"), @"NSURLSessionResumeInfoTempFileName");
    if (v16 && v33) {
      [v7 setObject:v33 forKey:@"NSURLSessionResumeBytesReceived"];
    }
    if ([(NSURLSessionTask *)self _pathToDownloadTaskFile]) {
      objc_msgSend(v7, "setObject:forKey:", -[NSURLSessionTask _pathToDownloadTaskFile](self, "_pathToDownloadTaskFile"), @"NSURLSessionResumeInfoLocalPath");
    }

    objc_msgSend(v7, "setObject:forKey:", CFURLGetString((CFURLRef)-[NSURLRequest URL](v5, "URL")), @"NSURLSessionDownloadURL");
    id v25 = (id)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    id v26 = (id)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    objc_msgSend(v25, "encodeObject:forKey:", -[NSURLSessionTask currentRequest](self, "currentRequest"), @"NSKeyedArchiveRootObjectKey");
    uint64_t v27 = [v25 encodedData];
    objc_msgSend(v26, "encodeObject:forKey:", -[NSURLSessionTask originalRequest](self, "originalRequest"), @"NSKeyedArchiveRootObjectKey");
    uint64_t v28 = [v26 encodedData];
    [v7 setObject:v27 forKey:@"NSURLSessionResumeCurrentRequest"];
    [v7 setObject:v28 forKey:@"NSURLSessionResumeOriginalRequest"];
    uint64_t v32 = 0;
    uint64_t v29 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v32];
    if (v29)
    {
      [v7 setObject:v29 forKey:@"NSURLSessionResumeResponse"];
      if (!v13) {
        goto LABEL_42;
      }
    }
    else
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v30 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        v31 = [(NSURLSessionTask *)self _loggableDescription];
        *(_DWORD *)stat buf = 138543618;
        v35 = v31;
        __int16 v36 = 2112;
        v37 = v32;
        _os_log_error_impl(&dword_184085000, v30, OS_LOG_TYPE_ERROR, "%{public}@ failed to archive response: %@", buf, 0x16u);
        if (!v13) {
          goto LABEL_42;
        }
      }
      else if (!v13)
      {
LABEL_42:
        if (v11) {
          [v7 setObject:v11 forKey:@"NSURLSessionResumeEntityTag"];
        }
        if ([(NSURLSessionTask *)self _extractor]) {
          objc_msgSend(v7, "setObject:forKey:", -[NSURLSessionTask _extractor](self, "_extractor"), @"NSURLSessionResumeExtractor");
        }
        if ([(NSURLSessionTask *)self _backgroundPublishingURL]) {
          objc_msgSend(v7, "setObject:forKey:", -[NSURLSessionTask _backgroundPublishingURL](self, "_backgroundPublishingURL"), @"PublishingURL");
        }
        return v7;
      }
    }
    [v7 setObject:v13 forKey:@"NSURLSessionResumeServerDownloadDate"];
    goto LABEL_42;
  }
  if (self->_originalResumeInfo)
  {
    uint64_t v19 = [(__NSCFLocalDownloadTask *)self downloadFile];
    if (v19) {
      v19->_skipUnlink = 1;
    }
    originalResumeInfo = self->_originalResumeInfo;
  }
  else
  {
    originalResumeInfo = 0;
  }
  uint64_t v21 = (void *)[(NSDictionary *)originalResumeInfo copy];

  return v21;
}

- (_BYTE)initWithTaskGroup:(uint64_t)a3 request:(uint64_t)a4 filePath:(uint64_t)a5 ident:
{
  if (!a1) {
    return 0;
  }
  a1[123] = -1;
  v9.receiver = a1;
  v9.super_class = (Class)__NSCFLocalDownloadTask;
  SEL v6 = objc_msgSendSuper2(&v9, sel_initWithOriginalRequest_ident_taskGroup_, a3, a5, a2);
  uint64_t v7 = v6;
  if (v6)
  {
    if (-[__NSCFLocalDownloadTask setupForNewDownload:](v6, a4))
    {
      objc_msgSend(v7, "set_suspensionThreshhold:", 0x80000);
      v7[69] = 0;
      return v7;
    }

    return 0;
  }
  return v7;
}

- (void)_supplyExtractorWithData:(uint64_t)a3 completion:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    if ([result _extractorPreparedForExtraction])
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      SEL v6 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)stat buf = 134218242;
        uint64_t v12 = [a2 length];
        __int16 v13 = 2112;
        SEL v14 = v5;
        _os_log_debug_impl(&dword_184085000, v6, OS_LOG_TYPE_DEBUG, "StreamingZip(LocalDownloadTask) - supplied %lu bytes to extractor for decoding in task %@.", buf, 0x16u);
      }
      size_t size = dispatch_data_get_size(a2);
      uint64_t v8 = (void *)[v5 _extractor];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke;
      v10[3] = &unk_1E5252CC8;
      v10[4] = v5;
      v10[5] = a3;
      v10[6] = size;
      return (void *)[v8 supplyBytes:a2 withCompletionBlock:v10];
    }
    else
    {
      objc_super v9 = *(uint64_t (**)(uint64_t))(a3 + 16);
      return (void *)v9(a3);
    }
  }
  return result;
}

- (void)terminateExtractorWithError:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(NSURLSessionTask *)self _extractor]
    && ![(NSURLSessionTask *)self _extractorFinishedDecoding])
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v8 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412802;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      id v14 = a3;
      __int16 v15 = 2048;
      uint64_t v16 = [a3 code];
      _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, "StreamingZip Error: attempting to terminate extractor for task: %@ because of error: %@ [%ld]", buf, 0x20u);
    }
    objc_super v9 = [(NSURLSessionTask *)self _extractor];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66____NSCFLocalDownloadTask_terminateExtractorWithError_completion___block_invoke;
    v10[3] = &unk_1E5255010;
    v10[4] = self;
    [(STExtractor *)v9 terminateStreamWithError:a3 completionBlock:v10];
    [(NSURLSessionTask *)self set_extractorFinishedDecoding:1];
    (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    uint64_t v7 = (void (*)(id))*((void *)a4 + 2);
    v7(a4);
  }
}

- (void)cancelByProducingResumeData:(id)a3
{
  uint64_t v5 = [(NSURLSessionTask *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55____NSCFLocalDownloadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E5258028;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)_onqueue_cancelByProducingResumeData:(id)a3
{
  if ([(NSURLSessionTask *)self state] > NSURLSessionTaskStateCanceling)
  {
    uint64_t v11 = [(NSURLSessionTask *)self session];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
    v14[3] = &unk_1E5257FD8;
    v14[4] = a3;
    -[NSURLSession runDelegateBlock:]((uint64_t)v11, v14);
  }
  else if (self->_needFinish)
  {
    if (objc_getProperty(self, v5, 976, 1))
    {
      id Property = objc_getProperty(self, v6, 976, 1);
      uint64_t v8 = _Block_copy(Property);
      objc_setProperty_atomic_copy(self, v9, 0, 976);
      newValue[0] = MEMORY[0x1E4F143A8];
      newValue[1] = 3221225472;
      newValue[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
      newValue[3] = &unk_1E5252C28;
      newValue[4] = v8;
      void newValue[5] = a3;
      objc_setProperty_atomic_copy(self, v10, newValue, 976);
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke;
      block[3] = &unk_1E5257FD8;
      block[4] = a3;
      dispatch_async(global_queue, block);
    }
  }
  else
  {
    objc_setProperty_atomic_copy(self, v5, a3, 976);
    self->_needFinish = 1;
    v17.receiver = self;
    v17.super_class = (Class)__NSCFLocalDownloadTask;
    [(__NSCFLocalSessionTask *)&v17 _onqueue_cancel];
    [(__NSCFLocalDownloadTask *)self checkWrite];
  }
}

- (int)openItemForPath:(id)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -1;
  uint64_t v7 = dispatch_semaphore_create(0);
  if (self)
  {
    uint64_t internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper) {
      uint64_t internalDelegateWrapper = self->super.super._publicDelegateWrapper;
    }
  }
  else
  {
    uint64_t internalDelegateWrapper = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48____NSCFLocalDownloadTask_openItemForPath_mode___block_invoke;
  v11[3] = &unk_1E5256090;
  v11[4] = v7;
  v11[5] = &v12;
  -[__NSCFURLSessionDelegateWrapper _openFileAtPath:mode:completionHandler:]((uint64_t)internalDelegateWrapper, a3, v4, v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  int v9 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)_keepDownloadTaskFile
{
  v2 = [(__NSCFLocalDownloadTask *)self downloadFile];
  if (v2) {
    LOBYTE(v2) = v2->_skipUnlink;
  }
  return (char)v2;
}

+ (id)_expandResumeData:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v5 = v4;
  if (v4 && [v4 objectForKey:@"$archiver"])
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
    [v6 setDecodingFailurePolicy:0];
    if (resumeDataClasses(void)::onceToken != -1) {
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_172);
    }
    uint64_t v7 = (void *)[v6 decodeObjectOfClasses:resumeDataClasses(void)::resumeDataClasses forKey:@"NSKeyedArchiveRootObjectKey"];
    [v6 finishDecoding];
    if (v7) {
      return v7;
    }
  }
  return v5;
}

+ (id)_requestFromResumeDataDictionary:(uint64_t)a3 key:
{
  self;
  uint64_t v5 = [a2 objectForKey:a3];
  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
    [v6 setDecodingFailurePolicy:0];
    if (resumeDataClasses(void)::onceToken != -1) {
      dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_172);
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, @"NSKeyedArchiveRootObjectKey"), "mutableCopy");
    [v6 finishDecoding];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (NSMutableURLRequest)_requestFromResumeDataDictionary:(uint64_t)a1
{
  self;
  id result = (NSMutableURLRequest *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]((uint64_t)__NSCFLocalDownloadTask, a2, @"NSURLSessionResumeCurrentRequest");
  if (!result)
  {
    id result = (NSMutableURLRequest *)+[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]((uint64_t)__NSCFLocalDownloadTask, a2, @"NSURLSessionResumeOriginalRequest");
    if (!result)
    {
      uint64_t v4 = -[NSURLRequest initWithURL:cachePolicy:timeoutInterval:]([NSMutableURLRequest alloc], "initWithURL:cachePolicy:timeoutInterval:", objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", objc_msgSend(a2, "objectForKey:", @"NSURLSessionDownloadURL")), 1, 120.0);
      return v4;
    }
  }
  return result;
}

@end
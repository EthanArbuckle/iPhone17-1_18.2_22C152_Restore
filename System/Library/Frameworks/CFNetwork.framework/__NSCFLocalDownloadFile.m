@interface __NSCFLocalDownloadFile
- (NSString)path;
- (uint64_t)ioChannel;
- (void)dealloc;
- (void)finishOnQueue:(void *)a3 completion:;
- (void)initQueues;
- (void)initWithFullPath:(void *)a3 protectionType:;
- (void)markPurgeable;
- (void)setFileDataProtection;
- (void)setPath:(id)a3;
- (void)truncate;
@end

@implementation __NSCFLocalDownloadFile

- (void)dealloc
{
  if ([(__NSCFLocalDownloadFile *)self path] && (!self || !self->_skipUnlink)) {
    unlink([(NSString *)[(__NSCFLocalDownloadFile *)self path] UTF8String]);
  }
  writeIO = self->_writeIO;
  if (writeIO)
  {
    dispatch_release(writeIO);
    self->_writeIO = 0;
  }
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }
  [(__NSCFLocalDownloadFile *)self setPath:0];
  objc_setProperty_atomic_copy(self, v5, 0, 200);
  objc_setProperty_atomic_copy(self, v6, 0, 208);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFLocalDownloadFile;
  [(__NSCFLocalDownloadFile *)&v7 dealloc];
}

- (void)setPath:(id)a3
{
}

- (uint64_t)ioChannel
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 152)) {
    return *(void *)(a1 + 152);
  }
  uint64_t result = [(id)a1 path];
  if (result)
  {
    if (!*(void *)(a1 + 152))
    {
      if (*(unsigned char *)(a1 + 186))
      {
        *(unsigned char *)(a1 + 186) = 0;
        uint64_t v3 = 1025;
      }
      else
      {
        uint64_t v3 = 9;
      }
      v4 = *(void **)(a1 + 192);
      if (v4) {
        dispatch_fd_t v5 = objc_msgSend(v4, "openItemForPath:mode:", objc_msgSend((id)a1, "path"), v3);
      }
      else {
        dispatch_fd_t v5 = open((const char *)objc_msgSend((id)objc_msgSend((id)a1, "path"), "UTF8String"), v3, 438);
      }
      if (v5 < 0)
      {
        *(_DWORD *)(a1 + 188) = *__error();
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        v8 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          int v9 = *(_DWORD *)(a1 + 188);
          *(_DWORD *)buf = 67109378;
          int v13 = v9;
          __int16 v14 = 2112;
          uint64_t v15 = [(id)a1 path];
          _os_log_error_impl(&dword_184085000, v8, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d opening for ioChannel, file: %@", buf, 0x12u);
        }
      }
      else
      {
        SEL v6 = *(NSObject **)(a1 + 160);
        cleanup_handler[0] = MEMORY[0x1E4F143A8];
        cleanup_handler[1] = 3221225472;
        cleanup_handler[2] = __36____NSCFLocalDownloadFile_ioChannel__block_invoke;
        cleanup_handler[3] = &unk_1E52554D0;
        cleanup_handler[4] = a1;
        dispatch_fd_t v11 = v5;
        objc_super v7 = dispatch_io_create(0, v5, v6, cleanup_handler);
        dispatch_io_set_low_water(v7, 0xFFFFFFFFFFFFFFFFLL);
        *(void *)(a1 + 152) = v7;
      }
    }
    return *(void *)(a1 + 152);
  }
  return result;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)finishOnQueue:(void *)a3 completion:
{
  if (a1)
  {
    uint64_t v6 = -[__NSCFLocalDownloadFile ioChannel]((uint64_t)a1);
    if (v6)
    {
      objc_super v7 = v6;
      dispatch_retain(a2);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52____NSCFLocalDownloadFile_finishOnQueue_completion___block_invoke;
      v9[3] = &unk_1E5258028;
      v9[4] = a2;
      v9[5] = a3;
      objc_setProperty_atomic_copy(a1, v8, v9, 200);
      dispatch_io_close(v7, 0);
    }
    else
    {
      a1[168] = 1;
      dispatch_async(a2, a3);
    }
  }
}

- (void)markPurgeable
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 152);
    if (v1)
    {
      dispatch_fd_t descriptor = dispatch_io_get_descriptor(v1);
      uint64_t v5 = 65541;
      if (ffsctl(descriptor, 0xC0084A44uLL, &v5, 0))
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        uint64_t v3 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
        {
          int v4 = *__error();
          *(_DWORD *)buf = 67109120;
          int v7 = v4;
          _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_INFO, "Failed to make file purgeable: %{errno}d", buf, 8u);
        }
      }
    }
  }
}

- (void)setFileDataProtection
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v11 = *MEMORY[0x1E4F28370];
  v12[0] = objc_getProperty(a1, a2, 208, 1);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "setAttributes:ofItemAtPath:error:", v3, objc_msgSend(a1, "path"), &v6) & 1) == 0)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    int v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [a1 path];
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_184085000, v4, OS_LOG_TYPE_ERROR, "LocalDownloadFile: couldn't set data protection class of %@, error: %@", buf, 0x16u);
    }
  }
}

- (void)initQueues
{
  v4.receiver = a1;
  v4.super_class = (Class)__NSCFLocalDownloadFile;
  v1 = objc_msgSendSuper2(&v4, sel_init);
  if (v1)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v1[20] = dispatch_queue_create("com.apple.__NSCFLocalDownloadFile", v2);
  }
  return v1;
}

- (void)initWithFullPath:(void *)a3 protectionType:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v5 = -[__NSCFLocalDownloadFile initQueues](a1);
  int v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic_copy(v5, v6, a3, 208);
    snprintf(__str, 0x400uLL, "%s", (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "UTF8String"));
    int v8 = open(__str, 2561, 438);
    if (v8 < 0)
    {
      uint64_t v11 = __error();
      int v12 = *v11;
      *((_DWORD *)v7 + 47) = *v11;
      if (v12 != 17)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        int v13 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          int v15 = *((_DWORD *)v7 + 47);
          *(_DWORD *)buf = 67109378;
          int v17 = v15;
          __int16 v18 = 2080;
          v19 = __str;
          _os_log_error_impl(&dword_184085000, v13, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d creating download file: %s", buf, 0x12u);
        }
      }
    }
    else
    {
      int v9 = v8;
      objc_msgSend(v7, "setPath:", (id)objc_msgSend([NSString alloc], "initWithUTF8String:", __str));
      [(__NSCFLocalDownloadFile *)v7 setFileDataProtection];
      close(v9);
      *((unsigned char *)v7 + 184) = 1;
    }
  }
  return v7;
}

- (void)truncate
{
  if (a1)
  {
    v1 = *(NSObject **)(a1 + 152);
    if (v1)
    {
      *(unsigned char *)(a1 + 186) = 0;
      barrier[0] = MEMORY[0x1E4F143A8];
      barrier[1] = 3221225472;
      barrier[2] = __35____NSCFLocalDownloadFile_truncate__block_invoke;
      barrier[3] = &unk_1E5258228;
      barrier[4] = a1;
      dispatch_io_barrier(v1, barrier);
    }
    else
    {
      *(unsigned char *)(a1 + 186) = 1;
    }
  }
}

@end
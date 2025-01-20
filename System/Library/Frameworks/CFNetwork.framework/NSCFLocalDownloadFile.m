@interface NSCFLocalDownloadFile
@end

@implementation NSCFLocalDownloadFile

uint64_t __52____NSCFLocalDownloadFile_finishOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    *(_DWORD *)(v1 + 188) = *(_DWORD *)(a1 + 48);
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __36____NSCFLocalDownloadFile_ioChannel__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18531D6D0]();
  fstat(*(_DWORD *)(a1 + 40), (stat *)(*(void *)(a1 + 32) + 8));
  close(*(_DWORD *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 168) = 1;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    Property = (void (**)(id))objc_getProperty(v4, v3, 200, 1);
    v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_setProperty_atomic_copy(v7, v5, 0, 200);
    }
    if (Property) {
      Property[2](Property);
    }
  }
}

void __52____NSCFLocalDownloadFile_finishOnQueue_completion___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52____NSCFLocalDownloadFile_finishOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E5257FD8;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v2, block);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke_2(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4 || a2)
  {
    if (a4)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v6 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [*(id *)(a1 + 32) path];
        *(_DWORD *)buf = 67109378;
        int v14 = a4;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_error_impl(&dword_184085000, v6, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d writing for ioChannel, file: %@", buf, 0x12u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke_9;
    block[3] = &unk_1E52554F8;
    uint64_t v8 = *(void *)(a1 + 32);
    v7 = *(NSObject **)(a1 + 40);
    int v12 = a4;
    uint64_t v9 = *(void *)(a1 + 48);
    block[4] = v8;
    void block[5] = v9;
    dispatch_async(v7, block);
  }
}

off_t __35____NSCFLocalDownloadFile_truncate__block_invoke(uint64_t a1)
{
  off_t result = dispatch_io_get_descriptor(*(dispatch_io_t *)(*(void *)(a1 + 32) + 152));
  if (result != -1)
  {
    return lseek(result, 0, 0);
  }
  return result;
}

uint64_t __65____NSCFLocalDownloadFile_writeBytes_completionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(unsigned int *)(v3 + 188);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v4);
}

@end
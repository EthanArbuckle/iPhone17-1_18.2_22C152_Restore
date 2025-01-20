@interface FigCaptureTempFileRemover
- (FigCaptureTempFileRemover)init;
- (void)_removeStaleTempFilesInFolderURL:(id)a3;
- (void)_scheduleNextFileRemove;
- (void)dealloc;
@end

@implementation FigCaptureTempFileRemover

- (FigCaptureTempFileRemover)init
{
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureTempFileRemover;
  v2 = [(FigCaptureTempFileRemover *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1A5EFD4F0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    *((void *)v3 + 3) = dispatch_queue_create("com.apple.coremedia.tempfileremover", v5);
    *((void *)v3 + 4) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", FigCaptureStateDumpDirectory(), 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__FigCaptureTempFileRemover_init__block_invoke;
    v8[3] = &unk_1E5C24430;
    v8[4] = v3;
    v6 = (void *)[v8 copy];
    *((void *)v3 + 5) = v6;
    dispatch_async(*((dispatch_queue_t *)v3 + 3), v6);
  }
  return (FigCaptureTempFileRemover *)v3;
}

uint64_t __33__FigCaptureTempFileRemover_init__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_removeStaleTempFilesInFolderURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", *(void *)(*((void *)&v8 + 1) + 8 * i)));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  return [*(id *)(a1 + 32) _scheduleNextFileRemove];
}

- (void)dealloc
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_7);

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureTempFileRemover;
  [(FigCaptureTempFileRemover *)&v3 dealloc];
}

- (void)_scheduleNextFileRemove
{
  dispatch_time_t v3 = dispatch_time(0, (uint64_t)(self->_checkTimeSeconds * 1000000000.0));
  queue = self->_queue;
  id fileRemoverBlock = self->_fileRemoverBlock;
  dispatch_after(v3, queue, fileRemoverBlock);
}

- (void)_removeStaleTempFilesInFolderURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  uint64_t v5 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, objc_msgSend(MEMORY[0x1E4F1C978], "array"), 0, &v28);
  if (v28)
  {
    FigDebugAssert3();
  }
  else
  {
    v7 = (void *)v6;
    long long v8 = (void *)[MEMORY[0x1E4F1C9C8] now];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      v12 = &off_1E96B6000;
      v22 = v8;
      v23 = self;
      v21 = v7;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v7);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v15 = objc_msgSend(v5, "attributesOfItemAtPath:error:", objc_msgSend(v14, "path", v19, v20), &v28);
          if (!v28)
          {
            objc_msgSend(v8, "timeIntervalSinceDate:", objc_msgSend(v15, "fileCreationDate"));
            if (v16 >= self->_staleTimeSeconds)
            {
              if (objc_msgSend(v5, "removeItemAtPath:error:", objc_msgSend(v14, "path"), &v28)) {
                BOOL v17 = *((_DWORD *)v12 + 570) == 0;
              }
              else {
                BOOL v17 = 1;
              }
              if (!v17)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                long long v8 = v22;
                self = v23;
                v12 = &off_1E96B6000;
                v7 = v21;
              }
            }
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }
  }
}

@end
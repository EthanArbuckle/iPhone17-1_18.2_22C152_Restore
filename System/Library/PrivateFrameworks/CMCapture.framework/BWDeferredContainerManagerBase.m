@interface BWDeferredContainerManagerBase
+ (void)initialize;
- (BWDeferredContainerManagerBase)initWithQueuePriority:(unsigned int)a3;
- (id)manifestForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5;
- (id)manifestsForApplicationID:(id)a3 err:(int *)a4;
- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4;
- (uint64_t)_insertUniqueManifestIntoTimeSortedArray:(void *)a3 manifestArray:;
- (void)_containerURLForApplicationID:(uint64_t)a3 captureRequestIdentifier:(int)a4 processingContainer:(char *)a5 exists:(unsigned char *)a6 isDirectory:(void *)a7 resolvedApplicationID:;
- (void)dealloc;
@end

@implementation BWDeferredContainerManagerBase

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWDeferredContainerManagerBase)initWithQueuePriority:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWDeferredContainerManagerBase;
  v3 = [(BWDeferredContainerManagerBase *)&v6 init];
  v4 = v3;
  if (v3)
  {
    pthread_rwlock_init(&v3->_lock, 0);
    v4->_timerQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v4;
}

- (void)dealloc
{
}

- (void)_containerURLForApplicationID:(uint64_t)a3 captureRequestIdentifier:(int)a4 processingContainer:(char *)a5 exists:(unsigned char *)a6 isDirectory:(void *)a7 resolvedApplicationID:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v11 = a2;
  v35 = @"/var/mobile/Media/Deferred/CaptureContainers";
  v36 = a2;
  uint64_t v37 = a3;
  v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v35, 3));
  v13 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  char v34 = 0;
  if (objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v34))
  {
    char v14 = 1;
LABEL_22:
    v23 = a5;
    v22 = (void *)[v11 copy];
    goto LABEL_23;
  }
  v27 = v11;
  char v28 = a4;
  if ([v11 isEqualToString:0x1EFA44100])
  {
    if (!a4) {
      goto LABEL_18;
    }
  }
  else if (![v11 isEqualToString:0x1EFA55820] || (a4 & 1) == 0)
  {
    goto LABEL_18;
  }
  v15 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Media/Deferred/CaptureContainers"];
  v17 = (void *)[v15 enumeratorAtURL:v16 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:5 errorHandler:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    v26 = a7;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v11 = (void *)[*(id *)(*((void *)&v30 + 1) + 8 * i) lastPathComponent];
        if (([v11 isEqualToString:0x1EFA44100] & 1) == 0)
        {
          v35 = @"/var/mobile/Media/Deferred/CaptureContainers";
          v36 = v11;
          uint64_t v37 = a3;
          v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v35, 3));
          if (objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v34))
          {
            char v14 = 1;
            a7 = v26;
            goto LABEL_22;
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      a7 = v26;
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_18:
  if ((v28 & 1) == 0)
  {
    v11 = v27;
    v35 = @"/var/mobile/Media/Deferred/CaptureContainers";
    v36 = v27;
    uint64_t v37 = a3;
    v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v35, 3));
    char v14 = 0;
    goto LABEL_22;
  }
  char v14 = 0;
  v22 = 0;
  v23 = a5;
LABEL_23:
  if (dword_1EB4C5550)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v23) {
    char *v23 = v14;
  }
  if (a6) {
    *a6 = v34;
  }
  if (a7) {
    *a7 = v22;
  }

  return v12;
}

- (uint64_t)_insertUniqueManifestIntoTimeSortedArray:(void *)a3 manifestArray:
{
  if (result)
  {
    if (a2
      && a3
      && ((unint64_t v5 = objc_msgSend(a3, "indexOfObject:inSortedRange:options:usingComparator:", a2, 0, objc_msgSend(a3, "count"), 1280, &__block_literal_global_48), v5 >= objc_msgSend(a3, "count"))|| !objc_msgSend(+[BWDeferredCaptureContainer captureRequestIdentifierForManifest:](BWDeferredCaptureContainer, "captureRequestIdentifierForManifest:", a2), "isEqualToString:", +[BWDeferredCaptureContainer captureRequestIdentifierForManifest:](BWDeferredCaptureContainer, "captureRequestIdentifierForManifest:", objc_msgSend(a3, "objectAtIndexedSubscript:", v5)))))
    {
      [a3 insertObject:a2 atIndex:v5];
      return 1;
    }
    else
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

uint64_t __89__BWDeferredContainerManagerBase__insertUniqueManifestIntoTimeSortedArray_manifestArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[BWDeferredCaptureContainer timeForManifest:a2 index:0];
  id v5 = +[BWDeferredCaptureContainer timeForManifest:a3 index:0];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v5) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v4) {
      return 1;
    }
    else {
      return v7;
    }
  }
  else
  {
    return [v4 compare:v5];
  }
}

- (id)manifestsForApplicationID:(id)a3 err:(int *)a4
{
  if (a4) {
    *a4 = -16134;
  }
  return 0;
}

- (id)manifestForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  if (!a3)
  {
    FigDebugAssert3();
    id v6 = 0;
    goto LABEL_5;
  }
  id v6 = a4;
  if (!a4)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  uint64_t v12 = 0;
  -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 1, 0, 0, &v12);
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  v15[0] = @"/var/mobile/Media/Deferred/CaptureContainers";
  v15[1] = v12;
  v15[2] = v6;
  v14[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 3)), "path");
  v14[1] = @"manifest.plist";
  uint64_t v8 = objc_msgSend(v7, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 2));
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v8 error:&v13];
  if ([v6 count])
  {
    id v9 = v6;
LABEL_5:
    int v10 = 0;
    goto LABEL_10;
  }
  if (v13) {
    int v10 = [v13 code];
  }
  else {
    int v10 = -16824;
  }

LABEL_10:
  *a5 = v10;
  return v6;
}

- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  v12[16] = *(id *)MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    FigDebugAssert3();
    return 0;
  }
  uint64_t v11 = 0;
  char v10 = 0;
  id v4 = -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 1, &v10, 0, &v11);
  if (!v10) {
    return 0;
  }
  id v5 = v4;
  if (dword_1EB4C5550)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12[0] = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v8, v9), "removeItemAtPath:error:", objc_msgSend(v5, "path"), v12);
  int result = (int)v12[0];
  if (v12[0]) {
    return [v12[0] code];
  }
  return result;
}

@end
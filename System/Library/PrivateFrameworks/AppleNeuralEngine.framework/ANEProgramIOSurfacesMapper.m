@interface ANEProgramIOSurfacesMapper
@end

@implementation ANEProgramIOSurfacesMapper

void __41___ANEProgramIOSurfacesMapper_initialize__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ane.programIOSurfacesMapper", v2);
  v1 = (void *)gANEMemoryMapperQueue;
  gANEMemoryMapperQueue = (uint64_t)v0;
}

void __83___ANEProgramIOSurfacesMapper_mapIOSurfacesWithModel_request_cacheInference_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) controller];
  uint64_t v3 = [v2 device];
  if (v3 && *(void *)v3) {
    unsigned int v4 = (*(uint64_t (**)(uint64_t, void, BOOL))(*(void *)v3 + 56))(v3, *(void *)(a1 + 64), *(unsigned char *)(a1 + 80) != 0);
  }
  else {
    unsigned int v4 = 2;
  }

  v5 = +[_ANELog common];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 72));
    int v12 = 138412546;
    v13 = v6;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    _os_log_impl(&dword_1DB8AB000, v5, OS_LOG_TYPE_INFO, "-----> %@: ANEProgramMemoryMapRequest() ret=0x%x ", (uint8_t *)&v12, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v9 = +[_ANEErrors programIOSurfacesMapErrorForMethod:v8 code:v4];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

LABEL_13:
    return;
  }
  int v7 = *(unsigned __int8 *)(a1 + 80);
  if (*(unsigned char *)(a1 + 80))
  {
    v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 64) + 3088)];
  }
  else
  {
    v8 = 0;
  }
  [*(id *)(a1 + 40) setTransactionHandle:v8];
  if (v7) {
    goto LABEL_13;
  }
}

void __70___ANEProgramIOSurfacesMapper_unmapIOSurfacesWithModel_request_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) controller];
  uint64_t v3 = [v2 device];
  if (v3 && *(void *)v3) {
    unsigned int v4 = (*(uint64_t (**)(uint64_t, void))(*(void *)v3 + 64))(v3, *(void *)(a1 + 56));
  }
  else {
    unsigned int v4 = 2;
  }

  v5 = +[_ANELog common];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v11 = 138412546;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = v4;
    _os_log_impl(&dword_1DB8AB000, v5, OS_LOG_TYPE_INFO, "-----> %@: ANEProgramMemoryUnMapRequest() ret=0x%x ", (uint8_t *)&v11, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    int v7 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v8 = +[_ANEErrors programIOSurfacesUnmapErrorForMethod:v7 code:v4];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

@end
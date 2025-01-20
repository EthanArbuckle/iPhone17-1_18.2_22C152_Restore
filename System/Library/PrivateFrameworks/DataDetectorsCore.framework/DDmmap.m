@interface DDmmap
@end

@implementation DDmmap

void ___DDmmap_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  v2 = DDLogHandle_error_log_handle;
  if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315138;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_19DC95000, v2, OS_LOG_TYPE_ERROR, "DDCache: loading files from network file systems is not supported (this will only be logged once. first seen with %s)", (uint8_t *)&v4, 0xCu);
  }
}

@end
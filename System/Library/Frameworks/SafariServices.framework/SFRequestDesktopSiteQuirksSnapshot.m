@interface SFRequestDesktopSiteQuirksSnapshot
@end

@implementation SFRequestDesktopSiteQuirksSnapshot

void __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_2(v12, (uint64_t)v8, (uint64_t)v7);
    }
    goto LABEL_7;
  }
  unint64_t v9 = [v8 unsignedIntegerValue];
  if (v9 >= 2)
  {
    uint64_t v10 = v9;
    v11 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_1((uint64_t)v7, v10, v11);
    }
LABEL_7:
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Invalied value %lu for key %@ in request desktop site quirks", (uint8_t *)&v3, 0x16u);
}

void __66___SFRequestDesktopSiteQuirksSnapshot_initWithSnapshotData_error___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1;
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_1A690B000, v4, OS_LOG_TYPE_ERROR, "Unexpected value %@ for key %@ in request desktop site quirks", (uint8_t *)&v5, 0x16u);
}

@end
@interface LSAppsAnalyticsStartListening
@end

@implementation LSAppsAnalyticsStartListening

void ___LSAppsAnalyticsStartListening_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = (void *)MEMORY[0x18530F680]();
  v4 = (_xpc_activity_s *)v2;
  xpc_activity_state_t state = xpc_activity_get_state(v4);
  v6 = _LSDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(v9) = 134217984;
    *(void *)((char *)&v9 + 4) = state;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_INFO, "Default apps analytics activity state: %lli", (uint8_t *)&v9, 0xCu);
  }

  if (state == 2)
  {
    if (xpc_activity_set_state(v4, 4))
    {
      v7 = +[LSDBExecutionContext sharedServerInstance]();
      *(void *)&long long v9 = MEMORY[0x1E4F143A8];
      *((void *)&v9 + 1) = 3221225472;
      v10 = ___ZN14LaunchServices13AppsAnalyticsL14handleActivityEPU24objcproto13OS_xpc_object8NSObject_block_invoke;
      v11 = &unk_1E522BB38;
      v12 = v4;
      -[LSDBExecutionContext performAsyncRead:]((uint64_t)v7, &v9);

      v8 = v12;
    }
    else
    {
      v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_INFO, "Failed to continue analytics activity.", (uint8_t *)&v9, 2u);
      }
    }
  }
}

@end
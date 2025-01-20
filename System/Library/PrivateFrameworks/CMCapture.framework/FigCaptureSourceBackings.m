@interface FigCaptureSourceBackings
+ (id)sharedCaptureSourceBackings;
+ (void)initialize;
- (FigCaptureSourceBackings)initWithSourceInfoDictionaries:(id)a3 commonSettings:(id)a4 hevcSettings:(id)a5 h264Settings:(id)a6;
- (FigCaptureSourceCommonSettings)commonSettings;
- (NSArray)sourceInfoDictionaries;
- (NSDictionary)continuityCaptureCameraCapabilities;
- (NSDictionary)h264Settings;
- (NSDictionary)hevcSettings;
- (uint64_t)updateSourceInfoDictionariesWithEntriesByDeviceIDs:(uint64_t)result;
- (void)addSourceInfoDictionaries:(id)a3;
- (void)dealloc;
- (void)removeSourceInfoDictionaries:(id)a3;
@end

@implementation FigCaptureSourceBackings

- (NSDictionary)hevcSettings
{
  return self->_hevcSettings;
}

- (NSDictionary)h264Settings
{
  return self->_h264Settings;
}

+ (id)sharedCaptureSourceBackings
{
  v56[16] = *(id *)MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)gCaptureSourceBackingsLock);
  if (gSourceInfoArrayChanged != 1)
  {
    v5 = (void *)gCaptureSourceBackings;
    if (gCaptureSourceBackings) {
      goto LABEL_53;
    }
    goto LABEL_10;
  }
  gSourceInfoArrayChanged = 0;
  char v3 = gDefaultDeviceStreamsChanged;
  if (gDefaultDeviceStreamsChanged == 1)
  {

    gCaptureSourceBackings = 0;
    gDefaultDeviceStreamsChanged = 0;
  }
  if (dword_1EB4C5710)
  {
    LODWORD(v46) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (gCaptureSourceBackings) {
    goto LABEL_28;
  }
  if ((v3 & 1) == 0)
  {
LABEL_10:
    CFPropertyListRef v6 = CFPreferencesCopyValue(@"CaptureSourceInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v6)
    {
      v7 = (void *)v6;
      if (dword_1EB4C5710)
      {
        LODWORD(v46) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      gCaptureSourceBackings = (uint64_t)csu_createBackingsFromCaptureSourceInfoDict(v7);
    }
    if (gCaptureSourceBackings) {
      goto LABEL_21;
    }
  }
  if (dword_1EB4C5710)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v55 = 0x1EFA45440;
  v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v55, 1, v39, v40);
  v56[0] = 0;
  *(void *)v52 = 0;
  *(void *)&long long v46 = 0;
  *(void *)type = 0;
  int v11 = csu_createSourceInfoDictionariesFromAVCaptureSessionPlistForCaptureDeviceIDs(v10, v56, v52, &v46, type);
  if (v11)
  {
    uint64_t v40 = v2;
    LODWORD(v39) = v11;
    FigDebugAssert3();
    uint64_t v13 = 0;
  }
  else
  {
    v12 = [FigCaptureSourceBackings alloc];
    uint64_t v13 = [(FigCaptureSourceBackings *)v12 initWithSourceInfoDictionaries:v56[0] commonSettings:*(void *)v52 hevcSettings:(void)v46 h264Settings:*(void *)type];
  }

  gCaptureSourceBackings = v13;
  CFPropertyListRef v14 = CFPreferencesCopyValue(@"CaptureSourceInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v14)
  {
    v15 = (void *)v14;

    gCaptureSourceBackings = (uint64_t)csu_createBackingsFromCaptureSourceInfoDict(v15);
  }
LABEL_21:
  if (dword_1EB4C5710)
  {
    LODWORD(v46) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v17 = v46;
    if (os_log_type_enabled(v16, type[0])) {
      unsigned int v18 = v17;
    }
    else {
      unsigned int v18 = v17 & 0xFFFFFFFE;
    }
    if (v18)
    {
      int v19 = objc_msgSend((id)objc_msgSend((id)gCaptureSourceBackings, "sourceInfoDictionaries"), "count");
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = "cs_getBackingsForBuiltInCameras";
      __int16 v53 = 1024;
      int v54 = v19;
      LODWORD(v40) = 18;
      v39 = v52;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_28:
  id v50 = 0;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21 = objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "deviceIDs");
  v22 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v21];
  [v22 removeObject:0x1EFA45440];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v23 = v20;
  v24 = (void *)[(id)gCaptureSourceBackings sourceInfoDictionaries];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v47;
    v41 = v24;
    v42 = v21;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v47 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", @"MediaType", v39, v40), "isEqualToString:", @"vide"))
        {
          uint64_t v30 = objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", @"Attributes"), "objectForKeyedSubscript:", @"CaptureDeviceID");
          [v22 removeObject:v30];
          if (([v21 containsObject:v30] & 1) == 0)
          {
            if (dword_1EB4C5710)
            {
              LODWORD(v45) = 0;
              v44[0] = OS_LOG_TYPE_DEFAULT;
              v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v24 = v41;
              v21 = v42;
            }
            objc_msgSend(v23, "addObject:", v29, v39);
          }
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v26);
  }
  *(void *)v44 = 0;
  id v45 = 0;
  id v43 = 0;
  if (csu_createSourceInfoDictionariesFromAVCaptureSessionPlistForCaptureDeviceIDs(v22, &v50, &v45, v44, &v43))
  {
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(v50, "count", v39, v40))
  {
    if (gCaptureSourceBackings)
    {
      [(id)gCaptureSourceBackings addSourceInfoDictionaries:v50];
    }
    else
    {
      v33 = [FigCaptureSourceBackings alloc];
      gCaptureSourceBackings = [(FigCaptureSourceBackings *)v33 initWithSourceInfoDictionaries:v50 commonSettings:v45 hevcSettings:*(void *)v44 h264Settings:v43];
    }
  }
  if ([v23 count]) {
    [(id)gCaptureSourceBackings removeSourceInfoDictionaries:v23];
  }
  if (dword_1EB4C5710)
  {
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C5710)
    {
      v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EB4C5710)
      {
        v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }

  v5 = (void *)gCaptureSourceBackings;
LABEL_53:
  id v37 = v5;
  pthread_mutex_unlock((pthread_mutex_t *)gCaptureSourceBackingsLock);
  return v37;
}

- (FigCaptureSourceCommonSettings)commonSettings
{
  return self->_commonSettings;
}

- (NSArray)sourceInfoDictionaries
{
  return &self->_sourceInfoDictionaries->super;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    gCaptureSourceBackingsLock = FigSimpleMutexCreate();
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1EFA5DB40, +[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), 0, &__block_literal_global_52);
    uint64_t v2 = +[BWFigCaptureDeviceVendor videoCaptureDeviceFirmwareIsLoaded];
    if ((v2 & 1) == 0)
    {
      CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      CFPreferencesSetValue(@"CaptureSourceInfo", 0, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      uint64_t v2 = CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v4, v5);
    }
    FigCaptureDeviceGetNotificationCenter(v2, v3);
    uint64_t v6 = FigNotificationCenterAddWeakListener();
    if (v6) {
      uint64_t v6 = FigDebugAssert3();
    }
    FigCaptureDeviceGetNotificationCenter(v6, v7);
    uint64_t v8 = FigNotificationCenterAddWeakListener();
    if (v8) {
      uint64_t v8 = FigDebugAssert3();
    }
    FigCaptureDeviceGetNotificationCenter(v8, v9);
    if (FigNotificationCenterAddWeakListener()) {
      FigDebugAssert3();
    }
  }
}

- (FigCaptureSourceBackings)initWithSourceInfoDictionaries:(id)a3 commonSettings:(id)a4 hevcSettings:(id)a5 h264Settings:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)FigCaptureSourceBackings;
  v10 = [(FigCaptureSourceBackings *)&v12 init];
  if (v10)
  {
    v10->_sourceInfoDictionaries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(FigCaptureSourceBackings *)v10 addSourceInfoDictionaries:a3];
    v10->_commonSettings = (FigCaptureSourceCommonSettings *)-[FigCaptureSourceCommonSettings initWithCommonSettingsDictionary:]([FigCaptureSourceCommonSettings alloc], a4);
    v10->_hevcSettings = (NSDictionary *)a5;
    v10->_h264Settings = (NSDictionary *)a6;
  }
  return v10;
}

- (void)addSourceInfoDictionaries:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  FigSimpleMutexCheckIsLockedOnThisThread();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        FigSimpleMutexCheckIsLockedOnThisThread();
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"MediaType"), "isEqualToString:", @"soun"))
        {
          if (self->_hasMicSource) {
            continue;
          }
          self->_hasMicSource = 1;
        }
        [(NSMutableArray *)self->_sourceInfoDictionaries addObject:v9];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __38__FigCaptureSourceBackings_initialize__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", 0x1EFA5DB40) & 1) == 0) {
    return FigDebugAssert3();
  }
  return csu_postSourceInfoArrayChangedNotificationIfNecessary(0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceBackings;
  [(FigCaptureSourceBackings *)&v3 dealloc];
}

- (void)removeSourceInfoDictionaries:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  FigSimpleMutexCheckIsLockedOnThisThread();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        FigSimpleMutexCheckIsLockedOnThisThread();
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"MediaType"), "isEqualToString:", @"soun"))self->_hasMicSource = 0; {
        [(NSMutableArray *)self->_sourceInfoDictionaries removeObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (uint64_t)updateSourceInfoDictionariesWithEntriesByDeviceIDs:(uint64_t)result
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = (void *)result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    unsigned int v17 = (void *)[MEMORY[0x1E4F1CA48] array];
    v16 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    CFPropertyListRef v14 = v2;
    obuint64_t j = (id)v2[1];
    uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v4 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"Attributes"), "objectForKeyedSubscript:", @"CaptureDeviceID");
          uint64_t v5 = objc_msgSend(a2, "objectForKeyedSubscript:");
          if ([v5 count])
          {
            v21 = v4;
            uint64_t v22 = i;
            uint64_t v6 = (void *)[v4 mutableCopy];
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v7)
            {
              uint64_t v8 = v7;
              uint64_t v23 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v8; ++j)
                {
                  if (*(void *)v25 != v23) {
                    objc_enumerationMutation(v5);
                  }
                  uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                  if (dword_1EB4C5710)
                  {
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", v10, v12, v13), v10);
                }
                uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v8);
            }
            [v17 addObject:v21];
            [v16 addObject:v6];

            uint64_t i = v22;
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v20);
    }
    [v14 removeSourceInfoDictionaries:v17];
    return [v14 addSourceInfoDictionaries:v16];
  }
  return result;
}

- (NSDictionary)continuityCaptureCameraCapabilities
{
  return self->_continuityCaptureCameraCapabilities;
}

@end
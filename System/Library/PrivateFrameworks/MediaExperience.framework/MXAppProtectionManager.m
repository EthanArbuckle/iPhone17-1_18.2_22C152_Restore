@interface MXAppProtectionManager
+ (id)sharedInstance;
- (MXAppProtectionManager)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)cancelLockedAppRemovalFromNowPlayingAppStack:(id)a3;
- (void)dealloc;
- (void)dumpDebugInfo;
- (void)handlePlayingStateChangedForNowPlayingApp:(id)a3 isCurrentlyPlaying:(BOOL)a4;
- (void)scheduleLockedAppRemovalFromNowPlayingAppStack:(id)a3;
@end

@implementation MXAppProtectionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_59);
  }
  return (id)sharedInstance_sSharedInstance_8;
}

MXAppProtectionManager *__40__MXAppProtectionManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXAppProtectionManager);
  sharedInstance_sSharedInstance_8 = (uint64_t)result;
  return result;
}

- (MXAppProtectionManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MXAppProtectionManager;
  v2 = [(MXAppProtectionManager *)&v7 init];
  if (v2)
  {
    if (MX_FeatureFlags_IsProtectedAppsEnabled())
    {
      v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->mSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.AppProtectionManager", v3);
      v2->mLockedApps = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v2->mLockedAppsToBeRemovedFromNowPlayingAppStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      mSerialQueue = v2->mSerialQueue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __30__MXAppProtectionManager_init__block_invoke;
      v6[3] = &unk_1E57C6368;
      v6[4] = v2;
      MXDispatchAsync((uint64_t)"-[MXAppProtectionManager init]", (uint64_t)"MX_AppProtectionManager.m", 85, 0, 0, mSerialQueue, (uint64_t)v6);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

uint64_t __30__MXAppProtectionManager_init__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v2 = (void *)getAPSubjectClass_softClass;
  uint64_t v20 = getAPSubjectClass_softClass;
  if (!getAPSubjectClass_softClass)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __getAPSubjectClass_block_invoke;
    v25 = &unk_1E57C5B30;
    v26 = &v15;
    __getAPSubjectClass_block_invoke((uint64_t)&v22);
    v2 = (void *)v16[5];
  }
  _Block_object_dispose(&v15, 8);
  *(void *)(*(void *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(v2, "subjectMonitorRegistry"), "addMonitor:subjectMask:", +[MXAppProtectionManager sharedInstance](MXAppProtectionManager, "sharedInstance"), 1);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__10;
  v19 = __Block_byref_object_dispose__10;
  v3 = (void *)getAPApplicationClass_softClass;
  uint64_t v20 = getAPApplicationClass_softClass;
  if (!getAPApplicationClass_softClass)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __getAPApplicationClass_block_invoke;
    v25 = &unk_1E57C5B30;
    v26 = &v15;
    __getAPApplicationClass_block_invoke((uint64_t)&v22);
    v3 = (void *)v16[5];
  }
  _Block_object_dispose(&v15, 8);
  v4 = (void *)[v3 lockedApplications];
  uint64_t result = [v4 countByEnumeratingWithState:&v11 objects:v21 count:16];
  uint64_t v6 = result;
  if (result)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) bundleIdentifier];
        if (v9) {
          [*(id *)(*(void *)(a1 + 32) + 16) addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v11 objects:v21 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)dealloc
{
  mSerialQueue = self->mSerialQueue;
  if (mSerialQueue)
  {
    dispatch_release(mSerialQueue);
    self->mSerialQueue = 0;
  }

  self->mLockedApps = 0;
  self->mLockedAppsToBeRemovedFromNowPlayingAppStack = 0;
  [(APSubjectMonitorSubscription *)self->mSubjectMonitor invalidate];
  self->mSubjectMonitor = 0;
  v4.receiver = self;
  v4.super_class = (Class)MXAppProtectionManager;
  [(MXAppProtectionManager *)&v4 dealloc];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  mSerialQueue = self->mSerialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__MXAppProtectionManager_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v5[3] = &unk_1E57C96F0;
  v5[4] = a3;
  v5[5] = self;
  MXDispatchSync((uint64_t)"-[MXAppProtectionManager appProtectionSubjectsChanged:forSubscription:]", (uint64_t)"MX_AppProtectionManager.m", 132, 0, 0, mSerialQueue, (uint64_t)v5);
}

uint64_t __71__MXAppProtectionManager_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = *(void **)(a1 + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
        uint64_t v8 = [v7 bundleIdentifier];
        int v9 = [*(id *)(*(void *)(a1 + 40) + 16) containsObject:v8];
        if ([v7 isLocked])
        {
          if ((v9 & 1) == 0)
          {
            if (dword_1E9359ED0)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "addObject:", v8, v14, v15);
            id v12 = CMSMNP_CopyNowPlayingAppSession();
            id v13 = CMSUtility_CopyBundleID(v12);
            if (([v13 isEqualToString:v8] & 1) == 0) {
              [*(id *)(a1 + 40) scheduleLockedAppRemovalFromNowPlayingAppStack:v8];
            }
          }
        }
        else if (v9)
        {
          if (dword_1E9359ED0)
          {
            long long v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "removeObject:", v8, v14, v15);
          [*(id *)(a1 + 40) cancelLockedAppRemovalFromNowPlayingAppStack:v8];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)handlePlayingStateChangedForNowPlayingApp:(id)a3 isCurrentlyPlaying:(BOOL)a4
{
  id v7 = a3;
  mSerialQueue = self->mSerialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__MXAppProtectionManager_handlePlayingStateChangedForNowPlayingApp_isCurrentlyPlaying___block_invoke;
  v9[3] = &unk_1E57CA038;
  v9[4] = self;
  v9[5] = a3;
  BOOL v10 = a4;
  MXDispatchAsync((uint64_t)"-[MXAppProtectionManager handlePlayingStateChangedForNowPlayingApp:isCurrentlyPlaying:]", (uint64_t)"MX_AppProtectionManager.m", 176, 0, 0, mSerialQueue, (uint64_t)v9);
}

void __87__MXAppProtectionManager_handlePlayingStateChangedForNowPlayingApp_isCurrentlyPlaying___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      [v2 cancelLockedAppRemovalFromNowPlayingAppStack:v3];
    }
    else {
      [v2 scheduleLockedAppRemovalFromNowPlayingAppStack:v3];
    }
  }
  uint64_t v4 = *(void **)(a1 + 40);
}

- (void)scheduleLockedAppRemovalFromNowPlayingAppStack:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([+[MXNowPlayingAppManager sharedInstance] doesNowPlayingAppStackContain:a3])
  {
    mLockedAppsToBeRemovedFromNowPlayingAppStack = self->mLockedAppsToBeRemovedFromNowPlayingAppStack;
    id v12 = a3;
    v13[0] = [MEMORY[0x1E4F1C9C8] now];
    -[NSMutableArray addObject:](mLockedAppsToBeRemovedFromNowPlayingAppStack, "addObject:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1]);
    if (dword_1E9359ED0)
    {
      int v11 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    mSerialQueue = self->mSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MXAppProtectionManager_scheduleLockedAppRemovalFromNowPlayingAppStack___block_invoke;
    block[3] = &unk_1E57CA3A0;
    block[4] = self;
    block[5] = 30;
    dispatch_after(v7, mSerialQueue, block);
  }
}

void __73__MXAppProtectionManager_scheduleLockedAppRemovalFromNowPlayingAppStack___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v14 = v1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        dispatch_time_t v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "allKeys"), "firstObject");
        uint64_t v9 = objc_msgSend((id)objc_msgSend(v7, "allValues"), "firstObject");
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "now"), "timeIntervalSinceDate:", v9);
        if (v10 >= (double)*(uint64_t *)(v1 + 40))
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v1 = v14;
          }
          objc_msgSend(*(id *)(*(void *)(v1 + 32) + 24), "removeObject:", v7, v12, v13);
          [+[MXNowPlayingAppManager sharedInstance] removeFromNowPlayingAppStack:v8];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (void)cancelLockedAppRemovalFromNowPlayingAppStack:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[(NSMutableArray *)self->mLockedAppsToBeRemovedFromNowPlayingAppStack copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "allKeys"), "firstObject"), "isEqualToString:", a3))
        {
          if (dword_1E9359ED0)
          {
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[NSMutableArray removeObject:](self->mLockedAppsToBeRemovedFromNowPlayingAppStack, "removeObject:", v9, v11, v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)dumpDebugInfo
{
  mSerialQueue = self->mSerialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__MXAppProtectionManager_dumpDebugInfo__block_invoke;
  v3[3] = &unk_1E57C6368;
  v3[4] = self;
  MXDispatchSync((uint64_t)"-[MXAppProtectionManager dumpDebugInfo]", (uint64_t)"MX_AppProtectionManager.m", 250, 0, 0, mSerialQueue, (uint64_t)v3);
}

void __39__MXAppProtectionManager_dumpDebugInfo__block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    unsigned int v55 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v45 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v45 setDateFormat:@"YYYY-MM-dd HH:mm:ss:ms"];
  if (dword_1E9359ED0)
  {
    unsigned int v55 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v44 = a1;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v50, v63, 16, v38, v41);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v51 != v7) {
          objc_enumerationMutation(v4);
        }
        if (dword_1E9359ED0)
        {
          uint64_t v9 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          unsigned int v55 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          double v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v11 = v55;
          if (os_log_type_enabled(v10, type)) {
            unsigned int v12 = v11;
          }
          else {
            unsigned int v12 = v11 & 0xFFFFFFFE;
          }
          if (v12)
          {
            int v56 = 136315394;
            v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
            __int16 v58 = 2114;
            uint64_t v59 = v9;
            LODWORD(v42) = 22;
            v39 = &v56;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v6);
  }
  if (dword_1E9359ED0)
  {
    unsigned int v55 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v14 = v55;
    if (os_log_type_enabled(v13, type)) {
      unsigned int v15 = v14;
    }
    else {
      unsigned int v15 = v14 & 0xFFFFFFFE;
    }
    if (v15)
    {
      int v56 = 136315138;
      v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
      LODWORD(v42) = 12;
      v39 = &v56;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1E9359ED0)
    {
      unsigned int v55 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v17 = v55;
      if (os_log_type_enabled(v16, type)) {
        unsigned int v18 = v17;
      }
      else {
        unsigned int v18 = v17 & 0xFFFFFFFE;
      }
      if (v18)
      {
        int v56 = 136315138;
        v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
        LODWORD(v42) = 12;
        v39 = &v56;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v19 = *(void **)(*(void *)(v44 + 32) + 24);
  uint64_t v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v62, 16, v39, v42);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        uint64_t v25 = objc_msgSend((id)objc_msgSend(v24, "allKeys", v40, v43), "firstObject");
        uint64_t v26 = objc_msgSend((id)objc_msgSend(v24, "allValues"), "firstObject");
        if (dword_1E9359ED0)
        {
          uint64_t v27 = v26;
          unsigned int v55 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v29 = v55;
          if (os_log_type_enabled(v28, type)) {
            unsigned int v30 = v29;
          }
          else {
            unsigned int v30 = v29 & 0xFFFFFFFE;
          }
          if (v30)
          {
            uint64_t v31 = [v45 stringFromDate:v27];
            int v56 = 136315650;
            v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
            __int16 v58 = 2114;
            uint64_t v59 = v25;
            __int16 v60 = 2114;
            uint64_t v61 = v31;
            LODWORD(v43) = 32;
            v40 = &v56;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v62 count:16];
    }
    while (v21);
  }
  if (dword_1E9359ED0)
  {
    unsigned int v55 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v33 = v55;
    if (os_log_type_enabled(v32, type)) {
      unsigned int v34 = v33;
    }
    else {
      unsigned int v34 = v33 & 0xFFFFFFFE;
    }
    if (v34)
    {
      int v56 = 136315138;
      v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  if (dword_1E9359ED0)
  {
    unsigned int v55 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v36 = v55;
    if (os_log_type_enabled(v35, type)) {
      unsigned int v37 = v36;
    }
    else {
      unsigned int v37 = v36 & 0xFFFFFFFE;
    }
    if (v37)
    {
      int v56 = 136315138;
      v57 = "-[MXAppProtectionManager dumpDebugInfo]_block_invoke";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

@end
@interface CKAudioSessionController
+ (id)queue;
+ (id)shareInstance;
- (BOOL)isActive;
- (BOOL)isDirty;
- (BOOL)shouldDuckOthers;
- (BOOL)shouldStopPlayingWhenSilent;
- (BOOL)shouldUseSpeaker;
- (CKAudioSessionController)init;
- (unint64_t)options;
- (void)activateWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)audioSessionInterruption:(id)a3;
- (void)audioSessionMediaServicesWereLost:(id)a3;
- (void)audioSessionMediaServicesWereReset:(id)a3;
- (void)audioSessionRouteChange:(id)a3;
- (void)configureAudioSessionWithOptions:(unint64_t)a3;
- (void)deactivate;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setDirty:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation CKAudioSessionController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKAudioSessionController;
  [(CKAudioSessionController *)&v4 dealloc];
}

- (CKAudioSessionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKAudioSessionController;
  v2 = [(CKAudioSessionController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_audioSessionInterruption_ name:*MEMORY[0x1E4F15000] object:0];
    [v3 addObserver:v2 selector:sel_audioSessionRouteChange_ name:*MEMORY[0x1E4F15168] object:0];
    [v3 addObserver:v2 selector:sel_audioSessionMediaServicesWereLost_ name:*MEMORY[0x1E4F15030] object:0];
    [v3 addObserver:v2 selector:sel_audioSessionMediaServicesWereReset_ name:*MEMORY[0x1E4F15048] object:0];
  }
  return v2;
}

+ (id)shareInstance
{
  if (shareInstance_once != -1) {
    dispatch_once(&shareInstance_once, &__block_literal_global_245);
  }
  v2 = (void *)shareInstance_sAudioSessionController;

  return v2;
}

void __41__CKAudioSessionController_shareInstance__block_invoke()
{
  v0 = objc_alloc_init(CKAudioSessionController);
  v1 = (void *)shareInstance_sAudioSessionController;
  shareInstance_sAudioSessionController = (uint64_t)v0;
}

+ (id)queue
{
  if (queue_once != -1) {
    dispatch_once(&queue_once, &__block_literal_global_17);
  }
  v2 = (void *)queue_sQueue;

  return v2;
}

void __33__CKAudioSessionController_queue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("CKAudioSessionControllerQueue", v2);
  v1 = (void *)queue_sQueue;
  queue_sQueue = (uint64_t)v0;
}

- (void)activateWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)deactivate
{
}

- (BOOL)shouldUseSpeaker
{
  return [(CKAudioSessionController *)self options] & 1;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  return ([(CKAudioSessionController *)self options] >> 1) & 1;
}

- (BOOL)shouldDuckOthers
{
  return ([(CKAudioSessionController *)self options] >> 2) & 1;
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = _Block_copy(v8);
      *(_DWORD *)buf = 67109632;
      BOOL v19 = v6;
      __int16 v20 = 1024;
      int v21 = a4 & 1;
      __int16 v22 = 2048;
      v23 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);
    }
  }
  v11 = +[CKAudioSessionController queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__CKAudioSessionController_setActive_options_completion___block_invoke;
  v13[3] = &unk_1E562C150;
  BOOL v16 = v6;
  char v17 = a4 & 1;
  v13[4] = self;
  id v14 = v8;
  unint64_t v15 = a4;
  id v12 = v8;
  dispatch_async(v11, v13);
}

void __57__CKAudioSessionController_setActive_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = *(unsigned __int8 *)(a1 + 56);
      int v4 = *(unsigned __int8 *)(a1 + 57);
      objc_super v5 = _Block_copy(*(const void **)(a1 + 40));
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)__int16 v22 = v3;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v5;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "dispatching setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);
    }
  }
  int v6 = *(unsigned __int8 *)(a1 + 56);
  if (v6 != [*(id *)(a1 + 32) isActive]
    || *(unsigned char *)(a1 + 56) && (uint64_t v7 = *(void *)(a1 + 48), v7 != [*(id *)(a1 + 32) options])
    || [*(id *)(a1 + 32) isDirty])
  {
    id v8 = [MEMORY[0x1E4F153E0] sharedInstance];
    v9 = v8;
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 32) configureAudioSessionWithOptions:*(void *)(a1 + 48)];
      uint64_t v10 = *(unsigned __int8 *)(a1 + 56);
      id v20 = 0;
      char v11 = [v9 setActive:v10 error:&v20];
      id v12 = v20;
      if ((v11 & 1) == 0 && IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)__int16 v22 = v12;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "AudioSessionController: Failed to activate audio session: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v19 = 0;
      char v14 = [v8 setActive:0 withOptions:1 error:&v19];
      id v15 = v19;
      if ((v14 & 1) == 0 && IMOSLoggingEnabled())
      {
        BOOL v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)__int16 v22 = v15;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "AudioSessionController: Failed to deactivate audio session: %@", buf, 0xCu);
        }
      }
    }
    [*(id *)(a1 + 32) setActive:*(unsigned __int8 *)(a1 + 56)];
    [*(id *)(a1 + 32) setOptions:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setDirty:0];
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__CKAudioSessionController_setActive_options_completion___block_invoke_25;
    block[3] = &unk_1E5620F48;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__CKAudioSessionController_setActive_options_completion___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureAudioSessionWithOptions:(unint64_t)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v31 = @"CKAudioSessionControllerSessionNotificationOptionsKey";
  int v6 = [NSNumber numberWithUnsignedInteger:a3];
  v32[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [v5 postNotificationName:@"CKAudioSessionControllerSessionOptionsWillChangeNotification" object:self userInfo:v7];

  id v8 = [MEMORY[0x1E4F153E0] sharedInstance];
  uint64_t v9 = *MEMORY[0x1E4F15050];
  id v28 = 0;
  LOBYTE(self) = [v8 setMode:v9 error:&v28];
  id v10 = v28;
  if ((self & 1) == 0 && IMOSLoggingEnabled())
  {
    char v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30[0] = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "AudioSessionController: Failed setting the mode:%@", buf, 0xCu);
    }
  }
  int v12 = a3 & 1;
  uint64_t v13 = 44;
  if ((a3 & 1) == 0) {
    uint64_t v13 = 36;
  }
  if ((a3 & 2) != 0) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13;
  }
  id v15 = (id *)MEMORY[0x1E4F14F68];
  if ((a3 & 2) == 0) {
    id v15 = (id *)MEMORY[0x1E4F14F90];
  }
  id v16 = *v15;
  if ((a3 & 8) != 0)
  {
    id v17 = (id)*MEMORY[0x1E4F14F98];

    id v16 = v17;
  }

  id v27 = 0;
  char v18 = [v8 setCategory:v16 withOptions:v14 | (a3 >> 1) & 2 error:&v27];
  id v19 = v27;
  if ((v18 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30[0] = v19;
      _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "AudioSessionController: Failed setting the category:%@", buf, 0xCu);
    }
  }
  id v26 = 0;
  char v21 = [v8 setActivationContext:MEMORY[0x1E4F1CC08] error:&v26];
  id v22 = v26;
  if ((v21 & 1) == 0 && IMOSLoggingEnabled())
  {
    __int16 v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30[0] = v22;
      _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "AudioSessionController: Failed setting activation context:%@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v8 outputDataSources];
      *(_DWORD *)buf = 67109378;
      LODWORD(v30[0]) = v12;
      WORD2(v30[0]) = 2112;
      *(void *)((char *)v30 + 6) = v25;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "AudioSessionController: configureAudioSession using speaker = %d, %@", buf, 0x12u);
    }
  }
}

- (void)audioSessionRouteChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "audioSessionRouteChange: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  [(CKAudioSessionController *)self setDirty:1];
  if ([(CKAudioSessionController *)self isActive])
  {
    int v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F15178]];
    uint64_t v8 = [v7 unsignedIntegerValue];

    if ((unint64_t)(v8 - 1) <= 1)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Available audio routes changed", (uint8_t *)&v10, 2u);
        }
      }
      [(CKAudioSessionController *)self activateWithOptions:[(CKAudioSessionController *)self options] completion:0];
    }
  }
}

- (void)audioSessionInterruption:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "audioSessionInterruption: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAudioSessionController *)self setDirty:1];
}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereLost: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAudioSessionController *)self setDirty:1];
}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereReset: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKAudioSessionController *)self setDirty:1];
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
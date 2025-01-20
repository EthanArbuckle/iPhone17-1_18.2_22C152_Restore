@interface CBFrameLink
- (BOOL)isPaused;
- (CBFrameLink)init;
- (CBFrameLink)initWithDisplay:(__Display *)a3 andQueue:(id)a4;
- (double)targetTimestamp;
- (void)dealloc;
- (void)frameSync:(id)a3;
- (void)invalidate;
- (void)pause;
- (void)resume;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setFrameNotificationBlock:(id)a3;
- (void)setPreferredFramesPerSecond:(float)a3;
@end

@implementation CBFrameLink

- (CBFrameLink)init
{
  v22 = self;
  SEL v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)CBFrameLink;
  v22 = [(CBFrameLink *)&v20 init];
  if (v22)
  {
    os_log_t v2 = os_log_create("com.apple.CoreBrightness.FrameLink", "default");
    v22->_logHandle = (OS_os_log *)v2;
    uint64_t v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v22 selector:sel_frameSync_];
    v22->_displayLink = (CADisplayLink *)v3;
    if (!v22->_displayLink)
    {
      v19 = 0;
      if (v22->_logHandle)
      {
        logHandle = v22->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        logHandle = inited;
      }
      v19 = logHandle;
      char v18 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v19;
        os_log_type_t type = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_error_impl(&dword_1BA438000, log, type, "Cannot create CBFrameLink without CADisplayLink", v17, 2u);
      }
LABEL_23:

      v22 = 0;
      return 0;
    }
    [(CADisplayLink *)v22->_displayLink setPaused:1];
    v4 = +[CBSharedFrameLinkRunLoop addDisplayLinkToRunLoop:v22->_displayLink forMode:*MEMORY[0x1E4F1C3A0]];
    v22->_runLoopRef = v4;
    if (!v22->_runLoopRef)
    {
      v16 = 0;
      if (v22->_logHandle)
      {
        v9 = v22->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v8 = init_default_corebrightness_log();
        }
        v9 = v8;
      }
      v16 = v9;
      char v15 = 16;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v6 = v16;
        os_log_type_t v7 = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_error_impl(&dword_1BA438000, v6, v7, "Failed to add CADisplayLink to shared runloop", v14, 2u);
      }
      goto LABEL_23;
    }
  }
  return v22;
}

- (CBFrameLink)initWithDisplay:(__Display *)a3 andQueue:(id)a4
{
  id v54 = self;
  SEL v53 = a2;
  v52 = a3;
  id v51 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CBFrameLink;
  id v54 = [(CBFrameLink *)&v50 init];
  if (v54)
  {
    os_log_t v4 = os_log_create("com.apple.CoreBrightness.FrameLink", "default");
    *((void *)v54 + 1) = v4;
    if (!v52)
    {
      v49 = 0;
      if (*((void *)v54 + 1))
      {
        v28 = *((void *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v28 = inited;
      }
      v49 = v28;
      char v48 = 16;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        log = v49;
        os_log_type_t type = v48;
        __os_log_helper_16_0_0(v47);
        _os_log_error_impl(&dword_1BA438000, log, type, "Cannot create CBFrameLink without Display", v47, 2u);
      }
LABEL_53:

      id v54 = 0;
      return 0;
    }
    *((void *)v54 + 2) = v52;
    if (!v51)
    {
      v46 = 0;
      if (*((void *)v54 + 1))
      {
        v24 = *((void *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v23 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v23 = init_default_corebrightness_log();
        }
        v24 = v23;
      }
      v46 = v24;
      char v45 = 16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        SEL v21 = v46;
        os_log_type_t v22 = v45;
        __os_log_helper_16_0_0(v44);
        _os_log_error_impl(&dword_1BA438000, v21, v22, "Cannot create CBFrameLink without a queue", v44, 2u);
      }
      goto LABEL_53;
    }
    *((void *)v54 + 3) = v51;
    dispatch_retain(*((dispatch_object_t *)v54 + 3));
    uint64_t block = MEMORY[0x1E4F143A8];
    int v39 = -1073741824;
    int v40 = 0;
    v41 = __40__CBFrameLink_initWithDisplay_andQueue___block_invoke;
    v42 = &unk_1E6218FE0;
    id v43 = v54;
    dispatch_block_t v5 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INTERACTIVE, 0, &block);
    *((void *)v54 + 4) = v5;
    if (!*((void *)v54 + 4))
    {
      v37 = 0;
      if (*((void *)v54 + 1))
      {
        objc_super v20 = *((void *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v19 = init_default_corebrightness_log();
        }
        objc_super v20 = v19;
      }
      v37 = v20;
      char v36 = 16;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v17 = v37;
        os_log_type_t v18 = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_error_impl(&dword_1BA438000, v17, v18, "Cannot create CBFrameLink without high QOS dispatch block", v35, 2u);
      }
      goto LABEL_53;
    }
    uint64_t v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v54 selector:sel_frameSync_];
    *((void *)v54 + 5) = v6;
    if (!*((void *)v54 + 5))
    {
      v34 = 0;
      if (*((void *)v54 + 1))
      {
        v16 = *((void *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v15 = init_default_corebrightness_log();
        }
        v16 = v15;
      }
      v34 = v16;
      char v33 = 16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v13 = v34;
        os_log_type_t v14 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_error_impl(&dword_1BA438000, v13, v14, "Cannot create CBFrameLink without CADisplayLink", v32, 2u);
      }
      goto LABEL_53;
    }
    [*((id *)v54 + 5) setPaused:1];
    id v7 = +[CBSharedFrameLinkRunLoop addDisplayLinkToRunLoop:*((void *)v54 + 5) forMode:*MEMORY[0x1E4F1C3A0]];
    *((void *)v54 + 7) = v7;
    if (!*((void *)v54 + 7))
    {
      v31 = 0;
      if (*((void *)v54 + 1))
      {
        v12 = *((void *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v11 = init_default_corebrightness_log();
        }
        v12 = v11;
      }
      v31 = v12;
      char v30 = 16;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v9 = v31;
        os_log_type_t v10 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_error_impl(&dword_1BA438000, v9, v10, "Failed to add CADisplayLink to shared runloop", v29, 2u);
      }
      goto LABEL_53;
    }
  }
  return (CBFrameLink *)v54;
}

void __40__CBFrameLink_initWithDisplay_andQueue___block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;
  if (self->_runLoopRef)
  {

    v4->_runLoopRef = 0;
  }
  if (v4->_displayLink)
  {
    [(CADisplayLink *)v4->_displayLink invalidate];
    v4->_displayLink = 0;
  }
  if (v4->_logHandle) {

  }
  if (v4->_queue) {
    dispatch_release((dispatch_object_t)v4->_queue);
  }
  if (v4->_fadeCallbackBlock) {
    _Block_release(v4->_fadeCallbackBlock);
  }
  if (v4->_frameNotificationBlock)
  {
    _Block_release(v4->_frameNotificationBlock);
    v4->_frameNotificationBlock = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBFrameLink;
  [(CBFrameLink *)&v2 dealloc];
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (self->_queue)
  {
    dispatch_release((dispatch_object_t)self->_queue);
    self->_queue = 0;
  }
  if (a3)
  {
    self->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)self->_queue);
  }
}

- (void)pause
{
}

- (void)resume
{
}

- (BOOL)isPaused
{
  return [(CADisplayLink *)self->_displayLink isPaused];
}

- (void)setPreferredFramesPerSecond:(float)a3
{
}

- (void)frameSync:(id)a3
{
  v28 = self;
  SEL v27 = a2;
  id v26 = a3;
  v25 = 0;
  if (self->_logHandle)
  {
    logHandle = v28->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  v25 = logHandle;
  os_signpost_type_t v24 = OS_SIGNPOST_EVENT;
  unint64_t v23 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v25;
    os_signpost_type_t type = v24;
    os_signpost_id_t spid = v23;
    __os_log_helper_16_0_0(v22);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "FrameSync", (const char *)&unk_1BA61B929, v22, 2u);
  }
  if (v28->_fadeCallbackBlock)
  {
    queue = v28->_queue;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v17 = -1073741824;
    int v18 = 0;
    uint64_t v19 = __25__CBFrameLink_frameSync___block_invoke;
    objc_super v20 = &unk_1E6218FE0;
    SEL v21 = v28;
    dispatch_async(queue, &block);
  }
  if (v28->_frameNotificationBlock)
  {
    os_log_t v4 = v28->_queue;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    int v11 = -1073741824;
    int v12 = 0;
    v13 = __25__CBFrameLink_frameSync___block_invoke_23;
    os_log_type_t v14 = &unk_1E6218FE0;
    uint64_t v15 = v28;
    dispatch_async(v4, &v10);
  }
}

void __25__CBFrameLink_frameSync___block_invoke(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v20 = a1;
  uint64_t v19 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v10 = inited;
  }
  uint64_t v19 = v10;
  char v18 = 1;
  unint64_t v17 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v10))
  {
    log = v19;
    os_signpost_type_t type = v18;
    os_signpost_id_t spid = v17;
    __os_log_helper_16_0_0(v16);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "FrameSyncFadeCallbackBlock", (const char *)&unk_1BA61B929, v16, 2u);
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  uint64_t v15 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    dispatch_block_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v4 = init_default_corebrightness_log();
    }
    dispatch_block_t v5 = v4;
  }
  uint64_t v15 = v5;
  char v14 = 2;
  unint64_t v13 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v5))
  {
    v1 = v15;
    os_signpost_type_t v2 = v14;
    os_signpost_id_t v3 = v13;
    __os_log_helper_16_0_0(v12);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v1, v2, v3, "FrameSyncFadeCallbackBlock", (const char *)&unk_1BA61B929, v12, 2u);
  }
}

void __25__CBFrameLink_frameSync___block_invoke_23(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v20 = a1;
  uint64_t v19 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v10 = inited;
  }
  uint64_t v19 = v10;
  char v18 = 1;
  unint64_t v17 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v10))
  {
    log = v19;
    os_signpost_type_t type = v18;
    os_signpost_id_t spid = v17;
    __os_log_helper_16_0_0(v16);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, log, type, spid, "FrameSyncFrameNotificationBlock", (const char *)&unk_1BA61B929, v16, 2u);
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
  uint64_t v15 = 0;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    dispatch_block_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v4 = init_default_corebrightness_log();
    }
    dispatch_block_t v5 = v4;
  }
  uint64_t v15 = v5;
  char v14 = 2;
  unint64_t v13 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v5))
  {
    v1 = v15;
    os_signpost_type_t v2 = v14;
    os_signpost_id_t v3 = v13;
    __os_log_helper_16_0_0(v12);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v1, v2, v3, "FrameSyncFrameNotificationBlock", (const char *)&unk_1BA61B929, v12, 2u);
  }
}

- (void)invalidate
{
}

- (void)setFrameNotificationBlock:(id)a3
{
  if (self->_frameNotificationBlock)
  {
    _Block_release(self->_frameNotificationBlock);
    self->_frameNotificationBlock = 0;
  }
  if (a3) {
    self->_frameNotificationBlock = _Block_copy(a3);
  }
}

- (double)targetTimestamp
{
  [(CADisplayLink *)self->_displayLink targetTimestamp];
  return result;
}

@end
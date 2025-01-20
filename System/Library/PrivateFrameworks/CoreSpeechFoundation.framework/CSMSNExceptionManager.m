@interface CSMSNExceptionManager
+ (id)sharedInstance;
- (CSMSNExceptionManager)init;
- (NSMutableDictionary)announceMessageExceptions;
- (OS_dispatch_queue)queue;
- (void)beginAnnounceMessageException:(id)a3 reason:(id)a4;
- (void)endAnnounceMessageException:(id)a3 reason:(id)a4;
- (void)setAnnounceMessageExceptions:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSMSNExceptionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_announceMessageExceptions, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAnnounceMessageExceptions:(id)a3
{
}

- (NSMutableDictionary)announceMessageExceptions
{
  return self->_announceMessageExceptions;
}

- (void)endAnnounceMessageException:(id)a3 reason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"announcemessage"])
  {
    v8 = [NSString stringWithFormat:@"%@-%@", v6, v7];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__CSMSNExceptionManager_endAnnounceMessageException_reason___block_invoke;
    block[3] = &unk_1E6201088;
    block[4] = self;
    id v13 = v8;
    id v14 = v6;
    id v15 = v7;
    id v10 = v8;
    dispatch_async(queue, block);
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]";
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Unexpected exception request : %{public}@", buf, 0x16u);
    }
  }
}

void __60__CSMSNExceptionManager_endAnnounceMessageException_reason___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2
    || ([v2 objectForKeyedSubscript:*(void *)(a1 + 40)],
        (v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || ([*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 intValue],
        v4,
        v3,
        v5 <= 0))
  {
    uint64_t v8 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    id v10 = "%s There is no cached exception for %{public}@";
    v11 = v8;
    uint32_t v12 = 22;
    goto LABEL_19;
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  int v7 = [v6 intValue];

  if (v7 > 1)
  {
    id v13 = [NSNumber numberWithInt:(v7 - 1)];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v13 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  }
  id v14 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v14 || ![v14 count])
  {
    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Calling MSN end announce message exception for %{public}@", buf, 0x16u);
    }
    uint64_t v17 = [*(id *)(a1 + 48) UTF8String];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    __int16 v18 = (void (*)(uint64_t))getMSNMonitorEndExceptionSymbolLoc_ptr;
    v27 = getMSNMonitorEndExceptionSymbolLoc_ptr;
    if (!getMSNMonitorEndExceptionSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMSNMonitorEndExceptionSymbolLoc_block_invoke;
      v29 = &unk_1E62010B0;
      v30 = &v24;
      id v19 = (void *)MediaSafetyNetLibrary();
      uint64_t v20 = dlsym(v19, "MSNMonitorEndException");
      *(void *)(v30[1] + 24) = v20;
      getMSNMonitorEndExceptionSymbolLoc_ptr = *(_UNKNOWN **)(v30[1] + 24);
      __int16 v18 = (void (*)(uint64_t))v25[3];
    }
    _Block_object_dispose(&v24, 8);
    if (!v18)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v18(v17);
  }
  uint64_t v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
    v23 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSMSNExceptionManager endAnnounceMessageException:reason:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2114;
    v29 = v23;
    id v10 = "%s Updated announce message exception table : %{public}@, reason : %{public}@";
    v11 = v21;
    uint32_t v12 = 32;
LABEL_19:
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
  }
}

- (void)beginAnnounceMessageException:(id)a3 reason:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"announcemessage"])
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@-%@", v6, v7];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__CSMSNExceptionManager_beginAnnounceMessageException_reason___block_invoke;
    block[3] = &unk_1E6201088;
    block[4] = self;
    id v13 = v6;
    id v14 = v8;
    id v15 = v7;
    id v10 = v8;
    dispatch_async(queue, block);
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "-[CSMSNExceptionManager beginAnnounceMessageException:reason:]";
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Unexpected exception request : %{public}@", buf, 0x16u);
    }
  }
}

void __62__CSMSNExceptionManager_beginAnnounceMessageException_reason___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2 || ![v2 count])
  {
    v3 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSMSNExceptionManager beginAnnounceMessageException:reason:]_block_invoke";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Calling MSN begin announce message exception for %{public}@", buf, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 40) UTF8String];
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    id v6 = (void (*)(uint64_t))getMSNMonitorBeginExceptionSymbolLoc_ptr;
    uint64_t v22 = getMSNMonitorBeginExceptionSymbolLoc_ptr;
    if (!getMSNMonitorBeginExceptionSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getMSNMonitorBeginExceptionSymbolLoc_block_invoke;
      uint64_t v24 = &unk_1E62010B0;
      v25 = &v19;
      id v7 = (void *)MediaSafetyNetLibrary();
      uint64_t v8 = dlsym(v7, "MSNMonitorBeginException");
      *(void *)(v25[1] + 24) = v8;
      getMSNMonitorBeginExceptionSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
      id v6 = (void (*)(uint64_t))v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v6)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v6(v5);
  }
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v9
    || ([v9 objectForKeyedSubscript:*(void *)(a1 + 48)],
        id v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = v10 == 0,
        v10,
        v11))
  {
    uint64_t v14 = 1;
  }
  else
  {
    uint32_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 48)];
    int v13 = [v12 intValue];

    uint64_t v14 = (v13 + 1);
  }
  id v15 = [NSNumber numberWithInt:v14];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v15 forKeyedSubscript:*(void *)(a1 + 48)];

  uint64_t v16 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    __int16 v18 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSMSNExceptionManager beginAnnounceMessageException:reason:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v24 = v18;
    _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Updated announce message exception table : %{public}@, reason : %{public}@", buf, 0x20u);
  }
}

- (CSMSNExceptionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSMSNExceptionManager;
  v2 = [(CSMSNExceptionManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSMSNExceptionManager Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    announceMessageExceptions = v2->_announceMessageExceptions;
    v2->_announceMessageExceptions = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12883 != -1) {
    dispatch_once(&sharedInstance_onceToken_12883, &__block_literal_global_12884);
  }
  v2 = (void *)sharedInstance_sharedInstance_12885;
  return v2;
}

uint64_t __39__CSMSNExceptionManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_12885 = objc_alloc_init(CSMSNExceptionManager);
  return MEMORY[0x1F41817F8]();
}

@end
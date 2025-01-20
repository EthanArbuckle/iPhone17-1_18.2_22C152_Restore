@interface AHFTrackpadController
- (AHFTrackpadController)init;
- (BOOL)initializeTrackpadSystem;
- (HIDEventSystemClient)trackpadClient;
- (NSMutableDictionary)availableTrackpads;
- (OS_dispatch_queue)queue;
- (id)allPatterns;
- (int)getActuationIdForPattern:(id)a3;
- (int)playFeedback:(id)a3 accessoryID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (int)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (int)playFeedbackGated:(id)a3 client:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (unint64_t)prevTimestampUs;
- (void)dealloc;
- (void)setAvailableTrackpads:(id)a3;
- (void)setPrevTimestampUs:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTrackpadClient:(id)a3;
@end

@implementation AHFTrackpadController

- (AHFTrackpadController)init
{
  v7.receiver = self;
  v7.super_class = (Class)AHFTrackpadController;
  v2 = [(AHFTrackpadController *)&v7 init];
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("com.apple.hid.AppleHIDFeedback.Trackpad", 0),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v3,
        queue,
        v2->_queue))
  {
    v2->_prevTimestampUs = 0;
    v5 = 0;
    if ([(AHFTrackpadController *)v2 initializeTrackpadSystem]) {
      v5 = v2;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  dispatch_queue_t v3 = [(AHFTrackpadController *)self trackpadClient];

  if (v3)
  {
    v4 = [(AHFTrackpadController *)self trackpadClient];
    [v4 cancel];
  }
  v5.receiver = self;
  v5.super_class = (Class)AHFTrackpadController;
  [(AHFTrackpadController *)&v5 dealloc];
}

- (BOOL)initializeTrackpadSystem
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = (NSMutableDictionary *)objc_opt_new();
  availableTrackpads = self->_availableTrackpads;
  self->_availableTrackpads = v3;

  objc_super v5 = [(AHFTrackpadController *)self availableTrackpads];

  if (!v5) {
    return 0;
  }
  v6 = (HIDEventSystemClient *)[objc_alloc(MEMORY[0x263F41DD8]) initWithType:2];
  trackpadClient = self->_trackpadClient;
  self->_trackpadClient = v6;

  v8 = [(AHFTrackpadController *)self trackpadClient];

  if (!v8) {
    return 0;
  }
  v9 = [(AHFTrackpadController *)self trackpadClient];
  [v9 setMatching:&unk_26FC38C68];

  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke;
  v24[3] = &unk_265236118;
  objc_copyWeak(&v25, &location);
  v10 = (void (**)(void, void))MEMORY[0x24C572980](v24);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = [(AHFTrackpadController *)self trackpadClient];
  v12 = [v11 services];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        v10[2](v10, *(void *)(*((void *)&v20 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v13);
  }

  v16 = [(AHFTrackpadController *)self trackpadClient];
  [v16 setServiceNotificationHandler:v10];

  v17 = [(AHFTrackpadController *)self trackpadClient];
  [v17 setDispatchQueue:self->_queue];

  v18 = [(AHFTrackpadController *)self trackpadClient];
  [v18 activate];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  return 1;
}

void __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)[v3 serviceID];
    objc_super v7 = LoggingFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = "-[AHFTrackpadController initializeTrackpadSystem]_block_invoke";
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v7, OS_LOG_TYPE_DEFAULT, "%s Trackpad with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    v8 = [WeakRetained availableTrackpads];
    v9 = [NSNumber numberWithUnsignedLongLong:v6];
    [v8 setObject:v3 forKeyedSubscript:v9];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke_16;
    v10[3] = &unk_2652360F0;
    objc_copyWeak(v11, v4);
    v11[1] = v6;
    [v3 setRemovalHandler:v10];
    objc_destroyWeak(v11);
  }
}

void __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke_16(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = LoggingFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v7 = 136315650;
      v8 = "-[AHFTrackpadController initializeTrackpadSystem]_block_invoke";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v3, OS_LOG_TYPE_DEFAULT, "%s Trackpad with senderID 0x%llx removed in %s queue", (uint8_t *)&v7, 0x20u);
    }

    objc_super v5 = [WeakRetained availableTrackpads];
    v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v5 removeObjectForKey:v6];
  }
}

- (int)getActuationIdForPattern:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"detent_in"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"detent_out"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"edge"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"app_switcher"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"empty_app_switcher"])
  {
    int v4 = 19;
  }
  else if (([v3 isEqualToString:@"generic_selection"] & 1) != 0 {
         || ([v3 isEqualToString:@"index_bar_selection"] & 1) != 0)
  }
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"page_control_selection"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"drag_drop_table_edit"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"context_menu"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"state"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"refresh"])
  {
    int v4 = 36;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)playFeedbackGated:(id)a3 client:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = machTimeToMicrosec(a5);
  uint64_t v13 = [(AHFTrackpadController *)self getActuationIdForPattern:v10];
  if (v13)
  {
    uint64_t v19 = v13;
    uint64_t v20 = mach_absolute_time();
    unint64_t v21 = machTimeToMicrosec(v20);
    long long v22 = LoggingFramework();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      float v23 = (float)(v12 - self->_prevTimestampUs);
      *(_DWORD *)buf = 136315906;
      v34 = "-[AHFTrackpadController playFeedbackGated:client:timestamp:error:]";
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2048;
      unint64_t v38 = v21 - v12;
      __int16 v39 = 2048;
      double v40 = (float)(v23 / 1000.0);
      _os_log_impl(&dword_247F8A000, v22, OS_LOG_TYPE_DEFAULT, "%s Playing pattern %@ requested %lldus ago, previous was %.2fms ago", buf, 0x2Au);
    }

    v24 = [NSNumber numberWithInt:v19];
    int v25 = [v11 setProperty:v24 forKey:@"AppKitActuateWithID"];

    if (v25)
    {
      int v31 = -536870212;
      failure(a6, -536870212, (uint64_t)"Error requesting playback of actuation ID %d to service", v26, v27, v28, v29, v30, v19);
    }
    else
    {
      int v31 = 0;
    }
    self->_prevTimestampUs = v12;
  }
  else
  {
    int v31 = -536870206;
    failure(a6, -536870206, (uint64_t)"Could not find pattern %@", v14, v15, v16, v17, v18, (uint64_t)v10);
  }

  return v31;
}

- (int)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = -536870212;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  int v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  id v11 = LoggingFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[AHFTrackpadController playFeedback:senderID:timestamp:error:]";
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2048;
    unint64_t v36 = a4;
    _os_log_impl(&dword_247F8A000, v11, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on trackpad HID sender ID 0x%llX", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__AHFTrackpadController_playFeedback_senderID_timestamp_error___block_invoke;
  v16[3] = &unk_265236140;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a4;
  uint64_t v18 = &v27;
  uint64_t v19 = &v21;
  id v13 = v10;
  id v17 = v13;
  v20[2] = (id)a5;
  dispatch_sync(queue, v16);
  int v14 = *((_DWORD *)v28 + 6);
  if (a6 && v14)
  {
    *a6 = (id) v22[5];
    int v14 = *((_DWORD *)v28 + 6);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __63__AHFTrackpadController_playFeedback_senderID_timestamp_error___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = [WeakRetained availableTrackpads];
  objc_super v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v12 = objc_loadWeakRetained(v2);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 72);
    uint64_t v15 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id obj = 0;
    int v16 = [v12 playFeedbackGated:v13 client:v6 timestamp:v14 error:&obj];
    objc_storeStrong(v15, obj);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536870208;
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    id v21 = *(id *)(v18 + 40);
    failure(&v21, *(_DWORD *)(*(void *)(v17 + 8) + 24), (uint64_t)"SenderID 0x%llX not found", v7, v8, v9, v10, v11, *(void *)(a1 + 64));
    id v19 = v21;
    id v12 = *(id *)(v18 + 40);
    *(void *)(v18 + 40) = v19;
  }
}

- (int)playFeedback:(id)a3 accessoryID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = -536870212;
  uint64_t v35 = 0;
  unint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  unint64_t v38 = __Block_byref_object_copy__0;
  __int16 v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v12 = LoggingFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[AHFTrackpadController playFeedback:accessoryID:timestamp:error:]";
    __int16 v47 = 2112;
    id v48 = v10;
    __int16 v49 = 2112;
    id v50 = v11;
    _os_log_impl(&dword_247F8A000, v12, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on trackpad power source accessory ID %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__AHFTrackpadController_playFeedback_accessoryID_timestamp_error___block_invoke;
  block[3] = &unk_265236190;
  objc_copyWeak(v30, (id *)buf);
  id v14 = v11;
  id v25 = v14;
  uint64_t v27 = &v41;
  id v15 = v10;
  id v26 = v15;
  uint64_t v28 = &v35;
  v30[1] = (id)a5;
  uint64_t v29 = &v31;
  dispatch_sync(queue, block);
  id v21 = v42;
  if (a6 && *((_DWORD *)v42 + 6))
  {
    *a6 = (id) v36[5];
    id v21 = v42;
  }
  if (!*((unsigned char *)v32 + 24))
  {
    *((_DWORD *)v21 + 6) = -536870208;
    failure(a6, -536870208, (uint64_t)"Accessory ID %@ not found", v16, v17, v18, v19, v20, (uint64_t)v14);
    id v21 = v42;
  }
  int v22 = *((_DWORD *)v21 + 6);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v22;
}

void __66__AHFTrackpadController_playFeedback_accessoryID_timestamp_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  int v4 = [WeakRetained availableTrackpads];
  objc_super v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [v10 propertyForKey:@"SerialNumber"];
        if ([*(id *)(a1 + 32) isEqualToString:v11])
        {
          id v12 = objc_loadWeakRetained(v2);
          uint64_t v13 = *(void *)(a1 + 40);
          uint64_t v14 = *(void *)(a1 + 80);
          id v15 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id obj = 0;
          int v16 = [v12 playFeedbackGated:v13 client:v10 timestamp:v14 error:&obj];
          objc_storeStrong(v15, obj);
          *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v16;

          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)allPatterns
{
  return &unk_26FC38BD8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)prevTimestampUs
{
  return self->_prevTimestampUs;
}

- (void)setPrevTimestampUs:(unint64_t)a3
{
  self->_prevTimestampUs = a3;
}

- (HIDEventSystemClient)trackpadClient
{
  return self->_trackpadClient;
}

- (void)setTrackpadClient:(id)a3
{
}

- (NSMutableDictionary)availableTrackpads
{
  return self->_availableTrackpads;
}

- (void)setAvailableTrackpads:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableTrackpads, 0);
  objc_storeStrong((id *)&self->_trackpadClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
@interface OSActivityStream
- (BOOL)establishTrust:(id)a3;
- (BOOL)streamEvent:(id)a3 error:(id)a4;
- (NSCompoundPredicate)predicate;
- (OSActivityStream)init;
- (OSActivityStreamDelegate)delegate;
- (OSDeviceDelegate)deviceDelegate;
- (OSLogDevice)device;
- (id)getInfoForDevice:(id)a3 andKey:(id)a4;
- (unint64_t)eventFilter;
- (unint64_t)events;
- (unint64_t)options;
- (void)addProcessID:(int)a3;
- (void)addUserID:(unsigned int)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setEventFilter:(unint64_t)a3;
- (void)setEvents:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)start;
- (void)startLocal;
- (void)startRemote;
- (void)stop;
- (void)stopLocal;
- (void)stopRemote;
@end

@implementation OSActivityStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_deviceDelegate);
  objc_storeStrong((id *)&self->_streamFilter, 0);
  objc_storeStrong((id *)&self->_uids, 0);
  objc_storeStrong((id *)&self->_pids, 0);
}

- (void)setDevice:(id)a3
{
}

- (OSLogDevice)device
{
  return self->_device;
}

- (NSCompoundPredicate)predicate
{
  return self->_predicate;
}

- (void)setEventFilter:(unint64_t)a3
{
  self->_eventFilter = a3;
}

- (unint64_t)eventFilter
{
  return self->_eventFilter;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (OSActivityStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OSActivityStreamDelegate *)WeakRetained;
}

- (OSDeviceDelegate)deviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceDelegate);
  return (OSDeviceDelegate *)WeakRetained;
}

- (BOOL)establishTrust:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 devType];
    if (v6 == 2)
    {
      BOOL v15 = 1;
    }
    else
    {
      if (v6 == 1)
      {
        uint64_t v7 = [v5 mobileDeviceRef];
        v8 = self;
        strcpy(buffer, "0000000000000000000000000000000000000000");
        buffer[41] = 0;
        if (!v7)
        {
          int v13 = 0;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Invalid inputs", (uint8_t *)&v26, 2u);
            int v13 = 0;
          }
          goto LABEL_29;
        }
        v9 = v8;
        CFStringRef v10 = (const __CFString *)(*(uint64_t (**)(uint64_t))(mobdevtab + 128))(v7);
        CFStringRef v11 = v10;
        if (v10) {
          CFStringGetCString(v10, buffer, 42, 0x8000100u);
        }
        int v12 = (*(uint64_t (**)(uint64_t))(mobdevtab + 32))(v7);
        if (v12)
        {
          int v13 = v12;
          v14 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136315650;
            v27 = buffer;
            __int16 v28 = 1024;
            int v29 = v13;
            __int16 v30 = 2112;
            v31 = v14;
            _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "(%s) AMDeviceConnect failed with %08x (%@)\n", (uint8_t *)&v26, 0x1Cu);
          }
          goto LABEL_25;
        }
        int v19 = (*(uint64_t (**)(uint64_t))(mobdevtab + 40))(v7);
        if (v19 != -402653155 && v19 != 0)
        {
          int v22 = (*(uint64_t (**)(uint64_t))(mobdevtab + 120))(v7);
          if (v22)
          {
            int v13 = v22;
            v14 = (const void *)(*(uint64_t (**)(void))(mobdevtab + 136))();
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              int v26 = 136315650;
              v27 = buffer;
              __int16 v28 = 1024;
              int v29 = v13;
              __int16 v30 = 2112;
              v31 = v14;
              v23 = MEMORY[0x1E4F14500];
              v24 = "(%s) AMDevicePair failed with %08x (%@)\n";
LABEL_34:
              _os_log_impl(&dword_1A112E000, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v26, 0x1Cu);
            }
LABEL_24:
            (*(void (**)(uint64_t))(mobdevtab + 64))(v7);
LABEL_25:
            if (v11) {
              CFRelease(v11);
            }
            if (v14) {
              CFRelease(v14);
            }
LABEL_29:
            BOOL v15 = v13 == 0;
            goto LABEL_30;
          }
          uint64_t v25 = (*(uint64_t (**)(uint64_t))(mobdevtab + 40))(v7);
          if (v25 != -402653155)
          {
            int v13 = v25;
            if (v25)
            {
              v14 = (const void *)(*(uint64_t (**)(uint64_t))(mobdevtab + 136))(v25);
              if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_24;
              }
              int v26 = 136315650;
              v27 = buffer;
              __int16 v28 = 1024;
              int v29 = v13;
              __int16 v30 = 2112;
              v31 = v14;
              v23 = MEMORY[0x1E4F14500];
              v24 = "(%s) AMDeviceStartSession failed with %08x (%@)\n";
              goto LABEL_34;
            }
          }
        }
        logdev_notification_callback(0, (uint64_t)buffer, v7, v9);
        int v13 = 0;
        v14 = 0;
        goto LABEL_24;
      }
      BOOL v15 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buffer = 134217984;
        *(void *)&buffer[4] = [v5 devType];
        v16 = MEMORY[0x1E4F14500];
        v17 = "Unknown logging device type %ld";
        uint32_t v18 = 12;
        goto LABEL_15;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buffer = 0;
      v16 = MEMORY[0x1E4F14500];
      v17 = "Invalid input.";
      uint32_t v18 = 2;
LABEL_15:
      _os_log_impl(&dword_1A112E000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)buffer, v18);
      BOOL v15 = 0;
    }
  }
LABEL_30:

  return v15;
}

- (id)getInfoForDevice:(id)a3 andKey:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      CFStringRef v10 = MEMORY[0x1E4F14500];
      CFStringRef v11 = "Invalid input.";
      uint32_t v12 = 2;
LABEL_16:
      _os_log_impl(&dword_1A112E000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v12);
    }
LABEL_17:
    v8 = 0;
    goto LABEL_27;
  }
  uint64_t v7 = [v5 devType];
  if (v7 == 2)
  {
    if ([v6 isEqualToString:@"DeviceName"])
    {
      int v13 = [v5 simDev];
      v8 = [v13 name];
    }
    else
    {
      if ([v6 isEqualToString:@"UniqueDeviceID"])
      {
        int v13 = [v5 simDev];
        v14 = [v13 UDID];
        uint64_t v15 = [v14 UUIDString];
      }
      else
      {
        if ([v6 isEqualToString:@"ProductType"])
        {
          int v13 = [v5 simDev];
          v16 = [v13 deviceType];
        }
        else
        {
          if (![v6 isEqualToString:@"ProductName"]) {
            goto LABEL_17;
          }
          int v13 = [v5 simDev];
          v16 = [v13 runtime];
        }
        v14 = v16;
        uint64_t v15 = [v16 name];
      }
      v8 = (void *)v15;
    }
    goto LABEL_27;
  }
  if (v7 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      uint64_t v19 = [v5 devType];
      CFStringRef v10 = MEMORY[0x1E4F14500];
      CFStringRef v11 = "Unknown logging device type %ld";
      uint32_t v12 = 12;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  [v5 mobileDeviceRef];
  if (_logdev_mobdev_vtable_onceToken != -1) {
    dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2585);
  }
  v8 = 0;
  v9 = &_logdev_mobdev_vtable_vtab;
  if (!_logdev_mobdev_vtable_valid) {
    v9 = 0;
  }
  mobdevtab = (uint64_t)v9;
  if (_logdev_mobdev_vtable_valid) {
    v8 = (void *)off_1E953C4B8();
  }
LABEL_27:

  return v8;
}

- (void)setDeviceDelegate:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  deviceSearchSession = self->_deviceSearchSession;
  if (deviceSearchSession)
  {
    if (_logdev_mobdev_vtable_onceToken != -1) {
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2585);
    }
    if (_logdev_mobdev_vtable_valid) {
      id v6 = &_logdev_mobdev_vtable_vtab;
    }
    else {
      id v6 = 0;
    }
    mobdevtab = (uint64_t)v6;
    if (_logdev_mobdev_vtable_valid) {
      off_1E953C4C8(deviceSearchSession);
    }
    self->_deviceSearchSession = 0;
  }
  objc_storeWeak((id *)&self->_deviceDelegate, v4);
  if (v4)
  {
    uint64_t v7 = self;
    if (_logdev_mobdev_vtable_onceToken != -1) {
      dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2585);
    }
    v8 = 0;
    if (_logdev_mobdev_vtable_valid) {
      v9 = &_logdev_mobdev_vtable_vtab;
    }
    else {
      v9 = 0;
    }
    mobdevtab = (uint64_t)v9;
    if (_logdev_mobdev_vtable_valid)
    {
      *(void *)buf = 0;
      CFStringRef v10 = (void *)_os_trace_calloc();
      *CFStringRef v10 = logdev_notification_callback;
      v10[1] = v7;
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (Mutable)
      {
        uint32_t v12 = Mutable;
        CFDictionarySetValue(Mutable, @"NotificationOptionSearchForPairedDevices", (const void *)*MEMORY[0x1E4F1CFD0]);
        (*(void (**)(void (*)(uint64_t, uint64_t), void, void, void *, uint8_t *, __CFDictionary *))(mobdevtab + 104))(observation_callback, 0, 0, v10, buf, v12);
        CFRelease(v12);
        v8 = *(void **)buf;
      }
      else
      {
        free(v10);
        v8 = 0;
      }
    }
    self->_deviceSearchSession = v8;
    int v13 = v7;
    if (watchForSims_onceToken != -1) {
      dispatch_once(&watchForSims_onceToken, &__block_literal_global_272);
    }
    if (watchForSims_SimServiceContextClass && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = (void *)MEMORY[0x1A622D720]();
      id v39 = 0;
      uint64_t v15 = [(id)watchForSims_SimServiceContextClass sharedServiceContextForDeveloperDir:0 error:&v39];
      id v16 = v39;
      v17 = v16;
      if (v15)
      {
        id v38 = v16;
        int v18 = [v15 defaultDeviceSetWithError:&v38];
        id v19 = v38;

        if (v18)
        {
          context = v14;
          uint64_t v20 = dispatch_get_global_queue(17, 0);
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __watchForSims_block_invoke_2;
          v36[3] = &unk_1E5A421B0;
          v21 = v13;
          v37 = v21;
          [v18 registerNotificationHandlerOnQueue:v20 handler:v36];

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          int v22 = [v18 devices];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:buf count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v33 != v25) {
                  objc_enumerationMutation(v22);
                }
                _simDeviceUpdate(*(void **)(*((void *)&v32 + 1) + 8 * i), v21);
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:buf count:16];
            }
            while (v24);
          }

          v14 = context;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [v19 localizedDescription];
          uint64_t v30 = [v29 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v30;
          _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "watchForSims error: %s", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v17 localizedDescription];
          uint64_t v28 = [v27 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v28;
          _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "watchForSims error: %s", buf, 0xCu);
        }
        id v19 = v17;
      }
    }
  }
}

- (void)stopRemote
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(OSLogDevice *)self->_device devType];
  if (v3 != 2)
  {
    if (v3 == 1)
    {
      obj = self;
      objc_sync_enter(obj);
      id v4 = obj;
      uint64_t deviceEventSession = (uint64_t)obj->_deviceEventSession;
      if (deviceEventSession)
      {
        if (_logdev_mobdev_vtable_onceToken != -1)
        {
          v8 = obj->_deviceEventSession;
          dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2585);
          id v4 = obj;
          uint64_t deviceEventSession = (uint64_t)v8;
        }
        id v6 = &_logdev_mobdev_vtable_vtab;
        if (!_logdev_mobdev_vtable_valid) {
          id v6 = 0;
        }
        mobdevtab = (uint64_t)v6;
        if (_logdev_mobdev_vtable_valid)
        {
          OTRCancelAndFreeActivityStream(deviceEventSession);
          id v4 = obj;
        }
        v4->_uint64_t deviceEventSession = 0;
      }
      objc_sync_exit(v4);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      device = self->_device;
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = device;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown logging device type %@", buf, 0xCu);
    }
  }
}

- (void)stopLocal
{
  stream = self->_stream;
  if (stream)
  {
    *((_DWORD *)stream + 20) = 89;
    xpc_connection_cancel(*((xpc_connection_t *)stream + 2));
    xpc_release(*((xpc_object_t *)stream + 2));
    self->_stream = 0;
  }
}

- (void)stop
{
  if (self->_device) {
    [(OSActivityStream *)self stopRemote];
  }
  else {
    [(OSActivityStream *)self stopLocal];
  }
}

- (void)startLocal
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t options = self->_options;
  if ((options & 4) != 0)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__OSActivityStream_startLocal__block_invoke;
  aBlock[3] = &unk_1E5A42160;
  aBlock[4] = self;
  id v5 = v4;
  id v44 = v5;
  id v6 = _Block_copy(aBlock);
  int v7 = options & 0x100;
  if ((options & 0x200) != 0) {
    int v7 = 288;
  }
  int v8 = options & 1 | (4 * ((options >> 1) & 1)) | v7 | (options >> 31 << 7);
  device = self->_device;
  if (device && [(OSLogDevice *)device devType] == 2)
  {
    id v10 = [(OSLogDevice *)self->_device uid];
    self->_stream = (os_activity_stream_s *)os_activity_stream_for_simulator((const char *)[v10 UTF8String], v8, v6);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  CFStringRef v11 = self->_pids;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        stream = self->_stream;
        int v17 = [*(id *)(*((void *)&v39 + 1) + 8 * i) intValue];
        if (stream) {
          os_activity_stream_add_pid((uint64_t)stream, v17);
        }
        else {
          self->_stream = (os_activity_stream_s *)os_activity_stream_for_pid(v17, v8, v6);
        }
      }
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v13);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v18 = self->_uids;
  uint64_t v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = self->_stream;
        uint64_t v24 = [*(id *)(*((void *)&v35 + 1) + 8 * j) unsignedIntValue];
        if (v23) {
          os_activity_stream_add_uid((uint64_t)v23, v24);
        }
        else {
          self->_stream = (os_activity_stream_s *)os_activity_stream_for_uid(v24, v8, v6);
        }
      }
      uint64_t v20 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v20);
  }

  uint64_t v25 = (uint64_t)self->_stream;
  if (!v25)
  {
    uint64_t v25 = os_activity_stream_for_pid(-1, v8, v6);
    self->_stream = (os_activity_stream_s *)v25;
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __30__OSActivityStream_startLocal__block_invoke_2;
  v34[3] = &unk_1E5A42188;
  v34[4] = self;
  *(void *)(v25 + 8) = _Block_copy(v34);
  *((_DWORD *)self->_stream + 16) |= LODWORD(self->_eventFilter);
  int v26 = [(_OSLogStreamFilter *)self->_streamFilter data];
  id v27 = v26;
  uint64_t v28 = self->_stream;
  if (v26)
  {
    id v29 = v26;
    uint64_t v30 = [v29 bytes];
    size_t v31 = [v29 length];
    uint64_t v32 = (uint64_t)v28;
    long long v33 = (const void *)v30;
  }
  else
  {
    uint64_t v32 = (uint64_t)v28;
    long long v33 = 0;
    size_t v31 = 0;
  }
  _os_activity_stream_resume_with_filter(v32, v33, v31);
}

uint64_t __30__OSActivityStream_startLocal__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (!a2)
  {
    uint64_t v8 = 1;
    if (!a3) {
      return v8;
    }
    goto LABEL_9;
  }
  id v5 = +[OSActivityEvent activityEventFromStreamEntry:a2];
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v6)
  {
    if (([v6 evaluateWithObject:v5] & 1) == 0) {
      goto LABEL_7;
    }
  }
  int v7 = *(void **)(a1 + 40);
  if (v7)
  {
    [v7 addObject:v5];
LABEL_7:
    uint64_t v8 = 1;
    goto LABEL_8;
  }
  uint64_t v8 = [*(id *)(a1 + 32) streamEvent:v5 error:0];
LABEL_8:

  if (a3)
  {
LABEL_9:
    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a3 userInfo:0];
    uint64_t v8 = [*(id *)(a1 + 32) streamEvent:0 error:v9] & v8;
  }
  return v8;
}

uint64_t __30__OSActivityStream_startLocal__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  switch(a3)
  {
    case 3:
      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:0];
      [*(id *)(a1 + 32) streamEvent:0 error:v6];
      [*(id *)(a1 + 32) stop];

      break;
    case 2:
      id v10 = WeakRetained;
      if (objc_opt_respondsToSelector())
      {
        [v10 streamDidStop:*(void *)(a1 + 32)];
      }
      else
      {
        int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:89 userInfo:0];
        [*(id *)(a1 + 32) streamEvent:0 error:v7];
      }
      [*(id *)(a1 + 32) stop];
      break;
    case 1:
      v9 = WeakRetained;
      if (objc_opt_respondsToSelector()) {
        [v9 streamDidStart:*(void *)(a1 + 32)];
      }
      break;
  }
  return MEMORY[0x1F4181870]();
}

- (void)startRemote
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(OSLogDevice *)self->_device devType];
  if (v3 == 2)
  {
    [(OSActivityStream *)self startLocal];
  }
  else
  {
    if (v3 == 1)
    {
      id v4 = [(OSLogDevice *)self->_device mobileDeviceRef];
      id v5 = self;
      if (_logdev_mobdev_vtable_onceToken != -1) {
        dispatch_once(&_logdev_mobdev_vtable_onceToken, &__block_literal_global_2585);
      }
      id v6 = 0;
      int v7 = &_logdev_mobdev_vtable_vtab;
      if (!_logdev_mobdev_vtable_valid) {
        int v7 = 0;
      }
      mobdevtab = (uint64_t)v7;
      if (!_logdev_mobdev_vtable_valid) {
        goto LABEL_53;
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 0x40000000;
      v39[2] = __logdev_stream_events_block_invoke;
      v39[3] = &__block_descriptor_tmp_2615;
      v39[4] = logdev_message_callback;
      v39[5] = v5;
      int v44 = 0xFFFF;
      int valuePtr = -1;
      int v43 = 60;
      CFTypeRef v42 = 0;
      if (_CopyOTRServiceConnectionForDevice((uint64_t)v4, &v42, @"com.apple.os_trace_relay"))
      {
        if (_CopyOTRServiceConnectionForDevice((uint64_t)v4, &v42, @"com.apple.syslog_relay"))
        {
          id v6 = 0;
LABEL_53:
          v5->_uint64_t deviceEventSession = v6;
          return;
        }
        CFNumberRef v9 = 0;
        CFNumberRef v10 = 0;
        CFNumberRef v11 = 0;
        CFTypeRef v13 = v42;
        goto LABEL_23;
      }
      CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFNumberRef v10 = CFNumberCreate(0, kCFNumberIntType, &v44);
      CFNumberRef v11 = CFNumberCreate(0, kCFNumberIntType, &v43);
      keys[0] = xmmword_1E5A43108;
      keys[1] = *(_OWORD *)off_1E5A43118;
      values[0] = @"StartActivity";
      values[1] = v9;
      values[2] = v10;
      values[3] = v11;
      CFDictionaryRef v12 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFTypeRef v13 = v42;
      int v14 = (*(uint64_t (**)(CFTypeRef, CFDictionaryRef, uint64_t, void))(mobdevtab + 72))(v42, v12, 200, 0);
      if (v14)
      {
        if (v14 == -402653139)
        {
          if (v13)
          {
            (*(void (**)(CFTypeRef))(mobdevtab + 88))(v13);
            CFRelease(v13);
            CFTypeRef v42 = 0;
          }
          int v15 = _CopyOTRServiceConnectionForDevice((uint64_t)v4, &v42, @"com.apple.syslog_relay");
          CFTypeRef v13 = v42;
          if (!v15)
          {
LABEL_23:
            v46[0] = 0;
            v46[1] = v46;
            v46[2] = 0x2000000000;
            char v47 = 1;
            id v16 = dispatch_queue_create("com.apple.os_trace_relay.queue", MEMORY[0x1E4F14430]);
            int v17 = (*(uint64_t (**)(CFTypeRef))(mobdevtab + 80))(v13);
            int v18 = dispatch_source_create(MEMORY[0x1E4F14478], v17, 0, v16);
            id v6 = (void *)_os_trace_calloc();
            *id v6 = v13;
            v6[1] = v18;
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 0x40000000;
            v52 = __OTRStartLegacyStreaming_block_invoke;
            v53 = &unk_1E5A43180;
            v56 = v18;
            CFTypeRef v57 = v13;
            v54 = v39;
            v55 = v46;
            dispatch_source_set_event_handler(v18, &buf);
            dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
            v6[3] = v19;
            if (v19)
            {
              uint64_t v20 = v6[1];
              handler[0] = MEMORY[0x1E4F143A8];
              handler[1] = 0x40000000;
              handler[2] = __OTRStartLegacyStreaming_block_invoke_2;
              handler[3] = &unk_1E5A431A8;
              handler[4] = v39;
              handler[5] = v6;
              dispatch_source_set_cancel_handler(v20, handler);
              dispatch_activate(v18);
              _Block_object_dispose(v46, 8);
LABEL_45:
              if (v9) {
                CFRelease(v9);
              }
              if (v10) {
                CFRelease(v10);
              }
              if (v11) {
                CFRelease(v11);
              }
              if (v6)
              {
                signal(2, (void (__cdecl *)(int))1);
                global_queue = dispatch_get_global_queue(21, 0);
                uint64_t v30 = dispatch_source_create(MEMORY[0x1E4F14480], 2uLL, 0, global_queue);
                v6[2] = v30;
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 0x40000000;
                v52 = __logdev_stream_events_block_invoke_2;
                v53 = &__block_descriptor_tmp_4;
                v54 = v6;
                dispatch_source_set_event_handler(v30, &buf);
                dispatch_activate(v30);
              }
              goto LABEL_53;
            }
            free(v6);
            _Block_object_dispose(v46, 8);
          }
        }
LABEL_40:
        id v27 = 0;
        goto LABEL_41;
      }
      CFRelease(v12);
      LOBYTE(v46[0]) = 0;
      *(void *)&long long buf = 0;
      if ((*(unsigned int (**)(CFTypeRef, void *, uint64_t))(mobdevtab + 8))(v13, v46, 1) == 1)
      {
        int v21 = LOBYTE(v46[0]);
        if (LOBYTE(v46[0]) != 1)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          LODWORD(handler[0]) = 67109120;
          HIDWORD(handler[0]) = v21;
          uint64_t v24 = MEMORY[0x1E4F14500];
          uint64_t v25 = "Got incorrect response type: %hhu";
          goto LABEL_36;
        }
        int v22 = (*(uint64_t (**)(CFTypeRef, long long *, void, void))(mobdevtab + 16))(v13, &buf, 0, 0);
        if (v22)
        {
          int v23 = v22;
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          LODWORD(handler[0]) = 67109120;
          HIDWORD(handler[0]) = v23;
          uint64_t v24 = MEMORY[0x1E4F14500];
          uint64_t v25 = "Failed to receive response: %x";
LABEL_36:
          uint32_t v26 = 8;
          goto LABEL_37;
        }
        if ((void)buf)
        {
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (TypeID == CFGetTypeID((CFTypeRef)buf))
          {
            id v27 = (const void *)buf;
            if ((void)buf)
            {
              Value = CFDictionaryGetValue((CFDictionaryRef)buf, @"Status");
              if (CFEqual(Value, @"RequestSuccessful"))
              {
                int v33 = (*(uint64_t (**)(CFTypeRef))(mobdevtab + 80))(v13);
                if (v33 != -1)
                {
                  int v34 = v33;
                  long long v35 = (void *)_os_trace_calloc();
                  *long long v35 = v13;
                  uint64_t v28 = v35;
                  long long v36 = dispatch_queue_create("com.apple.os_trace_relay_client", 0);
                  v28[3] = dispatch_semaphore_create(0);
                  long long v37 = dispatch_source_create(MEMORY[0x1E4F14478], v34, 0, v36);
                  v28[1] = v37;
                  v41[0] = MEMORY[0x1E4F143A8];
                  v41[1] = 0x40000000;
                  v41[2] = __OTRCreateActivityStreamForPID_block_invoke;
                  v41[3] = &unk_1E5A43130;
                  v41[4] = v39;
                  v41[5] = v28;
                  dispatch_source_set_event_handler(v37, v41);
                  long long v38 = v28[1];
                  v40[0] = MEMORY[0x1E4F143A8];
                  v40[1] = 0x40000000;
                  v40[2] = __OTRCreateActivityStreamForPID_block_invoke_2;
                  v40[3] = &unk_1E5A43158;
                  v40[4] = v39;
                  v40[5] = v28;
                  dispatch_source_set_cancel_handler(v38, v40);
                  dispatch_activate((dispatch_object_t)v28[1]);
                  if (v36) {
                    dispatch_release(v36);
                  }
LABEL_44:
                  CFRelease(v27);
                  id v6 = v28;
                  goto LABEL_45;
                }
              }
LABEL_41:
              if (v13)
              {
                (*(void (**)(CFTypeRef))(mobdevtab + 88))(v13);
                CFRelease(v13);
                CFTypeRef v42 = 0;
              }
              uint64_t v28 = 0;
              id v6 = 0;
              if (!v27) {
                goto LABEL_45;
              }
              goto LABEL_44;
            }
            goto LABEL_40;
          }
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
LABEL_38:
            if ((void)buf) {
              CFRelease((CFTypeRef)buf);
            }
            goto LABEL_40;
          }
          LOWORD(handler[0]) = 0;
          uint64_t v24 = MEMORY[0x1E4F14500];
          uint64_t v25 = "Incorrect response type";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_40;
          }
          LOWORD(handler[0]) = 0;
          uint64_t v24 = MEMORY[0x1E4F14500];
          uint64_t v25 = "Got NULL response dictionary";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        LOWORD(handler[0]) = 0;
        uint64_t v24 = MEMORY[0x1E4F14500];
        uint64_t v25 = "Failed to get message type response";
      }
      uint32_t v26 = 2;
LABEL_37:
      _os_log_impl(&dword_1A112E000, v24, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)handler, v26);
      goto LABEL_38;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      device = self->_device;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = device;
      _os_log_impl(&dword_1A112E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unknown logging device type %@", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (BOOL)streamEvent:(id)a3 error:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CFNumberRef v9 = WeakRetained;
  if (!v7)
  {
    if (self->_delegateStreamErrorLess)
    {
      if (!v6)
      {
        char v15 = [WeakRetained activityStream:self results:0];
        goto LABEL_16;
      }
      v18[0] = v6;
      CFNumberRef v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      char v12 = [v9 activityStream:self results:v11];
    }
    else
    {
      if (!self->_delegateStreamWithError) {
        goto LABEL_4;
      }
      if (!v6)
      {
        CFTypeRef v13 = self;
        id v14 = 0;
LABEL_10:
        char v15 = [WeakRetained activityStream:v13 results:0 error:v14];
LABEL_16:
        BOOL v10 = v15;
        goto LABEL_17;
      }
      id v17 = v6;
      CFNumberRef v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      char v12 = [v9 activityStream:self results:v11 error:0];
    }
    BOOL v10 = v12;

    goto LABEL_17;
  }
  if (!self->_delegateHasDidFail)
  {
    if (!self->_delegateStreamWithError) {
      goto LABEL_4;
    }
    CFTypeRef v13 = self;
    id v14 = v7;
    goto LABEL_10;
  }
  [WeakRetained streamDidFail:self error:v7];
LABEL_4:
  BOOL v10 = 1;
LABEL_17:

  return v10;
}

- (void)start
{
  if (self->_device) {
    [(OSActivityStream *)self startRemote];
  }
  else {
    [(OSActivityStream *)self startLocal];
  }
}

- (void)setPredicate:(id)a3
{
  id v17 = a3;
  if (v17)
  {
    id v4 = [[_OSLogPredicateMapper alloc] initWithPredicate:v17 andValidate:0];
    id v5 = [_OSLogLegacyPredicateMapper alloc];
    id v6 = [(_OSLogPredicateMapper *)v4 mappedPredicate];
    id v7 = [(_OSLogPredicateMapper *)v5 initWithPredicate:v6];

    uint64_t v8 = [(_OSLogPredicateMapper *)v7 mappedPredicate];

    if (!v8)
    {
      CFTypeRef v13 = (void *)MEMORY[0x1E4F1CA00];
      id v14 = [(_OSLogPredicateMapper *)v7 validationErrors];
      char v15 = [v14 componentsJoinedByString:@"\n"];
      id v16 = [v13 exceptionWithName:@"OSLogInvalidPredicateException" reason:v15 userInfo:0];

      objc_exception_throw(v16);
    }
    CFNumberRef v9 = [(_OSLogPredicateMapper *)v7 mappedPredicate];
    predicate = self->_predicate;
    self->_predicate = v9;

    if ([(_OSLogPredicateMapper *)v4 flags]) {
      self->_options |= 0x300uLL;
    }
    if (([(_OSLogPredicateMapper *)v4 flags] & 2) != 0) {
      self->_options |= 0x100uLL;
    }
  }
  else
  {
    id v4 = (_OSLogPredicateMapper *)self->_predicate;
    self->_predicate = 0;
  }

  CFNumberRef v11 = [[_OSLogStreamFilter alloc] initWithPredicate:self->_predicate];
  streamFilter = self->_streamFilter;
  self->_streamFilter = v11;
}

- (void)addUserID:(unsigned int)a3
{
  uids = self->_uids;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:*(void *)&a3];
  [(NSMutableSet *)uids addObject:v4];
}

- (void)addProcessID:(int)a3
{
  pids = self->_pids;
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  [(NSMutableSet *)pids addObject:v4];
}

- (unint64_t)events
{
  if ((self->_eventFilter & 2) != 0) {
    return ((uint64_t)(self->_eventFilter << 63) >> 63) & 0x203 | self->_eventFilter & 0x400 | 0x300;
  }
  else {
    return ((uint64_t)(self->_eventFilter << 63) >> 63) & 0x203 | self->_eventFilter & 0x400;
  }
}

- (void)setEvents:(unint64_t)a3
{
  unint64_t v3 = (a3 & 0x203) != 0;
  if ((a3 & 0x400) != 0) {
    unint64_t v3 = 4;
  }
  if ((a3 & 0x300) != 0) {
    unint64_t v3 = 2;
  }
  if (v3) {
    self->_eventFilter = v3;
  }
}

- (void)dealloc
{
  stream = self->_stream;
  if (stream)
  {
    *((_DWORD *)stream + 20) = 89;
    xpc_connection_cancel(*((xpc_connection_t *)stream + 2));
    xpc_release(*((xpc_object_t *)stream + 2));
  }
  v4.receiver = self;
  v4.super_class = (Class)OSActivityStream;
  [(OSActivityStream *)&v4 dealloc];
}

- (OSActivityStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)OSActivityStream;
  v2 = [(OSActivityStream *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    pids = v2->_pids;
    v2->_pids = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    uids = v2->_uids;
    v2->_uids = (NSMutableSet *)v5;

    *(_OWORD *)&v2->_unint64_t options = xmmword_1A118ACF0;
    v2->_deviceSearchSession = 0;
    v2->_uint64_t deviceEventSession = 0;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  self->_delegateHasDidFail = objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector())
  {
    *(_WORD *)&self->_delegateStreamErrorLess = 1;
  }
  else
  {
    char v4 = objc_opt_respondsToSelector();
    self->_delegateStreamErrorLess = 0;
    self->_delegateStreamWithError = (v4 & 1) != 0;
  }
  objc_storeWeak((id *)&self->_delegate, obj);
}

@end
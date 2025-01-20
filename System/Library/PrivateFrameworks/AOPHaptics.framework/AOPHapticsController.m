@interface AOPHapticsController
+ (int)AHtoHMOutputType:(unsigned __int8)a3;
- (AOPHapticsController)init;
- (BOOL)playSlotIndices:(id)a3 error:(id *)a4;
- (BOOL)setMappings:(id)a3 error:(id *)a4;
- (unsigned)connect;
- (unsigned)service;
- (void)_findService;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)init;
- (void)setCancelHandler:(id)a3;
- (void)setConnect:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setReadyHandler:(id)a3;
- (void)setService:(unsigned int)a3;
- (void)signalReady;
@end

@implementation AOPHapticsController

- (AOPHapticsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AOPHapticsController;
  v2 = [(AOPHapticsController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_service = 0;
    v2->_connect = 0;
    v2->_queue = 0;
    v2->_notificationPort = 0;
    v2->_arrivalNotification = 0;
    v2->_cancelHandler = 0;
    v2->_readyHandler = 0;
    *(_WORD *)&v2->_activated._Value = 0;
  }
  else
  {
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController init]();
    }
  }
  return v3;
}

- (void)dealloc
{
  io_object_t connect = self->_connect;
  if (connect) {
    IOObjectRelease(connect);
  }
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  io_object_t arrivalNotification = self->_arrivalNotification;
  if (arrivalNotification) {
    IOObjectRelease(arrivalNotification);
  }
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  v7.receiver = self;
  v7.super_class = (Class)AOPHapticsController;
  [(AOPHapticsController *)&v7 dealloc];
}

- (void)setCancelHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  objc_super v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_235FBE000, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }
  if (self->_cancelHandler)
  {
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController setCancelHandler:]();
    }
  }
  else
  {
    self->_cancelHandler = (id)[a3 copy];
  }
}

- (void)setReadyHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  objc_super v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_235FBE000, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }
  if (self->_readyHandler)
  {
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController setReadyHandler:]();
    }
  }
  else
  {
    self->_readyHandler = (id)[a3 copy];
  }
}

- (void)setDispatchQueue:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  objc_super v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl(&dword_235FBE000, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }
  if (self->_queue)
  {
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController setDispatchQueue:]();
    }
  }
  else
  {
    int v6 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("AOPHapticsDispatchQueue", 0, (dispatch_queue_t)a3);
    self->_queue = v6;
    if (!v6)
    {
      if (_AHLog_onceToken != -1) {
        dispatch_once(&_AHLog_onceToken, &__block_literal_global);
      }
      if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
        -[AOPHapticsController setDispatchQueue:]();
      }
    }
  }
}

- (void)activate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Error: activate should be called only once!", v2, v3, v4, v5, v6);
}

- (void)cancel
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Error: cancel should be called only once!", v2, v3, v4, v5, v6);
}

- (BOOL)setMappings:(id)a3 error:(id *)a4
{
  kern_return_t v33;
  BOOL result;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  id *v40;
  AOPHapticsController *v41;
  int v42;
  uint64_t v44;
  uint64_t v45;
  int v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  uint8_t buf[4];
  unsigned char v52[10];
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  unsigned char v65[128];
  _OWORD inputStruct[2];
  long long v67;
  uint64_t v68;
  uint64_t v69;

  v40 = a4;
  v69 = *MEMORY[0x263EF8340];
  v68 = 0;
  v67 = 0u;
  memset(inputStruct, 0, sizeof(inputStruct));
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  uint64_t v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v52 = a3;
    _os_log_impl(&dword_235FBE000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (self->_connect)
  {
    v41 = self;
    LODWORD(inputStruct[0]) = 0;
    *(void *)((char *)inputStruct + 12) = -1;
    HIDWORD(inputStruct[1]) = 1;
    *((void *)&v67 + 1) = -1;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v45 = [a3 countByEnumeratingWithState:&v47 objects:v65 count:16];
    if (v45)
    {
      v44 = *(void *)v48;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(a3);
          }
          int v7 = *(void **)(*((void *)&v47 + 1) + 8 * v6);
          id v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"Action", v40);
          uint64_t v9 = (void *)[v7 objectForKeyedSubscript:@"OutputType"];
          v10 = (void *)[v7 objectForKeyedSubscript:@"SlotIndex"];
          v11 = (void *)[v7 objectForKeyedSubscript:@"Gain"];
          v12 = (void *)[v7 objectForKeyedSubscript:@"PreSilenceDuration"];
          uint64_t v13 = [v7 objectForKeyedSubscript:@"Priority"];
          if (!v8
            || (v14 = (void *)v13, [v8 unsignedIntValue] >= 2)
            || !v9
            || [v9 unsignedIntValue] >= 2
            || !v10
            || !v11
            || ([v11 floatValue], v15 < 0.0)
            || ([v11 floatValue], v16 > 1.0))
          {
            v35 = (void *)MEMORY[0x263F087E8];
            v36 = *MEMORY[0x263F08410];
            v37 = -536870206;
            goto LABEL_31;
          }
          if (v14)
          {
            unint64_t v17 = [v14 unsignedIntegerValue];
            if (v17 > *((unsigned int *)&inputStruct[1] + 7 * [v8 unsignedIntegerValue] + 2))
            {
              int v18 = [v14 unsignedIntegerValue];
              *((_DWORD *)&inputStruct[1] + 7 * [v8 unsignedIntegerValue] + 2) = v18;
            }
          }
          int v19 = [v10 unsignedCharValue];
          uint64_t v20 = [v8 unsignedIntegerValue];
          *((_DWORD *)inputStruct
          + 7 * v20
          + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", [v9 unsignedIntValue])+ 3) = v19;
          [v11 floatValue];
          unsigned int v22 = vcvts_n_s32_f32(v21, 0x10uLL);
          v23 = (char *)inputStruct + 28 * [v8 unsignedIntegerValue];
          *(_DWORD *)&v23[4
                        * +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", [v9 unsignedIntValue])+ 4] = v22;
          __int16 v24 = [v12 unsignedIntegerValue];
          uint64_t v25 = [v8 unsignedIntegerValue];
          *((_WORD *)&inputStruct[1]
          + 14 * v25
          + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", [v9 unsignedIntValue])+ 2) = v24;
          if (_AHLog_onceToken != -1) {
            dispatch_once(&_AHLog_onceToken, &__block_literal_global);
          }
          v26 = _AHLog_log;
          if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_DEBUG))
          {
            v46 = [v8 unsignedIntValue];
            v42 = *((_DWORD *)&inputStruct[1] + 7 * [v8 unsignedIntegerValue] + 2);
            int v27 = *((_DWORD *)inputStruct + 7 * [v8 unsignedIntegerValue] + 3);
            int v28 = *((_DWORD *)&inputStruct[1] + 7 * [v8 unsignedIntegerValue]);
            int v29 = *((_DWORD *)inputStruct + 7 * [v8 unsignedIntegerValue] + 1);
            int v30 = *((_DWORD *)inputStruct + 7 * [v8 unsignedIntegerValue] + 2);
            int v31 = *((unsigned __int16 *)&inputStruct[1] + 14 * [v8 unsignedIntegerValue] + 2);
            int v32 = *((unsigned __int16 *)&inputStruct[1] + 14 * [v8 unsignedIntegerValue] + 3);
            *(_DWORD *)buf = 67110912;
            *(_DWORD *)v52 = v46;
            *(_WORD *)&v52[4] = 1024;
            *(_DWORD *)&v52[6] = v42;
            v53 = 1024;
            v54 = v27;
            v55 = 1024;
            v56 = v28;
            v57 = 1024;
            v58 = v29;
            v59 = 1024;
            v60 = v30;
            v61 = 1024;
            v62 = v31;
            v63 = 1024;
            v64 = v32;
            _os_log_debug_impl(&dword_235FBE000, v26, OS_LOG_TYPE_DEBUG, "Action 0x%x Priority: %u Asset index[0]: %u index[1]: %u gain[0]: 0x%x gain[1]: 0x%x preSil[0]: %u preSil[1]: %u", buf, 0x32u);
          }
          ++v6;
        }
        while (v45 != v6);
        v45 = [a3 countByEnumeratingWithState:&v47 objects:v65 count:16];
        if (v45) {
          continue;
        }
        break;
      }
    }
    v33 = IOConnectCallStructMethod(v41->_connect, 0, inputStruct, 0x38uLL, 0, 0);
    if (!v33) {
      return 1;
    }
    v36 = *MEMORY[0x263F08410];
    v37 = v33;
    v35 = (void *)MEMORY[0x263F087E8];
LABEL_31:
    v38 = objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, v37, 0, v40);
  }
  else
  {
    v38 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870184 userInfo:0];
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController setMappings:error:]();
    }
  }
  if (!v38) {
    return 0;
  }
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  v39 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
    -[AOPHapticsController setMappings:error:](v38, v39);
  }
  if (!v40) {
    return 0;
  }
  result = 0;
  *v40 = (id)v38;
  return result;
}

- (BOOL)playSlotIndices:(id)a3 error:(id *)a4
{
  kern_return_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int v33;
  AOPHapticsController *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long inputStruct;
  long long v44;
  uint64_t v45;
  uint8_t buf[4];
  unsigned char v47[14];
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  unsigned char v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x263EF8340];
  v45 = 0;
  inputStruct = 0u;
  v44 = 0u;
  v37 = mach_continuous_time();
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  uint64_t v6 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v47 = a3;
    _os_log_impl(&dword_235FBE000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (!self->_connect)
  {
    int v30 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870184 userInfo:0];
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController setMappings:error:]();
    }
    goto LABEL_34;
  }
  if (!a3) {
    goto LABEL_32;
  }
  v35 = self;
  v33 = (unsigned __int16)v37 | ((unsigned __int16)getpid() << 16);
  DWORD1(inputStruct) = v33;
  *((void *)&inputStruct + 1) = v37;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v39 objects:v62 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v38 = *(void *)v40;
    obj = a3;
LABEL_9:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v40 != v38) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
      v11 = (void *)[v10 objectForKeyedSubscript:@"OutputType"];
      v12 = (void *)[v10 objectForKeyedSubscript:@"SlotIndex"];
      uint64_t v13 = (void *)[v10 objectForKeyedSubscript:@"Gain"];
      v14 = (void *)[v10 objectForKeyedSubscript:@"PreSilenceDuration"];
      float v15 = (void *)[v10 objectForKeyedSubscript:@"Priority"];
      uint64_t v16 = [v10 objectForKeyedSubscript:@"RequestTimestamp"];
      if (!v11) {
        break;
      }
      unint64_t v17 = (void *)v16;
      if ([v11 unsignedIntValue] >= 2) {
        break;
      }
      if (!v12) {
        break;
      }
      if (!v13) {
        break;
      }
      [v13 floatValue];
      if (v18 < 0.0) {
        break;
      }
      [v13 floatValue];
      if (v19 > 1.0) {
        break;
      }
      if (v15)
      {
        unint64_t v20 = [v15 unsignedIntegerValue];
        if (v20 > HIDWORD(v45)) {
          HIDWORD(v45) = [v15 unsignedIntegerValue];
        }
      }
      if (v17 && [v17 unsignedLongLongValue] < v37)
      {
        v37 = [v17 unsignedLongLongValue];
        *((void *)&inputStruct + 1) = v37;
      }
      int v21 = [v12 unsignedCharValue];
      *((_DWORD *)&v44
      + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", [v11 unsignedIntValue])+ 2) = v21;
      [v13 floatValue];
      *((_DWORD *)&v44
      + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", [v11 unsignedIntValue])) = vcvts_n_s32_f32(v22, 0x10uLL);
      __int16 v23 = [v14 unsignedIntegerValue];
      *((_WORD *)&v44
      + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", [v11 unsignedIntValue])+ 8) = v23;
      if (v8 == ++v9)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v62 count:16];
        if (v8) {
          goto LABEL_9;
        }
        goto LABEL_26;
      }
    }
LABEL_32:
    int v29 = (void *)MEMORY[0x263F087E8];
    int v27 = *MEMORY[0x263F08410];
    int v28 = -536870206;
    goto LABEL_33;
  }
LABEL_26:
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  __int16 v24 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111168;
    *(_DWORD *)v47 = v33;
    *(_WORD *)&v47[4] = 2048;
    *(void *)&v47[6] = v37;
    v48 = 1024;
    v49 = HIDWORD(v45);
    v50 = 1024;
    v51 = DWORD2(v44);
    v52 = 1024;
    v53 = HIDWORD(v44);
    v54 = 1024;
    v55 = v44;
    v56 = 1024;
    v57 = DWORD1(v44);
    v58 = 1024;
    v59 = (unsigned __int16)v45;
    v60 = 1024;
    v61 = WORD1(v45);
    _os_log_debug_impl(&dword_235FBE000, v24, OS_LOG_TYPE_DEBUG, "RequestID: %u RequestTS: %llu Prority: %u Asset index[0]: %u index[1]: %u gain[0]: 0x%x gain[1]: 0x%x preSil[0]: %u preSil[1]: %u", buf, 0x3Cu);
  }
  BOOL v25 = 1;
  v26 = IOConnectCallStructMethod(v35->_connect, 1u, &inputStruct, 0x28uLL, 0, 0);
  if (v26)
  {
    int v27 = *MEMORY[0x263F08410];
    int v28 = v26;
    int v29 = (void *)MEMORY[0x263F087E8];
LABEL_33:
    int v30 = (void *)[v29 errorWithDomain:v27 code:v28 userInfo:0];
    if (!v30) {
      return 0;
    }
LABEL_34:
    if (_AHLog_onceToken != -1) {
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    }
    int v31 = _AHLog_log;
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR)) {
      -[AOPHapticsController setMappings:error:]((uint64_t)v30, v31);
    }
    if (a4)
    {
      BOOL v25 = 0;
      *a4 = v30;
    }
    else
    {
      return 0;
    }
  }
  return v25;
}

- (void)_findService
{
  uint64_t v3 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  self->_notificationPort = v3;
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, (dispatch_queue_t)self->_queue);
    notificationPort = self->_notificationPort;
    CFDictionaryRef v5 = IOServiceNameMatching("AppleSPUHapticsManagerDriver");
    if (!IOServiceAddMatchingNotification(notificationPort, "IOServiceMatched", v5, (IOServiceMatchingCallback)AOPMatchedCallback, self, &self->_arrivalNotification))
    {
      io_iterator_t arrivalNotification = self->_arrivalNotification;
      AOPMatchedCallback(self, arrivalNotification);
    }
  }
}

- (void)signalReady
{
  if (_AHLog_onceToken != -1) {
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  }
  uint64_t v3 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CFDictionaryRef v5 = 0;
    _os_log_impl(&dword_235FBE000, v3, OS_LOG_TYPE_INFO, "signalReady", v5, 2u);
  }
  id readyHandler = self->_readyHandler;
  if (readyHandler)
  {
    dispatch_async((dispatch_queue_t)self->_queue, readyHandler);

    self->_id readyHandler = 0;
  }
}

+ (int)AHtoHMOutputType:(unsigned __int8)a3
{
  if (a3 == 1) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_io_object_t connect = a3;
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "init failed!", v2, v3, v4, v5, v6);
}

- (void)setCancelHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Cancel handler already set!", v2, v3, v4, v5, v6);
}

- (void)setReadyHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Ready handler already set!", v2, v3, v4, v5, v6);
}

- (void)setDispatchQueue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Error creating queue!", v2, v3, v4, v5, v6);
}

- (void)setDispatchQueue:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Dispatch queue already set!", v2, v3, v4, v5, v6);
}

- (void)setMappings:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235FBE000, a2, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setMappings:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235FBE000, v0, v1, "Error: object not activated!", v2, v3, v4, v5, v6);
}

@end
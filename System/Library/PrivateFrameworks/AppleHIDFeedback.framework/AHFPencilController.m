@interface AHFPencilController
- (AHFPencilController)init;
- (AHFPencilPatternLibrary)patternsLibrary;
- (BOOL)initializeDigitizerStylusSystem;
- (BOOL)initializeOpaqueTouchSystem;
- (BOOL)initializePencilHapticsSystem;
- (HIDEventSystemClient)digitizerStylusClient;
- (HIDEventSystemClient)opaqueTouchClient;
- (HIDEventSystemClient)pencilHapticsClient;
- (NSMutableIndexSet)availableDigitizerStylus;
- (NSMutableIndexSet)availableOpaqueTouch;
- (OS_dispatch_queue)queue;
- (int)playFeedback:(id)a3 accessoryID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (int)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (int)playFeedbackGated:(id)a3 haptics:(unsigned int)a4 timestamp:(unint64_t)a5 error:(id *)a6;
- (unint64_t)prevTimestampUs;
- (unsigned)availablePencilHaptics;
- (void)dealloc;
- (void)setAvailableDigitizerStylus:(id)a3;
- (void)setAvailableOpaqueTouch:(id)a3;
- (void)setAvailablePencilHaptics:(unsigned int)a3;
- (void)setDigitizerStylusClient:(id)a3;
- (void)setOpaqueTouchClient:(id)a3;
- (void)setPatternsLibrary:(id)a3;
- (void)setPencilHapticsClient:(id)a3;
- (void)setPrevTimestampUs:(unint64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation AHFPencilController

- (AHFPencilController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AHFPencilController;
  v2 = [(AHFPencilController *)&v9 init];
  if (!v2) {
    goto LABEL_8;
  }
  uint64_t v3 = objc_opt_new();
  patternsLibrary = v2->_patternsLibrary;
  v2->_patternsLibrary = (AHFPencilPatternLibrary *)v3;

  if (!v2->_patternsLibrary) {
    goto LABEL_8;
  }
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.hid.AppleHIDFeedback.Pencil", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  if (!v2->_queue) {
    goto LABEL_8;
  }
  v2->_prevTimestampUs = 0;
  v7 = 0;
  if ([(AHFPencilController *)v2 initializeDigitizerStylusSystem])
  {
    if ([(AHFPencilController *)v2 initializeOpaqueTouchSystem]
      && [(AHFPencilController *)v2 initializePencilHapticsSystem])
    {
      v7 = v2;
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)dealloc
{
  pencilHapticsClient = self->_pencilHapticsClient;
  if (pencilHapticsClient) {
    [(HIDEventSystemClient *)pencilHapticsClient cancel];
  }
  opaqueTouchClient = self->_opaqueTouchClient;
  if (opaqueTouchClient) {
    [(HIDEventSystemClient *)opaqueTouchClient cancel];
  }
  digitizerStylusClient = self->_digitizerStylusClient;
  if (digitizerStylusClient) {
    [(HIDEventSystemClient *)digitizerStylusClient cancel];
  }
  io_object_t availablePencilHaptics = self->_availablePencilHaptics;
  if (availablePencilHaptics) {
    IOObjectRelease(availablePencilHaptics);
  }
  v7.receiver = self;
  v7.super_class = (Class)AHFPencilController;
  [(AHFPencilController *)&v7 dealloc];
}

- (BOOL)initializeDigitizerStylusSystem
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (NSMutableIndexSet *)objc_opt_new();
  availableDigitizerStylus = self->_availableDigitizerStylus;
  self->_availableDigitizerStylus = v3;

  if (self->_availableDigitizerStylus)
  {
    dispatch_queue_t v5 = (HIDEventSystemClient *)[objc_alloc(MEMORY[0x263F41DD8]) initWithType:2];
    digitizerStylusClient = self->_digitizerStylusClient;
    self->_digitizerStylusClient = v5;

    objc_super v7 = self->_digitizerStylusClient;
    if (v7)
    {
      [(HIDEventSystemClient *)v7 setMatching:&unk_26FC38BF0];
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke;
      v18[3] = &unk_265236118;
      objc_copyWeak(&v19, &location);
      v8 = (void (**)(void, void))MEMORY[0x24C572980](v18);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      objc_super v9 = [(HIDEventSystemClient *)self->_digitizerStylusClient services];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v9);
            }
            v8[2](v8, *(void *)(*((void *)&v14 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
        }
        while (v10);
      }

      [(HIDEventSystemClient *)self->_digitizerStylusClient setServiceNotificationHandler:v8];
      [(HIDEventSystemClient *)self->_digitizerStylusClient setDispatchQueue:self->_queue];
      [(HIDEventSystemClient *)self->_digitizerStylusClient activate];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

void __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
      uint64_t v12 = "-[AHFPencilController initializeDigitizerStylusSystem]_block_invoke";
      __int16 v13 = 2048;
      long long v14 = v6;
      __int16 v15 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v7, OS_LOG_TYPE_DEFAULT, "%s Digitizer Stylus with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    v8 = [WeakRetained availableDigitizerStylus];
    [v8 addIndex:v6];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke_13;
    v9[3] = &unk_2652360F0;
    objc_copyWeak(v10, v4);
    v10[1] = v6;
    [v3 setRemovalHandler:v9];
    objc_destroyWeak(v10);
  }
}

void __54__AHFPencilController_initializeDigitizerStylusSystem__block_invoke_13(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = LoggingFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 136315650;
      objc_super v7 = "-[AHFPencilController initializeDigitizerStylusSystem]_block_invoke";
      __int16 v8 = 2048;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v3, OS_LOG_TYPE_DEFAULT, "%s Digitizer Stylus with senderID 0x%llx removed in %s queue", (uint8_t *)&v6, 0x20u);
    }

    dispatch_queue_t v5 = [WeakRetained availableDigitizerStylus];
    [v5 removeIndex:*(void *)(a1 + 40)];
  }
}

- (BOOL)initializeOpaqueTouchSystem
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = (NSMutableIndexSet *)objc_opt_new();
  availableOpaqueTouch = self->_availableOpaqueTouch;
  self->_availableOpaqueTouch = v3;

  if (self->_availableOpaqueTouch)
  {
    dispatch_queue_t v5 = (HIDEventSystemClient *)[objc_alloc(MEMORY[0x263F41DD8]) initWithType:2];
    opaqueTouchClient = self->_opaqueTouchClient;
    self->_opaqueTouchClient = v5;

    objc_super v7 = self->_opaqueTouchClient;
    if (v7)
    {
      [(HIDEventSystemClient *)v7 setMatching:&unk_26FC38C18];
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke;
      v18[3] = &unk_265236118;
      objc_copyWeak(&v19, &location);
      __int16 v8 = (void (**)(void, void))MEMORY[0x24C572980](v18);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v9 = [(HIDEventSystemClient *)self->_opaqueTouchClient services];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v9);
            }
            v8[2](v8, *(void *)(*((void *)&v14 + 1) + 8 * v12++));
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
        }
        while (v10);
      }

      [(HIDEventSystemClient *)self->_opaqueTouchClient setServiceNotificationHandler:v8];
      [(HIDEventSystemClient *)self->_opaqueTouchClient setDispatchQueue:self->_queue];
      [(HIDEventSystemClient *)self->_opaqueTouchClient activate];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

void __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v6 = (void *)[v3 serviceID];
    objc_super v7 = LoggingFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = "-[AHFPencilController initializeOpaqueTouchSystem]_block_invoke";
      __int16 v13 = 2048;
      long long v14 = v6;
      __int16 v15 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v7, OS_LOG_TYPE_DEFAULT, "%s OpaqueTouch with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    __int16 v8 = [WeakRetained availableOpaqueTouch];
    [v8 addIndex:v6];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke_24;
    v9[3] = &unk_2652360F0;
    objc_copyWeak(v10, v4);
    v10[1] = v6;
    [v3 setRemovalHandler:v9];
    objc_destroyWeak(v10);
  }
}

void __50__AHFPencilController_initializeOpaqueTouchSystem__block_invoke_24(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = LoggingFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 136315650;
      objc_super v7 = "-[AHFPencilController initializeOpaqueTouchSystem]_block_invoke";
      __int16 v8 = 2048;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v3, OS_LOG_TYPE_DEFAULT, "%s OpaqueTouch with senderID 0x%llx removed in %s queue", (uint8_t *)&v6, 0x20u);
    }

    dispatch_queue_t v5 = [WeakRetained availableOpaqueTouch];
    [v5 removeIndex:*(void *)(a1 + 40)];
  }
}

- (BOOL)initializePencilHapticsSystem
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  self->_io_object_t availablePencilHaptics = 0;
  id v3 = (HIDEventSystemClient *)[objc_alloc(MEMORY[0x263F41DD8]) initWithType:2];
  pencilHapticsClient = self->_pencilHapticsClient;
  self->_pencilHapticsClient = v3;

  dispatch_queue_t v5 = self->_pencilHapticsClient;
  if (v5)
  {
    [(HIDEventSystemClient *)self->_pencilHapticsClient setMatching:&unk_26FC38C40];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__AHFPencilController_initializePencilHapticsSystem__block_invoke;
    v16[3] = &unk_265236118;
    objc_copyWeak(&v17, &location);
    int v6 = (void (**)(void, void))MEMORY[0x24C572980](v16);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v7 = [(HIDEventSystemClient *)self->_pencilHapticsClient services];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
      }
      while (v8);
    }

    [(HIDEventSystemClient *)self->_pencilHapticsClient setServiceNotificationHandler:v6];
    [(HIDEventSystemClient *)self->_pencilHapticsClient setDispatchQueue:self->_queue];
    [(HIDEventSystemClient *)self->_pencilHapticsClient activate];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v5 != 0;
}

void __52__AHFPencilController_initializePencilHapticsSystem__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v6 = (void *)[v3 serviceID];
    objc_super v7 = LoggingFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v12 = "-[AHFPencilController initializePencilHapticsSystem]_block_invoke";
      __int16 v13 = 2048;
      long long v14 = v6;
      __int16 v15 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v7, OS_LOG_TYPE_DEFAULT, "%s Pencil Haptics with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    IOObjectRelease([WeakRetained availablePencilHaptics]);
    CFDictionaryRef v8 = IORegistryEntryIDMatching((uint64_t)v6);
    objc_msgSend(WeakRetained, "setAvailablePencilHaptics:", IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v8));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__AHFPencilController_initializePencilHapticsSystem__block_invoke_35;
    v9[3] = &unk_2652360F0;
    objc_copyWeak(v10, v4);
    v10[1] = v6;
    [v3 setRemovalHandler:v9];
    objc_destroyWeak(v10);
  }
}

void __52__AHFPencilController_initializePencilHapticsSystem__block_invoke_35(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = LoggingFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 136315650;
      int v6 = "-[AHFPencilController initializePencilHapticsSystem]_block_invoke";
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_247F8A000, v3, OS_LOG_TYPE_DEFAULT, "%s Pencil Haptics with senderID 0x%llx removed in %s queue", (uint8_t *)&v5, 0x20u);
    }

    IOObjectRelease([WeakRetained availablePencilHaptics]);
    [WeakRetained setAvailablePencilHaptics:0];
  }
}

- (int)playFeedbackGated:(id)a3 haptics:(unsigned int)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v10 = -536870212;
  id v11 = a3;
  unint64_t v12 = machTimeToMicrosec(a5);
  __int16 v13 = [(AHFPencilPatternLibrary *)self->_patternsLibrary getReportForPattern:v11 timestampUs:v12 prevTimestampUs:self->_prevTimestampUs error:a6];
  if (v13)
  {
    uint64_t v14 = mach_absolute_time();
    unint64_t v15 = machTimeToMicrosec(v14);
    long long v16 = LoggingFramework();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      float v17 = (float)(v12 - self->_prevTimestampUs);
      *(_DWORD *)buf = 136315906;
      v28 = "-[AHFPencilController playFeedbackGated:haptics:timestamp:error:]";
      __int16 v29 = 2112;
      id v30 = v11;
      __int16 v31 = 2048;
      unint64_t v32 = v15 - v12;
      __int16 v33 = 2048;
      double v34 = (float)(v17 / 1000.0);
      _os_log_impl(&dword_247F8A000, v16, OS_LOG_TYPE_DEFAULT, "%s Playing pattern %@ requested %lldus ago, previous was %.2fms ago", buf, 0x2Au);
    }

    v18 = LoggingFramework();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 134349056;
      v28 = (const char *)a5;
      _os_signpost_emit_with_name_impl(&dword_247F8A000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PlayPencilFeedback", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
    }

    mach_error_t v19 = IORegistryEntrySetCFProperty(a4, @"HapticsMessage", v13);
    if (v19)
    {
      uint64_t v20 = mach_error_string(v19);
      failure(a6, -536870212, (uint64_t)"Error requesting playback to kernel: %s", v21, v22, v23, v24, v25, (uint64_t)v20);
    }
    else
    {
      int v10 = 0;
    }
    self->_prevTimestampUs = v12;
  }
  else
  {
    int v10 = -536870206;
  }

  return v10;
}

- (int)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = -536870212;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  uint64_t v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v11 = LoggingFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v32 = "-[AHFPencilController playFeedback:senderID:timestamp:error:]";
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2048;
    unint64_t v36 = a4;
    _os_log_impl(&dword_247F8A000, v11, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on pencil HID sender ID 0x%llX", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__AHFPencilController_playFeedback_senderID_timestamp_error___block_invoke;
  v16[3] = &unk_265236140;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a4;
  v18 = &v27;
  mach_error_t v19 = &v21;
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

void __61__AHFPencilController_playFeedback_senderID_timestamp_error___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained availableDigitizerStylus];
  if ([v4 containsIndex:*(void *)(a1 + 64)])
  {
  }
  else
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 availableOpaqueTouch];
    char v7 = [v6 containsIndex:*(void *)(a1 + 64)];

    if ((v7 & 1) == 0)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536870208;
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      unint64_t v32 = *(void **)(v26 + 40);
      failure(&v32, *(_DWORD *)(*(void *)(v28 + 8) + 24), (uint64_t)"SenderID 0x%llX not found", v8, v9, v10, v11, v12, *(void *)(a1 + 64));
      uint64_t v27 = v32;
      goto LABEL_8;
    }
  }
  id v13 = objc_loadWeakRetained(v2);
  int v14 = [v13 availablePencilHaptics];

  if (!v14)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536870184;
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v31 = *(void **)(v26 + 40);
    failure(&v31, *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (uint64_t)"No Pencil Haptics device to play pattern %@ to", v15, v16, v17, v18, v19, *(void *)(a1 + 32));
    uint64_t v27 = v31;
LABEL_8:
    id v29 = v27;
    id v22 = *(id *)(v26 + 40);
    *(void *)(v26 + 40) = v29;
    goto LABEL_9;
  }
  id v20 = objc_loadWeakRetained(v2);
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = v20;
  uint64_t v23 = [v22 availablePencilHaptics];
  uint64_t v24 = *(void *)(a1 + 72);
  uint64_t v25 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id obj = 0;
  LODWORD(v21) = [v22 playFeedbackGated:v21 haptics:v23 timestamp:v24 error:&obj];

  objc_storeStrong(v25, obj);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v21;
LABEL_9:
}

- (int)playFeedback:(id)a3 accessoryID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = -536870212;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  uint64_t v12 = LoggingFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v35 = "-[AHFPencilController playFeedback:accessoryID:timestamp:error:]";
    __int16 v36 = 2112;
    id v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl(&dword_247F8A000, v12, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on pencil power source accessory ID %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__AHFPencilController_playFeedback_accessoryID_timestamp_error___block_invoke;
  v18[3] = &unk_265236168;
  objc_copyWeak(v23, (id *)buf);
  uint64_t v21 = &v30;
  id v22 = &v24;
  id v14 = v10;
  id v19 = v14;
  id v15 = v11;
  id v20 = v15;
  v23[1] = (id)a5;
  dispatch_sync(queue, v18);
  int v16 = *((_DWORD *)v31 + 6);
  if (a6 && v16)
  {
    *a6 = (id) v25[5];
    int v16 = *((_DWORD *)v31 + 6);
  }

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __64__AHFPencilController_playFeedback_accessoryID_timestamp_error___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v4 = [WeakRetained availablePencilHaptics];

  if (v4)
  {
    id v10 = objc_loadWeakRetained(v2);
    io_registry_entry_t v11 = [v10 availablePencilHaptics];
    uint64_t v12 = (void *)IORegistryEntrySearchCFProperty(v11, "IOService", @"PhysicalDeviceUniqueID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 3u);

    if ([v12 isEqualToString:*(void *)(a1 + 40)])
    {
      id v18 = objc_loadWeakRetained(v2);
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = v18;
      uint64_t v21 = [v20 availablePencilHaptics];
      uint64_t v22 = *(void *)(a1 + 72);
      uint64_t v23 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id obj = 0;
      LODWORD(v19) = [v20 playFeedbackGated:v19 haptics:v21 timestamp:v22 error:&obj];

      objc_storeStrong(v23, obj);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
    }
    else
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -536870208;
      uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
      id v30 = *(id *)(v27 + 40);
      failure(&v30, *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (uint64_t)"Accessory ID %@ not found", v13, v14, v15, v16, v17, *(void *)(a1 + 40));
      id v28 = v30;
      id v20 = *(id *)(v27 + 40);
      *(void *)(v27 + 40) = v28;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -536870184;
    uint64_t v24 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    id v31 = *(id *)(v25 + 40);
    failure(&v31, *(_DWORD *)(*(void *)(v24 + 8) + 24), (uint64_t)"No Pencil Haptics device to play pattern %@ to", v5, v6, v7, v8, v9, *(void *)(a1 + 32));
    id v26 = v31;
    uint64_t v12 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v26;
  }
}

- (AHFPencilPatternLibrary)patternsLibrary
{
  return self->_patternsLibrary;
}

- (void)setPatternsLibrary:(id)a3
{
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

- (HIDEventSystemClient)digitizerStylusClient
{
  return self->_digitizerStylusClient;
}

- (void)setDigitizerStylusClient:(id)a3
{
}

- (NSMutableIndexSet)availableDigitizerStylus
{
  return self->_availableDigitizerStylus;
}

- (void)setAvailableDigitizerStylus:(id)a3
{
}

- (HIDEventSystemClient)opaqueTouchClient
{
  return self->_opaqueTouchClient;
}

- (void)setOpaqueTouchClient:(id)a3
{
}

- (NSMutableIndexSet)availableOpaqueTouch
{
  return self->_availableOpaqueTouch;
}

- (void)setAvailableOpaqueTouch:(id)a3
{
}

- (HIDEventSystemClient)pencilHapticsClient
{
  return self->_pencilHapticsClient;
}

- (void)setPencilHapticsClient:(id)a3
{
}

- (unsigned)availablePencilHaptics
{
  return self->_availablePencilHaptics;
}

- (void)setAvailablePencilHaptics:(unsigned int)a3
{
  self->_io_object_t availablePencilHaptics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilHapticsClient, 0);
  objc_storeStrong((id *)&self->_availableOpaqueTouch, 0);
  objc_storeStrong((id *)&self->_opaqueTouchClient, 0);
  objc_storeStrong((id *)&self->_availableDigitizerStylus, 0);
  objc_storeStrong((id *)&self->_digitizerStylusClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_patternsLibrary, 0);
}

@end
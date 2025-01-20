@interface AVCaptureFigAudioDevice
+ (id)_devices;
+ (id)_devicesWithPriorRegisteredDevices:(id)a3;
+ (id)_newFigCaptureSources;
+ (void)_reconnectDevices:(id)a3;
+ (void)initialize;
- (AVCaptureFigAudioDevice)init;
- (BOOL)currentAudioInputRouteIsBuiltInMic:(id)a3;
- (BOOL)hasMediaType:(id)a3;
- (BOOL)isAudioCaptureModeSupported:(int64_t)a3;
- (BOOL)isAudioInputRouteBuiltInMic;
- (BOOL)isBuiltInStereoAudioCaptureSupported;
- (BOOL)isConnected;
- (BOOL)isSoonToBeDisconnected;
- (BOOL)isWindNoiseRemovalSupported;
- (BOOL)shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:(int64_t)a3;
- (BOOL)startUsingDevice:(id *)a3;
- (BOOL)supportsAVCaptureSessionPreset:(id)a3;
- (OpaqueCMClock)deviceClock;
- (OpaqueFigCaptureSource)figCaptureSource;
- (id)_copyFigCaptureSourceProperty:(__CFString *)a3;
- (id)_initWithFigCaptureSource:(OpaqueFigCaptureSource *)a3;
- (id)clientAudioClockDeviceUID;
- (id)deviceType;
- (id)figCaptureSourceAudioSettingsForSessionPreset:(id)a3;
- (id)localizedName;
- (id)modelID;
- (id)uniqueID;
- (int64_t)fallbackAudioCaptureModeIfApplicableForCurrentRoute:(int64_t)a3;
- (void)_handleNotification:(__CFString *)a3 payload:(id)a4;
- (void)_reconnectToFigCaptureSource:(OpaqueFigCaptureSource *)a3;
- (void)_setFigCaptureSource:(OpaqueFigCaptureSource *)a3;
- (void)audioInputDeviceLocalizedNameDidChangeHandler:(id)a3;
- (void)audioInputDevicesDidChangeHandler:(id)a3;
- (void)dealloc;
- (void)setClientAudioClockDeviceUID:(id)a3;
@end

@implementation AVCaptureFigAudioDevice

- (BOOL)hasMediaType:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F47C40]];
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (id)deviceType
{
  return @"AVCaptureDeviceTypeMicrophone";
}

- (OpaqueCMClock)deviceClock
{
  if (!AVCaptureAudiomxdSupportEnabled())
  {
    CFTypeRef v5 = [(AVCaptureFigAudioDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51FB0]];
    if (v5) {
      goto LABEL_6;
    }
    return 0;
  }
  p_sharedAVAudioSessionClock = &self->_sharedAVAudioSessionClock;
  v4 = *p_sharedAVAudioSessionClock;
  if (!*p_sharedAVAudioSessionClock)
  {
    [MEMORY[0x1E4F153E0] sharedInstance];
    FigAudioSessionClockCreateForAVAudioSession();
    v4 = *p_sharedAVAudioSessionClock;
    if (!*p_sharedAVAudioSessionClock) {
      return 0;
    }
  }
  CFTypeRef v5 = CFRetain(v4);
LABEL_6:

  return (OpaqueCMClock *)CFAutorelease(v5);
}

- (OpaqueFigCaptureSource)figCaptureSource
{
  return self->_fcs;
}

- (id)clientAudioClockDeviceUID
{
  v2 = (void *)[(NSString *)self->_clientAudioClockDeviceUID copy];

  return v2;
}

- (BOOL)supportsAVCaptureSessionPreset:(id)a3
{
  return 1;
}

- (BOOL)isSoonToBeDisconnected
{
  return self->_isSoonToBeDisconnected;
}

- (int64_t)fallbackAudioCaptureModeIfApplicableForCurrentRoute:(int64_t)a3
{
  int64_t v3 = a3;
  if ((a3 | 4) == 6 && ![(AVCaptureFigAudioDevice *)self isAudioInputRouteBuiltInMic])
  {
    if (dword_1EB4C9240)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  return v3;
}

- (id)uniqueID
{
  return [(NSDictionary *)self->_attributes objectForKeyedSubscript:*MEMORY[0x1E4F51C80]];
}

void __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = [objc_alloc(MEMORY[0x1E4F153E0]) initAuxiliarySession];
  [*(id *)(*(void *)(a1 + 32) + 176) setCategory:*MEMORY[0x1E4F14F90] error:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 32) currentAudioInputRouteIsBuiltInMic:0];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 128);

  dispatch_group_leave(v2);
}

- (BOOL)currentAudioInputRouteIsBuiltInMic:(id)a3
{
  id v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 || (id v3 = [(AVCaptureFigAudioDevice *)self localizedName]) != 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    CFTypeRef v5 = [(AVAudioSession *)self->_auxiliarySession availableInputs];
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "portName"), "isEqualToString:", v3))
          {
            v12 = (void *)[v10 portType];
            return [v12 isEqualToString:*MEMORY[0x1E4F150F0]];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  return 1;
}

- (id)localizedName
{
  dispatch_group_wait((dispatch_group_t)self->_localizedNameFirstQueryGroup, 0xFFFFFFFFFFFFFFFFLL);
  p_localizedNameLock = &self->_localizedNameLock;
  os_unfair_lock_lock(&self->_localizedNameLock);
  v4 = self->_localizedName;
  os_unfair_lock_unlock(p_localizedNameLock);
  return v4;
}

void *__48__AVCaptureFigAudioDevice__setFigCaptureSource___block_invoke(void *result)
{
  uint64_t v1 = result[5];
  uint64_t v2 = *(void *)(result[4] + 56);
  if (v1 != v2)
  {
    id v3 = result;
    if (v2)
    {
      if (v1 && (AVCaptureIsRunningInMediaserverd() & 1) == 0)
      {
        id v16 = 0;
        uint64_t v4 = *(void *)(v3[4] + 56);
        uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v5) {
          uint64_t v6 = v5;
        }
        else {
          uint64_t v6 = 0;
        }
        uint64_t v7 = *(unsigned int (**)(uint64_t, void, void, id *))(v6 + 48);
        if (v7)
        {
          if (!v7(v4, *MEMORY[0x1E4F521B0], *MEMORY[0x1E4F1CF80], &v16) && v16 != 0)
          {
            int v9 = [v16 intValue];
            if (v9 >= 1)
            {
              int v10 = v9;
              do
              {
                uint64_t v11 = v3[5];
                if (v11 && (uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 16)) != 0) {
                  uint64_t v13 = v12;
                }
                else {
                  uint64_t v13 = 0;
                }
                long long v14 = *(void (**)(uint64_t))(v13 + 8);
                if (v14) {
                  v14(v11);
                }
                --v10;
              }
              while (v10);
            }
          }
        }
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", *(void *)(v3[4] + 144), fad_figCaptureSourceNotificationHandler, 0, *(void *)(v3[4] + 56));
      long long v15 = *(const void **)(v3[4] + 56);
      if (v15)
      {
        CFRelease(v15);
        *(void *)(v3[4] + 56) = 0;
      }
    }
    result = (void *)v3[5];
    if (result)
    {
      *(void *)(v3[4] + 56) = CFRetain(result);
      return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47DB8], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", *(void *)(v3[4] + 144), fad_figCaptureSourceNotificationHandler, 0, v3[5], 0);
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BOOL)isAudioCaptureModeSupported:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
      BOOL result = 1;
      break;
    case 1:
      attributes = self->_attributes;
      uint64_t v5 = (void *)MEMORY[0x1E4F51B10];
      goto LABEL_7;
    case 2:
      attributes = self->_attributes;
      uint64_t v5 = (void *)MEMORY[0x1E4F51B20];
LABEL_7:
      id v6 = [(NSDictionary *)attributes objectForKeyedSubscript:*v5];
      BOOL result = [v6 BOOLValue];
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

+ (id)_devices
{
  return (id)[a1 _devicesWithPriorRegisteredDevices:0];
}

+ (id)_devicesWithPriorRegisteredDevices:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v24 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = +[AVCaptureFigAudioDevice _newFigCaptureSources];
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    uint64_t v21 = *MEMORY[0x1E4F51F20];
    uint64_t v20 = *MEMORY[0x1E4F1CF80];
    uint64_t v23 = *MEMORY[0x1E4F51C80];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        if ([a3 count])
        {
          id v29 = 0;
          uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v9) {
            uint64_t v10 = v9;
          }
          else {
            uint64_t v10 = 0;
          }
          uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(v10 + 48);
          if (v11) {
            v11(v8, v21, v20, &v29);
          }
          id v12 = (id)[v29 objectForKeyedSubscript:v23];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v13 = [a3 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v26;
LABEL_14:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(a3);
              }
              v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
              if (objc_msgSend((id)objc_msgSend(v17, "uniqueID"), "isEqualToString:", v12)) {
                break;
              }
              if (v14 == ++v16)
              {
                uint64_t v14 = [a3 countByEnumeratingWithState:&v25 objects:v34 count:16];
                if (v14) {
                  goto LABEL_14;
                }
                goto LABEL_20;
              }
            }
            id v18 = v17;

            if (v18) {
              goto LABEL_23;
            }
          }
          else
          {
LABEL_20:
          }
        }
        id v18 = [[AVCaptureFigAudioDevice alloc] _initWithFigCaptureSource:v8];
LABEL_23:
        [v24 addObject:v18];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }
  return v24;
}

- (id)_initWithFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)AVCaptureFigAudioDevice;
  id v4 = [(AVCaptureDevice *)&v19 initSubclass];
  if (v4)
  {
    *((void *)v4 + 18) = [objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v4];
    *((void *)v4 + 6) = dispatch_queue_create("com.apple.avfoundation.audiocapturedevice.source_queue", 0);
    *((void *)v4 + 19) = dispatch_semaphore_create(0);
    [v4 _setFigCaptureSource:a3];
    *((void *)v4 + 8) = [v4 _copyFigCaptureSourceProperty:*MEMORY[0x1E4F51F20]];
    *((unsigned char *)v4 + 72) = 0;
    uint64_t v5 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController];
    *((unsigned char *)v4 + 73) = objc_msgSend((id)objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E4F74EC8]), "BOOLValue");
    *((unsigned char *)v4 + 74) = 0;
    *((void *)v4 + 10) = dispatch_queue_create("com.apple.avfoundation.audiocapturedevice.localized_name_first_query_queue", 0);
    *((_DWORD *)v4 + 22) = 0;
    uint64_t v6 = dispatch_group_create();
    *((void *)v4 + 12) = v6;
    dispatch_group_enter(v6);
    uint64_t v7 = *((void *)v4 + 10);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke;
    block[3] = &unk_1E5A72ED0;
    block[4] = v4;
    dispatch_async(v7, block);
    *((void *)v4 + 14) = dispatch_queue_create("com.apple.avfoundation.audiocapturedevice.audio_routes_info_update_queue", 0);
    *((_DWORD *)v4 + 30) = 0;
    uint64_t v8 = dispatch_group_create();
    *((void *)v4 + 16) = v8;
    dispatch_group_enter(v8);
    uint64_t v9 = *((void *)v4 + 14);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke_2;
    v17[3] = &unk_1E5A72ED0;
    v17[4] = v4;
    dispatch_async(v9, v17);
    uint64_t v10 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController];
    uint64_t v11 = (void *)MEMORY[0x1E4F74ED0];
    id v12 = (void *)MEMORY[0x1E4F74AA0];
    uint64_t v13 = *MEMORY[0x1E4F74AA0];
    v20[0] = *MEMORY[0x1E4F74ED0];
    v20[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [v10 setAttribute:v14 forKey:*MEMORY[0x1E4F74EA8] error:0];
    uint64_t v15 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v4 selector:sel_audioInputDevicesDidChangeHandler_ name:*v11 object:v10];
    [v15 addObserver:v4 selector:sel_audioInputDeviceLocalizedNameDidChangeHandler_ name:*v12 object:v10];
  }
  return v4;
}

void __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController];
  *(void *)(*(void *)(a1 + 32) + 104) = (id)[v2 attributeForKey:*MEMORY[0x1E4F74A98]];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 96);

  dispatch_group_leave(v3);
}

- (void)_setFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  fcsQueue = self->_fcsQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AVCaptureFigAudioDevice__setFigCaptureSource___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(fcsQueue, v4);
}

- (id)_copyFigCaptureSourceProperty:(__CFString *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__9;
  fcsQueue = self->_fcsQueue;
  uint64_t v11 = __Block_byref_object_dispose__9;
  uint64_t v12 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVCaptureFigAudioDevice__copyFigCaptureSourceProperty___block_invoke;
  block[3] = &unk_1E5A74050;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)_newFigCaptureSources
{
  if (AVCaptureIsRunningInMediaserverd())
  {
    return (id)FigCaptureSourceCopySources();
  }
  else
  {
    return (id)FigCaptureSourceRemoteCopyCaptureSources();
  }
}

- (BOOL)isWindNoiseRemovalSupported
{
  id v2 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:*MEMORY[0x1E4F51CC8]];

  return [v2 BOOLValue];
}

uint64_t __57__AVCaptureFigAudioDevice__copyFigCaptureSourceProperty___block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[4] + 56);
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 8);
  uint64_t result = VTable + 8;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x1E4F1CF80];
    return v9(v1, v2, v10, v3 + 40);
  }
  return result;
}

+ (void)_reconnectDevices:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (AVCaptureIsRunningInMediaserverd()) {
    id v4 = (void *)FigCaptureSourceCopySources();
  }
  else {
    id v4 = (void *)FigCaptureSourceRemoteCopyCaptureSources();
  }
  uint64_t v5 = v4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v23 = *(void *)v30;
    uint64_t v21 = *MEMORY[0x1E4F51F20];
    uint64_t v20 = *MEMORY[0x1E4F1CF80];
    uint64_t v8 = *MEMORY[0x1E4F51C80];
    id obj = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v28 = 0;
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(v12 + 48);
        if (v13) {
          v13(v10, v21, v20, &v28);
        }
        id v14 = (id)objc_msgSend(v28, "objectForKeyedSubscript:", v8, v20, v21);

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v15 = [a3 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v25 != v17) {
                objc_enumerationMutation(a3);
              }
              if (v14)
              {
                objc_super v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v19, "uniqueID"), "isEqualToString:", v14))
                {
                  [v19 _reconnectToFigCaptureSource:v10];
                  goto LABEL_25;
                }
              }
            }
            uint64_t v16 = [a3 countByEnumeratingWithState:&v24 objects:v33 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_25:
      }
      uint64_t v5 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }
}

- (AVCaptureFigAudioDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureFigAudioDevice;
  uint64_t v2 = [(AVCaptureDevice *)&v5 init];
  if (v2)
  {
    uint64_t v3 = v2;
    NSLog(&cfstr_Avcapturedevic_73.isa);
  }
  return 0;
}

- (void)dealloc
{
  [(AVCaptureFigAudioDevice *)self _setFigCaptureSource:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  dispatch_release((dispatch_object_t)self->_localizedNameFirstQueryGroup);
  dispatch_release((dispatch_object_t)self->_audioRoutesInfoFirstQueryGroup);
  sharedAVAudioSessionClock = self->_sharedAVAudioSessionClock;
  if (sharedAVAudioSessionClock) {
    CFRelease(sharedAVAudioSessionClock);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFigAudioDevice;
  [(AVCaptureDevice *)&v4 dealloc];
}

- (id)modelID
{
  return [(NSDictionary *)self->_attributes objectForKeyedSubscript:*MEMORY[0x1E4F51C00]];
}

- (id)figCaptureSourceAudioSettingsForSessionPreset:(id)a3
{
  id v4 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:*MEMORY[0x1E4F51AF0]];

  return (id)[v4 objectForKeyedSubscript:a3];
}

- (BOOL)isBuiltInStereoAudioCaptureSupported
{
  id v2 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:*MEMORY[0x1E4F51B10]];

  return [v2 BOOLValue];
}

- (BOOL)shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)isAudioInputRouteBuiltInMic
{
  id v2 = self;
  dispatch_group_wait((dispatch_group_t)self->_audioRoutesInfoFirstQueryGroup, 0xFFFFFFFFFFFFFFFFLL);
  p_audioRoutesInfoLock = &v2->_audioRoutesInfoLock;
  os_unfair_lock_lock(&v2->_audioRoutesInfoLock);
  LOBYTE(v2) = v2->_audioInputRouteIsBuiltInMic;
  os_unfair_lock_unlock(p_audioRoutesInfoLock);
  return (char)v2;
}

- (BOOL)startUsingDevice:(id *)a3
{
  return 1;
}

- (void)setClientAudioClockDeviceUID:(id)a3
{
  self->_clientAudioClockDeviceUID = (NSString *)a3;
}

- (void)audioInputDevicesDidChangeHandler:(id)a3
{
  [(AVCaptureFigAudioDevice *)self willChangeValueForKey:@"connected"];
  id v4 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController];
  int v5 = objc_msgSend((id)objc_msgSend(v4, "attributeForKey:", *MEMORY[0x1E4F74EC8]), "BOOLValue");
  self->_isConnected = v5;
  if (v5)
  {
    uint64_t v6 = @"AVCaptureDeviceWasConnectedNotification";
    self->_isSoonToBeDisconnected = 0;
  }
  else
  {
    uint64_t v6 = @"AVCaptureDeviceWasDisconnectedNotification";
  }
  [(AVCaptureFigAudioDevice *)self didChangeValueForKey:@"connected"];
  uint64_t v7 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];

  [v7 postNotificationName:v6 object:self];
}

- (void)audioInputDeviceLocalizedNameDidChangeHandler:(id)a3
{
  audioRoutesInfoUpdateQueue = self->_audioRoutesInfoUpdateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke;
  block[3] = &unk_1E5A72ED0;
  block[4] = self;
  dispatch_async(audioRoutesInfoUpdateQueue, block);
}

void __73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke(uint64_t a1)
{
  id v2 = (void *)[MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v3 = [v2 attributeForKey:*MEMORY[0x1E4F74A98]];
  char v4 = [*(id *)(a1 + 32) currentAudioInputRouteIsBuiltInMic:v3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke_2;
  block[3] = &unk_1E5A79A60;
  block[4] = *(void *)(a1 + 32);
  void block[5] = v3;
  char v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

unsigned __int8 *__73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 104) isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    [*(id *)(a1 + 32) willChangeValueForKey:@"localizedName"];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
    id v2 = *(id *)(a1 + 40);

    *(void *)(*(void *)(a1 + 32) + 104) = *(void *)(a1 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 88));
    [*(id *)(a1 + 32) didChangeValueForKey:@"localizedName"];
  }
  uint64_t result = *(unsigned __int8 **)(a1 + 32);
  if (result[136] != *(unsigned __int8 *)(a1 + 48))
  {
    [result willChangeValueForKey:@"audioInputRouteIsBuiltInMic"];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
    *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 48);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
    char v4 = *(void **)(a1 + 32);
    return (unsigned __int8 *)[v4 didChangeValueForKey:@"audioInputRouteIsBuiltInMic"];
  }
  return result;
}

- (void)_reconnectToFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  id v5 = [(AVCaptureFigAudioDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F521B8]];
  char v6 = v5;
  if (v5 != (id)*MEMORY[0x1E4F1CFD0])
  {
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_serverConnectionDiedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (v6) {
LABEL_3:
  }
    CFRelease(v6);
LABEL_4:

  [(AVCaptureFigAudioDevice *)self _setFigCaptureSource:a3];
}

- (void)_handleNotification:(__CFString *)a3 payload:(id)a4
{
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4F51E78]))
  {
    id v5 = [(AVCaptureFigAudioDevice *)self _copyFigCaptureSourceProperty:*MEMORY[0x1E4F521B8]];
    if (v5 != (id)*MEMORY[0x1E4F1CFC8])
    {
      char v6 = v5;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_serverConnectionDiedSemaphore);
      if (v6)
      {
        CFRelease(v6);
      }
    }
  }
}

@end
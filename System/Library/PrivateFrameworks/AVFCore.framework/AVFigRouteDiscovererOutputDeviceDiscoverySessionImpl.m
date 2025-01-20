@interface AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl
- (AVAudioSession)targetAudioSession;
- (AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl)init;
- (AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl)initWithFigRouteDiscovererCreator:(id)a3;
- (AVOutputDeviceDiscoverySession)parentOutputDeviceDiscoverySession;
- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)availableOutputDevicesObject;
- (BOOL)devicePresenceDetected;
- (OpaqueFigRouteDiscoverer)routeDiscoverer;
- (void)_availableGroupsChanged;
- (void)_availableRoutesChanged;
- (void)_endpointDescriptorChanged;
- (void)_routePresentChanged;
- (void)_serverDied;
- (void)dealloc;
- (void)outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:(id)a3;
- (void)outputDeviceDiscoverySessionDidChangeDiscoveryMode:(id)a3 forClientIdentifiers:(id)a4;
- (void)setParentOutputDeviceDiscoverySession:(id)a3;
- (void)setTargetAudioSession:(id)a3;
@end

@implementation AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl

- (void)outputDeviceDiscoverySessionDidChangeDiscoveryMode:(id)a3 forClientIdentifiers:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  switch([a3 discoveryMode])
  {
    case 0:
      v6 = (const void **)MEMORY[0x1E4F75540];
      goto LABEL_7;
    case 1:
      v6 = (const void **)MEMORY[0x1E4F75548];
      goto LABEL_7;
    case 2:
      v6 = (const void **)MEMORY[0x1E4F75538];
      goto LABEL_7;
    case 3:
      v6 = (const void **)MEMORY[0x1E4F75530];
LABEL_7:
      v7 = *v6;
      break;
    default:
      v7 = 0;
      break;
  }
  if (dword_1EB2D39E0)
  {
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  discoverer = self->_discoverer;
  uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  v12 = *(void (**)(OpaqueFigRouteDiscoverer *, void, const void *))(v11 + 56);
  if (v12) {
    v12(discoverer, *MEMORY[0x1E4F75588], v7);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [a4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(a4);
        }
        CFDictionarySetValue(Mutable, *(const void **)(*((void *)&v22 + 1) + 8 * i), v7);
      }
      uint64_t v15 = [a4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v15);
  }
  v18 = self->_discoverer;
  uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = *(void (**)(OpaqueFigRouteDiscoverer *, void, __CFDictionary *))(v20 + 56);
  if (v21) {
    v21(v18, *MEMORY[0x1E4F75590], Mutable);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (AVOutputDeviceDiscoverySessionAvailableOutputDevices)availableOutputDevicesObject
{
  if (+[AVOutputDevice prefersRouteDescriptors])
  {
    CFTypeRef cf = 0;
    discoverer = self->_discoverer;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v11 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, void, const __CFAllocator *, CFTypeRef *))(v6 + 48);
    if (!v11 || (!v11(discoverer, *MEMORY[0x1E4F75570], v4, &cf) ? (BOOL v12 = cf == 0) : (BOOL v12 = 1), v12)) {
      CFTypeRef cf = CFArrayCreate(v4, 0, 0, MEMORY[0x1E4F1D510]);
    }
    v13 = [AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl alloc];
    uint64_t v14 = [(AVFigRouteDescriptorOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)v13 initWithRouteDescriptors:cf routeDiscoverer:self->_discoverer];
  }
  else
  {
    CFTypeRef cf = 0;
    v7 = self->_discoverer;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v15 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, void, const __CFAllocator *, CFTypeRef *))(v10 + 48);
    if (!v15 || (!v15(v7, *MEMORY[0x1E4F75578], v8, &cf) ? (BOOL v16 = cf == 0) : (BOOL v16 = 1), v16)) {
      CFTypeRef cf = CFArrayCreate(v8, 0, 0, MEMORY[0x1E4F1D510]);
    }
    v17 = [AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl alloc];
    uint64_t v14 = [(AVFigEndpointOutputDeviceDiscoverySessionAvailableOutputDevicesImpl *)v17 initWithAvailableFigEndpoints:cf];
  }
  v18 = (void *)v14;
  if (cf) {
    CFRelease(cf);
  }
  uint64_t v19 = [[AVOutputDeviceDiscoverySessionAvailableOutputDevices alloc] initWithOutputDeviceDiscoverySessionAvailableOutputDevicesImpl:v18];

  return v19;
}

- (void).cxx_destruct
{
}

- (void)setParentOutputDeviceDiscoverySession:(id)a3
{
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl)initWithFigRouteDiscovererCreator:(id)a3
{
  id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v15.receiver = self;
  v15.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl;
  uint64_t v6 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)&v15 init];
  uint64_t v7 = [a3 copy];
  v6->_routeDiscovererCreator = (id)v7;
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  unsigned int v9 = 0;
  do
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(v8 + 16))(v8);
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v9 >= 4;
    }
    ++v9;
  }
  while (!v11);
  v6->_discoverer = (OpaqueFigRouteDiscoverer *)v10;
  if (v10)
  {
    BOOL v12 = [[AVWeakReference alloc] initWithReferencedObject:v6];
    v6->_weakObserver = v12;
    [v5 addListenerWithWeakReference:v12 callback:AVFigRouteDiscovererAvailableRoutesChanged name:*MEMORY[0x1E4F75550] object:v6->_discoverer flags:0];
    [v5 addListenerWithWeakReference:v6->_weakObserver callback:AVFigRouteDiscovererRoutePresentChanged name:*MEMORY[0x1E4F75558] object:v6->_discoverer flags:0];
    [v5 addListenerWithWeakReference:v6->_weakObserver callback:AVFigRouteDiscovererRouteServerDied name:*MEMORY[0x1E4F75560] object:v6->_discoverer flags:0];
    [v5 addListenerWithWeakReference:v6->_weakObserver callback:AVFigRouteDiscovererEndpointDescriptorChanged name:@"Discoverer_EndpointDescriptorChanged" object:v6->_discoverer flags:0];
    v13 = v6;
  }
  else
  {
LABEL_11:
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  if (self->_discoverer)
  {
    CFAllocatorRef v4 = v3;
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigRouteDiscovererAvailableRoutesChanged, *MEMORY[0x1E4F75550]);
    [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDiscovererRoutePresentChanged name:*MEMORY[0x1E4F75558] object:self->_discoverer];
    [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDiscovererRouteServerDied name:*MEMORY[0x1E4F75560] object:self->_discoverer];
    [v4 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRouteDiscovererEndpointDescriptorChanged name:@"Discoverer_EndpointDescriptorChanged" object:self->_discoverer];
    discoverer = self->_discoverer;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(OpaqueFigRouteDiscoverer *, void, void))(v7 + 56);
    if (v8) {
      v8(discoverer, *MEMORY[0x1E4F75588], *MEMORY[0x1E4F75540]);
    }
    unsigned int v9 = self->_discoverer;
    if (v9) {
      CFRelease(v9);
    }
  }

  v10.receiver = self;
  v10.super_class = (Class)AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl;
  [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)&v10 dealloc];
}

- (void)_availableRoutesChanged
{
  id v3 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)self parentOutputDeviceDiscoverySession];
  [(AVOutputDeviceDiscoverySession *)v3 outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:self];
}

- (AVOutputDeviceDiscoverySession)parentOutputDeviceDiscoverySession
{
  return (AVOutputDeviceDiscoverySession *)objc_loadWeak((id *)&self->_parentSession);
}

- (AVAudioSession)targetAudioSession
{
  int valuePtr = 0;
  CFNumberRef number = 0;
  discoverer = self->_discoverer;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = *(unsigned int (**)(OpaqueFigRouteDiscoverer *, void, void, CFNumberRef *))(v4 + 48);
  if (!v5 || v5(discoverer, *MEMORY[0x1E4F75568], *MEMORY[0x1E4F1CF80], &number)) {
    goto LABEL_9;
  }
  if (!number) {
    return 0;
  }
  CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr) {
    uint64_t v6 = (AVAudioSession *)objc_msgSend(MEMORY[0x1E4F153E0], "retrieveSessionWithID:");
  }
  else {
LABEL_9:
  }
    uint64_t v6 = 0;
  if (number) {
    CFRelease(number);
  }
  return v6;
}

- (AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl)init
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(sel_initWithFigRouteDiscovererCreator_);
  BOOL v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (void)setTargetAudioSession:(id)a3
{
  if (a3) {
    [a3 opaqueSessionID];
  }
  SInt32 = (const void *)FigCFNumberCreateSInt32();
  discoverer = self->_discoverer;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(OpaqueFigRouteDiscoverer *, void, const void *))(v7 + 56);
  if (v8) {
    v8(discoverer, *MEMORY[0x1E4F75568], SInt32);
  }
  if (SInt32)
  {
    CFRelease(SInt32);
  }
}

- (void)_availableGroupsChanged
{
  uint64_t v3 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)self parentOutputDeviceDiscoverySession];
  [(AVOutputDeviceDiscoverySession *)v3 outputDeviceDiscoverySessionImplDidChangeAvailableOutputDeviceGroups:self];
}

- (BOOL)devicePresenceDetected
{
  CFBooleanRef BOOLean = 0;
  discoverer = self->_discoverer;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigRouteDiscoverer *, void, void, CFBooleanRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(discoverer, *MEMORY[0x1E4F75598], *MEMORY[0x1E4F1CF80], &BOOLean);
  CFBooleanRef v7 = BOOLean;
  if (v6)
  {
    BOOL v8 = 0;
    if (!BOOLean) {
      return v8;
    }
    goto LABEL_7;
  }
  BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
  CFBooleanRef v7 = BOOLean;
  if (BOOLean) {
LABEL_7:
  }
    CFRelease(v7);
  return v8;
}

- (void)_routePresentChanged
{
  uint64_t v3 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)self parentOutputDeviceDiscoverySession];
  [(AVOutputDeviceDiscoverySession *)v3 outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:self];
}

- (void)_endpointDescriptorChanged
{
  uint64_t v3 = [(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)self parentOutputDeviceDiscoverySession];
  [(AVOutputDeviceDiscoverySession *)v3 outputDeviceDiscoverySessionImplDidChangeAvailableOutputDevices:self];
}

- (void)_serverDied
{
  uint64_t v3 = [[AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl alloc] initWithFigRouteDiscovererCreator:self->_routeDiscovererCreator];
  if (v3)
  {
    [(AVOutputDeviceDiscoverySession *)[(AVFigRouteDiscovererOutputDeviceDiscoverySessionImpl *)self parentOutputDeviceDiscoverySession] outputDeviceDiscoverySessionImpl:self didExpireWithReplacement:v3];
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputDeviceDiscoverySessionBluetoothOnlyDiscoveryDidChange:(id)a3
{
  int v4 = [a3 onlyDiscoversBluetoothDevices];
  if (dword_1EB2D39E0)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  discoverer = self->_discoverer;
  if (v4) {
    CFBooleanRef v7 = (void *)MEMORY[0x1E4F1CFD0];
  }
  else {
    CFBooleanRef v7 = (void *)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigRouteDiscoverer *, __CFString *, void))(v9 + 56);
  if (v10) {
    v10(discoverer, @"BluetoothRoutesOnly", *v7);
  }
}

- (OpaqueFigRouteDiscoverer)routeDiscoverer
{
  return self->_discoverer;
}

@end
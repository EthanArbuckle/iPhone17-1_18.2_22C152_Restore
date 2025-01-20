@interface AVFigRoutingContextOutputContextImpl
+ (BOOL)outputContextExistsWithRemoteOutputDevice;
+ (OpaqueFigRoutingContext)copySystemVideoRoutingContext;
+ (id)addSharedAudioOutputContextImpl;
+ (id)allSharedAudioOutputContextImpls;
+ (id)auxiliaryOutputContext;
+ (id)defaultSharedOutputContextImpl;
+ (id)iTunesAudioContext;
+ (id)outputContextImplForControllingOutputDeviceGroupWithID:(id)a3 options:(id)a4;
+ (id)outputContextImplForID:(id)a3 type:(id)a4;
+ (id)platformDependentScreenOrVideoContext;
+ (id)sharedAudioPresentationOutputContext;
+ (id)sharedSystemAudioContext;
+ (id)sharedSystemRemoteDisplayContext;
+ (id)sharedSystemRemotePoolContext;
+ (id)sharedSystemScreenContext;
+ (void)resetOutputDeviceForAllOutputContexts;
- (AVFigRoutingContextOutputContextImpl)init;
- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContext:(OpaqueFigRoutingContext *)a3 routingContextReplacementBlock:(id)a4;
- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContext:(OpaqueFigRoutingContext *)a3 routingContextReplacementBlock:(id)a4 outputDeviceTranslator:(id)a5 volumeController:(OpaqueFigVolumeControllerState *)a6 communicationChannelManagerCreator:(id)a7;
- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContextCreator:(id)a3;
- (AVFigRoutingContextOutputContextImpl)initWithRoutingContextUUID:(id)a3 type:(id)a4;
- (AVOutputContext)parentOutputContext;
- (AVOutputContextCommunicationChannel)outgoingCommunicationChannel;
- (AVOutputDevice)outputDevice;
- (AVOutputDevice)predictedOutputDevice;
- (BOOL)canMute;
- (BOOL)canSetVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMuted;
- (BOOL)providesControlForAllVolumeFeatures;
- (BOOL)supportsMultipleBluetoothOutputDevices;
- (BOOL)supportsMultipleOutputDevices;
- (NSArray)outputDevices;
- (NSString)ID;
- (NSString)associatedAudioDeviceID;
- (NSString)outputContextType;
- (OpaqueFigRoutingContext)figRoutingContext;
- (__CFDictionary)_createSelectRouteOptionsForSetOutputDeviceOptions:(id)a3;
- (float)volume;
- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4;
- (id)routingContextUUID;
- (int64_t)volumeControlType;
- (unint64_t)hash;
- (void)_canMuteDidChangeForRoutingContextWithID:(__CFString *)a3;
- (void)_canSetMasterVolumeDidChangeForRoutingContextWithID:(__CFString *)a3;
- (void)_canUseForRoutingContextDidChangeForRoutingContextWIthID:(__CFString *)a3;
- (void)_currentRouteChanged;
- (void)_groupConfigurationChanged;
- (void)_masterVolumeControlTypeDidChangeForRoutingContextWithID:(__CFString *)a3;
- (void)_masterVolumeDidChangeForRoutingContextWithID:(__CFString *)a3;
- (void)_muteDidChangeForRoutingContextWithID:(__CFString *)a3;
- (void)_predictedSelectedRouteDescriptorChanged;
- (void)_remoteControlChannelAvailabilityChanged;
- (void)_routeChangeEndedWithID:(id)a3 reason:(__CFString *)a4;
- (void)_routeChangeStartedWithID:(id)a3;
- (void)_routeConfigUpdateEndedWithID:(__CFString *)a3 reason:(__CFString *)a4;
- (void)_routeConfigUpdateStartedWithID:(__CFString *)a3;
- (void)_routeConfigUpdatedWithID:(__CFString *)a3 reason:(__CFString *)a4 initiator:(__CFString *)a5 endedError:(__CFString *)a6 deviceID:(__CFString *)a7 previousDeviceIDs:(__CFArray *)a8;
- (void)_sendCommand:(__CFString *)a3 completionHandler:(id)a4;
- (void)_serverConnectionDied;
- (void)_systemPickerVideoRouteChanged;
- (void)addOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)communicationChannelManager:(id)a3 didCloseCommunicationChannel:(id)a4;
- (void)communicationChannelManager:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5;
- (void)dealloc;
- (void)decreaseVolumeByCount:(int64_t)a3;
- (void)increaseVolumeByCount:(int64_t)a3;
- (void)removeOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)resetPredictedOutputDevice;
- (void)setMuted:(BOOL)a3;
- (void)setOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setOutputDevices:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setParentOutputContext:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation AVFigRoutingContextOutputContextImpl

- (AVOutputDevice)predictedOutputDevice
{
  id DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(self->_usesRouteConfigUpdatedNotification);
  routingContext = self->_routingContext;
  return (AVOutputDevice *)[DefaultDeviceTranslator predictedOutputDeviceFromRoutingContext:routingContext];
}

- (NSString)ID
{
  id v2 = [(AVFigRoutingContextOutputContextImpl *)self routingContextUUID];
  return (NSString *)[v2 UUIDString];
}

- (id)routingContextUUID
{
  cf[20] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  cf[0] = 0;
  routingContext = self->_routingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = *(unsigned int (**)(OpaqueFigRoutingContext *, void, void, CFTypeRef *))(v4 + 48);
  if (v5)
  {
    if (v5(routingContext, *MEMORY[0x1E4F75728], *MEMORY[0x1E4F1CF80], cf))
    {
      v7 = 0;
    }
    else
    {
      id v6 = objc_alloc(MEMORY[0x1E4F29128]);
      v7 = (void *)[v6 initWithUUIDString:cf[0]];
    }
  }
  else
  {
    v7 = 0;
  }
  CFTypeRef v8 = cf[0];
  if (cf[0]
    || (os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(),
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT),
        fig_log_call_emit_and_clean_up_after_send_and_compose(),
        (CFTypeRef v8 = cf[0]) != 0))
  {
    CFRelease(v8);
  }
  return v7;
}

- (NSArray)outputDevices
{
  return (NSArray *)[(AVFigRoutingContextOutputDeviceTranslator *)self->_deviceTranslator outputDevicesFromRoutingContext:self->_routingContext];
}

- (void).cxx_destruct
{
}

+ (id)sharedAudioPresentationOutputContext
{
  uint64_t v2 = [a1 routingContextFactory];
  uint64_t v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AVFigRoutingContextOutputContextImpl_sharedAudioPresentationOutputContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

- (AVFigRoutingContextOutputContextImpl)initWithRoutingContextUUID:(id)a3 type:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v7 = (void *)[(id)objc_opt_class() routingContextFactory];
  uint64_t v24 = *MEMORY[0x1E4F755B0];
  v25[0] = a3;
  CFTypeRef v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1));
  CFNumberRef number = 0;
  CFTypeRef cf = 0;
  int valuePtr = 0;
  if (a4)
  {
    v9 = (void *)MEMORY[0x1E4F28ED0];
    if ([a4 isEqualToString:@"AVOutputContextTypeSharedSystemAudio"])
    {
      uint64_t v10 = 1;
    }
    else if ([a4 isEqualToString:@"AVOutputContextTypeSharedSystemScreen"])
    {
      uint64_t v10 = 2;
    }
    else if ([a4 isEqualToString:@"AVOutputContextTypeSharedAudioPresentation"])
    {
      uint64_t v10 = 3;
    }
    else if ([a4 isEqualToString:@"AVOutputContextTypeAudio"])
    {
      uint64_t v10 = 4;
    }
    else if ([a4 isEqualToString:@"AVOutputContextTypeVideo"])
    {
      uint64_t v10 = 5;
    }
    else if ([a4 isEqualToString:@"AVOutputContextTypeScreen"])
    {
      uint64_t v10 = 6;
    }
    else if ([a4 isEqualToString:@"AVOutputContextTypeGroupControl"])
    {
      uint64_t v10 = 8;
    }
    else if ([a4 isEqualToString:0x1EE5A2478])
    {
      uint64_t v10 = 9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [v9 numberWithUnsignedInt:v10];
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F755A8]];
  }
  uint64_t v12 = *MEMORY[0x1E4F1CF80];
  if (![v7 copyContextForUUIDWithAllocator:*MEMORY[0x1E4F1CF80] options:v8 context:&cf]&& (CFTypeRef v13 = cf) != 0&& ((v14 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0 ? (v15 = 0) : (v15 = v14), (v16 = *(unsigned int (**)(CFTypeRef, void, uint64_t, CFNumberRef *))(v15 + 48)) != 0&& !v16(v13, *MEMORY[0x1E4F75720], v12, &number)&& CFNumberGetValue(number, kCFNumberIntType, &valuePtr)))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__AVFigRoutingContextOutputContextImpl_initWithRoutingContextUUID_type___block_invoke;
    v19[3] = &unk_1E57B7620;
    int v20 = valuePtr;
    v19[4] = v8;
    v19[5] = v7;
    self = [(AVFigRoutingContextOutputContextImpl *)self initWithFigRoutingContext:cf routingContextReplacementBlock:v19];
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  if (number) {
    CFRelease(number);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v17;
}

- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContext:(OpaqueFigRoutingContext *)a3 routingContextReplacementBlock:(id)a4
{
  BOOL v7 = AVOutputContextUsesRouteConfigUpdatedNotification();
  id DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(v7);
  FigVolumeControllerCopySharedControllerRemote();
  v9 = [(AVFigRoutingContextOutputContextImpl *)self initWithFigRoutingContext:a3 routingContextReplacementBlock:a4 outputDeviceTranslator:DefaultDeviceTranslator volumeController:0 communicationChannelManagerCreator:+[AVOutputContext defaultCommunicationChannelManagerCreator]];
  uint64_t v10 = v9;

  return v10;
}

- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContext:(OpaqueFigRoutingContext *)a3 routingContextReplacementBlock:(id)a4 outputDeviceTranslator:(id)a5 volumeController:(OpaqueFigVolumeControllerState *)a6 communicationChannelManagerCreator:(id)a7
{
  id v13 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  CFNumberRef number = 0;
  int valuePtr = 0;
  v30.receiver = self;
  v30.super_class = (Class)AVFigRoutingContextOutputContextImpl;
  uint64_t v14 = [(AVFigRoutingContextOutputContextImpl *)&v30 init];
  if (!v14) {
    goto LABEL_21;
  }
  v14->_routingContextCreator = (id)[a4 copy];
  uint64_t v15 = (AVFigRoutingContextOutputDeviceTranslator *)a5;
  v14->_deviceTranslator = v15;
  if (!v15) {
    goto LABEL_21;
  }
  v16 = a6 ? (OpaqueFigVolumeControllerState *)CFRetain(a6) : 0;
  v14->_volumeController = v16;
  v14->_commChannelManagerCreator = (id)[a7 copy];
  if (!v14->_routingContextCreator) {
    goto LABEL_21;
  }
  if (!a3)
  {
    v18 = 0;
    v14->_routingContext = 0;
    goto LABEL_26;
  }
  v17 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v18 = 0;
  v14->_routingContext = v17;
  if (v14->_commChannelManagerCreator)
  {
    v19 = v17;
    if (v17)
    {
      uint64_t v20 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v20) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      v22 = *(unsigned int (**)(OpaqueFigRoutingContext *, void, void, CFNumberRef *))(v21 + 48);
      if (v22)
      {
        if (!v22(v19, *MEMORY[0x1E4F75720], *MEMORY[0x1E4F1CF80], &number))
        {
          if (CFNumberGetValue(number, kCFNumberIntType, &valuePtr))
          {
            if (valuePtr == 9
              || (v23 = (AVFigRoutingContextCommunicationChannelManager *)objc_retain((id)(*((uint64_t (**)(void))v14->_commChannelManagerCreator
                                                                                           + 2))()),
                  (v14->_commChannelManager = v23) != 0))
            {
              v14->_usesRouteConfigUpdatedNotification = AVOutputContextUsesRouteConfigUpdatedNotification();
              v14->_weakObserver = [[AVWeakReference alloc] initWithReferencedObject:v14];
              v14->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontext.figroutingcontext");
              v14->_destinationChangesForRouteChangeIDs = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
              [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigRoutingContextSystemPickerVideoRouteChanged name:*MEMORY[0x1E4F75700] object:v14->_routingContext flags:0];
              weakObserver = v14->_weakObserver;
              routingContext = v14->_routingContext;
              if (v14->_usesRouteConfigUpdatedNotification)
              {
                uint64_t v26 = *MEMORY[0x1E4F756F0];
                v27 = AVFigRoutingContextRouteConfigUpdated;
              }
              else
              {
                [v13 addListenerWithWeakReference:weakObserver callback:AVFigRoutingContextCurrentRouteChanged name:*MEMORY[0x1E4F756C0] object:routingContext flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigRoutingContextRouteChangeStarted name:*MEMORY[0x1E4F756E8] object:v14->_routingContext flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigRoutingContextRouteChangeEnded name:*MEMORY[0x1E4F756E0] object:v14->_routingContext flags:0];
                weakObserver = v14->_weakObserver;
                uint64_t v26 = *MEMORY[0x1E4F756B8];
                routingContext = v14->_routingContext;
                v27 = AVFigRoutingContextGroupConfigurationChanged;
              }
              [v13 addListenerWithWeakReference:weakObserver callback:v27 name:v26 object:routingContext flags:0];
              [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigRoutingContextServerConnectionDied name:*MEMORY[0x1E4F756F8] object:v14->_routingContext flags:0];
              [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigRoutingContextRemoteControlChannelAvailabilityChanged name:*MEMORY[0x1E4F756D8] object:v14->_routingContext flags:0];
              [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigRoutingContextPredictedSelectedRouteDescriptorChanged name:*MEMORY[0x1E4F756D0] object:v14->_routingContext flags:0];
              volumeController = v14->_volumeController;
              if (volumeController)
              {
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigVolumeControllerCanUseForRoutingContextDidChange name:*MEMORY[0x1E4F75800] object:volumeController flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigVolumeControllerCanSetMasterVolumeDidChange name:*MEMORY[0x1E4F757F8] object:v14->_volumeController flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigVolumeControllerMasterVolumeDidChange name:*MEMORY[0x1E4F75828] object:v14->_volumeController flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigVolumeControllerMasterVolumeControlTypeDidChange name:*MEMORY[0x1E4F75820] object:v14->_volumeController flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigVolumeControllerCanMuteDidChange name:*MEMORY[0x1E4F75838] object:v14->_volumeController flags:0];
                [v13 addListenerWithWeakReference:v14->_weakObserver callback:AVFigVolumeControllerMuteDidChange name:*MEMORY[0x1E4F75840] object:v14->_volumeController flags:0];
              }
              [(AVFigRoutingContextCommunicationChannelManager *)v14->_commChannelManager setParentOutputContextImpl:v14];
              v18 = v14;
              goto LABEL_26;
            }
          }
        }
      }
LABEL_21:
      v18 = 0;
    }
  }
LABEL_26:
  if (number) {
    CFRelease(number);
  }

  return v18;
}

- (void)dealloc
{
  if (self->_routingContext)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextSystemPickerVideoRouteChanged name:*MEMORY[0x1E4F75700] object:self->_routingContext];
    weakObserver = self->_weakObserver;
    routingContext = self->_routingContext;
    if (self->_usesRouteConfigUpdatedNotification)
    {
      uint64_t v6 = *MEMORY[0x1E4F756F0];
      BOOL v7 = AVFigRoutingContextRouteConfigUpdated;
    }
    else
    {
      [v3 removeListenerWithWeakReference:weakObserver callback:AVFigRoutingContextCurrentRouteChanged name:*MEMORY[0x1E4F756C0] object:routingContext];
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextRouteChangeStarted name:*MEMORY[0x1E4F756E8] object:self->_routingContext];
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextRouteChangeEnded name:*MEMORY[0x1E4F756E0] object:self->_routingContext];
      weakObserver = self->_weakObserver;
      uint64_t v6 = *MEMORY[0x1E4F756B8];
      routingContext = self->_routingContext;
      BOOL v7 = AVFigRoutingContextGroupConfigurationChanged;
    }
    [v3 removeListenerWithWeakReference:weakObserver callback:v7 name:v6 object:routingContext];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextServerConnectionDied name:*MEMORY[0x1E4F756F8] object:self->_routingContext];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextRemoteControlChannelAvailabilityChanged name:*MEMORY[0x1E4F756D8] object:self->_routingContext];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextPredictedSelectedRouteDescriptorChanged name:*MEMORY[0x1E4F756D0] object:self->_routingContext];
    if (self->_volumeController)
    {
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVFigVolumeControllerCanUseForRoutingContextDidChange, *MEMORY[0x1E4F75800]);
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigVolumeControllerCanSetMasterVolumeDidChange name:*MEMORY[0x1E4F757F8] object:self->_volumeController];
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigVolumeControllerMasterVolumeDidChange name:*MEMORY[0x1E4F75828] object:self->_volumeController];
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigVolumeControllerMasterVolumeControlTypeDidChange name:*MEMORY[0x1E4F75820] object:self->_volumeController];
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigVolumeControllerCanMuteDidChange name:*MEMORY[0x1E4F75838] object:self->_volumeController];
      [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigVolumeControllerMuteDidChange name:*MEMORY[0x1E4F75840] object:self->_volumeController];
    }
  }

  volumeController = self->_volumeController;
  if (volumeController) {
    CFRelease(volumeController);
  }

  v9 = self->_routingContext;
  if (v9) {
    CFRelease(v9);
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }
  v11.receiver = self;
  v11.super_class = (Class)AVFigRoutingContextOutputContextImpl;
  [(AVFigRoutingContextOutputContextImpl *)&v11 dealloc];
}

- (AVFigRoutingContextOutputContextImpl)initWithFigRoutingContextCreator:(id)a3
{
  uint64_t v5 = (*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    BOOL v7 = [(AVFigRoutingContextOutputContextImpl *)self initWithFigRoutingContext:v5 routingContextReplacementBlock:a3];
    CFRelease(v6);
    return v7;
  }
  else
  {

    return 0;
  }
}

uint64_t __76__AVFigRoutingContextOutputContextImpl_sharedAudioPresentationOutputContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) copySystemMusicContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

- (BOOL)providesControlForAllVolumeFeatures
{
  char v8 = 0;
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  routingContext = self->_routingContext;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(v5 + 8);
  if (!v6) {
    return 0;
  }
  v6(volumeController, routingContext, &v8);
  return v8 != 0;
}

- (void)setParentOutputContext:(id)a3
{
}

+ (id)outputContextImplForID:(id)a3 type:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithRoutingContextUUID:a3 type:a4];
  return v4;
}

+ (id)auxiliaryOutputContext
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__AVFigRoutingContextOutputContextImpl_auxiliaryOutputContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __62__AVFigRoutingContextOutputContextImpl_auxiliaryOutputContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) createVideoContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)platformDependentScreenOrVideoContext
{
  uint64_t v2 = (void *)[a1 routingContextFactory];
  uint64_t PlatformDependentScreenOrVideoRoutingContext = AVOutputContextCreatePlatformDependentScreenOrVideoRoutingContext(v2, 0);
  id v13 = 0;
  if (PlatformDependentScreenOrVideoRoutingContext)
  {
    uint64_t v4 = (const void *)PlatformDependentScreenOrVideoRoutingContext;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    BOOL v7 = *(unsigned int (**)(const void *, void, void, id *))(v6 + 48);
    if (!v7 || v7(v4, *MEMORY[0x1E4F75728], *MEMORY[0x1E4F1CF80], &v13))
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v8 = v13;
      v9 = [AVFigRoutingContextOutputContextImpl alloc];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __77__AVFigRoutingContextOutputContextImpl_platformDependentScreenOrVideoContext__block_invoke;
      v12[3] = &unk_1E57B75D8;
      v12[4] = v13;
      v12[5] = v2;
      uint64_t v10 = [(AVFigRoutingContextOutputContextImpl *)v9 initWithFigRoutingContext:v4 routingContextReplacementBlock:v12];
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

uint64_t __77__AVFigRoutingContextOutputContextImpl_platformDependentScreenOrVideoContext__block_invoke(uint64_t a1)
{
  values = *(void **)(a1 + 32);
  CFDictionaryRef v2 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F755B0], (const void **)&values, 1, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t PlatformDependentScreenOrVideoRoutingContext = AVOutputContextCreatePlatformDependentScreenOrVideoRoutingContext(*(void **)(a1 + 40), (uint64_t)v2);
  if (v2) {
    CFRelease(v2);
  }
  return PlatformDependentScreenOrVideoRoutingContext;
}

+ (id)sharedSystemAudioContext
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__AVFigRoutingContextOutputContextImpl_sharedSystemAudioContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __64__AVFigRoutingContextOutputContextImpl_sharedSystemAudioContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) copySystemAudioContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)sharedSystemRemoteDisplayContext
{
  uint64_t v2 = [a1 routingContextFactory];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__AVFigRoutingContextOutputContextImpl_sharedSystemRemoteDisplayContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __72__AVFigRoutingContextOutputContextImpl_sharedSystemRemoteDisplayContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) copySystemRemoteDisplayContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)sharedSystemScreenContext
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVFigRoutingContextOutputContextImpl_sharedSystemScreenContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __65__AVFigRoutingContextOutputContextImpl_sharedSystemScreenContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) copySystemMirroringContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)sharedSystemRemotePoolContext
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__AVFigRoutingContextOutputContextImpl_sharedSystemRemotePoolContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __69__AVFigRoutingContextOutputContextImpl_sharedSystemRemotePoolContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) copySystemRemotePoolContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)allSharedAudioOutputContextImpls
{
  uint64_t v2 = (void *)[a1 routingContextFactory];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFArrayRef theArray = 0;
  if (objc_opt_respondsToSelector())
  {
    [v2 copyAllAudioContexts:&theArray];
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
          id v8 = [AVFigRoutingContextOutputContextImpl alloc];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __72__AVFigRoutingContextOutputContextImpl_allSharedAudioOutputContextImpls__block_invoke;
          v11[3] = &__block_descriptor_40_e31___OpaqueFigRoutingContext__8__0l;
          v11[4] = ValueAtIndex;
          v9 = [(AVFigRoutingContextOutputContextImpl *)v8 initWithFigRoutingContextCreator:v11];
          if (v9) {
            [v3 addObject:v9];
          }
        }
      }
      if (theArray) {
        CFRelease(theArray);
      }
    }
  }
  return v3;
}

CFTypeRef __72__AVFigRoutingContextOutputContextImpl_allSharedAudioOutputContextImpls__block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

+ (id)iTunesAudioContext
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__AVFigRoutingContextOutputContextImpl_iTunesAudioContext__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __58__AVFigRoutingContextOutputContextImpl_iTunesAudioContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) createAudioContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)addSharedAudioOutputContextImpl
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__AVFigRoutingContextOutputContextImpl_addSharedAudioOutputContextImpl__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __71__AVFigRoutingContextOutputContextImpl_addSharedAudioOutputContextImpl__block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) createAudioContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v2];
  return v2;
}

+ (id)defaultSharedOutputContextImpl
{
  uint64_t v2 = [a1 routingContextFactory];
  id v3 = [AVFigRoutingContextOutputContextImpl alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__AVFigRoutingContextOutputContextImpl_defaultSharedOutputContextImpl__block_invoke;
  v5[3] = &unk_1E57B6278;
  v5[4] = v2;
  return [(AVFigRoutingContextOutputContextImpl *)v3 initWithFigRoutingContextCreator:v5];
}

uint64_t __70__AVFigRoutingContextOutputContextImpl_defaultSharedOutputContextImpl__block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  char v2 = objc_opt_respondsToSelector();
  uint64_t result = 0;
  if (v2)
  {
    [*(id *)(a1 + 32) copyDefaultContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v4];
    return v4;
  }
  return result;
}

+ (id)outputContextImplForControllingOutputDeviceGroupWithID:(id)a3 options:(id)a4
{
  if (!a3)
  {
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, v4, v5, v6, v7, (uint64_t)"groupID != nil"), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  uint64_t v10 = [a1 routingContextFactory];
  objc_super v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = (void *)[a4 objectForKeyedSubscript:@"AVOutputContextDeviceGroupControlOptionCancelAddDeviceIfAuthRequired"];
  [v11 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F755B8]];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v13 = [v12 BOOLValue];
      uint64_t v14 = (void *)MEMORY[0x1E4F1CFD0];
      if (!v13) {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CFC8];
      }
      [v11 setObject:*v14 forKeyedSubscript:*MEMORY[0x1E4F755A0]];
    }
  }
  uint64_t v15 = [AVFigRoutingContextOutputContextImpl alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __103__AVFigRoutingContextOutputContextImpl_outputContextImplForControllingOutputDeviceGroupWithID_options___block_invoke;
  v18[3] = &unk_1E57B75D8;
  v18[4] = v10;
  v18[5] = v11;
  return [(AVFigRoutingContextOutputContextImpl *)v15 initWithFigRoutingContextCreator:v18];
}

uint64_t __103__AVFigRoutingContextOutputContextImpl_outputContextImplForControllingOutputDeviceGroupWithID_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  [*(id *)(a1 + 32) createRemoteMusicControllerContextWithAllocator:*MEMORY[0x1E4F1CF80] options:*(void *)(a1 + 40) context:&v2];
  return v2;
}

- (AVFigRoutingContextOutputContextImpl)init
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  uint64_t v6 = NSStringFromSelector(sel_initWithFigRoutingContextCreator_);
  uint64_t v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

uint64_t __72__AVFigRoutingContextOutputContextImpl_initWithRoutingContextUUID_type___block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  switch(*(_DWORD *)(a1 + 48))
  {
    case 1:
      [*(id *)(a1 + 40) copySystemAudioContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v3];
      break;
    case 2:
      [*(id *)(a1 + 40) copySystemMirroringContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v3];
      break;
    case 3:
      [*(id *)(a1 + 40) copySystemMusicContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v3];
      break;
    case 4:
      [*(id *)(a1 + 40) createAudioContextWithAllocator:*MEMORY[0x1E4F1CF80] options:v1 context:&v3];
      break;
    case 5:
      [*(id *)(a1 + 40) createVideoContextWithAllocator:*MEMORY[0x1E4F1CF80] options:v1 context:&v3];
      break;
    case 6:
      [*(id *)(a1 + 40) createPerAppSecondDisplayContextWithAllocator:*MEMORY[0x1E4F1CF80] options:v1 context:&v3];
      break;
    case 8:
      [*(id *)(a1 + 40) createRemoteMusicControllerContextWithAllocator:*MEMORY[0x1E4F1CF80] options:v1 context:&v3];
      break;
    default:
      [*(id *)(a1 + 40) copyContextForUUIDWithAllocator:*MEMORY[0x1E4F1CF80] options:v1 context:&v3];
      break;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(AVFigRoutingContextOutputContextImpl *)self routingContextUUID];
  uint64_t v6 = [a3 routingContextUUID];
  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  id v2 = [(AVFigRoutingContextOutputContextImpl *)self routingContextUUID];
  return [v2 hash];
}

- (AVOutputDevice)outputDevice
{
  return (AVOutputDevice *)[(AVFigRoutingContextOutputDeviceTranslator *)self->_deviceTranslator outputDeviceFromRoutingContext:self->_routingContext];
}

- (NSString)outputContextType
{
  CFNumberRef number = 0;
  routingContext = self->_routingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = *(unsigned int (**)(OpaqueFigRoutingContext *, void, void, CFNumberRef *))(v4 + 48);
  if (v5
    && !v5(routingContext, *MEMORY[0x1E4F75720], *MEMORY[0x1E4F1CF80], &number)
    && (int valuePtr = 0, CFNumberGetValue(number, kCFNumberIntType, &valuePtr)))
  {
    uint64_t v6 = 0;
    switch(valuePtr)
    {
      case 1:
        uint64_t v7 = AVOutputContextTypeSharedSystemAudio;
        goto LABEL_18;
      case 2:
        uint64_t v7 = AVOutputContextTypeSharedSystemScreen;
        goto LABEL_18;
      case 3:
        uint64_t v7 = AVOutputContextTypeSharedAudioPresentation;
        goto LABEL_18;
      case 4:
        uint64_t v7 = AVOutputContextTypeAudio;
        goto LABEL_18;
      case 5:
        uint64_t v7 = AVOutputContextTypeVideo;
        goto LABEL_18;
      case 6:
        uint64_t v7 = AVOutputContextTypeScreen;
        goto LABEL_18;
      case 8:
        uint64_t v7 = AVOutputContextTypeGroupControl;
        goto LABEL_18;
      case 9:
        uint64_t v6 = (NSString *)@"AVOutputContextTypeSharedSystemRemotePool";
        break;
      case 14:
        uint64_t v7 = AVOutputContextTypeSystemRemoteDisplay;
LABEL_18:
        uint64_t v6 = (NSString *)*v7;
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (number) {
    CFRelease(number);
  }
  return v6;
}

- (void)_routeChangeStartedWithID:(id)a3
{
  id v5 = objc_alloc_init(AVOutputContextDestinationChange);
  [(AVOutputContextDestinationChange *)v5 markAsInProgress];
  [(AVOutputContext *)[(AVFigRoutingContextOutputContextImpl *)self parentOutputContext] outputContextImpl:self didInitiateDestinationChange:v5];
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__AVFigRoutingContextOutputContextImpl__routeChangeStartedWithID___block_invoke;
    block[3] = &unk_1E57B2138;
    block[4] = self;
    block[5] = v5;
    block[6] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }
}

uint64_t __66__AVFigRoutingContextOutputContextImpl__routeChangeStartedWithID___block_invoke(void *a1)
{
  id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1[4] + 88)];
  [v2 setObject:a1[5] forKey:a1[6]];

  uint64_t result = [v2 copy];
  *(void *)(a1[4] + 88) = result;
  return result;
}

- (void)_routeChangeEndedWithID:(id)a3 reason:(__CFString *)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__44;
  uint64_t v12 = __Block_byref_object_dispose__44;
  uint64_t v13 = 0;
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__AVFigRoutingContextOutputContextImpl__routeChangeEndedWithID_reason___block_invoke;
    block[3] = &unk_1E57B6FB8;
    block[5] = a3;
    block[6] = &v8;
    block[4] = self;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    uint64_t v6 = (void *)v9[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v6 changeToTerminalStatusBasedOnRouteChangeEndedReason:a4];

  _Block_object_dispose(&v8, 8);
}

uint64_t __71__AVFigRoutingContextOutputContextImpl__routeChangeEndedWithID_reason___block_invoke(void *a1)
{
  id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1[4] + 88)];
  *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[v2 objectForKey:a1[5]];
  [v2 removeObjectForKey:a1[5]];

  uint64_t result = [v2 copy];
  *(void *)(a1[4] + 88) = result;
  return result;
}

- (void)_currentRouteChanged
{
  uint64_t v3 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
  [(AVOutputContext *)v3 outputContextImpl:self didChangeOutputDeviceWithInitiator:0];
}

- (void)_groupConfigurationChanged
{
  uint64_t v3 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
  [(AVOutputContext *)v3 outputContextImpl:self didChangeOutputDevicesWithInitiator:0 reason:0 deviceID:0 previousDeviceIDs:0];
}

- (void)_routeConfigUpdatedWithID:(__CFString *)a3 reason:(__CFString *)a4 initiator:(__CFString *)a5 endedError:(__CFString *)a6 deviceID:(__CFString *)a7 previousDeviceIDs:(__CFArray *)a8
{
  if (FigCFEqual()) {
    uint64_t v14 = @"AVOutputContextDestinationChangeReasonIdleDisconnect";
  }
  else {
    uint64_t v14 = 0;
  }
  if (FigCFEqual())
  {
    [(AVFigRoutingContextOutputContextImpl *)self _routeConfigUpdateStartedWithID:a3];
  }
  else
  {
    if (FigCFEqual())
    {
      uint64_t v15 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    }
    else
    {
      if (!FigCFEqual())
      {
        [(AVFigRoutingContextOutputContextImpl *)self _routeConfigUpdateEndedWithID:a3 reason:a4];
        goto LABEL_9;
      }
      BOOL v18 = [(AVFigRoutingContextOutputContextImpl *)self supportsMultipleOutputDevices];
      uint64_t v15 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
      if (!v18)
      {
        [(AVOutputContext *)v15 outputContextImpl:self didChangeOutputDeviceWithInitiator:a5];
        goto LABEL_9;
      }
    }
    [(AVOutputContext *)v15 outputContextImpl:self didChangeOutputDevicesWithInitiator:a5 reason:v14 deviceID:a7 previousDeviceIDs:a8];
  }
LABEL_9:
  if (FigCFEqual()
    || FigCFEqual()
    || FigCFEqual()
    || FigCFEqual())
  {
    BOOL v16 = [(AVFigRoutingContextOutputContextImpl *)self supportsMultipleOutputDevices];
    v17 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    if (v16)
    {
      [(AVOutputContext *)v17 outputContextImpl:self didChangeOutputDevicesWithInitiator:a5 reason:v14 deviceID:a7 previousDeviceIDs:a8];
      if (![(NSString *)[(AVFigRoutingContextOutputContextImpl *)self outputContextType] isEqualToString:@"AVOutputContextTypeAudio"])return; {
      v17 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
      }
    }
    [(AVOutputContext *)v17 outputContextImpl:self didChangeOutputDeviceWithInitiator:a5];
  }
}

- (void)_routeConfigUpdateStartedWithID:(__CFString *)a3
{
  id v5 = objc_alloc_init(AVOutputContextDestinationChange);
  [(AVOutputContextDestinationChange *)v5 markAsInProgress];
  [(AVOutputContext *)[(AVFigRoutingContextOutputContextImpl *)self parentOutputContext] outputContextImpl:self didInitiateDestinationChange:v5];
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__AVFigRoutingContextOutputContextImpl__routeConfigUpdateStartedWithID___block_invoke;
    block[3] = &unk_1E57B2270;
    block[4] = self;
    block[5] = v5;
    block[6] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }
}

uint64_t __72__AVFigRoutingContextOutputContextImpl__routeConfigUpdateStartedWithID___block_invoke(void *a1)
{
  id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1[4] + 88)];
  [v2 setObject:a1[5] forKey:a1[6]];

  uint64_t result = [v2 copy];
  *(void *)(a1[4] + 88) = result;
  return result;
}

- (void)_routeConfigUpdateEndedWithID:(__CFString *)a3 reason:(__CFString *)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__44;
  uint64_t v12 = __Block_byref_object_dispose__44;
  uint64_t v13 = 0;
  if (a3)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__AVFigRoutingContextOutputContextImpl__routeConfigUpdateEndedWithID_reason___block_invoke;
    block[3] = &unk_1E57B3A60;
    block[4] = self;
    block[5] = &v8;
    block[6] = a3;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
    uint64_t v6 = (void *)v9[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v6 changeToTerminalStatusBasedOnRouteConfigUpdatedReason:a4];

  _Block_object_dispose(&v8, 8);
}

uint64_t __77__AVFigRoutingContextOutputContextImpl__routeConfigUpdateEndedWithID_reason___block_invoke(void *a1)
{
  id v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1[4] + 88)];
  *(void *)(*(void *)(a1[5] + 8) + 40) = (id)[v2 objectForKey:a1[6]];
  [v2 removeObjectForKey:a1[6]];

  uint64_t result = [v2 copy];
  *(void *)(a1[4] + 88) = result;
  return result;
}

- (void)_systemPickerVideoRouteChanged
{
  uint64_t v3 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
  [(AVOutputContext *)v3 outputContextImplDidChangeGlobalOutputDeviceConfiguration:self];
}

- (NSString)associatedAudioDeviceID
{
  uint64_t v8 = 0;
  routingContext = self->_routingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = *(void (**)(OpaqueFigRoutingContext *, void, void, void **))(v4 + 48);
  if (v5)
  {
    v5(routingContext, *MEMORY[0x1E4F75718], *MEMORY[0x1E4F1CF80], &v8);
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (NSString *)v6;
}

- (__CFDictionary)_createSelectRouteOptionsForSetOutputDeviceOptions:(id)a3
{
  id v5 = (const void *)[a3 objectForKey:@"AVOutputContextSetOutputDevicePasswordKey"];
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceCancelIfAuthRequiredKey"];
  uint64_t v7 = (void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceSuppressUserInteractionOnSenderOnlyKey"];
  uint64_t v8 = (const void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceInitiatorKey"];
  uint64_t v9 = (void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceFadePlaybackKey"];
  uint64_t v10 = (const void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceDidFailToConnectToOutputDeviceUserInfoKey"];
  uint64_t v11 = (void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceMuteUntilContextModificationIsFinishedKey"];
  uint64_t v12 = (void *)[a3 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceDefaultAudioToLocalKey"];
  unsigned int v37 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if ([(AVOutputContext *)[(AVFigRoutingContextOutputContextImpl *)self parentOutputContext] getApplicationProcessID:&v37])
  {
    uint64_t v14 = (const void *)[MEMORY[0x1E4F28ED0] numberWithInt:v37];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75768], v14);
  }
  if (v5) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75750], v5);
  }
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = (const void *)*MEMORY[0x1E4F75758];
      int v16 = [v6 BOOLValue];
      v17 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v16) {
        v17 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      CFDictionarySetValue(Mutable, v15, *v17);
    }
  }
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v18 = [v12 BOOLValue];
      v19 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v18) {
        v19 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      CFDictionarySetValue(Mutable, @"defaultAudioToLocal", *v19);
    }
  }
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = (const void *)*MEMORY[0x1E4F75788];
      int v21 = [v7 BOOLValue];
      v22 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v21) {
        v22 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      CFDictionarySetValue(Mutable, v20, *v22);
    }
  }
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75780], v8);
    }
  }
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (const void *)*MEMORY[0x1E4F75778];
      int v24 = [v9 BOOLValue];
      v25 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v24) {
        v25 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      CFDictionarySetValue(Mutable, v23, *v25);
    }
  }
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, v10) & 1) == 0)
  {
    v34 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo", v26, v27, v28, v29, v30, v35), 0 reason userInfo];
    objc_exception_throw(v34);
  }
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v31 = [v11 BOOLValue];
      v32 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v31) {
        v32 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      CFDictionarySetValue(Mutable, @"PreemptivePortConnection", *v32);
    }
  }
  return Mutable;
}

- (void)setOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = [(AVFigRoutingContextOutputContextImpl *)self _createSelectRouteOptionsForSetOutputDeviceOptions:a4];
  [(AVFigRoutingContextOutputDeviceTranslator *)self->_deviceTranslator setOutputDevice:a3 withOptions:v8 onRoutingContext:self->_routingContext completionHandler:a5];
  if (v8)
  {
    CFRelease(v8);
  }
}

+ (OpaqueFigRoutingContext)copySystemVideoRoutingContext
{
  uint64_t v4 = 0;
  id v2 = (void *)[a1 routingContextFactory];
  [v2 copyDisplayMenuVideoContextWithAllocator:*MEMORY[0x1E4F1CF80] options:0 context:&v4];
  return v4;
}

+ (void)resetOutputDeviceForAllOutputContexts
{
  uint64_t v2 = [a1 copySystemVideoRoutingContext];
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    if (dword_1EB2D3A60)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void (**)(const void *, void, void))(v6 + 8);
    if (v7) {
      v7(v3, 0, 0);
    }
    CFRelease(v3);
  }
}

+ (BOOL)outputContextExistsWithRemoteOutputDevice
{
  CFTypeRef cf = 0;
  uint64_t v2 = [a1 copySystemVideoRoutingContext];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (const void *)v2;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned int (**)(const void *, CFTypeRef *))(v5 + 24);
  if (v6)
  {
    if (v6(v3, &cf)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = cf == 0;
    }
    BOOL v8 = !v7;
  }
  else
  {
    BOOL v8 = 0;
  }
  CFRelease(v3);
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

- (BOOL)supportsMultipleOutputDevices
{
  CFBooleanRef BOOLean = 0;
  routingContext = self->_routingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigRoutingContext *, void, void, CFBooleanRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(routingContext, *MEMORY[0x1E4F75740], *MEMORY[0x1E4F1CF80], &BOOLean);
  CFBooleanRef v7 = BOOLean;
  if (v6)
  {
    BOOL v8 = 0;
    if (!BOOLean) {
      return v8;
    }
    goto LABEL_8;
  }
  if (!BOOLean) {
    return 0;
  }
  BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
  CFBooleanRef v7 = BOOLean;
  if (BOOLean) {
LABEL_8:
  }
    CFRelease(v7);
  return v8;
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  CFBooleanRef BOOLean = 0;
  routingContext = self->_routingContext;
  uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(OpaqueFigRoutingContext *, void, void, CFBooleanRef *))(v4 + 48);
  if (!v5) {
    return 0;
  }
  int v6 = v5(routingContext, *MEMORY[0x1E4F75738], *MEMORY[0x1E4F1CF80], &BOOLean);
  CFBooleanRef v7 = BOOLean;
  if (v6)
  {
    BOOL v8 = 0;
    if (!BOOLean) {
      return v8;
    }
    goto LABEL_8;
  }
  if (!BOOLean) {
    return 0;
  }
  BOOL v8 = CFBooleanGetValue(BOOLean) != 0;
  CFBooleanRef v7 = BOOLean;
  if (BOOLean) {
LABEL_8:
  }
    CFRelease(v7);
  return v8;
}

- (void)setOutputDevices:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if ([a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionInitiator"]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75780], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionInitiator"]);
  }
  if ([a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionFadePlayback"]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75778], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionFadePlayback"]);
  }
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionDidFailToConnectToOutputDeviceUserInfo"]) & 1) == 0)
  {
    int v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo", v11, v12, v13, v14, v15, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if ([a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionMuteUntilContextModificationIsFinished"])
  {
    CFDictionarySetValue(Mutable, @"PreemptivePortConnection", (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionMuteUntilContextModificationIsFinished"]);
  }
  [(AVFigRoutingContextOutputDeviceTranslator *)self->_deviceTranslator setOutputDevices:a3 withOptions:Mutable onRoutingContext:self->_routingContext completionHandler:a5];
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)addOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"), "BOOLValue"))CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75758], (const void *)*MEMORY[0x1E4F1CFD0]); {
  if ([a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionAuthorizationToken"])
  }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75750], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionAuthorizationToken"]);
  if ([a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionInitiator"]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75780], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionInitiator"]);
  }
  if ([a4 objectForKeyedSubscript:0x1EE5A1FD8]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75760], (const void *)[a4 objectForKeyedSubscript:0x1EE5A1FD8]);
  }
  if ([a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionFadePlayback"]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75778], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionFadePlayback"]);
  }
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo"]) & 1) == 0)
  {
    int v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo", v11, v12, v13, v14, v15, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if ([a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionMuteUntilContextModificationIsFinished"])
  {
    CFDictionarySetValue(Mutable, @"PreemptivePortConnection", (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionMuteUntilContextModificationIsFinished"]);
  }
  [(AVFigRoutingContextOutputDeviceTranslator *)self->_deviceTranslator addOutputDevice:a3 withOptions:Mutable toRoutingContext:self->_routingContext completionHandler:a5];
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)removeOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  if ([a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionInitiator"]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75780], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionInitiator"]);
  }
  if ([a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved"])
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75748], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionContinuePlayingAfterLastDeviceRemoved"]);
  }
  if ([a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionFadePlayback"]) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F75778], (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionFadePlayback"]);
  }
  if ((AVFigRoutingContextOutputContextImplSetShowErrorPromptDictionaryToEcho(Mutable, (const void *)[a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionDidFailToConnectToOutputDeviceUserInfo"]) & 1) == 0)
  {
    int v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Expected a NSDictionary for didFailToConnectToOutputDeviceUserInfo", v11, v12, v13, v14, v15, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  [(AVFigRoutingContextOutputDeviceTranslator *)self->_deviceTranslator removeOutputDevice:a3 withOptions:Mutable fromRoutingContext:self->_routingContext completionHandler:a5];
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)_predictedSelectedRouteDescriptorChanged
{
  uint64_t v3 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
  [(AVOutputContext *)v3 outputContextImplDidChangePredictedOutputDevice:self];
}

- (void)resetPredictedOutputDevice
{
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  routingContext = self->_routingContext;
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  CFBooleanRef v7 = *(void (**)(OpaqueFigRoutingContext *))(v6 + 184);
  if (v7) {
    v7(routingContext);
  }
}

- (void)_canUseForRoutingContextDidChangeForRoutingContextWIthID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigRoutingContextOutputContextImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    [(AVOutputContext *)v4 outputContextImplDidChangeProvidesControlForAllVolumeFeatures:self];
  }
}

- (float)volume
{
  float v9 = 0.0;
  volumeController = self->_volumeController;
  float v3 = 0.0;
  if (volumeController)
  {
    routingContext = self->_routingContext;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    CFBooleanRef v7 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float *))(v6 + 32);
    if (v7)
    {
      v7(volumeController, routingContext, &v9);
      return v9;
    }
  }
  return v3;
}

- (void)_masterVolumeDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigRoutingContextOutputContextImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    [(AVOutputContext *)v4 outputContextImplDidChangeVolume:self];
  }
}

- (BOOL)canSetVolume
{
  char v8 = 0;
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  routingContext = self->_routingContext;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(v5 + 40);
  if (!v6) {
    return 0;
  }
  v6(volumeController, routingContext, &v8);
  return v8 != 0;
}

- (void)_canSetMasterVolumeDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigRoutingContextOutputContextImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    [(AVOutputContext *)v4 outputContextImplDidChangeCanSetVolume:self];
  }
}

- (void)_canMuteDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigRoutingContextOutputContextImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    [(AVOutputContext *)v4 outputContextImplDidChangeCanMute:self];
  }
}

- (void)_muteDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigRoutingContextOutputContextImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    [(AVOutputContext *)v4 outputContextImplDidChangeMute:self];
  }
}

- (void)_masterVolumeControlTypeDidChangeForRoutingContextWithID:(__CFString *)a3
{
  if ([(__CFString *)a3 isEqualToString:[(AVFigRoutingContextOutputContextImpl *)self ID]])
  {
    uint64_t v4 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
    [(AVOutputContext *)v4 outputContextImplDidChangeVolumeControlType:self];
  }
}

- (int64_t)volumeControlType
{
  volumeController = self->_volumeController;
  if (volumeController
    && ((v8 = 0, routingContext = self->_routingContext, (uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0)
      ? (uint64_t v5 = 0)
      : (uint64_t v5 = v4),
        (uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, uint64_t *))(v5 + 48)) != 0
     && (v6(volumeController, routingContext, &v8), (unint64_t)(v8 - 1) <= 2)))
  {
    return qword_194C5FEF8[v8 - 1];
  }
  else
  {
    return 0;
  }
}

- (void)setVolume:(float)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    if (dword_1EB2D3A60)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      volumeController = self->_volumeController;
    }
    routingContext = self->_routingContext;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, float))(v9 + 24);
    if (v10) {
      v10(volumeController, routingContext, a3);
    }
  }
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    routingContext = self->_routingContext;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v8 = v6 ? v6 : 0;
    uint64_t v9 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, __n128))(v8 + 16);
    if (v9)
    {
      v7.n128_f32[0] = (float)a3;
      v9(volumeController, routingContext, v7);
    }
  }
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    routingContext = self->_routingContext;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v8 = v6 ? v6 : 0;
    uint64_t v9 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, __n128))(v8 + 16);
    if (v9)
    {
      v7.n128_f32[0] = (float)-a3;
      v9(volumeController, routingContext, v7);
    }
  }
}

- (BOOL)canMute
{
  char v8 = 0;
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  routingContext = self->_routingContext;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(v5 + 184);
  if (!v6) {
    return 0;
  }
  v6(volumeController, routingContext, &v8);
  return v8 != 0;
}

- (BOOL)isMuted
{
  char v8 = 0;
  volumeController = self->_volumeController;
  if (!volumeController) {
    return 0;
  }
  routingContext = self->_routingContext;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v5 = v4 ? v4 : 0;
  uint64_t v6 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, char *))(v5 + 144);
  if (!v6) {
    return 0;
  }
  v6(volumeController, routingContext, &v8);
  return v8 != 0;
}

- (void)setMuted:(BOOL)a3
{
  volumeController = self->_volumeController;
  if (volumeController)
  {
    BOOL v4 = a3;
    routingContext = self->_routingContext;
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    uint64_t v7 = v6 ? v6 : 0;
    char v8 = *(void (**)(OpaqueFigVolumeControllerState *, OpaqueFigRoutingContext *, BOOL))(v7 + 136);
    if (v8)
    {
      v8(volumeController, routingContext, v4);
    }
  }
}

- (void)_sendCommand:(__CFString *)a3 completionHandler:(id)a4
{
  uint64_t v6 = [a4 copy];
  routingContext = self->_routingContext;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void (**)(OpaqueFigRoutingContext *, __CFString *, void, void (*)(uint64_t, uint64_t, signed int, void (**)(void, void)), uint64_t))(v9 + 136);
  if (v10)
  {
    v10(routingContext, a3, 0, AVOutputContextSendCommandCompletion, v6);
  }
}

- (void)_remoteControlChannelAvailabilityChanged
{
  CFBooleanRef BOOLean = 0;
  routingContext = self->_routingContext;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(unsigned int (**)(OpaqueFigRoutingContext *, void, void, CFBooleanRef *))(v5 + 48);
  if (v6 && !v6(routingContext, *MEMORY[0x1E4F75730], *MEMORY[0x1E4F1CF80], &BOOLean))
  {
    if (!BOOLean) {
      return;
    }
    if (CFBooleanGetValue(BOOLean)) {
      [(AVOutputContext *)[(AVFigRoutingContextOutputContextImpl *)self parentOutputContext] outputContextImplOutgoingCommunicationChannelDidBecomeAvailable:self];
    }
  }
  if (BOOLean) {
    CFRelease(BOOLean);
  }
}

- (AVOutputContextCommunicationChannel)outgoingCommunicationChannel
{
  return (AVOutputContextCommunicationChannel *)[(AVFigRoutingContextCommunicationChannelManager *)self->_commChannelManager outgoingCommunicationChannel];
}

- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4
{
  return (id)[(AVFigRoutingContextCommunicationChannelManager *)self->_commChannelManager openCommunicationChannelWithOptions:a3 error:a4];
}

- (void)communicationChannelManager:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  uint64_t v8 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
  [(AVOutputContext *)v8 outputContextImpl:self didReceiveData:a4 fromCommunicationChannel:a5];
}

- (void)communicationChannelManager:(id)a3 didCloseCommunicationChannel:(id)a4
{
  uint64_t v6 = [(AVFigRoutingContextOutputContextImpl *)self parentOutputContext];
  [(AVOutputContext *)v6 outputContextImpl:self didCloseCommunicationChannel:a4];
}

- (void)_serverConnectionDied
{
  float v3 = (const void *)(*((uint64_t (**)(void))self->_routingContextCreator + 2))();
  id v4 = (id)[objc_alloc((Class)objc_opt_class()) initWithFigRoutingContext:v3 routingContextReplacementBlock:self->_routingContextCreator outputDeviceTranslator:self->_deviceTranslator volumeController:self->_volumeController communicationChannelManagerCreator:self->_commChannelManagerCreator];
  [(AVOutputContext *)[(AVFigRoutingContextOutputContextImpl *)self parentOutputContext] outputContextImpl:self didExpireWithReplacement:v4];
  if (v3) {
    CFRelease(v3);
  }
}

- (OpaqueFigRoutingContext)figRoutingContext
{
  return self->_routingContext;
}

- (AVOutputContext)parentOutputContext
{
  return (AVOutputContext *)objc_loadWeak((id *)&self->_parentContext);
}

@end
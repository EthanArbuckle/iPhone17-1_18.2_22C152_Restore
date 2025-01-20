@interface AVOutputContext
+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3;
+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 communicationChannelManagerCreator:(id)a4;
+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 outputDeviceTranslator:(id)a4;
+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 volumeController:(OpaqueFigVolumeControllerState *)a4;
+ (BOOL)outputContextExistsWithRemoteOutputDevice;
+ (BOOL)supportsSecureCoding;
+ (Class)defaultOutputContextImplClass;
+ (id)addSharedAudioOutputContext;
+ (id)allSharedAudioOutputContexts;
+ (id)auxiliaryOutputContext;
+ (id)commChannelUUIDCommunicationChannelManagerCreator;
+ (id)defaultSharedOutputContext;
+ (id)iTunesAudioContext;
+ (id)outputContext;
+ (id)outputContextForControllingOutputDeviceGroupWithID:(id)a3;
+ (id)outputContextForControllingOutputDeviceGroupWithID:(id)a3 options:(id)a4;
+ (id)outputContextForID:(id)a3;
+ (id)preferredOutputDevicesForAudioSession:(id)a3;
+ (id)sharedAudioPresentationOutputContext;
+ (id)sharedSystemAudioContext;
+ (id)sharedSystemRemoteDisplayContext;
+ (id)sharedSystemRemotePoolContext;
+ (id)sharedSystemScreenContext;
+ (void)initialize;
+ (void)resetOutputDeviceForAllOutputContexts;
- (AVOutputContext)init;
- (AVOutputContext)initWithCoder:(id)a3;
- (AVOutputContext)initWithOutputContextImpl:(id)a3;
- (BOOL)canMute;
- (BOOL)canSetVolume;
- (BOOL)getApplicationProcessID:(int *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMuted;
- (BOOL)providesControlForAllVolumeFeatures;
- (BOOL)setOutputDevice:(id)a3 forFeatures:(unint64_t)a4;
- (BOOL)supportsMultipleBluetoothOutputDevices;
- (BOOL)supportsMultipleOutputDevices;
- (NSString)deviceName;
- (OpaqueFigRoutingContext)figRoutingContext;
- (float)volume;
- (id)communicationChannelDelegate;
- (id)contextID;
- (id)description;
- (id)impl;
- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4;
- (id)outgoingCommunicationChannel;
- (id)outputContextType;
- (id)outputDevice;
- (id)outputDevices;
- (id)predictedOutputDevice;
- (int)applicationProcessID;
- (int64_t)volumeControlType;
- (unint64_t)hash;
- (unint64_t)outputDeviceFeatures;
- (void)addOutputDevice:(id)a3;
- (void)addOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)decreaseVolumeByCount:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)increaseVolumeByCount:(int64_t)a3;
- (void)outputContextImpl:(id)a3 didChangeOutputDeviceWithInitiator:(id)a4;
- (void)outputContextImpl:(id)a3 didChangeOutputDevicesWithInitiator:(id)a4 reason:(id)a5 deviceID:(id)a6 previousDeviceIDs:(id)a7;
- (void)outputContextImpl:(id)a3 didCloseCommunicationChannel:(id)a4;
- (void)outputContextImpl:(id)a3 didExpireWithReplacement:(id)a4;
- (void)outputContextImpl:(id)a3 didInitiateDestinationChange:(id)a4;
- (void)outputContextImpl:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5;
- (void)outputContextImplDidChangeCanMute:(id)a3;
- (void)outputContextImplDidChangeCanSetVolume:(id)a3;
- (void)outputContextImplDidChangeGlobalOutputDeviceConfiguration:(id)a3;
- (void)outputContextImplDidChangeMute:(id)a3;
- (void)outputContextImplDidChangePredictedOutputDevice:(id)a3;
- (void)outputContextImplDidChangeProvidesControlForAllVolumeFeatures:(id)a3;
- (void)outputContextImplDidChangeVolume:(id)a3;
- (void)outputContextImplDidChangeVolumeControlType:(id)a3;
- (void)outputContextImplOutgoingCommunicationChannelDidBecomeAvailable:(id)a3;
- (void)removeOutputDevice:(id)a3;
- (void)removeOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)resetPredictedOutputDevice;
- (void)setApplicationProcessID:(int)a3;
- (void)setCommunicationChannelDelegate:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOutputDevice:(id)a3 options:(id)a4;
- (void)setOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setOutputDevices:(id)a3;
- (void)setOutputDevices:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setVolume:(float)a3;
@end

@implementation AVOutputContext

- (id)predictedOutputDevice
{
  id v2 = [(AVOutputContext *)self impl];
  return (id)[v2 predictedOutputDevice];
}

- (id)outputDevices
{
  id v2 = [(AVOutputContext *)self impl];
  return (id)[v2 outputDevices];
}

- (id)contextID
{
  id v2 = [(AVOutputContext *)self impl];
  return (id)[v2 ID];
}

- (BOOL)providesControlForAllVolumeFeatures
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 providesControlForAllVolumeFeatures];
}

- (id)impl
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__AVOutputContext_impl__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __23__AVOutputContext_impl__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

AVFigCommChannelUUIDCommunicationChannelManager *__87__AVOutputContext_FigRoutingContext__commChannelUUIDCommunicationChannelManagerCreator__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [[AVFigCommChannelUUIDCommunicationChannelManager alloc] initWithRoutingContext:a2];
  return v2;
}

+ (id)commChannelUUIDCommunicationChannelManagerCreator
{
  id v2 = (void *)[&__block_literal_global_39 copy];
  return v2;
}

+ (id)sharedAudioPresentationOutputContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedAudioPresentationOutputContext"));
  return v2;
}

+ (id)outputContextForID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "outputContextImplForID:type:", a3, 0));
  return v3;
}

- (AVOutputContext)initWithOutputContextImpl:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVOutputContext;
  v4 = [(AVOutputContext *)&v9 init];
  if (v4
    && (v5 = objc_alloc_init(AVOutputContextInternal), (v4->_outputContext = v5) != 0)
    && (v4->_outputContext->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontext.ivars"),
        v4->_outputContext->impl = (AVOutputContextImpl *)a3,
        (impl = v4->_outputContext->impl) != 0))
  {
    [(AVOutputContextImpl *)impl setParentOutputContext:v4];
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)defaultOutputContextImplClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  outputContext = self->_outputContext;
  if (outputContext)
  {

    outputContext = self->_outputContext;
    ivarAccessQueue = outputContext->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      outputContext = self->_outputContext;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputContext;
  [(AVOutputContext *)&v5 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)outputContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AVOutputContext_outputContext__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = a1;
  if (outputContext_onceToken != -1) {
    dispatch_once(&outputContext_onceToken, block);
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.UIKit.screenpicker"))id v3 = (id)outputContext_sSharedContext; {
  else
  }
    id v3 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "platformDependentScreenOrVideoContext"));
  return v3;
}

uint64_t __32__AVOutputContext_outputContext__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "defaultOutputContextImplClass"), "platformDependentScreenOrVideoContext"));
  outputContext_sSharedContext = result;
  return result;
}

+ (id)auxiliaryOutputContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "auxiliaryOutputContext"));
  return v2;
}

+ (id)sharedSystemAudioContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemAudioContext"));
  return v2;
}

+ (id)sharedSystemRemoteDisplayContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemRemoteDisplayContext"));
  return v2;
}

+ (id)sharedSystemScreenContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemScreenContext"));
  return v2;
}

+ (id)sharedSystemRemotePoolContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemRemotePoolContext"));
  return v2;
}

+ (id)iTunesAudioContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "iTunesAudioContext"));
  return v2;
}

+ (id)addSharedAudioOutputContext
{
  id v2 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "addSharedAudioOutputContextImpl"));
  return v2;
}

+ (id)allSharedAudioOutputContexts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  v4 = objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "allSharedAudioOutputContextImpls");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = (void *)[objc_alloc((Class)a1) initWithOutputContextImpl:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (id)defaultSharedOutputContext
{
  id result = (id)objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "defaultSharedOutputContextImpl");
  if (result)
  {
    v4 = (void *)[objc_alloc((Class)a1) initWithOutputContextImpl:result];
    return v4;
  }
  return result;
}

+ (id)outputContextForControllingOutputDeviceGroupWithID:(id)a3 options:(id)a4
{
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "outputContextImplForControllingOutputDeviceGroupWithID:options:", a3, a4));
  return v4;
}

+ (id)outputContextForControllingOutputDeviceGroupWithID:(id)a3
{
  return (id)[a1 outputContextForControllingOutputDeviceGroupWithID:a3 options:0];
}

- (AVOutputContext)init
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "defaultOutputContextImplClass"), "platformDependentScreenOrVideoContext");
  return [(AVOutputContext *)self initWithOutputContextImpl:v3];
}

- (AVOutputContext)initWithCoder:(id)a3
{
  uint64_t v5 = (AVOutputContext *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVOutputContextSerializationKeyContextID"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVOutputContextSerializationKeyContextType"];
  if (v5)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "defaultOutputContextImplClass"), "outputContextImplForID:type:", v5, v6);
    if (v7
      && (uint64_t v8 = [(AVOutputContext *)self initWithOutputContextImpl:v7], (self = v8) != 0))
    {
      uint64_t v5 = v8;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(AVOutputContext *)self contextID];
  id v6 = [(AVOutputContext *)self outputContextType];
  [a3 encodeObject:v5 forKey:@"AVOutputContextSerializationKeyContextID"];
  [a3 encodeObject:v6 forKey:@"AVOutputContextSerializationKeyContextType"];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, ID=%@, type=%@>", NSStringFromClass(v4), self, -[AVOutputContext contextID](self, "contextID"), -[AVOutputContext outputContextType](self, "outputContextType")];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = [(AVOutputContext *)self impl];
  uint64_t v6 = [a3 impl];
  return [v5 isEqual:v6];
}

- (unint64_t)hash
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 hash];
}

- (id)outputContextType
{
  id v2 = [(AVOutputContext *)self impl];
  return (id)[v2 outputContextType];
}

- (int)applicationProcessID
{
  int v3 = 0;
  [(AVOutputContext *)self getApplicationProcessID:&v3];
  return v3;
}

- (BOOL)getApplicationProcessID:(int *)a3
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVOutputContext_getApplicationProcessID___block_invoke;
  block[3] = &unk_1E57B3888;
  block[4] = self;
  void block[5] = &v9;
  block[6] = &v13;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  int v5 = *((unsigned __int8 *)v14 + 24);
  if (*((unsigned char *)v14 + 24)) {
    *a3 = *((_DWORD *)v10 + 6);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

void *__43__AVOutputContext_getApplicationProcessID___block_invoke(void *result)
{
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = *(_DWORD *)(*(void *)(result[4] + 8) + 32);
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(unsigned char *)(*(void *)(result[4] + 8) + 36);
  return result;
}

- (void)setApplicationProcessID:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVOutputContext_setApplicationProcessID___block_invoke;
  block[3] = &unk_1E57B39C8;
  block[4] = self;
  int v8 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend(-[AVOutputContext impl](self, "impl"), "outputContextDidChangeApplicationProcessID:", self);
}

uint64_t __43__AVOutputContext_setApplicationProcessID___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 32) = *(_DWORD *)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 36) = 1;
  return result;
}

- (NSString)deviceName
{
  id result = [(AVOutputContext *)self outputDevice];
  if (result)
  {
    return (NSString *)[(NSString *)result name];
  }
  return result;
}

- (id)outputDevice
{
  int v3 = objc_msgSend(-[AVOutputContext impl](self, "impl"), "outputDevice");
  [(AVOutputContext *)self supportsMultipleOutputDevices];
  return v3;
}

- (void)setOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicePasswordKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceCancelIfAuthRequiredKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceSuppressUserInteractionOnSenderOnlyKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceInitiatorKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceDefaultAudioToLocalKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceFadePlaybackKey"];
  if (dword_1EB2D3A60)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v10 = [(AVOutputContext *)self impl];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__AVOutputContext_setOutputDevice_options_completionHandler___block_invoke;
  v13[3] = &unk_1E57B6200;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  [v10 setOutputDevice:a3 options:a4 completionHandler:v13];
}

uint64_t __61__AVOutputContext_setOutputDevice_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a2, "status", v6, v7) == 2
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", @"AVOutputContextTypeGroupControl") & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", @"AVOutputContextTypeSharedSystemRemotePool") & 1) == 0&& objc_msgSend(*(id *)(a1 + 40), "ID"))
  {
    [*(id *)(a1 + 40) updateFrecencyScore];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  }
  return result;
}

- (unint64_t)outputDeviceFeatures
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AVOutputContext_outputDeviceFeatures__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__AVOutputContext_outputDeviceFeatures__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (BOOL)setOutputDevice:(id)a3 forFeatures:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v14, v15);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke;
  block[3] = &unk_1E57B2228;
  block[4] = self;
  void block[5] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke_2;
  v16[3] = &unk_1E57B6228;
  v16[4] = v9;
  v16[5] = v8;
  [(AVOutputContext *)self setOutputDevice:a3 options:0 completionHandler:v16];
  [v9 lock];
  uint64_t v11 = (void *)[v8 firstObject];
  if (v11) {
    BOOL v12 = [v11 status] == 2;
  }
  else {
    BOOL v12 = 1;
  }
  [v9 unlock];

  return v12;
}

uint64_t __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(result + 40);
  return result;
}

uint64_t __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 40) addObject:a2];
  v4 = *(void **)(a1 + 32);
  return [v4 unlock];
}

- (void)setOutputDevice:(id)a3 options:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicePasswordKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceCancelIfAuthRequiredKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceSuppressUserInteractionOnSenderOnlyKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceInitiatorKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDeviceFadePlaybackKey"];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext setOutputDevice:options:completionHandler:](self, "setOutputDevice:options:completionHandler:", a3, a4, 0, v8, v9);
}

+ (void)resetOutputDeviceForAllOutputContexts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v17 = objc_msgSend(a1, "defaultOutputContextImplClass", v9, v10, 0);
  v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) resetOutputDeviceForAllOutputContexts];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v6);
  }
}

+ (BOOL)outputContextExistsWithRemoteOutputDevice
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = objc_msgSend(a1, "defaultOutputContextImplClass", 0);
  id v2 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      if (v5) {
        char v5 = 1;
      }
      else {
        char v5 = [*(id *)(*((void *)&v9 + 1) + 8 * i) outputContextExistsWithRemoteOutputDevice];
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (void)outputContextImpl:(id)a3 didInitiateDestinationChange:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  long long v9 = @"AVOutputContextDestinationChangeKey";
  v10[0] = a4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7, v8), "postNotificationName:object:userInfo:", @"AVOutputContextDestinationChangeInitiatedNotification", self, v5);
}

- (void)outputContextImpl:(id)a3 didChangeOutputDeviceWithInitiator:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v9 = @"AVOutputContextDestinationChangeInitiatorKey";
    v10[0] = a4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7, v8), "postNotificationName:object:userInfo:", @"AVOutputContextOutputDeviceDidChangeNotification", self, v5);
}

- (void)outputContextImplDidChangeGlobalOutputDeviceConfiguration:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (AVOutputContextIsSystemContextAllowed_onceToken != -1) {
    dispatch_once(&AVOutputContextIsSystemContextAllowed_onceToken, &__block_literal_global_25);
  }
  if (AVOutputContextIsSystemContextAllowed_isAllowed)
  {
    if (dword_1EB2D3A60)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v5, v6), "postNotificationName:object:", @"AVOutputContextGlobalOutputDeviceConfigurationDidChangeNotification", self);
  }
}

- (BOOL)supportsMultipleOutputDevices
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 supportsMultipleOutputDevices];
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 supportsMultipleBluetoothOutputDevices];
}

- (void)outputContextImpl:(id)a3 didChangeOutputDevicesWithInitiator:(id)a4 reason:(id)a5 deviceID:(id)a6 previousDeviceIDs:(id)a7
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  uint64_t v13 = v12;
  if (a4) {
    [v12 setObject:a4 forKeyedSubscript:@"AVOutputContextDestinationChangeInitiatorKey"];
  }
  if (a5) {
    [v13 setObject:a5 forKeyedSubscript:@"AVOutputContextDestinationChangeReasonKey"];
  }
  if (a6) {
    [v13 setObject:a6 forKeyedSubscript:@"AVOutputContextDestinationChangeDeviceIDKey"];
  }
  if (a7) {
    [v13 setObject:a7 forKeyedSubscript:@"AVOutputContextDestinationChangePreviousDeviceIDsKey"];
  }
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v15, v16), "postNotificationName:object:userInfo:", @"AVOutputContextOutputDevicesDidChangeNotification", self, v13);
}

- (void)setOutputDevices:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext setOutputDevices:options:completionHandler:](self, "setOutputDevices:options:completionHandler:", a3, 0, 0, v6, v7);
}

- (void)setOutputDevices:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputContextSetOutputDevicesOptionFadePlayback"];
  if (dword_1EB2D3A60)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v10 = [(AVOutputContext *)self impl];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__AVOutputContext_setOutputDevices_options_completionHandler___block_invoke;
  v13[3] = &unk_1E57B6200;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  [v10 setOutputDevices:a3 options:a4 completionHandler:v13];
}

uint64_t __62__AVOutputContext_setOutputDevices_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    int v19 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a2, "status", v12, v13) == 2
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", @"AVOutputContextTypeGroupControl") & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", @"AVOutputContextTypeSharedSystemRemotePool") & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 ID]) {
            [v10 updateFrecencyScore];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  }
  return result;
}

- (void)addOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionAuthorizationToken"];
  [a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"];
  [a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionInitiator"];
  [a4 objectForKeyedSubscript:@"AVOutputContextAddOutputDeviceOptionFadePlayback"];
  if (dword_1EB2D3A60)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v10 = [(AVOutputContext *)self impl];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__AVOutputContext_addOutputDevice_options_completionHandler___block_invoke;
  v13[3] = &unk_1E57B6200;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  [v10 addOutputDevice:a3 options:a4 completionHandler:v13];
}

uint64_t __61__AVOutputContext_addOutputDevice_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a2, "status", v6, v7) == 2
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", @"AVOutputContextTypeGroupControl") & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", @"AVOutputContextTypeSharedSystemRemotePool") & 1) == 0&& objc_msgSend(*(id *)(a1 + 40), "ID"))
  {
    [*(id *)(a1 + 40) updateFrecencyScore];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  }
  return result;
}

- (void)addOutputDevice:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext addOutputDevice:options:completionHandler:](self, "addOutputDevice:options:completionHandler:", a3, 0, 0, v6, v7);
}

- (void)removeOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a4 objectForKeyedSubscript:@"AVOutputContextRemoveOutputDeviceOptionFadePlayback"];
  if (dword_1EB2D3A60)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v10 = [(AVOutputContext *)self impl];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__AVOutputContext_removeOutputDevice_options_completionHandler___block_invoke;
  v13[3] = &unk_1E57B6250;
  v13[4] = self;
  v13[5] = a5;
  [v10 removeOutputDevice:a3 options:a4 completionHandler:v13];
}

uint64_t __64__AVOutputContext_removeOutputDevice_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)removeOutputDevice:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext removeOutputDevice:options:completionHandler:](self, "removeOutputDevice:options:completionHandler:", a3, 0, 0, v6, v7);
}

- (void)outputContextImplDidChangePredictedOutputDevice:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextPredictedOutputDeviceDidChangeNotification", self);
}

- (void)resetPredictedOutputDevice
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputContext impl](self, "impl", v4, v5), "resetPredictedOutputDevice");
}

- (void)outputContextImplDidChangeProvidesControlForAllVolumeFeatures:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextProvidesControlForAllVolumeFeaturesDidChangeNotification", self);
}

- (float)volume
{
  id v2 = [(AVOutputContext *)self impl];
  [v2 volume];
  return result;
}

- (void)outputContextImplDidChangeVolume:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextVolumeDidChangeNotification", self);
}

- (BOOL)canSetVolume
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 canSetVolume];
}

- (void)outputContextImplDidChangeCanSetVolume:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextCanSetVolumeDidChangeNotification", self);
}

- (void)outputContextImplDidChangeCanMute:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextCanMuteDidChangeNotification", self);
}

- (void)outputContextImplDidChangeMute:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextMutedDidChangeNotification", self);
}

- (void)setVolume:(float)a3
{
  id v4 = [(AVOutputContext *)self impl];
  *(float *)&double v5 = a3;
  [v4 setVolume:v5];
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  id v4 = [(AVOutputContext *)self impl];
  [v4 increaseVolumeByCount:a3];
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  id v4 = [(AVOutputContext *)self impl];
  [v4 decreaseVolumeByCount:a3];
}

- (int64_t)volumeControlType
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 volumeControlType];
}

- (BOOL)canMute
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 canMute];
}

- (BOOL)isMuted
{
  id v2 = [(AVOutputContext *)self impl];
  return [v2 isMuted];
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVOutputContext *)self impl];
  [v4 setMuted:v3];
}

- (void)outputContextImplDidChangeVolumeControlType:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, v5, v6), "postNotificationName:object:", @"AVOutputContextVolumeControlTypeDidChangeNotification", self);
}

- (id)outgoingCommunicationChannel
{
  id v2 = [(AVOutputContext *)self impl];
  return (id)[v2 outgoingCommunicationChannel];
}

- (id)communicationChannelDelegate
{
  return objc_loadWeak((id *)&self->_outputContext->communicationChannelDelegate);
}

- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl", v9, v10), "openCommunicationChannelWithOptions:error:", a3, a4);
}

- (void)setCommunicationChannelDelegate:(id)a3
{
  if (dword_1EB2D3A60)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_outputContext->communicationChannelDelegate, a3);
}

- (void)outputContextImplOutgoingCommunicationChannelDidBecomeAvailable:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [(AVOutputContext *)self communicationChannelDelegate];
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A60)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v4, "outputContextOutgoingCommunicationChannelDidBecomeAvailable:", self, v7, v8);
  }
  else if (dword_1EB2D3A60)
  {
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputContextImpl:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = [(AVOutputContext *)self communicationChannelDelegate];
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A60)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v8, "outputContext:didReceiveData:fromCommunicationChannel:", self, a4, a5, v11, v12);
  }
  else if (dword_1EB2D3A60)
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputContextImpl:(id)a3 didCloseCommunicationChannel:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = [(AVOutputContext *)self communicationChannelDelegate];
  if (objc_opt_respondsToSelector())
  {
    if (dword_1EB2D3A60)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v6, "outputContext:didCloseCommunicationChannel:", self, a4, v9, v10);
  }
  else if (dword_1EB2D3A60)
  {
    id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputContextImpl:(id)a3 didExpireWithReplacement:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__24;
  uint64_t v12 = __Block_byref_object_dispose__24;
  uint64_t v13 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVOutputContext_outputContextImpl_didExpireWithReplacement___block_invoke;
  block[3] = &unk_1E57B3270;
  void block[5] = a4;
  void block[6] = &v8;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  [(id)v9[5] setParentOutputContext:0];
  [a4 setParentOutputContext:self];
  [(AVOutputContext *)self outputContextImpl:[(AVOutputContext *)self impl] didChangeOutputDevicesWithInitiator:@"server death" reason:0 deviceID:0 previousDeviceIDs:0];
  [(AVOutputContext *)self outputContextImpl:[(AVOutputContext *)self impl] didChangeOutputDevicesWithInitiator:@"server death" reason:0 deviceID:0 previousDeviceIDs:0];
  [(AVOutputContext *)self outputContextImplDidChangeGlobalOutputDeviceConfiguration:[(AVOutputContext *)self impl]];

  _Block_object_dispose(&v8, 8);
}

id __62__AVOutputContext_outputContextImpl_didExpireWithReplacement___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 16));

  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) = result;
  return result;
}

+ (id)preferredOutputDevicesForAudioSession:(id)a3
{
  id v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFArrayRef theArray = 0;
  uint64_t v5 = (const void *)AVCreateRouteDiscovererWithType(2);
  if (!v5
    || !+[AVOutputDevice prefersRouteDescriptors]
    || ((uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", objc_msgSend(a3, "opaqueSessionID")),
         (uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0)
      ? (uint64_t v8 = 0)
      : (uint64_t v8 = v7),
        (uint64_t v9 = *(unsigned int (**)(const void *, void, uint64_t))(v8 + 56)) == 0
     || v9(v5, *MEMORY[0x1E4F75568], v6)
     || ((v10 = *(void *)(CMBaseObjectGetVTable() + 8)) == 0 ? (uint64_t v11 = 0) : (uint64_t v11 = v10),
         (uint64_t v12 = *(uint64_t (**)(const void *, void, void, CFArrayRef *))(v11 + 48)) == 0)))
  {
LABEL_17:
    CFArrayRef v14 = theArray;
    goto LABEL_18;
  }
  int v13 = v12(v5, *MEMORY[0x1E4F75570], *MEMORY[0x1E4F1CF80], &theArray);
  CFArrayRef v14 = theArray;
  if (!v13 && theArray)
  {
    if (CFArrayGetCount(theArray) >= 1)
    {
      CFIndex v15 = 0;
      do
      {
        CFArrayGetValueAtIndex(theArray, v15);
        FigCFDictionaryGetBooleanIfPresent();
        ++v15;
      }
      while (v15 < CFArrayGetCount(theArray));
    }
    goto LABEL_17;
  }
LABEL_18:
  if (v14) {
    CFRelease(v14);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v4;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 outputDeviceTranslator:(id)a4
{
  uint64_t v7 = (const void *)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  FigVolumeControllerCopySharedControllerRemote();
  uint64_t v8 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:]([AVFigRoutingContextOutputContextImpl alloc], "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", v7, a3, a4, 0, [a1 defaultCommunicationChannelManagerCreator]);
  uint64_t v9 = [[AVOutputContext alloc] initWithOutputContextImpl:v8];
  if (v7) {
    CFRelease(v7);
  }

  return v9;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 volumeController:(OpaqueFigVolumeControllerState *)a4
{
  BOOL v7 = AVOutputContextUsesRouteConfigUpdatedNotification();
  id DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(v7);
  uint64_t v9 = (const void *)(*((uint64_t (**)(id))a3 + 2))(a3);
  uint64_t v10 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:]([AVFigRoutingContextOutputContextImpl alloc], "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", v9, a3, DefaultDeviceTranslator, a4, [a1 defaultCommunicationChannelManagerCreator]);
  uint64_t v11 = [[AVOutputContext alloc] initWithOutputContextImpl:v10];
  if (v9) {
    CFRelease(v9);
  }

  return v11;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 communicationChannelManagerCreator:(id)a4
{
  uint64_t v6 = (const void *)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  BOOL v7 = AVOutputContextUsesRouteConfigUpdatedNotification();
  id DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(v7);
  FigVolumeControllerCopySharedControllerRemote();
  uint64_t v9 = [[AVFigRoutingContextOutputContextImpl alloc] initWithFigRoutingContext:v6 routingContextReplacementBlock:a3 outputDeviceTranslator:DefaultDeviceTranslator volumeController:0 communicationChannelManagerCreator:a4];
  uint64_t v10 = [[AVOutputContext alloc] initWithOutputContextImpl:v9];
  if (v6) {
    CFRelease(v6);
  }

  return v10;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3
{
  BOOL v3 = [[AVFigRoutingContextOutputContextImpl alloc] initWithFigRoutingContextCreator:a3];
  id v4 = [[AVOutputContext alloc] initWithOutputContextImpl:v3];

  return v4;
}

- (OpaqueFigRoutingContext)figRoutingContext
{
  id v2 = [(AVOutputContext *)self impl];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return (OpaqueFigRoutingContext *)[v2 figRoutingContext];
}

@end
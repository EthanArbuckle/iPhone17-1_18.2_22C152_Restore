@interface AUAudioUnit_XPC
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)remoteProcessAuditToken;
- (BOOL)_setBusCount:(unint64_t)a3 scope:(unsigned int)a4 error:(id *)a5;
- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3;
- (BOOL)deleteUserPreset:(id)a3 error:(id *)a4;
- (BOOL)disableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)enableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)isLoadedInProcess;
- (BOOL)isLocalCachingDisabled;
- (BOOL)providesUserInterface;
- (BOOL)saveUserPreset:(id)a3 error:(id *)a4;
- (NSUUID)auInstanceUUID;
- (float)getV2Parameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4;
- (id).cxx_construct;
- (id)XPCListenerEndpoint;
- (id)_getBus:(unsigned int)a3 scope:(unsigned int)a4 error:(id *)a5;
- (id)_getInvalidationNotificationInfo;
- (id)_getValueForKey:(id)a3;
- (id)_getValueForProperty:(id)a3 error:(id *)a4;
- (id)audioUnitInstanceUUID;
- (id)inputBusses;
- (id)internalRenderBlock;
- (id)messageChannelFor:(id)a3;
- (id)outputBusses;
- (id)parameterTree;
- (id)parametersForOverviewWithCount:(int64_t)a3;
- (id)presetStateFor:(id)a3 error:(id *)a4;
- (id)profileStateForCable:(unsigned __int8)a3 channel:(unsigned __int8)a4;
- (id)speechVoices;
- (id)supportedViewConfigurations:(id)a3;
- (id)userPresets;
- (id)valueForUndefinedKey:(id)a3;
- (int)remoteProcessIdentifier;
- (void)_doOpen:(id)a3 completion:(id)a4;
- (void)_invalidatePipePoolAndUser;
- (void)_parameterTreeChanged;
- (void)_refreshBusses:(unsigned int)a3;
- (void)_setComponentInstance:(OpaqueAudioComponentInstance *)a3;
- (void)_setState:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)_setValue:(id)a3 forProperty:(id)a4 error:(id *)a5;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)cancelSpeechRequest;
- (void)dealloc;
- (void)didCrash:(id)a3;
- (void)didInvalidate;
- (void)internalDeallocateRenderResources;
- (void)invalidateAllParameters;
- (void)propertiesChanged:(id)a3;
- (void)remoteReset;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)reset;
- (void)selectViewConfiguration:(id)a3;
- (void)setCurrentPreset:(id)a3;
- (void)setFullState:(id)a3;
- (void)setFullStateForDocument:(id)a3;
- (void)setLocalCachingDisabled:(BOOL)a3;
- (void)setMusicalContextBlock:(id)a3;
- (void)setTransportStateBlock:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)synthesizeSpeechRequest:(id)a3;
@end

@implementation AUAudioUnit_XPC

- (id).cxx_construct
{
  *((void *)self + 82) = 850045863;
  *(_OWORD *)((char *)self + 664) = 0u;
  *(_OWORD *)((char *)self + 680) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  *((void *)self + 89) = 0;
  *((void *)self + 95) = 850045863;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((_OWORD *)self + 50) = 0u;
  *((void *)self + 102) = 0;
  *((void *)self + 105) = 0;
  *((void *)self + 107) = 0;
  *((void *)self + 108) = 0;
  *((void *)self + 106) = 0;
  *((void *)self + 109) = 0;
  *((void *)self + 110) = 0;
  *((unsigned char *)self + 888) = 0;
  *((unsigned char *)self + 960) = 0;
  *((_WORD *)self + 492) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 124, 0);
  objc_storeStrong((id *)self + 122, 0);
  objc_storeStrong((id *)self + 121, 0);
  if (*((unsigned char *)self + 960)) {
    auoop::RenderPipeUser::~RenderPipeUser((auoop::RenderPipeUser *)((char *)self + 888));
  }
  v3 = (std::__shared_weak_count *)*((void *)self + 110);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = *((void *)self + 106);
  if (v4)
  {
    uint64_t v5 = *((void *)self + 107);
    v6 = (void *)*((void *)self + 106);
    if (v5 != v4)
    {
      do
      {
        uint64_t v7 = v5 - 32;

        uint64_t v5 = v7;
      }
      while (v7 != v4);
      v6 = (void *)*((void *)self + 106);
    }
    *((void *)self + 107) = v4;
    operator delete(v6);
  }
  uint64_t v8 = *((void *)self + 105);
  *((void *)self + 105) = 0;
  if (v8) {
    MEMORY[0x192FC8940](v8, 0x80C40803F642BLL);
  }
  objc_storeStrong((id *)self + 104, 0);
  objc_storeStrong((id *)self + 103, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 760));
  objc_storeStrong((id *)self + 93, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 656));
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 584));
  objc_storeStrong((id *)self + 72, 0);
}

- (NSUUID)auInstanceUUID
{
  return (NSUUID *)*((void *)self + 124);
}

- (void)setLocalCachingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7[6] = *MEMORY[0x1E4F143B8];
  *((_WORD *)self + 492) = a3 | 0x100;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_message((uint64_t)&v6, *((void **)self + 72));
  uint64_t v4 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_proxy(&v6);
  uint64_t v5 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::reply((uint64_t)&v6);
  [v4 localCachingDisabled:1 newValue:v3 reply:v5];

  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v7);
}

- (BOOL)isLocalCachingDisabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (BOOL *)self + 984;
  if (!*((unsigned char *)self + 985))
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_message((uint64_t)&v6, *((void **)self + 72));
    BOOL v3 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::sync_proxy(&v6);
    uint64_t v4 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},BOOL>::reply((uint64_t)&v6);
    [v3 localCachingDisabled:0 newValue:0 reply:v4];

    *(_WORD *)v2 = v8 | 0x100;
    std::__function::__value_func<void ()(NSError *,std::tuple<BOOL> &&)>::~__value_func[abi:ne180100](v7);

    if (!v2[1]) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
  }
  return *v2;
}

- (id)audioUnitInstanceUUID
{
  v7[6] = *MEMORY[0x1E4F143B8];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_message(&v6, *((void **)self + 72));
  v2 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::sync_proxy(&v6);
  BOOL v3 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSString * {__strong}>::reply((uint64_t)&v6);
  [v2 retrieveInstanceUUID:v3];

  id v4 = (id)v7[5];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSString * {__strong}> &&)>::~__value_func[abi:ne180100](v7);

  return v4;
}

- (id)XPCListenerEndpoint
{
  return (id)[*((id *)self + 72) endpoint];
}

- (id)speechVoices
{
  v8[6] = *MEMORY[0x1E4F143B8];
  [(AUAudioUnit *)self componentDescription];
  if (v7 == 1635087216)
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v7, *((void **)self + 72));
    BOOL v3 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v7);
    id v4 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v7);
    [v3 getSpeechVoices:v4];

    id v5 = (id)v8[5];
    std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v8);
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (void)cancelSpeechRequest
{
  v8[4] = *MEMORY[0x1E4F143B8];
  [(AUAudioUnit *)self componentDescription];
  if (v7 == 1635087216)
  {
    BOOL v3 = (void *)*((void *)self + 72);
    v6[0] = &unk_1EDF9E4D0;
    v6[1] = &__block_literal_global_227;
    v6[3] = v6;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v7, v3, (uint64_t)v6);
    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v6);
    id v4 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v7);
    id v5 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v7);
    [v4 cancelSpeechRequest:v5];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v8);
  }
}

- (void)synthesizeSpeechRequest:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AUAudioUnit *)self componentDescription];
  if (v9 == 1635087216)
  {
    id v5 = (void *)*((void *)self + 72);
    v8[0] = &unk_1EDF9E4D0;
    v8[1] = &__block_literal_global_225;
    v8[3] = v8;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v9, v5, (uint64_t)v8);
    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v8);
    v6 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v9);
    uint64_t v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v9);
    [v6 synthesizeSpeechRequest:v4 reply:v7];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v10);
  }
}

- (id)messageChannelFor:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*((void *)self + 72);
  *(void *)aBlock = &unk_1EDFA10B0;
  *(void *)&aBlock[8] = &v19;
  *(void *)&aBlock[24] = aBlock;
  id v6 = v5;
  id v19 = v6;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::~__value_func[abi:ne180100](aBlock);
  id v21 = 0;
  id v22 = 0;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v25, (uint64_t)v20);
  id v7 = v19;
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 3321888768;
  *(void *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP21NSXPCListenerEndpointEE10sync_proxyEv_block_invoke;
  *(void *)&aBlock[24] = &__block_descriptor_64_ea8_32c84_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP21NSXPCListenerEndpointEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v24, (uint64_t)v25);
  unsigned __int8 v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::~__value_func[abi:ne180100](v24);
  uint64_t v9 = std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::~__value_func[abi:ne180100](v25);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)v20);
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 3321888768;
  *(void *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP21NSXPCListenerEndpointEE5replyEv_block_invoke;
  *(void *)&aBlock[24] = &__block_descriptor_64_ea8_32c84_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP21NSXPCListenerEndpointEEEEEE_e43_v24__0__NSError_8__NSXPCListenerEndpoint_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v24, (uint64_t)v25);
  v10 = _Block_copy(aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::~__value_func[abi:ne180100](v24);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::~__value_func[abi:ne180100](v25);
  [v8 getCustomMessageChannelFor:v4 reply:v10];

  id v11 = v22;
  v12 = v11;
  id v13 = v21;
  if (!v21)
  {
    if (v11)
    {
      v14 = [[AUMessageChannel_XPC alloc] initWithListenerEndpoint:v11];
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!kAUExtensionScope)
  {
    v14 = (AUMessageChannel_XPC *)MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  v14 = (AUMessageChannel_XPC *)*(id *)kAUExtensionScope;
  if (v14)
  {
LABEL_8:
    v16 = v14;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = v13;
      *(_DWORD *)aBlock = 136315650;
      *(void *)&aBlock[4] = "AUAudioUnit_XPC.mm";
      *(_WORD *)&aBlock[12] = 1024;
      *(_DWORD *)&aBlock[14] = 1334;
      *(_WORD *)&aBlock[18] = 2112;
      *(void *)&aBlock[20] = v17;
      _os_log_impl(&dword_18FEC0000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to receive messageChannel with error: %@", aBlock, 0x1Cu);
    }
LABEL_11:
    v14 = 0;
  }
LABEL_12:

  std::__function::__value_func<void ()(NSError *,std::tuple<NSXPCListenerEndpoint * {__strong}> &&)>::~__value_func[abi:ne180100](v20);
  return v14;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)remoteProcessAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)*((void *)self + 72);
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (int)remoteProcessIdentifier
{
  return [*((id *)self + 72) processIdentifier];
}

- (BOOL)isLoadedInProcess
{
  return 0;
}

- (id)userPresets
{
  v23[4] = *MEMORY[0x1E4F143B8];
  if (![(AUAudioUnit *)self supportsUserPresets])
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  BOOL v3 = (void *)*((void *)self + 72);
  *(void *)aBlock = &unk_1EDFA1140;
  *(void *)&aBlock[8] = &v17;
  *(void *)&aBlock[24] = aBlock;
  id v4 = v3;
  id v17 = v4;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v18, (uint64_t)aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::~__value_func[abi:ne180100](aBlock);
  id v19 = 0;
  id obj = 0;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v23, (uint64_t)v18);
  id v5 = v17;
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 3321888768;
  *(void *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP17AUAudioUnitPresetEEE10sync_proxyEv_block_invoke;
  *(void *)&aBlock[24] = &__block_descriptor_64_ea8_32c91_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  id v7 = std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)v18);
  *(void *)aBlock = MEMORY[0x1E4F143A8];
  *(void *)&aBlock[8] = 3321888768;
  *(void *)&aBlock[16] = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP17AUAudioUnitPresetEEE5replyEv_block_invoke;
  *(void *)&aBlock[24] = &__block_descriptor_64_ea8_32c91_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  unsigned __int8 v8 = _Block_copy(aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  [v6 loadUserPresets:v8];

  uint64_t v9 = (id *)((char *)self + 976);
  objc_storeStrong(v9, obj);
  id v10 = v19;
  if (v19)
  {
    if (kAUExtensionScope)
    {
      id v11 = *(id *)kAUExtensionScope;
      if (!v11)
      {
LABEL_12:
        id v12 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_13;
      }
    }
    else
    {
      id v11 = (id)MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    v14 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v10;
      *(_DWORD *)aBlock = 136315650;
      *(void *)&aBlock[4] = "AUAudioUnit_XPC.mm";
      *(_WORD *)&aBlock[12] = 1024;
      *(_DWORD *)&aBlock[14] = 1306;
      *(_WORD *)&aBlock[18] = 2112;
      *(void *)&aBlock[20] = v15;
      _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to load user presets: %@", aBlock, 0x1Cu);
    }
    goto LABEL_12;
  }
  id v12 = *v9;
LABEL_13:

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<AUAudioUnitPreset *> * {__strong}> &&)>::~__value_func[abi:ne180100](v18);
LABEL_14:
  return v12;
}

- (id)presetStateFor:(id)a3 error:(id *)a4
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(AUAudioUnit *)self supportsUserPresets])
  {
    id v7 = (void *)*((void *)self + 72);
    aBlock = &unk_1EDFA0FD8;
    uint64_t v21 = (uint64_t)&v16;
    p_aBlock = &aBlock;
    id v8 = v7;
    id v16 = v8;
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v17, (uint64_t)&aBlock);

    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
    id v18 = 0;
    id v19 = 0;
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v25, (uint64_t)v17);
    id v9 = v16;
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v21 = 3321888768;
    id v22 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEE10sync_proxyEv_block_invoke;
    p_aBlock = (void **)&__block_descriptor_64_ea8_32c101_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEEEE_e17_v16__0__NSError_8l;
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v24, (uint64_t)v25);
    id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::~__value_func[abi:ne180100](v24);
    id v11 = std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::~__value_func[abi:ne180100](v25);
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v11, (uint64_t)v17);
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v21 = 3321888768;
    id v22 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEE5replyEv_block_invoke;
    p_aBlock = (void **)&__block_descriptor_64_ea8_32c101_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v24, (uint64_t)v25);
    id v12 = _Block_copy(&aBlock);
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::~__value_func[abi:ne180100](v24);
    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::~__value_func[abi:ne180100](v25);
    [v10 presetStateFor:v6 reply:v12];

    if (a4) {
      *a4 = v18;
    }
    id v13 = v19;
    if (v18) {
      a4 = 0;
    }
    else {
      a4 = (id *)v19;
    }

    std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary<NSString *,objc_object *> * {__strong}> &&)>::~__value_func[abi:ne180100](v17);
  }
  else if (a4)
  {
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *a4 = v14;

    a4 = 0;
  }

  return a4;
}

- (BOOL)deleteUserPreset:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(AUAudioUnit *)self supportsUserPresets])
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v11, *((void **)self + 72));
    id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v11);
    id v8 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v11);
    [v7 deleteUserPreset:v6 reply:v8];

    if (a4) {
      *a4 = v13;
    }
    LOBYTE(a4) = v13 == 0;

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v12);
  }
  else if (a4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *a4 = v9;

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)saveUserPreset:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(AUAudioUnit *)self supportsUserPresets])
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v12, *((void **)self + 72));
    id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v12);
    id v8 = [(AUAudioUnit *)self fullStateForDocument];
    id v9 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v12);
    [v7 saveUserPreset:v6 state:v8 reply:v9];

    if (a4) {
      *a4 = v14;
    }
    LOBYTE(a4) = v14 == 0;

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v13);
  }
  else if (a4)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10850 userInfo:0];
    *a4 = v10;

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void)setCurrentPreset:(id)a3
{
}

- (void)setFullStateForDocument:(id)a3
{
}

- (void)setFullState:(id)a3
{
}

- (void)_setState:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v10 = a3;
  id v8 = a4;
  [(AUAudioUnit_XPC *)self invalidateAllParameters];
  id v9 = +[AUAudioUnitProperty propertyWithKey:v8];
  [(AUAudioUnit_XPC *)self _setValue:v10 forProperty:v9 error:a5];
}

- (void)invalidateAllParameters
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = (void *)*((void *)self + 121);
  if (v2)
  {
    BOOL v3 = objc_msgSend(v2, "allParameters", (void)v7);
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "setLocalValueStale:", 1, (void)v7);
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)disableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v16, *((void **)self + 72));
  id v11 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v16);
  uint64_t v12 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v16);
  [v11 disableProfile:v10 cable:v8 onChannel:v7 reply:v12];

  id v13 = v18;
  id v14 = v13;
  if (v13 && a6) {
    *a6 = v13;
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v17);
  return v14 == 0;
}

- (BOOL)enableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v16, *((void **)self + 72));
  id v11 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v16);
  uint64_t v12 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v16);
  [v11 enableProfile:v10 cable:v8 onChannel:v7 reply:v12];

  id v13 = v18;
  id v14 = v13;
  if (v13 && a6) {
    *a6 = v13;
  }

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v17);
  return v14 == 0;
}

- (id)profileStateForCable:(unsigned __int8)a3 channel:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)*((void *)self + 72);
  aBlock = &unk_1EDFA1068;
  uint64_t v19 = (uint64_t)&v14;
  p_aBlock = &aBlock;
  id v7 = v6;
  id v14 = v7;
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v15, (uint64_t)&aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
  id v16 = 0;
  id v17 = 0;
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v23, (uint64_t)v15);
  id v8 = v14;
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v19 = 3321888768;
  v20 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP18MIDICIProfileStateEE10sync_proxyEv_block_invoke;
  p_aBlock = (void **)&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP18MIDICIProfileStateEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  long long v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  id v10 = std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)v15);
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v19 = 3321888768;
  v20 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP18MIDICIProfileStateEE5replyEv_block_invoke;
  p_aBlock = (void **)&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP18MIDICIProfileStateEEEEEE_e40_v24__0__NSError_8__MIDICIProfileState_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v23);
  id v11 = _Block_copy(&aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::~__value_func[abi:ne180100](v23);
  [v9 profileStateForCable:v5 channel:v4 reply:v11];

  id v12 = v17;
  std::__function::__value_func<void ()(NSError *,std::tuple<MIDICIProfileState * {__strong}> &&)>::~__value_func[abi:ne180100](v15);

  return v12;
}

- (BOOL)providesUserInterface
{
  v2 = [(AUAudioUnit *)self cachedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)selectViewConfiguration:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*((void *)self + 72);
  v8[0] = &unk_1EDF9E4D0;
  v8[1] = &__block_literal_global_213;
  v8[3] = v8;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v9, v5, (uint64_t)v8);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v8);
  id v6 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v9);
  id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v9);
  [v6 selectViewConfiguration:v4 reply:v7];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v10);
}

- (id)supportedViewConfigurations:(id)a3
{
  void v22[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)*((void *)self + 72);
  aBlock = &unk_1EDFA0F48;
  uint64_t v18 = (uint64_t)&v13;
  p_aBlock = &aBlock;
  id v6 = v5;
  id v13 = v6;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v14, (uint64_t)&aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
  id v15 = 0;
  id v16 = 0;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v22, (uint64_t)v14);
  id v7 = v13;
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v18 = 3321888768;
  uint64_t v19 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP10NSIndexSetEE10sync_proxyEv_block_invoke;
  p_aBlock = (void **)&__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP10NSIndexSetEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)v22);
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::~__value_func[abi:ne180100](v21);
  long long v9 = std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)v14);
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v18 = 3321888768;
  uint64_t v19 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP10NSIndexSetEE5replyEv_block_invoke;
  p_aBlock = (void **)&__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP10NSIndexSetEEEEEE_e32_v24__0__NSError_8__NSIndexSet_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)v22);
  id v10 = _Block_copy(&aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::~__value_func[abi:ne180100](v21);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
  [v8 supportedViewConfigurations:v4 reply:v10];

  id v11 = v16;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSIndexSet * {__strong}> &&)>::~__value_func[abi:ne180100](v14);

  return v11;
}

- (id)parametersForOverviewWithCount:(int64_t)a3
{
  void v21[4] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*((void *)self + 72);
  aBlock = &unk_1EDFA1188;
  uint64_t v17 = (uint64_t)&v12;
  p_aBlock = &aBlock;
  id v5 = v4;
  id v12 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)&aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
  id v14 = 0;
  id v15 = 0;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v21, (uint64_t)v13);
  id v6 = v12;
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v17 = 3321888768;
  uint64_t v18 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke;
  p_aBlock = (void **)&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)v21);
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v20);
  id v8 = std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v21);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v8, (uint64_t)v13);
  aBlock = (void *)MEMORY[0x1E4F143A8];
  uint64_t v17 = 3321888768;
  uint64_t v18 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke;
  p_aBlock = (void **)&__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v20, (uint64_t)v21);
  long long v9 = _Block_copy(&aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v20);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v21);
  [v7 parametersForOverviewWithCount:a3 reply:v9];

  id v10 = v15;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::~__value_func[abi:ne180100](v13);

  return v10;
}

- (float)getV2Parameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_message((uint64_t)&v10, *((void **)self + 72));
  id v6 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::sync_proxy(&v10);
  id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},float>::reply((uint64_t)&v10);
  [v6 getParameter:a3 sequenceNumber:v4 reply:v7];

  float v8 = v12;
  std::__function::__value_func<void ()(NSError *,std::tuple<float> &&)>::~__value_func[abi:ne180100](v11);

  return v8;
}

- (id)parameterTree
{
  v35[4] = *MEMORY[0x1E4F143B8];
  v2 = (id *)((char *)self + 968);
  id v3 = (id)*((void *)self + 121);
  if (v3) {
    goto LABEL_2;
  }
  id v6 = (std::mutex *)((char *)self + 760);
  std::mutex::lock((std::mutex *)((char *)self + 760));
  id v4 = *v2;
  if (*v2)
  {
    id v7 = v4;
  }
  else
  {
    float v8 = (void *)*((void *)self + 72);
    id aBlock = &unk_1EDFA1020;
    uint64_t v31 = (uint64_t)&v26;
    p_id aBlock = &aBlock;
    id v9 = v8;
    id v26 = v9;
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v27, (uint64_t)&aBlock);

    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::~__value_func[abi:ne180100](&aBlock);
    id v28 = 0;
    id obj = 0;
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v35, (uint64_t)v27);
    id v10 = v26;
    id aBlock = (id)MEMORY[0x1E4F143A8];
    uint64_t v31 = 3321888768;
    v32 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP15AUParameterTreeEE10sync_proxyEv_block_invoke;
    p_id aBlock = (id *)&__block_descriptor_64_ea8_32c78_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP15AUParameterTreeEEEEEE_e17_v16__0__NSError_8l;
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v34, (uint64_t)v35);
    uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::~__value_func[abi:ne180100](v34);
    float v12 = std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::~__value_func[abi:ne180100](v35);
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v12, (uint64_t)v27);
    id aBlock = (id)MEMORY[0x1E4F143A8];
    uint64_t v31 = 3321888768;
    v32 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJU8__strongP15AUParameterTreeEE5replyEv_block_invoke;
    p_id aBlock = (id *)&__block_descriptor_64_ea8_32c78_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP15AUParameterTreeEEEEEE_e37_v24__0__NSError_8__AUParameterTree_16l;
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v34, (uint64_t)v35);
    uint64_t v13 = _Block_copy(&aBlock);
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::~__value_func[abi:ne180100](v34);
    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::~__value_func[abi:ne180100](v35);
    [(id)v11 getParameterTree:v13];

    objc_storeStrong(v2, obj);
    LOBYTE(v11) = v28 == 0;

    std::__function::__value_func<void ()(NSError *,std::tuple<AUParameterTree * {__strong}> &&)>::~__value_func[abi:ne180100](v27);
    if (v11)
    {
      objc_initWeak(&aBlock, *((id *)self + 72));
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke;
      v24[3] = &unk_1E5687640;
      objc_copyWeak(&v25, &aBlock);
      [*v2 setImplementorValueProvider:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke_2;
      v22[3] = &unk_1E5687668;
      objc_copyWeak(&v23, &aBlock);
      [*v2 setImplementorStringFromValueCallback:v22];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __32__AUAudioUnit_XPC_parameterTree__block_invoke_3;
      v20[3] = &unk_1E5687690;
      objc_copyWeak(&v21, &aBlock);
      [*v2 setImplementorValueFromStringCallback:v20];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __32__AUAudioUnit_XPC_parameterTree__block_invoke_4;
      uint64_t v18 = &unk_1E56876B8;
      objc_copyWeak(&v19, &aBlock);
      [*v2 setImplementorDisplayNameWithLengthCallback:&v15];
      objc_msgSend(*v2, "setRemoteParameterSynchronizerXPCConnection:", *((void *)self + 72), v15, v16, v17, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&aBlock);
      std::mutex::unlock(v6);
      id v3 = *v2;
LABEL_2:
      id v4 = v3;
      goto LABEL_7;
    }
  }
  std::mutex::unlock(v6);
LABEL_7:
  return v4;
}

- (void)propertiesChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v12;
  uint64_t v13 = (std::recursive_mutex *)((char *)self + 584);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    char v14 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = *(unsigned int *)(v9 + 20);
        if (v10)
        {
          uint64_t v11 = [(AUAudioUnit_XPC *)self _getBus:*(unsigned int *)(v9 + 24) scope:v10 error:0];
          [v11 propertyChanged:v9];
        }
        else if ([*(id *)(v9 + 8) isEqualToString:@"inputBusses"])
        {
          char v6 = 1;
        }
        else if ([*(id *)(v9 + 8) isEqualToString:@"outputBusses"])
        {
          char v14 = 1;
        }
        else
        {
          if ([*(id *)(v9 + 8) isEqualToString:@"parameterTree"]) {
            [(AUAudioUnit_XPC *)self _parameterTreeChanged];
          }
          [(AUAudioUnit_XPC *)self willChangeValueForKey:*(void *)(v9 + 8)];
          [(AUAudioUnit_XPC *)self didChangeValueForKey:*(void *)(v9 + 8)];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);

    std::recursive_mutex::unlock(v13);
    if (v6) {
      [(AUAudioUnit_XPC *)self _refreshBusses:1];
    }
    if (v14) {
      [(AUAudioUnit_XPC *)self _refreshBusses:2];
    }
  }
  else
  {

    std::recursive_mutex::unlock(v13);
  }
}

- (id)_getBus:(unsigned int)a3 scope:(unsigned int)a4 error:(id *)a5
{
  if (a4 == 1)
  {
    uint64_t v7 = &OBJC_IVAR___AUAudioUnit_XPC__inputBusses;
LABEL_5:
    id v8 = *(id *)((char *)self + *v7);
    if ([v8 count] > (unint64_t)a3)
    {
      uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:");
      goto LABEL_13;
    }
    if (a5)
    {
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10877 userInfo:0];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a4 == 2)
  {
    uint64_t v7 = &OBJC_IVAR___AUAudioUnit_XPC__outputBusses;
    goto LABEL_5;
  }
  id v8 = 0;
  if (a5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10866 userInfo:0];
LABEL_11:
    uint64_t v9 = 0;
    *a5 = v10;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  void v15[4] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit_XPC *)&v12 removeObserver:a3 forKeyPath:v6];
  if (!*((unsigned char *)self + 754))
  {
    uint64_t v7 = (std::recursive_mutex *)((char *)self + 584);
    std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
    id v8 = +[AUAudioUnitProperty propertyWithKey:v6];
    uint64_t v9 = (void *)*((void *)self + 72);
    v13[0] = &unk_1EDF9E4D0;
    v13[1] = &__block_literal_global_198;
    v13[3] = v13;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v14, v9, (uint64_t)v13);
    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v13);
    uint64_t v10 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v14);
    uint64_t v11 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v14);
    [v10 removePropertyObserver:v8 context:0 reply:v11];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v15);
    std::recursive_mutex::unlock(v7);
  }
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  *((unsigned char *)self + 754) = 1;
  v13.receiver = self;
  v13.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit_XPC *)&v13 removeObserver:a3 forKeyPath:v8 context:a5];
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
  uint64_t v9 = +[AUAudioUnitProperty propertyWithKey:v8];
  uint64_t v10 = (void *)*((void *)self + 72);
  v14[0] = &unk_1EDF9E4D0;
  v14[1] = &__block_literal_global_196;
  v14[3] = v14;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v15, v10, (uint64_t)v14);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v14);
  uint64_t v11 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v15);
  objc_super v12 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v15);
  [v11 removePropertyObserver:v9 context:a5 reply:v12];

  *((unsigned char *)self + 754) = 0;
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v16);

  std::recursive_mutex::unlock((std::recursive_mutex *)((char *)self + 584));
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit_XPC *)&v16 addObserver:a3 forKeyPath:v10 options:a5 context:a6];
  uint64_t v11 = (std::recursive_mutex *)((char *)self + 584);
  std::recursive_mutex::lock((std::recursive_mutex *)((char *)self + 584));
  objc_super v12 = +[AUAudioUnitProperty propertyWithKey:v10];
  objc_super v13 = (void *)*((void *)self + 72);
  v17[0] = &unk_1EDF9E4D0;
  v17[1] = &__block_literal_global_194;
  v17[3] = v17;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v18, v13, (uint64_t)v17);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v17);
  char v14 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v18);
  long long v15 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::reply((uint64_t)&v18);
  [v14 addPropertyObserver:v12 context:a6 reply:v15];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v19);
  std::recursive_mutex::unlock(v11);
}

- (void)_refreshBusses:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void **)caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v21, *((void **)self + 72));
  id v6 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(v5);
  uint64_t v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v21);
  [v6 getBusses:v3 reply:v7];

  id v8 = v23;
  uint64_t v9 = &OBJC_IVAR___AUAudioUnit_XPC__outputBusses;
  if (v3 == 1) {
    uint64_t v9 = &OBJC_IVAR___AUAudioUnit_XPC__inputBusses;
  }
  id v10 = *(id *)((char *)self + *v9);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * v14);
        objc_storeWeak((id *)(v15 + 112), self);
        objc_storeWeak((id *)(v15 + 120), *((id *)self + 72));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  objc_msgSend(v10, "replaceBusses:", v11, (void)v16);
  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v22);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v12, *((void **)self + 72));
  id v8 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v12);
  uint64_t v9 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v12);
  [v8 setValue:v6 forKey:v7 reply:v9];

  id v10 = v14;
  if (v10)
  {
    [(AUAudioUnit_XPC *)self propertiesChanged:v10];
    id v11 = v14;
  }
  else
  {
    id v11 = 0;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v13);
}

- (id)valueForUndefinedKey:(id)a3
{
  v10[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_message(&v9, *((void **)self + 72));
  uint64_t v5 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_proxy(&v9);
  id v6 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::reply((uint64_t)&v9);
  [v5 valueForKey:v4 reply:v6];

  id v7 = (id)v10[5];
  std::__function::__value_func<void ()(NSError *,std::tuple<objc_object * {__strong}> &&)>::~__value_func[abi:ne180100](v10);

  return v7;
}

- (void)_setValue:(id)a3 forProperty:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v13, *((void **)self + 72));
  id v10 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v13);
  id v11 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v13);
  [v10 setValue:v8 forProperty:v9 propagateError:a5 != 0 reply:v11];

  id v12 = v16;
  if (v12) {
    [(AUAudioUnit_XPC *)self propertiesChanged:v12];
  }
  if (a5 && v15) {
    *a5 = v15;
  }

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v14);
}

- (id)_getValueForKey:(id)a3
{
  id v4 = +[AUAudioUnitProperty propertyWithKey:a3];
  uint64_t v5 = [(AUAudioUnit_XPC *)self _getValueForProperty:v4 error:0];

  return v5;
}

- (id)_getValueForProperty:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_message(&v13, *((void **)self + 72));
  id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::sync_proxy(&v13);
  id v8 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},objc_object * {__strong}>::reply((uint64_t)&v13);
  [v7 valueForProperty:v6 propagateError:a4 != 0 reply:v8];

  id v9 = v16;
  id v10 = v9;
  if (a4)
  {
    id v10 = v9;
    if (v15)
    {
      *a4 = v15;
      id v10 = v16;
    }
  }
  id v11 = v9;

  std::__function::__value_func<void ()(NSError *,std::tuple<objc_object * {__strong}> &&)>::~__value_func[abi:ne180100](v14);
  return v11;
}

- (id)internalRenderBlock
{
  [(AUAudioUnit *)self componentDescription];
  char v3 = 1;
  if (v12 <= 1635085669)
  {
    if (v12 == 1635083896 || v12 == 1635084142) {
      goto LABEL_10;
    }
  }
  else if ((v12 - 1635085670) <= 0xF && ((1 << (v12 - 102)) & 0x8009) != 0 || v12 == 1635086188)
  {
    goto LABEL_10;
  }
  char v3 = 0;
LABEL_10:
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__AUAudioUnit_XPC_internalRenderBlock__block_invoke;
  v10[3] = &__block_descriptor_41_e433_i60__0_I8r__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_16I24q28__AudioBufferList_I_1_AudioBuffer_II_v___36r__AURenderEvent__AURenderEventHeader___AURenderEvent_qCC__AUParameterEvent___AURenderEvent_qC_3C_IQf__AUMIDIEvent___AURenderEvent_qCCSC_3C___AUMIDIEventList___AURenderEvent_qCCC_MIDIEventList_iI_1_MIDIEventPacket_QI_64I______44___i___I__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_Iq__AudioBufferList_I_1_AudioBuffer_II_v____52l;
  v10[4] = (char *)self + 888;
  char v11 = v3;
  id v6 = _Block_copy(v10);
  id v7 = _Block_copy(v6);

  return v7;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit *)&v3 reset];
  [(AUAudioUnit_XPC *)self remoteReset];
}

- (void)remoteReset
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)*((void *)self + 72);
  v4[0] = &unk_1EDF9E4D0;
  v4[1] = &__block_literal_global_186;
  v4[3] = v4;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v5, v2, (uint64_t)v4);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v4);
  objc_super v3 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v5);
  [v3 reset:&__block_literal_global_188];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v6);
}

- (void)internalDeallocateRenderResources
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
  AURegistrationServerConnection::WakeExtension((AURegistrationServerConnection *)*(unsigned int *)(v3 + 48), *((_DWORD *)self + 182), 3);
  if (*((unsigned char *)self + 960))
  {
    auoop::RenderPipeUser::~RenderPipeUser((auoop::RenderPipeUser *)((char *)self + 888));
    *(unsigned char *)(v4 + 72) = 0;
  }
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v7, *((void **)self + 72));
  uint64_t v5 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v7);
  [v5 uninitialize:&__block_literal_global_182];

  v6.receiver = self;
  v6.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit *)&v6 internalDeallocateRenderResources];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v8);
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if ([(AUAudioUnit *)self renderResourcesAllocated]) {
    return 1;
  }
  v124 = a3;
  objc_super v6 = [(AUAudioUnit *)self musicalContextBlock];
  id v7 = [(AUAudioUnit *)self transportStateBlock];
  id v8 = [(AUAudioUnit *)self MIDIOutputEventBlock];
  id v9 = [(AUAudioUnit *)self MIDIOutputEventListBlock];
  BOOL v10 = v7 != 0;
  BOOL v11 = v8 != 0;
  BOOL v12 = v9 != 0;

  uint64_t v13 = (void *)*((void *)self + 72);
  id aBlock = &unk_1EDFA1338;
  *(void *)&long long v137 = v144;
  *(void *)&long long v138 = &aBlock;
  id v14 = v13;
  *(void *)v144 = v14;
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::__value_func[abi:ne180100]((uint64_t)&v144[8], (uint64_t)&aBlock);

  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100](&aBlock);
  int v148 = 0;
  long long v146 = 0u;
  memset(v147, 0, sizeof(v147));
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::__value_func[abi:ne180100]((uint64_t)&v130, (uint64_t)&v144[8]);
  id v15 = *(void **)v144;
  id aBlock = (void *)MEMORY[0x1E4F143A8];
  *(void *)&long long v137 = 3321888768;
  *((void *)&v137 + 1) = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJmmmU8__strongP6NSDatabjEE10sync_proxyEv_block_invoke;
  *(void *)&long long v138 = &__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJmmmU8__strongP6NSDatabjEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::__value_func[abi:ne180100]((uint64_t)&v138 + 8, (uint64_t)&v130);
  id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:&aBlock];
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100]((void *)&v138 + 1);
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100](&v130);
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::__value_func[abi:ne180100]((uint64_t)&v130, (uint64_t)&v144[8]);
  id aBlock = (void *)MEMORY[0x1E4F143A8];
  *(void *)&long long v137 = 3321888768;
  *((void *)&v137 + 1) = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJmmmU8__strongP6NSDatabjEE5replyEv_block_invoke;
  *(void *)&long long v138 = &__block_descriptor_64_ea8_32c73_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJmmmU8__strongP6NSDatabjEEEEEE_e43_v56__0__NSError_8Q16Q24Q32__NSData_40B48I52l;
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::__value_func[abi:ne180100]((uint64_t)&v138 + 8, (uint64_t)&v130);
  uint64_t v17 = _Block_copy(&aBlock);
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100]((void *)&v138 + 1);
  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100](&v130);
  [v16 initialize:(v6 != 0) | (unint64_t)(2 * v10) | (4 * v11) | (8 * v12) reply:v17];

  unsigned int v18 = DWORD2(v146);
  unsigned int v19 = *(_DWORD *)v147;
  uint64_t v20 = *(void *)&v147[8];
  id v21 = *(id *)&v147[16];
  int v22 = v148;
  id v23 = (id)v146;
  if (v23)
  {
    uint64_t v24 = v23;
    if (v124) {
      id *v124 = v23;
    }
    [(AUAudioUnit *)self setRenderResourcesAllocated:0];

    std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100](&v144[8]);
    BOOL v5 = 0;
    goto LABEL_152;
  }
  id v123 = v21;

  std::__function::__value_func<void ()(NSError *,std::tuple<unsigned long,unsigned long,unsigned long,NSData * {__strong},BOOL,unsigned int> &&)>::~__value_func[abi:ne180100](&v144[8]);
  if (v20 <= 0)
  {
    if (v124)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10875 userInfo:0];
      BOOL v5 = 0;
      id *v124 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_151;
    }
    goto LABEL_13;
  }
  v126.receiver = self;
  v126.super_class = (Class)AUAudioUnit_XPC;
  if (![(AUAudioUnit *)&v126 allocateRenderResourcesAndReturnError:v124])
  {
LABEL_13:
    BOOL v5 = 0;
    goto LABEL_151;
  }
  id v121 = v21;
  id v25 = (const void *)[v121 bytes];
  unint64_t v26 = [v121 length];
  if (v26 >= 0x28)
  {
    unint64_t v28 = v26 / 0x28;
    v27 = std::__allocate_at_least[abi:ne180100]<std::allocator<ISOLoudnessInfo>>(v26 / 0x28);
    memmove(v27, v25, 40 * v28);
  }
  else
  {
    v27 = 0;
  }
  __p = v27;
  unsigned int v29 = [(AUAudioUnit *)self MIDIOutputBufferSizeHint];
  id v30 = v121;
  LOBYTE(aBlock) = 1;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v31 = v30;
  id v140 = v31;
  double v141 = 0.0;
  unsigned int v142 = v18;
  unsigned int v143 = v29;
  if ((AUOOPRenderingClient::NeverTimesOut((AUOOPRenderingClient *)v31) & 1) == 0) {
    LOBYTE(aBlock) = 0;
  }
  [v31 bytes];
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(40 * ([v31 length] / 0x28uLL)) >> 3) != v20 + v19) {
    std::terminate();
  }
  uint64_t v32 = [v31 bytes];
  unint64_t v33 = [v31 length];
  if (40 * (v33 / 0x28))
  {
    unsigned int v36 = 0;
    double v37 = 0.0;
    unint64_t v38 = v32 + 40 * (v33 / 0x28);
    while (1)
    {
      if (v36 == v19) {
        double v141 = *(double *)v32;
      }
      if (*(_DWORD *)(v32 + 8) == 1819304813 && *(_DWORD *)(v32 + 20) == 1)
      {
        unsigned int v39 = *(_DWORD *)(v32 + 24);
        if (v39 == *(_DWORD *)(v32 + 16))
        {
          unsigned int v40 = *(_DWORD *)(v32 + 32);
          if (v39 >= v40 >> 3)
          {
            unsigned int v41 = *(_DWORD *)(v32 + 28);
            if (v41)
            {
              unsigned int v42 = *(_DWORD *)(v32 + 12);
              if ((v42 & 0x20) != 0 || (BOOL v45 = v39 == v39 / v41 * v41, v39 /= v41, v45))
              {
                int v43 = 0;
                if ((v42 & 2) != 0 || 8 * v39 != v40) {
                  goto LABEL_52;
                }
                if ((v42 & 1) == 0)
                {
                  if ((v42 & 4) != 0)
                  {
                    int v44 = (v42 >> 7) & 0x3F;
                    if (v44 == 24 && v39 == 4)
                    {
                      int v43 = 3;
                    }
                    else if (v44 || v39 != 4)
                    {
                      BOOL v45 = v39 == 2 && v44 == 0;
                      if (v45) {
                        int v43 = 2;
                      }
                      else {
                        int v43 = 0;
                      }
                    }
                    else
                    {
                      int v43 = 5;
                    }
                  }
                  else
                  {
                    int v43 = 0;
                  }
LABEL_52:
                  BOOL v46 = (*(_DWORD *)(v32 + 12) & 0x20) == 0;
                  if (v36 >= v19)
                  {
                    uint64_t v49 = v139;
                    if ((unint64_t)v139 >= *((void *)&v139 + 1))
                    {
                      BOOL v113 = (*(_DWORD *)(v32 + 12) & 0x20) == 0;
                      int v116 = v43;
                      id v119 = v31;
                      uint64_t v55 = *((void *)&v138 + 1);
                      unint64_t v110 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v139 - *((void *)&v138 + 1)) >> 2);
                      unint64_t v56 = v110 + 1;
                      if (v110 + 1 > 0x1555555555555555) {
LABEL_157:
                      }
                        std::vector<float>::__throw_length_error[abi:ne180100]();
                      if (0x5555555555555556 * ((uint64_t)(*((void *)&v139 + 1) - *((void *)&v138 + 1)) >> 2) > v56) {
                        unint64_t v56 = 0x5555555555555556 * ((uint64_t)(*((void *)&v139 + 1) - *((void *)&v138 + 1)) >> 2);
                      }
                      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v139 + 1) - *((void *)&v138 + 1)) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
                        unint64_t v57 = 0x1555555555555555;
                      }
                      else {
                        unint64_t v57 = v56;
                      }
                      if (v57) {
                        unint64_t v57 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<auoop::RenderPipeConfig::CompactFormat>>(v57);
                      }
                      else {
                        uint64_t v58 = 0;
                      }
                      unint64_t v63 = v57 + 12 * v110;
                      *(_DWORD *)unint64_t v63 = v116;
                      *(_DWORD *)(v63 + 4) = v41;
                      *(unsigned char *)(v63 + 8) = v113;
                      *(_WORD *)(v63 + 9) = 0;
                      *(unsigned char *)(v63 + 11) = 0;
                      unint64_t v64 = v63;
                      if (v49 != v55)
                      {
                        do
                        {
                          uint64_t v65 = *(void *)(v49 - 12);
                          v49 -= 12;
                          int v66 = *(_DWORD *)(v49 + 8);
                          *(void *)(v64 - 12) = v65;
                          v64 -= 12;
                          *(_DWORD *)(v64 + 8) = v66;
                        }
                        while (v49 != v55);
                        uint64_t v49 = *((void *)&v138 + 1);
                      }
                      unint64_t v50 = v63 + 12;
                      *((void *)&v138 + 1) = v64;
                      *((void *)&v139 + 1) = v57 + 12 * v58;
                      id v31 = v119;
                      if (v49) {
                        operator delete((void *)v49);
                      }
                    }
                    else
                    {
                      *(_DWORD *)long long v139 = v43;
                      *(_DWORD *)(v49 + 4) = v41;
                      *(unsigned char *)(v49 + 8) = v46;
                      *(_WORD *)(v49 + 9) = 0;
                      unint64_t v50 = v49 + 12;
                      *(unsigned char *)(v49 + 11) = 0;
                    }
                    *(void *)&long long v139 = v50;
                  }
                  else
                  {
                    uint64_t v47 = *((void *)&v137 + 1);
                    if (*((void *)&v137 + 1) >= (unint64_t)v138)
                    {
                      BOOL v112 = (*(_DWORD *)(v32 + 12) & 0x20) == 0;
                      int v115 = v43;
                      id v118 = v31;
                      uint64_t v51 = v137;
                      unint64_t v109 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v137 + 1) - v137) >> 2);
                      unint64_t v52 = v109 + 1;
                      if (v109 + 1 > 0x1555555555555555) {
                        goto LABEL_157;
                      }
                      if (0x5555555555555556 * ((uint64_t)(v138 - v137) >> 2) > v52) {
                        unint64_t v52 = 0x5555555555555556 * ((uint64_t)(v138 - v137) >> 2);
                      }
                      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v138 - v137) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
                        unint64_t v53 = 0x1555555555555555;
                      }
                      else {
                        unint64_t v53 = v52;
                      }
                      if (v53) {
                        unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<auoop::RenderPipeConfig::CompactFormat>>(v53);
                      }
                      else {
                        uint64_t v54 = 0;
                      }
                      unint64_t v59 = v53 + 12 * v109;
                      *(_DWORD *)unint64_t v59 = v115;
                      *(_DWORD *)(v59 + 4) = v41;
                      *(unsigned char *)(v59 + 8) = v112;
                      *(_WORD *)(v59 + 9) = 0;
                      *(unsigned char *)(v59 + 11) = 0;
                      unint64_t v60 = v59;
                      if (v47 != v51)
                      {
                        do
                        {
                          uint64_t v61 = *(void *)(v47 - 12);
                          v47 -= 12;
                          int v62 = *(_DWORD *)(v47 + 8);
                          *(void *)(v60 - 12) = v61;
                          v60 -= 12;
                          *(_DWORD *)(v60 + 8) = v62;
                        }
                        while (v47 != v51);
                        uint64_t v47 = v137;
                      }
                      unint64_t v48 = v59 + 12;
                      *(void *)&long long v137 = v60;
                      *(void *)&long long v138 = v53 + 12 * v54;
                      id v31 = v118;
                      if (v47) {
                        operator delete((void *)v47);
                      }
                    }
                    else
                    {
                      **((_DWORD **)&v137 + 1) = v43;
                      *(_DWORD *)(v47 + 4) = v41;
                      *(unsigned char *)(v47 + 8) = v46;
                      *(_WORD *)(v47 + 9) = 0;
                      unint64_t v48 = v47 + 12;
                      *(unsigned char *)(v47 + 11) = 0;
                    }
                    *((void *)&v137 + 1) = v48;
                  }
                  goto LABEL_87;
                }
                if ((v42 & 0x1F84) == 0)
                {
                  if (v39 == 4) {
                    int v43 = 1;
                  }
                  else {
                    int v43 = 4 * (v39 == 8);
                  }
                  goto LABEL_52;
                }
              }
            }
          }
        }
      }
LABEL_87:
      if (v37 == 0.0)
      {
        double v37 = *(double *)v32;
      }
      else if (*(double *)v32 != v37)
      {
        LOBYTE(aBlock) = 0;
      }
      ++v36;
      v32 += 40;
      if (v32 == v38)
      {
        uint64_t v34 = *((void *)&v138 + 1);
        uint64_t v35 = v139;
        goto LABEL_93;
      }
    }
  }
  uint64_t v34 = 0;
  uint64_t v35 = 0;
LABEL_93:
  if (0xAAAAAAAAAAAAAAABLL * ((v35 - v34) >> 2) > 1) {
    LOBYTE(aBlock) = 0;
  }

  v67 = (void *)*((void *)self + 72);
  id v111 = [(AUAudioUnit *)self musicalContextBlock];
  id v108 = [(AUAudioUnit *)self transportStateBlock];
  id v107 = [(AUAudioUnit *)self MIDIOutputEventBlock];
  id v106 = [(AUAudioUnit *)self MIDIOutputEventListBlock];
  BOOL v105 = [(AUAudioUnit *)self isRenderingOffline];
  [(AUAudioUnit *)self componentDescription];
  BOOL v104 = *(_DWORD *)v144 == 1635085673;
  uint64_t v68 = *((void *)self + 109);
  std::recursive_mutex::lock((std::recursive_mutex *)v68);
  uint64_t v120 = v68 + 64;
  v69 = *(uint64_t **)(v68 + 80);
  v70 = *(uint64_t **)(v68 + 88);
  v122 = (std::recursive_mutex *)v68;
  if (v69 == v70) {
LABEL_115:
  }
    operator new();
  while (1)
  {
    uint64_t v71 = *v69;
    if (*(unsigned char *)(*v69 + 8))
    {
      uint64_t v73 = *(void *)(v71 + 16);
      uint64_t v72 = *(void *)(v71 + 24);
      if (v72 - v73 == *((void *)&v137 + 1) - (void)v137)
      {
        if (v73 != v72)
        {
          uint64_t v74 = v137;
          while (*(_DWORD *)v73 == *(_DWORD *)v74
               && *(_DWORD *)(v73 + 4) == *(_DWORD *)(v74 + 4)
               && *(unsigned __int8 *)(v73 + 8) == *(unsigned __int8 *)(v74 + 8))
          {
            v73 += 12;
            v74 += 12;
            if (v73 == v72) {
              goto LABEL_104;
            }
          }
          goto LABEL_114;
        }
LABEL_104:
        uint64_t v76 = *(void *)(v71 + 40);
        uint64_t v75 = *(void *)(v71 + 48);
        if (v75 - v76 == v35 - v34)
        {
          if (v76 != v75)
          {
            uint64_t v77 = v34;
            while (*(_DWORD *)v76 == *(_DWORD *)v77
                 && *(_DWORD *)(v76 + 4) == *(_DWORD *)(v77 + 4)
                 && *(unsigned __int8 *)(v76 + 8) == *(unsigned __int8 *)(v77 + 8))
            {
              v76 += 12;
              v77 += 12;
              if (v76 == v75) {
                goto LABEL_111;
              }
            }
            goto LABEL_114;
          }
LABEL_111:
          if (*(double *)(v71 + 72) == v141 && *(_DWORD *)(v71 + 80) >= v142 && *(_DWORD *)(v71 + 84) >= v143) {
            break;
          }
        }
      }
    }
LABEL_114:
    if (++v69 == v70) {
      goto LABEL_115;
    }
  }
  if (v69 == v70) {
    goto LABEL_115;
  }
  uint64_t v78 = *v69;
  id v79 = v67;
  v80 = v79;
  int v81 = *(_DWORD *)(v78 + 88);
  int v82 = *(_DWORD *)(v78 + 92);
  *(_DWORD *)(v78 + 88) = v81 + 1;
  if (*(_DWORD *)(v78 + 96) > v81) {
    int v83 = v81 + 1;
  }
  else {
    int v83 = *(_DWORD *)(v78 + 96);
  }
  id v114 = v79;
  if (v82 < v83)
  {
    while (1)
    {
      uint64_t v85 = *(void *)(v78 + 120);
      uint64_t v84 = *(void *)(v78 + 128);
      while (v85 != v84)
      {
        if (!*(void *)(v85 + 8) && (atomic_exchange((atomic_uchar *volatile)v85, 1u) & 1) == 0)
        {
          *(void *)(v85 + 24) = pthread_self();
          uint64_t v86 = [*(id *)(v78 + 64) bytes];
          unint64_t v87 = [*(id *)(v78 + 64) length];
          uint64_t v127 = v86;
          unint64_t v128 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(40 * (v87 / 0x28)) >> 3);
          uint64_t v129 = *(void *)(v78 + 80);
          v80;
          operator new();
        }
        v85 += 32;
      }
    }
  }

  uint64_t v88 = [*(id *)&v122[2].__m_.__opaque[48] count];
  v89 = (auoop *)[*(id *)&v122[2].__m_.__opaque[48] addObject:v114];
  if (!v88)
  {
    uint64_t v90 = auoop::gWorkgroupManager(v89);
    v91 = (os_unfair_lock_s **)&v122[1].__m_.__opaque[32];
    if (v122[2].__m_.__opaque[40])
    {
      auoop::WorkgroupPropagator::~WorkgroupPropagator(v91);
      v122[2].__m_.__opaque[40] = 0;
    }
    *(void *)v144 = &unk_1EDFA0DE0;
    *(void *)&v144[8] = v120;
    *(void *)&v144[24] = v144;
    auoop::WorkgroupPropagator::WorkgroupPropagator((uint64_t)v91, v90, (uint64_t)v144);
    std::__function::__value_func<void ()(applesauce::xpc::dict const&)>::~__value_func[abi:ne180100](v144);
    v122[2].__m_.__opaque[40] = 1;
  }
  *(void *)&v144[16] = v114;
  *(void *)&v144[24] = v111;
  id v145 = v108;
  *(void *)&long long v146 = v107;
  *((void *)&v146 + 1) = v106;
  *(_DWORD *)v147 = v22;
  v147[4] = v105;
  v147[5] = v104;
  *(_WORD *)&v147[6] = v125;
  v147[8] = 0;
  *(void *)v144 = 0;
  *(void *)&v144[8] = self;
  id v130 = (id)v78;
  *(void *)&long long v131 = self;
  *((void *)&v131 + 1) = v114;
  *(void *)&long long v132 = v111;
  *((void *)&v132 + 1) = v108;
  *(void *)v133 = v107;
  *(void *)&v133[8] = v106;
  *(_DWORD *)&v133[16] = v22;
  v133[20] = v105;
  v133[21] = v104;
  *(_WORD *)&v133[22] = v125;
  char v134 = 0;
  char v135 = 1;
  auoop::RenderPipeUser::~RenderPipeUser((auoop::RenderPipeUser *)v144);
  std::recursive_mutex::unlock(v122);
  BOOL v5 = v135 != 0;
  if (v135)
  {
    v92 = (void **)((char *)self + 888);
    if (*((unsigned char *)self + 960))
    {
      v93 = *v92;
      id v94 = v130;
      long long v95 = v132;
      *((_OWORD *)self + 56) = v131;
      *((_OWORD *)self + 57) = v95;
      *((_OWORD *)self + 58) = *(_OWORD *)v133;
      *(void *)((char *)self + 942) = *(void *)&v133[14];
    }
    else
    {
      v93 = 0;
      id v94 = v130;
      long long v98 = v132;
      *((_OWORD *)self + 56) = v131;
      *((_OWORD *)self + 57) = v98;
      *((_OWORD *)self + 58) = *(_OWORD *)v133;
      *((void *)self + 118) = *(void *)&v133[16];
      *((unsigned char *)self + 952) = 0;
      *((unsigned char *)self + 960) = 1;
    }
    id v130 = v93;
    *v92 = v94;
    uint64_t v99 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
    AURegistrationServerConnection::WakeExtension((AURegistrationServerConnection *)*(unsigned int *)(v99 + 48), *((_DWORD *)self + 182), 2);
    goto LABEL_145;
  }
  id v96 = v130;
  if (!kAUExtensionScope)
  {
    id v97 = (id)MEMORY[0x1E4F14500];
    id v100 = MEMORY[0x1E4F14500];
    goto LABEL_139;
  }
  id v97 = *(id *)kAUExtensionScope;
  if (v97)
  {
LABEL_139:
    v101 = v97;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      v102 = [v96 description];
      *(_DWORD *)v144 = 136315650;
      *(void *)&v144[4] = "AUAudioUnit_XPC.mm";
      *(_WORD *)&v144[12] = 1024;
      *(_DWORD *)&v144[14] = 812;
      *(_WORD *)&v144[18] = 2112;
      *(void *)&v144[20] = v102;
      _os_log_impl(&dword_18FEC0000, v101, OS_LOG_TYPE_ERROR, "%25s:%-5d render pipe user creation failure (%@)", v144, 0x1Cu);
    }
  }
  if (v124) {
    id *v124 = v96;
  }
  [(AUAudioUnit *)self deallocateRenderResources];

LABEL_145:
  caulk::__expected_detail::base<auoop::RenderPipeUser,NSError * {__strong}>::~base((auoop::RenderPipeUser *)&v130);

  if (*((void *)&v138 + 1)) {
    operator delete(*((void **)&v138 + 1));
  }
  if ((void)v137) {
    operator delete((void *)v137);
  }
  if (__p) {
    operator delete(__p);
  }
LABEL_151:
  id v21 = v123;
LABEL_152:

  return v5;
}

- (void)setTransportStateBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit *)&v8 setTransportStateBlock:v4];
  BOOL v5 = (char *)self + 888;
  if (*((unsigned char *)self + 960))
  {
    objc_super v6 = [(AUAudioUnit *)self musicalContextBlock];
    id v7 = [(AUAudioUnit *)self transportStateBlock];
    auoop::RenderPipeUser::setV3HostCallbacks((uint64_t)v5, v6, v7);
  }
}

- (void)setMusicalContextBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit *)&v8 setMusicalContextBlock:v4];
  BOOL v5 = (char *)self + 888;
  if (*((unsigned char *)self + 960))
  {
    objc_super v6 = [(AUAudioUnit *)self musicalContextBlock];
    id v7 = [(AUAudioUnit *)self transportStateBlock];
    auoop::RenderPipeUser::setV3HostCallbacks((uint64_t)v5, v6, v7);
  }
}

- (BOOL)_setBusCount:(unint64_t)a3 scope:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v16, *((void **)self + 72));
  id v9 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v16);
  BOOL v10 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v16);
  [v9 setBusCount:a3 scope:v6 reply:v10];

  id v11 = v19;
  id v12 = v18;
  uint64_t v13 = v12;
  if (a5) {
    *a5 = v12;
  }
  if (v11) {
    [(AUAudioUnit_XPC *)self propertiesChanged:v11];
  }
  id v14 = v13;

  std::__function::__value_func<void ()(NSError *,std::tuple<NSArray * {__strong}> &&)>::~__value_func[abi:ne180100](v17);
  return v14 == 0;
}

- (id)outputBusses
{
  if ([(AUAudioUnit_XPC *)self isLocalCachingDisabled]) {
    [(AUAudioUnit_XPC *)self _refreshBusses:2];
  }
  uint64_t v3 = (void *)*((void *)self + 104);
  return v3;
}

- (id)inputBusses
{
  if ([(AUAudioUnit_XPC *)self isLocalCachingDisabled]) {
    [(AUAudioUnit_XPC *)self _refreshBusses:1];
  }
  uint64_t v3 = (void *)*((void *)self + 103);
  return v3;
}

- (void)_parameterTreeChanged
{
  uint64_t v3 = (void *)*((void *)self + 121);
  if (v3)
  {
    [v3 setRemoteParameterSynchronizerXPCConnection:0];
    id v4 = (void *)*((void *)self + 121);
    *((void *)self + 121) = 0;
  }
}

- (void)dealloc
{
  v12[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)*((void *)self + 93);
  *((void *)self + 93) = 0;

  id v4 = (void *)*((void *)self + 121);
  if (v4)
  {
    [v4 setRemoteParameterSynchronizerXPCConnection:*((void *)self + 72)];
    BOOL v5 = (void *)*((void *)self + 121);
    *((void *)self + 121) = 0;
  }
  uint64_t v6 = (void *)*((void *)self + 72);
  if (v6)
  {
    caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_message(&v11, v6);
    id v7 = caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::sync_proxy(&v11);
    [v7 close:&__block_literal_global_172];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v12);
  }
  objc_super v8 = (void *)*((void *)self + 103);
  *((void *)self + 103) = 0;

  id v9 = (void *)*((void *)self + 104);
  *((void *)self + 104) = 0;

  v10.receiver = self;
  v10.super_class = (Class)AUAudioUnit_XPC;
  [(AUAudioUnit *)&v10 dealloc];
}

- (void)didCrash:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  [(AUAudioUnit_XPC *)self _invalidatePipePoolAndUser];
  val = self;
  id v4 = [(AUAudioUnit_XPC *)self _getInvalidationNotificationInfo];
  BOOL v5 = (void *)[v4 mutableCopy];

  uint64_t v20 = v5;
  if (v21)
  {
    uint64_t v6 = [v21 valueForKey:@"Path"];
    uint64_t v17 = v6;
    if (v6) {
      objc_msgSend(v5, "setObject:forKey:", v6, @"Executable Path", v6);
    }
    objc_msgSend(v5, "valueForKey:", @"Descriptions", v17);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      objc_super v10 = (void *)MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) getValue:&v26];
          if (kAUExtensionScope)
          {
            id v12 = *(id *)kAUExtensionScope;
            if (!v12) {
              continue;
            }
          }
          else
          {
            id v13 = v10;
            id v12 = v10;
          }
          id v14 = v12;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            CAFormatter::CAFormatter((CAFormatter *)&v25, &v26);
            *(_DWORD *)buf = 136315650;
            uint64_t v32 = "AUAudioUnit_XPC.mm";
            __int16 v33 = 1024;
            int v34 = 632;
            __int16 v35 = 2080;
            unsigned int v36 = v25;
            _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Crashed AU possible component description: %s", buf, 0x1Cu);
            if (v25) {
              free(v25);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v8);
    }
  }
  objc_initWeak((id *)buf, val);
  id v15 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __28__AUAudioUnit_XPC_didCrash___block_invoke;
  block[3] = &unk_1EDF8AAA0;
  objc_copyWeak(&v24, (id *)buf);
  id v23 = v20;
  id v16 = v20;
  dispatch_async(v15, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)didInvalidate
{
  [(AUAudioUnit_XPC *)self _invalidatePipePoolAndUser];
  uint64_t v3 = [(AUAudioUnit_XPC *)self _getInvalidationNotificationInfo];
  objc_initWeak(&location, self);
  if (*((void *)self + 93)) {
    int64_t v4 = 10000000000;
  }
  else {
    int64_t v4 = 0;
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __32__AUAudioUnit_XPC_didInvalidate__block_invoke;
  block[3] = &unk_1EDF8AAA0;
  objc_copyWeak(&v10, &location);
  id v9 = v3;
  id v7 = v3;
  dispatch_after(v5, v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)_getInvalidationNotificationInfo
{
  void v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"audioUnit";
  uint64_t v3 = [MEMORY[0x1E4F29238] valueWithPointer:*((void *)self + 90)];
  v12[0] = v3;
  v11[1] = @"AUAudioUnit";
  int64_t v4 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  v12[1] = v4;
  v11[2] = @"Service PID";
  dispatch_time_t v5 = [MEMORY[0x1E4F28ED0] numberWithInt:*((unsigned int *)self + 182)];
  v12[2] = v5;
  v11[3] = @"Host PID";
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  v12[3] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)_invalidatePipePoolAndUser
{
  v2 = (char *)self + 888;
  if (*((unsigned char *)self + 960)) {
    atomic_store(1u, (unsigned __int8 *)self + 952);
  }
  objc_initWeak(&location, self);
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AUAudioUnit_XPC__invalidatePipePoolAndUser__block_invoke;
  block[3] = &unk_1E5688AC0;
  objc_copyWeak(v5, &location);
  v5[1] = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (void)_doOpen:(id)a3 completion:(id)a4
{
  v116[4] = *MEMORY[0x1E4F143B8];
  id v85 = a3;
  uint64_t v86 = (void (**)(id, id))a4;
  id v7 = (id *)((char *)self + 576);
  objc_storeStrong((id *)self + 72, a3);
  if (_os_feature_enabled_impl())
  {
    objc_initWeak(&location, self);
    {
      _ZGRZ38__AUAudioUnit_XPC__doOpen_completion__E23crashHandlerDisableList_[0] = (uint64_t)operator new(0x20uLL);
      unk_1E9299328 = xmmword_1901C60F0;
      strcpy((char *)_ZGRZ38__AUAudioUnit_XPC__doOpen_completion__E23crashHandlerDisableList_[0], "com.apple.audio.SandboxHelper");
      qword_1E9299338 = (uint64_t)operator new(0x20uLL);
      xmmword_1E9299340 = xmmword_1901C6100;
      strcpy((char *)qword_1E9299338, "com.apple.audio.InfoHelper");
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor, 0, &dword_18FEC0000);
      -[AUAudioUnit_XPC _doOpen:completion:]::crashHandlerDisableList = (uint64_t)_ZGRZ38__AUAudioUnit_XPC__doOpen_completion__E23crashHandlerDisableList_;
      qword_1E9299310 = 2;
    }
    uint64_t v8 = (char *)getprogname();
    std::string::basic_string[abi:ne180100]<0>(&v102, v8);
    id v9 = (char *)getprogname();
    std::string::basic_string[abi:ne180100]<0>(__p, v9);
    unsigned __int8 v10 = v99;
    if (qword_1E9299310)
    {
      uint64_t v11 = -[AUAudioUnit_XPC _doOpen:completion:]::crashHandlerDisableList;
      uint64_t v12 = -[AUAudioUnit_XPC _doOpen:completion:]::crashHandlerDisableList + 24 * qword_1E9299310;
      if ((v99 & 0x80u) == 0) {
        unint64_t v13 = v99;
      }
      else {
        unint64_t v13 = (unint64_t)__p[1];
      }
      if ((v99 & 0x80u) == 0) {
        id v14 = __p;
      }
      else {
        id v14 = (void **)__p[0];
      }
      do
      {
        uint64_t v15 = *(unsigned __int8 *)(v11 + 23);
        if ((v15 & 0x80u) == 0) {
          id v16 = (void *)*(unsigned __int8 *)(v11 + 23);
        }
        else {
          id v16 = *(void **)(v11 + 8);
        }
        if (v16 == (void *)v13)
        {
          if ((v15 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)v11, v14, *(void *)(v11 + 8)))
            {
LABEL_24:
              char v18 = 1;
              if ((v10 & 0x80) == 0)
              {
LABEL_25:
                if (v18)
                {
LABEL_29:
                  if (v104 < 0) {
                    operator delete(v102);
                  }
                  objc_destroyWeak(&location);
                  goto LABEL_32;
                }
LABEL_28:
                id v19 = [AUCrashHandler alloc];
                uint64_t v20 = [(AUAudioUnit_XPC *)self XPCListenerEndpoint];
                v96[0] = MEMORY[0x1E4F143A8];
                v96[1] = 3321888768;
                v96[2] = __38__AUAudioUnit_XPC__doOpen_completion___block_invoke;
                v96[3] = &__block_descriptor_40_ea8_32c40_ZTSN5caulk8weak_refI15AUAudioUnit_XPCEE_e22_v16__0__NSDictionary_8l;
                objc_copyWeak(&v97, &location);
                uint64_t v21 = [(AUCrashHandler *)v19 initWithEndpoint:v20 withCrashBlock:v96];
                int v22 = (void *)*((void *)self + 93);
                *((void *)self + 93) = v21;

                objc_destroyWeak(&v97);
                goto LABEL_29;
              }
LABEL_27:
              operator delete(__p[0]);
              if (v18) {
                goto LABEL_29;
              }
              goto LABEL_28;
            }
          }
          else
          {
            if (!*(unsigned char *)(v11 + 23)) {
              goto LABEL_24;
            }
            uint64_t v17 = 0;
            while (*(unsigned __int8 *)(v11 + v17) == *((unsigned __int8 *)v14 + v17))
            {
              if (v15 == ++v17) {
                goto LABEL_24;
              }
            }
          }
        }
        v11 += 24;
      }
      while (v11 != v12);
    }
    char v18 = 0;
    if ((v10 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_27;
  }
LABEL_32:
  id v23 = *v7;
  id location = &unk_1EDFA1260;
  uint64_t v112 = (uint64_t)&v102;
  p_id location = &location;
  id v24 = v23;
  v102 = v24;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::__value_func[abi:ne180100]((uint64_t)&v103, (uint64_t)&location);

  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::~__value_func[abi:ne180100](&location);
  id v105 = 0;
  __int16 v106 = 0;
  id v108 = 0;
  id v107 = 0;
  __int16 v109 = 0;
  memset(v110, 0, sizeof(v110));
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::__value_func[abi:ne180100]((uint64_t)v116, (uint64_t)&v103);
  id v25 = v102;
  id location = (id)MEMORY[0x1E4F143A8];
  uint64_t v112 = 3321888768;
  BOOL v113 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJbbU8__strongP7NSArrayS7_bbimmEE10sync_proxyEv_block_invoke;
  p_id location = (id *)&__block_descriptor_64_ea8_32c79_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbbU8__strongP7NSArrayS6_bbimmEEEEEE_e17_v16__0__NSError_8l;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::__value_func[abi:ne180100]((uint64_t)v115, (uint64_t)v116);
  AudioComponentDescription v26 = [v25 synchronousRemoteObjectProxyWithErrorHandler:&location];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::~__value_func[abi:ne180100](v115);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::~__value_func[abi:ne180100](v116);
  [(AUAudioUnit *)self componentDescription];
  long long v27 = [(AUAudioUnit_XPC *)self auInstanceUUID];
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::__value_func[abi:ne180100]((uint64_t)v116, (uint64_t)&v103);
  id location = (id)MEMORY[0x1E4F143A8];
  uint64_t v112 = 3321888768;
  BOOL v113 = ___ZN5caulk3xpc7messageIU8__strongPU33objcproto22AUAudioUnitXPCProtocol11objc_objectJbbU8__strongP7NSArrayS7_bbimmEE5replyEv_block_invoke;
  p_id location = (id *)&__block_descriptor_64_ea8_32c79_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbbU8__strongP7NSArrayS6_bbimmEEEEEE_e62_v68__0__NSError_8B16B20__NSArray_24__NSArray_32B40B44i48Q52Q60l;
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::__value_func[abi:ne180100]((uint64_t)v115, (uint64_t)v116);
  long long v28 = _Block_copy(&location);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::~__value_func[abi:ne180100](v115);
  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::~__value_func[abi:ne180100](v116);
  [v26 open:v95 instanceUUID:v27 reply:v28];

  id v29 = v105;
  if (v29)
  {
    v86[2](v86, v29);
    goto LABEL_111;
  }
  *((_WORD *)self + 376) = v106;
  id v83 = v107;
  id v84 = v108;
  int v30 = v109;
  int v31 = HIBYTE(v109);
  *((_DWORD *)self + 182) = v110[0];
  *(int32x2_t *)((char *)self + 732) = vmovn_s64(*(int64x2_t *)&v110[1]);
  uint64_t v32 = [[AUAudioUnitBusArray_XPC alloc] initWithOwner:self scope:1 busses:v83 countWritable:v30 != 0];
  __int16 v33 = (void *)*((void *)self + 103);
  *((void *)self + 103) = v32;

  int v34 = [[AUAudioUnitBusArray_XPC alloc] initWithOwner:self scope:2 busses:v84 countWritable:v31 != 0];
  __int16 v35 = (void *)*((void *)self + 104);
  *((void *)self + 104) = v34;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v36 = *((id *)self + 103);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v91 objects:v101 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v92 != v38) {
          objc_enumerationMutation(v36);
        }
        uint64_t v40 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        objc_storeWeak((id *)(v40 + 112), self);
        objc_storeWeak((id *)(v40 + 120), *v7);
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v91 objects:v101 count:16];
    }
    while (v37);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v41 = *((id *)self + 104);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v87 objects:v100 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v88 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v45 = *(void *)(*((void *)&v87 + 1) + 8 * j);
        objc_storeWeak((id *)(v45 + 112), self);
        objc_storeWeak((id *)(v45 + 120), *v7);
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v87 objects:v100 count:16];
    }
    while (v42);
  }

  {
    auoop::RenderPipePoolManager::instance(void)::global = 0;
    qword_1E9296378 = 0;
    qword_1E9296380 = 0;
    qword_1E9296370 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&auoop::RenderPipePoolManager::instance(void)::global);
  int v46 = *((_DWORD *)self + 182);
  uint64_t v48 = qword_1E9296370;
  uint64_t v47 = qword_1E9296378;
  if (qword_1E9296370 == qword_1E9296378) {
    goto LABEL_89;
  }
  uint64_t v49 = (void *)qword_1E9296370;
  while (1)
  {
    uint64_t v50 = v49[1];
    if (!v50 || *(void *)(v50 + 8) == -1) {
      break;
    }
    v49 += 2;
    if (v49 == (void *)qword_1E9296378) {
      goto LABEL_71;
    }
  }
  if (v49 != (void *)qword_1E9296378)
  {
    uint64_t v51 = v49 + 2;
    if (v49 + 2 != (void *)qword_1E9296378)
    {
      do
      {
        uint64_t v52 = v51[1];
        if (v52 && *(void *)(v52 + 8) != -1)
        {
          uint64_t v53 = *v51;
          *uint64_t v51 = 0;
          v51[1] = 0;
          uint64_t v54 = (std::__shared_weak_count *)v49[1];
          *uint64_t v49 = v53;
          v49[1] = v52;
          if (v54) {
            std::__shared_weak_count::__release_weak(v54);
          }
          v49 += 2;
        }
        v51 += 2;
      }
      while (v51 != (uint64_t *)v47);
      uint64_t v48 = qword_1E9296370;
      uint64_t v47 = qword_1E9296378;
    }
  }
  if (v49 == (void *)v47)
  {
LABEL_71:
    uint64_t v49 = (void *)v47;
    goto LABEL_72;
  }
  while ((void *)v47 != v49)
  {
    uint64_t v55 = *(std::__shared_weak_count **)(v47 - 8);
    if (v55) {
      std::__shared_weak_count::__release_weak(v55);
    }
    v47 -= 16;
  }
  qword_1E9296378 = (uint64_t)v49;
  uint64_t v48 = qword_1E9296370;
LABEL_72:
  if ((void *)v48 == v49) {
    goto LABEL_89;
  }
  do
  {
    unint64_t v56 = *(std::__shared_weak_count **)(v48 + 8);
    if (v56)
    {
      unint64_t v57 = std::__shared_weak_count::lock(v56);
      if (v57)
      {
        uint64_t v58 = v57;
        unint64_t v59 = *(std::recursive_mutex **)v48;
        if (!*(void *)v48) {
          goto LABEL_80;
        }
        std::recursive_mutex::lock(*(std::recursive_mutex **)v48);
        if (*(_DWORD *)v59[1].__m_.__opaque != v46)
        {
          std::recursive_mutex::unlock(v59);
LABEL_80:
          std::__shared_weak_count::__release_shared[abi:ne180100](v58);
          goto LABEL_81;
        }
        int v60 = v59[1].__m_.__opaque[4];
        std::recursive_mutex::unlock(v59);
        std::__shared_weak_count::__release_shared[abi:ne180100](v58);
        if (!v60) {
          goto LABEL_83;
        }
      }
    }
LABEL_81:
    v48 += 16;
  }
  while ((void *)v48 != v49);
  uint64_t v48 = (uint64_t)v49;
LABEL_83:
  if (v48 != qword_1E9296378)
  {
    uint64_t v61 = *(std::__shared_weak_count **)(v48 + 8);
    if (v61)
    {
      int v62 = std::__shared_weak_count::lock(v61);
      if (v62)
      {
        if (*(void *)v48)
        {
          *(void *)&long long v63 = *(void *)v48;
          *((void *)&v63 + 1) = v62;
          long long v82 = v63;
          goto LABEL_108;
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v62);
      }
    }
  }
LABEL_89:
  unint64_t v64 = operator new(0xD8uLL);
  v64[1] = 0;
  v64[2] = 0;
  *unint64_t v64 = &unk_1EDFA2A10;
  MEMORY[0x192FC8690](v64 + 3);
  *((unsigned char *)v64 + 128) = 0;
  v64[11] = v64 + 3;
  *((_DWORD *)v64 + 24) = v46;
  v64[13] = 0;
  *((unsigned char *)v64 + 100) = 0;
  *((unsigned char *)v64 + 200) = 0;
  v64[14] = 0;
  v64[15] = 0;
  uint64_t v65 = objc_opt_new();
  *(void *)&long long v66 = v64 + 3;
  *((void *)&v66 + 1) = v64;
  long long v82 = v66;
  v64[26] = v65;
  v67 = (void *)qword_1E9296378;
  if (qword_1E9296378 >= (unint64_t)qword_1E9296380)
  {
    uint64_t v69 = qword_1E9296370;
    uint64_t v70 = (qword_1E9296378 - qword_1E9296370) >> 4;
    unint64_t v71 = v70 + 1;
    if ((unint64_t)(v70 + 1) >> 60) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v72 = qword_1E9296380 - qword_1E9296370;
    if ((qword_1E9296380 - qword_1E9296370) >> 3 > v71) {
      unint64_t v71 = v72 >> 3;
    }
    if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v73 = v71;
    }
    if (v73 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v74 = (char *)operator new(16 * v73);
    uint64_t v75 = &v74[16 * v70];
    uint64_t v76 = (uint64_t)&v74[16 * v73];
    *(_OWORD *)uint64_t v75 = v82;
    uint64_t v68 = (uint64_t)(v75 + 16);
    atomic_fetch_add_explicit(v64 + 2, 1uLL, memory_order_relaxed);
    if (v67 == (void *)v69)
    {
      qword_1E9296370 = (uint64_t)v75;
      qword_1E9296378 = (uint64_t)(v75 + 16);
      qword_1E9296380 = (uint64_t)&v74[16 * v73];
      if (!v67) {
        goto LABEL_107;
      }
    }
    else
    {
      do
      {
        long long v77 = *((_OWORD *)v67 - 1);
        v67 -= 2;
        *((_OWORD *)v75 - 1) = v77;
        v75 -= 16;
        void *v67 = 0;
        v67[1] = 0;
      }
      while (v67 != (void *)v69);
      uint64_t v78 = qword_1E9296370;
      v67 = (void *)qword_1E9296378;
      qword_1E9296370 = (uint64_t)v75;
      qword_1E9296378 = v68;
      qword_1E9296380 = v76;
      if (v67 != (void *)v78)
      {
        do
        {
          id v79 = (std::__shared_weak_count *)*(v67 - 1);
          if (v79) {
            std::__shared_weak_count::__release_weak(v79);
          }
          v67 -= 2;
        }
        while (v67 != (void *)v78);
        v67 = (void *)v78;
      }
      if (!v67) {
        goto LABEL_107;
      }
    }
    operator delete(v67);
  }
  else
  {
    *(void *)qword_1E9296378 = v64 + 3;
    v67[1] = v64;
    atomic_fetch_add_explicit(v64 + 2, 1uLL, memory_order_relaxed);
    uint64_t v68 = (uint64_t)(v67 + 2);
    qword_1E9296378 = (uint64_t)(v67 + 2);
  }
LABEL_107:
  qword_1E9296378 = v68;
LABEL_108:
  v80 = (std::__shared_weak_count *)*((void *)self + 110);
  *(_OWORD *)((char *)self + 872) = v82;
  if (v80) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v80);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&auoop::RenderPipePoolManager::instance(void)::global);
  uint64_t v81 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
  AURegistrationServerConnection::RegisterExtensionProcess(v81);
  v86[2](v86, 0);

  id v29 = 0;
LABEL_111:

  std::__function::__value_func<void ()(NSError *,std::tuple<BOOL,BOOL,NSArray * {__strong},NSArray * {__strong},BOOL,BOOL,int,unsigned long,unsigned long> &&)>::~__value_func[abi:ne180100](&v103);
}

- (void)_setComponentInstance:(OpaqueAudioComponentInstance *)a3
{
  *((void *)self + 90) = a3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
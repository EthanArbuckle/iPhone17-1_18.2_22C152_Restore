@interface AURemoteHost
+ (void)_staticInit;
- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken;
- (AURemoteHost)initWithConnection:(id)a3 config:(id)a4;
- (AURemoteHost)initWithConnection:(id)a3 config:(id)a4 timeOutHandler:(function<void)(;
- (BOOL)_identifyBus:(id)a3 scope:(unsigned int *)a4 element:(unsigned int *)a5;
- (BOOL)localCachingDisabled;
- (NSMutableArray)pendingChangedProperties;
- (NSUUID)audioUnitUUID;
- (OS_dispatch_queue)propertyObserverQueue;
- (id).cxx_construct;
- (id)_fetchAndClearPendingChangedProperties;
- (id)_getBus:(unsigned int)a3 scope:(unsigned int)a4 error:(id *)a5;
- (id)_getSpeechSynthesisProviderAudioUnit;
- (id)audioUnit;
- (id)currentParameterTree;
- (id)getParameter:(NSObject  *){objcproto17OS_dispatch_queue} sequenceNumber:(id)&& reply:;
- (id)getParameter:(id *)a1 sequenceNumber:reply:;
- (id)readHostEntitlement:(id)a3;
- (int)deferPropertyChangeNotifications;
- (void)addPropertyObserver:(id)a3 context:(unint64_t)a4 reply:(id)a5;
- (void)cancelSpeechRequest:(id)a3;
- (void)close:(id)a3;
- (void)createRenderPipe:(int)a3 formats:(id)a4 maxFrames:(unsigned int)a5 midiOutSizeHint:(unsigned int)a6 resources:(id)a7 reply:(id)a8;
- (void)dealloc;
- (void)deleteUserPreset:(id)a3 reply:(id)a4;
- (void)destroyRenderPipe:(unsigned int)a3 reply:(id)a4;
- (void)disableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 reply:(id)a6;
- (void)enableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 reply:(id)a6;
- (void)getBusses:(unsigned int)a3 reply:(id)a4;
- (void)getCustomMessageChannelFor:(id)a3 reply:(id)a4;
- (void)getParameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4 reply:(id)a5;
- (void)getParameterTree:(id)a3;
- (void)getSpeechVoices:(id)a3;
- (void)initWithConnection:config:;
- (void)initialize:(unint64_t)a3 reply:(id)a4;
- (void)initialize:reply:;
- (void)loadUserPresets:(id)a3;
- (void)localCachingDisabled:(BOOL)a3 newValue:(BOOL)a4 reply:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)open:(AudioComponentDescription *)a3 instanceUUID:(id)a4 reply:(id)a5;
- (void)openImpl:(id)a3 reply:(id)a4;
- (void)parameterNode:(id)a3 displayNameWithLength:(int64_t)a4 reply:(id)a5;
- (void)parameterStringFromValue:(float)a3 currentValue:(BOOL)a4 address:(unint64_t)a5 reply:(id)a6;
- (void)parameterValueFromString:(id)a3 address:(unint64_t)a4 reply:(id)a5;
- (void)parametersForOverviewWithCount:(int64_t)a3 reply:(id)a4;
- (void)presetStateFor:(id)a3 reply:(id)a4;
- (void)profileStateForCable:(unsigned __int8)a3 channel:(unsigned __int8)a4 reply:(id)a5;
- (void)removePropertyObserver:(id)a3 context:(unint64_t)a4 reply:(id)a5;
- (void)reset:(id)a3;
- (void)retrieveInstanceUUID:(id)a3;
- (void)saveUserPreset:(id)a3 state:(id)a4 reply:(id)a5;
- (void)selectViewConfiguration:(id)a3 reply:(id)a4;
- (void)setBlocks;
- (void)setBusCount:(unint64_t)a3 scope:(unsigned int)a4 reply:(id)a5;
- (void)setBusFormat:(unsigned int)a3 scope:(unsigned int)a4 format:(id)a5 reply:(id)a6;
- (void)setBusName:(unsigned int)a3 scope:(unsigned int)a4 name:(id)a5 reply:(id)a6;
- (void)setDeferPropertyChangeNotifications:(int)a3;
- (void)setLocalCachingDisabled:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4 reply:(id)a5;
- (void)setValue:(id)a3 forProperty:(id)a4 propagateError:(BOOL)a5 reply:(id)a6;
- (void)startUserPresetFolderMonitoring;
- (void)supportedViewConfigurations:(id)a3 reply:(id)a4;
- (void)syncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7;
- (void)synthesizeSpeechRequest:(id)a3 reply:(id)a4;
- (void)uninitialize:(id)a3;
- (void)updateHostCallbacks:(unint64_t)a3 reply:(id)a4;
- (void)updateWorkgroupMirror:(id)a3 reply:(id)a4;
- (void)valueForKey:(id)a3 reply:(id)a4;
- (void)valueForProperty:(id)a3 propagateError:(BOOL)a4 reply:(id)a5;
@end

@implementation AURemoteHost

- (id).cxx_construct
{
  self->_renderServerUser.var0.__null_state_ = 0;
  self->_renderServerUser.__engaged_ = 0;
  caulk::xpc::reply_watchdog_factory::reply_watchdog_factory((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
  self->_transactorIO.__ptr_.__value_ = 0;
  *(_OWORD *)&self->_kvoAggregator.mRecords.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_remoteMessageChannels.var0 = 0u;
  self->_workgroupMirror = 0u;
  *(_OWORD *)&self->_kvoAggregator.mRecords.__begin_ = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingChangedProperties, 0);
  objc_storeStrong((id *)&self->_propertyObserverQueue, 0);
  std::unique_ptr<XOSTransactor>::reset[abi:ne180100]((uint64_t *)&self->_transactorIO, 0);
  begin = self->_remoteMessageChannels.__begin_;
  if (begin)
  {
    var0 = self->_remoteMessageChannels.var0;
    v5 = self->_remoteMessageChannels.__begin_;
    if (var0 != begin)
    {
      do
      {
        v6 = *--var0;
      }
      while (var0 != begin);
      v5 = self->_remoteMessageChannels.__begin_;
    }
    self->_remoteMessageChannels.var0 = begin;
    operator delete(v5);
  }
  v7 = self->_kvoAggregator.mRecords.__begin_;
  if (v7)
  {
    std::vector<KVOAggregator::Record>::__base_destruct_at_end[abi:ne180100]((uint64_t)&self->_kvoAggregator, (uint64_t)v7);
    operator delete(self->_kvoAggregator.mRecords.__begin_);
  }
  cntrl = self->_workgroupMirror.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_audioUnitUUID, 0);
  objc_storeStrong((id *)&self->_userPresets, 0);
  objc_storeStrong((id *)&self->_presetFolderWatcher, 0);
  objc_storeStrong((id *)&self->_presetMonitoringQueue, 0);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->_replyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->_cachedParameterTree, 0);
  objc_storeStrong((id *)&self->_initializationVoucher, 0);
  if (self->_renderServerUser.__engaged_) {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
  }
  objc_storeStrong((id *)&self->_remoteHostXPCConnection, 0);
  objc_storeStrong((id *)&self->_audioUnit, 0);
}

- (NSMutableArray)pendingChangedProperties
{
  return self->_pendingChangedProperties;
}

- (void)setDeferPropertyChangeNotifications:(int)a3
{
  self->_deferPropertyChangeNotifications = a3;
}

- (int)deferPropertyChangeNotifications
{
  return self->_deferPropertyChangeNotifications;
}

- (OS_dispatch_queue)propertyObserverQueue
{
  return self->_propertyObserverQueue;
}

- (void)setLocalCachingDisabled:(BOOL)a3
{
  self->_localCachingDisabled = a3;
}

- (BOOL)localCachingDisabled
{
  return self->_localCachingDisabled;
}

- (NSUUID)audioUnitUUID
{
  return self->_audioUnitUUID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_remoteHostXPCConnection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)readHostEntitlement:(id)a3
{
  v3 = [(NSXPCConnection *)self->_remoteHostXPCConnection valueForEntitlement:a3];
  return v3;
}

- (void)localCachingDisabled:(BOOL)a3 newValue:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v10 = (void (**)(id, void, BOOL))_Block_copy(v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbEEEU13block_pointerFvDpT_ES9_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c122_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbEEEU13block_pointerFvDpT_ES9_iEUlS4_bE__e20_v20__0__NSError_8B16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v12 = _Block_copy(v8);
    id v14 = v11;
    id v15 = _Block_copy(v12);
    v10 = (void (**)(id, void, BOOL))_Block_copy(aBlock);

    id v9 = v14;
    id v14 = 0;
  }
  if (v6) {
    [(AURemoteHost *)self setLocalCachingDisabled:v5];
  }
  v10[2](v10, 0, [(AURemoteHost *)self localCachingDisabled]);
}

- (void)retrieveInstanceUUID:(id)a3
{
  id v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v7 = (void (**)(id, void, void *))objc_claimAutoreleasedReturnValue();

  BOOL v5 = [(AURemoteHost *)self audioUnitUUID];
  BOOL v6 = [v5 UUIDString];

  v7[2](v7, 0, v6);
}

- (void)getCustomMessageChannelFor:(id)a3 reply:(id)a4
{
  id v29 = a3;
  BOOL v6 = (void (**)(id, void, void *))a4;
  v7 = [(AUAudioUnit *)self->_audioUnit messageChannelFor:v29];
  if (v7)
  {
    id v8 = [[AURemoteMessageChannel alloc] initWithMessageChannel:v7];
    id v9 = v8;
    var0 = self->_remoteMessageChannels.var0;
    value = self->_remoteMessageChannels.var1.__value_;
    if (var0 >= (__end_cap_ **)value)
    {
      begin = self->_remoteMessageChannels.__begin_;
      uint64_t v14 = var0 - begin;
      if ((unint64_t)(v14 + 1) >> 61) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = (char *)value - (char *)begin;
      uint64_t v16 = v15 >> 2;
      if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
        uint64_t v16 = v14 + 1;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v17)
      {
        if (v17 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v18 = (char *)operator new(8 * v17);
      }
      else
      {
        v18 = 0;
      }
      v19 = (__end_ **)&v18[8 * v14];
      v20 = (id *)&v18[8 * v17];
      *v19 = (__end_ *)v9;
      v12 = v19 + 1;
      v22 = self->_remoteMessageChannels.__begin_;
      v21 = self->_remoteMessageChannels.var0;
      if (v21 == v22)
      {
        int64x2_t v24 = vdupq_n_s64((unint64_t)v21);
      }
      else
      {
        do
        {
          v23 = *--v21;
          *v21 = 0;
          *--v19 = v23;
        }
        while (v21 != v22);
        int64x2_t v24 = *(int64x2_t *)&self->_remoteMessageChannels.__begin_;
      }
      self->_remoteMessageChannels.__begin_ = v19;
      self->_remoteMessageChannels.var0 = v12;
      self->_remoteMessageChannels.var1.__value_ = v20;
      v26 = (char *)v24.i64[1];
      v25 = (char *)v24.i64[0];
      while (v26 != v25)
      {
        v27 = (void *)*((void *)v26 - 1);
        v26 -= 8;
      }
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      *var0 = (__end_cap_ *)v8;
      v12 = var0 + 1;
    }
    self->_remoteMessageChannels.var0 = v12;
    v28 = [(AURemoteMessageChannel *)v9 endpoint];
    v6[2](v6, 0, v28);
  }
  else
  {
    v6[2](v6, 0, 0);
  }
}

- (id)audioUnit
{
  return self->_audioUnit;
}

- (void)getSpeechVoices:(id)a3
{
  id v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  id v8 = (void (**)(id, void, void *))objc_claimAutoreleasedReturnValue();

  BOOL v5 = [(AURemoteHost *)self _getSpeechSynthesisProviderAudioUnit];
  BOOL v6 = v5;
  if (v5)
  {
    v7 = [v5 speechVoices];
    v8[2](v8, 0, v7);
  }
  else
  {
    v8[2](v8, 0, 0);
  }
}

- (void)cancelSpeechRequest:(id)a3
{
  id v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  v7 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();

  BOOL v5 = [(AURemoteHost *)self _getSpeechSynthesisProviderAudioUnit];
  BOOL v6 = v5;
  if (v5) {
    [v5 cancelSpeechRequest];
  }

  v7[2](v7, 0);
}

- (void)synthesizeSpeechRequest:(id)a3 reply:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  id v8 = [(AURemoteHost *)self _getSpeechSynthesisProviderAudioUnit];
  id v9 = v8;
  if (v8) {
    [v8 synthesizeSpeechRequest:v10];
  }

  v7[2](v7, 0);
}

- (void)startUserPresetFolderMonitoring
{
  if (!self->_presetFolderWatcher)
  {
    if (!self->_presetMonitoringQueue)
    {
      v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      id v4 = (OS_dispatch_queue *)dispatch_queue_create("AUExtension.PresetMonitoring", v3);
      presetMonitoringQueue = self->_presetMonitoringQueue;
      self->_presetMonitoringQueue = v4;
    }
    objc_initWeak(&location, self);
    id v6 = self->_presetMonitoringQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__AURemoteHost_startUserPresetFolderMonitoring__block_invoke;
    v9[3] = &unk_1E5688E10;
    objc_copyWeak(&v10, &location);
    v7 = +[AUAudioUnit _monitorUserPresets:v6 callback:v9];
    presetFolderWatcher = self->_presetFolderWatcher;
    self->_presetFolderWatcher = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __47__AURemoteHost_startUserPresetFolderMonitoring__block_invoke(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[24];
    WeakRetained[24] = 0;

    id v4 = (void *)v2[2];
    v9[0] = &unk_1EDF9E4D0;
    v9[1] = &__block_literal_global_39;
    v9[3] = v9;
    caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v10, v4, (uint64_t)v9);
    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v9);
    BOOL v5 = caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v10);
    id v6 = (void *)MEMORY[0x1E4F1C978];
    v7 = +[AUAudioUnitProperty propertyWithKey:@"userPresets"];
    id v8 = objc_msgSend(v6, "arrayWithObjects:", v7, 0);
    [v5 propertiesChanged:v8];

    _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v11);
  }
}

- (void)presetStateFor:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    id v8 = (void (**)(void *, id, void *))_Block_copy(v7);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEU13block_pointerFvDpT_ESH_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c174_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP12NSDictionaryIP8NSStringP11objc_objectEEEEU13block_pointerFvDpT_ESH_iEUlS4_SC_E__e34_v24__0__NSError_8__NSDictionary_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    uint64_t v16 = _Block_copy(v7);
    id v18 = v15;
    id v19 = _Block_copy(v16);
    id v8 = (void (**)(void *, id, void *))_Block_copy(aBlock);

    id v9 = v18;
    id v18 = 0;

    id v10 = v15;
    id v15 = 0;
  }
  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    id v14 = 0;
    v12 = [(AUAudioUnit *)audioUnit presetStateFor:v6 error:&v14];
    id v13 = v14;
  }
  else
  {
    v12 = 0;
    id v13 = 0;
  }
  v8[2](v8, v13, v12);
}

- (void)deleteUserPreset:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v7);
  id v8 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    id v11 = 0;
    [(AUAudioUnit *)audioUnit deleteUserPreset:v6 error:&v11];
    id v10 = v11;
    ((void (**)(void, id))v8)[2](v8, v10);
  }
  else
  {
    id v10 = 0;
    v8[2](v8, 0);
  }
}

- (void)saveUserPreset:(id)a3 state:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  id v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    id v12 = 0;
    [(AUAudioUnit *)audioUnit saveUserPreset:v7 error:&v12];
    id v11 = v12;
    ((void (**)(void, id))v9)[2](v9, v11);
  }
  else
  {
    id v11 = 0;
    v9[2](v9, 0);
  }
}

- (void)loadUserPresets:(id)a3
{
  id v4 = a3;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    id v11 = (void (**)(id, void, NSMutableArray *))_Block_copy(v4);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEU13block_pointerFvDpT_ESF_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c164_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP17AUAudioUnitPresetEEEEU13block_pointerFvDpT_ESF_iEUlS4_SA_E__e29_v24__0__NSError_8__NSArray_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    id v13 = _Block_copy(v4);
    id v15 = v12;
    id v16 = _Block_copy(v13);
    id v11 = (void (**)(id, void, NSMutableArray *))_Block_copy(aBlock);

    id v5 = v15;
    id v15 = 0;
  }
  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    id v7 = [(AUAudioUnit *)audioUnit userPresets];
    uint64_t v8 = [v7 mutableCopy];
    userPresets = self->_userPresets;
    p_userPresets = &self->_userPresets;
    *p_userPresets = (NSMutableArray *)v8;
  }
  else
  {
    p_userPresets = &self->_userPresets;
  }
  v11[2](v11, 0, *p_userPresets);
}

- (void)disableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v11);
  id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  id v15 = 0;
  [(AUAudioUnit *)audioUnit disableProfile:v10 cable:v8 onChannel:v7 error:&v15];
  id v14 = v15;
  ((void (**)(void, id))v12)[2](v12, v14);
}

- (void)enableProfile:(id)a3 cable:(unsigned __int8)a4 onChannel:(unsigned __int8)a5 reply:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v11);
  id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  id v15 = 0;
  [(AUAudioUnit *)audioUnit enableProfile:v10 cable:v8 onChannel:v7 error:&v15];
  id v14 = v15;
  ((void (**)(void, id))v12)[2](v12, v14);
}

- (void)profileStateForCable:(unsigned __int8)a3 channel:(unsigned __int8)a4 reply:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    id v11 = (void (**)(id, void, void *))_Block_copy(v8);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP18MIDICIProfileStateEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c154_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP18MIDICIProfileStateEEEU13block_pointerFvDpT_ESC_iEUlS4_S7_E__e40_v24__0__NSError_8__MIDICIProfileState_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    id v13 = _Block_copy(v8);
    id v15 = v12;
    id v16 = _Block_copy(v13);
    id v11 = (void (**)(id, void, void *))_Block_copy(aBlock);

    id v9 = v15;
    id v15 = 0;
  }
  id v10 = [(AUAudioUnit *)self->_audioUnit profileStateForCable:v6 channel:v5];
  v11[2](v11, 0, v10);
}

- (void)selectViewConfiguration:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  uint64_t v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  [(AUAudioUnit *)self->_audioUnit selectViewConfiguration:v8];
  v7[2](v7, 0);
}

- (void)supportedViewConfigurations:(id)a3 reply:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    uint64_t v7 = (void (**)(void *, void, void *))_Block_copy(v6);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP10NSIndexSetEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c146_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP10NSIndexSetEEEU13block_pointerFvDpT_ESC_iEUlS4_S7_E__e32_v24__0__NSError_8__NSIndexSet_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    id v12 = _Block_copy(v6);
    id v14 = v11;
    id v15 = _Block_copy(v12);
    uint64_t v7 = (void (**)(void *, void, void *))_Block_copy(aBlock);

    id v8 = v14;
    id v14 = 0;
  }
  id v9 = [(AUAudioUnit *)self->_audioUnit supportedViewConfigurations:v10];
  v7[2](v7, 0, v9);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  propertyObserverQueue = self->_propertyObserverQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AURemoteHost_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E5680DC8;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(propertyObserverQueue, block);
}

void __63__AURemoteHost_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AUAudioUnitProperty propertyWithKey:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) _identifyBus:*(void *)(a1 + 48) scope:v2 + 20 element:v2 + 24])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 40) + 296);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
          if (*(_DWORD *)(v2 + 20) == *(_DWORD *)(v7 + 20)
            && *(_DWORD *)(v2 + 24) == *(_DWORD *)(v7 + 24)
            && (objc_msgSend(*(id *)(v2 + 8), "isEqualToString:", *(void *)(v7 + 8), (void)v12) & 1) != 0)
          {

            goto LABEL_16;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v19 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    [*(id *)(*(void *)(a1 + 40) + 296) addObject:v2];
    uint64_t v8 = *(void *)(a1 + 40);
    if (!*(_DWORD *)(v8 + 284) && [*(id *)(v8 + 296) count])
    {
      id v9 = *(void **)(*(void *)(a1 + 40) + 16);
      v16[0] = &unk_1EDF9E4D0;
      v16[1] = &__block_literal_global_36;
      v16[3] = v16;
      caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v17, v9, (uint64_t)v16);
      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v16);
      id v10 = caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v17);
      id v11 = [*(id *)(a1 + 40) _fetchAndClearPendingChangedProperties];
      [v10 propertiesChanged:v11];

      _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v18);
    }
  }
LABEL_16:
}

- (id)_fetchAndClearPendingChangedProperties
{
  id v3 = self->_pendingChangedProperties;
  uint64_t v4 = (NSMutableArray *)objc_opt_new();
  pendingChangedProperties = self->_pendingChangedProperties;
  self->_pendingChangedProperties = v4;

  return v3;
}

- (void)parameterNode:(id)a3 displayNameWithLength:(int64_t)a4 reply:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  id v10 = [(AURemoteHost *)self currentParameterTree];
  id v11 = [v10 valueForKeyPath:v13];

  if (v11)
  {
    long long v12 = [v11 displayNameWithLength:a4];
  }
  else
  {
    long long v12 = 0;
  }
  ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
}

- (void)parameterValueFromString:(id)a3 address:(unint64_t)a4 reply:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},float>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  id v9 = (void (**)(void, void, __n128))objc_claimAutoreleasedReturnValue();

  id v10 = [(AURemoteHost *)self currentParameterTree];
  id v11 = [v10 parameterWithAddress:a4];

  if (v11) {
    [v11 valueFromString:v13];
  }
  else {
    v12.n128_u64[0] = 0;
  }
  v9[2](v9, 0, v12);
}

- (void)parameterStringFromValue:(float)a3 currentValue:(BOOL)a4 address:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = a4;
  float v15 = a3;
  id v9 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v9);
  id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  id v11 = [(AURemoteHost *)self currentParameterTree];
  __n128 v12 = [v11 parameterWithAddress:a5];

  if (v12)
  {
    if (v7) {
      id v13 = 0;
    }
    else {
      id v13 = &v15;
    }
    long long v14 = [v12 stringFromValue:v13];
  }
  else
  {
    long long v14 = 0;
  }
  ((void (**)(void, void, void *))v10)[2](v10, 0, v14);
}

- (void)getParameter:(unint64_t)a3 sequenceNumber:(unsigned int)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},float>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);

  id v10 = self;
  id v11 = _Block_copy(v9);
  if (a4)
  {
    objc_initWeak(&location, v10);
    {
      {
        long long v14 = dispatch_get_global_queue(25, 0);
        AUv2GetParameterSynchronizer::parameterSyncQueue(void)::global = (uint64_t)dispatch_queue_create_with_target_V2("AUv2GetParameterSynchronizer", 0, v14);
      }
    }
    __n128 v12 = (void *)AUv2GetParameterSynchronizer::parameterSyncQueue(void)::global;
    applesauce::dispatch::v1::source::operator*((id)AUv2GetParameterSynchronizer::parameterSyncQueue(void)::global);
    objc_claimAutoreleasedReturnValue();
    objc_copyWeak(v15, &location);
    v15[1] = v10;
    v15[2] = (id)a3;
    unsigned int v16 = a4;
    unint64_t v17 = _Block_copy(v11);
    id v18 = _Block_copy(v9);
    id v13 = v12;
    operator new();
  }
  [(AUAudioUnit *)v10->_audioUnit getV2Parameter:a3 sequenceNumber:0];
  (*((void (**)(void *, void))v11 + 2))(v11, 0);
}

- (id)getParameter:(id *)a1 sequenceNumber:reply:
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    objc_destroyWeak(v2);
    MEMORY[0x192FC8940](v2, 0x10C0C4089E62035);
  }
  return a1;
}

- (id)getParameter:(NSObject  *){objcproto17OS_dispatch_queue} sequenceNumber:(id)&& reply:
{
  uint64_t v6 = (id *)a1;
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  if (WeakRetained)
  {
    [*(id *)(*(void *)(a1 + 8) + 8) getV2Parameter:*(void *)(a1 + 16) sequenceNumber:*(unsigned int *)(a1 + 24)];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-66749 userInfo:0];
    (*(void (**)(uint64_t, void *, double))(v3 + 16))(v3, v4, 0.0);
  }
  return std::unique_ptr<-[AURemoteHost getParameter:sequenceNumber:reply:]::$_4>::~unique_ptr[abi:ne180100](&v6);
}

- (void)syncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = [(AUAudioUnit *)self->_audioUnit parameterTree];
  *(float *)&double v12 = a4;
  [v13 remoteSyncParameter:a3 value:a5 extOriginator:a6 hostTime:v7 eventType:v12];
}

- (void)parametersForOverviewWithCount:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    id v9 = (void (**)(id, void, void *))_Block_copy(v6);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP8NSNumberEEEEU13block_pointerFvDpT_ESF_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c154_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP7NSArrayIP8NSNumberEEEEU13block_pointerFvDpT_ESF_iEUlS4_SA_E__e29_v24__0__NSError_8__NSArray_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    id v11 = _Block_copy(v6);
    id v13 = v10;
    id v14 = _Block_copy(v11);
    id v9 = (void (**)(id, void, void *))_Block_copy(aBlock);

    id v7 = v13;
    id v13 = 0;
  }
  id v8 = [(AUAudioUnit *)self->_audioUnit parametersForOverviewWithCount:a3];
  v9[2](v9, 0, v8);
}

- (void)getParameterTree:(id)a3
{
  id v4 = a3;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    id v7 = (void (**)(id, void, void *))_Block_copy(v4);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP15AUParameterTreeEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c151_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorU8__strongP15AUParameterTreeEEEU13block_pointerFvDpT_ESC_iEUlS4_S7_E__e37_v24__0__NSError_8__AUParameterTree_16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    id v9 = _Block_copy(v4);
    id v11 = v8;
    id v12 = _Block_copy(v9);
    id v7 = (void (**)(id, void, void *))_Block_copy(aBlock);

    id v5 = v11;
    id v11 = 0;
  }
  id v6 = [(AURemoteHost *)self currentParameterTree];
  v7[2](v7, 0, v6);
}

- (id)currentParameterTree
{
  cachedParameterTree = [(AUAudioUnit *)self->_audioUnit parameterTree];
  id v4 = cachedParameterTree;
  if (cachedParameterTree != self->_cachedParameterTree)
  {
    objc_storeStrong((id *)&self->_cachedParameterTree, cachedParameterTree);
    [(AUParameterTree *)v4 setRemoteParameterSynchronizerXPCConnection:self->_remoteHostXPCConnection];
    cachedParameterTree = self->_cachedParameterTree;
  }
  id v5 = cachedParameterTree;

  return v5;
}

- (void)setBusCount:(unint64_t)a3 scope:(unsigned int)a4 reply:(id)a5
{
  id v8 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v8);
  id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v16, self);
  if (a4 == 2)
  {
    id v10 = [(AUAudioUnit *)self->_audioUnit outputBusses];
    uint64_t v14 = 0;
    id v11 = (id *)&v14;
    [v10 setBusCount:a3 error:&v14];
  }
  else
  {
    if (a4 != 1)
    {
      id v12 = 0;
      goto LABEL_7;
    }
    id v10 = [(AUAudioUnit *)self->_audioUnit inputBusses];
    uint64_t v15 = 0;
    id v11 = (id *)&v15;
    [v10 setBusCount:a3 error:&v15];
  }
  id v12 = *v11;

LABEL_7:
  id v13 = PropertyNotificationDeferrer::changedProperties(v16);
  ((void (**)(void, id, void *))v9)[2](v9, v12, v13);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v16);
}

- (void)setBusName:(unsigned int)a3 scope:(unsigned int)a4 name:(id)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    id v12 = (void (**)(void *, void *))_Block_copy(v11);
  }
  else
  {
    aBlock[0] = (id)MEMORY[0x1E4F143A8];
    aBlock[1] = (id)3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSArrayEEEU13block_pointerFvDpT_ES9_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c120_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSArrayEEEU13block_pointerFvDpT_ES9_iEUlS4_E__e17_v16__0__NSArray_8l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    uint64_t v20 = _Block_copy(v11);
    id v22 = v19;
    id v23 = _Block_copy(v20);
    id v12 = (void (**)(void *, void *))_Block_copy(aBlock);

    id v13 = v22;
    id v22 = 0;

    id v14 = v19;
    id v19 = 0;
  }
  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)aBlock, self);
  id v18 = 0;
  uint64_t v15 = [(AURemoteHost *)self _getBus:v8 scope:v7 error:&v18];
  id v16 = v18;
  if (!v16) {
    [v15 setName:v10];
  }
  unint64_t v17 = PropertyNotificationDeferrer::changedProperties(aBlock);
  v12[2](v12, v17);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(aBlock);
}

- (void)setBusFormat:(unsigned int)a3 scope:(unsigned int)a4 format:(id)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v11);
  id v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v18, self);
  id v17 = 0;
  id v13 = [(AURemoteHost *)self _getBus:v8 scope:v7 error:&v17];
  id v14 = v17;
  if (!v14)
  {
    id v16 = 0;
    [v13 setFormat:v10 error:&v16];
    id v14 = v16;
  }
  uint64_t v15 = PropertyNotificationDeferrer::changedProperties(v18);
  ((void (**)(void, id, void *))v12)[2](v12, v14, v15);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v18);
}

- (void)removePropertyObserver:(id)a3 context:(unint64_t)a4 reply:(id)a5
{
  uint64_t v7 = (char *)a3;
  uint64_t v8 = (void (**)(id, void))a5;
  if (*(void *)(v7 + 20))
  {
    id v11 = 0;
    id v9 = -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    id v10 = v11;
    if (v9) {
      KVOAggregator::removeObserver(&self->_kvoAggregator, &self->super, v9, *((NSString **)v7 + 1));
    }
  }
  else
  {
    KVOAggregator::removeObserver(&self->_kvoAggregator, &self->super, &self->_audioUnit->super, *((NSString **)v7 + 1));
  }
  v8[2](v8, 0);
}

- (void)addPropertyObserver:(id)a3 context:(unint64_t)a4 reply:(id)a5
{
  uint64_t v7 = (char *)a3;
  uint64_t v8 = (void (**)(id, void))a5;
  if (*(void *)(v7 + 20))
  {
    id v11 = 0;
    id v9 = -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    id v10 = v11;
    if (v9) {
      KVOAggregator::addObserver(&self->_kvoAggregator, &self->super, v9, *((NSString **)v7 + 1));
    }
  }
  else
  {
    KVOAggregator::addObserver(&self->_kvoAggregator, &self->super, &self->_audioUnit->super, *((NSString **)v7 + 1));
  }
  v8[2](v8, 0);
}

- (void)setValue:(id)a3 forProperty:(id)a4 propagateError:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v12);
  id v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v20, self);
  if (*(void *)((char *)v11 + 20))
  {
    id v17 = -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    id v16 = 0;
    if (v17) {
      [v17 setValue:v10 forKey:v11[1]];
    }
  }
  else
  {
    audioUnit = self->_audioUnit;
    uint64_t v15 = v11[1];
    if (v7)
    {
      id v19 = 0;
      [(AUAudioUnit *)audioUnit _setValue:v10 forKey:v15 error:&v19];
      id v16 = v19;
    }
    else
    {
      id v16 = 0;
      [(AUAudioUnit *)audioUnit setValue:v10 forKey:v15];
    }
  }
  id v18 = PropertyNotificationDeferrer::changedProperties(v20);
  ((void (**)(void, id, void *))v13)[2](v13, v16, v18);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v20);
}

- (void)valueForProperty:(id)a3 propagateError:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v8 = a3;
  id v9 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v9);
  id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    audioUnit = self->_audioUnit;
    id v18 = 0;
    uint64_t v12 = [(AUAudioUnit *)audioUnit _valueForProperty:v8 error:&v18];
    id v13 = v18;
    id v14 = (void *)v12;
  }
  else if (*(void *)((char *)v8 + 20))
  {
    id v17 = 0;
    uint64_t v15 = -[AURemoteHost _getBus:scope:error:](self, "_getBus:scope:error:");
    id v16 = v17;
    if (v15)
    {
      id v14 = [v15 valueForKey:v8[1]];
    }
    else
    {
      id v14 = 0;
    }

    id v13 = 0;
  }
  else
  {
    id v13 = 0;
    id v14 = [(AUAudioUnit *)self->_audioUnit valueForKey:v8[1]];
  }
  ((void (**)(void, id, void *))v10)[2](v10, v13, v14);
}

- (void)setValue:(id)a3 forKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v10);
  id v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v13, self);
  [(AUAudioUnit *)self->_audioUnit setValue:v8 forKey:v9];
  uint64_t v12 = PropertyNotificationDeferrer::changedProperties(v13);
  ((void (**)(void, void, void *))v11)[2](v11, 0, v12);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v13);
}

- (void)valueForKey:(id)a3 reply:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  BOOL v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  id v8 = [(AUAudioUnit *)self->_audioUnit valueForKey:v9];
  ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
}

- (void)reset:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  [(AUAudioUnit *)self->_audioUnit reset];
  v4[2](v4, 0);
}

- (void)uninitialize:(id)a3
{
  id v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(AUAudioUnit *)self->_audioUnit deallocateRenderResources];
  id v5 = (void (**)(void, void))v7;
  if (self->_renderServerUser.__engaged_)
  {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
    id v5 = (void (**)(void, void))v7;
    self->_renderServerUser.__engaged_ = 0;
  }
  initializationVoucher = self->_initializationVoucher;
  if (initializationVoucher)
  {
    self->_initializationVoucher = 0;

    maintainWakeMonitor(0);
    id v5 = (void (**)(void, void))v7;
  }
  if (v5)
  {
    ((void (**)(id, void))v5)[2](v7, 0);
    id v5 = (void (**)(void, void))v7;
  }
}

- (void)destroyRenderPipe:(unsigned int)a3 reply:(id)a4
{
  id v5 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v5);
  id v7 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();

  uint64_t v6 = BaseOpaqueObject::ResolveOpaqueRef();
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  v7[2](v7, 0);
}

- (void)createRenderPipe:(int)a3 formats:(id)a4 maxFrames:(unsigned int)a5 midiOutSizeHint:(unsigned int)a6 resources:(id)a7 reply:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  id v24 = a7;
  id v11 = a8;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    _Block_copy(v11);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorjEEEU13block_pointerFvDpT_ES9_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c122_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorjEEEU13block_pointerFvDpT_ES9_iEUlS4_jE__e20_v20__0__NSError_8I16l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    v27 = _Block_copy(v11);
    id v29 = v26;
    id v30 = _Block_copy(v27);
    _Block_copy(aBlock);

    id v12 = v29;
    id v29 = 0;
  }
  id v13 = v25;
  id v14 = (const void *)[v13 bytes];
  uint64_t v15 = [v13 length];
  size_t v16 = v15;
  if (v15)
  {
    if (0xCCCCCCCCCCCCCCCDLL * (v15 >> 3) >= 0x666666666666667) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    id v17 = std::__allocate_at_least[abi:ne180100]<std::allocator<ISOLoudnessInfo>>(0xCCCCCCCCCCCCCCCDLL * (v15 >> 3));
    memmove(v17, v14, v16);
  }
  id v18 = [(AUAudioUnit *)self->_audioUnit inputBusses];
  [v18 count];

  id v19 = [(AUAudioUnit *)self->_audioUnit outputBusses];
  [v19 count];

  id v20 = v24;
  xpc_object_t v21 = v20;
  if (!v20) {
    xpc_object_t v21 = xpc_null_create();
  }

  id v22 = v21;
  id v23 = v22;
  if (!v22 || object_getClass(v22) != (Class)MEMORY[0x1E4F14590])
  {
    xpc_null_create();
  }
  operator new();
}

- (void)updateWorkgroupMirror:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  ptr = self->_workgroupMirror.__ptr_;
  id v9 = v6;
  xpc_object_t v10 = v9;
  if (!v9) {
    xpc_object_t v10 = xpc_null_create();
  }

  id v11 = v10;
  id v12 = v11;
  id v14 = v11;
  if (!v11 || object_getClass(v11) != (Class)MEMORY[0x1E4F14590])
  {
    id v14 = xpc_null_create();
  }
  auoop::WorkgroupMirror::update((auoop::WorkgroupMirror *)ptr, (const applesauce::xpc::dict *)&v14);
  id v13 = v14;
  id v14 = 0;

  v7[2](v7, 0);
}

- (void)updateHostCallbacks:(unint64_t)a3 reply:(id)a4
{
  char v4 = a3;
  id v6 = (void (**)(id, void))a4;
  if (self->_renderServerUser.__engaged_) {
    AUOOPRenderingServerUser::updateHostCallbacks((AUOOPRenderingServerUser *)&self->_renderServerUser, v4);
  }
  v6[2](v6, 0);
}

- (void)initialize:(unint64_t)a3 reply:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    v40 = (void (**)(void *, id, uint64_t, id, uint64_t, void *, BOOL, void))_Block_copy(v6);
  }
  else
  {
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v46 = 3321888768;
    v47 = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrormmmU8__strongP6NSDatabjEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    v48 = &__block_descriptor_48_ea8_32c151_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrormmmU8__strongP6NSDatabjEEEU13block_pointerFvDpT_ESC_iEUlS4_mmmS7_bjE__e43_v56__0__NSError_8Q16Q24Q32__NSData_40B48I52l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    uint64_t v52 = (uint64_t)_Block_copy(v6);
    p_renderServerUser = (optional<AUOOPRenderingServerUser> *)v51;
    id v50 = _Block_copy((const void *)v52);
    v40 = (void (**)(void *, id, uint64_t, id, uint64_t, void *, BOOL, void))_Block_copy(&aBlock);

    id v7 = p_renderServerUser;
    p_renderServerUser = 0;

    id v8 = v51;
    id v51 = 0;
  }
  PropertyNotificationDeferrer::PropertyNotificationDeferrer((PropertyNotificationDeferrer *)v44, self);
  if (self->_renderServerUser.__engaged_)
  {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
    self->_renderServerUser.__engaged_ = 0;
  }
  v39 = self->_audioUnit;
  BaseOpaqueObject::BaseOpaqueObject((BaseOpaqueObject *)&self->_renderServerUser);
  self->_renderServerUser.var0.__val_.id mRetainedRenderBlock = 0;
  self->_renderServerUser.var0.__val_._vptr$CAPrint = (void **)&unk_1EDF93A88;
  self->_renderServerUser.var0.__val_.mAUAudioUnit = v39;
  self->_renderServerUser.var0.__val_.mRenderBlock = 0;
  id v9 = v39;
  if (![(AUAudioUnit *)v9 canProcessInPlace]) {
    goto LABEL_12;
  }
  xpc_object_t v10 = [(AUAudioUnit *)v9 inputBusses];
  uint64_t v11 = [v10 count];
  id v12 = [(AUAudioUnit *)v9 outputBusses];
  uint64_t v13 = [v12 count];

  if (v11 == v13)
  {
    unsigned int v14 = 0;
    while (1)
    {
      uint64_t v15 = [(AUAudioUnit *)v9 inputBusses];
      unint64_t v16 = [v15 count];

      BOOL v17 = v16 > v14;
      BOOL v18 = v16 <= v14;
      if (!v17) {
        break;
      }
      id v19 = [(AUAudioUnit *)v9 inputBusses];
      id v20 = [v19 objectAtIndexedSubscript:v14];
      xpc_object_t v21 = [v20 format];

      id v22 = [(AUAudioUnit *)v9 outputBusses];
      uint64_t v23 = [v22 objectAtIndexedSubscript:v14];
      id v24 = [(id)v23 format];

      LOBYTE(v23) = [v21 isEqual:v24];
      ++v14;
      if ((v23 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    BOOL v18 = 0;
  }

  self->_renderServerUser.var0.__val_.mCanProcessInPlace = v18;
  objc_opt_class();
  self->_renderServerUser.var0.__val_.mIsV2AudioUnit = objc_opt_isKindOfClass() & 1;
  self->_renderServerUser.var0.__val_.mMIDIOutBaseSampleTime = 0;
  self->_renderServerUser.var0.__val_.mEventSchedule = (AUEventSchedule *)[(AUAudioUnit *)v9 eventSchedule];
  self->_renderServerUser.var0.__val_.mSharedBuffers = 0;
  self->_renderServerUser.var0.__val_.mRenderThreadId.var0.__null_state_ = 0;
  self->_renderServerUser.var0.__val_.mRenderThreadId.__engaged_ = 0;
  AUOOPRenderingServerUser::updateHostCallbacks((AUOOPRenderingServerUser *)&self->_renderServerUser, v4);
  if ((v4 & 4) != 0)
  {
    aBlock = (void *)MEMORY[0x1E4F143A8];
    uint64_t v46 = 3221225472;
    v47 = ___ZN24AUOOPRenderingServerUserC2EP11AUAudioUnitm_block_invoke;
    v48 = &__block_descriptor_40_e18_i36__0q8C16q20r_28l;
    p_renderServerUser = &self->_renderServerUser;
    [self->_renderServerUser.var0.__val_.mAUAudioUnit setMIDIOutputEventBlock:&aBlock];
  }
  else
  {
    [self->_renderServerUser.var0.__val_.mAUAudioUnit setMIDIOutputEventBlock:0];
  }
  if ((v4 & 8) != 0)
  {
    id v51 = (id)MEMORY[0x1E4F143A8];
    uint64_t v52 = 3221225472;
    v53 = ___ZN24AUOOPRenderingServerUserC2EP11AUAudioUnitm_block_invoke_2;
    v54 = &__block_descriptor_40_e61_i28__0q8C16r__MIDIEventList_iI_1_MIDIEventPacket_QI_64I____20l;
    v55 = &self->_renderServerUser;
    [self->_renderServerUser.var0.__val_.mAUAudioUnit setMIDIOutputEventListBlock:&v51];
  }
  else
  {
    [self->_renderServerUser.var0.__val_.mAUAudioUnit setMIDIOutputEventListBlock:0];
  }
  id v25 = [self->_renderServerUser.var0.__val_.mAUAudioUnit internalRenderBlock];
  id mRetainedRenderBlock = self->_renderServerUser.var0.__val_.mRetainedRenderBlock;
  self->_renderServerUser.var0.__val_.id mRetainedRenderBlock = v25;

  self->_renderServerUser.var0.__val_.mRenderBlock = self->_renderServerUser.var0.__val_.mRetainedRenderBlock;
  self->_renderServerUser.__engaged_ = 1;
  audioUnit = self->_audioUnit;
  id v43 = 0;
  [(AUAudioUnit *)audioUnit allocateRenderResourcesAndReturnError:&v43];
  id v28 = v43;
  id v51 = 0;
  uint64_t v42 = 0;
  if (v28)
  {
    uint64_t v29 = 0;
    id v30 = 0;
    uint64_t v31 = 0;
    v32 = 0;
  }
  else
  {
    LODWORD(v31) = [(AUAudioUnit *)self->_audioUnit maximumFramesToRender];
    v33 = [(AUAudioUnit *)self->_audioUnit inputBusses];
    id v51 = (id)[v33 count];

    v34 = [(AUAudioUnit *)self->_audioUnit outputBusses];
    uint64_t v42 = [v34 count];

    aBlock = 0;
    uint64_t v46 = 0;
    v47 = 0;
    p_aBlock = &aBlock;
    v35 = [(AUAudioUnit *)self->_audioUnit inputBusses];
    -[AURemoteHost initialize:reply:]::$_2::operator()(&p_aBlock, v35, &v51);

    v36 = [(AUAudioUnit *)self->_audioUnit outputBusses];
    -[AURemoteHost initialize:reply:]::$_2::operator()(&p_aBlock, v36, &v42);

    v32 = [MEMORY[0x1E4F1C9B8] dataWithBytes:aBlock length:v46 - (void)aBlock];
    v37 = (OS_voucher *)voucher_copy();
    initializationVoucher = self->_initializationVoucher;
    self->_initializationVoucher = v37;

    maintainWakeMonitor(1);
    uint64_t v31 = v31;
    if (aBlock)
    {
      uint64_t v46 = (uint64_t)aBlock;
      operator delete(aBlock);
    }
    id v30 = v51;
    uint64_t v29 = v42;
  }
  v40[2](v40, v28, v31, v30, v29, v32, [(AUAudioUnit *)self->_audioUnit canProcessInPlace], self->_renderServerUser.var0.__val_.mSerialNum);

  PropertyNotificationDeferrer::~PropertyNotificationDeferrer(v44);
}

- (void)initialize:reply:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  *a3 = objc_msgSend(v5, "count", v5);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v32 + 1) + 8 * i);
        xpc_object_t v10 = [v9 format];
        uint64_t v11 = v10;
        uint64_t v31 = 0;
        long long v29 = 0u;
        long long v30 = 0u;
        if (v10)
        {
          uint64_t v12 = [v10 streamDescription];
          long long v29 = *(_OWORD *)v12;
          long long v30 = *(_OWORD *)(v12 + 16);
          uint64_t v31 = *(void *)(v12 + 32);
        }
        uint64_t v13 = *a1;
        unsigned int v14 = (char *)(*a1)[1];
        uint64_t v15 = (char *)(*a1)[2];
        if (v14 >= v15)
        {
          unint64_t v17 = 0xCCCCCCCCCCCCCCCDLL * ((v14 - (unsigned char *)*v13) >> 3);
          unint64_t v18 = v17 + 1;
          if (v17 + 1 > 0x666666666666666) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v19 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - (unsigned char *)*v13) >> 3);
          if (2 * v19 > v18) {
            unint64_t v18 = 2 * v19;
          }
          if (v19 >= 0x333333333333333) {
            unint64_t v20 = 0x666666666666666;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20) {
            unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ISOLoudnessInfo>>(v20);
          }
          else {
            uint64_t v21 = 0;
          }
          unint64_t v22 = v20 + 40 * v17;
          *(_OWORD *)unint64_t v22 = v29;
          *(_OWORD *)(v22 + 16) = v30;
          *(void *)(v22 + 32) = v31;
          id v24 = (char *)*v13;
          uint64_t v23 = (char *)v13[1];
          id v25 = (char *)v22;
          if (v23 != *v13)
          {
            do
            {
              long long v26 = *(_OWORD *)(v23 - 40);
              long long v27 = *(_OWORD *)(v23 - 24);
              *((void *)v25 - 1) = *((void *)v23 - 1);
              *(_OWORD *)(v25 - 24) = v27;
              *(_OWORD *)(v25 - 40) = v26;
              v25 -= 40;
              v23 -= 40;
            }
            while (v23 != v24);
            uint64_t v23 = (char *)*v13;
          }
          unint64_t v16 = (void *)(v22 + 40);
          *uint64_t v13 = v25;
          v13[1] = (void *)(v22 + 40);
          id v13[2] = (void *)(v20 + 40 * v21);
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *(_OWORD *)unsigned int v14 = v29;
          *((_OWORD *)v14 + 1) = v30;
          *((void *)v14 + 4) = v31;
          unint64_t v16 = v14 + 40;
        }
        v13[1] = v16;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v6);
  }
}

- (void)getBusses:(unsigned int)a3 reply:(id)a4
{
  id v6 = a4;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v6);
  xpc_object_t v10 = (void (**)(id, void, void *))objc_claimAutoreleasedReturnValue();

  audioUnit = self->_audioUnit;
  if (a3 == 1) {
    [(AUAudioUnit *)audioUnit inputBusses];
  }
  else {
  id v8 = [(AUAudioUnit *)audioUnit outputBusses];
  }
  id v9 = MarshalBusArray(v8, a3);
  v10[2](v10, 0, v9);
}

- (void)open:(AudioComponentDescription *)a3 instanceUUID:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_replyWatchdogFactory.mDebugging)
  {
    xpc_object_t v10 = _Block_copy(v9);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = ___ZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbbU8__strongP7NSArrayS8_bbimmEEEU13block_pointerFvDpT_ESC_i_block_invoke;
    aBlock[3] = &__block_descriptor_48_ea8_32c162_ZTSKZN5caulk3xpc22reply_watchdog_factory18reply_with_timeoutIJU8__strongP7NSErrorbbU8__strongP7NSArrayS8_bbimmEEEU13block_pointerFvDpT_ESC_iEUlS4_bbS7_S7_bbimmE__e62_v68__0__NSError_8B16B20__NSArray_24__NSArray_32B40B44i48Q52Q60l;
    caulk::xpc::reply_watchdog_factory::make_timer((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory);
    unint64_t v22 = _Block_copy(v9);
    id v24 = v21;
    id v25 = _Block_copy(v22);
    xpc_object_t v10 = _Block_copy(aBlock);

    id v11 = v24;
    id v24 = 0;

    id v12 = v21;
    id v21 = 0;
  }
  uint64_t v13 = [(AURemoteHost *)self audioUnitUUID];
  if ([v13 isEqual:v8])
  {
    audioUnit = self->_audioUnit;

    if (audioUnit)
    {
      [(AURemoteHost *)self openImpl:self->_audioUnit reply:v10];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__AURemoteHost_open_instanceUUID_reply___block_invoke;
  v17[3] = &unk_1E5680DA0;
  long long v19 = *(_OWORD *)&a3->componentType;
  UInt32 componentFlagsMask = a3->componentFlagsMask;
  v17[4] = self;
  id v18 = v10;
  uint64_t v15 = (void (**)(void))_Block_copy(v17);
  pid_t v16 = [(NSXPCConnection *)self->_remoteHostXPCConnection processIdentifier];
  if (v16 == getpid()) {
    v15[2](v15);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v15);
  }

LABEL_12:
}

void __40__AURemoteHost_open_instanceUUID_reply___block_invoke(uint64_t a1)
{
  long long v5 = *(_OWORD *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__AURemoteHost_open_instanceUUID_reply___block_invoke_2;
  v3[3] = &unk_1E5680D78;
  id v2 = *(id *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  +[AUAudioUnit instantiateWithComponentDescription:&v5 options:2147483650 completionHandler:v3];
}

void __40__AURemoteHost_open_instanceUUID_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v8 || v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    pid_t v7 = getpid();
    (*(void (**)(uint64_t, id, void, void, void, void, void, void, pid_t, void, void))(v6 + 16))(v6, v5, 0, 0, 0, 0, 0, 0, v7, 0, 0);
  }
  else
  {
    [*(id *)(a1 + 32) openImpl:v8 reply:*(void *)(a1 + 40)];
  }
}

- (void)openImpl:(id)a3 reply:(id)a4
{
  id v7 = a3;
  a4;
  objc_storeStrong((id *)&self->_audioUnit, a3);

  [v7 setLoadedOutOfProcess];
  getpid();
  operator new();
}

- (void)setBlocks
{
  objc_initWeak(&location, self->_remoteHostXPCConnection);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__AURemoteHost_setBlocks__block_invoke;
  v6[3] = &unk_1E5680D28;
  objc_copyWeak(&v7, &location);
  [(AUAudioUnit *)self->_audioUnit setProfileChangedBlock:v6];
  uint64_t v3 = [(AURemoteHost *)self _getSpeechSynthesisProviderAudioUnit];
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __25__AURemoteHost_setBlocks__block_invoke_3;
    v4[3] = &unk_1E5680D50;
    objc_copyWeak(&v5, &location);
    [v3 setSpeechSynthesisOutputMetadataBlock:v4];
    objc_destroyWeak(&v5);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __25__AURemoteHost_setBlocks__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = &unk_1EDF9E4D0;
  v12[1] = &__block_literal_global_22;
  v12[3] = v12;
  caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v13, WeakRetained, (uint64_t)v12);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v12);

  id v11 = caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v13);
  [v11 MIDICIProfileChanged:a2 channel:a3 profile:v9 enabled:a5];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v14);
}

void __25__AURemoteHost_setBlocks__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = &unk_1EDF9E4D0;
  v9[1] = &__block_literal_global_25_1688;
  v9[3] = v9;
  caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::message(&v10, WeakRetained, (uint64_t)v9);
  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v9);

  id v8 = caulk::xpc::message<objc_object  {objcproto23AUAudioUnitHostProtocol}* {__strong}>::async_proxy(&v10);
  [v8 speechSynthesisMetadataAvailable:v5 speechRequest:v6];

  _ZNSt3__110__function12__value_funcIFvP7NSErrorONS_5tupleIJEEEEED2B8ne180100Ev(v11);
}

- (void)dealloc
{
  value = self->_transactorIO.__ptr_.__value_;
  if (value) {
    XOSTransactor::endTransaction(value);
  }
  presetFolderWatcher = self->_presetFolderWatcher;
  if (presetFolderWatcher)
  {
    dispatch_source_cancel(presetFolderWatcher);
    id v5 = self->_presetFolderWatcher;
    self->_presetFolderWatcher = 0;

    presetMonitoringQueue = self->_presetMonitoringQueue;
    self->_presetMonitoringQueue = 0;
  }
  id v7 = +[AUAudioUnitProperty propertyWithKey:@"inputBusses"];
  [(AURemoteHost *)self removePropertyObserver:v7 context:self reply:&__block_literal_global_12];

  id v8 = +[AUAudioUnitProperty propertyWithKey:@"outputBusses"];
  [(AURemoteHost *)self removePropertyObserver:v8 context:self reply:&__block_literal_global_17];

  if (self->_renderServerUser.__engaged_)
  {
    AUOOPRenderingServerUser::~AUOOPRenderingServerUser((AUOOPRenderingServerUser *)&self->_renderServerUser);
    self->_renderServerUser.__engaged_ = 0;
  }
  KVOAggregator::removeAllObservations(&self->_kvoAggregator, &self->super);
  begin = self->_remoteMessageChannels.__begin_;
  var0 = self->_remoteMessageChannels.var0;
  if (begin != var0)
  {
    do
    {
      id v11 = *begin;
      [(__end_ *)v11 retainSelfIfRequired];

      ++begin;
    }
    while (begin != var0);
    id v12 = self->_remoteMessageChannels.__begin_;
    begin = self->_remoteMessageChannels.var0;
    if (begin != v12)
    {
      do
      {
        uint64_t v13 = *--begin;
      }
      while (begin != v12);
      begin = v12;
    }
  }
  self->_remoteMessageChannels.var0 = begin;
  v14.receiver = self;
  v14.super_class = (Class)AURemoteHost;
  [(AURemoteHost *)&v14 dealloc];
}

- (void)close:(id)a3
{
  id v4 = a3;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFactory, v4);
  id v8 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();

  KVOAggregator::removeAllObservations(&self->_kvoAggregator, &self->super);
  [(AUAudioUnit *)self->_audioUnit setProfileChangedBlock:0];
  id v5 = [(AURemoteHost *)self _getSpeechSynthesisProviderAudioUnit];
  id v6 = v5;
  if (v5) {
    [v5 setSpeechSynthesisOutputMetadataBlock:0];
  }

  remoteHostXPCConnection = self->_remoteHostXPCConnection;
  self->_remoteHostXPCConnection = 0;

  v8[2](v8, 0);
}

- (id)_getSpeechSynthesisProviderAudioUnit
{
  if ([(AUAudioUnit *)self->_audioUnit isSpeechSynthesisProvider]) {
    audioUnit = self->_audioUnit;
  }
  else {
    audioUnit = 0;
  }
  return audioUnit;
}

- (AURemoteHost)initWithConnection:(id)a3 config:(id)a4
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1EDF9E638;
  v6[3] = v6;
  id v4 = [(AURemoteHost *)self initWithConnection:a3 config:a4 timeOutHandler:v6];
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v6);
  return v4;
}

- (void)initWithConnection:config:
{
}

- (AURemoteHost)initWithConnection:(id)a3 config:(id)a4 timeOutHandler:(function<void)(
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  +[AURemoteHost _staticInit];
  v22.receiver = self;
  v22.super_class = (Class)AURemoteHost;
  id v9 = [(AURemoteHost *)&v22 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("AUExtension.propertyObserver", 0);
    propertyObserverQueue = v9->_propertyObserverQueue;
    v9->_propertyObserverQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    pendingChangedProperties = v9->_pendingChangedProperties;
    v9->_pendingChangedProperties = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_remoteHostXPCConnection, a3);
    uint64_t v14 = objc_opt_new();
    audioUnitUUID = v9->_audioUnitUUID;
    v9->_audioUnitUUID = (NSUUID *)v14;

    {
      if (v21)
      {
        ServiceProcessGlobals::ServiceProcessGlobals(v21);
      }
    }
    uint64_t v16 = ServiceProcessGlobals::instance(void)::global;
    uint64_t v17 = ServiceProcessGlobals::instance(void)::global;
    if (ServiceProcessGlobals::instance(void)::global) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(ServiceProcessGlobals::instance(void)::global + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_workgroupMirror.__cntrl_;
    v9->_workgroupMirror.__ptr_ = (WorkgroupMirror *)v16;
    v9->_workgroupMirror.__cntrl_ = (__shared_weak_count *)v17;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v23, (uint64_t)a5);
    caulk::xpc::reply_watchdog_factory::init2();
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v23);
    long long v19 = v9;
  }

  return v9;
}

- (BOOL)_identifyBus:(id)a3 scope:(unsigned int *)a4 element:(unsigned int *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = (AUAudioUnit *)a3;
  audioUnit = self->_audioUnit;
  if (audioUnit == v8)
  {
    *a4 = 0;
    *a5 = 0;
LABEL_22:
    BOOL v22 = 1;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    dispatch_queue_t v10 = [(AUAudioUnit *)audioUnit inputBusses];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      int v12 = 0;
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        uint64_t v14 = 0;
        int v15 = v12;
        v12 += v11;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          if (*(AUAudioUnit **)(*((void *)&v28 + 1) + 8 * v14) == v8)
          {
            *a4 = 1;
            *a5 = v15 + v14;

            goto LABEL_22;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v16 = [(AUAudioUnit *)self->_audioUnit outputBusses];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      int v18 = 0;
      uint64_t v19 = *(void *)v25;
      while (2)
      {
        uint64_t v20 = 0;
        int v21 = v18;
        v18 += v17;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          if (*(AUAudioUnit **)(*((void *)&v24 + 1) + 8 * v20) == v8)
          {
            *a4 = 1;
            *a5 = v21 + v20;

            goto LABEL_22;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    BOOL v22 = 0;
  }

  return v22;
}

- (id)_getBus:(unsigned int)a3 scope:(unsigned int)a4 error:(id *)a5
{
  if (a4 == 2)
  {
    id v7 = [(AUAudioUnit *)self->_audioUnit outputBusses];
LABEL_5:
    id v8 = v7;
    if ([v7 count] > (unint64_t)a3)
    {
      id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:");
      goto LABEL_13;
    }
    if (a5)
    {
      dispatch_queue_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10877 userInfo:0];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a4 == 1)
  {
    id v7 = [(AUAudioUnit *)self->_audioUnit inputBusses];
    goto LABEL_5;
  }
  id v8 = 0;
  if (a5)
  {
    dispatch_queue_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10866 userInfo:0];
LABEL_11:
    id v9 = 0;
    *a5 = v10;
    goto LABEL_13;
  }
LABEL_12:
  id v9 = 0;
LABEL_13:

  return v9;
}

+ (void)_staticInit
{
  if (+[AURemoteHost _staticInit]::once[0] != -1) {
    dispatch_once(+[AURemoteHost _staticInit]::once, &__block_literal_global_1696);
  }
}

void __27__AURemoteHost__staticInit__block_invoke()
{
  if (initInterAppAudioLogging::once != -1) {
    dispatch_once(&initInterAppAudioLogging::once, &__block_literal_global_13085);
  }
}

@end
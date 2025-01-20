@interface AUAudioUnitV2Bridge
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (AUAudioUnitV2Bridge)initWithAudioUnit:(OpaqueAudioComponentInstance *)a3 description:(AudioComponentDescription *)a4;
- (AUAudioUnitV2Bridge)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5;
- (AudioUnit)audioUnit;
- (BOOL)_elementCountWritable:(unsigned int)a3;
- (BOOL)_setElementCount:(unsigned int)a3 count:(unsigned int)a4 error:(id *)a5;
- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3;
- (BOOL)providesUserInterface;
- (__n128)_valueForProperty:error:;
- (id).cxx_construct;
- (id)MIDIOutputEventBlock;
- (id)MIDIOutputEventListBlock;
- (id)_buildNewParameterTree;
- (id)_createParameterTree;
- (id)_valueForProperty:(id)a3 error:(id *)a4;
- (id)channelCapabilities;
- (id)inputBusses;
- (id)internalRenderBlock;
- (id)osWorkgroup;
- (id)outputBusses;
- (id)parameterTree;
- (id)parametersForOverviewWithCount:(int64_t)a3;
- (int)enableBus:(unsigned int)a3 scope:(unsigned int)a4 enable:(BOOL)a5;
- (uint64_t)invalidateAudioUnit;
- (unsigned)_elementCount:(unsigned int)a3;
- (void)_createEventListenerQueue;
- (void)_invalidateParameterTree:(unsigned int)a3;
- (void)_notifyParameterChange:(unint64_t)a3;
- (void)_rebuildBusses:(unsigned int)a3;
- (void)_setValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)_valueForProperty:error:;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)deliverV2Parameters:(const AURenderEvent *)a3;
- (void)init2;
- (void)internalDeallocateRenderResources;
- (void)invalidateAudioUnit;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)requestViewControllerWithCompletionHandler:(id)a3;
- (void)reset;
- (void)setCurrentPreset:(id)a3;
- (void)setFullState:(id)a3;
- (void)setFullStateForDocument:(id)a3;
- (void)setMIDIOutputEventBlock:(id)a3;
- (void)setMIDIOutputEventListBlock:(id)a3;
- (void)setMusicalContextBlock:(id)a3;
- (void)setTransportStateBlock:(id)a3;
@end

@implementation AUAudioUnitV2Bridge

- (id).cxx_construct
{
  *((unsigned char *)self + 601) = 0;
  *((_DWORD *)self + 151) = 0;
  *((void *)self + 82) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_MIDIOutputEventListBlock, 0);
  objc_storeStrong(&self->_MIDIOutputEventBlock, 0);
  value = self->_renderer.__ptr_.__value_;
  self->_renderer.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<AUAudioUnitV2Bridge_Renderer>::operator()[abi:ne180100](value);
  }
  objc_storeStrong((id *)&self->_cachedParameterTree, 0);
  objc_storeStrong((id *)&self->_outputBusses, 0);
  objc_storeStrong((id *)&self->_inputBusses, 0);
  objc_storeStrong((id *)&self->_parameterTreeRebuildQueue, 0);
  objc_storeStrong((id *)&self->_eventListenerQueue, 0);
}

- (id)osWorkgroup
{
  outData = 0;
  UInt32 ioDataSize = 8;
  OSStatus Property = AudioUnitGetProperty([(AUAudioUnitV2Bridge *)self audioUnit], 0x7DFu, 0, 0, &outData, &ioDataSize);
  if (outData) {
    BOOL v3 = Property == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    v4 = outData;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (void)_setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  CFDictionaryRef v16 = (const __CFDictionary *)a3;
  id v8 = a4;
  if ([v8 isEqualToString:@"fullStateForDocument"])
  {
    int v9 = setStateAndNotify(v16, self, 50);
    if (!a5) {
      goto LABEL_20;
    }
    if (v9)
    {
LABEL_12:
      v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v9 userInfo:0];
LABEL_18:
      id v15 = v11;
      *a5 = v15;

      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"fullState"])
  {
    int v9 = setStateAndNotify(v16, self, 0);
    if (!a5) {
      goto LABEL_20;
    }
    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  if ([v8 isEqualToString:@"currentPreset"])
  {
    int v9 = setPresentPresetAndNotify(self, (AUAudioUnitPreset *)v16);
    if (!a5) {
      goto LABEL_20;
    }
    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  v12 = AUAudioUnitProperties::infoForKey((AUAudioUnitProperties *)v8, v10);
  if (v12)
  {
    audioUnit = self->_audioUnit;
    CFDictionaryRef v17 = v16;
    uint64_t v13 = v12[18];
    if (!v13) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    int v14 = (*(uint64_t (**)(uint64_t, OpaqueAudioComponentInstance **, const __CFDictionary **))(*(void *)v13 + 48))(v13, &audioUnit, &v17);

    if (a5)
    {
      if (v14)
      {
        v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
        goto LABEL_18;
      }
LABEL_19:
      *a5 = 0;
    }
  }
  else
  {
    [(AUAudioUnitV2Bridge *)self setValue:v16 forKey:v8];
  }
LABEL_20:
}

- (id)_valueForProperty:(id)a3 error:(id *)a4
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([*((id *)v6 + 1) isEqualToString:@"_v2fwd_PropertySize"])
  {
    UInt32 outDataSize = 0;
    outWritable[0] = 0;
    OSStatus PropertyInfo = AudioUnitGetPropertyInfo(self->_audioUnit, *((_DWORD *)v6 + 4), *((_DWORD *)v6 + 5), *((_DWORD *)v6 + 6), &outDataSize, outWritable);
    if (a4)
    {
      if (PropertyInfo)
      {
        id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:PropertyInfo userInfo:0];
        *a4 = v8;
      }
      else
      {
        *a4 = 0;
      }
    }
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:outDataSize];
    goto LABEL_16;
  }
  if ([*((id *)v6 + 1) isEqualToString:@"_v2bridge_providesUserInterface"])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AUAudioUnitV2Bridge providesUserInterface](self, "providesUserInterface"));
LABEL_16:
    id v15 = (id)v10;
    goto LABEL_17;
  }
  v11 = AUAudioUnitProperties::infoForKey(*((AUAudioUnitProperties **)v6 + 1), v9);
  if (!v11)
  {
    uint64_t v10 = [(AUAudioUnitV2Bridge *)self valueForKey:*((void *)v6 + 1)];
    goto LABEL_16;
  }
  if (([*((id *)v6 + 1) isEqualToString:@"fullState"] & 1) == 0
    && ![*((id *)v6 + 1) isEqualToString:@"fullStateForDocument"])
  {
    uint64_t v10 = std::function<objc_object * ()(OpaqueAudioComponentInstance *,NSError * {__autoreleasing}*)>::operator()(v11[14], (uint64_t)[(AUAudioUnitV2Bridge *)self audioUnit], (uint64_t)a4);
    goto LABEL_16;
  }
  *(void *)outWritable = 0;
  AudioUnit v12 = [(AUAudioUnitV2Bridge *)self audioUnit];
  uint64_t v13 = operator new(0x28uLL);
  *uint64_t v13 = &unk_1EDF9E680;
  v13[1] = v12;
  v13[2] = outWritable;
  v13[3] = v11;
  v13[4] = &v18;
  v24[3] = v13;
  LOBYTE(v12) = dispatch_to_main_queue_with_timeout((uint64_t)v24);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v24);
  *a4 = *(id *)outWritable;
  if ((v12 & 1) == 0)
  {
    if (kInterAppAudioScope)
    {
      int v14 = *(id *)kInterAppAudioScope;
      if (!v14) {
        goto LABEL_26;
      }
    }
    else
    {
      int v14 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      UInt32 outDataSize = 136315394;
      v21 = "AUAudioUnitV2Bridge.mm";
      __int16 v22 = 1024;
      int v23 = 1781;
      _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d getState: failed to execute on the main queue. Falling back to secondary thread.", (uint8_t *)&outDataSize, 0x12u);
    }
  }
LABEL_26:
  id v15 = v18;

LABEL_17:
  return v15;
}

- (void)_valueForProperty:error:
{
}

- (__n128)_valueForProperty:error:
{
  v2 = (char *)operator new(0x28uLL);
  *(void *)v2 = &unk_1EDF9E680;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

- (void)setCurrentPreset:(id)a3
{
  v4 = (AUAudioUnitPreset *)a3;
  [(AUAudioUnit *)self flushEventSchedule];
  setPresentPresetAndNotify(self, v4);
}

- (void)setFullStateForDocument:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  [(AUAudioUnit *)self flushEventSchedule];
  if (setStateAndNotify(v4, self, 50)) {
    setStateAndNotify(v4, self, 0);
  }
}

- (void)setFullState:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  [(AUAudioUnit *)self flushEventSchedule];
  setStateAndNotify(v4, self, 0);
}

- (BOOL)providesUserInterface
{
  UInt32 outDataSize = 0;
  Boolean outWritable = 0;
  OSStatus PropertyInfo = AudioUnitGetPropertyInfo(self->_audioUnit, 0x38u, 0, 0, &outDataSize, &outWritable);
  BOOL result = 0;
  if (PropertyInfo) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = outDataSize == 8;
  }
  if (v4) {
    return outWritable != 0;
  }
  return result;
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  inData = v4;
  if ([(AUAudioUnitV2Bridge *)self providesUserInterface])
  {
    OSStatus v5 = AudioUnitSetProperty(self->_audioUnit, 0x38u, 0, 0, &inData, 8u);
    BOOL v4 = inData;
    if (v5)
    {
      inData[2](inData, 0);
      BOOL v4 = inData;
    }
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  v7 = (AUAudioUnitProperties *)a4;
  int v9 = v7;
  if (!self->_removingObserverWithContext)
  {
    uint64_t v10 = AUAudioUnitProperties::infoForKey(v7, v8);
    if (v10)
    {
      AudioUnitRemovePropertyListenerWithUserData(self->_audioUnit, v10[5], (AudioUnitPropertyListenerProc)V2BridgePropertyListener, self);
    }
    else if ([(AUAudioUnitProperties *)v9 isEqualToString:@"allParameterValues"])
    {
      inEvent.mEventType = kAudioUnitEvent_ParameterValueChange;
      *(_OWORD *)&inEvent.mArgument.mParameter.mAudioUnit = (unint64_t)self->_audioUnit;
      inEvent.mArgument.mParameter.mElement = 0;
      AUEventListenerRemoveEventType(self->_eventListener, v6, &inEvent);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnitV2Bridge *)&v11 removeObserver:v6 forKeyPath:v9];
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8 = a3;
  int v9 = (AUAudioUnitProperties *)a4;
  self->_removingObserverWithContext = 1;
  objc_super v11 = AUAudioUnitProperties::infoForKey(v9, v10);
  if (v11)
  {
    AudioUnitRemovePropertyListenerWithUserData(self->_audioUnit, v11[5], (AudioUnitPropertyListenerProc)V2BridgePropertyListener, self);
  }
  else if ([(AUAudioUnitProperties *)v9 isEqualToString:@"allParameterValues"])
  {
    inEvent.mEventType = kAudioUnitEvent_ParameterValueChange;
    *(_OWORD *)&inEvent.mArgument.mParameter.mAudioUnit = (unint64_t)self->_audioUnit;
    inEvent.mArgument.mParameter.mElement = 0;
    AUEventListenerRemoveEventType(self->_eventListener, v8, &inEvent);
  }
  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnitV2Bridge *)&v12 removeObserver:v8 forKeyPath:v9 context:a5];
  self->_removingObserverWithContext = 0;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10 = a3;
  objc_super v11 = (AUAudioUnitProperties *)a4;
  uint64_t v13 = AUAudioUnitProperties::infoForKey(v11, v12);
  if (v13)
  {
    AudioUnitAddPropertyListener(self->_audioUnit, v13[5], (AudioUnitPropertyListenerProc)V2BridgePropertyListener, self);
  }
  else if ([(AUAudioUnitProperties *)v11 isEqualToString:@"allParameterValues"])
  {
    eventListener = self->_eventListener;
    if (!eventListener)
    {
      [(AUAudioUnitV2Bridge *)self _createEventListenerQueue];
      *(void *)&inEvent.mEventType = 0;
      inEvent.mArgument.mParameter.mAudioUnit = (AudioUnit)&inEvent;
      *(void *)&inEvent.mArgument.mProperty.mPropertyID = 0x3032000000;
      *(void *)&inEvent.mArgument.mProperty.mElement = __Block_byref_object_copy__9350;
      v19 = __Block_byref_object_dispose__9351;
      v20 = self;
      eventListenerQueue = v20->_eventListenerQueue;
      inBlock[0] = MEMORY[0x1E4F143A8];
      inBlock[1] = 3221225472;
      inBlock[2] = __62__AUAudioUnitV2Bridge_addObserver_forKeyPath_options_context___block_invoke;
      inBlock[3] = &unk_1E56881E0;
      inBlock[4] = &inEvent;
      AUEventListenerCreateWithDispatchQueue(&self->_eventListener, 0.05, 0.05, eventListenerQueue, inBlock);
      _Block_object_dispose(&inEvent, 8);

      eventListener = self->_eventListener;
    }
    inEvent.mEventType = kAudioUnitEvent_ParameterValueChange;
    inEvent.mArgument.mParameter.mAudioUnit = self->_audioUnit;
    *(void *)&inEvent.mArgument.mProperty.mPropertyID = 0xFFFFFFFFLL;
    inEvent.mArgument.mParameter.mElement = 0;
    AUEventListenerAddEventType(eventListener, v10, &inEvent);
  }
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnitV2Bridge *)&v16 addObserver:v10 forKeyPath:v11 options:a5 context:a6];
}

uint64_t __62__AUAudioUnitV2Bridge_addObserver_forKeyPath_options_context___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16) == -1)
  {
    uint64_t v3 = result;
    [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) willChangeValueForKey:@"allParameterValues"];
    BOOL v4 = *(void **)(*(void *)(*(void *)(v3 + 32) + 8) + 40);
    return [v4 didChangeValueForKey:@"allParameterValues"];
  }
  return result;
}

- (id)channelCapabilities
{
  UInt32 outDataSize = 0;
  uint64_t v3 = 0;
  if (!AudioUnitGetPropertyInfo(self->_audioUnit, 0xDu, 0, 0, &outDataSize, 0))
  {
    if (outDataSize >= 2)
    {
      unint64_t v6 = (unint64_t)outDataSize >> 1;
      BOOL v4 = (__int16 *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v6);
      bzero(v4, 2 * v6);
      OSStatus v5 = &v4[v6];
    }
    else
    {
      BOOL v4 = 0;
      OSStatus v5 = 0;
    }
    if (AudioUnitGetProperty(self->_audioUnit, 0xDu, 0, 0, v4, &outDataSize))
    {
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5 - v4];
      if (v4 != v5)
      {
        v7 = v4;
        do
        {
          id v8 = [NSNumber numberWithShort:*v7];
          [v3 addObject:v8];

          ++v7;
        }
        while (v7 != v5);
      }
    }
    if (v4) {
      operator delete(v4);
    }
  }
  return v3;
}

- (id)parameterTree
{
  id v8 = self;
  cachedParameterTree = self->_cachedParameterTree;
  if (!cachedParameterTree)
  {
    id v7 = [(AUAudioUnitV2Bridge *)self _buildNewParameterTree];
    parameterTreeRebuildQueue = self->_parameterTreeRebuildQueue;
    v6[0] = &v8;
    v6[1] = &v7;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN10applesauce8dispatch2v19sync_implIZ36__AUAudioUnitV2Bridge_parameterTree_E3__5EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v6;
    dispatch_sync(parameterTreeRebuildQueue, block);

    cachedParameterTree = v8->_cachedParameterTree;
  }
  return cachedParameterTree;
}

- (id)_createParameterTree
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  if (!self->_audioUnit)
  {
    v97 = 0;
    goto LABEL_114;
  }
  [(AUAudioUnitV2Bridge *)self _createEventListenerQueue];
  if (!self->_parameterListener)
  {
    objc_initWeak(location, self);
    eventListenerQueue = self->_eventListenerQueue;
    inBlock[0] = MEMORY[0x1E4F143A8];
    inBlock[1] = 3221225472;
    inBlock[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke;
    inBlock[3] = &unk_1E5688118;
    objc_copyWeak(&v116, location);
    AUEventListenerCreateWithDispatchQueue(&self->_parameterListener, 0.0, 0.0, eventListenerQueue, inBlock);
    objc_destroyWeak(&v116);
    objc_destroyWeak(location);
  }
  v113 = self;
  AudioUnit inUnit = [(AUAudioUnitV2Bridge *)v113 audioUnit];
  v101 = v113;

  audioUnit = self->_audioUnit;
  v103 = objc_opt_new();
  v102 = audioUnit;
  for (uint64_t i = 0; i != 8; ++i)
  {
    unsigned int v107 = [(AUAudioUnitV2Bridge *)v113 _elementCount:i];
    if (i && !v107) {
      continue;
    }
    UInt32 outDataSize = 4;
    if (AudioUnitGetPropertyInfo(inUnit, 3u, i, 0, &outDataSize, 0) || outDataSize < 4) {
      continue;
    }
    std::vector<unsigned int>::size_type v7 = (unint64_t)outDataSize >> 2;
    std::vector<unsigned int>::vector(&v119, v7);
    if (!AudioUnitGetProperty(inUnit, 3u, i, 0, v119.__begin_, &outDataSize))
    {
      long long v117 = 0uLL;
      v118 = 0;
      v133 = (id *)&v118;
      id v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v7);
      uint64_t v10 = *((void *)&v117 + 1);
      uint64_t v11 = v117;
      if (*((void *)&v117 + 1) == (void)v117)
      {
        int64x2_t v16 = vdupq_n_s64(*((unint64_t *)&v117 + 1));
        objc_super v12 = v8;
      }
      else
      {
        objc_super v12 = v8;
        do
        {
          uint64_t v13 = *(void *)(v10 - 24);
          v10 -= 24;
          int v14 = *(_DWORD *)(v10 + 8);
          *((void *)v12 - 3) = v13;
          v12 -= 24;
          *((_DWORD *)v12 + 2) = v14;
          uint64_t v15 = *(void *)(v10 + 16);
          *(void *)(v10 + 16) = 0;
          *((void *)v12 + 2) = v15;
        }
        while (v10 != v11);
        int64x2_t v16 = (int64x2_t)v117;
      }
      *(void *)&long long v117 = v12;
      *((void *)&v117 + 1) = v8;
      int64x2_t v131 = v16;
      id v17 = (UInt32 *)v118;
      v118 = &v8[24 * v9];
      v132 = v17;
      outData = (unsigned int *)v16.i64[0];
      std::__split_buffer<ParameterTreeBuilder::ClumpableParam>::~__split_buffer((uint64_t)&outData);
      std::vector<unsigned int>::pointer begin = v119.__begin_;
      std::vector<unsigned int>::pointer end = v119.__end_;
      if (v119.__begin_ != v119.__end_)
      {
        uint64_t v19 = 0;
        while (1)
        {
          uint64_t v20 = *begin;
          uint64_t v146 = 0;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          *(_OWORD *)location = 0u;
          long long v141 = 0u;
          UInt32 ioDataSize = 104;
          if (!AudioUnitGetProperty(inUnit, 4u, i, v20, location, &ioDataSize)) {
            break;
          }
LABEL_72:
          if (++begin == end) {
            goto LABEL_73;
          }
        }
        v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v20);
        if ((v146 & 0x8000000) != 0)
        {
          if ((v146 & 0x10) != 0) {
            id v106 = (id)*((void *)&v144 + 1);
          }
          else {
            id v106 = *((id *)&v144 + 1);
          }
        }
        else if (LOBYTE(location[0]))
        {
          id v106 = [NSString stringWithUTF8String:location];
        }
        else
        {
          id v106 = 0;
        }
        if (v145 == 1)
        {
          outData = 0;
          UInt32 ioDataSize = 8;
          AudioUnitGetProperty(inUnit, 0x10u, i, v20, &outData, &ioDataSize);
          v105 = outData;
        }
        else
        {
          v105 = 0;
        }
        v136[0] = 0;
        __int16 v22 = 0;
        if (!AudioUnitGetPropertyInfo(inUnit, 0x2Du, i, v20, v136, 0) && v136[0])
        {
          outData = 0;
          int64x2_t v131 = 0uLL;
          std::vector<AUDependentParameter>::resize((char **)&outData, (unint64_t)v136[0] >> 3);
          int v23 = outData;
          if (AudioUnitGetProperty(inUnit, 0x2Du, i, v20, outData, v136))
          {
            __int16 v22 = 0;
          }
          else
          {
            std::vector<AUDependentParameter>::resize((char **)&outData, (unint64_t)v136[0] >> 3);
            __int16 v22 = objc_opt_new();
            int v23 = outData;
            v24 = (unsigned int *)v131.i64[0];
            for (j = outData; j != v24; j += 2)
            {
              v26 = [NSNumber numberWithLongLong:j[1] | ((unint64_t)*j << 61)];
              [v22 addObject:v26];
            }
          }
          if (v23)
          {
            v131.i64[0] = (uint64_t)v23;
            operator delete(v23);
          }
        }
        LODWORD(outData) = 0;
        AudioUnitGetParameter(inUnit, v20, i, 0, (AudioUnitParameterValue *)&outData);
        uint64_t v27 = (i << 61) | v20;
        uint64_t v28 = v146 & 0xF7FFFFEF;
        v29 = (void *)*((void *)&v143 + 1);
        if (v145 != 26) {
          v29 = 0;
        }
        id v30 = v29;
        LODWORD(v32) = DWORD2(v145);
        LODWORD(v31) = DWORD1(v145);
        v33 = +[AUParameterTree createParameterWithIdentifier:v21 name:v106 address:v27 min:v145 max:v30 unit:v28 unitName:v31 flags:v32 valueStrings:v105 dependentParameters:v22];
        LODWORD(v34) = HIDWORD(v145);
        objc_msgSend(v33, "set_defaultValue:", v34);
        objc_msgSend(v33, "set_originalOrder:", v19);
        id v35 = v33;

        LODWORD(v36) = outData;
        [v35 setValue:v36];
        if ((v146 & 0x100000) != 0)
        {
          objc_msgSend(v35, "set_clumpID:", v144);
          int v41 = v144;
          id v42 = v35;
          id v43 = v42;
          uint64_t v44 = *((void *)&v117 + 1);
          if (*((void *)&v117 + 1) < (unint64_t)v118)
          {
            **((_DWORD **)&v117 + 1) = v41;
            *(unsigned char *)(v44 + 4) = 1;
            *(_DWORD *)(v44 + 8) = v19;
            v40 = (char *)(v44 + 24);
            *(void *)(v44 + 16) = v42;
            goto LABEL_71;
          }
          unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v117 + 1) - v117) >> 3);
          unint64_t v59 = v58 + 1;
          if (v58 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)&v118[-v117] >> 3) > v59) {
            unint64_t v59 = 0x5555555555555556 * ((uint64_t)&v118[-v117] >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v118[-v117] >> 3) >= 0x555555555555555) {
            unint64_t v60 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v60 = v59;
          }
          v125 = &v118;
          v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v60);
          v63 = &v61[24 * v58];
          *(_DWORD *)v63 = v41;
          v63[4] = 1;
          *((_DWORD *)v63 + 2) = v19;
          *((void *)v63 + 2) = v43;
          uint64_t v64 = *((void *)&v117 + 1);
          uint64_t v65 = v117;
          if (*((void *)&v117 + 1) == (void)v117)
          {
            int64x2_t v70 = vdupq_n_s64(*((unint64_t *)&v117 + 1));
            v66 = &v61[24 * v58];
          }
          else
          {
            v66 = &v61[24 * v58];
            do
            {
              uint64_t v67 = *(void *)(v64 - 24);
              v64 -= 24;
              int v68 = *(_DWORD *)(v64 + 8);
              *((void *)v66 - 3) = v67;
              v66 -= 24;
              *((_DWORD *)v66 + 2) = v68;
              uint64_t v69 = *(void *)(v64 + 16);
              *(void *)(v64 + 16) = 0;
              *((void *)v66 + 2) = v69;
            }
            while (v64 != v65);
            int64x2_t v70 = (int64x2_t)v117;
          }
          v40 = v63 + 24;
          *(void *)&long long v117 = v66;
          *((void *)&v117 + 1) = v63 + 24;
          int64x2_t v123 = v70;
          v73 = v118;
          v118 = &v61[24 * v62];
          v124 = v73;
          uint64_t v122 = v70.i64[0];
          v72 = &v122;
        }
        else
        {
          id v37 = v35;
          id v38 = v37;
          uint64_t v39 = *((void *)&v117 + 1);
          if (*((void *)&v117 + 1) < (unint64_t)v118)
          {
            **((unsigned char **)&v117 + 1) = 0;
            *(unsigned char *)(v39 + 4) = 0;
            *(_DWORD *)(v39 + 8) = v19;
            v40 = (char *)(v39 + 24);
            *(void *)(v39 + 16) = v37;
LABEL_71:
            *((void *)&v117 + 1) = v40;

            uint64_t v19 = (v19 + 1);
            goto LABEL_72;
          }
          unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v117 + 1) - v117) >> 3);
          unint64_t v46 = v45 + 1;
          if (v45 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)&v118[-v117] >> 3) > v46) {
            unint64_t v46 = 0x5555555555555556 * ((uint64_t)&v118[-v117] >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v118[-v117] >> 3) >= 0x555555555555555) {
            unint64_t v47 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v47 = v46;
          }
          v129 = &v118;
          v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RemoteAUPropertyListeners::AUPropertyListener>>(v47);
          v50 = &v48[24 * v45];
          char *v50 = 0;
          v50[4] = 0;
          *((_DWORD *)v50 + 2) = v19;
          *((void *)v50 + 2) = v38;
          uint64_t v51 = *((void *)&v117 + 1);
          uint64_t v52 = v117;
          if (*((void *)&v117 + 1) == (void)v117)
          {
            int64x2_t v57 = vdupq_n_s64(*((unint64_t *)&v117 + 1));
            v53 = &v48[24 * v45];
          }
          else
          {
            v53 = &v48[24 * v45];
            do
            {
              uint64_t v54 = *(void *)(v51 - 24);
              v51 -= 24;
              int v55 = *(_DWORD *)(v51 + 8);
              *((void *)v53 - 3) = v54;
              v53 -= 24;
              *((_DWORD *)v53 + 2) = v55;
              uint64_t v56 = *(void *)(v51 + 16);
              *(void *)(v51 + 16) = 0;
              *((void *)v53 + 2) = v56;
            }
            while (v51 != v52);
            int64x2_t v57 = (int64x2_t)v117;
          }
          v40 = v50 + 24;
          *(void *)&long long v117 = v53;
          *((void *)&v117 + 1) = v50 + 24;
          int64x2_t v127 = v57;
          v71 = v118;
          v118 = &v48[24 * v49];
          v128 = v71;
          uint64_t v126 = v57.i64[0];
          v72 = &v126;
        }
        std::__split_buffer<ParameterTreeBuilder::ClumpableParam>::~__split_buffer((uint64_t)v72);
        goto LABEL_71;
      }
LABEL_73:
      if ((void)v117 != *((void *)&v117 + 1))
      {
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ParameterTreeBuilder::ClumpableParam *,false>(v117, *((uint64_t **)&v117 + 1), 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v117 + 1) - v117) >> 3)), 1);
        int v139 = i;
        long long v74 = v117;
        unint64_t v75 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v117 + 1) - v117) >> 3);
        unint64_t v138 = v75;
        id v137 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v75];
        *(void *)v136 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v75];
        int v135 = -1;
        outData = (unsigned int *)&v135;
        v131.i64[0] = (uint64_t)&v113;
        v131.i64[1] = (uint64_t)&v139;
        v132 = v136;
        v133 = &v137;
        v134 = &v138;
        if (*((void *)&v74 + 1) != (void)v74)
        {
          uint64_t v76 = v117;
          if (*(unsigned char *)(v117 + 4))
          {
            unint64_t v77 = 0;
          }
          else
          {
            uint64_t v78 = 0;
            uint64_t v79 = 1;
            do
            {
              unint64_t v77 = v79;
              [v137 addObject:*(void *)(v76 + v78 + 16)];
              unint64_t v75 = v138;
              if (v77 >= v138) {
                break;
              }
              uint64_t v76 = v117;
              int v80 = *(unsigned __int8 *)(v117 + v78 + 28);
              uint64_t v79 = v77 + 1;
              v78 += 24;
            }
            while (!v80);
          }
          if (v77 < v75)
          {
            uint64_t v81 = v117;
            uint64_t v82 = 24 * v77;
            unint64_t v83 = v77;
            do
            {
              if (v83 > v77)
              {
                int v84 = *(unsigned __int8 *)(v81 + v82 - 20);
                if (!*(unsigned char *)(v81 + v82 + 4) || v84 == 0)
                {
                  int v87 = v84 != 0;
                  int v86 = *(unsigned __int8 *)(v81 + v82 + 4) != 0;
                }
                else
                {
                  int v86 = *(_DWORD *)(v81 + v82);
                  int v87 = *(_DWORD *)(v81 + v82 - 24);
                }
                if (v86 != v87)
                {
                  ParameterTreeBuilder::buildClumpedElementNodes(unsigned int,std::vector<ParameterTreeBuilder::ClumpableParam> const&)::{lambda(void)#1}::operator()(&outData);
                  uint64_t v81 = v117;
                }
              }
              [*(id *)v136 addObject:*(void *)(v81 + v82 + 16)];
              uint64_t v81 = v117;
              int v135 = *(_DWORD *)(v117 + v82);
              ++v83;
              v82 += 24;
            }
            while (v83 < v138);
          }
        }
        if ([*(id *)v136 count]) {
          ParameterTreeBuilder::buildClumpedElementNodes(unsigned int,std::vector<ParameterTreeBuilder::ClumpableParam> const&)::{lambda(void)#1}::operator()(&outData);
        }
        id v88 = v137;

        id v89 = v88;
        v90 = v89;
        if (v107 >= 2)
        {
          v90 = objc_opt_new();
          uint64_t v91 = 0;
          v92 = 0;
          do
          {
            objc_msgSend(NSString, "stringWithFormat:", @"%d", v91);
            id v93 = (id)objc_claimAutoreleasedReturnValue();
            if (v91)
            {
              id v94 = +[AUParameterTree createGroupFromTemplate:v92 identifier:v93 name:v93 addressOffset:(unint64_t)(v91 & 0x1FFFFFFF) << 32];
            }
            else
            {
              id v94 = +[AUParameterTree createGroupWithIdentifier:v93 name:v93 children:v89];

              v92 = v94;
            }
            [v90 addObject:v94];

            uint64_t v91 = (v91 + 1);
          }
          while (v107 != v91);
        }
        v95 = [NSString stringWithUTF8String:gScopeNames[i]];
        v96 = +[AUParameterTree createGroupWithIdentifier:v95 name:v95 children:v90];
        [v103 addObject:v96];
      }
      outData = (unsigned int *)&v117;
      std::vector<ParameterTreeBuilder::ClumpableParam>::__destroy_vector::operator()[abi:ne180100]((void ***)&outData);
    }
    if (v119.__begin_)
    {
      v119.__end_ = v119.__begin_;
      operator delete(v119.__begin_);
    }
  }
  v97 = +[AUParameterTree createTreeWithChildren:v103];

  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_59;
  v112[3] = &__block_descriptor_40_e24_v20__0__AUParameter_8f16l;
  v112[4] = v102;
  [v97 setImplementorValueObserver:v112];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_62;
  v111[3] = &__block_descriptor_40_e21_f16__0__AUParameter_8l;
  v111[4] = v102;
  [v97 setImplementorValueProvider:v111];
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_65;
  v110[3] = &__block_descriptor_40_e36___NSString_24__0__AUParameter_8r_f16l;
  v110[4] = v102;
  [v97 setImplementorStringFromValueCallback:v110];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_2;
  v109[3] = &__block_descriptor_40_e34_f24__0__AUParameter_8__NSString_16l;
  v109[4] = v102;
  [v97 setImplementorValueFromStringCallback:v109];
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_3;
  v108[3] = &__block_descriptor_40_e38___NSString_24__0__AUParameterNode_8q16l;
  v108[4] = v102;
  [v97 setImplementorDisplayNameWithLengthCallback:v108];
  unsigned int v98 = atomic_load(&v101->_eventsTriggeringParameterTreeInvalidation.__a_.__a_value);
  if (v98 <= 1) {
    uint64_t v99 = 1;
  }
  else {
    uint64_t v99 = v98;
  }
  objc_msgSend(v97, "set_autoCreatedForV2AU:", v99);

LABEL_114:
  return v97;
}

void __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke(uint64_t a1, void *a2, int *a3, float a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = WeakRetained;
  if ((*a3 - 1) >= 2)
  {
    if (*a3)
    {
      if (kAUExtensionScope)
      {
        uint64_t v13 = *(id *)kAUExtensionScope;
        if (!v13) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v13 = MEMORY[0x1E4F14500];
        id v14 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = *a3;
        int v16 = 136315650;
        id v17 = "AUAudioUnitV2Bridge.mm";
        __int16 v18 = 1024;
        int v19 = 1293;
        __int16 v20 = 1024;
        int v21 = v15;
        _os_log_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d AUEventListener encountered unknown AUEventType: %d", (uint8_t *)&v16, 0x18u);
      }
    }
    else
    {
      unsigned __int8 v11 = atomic_load(WeakRetained + 601);
      if (v11) {
        uint64_t v12 = 8;
      }
      else {
        uint64_t v12 = 4;
      }
      *(float *)&double v9 = a4;
      [v7 setValue:v12 originator:v9];
    }
  }
  else
  {
    *(float *)&double v9 = a4;
    objc_msgSend(v7, "setValue:originator:atHostTime:eventType:", 4, 0, v9);
  }
LABEL_15:
}

void __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_59(uint64_t a1, void *a2, AudioUnitParameterValue a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v6 = [v5 address];
  int v7 = v6;
  unint64_t v8 = v6 >> 61;
  uint64_t v9 = HIDWORD(v6) & 0x1FFFFFFF;
  OSStatus v10 = AudioUnitSetParameter(*(AudioUnit *)(a1 + 32), v6, v6 >> 61, v9, a3, 0);
  if (v10)
  {
    if (kAUExtensionScope)
    {
      unsigned __int8 v11 = *(id *)kAUExtensionScope;
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      unsigned __int8 v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136316418;
      id v14 = "AUAudioUnitV2Bridge.mm";
      __int16 v15 = 1024;
      int v16 = 1312;
      __int16 v17 = 1024;
      int v18 = v7;
      __int16 v19 = 1024;
      int v20 = v8;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 1024;
      OSStatus v24 = v10;
      _os_log_impl(&dword_18FEC0000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d AUParameterSet %d (%d/%d): err %d", (uint8_t *)&v13, 0x2Au);
    }
  }
LABEL_9:
}

float __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_62(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  AudioUnitParameterValue outValue = 0.0;
  unint64_t v4 = [v3 address];
  int v5 = v4;
  unint64_t v6 = v4 >> 61;
  uint64_t v7 = HIDWORD(v4) & 0x1FFFFFFF;
  OSStatus Parameter = AudioUnitGetParameter(*(AudioUnit *)(a1 + 32), v4, v4 >> 61, v7, &outValue);
  if (Parameter)
  {
    if (kAUExtensionScope)
    {
      uint64_t v9 = *(id *)kAUExtensionScope;
      if (!v9) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v15 = "AUAudioUnitV2Bridge.mm";
      __int16 v16 = 1024;
      int v17 = 1322;
      __int16 v18 = 1024;
      int v19 = v5;
      __int16 v20 = 1024;
      int v21 = v6;
      __int16 v22 = 1024;
      int v23 = v7;
      __int16 v24 = 1024;
      OSStatus v25 = Parameter;
      _os_log_impl(&dword_18FEC0000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioGetParameter %d (%d/%d): err %d", buf, 0x2Au);
    }
  }
LABEL_9:
  float v11 = outValue;

  return v11;
}

id __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_65(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = [v5 address];
  outData[1] = a3;
  int v13 = 0;
  UInt32 ioDataSize = 24;
  outData[0] = v6;
  OSStatus Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x21u, v6 >> 61, HIDWORD(v6) & 0x1FFFFFFF, outData, &ioDataSize);
  if (v13) {
    BOOL v8 = Property == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    uint64_t v9 = v13;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

float __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 address];
  outData[1] = v6;
  uint64_t v12 = 0;
  UInt32 ioDataSize = 24;
  outData[0] = v7;
  AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x26u, v7 >> 61, HIDWORD(v7) & 0x1FFFFFFF, outData, &ioDataSize);
  float v8 = *(float *)&v12;

  return v8;
}

id __43__AUAudioUnitV2Bridge__createParameterTree__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  outData[0] = 0;
  __int16 v16 = 0;
  outData[1] = a3;
  UInt32 ioDataSize = 16;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [v5 address];
    outData[0] = v6;
    OSStatus Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x22u, v6 >> 61, HIDWORD(v6) & 0x1FFFFFFF, outData, &ioDataSize);
  }
  else
  {
    float v8 = [v5 identifier];
    int v9 = [v8 hasPrefix:@"clump_"];

    if (!v9)
    {
      uint64_t v12 = 0;
      goto LABEL_9;
    }
    id v10 = [v5 identifier];
    float v11 = [v10 substringFromIndex:6];
    outData[0] = [v11 intValue];

    OSStatus Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 32), 0x23u, 0, 0, outData, &ioDataSize);
  }
  if (Property) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v16;
  }
LABEL_9:

  return v12;
}

- (void)_createEventListenerQueue
{
  if (!self->_eventListenerQueue)
  {
    self->_eventListenerQueue = (OS_dispatch_queue *)dispatch_queue_create("AUAudioUnitV2Bridge.eventListener", 0);
    MEMORY[0x1F41817F8]();
  }
}

- (void)reset
{
}

- (id)parametersForOverviewWithCount:(int64_t)a3
{
  UInt32 ioDataSize = 24 * a3;
  if (a3)
  {
    if ((unint64_t)a3 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    id v5 = (char *)operator new(24 * a3);
    bzero(v5, 24 * ((24 * a3 - 24) / 0x18uLL) + 24);
    unint64_t v6 = &v5[24 * ((24 * a3 - 24) / 0x18uLL) + 24];
  }
  else
  {
    id v5 = 0;
    unint64_t v6 = 0;
  }
  if (AudioUnitGetProperty(self->_audioUnit, 0x39u, 0, 0, v5, &ioDataSize))
  {
    unint64_t v7 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    if (v5 != v6)
    {
      float v8 = v5;
      do
      {
        if (*(void *)v8)
        {
          int v9 = [NSNumber numberWithUnsignedLongLong:((unint64_t)*((unsigned int *)v8 + 3) << 61) | ((unint64_t)(*((_DWORD *)v8 + 4) & 0x1FFFFFFF) << 32) | *((unsigned int *)v8 + 2)];
          [v7 addObject:v9];
        }
        v8 += 24;
      }
      while (v8 != v6);
    }
  }
  if (v5) {
    operator delete(v5);
  }
  return v7;
}

- (void)internalDeallocateRenderResources
{
  AudioUnitUninitialize(self->_audioUnit);
  [(AUAudioUnitV2Bridge *)self setMIDIOutputEventBlock:0];
  [(AUAudioUnitV2Bridge *)self setMIDIOutputEventListBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnit *)&v3 internalDeallocateRenderResources];
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AUAudioUnitV2Bridge;
  BOOL v5 = -[AUAudioUnit allocateRenderResourcesAndReturnError:](&v12, sel_allocateRenderResourcesAndReturnError_);
  if (v5)
  {
    OSStatus v6 = AudioUnitInitialize(self->_audioUnit);
    if (v6)
    {
      if (a3)
      {
        id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
        *a3 = v7;
      }
      LOBYTE(v5) = 0;
    }
    else
    {
      value = self->_renderer.__ptr_.__value_;
      int v9 = [(AUAudioUnit *)self musicalContextBlock];
      id v10 = [(AUAudioUnit *)self transportStateBlock];
      AUAudioUnitV2Bridge_Renderer::prepareHostCallbacks((uint64_t)value, v9, v10);

      if (a3) {
        *a3 = 0;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setTransportStateBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnit *)&v8 setTransportStateBlock:v4];
  value = self->_renderer.__ptr_.__value_;
  OSStatus v6 = [(AUAudioUnit *)self musicalContextBlock];
  id v7 = [(AUAudioUnit *)self transportStateBlock];
  AUAudioUnitV2Bridge_Renderer::prepareHostCallbacks((uint64_t)value, v6, v7);
}

- (void)setMusicalContextBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnit *)&v8 setMusicalContextBlock:v4];
  value = self->_renderer.__ptr_.__value_;
  OSStatus v6 = [(AUAudioUnit *)self musicalContextBlock];
  id v7 = [(AUAudioUnit *)self transportStateBlock];
  AUAudioUnitV2Bridge_Renderer::prepareHostCallbacks((uint64_t)value, v6, v7);
}

- (void)setMIDIOutputEventListBlock:(id)a3
{
  id v4 = a3;
  p_id MIDIOutputEventListBlock = &self->_MIDIOutputEventListBlock;
  id MIDIOutputEventListBlock = self->_MIDIOutputEventListBlock;
  id v10 = v4;
  if (MIDIOutputEventListBlock) {
    BOOL v7 = MIDIOutputEventListBlock == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id *p_MIDIOutputEventListBlock = 0;
  }
  uint64_t v8 = [v10 copy];
  id v9 = *p_MIDIOutputEventListBlock;
  id *p_MIDIOutputEventListBlock = (id)v8;

  AudioUnitSetProperty(self->_audioUnit, 0x3Fu, 0, 0, &self->_MIDIOutputEventListBlock, 8u);
}

- (void)setMIDIOutputEventBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  id MIDIOutputEventBlock = self->_MIDIOutputEventBlock;
  if (MIDIOutputEventBlock) {
    BOOL v7 = MIDIOutputEventBlock == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    self->_id MIDIOutputEventBlock = 0;
  }
  uint64_t v8 = (void *)[v5 copy];
  id v9 = self->_MIDIOutputEventBlock;
  self->_id MIDIOutputEventBlock = v8;

  id v10 = self->_MIDIOutputEventBlock;
  if (v10)
  {
    float v11 = _auV2midiOutCallback;
    id v12 = v10;
  }
  else
  {
    float v11 = 0;
    id v12 = 0;
  }
  AudioUnitSetProperty(self->_audioUnit, 0x30u, 0, 0, &v11, 0x10u);
}

- (id)MIDIOutputEventListBlock
{
  v2 = _Block_copy(self->_MIDIOutputEventListBlock);
  return v2;
}

- (id)MIDIOutputEventBlock
{
  v2 = _Block_copy(self->_MIDIOutputEventBlock);
  return v2;
}

- (void)deliverV2Parameters:(const AURenderEvent *)a3
{
  if (a3)
  {
    next = a3;
    do
    {
      if (next->head.eventType == AURenderEventParameter)
      {
        if (next->MIDIEventsList.eventList.packet[0].wordCount) {
          AudioUnitSetParameter(self->_audioUnit, next->parameter.parameterAddress, next->parameter.parameterAddress >> 61, HIDWORD(next->parameter.parameterAddress) & 0x1FFFFFFF, next->parameter.value, 0);
        }
      }
      next = next->head.next;
    }
    while (next);
  }
}

- (id)internalRenderBlock
{
  value = self->_renderer.__ptr_.__value_;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___ZN28AUAudioUnitV2Bridge_Renderer11renderBlockEv_block_invoke;
  aBlock[3] = &__block_descriptor_40_e433_i60__0_I8r__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_16I24q28__AudioBufferList_I_1_AudioBuffer_II_v___36r__AURenderEvent__AURenderEventHeader___AURenderEvent_qCC__AUParameterEvent___AURenderEvent_qC_3C_IQf__AUMIDIEvent___AURenderEvent_qCCSC_3C___AUMIDIEventList___AURenderEvent_qCCC_MIDIEventList_iI_1_MIDIEventPacket_QI_64I______44___i___I__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II_Iq__AudioBufferList_I_1_AudioBuffer_II_v____52l;
  aBlock[4] = value;
  objc_super v3 = _Block_copy(aBlock);
  id v4 = _Block_copy(v3);

  return v4;
}

- (id)outputBusses
{
  return self->_outputBusses;
}

- (id)inputBusses
{
  return self->_inputBusses;
}

- (void)dealloc
{
  [(AUAudioUnitV2Bridge *)self invalidateAudioUnit];
  v3.receiver = self;
  v3.super_class = (Class)AUAudioUnitV2Bridge;
  [(AUAudioUnit *)&v3 dealloc];
}

- (void)invalidateAudioUnit
{
}

- (uint64_t)invalidateAudioUnit
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EDF9E5F0;
  a2[1] = v2;
  return result;
}

- (AudioUnit)audioUnit
{
  return self->_audioUnit;
}

- (AUAudioUnitV2Bridge)initWithAudioUnit:(OpaqueAudioComponentInstance *)a3 description:(AudioComponentDescription *)a4
{
  AudioComponentDescription v9 = *a4;
  v8.receiver = self;
  v8.super_class = (Class)AUAudioUnitV2Bridge;
  BOOL v5 = [(AUAudioUnit *)&v8 initWithComponentDescription:&v9 options:0 error:0];
  OSStatus v6 = v5;
  if (v5)
  {
    v5->_audioUnit = a3;
    v5->_audioUnitIsOwned = 0;
    [(AUAudioUnitV2Bridge *)v5 init2];
  }
  return v6;
}

- (AUAudioUnitV2Bridge)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  AudioComponentDescription v17 = *a3;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitV2Bridge;
  objc_super v8 = -[AUAudioUnit initWithComponentDescription:options:error:](&v16, sel_initWithComponentDescription_options_error_, &v17);
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  AudioComponent Next = AudioComponentFindNext(0, a3);
  if (!Next || (uint64_t v10 = (**(uint64_t (***)(AudioComponent))Next)(Next)) == 0)
  {
    int v11 = -3000;
    *((_DWORD *)v28 + 6) = -3000;
    if (!a5)
    {
LABEL_11:
      id v12 = 0;
      goto LABEL_12;
    }
LABEL_10:
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
    *a5 = v13;

    goto LABEL_11;
  }
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___Z21instantiateV2BridgeAURK25AudioComponentDescriptionjPU15__autoreleasingP7NSError_block_invoke;
  v18[3] = &unk_1E5687918;
  v18[4] = &v23;
  v18[5] = &v27;
  v18[6] = &v19;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(void *)v10 + 88))(v10, v6, 1, v18);
  if (!*((unsigned char *)v20 + 24)) {
    __assert_rtn("instantiateV2BridgeAU", "AUAudioUnit.mm", 363, "replied");
  }
  _Block_object_dispose(&v19, 8);
  if (!*((_DWORD *)v28 + 6))
  {
    id v12 = (OpaqueAudioComponentInstance *)v24[3];
    _Block_object_dispose(&v23, 8);
    goto LABEL_12;
  }
  _Block_object_dispose(&v23, 8);
  if (!a5) {
    goto LABEL_11;
  }
  int v11 = *((_DWORD *)v28 + 6);
  if (v11) {
    goto LABEL_10;
  }
  id v12 = 0;
  *a5 = 0;
LABEL_12:
  _Block_object_dispose(&v27, 8);
  v8->_audioUnit = v12;
  if (!v12)
  {
    id v14 = 0;
    goto LABEL_16;
  }
  v8->_audioUnitIsOwned = 1;
  [(AUAudioUnitV2Bridge *)v8 init2];
LABEL_14:
  id v14 = v8;
LABEL_16:

  return v14;
}

- (void)init2
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("parameterTreeBuilderQueue", 0);
  parameterTreeRebuildQueue = self->_parameterTreeRebuildQueue;
  self->_parameterTreeRebuildQueue = v3;

  BOOL v5 = [[AUV2BridgeBusArray alloc] initWithOwner:self scope:1];
  inputBusses = self->_inputBusses;
  self->_inputBusses = v5;

  BOOL v7 = [[AUV2BridgeBusArray alloc] initWithOwner:self scope:2];
  outputBusses = self->_outputBusses;
  self->_outputBusses = v7;

  [(AUAudioUnitV2Bridge *)self _rebuildBusses:1];
  [(AUAudioUnitV2Bridge *)self _rebuildBusses:2];
  AudioUnitAddPropertyListener(self->_audioUnit, 0xBu, (AudioUnitPropertyListenerProc)ElementCountPropertyListener, self);
  AudioUnitAddPropertyListener(self->_audioUnit, 3u, (AudioUnitPropertyListenerProc)ParameterListPropertyListener, self);
  AudioUnitAddPropertyListener(self->_audioUnit, 4u, (AudioUnitPropertyListenerProc)ParameterListPropertyListener, self);
  operator new();
}

- (void)_invalidateParameterTree:(unsigned int)a3
{
  BOOL v7 = self;
  if (a3 <= 0xB && ((1 << a3) & 0x818) != 0) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 1;
  }
  atomic_fetch_or((atomic_uint *volatile)&self->_eventsTriggeringParameterTreeInvalidation, v3);
  if (v7->_cachedParameterTree)
  {
    id v6 = [(AUAudioUnitV2Bridge *)v7 _buildNewParameterTree];
    if (v6)
    {
      [(AUAudioUnitV2Bridge *)v7 willChangeValueForKey:@"parameterTree"];
      parameterTreeRebuildQueue = v7->_parameterTreeRebuildQueue;
      v5[0] = &v7;
      v5[1] = &v6;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZN10applesauce8dispatch2v19sync_implIZ48__AUAudioUnitV2Bridge__invalidateParameterTree__E3__2EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v5;
      dispatch_sync(parameterTreeRebuildQueue, block);
      [(AUAudioUnitV2Bridge *)v7 didChangeValueForKey:@"parameterTree"];
    }
  }
}

- (id)_buildNewParameterTree
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v14 = self;
  __p = 0;
  int v11 = 0;
  uint64_t v12 = 0;
  parameterTreeRebuildQueue = self->_parameterTreeRebuildQueue;
  v9[0] = &v13;
  v9[1] = &v14;
  v9[2] = &__p;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = ___ZN10applesauce8dispatch2v19sync_implIZ45__AUAudioUnitV2Bridge__buildNewParameterTree_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
  objc_super v16 = &__block_descriptor_40_e5_v8__0l;
  AudioComponentDescription v17 = v9;
  dispatch_sync(parameterTreeRebuildQueue, block);
  if (v13)
  {
    id v3 = v13;
    goto LABEL_13;
  }
  if (kAUExtensionScope)
  {
    id v4 = *(id *)kAUExtensionScope;
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)block = 136315650;
    *(void *)&block[4] = "AUAudioUnitV2Bridge.mm";
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = 667;
    *(_WORD *)&block[18] = 1024;
    *(_DWORD *)&block[20] = (unint64_t)(v11 - (unsigned char *)__p) >> 3;
    _os_log_impl(&dword_18FEC0000, v4, OS_LOG_TYPE_INFO, "%25s:%-5d Suppressed redundant parameter tree rebuilding; %d dirty values",
      block,
      0x18u);
  }

LABEL_10:
  id v6 = __p;
  BOOL v7 = v11;
  if (__p != v11)
  {
    do
      [(AUAudioUnitV2Bridge *)v14 _notifyParameterChange:*v6++];
    while (v6 != v7);
    id v3 = 0;
LABEL_13:
    id v6 = __p;
    if (!__p) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v3 = 0;
  if (__p)
  {
LABEL_14:
    int v11 = v6;
    operator delete(v6);
  }
LABEL_15:

  return v3;
}

- (void)_notifyParameterChange:(unint64_t)a3
{
  int v3 = a3;
  audioUnit = self->_audioUnit;
  unint64_t v5 = a3 >> 61;
  unint64_t v6 = HIDWORD(a3) & 0x1FFFFFFF;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AUAudioUnitV2Bridge__notifyParameterChange___block_invoke;
  v7[3] = &unk_1E56880F0;
  objc_copyWeak(&v8, &location);
  int v9 = 0;
  uint64_t v10 = audioUnit;
  int v11 = v3;
  int v12 = v5;
  int v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __46__AUAudioUnitV2Bridge__notifyParameterChange___block_invoke(uint64_t a1)
{
  WeakRetained = (AUEventListenerRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    AUEventListenerNotify(WeakRetained[74], 0, (const AudioUnitEvent *)(a1 + 40));
  }
}

- (int)enableBus:(unsigned int)a3 scope:(unsigned int)a4 enable:(BOOL)a5
{
  if (a4 != 1) {
    return 0;
  }
  v11[2] = v5;
  v11[3] = v6;
  value = self->_renderer.__ptr_.__value_;
  id v8 = a5 ? AUAudioUnitV2Bridge_Renderer::renderInputProc : 0;
  int v9 = a5 ? self->_renderer.__ptr_.__value_ : 0;
  v11[0] = v8;
  v11[1] = v9;
  int result = AudioUnitSetProperty(*(AudioUnit *)value, 0x17u, 1u, a3, v11, 0x10u);
  if (!result) {
    return 0;
  }
  return result;
}

- (void)_rebuildBusses:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1)
  {
    uint64_t v5 = &OBJC_IVAR___AUAudioUnitV2Bridge__inputBusses;
  }
  else
  {
    if (a3 != 2) {
      __assert_rtn("-[AUAudioUnitV2Bridge _rebuildBusses:]", "AUAudioUnitV2Bridge.mm", 508, "0");
    }
    uint64_t v5 = &OBJC_IVAR___AUAudioUnitV2Bridge__outputBusses;
  }
  id v10 = *(id *)((char *)&self->super.super.isa + *v5);
  uint64_t v6 = objc_opt_new();
  unsigned int v7 = [(AUAudioUnitV2Bridge *)self _elementCount:v3];
  if (v7)
  {
    uint64_t v8 = 0;
    do
    {
      int v9 = [[AUV2BridgeBus alloc] initWithOwner:self au:self->_audioUnit scope:v3 element:v8];
      [v6 addObject:v9];

      uint64_t v8 = (v8 + 1);
    }
    while (v7 != v8);
  }
  [v10 replaceBusses:v6];
}

- (BOOL)_setElementCount:(unsigned int)a3 count:(unsigned int)a4 error:(id *)a5
{
  unsigned int inData = a4;
  OSStatus v6 = AudioUnitSetProperty(self->_audioUnit, 0xBu, a3, 0, &inData, 4u);
  OSStatus v7 = v6;
  if (a5)
  {
    if (v6)
    {
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
      *a5 = v8;
    }
    else
    {
      *a5 = 0;
    }
  }
  return v7 == 0;
}

- (BOOL)_elementCountWritable:(unsigned int)a3
{
  UInt32 outDataSize = 0;
  Boolean outWritable = 0;
  AudioUnitGetPropertyInfo(self->_audioUnit, 0xBu, a3, 0, &outDataSize, &outWritable);
  return outWritable != 0;
}

- (unsigned)_elementCount:(unsigned int)a3
{
  unsigned int outData = 0;
  UInt32 ioDataSize = 4;
  AudioUnitGetProperty(self->_audioUnit, 0xBu, a3, 0, &outData, &ioDataSize);
  return outData;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3 = a3;
  {
    +[AUAudioUnitV2Bridge automaticallyNotifiesObserversForKey:]::autoNotifying = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"fullState", @"fullStateForDocument", @"currentPreset", 0);
  }
  char v4 = [(id)+[AUAudioUnitV2Bridge automaticallyNotifiesObserversForKey:]::autoNotifying containsObject:v3];

  return v4;
}

@end
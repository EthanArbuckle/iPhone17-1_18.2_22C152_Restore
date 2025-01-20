@interface AVAudioEngine
- (AVAudioConnectionPoint)inputConnectionPointForNode:(AVAudioNode *)node inputBus:(AVAudioNodeBus)bus;
- (AVAudioEngine)init;
- (AVAudioEngineManualRenderingBlock)manualRenderingBlock;
- (AVAudioEngineManualRenderingMode)manualRenderingMode;
- (AVAudioEngineManualRenderingStatus)renderOffline:(AVAudioFrameCount)numberOfFrames toBuffer:(AVAudioPCMBuffer *)buffer error:(NSError *)outError;
- (AVAudioFormat)manualRenderingFormat;
- (AVAudioFrameCount)manualRenderingMaximumFrameCount;
- (AVAudioFramePosition)manualRenderingSampleTime;
- (AVAudioInputNode)inputNode;
- (AVAudioMixerNode)mainMixerNode;
- (AVAudioOutputNode)outputNode;
- (BOOL)enableManualRenderingMode:(AVAudioEngineManualRenderingMode)mode format:(AVAudioFormat *)pcmFormat maximumFrameCount:(AVAudioFrameCount)maximumFrameCount error:(NSError *)outError;
- (BOOL)isAutoShutdownEnabled;
- (BOOL)isInManualRenderingMode;
- (BOOL)isRunning;
- (BOOL)startAndReturnError:(NSError *)outError;
- (MusicSequence)musicSequence;
- (NSArray)outputConnectionPointsForNode:(AVAudioNode *)node outputBus:(AVAudioNodeBus)bus;
- (NSSet)attachedNodes;
- (id)audioSession;
- (id)description;
- (void)attachNode:(AVAudioNode *)node;
- (void)connect:(AVAudioNode *)node1 to:(AVAudioNode *)node2 format:(AVAudioFormat *)format;
- (void)connect:(AVAudioNode *)node1 to:(AVAudioNode *)node2 fromBus:(AVAudioNodeBus)bus1 toBus:(AVAudioNodeBus)bus2 format:(AVAudioFormat *)format;
- (void)connect:(AVAudioNode *)sourceNode toConnectionPoints:(NSArray *)destNodes fromBus:(AVAudioNodeBus)sourceBus format:(AVAudioFormat *)format;
- (void)connectMIDI:(AVAudioNode *)sourceNode to:(AVAudioNode *)destinationNode format:(AVAudioFormat *)format block:(AUMIDIOutputEventBlock)tapBlock;
- (void)connectMIDI:(AVAudioNode *)sourceNode to:(AVAudioNode *)destinationNode format:(AVAudioFormat *)format eventListBlock:(AUMIDIEventListBlock)tapBlock;
- (void)connectMIDI:(AVAudioNode *)sourceNode toNodes:(NSArray *)destinationNodes format:(AVAudioFormat *)format block:(AUMIDIOutputEventBlock)tapBlock;
- (void)connectMIDI:(AVAudioNode *)sourceNode toNodes:(NSArray *)destinationNodes format:(AVAudioFormat *)format eventListBlock:(AUMIDIEventListBlock)tapBlock;
- (void)dealloc;
- (void)detachNode:(AVAudioNode *)node;
- (void)disableManualRenderingMode;
- (void)disconnectMIDI:(AVAudioNode *)sourceNode from:(AVAudioNode *)destinationNode;
- (void)disconnectMIDI:(AVAudioNode *)sourceNode fromNodes:(NSArray *)destinationNodes;
- (void)disconnectMIDIInput:(AVAudioNode *)node;
- (void)disconnectMIDIOutput:(AVAudioNode *)node;
- (void)disconnectNodeInput:(AVAudioNode *)node;
- (void)disconnectNodeInput:(AVAudioNode *)node bus:(AVAudioNodeBus)bus;
- (void)disconnectNodeOutput:(AVAudioNode *)node;
- (void)disconnectNodeOutput:(AVAudioNode *)node bus:(AVAudioNodeBus)bus;
- (void)implementation;
- (void)pause;
- (void)prepare;
- (void)reset;
- (void)setAudioSession:(id)a3;
- (void)setAutoShutdownEnabled:(BOOL)autoShutdownEnabled;
- (void)setMusicSequence:(MusicSequence)musicSequence;
- (void)stop;
@end

@implementation AVAudioEngine

- (NSSet)attachedNodes
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  v4 = (NSSet *)(id)[*((id *)self->_impl + 3) copy];
  std::recursive_mutex::unlock(v3);
  return v4;
}

- (void)disconnectMIDIOutput:(AVAudioNode *)node
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v8 = *impl;
    *(_DWORD *)buf = 136315906;
    v11 = "AVAudioEngine.mm";
    __int16 v12 = 1024;
    int v13 = 1129;
    __int16 v14 = 2048;
    v15 = (char *)v8;
    __int16 v16 = 2048;
    *(void *)v17 = node;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI outputs on node: %p", buf, 0x26u);
  }
  if (node)
  {
    AVAudioEngineGraph::DisconnectAllMIDIOutputs(impl[1], node);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      v15 = "AVAudioEngine.mm";
      __int16 v16 = 1024;
      *(_DWORD *)v17 = 1131;
      *(_WORD *)&v17[4] = 2080;
      *(void *)&v17[6] = "DisconnectAllMIDIOutputs";
      __int16 v18 = 2080;
      v19 = "node != nil";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil");
    AVAudioEngineGraph::DisconnectAllMIDIOutputs(impl[1], 0);
  }

  std::recursive_mutex::unlock(v5);
}

- (void)disconnectMIDIInput:(AVAudioNode *)node
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v8 = *impl;
    *(_DWORD *)buf = 136315906;
    v11 = "AVAudioEngine.mm";
    __int16 v12 = 1024;
    int v13 = 1120;
    __int16 v14 = 2048;
    v15 = (char *)v8;
    __int16 v16 = 2048;
    *(void *)v17 = node;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI inputs on node: %p", buf, 0x26u);
  }
  if (node)
  {
    AVAudioEngineGraph::DisconnectAllMIDIInputs(impl[1], node);
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "AVAEInternal.h";
      __int16 v12 = 1024;
      int v13 = 71;
      __int16 v14 = 2080;
      v15 = "AVAudioEngine.mm";
      __int16 v16 = 1024;
      *(_DWORD *)v17 = 1122;
      *(_WORD *)&v17[4] = 2080;
      *(void *)&v17[6] = "DisconnectAllMIDIInputs";
      __int16 v18 = 2080;
      v19 = "node != nil";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil");
    AVAudioEngineGraph::DisconnectAllMIDIInputs(impl[1], 0);
  }

  std::recursive_mutex::unlock(v5);
}

- (void)disconnectMIDI:(AVAudioNode *)sourceNode fromNodes:(NSArray *)destinationNodes
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  __int16 v14 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v14);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    v8 = *impl;
    *(_DWORD *)buf = 136316162;
    v21 = "AVAudioEngine.mm";
    __int16 v22 = 1024;
    int v23 = 1108;
    __int16 v24 = 2048;
    v25 = (char *)v8;
    __int16 v26 = 2048;
    *(void *)v27 = sourceNode;
    *(_WORD *)&v27[8] = 2080;
    *(void *)&v27[10] = [(NSString *)[(NSArray *)destinationNodes description] UTF8String];
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI node: %p from nodes: %s", buf, 0x30u);
  }
  if (!sourceNode || !destinationNodes || ![(NSArray *)destinationNodes count])
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "AVAEInternal.h";
      __int16 v22 = 1024;
      int v23 = 71;
      __int16 v24 = 2080;
      v25 = "AVAudioEngine.mm";
      __int16 v26 = 1024;
      *(_DWORD *)v27 = 1110;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "DisconnectMIDI";
      *(_WORD *)&v27[14] = 2080;
      *(void *)&v27[16] = "sourceNode != nil && destNodes != nil && destNodes.count > 0";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "sourceNode != nil && destNodes != nil && destNodes.count > 0");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(NSArray *)destinationNodes countByEnumeratingWithState:&v16 objects:buf count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(destinationNodes);
        }
        if (!*(void *)(*((void *)&v16 + 1) + 8 * v12) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (AVAudioEngineLogCategory(void)::once != -1) {
            dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
          }
          int v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
          if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v28 = 136316418;
            v29 = "AVAEInternal.h";
            __int16 v30 = 1024;
            int v31 = 71;
            __int16 v32 = 2080;
            v33 = "AVAudioEngine.mm";
            __int16 v34 = 1024;
            int v35 = 1112;
            __int16 v36 = 2080;
            v37 = "DisconnectMIDI";
            __int16 v38 = 2080;
            v39 = "object && [object isKindOfClass: [AVAudioNode class]]";
            _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", v28, 0x36u);
          }
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "object && [object isKindOfClass: [AVAudioNode class]]");
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)destinationNodes countByEnumeratingWithState:&v16 objects:buf count:16];
    }
    while (v10);
  }
  AVAudioEngineGraph::DisconnectMIDI(impl[1], sourceNode, destinationNodes);

  std::recursive_mutex::unlock(v14);
}

- (void)disconnectMIDI:(AVAudioNode *)sourceNode from:(AVAudioNode *)destinationNode
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  impl = (AVAudioEngineGraph **)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *impl;
    *(_DWORD *)buf = 136316162;
    int v13 = "AVAudioEngine.mm";
    __int16 v14 = 1024;
    int v15 = 1099;
    __int16 v16 = 2048;
    long long v17 = (char *)v10;
    __int16 v18 = 2048;
    *(void *)long long v19 = sourceNode;
    *(_WORD *)&v19[8] = 2048;
    *(void *)&v19[10] = destinationNode;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect MIDI node: %p from node: %p", buf, 0x30u);
  }
  if (!sourceNode || !destinationNode)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      int v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 71;
      __int16 v16 = 2080;
      long long v17 = "AVAudioEngine.mm";
      __int16 v18 = 1024;
      *(_DWORD *)long long v19 = 1101;
      *(_WORD *)&v19[4] = 2080;
      *(void *)&v19[6] = "DisconnectMIDI";
      *(_WORD *)&v19[14] = 2080;
      *(void *)&v19[16] = "sourceNode != nil && destNode != nil";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "sourceNode != nil && destNode != nil");
  }
  AVAudioEngineGraph::DisconnectMIDI(impl[1], sourceNode, (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", destinationNode, 0));

  std::recursive_mutex::unlock(v7);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode toNodes:(NSArray *)destinationNodes format:(AVAudioFormat *)format eventListBlock:(AUMIDIEventListBlock)tapBlock
{
  uint64_t v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNodes, format, (uint64_t)tapBlock, 1);

  std::recursive_mutex::unlock(v11);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode to:(AVAudioNode *)destinationNode format:(AVAudioFormat *)format eventListBlock:(AUMIDIEventListBlock)tapBlock
{
  uint64_t v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNode, format, (uint64_t)tapBlock, 1);

  std::recursive_mutex::unlock(v11);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode toNodes:(NSArray *)destinationNodes format:(AVAudioFormat *)format block:(AUMIDIOutputEventBlock)tapBlock
{
  uint64_t v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNodes, format, (uint64_t)tapBlock, 0);

  std::recursive_mutex::unlock(v11);
}

- (void)connectMIDI:(AVAudioNode *)sourceNode to:(AVAudioNode *)destinationNode format:(AVAudioFormat *)format block:(AUMIDIOutputEventBlock)tapBlock
{
  uint64_t v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMIDI((uint64_t)self->_impl, sourceNode, destinationNode, format, (uint64_t)tapBlock, 0);

  std::recursive_mutex::unlock(v11);
}

- (void)setAudioSession:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (AVAudioEngineImpl *)self->_impl;
  if (a3)
  {
    int v10 = [a3 opaqueSessionID];
    if (*(unsigned char *)(*((void *)impl + 1) + 187))
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)impl;
        int v22 = 136315906;
        int v23 = "AVAudioEngine.mm";
        __int16 v24 = 1024;
        int v25 = 528;
        __int16 v26 = 2048;
        uint64_t v27 = v12;
        __int16 v28 = 1024;
        int v29 = v10;
        int v13 = "%25s:%-5d Engine@%p: not associating with an audio session (0x%x) in manual rendering mode";
LABEL_7:
        __int16 v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 34;
LABEL_12:
        _os_log_impl(&dword_19D794000, v14, v15, v13, (uint8_t *)&v22, v16);
      }
    }
    else
    {
      long long v19 = (void *)*((void *)impl + 2);
      if (v19 && [v19 opaqueSessionID] == v10)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void *)impl;
          int v22 = 136315906;
          int v23 = "AVAudioEngine.mm";
          __int16 v24 = 1024;
          int v25 = 535;
          __int16 v26 = 2048;
          uint64_t v27 = v20;
          __int16 v28 = 1024;
          int v29 = v10;
          int v13 = "%25s:%-5d Engine@%p: already associated with audio session (0x%x), no-op";
          goto LABEL_7;
        }
      }
      else
      {
        v21 = (AVAudioIOUnit *)*((void *)impl + 7);
        if (v21)
        {
          if (AVAudioIOUnit::OverrideAudioSession(v21, (AVAudioSession *)a3)) {
            goto LABEL_13;
          }
        }
        else
        {
          AVAudioEngineImpl::GetIOUnit(impl, (BOOL)a3, v7, v8, v9);
        }
        *((void *)impl + 2) = a3;
      }
    }
  }
  else
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    long long v17 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)impl;
      int v22 = 136315650;
      int v23 = "AVAudioEngine.mm";
      __int16 v24 = 1024;
      int v25 = 520;
      __int16 v26 = 2048;
      uint64_t v27 = v18;
      int v13 = "%25s:%-5d Engine@%p: cannot associate with a nil audio session";
      __int16 v14 = v17;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 28;
      goto LABEL_12;
    }
  }
LABEL_13:

  std::recursive_mutex::unlock(v5);
}

- (id)audioSession
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  id AudioSession = AVAudioEngineImpl::GetAudioSession((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
  return AudioSession;
}

- (AVAudioEngineManualRenderingStatus)renderOffline:(AVAudioFrameCount)numberOfFrames toBuffer:(AVAudioPCMBuffer *)buffer error:(NSError *)outError
{
  uint64_t v7 = *(void *)&numberOfFrames;
  v9 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v9);
  impl = self->_impl;
  if (outError) {
    *outError = 0;
  }
  uint64_t v11 = (AVAudioNodeImplBase **)impl[1];
  uint64_t v12 = (std::recursive_mutex *)((char *)*v11 + 112);
  std::recursive_mutex::lock(v12);
  int v21 = 0;
  if (!*((unsigned char *)v11 + 187) || v11[24])
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    int v15 = -80800;
LABEL_6:
    int v21 = v15;
    goto LABEL_7;
  }
  if (!buffer || [(AVAudioPCMBuffer *)buffer frameCapacity] < v7)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    int v15 = -50;
    goto LABEL_6;
  }
  [(AVAudioPCMBuffer *)buffer setFrameLength:v7];
  uint64_t v20 = [(AVAudioBuffer *)buffer mutableAudioBufferList];
  uint64_t v13 = AVAudioEngineGraph::RenderToABL(v11, v7, v20, &v21);
  uint64_t v14 = 0;
  if (!v21 && v20)
  {
    if (v20->mNumberBuffers)
    {
      if (v20->mBuffers[0].mDataByteSize) {
        uint64_t v14 = v7;
      }
      else {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
LABEL_7:
  [(AVAudioPCMBuffer *)buffer setFrameLength:v14];
  int v16 = v21;
  if (outError)
  {
    if (v21)
    {
      long long v17 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:v21 userInfo:0];
      int v16 = v21;
    }
    else
    {
      long long v17 = 0;
    }
    *outError = v17;
  }
  std::recursive_mutex::unlock(v12);
  if (v16) {
    AVAudioEngineManualRenderingStatus v18 = AVAudioEngineManualRenderingStatusError;
  }
  else {
    AVAudioEngineManualRenderingStatus v18 = v13;
  }
  std::recursive_mutex::unlock(v9);
  return v18;
}

- (AVAudioEngineManualRenderingBlock)manualRenderingBlock
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = self->_impl;
  v5 = (void **)*((void *)impl + 13);
  if (!v5)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    int v10 = ___ZN17AVAudioEngineImpl23GetManualRenderingBlockEv_block_invoke;
    uint64_t v11 = &__block_descriptor_48_e55_q28__0I8__AudioBufferList_I_1_AudioBuffer_II_v___12_i20l;
    uint64_t v12 = impl;
    uint64_t v13 = impl;
    operator new();
  }
  v6 = *v5;
  std::recursive_mutex::unlock(v3);
  return v6;
}

- (void)disableManualRenderingMode
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (char *)self->_impl;
  if (*(unsigned char *)(*((void *)impl + 1) + 187))
  {
    std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)(impl + 112), (uint64_t)(impl + 176));
    AVAudioEngineImpl::Stop((AVAudioEngineImpl *)impl, 0);
    AVAudioEngineImpl::Reset((AVAudioEngineImpl *)impl);
    AVAudioEngineGraph::SetManualRenderingMode(*((AVAudioEngineGraph **)impl + 1), 0, AVAudioEngineManualRenderingModeRealtime, 0);
    if (*(unsigned char *)(*((void *)impl + 1) + 187))
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      v5 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)impl;
        int v7 = 136315650;
        uint64_t v8 = "AVAudioEngine.mm";
        __int16 v9 = 1024;
        int v10 = 1346;
        __int16 v11 = 2048;
        uint64_t v12 = v6;
        _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine@%p: could not disable manual rendering mode", (uint8_t *)&v7, 0x1Cu);
      }
    }
    if (*(unsigned char *)(*((void *)impl + 1) + 187)) {
      *((void *)impl + 2) = 0;
    }
    AVAudioEngineImpl::UpdateIONodes((AVAudioEngineImpl *)impl);
    caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)(impl + 176));
    std::recursive_mutex::unlock((std::recursive_mutex *)(impl + 112));
  }

  std::recursive_mutex::unlock(v3);
}

- (BOOL)enableManualRenderingMode:(AVAudioEngineManualRenderingMode)mode format:(AVAudioFormat *)pcmFormat maximumFrameCount:(AVAudioFrameCount)maximumFrameCount error:(NSError *)outError
{
  uint64_t v7 = *(void *)&maximumFrameCount;
  __int16 v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  impl = (char *)self->_impl;
  uint64_t v13 = (void *)*((void *)impl + 5);
  if (!v13 || ![v13 isVoiceProcessingEnabled])
  {
    if (!pcmFormat
      || !v7
      || ([(AVAudioFormat *)pcmFormat sampleRate], v15 <= 0.0)
      || ![(AVAudioFormat *)pcmFormat channelCount])
    {
      if (outError)
      {
        uint64_t v14 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:-10851 userInfo:0];
        goto LABEL_20;
      }
LABEL_21:
      BOOL v18 = 0;
      goto LABEL_26;
    }
    std::lock[abi:ne180100]<std::recursive_mutex,caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>>((std::recursive_mutex *)(impl + 112), (uint64_t)(impl + 176));
    uint64_t v16 = *((void *)impl + 1);
    if (!*(unsigned char *)(v16 + 187) || *(void *)(v16 + 192) != mode)
    {
      if ((AVAudioEngineGraph::SetManualRenderingMode((AVAudioEngineGraph *)v16, 1, mode, outError) & 1) == 0)
      {
        BOOL v18 = 0;
LABEL_25:
        caulk::recursive_mutex_adapter<caulk::pooled_semaphore_mutex>::unlock((uint64_t)(impl + 176));
        std::recursive_mutex::unlock((std::recursive_mutex *)(impl + 112));
        goto LABEL_26;
      }
      if (*(unsigned char *)(*((void *)impl + 1) + 187)) {
        *((void *)impl + 2) = 0;
      }
      AVAudioEngineImpl::UpdateIONodes((AVAudioEngineImpl *)impl);
    }
    char v17 = [(id)AVAudioEngineImpl::GetOutputNode((AVAudioEngineImpl *)impl) setManualRenderingPCMFormat:pcmFormat maximumFrameCount:v7];
    BOOL v18 = v17;
    if (outError)
    {
      if (v17) {
        long long v19 = 0;
      }
      else {
        long long v19 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:-10868 userInfo:0];
      }
      *outError = v19;
    }
    goto LABEL_25;
  }
  if (!outError) {
    goto LABEL_21;
  }
  uint64_t v14 = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.coreaudio.avfaudio" code:-80800 userInfo:0];
LABEL_20:
  BOOL v18 = 0;
  *outError = v14;
LABEL_26:
  std::recursive_mutex::unlock(v11);
  return v18;
}

- (AVAudioFramePosition)manualRenderingSampleTime
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  uint64_t v4 = *((void *)self->_impl + 1);
  if (*(unsigned char *)(v4 + 187)) {
    AVAudioFramePosition v5 = *(void *)(v4 + 200);
  }
  else {
    AVAudioFramePosition v5 = 0;
  }
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (AVAudioFrameCount)manualRenderingMaximumFrameCount
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (AVAudioEngineImpl *)self->_impl;
  if (*(unsigned char *)(*((void *)impl + 1) + 187)) {
    AVAudioFrameCount v5 = [(id)AVAudioEngineImpl::GetOutputNode(impl) manualRenderingMaximumFrameCount];
  }
  else {
    AVAudioFrameCount v5 = 0;
  }
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (AVAudioFormat)manualRenderingFormat
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  ManualRenderingFormat = AVAudioEngineImpl::GetManualRenderingFormat((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
  return ManualRenderingFormat;
}

- (AVAudioEngineManualRenderingMode)manualRenderingMode
{
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineManualRenderingMode v4 = *(void *)(*((void *)self->_impl + 1) + 192);
  std::recursive_mutex::unlock(v3);
  return v4;
}

- (BOOL)isInManualRenderingMode
{
  v2 = self;
  v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  LOBYTE(v2) = *(unsigned char *)(*((void *)v2->_impl + 1) + 187);
  std::recursive_mutex::unlock(v3);
  return (char)v2;
}

- (void)setAutoShutdownEnabled:(BOOL)autoShutdownEnabled
{
  int v3 = autoShutdownEnabled;
  AVAudioFrameCount v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  uint64_t v6 = (AVAudioEngineGraph *)*((void *)self->_impl + 1);
  uint64_t v7 = (std::recursive_mutex *)(*(void *)v6 + 112);
  std::recursive_mutex::lock(v7);
  if (*((unsigned __int8 *)v6 + 208) != v3)
  {
    *((unsigned char *)v6 + 208) = v3;
    AVAudioEngineGraph::MonitorState(v6);
  }
  std::recursive_mutex::unlock(v7);

  std::recursive_mutex::unlock(v5);
}

- (BOOL)isAutoShutdownEnabled
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  uint64_t v4 = *((void *)self->_impl + 1);
  if (v4) {
    BOOL v5 = *(unsigned char *)(v4 + 208) != 0;
  }
  else {
    BOOL v5 = 0;
  }
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (BOOL)isRunning
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (char *)self->_impl;
  uint64_t v5 = *((void *)impl + 1);
  if (v5)
  {
    int v6 = *(unsigned __int8 *)(v5 + 208);
    uint64_t v7 = (unsigned char *)(v5 + 184);
    uint64_t v8 = impl + 64;
    if (!v6) {
      uint64_t v8 = v7;
    }
    BOOL v9 = *v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  std::recursive_mutex::unlock(v3);
  return v9;
}

- (void)implementation
{
  return self->_impl;
}

- (MusicSequence)musicSequence
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  uint64_t v4 = (void *)*((void *)self->_impl + 1);
  uint64_t v5 = (std::recursive_mutex *)(*v4 + 112);
  std::recursive_mutex::lock(v5);
  uint64_t v6 = v4[10];
  if (v6) {
    uint64_t v7 = *(OpaqueMusicSequence **)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  std::recursive_mutex::unlock(v5);
  std::recursive_mutex::unlock(v3);
  return v7;
}

- (void)setMusicSequence:(MusicSequence)musicSequence
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  uint64_t v6 = (void *)*((void *)self->_impl + 1);
  uint64_t v7 = (std::recursive_mutex *)(*v6 + 112);
  std::recursive_mutex::lock(v7);
  uint64_t v8 = v6[10];
  if (!v8) {
    operator new();
  }
  int v10 = (MusicSequence *)(v8 + 8);
  BOOL v9 = *(OpaqueMusicSequence **)(v8 + 8);
  if (v9 == musicSequence) {
    goto LABEL_20;
  }
  if (v9)
  {
    MusicSequenceSetAudioGraph();
    *int v10 = 0;
  }
  if (!musicSequence) {
    goto LABEL_20;
  }
  if (!*(void *)(v8 + 16)) {
    operator new();
  }
  uint64_t v11 = MusicSequenceSetAudioGraph();
  if (!v11)
  {
    *int v10 = musicSequence;
LABEL_20:
    std::recursive_mutex::unlock(v7);
    goto LABEL_21;
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    double v15 = "AVAEInternal.h";
    __int16 v16 = 1024;
    int v17 = 104;
    __int16 v18 = 2080;
    long long v19 = "AVAudioEngineGraph.mm";
    __int16 v20 = 1024;
    int v21 = 4504;
    __int16 v22 = 2080;
    int v23 = "SetSequence";
    __int16 v24 = 2080;
    int v25 = "err = MusicSequenceSetAudioGraph(inSequence, _seqGraphImpl)";
    __int16 v26 = 1024;
    int v27 = v11;
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v11);
  std::recursive_mutex::unlock(v7);
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316674;
    double v15 = "AVAEInternal.h";
    __int16 v16 = 1024;
    int v17 = 104;
    __int16 v18 = 2080;
    long long v19 = "AVAudioEngine.mm";
    __int16 v20 = 1024;
    int v21 = 1549;
    __int16 v22 = 2080;
    int v23 = "SetSequence";
    __int16 v24 = 2080;
    int v25 = "_graph->SetSequence(inSequence)";
    __int16 v26 = 1024;
    int v27 = v11;
    _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v11);
LABEL_21:

  std::recursive_mutex::unlock(v5);
}

- (id)description
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  uint64_t v4 = (AVAudioEngineGraph *)*((void *)self->_impl + 1);
  if (v4)
  {
    uint64_t v5 = (std::recursive_mutex *)(*(void *)v4 + 112);
    v72 = v3;
    std::recursive_mutex::lock(v5);
    v71 = v5;
    v74 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v6 = funopen(&v73, 0, (int (__cdecl *)(void *, const char *, int))CAMemoryStream::Write, 0, 0);
    v73 = v6;
    __stream = v6;
    fprintf(v6, "\n________ %s ________\n", "GraphDescription");
    fprintf(v6, "AVAudioEngineGraph %p: initialized = %d, running = %d, number of nodes = %d\n", v4, *((unsigned __int8 *)v4 + 185), *((unsigned __int8 *)v4 + 184), *(void *)(*((void *)v4 + 1) + 16));
    uint64_t v7 = (void *)*((void *)v4 + 1);
    v79 = 0;
    uint64_t v80 = 0;
    v78 = &v79;
    uint64_t v8 = v7 + 1;
    BOOL v9 = (void *)*v7;
    if ((void *)*v7 != v7 + 1)
    {
      do
      {
        int v10 = v9 + 4;
        uint64_t v11 = v79;
        uint64_t v12 = &v79;
        if (v78 == &v79) {
          goto LABEL_9;
        }
        uint64_t v13 = v79;
        uint64_t v14 = &v79;
        if (v79)
        {
          do
          {
            uint64_t v12 = (uint64_t **)v13;
            uint64_t v13 = (uint64_t *)v13[1];
          }
          while (v13);
        }
        else
        {
          do
          {
            uint64_t v12 = (uint64_t **)v14[2];
            BOOL v15 = *v12 == (uint64_t *)v14;
            uint64_t v14 = v12;
          }
          while (v15);
        }
        unint64_t v16 = *v10;
        if ((unint64_t)v12[4] < *v10)
        {
LABEL_9:
          if (v79) {
            int v17 = v12;
          }
          else {
            int v17 = &v79;
          }
          if (v79) {
            __int16 v18 = v12 + 1;
          }
          else {
            __int16 v18 = &v79;
          }
        }
        else
        {
          int v17 = &v79;
          __int16 v18 = &v79;
          if (v79)
          {
            __int16 v18 = &v79;
            while (1)
            {
              while (1)
              {
                int v17 = (uint64_t **)v11;
                unint64_t v22 = v11[4];
                if (v16 >= v22) {
                  break;
                }
                uint64_t v11 = *v17;
                __int16 v18 = v17;
                if (!*v17) {
                  goto LABEL_16;
                }
              }
              if (v22 >= v16) {
                break;
              }
              __int16 v18 = v17 + 1;
              uint64_t v11 = v17[1];
              if (!v11) {
                goto LABEL_16;
              }
            }
          }
        }
        if (!*v18)
        {
LABEL_16:
          long long v19 = operator new(0x30uLL);
          v19[2] = *(_OWORD *)v10;
          *(void *)long long v19 = 0;
          *((void *)v19 + 1) = 0;
          *((void *)v19 + 2) = v17;
          *__int16 v18 = (uint64_t *)v19;
          if (*v78)
          {
            v78 = (uint64_t **)*v78;
            long long v19 = *v18;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v79, (uint64_t *)v19);
          ++v80;
        }
        __int16 v20 = (void *)v9[1];
        if (v20)
        {
          do
          {
            int v21 = v20;
            __int16 v20 = (void *)*v20;
          }
          while (v20);
        }
        else
        {
          do
          {
            int v21 = (void *)v9[2];
            BOOL v15 = *v21 == (void)v9;
            BOOL v9 = v21;
          }
          while (!v15);
        }
        BOOL v9 = v21;
      }
      while (v21 != v8);
      uint64_t v7 = (void *)*((void *)v4 + 1);
      BOOL v9 = (void *)*v7;
    }
    int v23 = v7 + 1;
    if (v9 != v23)
    {
      do
      {
        *(_DWORD *)(v9[5] + 32) &= 0xFFFFFFE7;
        __int16 v24 = (void *)v9[1];
        if (v24)
        {
          do
          {
            int v25 = v24;
            __int16 v24 = (void *)*v24;
          }
          while (v24);
        }
        else
        {
          do
          {
            int v25 = (void *)v9[2];
            BOOL v15 = *v25 == (void)v9;
            BOOL v9 = v25;
          }
          while (!v15);
        }
        BOOL v9 = v25;
      }
      while (v25 != v23);
    }
    if (AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 3)))
    {
      fwrite("\n\t ******** output chain ********\n", 0x22uLL, 1uLL, __stream);
      uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 3));
      *(void *)v86 = &unk_1EEFA3690;
      *(void *)&v86[8] = &__stream;
      *(void *)&long long v87 = &v78;
      *((void *)&v87 + 1) = v86;
      AUGraphParser::TraverseGraphNodesBFS(1, NodeFromMap, 0, (uint64_t)v86);
      std::__function::__value_func<ETraversalStatus ()(AUGraphNodeBaseV3 &,AUGraphConnection *)>::~__value_func[abi:ne180100](v86);
    }
    if (AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 2)))
    {
      fwrite("\n\t ******** input chain ********\n", 0x21uLL, 1uLL, __stream);
      uint64_t v27 = AVAudioEngineGraph::GetNodeFromMap(v4, *((AVAudioNodeImplBase **)v4 + 2));
      *(void *)v86 = &unk_1EEFA36D8;
      *(void *)&v86[8] = &__stream;
      *(void *)&long long v87 = &v78;
      *((void *)&v87 + 1) = v86;
      AUGraphParser::TraverseGraphNodesBFS(0, v27, 0, (uint64_t)v86);
      std::__function::__value_func<ETraversalStatus ()(AUGraphNodeBaseV3 &,AUGraphConnection *)>::~__value_func[abi:ne180100](v86);
    }
    if (*((void *)v4 + 19))
    {
      fwrite("\n\t ******** pending connections - output ********\n", 0x32uLL, 1uLL, __stream);
      uint64_t v28 = (void *)*((void *)v4 + 18);
      if (v28 != (void *)((char *)v4 + 136))
      {
        while (1)
        {
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          *(_OWORD *)v86 = 0u;
          long long v87 = 0u;
          uint64_t v30 = v28 + 2;
          uint64_t v29 = v28[2];
          memset(&v77, 0, sizeof(v77));
          if (v29) {
            break;
          }
          uint64_t v32 = v28[4];
          if (v32)
          {
            int v31 = (uint64_t (**)(void))(**(void **)(v32 + 24) + 72);
LABEL_51:
            v33 = (void *)(*v31)();
            if (v33)
            {
              uint64_t v34 = [v33 streamDescription];
              long long v35 = *(_OWORD *)(v34 + 16);
              *(_OWORD *)&v77.var0 = *(_OWORD *)v34;
              *(_OWORD *)&v77.var3 = v35;
              *(void *)&v77.var7 = *(void *)(v34 + 32);
            }
          }
          __int16 v36 = __stream;
          AVAudioEngineGraph::ConnAsString(&__p, (uint64_t)v4, (uint64_t)(v28 + 2));
          int v37 = SHIBYTE(v84);
          __int16 v38 = (void **)__p;
          CAStreamBasicDescription::AsString(&v77, v86, 0x100uLL, v39, v40);
          if (v37 >= 0) {
            p_p = &__p;
          }
          else {
            p_p = v38;
          }
          fprintf(v36, "\n\t %s, [%s]\n", (const char *)p_p, v86);
          if (SHIBYTE(v84) < 0) {
            operator delete(__p);
          }
          uint64_t v42 = *v30;
          if (*v30)
          {
            __p = &unk_1EEFA3720;
            p_stream = &__stream;
            v84 = &v78;
            v85 = &__p;
            AUGraphParser::TraverseGraphNodesBFS(1, v42, 0, (uint64_t)&__p);
            std::__function::__value_func<ETraversalStatus ()(AUGraphNodeBaseV3 &,AUGraphConnection *)>::~__value_func[abi:ne180100](&__p);
          }
          uint64_t v28 = (void *)v28[1];
          if (v28 == (void *)((char *)v4 + 136)) {
            goto LABEL_61;
          }
        }
        int v31 = (uint64_t (**)(void))(**(void **)(v29 + 24) + 48);
        goto LABEL_51;
      }
    }
LABEL_61:
    if (*((void *)v4 + 22))
    {
      fwrite("\n\t ******** pending connections - input ********\n", 0x31uLL, 1uLL, __stream);
      v43 = (void *)*((void *)v4 + 21);
      if (v43 != (void *)((char *)v4 + 160))
      {
        while (1)
        {
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          *(_OWORD *)v86 = 0u;
          long long v87 = 0u;
          uint64_t v44 = v43[2];
          memset(&v77, 0, sizeof(v77));
          if (v44) {
            break;
          }
          uint64_t v46 = v43[4];
          if (v46)
          {
            v45 = (uint64_t (**)(void))(**(void **)(v46 + 24) + 72);
LABEL_67:
            v47 = (void *)(*v45)();
            if (v47)
            {
              uint64_t v48 = [v47 streamDescription];
              long long v49 = *(_OWORD *)(v48 + 16);
              *(_OWORD *)&v77.var0 = *(_OWORD *)v48;
              *(_OWORD *)&v77.var3 = v49;
              *(void *)&v77.var7 = *(void *)(v48 + 32);
            }
          }
          v50 = __stream;
          AVAudioEngineGraph::ConnAsString(&__p, (uint64_t)v4, (uint64_t)(v43 + 2));
          int v51 = SHIBYTE(v84);
          v52 = (void **)__p;
          CAStreamBasicDescription::AsString(&v77, v86, 0x100uLL, v53, v54);
          if (v51 >= 0) {
            v55 = &__p;
          }
          else {
            v55 = v52;
          }
          fprintf(v50, "\n\t %s, [%s]\n", (const char *)v55, v86);
          if (SHIBYTE(v84) < 0) {
            operator delete(__p);
          }
          uint64_t v56 = v43[4];
          if (v56)
          {
            __p = &unk_1EEFA3768;
            p_stream = &__stream;
            v84 = &v78;
            v85 = &__p;
            AUGraphParser::TraverseGraphNodesBFS(0, v56, 0, (uint64_t)&__p);
            std::__function::__value_func<ETraversalStatus ()(AUGraphNodeBaseV3 &,AUGraphConnection *)>::~__value_func[abi:ne180100](&__p);
          }
          v43 = (void *)v43[1];
          if (v43 == (void *)((char *)v4 + 160)) {
            goto LABEL_77;
          }
        }
        v45 = (uint64_t (**)(void))(**(void **)(v44 + 24) + 48);
        goto LABEL_67;
      }
    }
LABEL_77:
    if (v80)
    {
      fwrite("\n\t ******** other nodes ********\n", 0x21uLL, 1uLL, __stream);
      v58 = v78;
      if (v78 != &v79)
      {
        do
        {
          AUGraphNodeBase::PrintNodeObject((AUGraphNodeBase *)v58[5], __stream, v57);
          v59 = v58[1];
          if (v59)
          {
            do
            {
              v60 = (uint64_t **)v59;
              v59 = (uint64_t *)*v59;
            }
            while (v59);
          }
          else
          {
            do
            {
              v60 = (uint64_t **)v58[2];
              BOOL v15 = *v60 == (uint64_t *)v58;
              v58 = v60;
            }
            while (!v15);
          }
          v58 = v60;
        }
        while (v60 != &v79);
      }
    }
    v61 = (void *)*((void *)v4 + 1);
    v64 = (void *)*v61;
    v62 = v61 + 1;
    v63 = v64;
    int v3 = v72;
    if (v64 != v62)
    {
      do
      {
        *(_DWORD *)(v63[5] + 32) &= 0xFFFFFFE7;
        v65 = (void *)v63[1];
        if (v65)
        {
          do
          {
            v66 = v65;
            v65 = (void *)*v65;
          }
          while (v65);
        }
        else
        {
          do
          {
            v66 = (void *)v63[2];
            BOOL v15 = *v66 == (void)v63;
            v63 = v66;
          }
          while (!v15);
        }
        v63 = v66;
      }
      while (v66 != v62);
    }
    fwrite("______________________________________\n\n", 0x28uLL, 1uLL, __stream);
    std::__tree<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::__map_value_compare<AUGraphNodeBaseV3 *,std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>,std::less<AUGraphNodeBaseV3 *>,true>,std::allocator<std::__value_type<AUGraphNodeBaseV3 *,std::pair<AUGraphNodeBaseV3 *,unsigned int>>>>::destroy(v79);
    fflush(v73);
    v67 = v74;
    if (!v74)
    {
      v67 = malloc_type_malloc(1uLL, 0xC3C60566uLL);
      v74 = v67;
    }
    *((unsigned char *)v67 + v75) = 0;
    v68 = v74;
    v74 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    fclose(v73);
    free(v74);
    std::recursive_mutex::unlock(v71);
    v69 = (__CFString *)[NSString stringWithUTF8String:v68];
    free(v68);
  }
  else
  {
    v69 = @"<AVAudioEngine: nil graph>";
  }
  std::recursive_mutex::unlock(v3);
  return v69;
}

- (NSArray)outputConnectionPointsForNode:(AVAudioNode *)node outputBus:(AVAudioNodeBus)bus
{
  uint64_t v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  OutputConnectionPointsForNode = (NSArray *)AVAudioEngineImpl::GetOutputConnectionPointsForNode((AVAudioEngineImpl *)self->_impl, node, bus);
  std::recursive_mutex::unlock(v7);
  return OutputConnectionPointsForNode;
}

- (AVAudioConnectionPoint)inputConnectionPointForNode:(AVAudioNode *)node inputBus:(AVAudioNodeBus)bus
{
  uint64_t v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  InputConnectionPointForNode = AVAudioEngineImpl::GetInputConnectionPointForNode((AVAudioEngineImpl *)self->_impl, node, bus);
  std::recursive_mutex::unlock(v7);
  return InputConnectionPointForNode;
}

- (void)stop
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineImpl::Stop((AVAudioEngineImpl *)self->_impl, 0);

  std::recursive_mutex::unlock(v3);
}

- (void)reset
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineImpl::Reset((AVAudioEngineImpl *)self->_impl);

  std::recursive_mutex::unlock(v3);
}

- (void)pause
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  AVAudioEngineImpl::Pause((AVAudioEngineImpl *)self->_impl, 0);

  std::recursive_mutex::unlock(v3);
}

- (void)prepare
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  uint64_t v6 = 0;
  AVAudioEngineImpl::Initialize((AVAudioEngineImpl *)self->_impl, &v6);
  if (v6)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v4 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      int v5 = [(NSError *)v6 code];
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = "AVAudioEngine.mm";
      __int16 v9 = 1024;
      int v10 = 189;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      __int16 v13 = 1024;
      int v14 = v5;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine@%p: could not initialize, error = %d", buf, 0x22u);
    }
  }
  std::recursive_mutex::unlock(v3);
}

- (BOOL)startAndReturnError:(NSError *)outError
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  impl = (char *)self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)impl;
    __int16 v9 = (unsigned __int8 *)*((void *)impl + 1);
    if (v9)
    {
      int v10 = v9[208];
      v9 += 184;
      if (v10) {
        __int16 v9 = (unsigned __int8 *)(impl + 64);
      }
      LODWORD(v9) = *v9;
    }
    *(_DWORD *)long long v19 = 136315906;
    *(void *)&v19[4] = "AVAudioEngine.mm";
    __int16 v20 = 1024;
    int v21 = 1179;
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    __int16 v24 = 1024;
    int v25 = (int)v9;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Engine@%p: start, was running %d", v19, 0x22u);
  }
  uint64_t v11 = *((void *)impl + 1);
  if (v11)
  {
    uint64_t v12 = *(unsigned char *)(v11 + 208) ? impl + 64 : (char *)(v11 + 184);
    if (*v12)
    {
      BOOL v13 = 1;
      impl[64] = 1;
      if (outError) {
        *outError = 0;
      }
      goto LABEL_25;
    }
  }
  *(void *)long long v19 = 0;
  AVAudioEngineImpl::Initialize((AVAudioEngineImpl *)impl, (NSError **)v19);
  int v14 = *(NSError **)v19;
  if (!*(void *)v19)
  {
    uint64_t v15 = (AVAudioIOUnit *)*((void *)impl + 7);
    if (!v15)
    {
LABEL_22:
      AVAudioEngineGraph::Start(*((AVAudioNodeImplBase ***)impl + 1), (NSError **)v19);
      int v14 = *(NSError **)v19;
      goto LABEL_23;
    }
    if (*((void *)impl + 5))
    {
      char CanPerformIO = AVAudioIOUnit::CanPerformIO(v15, 0);
      if (!*((void *)impl + 4)) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v18 = *((void *)impl + 4);
      char CanPerformIO = v18 != 0;
      if (!v18)
      {
LABEL_21:
        _AVAE_CheckAndReturnErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 1266, "CheckCanPerformIO", "canPerformIO", CanPerformIO, 560227702, (NSError **)v19);
        int v14 = *(NSError **)v19;
        if (*(void *)v19) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
    CanPerformIO &= AVAudioIOUnit::CanPerformIO(*((AVAudioIOUnit **)impl + 7), 1);
    goto LABEL_21;
  }
LABEL_23:
  BOOL v13 = v14 == 0;
  impl[64] = v14 == 0;
  if (outError) {
    *outError = v14;
  }
LABEL_25:
  std::recursive_mutex::unlock(v5);
  return v13;
}

- (void)disconnectNodeOutput:(AVAudioNode *)node
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  __int16 v22 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v22);
  impl = self->_impl;
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngine.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1056;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllOutputs";
      __int16 v34 = 2080;
      long long v35 = "node != nil";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil");
  }
  if (([*((id *)impl + 3) containsObject:node] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngine.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1057;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllOutputs";
      __int16 v34 = 2080;
      long long v35 = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: node]");
  }
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = *(char **)impl;
    *(_DWORD *)buf = 136315906;
    uint64_t v27 = "AVAudioEngine.mm";
    __int16 v28 = 1024;
    int v29 = 1059;
    __int16 v30 = 2048;
    int v31 = v9;
    __int16 v32 = 2048;
    *(void *)v33 = node;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect all outputs on node: %p", buf, 0x26u);
  }
  int v10 = (AVAudioEngineGraph *)*((void *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngineGraph.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 2849;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllOutputs";
      __int16 v34 = 2080;
      long long v35 = "inAVNode";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inAVNode");
  }
  uint64_t v12 = [(AVAudioNode *)node impl];
  if (!v12)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    BOOL v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngineGraph.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 2852;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllOutputs";
      __int16 v34 = 2080;
      long long v35 = "inImpl";
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inImpl");
  }
  int v14 = (std::recursive_mutex *)(*(void *)v10 + 112);
  std::recursive_mutex::lock(v14);
  if (!AVAudioEngineGraph::IsNodeInGraph(v10, v12))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngineGraph.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 2857;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllOutputs";
      __int16 v34 = 2080;
      long long v35 = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inImpl)");
  }
  uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v10, v12);
  uint64_t v23 = (uint64_t)&v23;
  __int16 v24 = &v23;
  uint64_t v25 = 0;
  AUGraphNodeBase::GetValidConnections(NodeFromMap, 0, &v23);
  int v17 = v24;
  if (v24 == &v23)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = AVAudioEngineGraph::_DisconnectInput(v10, *(AVAudioNodeImplBase **)(v17[4] + 24), *((unsigned int *)v17 + 10));
      if (v19)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        __int16 v20 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v27 = "AVAEInternal.h";
          __int16 v28 = 1024;
          int v29 = 104;
          __int16 v30 = 2080;
          int v31 = "AVAudioEngineGraph.mm";
          __int16 v32 = 1024;
          *(_DWORD *)v33 = 2869;
          *(_WORD *)&v33[4] = 2080;
          *(void *)&v33[6] = "DisconnectAllOutputs";
          __int16 v34 = 2080;
          long long v35 = "tmpErr = _DisconnectInput(conn.destNode->NodeImpl(), conn.destBus)";
          __int16 v36 = 1024;
          int v37 = v19;
          _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v19);
        uint64_t v18 = v19;
      }
      int v17 = (uint64_t *)v17[1];
    }
    while (v17 != &v23);
  }
  std::__list_imp<AUGraphConnection>::clear(&v23);
  std::recursive_mutex::unlock(v14);
  if (v18)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v21 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 104;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngine.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1061;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllOutputs";
      __int16 v34 = 2080;
      long long v35 = "_graph->DisconnectAllOutputs(node)";
      __int16 v36 = 1024;
      int v37 = v18;
      _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v18);
  }

  std::recursive_mutex::unlock(v22);
}

- (void)disconnectNodeInput:(AVAudioNode *)node
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  __int16 v22 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v22);
  impl = self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  uint64_t v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(char **)impl;
    *(_DWORD *)buf = 136315906;
    uint64_t v27 = "AVAudioEngine.mm";
    __int16 v28 = 1024;
    int v29 = 1046;
    __int16 v30 = 2048;
    int v31 = v7;
    __int16 v32 = 2048;
    *(void *)v33 = node;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect all inputs on node: %p", buf, 0x26u);
  }
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v8 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngine.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1048;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllInputs";
      __int16 v34 = 2080;
      long long v35 = "node != nil";
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil");
  }
  if (([*((id *)impl + 3) containsObject:node] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngine.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1049;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllInputs";
      __int16 v34 = 2080;
      long long v35 = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: node]");
  }
  int v10 = (AVAudioEngineGraph *)*((void *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngineGraph.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 2820;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllInputs";
      __int16 v34 = 2080;
      long long v35 = "inAVNode";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inAVNode");
  }
  uint64_t v12 = [(AVAudioNode *)node impl];
  if (!v12)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    BOOL v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngineGraph.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 2823;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllInputs";
      __int16 v34 = 2080;
      long long v35 = "inImpl";
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inImpl");
  }
  int v14 = (std::recursive_mutex *)(*(void *)v10 + 112);
  std::recursive_mutex::lock(v14);
  if (!AVAudioEngineGraph::IsNodeInGraph(v10, v12))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v15 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 71;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngineGraph.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 2828;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllInputs";
      __int16 v34 = 2080;
      long long v35 = "IsNodeInGraph(inImpl)";
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inImpl)");
  }
  uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v10, v12);
  uint64_t v23 = (uint64_t)&v23;
  __int16 v24 = &v23;
  uint64_t v25 = 0;
  AUGraphNodeBase::GetValidConnections(NodeFromMap, 1, &v23);
  int v17 = v24;
  if (v24 == &v23)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = AVAudioEngineGraph::_DisconnectInput(v10, *(AVAudioNodeImplBase **)(v17[4] + 24), *((unsigned int *)v17 + 10));
      if (v19)
      {
        if (AVAudioEngineLogCategory(void)::once != -1) {
          dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
        }
        __int16 v20 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
        if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v27 = "AVAEInternal.h";
          __int16 v28 = 1024;
          int v29 = 104;
          __int16 v30 = 2080;
          int v31 = "AVAudioEngineGraph.mm";
          __int16 v32 = 1024;
          *(_DWORD *)v33 = 2840;
          *(_WORD *)&v33[4] = 2080;
          *(void *)&v33[6] = "DisconnectAllInputs";
          __int16 v34 = 2080;
          long long v35 = "tmpErr = _DisconnectInput(conn.destNode->NodeImpl(), conn.destBus)";
          __int16 v36 = 1024;
          int v37 = v19;
          _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v19);
        uint64_t v18 = v19;
      }
      int v17 = (uint64_t *)v17[1];
    }
    while (v17 != &v23);
  }
  std::__list_imp<AUGraphConnection>::clear(&v23);
  std::recursive_mutex::unlock(v14);
  if (v18)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v21 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v27 = "AVAEInternal.h";
      __int16 v28 = 1024;
      int v29 = 104;
      __int16 v30 = 2080;
      int v31 = "AVAudioEngine.mm";
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1051;
      *(_WORD *)&v33[4] = 2080;
      *(void *)&v33[6] = "DisconnectAllInputs";
      __int16 v34 = 2080;
      long long v35 = "_graph->DisconnectAllInputs(node)";
      __int16 v36 = 1024;
      int v37 = v18;
      _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v18);
  }

  std::recursive_mutex::unlock(v22);
}

- (void)disconnectNodeOutput:(AVAudioNode *)node bus:(AVAudioNodeBus)bus
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  impl = self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  __int16 v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    int v10 = *(char **)impl;
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVAudioEngine.mm";
    __int16 v24 = 1024;
    int v25 = 1036;
    __int16 v26 = 2048;
    uint64_t v27 = v10;
    __int16 v28 = 2048;
    *(void *)int v29 = bus;
    *(_WORD *)&v29[8] = 2048;
    *(void *)&v29[10] = node;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect output bus: %lu on node: %p", buf, 0x30u);
  }
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      uint64_t v27 = "AVAudioEngine.mm";
      __int16 v28 = 1024;
      *(_DWORD *)int v29 = 1038;
      *(_WORD *)&v29[4] = 2080;
      *(void *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(void *)&v29[16] = "node != nil";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil");
  }
  if (([*((id *)impl + 3) containsObject:node] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      uint64_t v27 = "AVAudioEngine.mm";
      __int16 v28 = 1024;
      *(_DWORD *)int v29 = 1039;
      *(_WORD *)&v29[4] = 2080;
      *(void *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(void *)&v29[16] = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: node]");
  }
  BOOL v13 = (AVAudioEngineGraph *)*((void *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      uint64_t v27 = "AVAudioEngineGraph.mm";
      __int16 v28 = 1024;
      *(_DWORD *)int v29 = 2793;
      *(_WORD *)&v29[4] = 2080;
      *(void *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(void *)&v29[16] = "inSrcAVNode";
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inSrcAVNode");
  }
  uint64_t v15 = [(AVAudioNode *)node impl];
  if (!v15)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    unint64_t v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      uint64_t v27 = "AVAudioEngineGraph.mm";
      __int16 v28 = 1024;
      *(_DWORD *)int v29 = 2796;
      *(_WORD *)&v29[4] = 2080;
      *(void *)&v29[6] = "DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(void *)&v29[16] = "inSrcImpl";
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inSrcImpl");
  }
  uint64_t v17 = (*(uint64_t (**)(AVAudioNodeImplBase *, AVAudioNodeBus))(*(void *)v15 + 240))(v15, bus);
  uint64_t v18 = (std::recursive_mutex *)(*(void *)v13 + 112);
  std::recursive_mutex::lock(v18);
  if (!AVAudioEngineGraph::IsNodeInGraph(v13, v15))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v19 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = "AVAEInternal.h";
      __int16 v24 = 1024;
      int v25 = 71;
      __int16 v26 = 2080;
      uint64_t v27 = "AVAudioEngineGraph.mm";
      __int16 v28 = 1024;
      *(_DWORD *)int v29 = 2806;
      *(_WORD *)&v29[4] = 2080;
      *(void *)&v29[6] = "_DisconnectOutput";
      *(_WORD *)&v29[14] = 2080;
      *(void *)&v29[16] = "IsNodeInGraph(inSrcImpl)";
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "IsNodeInGraph(inSrcImpl)");
  }
  uint64_t NodeFromMap = AVAudioEngineGraph::GetNodeFromMap(v13, v15);
  *(void *)buf = 0;
  *(_DWORD *)&buf[8] = -1;
  if ((*(uint64_t (**)(uint64_t, void, uint64_t, unsigned char *))(*(void *)NodeFromMap + 40))(NodeFromMap, 0, v17, buf))
  {
    uint64_t v21 = AVAudioEngineGraph::_DisconnectInput(v13, *(AVAudioNodeImplBase **)(*(void *)buf + 24), *(unsigned int *)&buf[8]);
    std::recursive_mutex::unlock(v18);
    if (v21)
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      __int16 v22 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = "AVAEInternal.h";
        __int16 v24 = 1024;
        int v25 = 104;
        __int16 v26 = 2080;
        uint64_t v27 = "AVAudioEngine.mm";
        __int16 v28 = 1024;
        *(_DWORD *)int v29 = 1041;
        *(_WORD *)&v29[4] = 2080;
        *(void *)&v29[6] = "DisconnectOutput";
        *(_WORD *)&v29[14] = 2080;
        *(void *)&v29[16] = "_graph->DisconnectOutput(node, bus)";
        __int16 v30 = 1024;
        int v31 = v21;
        _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
      }
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v21);
    }
  }
  else
  {
    std::recursive_mutex::unlock(v18);
  }

  std::recursive_mutex::unlock(v7);
}

- (void)disconnectNodeInput:(AVAudioNode *)node bus:(AVAudioNodeBus)bus
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v7);
  impl = self->_impl;
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  __int16 v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
  if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_DEBUG))
  {
    int v10 = *(char **)impl;
    *(_DWORD *)buf = 136316162;
    uint64_t v21 = "AVAudioEngine.mm";
    __int16 v22 = 1024;
    int v23 = 1026;
    __int16 v24 = 2048;
    int v25 = v10;
    __int16 v26 = 2048;
    *(void *)uint64_t v27 = bus;
    *(_WORD *)&v27[8] = 2048;
    *(void *)&v27[10] = node;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d Engine@%p: disconnect input bus: %lu on node: %p", buf, 0x30u);
  }
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "AVAEInternal.h";
      __int16 v22 = 1024;
      int v23 = 71;
      __int16 v24 = 2080;
      int v25 = "AVAudioEngine.mm";
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = 1028;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(void *)&v27[16] = "node != nil";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "node != nil");
  }
  if (([*((id *)impl + 3) containsObject:node] & 1) == 0)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v12 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "AVAEInternal.h";
      __int16 v22 = 1024;
      int v23 = 71;
      __int16 v24 = 2080;
      int v25 = "AVAudioEngine.mm";
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = 1029;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(void *)&v27[16] = "[_nodes containsObject: node]";
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "[_nodes containsObject: node]");
  }
  BOOL v13 = (AVAudioEngineGraph *)*((void *)impl + 1);
  if (!node)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    int v14 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "AVAEInternal.h";
      __int16 v22 = 1024;
      int v23 = 71;
      __int16 v24 = 2080;
      int v25 = "AVAudioEngineGraph.mm";
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = 2670;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(void *)&v27[16] = "inDestAVNode";
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inDestAVNode");
  }
  uint64_t v15 = [(AVAudioNode *)node impl];
  if (!v15)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    unint64_t v16 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "AVAEInternal.h";
      __int16 v22 = 1024;
      int v23 = 71;
      __int16 v24 = 2080;
      int v25 = "AVAudioEngineGraph.mm";
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = 2673;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(void *)&v27[16] = "inDestImpl";
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "inDestImpl");
  }
  uint64_t v17 = (*(uint64_t (**)(AVAudioNodeImplBase *, AVAudioNodeBus))(*(void *)v15 + 240))(v15, bus);
  uint64_t v18 = AVAudioEngineGraph::_DisconnectInput(v13, v15, v17);
  if (v18)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    uint64_t v19 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v21 = "AVAEInternal.h";
      __int16 v22 = 1024;
      int v23 = 104;
      __int16 v24 = 2080;
      int v25 = "AVAudioEngine.mm";
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = 1031;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "DisconnectInput";
      *(_WORD *)&v27[14] = 2080;
      *(void *)&v27[16] = "_graph->DisconnectInput(node, bus)";
      __int16 v28 = 1024;
      int v29 = v18;
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d [%s:%d:%s: (%s): error %d", buf, 0x3Cu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"error %d", v18);
  }

  std::recursive_mutex::unlock(v7);
}

- (void)connect:(AVAudioNode *)sourceNode toConnectionPoints:(NSArray *)destNodes fromBus:(AVAudioNodeBus)sourceBus format:(AVAudioFormat *)format
{
  uint64_t v11 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v11);
  AVAudioEngineImpl::ConnectMultipleOutputs((id *)self->_impl, sourceNode, destNodes, sourceBus, format);

  std::recursive_mutex::unlock(v11);
}

- (void)connect:(AVAudioNode *)node1 to:(AVAudioNode *)node2 format:(AVAudioFormat *)format
{
  __int16 v9 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v9);
  impl = (id *)self->_impl;
  if (node2 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v11 = [(AVAudioNode *)node2 nextAvailableInputBus];
  }
  else {
    uint64_t v11 = 0;
  }
  AVAudioEngineImpl::Connect(impl, node1, node2, 0, v11, format);

  std::recursive_mutex::unlock(v9);
}

- (void)connect:(AVAudioNode *)node1 to:(AVAudioNode *)node2 fromBus:(AVAudioNodeBus)bus1 toBus:(AVAudioNodeBus)bus2 format:(AVAudioFormat *)format
{
  BOOL v13 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v13);
  AVAudioEngineImpl::Connect((id *)self->_impl, node1, node2, bus1, bus2, format);

  std::recursive_mutex::unlock(v13);
}

- (AVAudioMixerNode)mainMixerNode
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = (AVAudioEngineImpl *)self->_impl;
  int v5 = (AVAudioMixerNode *)*((void *)impl + 6);
  if (!v5)
  {
    OutputNode = (AVAudioNode *)AVAudioEngineImpl::GetOutputNode(impl);
    int v5 = objc_alloc_init(AVAudioMixerNode);
    AVAudioEngineImpl::AttachNode(impl, &v5->super, 1);

    if (AVAudioEngineImpl::Connect((id *)impl, &v5->super, OutputNode, 0, 0, 0))
    {
      *((void *)impl + 6) = v5;
    }
    else
    {
      if (AVAudioEngineLogCategory(void)::once != -1) {
        dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
      }
      uint64_t v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
      if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)impl;
        int v10 = 136315650;
        uint64_t v11 = "AVAudioEngine.mm";
        __int16 v12 = 1024;
        int v13 = 691;
        __int16 v14 = 2048;
        uint64_t v15 = v8;
        _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine#%p: error: couldn't connect mixer to output node!", (uint8_t *)&v10, 0x1Cu);
      }
      AVAudioEngineImpl::DetachNode((id *)impl, &v5->super, 1, 0);
      int v5 = 0;
    }
  }
  std::recursive_mutex::unlock(v3);
  return v5;
}

- (AVAudioInputNode)inputNode
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  impl = self->_impl;
  int v5 = (void *)*((void *)impl + 4);
  if (v5)
  {
    int v6 = *(unsigned __int8 *)(*((void *)impl + 1) + 187);
    int v7 = [*((id *)impl + 4) isInManualRenderingMode];
    char v8 = v7 ^ 1;
    if (!v6) {
      char v8 = 1;
    }
    if (v8)
    {
      if (v7 == (v6 != 0)) {
        goto LABEL_14;
      }
    }
    else if ([v5 manualRenderingMode] == *(void *)(*((void *)impl + 1) + 192))
    {
      goto LABEL_14;
    }
  }
  AVAudioEngineImpl::UpdateInputNode((uint64_t)impl, 1);
  if (!*((void *)impl + 4))
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v9 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      int v13 = "AVAEInternal.h";
      __int16 v14 = 1024;
      int v15 = 71;
      __int16 v16 = 2080;
      uint64_t v17 = "AVAudioEngine.mm";
      __int16 v18 = 1024;
      int v19 = 676;
      __int16 v20 = 2080;
      uint64_t v21 = "GetInputNode";
      __int16 v22 = 2080;
      int v23 = "_inputNode != nil";
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "_inputNode != nil");
  }
LABEL_14:
  int v10 = (AVAudioInputNode *)*((void *)impl + 4);
  std::recursive_mutex::unlock(v3);
  return v10;
}

- (AVAudioOutputNode)outputNode
{
  int v3 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v3);
  OutputNode = (AVAudioOutputNode *)AVAudioEngineImpl::GetOutputNode((AVAudioEngineImpl *)self->_impl);
  std::recursive_mutex::unlock(v3);
  return OutputNode;
}

- (void)detachNode:(AVAudioNode *)node
{
  int v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  AVAudioEngineImpl::DetachNode((id *)self->_impl, node, 0, 0);

  std::recursive_mutex::unlock(v5);
}

- (void)attachNode:(AVAudioNode *)node
{
  int v5 = (std::recursive_mutex *)((char *)self->_impl + 112);
  std::recursive_mutex::lock(v5);
  AVAudioEngineImpl::AttachNode((AVAudioEngineImpl *)self->_impl, node, 0);

  std::recursive_mutex::unlock(v5);
}

- (void)dealloc
{
  impl = (char *)self->_impl;
  if (impl)
  {
    __int16 v12 = 0;
    AVAudioEngineImpl::Stop((AVAudioEngineImpl *)impl, &v12);
    std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100]((const void ***)impl + 13, 0);
    uint64_t v4 = (AVAudioNode *)*((void *)impl + 5);
    if (v4)
    {
      AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)impl + 1), v4, 0, &v12);
      AVAudioEngineImpl::DetachNode((id *)impl, *((AVAudioNode **)impl + 5), 1, &v12);
      *((void *)impl + 5) = 0;
    }
    int v5 = (AVAudioNode *)*((void *)impl + 4);
    if (v5)
    {
      AVAudioEngineGraph::RemoveIONode(*((AVAudioEngineGraph **)impl + 1), v5, 1, &v12);
      AVAudioEngineImpl::DetachNode((id *)impl, *((AVAudioNode **)impl + 4), 1, &v12);
      *((void *)impl + 4) = 0;
    }
    int v6 = (AVAudioNode *)*((void *)impl + 6);
    if (v6)
    {
      AVAudioEngineImpl::DetachNode((id *)impl, v6, 1, &v12);
      *((void *)impl + 6) = 0;
    }
    while (1)
    {
      int v7 = (AVAudioNode *)[*((id *)impl + 3) anyObject];
      if (!v7) {
        break;
      }
      AVAudioEngineImpl::DetachNode((id *)impl, v7, 0, &v12);
    }
    std::recursive_mutex::lock((std::recursive_mutex *)(impl + 112));
    std::unique_ptr<AVAudioEngineGraph>::reset[abi:ne180100]((uint64_t *)impl + 1);
    std::recursive_mutex::unlock((std::recursive_mutex *)(impl + 112));
    uint64_t v8 = *((void *)impl + 7);
    *((void *)impl + 7) = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }

    __int16 v9 = (void *)*((void *)impl + 11);
    if (v9) {
      dispatch_block_cancel(v9);
    }
    dispatch_sync(*((dispatch_queue_t *)impl + 9), &__block_literal_global_110);

    dispatch_release(*((dispatch_object_t *)impl + 9));
    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(impl + 112));
    std::unique_ptr<AVAEBlock<AVAudioEngineManualRenderingStatus({block_pointer})(unsigned int,AudioBufferList *,int *)>>::reset[abi:ne180100]((const void ***)impl + 13, 0);
    uint64_t v10 = *((void *)impl + 7);
    *((void *)impl + 7) = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    std::unique_ptr<AVAudioEngineGraph>::reset[abi:ne180100]((uint64_t *)impl + 1);
    MEMORY[0x19F3ABB30](impl, 0x10A0C40461284F8);
  }
  v11.receiver = self;
  v11.super_class = (Class)AVAudioEngine;
  [(AVAudioEngine *)&v11 dealloc];
}

- (AVAudioEngine)init
{
  if (AVAudioEngineLogCategory(void)::once != -1) {
    dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioEngine;
  if ([(AVAudioEngine *)&v4 init]) {
    operator new();
  }
  return 0;
}

@end
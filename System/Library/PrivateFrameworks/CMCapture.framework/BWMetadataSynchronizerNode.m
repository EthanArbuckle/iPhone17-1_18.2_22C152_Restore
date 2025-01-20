@interface BWMetadataSynchronizerNode
+ (void)initialize;
- (BWMetadataSynchronizerNode)initWithArraysOfMetadataInputs:(id)a3 propagateSampleBufferAttachmentKeys:(id)a4 propagateSampleBufferMetadataDictKeys:(id)a5 syncMetadataForPortTypes:(id)a6 syncOnlyIfMetadataEnabledForKeys:(id)a7;
- (BWMetadataSynchronizerNode)initWithMetadataInputs:(id)a3 propagateSampleBufferAttachmentKeys:(id)a4 propagateSampleBufferMetadataDictKeys:(id)a5 syncMetadataForPortTypes:(id)a6 syncOnlyIfMetadataEnabledForKeys:(id)a7;
- (id)_tryToEmitImageBufferWithAllMetadata:(id *)result;
- (id)nodeSubType;
- (id)nodeType;
- (unint64_t)_printState;
- (void)_attachedMediaKeysForMetadataInput:(void *)result;
- (void)_purgeAllBuffers;
- (void)_purgeAllPurgeableMetadataBuffers;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWMetadataSynchronizerNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWMetadataSynchronizerNode)initWithMetadataInputs:(id)a3 propagateSampleBufferAttachmentKeys:(id)a4 propagateSampleBufferMetadataDictKeys:(id)a5 syncMetadataForPortTypes:(id)a6 syncOnlyIfMetadataEnabledForKeys:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v13)
  {
    v14 = v13;
    id v20 = a4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(a3);
          }
          uint64_t v25 = *(void *)(*((void *)&v21 + 1) + 8 * v18);
          objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1));
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }
    self = [(BWMetadataSynchronizerNode *)self initWithArraysOfMetadataInputs:v14 propagateSampleBufferAttachmentKeys:v20 propagateSampleBufferMetadataDictKeys:a5 syncMetadataForPortTypes:a6 syncOnlyIfMetadataEnabledForKeys:a7];
  }
  return self;
}

- (BWMetadataSynchronizerNode)initWithArraysOfMetadataInputs:(id)a3 propagateSampleBufferAttachmentKeys:(id)a4 propagateSampleBufferMetadataDictKeys:(id)a5 syncMetadataForPortTypes:(id)a6 syncOnlyIfMetadataEnabledForKeys:(id)a7
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)BWMetadataSynchronizerNode;
  v12 = [(BWNode *)&v37 init];
  if (v12)
  {
    if (!a3) {
      goto LABEL_30;
    }
    v12->_syncMetadataForPortTypes = (NSArray *)a6;
    v12->_syncOnlyIfMetadataEnabledForKeys = (NSArray *)a7;
    v12->_propagateSampleBufferAttachmentKeys = (NSArray *)a4;
    v12->_propagateSampleBufferMetadataDictKeys = (NSArray *)a5;
    v12->_bufferServicingLock._os_unfair_lock_opaque = 0;
    size_t v13 = [a3 count] + 1;
    v14 = ($FBF65B9B8C8A83F4AFD9BB74AB6298ED *)malloc_type_calloc(v13, 0x28uLL, 0x10A0040EE0660CCuLL);
    v12->_inputsStorage = v14;
    if (v14)
    {
      size_t v36 = v13;
      if (v13)
      {
        uint64_t v15 = 0;
        uint64_t v33 = *MEMORY[0x1E4F53B58];
        CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        long long v34 = *MEMORY[0x1E4F1FA08];
        uint64_t v16 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
        do
        {
          if (v15)
          {
            uint64_t v17 = -[BWMetadataSynchronizerNode _attachedMediaKeysForMetadataInput:](v12, (void *)[a3 objectAtIndexedSubscript:v15 - 1]);
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v15 - 1), "objectAtIndexedSubscript:", 0), "isEqualToString:", v33))uint64_t v18 = 1885564004; {
            else
            }
              uint64_t v18 = 1986618469;
            uint64_t v19 = 2;
          }
          else
          {
            id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
            v38[0] = @"PrimaryFormat";
            uint64_t v19 = 1;
            uint64_t v17 = objc_msgSend(v20, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v38, 1));
            uint64_t v18 = 1986618469;
          }
          if (CMSimpleQueueCreate(allocator, v19, &v12->_inputsStorage[v15].var1)) {
            FigSignalErrorAt();
          }
          uint64_t v21 = (uint64_t)&v12->_inputsStorage[v15];
          *(_OWORD *)(v21 + 16) = v34;
          *(void *)(v21 + 32) = v16;
          v12->_inputsStorage[v15].var0 = v17;
          long long v22 = [[BWNodeInput alloc] initWithMediaType:v18 node:v12 index:v15];
          [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v22 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v22 primaryMediaConfiguration] setPassthroughMode:1];
          [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v22 primaryMediaConfiguration] setDelayedBufferCount:v19];
          if (v15)
          {
            long long v23 = objc_alloc_init(BWNodeInputMediaConfiguration);
            [(BWNodeInputMediaConfiguration *)v23 setPassthroughMode:0];
            [(BWNodeInput *)v22 setUnspecifiedAttachedMediaConfiguration:v23];
            if ((unint64_t)[v17 count] >= 2)
            {
              if ([v17 count])
              {
                unint64_t v24 = 0;
                do
                {
                  uint64_t v25 = objc_alloc_init(BWNodeInputMediaConfiguration);
                  [(BWNodeInputMediaConfiguration *)v25 setPassthroughMode:1];
                  -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v22, "setMediaConfiguration:forAttachedMediaKey:", v25, [v17 objectAtIndexedSubscript:v24++]);
                }
                while ([v17 count] > v24);
              }
            }
          }
          [(BWNode *)v12 addInput:v22];

          ++v15;
          LODWORD(v13) = v36;
        }
        while (v15 != v36);
      }
      v26 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v12];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v26 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v26 primaryMediaConfiguration] setPassthroughMode:1];
      if (v13 >= 2)
      {
        uint64_t v27 = 1;
        do
        {
          if ([v12->_inputsStorage[v27].var0 count])
          {
            unint64_t v28 = 0;
            do
            {
              v29 = objc_alloc_init(BWNodeOutputMediaConfiguration);
              [(BWNodeOutputMediaConfiguration *)v29 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
              [(BWNodeOutputMediaConfiguration *)v29 setPassthroughMode:1];
              [(BWNodeOutputMediaConfiguration *)v29 setIndexOfInputWhichDrivesThisOutput:v27];
              uint64_t v30 = [v12->_inputsStorage[v27].var0 count];
              v31 = @"PrimaryFormat";
              if (v30 != 1) {
                v31 = (__CFString *)[v12->_inputsStorage[v27].var0 objectAtIndexedSubscript:v28];
              }
              [(BWNodeOutputMediaConfiguration *)v29 setAttachedMediaKeyOfInputWhichDrivesThisOutput:v31];
              -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v26, "setMediaConfiguration:forAttachedMediaKey:", v29, [v12->_inputsStorage[v27].var0 objectAtIndexedSubscript:v28++]);
            }
            while ([v12->_inputsStorage[v27].var0 count] > v28);
          }
          ++v27;
        }
        while (v27 != v36);
      }
      [(BWNode *)v12 addOutput:v26];
    }
    else
    {
LABEL_30:
      FigDebugAssert3();

      return 0;
    }
  }
  return v12;
}

- (void)_attachedMediaKeysForMetadataInput:(void *)result
{
  if (result)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    if (v3)
    {
      v4 = (void *)v3;
      if ([a2 count])
      {
        unint64_t v5 = 0;
        uint64_t v6 = *MEMORY[0x1E4F53B60];
        uint64_t v7 = *MEMORY[0x1E4F53B58];
        do
        {
          char v8 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v5), "isEqualToString:", v6);
          uint64_t v9 = 0x1EFA68B80;
          if ((v8 & 1) == 0)
          {
            char v10 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v5), "isEqualToString:", v7);
            uint64_t v9 = 0x1EFA68BA0;
            if ((v10 & 1) == 0) {
              uint64_t v9 = [a2 objectAtIndexedSubscript:v5];
            }
          }
          [v4 addObject:v9];
          ++v5;
        }
        while ([a2 count] > v5);
      }
      if ([v4 count]) {
        return v4;
      }
      else {
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  if (self->_inputsStorage)
  {
    -[BWMetadataSynchronizerNode _purgeAllBuffers](self);
    if ([(NSArray *)[(BWNode *)self inputs] count])
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      do
      {
        inputsStorage = self->_inputsStorage;
        var1 = inputsStorage[v3].var1;
        if (var1)
        {
          CFRelease(var1);
          inputsStorage = self->_inputsStorage;
        }

        ++v4;
        ++v3;
      }
      while ([(NSArray *)[(BWNode *)self inputs] count] > v4);
    }
    free(self->_inputsStorage);
  }

  v7.receiver = self;
  v7.super_class = (Class)BWMetadataSynchronizerNode;
  [(BWNode *)&v7 dealloc];
}

- (void)_purgeAllBuffers
{
  if (result)
  {
    v1 = result;
    result = objc_msgSend((id)objc_msgSend(result, "inputs"), "count");
    if (result)
    {
      for (unint64_t i = 0; i < (unint64_t)result; ++i)
      {
        while (1)
        {
          uint64_t v3 = CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(v1[17] + 40 * i + 8));
          if (!v3) {
            break;
          }
          CFRelease(v3);
        }
        result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
      }
    }
  }
  return result;
}

- (id)nodeType
{
  return @"Muxer";
}

- (id)nodeSubType
{
  return @"MetadataSynchronizer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v7 = [(BWNode *)self outputs];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v13)
        {
          v14 = (void *)v13;
          if ([v12 passthroughMode])
          {
            uint64_t v15 = (BWNodeOutputMediaProperties *)[v12 mediaPropertiesForAttachedMediaKey:v14];
            int v16 = [v14 isEqualToString:@"PrimaryFormat"];
            if (v15)
            {
              if ((v16 & 1) == 0)
              {
                uint64_t v17 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v12, v14, a5];
                goto LABEL_18;
              }
            }
            else
            {
              if (v16)
              {
                uint64_t v17 = [NSString stringWithFormat:@"%@ output %@ has no media properties for the primary format (provided media key is %@)", self, v12, a5, v18];
LABEL_18:
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0]);
              }
              uint64_t v15 = objc_alloc_init(BWNodeOutputMediaProperties);
              [v12 _setMediaProperties:v15 forAttachedMediaKey:v14];
            }
            [(BWNodeOutputMediaProperties *)v15 setResolvedFormat:a3];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (!objc_msgSend(a5, "index", a3, a4))
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    if (![(BWNodeOutput *)self->super._output liveFormat]) {
      [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
    }
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unsigned int v4 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == v4)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    -[BWMetadataSynchronizerNode _tryToEmitImageBufferWithAllMetadata:]((id *)&self->super.super.isa, 0);
    -[BWMetadataSynchronizerNode _purgeAllBuffers](self);
    [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    self->_numEODMessagesReceived = 0;
  }
}

- (id)_tryToEmitImageBufferWithAllMetadata:(id *)result
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  unsigned int v4 = (opaqueCMSimpleQueue *)*((void *)result[17] + 1);
  result = (id *)CMSimpleQueueGetHead(v4);
  if (!result) {
    return result;
  }
  unint64_t v5 = result;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v3, "inputs"), "count"));
  memset(&v75, 0, sizeof(v75));
  target = v5;
  msn_getOriginalPTSForSampleBuffer(v5, (uint64_t)&v75);
  if (CMGetAttachment(v4, @"IsHarvestedStillFrame", 0)) {
    goto LABEL_60;
  }
  objc_super v7 = (const __CFString **)MEMORY[0x1E4F53070];
  if (v3[12])
  {
    if (!objc_msgSend(v3[12], "containsObject:", objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])))goto LABEL_60; {
  }
    }
  unint64_t v8 = 1;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v3, "inputs"), "count") >= 2)
  {
    uint64_t v9 = 48;
    do
    {
      Head = (void *)CMSimpleQueueGetHead(*(CMSimpleQueueRef *)((char *)v3[17] + v9));
      memset(v78, 0, 24);
      msn_getOriginalPTSForSampleBuffer(Head, (uint64_t)v78);
      CMTime time1 = v78[0];
      CMTime time2 = v75;
      if (CMTimeCompare(&time1, &time2))
      {
        if (a2) {
          break;
        }
      }
      else
      {
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v8));
      }
      ++v8;
      v9 += 40;
    }
    while (objc_msgSend((id)objc_msgSend(v3, "inputs"), "count") > v8);
  }
  result = (id *)objc_msgSend((id)objc_msgSend(v3, "inputs"), "count");
  if (result == (id *)v8)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v54 = [v6 countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v54)
    {
      CFStringRef key = *v7;
      uint64_t v51 = *(void *)v71;
      v52 = v6;
      v53 = v3;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v71 != v51) {
            objc_enumerationMutation(v6);
          }
          uint64_t v55 = v11;
          v12 = *(void **)(*((void *)&v70 + 1) + 8 * v11);
          uint64_t v13 = CMSimpleQueueGetHead(*((CMSimpleQueueRef *)v3[17]
                                     + 5 * (int)objc_msgSend(v12, "intValue", p_time1, v49)
                                     + 1));
          uint64_t v14 = objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "count");
          uint64_t v15 = v3[17];
          int v16 = (void *)v15[5 * (int)[v12 intValue]];
          uint64_t v17 = target;
          if (v14 == 1)
          {
            BWSampleBufferSetAttachedMedia(target, [v16 objectAtIndexedSubscript:0], (uint64_t)v13);
          }
          else if ([v16 count])
          {
            unint64_t v18 = 0;
            do
            {
              uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(v13, objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "objectAtIndexedSubscript:", v18));
              if (AttachedMedia) {
                BWSampleBufferSetAttachedMedia(target, objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "objectAtIndexedSubscript:", v18), AttachedMedia);
              }
              ++v18;
            }
            while (objc_msgSend(*((id *)v3[17] + 5 * (int)objc_msgSend(v12, "intValue")), "count") > v18);
          }
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v20 = v3[13];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v79 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v67 != v23) {
                  objc_enumerationMutation(v20);
                }
                CFStringRef v25 = *(const __CFString **)(*((void *)&v66 + 1) + 8 * i);
                CFTypeRef v26 = CMGetAttachment(v13, v25, 0);
                if (v26)
                {
                  uint64_t v27 = v26;
                  if (CMGetAttachment(v17, v25, 0))
                  {
                    LODWORD(time2.value) = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int value = time2.value;
                    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
                      unsigned int v30 = value;
                    }
                    else {
                      unsigned int v30 = value & 0xFFFFFFFE;
                    }
                    if (v30)
                    {
                      LODWORD(time1.value) = 136315394;
                      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)"-[BWMetadataSynchronizerNode _tryToEmitI"
                                                                                "mageBufferWithAllMetadata:]";
                      LOWORD(time1.flags) = 2112;
                      *(void *)((char *)&time1.flags + 2) = v25;
                      LODWORD(v49) = 22;
                      p_CMTime time1 = &time1;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    uint64_t v17 = target;
                  }
                  else
                  {
                    CMSetAttachment(v17, v25, v27, 1u);
                  }
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v66 objects:v79 count:16];
            }
            while (v22);
          }
          v31 = (void *)CMGetAttachment(v17, key, 0);
          v32 = (void *)CMGetAttachment(v13, key, 0);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v33 = v3[14];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v61 objects:v77 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v62;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v62 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void *)(*((void *)&v61 + 1) + 8 * j);
                uint64_t v39 = objc_msgSend(v32, "objectForKeyedSubscript:", v38, p_time1, v49);
                if (v32)
                {
                  uint64_t v40 = v39;
                  if ([v31 objectForKeyedSubscript:v38])
                  {
                    LODWORD(time2.value) = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v42 = time2.value;
                    if (os_log_type_enabled(v41, type)) {
                      unsigned int v43 = v42;
                    }
                    else {
                      unsigned int v43 = v42 & 0xFFFFFFFE;
                    }
                    if (v43)
                    {
                      LODWORD(time1.value) = 136315394;
                      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)"-[BWMetadataSynchronizerNode _tryToEmitI"
                                                                                "mageBufferWithAllMetadata:]";
                      LOWORD(time1.flags) = 2112;
                      *(void *)((char *)&time1.flags + 2) = v38;
                      LODWORD(v49) = 22;
                      p_CMTime time1 = &time1;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  else
                  {
                    [v31 setObject:v40 forKeyedSubscript:v38];
                  }
                }
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v61 objects:v77 count:16];
            }
            while (v35);
          }
          uint64_t v11 = v55 + 1;
          uint64_t v6 = v52;
          uint64_t v3 = v53;
        }
        while (v55 + 1 != v54);
        uint64_t v54 = [v52 countByEnumeratingWithState:&v70 objects:v80 count:16];
      }
      while (v54);
    }
LABEL_60:
    objc_msgSend(v6, "addObject:", &unk_1EFAFE160, p_time1, v49);
    [v3[2] emitSampleBuffer:target];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    result = (id *)[v6 countByEnumeratingWithState:&v57 objects:v76 count:16];
    if (result)
    {
      v44 = result;
      uint64_t v45 = *(void *)v58;
      do
      {
        v46 = 0;
        do
        {
          if (*(void *)v58 != v45) {
            objc_enumerationMutation(v6);
          }
          v47 = CMSimpleQueueDequeue(*((CMSimpleQueueRef *)v3[17]
                                     + 5
                                     * (int)[*(id *)(*((void *)&v57 + 1) + 8 * (void)v46) intValue]
                                     + 1));
          if (v47) {
            CFRelease(v47);
          }
          v46 = (id *)((char *)v46 + 1);
        }
        while (v44 != v46);
        result = (id *)[v6 countByEnumeratingWithState:&v57 objects:v76 count:16];
        v44 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!BWSampleBufferIsMarkerBuffer(a3))
  {
    unint64_t v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if ([a4 index])
    {
      syncMetadataForPortTypes = self->_syncMetadataForPortTypes;
      if (syncMetadataForPortTypes)
      {
        if (![(NSArray *)syncMetadataForPortTypes containsObject:v9]) {
          return;
        }
      }
    }
    if (![a4 index])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      syncOnlyIfMetadataEnabledForKeys = self->_syncOnlyIfMetadataEnabledForKeys;
      uint64_t v22 = [(NSArray *)syncOnlyIfMetadataEnabledForKeys countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(syncOnlyIfMetadataEnabledForKeys);
            }
            if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * i)), "BOOLValue") & 1) == 0)
            {
              [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
              return;
            }
          }
          uint64_t v23 = [(NSArray *)syncOnlyIfMetadataEnabledForKeys countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
    }
    os_unfair_lock_lock(&self->_bufferServicingLock);
    memset(&v31, 0, sizeof(v31));
    double OriginalPTSForSampleBuffer = msn_getOriginalPTSForSampleBuffer(a3, (uint64_t)&v31);
    inputsStorage = self->_inputsStorage;
    CMTime var2 = (CMTime)inputsStorage[objc_msgSend(a4, "index", OriginalPTSForSampleBuffer)].var2;
    CMTime time1 = v31;
    CMTime time2 = var2;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      unint64_t v26 = -1;
      do
        ++v26;
      while (objc_msgSend(self->_inputsStorage[objc_msgSend(a4, "index")].var0, "count") > v26);
LABEL_38:
      os_unfair_lock_unlock(&self->_bufferServicingLock);
      return;
    }
    uint64_t v13 = self->_inputsStorage;
    uint64_t v14 = &v13[[a4 index]];
    v14->CMTime var2 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v31;
    uint64_t v15 = self->_inputsStorage;
    var1 = v15[[a4 index]].var1;
    int32_t Count = CMSimpleQueueGetCount(var1);
    if (Count == CMSimpleQueueGetCapacity(var1))
    {
      if (![a4 index])
      {
        unint64_t v27 = -1;
        do
          ++v27;
        while (objc_msgSend(self->_inputsStorage[objc_msgSend(a4, "index")].var0, "count") > v27);
        -[BWMetadataSynchronizerNode _tryToEmitImageBufferWithAllMetadata:]((id *)&self->super.super.isa, 0);
        if (a3) {
          goto LABEL_18;
        }
        goto LABEL_35;
      }
      unint64_t v18 = CMSimpleQueueDequeue(var1);
      unint64_t v19 = -1;
      do
        ++v19;
      while (objc_msgSend(self->_inputsStorage[objc_msgSend(a4, "index")].var0, "count") > v19);
      if (v18) {
        CFRelease(v18);
      }
      -[BWMetadataSynchronizerNode _printState]((unint64_t)self);
    }
    if (a3)
    {
LABEL_18:
      CFTypeRef v20 = CFRetain(a3);
      goto LABEL_36;
    }
LABEL_35:
    CFTypeRef v20 = 0;
LABEL_36:
    if (CMSimpleQueueEnqueue(var1, v20))
    {
      FigDebugAssert3();
      if (a3) {
        CFRelease(a3);
      }
    }
    else
    {
      -[BWMetadataSynchronizerNode _purgeAllPurgeableMetadataBuffers](self);
      -[BWMetadataSynchronizerNode _tryToEmitImageBufferWithAllMetadata:]((id *)&self->super.super.isa, 1);
    }
    goto LABEL_38;
  }
  output = self->super._output;
  [(BWNodeOutput *)output emitSampleBuffer:a3];
}

- (unint64_t)_printState
{
  if (result)
  {
    v1 = (void *)result;
    v2 = (void *)[MEMORY[0x1E4F28E78] string];
    result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
    if (result)
    {
      unint64_t v3 = 0;
      CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v4 = *MEMORY[0x1E4F54128];
      uint64_t v5 = 8;
      do
      {
        Head = (void *)CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(v1[17] + v5));
        uint64_t Count = CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(v1[17] + v5));
        uint64_t Capacity = CMSimpleQueueGetCapacity(*(CMSimpleQueueRef *)(v1[17] + v5));
        objc_msgSend(v2, "appendFormat:", @" [%d] = {", v3);
        if (Head)
        {
          uint64_t v9 = (void *)CMGetAttachment(Head, key, 0);
          msn_getOriginalPTSForSampleBuffer(Head, (uint64_t)&time);
          [v2 appendFormat:@" %d/%d head: PTS %.4lf %@", Count, Capacity, CMTimeGetSeconds(&time), objc_msgSend(v9, "objectForKeyedSubscript:", v4)];
        }
        [v2 appendFormat:@"}"];
        ++v3;
        result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
        v5 += 40;
      }
      while (result > v3);
    }
  }
  return result;
}

- (void)_purgeAllPurgeableMetadataBuffers
{
  if (result)
  {
    v1 = result;
    result = CMSimpleQueueGetHead(*(CMSimpleQueueRef *)(result[17] + 8));
    if (result)
    {
      memset(&v11, 0, sizeof(v11));
      result = objc_msgSend((id)objc_msgSend(v1, "inputs", msn_getOriginalPTSForSampleBuffer(result, (uint64_t)&v11)), "count");
      if ((unint64_t)result >= 2)
      {
        char v2 = 0;
        for (unint64_t i = 1; i < (unint64_t)result; ++i)
        {
          uint64_t v4 = *(opaqueCMSimpleQueue **)(v1[17] + 40 * i + 8);
          for (uint64_t j = (void *)CMSimpleQueueGetHead(v4); j; v2 = 1)
          {
            memset(&v10, 0, sizeof(v10));
            msn_getOriginalPTSForSampleBuffer(j, (uint64_t)&v10);
            CMTime time1 = v10;
            CMTime v8 = v11;
            if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0) {
              break;
            }
            unint64_t v6 = -1;
            do
              ++v6;
            while ([*(id *)(v1[17] + 40 * i) count] > v6);
            objc_super v7 = CMSimpleQueueDequeue(v4);
            if (v7) {
              CFRelease(v7);
            }
            uint64_t j = (void *)CMSimpleQueueGetHead(v4);
          }
          result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
        }
        if (v2) {
          return (void *)-[BWMetadataSynchronizerNode _printState]((unint64_t)v1);
        }
      }
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output emitNodeError:a3];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (![a4 index])
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output emitDroppedSample:a3];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

@end
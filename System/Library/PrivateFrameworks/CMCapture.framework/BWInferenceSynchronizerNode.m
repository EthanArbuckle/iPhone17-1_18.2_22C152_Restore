@interface BWInferenceSynchronizerNode
+ (void)initialize;
- (BOOL)allowOutOfOrderInputs;
- (BOOL)synchronizesTopLevelAttachments;
- (BWInferenceSynchronizerNode)init;
- (BWInferenceSynchronizerNode)initWithIndexOfInputProvidingOutputSampleBuffer:(int)a3 indexOfInputProvidingPreferredInferences:(int)a4 errorHandlingModel:(unsigned __int16)a5;
- (BWNodeInput)inputProvidingOnlyInferences;
- (BWNodeInput)inputProvidingOutputSampleBuffer;
- (BWNodeInput)inputProvidingPreferredInferences;
- (NSSet)attachedMediaKeysToSkip;
- (id)nodeSubType;
- (id)nodeType;
- (id)synchronizeInferencesResolver;
- (uint64_t)_synchronizedBufferFromQueue:(int)a3 withIdentifier:(uint64_t)a4 andPortType:;
- (unsigned)errorHandlingModel;
- (void)_attemptBufferOrErrorEmission;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAllowOutOfOrderInputs:(BOOL)a3;
- (void)setAttachedMediaKeysToSkip:(id)a3;
- (void)setSynchronizeInferencesResolver:(id)a3;
- (void)setSynchronizesTopLevelAttachments:(BOOL)a3;
@end

@implementation BWInferenceSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v8 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a5, a4);
  if (!v8)
  {
    v8 = objc_alloc_init(BWNodeOutputMediaProperties);
    [(BWNodeOutput *)self->super._output _setMediaProperties:v8 forAttachedMediaKey:a5];
  }
  [(BWNodeOutputMediaProperties *)v8 setResolvedFormat:a3];
}

- (id)nodeType
{
  return @"Muxer";
}

- (void)setSynchronizeInferencesResolver:(id)a3
{
}

- (void)setSynchronizesTopLevelAttachments:(BOOL)a3
{
  self->_synchronizesTopLevelAttachments = a3;
}

- (BWInferenceSynchronizerNode)initWithIndexOfInputProvidingOutputSampleBuffer:(int)a3 indexOfInputProvidingPreferredInferences:(int)a4 errorHandlingModel:(unsigned __int16)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)BWInferenceSynchronizerNode;
  v8 = [(BWNode *)&v20 init];
  if (v8)
  {
    v8->_mostRecentEmittedCaptureIdentifierByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_indexOfInputProvidingOutputSampleBuffer = a3;
    v8->_indexOfInputProvidingOnlyInferences = a3 == 0;
    v8->_indexOfInputProvidingPreferredInferences = a4;
    v8->_errorHandlingModel = a5;
    char v9 = 1;
    [(BWNode *)v8 setSupportsConcurrentLiveInputCallbacks:1];
    v8->_bufferServicingLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = 0;
    v8->_maximumNumberOfInflightBuffers = FigGetCFPreferenceNumberWithDefault();
    do
    {
      char v11 = v9;
      v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v8 index:v10];
      v13 = [(BWNodeInput *)v12 primaryMediaConfiguration];
      [(BWNodeInputMediaConfiguration *)v13 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v13 setPassthroughMode:v10 == v8->_indexOfInputProvidingOutputSampleBuffer];
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v14 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v14 setPassthroughMode:1];
      [(BWNodeInput *)v12 setUnspecifiedAttachedMediaConfiguration:v14];
      v15 = &v8->_contexts[v10];
      v15->bufferQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v15->mostRecentCaptureIdentifierByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v15->numberOfWraparoundsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(BWNode *)v8 addInput:v12];
      char v9 = 0;
      uint64_t v10 = 1;
    }
    while ((v11 & 1) != 0);
    v16 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v8];
    v17 = [(BWNodeOutput *)v16 primaryMediaConfiguration];
    [(BWNodeOutputMediaConfiguration *)v17 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v17 setPassthroughMode:1];
    v22[0] = [NSNumber numberWithInt:v8->_indexOfInputProvidingOutputSampleBuffer];
    v22[1] = [NSNumber numberWithInt:v8->_indexOfInputProvidingOnlyInferences];
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v17, "setIndexesOfInputsWhichDrivesThisOutput:", [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2]);
    v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v18 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v18 setPassthroughMode:1];
    v21[0] = [NSNumber numberWithInt:v8->_indexOfInputProvidingOutputSampleBuffer];
    v21[1] = [NSNumber numberWithInt:v8->_indexOfInputProvidingOnlyInferences];
    -[BWNodeOutputMediaConfiguration setIndexesOfInputsWhichDrivesThisOutput:](v18, "setIndexesOfInputsWhichDrivesThisOutput:", [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2]);
    [(BWNodeOutputMediaConfiguration *)v18 setAttachedMediaKeyOfInputWhichDrivesThisOutput:@"PrimaryFormat"];
    [(BWNode *)v8 addOutput:v16];
  }
  return v8;
}

- (void)setAttachedMediaKeysToSkip:(id)a3
{
}

- (void)setAllowOutOfOrderInputs:(BOOL)a3
{
  self->_allowOutOfOrderInputs = a3;
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

- (BWInferenceSynchronizerNode)init
{
  return [(BWInferenceSynchronizerNode *)self initWithIndexOfInputProvidingOutputSampleBuffer:0 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
}

- (void)dealloc
{
  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    v6 = &self->_contexts[v3];

    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceSynchronizerNode;
  [(BWNode *)&v7 dealloc];
}

- (BWNodeInput)inputProvidingOutputSampleBuffer
{
  uint64_t v3 = [(BWNode *)self inputs];
  uint64_t indexOfInputProvidingOutputSampleBuffer = self->_indexOfInputProvidingOutputSampleBuffer;
  return (BWNodeInput *)[(NSArray *)v3 objectAtIndexedSubscript:indexOfInputProvidingOutputSampleBuffer];
}

- (BWNodeInput)inputProvidingPreferredInferences
{
  uint64_t v3 = [(BWNode *)self inputs];
  uint64_t indexOfInputProvidingPreferredInferences = self->_indexOfInputProvidingPreferredInferences;
  return (BWNodeInput *)[(NSArray *)v3 objectAtIndexedSubscript:indexOfInputProvidingPreferredInferences];
}

- (BWNodeInput)inputProvidingOnlyInferences
{
  uint64_t v3 = [(BWNode *)self inputs];
  uint64_t indexOfInputProvidingOnlyInferences = self->_indexOfInputProvidingOnlyInferences;
  return (BWNodeInput *)[(NSArray *)v3 objectAtIndexedSubscript:indexOfInputProvidingOnlyInferences];
}

- (id)nodeSubType
{
  return @"InferenceSynchronizer";
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  uint64_t v8 = [a5 index];
  uint64_t v9 = 0;
  char v10 = 1;
  self->_contexts[v8].inputIsLive = 1;
  while (self->_contexts[v9].inputIsLive)
  {
    char v11 = v10;
    char v10 = 0;
    uint64_t v9 = 1;
    if ((v11 & 1) == 0)
    {
      [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
      break;
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  uint64_t v6 = [a3 index];
  uint64_t v7 = 0;
  self->_contexts[v6].inputIsLive = 0;
  char v8 = 1;
  while (!self->_contexts[v7].inputIsLive)
  {
    char v9 = v8;
    char v8 = 0;
    uint64_t v7 = 1;
    if ((v9 & 1) == 0)
    {
      [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
      break;
    }
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  synchronizeInferencesResolver = (uint64_t (**)(id, opaqueCMSampleBuffer *))self->_synchronizeInferencesResolver;
  if (synchronizeInferencesResolver && (synchronizeInferencesResolver[2](synchronizeInferencesResolver, a3) & 1) == 0)
  {
    if (dword_1EB4C55F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(a4, "index", v16, v17) == self->_indexOfInputProvidingOutputSampleBuffer) {
      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    }
  }
  else
  {
    char v8 = &self->_contexts[[a4 index]];
    char v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
    uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    os_unfair_lock_lock(&self->_bufferServicingLock);
    LODWORD(v12) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v8->numberOfWraparoundsByPortType, "objectForKeyedSubscript:", v11), "intValue");
    int v13 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v8->mostRecentCaptureIdentifierByPortType, "objectForKeyedSubscript:", v11), "intValue");
    if (!self->_allowOutOfOrderInputs && (int)v10 < v13) {
      uint64_t v12 = (v12 + 1);
    }
    else {
      uint64_t v12 = v12;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->numberOfWraparoundsByPortType, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v12], v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->mostRecentCaptureIdentifierByPortType, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v10], v11);
    CMSetAttachment(a3, @"ExtendedCaptureID", (CFTypeRef)[NSNumber numberWithInt:v10 | (v12 << 12)], 0);
    [(NSMutableArray *)v8->bufferQueue addObject:a3];
    -[BWInferenceSynchronizerNode _attemptBufferOrErrorEmission](self);
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)_attemptBufferOrErrorEmission
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = (uint64_t)a1;
    uint64_t v2 = [a1 output];
    uint64_t v3 = v1 + 120 + 40 * *(int *)(v1 + 104);
    id v4 = *(id *)v3;
    v76 = (id *)(v3 + 8);
    uint64_t v77 = *(void *)(v3 + 8);
    int v5 = *(_DWORD *)(v1 + 108);
    uint64_t v6 = (void **)(v1 + 120 + 40 * v5);
    v85 = (void *)v2;
    v86 = *v6;
    uint64_t v7 = v6[1];
    v75 = v6 + 1;
    if ([*(id *)v3 count])
    {
      char v87 = 0;
      uint64_t v83 = *MEMORY[0x1E4F54128];
      CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
      BOOL v78 = v7 != 0;
      uint64_t v8 = v1 + 120 + 40 * v5;
      v81 = (id *)(v8 + 24);
      v80 = (id *)(v8 + 16);
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      char v9 = v86;
      v91 = v7;
      id v88 = v4;
      uint64_t v82 = v1;
      do
      {
        uint64_t v10 = (const void *)[v4 firstObject];
        uint64_t v11 = (void *)CMGetAttachment(v10, key, 0);
        unsigned int v12 = objc_msgSend((id)CMGetAttachment(v10, @"ExtendedCaptureID", 0), "intValue");
        uint64_t v13 = [v11 objectForKeyedSubscript:v83];
        uint64_t v14 = [v4 count];
        unint64_t v94 = *(unsigned __int8 *)(v1 + 204);
        unint64_t v95 = v14;
        uint64_t v15 = -[BWInferenceSynchronizerNode _synchronizedBufferFromQueue:withIdentifier:andPortType:](v1, v9, v12, v13);
        uint64_t v96 = v15;
        uint64_t v92 = v13;
        unsigned int v93 = v12;
        if (v15)
        {
          int v16 = *(_DWORD *)(v1 + 104);
          int v17 = *(_DWORD *)(v1 + 112);
          if (v16 == v17) {
            uint64_t v18 = v10;
          }
          else {
            uint64_t v18 = (const void *)v15;
          }
          if (v16 == v17) {
            v19 = (const void *)v15;
          }
          else {
            v19 = v10;
          }
          int v89 = [(id)v1 synchronizesTopLevelAttachments];
          objc_super v20 = *(void **)(v1 + 216);
          CFTypeRef v21 = CMGetAttachment(v18, @"Inferences", 0);
          v22 = (const void *)MEMORY[0x1E4F1CC08];
          if (v21) {
            CFTypeRef v23 = v21;
          }
          else {
            CFTypeRef v23 = (CFTypeRef)MEMORY[0x1E4F1CC08];
          }
          CFTypeRef v24 = CMGetAttachment(v19, @"Inferences", 0);
          if (v24) {
            CFTypeRef v25 = v24;
          }
          else {
            CFTypeRef v25 = v22;
          }
          v26 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v25];
          [v26 addEntriesFromDictionary:v23];
          CMSetAttachment(v10, @"Inferences", v26, 1u);
          id v27 = BWSampleBufferCopyDictionaryOfAttachedMedia(v18);
          if (v27) {
            id v28 = v27;
          }
          else {
            id v28 = (id)v22;
          }
          id v29 = BWSampleBufferCopyDictionaryOfAttachedMedia(v19);
          if (v29) {
            id v30 = v29;
          }
          else {
            id v30 = (id)v22;
          }
          v31 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v30];
          [v31 addEntriesFromDictionary:v28];
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v102 objects:v122 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v103;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v103 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void *)(*((void *)&v102 + 1) + 8 * i);
                if (([v20 containsObject:v36] & 1) == 0) {
                  BWSampleBufferSetAttachedMedia(v10, v36, [v31 objectForKeyedSubscript:v36]);
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v102 objects:v122 count:16];
            }
            while (v33);
          }
          if (v10 != v18) {
            BWSampleBufferRemoveAllAttachedMedia(v18);
          }
          uint64_t v1 = v82;
          uint64_t v7 = v91;
          uint64_t v37 = v96;
          if (v10 != v19) {
            BWSampleBufferRemoveAllAttachedMedia(v19);
          }
          if (v89)
          {
            CFDictionaryRef v38 = CMCopyDictionaryOfAttachments(allocator, v18, 1u);
            CFDictionaryRef v39 = CMCopyDictionaryOfAttachments(allocator, v19, 1u);
            CFDictionaryRef v40 = v39;
            if (v10 == v18) {
              CFDictionaryRef v41 = v38;
            }
            else {
              CFDictionaryRef v41 = v39;
            }
            CFDictionaryRef v90 = v38;
            uint64_t v42 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[__CFDictionary allKeys](v38, "allKeys"));
            uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[__CFDictionary allKeys](v40, "allKeys"));
            uint64_t v44 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[__CFDictionary allKeys](v41, "allKeys"));
            v45 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v42];
            [v45 unionSet:v43];
            [v45 minusSet:v44];
            long long v100 = 0u;
            long long v101 = 0u;
            *(_OWORD *)type = 0u;
            long long v99 = 0u;
            uint64_t v46 = [v45 countByEnumeratingWithState:type objects:&v106 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v99;
              do
              {
                for (uint64_t j = 0; j != v47; ++j)
                {
                  if (*(void *)v99 != v48) {
                    objc_enumerationMutation(v45);
                  }
                  v50 = *(__CFString **)(*(void *)&type[8] + 8 * j);
                  if (([(__CFString *)v50 isEqualToString:@"NonProcessedReferenceFrame"] & 1) == 0)
                  {
                    CFTypeRef v51 = CMGetAttachment(v18, v50, 0);
                    if (!v51) {
                      CFTypeRef v51 = CMGetAttachment(v19, v50, 0);
                    }
                    CMSetAttachment(v10, v50, v51, 1u);
                  }
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:type objects:&v106 count:16];
              }
              while (v47);
            }

            uint64_t v1 = v82;
            uint64_t v37 = v96;
            uint64_t v7 = v91;
          }
          BOOL v52 = 0;
          char v9 = v86;
          id v4 = v88;
        }
        else
        {
          int v53 = objc_msgSend((id)objc_msgSend(*v81, "objectForKeyedSubscript:", v13), "intValue");
          unsigned int v54 = objc_msgSend((id)objc_msgSend(*v80, "objectForKeyedSubscript:", v13), "intValue") | (v53 << 12);
          uint64_t v37 = 0;
          BOOL v52 = v54 > v12;
        }
        if (v95 < v94 && v7 == 0 && v37 == 0 && !v52) {
          break;
        }
        if (*(_WORD *)(v1 + 206)) {
          BOOL v58 = 1;
        }
        else {
          BOOL v58 = dword_1EB4C55F0 == 0;
        }
        if (!v58)
        {
          LODWORD(v102) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v60 = v102;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type[0])) {
            unsigned int v61 = v60;
          }
          else {
            unsigned int v61 = v60 & 0xFFFFFFFE;
          }
          if (v61)
          {
            uint64_t v62 = [(id)v1 name];
            uint64_t v63 = BWStillImageCaptureIDForSampleBuffer(v10);
            int v106 = 136316931;
            v107 = "-[BWInferenceSynchronizerNode _attemptBufferOrErrorEmission]";
            __int16 v108 = 2113;
            uint64_t v109 = v62;
            __int16 v110 = 2050;
            uint64_t v111 = v63;
            __int16 v112 = 1026;
            unsigned int v113 = v93;
            __int16 v114 = 1026;
            BOOL v115 = v95 >= v94;
            uint64_t v7 = v91;
            __int16 v116 = 1026;
            BOOL v117 = v78;
            __int16 v118 = 1026;
            BOOL v119 = v52;
            __int16 v120 = 1026;
            BOOL v121 = v96 != 0;
            char v9 = v86;
            LODWORD(v74) = 62;
            v73 = &v106;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          id v4 = v88;
          uint64_t v37 = v96;
        }
        CMRemoveAttachment(v10, @"ExtendedCaptureID");
        [v85 emitSampleBuffer:v10];
        [v4 removeObject:v10];
        if (v37) {
          [v9 removeObject:v37];
        }
        objc_msgSend(*(id *)(v1 + 96), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v93, v73, v74), v92);
        char v87 = 1;
      }
      while ([v4 count]);
    }
    else
    {
      char v87 = 0;
      char v9 = v86;
    }
    if (v77)
    {
      if ([v9 count]) {
        BOOL v64 = 0;
      }
      else {
        BOOL v64 = v7 == 0;
      }
      char v65 = v87;
      if (!v64)
      {
        [v85 emitNodeError:v77];
        v97[0] = MEMORY[0x1E4F143A8];
        v97[1] = 3221225472;
        v97[2] = __60__BWInferenceSynchronizerNode__attemptBufferOrErrorEmission__block_invoke;
        v97[3] = &unk_1E5C264F0;
        v97[4] = v77;
        v97[5] = v7;
        v66 = (void *)[v9 indexesOfObjectsPassingTest:v97];
        if ([v66 count]) {
          [v9 removeObjectsAtIndexes:v66];
        }
        char v65 = 1;
      }
    }
    else
    {
      char v65 = v87;
    }
    if ([v9 count])
    {
      CFStringRef v67 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v68 = *MEMORY[0x1E4F54128];
      do
      {
        v69 = (const void *)[v9 firstObject];
        int v70 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", objc_msgSend((id)CMGetAttachment(v69, v67, 0), "objectForKeyedSubscript:", v68)), "intValue");
        int v71 = objc_msgSend((id)CMGetAttachment(v69, @"ExtendedCaptureID", 0), "intValue");
        if (*(unsigned char *)(v1 + 224)) {
          BOOL v72 = 0;
        }
        else {
          BOOL v72 = v71 <= v70;
        }
        if (!v72) {
          break;
        }
        [v9 removeObject:v69];
      }
      while ([v9 count]);
    }
    if (v65)
    {

      id *v76 = 0;
      id *v75 = 0;
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v7 = [(BWNode *)self output];
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  int v9 = [(BWInferenceSynchronizerNode *)self errorHandlingModel];
  if (v9 == 1) {
    goto LABEL_9;
  }
  if (v9) {
    goto LABEL_10;
  }
  if ([a3 errorCode] == -16800
    || [a3 errorCode] == -16802
    || [a3 errorCode] == -16806)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "captureSettings"), "captureType") != 11|| objc_msgSend(a4, "index") == self->_indexOfInputProvidingOutputSampleBuffer)
    {
      contexts = self->_contexts;
      [(NSMutableArray *)contexts->bufferQueue removeAllObjects];

      contexts->mostRecentError = 0;
      [(NSMutableArray *)contexts[1].bufferQueue removeAllObjects];

      contexts[1].mostRecentError = 0;
LABEL_9:
      [(BWNodeOutput *)v7 emitNodeError:a3];
    }
  }
  else
  {
    uint64_t v11 = [a4 index];
    uint64_t v12 = v11;
    uint64_t v13 = self->_contexts;
    if (v11 == self->_indexOfInputProvidingOutputSampleBuffer && v13[v11].mostRecentError) {
      -[BWNodeOutput emitNodeError:](v7, "emitNodeError:");
    }
    uint64_t v14 = &v13[v12];

    v14->mostRecentError = (BWNodeError *)a3;
    -[BWInferenceSynchronizerNode _attemptBufferOrErrorEmission](self);
  }
LABEL_10:
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if ([a4 index] == self->_indexOfInputProvidingOutputSampleBuffer)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)[(BWNode *)self output] emitDroppedSample:a3];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if ([a4 index] == self->_indexOfInputProvidingOutputSampleBuffer)
  {
    uint64_t v6 = [(BWNode *)self output];
    [(BWNodeOutput *)v6 emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:v4];
  }
}

- (uint64_t)_synchronizedBufferFromQueue:(int)a3 withIdentifier:(uint64_t)a4 andPortType:
{
  if (result)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__BWInferenceSynchronizerNode__synchronizedBufferFromQueue_withIdentifier_andPortType___block_invoke;
    v6[3] = &unk_1E5C264C8;
    int v7 = a3;
    v6[4] = a4;
    uint64_t v5 = [a2 indexOfObjectPassingTest:v6];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return [a2 objectAtIndexedSubscript:v5];
    }
  }
  return result;
}

uint64_t __87__BWInferenceSynchronizerNode__synchronizedBufferFromQueue_withIdentifier_andPortType___block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  if (objc_msgSend((id)CMGetAttachment(target, @"ExtendedCaptureID", 0), "intValue") != *(_DWORD *)(a1 + 40)) {
    return 0;
  }
  uint64_t v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  return [v5 isEqualToString:v6];
}

BOOL __60__BWInferenceSynchronizerNode__attemptBufferOrErrorEmission__block_invoke(uint64_t a1, CMAttachmentBearerRef target)
{
  uint64_t v3 = (void *)CMGetAttachment(target, @"BWStillImageCaptureSettings", 0);
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "stillImageSettings"), "captureSettings"), "settingsID");
  if (v4 == [v3 settingsID]) {
    return 1;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stillImageSettings"), "settingsID");
  return v6 == [v3 settingsID];
}

- (unsigned)errorHandlingModel
{
  return self->_errorHandlingModel;
}

- (BOOL)synchronizesTopLevelAttachments
{
  return self->_synchronizesTopLevelAttachments;
}

- (NSSet)attachedMediaKeysToSkip
{
  return self->_attachedMediaKeysToSkip;
}

- (BOOL)allowOutOfOrderInputs
{
  return self->_allowOutOfOrderInputs;
}

- (id)synchronizeInferencesResolver
{
  return self->_synchronizeInferencesResolver;
}

@end
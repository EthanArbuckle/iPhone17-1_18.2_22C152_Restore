@interface BWNodeConnection
+ (void)initialize;
- (BOOL)attach;
- (BOOL)deferredAttach;
- (BOOL)detach;
- (BOOL)resolveCommonBufferFormat;
- (BOOL)wantsMessageCachingWhileSuspended;
- (BWNodeConnection)initWithOutput:(id)a3 input:(id)a4 pipelineStage:(id)a5;
- (BWNodeInput)input;
- (BWNodeOutput)output;
- (BWPipelineStage)pipelineStage;
- (uint64_t)_resolveCommonVideoBufferFormatForAttachedMediaKey:(uint64_t)result;
- (void)attachNow;
- (void)connectBypassInput;
- (void)consumeMessage:(id)a3 fromOutput:(id)a4;
- (void)dealloc;
- (void)resumeForEventsOnly:(BOOL)a3;
- (void)setWantsMessageCachingWhileSuspended:(BOOL)a3;
- (void)suspendWithMessageCachingAllowed:(BOOL)a3 bypassed:(BOOL)a4;
@end

@implementation BWNodeConnection

- (BWNodeInput)input
{
  return self->_input;
}

- (uint64_t)_resolveCommonVideoBufferFormatForAttachedMediaKey:(uint64_t)result
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = a2;
    uint64_t v3 = result;
    v4 = (BWNodeOutputMediaProperties *)[*(id *)(result + 16) mediaPropertiesForAttachedMediaKey:a2];
    if (!v4)
    {
      if ([v2 isEqualToString:@"PrimaryFormat"])
      {
        uint64_t v33 = [NSString stringWithFormat:@"Output primary format has no requirements BWNodeOutput %p node: %@", *(void *)(v3 + 16), objc_msgSend(*(id *)(v3 + 16), "node"), v46, v47];
        goto LABEL_51;
      }
      v4 = objc_alloc_init(BWNodeOutputMediaProperties);
      [*(id *)(v3 + 16) _setMediaProperties:v4 forAttachedMediaKey:v2];
    }
    v5 = (BWNodeInputMediaProperties *)[*(id *)(v3 + 8) mediaPropertiesForAttachedMediaKey:v2];
    if (v5) {
      goto LABEL_8;
    }
    if (![v2 isEqualToString:@"PrimaryFormat"])
    {
      v5 = objc_alloc_init(BWNodeInputMediaProperties);
      [*(id *)(v3 + 8) _setMediaProperties:v5 forAttachedMediaKey:v2];
LABEL_8:
      if ([*(id *)(v3 + 16) _passthroughModeForAttachedMediaKey:v2])
      {
        uint64_t v6 = [(BWNodeOutputMediaProperties *)v4 resolvedFormat];
        if (v6)
        {
          uint64_t v7 = v6;
          v8 = v5;
LABEL_11:
          [(BWNodeInputMediaProperties *)v8 setResolvedFormat:v7];
          return 1;
        }
        uint64_t v33 = [NSString stringWithFormat:@"Passthrough outputs are supposed to have a non-nil format (since its the same as their upstream input's format).  BWNodeOutput %p node: %@ forAttachedMediaKey: %@", *(void *)(v3 + 16), objc_msgSend(*(id *)(v3 + 16), "node"), v2, v47];
        goto LABEL_51;
      }
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 16), "mediaConfigurationForAttachedMediaKey:", v2), "formatRequirements");
      if (!v9)
      {
        if ([v2 isEqualToString:@"PrimaryFormat"])
        {
          uint64_t v33 = [NSString stringWithFormat:@"Missing output requirements for the primary format.  BWNodeOutput %p node: %@", *(void *)(v3 + 16), objc_msgSend(*(id *)(v3 + 16), "node"), v46, v47];
          goto LABEL_51;
        }
        return 1;
      }
      v10 = (void *)v9;
      if ([*(id *)(v3 + 8) _passthroughModeForAttachedMediaKey:v2])
      {
        unint64_t v11 = 0x1E4F1C000uLL;
        while (1)
        {
          uint64_t v63 = 0;
          id v64 = 0;
          v12 = *(void **)(v3 + 8);
          self;
          v13 = (void *)[*(id *)(v11 + 2632) array];
          nc_addRequirementsForInputToMutableArray(v12, v2, v13, 0, &v64, &v63);
          v14 = (void *)[*(id *)(v11 + 2632) arrayWithObject:v10];
          [v14 addObjectsFromArray:v13];
          v15 = (void *)[v10 formatClass];
          uint64_t v16 = [v15 formatByResolvingRequirements:v14 printErrors:v64 == 0];
          if (v16)
          {
            uint64_t v40 = v16;
            goto LABEL_62;
          }
          id v17 = v64;
          if (!v64) {
            break;
          }
          uint64_t v18 = v63;
          v19 = (void *)[v64 node];
          v62 = v17;
          objc_msgSend((id)objc_msgSend(v17, "mediaConfigurationForAttachedMediaKey:", v18), "setPassthroughMode:", 0);
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          v56 = v19;
          id obj = (id)[v19 outputs];
          uint64_t v55 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
          if (v55)
          {
            uint64_t v54 = *(void *)v74;
            v51 = v4;
            uint64_t v52 = v3;
            v49 = v5;
            v50 = v2;
            v48 = v10;
            do
            {
              uint64_t v20 = 0;
              v21 = v62;
              do
              {
                if (*(void *)v74 != v54) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v57 = v20;
                v22 = *(void **)(*((void *)&v73 + 1) + 8 * v20);
                v23 = objc_msgSend(v22, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", v18, objc_msgSend(v21, "index"));
                if (v23) {
                  objc_msgSend((id)objc_msgSend(v22, "mediaConfigurationForAttachedMediaKey:", v23), "setPassthroughMode:", 0);
                }
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                id v58 = (id)[v56 inputs];
                uint64_t v60 = [v58 countByEnumeratingWithState:&v69 objects:v84 count:16];
                if (v60)
                {
                  uint64_t v59 = *(void *)v70;
                  do
                  {
                    uint64_t v24 = 0;
                    do
                    {
                      if (*(void *)v70 != v59) {
                        objc_enumerationMutation(v58);
                      }
                      uint64_t v61 = v24;
                      v25 = *(void **)(*((void *)&v69 + 1) + 8 * v24);
                      if (v25 != v21)
                      {
                        v26 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:@"PrimaryFormat"];
                        objc_msgSend(v26, "addObjectsFromArray:", objc_msgSend(v25, "specifiedAttachedMediaKeys"));
                        long long v67 = 0u;
                        long long v68 = 0u;
                        long long v65 = 0u;
                        long long v66 = 0u;
                        uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v83 count:16];
                        if (v27)
                        {
                          uint64_t v28 = v27;
                          uint64_t v29 = *(void *)v66;
                          do
                          {
                            for (uint64_t i = 0; i != v28; ++i)
                            {
                              if (*(void *)v66 != v29) {
                                objc_enumerationMutation(v26);
                              }
                              uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * i);
                              if ([v25 _passthroughModeForAttachedMediaKey:v18]
                                && objc_msgSend(v23, "isEqualToString:", objc_msgSend(v22, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", v31, objc_msgSend(v25, "index"))))
                              {
                                v32 = (void *)[v21 mediaConfigurationForAttachedMediaKey:v18];
                                if (([v32 conversionToPassthroughModeNeverAllowed] & 1) == 0)
                                {
                                  uint64_t v33 = [NSString stringWithFormat:@"Input %@[%@] is not marked as passthroughOptional while input %@[%@] is and both drive the same output", objc_msgSend(v62, "name"), v18, v25, v31];
                                  goto LABEL_51;
                                }
                                [v32 setPassthroughMode:0];
                                v21 = v62;
                              }
                            }
                            uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v83 count:16];
                          }
                          while (v28);
                        }
                      }
                      uint64_t v24 = v61 + 1;
                    }
                    while (v61 + 1 != v60);
                    uint64_t v60 = [v58 countByEnumeratingWithState:&v69 objects:v84 count:16];
                  }
                  while (v60);
                }
                uint64_t v20 = v57 + 1;
              }
              while (v57 + 1 != v55);
              v4 = v51;
              uint64_t v3 = v52;
              v5 = v49;
              v2 = v50;
              v10 = v48;
              unint64_t v11 = 0x1E4F1C000;
              uint64_t v55 = [obj countByEnumeratingWithState:&v73 objects:v85 count:16];
            }
            while (v55);
          }
        }
        v44 = *(void **)(v3 + 8);
        self;
        v45 = (void *)[*(id *)(v11 + 2632) array];
        nc_addRequirementsForInputToMutableArray(v44, v2, v45, 1, 0, 0);
        [v45 insertObject:v10 atIndex:0];
        [v45 insertObject:*(void *)(v3 + 16) atIndex:0];
        return 0;
      }
      uint64_t v37 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 8), "mediaConfigurationForAttachedMediaKey:", v2), "formatRequirements");
      if (v37)
      {
        uint64_t v38 = v37;
        v39 = (void *)[v10 formatClass];
        v82[0] = v10;
        v82[1] = v38;
        uint64_t v40 = objc_msgSend(v39, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v82, 2));
        if (!v40)
        {
          uint64_t v41 = *(void *)(v3 + 8);
          uint64_t v77 = *(void *)(v3 + 16);
          v78 = v10;
          uint64_t v79 = v41;
LABEL_59:
          uint64_t v80 = v38;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:4];
          return 0;
        }
      }
      else
      {
        if ([v2 isEqualToString:@"PrimaryFormat"])
        {
          v35 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v36 = *MEMORY[0x1E4F1C3B8];
          v34 = @"No primary input requirements";
LABEL_52:
          objc_exception_throw((id)[v35 exceptionWithName:v36 reason:v34 userInfo:0]);
        }
        v42 = (void *)[v10 formatClass];
        v81 = v10;
        uint64_t v40 = objc_msgSend(v42, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v81, 1));
        if (!v40)
        {
          uint64_t v43 = *(void *)(v3 + 8);
          uint64_t v77 = *(void *)(v3 + 16);
          v78 = v10;
          uint64_t v79 = v43;
          uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
          goto LABEL_59;
        }
      }
LABEL_62:
      [(BWNodeOutputMediaProperties *)v4 setResolvedFormat:v40];
      v8 = v5;
      uint64_t v7 = v40;
      goto LABEL_11;
    }
    uint64_t v33 = [NSString stringWithFormat:@"Input primary format has no requirements BWNodeInput %p node: %@", *(void *)(v3 + 8), objc_msgSend(*(id *)(v3 + 8), "node"), v46, v47];
LABEL_51:
    v34 = (__CFString *)v33;
    v35 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v36 = *MEMORY[0x1E4F1C3B8];
    goto LABEL_52;
  }
  return result;
}

- (BWPipelineStage)pipelineStage
{
  return self->_pipelineStage;
}

- (BOOL)resolveCommonBufferFormat
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v3 = [(BWNodeOutput *)self->_output mediaType];
  if (v3 <= 1885564003)
  {
    if (v3 != 1667326820 && v3 != 1835365473 && v3 != 1836016234) {
      goto LABEL_48;
    }
LABEL_10:
    if (![(BWNodeOutput *)self->_output format])
    {
      uint64_t v27 = [NSString stringWithFormat:@"No format for node output %@, this is required for outputs", self->_output];
LABEL_51:
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v27 userInfo:0]);
    }
    [(BWNodeInput *)self->_input setFormat:[(BWNodeOutput *)self->_output format]];
    goto LABEL_12;
  }
  if (v3 != 1885564004 && v3 != 1986618469)
  {
    if (v3 != 1936684398)
    {
LABEL_48:
      uint64_t v27 = [NSString stringWithFormat:@"Invalid mediatype for node output %@", self->_output];
      goto LABEL_51;
    }
    goto LABEL_10;
  }
  int v8 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, @"PrimaryFormat");
  uint64_t v9 = [(BWNodeOutput *)self->_output specifiedAttachedMediaKeys];
  if (v8)
  {
    v10 = v9;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v38;
LABEL_22:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        int v6 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, *(void **)(*((void *)&v37 + 1) + 8 * v14));
        if (!v6) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
          if (v12) {
            goto LABEL_22;
          }
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_28:
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v15 = [(BWNodeOutput *)self->_output resolvedAttachedMediaKeys];
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
LABEL_30:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
          if (![(NSArray *)v10 containsObject:v20])
          {
            int v6 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, v20);
            if (!v6) {
              break;
            }
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
            if (v17) {
              goto LABEL_30;
            }
            goto LABEL_37;
          }
        }
      }
      else
      {
LABEL_37:
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v21 = [(BWNodeInput *)self->_input specifiedAttachedMediaKeys];
        uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (!v22)
        {
LABEL_12:
          LOBYTE(v6) = 1;
          return v6;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v30;
LABEL_39:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v29 + 1) + 8 * v25);
          if (![(NSArray *)v10 containsObject:v26])
          {
            int v6 = -[BWNodeConnection _resolveCommonVideoBufferFormatForAttachedMediaKey:]((uint64_t)self, v26);
            if (!v6) {
              break;
            }
          }
          if (v23 == ++v25)
          {
            uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
            LOBYTE(v6) = 1;
            if (v23) {
              goto LABEL_39;
            }
            return v6;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BWNodeOutput)output
{
  return self->_output;
}

- (BOOL)attach
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(BWNodeOutput *)self->_output consumer])
  {
    uint64_t v17 = NSString;
    output = self->_output;
    input = (BWNodeInput *)[output consumer];
    v15 = @"output %@ already has a consumer %@";
LABEL_22:
    uint64_t v14 = v17;
LABEL_19:
    uint64_t v16 = objc_msgSend(v14, "stringWithFormat:", v15, output, input, pipelineStage, v21, v22);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0]);
  }
  if ([(BWNodeInput *)self->_input connection])
  {
    uint64_t v17 = NSString;
    output = self->_input;
    input = (BWNodeInput *)[output connection];
    v15 = @"input %@ already has a connection %@";
    goto LABEL_22;
  }
  [(BWNodeOutput *)self->_output setConsumer:self];
  [(BWNodeInput *)self->_input setConnection:self];
  if (self->_pipelineStage)
  {
    int v3 = [(BWNodeInput *)self->_input node];
    if (v3)
    {
      v4 = v3;
      if (![(BWNode *)v3 supportsConcurrentLiveInputCallbacks])
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v5 = [(BWNode *)v4 inputs];
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v24 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(BWNodeInput **)(*((void *)&v23 + 1) + 8 * i);
              if (v10 != self->_input)
              {
                uint64_t v11 = [*(id *)(*((void *)&v23 + 1) + 8 * i) connection];
                if (v11)
                {
                  uint64_t v12 = *(void *)(v11 + 32);
                  if (v12)
                  {
                    if (([*(id *)(v11 + 32) isEqual:self->_pipelineStage] & 1) == 0)
                    {
                      uint64_t v14 = NSString;
                      v21 = v10;
                      uint64_t v22 = v12;
                      input = self->_input;
                      pipelineStage = self->_pipelineStage;
                      output = self;
                      v15 = @"Attempting to attach connection '%@' to input '%@' with pipeline stage '%@' but node doesn't support concurrent input callbacks (node input '%@' has pipeline stage '%@')";
                      goto LABEL_19;
                    }
                  }
                }
              }
            }
            uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v7);
        }
      }
    }
  }
  return 1;
}

- (BWNodeConnection)initWithOutput:(id)a3 input:(id)a4 pipelineStage:(id)a5
{
  if (a3 && a4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BWNodeConnection;
    uint64_t v8 = [(BWNodeConnection *)&v11 init];
    uint64_t v9 = v8;
    if (v8)
    {
      v8->_input = (BWNodeInput *)a4;
      v8->_output = (BWNodeOutput *)a3;
      v8->_pipelineStage = (BWPipelineStage *)a5;
      v9->_suspensionLock._os_unfair_lock_opaque = 0;
      v9->_messagesToPropagate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (void)consumeMessage:(id)a3 fromOutput:(id)a4
{
  if (!a3) {
    return;
  }
  if (!self->_suspended) {
    goto LABEL_8;
  }
  os_unfair_lock_lock(&self->_suspensionLock);
  if (!self->_suspended)
  {
    os_unfair_lock_unlock(&self->_suspensionLock);
LABEL_8:
    if (self->_resumedForEventsOnly && *((_DWORD *)a3 + 2) != 1) {
      return;
    }
    pipelineStage = self->_pipelineStage;
    input = self->_input;
    if (pipelineStage) {
      goto LABEL_23;
    }
    uint64_t v8 = self->_input;
    -[BWNodeInput handleMessage:](v8, "handleMessage:", a3, input);
    return;
  }
  if (self->_bypassed)
  {
    if (*((_DWORD *)a3 + 3) == 3)
    {
      [(NSMutableArray *)self->_messagesToPropagate addObject:a3];
      os_unfair_lock_unlock(&self->_suspensionLock);
    }
    else
    {
      int v9 = *((_DWORD *)a3 + 2);
      os_unfair_lock_unlock(&self->_suspensionLock);
      if (v9 == 1) {
        return;
      }
    }
    pipelineStage = self->_bypassPipelineStage;
    input = self->_bypassInput;
LABEL_23:
    [(BWPipelineStage *)pipelineStage sendMessage:a3 toInput:input];
    return;
  }
  if (self->_messageCachingEnabled || *((_DWORD *)a3 + 3) == 3) {
    [(NSMutableArray *)self->_messagesToPropagate addObject:a3];
  }
  os_unfair_lock_unlock(&self->_suspensionLock);
}

id __40__BWNodeConnection_resumeForEventsOnly___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 52));
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  if (*(unsigned char *)(a1 + 40)) {
    id v2 = (id)objc_msgSend(v2, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", &__block_literal_global_91));
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 52));
  return v2;
}

- (void)setWantsMessageCachingWhileSuspended:(BOOL)a3
{
  self->_wantsMessageCachingWhileSuspended = a3;
}

- (void)suspendWithMessageCachingAllowed:(BOOL)a3 bypassed:(BOOL)a4
{
  if (!self->_pipelineStage) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can't suspend a connection without a pipeline stage" userInfo:0]);
  }
  self->_suspended = 1;
  BOOL v4 = a3 && self->_wantsMessageCachingWhileSuspended || self->_waitingForDeferredAttach;
  self->_messageCachingEnabled = v4;
  self->_bypassed = a4;
}

- (void)connectBypassInput
{
  if (!self->_bypassed)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = @"Can't connect a bypass on a connection that is not marked as bypassed";
    goto LABEL_9;
  }
  for (uint64_t i = self->_input;
        ;
        uint64_t i = [(BWNodeConnection *)[(BWNodeOutput *)[(BWNode *)v4 output] connection] input])
  {
    BOOL v4 = [(BWNodeInput *)i node];
    if (!(_BYTE)[(BWNodeOutput *)[(BWNode *)v4 output] connection][58]) {
      break;
    }
  }
  self->_bypassInput = [[(BWNodeInput *)[(BWNodeConnection *)[(BWNodeOutput *)[(BWNode *)v4 output] connection] input] node] input];
  v5 = [(BWNodeConnection *)[(BWNodeOutput *)[(BWNode *)v4 output] connection] pipelineStage];
  self->_bypassPipelineStage = v5;
  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = @"Bypassed node's output does not have a pipeline stage";
LABEL_9:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:0]);
  }
}

- (void)resumeForEventsOnly:(BOOL)a3
{
  if (self->_suspended && !self->_resuming)
  {
    if (self->_waitingForDeferredAttach)
    {
      self->_waitingForDeferredResume = 1;
      self->_waitingForDeferredResumeForEventsOnly = a3;
    }
    else
    {
      os_unfair_lock_lock(&self->_suspensionLock);
      self->_resumedForEventsOnly = a3;
      self->_resuming = 1;
      pipelineStage = self->_pipelineStage;
      input = self->_input;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__BWNodeConnection_resumeForEventsOnly___block_invoke;
      v7[3] = &unk_1E5C2AF60;
      v7[4] = self;
      BOOL v8 = a3;
      [(BWPipelineStage *)pipelineStage sendMessagesToInput:input messageProvider:v7];
      os_unfair_lock_unlock(&self->_suspensionLock);
    }
  }
}

- (void)attachNow
{
  if (self->_waitingForDeferredAttach)
  {
    self->_waitingForDeferredAttach = 0;
    if (self->_waitingForDeferredResume)
    {
      global_queue = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__BWNodeConnection_attachNow__block_invoke;
      block[3] = &unk_1E5C24430;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWNodeConnection;
  [(BWNodeConnection *)&v3 dealloc];
}

- (BOOL)deferredAttach
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(BWNodeOutput *)self->_output setConsumer:self];
  [(BWNodeInput *)self->_input setConnection:self];
  self->_waitingForDeferredAttach = 1;
  if (self->_pipelineStage)
  {
    objc_super v3 = [(BWNodeInput *)self->_input node];
    if (v3)
    {
      BOOL v4 = v3;
      if (![(BWNode *)v3 supportsConcurrentLiveInputCallbacks])
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        v5 = [(BWNode *)v4 inputs];
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(BWNodeInput **)(*((void *)&v15 + 1) + 8 * v9);
              if (v10 != self->_input)
              {
                uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) connection];
                if (v11)
                {
                  uint64_t v12 = *(void *)(v11 + 32);
                  if (v12)
                  {
                    if (([*(id *)(v11 + 32) isEqual:self->_pipelineStage] & 1) == 0)
                    {
                      uint64_t v14 = [NSString stringWithFormat:@"Attempting to attach connection '%@' to input '%@' with pipeline stage '%@' but node doesn't support concurrent input callbacks (node input '%@' has pipeline stage '%@')", self, self->_input, self->_pipelineStage, v10, v12];
                      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
                    }
                  }
                }
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v7);
        }
      }
    }
  }
  return 1;
}

uint64_t __29__BWNodeConnection_attachNow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeForEventsOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 50)];
}

- (BOOL)detach
{
  return 1;
}

BOOL __40__BWNodeConnection_resumeForEventsOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a2 + 8) == 1;
}

- (BOOL)wantsMessageCachingWhileSuspended
{
  return self->_wantsMessageCachingWhileSuspended;
}

@end
@interface BWAttachedMediaSplitNode
+ (void)initialize;
- (BOOL)emitsDroppedSampleForMissingAttachedMedia;
- (BOOL)emitsNodeErrorsForMissingAttachedMedia;
- (BOOL)isOutputRenderingEnabledForAttachedMediaKey:(id)a3;
- (BWAttachedMediaSplitNode)initWithAttachedMediaKeys:(id)a3;
- (BWAttachedMediaSplitNode)initWithAttachedMediaKeys:(id)a3 attachedMediaToPropagateToPrimaryOutput:(id)a4;
- (id)nodeSubType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setEmitsDroppedSampleForMissingAttachedMedia:(BOOL)a3;
- (void)setEmitsNodeErrorsForMissingAttachedMedia:(BOOL)a3;
- (void)setOutputRenderingEnabled:(BOOL)a3 forAttachedMediaKey:(id)a4;
@end

@implementation BWAttachedMediaSplitNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(BWNode *)self outputs];
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v14)
        {
          v15 = (void *)v14;
          uint64_t v16 = [v13 mediaPropertiesForAttachedMediaKey:v14];
          if (v16)
          {
            v17 = (BWNodeOutputMediaProperties *)v16;
            if (([v15 isEqualToString:@"PrimaryFormat"] & 1) == 0)
            {
              uint64_t v18 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v13, v15, a5];
              objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
            }
          }
          else
          {
            v17 = objc_alloc_init(BWNodeOutputMediaProperties);
            [v13 _setMediaProperties:v17 forAttachedMediaKey:v15];
          }
          [(BWNodeOutputMediaProperties *)v17 setResolvedFormat:a3];
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!BWSampleBufferIsMarkerBuffer(a3))
  {
    id v21 = BWSampleBufferCopyDictionaryOfAttachedMedia(a3);
    if (self->_numOutputs < 1)
    {
LABEL_35:

      return;
    }
    uint64_t v9 = 0;
    uint64_t v20 = 0x1EFA68100;
    while (1)
    {
      id v10 = -[NSArray objectAtIndexedSubscript:](self->_attachedMediaKeys, "objectAtIndexedSubscript:", v9, v20);
      if ([v10 isEqualToString:@"PrimaryFormat"])
      {
        if (self->_attachedMediaToPropagateToPrimaryOutput)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v11 = (void *)[v21 allKeys];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v24;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v24 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
                if (![(NSArray *)self->_attachedMediaToPropagateToPrimaryOutput containsObject:v16]) {
                  BWSampleBufferRemoveAttachedMedia(a3, v16);
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
            }
            while (v13);
          }
        }
        else
        {
          BWSampleBufferRemoveAllAttachedMedia(a3);
        }
        v17 = a3;
        if (!a3) {
          goto LABEL_34;
        }
      }
      else
      {
        v17 = (opaqueCMSampleBuffer *)[v21 objectForKeyedSubscript:v10];
        if (!v17)
        {
          if (self->_emitsNodeErrorsForMissingAttachedMedia)
          {
            id v18 = +[BWNodeError newError:4294954513 sourceNode:self];
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9), "emitNodeError:", v18);
          }
          if (self->_emitsDroppedSampleForMissingAttachedMedia)
          {
            CMSampleBufferGetPresentationTimeStamp(&v22, a3);
            id v19 = +[BWDroppedSample newDroppedSampleWithReason:v20 pts:&v22];
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9), "emitDroppedSample:", v19);
          }
          goto LABEL_34;
        }
      }
      if (([(NSMutableSet *)self->_disabledAttachedMediaKeys containsObject:v10] & 1) == 0) {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v9), "emitSampleBuffer:", v17);
      }
LABEL_34:
      if (++v9 >= self->_numOutputs) {
        goto LABEL_35;
      }
    }
  }
  if (self->_numOutputs >= 1)
  {
    uint64_t v6 = 0;
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      if (([(NSMutableSet *)self->_disabledAttachedMediaKeys containsObject:[(NSArray *)self->_attachedMediaKeys objectAtIndexedSubscript:v6]] & 1) == 0)
      {
        CMSampleBufferRef sampleBufferOut = 0;
        if (!CMSampleBufferCreateCopy(v7, a3, &sampleBufferOut))
        {
          id v8 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:v6];
          [v8 emitSampleBuffer:sampleBufferOut];
        }
        if (sampleBufferOut) {
          CFRelease(sampleBufferOut);
        }
      }
      ++v6;
    }
    while (v6 < self->_numOutputs);
  }
}

- (BWAttachedMediaSplitNode)initWithAttachedMediaKeys:(id)a3 attachedMediaToPropagateToPrimaryOutput:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 count];
  if (!v6)
  {
    v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    v30 = @"The attachedMediaKeys array needs to have at least one element";
    goto LABEL_29;
  }
  if (![a4 count]) {
    goto LABEL_5;
  }
  if (([a3 containsObject:@"PrimaryFormat"] & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    v30 = @"attachedMediaKeys does not specify Primary Media but attachedMediaToPropagateToPrimaryOutput has been provided";
    goto LABEL_29;
  }
  if ([a4 containsObject:@"PrimaryFormat"])
  {
    v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3C8];
    v30 = @"attachedMediaToPropagateToPrimaryOutput cannot specify primary media";
LABEL_29:
    objc_exception_throw((id)[v28 exceptionWithName:v29 reason:v30 userInfo:0]);
  }
LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)BWAttachedMediaSplitNode;
  CFAllocatorRef v7 = [(BWFanOutNode *)&v37 initWithFanOutCount:v6 mediaType:1986618469];
  if (v7)
  {
    id v8 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v8 setPassthroughMode:0];
    [(BWNodeInput *)v7->super.super._input setUnspecifiedAttachedMediaConfiguration:v8];
    id v9 = a4;
    uint64_t v31 = v6;
    if ((int)v6 < 1) {
      goto LABEL_12;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = v6;
    do
    {
      uint64_t v13 = objc_msgSend(a3, "objectAtIndexedSubscript:", v10, v31);
      id v14 = [(NSArray *)[(BWNode *)v7 outputs] objectAtIndexedSubscript:v10];
      v15 = v14;
      if (([v13 isEqualToString:@"PrimaryFormat"] & 1) == 0)
      {
        uint64_t v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
        [(BWNodeInput *)v7->super.super._input formatRequirements];
        [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init((Class)objc_opt_class())];
        [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:1];
        [(BWNodeInput *)v7->super.super._input setMediaConfiguration:v16 forAttachedMediaKey:v13];
        v17 = (void *)[v14 primaryMediaConfiguration];
        [v17 setPassthroughMode:1];
        [v17 setAttachedMediaKeyOfInputWhichDrivesThisOutput:v13];
        v15 = v11;
      }
      id v18 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      [(BWNodeOutputMediaConfiguration *)v18 setPassthroughMode:0];
      [v14 setUnspecifiedAttachedMediaConfiguration:v18];
      ++v10;
      uint64_t v11 = v15;
    }
    while (v12 != v10);
    LODWORD(v6) = v31;
    a4 = v9;
    if (!v15)
    {
LABEL_12:
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v7->super.super._input primaryMediaConfiguration] setPassthroughMode:0];
      v15 = 0;
    }
    unint64_t v19 = 0x1E4F1C000;
    if ([a4 count])
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v20 = [a4 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v9);
            }
            uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            if (![(BWNodeInput *)v7->super.super._input mediaConfigurationForAttachedMediaKey:v24])
            {
              long long v25 = objc_alloc_init(BWNodeInputMediaConfiguration);
              [(BWNodeInput *)v7->super.super._input formatRequirements];
              [(BWNodeInputMediaConfiguration *)v25 setFormatRequirements:objc_alloc_init((Class)objc_opt_class())];
              [(BWNodeInputMediaConfiguration *)v25 setPassthroughMode:1];
              [(BWNodeInput *)v7->super.super._input setMediaConfiguration:v25 forAttachedMediaKey:v24];
            }
            long long v26 = objc_alloc_init(BWNodeOutputMediaConfiguration);
            [(BWNodeOutputMediaConfiguration *)v26 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
            [(BWNodeOutputMediaConfiguration *)v26 setPassthroughMode:1];
            [v15 setMediaConfiguration:v26 forAttachedMediaKey:v24];
          }
          a4 = v9;
          uint64_t v21 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v21);
      }
      unint64_t v19 = 0x1E4F1C000uLL;
      v7->_attachedMediaToPropagateToPrimaryOutput = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a4];
      LODWORD(v6) = v31;
    }
    v7->_attachedMediaKeys = (NSArray *)[objc_alloc(*(Class *)(v19 + 2424)) initWithArray:a3];
    v7->_attachedMediaFormatDescriptions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v7->_numOutputs = v6;
    v7->_disabledAttachedMediaKeys = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:(int)v6];
  }
  return v7;
}

- (BWAttachedMediaSplitNode)initWithAttachedMediaKeys:(id)a3
{
  return [(BWAttachedMediaSplitNode *)self initWithAttachedMediaKeys:a3 attachedMediaToPropagateToPrimaryOutput:0];
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAttachedMediaSplitNode;
  [(BWFanOutNode *)&v3 dealloc];
}

- (void)setOutputRenderingEnabled:(BOOL)a3 forAttachedMediaKey:(id)a4
{
  disabledAttachedMediaKeys = self->_disabledAttachedMediaKeys;
  if (a3) {
    [(NSMutableSet *)disabledAttachedMediaKeys removeObject:a4];
  }
  else {
    [(NSMutableSet *)disabledAttachedMediaKeys addObject:a4];
  }
}

- (BOOL)isOutputRenderingEnabledForAttachedMediaKey:(id)a3
{
  int v5 = -[NSArray containsObject:](self->_attachedMediaKeys, "containsObject:");
  if (v5) {
    LOBYTE(v5) = [(NSMutableSet *)self->_disabledAttachedMediaKeys containsObject:a3] ^ 1;
  }
  return v5;
}

- (id)nodeSubType
{
  return @"AttachedMediaSplitNode";
}

- (void)setEmitsNodeErrorsForMissingAttachedMedia:(BOOL)a3
{
  self->_emitsNodeErrorsForMissingAttachedMedia = a3;
}

- (BOOL)emitsNodeErrorsForMissingAttachedMedia
{
  return self->_emitsNodeErrorsForMissingAttachedMedia;
}

- (void)setEmitsDroppedSampleForMissingAttachedMedia:(BOOL)a3
{
  self->_emitsDroppedSampleForMissingAttachedMedia = a3;
}

- (BOOL)emitsDroppedSampleForMissingAttachedMedia
{
  return self->_emitsDroppedSampleForMissingAttachedMedia;
}

@end
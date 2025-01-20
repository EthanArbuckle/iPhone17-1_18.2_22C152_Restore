@interface BWStillImageSmartStyleAttachmentTransferNode
+ (void)initialize;
- (BWStillImageSmartStyleAttachmentTransferNode)initWithNodeConfiguration:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_transferAttachmentsToStyledBuffer;
- (void)_resetProcessingState;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageSmartStyleAttachmentTransferNode

+ (void)initialize
{
}

- (BWStillImageSmartStyleAttachmentTransferNode)initWithNodeConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageSmartStyleAttachmentTransferNode;
  v4 = [(BWNode *)&v8 init];
  if (v4)
  {
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeInput *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(BWNode *)v4 addInput:v5];

    v6 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeOutput *)v6 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v6 setPassthroughMode:1];
    [(BWNode *)v4 addOutput:v6];

    v4->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
    v4->_inferencesFromUnstyledBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_attachedMediaFromUnstyledBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_attachmentsFromUnstyledBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSmartStyleAttachmentTransferNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_resetProcessingState
{
  if (a1)
  {
    [*(id *)(a1 + 104) removeAllObjects];
    [*(id *)(a1 + 112) removeAllObjects];
    [*(id *)(a1 + 120) removeAllObjects];
    *(unsigned char *)(a1 + 128) = 0;
    v2 = *(const void **)(a1 + 136);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 136) = 0;
    }

    *(void *)(a1 + 144) = 0;
  }
}

- (id)nodeType
{
  return @"Muxer";
}

- (id)nodeSubType
{
  return @"StillImageSmartStyleAttachmentTransfer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v6 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (BWIsSmartStyleCapture(v6))
  {
    v7 = objc_msgSend((id)objc_msgSend(v6, "requestedSettings"), "captureRequestIdentifier");
    if (([v7 isEqual:self->_lastCaptureRequestIdentifier] & 1) == 0)
    {
      if (![(NSMutableDictionary *)self->_inferencesFromUnstyledBuffers count]) {
        [(NSMutableDictionary *)self->_attachedMediaFromUnstyledBuffers count];
      }
      -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
      self->_lastCaptureRequestIdentifier = (NSString *)v7;
    }
    int v8 = BWStillImageProcessingFlagsForSampleBuffer(a3);
    if ((v8 & 0x2800000) == 0)
    {
      int v9 = v8;
      int v10 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageBufferFrameType", 0), "unsignedIntValue");
      BOOL v11 = [(BWStillImageNodeConfiguration *)self->_nodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled];
      BOOL v12 = v10 == 13 && v11;
      if ((v9 & 0x200000) == 0)
      {
        char v13 = v10 == 40 || v12;
        if ((v13 & 1) == 0)
        {
LABEL_49:
          if (self->_styledBuffer)
          {
            if (self->_hasAttachmentsFromUnstyledBuffer)
            {
              -[BWStillImageSmartStyleAttachmentTransferNode _transferAttachmentsToStyledBuffer]((uint64_t)self);
              [(BWNodeOutput *)self->super._output emitSampleBuffer:self->_styledBuffer];
              -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
            }
          }
          return;
        }
        goto LABEL_21;
      }
      if (BWSampleBufferGetAttachedMedia(a3, 0x1EFA74760))
      {
        int v14 = v10 == 40 || v12;
        if (v14 != 1)
        {
          if (a3) {
            v30 = (opaqueCMSampleBuffer *)CFRetain(a3);
          }
          else {
            v30 = 0;
          }
          self->_styledBuffer = v30;
          goto LABEL_49;
        }
LABEL_21:
        v31 = v6;
        [(NSMutableDictionary *)self->_inferencesFromUnstyledBuffers addEntriesFromDictionary:CMGetAttachment(a3, @"Inferences", 0)];
        v15 = (void *)CMGetAttachment(a3, @"AttachedMedia", 0);
        [(NSMutableDictionary *)self->_attachedMediaFromUnstyledBuffers addEntriesFromDictionary:v15];
        if ([v15 objectForKeyedSubscript:@"Depth"])
        {
          uint64_t v16 = *MEMORY[0x1E4F55B40];
          CFTypeRef v17 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
          if (v17) {
            [(NSMutableDictionary *)self->_attachmentsFromUnstyledBuffers setObject:v17 forKeyedSubscript:v16];
          }
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v18 = *MEMORY[0x1E4F55C08];
        v36[0] = *MEMORY[0x1E4F55BE8];
        v36[1] = v18;
        uint64_t v19 = *MEMORY[0x1E4F55C10];
        v36[2] = *MEMORY[0x1E4F55BF0];
        v36[3] = v19;
        v20 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v33 != v23) {
                objc_enumerationMutation(v20);
              }
              CFStringRef v25 = *(const __CFString **)(*((void *)&v32 + 1) + 8 * i);
              CFTypeRef v26 = CMGetAttachment(a3, v25, 0);
              if (v26) {
                [(NSMutableDictionary *)self->_attachmentsFromUnstyledBuffers setObject:v26 forKeyedSubscript:v25];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v22);
        }
        BOOL v28 = self->_hasAttachmentsFromUnstyledBuffer || v10 == 40;
        self->_hasAttachmentsFromUnstyledBuffer = v28;
        if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration filterRenderingEnabled]
          && BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(v31, "requestedSettings"), "processedImageFilters")))
        {
          [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
        }
        goto LABEL_49;
      }
    }
  }
  output = self->super._output;
  [(BWNodeOutput *)output emitSampleBuffer:a3];
}

- (uint64_t)_transferAttachmentsToStyledBuffer
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(result + 136), @"Inferences", 0);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v29 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          if (![*(id *)(v1 + 104) objectForKeyedSubscript:v7]) {
            objc_msgSend(*(id *)(v1 + 104), "setObject:forKeyedSubscript:", objc_msgSend(v2, "objectForKeyedSubscript:", v7), v7);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v4);
    }
    int v8 = (void *)[*(id *)(v1 + 104) copy];
    CMSetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), @"Inferences", v8, 1u);

    int v9 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), @"AttachedMedia", 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          if (![*(id *)(v1 + 112) objectForKeyedSubscript:v14]) {
            objc_msgSend(*(id *)(v1 + 112), "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", v14), v14);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }
    v15 = (void *)[*(id *)(v1 + 112) copy];
    CMSetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), @"AttachedMedia", v15, 1u);

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v16 = *(void **)(v1 + 120);
    result = [v16 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (result)
    {
      uint64_t v17 = result;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v16);
          }
          CMSetAttachment(*(CMAttachmentBearerRef *)(v1 + 136), *(CFStringRef *)(*((void *)&v20 + 1) + 8 * v19), (CFTypeRef)[*(id *)(v1 + 120) objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v19)], 1u);
          ++v19;
        }
        while (v17 != v19);
        result = [v16 countByEnumeratingWithState:&v20 objects:v32 count:16];
        uint64_t v17 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageSmartStyleAttachmentTransferNode _resetProcessingState]((uint64_t)self);
  output = self->super._output;
  [(BWNodeOutput *)output emitNodeError:a3];
}

@end
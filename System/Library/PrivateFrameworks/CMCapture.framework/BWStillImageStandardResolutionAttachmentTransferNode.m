@interface BWStillImageStandardResolutionAttachmentTransferNode
+ (void)initialize;
- (BWStillImageStandardResolutionAttachmentTransferNode)initWithNodeConfiguration:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (void)_resetProcessingState;
- (void)_transferAttachmentsToEnhancedResolutionBuffer;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageStandardResolutionAttachmentTransferNode

+ (void)initialize
{
}

- (BWStillImageStandardResolutionAttachmentTransferNode)initWithNodeConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageStandardResolutionAttachmentTransferNode;
  v4 = [(BWNode *)&v8 init];
  if (v4)
  {
    if ([a3 optimizedEnhancedResolutionDepthPipelineEnabled])
    {
      v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
      [(BWNodeInput *)v5 setFormatRequirements:+[BWVideoFormatRequirements formatRequirements]];
      [(BWNodeInput *)v5 setPassthroughMode:1];
      [(BWNode *)v4 addInput:v5];
      v6 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
      [(BWNodeOutput *)v6 setFormatRequirements:+[BWVideoFormatRequirements formatRequirements]];
      [(BWNodeOutput *)v6 setPassthroughMode:1];
      [(BWNode *)v4 addOutput:v6];
      v4->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3;
      v4->_inferencesFromStandardResBuffer = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v4->_attachedMediasFromStandardResBuffer = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v4->_attachmentsFromStandardResBuffer = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  enhancedResolutionBuffer = self->_enhancedResolutionBuffer;
  if (enhancedResolutionBuffer)
  {
    CFRelease(enhancedResolutionBuffer);
    self->_enhancedResolutionBuffer = 0;
  }

  self->_lastCaptureRequestIdentifier = 0;
  v4.receiver = self;
  v4.super_class = (Class)BWStillImageStandardResolutionAttachmentTransferNode;
  [(BWNode *)&v4 dealloc];
}

- (id)nodeType
{
  return @"Muxer";
}

- (id)nodeSubType
{
  return @"StillImageStandardResolutionAttachmentTransfer";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v6 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "captureFlags") & 0x800) != 0)
    {
      objc_super v8 = objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "captureRequestIdentifier");
      if (([v8 isEqual:self->_lastCaptureRequestIdentifier] & 1) == 0)
      {
        if (![(NSMutableDictionary *)self->_inferencesFromStandardResBuffer count]) {
          [(NSMutableDictionary *)self->_attachedMediasFromStandardResBuffer count];
        }
        -[BWStillImageStandardResolutionAttachmentTransferNode _resetProcessingState]((uint64_t)self);
        self->_lastCaptureRequestIdentifier = (NSString *)v8;
        self->_lastSettingsID = [v7 settingsID];
      }
      int v9 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageBufferFrameType", 0), "unsignedIntValue");
      BOOL v10 = [(BWStillImageNodeConfiguration *)self->_nodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled];
      BOOL v11 = [(BWStillImageNodeConfiguration *)self->_nodeConfiguration optimizedEnhancedResolutionDepthPipelineEnabled];
      if (v10 && v9 == 13)
      {
        [(NSMutableDictionary *)self->_inferencesFromStandardResBuffer addEntriesFromDictionary:CMGetAttachment(a3, @"Inferences", 0)];
        v15 = (void *)CMGetAttachment(a3, @"AttachedMedia", 0);
        [(NSMutableDictionary *)self->_attachedMediasFromStandardResBuffer addEntriesFromDictionary:v15];
        if ([v15 objectForKeyedSubscript:@"Depth"])
        {
          uint64_t v16 = *MEMORY[0x1E4F55B40];
          CFTypeRef v17 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B40], 0);
          if (v17) {
            [(NSMutableDictionary *)self->_attachmentsFromStandardResBuffer setObject:v17 forKeyedSubscript:v16];
          }
        }
        self->_hasAttachmentsFromStandardResBuffer = 1;
        if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration filterRenderingEnabled]
          && BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(v7, "requestedSettings"), "processedImageFilters")))
        {
          [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
        }
      }
      else if (v9 != 13 && v11)
      {
        if (a3) {
          v14 = (opaqueCMSampleBuffer *)CFRetain(a3);
        }
        else {
          v14 = 0;
        }
        self->_enhancedResolutionBuffer = v14;
      }
      if (self->_enhancedResolutionBuffer && self->_hasAttachmentsFromStandardResBuffer)
      {
        -[BWStillImageStandardResolutionAttachmentTransferNode _transferAttachmentsToEnhancedResolutionBuffer]((uint64_t)self);
        [(BWNodeOutput *)self->super._output emitSampleBuffer:self->_enhancedResolutionBuffer];
        -[BWStillImageStandardResolutionAttachmentTransferNode _resetProcessingState]((uint64_t)self);
      }
      return;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  output = self->super._output;
  [(BWNodeOutput *)output emitSampleBuffer:a3];
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
    *(void *)(a1 + 152) = 0;
  }
}

- (void)_transferAttachmentsToEnhancedResolutionBuffer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 136), @"Inferences", 0), "mutableCopy");
    [v2 addEntriesFromDictionary:*(void *)(a1 + 104)];
    CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 136), @"Inferences", v2, 1u);

    id v3 = BWSampleBufferCopyDictionaryOfAttachedMedia(*(const void **)(a1 + 136));
    objc_super v4 = (void *)[v3 mutableCopy];
    [v4 addEntriesFromDictionary:*(void *)(a1 + 112)];
    CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 136), @"AttachedMedia", v4, 1u);

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = *(void **)(a1 + 120);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 136), *(CFStringRef *)(*((void *)&v10 + 1) + 8 * i), (CFTypeRef)[*(id *)(a1 + 120) objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * i)], 1u);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
    if ([*(id *)(a1 + 96) depthDataType] == 9)
    {
      BWSampleBufferRemoveAttachedMedia(*(const void **)(a1 + 136), 0x1EFA74380);
      BWSampleBufferRemoveAttachedMedia(*(const void **)(a1 + 136), 0x1EFA743E0);
      BWSampleBufferRemoveAttachedMedia(*(const void **)(a1 + 136), 0x1EFA74400);
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWStillImageStandardResolutionAttachmentTransferNode _resetProcessingState]((uint64_t)self);
  output = self->super._output;
  [(BWNodeOutput *)output emitNodeError:a3];
}

@end
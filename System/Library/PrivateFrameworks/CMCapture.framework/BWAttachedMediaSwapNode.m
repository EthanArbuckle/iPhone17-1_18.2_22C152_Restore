@interface BWAttachedMediaSwapNode
+ (void)initialize;
- (BWAttachedMediaSwapNode)initWithPrimaryFormatToAttachedMediaKey:(id)a3 attachedMediaKeyToPrimaryFormat:(id)a4 sampleBufferAttachmentsToTransfer:(id)a5 generatesDroppedSampleMarkerBuffers:(BOOL)a6;
- (id)nodeSubType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWAttachedMediaSwapNode

+ (void)initialize
{
}

- (BWAttachedMediaSwapNode)initWithPrimaryFormatToAttachedMediaKey:(id)a3 attachedMediaKeyToPrimaryFormat:(id)a4 sampleBufferAttachmentsToTransfer:(id)a5 generatesDroppedSampleMarkerBuffers:(BOOL)a6
{
  if (!a3 || !a4)
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    v23 = @"Neither attached media key may be nil";
    goto LABEL_13;
  }
  if ([a3 isEqualToString:a4])
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    v23 = @"The primaryFormatToAttachedMediaKey must be different from the attachedMediaKeyToPrimaryFormat";
    goto LABEL_13;
  }
  if ([a3 isEqualToString:@"PrimaryFormat"])
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    v23 = @"The primaryFormatToAttachedMediaKey cannot be BWAttachedMediaKey_PrimaryFormat";
    goto LABEL_13;
  }
  if ([a4 isEqualToString:@"PrimaryFormat"])
  {
    v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    v23 = @"The attachedMediaKeyToPrimaryFormat cannot be BWAttachedMediaKey_PrimaryFormat";
LABEL_13:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0, a6));
  }
  v24.receiver = self;
  v24.super_class = (Class)BWAttachedMediaSwapNode;
  v11 = [(BWNode *)&v24 init];
  if (v11)
  {
    v11->_primaryFormatToAttachedMediaKey = (NSString *)a3;
    v11->_attachedMediaKeyToPrimaryFormat = (NSString *)a4;
    v11->_sampleBufferAttachmentsToTransfer = (NSArray *)a5;
    v11->_generatesDroppedSampleMarkerBuffers = a6;
    v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v11];
    [(BWNode *)v11 addInput:v12];

    v13 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v11];
    [(BWNode *)v11 addOutput:v13];

    v14 = [(BWNodeInput *)v11->super._input primaryMediaConfiguration];
    [(BWNodeInput *)v11->super._input formatRequirements];
    [(BWNodeInputMediaConfiguration *)v14 setFormatRequirements:objc_alloc_init((Class)objc_opt_class())];
    [(BWNodeInputMediaConfiguration *)v14 setPassthroughMode:1];
    v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v15 setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)v15 setAttachedMediaKeyOfInputWhichDrivesThisOutput:@"PrimaryFormat"];
    [(BWNodeOutput *)v11->super._output setMediaConfiguration:v15 forAttachedMediaKey:a3];
    v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInput *)v11->super._input formatRequirements];
    [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init((Class)objc_opt_class())];
    [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:1];
    [(BWNodeInput *)v11->super._input setMediaConfiguration:v16 forAttachedMediaKey:a4];
    v17 = [(BWNodeOutput *)v11->super._output primaryMediaConfiguration];
    [(BWNodeOutputMediaConfiguration *)v17 setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)v17 setAttachedMediaKeyOfInputWhichDrivesThisOutput:a4];
    v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v18 setPassthroughMode:1];
    [(BWNodeInput *)v11->super._input setUnspecifiedAttachedMediaConfiguration:v18];
    v19 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v19 setPassthroughMode:1];
    [(BWNodeOutput *)v11->super._output setUnspecifiedAttachedMediaConfiguration:v19];
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWAttachedMediaSwapNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"AttachedMediaSplitNode";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (objc_msgSend(a5, "isEqualToString:", @"PrimaryFormat", a4))
  {
    primaryFormatToAttachedMediaKey = (__CFString *)self->_primaryFormatToAttachedMediaKey;
  }
  else if ([a5 isEqualToString:self->_attachedMediaKeyToPrimaryFormat])
  {
    primaryFormatToAttachedMediaKey = @"PrimaryFormat";
  }
  else
  {
    primaryFormatToAttachedMediaKey = (__CFString *)a5;
  }
  v9 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:primaryFormatToAttachedMediaKey];
  int v10 = [(__CFString *)primaryFormatToAttachedMediaKey isEqualToString:@"PrimaryFormat"];
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [NSString stringWithFormat:@"%@ output unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, primaryFormatToAttachedMediaKey, a5];
      goto LABEL_15;
    }
  }
  else
  {
    if (v10)
    {
      uint64_t v11 = [NSString stringWithFormat:@"%@ output unexpectedly has no mediaProperties for the primary format (provided media key was %@)", self, a5, v12];
LABEL_15:
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
    }
    v9 = objc_alloc_init(BWNodeOutputMediaProperties);
    [(BWNodeOutput *)self->super._output _setMediaProperties:v9 forAttachedMediaKey:primaryFormatToAttachedMediaKey];
  }
  [(BWNodeOutputMediaProperties *)v9 setResolvedFormat:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  char v7 = objc_msgSend((id)CMGetAttachment(a3, @"AttachedMediaSwapPlaceholderSampleBuffer", 0), "BOOLValue");
  int v8 = objc_msgSend((id)CMGetAttachment(a3, @"FileWriterAction", 0), "isEqualToString:", 0x1EFA73620);
  if (!BWSampleBufferIsMarkerBuffer(a3) || (v7 & 1) != 0 || v8)
  {
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)self->_attachedMediaKeyToPrimaryFormat);
    if (AttachedMedia && (CFTypeRef v11 = CFRetain(AttachedMedia)) != 0)
    {
      CMAttachmentBearerRef v9 = v11;
      BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)self->_attachedMediaKeyToPrimaryFormat);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      sampleBufferAttachmentsToTransfer = self->_sampleBufferAttachmentsToTransfer;
      uint64_t v13 = [(NSArray *)sampleBufferAttachmentsToTransfer countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(sampleBufferAttachmentsToTransfer);
            }
            CFStringRef v17 = *(const __CFString **)(*((void *)&v27 + 1) + 8 * i);
            LODWORD(attachmentModeOut.duration.value) = 0;
            CFTypeRef v18 = CMGetAttachment(a3, v17, (CMAttachmentMode *)&attachmentModeOut);
            if (v18) {
              CMSetAttachment(v9, v17, v18, attachmentModeOut.duration.value);
            }
          }
          uint64_t v14 = [(NSArray *)sampleBufferAttachmentsToTransfer countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v14);
      }
    }
    else
    {
      CMAttachmentBearerRef target = 0;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&attachmentModeOut.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&attachmentModeOut.decodeTimeStamp.value = v19;
      attachmentModeOut.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v20 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&attachmentModeOut.duration.value = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&attachmentModeOut.duration.epoch = v20;
      CMSampleBufferGetPresentationTimeStamp(&attachmentModeOut.presentationTimeStamp, a3);
      OSStatus v21 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &attachmentModeOut, 0, 0, (CMSampleBufferRef *)&target);
      if (v21)
      {
        OSStatus v24 = v21;
        fig_log_get_emitter();
        uint64_t v26 = v4;
        LODWORD(sampleTimingArray) = v24;
        FigDebugAssert3();
      }
      else
      {
        CMSetAttachment(target, @"AttachedMediaSwapPlaceholderSampleBuffer", (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
      }
      CMAttachmentBearerRef v9 = target;
      if (!target)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return;
      }
    }
    BWSampleBufferPropagateAttachedMedia(a3, v9);
    BWSampleBufferRemoveAllAttachedMedia(a3);
    if ((v7 & 1) == 0) {
      BWSampleBufferSetAttachedMedia(v9, (uint64_t)self->_primaryFormatToAttachedMediaKey, (uint64_t)a3);
    }
  }
  else
  {
    CMAttachmentBearerRef v9 = CFRetain(a3);
    if (!v9) {
      return;
    }
  }
  if (self->_generatesDroppedSampleMarkerBuffers
    && objc_msgSend((id)CMGetAttachment(v9, @"SampleDataToBeDropped", 0), "BOOLValue"))
  {
    if (CMGetAttachment(v9, @"SampleDataToBeDroppedEmitSampleBufferSemaphores", 0))
    {
      uint64_t v22 = +[BWNodeInput newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:v9];
      if (v22)
      {
        v23 = v22;
        [(BWNodeOutput *)self->super._output emitSampleBuffer:v22];
        CFRelease(v23);
      }
    }
  }
  else
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v9, sampleTimingArray, v26);
  }
  CFRelease(v9);
}

@end
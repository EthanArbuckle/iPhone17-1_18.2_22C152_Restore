@interface BWStillImageSmartStyleUnstyledBufferEmitterNode
+ (void)initialize;
- (BWStillImageSmartStyleUnstyledBufferEmitterNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageSmartStyleUnstyledBufferEmitterNode

+ (void)initialize
{
}

- (BWStillImageSmartStyleUnstyledBufferEmitterNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)BWStillImageSmartStyleUnstyledBufferEmitterNode;
  v2 = [(BWNode *)&v6 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    [(BWNodeInput *)v3 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v3 setPassthroughMode:1];
    [(BWNode *)v2 addInput:v3];

    v4 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v2];
    [(BWNodeOutput *)v4 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v4 setPassthroughMode:1];
    [(BWNode *)v2 addOutput:v4];
  }
  return v2;
}

- (id)nodeType
{
  return @"Coordinator";
}

- (id)nodeSubType
{
  return @"StillImageSmartStyleUnstyledBufferEmitter";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CMAttachmentBearerRef destination = 0;
  if ((BWStillImageProcessingFlagsForSampleBuffer(a3) & 0x200000) != 0)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74760);
    if (AttachedMedia)
    {
      uint64_t CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata(AttachedMedia, (CMSampleBufferRef *)&destination);
      if (CopyIncludingMetadata)
      {
        id v8 = +[BWNodeError newError:CopyIncludingMetadata sourceNode:self stillImageSettings:CMGetAttachment(a3, @"StillSettings", 0) metadata:0];
        [(BWNodeOutput *)self->super._output emitNodeError:v8];
      }
      else
      {
        CMPropagateAttachments(a3, destination);
        BWSampleBufferRemoveAttachedMedia(destination, 0x1EFA74760);
        BWSampleBufferRemoveAttachedMedia(destination, 0x1EFA74720);
        BWStillImageUnsetProcessingFlagsForSampleBuffer(destination, 0x200000);
        CMSetAttachment(destination, @"StillImageBufferFrameType", &unk_1EFAFE568, 1u);
        [(BWNodeOutput *)self->super._output emitSampleBuffer:destination];
      }
      if (destination) {
        CFRelease(destination);
      }
    }
  }
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
}

@end
@interface BWVideoSDOFSplitNode
+ (void)initialize;
- (BWNodeOutput)originalOutput;
- (BWNodeOutput)sdofOutput;
- (BWVideoSDOFSplitNode)init;
- (id)nodeSubType;
- (void)dealloc;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWVideoSDOFSplitNode

+ (void)initialize
{
}

- (BWVideoSDOFSplitNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWVideoSDOFSplitNode;
  v2 = [(BWFanOutNode *)&v5 initWithFanOutCount:2 mediaType:1986618469];
  v3 = v2;
  if (v2)
  {
    v2->_originalOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v2 outputs] objectAtIndexedSubscript:0];
    v3->_sdofOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v3 outputs] objectAtIndexedSubscript:1];
  }
  return v3;
}

- (void)dealloc
{
  originalVideoFormatDescription = self->_originalVideoFormatDescription;
  if (originalVideoFormatDescription) {
    CFRelease(originalVideoFormatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWVideoSDOFSplitNode;
  [(BWFanOutNode *)&v4 dealloc];
}

- (id)nodeSubType
{
  return @"VideoSDOFSplitNode";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    [(BWNodeOutput *)self->_originalOutput emitSampleBuffer:a3];
    uint64_t v6 = 152;
LABEL_9:
    v9 = *(Class *)((char *)&self->super.super.super.isa + v6);
    [v9 emitSampleBuffer:a3];
    return;
  }
  v7 = (__CVBuffer *)CMGetAttachment(a3, @"UnfilteredPixelBuffer", 0);
  if (!v7)
  {
    uint64_t v6 = 144;
    goto LABEL_9;
  }
  v8 = v7;
  CFRetain(v7);
  CMRemoveAttachment(a3, @"UnfilteredPixelBuffer");
  CFTypeRef cf = 0;
  BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v8, (CFTypeRef *)&self->_originalVideoFormatDescription, (CMSampleBufferRef *)&cf);
  CFRelease(v8);
  if (cf)
  {
    CFTypeRef v10 = 0;
    BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)cf, (CMSampleBufferRef *)&v10);
    CFRelease(cf);
    if (v10)
    {
      -[BWNodeOutput emitSampleBuffer:](self->_originalOutput, "emitSampleBuffer:");
      CFRelease(v10);
    }
  }
  [(BWNodeOutput *)self->_sdofOutput emitSampleBuffer:a3];
}

- (BWNodeOutput)originalOutput
{
  return self->_originalOutput;
}

- (BWNodeOutput)sdofOutput
{
  return self->_sdofOutput;
}

@end
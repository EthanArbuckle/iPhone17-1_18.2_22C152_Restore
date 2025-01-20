@interface BWMetadataSourceNode
+ (void)initialize;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BWMetadataSourceNode)initWithFormatDescription:(opaqueCMFormatDescription *)a3 clock:(OpaqueCMClock *)a4;
- (OpaqueCMClock)clock;
- (id)nodeSubType;
- (opaqueCMFormatDescription)formatDescription;
- (void)appendMetadataSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
@end

@implementation BWMetadataSourceNode

+ (void)initialize
{
}

- (id)nodeSubType
{
  return @"Metadata";
}

- (BOOL)start:(id *)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BWMetadataSourceNode_start___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

unsigned char *__30__BWMetadataSourceNode_start___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[96])
  {
    result = (unsigned char *)objc_msgSend((id)objc_msgSend(result, "output"), "makeConfiguredFormatLive");
    *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__BWMetadataSourceNode_stop___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

uint64_t __29__BWMetadataSourceNode_stop___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 96))
  {
    *(unsigned char *)(v1 + 96) = 0;
    return [*(id *)(*(void *)(result + 32) + 16) markEndOfLiveOutput];
  }
  return result;
}

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (BWMetadataSourceNode)initWithFormatDescription:(opaqueCMFormatDescription *)a3 clock:(OpaqueCMClock *)a4
{
  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = @"Need a format description";
    goto LABEL_8;
  }
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = @"Need a clock";
LABEL_8:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  }
  v12.receiver = self;
  v12.super_class = (Class)BWMetadataSourceNode;
  v6 = [(BWNode *)&v12 init];
  if (v6)
  {
    v6->_formatDescription = (opaqueCMFormatDescription *)CFRetain(a3);
    v6->_clock = (OpaqueCMClock *)CFRetain(a4);
    v6->_emitSamplesDispatchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v7 = [[BWNodeOutput alloc] initWithMediaType:1835365473 node:v6];
    [(BWNodeOutput *)v7 setFormat:+[BWMetadataFormat formatWithMetadataFormatDescription:v6->_formatDescription]];
    [(BWNode *)v6 addOutput:v7];
  }
  return v6;
}

- (void)dealloc
{
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  clock = self->_clock;
  if (clock) {
    CFRelease(clock);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWMetadataSourceNode;
  [(BWNode *)&v5 dealloc];
}

- (void)appendMetadataSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    if (self->_running)
    {
      CFRetain(a3);
      emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __51__BWMetadataSourceNode_appendMetadataSampleBuffer___block_invoke;
      v6[3] = &unk_1E5C24F10;
      v6[4] = self;
      v6[5] = a3;
      dispatch_async(emitSamplesDispatchQueue, v6);
    }
  }
}

void __51__BWMetadataSourceNode_appendMetadataSampleBuffer___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "output"), "emitSampleBuffer:", *(void *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

@end
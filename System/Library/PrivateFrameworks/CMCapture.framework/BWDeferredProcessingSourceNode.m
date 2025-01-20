@interface BWDeferredProcessingSourceNode
+ (void)initialize;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BWDeferredProcessingSourceNode)initWithPortTypes:(id)a3 attributes:(id)a4 colorSpaceProperties:(int)a5;
- (NSDictionary)outputsByPortType;
- (id)nodeSubType;
- (id)outputForPortType:(id)a3;
- (id)portTypeForOutput:(id)a3;
- (void)dealloc;
- (void)processBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation BWDeferredProcessingSourceNode

- (BWDeferredProcessingSourceNode)initWithPortTypes:(id)a3 attributes:(id)a4 colorSpaceProperties:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)BWDeferredProcessingSourceNode;
  v7 = [(BWNode *)&v22 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7->_emitSamplesDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.capture.deferredprocessorsourcenode.emit-samples-queue", v8);
    v7->_outputsByPortType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
          v14 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v7];
          [(NSMutableDictionary *)v7->_outputsByPortType setObject:v14 forKeyedSubscript:v13];
          v15 = [[BWVideoFormatRequirements alloc] initWithPixelBufferAttributes:a4];
          uint64_t v23 = [NSNumber numberWithInt:v5];
          -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v15, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1]);
          [(BWNodeOutput *)v14 setFormatRequirements:v15];
          [(BWNodeOutput *)v14 setProvidesPixelBufferPool:0];
          [(BWNode *)v7 addOutput:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

+ (void)initialize
{
}

- (NSDictionary)outputsByPortType
{
  return &self->_outputsByPortType->super;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredProcessingSourceNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"DeferredProcessing";
}

- (id)portTypeForOutput:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  outputsByPortType = self->_outputsByPortType;
  uint64_t v6 = [(NSMutableDictionary *)outputsByPortType countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(outputsByPortType);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ((id)[(NSMutableDictionary *)self->_outputsByPortType objectForKeyedSubscript:v10] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableDictionary *)outputsByPortType countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)outputForPortType:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_outputsByPortType objectForKeyedSubscript:a3];
}

- (BOOL)start:(id *)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__BWDeferredProcessingSourceNode_start___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

unsigned char *__40__BWDeferredProcessingSourceNode_start___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  result = *(unsigned char **)(a1 + 32);
  if (!result[112])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    objc_super v3 = objc_msgSend(result, "outputs", 0);
    result = (unsigned char *)[v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (result)
    {
      v4 = result;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6++) makeConfiguredFormatLive];
        }
        while (v4 != v6);
        result = (unsigned char *)[v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        v4 = result;
      }
      while (result);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BWDeferredProcessingSourceNode_stop___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(emitSamplesDispatchQueue, block);
  return 1;
}

uint64_t __39__BWDeferredProcessingSourceNode_stop___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 112))
  {
    *(unsigned char *)(v1 + 112) = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v2 = objc_msgSend(*(id *)(result + 32), "outputs", 0);
    result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v6 + 1) + 8 * v5++) markEndOfLiveOutput];
        }
        while (v3 != v5);
        result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)processBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = -[BWDeferredProcessingSourceNode outputForPortType:](self, "outputForPortType:", objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  emitSamplesDispatchQueue = self->_emitSamplesDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BWDeferredProcessingSourceNode_processBuffer___block_invoke;
  block[3] = &unk_1E5C249A0;
  block[4] = self;
  void block[5] = v5;
  block[6] = a3;
  dispatch_sync(emitSamplesDispatchQueue, block);
}

uint64_t __48__BWDeferredProcessingSourceNode_processBuffer___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 112)) {
    return [*(id *)(result + 40) emitSampleBuffer:*(void *)(result + 48)];
  }
  return result;
}

@end
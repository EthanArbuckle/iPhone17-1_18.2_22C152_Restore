@interface BWParallelJoinerNode
- (BWParallelJoinerNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4;
- (void)dealloc;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWParallelJoinerNode

- (BWParallelJoinerNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWParallelJoinerNode;
  v5 = [(BWFunnelNode *)&v8 initWithNumberOfInputs:*(void *)&a3 mediaType:*(void *)&a4];
  v6 = v5;
  if (v5)
  {
    v5->_inputsCount = a3;
    v5->_receivedBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6->_sentErrorCountForID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWParallelJoinerNode;
  [(BWFunnelNode *)&v3 dealloc];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CFTypeRef v6 = CMGetAttachment(a3, @"ParallelSplitterInputBuffer", 0);
    v7 = v6;
    if (v6) {
      CFRetain(v6);
    }
    CMRemoveAttachment(a3, @"ParallelSplitterInputBuffer");
    uint64_t v8 = [MEMORY[0x1E4F29238] valueWithPointer:v7];
    v9 = (void *)[(NSMutableDictionary *)self->_receivedBuffers objectForKeyedSubscript:v8];
    if (!v9)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_inputsCount];
      [(NSMutableDictionary *)self->_receivedBuffers setObject:v9 forKeyedSubscript:v8];
    }
    [v9 addObject:a3];
    if ([v9 count] == self->_inputsCount)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(const void **)(*((void *)&v16 + 1) + 8 * i);
            if (v14 != v7) {
              CMPropagateAttachments(v14, v7);
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
      [(NSMutableDictionary *)self->_receivedBuffers removeObjectForKey:v8];
      [(BWNodeOutput *)self->super.super._output emitSampleBuffer:v7];
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    output = self->super.super._output;
    -[BWNodeOutput emitSampleBuffer:](output, "emitSampleBuffer:", 0, a4);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  CFTypeRef v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sentErrorCountForID, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if (v6)
  {
    v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  }
  else
  {
    [(BWNodeOutput *)self->super.super._output emitNodeError:a3];
    v7 = &unk_1EFB01838;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sentErrorCountForID, "setObject:forKeyedSubscript:", v7, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash")));
  if ([v7 intValue] == self->_inputsCount)
  {
    sentErrorCountForID = self->_sentErrorCountForID;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
    [(NSMutableDictionary *)sentErrorCountForID removeObjectForKey:v9];
  }
}

@end
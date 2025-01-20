@interface _GPURawCounterSource
- (BOOL)isEnabled;
- (BOOL)pollCountersAtBufferIndex:(unsigned int)a3 withBlock:(id)a4;
- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12;
- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12 error:(id *)a13;
- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11;
- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11 error:(id *)a12;
- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9;
- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9 error:(id *)a10;
- (BOOL)requestCounters:(id)a3 firstErrorIndex:(unint64_t *)a4;
- (BOOL)requestTriggers:(id)a3 firstErrorIndex:(unint64_t *)a4;
- (BOOL)ringBufferInfoAtIndex:(unsigned int)a3 base:(char *)a4 size:(unsigned int *)a5 dataOffset:(unsigned int *)a6 dataSize:(unsigned int *)a7;
- (BOOL)setEnabled:(BOOL)a3;
- (GPURawCounterSourceGroup)sourceGroup;
- (NSDictionary)features;
- (NSDictionary)options;
- (NSString)name;
- (_GPURawCounterSource)initWithSourceGroup:(id)a3 name:(id)a4;
- (id)availableCounters;
- (id)availableTriggers;
- (id)selectedCounters;
- (id)selectedTriggers;
- (unsigned)drainRingBufferAtIndex:(unsigned int)a3 dataSize:(unsigned int)a4;
- (unsigned)ringBufferNum;
- (void)dealloc;
- (void)flushRingBuffers;
- (void)resetRawDataPostProcessor;
- (void)setOptions:(id)a3;
@end

@implementation _GPURawCounterSource

- (_GPURawCounterSource)initWithSourceGroup:(id)a3 name:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_GPURawCounterSource;
  v6 = [(_GPURawCounterSource *)&v8 init];
  if (v6)
  {
    v6->_name = (NSString *)[a4 copy];
    v6->_sourceGroup = (GPURawCounterSourceGroup *)a3;
    v6->_options = 0;
  }
  return v6;
}

- (void)dealloc
{
  self->_sourceGroup = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GPURawCounterSource;
  [(_GPURawCounterSource *)&v3 dealloc];
}

- (BOOL)setEnabled:(BOOL)a3
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (id)availableTriggers
{
  [(_GPURawCounterSource *)self doesNotRecognizeSelector:a2];
  id v2 = objc_alloc_init(MEMORY[0x263EFF8C0]);

  return v2;
}

- (id)selectedTriggers
{
  return 0;
}

- (BOOL)requestTriggers:(id)a3 firstErrorIndex:(unint64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

- (id)availableCounters
{
  [(_GPURawCounterSource *)self doesNotRecognizeSelector:a2];
  id v2 = objc_alloc_init(MEMORY[0x263EFF8C0]);

  return v2;
}

- (id)selectedCounters
{
  return 0;
}

- (BOOL)requestCounters:(id)a3 firstErrorIndex:(unint64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

- (unsigned)ringBufferNum
{
  return 0;
}

- (BOOL)ringBufferInfoAtIndex:(unsigned int)a3 base:(char *)a4 size:(unsigned int *)a5 dataOffset:(unsigned int *)a6 dataSize:(unsigned int *)a7
{
  return 0;
}

- (unsigned)drainRingBufferAtIndex:(unsigned int)a3 dataSize:(unsigned int)a4
{
  return 0;
}

- (void)flushRingBuffers
{
}

- (void)resetRawDataPostProcessor
{
}

- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9
{
  return 0;
}

- (BOOL)postProcessRawDataWithSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 output:(char *)a6 outputSize:(unint64_t)a7 outputWritten:(unint64_t *)a8 isLast:(BOOL)a9 error:(id *)a10
{
  return -[_GPURawCounterSource postProcessRawDataWithSource:sourceSize:sourceRead:output:outputSize:outputWritten:isLast:](self, "postProcessRawDataWithSource:sourceSize:sourceRead:output:outputSize:outputWritten:isLast:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11
{
  return 0;
}

- (BOOL)postProcessRawDataWithRingBufferSource:(char *)a3 sourceSize:(unint64_t)a4 sourceRead:(unint64_t *)a5 sourceWrite:(unint64_t)a6 output:(char *)a7 outputSize:(unint64_t)a8 outputRead:(unint64_t)a9 outputWrite:(unint64_t *)a10 isLast:(BOOL)a11 error:(id *)a12
{
  return -[_GPURawCounterSource postProcessRawDataWithRingBufferSource:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:](self, "postProcessRawDataWithRingBufferSource:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12
{
  if (a3)
  {
    -[_GPURawCounterSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5, a6, a7, a8);
    return 0;
  }
  else
  {
    return -[_GPURawCounterSource postProcessRawDataWithRingBufferSource:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:](self, "postProcessRawDataWithRingBufferSource:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:", a4, a5, a6, a7, a8, a9);
  }
}

- (BOOL)postProcessRawDataWithRingBufferIndex:(unsigned int)a3 source:(char *)a4 sourceSize:(unint64_t)a5 sourceRead:(unint64_t *)a6 sourceWrite:(unint64_t)a7 output:(char *)a8 outputSize:(unint64_t)a9 outputRead:(unint64_t)a10 outputWrite:(unint64_t *)a11 isLast:(BOOL)a12 error:(id *)a13
{
  return -[_GPURawCounterSource postProcessRawDataWithRingBufferIndex:source:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:](self, "postProcessRawDataWithRingBufferIndex:source:sourceSize:sourceRead:sourceWrite:output:outputSize:outputRead:outputWrite:isLast:", *(void *)&a3, a4, a5, a6, a7, a8);
}

- (BOOL)pollCountersAtBufferIndex:(unsigned int)a3 withBlock:(id)a4
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (GPURawCounterSourceGroup)sourceGroup
{
  return self->_sourceGroup;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)features
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

@end
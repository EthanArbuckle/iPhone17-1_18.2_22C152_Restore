@interface BWInferenceSchedulerResourceCoordinator
+ (void)initialize;
- (BWInferenceSchedulerResourceCoordinator)init;
- (id)formatsWithRequestedPoolsRemainingAfterSubtractingFormats:(id)a3;
- (id)pixelBufferPoolForFormat:(id)a3;
- (int)requestPixelBufferPoolForFormat:(id)a3 size:(unint64_t)a4;
- (int)requestPixelBufferPoolForRequirement:(id)a3 size:(unint64_t)a4;
- (void)dealloc;
- (void)preparePixelBufferPoolsWithBackPressureDrivenPipelining:(BOOL)a3;
@end

@implementation BWInferenceSchedulerResourceCoordinator

- (BWInferenceSchedulerResourceCoordinator)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWInferenceSchedulerResourceCoordinator;
  v2 = [(BWInferenceSchedulerResourceCoordinator *)&v4 init];
  if (v2)
  {
    v2->_requestedPoolSizeByFormat = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_pixelBufferPoolByFormat = 0;
  }
  return v2;
}

- (id)pixelBufferPoolForFormat:(id)a3
{
  pixelBufferPoolByFormat = self->_pixelBufferPoolByFormat;
  if (!pixelBufferPoolByFormat) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Coordinator has not prepared shared pixel buffer pools!" userInfo:0]);
  }
  return (id)[(NSMutableDictionary *)pixelBufferPoolByFormat objectForKeyedSubscript:a3];
}

- (int)requestPixelBufferPoolForRequirement:(id)a3 size:(unint64_t)a4
{
  uint64_t v6 = [a3 videoFormat];
  return [(BWInferenceSchedulerResourceCoordinator *)self requestPixelBufferPoolForFormat:v6 size:a4];
}

- (int)requestPixelBufferPoolForFormat:(id)a3 size:(unint64_t)a4
{
  if (self->_pixelBufferPoolByFormat)
  {
    return FigSignalErrorAt();
  }
  else
  {
    v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestedPoolSizeByFormat, "objectForKeyedSubscript:");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestedPoolSizeByFormat, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", a4 + (int)objc_msgSend(v7, "intValue")), a3);
    return 0;
  }
}

- (void)preparePixelBufferPoolsWithBackPressureDrivenPipelining:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_pixelBufferPoolByFormat) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Coordinator has already prepared shared pixel buffer pools!" userInfo:0]);
  }
  BOOL v3 = a3;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_requestedPoolSizeByFormat;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = (int)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_requestedPoolSizeByFormat, "objectForKeyedSubscript:", v9), "intValue");
        uint64_t v11 = [NSString stringWithFormat:@"Inference pool for %@", objc_msgSend(v9, "description")];
        LOBYTE(v13) = v3;
        v12 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", [v9 underlyingVideoFormat], v10, v11, 0, +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), v3, v13);
        [v15 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  self->_pixelBufferPoolByFormat = (NSMutableDictionary *)v15;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerResourceCoordinator;
  [(BWInferenceSchedulerResourceCoordinator *)&v3 dealloc];
}

- (id)formatsWithRequestedPoolsRemainingAfterSubtractingFormats:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[NSMutableDictionary allKeys](self->_pixelBufferPoolByFormat, "allKeys"));
  [v4 minusSet:a3];
  return (id)[v4 allObjects];
}

@end
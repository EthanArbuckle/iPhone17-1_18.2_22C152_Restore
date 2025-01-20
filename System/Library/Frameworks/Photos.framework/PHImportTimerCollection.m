@interface PHImportTimerCollection
- (double)duration:(unsigned __int8)a3;
- (id)description;
- (id)initForMediaType:(unsigned __int8)a3 fileSize:(unint64_t)a4;
- (id)startTiming:(unsigned __int8)a3 subtype:(unsigned __int8)a4;
- (unsigned)aspectRatio;
- (void)processTimesOfType:(unsigned __int8)a3 withBlock:(id)a4;
- (void)setAspectRatio:(unsigned __int8)a3;
- (void)stopTiming:(id)a3;
@end

@implementation PHImportTimerCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTimers, 0);

  objc_storeStrong((id *)&self->_timers, 0);
}

- (void)setAspectRatio:(unsigned __int8)a3
{
  self->_aspectRatio = a3;
}

- (unsigned)aspectRatio
{
  return self->_aspectRatio;
}

- (double)duration:(unsigned __int8)a3
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PHImportTimerCollection_duration___block_invoke;
  v5[3] = &unk_1E5847340;
  v5[4] = &v6;
  [(PHImportTimerCollection *)self processTimesOfType:a3 withBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __36__PHImportTimerCollection_duration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 timeIntervalSinceDate:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (void)processTimesOfType:(unsigned __int8)a3 withBlock:(id)a4
{
  int v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = self->_timers;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "type", (void)v15) == v4)
          {
            v13 = [v12 startTime];
            v14 = [v12 endTime];
            v6[2](v6, v13, v14);
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)stopTiming:(id)a3
{
  runningTimers = self->_runningTimers;
  id v4 = a3;
  -[NSMutableIndexSet removeIndex:](runningTimers, "removeIndex:", [v4 type]);
  [v4 stop];
}

- (id)startTiming:(unsigned __int8)a3 subtype:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  [(NSMutableIndexSet *)self->_runningTimers addIndex:a3];
  v7 = [[PHImportTimer alloc] initWithType:v5 subtype:v4];
  [(NSMutableArray *)self->_timers addObject:v7];
  [(PHImportTimer *)v7 start];

  return v7;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@<%p>: mediaType: %hhu, fileSize: %lu\ntimers:\n%@", v5, self, self->_mediaType, self->_fileSize, self->_timers];

  return v6;
}

- (id)initForMediaType:(unsigned __int8)a3 fileSize:(unint64_t)a4
{
  v7 = PLImportGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)PHImportTimerCollection;
    uint64_t v9 = [(PHImportTimerCollection *)&v17 init];
    uint64_t v10 = v9;
    if (v9)
    {
      v9->_mediaType = a3;
      v9->_fileSize = a4;
      uint64_t v11 = objc_opt_new();
      timers = v10->_timers;
      v10->_timers = (NSMutableArray *)v11;

      uint64_t v13 = [MEMORY[0x1E4F28E60] indexSet];
      runningTimers = v10->_runningTimers;
      v10->_runningTimers = (NSMutableIndexSet *)v13;
    }
    self = v10;
    long long v15 = self;
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

@end
@interface SHMediaTimeline
+ (double)countdownForMatchedMediaItem:(id)a3;
+ (double)nextEventForRange:(id)a3 atMatchOffset:(double)a4;
+ (id)blankMediaItemWhenNothingIsInScope:(id)a3;
- (BOOL)finished;
- (BOOL)isFinished;
- (NSArray)inScopeMediaItems;
- (NSArray)mediaItems;
- (NSNumber)timeToNextMediaItemScopeChange;
- (OS_dispatch_source)timerDispatchSource;
- (SHMediaTimeline)initWithMatch:(id)a3;
- (SHMediaTimelineDelegate)delegate;
- (SHSignature)querySignature;
- (id)earliestInscopeRangeForMatchedMediaItem:(id)a3;
- (id)sortMediaItems:(id)a3;
- (void)cancelTimerSource;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setTimerDispatchSource:(id)a3;
- (void)startTimerForNextEvent;
@end

@implementation SHMediaTimeline

- (void)dealloc
{
  [(SHMediaTimeline *)self stopGenerating];
  v3.receiver = self;
  v3.super_class = (Class)SHMediaTimeline;
  [(SHMediaTimeline *)&v3 dealloc];
}

- (SHMediaTimeline)initWithMatch:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SHMediaTimeline;
  v5 = [(SHMediaTimeline *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 mediaItems];
    mediaItems = v5->_mediaItems;
    v5->_mediaItems = (NSArray *)v6;

    v8 = [SHSignature alloc];
    v9 = [MEMORY[0x263F08C38] UUID];
    v10 = [v4 querySignature];
    v11 = [v10 dataRepresentation];
    v12 = [v4 querySignature];
    v13 = [v12 time];
    uint64_t v14 = [(SHSignature *)v8 initWithID:v9 dataRepresentation:v11 startTime:v13 error:0];
    querySignature = v5->_querySignature;
    v5->_querySignature = (SHSignature *)v14;
  }
  return v5;
}

- (BOOL)finished
{
  v2 = [(SHMediaTimeline *)self timeToNextMediaItemScopeChange];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)startTimerForNextEvent
{
  [(SHMediaTimeline *)self cancelTimerSource];
  BOOL v3 = [(SHMediaTimeline *)self timeToNextMediaItemScopeChange];
  if (v3)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);
    [(SHMediaTimeline *)self setTimerDispatchSource:v5];

    [v3 doubleValue];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    objc_initWeak(&location, self);
    v8 = [(SHMediaTimeline *)self timerDispatchSource];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __41__SHMediaTimeline_startTimerForNextEvent__block_invoke;
    uint64_t v14 = &unk_2646EF838;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v8, &v11);

    v9 = [(SHMediaTimeline *)self timerDispatchSource];
    dispatch_source_set_timer(v9, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

    v10 = [(SHMediaTimeline *)self timerDispatchSource];
    dispatch_activate(v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __41__SHMediaTimeline_startTimerForNextEvent__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  v2 = [WeakRetained inScopeMediaItems];
  [v1 mediaTimeline:WeakRetained hasUpdatedInScopeMediaItems:v2];

  [WeakRetained startTimerForNextEvent];
}

- (void)cancelTimerSource
{
  BOOL v3 = [(SHMediaTimeline *)self timerDispatchSource];

  if (v3)
  {
    id v4 = [(SHMediaTimeline *)self timerDispatchSource];
    dispatch_source_cancel(v4);
  }
}

- (NSNumber)timeToNextMediaItemScopeChange
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(SHMediaTimeline *)self mediaItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    dispatch_source_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        [(id)objc_opt_class() countdownForMatchedMediaItem:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v8 > 0.0)
        {
          double v9 = v8;
          if (!v5 || ([v5 doubleValue], v9 < v10))
          {
            uint64_t v11 = [NSNumber numberWithDouble:v9];

            dispatch_source_t v5 = (void *)v11;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    dispatch_source_t v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSArray)inScopeMediaItems
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF980];
  uint64_t v4 = [(SHMediaTimeline *)self mediaItems];
  dispatch_source_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(SHMediaTimeline *)self mediaItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v11 predictedCurrentMatchOffset];
        if (objc_msgSend(v11, "describesOffset:"))
        {
          [v11 frequencySkew];
          if ([v11 describesFrequencySkew:v12]) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if (![v5 count])
  {
    long long v13 = objc_opt_class();
    long long v14 = [(SHMediaTimeline *)self mediaItems];
    long long v15 = [v13 blankMediaItemWhenNothingIsInScope:v14];
    [v5 addObject:v15];
  }
  long long v16 = (void *)[v5 copy];
  objc_super v17 = [(SHMediaTimeline *)self sortMediaItems:v16];

  return (NSArray *)v17;
}

- (id)sortMediaItems:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SHMediaTimeline_sortMediaItems___block_invoke;
  v5[3] = &unk_2646EF860;
  v5[4] = self;
  uint64_t v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __34__SHMediaTimeline_sortMediaItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 timeRanges];
  if ([v7 count])
  {
  }
  else
  {
    uint64_t v8 = [v6 timeRanges];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
  }
  double v10 = [v5 timeRanges];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    float v12 = [*(id *)(a1 + 32) earliestInscopeRangeForMatchedMediaItem:v5];
    long long v13 = [*(id *)(a1 + 32) earliestInscopeRangeForMatchedMediaItem:v6];
    uint64_t v14 = [v12 compare:v13];
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_8:

  return v14;
}

- (id)earliestInscopeRangeForMatchedMediaItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = objc_msgSend(v3, "timeRanges", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    double v8 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v10 lowerBound];
        if (v11 < v8)
        {
          [v3 predictedCurrentMatchOffset];
          if (objc_msgSend(v10, "contains:"))
          {
            [v10 lowerBound];
            double v8 = v12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 1.79769313e308;
  }

  long long v13 = [NSNumber numberWithDouble:v8];

  return v13;
}

+ (id)blankMediaItemWhenNothingIsInScope:(id)a3
{
  v16[5] = *MEMORY[0x263EF8340];
  id v3 = [a3 firstObject];
  v15[0] = @"sh_matchOffset";
  uint64_t v4 = NSNumber;
  [v3 matchOffset];
  uint64_t v5 = objc_msgSend(v4, "numberWithDouble:");
  v16[0] = v5;
  v15[1] = @"sh_speedSkew";
  uint64_t v6 = NSNumber;
  [v3 speedSkew];
  uint64_t v7 = objc_msgSend(v6, "numberWithFloat:");
  v16[1] = v7;
  v15[2] = @"sh_frequencySkew";
  double v8 = NSNumber;
  [v3 frequencySkew];
  uint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
  v16[2] = v9;
  v15[3] = @"sh_score";
  double v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "matchScore"));
  v16[3] = v10;
  v15[4] = @"sh_audioStartDate";
  double v11 = [v3 audioStartDate];
  v16[4] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];

  long long v13 = [[SHMatchedMediaItem alloc] initWithMatchedMediaItemDictionary:v12];

  return v13;
}

+ (double)countdownForMatchedMediaItem:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 predictedCurrentMatchOffset];
  double v6 = v5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = objc_msgSend(v4, "timeRanges", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = 0;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v7);
        }
        [a1 nextEventForRange:*(void *)(*((void *)&v24 + 1) + 8 * i) atMatchOffset:v6];
        if (v13 > 0.0)
        {
          double v14 = v13;
          if (!v10 || ([v10 doubleValue], v14 < v15))
          {
            uint64_t v16 = [NSNumber numberWithDouble:v14];

            double v10 = (void *)v16;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);

    if (v10)
    {
      [v10 doubleValue];
      double v18 = v17;
      goto LABEL_19;
    }
  }
  else
  {
  }
  double v10 = [v4 timeRanges];
  long long v19 = [v10 lastObject];
  if (v19)
  {
    uint64_t v20 = [v4 timeRanges];
    long long v21 = [v20 lastObject];
    [v21 upperBound];
    double v18 = v22 - v6;
  }
  else
  {
    double v18 = 0.0;
  }

LABEL_19:
  return v18;
}

+ (double)nextEventForRange:(id)a3 atMatchOffset:(double)a4
{
  id v5 = a3;
  [v5 lowerBound];
  double v7 = v6 - a4;
  [v5 upperBound];
  double v9 = v8;

  double result = v9 - a4;
  if (v7 >= 0.0) {
    return v7;
  }
  return result;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (SHMediaTimelineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHMediaTimelineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSignature)querySignature
{
  return self->_querySignature;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (OS_dispatch_source)timerDispatchSource
{
  return self->_timerDispatchSource;
}

- (void)setTimerDispatchSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerDispatchSource, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_querySignature, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
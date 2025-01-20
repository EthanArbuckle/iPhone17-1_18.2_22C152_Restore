@interface FSFBiomeFeatureStoreStream
- (BMStreamDatastore)pruneStore;
- (BMStreamDatastore)readStore;
- (BMStreamDatastore)writeStore;
- (BOOL)deleteCurrentStream;
- (BOOL)insert:(id)a3 withInteractionId:(id)a4 atTime:(double)a5;
- (FSFBiomeFeatureStoreStream)initWithConfig:(id)a3 streamId:(id)a4;
- (id)retrieve:(id)a3;
- (id)retrieveEvents:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)setPruneStore:(id)a3;
- (void)setReadStore:(id)a3;
- (void)setWriteStore:(id)a3;
@end

@implementation FSFBiomeFeatureStoreStream

- (FSFBiomeFeatureStoreStream)initWithConfig:(id)a3 streamId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[FSFErrorHandler assertThatUserIsSupported];
  if (+[FSFUtils isSupportedPlatform])
  {
    v14.receiver = self;
    v14.super_class = (Class)FSFBiomeFeatureStoreStream;
    v8 = [(FSFBiomeFeatureStoreStream *)&v14 init];
    if (v8)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F2A678]) initWithStream:v7 permission:1 config:v6];
      [(FSFBiomeFeatureStoreStream *)v8 setWriteStore:v9];

      v10 = (void *)[objc_alloc(MEMORY[0x263F2A678]) initWithStream:v7 permission:0 config:v6];
      [(FSFBiomeFeatureStoreStream *)v8 setReadStore:v10];

      v11 = (void *)[objc_alloc(MEMORY[0x263F2A678]) initWithStream:v7 permission:2 config:v6];
      [(FSFBiomeFeatureStoreStream *)v8 setPruneStore:v11];
    }
    self = v8;
    v12 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for non-iOS  platforms"];
    v12 = 0;
  }

  return v12;
}

- (BOOL)insert:(id)a3 withInteractionId:(id)a4 atTime:(double)a5
{
  id v7 = a3;
  if (+[FSFUtils isUnderLegalRestriction])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21D935000, &_os_log_internal, OS_LOG_TYPE_INFO, "Does not insert into FeatureStore: under privacy restriction", v11, 2u);
    }
    char v8 = 0;
  }
  else
  {
    v9 = [(FSFBiomeFeatureStoreStream *)self writeStore];
    char v8 = [v9 writeEventWithEventBody:v7 timestamp:a5];
  }
  return v8;
}

- (id)retrieve:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  double Current = CFAbsoluteTimeGetCurrent();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(FSFBiomeFeatureStoreStream *)self readStore];
  id v7 = [v6 fetchEventsFrom:0.0 to:Current + 2.5];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) eventBody];
        v13 = v12;
        if (v12)
        {
          objc_super v14 = [v12 serialize];
          if (v14)
          {
            v15 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
            [v4 addObject:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)retrieveEvents:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v9 setDay:1];
  [v9 setMonth:1];
  [v9 setYear:2001];
  uint64_t v10 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v9 setTimeZone:v10];

  v11 = [MEMORY[0x263EFF8F0] currentCalendar];
  v12 = [v11 dateFromComponents:v9];

  double v13 = 0.0;
  if (v7 && v12)
  {
    [v7 timeIntervalSinceDate:v12];
    double v13 = v14;
  }
  double v15 = CFAbsoluteTimeGetCurrent() + 2.5;
  if (v8 && v12) {
    objc_msgSend(v8, "timeIntervalSinceDate:", v12, v15);
  }
  double v16 = v15 + 1.0;
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v13 <= v16)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v18 = [(FSFBiomeFeatureStoreStream *)self readStore];
    long long v19 = [v18 fetchEventsFrom:v13 to:v16];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [v17 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v21);
    }
  }
  else
  {
    NSLog(&cfstr_StarttimeIsNew.isa, *(void *)&v13, *(void *)&v16);
  }

  return v17;
}

- (BOOL)deleteCurrentStream
{
  v3 = [(FSFBiomeFeatureStoreStream *)self pruneStore];
  [v3 removeEventsFrom:0 to:0 reason:&__block_literal_global pruneFutureEvents:0.0 usingBlock:CFAbsoluteTimeGetCurrent()];

  id v4 = [(FSFBiomeFeatureStoreStream *)self readStore];
  v5 = [v4 fetchEventsFrom:0.0 to:CFAbsoluteTimeGetCurrent()];
  BOOL v6 = [v5 count] == 0;

  return v6;
}

- (BMStreamDatastore)writeStore
{
  return self->_writeStore;
}

- (void)setWriteStore:(id)a3
{
}

- (BMStreamDatastore)readStore
{
  return self->_readStore;
}

- (void)setReadStore:(id)a3
{
}

- (BMStreamDatastore)pruneStore
{
  return self->_pruneStore;
}

- (void)setPruneStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruneStore, 0);
  objc_storeStrong((id *)&self->_readStore, 0);

  objc_storeStrong((id *)&self->_writeStore, 0);
}

@end
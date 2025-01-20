@interface BPSBiomeStorePublisher
+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5;
- (BMStoreEnumerator)enumerator;
- (BOOL)canStoreInternalStateInBookmark;
- (BOOL)canStorePassThroughValueInBookmark;
- (BOOL)finished;
- (BPSBiomeStorePublisher)initWithStreamDatastoreReader:(id)a3 streamsAccessClient:(id)a4;
- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4;
- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4 streamsAccessClient:(id)a5;
- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4 streamsAccessClient:(id)a5 eventDataClass:(Class)a6;
- (NSString)streamId;
- (id)_newEnumerator;
- (id)bookmark;
- (id)bookmarkableUpstreams;
- (id)nextEvent;
- (id)reverse;
- (id)startWithSubscriber:(id)a3;
- (id)upstreamPublishers;
- (id)validateBookmark:(id)a3;
- (id)withBookmark:(id)a3;
- (id)withEndTime:(double)a3;
- (id)withIndexSearch:(id)a3;
- (id)withLastEvents:(unint64_t)a3;
- (id)withMaxEvents:(unint64_t)a3;
- (id)withStartTime:(double)a3;
- (void)_newEnumerator;
- (void)applyBookmark:(id)a3;
- (void)reset;
- (void)setEnumerator:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)subscribe:(id)a3;
@end

@implementation BPSBiomeStorePublisher

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)finished
{
  return self->_finished;
}

- (id)validateBookmark:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v5 = [NSString alloc];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = (void *)[v5 initWithFormat:@"%@ expected bookmark of class %@, but received %@", v7, v9, v3];

    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F501D0];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = v10;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v4 = [v11 errorWithDomain:v12 code:2 userInfo:v13];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_streamDatastoreReader, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_indexSearch, 0);

  objc_storeStrong((id *)&self->_bookmark, 0);
}

- (void)applyBookmark:(id)a3
{
}

- (void)reset
{
  [(BPSBiomeStorePublisher *)self setFinished:0];

  [(BPSBiomeStorePublisher *)self setEnumerator:0];
}

- (id)bookmark
{
  v2 = [(BPSBiomeStorePublisher *)self enumerator];
  id v3 = [v2 bookmark];

  return v3;
}

- (id)nextEvent
{
  id v3 = [(BPSBiomeStorePublisher *)self enumerator];
  v4 = [v3 nextEvent];

  if (v4) {
    id v5 = v4;
  }
  else {
    [(BPSBiomeStorePublisher *)self setFinished:1];
  }

  return v4;
}

- (BMStoreEnumerator)enumerator
{
  return self->_enumerator;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)startWithSubscriber:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(BPSBiomeStorePublisher *)self _newEnumerator];
  if ([(BMStreamDatastoreReader *)self->_streamDatastoreReader isDataAccessible])
  {
    if (v4)
    {
      [(BPSBiomeStorePublisher *)self setEnumerator:v4];
      id v5 = 0;
      goto LABEL_7;
    }
    id v16 = [NSString alloc];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v9 = (void *)[v16 initWithFormat:@"%@ failed to create enumerator", v18];

    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F501D0];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v13 = v19;
    uint64_t v14 = v20;
    uint64_t v15 = 3;
  }
  else
  {
    id v6 = [NSString alloc];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = (void *)[v6 initWithFormat:@"%@ data is not accessible", v8];

    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F501D0];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v13 = v10;
    uint64_t v14 = v11;
    uint64_t v15 = 1;
  }
  id v5 = [v13 errorWithDomain:v14 code:v15 userInfo:v12];

LABEL_7:

  return v5;
}

- (void)setEnumerator:(id)a3
{
}

- (BPSBiomeStorePublisher)initWithStreamDatastoreReader:(id)a3 streamsAccessClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BPSBiomeStorePublisher;
  v9 = [(BPSBiomeStorePublisher *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_reversed = 0;
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v11 timeIntervalSinceReferenceDate];
    v10->_startTime = v12;

    v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v13 timeIntervalSinceReferenceDate];
    v10->_endTime = v14;

    v10->_maxEvents = -1;
    v10->_lastEventCount = -1;
    objc_storeStrong((id *)&v10->_streamDatastoreReader, a3);
    objc_storeStrong((id *)&v10->_accessClient, a4);
  }

  return v10;
}

- (id)_newEnumerator
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  double startTime = self->_startTime;
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  if (startTime == v7)
  {
    if (self->_reversed)
    {
      id v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v8 timeIntervalSinceReferenceDate];
      double v10 = v9;
    }
    else
    {
      double v10 = 0.0;
    }
  }
  else
  {
    double v10 = self->_startTime;
  }
  double endTime = self->_endTime;
  double v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  if (endTime == v14)
  {
    double v15 = 0.0;
    if (!self->_reversed)
    {
      objc_super v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v16 timeIntervalSinceReferenceDate];
      double v15 = v17;
    }
  }
  else
  {
    double v15 = self->_endTime;
  }
  if (self->_bookmark)
  {
    if (!self->_indexSearch
      || ([MEMORY[0x1E4F28B00] currentHandler],
          v21 = objc_claimAutoreleasedReturnValue(),
          [(BPSBiomeStorePublisher *)self streamId],
          uint64_t v22 = objc_claimAutoreleasedReturnValue(),
          [v21 handleFailureInMethod:a2, self, @"BPSBiomeStorePublisher.m", 273, @"both bookmark and indexSearch may not both be set. Stream: %@, bookmark: %@, indexSearch: %@", v22, self->_bookmark, self->_indexSearch object file lineNumber description], v22, v21, self->_bookmark))
    {
      v18 = (void *)-[BMStreamDatastoreReader newEnumeratorFromBookmark:](self->_streamDatastoreReader, "newEnumeratorFromBookmark:");
      if (v18)
      {
        v19 = v18;
        [v18 setEndTime:self->_maxEvents maxEvents:self->_lastEventCount lastN:self->_reversed reverse:v15];
        return v19;
      }
      uint64_t v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[BPSBiomeStorePublisher _newEnumerator](self);
      }
      goto LABEL_29;
    }
  }
  indexSearch = self->_indexSearch;
  if (indexSearch)
  {
    if (self->_lastEventCount != -1)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = [(BPSBiomeStorePublisher *)self streamId];
      [v40 handleFailureInMethod:a2, self, @"BPSBiomeStorePublisher.m", 287, @"lastN and indexSearch may not both be set. Stream: %@, indexSearch: %@ lastN: %lu", v41, self->_indexSearch, self->_lastEventCount object file lineNumber description];

      indexSearch = self->_indexSearch;
    }
    double v24 = self->_startTime;
    double v25 = self->_endTime;
    unint64_t maxEvents = self->_maxEvents;
    BOOL reversed = self->_reversed;
    id v43 = 0;
    v28 = [(BMIndexSearch *)indexSearch performSearchWithStartTime:maxEvents endTime:reversed maxEvents:&v43 reversed:v24 error:v25];
    v29 = v43;
    if (v28)
    {
      streamDatastoreReader = self->_streamDatastoreReader;
      v42 = v29;
      v19 = (void *)[(BMStreamDatastoreReader *)streamDatastoreReader newEnumeratorFromBookmarkEnumerator:v28 error:&v42];
      uint64_t v20 = v42;

      if (v19)
      {

        return v19;
      }
      v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v38 = [(BPSBiomeStorePublisher *)self streamId];
        v39 = self->_indexSearch;
        *(_DWORD *)buf = 138412802;
        v45 = v38;
        __int16 v46 = 2112;
        double v47 = *(double *)&v39;
        __int16 v48 = 2112;
        double v49 = *(double *)&v20;
        _os_log_error_impl(&dword_18E67D000, v31, OS_LOG_TYPE_ERROR, "newEnumeratorFromBookmark nil for stream: %@ and _indexSearch: %@, error: %@. No enumeration performed", buf, 0x20u);
      }
    }
    else
    {
      v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v35 = self->_indexSearch;
        v36 = [(BPSBiomeStorePublisher *)self streamId];
        *(_DWORD *)buf = 138412802;
        v45 = v35;
        __int16 v46 = 2112;
        double v47 = *(double *)&v36;
        __int16 v48 = 2112;
        double v49 = *(double *)&v29;
        _os_log_error_impl(&dword_18E67D000, v31, OS_LOG_TYPE_ERROR, "-[BMIndexSearch performSearchWithError:] returns a nil BMIndexRowEnumerator for BMIndexSearch: %@ nil on stream: %@. Error: %@, No enumeration performed", buf, 0x20u);
      }
      uint64_t v20 = v29;
    }

LABEL_29:
  }
  if (!self->_indexSearch)
  {
    uint64_t v32 = 8 * self->_reversed;
    v19 = (void *)[(BMStreamDatastoreReader *)self->_streamDatastoreReader newEnumeratorFromStartTime:self->_maxEvents endTime:self->_lastEventCount maxEvents:v32 lastN:v10 options:v15];
    if (v19) {
      return v19;
    }
    v34 = __biome_log_for_category();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v37 = [(BPSBiomeStorePublisher *)self streamId];
      *(_DWORD *)buf = 138413058;
      v45 = v37;
      __int16 v46 = 2048;
      double v47 = v10;
      __int16 v48 = 2048;
      double v49 = v15;
      __int16 v50 = 2048;
      uint64_t v51 = v32;
      _os_log_error_impl(&dword_18E67D000, v34, OS_LOG_TYPE_ERROR, "newEnumeratorFromStartTime nil for stream: %@, start time: %lf endTime: %lf options: %lu", buf, 0x2Au);
    }
  }
  return 0;
}

- (id)withStartTime:(double)a3
{
  *((double *)self + 1) = a3;
  return self;
}

- (id)withMaxEvents:(unint64_t)a3
{
  *((void *)self + 3) = a3;
  return self;
}

- (id)withEndTime:(double)a3
{
  *((double *)self + 2) = a3;
  return self;
}

- (id)reverse
{
  *((unsigned char *)self + 40) = 1;
  return self;
}

- (id)withLastEvents:(unint64_t)a3
{
  *((void *)self + 4) = a3;
  return self;
}

- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4
{
  return [(BPSBiomeStorePublisher *)self initWithStreamId:a3 storeConfig:a4 streamsAccessClient:0];
}

- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4 streamsAccessClient:(id)a5
{
  return [(BPSBiomeStorePublisher *)self initWithStreamId:a3 storeConfig:a4 streamsAccessClient:a5 eventDataClass:0];
}

- (BPSBiomeStorePublisher)initWithStreamId:(id)a3 storeConfig:(id)a4 streamsAccessClient:(id)a5 eventDataClass:(Class)a6
{
  double v10 = (objc_class *)MEMORY[0x1E4F50298];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 alloc];
  double v15 = (void *)[v14 initWithStream:v13 config:v12 eventDataClass:a6 useCase:*MEMORY[0x1E4F4FAF8]];

  objc_super v16 = [(BPSBiomeStorePublisher *)self initWithStreamDatastoreReader:v15 streamsAccessClient:v11];
  return v16;
}

- (NSString)streamId
{
  return (NSString *)[(BMStreamDatastoreReader *)self->_streamDatastoreReader streamIdentifier];
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  id v8 = [(BPSBiomeStorePublisher *)self _newEnumerator];
  id v5 = [_BPSInnerBiomeSubscription alloc];
  double v6 = [(BPSBiomeStorePublisher *)self streamId];
  double v7 = [(_BPSInnerBiomeSubscription *)v5 initWithStreamEnumerator:v8 downstream:v4 streamId:v6 accessClient:self->_accessClient];

  [v4 receiveSubscription:v7];
}

- (id)withIndexSearch:(id)a3
{
  return self;
}

- (id)withBookmark:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA98] null];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    double v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[BPSBiomeStorePublisher withBookmark:](v7);
    }

    goto LABEL_8;
  }
  if (!v4)
  {
LABEL_8:
    double v9 = self;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v4 value];
  }
  else
  {
    id v8 = v4;
  }
  double v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_bookmark, v10);
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BPSBiomeStorePublisher withBookmark:](self, v11);
    }
  }
  id v12 = self;

LABEL_16:

  return self;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5 = a3;

  return v5;
}

- (id)bookmarkableUpstreams
{
  return 0;
}

- (void)_newEnumerator
{
  v1 = [a1 streamId];
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v2, v3, "newEnumeratorFromBookmark nil for stream: %@. Going to try default start time: %lf", v4, v5, v6, v7, 2u);
}

- (void)withBookmark:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Found null when restoring bookmark for store publisher", v1, 2u);
}

- (void)withBookmark:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 streamId];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Can't use store bookmark for stream: %@, since the input bookmark object is invalid", (uint8_t *)&v4, 0xCu);
}

@end
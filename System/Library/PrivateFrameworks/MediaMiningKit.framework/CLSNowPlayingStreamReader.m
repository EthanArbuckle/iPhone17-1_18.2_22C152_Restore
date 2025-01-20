@interface CLSNowPlayingStreamReader
- (CLSNowPlayingStreamReader)init;
- (unint64_t)conversionOptions;
- (void)enumerateSessionsWithBlock:(id)a3;
- (void)setConversionOptions:(unint64_t)a3;
@end

@implementation CLSNowPlayingStreamReader

- (void)setConversionOptions:(unint64_t)a3
{
  self->_conversionOptions = a3;
}

- (unint64_t)conversionOptions
{
  return self->_conversionOptions;
}

- (void)enumerateSessionsWithBlock:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, uint8_t *, double))a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  v34 = [MEMORY[0x1E4F1C9C8] date];
  v35 = (void *)v5;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F5B5D0], "predicateForEventsWithStartInDateRangeFrom:to:", v5);
  id v7 = objc_alloc_init(MEMORY[0x1E4F5B518]);
  v8 = [MEMORY[0x1E4F5B5F8] nowPlayingStream];
  v51[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  [v7 setEventStreams:v9];

  v33 = (void *)v6;
  [v7 setPredicate:v6];
  [v7 setLimit:500];
  [v7 setOffset:0];
  v10 = [MEMORY[0x1E4F5B560] knowledgeStore];
  v38 = objc_alloc_init(CLSNowPlayingStreamConverter);
  uint64_t v11 = [(CLSNowPlayingStreamConverter *)v38 setOptions:[(CLSNowPlayingStreamReader *)self conversionOptions]];
  v12 = MEMORY[0x1E4F14500];
  v36 = v10;
  id v37 = v7;
  do
  {
    v13 = (void *)MEMORY[0x1D2602300](v11);
    id v47 = 0;
    v14 = [v10 executeQuery:v7 error:&v47];
    id v15 = v47;
    if (!v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v15;
        _os_log_error_impl(&dword_1D2150000, v12, OS_LOG_TYPE_ERROR, "Failed to read playback event stream with error: %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    uint64_t v16 = [v14 count];
    objc_msgSend(v7, "setOffset:", objc_msgSend(v7, "offset") + v16);
    BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v17)
      {
        v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v16];
        *(_DWORD *)buf = 138412290;
        id v50 = v18;
        _os_log_impl(&dword_1D2150000, v12, OS_LOG_TYPE_INFO, "Will process %@ events from playback stream", buf, 0xCu);
      }
      v19 = [(CLSNowPlayingStreamConverter *)v38 eventsFromDuetKnowledgeEvents:v14];
      v20 = objc_alloc_init(CLSNowPlayingStreamEventClusterer);
      [(CLSNowPlayingStreamEventClusterer *)v20 clusterEvents:v19];
      v42 = v20;
      v21 = [(CLSNowPlayingStreamEventClusterer *)v20 sessions];
      if ([v21 count])
      {
        v39 = v19;
        id v40 = v15;
        v41 = v13;
        buf[0] = 0;
        unint64_t v22 = [v21 count];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v23 = v21;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          double v26 = 1.0 / (double)v22;
          uint64_t v27 = *(void *)v44;
          double v28 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v23);
              }
              uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              v31 = (void *)MEMORY[0x1D2602300]();
              double v28 = v26 + v28;
              v4[2](v4, v30, buf, v28);
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v25);
        }

        v10 = v36;
        id v7 = v37;
        v12 = MEMORY[0x1E4F14500];
        id v15 = v40;
        v13 = v41;
        v19 = v39;
      }

LABEL_18:
      int v32 = 0;
      goto LABEL_19;
    }
    if (v17)
    {
      *(_WORD *)buf = 0;
      int v32 = 1;
      _os_log_impl(&dword_1D2150000, v12, OS_LOG_TYPE_INFO, "No more events from playback stream", buf, 2u);
    }
    else
    {
      int v32 = 1;
    }
LABEL_19:
  }
  while (v14 && !v32);
}

- (CLSNowPlayingStreamReader)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLSNowPlayingStreamReader;
  v2 = [(CLSNowPlayingStreamReader *)&v4 init];
  if (v2) {
    v2->_conversionOptions = +[CLSNowPlayingStreamConverter defaultOptions];
  }
  return v2;
}

@end
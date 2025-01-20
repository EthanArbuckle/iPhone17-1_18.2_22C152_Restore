@interface MPMovieErrorLog
- (NSArray)events;
- (NSData)extendedLogData;
- (NSStringEncoding)extendedLogDataStringEncoding;
- (id)_initWithAVItemErrorLog:(id)a3;
@end

@implementation MPMovieErrorLog

- (void).cxx_destruct
{
}

- (NSArray)events
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(AVPlayerItemErrorLog *)self->_errorLog events];
  if ([v2 count])
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v10 = [MPMovieErrorLogEvent alloc];
          id v11 = -[MPMovieErrorLogEvent _initWithAVItemErrorLogEvent:](v10, "_initWithAVItemErrorLogEvent:", v9, (void)v13);
          [v3 addObject:v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSStringEncoding)extendedLogDataStringEncoding
{
  return [(AVPlayerItemErrorLog *)self->_errorLog extendedLogDataStringEncoding];
}

- (NSData)extendedLogData
{
  return [(AVPlayerItemErrorLog *)self->_errorLog extendedLogData];
}

- (id)_initWithAVItemErrorLog:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MPMovieErrorLog;
    uint64_t v6 = [(MPMovieErrorLog *)&v10 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_errorLog, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
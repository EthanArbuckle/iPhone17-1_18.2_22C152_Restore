@interface MPMovieAccessLog
- (NSArray)events;
- (NSData)extendedLogData;
- (NSStringEncoding)extendedLogDataStringEncoding;
- (id)_initWithAVItemAccessLog:(id)a3;
@end

@implementation MPMovieAccessLog

- (void).cxx_destruct
{
}

- (NSArray)events
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(AVPlayerItemAccessLog *)self->_accessLog events];
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
          v10 = [MPMovieAccessLogEvent alloc];
          id v11 = -[MPMovieAccessLogEvent _initWithAVItemAccessLogEvent:](v10, "_initWithAVItemAccessLogEvent:", v9, (void)v13);
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
  return [(AVPlayerItemAccessLog *)self->_accessLog extendedLogDataStringEncoding];
}

- (NSData)extendedLogData
{
  return [(AVPlayerItemAccessLog *)self->_accessLog extendedLogData];
}

- (id)_initWithAVItemAccessLog:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MPMovieAccessLog;
    uint64_t v6 = [(MPMovieAccessLog *)&v10 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_accessLog, a3);
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
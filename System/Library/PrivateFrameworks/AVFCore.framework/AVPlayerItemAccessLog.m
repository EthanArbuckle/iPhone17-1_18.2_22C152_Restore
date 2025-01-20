@interface AVPlayerItemAccessLog
- (AVPlayerItemAccessLog)init;
- (AVPlayerItemAccessLog)initWithLogArray:(id)a3;
- (NSArray)events;
- (NSData)extendedLogData;
- (NSStringEncoding)extendedLogDataStringEncoding;
- (id)_accessLogArray;
- (id)_common_init;
- (id)description;
- (void)dealloc;
@end

@implementation AVPlayerItemAccessLog

- (id)_common_init
{
  v3 = objc_alloc_init(AVPlayerItemAccessLogInternal);
  if (!v3)
  {
    self->_playerItemAccessLog = 0;
    goto LABEL_5;
  }
  v4 = (AVPlayerItemAccessLogInternal *)CFRetain(v3);
  self->_playerItemAccessLog = v4;
  if (!v4)
  {
LABEL_5:

    return 0;
  }
  v4->logArray = 0;
  return self;
}

- (AVPlayerItemAccessLog)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemAccessLog;
  result = [(AVPlayerItemAccessLog *)&v3 init];
  if (result) {
    return (AVPlayerItemAccessLog *)[(AVPlayerItemAccessLog *)result _common_init];
  }
  return result;
}

- (AVPlayerItemAccessLog)initWithLogArray:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemAccessLog;
  v4 = [(AVPlayerItemAccessLog *)&v8 init];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(AVPlayerItemAccessLog *)v4 _common_init];
  v6 = (AVPlayerItemAccessLog *)v5;
  if (a3 && v5) {
    *(void *)(*(void *)(v5 + 8) + 8) = a3;
  }
  return v6;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = (void *)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
  [v5 appendFormat:@"\n%@", (id)objc_msgSend([NSString alloc], "initWithData:encoding:", -[AVPlayerItemAccessLog extendedLogData](self, "extendedLogData"), -[AVPlayerItemAccessLog extendedLogDataStringEncoding](self, "extendedLogDataStringEncoding"))];
  return v5;
}

- (void)dealloc
{
  playerItemAccessLog = self->_playerItemAccessLog;
  if (playerItemAccessLog)
  {

    v4 = self->_playerItemAccessLog;
    if (v4) {
      CFRelease(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemAccessLog;
  [(AVPlayerItemAccessLog *)&v5 dealloc];
}

- (NSData)extendedLogData
{
  return 0;
}

- (NSStringEncoding)extendedLogDataStringEncoding
{
  return 4;
}

- (NSArray)events
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_playerItemAccessLog->logArray, "count"));
  if (v3)
  {
    v4 = (void *)v3;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    logArray = self->_playerItemAccessLog->logArray;
    uint64_t v6 = [(NSArray *)logArray countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(logArray);
          }
          v10 = [[AVPlayerItemAccessLogEvent alloc] initWithDictionary:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
          if (v10) {
            [v4 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)logArray countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    return (NSArray *)v4;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1C978];
    return (NSArray *)[v12 array];
  }
}

- (id)_accessLogArray
{
  v2 = self->_playerItemAccessLog->logArray;
  return v2;
}

@end
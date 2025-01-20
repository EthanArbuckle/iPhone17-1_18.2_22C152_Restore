@interface AVPlayerItemErrorLog
- (AVPlayerItemErrorLog)init;
- (AVPlayerItemErrorLog)initWithLogArray:(id)a3;
- (NSArray)events;
- (NSData)extendedLogData;
- (NSStringEncoding)extendedLogDataStringEncoding;
- (id)_common_init;
- (id)_errorLogArray;
- (id)description;
- (void)dealloc;
@end

@implementation AVPlayerItemErrorLog

- (id)_common_init
{
  v3 = objc_alloc_init(AVPlayerItemErrorLogInternal);
  self->_playerItemErrorLog = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_playerItemErrorLog->logArray = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVPlayerItemErrorLog)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemErrorLog;
  result = [(AVPlayerItemErrorLog *)&v3 init];
  if (result) {
    return (AVPlayerItemErrorLog *)[(AVPlayerItemErrorLog *)result _common_init];
  }
  return result;
}

- (AVPlayerItemErrorLog)initWithLogArray:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemErrorLog;
  v4 = [(AVPlayerItemErrorLog *)&v8 init];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(AVPlayerItemErrorLog *)v4 _common_init];
  v6 = (AVPlayerItemErrorLog *)v5;
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
  [v5 appendFormat:@"\n%@", (id)objc_msgSend([NSString alloc], "initWithData:encoding:", -[AVPlayerItemErrorLog extendedLogData](self, "extendedLogData"), -[AVPlayerItemErrorLog extendedLogDataStringEncoding](self, "extendedLogDataStringEncoding"))];
  return v5;
}

- (void)dealloc
{
  playerItemErrorLog = self->_playerItemErrorLog;
  if (playerItemErrorLog)
  {

    CFRelease(self->_playerItemErrorLog);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemErrorLog;
  [(AVPlayerItemErrorLog *)&v4 dealloc];
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
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_playerItemErrorLog->logArray, "count"));
  if (v3)
  {
    objc_super v4 = (void *)v3;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    logArray = self->_playerItemErrorLog->logArray;
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
          v10 = [[AVPlayerItemErrorLogEvent alloc] initWithDictionary:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
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

- (id)_errorLogArray
{
  v2 = self->_playerItemErrorLog->logArray;
  return v2;
}

@end
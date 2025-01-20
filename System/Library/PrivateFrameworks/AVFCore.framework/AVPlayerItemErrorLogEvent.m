@interface AVPlayerItemErrorLogEvent
- (AVPlayerItemErrorLogEvent)init;
- (AVPlayerItemErrorLogEvent)initWithDictionary:(id)a3;
- (NSDate)date;
- (NSDictionary)allHTTPResponseHeaderFields;
- (NSInteger)errorStatusCode;
- (NSString)URI;
- (NSString)errorComment;
- (NSString)errorDomain;
- (NSString)playbackSessionID;
- (NSString)serverAddress;
- (id)_common_init;
- (void)dealloc;
@end

@implementation AVPlayerItemErrorLogEvent

- (id)_common_init
{
  v3 = objc_alloc_init(AVPlayerItemErrorLogEventInternal);
  self->_playerItemErrorLogEvent = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_playerItemErrorLogEvent->dict = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVPlayerItemErrorLogEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemErrorLogEvent;
  result = [(AVPlayerItemErrorLogEvent *)&v3 init];
  if (result) {
    return (AVPlayerItemErrorLogEvent *)[(AVPlayerItemErrorLogEvent *)result _common_init];
  }
  return result;
}

- (AVPlayerItemErrorLogEvent)initWithDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemErrorLogEvent;
  v4 = [(AVPlayerItemErrorLogEvent *)&v8 init];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(AVPlayerItemErrorLogEvent *)v4 _common_init];
  v6 = (AVPlayerItemErrorLogEvent *)v5;
  if (a3 && v5) {
    *(void *)(*(void *)(v5 + 8) + 8) = a3;
  }
  return v6;
}

- (void)dealloc
{
  playerItemErrorLogEvent = self->_playerItemErrorLogEvent;
  if (playerItemErrorLogEvent)
  {

    CFRelease(self->_playerItemErrorLogEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemErrorLogEvent;
  [(AVPlayerItemErrorLogEvent *)&v4 dealloc];
}

- (NSDate)date
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A08]];
  return (NSDate *)v2;
}

- (NSString)URI
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A38]];
  return (NSString *)v2;
}

- (NSString)serverAddress
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A30]];
  return (NSString *)v2;
}

- (NSString)playbackSessionID
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A28]];
  return (NSString *)v2;
}

- (NSInteger)errorStatusCode
{
  NSInteger result = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A20]];
  if (result)
  {
    return [(id)result integerValue];
  }
  return result;
}

- (NSString)errorDomain
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A18]];
  return (NSString *)v2;
}

- (NSString)errorComment
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A10]];
  return (NSString *)v2;
}

- (NSDictionary)allHTTPResponseHeaderFields
{
  id v2 = [(NSDictionary *)self->_playerItemErrorLogEvent->dict valueForKey:*MEMORY[0x1E4F32A00]];
  return (NSDictionary *)v2;
}

@end
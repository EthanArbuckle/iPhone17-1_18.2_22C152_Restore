@interface AVPlayerItemAccessLogEvent
- (AVPlayerItemAccessLogEvent)init;
- (AVPlayerItemAccessLogEvent)initWithDictionary:(id)a3;
- (NSDate)playbackStartDate;
- (NSInteger)downloadOverdue;
- (NSInteger)mediaRequestsWWAN;
- (NSInteger)numberOfDroppedVideoFrames;
- (NSInteger)numberOfMediaRequests;
- (NSInteger)numberOfServerAddressChanges;
- (NSInteger)numberOfStalls;
- (NSString)URI;
- (NSString)playbackSessionID;
- (NSString)playbackType;
- (NSString)serverAddress;
- (NSTimeInterval)durationWatched;
- (NSTimeInterval)playbackStartOffset;
- (NSTimeInterval)segmentsDownloadedDuration;
- (NSTimeInterval)startupTime;
- (NSTimeInterval)transferDuration;
- (double)averageAudioBitrate;
- (double)averageVideoBitrate;
- (double)currentObservedBitrate;
- (double)indicatedAverageBitrate;
- (double)indicatedBitrate;
- (double)observedBitrate;
- (double)observedBitrateStandardDeviation;
- (double)observedMaxBitrate;
- (double)observedMinBitrate;
- (double)switchBitrate;
- (id)_common_init;
- (id)performanceMetrics;
- (id)serviceIdentifier;
- (int64_t)entryReasonCode;
- (uint64_t)numberOfBytesTransferred;
- (void)dealloc;
@end

@implementation AVPlayerItemAccessLogEvent

- (id)_common_init
{
  v3 = objc_alloc_init(AVPlayerItemAccessLogEventInternal);
  self->_playerItemAccessLogEvent = v3;
  if (v3)
  {
    CFRetain(v3);
    self->_playerItemAccessLogEvent->dict = 0;
  }
  else
  {

    return 0;
  }
  return self;
}

- (AVPlayerItemAccessLogEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemAccessLogEvent;
  result = [(AVPlayerItemAccessLogEvent *)&v3 init];
  if (result) {
    return (AVPlayerItemAccessLogEvent *)[(AVPlayerItemAccessLogEvent *)result _common_init];
  }
  return result;
}

- (AVPlayerItemAccessLogEvent)initWithDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerItemAccessLogEvent;
  v4 = [(AVPlayerItemAccessLogEvent *)&v8 init];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(AVPlayerItemAccessLogEvent *)v4 _common_init];
  v6 = (AVPlayerItemAccessLogEvent *)v5;
  if (a3 && v5) {
    *(void *)(*(void *)(v5 + 8) + 8) = a3;
  }
  return v6;
}

- (void)dealloc
{
  playerItemAccessLogEvent = self->_playerItemAccessLogEvent;
  if (playerItemAccessLogEvent)
  {

    CFRelease(self->_playerItemAccessLogEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemAccessLogEvent;
  [(AVPlayerItemAccessLogEvent *)&v4 dealloc];
}

- (NSInteger)numberOfMediaRequests
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B80]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (NSDate)playbackStartDate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BB8]];
  return (NSDate *)v2;
}

- (NSString)URI
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31C10]];
  return (NSString *)v2;
}

- (NSString)serverAddress
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BD0]];
  return (NSString *)v2;
}

- (NSInteger)numberOfServerAddressChanges
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BD8]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (NSString)playbackSessionID
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BB0]];
  return (NSString *)v2;
}

- (NSTimeInterval)playbackStartOffset
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BC0]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (NSTimeInterval)segmentsDownloadedDuration
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B50]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (NSTimeInterval)durationWatched
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B60]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (NSInteger)numberOfStalls
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BE8]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (uint64_t)numberOfBytesTransferred
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B38]];
  if (!v2) {
    return -1;
  }
  return [v2 longLongValue];
}

- (NSTimeInterval)transferDuration
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31C08]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)observedBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B90]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)currentObservedBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B40]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)indicatedBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B78]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)indicatedAverageBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B70]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)averageVideoBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B30]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)averageAudioBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B28]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (NSInteger)numberOfDroppedVideoFrames
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B58]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (NSTimeInterval)startupTime
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BF8]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (NSInteger)downloadOverdue
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B48]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (int64_t)entryReasonCode
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B68]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (double)observedMaxBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BA0]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)observedMinBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BA8]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (double)observedBitrateStandardDeviation
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B98]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (NSString)playbackType
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BC8]];
  return (NSString *)v2;
}

- (NSInteger)mediaRequestsWWAN
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31B88]];
  if (!v2) {
    return -1;
  }
  return [v2 integerValue];
}

- (double)switchBitrate
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31C00]];
  if (!v2) {
    return -1.0;
  }
  [v2 doubleValue];
  return result;
}

- (id)performanceMetrics
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BF0]];
  return v2;
}

- (id)serviceIdentifier
{
  id v2 = [(NSDictionary *)self->_playerItemAccessLogEvent->dict valueForKey:*MEMORY[0x1E4F31BE0]];
  return v2;
}

@end
@interface MPMovieAccessLogEvent
- (NSDate)playbackStartDate;
- (NSInteger)numberOfDroppedVideoFrames;
- (NSInteger)numberOfStalls;
- (NSString)URI;
- (NSString)playbackSessionID;
- (NSString)serverAddress;
- (NSTimeInterval)durationWatched;
- (NSTimeInterval)playbackStartOffset;
- (NSTimeInterval)segmentsDownloadedDuration;
- (NSUInteger)numberOfSegmentsDownloaded;
- (NSUInteger)numberOfServerAddressChanges;
- (double)indicatedBitrate;
- (double)observedBitrate;
- (id)_initWithAVItemAccessLogEvent:(id)a3;
- (int64_t)numberOfBytesTransferred;
@end

@implementation MPMovieAccessLogEvent

- (void).cxx_destruct
{
}

- (NSInteger)numberOfDroppedVideoFrames
{
  return [(AVPlayerItemAccessLogEvent *)self->_event numberOfDroppedVideoFrames];
}

- (double)indicatedBitrate
{
  [(AVPlayerItemAccessLogEvent *)self->_event indicatedBitrate];
  return result;
}

- (double)observedBitrate
{
  [(AVPlayerItemAccessLogEvent *)self->_event observedBitrate];
  return result;
}

- (int64_t)numberOfBytesTransferred
{
  return [(AVPlayerItemAccessLogEvent *)self->_event numberOfBytesTransferred];
}

- (NSInteger)numberOfStalls
{
  return [(AVPlayerItemAccessLogEvent *)self->_event numberOfStalls];
}

- (NSTimeInterval)durationWatched
{
  [(AVPlayerItemAccessLogEvent *)self->_event durationWatched];
  return result;
}

- (NSTimeInterval)segmentsDownloadedDuration
{
  [(AVPlayerItemAccessLogEvent *)self->_event segmentsDownloadedDuration];
  return result;
}

- (NSTimeInterval)playbackStartOffset
{
  [(AVPlayerItemAccessLogEvent *)self->_event playbackStartOffset];
  return result;
}

- (NSString)playbackSessionID
{
  return [(AVPlayerItemAccessLogEvent *)self->_event playbackSessionID];
}

- (NSUInteger)numberOfServerAddressChanges
{
  return [(AVPlayerItemAccessLogEvent *)self->_event numberOfServerAddressChanges];
}

- (NSString)serverAddress
{
  return [(AVPlayerItemAccessLogEvent *)self->_event serverAddress];
}

- (NSString)URI
{
  return [(AVPlayerItemAccessLogEvent *)self->_event URI];
}

- (NSDate)playbackStartDate
{
  return [(AVPlayerItemAccessLogEvent *)self->_event playbackStartDate];
}

- (NSUInteger)numberOfSegmentsDownloaded
{
  return [(AVPlayerItemAccessLogEvent *)self->_event numberOfMediaRequests];
}

- (id)_initWithAVItemAccessLogEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMovieAccessLogEvent;
  v6 = [(MPMovieAccessLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

@end
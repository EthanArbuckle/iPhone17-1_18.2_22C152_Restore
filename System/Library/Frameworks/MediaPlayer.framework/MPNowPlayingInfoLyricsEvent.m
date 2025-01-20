@interface MPNowPlayingInfoLyricsEvent
- (MPNowPlayingInfoLyricsEvent)initWithMediaRemoteLyricsEvent:(void *)a3;
- (MPNowPlayingInfoLyricsItemToken)token;
- (NSDate)endDate;
- (NSDate)startDate;
- (void)dealloc;
- (void)mediaRemoteLyricsEvent;
@end

@implementation MPNowPlayingInfoLyricsEvent

- (void)mediaRemoteLyricsEvent
{
  return self->_mediaRemoteLyricsEvent;
}

- (MPNowPlayingInfoLyricsItemToken)token
{
  v2 = [[MPNowPlayingInfoLyricsItemToken alloc] initWithMediaRemoteLyricsItemToken:MRLyricsEventGetToken()];

  return v2;
}

- (NSDate)endDate
{
  return (NSDate *)MEMORY[0x1F412E430](self->_mediaRemoteLyricsEvent, a2);
}

- (NSDate)startDate
{
  return (NSDate *)MEMORY[0x1F412E438](self->_mediaRemoteLyricsEvent, a2);
}

- (void)dealloc
{
  mediaRemoteLyricsEvent = self->_mediaRemoteLyricsEvent;
  if (mediaRemoteLyricsEvent) {
    CFRelease(mediaRemoteLyricsEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLyricsEvent;
  [(MPNowPlayingInfoLyricsEvent *)&v4 dealloc];
}

- (MPNowPlayingInfoLyricsEvent)initWithMediaRemoteLyricsEvent:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPNowPlayingInfoLyricsEvent;
  objc_super v4 = [(MPNowPlayingInfoLyricsEvent *)&v6 init];
  if (v4) {
    v4->_mediaRemoteLyricsEvent = (void *)CFRetain(a3);
  }
  return v4;
}

@end
@interface MPNowPlayingInfoLyricsItemToken
- (MPNowPlayingInfoLyricsItemToken)initWithIdentifier:(id)a3 userInfo:(id)a4;
- (MPNowPlayingInfoLyricsItemToken)initWithMediaRemoteLyricsItemToken:(void *)a3;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (void)dealloc;
- (void)mediaRemoteLyricsItemToken;
@end

@implementation MPNowPlayingInfoLyricsItemToken

- (void)mediaRemoteLyricsItemToken
{
  return self->_mediaRemoteLyricsItemToken;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MEMORY[0x1F412E478](self->_mediaRemoteLyricsItemToken, a2);
}

- (NSString)identifier
{
  return (NSString *)MEMORY[0x1F412E470](self->_mediaRemoteLyricsItemToken, a2);
}

- (void)dealloc
{
  mediaRemoteLyricsItemToken = self->_mediaRemoteLyricsItemToken;
  if (mediaRemoteLyricsItemToken) {
    CFRelease(mediaRemoteLyricsItemToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLyricsItemToken;
  [(MPNowPlayingInfoLyricsItemToken *)&v4 dealloc];
}

- (MPNowPlayingInfoLyricsItemToken)initWithMediaRemoteLyricsItemToken:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPNowPlayingInfoLyricsItemToken;
  objc_super v4 = [(MPNowPlayingInfoLyricsItemToken *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->_mediaRemoteLyricsItemToken = (void *)CFRetain(a3);
  }
  return v5;
}

- (MPNowPlayingInfoLyricsItemToken)initWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MPNowPlayingInfoLyricsItemToken;
  v8 = [(MPNowPlayingInfoLyricsItemToken *)&v10 init];
  if (v8) {
    v8->_mediaRemoteLyricsItemToken = (void *)MRLyricsItemTokenCreate();
  }

  return v8;
}

@end
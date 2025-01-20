@interface MPNowPlayingInfoLyricsItem
- (BOOL)userProvided;
- (MPNowPlayingInfoLyricsItem)initWithLyrics:(id)a3 userProvided:(BOOL)a4;
- (MPNowPlayingInfoLyricsItem)initWithLyrics:(id)a3 userProvided:(BOOL)a4 token:(id)a5;
- (MPNowPlayingInfoLyricsItem)initWithMediaRemoteLyricsItem:(void *)a3;
- (MPNowPlayingInfoLyricsItemToken)token;
- (NSString)lyrics;
- (void)dealloc;
- (void)mediaRemoteLyricsItem;
@end

@implementation MPNowPlayingInfoLyricsItem

- (MPNowPlayingInfoLyricsItem)initWithMediaRemoteLyricsItem:(void *)a3
{
  v3 = (MPNowPlayingInfoLyricsItem *)a3;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)MPNowPlayingInfoLyricsItem;
    v4 = [(MPNowPlayingInfoLyricsItem *)&v6 init];
    if (v4) {
      v4->_mediaRemoteLyricsItem = (void *)CFRetain(v3);
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)dealloc
{
  mediaRemoteLyricsItem = self->_mediaRemoteLyricsItem;
  if (mediaRemoteLyricsItem) {
    CFRelease(mediaRemoteLyricsItem);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPNowPlayingInfoLyricsItem;
  [(MPNowPlayingInfoLyricsItem *)&v4 dealloc];
}

- (void)mediaRemoteLyricsItem
{
  return self->_mediaRemoteLyricsItem;
}

- (MPNowPlayingInfoLyricsItem)initWithLyrics:(id)a3 userProvided:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [[MPNowPlayingInfoLyricsItem alloc] initWithLyrics:v6 userProvided:v4 token:0];

  return v7;
}

- (MPNowPlayingInfoLyricsItem)initWithLyrics:(id)a3 userProvided:(BOOL)a4 token:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MPNowPlayingInfoLyricsItem;
  v9 = [(MPNowPlayingInfoLyricsItem *)&v11 init];
  if (v9)
  {
    [v8 mediaRemoteLyricsItemToken];
    v9->_mediaRemoteLyricsItem = (void *)MRLyricsItemCreate();
  }

  return v9;
}

- (MPNowPlayingInfoLyricsItemToken)token
{
  v2 = [[MPNowPlayingInfoLyricsItemToken alloc] initWithMediaRemoteLyricsItemToken:MRLyricsItemGetToken()];

  return v2;
}

- (BOOL)userProvided
{
}

- (NSString)lyrics
{
  return (NSString *)MEMORY[0x1F412E450](self->_mediaRemoteLyricsItem, a2);
}

@end
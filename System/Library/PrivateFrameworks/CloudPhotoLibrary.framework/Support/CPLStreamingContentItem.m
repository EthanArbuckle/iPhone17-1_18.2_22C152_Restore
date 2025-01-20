@interface CPLStreamingContentItem
- (NSData)mediaItemMakerData;
- (NSURL)streamingURL;
- (void)setMediaItemMakerData:(id)a3;
- (void)setStreamingURL:(id)a3;
@end

@implementation CPLStreamingContentItem

- (NSURL)streamingURL
{
  return self->_streamingURL;
}

- (void)setStreamingURL:(id)a3
{
}

- (NSData)mediaItemMakerData
{
  return self->_mediaItemMakerData;
}

- (void)setMediaItemMakerData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemMakerData, 0);
  objc_storeStrong((id *)&self->_streamingURL, 0);
}

@end
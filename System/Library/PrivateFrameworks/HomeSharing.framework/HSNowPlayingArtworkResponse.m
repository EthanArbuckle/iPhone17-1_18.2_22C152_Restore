@interface HSNowPlayingArtworkResponse
- (NSData)artworkData;
- (NSString)artworkMIMEType;
- (void)setArtworkData:(id)a3;
- (void)setArtworkMIMEType:(id)a3;
@end

@implementation HSNowPlayingArtworkResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
}

- (void)setArtworkMIMEType:(id)a3
{
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (void)setArtworkData:(id)a3
{
}

- (NSData)artworkData
{
  return self->_artworkData;
}

@end
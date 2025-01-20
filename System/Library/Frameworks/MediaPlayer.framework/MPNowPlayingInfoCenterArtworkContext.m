@interface MPNowPlayingInfoCenterArtworkContext
- (MPMediaItemArtwork)artwork;
- (NSData)artworkData;
- (NSString)artworkIdentifier;
- (void)setArtwork:(id)a3;
- (void)setArtworkData:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
@end

@implementation MPNowPlayingInfoCenterArtworkContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

- (void)setArtworkData:(id)a3
{
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtwork:(id)a3
{
}

- (MPMediaItemArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

@end
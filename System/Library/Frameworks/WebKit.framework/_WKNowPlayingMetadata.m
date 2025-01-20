@interface _WKNowPlayingMetadata
- (NSString)album;
- (NSString)artist;
- (NSString)sourceApplicationIdentifier;
- (NSString)title;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setSourceApplicationIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _WKNowPlayingMetadata

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
}

@end
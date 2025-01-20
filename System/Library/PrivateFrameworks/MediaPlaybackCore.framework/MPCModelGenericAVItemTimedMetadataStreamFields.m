@interface MPCModelGenericAVItemTimedMetadataStreamFields
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitContent;
- (NSArray)artworkDictionaries;
- (NSString)album;
- (NSString)artist;
- (NSString)title;
- (unint64_t)hash;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtworkDictionaries:(id)a3;
- (void)setExplicitContent:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation MPCModelGenericAVItemTimedMetadataStreamFields

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDictionaries, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setArtworkDictionaries:(id)a3
{
}

- (NSArray)artworkDictionaries
{
  return self->_artworkDictionaries;
}

- (void)setExplicitContent:(BOOL)a3
{
  self->_explicitContent = a3;
}

- (BOOL)isExplicitContent
{
  return self->_explicitContent;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setArtist:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPCModelGenericAVItemTimedMetadataStreamFields *)a3;
  if (v4 == self) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (album = self->_album, album != v4->_album) && !-[NSString isEqual:](album, "isEqual:")
    || (title = self->_title, title != v4->_title) && !-[NSString isEqual:](title, "isEqual:")
    || (artist = self->_artist, artist != v4->_artist) && !-[NSString isEqual:](artist, "isEqual:")
    || self->_explicitContent != v4->_explicitContent)
  {
    char v9 = 0;
    goto LABEL_14;
  }
  artworkDictionaries = self->_artworkDictionaries;
  if (artworkDictionaries == v4->_artworkDictionaries)
  {
LABEL_13:
    char v9 = 1;
    goto LABEL_14;
  }
  char v9 = -[NSArray isEqual:](artworkDictionaries, "isEqual:");
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_album hash];
  NSUInteger v4 = [(NSString *)self->_artist hash] ^ v3;
  BOOL explicitContent = self->_explicitContent;
  NSUInteger v6 = v4 ^ explicitContent ^ [(NSString *)self->_title hash];
  return v6 ^ [(NSArray *)self->_artworkDictionaries hash];
}

@end
@interface APRKMetadata
- (APRKMetadata)initWithDictionary:(id)a3;
- (NSString)album;
- (NSString)artist;
- (NSString)artworkDataInBase64;
- (NSString)artworkMIMEType;
- (NSString)title;
- (id)description;
- (int64_t)totalTrackCount;
- (int64_t)trackNumber;
- (void)updateMedatataWithDictionary:(id)a3;
@end

@implementation APRKMetadata

- (APRKMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)APRKMetadata;
    v5 = [(APRKMetadata *)&v9 init];
    v6 = v5;
    if (v5) {
      [(APRKMetadata *)v5 updateMedatataWithDictionary:v4];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Title = %@\nAlbum = %@\nArtist = %@\nArtwork = %@\nArtworkMIMEType = %@\nTotalTrackCount = %lu\nTrackNumber = %lu", self->_title, self->_artist, self->_album, self->_artworkDataInBase64, self->_artworkMIMEType, self->_totalTrackCount, self->_trackNumber];
}

- (void)updateMedatataWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    v5 = [v4 objectForKey:@"Album"];
    if (v5) {
      objc_storeStrong((id *)&self->_album, v5);
    }
    v6 = [v12 objectForKey:@"Artist"];

    if (v6) {
      objc_storeStrong((id *)&self->_artist, v6);
    }
    v7 = [v12 objectForKey:@"ArtworkData"];

    if (v7) {
      objc_storeStrong((id *)&self->_artworkDataInBase64, v7);
    }
    v8 = [v12 objectForKey:@"ArtworkMIMEType"];

    if (v8) {
      objc_storeStrong((id *)&self->_artworkMIMEType, v8);
    }
    objc_super v9 = [v12 objectForKey:@"Title"];

    if (v9) {
      objc_storeStrong((id *)&self->_title, v9);
    }
    v10 = [v12 objectForKey:@"TotalTrackCount"];

    if (v10) {
      self->_totalTrackCount = [v10 integerValue];
    }
    v11 = [v12 objectForKey:@"TrackNumber"];

    if (v11) {
      self->_trackNumber = [v11 integerValue];
    }

    id v4 = v12;
  }
}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)artworkDataInBase64
{
  return self->_artworkDataInBase64;
}

- (NSString)artworkMIMEType
{
  return self->_artworkMIMEType;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)totalTrackCount
{
  return self->_totalTrackCount;
}

- (int64_t)trackNumber
{
  return self->_trackNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artworkMIMEType, 0);
  objc_storeStrong((id *)&self->_artworkDataInBase64, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

@end
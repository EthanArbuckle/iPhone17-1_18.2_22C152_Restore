@interface CLSNowPlayingStreamEventMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventMetadata:(id)a3;
- (CLSNowPlayingStreamEventMetadata)initWithDuetKnowledgeEvent:(id)a3;
- (NSNumber)durationInSeconds;
- (NSSet)genres;
- (NSString)album;
- (NSString)artist;
- (NSString)source;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setDurationInSeconds:(id)a3;
- (void)setGenres:(id)a3;
- (void)setSource:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CLSNowPlayingStreamEventMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_durationInSeconds, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setGenres:(id)a3
{
}

- (NSSet)genres
{
  return self->_genres;
}

- (void)setDurationInSeconds:(id)a3
{
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setArtist:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (BOOL)isEqualToEventMetadata:(id)a3
{
  v4 = (CLSNowPlayingStreamEventMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    v6 = [(CLSNowPlayingStreamEventMetadata *)v4 album];
    v7 = [(CLSNowPlayingStreamEventMetadata *)self album];
    int v8 = [v6 isEqualToString:v7];

    if (!v8) {
      goto LABEL_6;
    }
    v9 = [(CLSNowPlayingStreamEventMetadata *)v5 artist];
    v10 = [(CLSNowPlayingStreamEventMetadata *)self artist];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_6;
    }
    v12 = [(CLSNowPlayingStreamEventMetadata *)v5 title];
    v13 = [(CLSNowPlayingStreamEventMetadata *)self title];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      v15 = [(CLSNowPlayingStreamEventMetadata *)v5 genres];
      v16 = [(CLSNowPlayingStreamEventMetadata *)self genres];
      char v17 = [v15 isEqualToSet:v16];
    }
    else
    {
LABEL_6:
      char v17 = 0;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSNowPlayingStreamEventMetadata *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CLSNowPlayingStreamEventMetadata *)self isEqualToEventMetadata:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(CLSNowPlayingStreamEventMetadata *)self album];
  uint64_t v4 = [v3 hash];

  BOOL v5 = [(CLSNowPlayingStreamEventMetadata *)self artist];
  uint64_t v6 = [v5 hash] + 37 * v4;

  v7 = [(CLSNowPlayingStreamEventMetadata *)self title];
  uint64_t v8 = [v7 hash] + 37 * v6;

  v9 = [(CLSNowPlayingStreamEventMetadata *)self genres];
  uint64_t v10 = [v9 hash] + 37 * v8;

  int v11 = [(CLSNowPlayingStreamEventMetadata *)self source];
  unint64_t v12 = [v11 hash] + 37 * v10 + 1178847269;

  return v12;
}

- (id)description
{
  v16 = NSString;
  v3 = [(CLSNowPlayingStreamEventMetadata *)self album];
  uint64_t v4 = [(CLSNowPlayingStreamEventMetadata *)self artist];
  BOOL v5 = [(CLSNowPlayingStreamEventMetadata *)self title];
  uint64_t v6 = [(CLSNowPlayingStreamEventMetadata *)self genres];
  v7 = [v6 allObjects];
  uint64_t v8 = [v7 componentsJoinedByString:@"/"];
  v9 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v10 = [(CLSNowPlayingStreamEventMetadata *)self durationInSeconds];
  [v10 doubleValue];
  unint64_t v12 = [v9 numberWithDouble:v11 / 60.0];
  v13 = [(CLSNowPlayingStreamEventMetadata *)self source];
  int v14 = [v16 stringWithFormat:@"(%p) album: %@, artist: %@, title: %@, genre: %@, duration: %@ minutes, source: %@", self, v3, v4, v5, v8, v12, v13];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CLSNowPlayingStreamEventMetadata);
  BOOL v5 = [(CLSNowPlayingStreamEventMetadata *)self album];
  [(CLSNowPlayingStreamEventMetadata *)v4 setAlbum:v5];

  uint64_t v6 = [(CLSNowPlayingStreamEventMetadata *)self artist];
  [(CLSNowPlayingStreamEventMetadata *)v4 setArtist:v6];

  v7 = [(CLSNowPlayingStreamEventMetadata *)self title];
  [(CLSNowPlayingStreamEventMetadata *)v4 setTitle:v7];

  uint64_t v8 = [(CLSNowPlayingStreamEventMetadata *)self durationInSeconds];
  [(CLSNowPlayingStreamEventMetadata *)v4 setDurationInSeconds:v8];

  v9 = [(CLSNowPlayingStreamEventMetadata *)self genres];
  uint64_t v10 = (void *)[v9 copy];
  [(CLSNowPlayingStreamEventMetadata *)v4 setGenres:v10];

  double v11 = [(CLSNowPlayingStreamEventMetadata *)self source];
  [(CLSNowPlayingStreamEventMetadata *)v4 setSource:v11];

  return v4;
}

- (CLSNowPlayingStreamEventMetadata)initWithDuetKnowledgeEvent:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSNowPlayingStreamEventMetadata;
  BOOL v5 = [(CLSNowPlayingStreamEventMetadata *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "cls_album");
    album = v5->_album;
    v5->_album = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "cls_artist");
    artist = v5->_artist;
    v5->_artist = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "cls_title");
    title = v5->_title;
    v5->_title = (NSString *)v10;

    unint64_t v12 = objc_msgSend(v4, "cls_genre");
    if (v12) {
      [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    }
    else {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    }
    genres = v5->_genres;
    v5->_genres = (NSSet *)v13;

    uint64_t v15 = objc_msgSend(v4, "cls_durationInSeconds");
    durationInSeconds = v5->_durationInSeconds;
    v5->_durationInSeconds = (NSNumber *)v15;

    uint64_t v17 = objc_msgSend(v4, "cls_identifier");
    source = v5->_source;
    v5->_source = (NSString *)v17;
  }
  return v5;
}

@end
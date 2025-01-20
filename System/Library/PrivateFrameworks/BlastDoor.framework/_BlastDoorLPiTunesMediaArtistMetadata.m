@interface _BlastDoorLPiTunesMediaArtistMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)genre;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (_BlastDoorLPArtworkMetadata)artworkMetadata;
- (_BlastDoorLPImage)artwork;
- (_BlastDoorLPiTunesMediaArtistMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setGenre:(id)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaArtistMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaArtistMetadata)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPiTunesMediaArtistMetadata;
  v5 = [(_BlastDoorLPiTunesMediaArtistMetadata *)&v20 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"genre");
    genre = v5->_genre;
    v5->_genre = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v14;

    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  storeFrontIdentifier = self->_storeFrontIdentifier;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_genre, @"genre");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiTunesMediaArtistMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaArtistMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaArtistMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaArtistMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaArtistMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaArtistMetadata *)self name];
    [(_BlastDoorLPiTunesMediaArtistMetadata *)v4 setName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaArtistMetadata *)self genre];
    [(_BlastDoorLPiTunesMediaArtistMetadata *)v4 setGenre:v8];

    v9 = [(_BlastDoorLPiTunesMediaArtistMetadata *)self artwork];
    [(_BlastDoorLPiTunesMediaArtistMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaArtistMetadata *)self artworkMetadata];
    [(_BlastDoorLPiTunesMediaArtistMetadata *)v4 setArtworkMetadata:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_BlastDoorLPiTunesMediaArtistMetadata;
  if ([(_BlastDoorLPiTunesMediaArtistMetadata *)&v14 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | (unint64_t)self->_storeFrontIdentifier && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[3], v8 | (unint64_t)self->_storeIdentifier)
        && !objc_msgSend((id)v8, "isEqual:")
        || (unint64_t v9 = v6[4], v9 | (unint64_t)self->_name) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_genre) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_artwork) && !objc_msgSend((id)v11, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v12 = v6[7];
        if (v12 | (unint64_t)self->_artworkMetadata) {
          char v5 = objc_msgSend((id)v12, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_storeIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"genre", @"artwork", @"artworkMetadata", 0);
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (_BlastDoorLPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (_BlastDoorLPArtworkMetadata)artworkMetadata
{
  return self->_artworkMetadata;
}

- (void)setArtworkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
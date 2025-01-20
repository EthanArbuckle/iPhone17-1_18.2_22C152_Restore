@interface _BlastDoorLPiTunesMediaPodcastMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSArray)offers;
- (NSString)artist;
- (NSString)name;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (_BlastDoorLPArtworkMetadata)artworkMetadata;
- (_BlastDoorLPImage)artwork;
- (_BlastDoorLPiTunesMediaPodcastMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaPodcastMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaPodcastMetadata)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_BlastDoorLPiTunesMediaPodcastMetadata;
  v5 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)&v22 init];
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

    uint64_t v12 = decodeStringForKey(v4, @"artist");
    artist = v5->_artist;
    v5->_artist = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v14;

    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v16;

    uint64_t v18 = decodeArrayOfStringsForKey(v4);
    offers = v5->_offers;
    v5->_offers = (NSArray *)v18;

    v20 = v5;
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
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artist, @"artist");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v5, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, @"offers");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiTunesMediaPodcastMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self name];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self artist];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setArtist:v8];

    v9 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self artwork];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self artworkMetadata];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setArtworkMetadata:v10];

    v11 = [(_BlastDoorLPiTunesMediaPodcastMetadata *)self offers];
    [(_BlastDoorLPiTunesMediaPodcastMetadata *)v4 setOffers:v11];

    uint64_t v12 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_BlastDoorLPiTunesMediaPodcastMetadata;
  if ([(_BlastDoorLPiTunesMediaPodcastMetadata *)&v15 isEqual:v4])
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
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_artist) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_artwork) && !objc_msgSend((id)v11, "isEqual:")
        || (unint64_t v12 = v6[7], v12 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v12, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v13 = v6[8];
        if (v13 | (unint64_t)self->_offers) {
          char v5 = objc_msgSend((id)v13, "isEqual:");
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"artist", @"artwork", @"artworkMetadata", @"offers", 0);
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

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
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

- (NSArray)offers
{
  return self->_offers;
}

- (void)setOffers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offers, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
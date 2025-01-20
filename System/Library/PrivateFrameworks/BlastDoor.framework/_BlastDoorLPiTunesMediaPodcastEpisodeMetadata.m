@interface _BlastDoorLPiTunesMediaPodcastEpisodeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSArray)offers;
- (NSDate)releaseDate;
- (NSString)artist;
- (NSString)episodeName;
- (NSString)podcastName;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (_BlastDoorLPArtworkMetadata)artworkMetadata;
- (_BlastDoorLPImage)artwork;
- (_BlastDoorLPiTunesMediaPodcastEpisodeMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setEpisodeName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setPodcastName:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation _BlastDoorLPiTunesMediaPodcastEpisodeMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPiTunesMediaPodcastEpisodeMetadata)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_BlastDoorLPiTunesMediaPodcastEpisodeMetadata;
  v5 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)&v26 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"episodeName");
    episodeName = v5->_episodeName;
    v5->_episodeName = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"podcastName");
    podcastName = v5->_podcastName;
    v5->_podcastName = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"artist");
    artist = v5->_artist;
    v5->_artist = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"releaseDate");
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v16;

    uint64_t v18 = objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (_BlastDoorLPImage *)v18;

    uint64_t v20 = objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (_BlastDoorLPArtworkMetadata *)v20;

    uint64_t v22 = decodeArrayOfStringsForKey(v4);
    offers = v5->_offers;
    v5->_offers = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  storeFrontIdentifier = self->_storeFrontIdentifier;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_episodeName, @"episodeName");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_podcastName, @"podcastName");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artist, @"artist");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_releaseDate, @"releaseDate");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v5, "_bd_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, @"offers");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPiTunesMediaPodcastEpisodeMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self storeFrontIdentifier];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self storeIdentifier];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self episodeName];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setEpisodeName:v7];

    uint64_t v8 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self podcastName];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setPodcastName:v8];

    v9 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self artist];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setArtist:v9];

    uint64_t v10 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self releaseDate];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setReleaseDate:v10];

    v11 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self artwork];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setArtwork:v11];

    uint64_t v12 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self artworkMetadata];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setArtworkMetadata:v12];

    v13 = [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)self offers];
    [(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)v4 setOffers:v13];

    uint64_t v14 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_BlastDoorLPiTunesMediaPodcastEpisodeMetadata;
  if ([(_BlastDoorLPiTunesMediaPodcastEpisodeMetadata *)&v17 isEqual:v4])
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
        || (unint64_t v9 = v6[4], v9 | (unint64_t)self->_episodeName) && !objc_msgSend((id)v9, "isEqual:")
        || (unint64_t v10 = v6[5], v10 | (unint64_t)self->_podcastName) && !objc_msgSend((id)v10, "isEqual:")
        || (unint64_t v11 = v6[6], v11 | (unint64_t)self->_artist) && !objc_msgSend((id)v11, "isEqual:")
        || (unint64_t v12 = v6[7], v12 | (unint64_t)self->_releaseDate) && !objc_msgSend((id)v12, "isEqual:")
        || (unint64_t v13 = v6[8], v13 | (unint64_t)self->_artwork) && !objc_msgSend((id)v13, "isEqual:")
        || (unint64_t v14 = v6[9], v14 | (unint64_t)self->_artworkMetadata)
        && !objc_msgSend((id)v14, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v15 = v6[10];
        if (v15 | (unint64_t)self->_offers) {
          char v5 = objc_msgSend((id)v15, "isEqual:");
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"episodeName", @"podcastName", @"artist", @"releaseDate", @"artwork", @"artworkMetadata", @"offers", 0);
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

- (NSString)episodeName
{
  return self->_episodeName;
}

- (void)setEpisodeName:(id)a3
{
}

- (NSString)podcastName
{
  return self->_podcastName;
}

- (void)setPodcastName:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
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
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_podcastName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end
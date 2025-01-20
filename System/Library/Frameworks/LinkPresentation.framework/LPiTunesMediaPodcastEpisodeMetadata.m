@interface LPiTunesMediaPodcastEpisodeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaPodcastEpisodeMetadata)initWithCoder:(id)a3;
- (NSArray)offers;
- (NSDate)releaseDate;
- (NSString)artist;
- (NSString)episodeName;
- (NSString)podcastName;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)storeIdentifierForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
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

@implementation LPiTunesMediaPodcastEpisodeMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaPodcastEpisodeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)LPiTunesMediaPodcastEpisodeMetadata;
  v5 = [(LPiTunesMediaPodcastEpisodeMetadata *)&v26 init];
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

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"releaseDate");
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v16;

    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v18;

    uint64_t v20 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v20;

    uint64_t v22 = decodeArrayOfStringsForKey(v4);
    offers = v5->_offers;
    v5->_offers = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_episodeName, @"episodeName");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_podcastName, @"podcastName");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_artist, @"artist");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_releaseDate, @"releaseDate");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, @"offers");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaPodcastEpisodeMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaPodcastEpisodeMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaPodcastEpisodeMetadata *)self storeIdentifier];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaPodcastEpisodeMetadata *)self episodeName];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setEpisodeName:v7];

    uint64_t v8 = [(LPiTunesMediaPodcastEpisodeMetadata *)self podcastName];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setPodcastName:v8];

    v9 = [(LPiTunesMediaPodcastEpisodeMetadata *)self artist];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setArtist:v9];

    uint64_t v10 = [(LPiTunesMediaPodcastEpisodeMetadata *)self releaseDate];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setReleaseDate:v10];

    v11 = [(LPiTunesMediaPodcastEpisodeMetadata *)self artwork];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setArtwork:v11];

    uint64_t v12 = [(LPiTunesMediaPodcastEpisodeMetadata *)self artworkMetadata];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setArtworkMetadata:v12];

    v13 = [(LPiTunesMediaPodcastEpisodeMetadata *)self offers];
    [(LPiTunesMediaPodcastEpisodeMetadata *)v4 setOffers:v13];

    uint64_t v14 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaPodcastEpisodeMetadata;
  if ([(LPiTunesMediaPodcastEpisodeMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_storeFrontIdentifier) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeIdentifier)
        && objectsAreEqual_0(v6[4], self->_episodeName)
        && objectsAreEqual_0(v6[5], self->_podcastName)
        && objectsAreEqual_0(v6[6], self->_artist)
        && objectsAreEqual_0(v6[7], self->_releaseDate)
        && objectsAreEqual_0(v6[8], self->_artwork)
        && objectsAreEqual_0(v6[9], self->_artworkMetadata))
      {
        char v5 = objectsAreEqual_0(v6[10], self->_offers);
      }
      else
      {
        char v5 = 0;
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

- (LPImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (LPArtworkMetadata)artworkMetadata
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

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:19];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateStyle:3];
  v7 = [(LPiTunesMediaPodcastEpisodeMetadata *)self releaseDate];
  objc_super v8 = [v6 stringFromDate:v7];

  v9 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v9];

  uint64_t v10 = [(LPiTunesMediaPodcastEpisodeMetadata *)self episodeName];
  v11 = [(LPiTunesMediaPodcastEpisodeMetadata *)self podcastName];
  uint64_t v12 = joinedByDot(v11, v8);
  v13 = LPLocalizedString(@" Podcasts");
  populateCaptionBar(v5, v10, v12, v13, 0, v4);

  uint64_t v14 = [(LPiTunesMediaPodcastEpisodeMetadata *)self artwork];
  [v4 _populateProperties:v5 withPrimaryImage:v14];

  v15 = [(LPiTunesMediaPodcastEpisodeMetadata *)self storeIdentifier];
  uint64_t v16 = [(LPiTunesMediaPodcastEpisodeMetadata *)self storeFrontIdentifier];
  v17 = [(LPiTunesMediaPodcastEpisodeMetadata *)self offers];
  uint64_t v18 = +[LPInlineMediaPlaybackInformation podcastEpisodePlaybackInformationWithStoreIdentifier:v15 storefrontIdentifier:v16 offers:v17];

  [v5 setInlinePlaybackInformation:v18];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  char v5 = LPLocalizedString(@"Podcast: %@ – %@");
  id v6 = [(LPiTunesMediaPodcastEpisodeMetadata *)self episodeName];
  v7 = [(LPiTunesMediaPodcastEpisodeMetadata *)self podcastName];
  objc_super v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v6 = a3;
  id v4 = [(LPiTunesMediaPodcastEpisodeMetadata *)self episodeName];
  [v6 setTitle:v4];

  char v5 = [(LPiTunesMediaPodcastEpisodeMetadata *)self artwork];
  [v6 setIcon:v5];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaPodcastEpisodeMetadata *)self storeIdentifier];

  return v3;
}

@end
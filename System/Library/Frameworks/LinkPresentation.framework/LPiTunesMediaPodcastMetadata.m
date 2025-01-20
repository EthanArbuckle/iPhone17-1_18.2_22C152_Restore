@interface LPiTunesMediaPodcastMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaPodcastMetadata)initWithCoder:(id)a3;
- (NSArray)offers;
- (NSString)artist;
- (NSString)name;
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
- (void)setName:(id)a3;
- (void)setOffers:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaPodcastMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaPodcastMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LPiTunesMediaPodcastMetadata;
  v5 = [(LPiTunesMediaPodcastMetadata *)&v22 init];
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

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v14;

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v16;

    uint64_t v18 = decodeArrayOfStringsForKey(v4);
    offers = v5->_offers;
    v5->_offers = (NSArray *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_artist, @"artist");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_offers, @"offers");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaPodcastMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaPodcastMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaPodcastMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaPodcastMetadata *)self storeIdentifier];
    [(LPiTunesMediaPodcastMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaPodcastMetadata *)self name];
    [(LPiTunesMediaPodcastMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaPodcastMetadata *)self artist];
    [(LPiTunesMediaPodcastMetadata *)v4 setArtist:v8];

    v9 = [(LPiTunesMediaPodcastMetadata *)self artwork];
    [(LPiTunesMediaPodcastMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(LPiTunesMediaPodcastMetadata *)self artworkMetadata];
    [(LPiTunesMediaPodcastMetadata *)v4 setArtworkMetadata:v10];

    v11 = [(LPiTunesMediaPodcastMetadata *)self offers];
    [(LPiTunesMediaPodcastMetadata *)v4 setOffers:v11];

    uint64_t v12 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaPodcastMetadata;
  if ([(LPiTunesMediaPodcastMetadata *)&v8 isEqual:v4])
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
        && objectsAreEqual_0(v6[4], self->_name)
        && objectsAreEqual_0(v6[5], self->_artist)
        && objectsAreEqual_0(v6[6], self->_artwork)
        && objectsAreEqual_0(v6[7], self->_artworkMetadata))
      {
        char v5 = objectsAreEqual_0(v6[8], self->_offers);
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
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:20];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [(LPiTunesMediaPodcastMetadata *)self name];
  objc_super v8 = [(LPiTunesMediaPodcastMetadata *)self artist];
  v9 = LPLocalizedString(@" Podcasts");
  populateCaptionBar(v5, v7, v8, v9, 1, v4);

  uint64_t v10 = [(LPiTunesMediaPodcastMetadata *)self artwork];
  [v4 _populateProperties:v5 withPrimaryImage:v10];

  v11 = [(LPiTunesMediaPodcastMetadata *)self storeIdentifier];
  uint64_t v12 = [(LPiTunesMediaPodcastMetadata *)self storeFrontIdentifier];
  v13 = [(LPiTunesMediaPodcastMetadata *)self offers];
  uint64_t v14 = +[LPInlineMediaPlaybackInformation podcastPlaybackInformationWithStoreIdentifier:v11 storefrontIdentifier:v12 offers:v13];

  [v5 setInlinePlaybackInformation:v14];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  char v5 = LPLocalizedString(@"Podcast: %@");
  uint64_t v6 = [(LPiTunesMediaPodcastMetadata *)self name];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v6 = a3;
  id v4 = [(LPiTunesMediaPodcastMetadata *)self name];
  [v6 setTitle:v4];

  char v5 = [(LPiTunesMediaPodcastMetadata *)self artwork];
  [v6 setImage:v5];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaPodcastMetadata *)self storeIdentifier];

  return v3;
}

@end
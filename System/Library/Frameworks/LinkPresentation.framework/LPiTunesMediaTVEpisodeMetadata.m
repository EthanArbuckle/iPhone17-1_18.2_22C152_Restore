@interface LPiTunesMediaTVEpisodeMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaTVEpisodeMetadata)initWithCoder:(id)a3;
- (NSString)episodeName;
- (NSString)genre;
- (NSString)seasonName;
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
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setEpisodeName:(id)a3;
- (void)setGenre:(id)a3;
- (void)setSeasonName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaTVEpisodeMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaTVEpisodeMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LPiTunesMediaTVEpisodeMetadata;
  v5 = [(LPiTunesMediaTVEpisodeMetadata *)&v22 init];
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

    uint64_t v12 = decodeStringForKey(v4, @"seasonName");
    seasonName = v5->_seasonName;
    v5->_seasonName = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"genre");
    genre = v5->_genre;
    v5->_genre = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v16;

    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_episodeName, @"episodeName");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_seasonName, @"seasonName");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_genre, @"genre");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaTVEpisodeMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaTVEpisodeMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaTVEpisodeMetadata *)self storeIdentifier];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaTVEpisodeMetadata *)self episodeName];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setEpisodeName:v7];

    uint64_t v8 = [(LPiTunesMediaTVEpisodeMetadata *)self seasonName];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setSeasonName:v8];

    v9 = [(LPiTunesMediaTVEpisodeMetadata *)self genre];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setGenre:v9];

    uint64_t v10 = [(LPiTunesMediaTVEpisodeMetadata *)self artwork];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setArtwork:v10];

    v11 = [(LPiTunesMediaTVEpisodeMetadata *)self artworkMetadata];
    [(LPiTunesMediaTVEpisodeMetadata *)v4 setArtworkMetadata:v11];

    uint64_t v12 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaTVEpisodeMetadata;
  if ([(LPiTunesMediaTVEpisodeMetadata *)&v8 isEqual:v4])
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
        && objectsAreEqual_0(v6[5], self->_seasonName)
        && objectsAreEqual_0(v6[6], self->_genre)
        && objectsAreEqual_0(v6[7], self->_artwork))
      {
        char v5 = objectsAreEqual_0(v6[8], self->_artworkMetadata);
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"episodeName", @"seasonName", @"genre", @"artwork", @"artworkMetadata", 0);
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

- (NSString)seasonName
{
  return self->_seasonName;
}

- (void)setSeasonName:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_seasonName, 0);
  objc_storeStrong((id *)&self->_episodeName, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:22];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [(LPiTunesMediaTVEpisodeMetadata *)self episodeName];
  objc_super v8 = [(LPiTunesMediaTVEpisodeMetadata *)self seasonName];
  populateCaptionBar(v5, v7, v8, 0, 1, v4);

  v9 = [(LPiTunesMediaTVEpisodeMetadata *)self artwork];
  [v4 _populateProperties:v5 withPrimaryImage:v9];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  char v5 = LPLocalizedString(@"TV Episode: %@ – %@");
  uint64_t v6 = [(LPiTunesMediaTVEpisodeMetadata *)self episodeName];
  v7 = [(LPiTunesMediaTVEpisodeMetadata *)self seasonName];
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
  id v4 = [(LPiTunesMediaTVEpisodeMetadata *)self episodeName];
  [v6 setTitle:v4];

  char v5 = [(LPiTunesMediaTVEpisodeMetadata *)self artwork];
  [v6 setIcon:v5];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaTVEpisodeMetadata *)self storeIdentifier];

  return v3;
}

@end
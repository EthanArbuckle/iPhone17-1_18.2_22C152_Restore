@interface LPiTunesMediaMovieMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPImage)branding;
- (LPiTunesMediaMovieMetadata)initWithCoder:(id)a3;
- (NSString)brandingText;
- (NSString)genre;
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
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setBranding:(id)a3;
- (void)setBrandingText:(id)a3;
- (void)setGenre:(id)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaMovieMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaMovieMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiTunesMediaMovieMetadata;
  v5 = [(LPiTunesMediaMovieMetadata *)&v20 init];
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

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v14;

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_genre, @"genre");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaMovieMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaMovieMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaMovieMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaMovieMetadata *)self storeIdentifier];
    [(LPiTunesMediaMovieMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaMovieMetadata *)self name];
    [(LPiTunesMediaMovieMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaMovieMetadata *)self genre];
    [(LPiTunesMediaMovieMetadata *)v4 setGenre:v8];

    v9 = [(LPiTunesMediaMovieMetadata *)self artwork];
    [(LPiTunesMediaMovieMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(LPiTunesMediaMovieMetadata *)self artworkMetadata];
    [(LPiTunesMediaMovieMetadata *)v4 setArtworkMetadata:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaMovieMetadata;
  if ([(LPiTunesMediaMovieMetadata *)&v8 isEqual:v4])
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
        && objectsAreEqual_0(v6[5], self->_genre)
        && objectsAreEqual_0(v6[6], self->_artwork))
      {
        char v5 = objectsAreEqual_0(v6[7], self->_artworkMetadata);
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

- (LPImage)branding
{
  return self->_branding;
}

- (void)setBranding:(id)a3
{
}

- (NSString)brandingText
{
  return self->_brandingText;
}

- (void)setBrandingText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandingText, 0);
  objc_storeStrong((id *)&self->_branding, 0);
  objc_storeStrong((id *)&self->_artworkMetadata, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:23];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [(LPiTunesMediaMovieMetadata *)self name];
  objc_super v8 = [(LPiTunesMediaMovieMetadata *)self genre];
  v9 = LPLocalizedString(@" iTunes");
  populateCaptionBar(v5, v7, v8, v9, 0, v4);

  uint64_t v10 = [(LPiTunesMediaMovieMetadata *)self artwork];
  [v4 _populateProperties:v5 withPrimaryImage:v10];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  char v5 = LPLocalizedString(@"Movie: %@");
  uint64_t v6 = [(LPiTunesMediaMovieMetadata *)self name];
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
  id v4 = [(LPiTunesMediaMovieMetadata *)self name];
  [v6 setTitle:v4];

  char v5 = [(LPiTunesMediaMovieMetadata *)self artwork];
  [v6 setImage:v5];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaMovieMetadata *)self storeIdentifier];

  return v3;
}

@end
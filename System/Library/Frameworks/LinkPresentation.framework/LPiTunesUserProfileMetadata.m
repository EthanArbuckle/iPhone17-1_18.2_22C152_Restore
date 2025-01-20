@interface LPiTunesUserProfileMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesUserProfileMetadata)initWithCoder:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkMetadata:(id)a3;
- (void)setName:(id)a3;
@end

@implementation LPiTunesUserProfileMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesUserProfileMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPiTunesUserProfileMetadata;
  v5 = [(LPiTunesUserProfileMetadata *)&v14 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artworkMetadata = v5->_artworkMetadata;
    v5->_artworkMetadata = (LPArtworkMetadata *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"name");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesUserProfileMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesUserProfileMetadata *)self name];
    [(LPiTunesUserProfileMetadata *)v4 setName:v5];

    uint64_t v6 = [(LPiTunesUserProfileMetadata *)self artwork];
    [(LPiTunesUserProfileMetadata *)v4 setArtwork:v6];

    v7 = [(LPiTunesUserProfileMetadata *)self artworkMetadata];
    [(LPiTunesUserProfileMetadata *)v4 setArtworkMetadata:v7];

    uint64_t v8 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesUserProfileMetadata;
  if ([(LPiTunesUserProfileMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_name) & 1) != 0 && objectsAreEqual_0(v6[3], self->_artwork)) {
        char v5 = objectsAreEqual_0(v6[4], self->_artworkMetadata);
      }
      else {
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
  return [(NSString *)self->_name hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"artwork", @"artworkMetadata", 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
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

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:40];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  if ([v4 effectiveSizeClass] == 2)
  {
    v7 = [(LPiTunesUserProfileMetadata *)self name];
    objc_super v8 = LPLocalizedString(@"Profile");
    v9 = appleMusicWordmark(v4);
    populateCaptionBar(v5, v7, v8, v9, 1, v4);
  }
  else
  {
    v7 = [(LPiTunesUserProfileMetadata *)self name];
    objc_super v8 = appleMusicWordmark(v4);
    populateCaptionBar(v5, v7, 0, v8, 1, v4);
  }

  uint64_t v10 = [(LPiTunesUserProfileMetadata *)self artwork];
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
  char v5 = LPLocalizedString(@"Profile: %@");
  uint64_t v6 = [(LPiTunesUserProfileMetadata *)self name];
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
  id v4 = [(LPiTunesUserProfileMetadata *)self name];
  [v6 setTitle:v4];

  char v5 = [(LPiTunesUserProfileMetadata *)self artwork];
  [v6 setImage:v5];
}

@end
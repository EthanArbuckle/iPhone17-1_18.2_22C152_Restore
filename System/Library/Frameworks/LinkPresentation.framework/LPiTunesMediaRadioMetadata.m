@interface LPiTunesMediaRadioMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaRadioMetadata)initWithCoder:(id)a3;
- (NSString)curator;
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
- (void)setCurator:(id)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaRadioMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaRadioMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiTunesMediaRadioMetadata;
  v5 = [(LPiTunesMediaRadioMetadata *)&v20 init];
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

    uint64_t v12 = decodeStringForKey(v4, @"curator");
    curator = v5->_curator;
    v5->_curator = (NSString *)v12;

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
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_curator, @"curator");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artworkMetadata, @"artworkMetadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaRadioMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaRadioMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaRadioMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaRadioMetadata *)self storeIdentifier];
    [(LPiTunesMediaRadioMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaRadioMetadata *)self name];
    [(LPiTunesMediaRadioMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaRadioMetadata *)self curator];
    [(LPiTunesMediaRadioMetadata *)v4 setCurator:v8];

    v9 = [(LPiTunesMediaRadioMetadata *)self artwork];
    [(LPiTunesMediaRadioMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(LPiTunesMediaRadioMetadata *)self artworkMetadata];
    [(LPiTunesMediaRadioMetadata *)v4 setArtworkMetadata:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaRadioMetadata;
  if ([(LPiTunesMediaRadioMetadata *)&v8 isEqual:v4])
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
        && objectsAreEqual_0(v6[5], self->_curator)
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
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"curator", @"artwork", @"artworkMetadata", 0);
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

- (NSString)curator
{
  return self->_curator;
}

- (void)setCurator:(id)a3
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
  objc_storeStrong((id *)&self->_curator, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 commonPresentationPropertiesForStyle:10];
  v7 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v6 setCaptionBar:v7];

  objc_super v8 = [(LPiTunesMediaRadioMetadata *)self curator];
  if (!v8)
  {
    if ([v5 effectiveSizeClass] == 2)
    {
      objc_super v8 = LPLocalizedString(@"Radio");
    }
    else
    {
      objc_super v8 = 0;
    }
  }
  v9 = [(LPiTunesMediaRadioMetadata *)self name];
  uint64_t v10 = appleMusicWordmark(v5);
  populateCaptionBar(v6, v9, v8, v10, 1, v5);

  v11 = [(LPiTunesMediaRadioMetadata *)self artwork];
  [v5 _populateProperties:v6 withPrimaryImage:v11];

  uint64_t v12 = [(LPiTunesMediaRadioMetadata *)self storeIdentifier];
  v13 = [(LPiTunesMediaRadioMetadata *)self storeFrontIdentifier];
  uint64_t v14 = v13;
  if (!v13)
  {
    v3 = [v5 canonicalURL];
    uint64_t v14 = storefrontIdentifierFromURL(v3);
  }
  v15 = +[LPInlineMediaPlaybackInformation radioPlaybackInformationWithStoreIdentifier:v12 storefrontIdentifier:v14];
  if (!v13)
  {
  }
  [v6 setInlinePlaybackInformation:v15];

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  uint64_t v4 = [(LPiTunesMediaRadioMetadata *)self name];
  if (v4
    && (id v5 = (void *)v4,
        [(LPiTunesMediaRadioMetadata *)self curator],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = NSString;
    objc_super v8 = LPLocalizedString(@"Radio: %@ – %@");
    v9 = [(LPiTunesMediaRadioMetadata *)self name];
    uint64_t v10 = [(LPiTunesMediaRadioMetadata *)self curator];
    v11 = objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
  }
  else
  {
    uint64_t v12 = NSString;
    objc_super v8 = LPLocalizedString(@"Radio: %@");
    v9 = [(LPiTunesMediaRadioMetadata *)self name];
    v11 = objc_msgSend(v12, "stringWithFormat:", v8, v9);
  }

  return v11;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(LPiTunesMediaRadioMetadata *)self name];
  if (v4
    && ([(LPiTunesMediaRadioMetadata *)self curator],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [(LPiTunesMediaRadioMetadata *)self name];
    v7 = [(LPiTunesMediaRadioMetadata *)self curator];
    objc_super v8 = joinedByEmDash(v6, v7);
    [v10 setTitle:v8];
  }
  else
  {
    uint64_t v6 = [(LPiTunesMediaRadioMetadata *)self name];
    [v10 setTitle:v6];
  }

  v9 = [(LPiTunesMediaRadioMetadata *)self artwork];
  [v10 setImage:v9];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaRadioMetadata *)self storeIdentifier];

  return v3;
}

@end
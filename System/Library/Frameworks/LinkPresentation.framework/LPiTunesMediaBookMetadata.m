@interface LPiTunesMediaBookMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)hasSpineOnRight;
- (BOOL)isEqual:(id)a3;
- (LPArtworkMetadata)artworkMetadata;
- (LPImage)artwork;
- (LPiTunesMediaBookMetadata)initWithCoder:(id)a3;
- (NSString)author;
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
- (void)setAuthor:(id)a3;
- (void)setHasSpineOnRight:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
@end

@implementation LPiTunesMediaBookMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaBookMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiTunesMediaBookMetadata;
  v5 = [(LPiTunesMediaBookMetadata *)&v20 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    v7 = *(void **)&v5->_hasSpineOnRight;
    *(void *)&v5->_hasSpineOnRight = v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"author");
    name = v5->_name;
    v5->_name = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"artwork");
    author = v5->_author;
    v5->_author = (NSString *)v14;

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"artworkMetadata");
    artwork = v5->_artwork;
    v5->_artwork = (LPImage *)v16;

    *(&v5->super.__disallowsURLOverrideByDelegate + 1) = [v4 decodeBoolForKey:@"hasSpineOnRight"];
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_hasSpineOnRight, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"author");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_author, @"artwork");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_artwork, @"artworkMetadata");
  [v4 encodeBool:*((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1) forKey:@"hasSpineOnRight"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaBookMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaBookMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaBookMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaBookMetadata *)self storeIdentifier];
    [(LPiTunesMediaBookMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaBookMetadata *)self name];
    [(LPiTunesMediaBookMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaBookMetadata *)self author];
    [(LPiTunesMediaBookMetadata *)v4 setAuthor:v8];

    v9 = [(LPiTunesMediaBookMetadata *)self artwork];
    [(LPiTunesMediaBookMetadata *)v4 setArtwork:v9];

    uint64_t v10 = [(LPiTunesMediaBookMetadata *)self artworkMetadata];
    [(LPiTunesMediaBookMetadata *)v4 setArtworkMetadata:v10];

    [(LPiTunesMediaBookMetadata *)v4 setHasSpineOnRight:[(LPiTunesMediaBookMetadata *)self hasSpineOnRight]];
    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaBookMetadata;
  if ([(LPiTunesMediaBookMetadata *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      BOOL v5 = (objectsAreEqual_0(v6[2], *(void **)&self->_hasSpineOnRight) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeFrontIdentifier)
        && objectsAreEqual_0(v6[4], self->_storeIdentifier)
        && objectsAreEqual_0(v6[5], self->_name)
        && objectsAreEqual_0(v6[6], self->_author)
        && objectsAreEqual_0(v6[7], self->_artwork)
        && *((unsigned __int8 *)v6 + 11) == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1);
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_storeFrontIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"author", @"artwork", @"artworkMetadata", @"hasSpineOnRight", 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_hasSpineOnRight;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_storeIdentifier;
}

- (void)setName:(id)a3
{
}

- (NSString)author
{
  return self->_name;
}

- (void)setAuthor:(id)a3
{
}

- (LPImage)artwork
{
  return (LPImage *)self->_author;
}

- (void)setArtwork:(id)a3
{
}

- (LPArtworkMetadata)artworkMetadata
{
  return (LPArtworkMetadata *)self->_artwork;
}

- (void)setArtworkMetadata:(id)a3
{
}

- (BOOL)hasSpineOnRight
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setHasSpineOnRight:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);

  objc_storeStrong((id *)&self->_hasSpineOnRight, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 commonPresentationPropertiesForStyle:13];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [(LPiTunesMediaBookMetadata *)self name];
  objc_super v8 = [(LPiTunesMediaBookMetadata *)self author];
  v9 = LPLocalizedString(@" Books");
  populateCaptionBar(v5, v7, v8, v9, 1, v4);

  uint64_t v10 = [(LPiTunesMediaBookMetadata *)self artwork];
  [v4 _populateProperties:v5 withPrimaryImage:v10];

  v11 = objc_alloc_init(LPImagePresentationProperties);
  if ([(LPiTunesMediaBookMetadata *)self hasSpineOnRight]) {
    uint64_t v12 = 9;
  }
  else {
    uint64_t v12 = 8;
  }
  [(LPImagePresentationProperties *)v11 setFilter:v12];
  [v5 setImageProperties:v11];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  BOOL v5 = LPLocalizedString(@"Book: %@ – %@");
  uint64_t v6 = [(LPiTunesMediaBookMetadata *)self name];
  v7 = [(LPiTunesMediaBookMetadata *)self author];
  objc_super v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v8 = a3;
  id v4 = [(LPiTunesMediaBookMetadata *)self name];
  BOOL v5 = [(LPiTunesMediaBookMetadata *)self author];
  uint64_t v6 = joinedByEmDash(v4, v5);
  [v8 setTitle:v6];

  v7 = [(LPiTunesMediaBookMetadata *)self artwork];
  [v8 setImage:v7];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  v3 = [(LPiTunesMediaBookMetadata *)self storeIdentifier];

  return v3;
}

@end
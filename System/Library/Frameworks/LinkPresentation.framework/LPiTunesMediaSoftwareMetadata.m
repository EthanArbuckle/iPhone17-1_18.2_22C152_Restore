@interface LPiTunesMediaSoftwareMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMessagesOnlyApp;
- (LPImage)icon;
- (LPImage)messagesAppIcon;
- (LPVideo)previewVideo;
- (LPiTunesMediaSoftwareMetadata)initWithCoder:(id)a3;
- (NSArray)screenshots;
- (NSString)genre;
- (NSString)name;
- (NSString)platform;
- (NSString)storeFrontIdentifier;
- (NSString)storeIdentifier;
- (NSString)subtitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (id)storeIdentifierForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setGenre:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIsMessagesOnlyApp:(BOOL)a3;
- (void)setMessagesAppIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setPreviewVideo:(id)a3;
- (void)setScreenshots:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation LPiTunesMediaSoftwareMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiTunesMediaSoftwareMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)LPiTunesMediaSoftwareMetadata;
  v5 = [(LPiTunesMediaSoftwareMetadata *)&v28 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"storeFrontIdentifier");
    v7 = *(void **)&v5->_isMessagesOnlyApp;
    *(void *)&v5->_isMessagesOnlyApp = v6;

    uint64_t v8 = decodeStringForKey(v4, @"storeIdentifier");
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"name");
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"subtitle");
    name = v5->_name;
    v5->_name = (NSString *)v12;

    uint64_t v14 = decodeStringForKey(v4, @"genre");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v14;

    uint64_t v16 = decodeStringForKey(v4, @"platform");
    genre = v5->_genre;
    v5->_genre = (NSString *)v16;

    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    platform = v5->_platform;
    v5->_platform = (NSString *)v18;

    uint64_t v20 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfLPImagesForKey:", @"screenshots");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v20;

    uint64_t v22 = objc_msgSend(v4, "_lp_strictlyDecodeLPVideoForKey:", @"previewVideo");
    screenshots = v5->_screenshots;
    v5->_screenshots = (NSArray *)v22;

    *(&v5->super.__disallowsURLOverrideByDelegate + 1) = [v4 decodeBoolForKey:@"isMessagesOnlyApp"];
    uint64_t v24 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"messagesAppIcon");
    previewVideo = v5->_previewVideo;
    v5->_previewVideo = (LPVideo *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_isMessagesOnlyApp, @"storeFrontIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeFrontIdentifier, @"storeIdentifier");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_storeIdentifier, @"name");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_name, @"subtitle");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, @"genre");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_genre, @"platform");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_platform, @"icon");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"screenshots");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_screenshots, @"previewVideo");
  [v4 encodeBool:*((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1) forKey:@"isMessagesOnlyApp"];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_previewVideo, @"messagesAppIcon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiTunesMediaSoftwareMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiTunesMediaSoftwareMetadata *)self storeFrontIdentifier];
    [(LPiTunesMediaSoftwareMetadata *)v4 setStoreFrontIdentifier:v5];

    uint64_t v6 = [(LPiTunesMediaSoftwareMetadata *)self storeIdentifier];
    [(LPiTunesMediaSoftwareMetadata *)v4 setStoreIdentifier:v6];

    v7 = [(LPiTunesMediaSoftwareMetadata *)self name];
    [(LPiTunesMediaSoftwareMetadata *)v4 setName:v7];

    uint64_t v8 = [(LPiTunesMediaSoftwareMetadata *)self subtitle];
    [(LPiTunesMediaSoftwareMetadata *)v4 setSubtitle:v8];

    v9 = [(LPiTunesMediaSoftwareMetadata *)self genre];
    [(LPiTunesMediaSoftwareMetadata *)v4 setGenre:v9];

    uint64_t v10 = [(LPiTunesMediaSoftwareMetadata *)self platform];
    [(LPiTunesMediaSoftwareMetadata *)v4 setPlatform:v10];

    v11 = [(LPiTunesMediaSoftwareMetadata *)self icon];
    [(LPiTunesMediaSoftwareMetadata *)v4 setIcon:v11];

    uint64_t v12 = [(LPiTunesMediaSoftwareMetadata *)self screenshots];
    [(LPiTunesMediaSoftwareMetadata *)v4 setScreenshots:v12];

    v13 = [(LPiTunesMediaSoftwareMetadata *)self previewVideo];
    [(LPiTunesMediaSoftwareMetadata *)v4 setPreviewVideo:v13];

    [(LPiTunesMediaSoftwareMetadata *)v4 setIsMessagesOnlyApp:[(LPiTunesMediaSoftwareMetadata *)self isMessagesOnlyApp]];
    uint64_t v14 = [(LPiTunesMediaSoftwareMetadata *)self messagesAppIcon];
    [(LPiTunesMediaSoftwareMetadata *)v4 setMessagesAppIcon:v14];

    v15 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiTunesMediaSoftwareMetadata;
  if ([(LPiTunesMediaSoftwareMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], *(void **)&self->_isMessagesOnlyApp) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_storeFrontIdentifier)
        && objectsAreEqual_0(v6[4], self->_storeIdentifier)
        && objectsAreEqual_0(v6[5], self->_name)
        && objectsAreEqual_0(v6[6], self->_subtitle)
        && objectsAreEqual_0(v6[7], self->_genre)
        && objectsAreEqual_0(v6[8], self->_platform)
        && objectsAreEqual_0(v6[9], self->_icon)
        && objectsAreEqual_0(v6[10], self->_screenshots)
        && *((unsigned __int8 *)v6 + 11) == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1))
      {
        char v5 = objectsAreEqual_0(v6[11], self->_previewVideo);
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
  return [(NSString *)self->_storeFrontIdentifier hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"icon");
  v3[2](v3, @"screenshots");
  v3[2](v3, @"messagesAppIcon");
  v3[2](v3, @"previewVideo");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeFrontIdentifier", @"storeIdentifier", @"name", @"subtitle", @"genre", @"platform", @"icon", @"screenshots", @"previewVideo", @"isMessagesOnlyApp", @"messagesAppIcon", 0);
}

- (NSString)storeFrontIdentifier
{
  return *(NSString **)&self->_isMessagesOnlyApp;
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

- (NSString)subtitle
{
  return self->_name;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)genre
{
  return self->_subtitle;
}

- (void)setGenre:(id)a3
{
}

- (NSString)platform
{
  return self->_genre;
}

- (void)setPlatform:(id)a3
{
}

- (LPImage)icon
{
  return (LPImage *)self->_platform;
}

- (void)setIcon:(id)a3
{
}

- (NSArray)screenshots
{
  return (NSArray *)self->_icon;
}

- (void)setScreenshots:(id)a3
{
}

- (LPVideo)previewVideo
{
  return (LPVideo *)self->_screenshots;
}

- (void)setPreviewVideo:(id)a3
{
}

- (BOOL)isMessagesOnlyApp
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setIsMessagesOnlyApp:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (LPImage)messagesAppIcon
{
  return (LPImage *)self->_previewVideo;
}

- (void)setMessagesAppIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewVideo, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);

  objc_storeStrong((id *)&self->_isMessagesOnlyApp, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  if ([(LPiTunesMediaSoftwareMetadata *)self isMessagesOnlyApp])
  {
    uint64_t v5 = 4;
    uint64_t v6 = 18;
  }
  else
  {
    v7 = [(LPiTunesMediaSoftwareMetadata *)self platform];
    int v8 = [v7 isEqualToString:@"iOS"];

    BOOL v9 = v8 == 0;
    if (v8) {
      uint64_t v6 = 12;
    }
    else {
      uint64_t v6 = 11;
    }
    uint64_t v5 = 1;
    if (v9) {
      uint64_t v5 = 2;
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__LPiTunesMediaSoftwareMetadata_Transformer__presentationPropertiesForTransformer___block_invoke;
  aBlock[3] = &__block_descriptor_40_e26___LPImage_16__0__LPImage_8l;
  aBlock[4] = v5;
  uint64_t v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  v11 = [v4 commonPresentationPropertiesForStyle:v6];
  uint64_t v12 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v11 setCaptionBar:v12];

  v13 = [(LPiTunesMediaSoftwareMetadata *)self name];
  uint64_t v14 = [(LPiTunesMediaSoftwareMetadata *)self subtitle];
  v15 = v14;
  if (!v14)
  {
    v15 = [(LPiTunesMediaSoftwareMetadata *)self genre];
  }
  populateCaptionBar(v11, v13, v15, 0, 0, v4);
  if (!v14) {

  }
  uint64_t v16 = [(LPiTunesMediaSoftwareMetadata *)self subtitle];
  if (v16) {
    v17 = &unk_1EF7126A8;
  }
  else {
    v17 = &unk_1EF7126C0;
  }
  uint64_t v18 = [v11 captionBar];
  v19 = [v18 bottom];
  uint64_t v20 = [v19 leading];
  [v20 setMaximumNumberOfLines:v17];

  if (![(LPiTunesMediaSoftwareMetadata *)self isMessagesOnlyApp]
    || ([(LPiTunesMediaSoftwareMetadata *)self messagesAppIcon],
        v21 = objc_claimAutoreleasedReturnValue(),
        v10[2](v10, v21),
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        v21,
        !v22))
  {
    v23 = [(LPiTunesMediaSoftwareMetadata *)self icon];
    uint64_t v22 = v10[2](v10, v23);
  }
  [v4 _populateProperties:v11 withPrimaryIcon:v22 iconProperties:0 canBecomeImage:0];
  uint64_t v24 = [(LPiTunesMediaSoftwareMetadata *)self screenshots];
  v25 = [v24 firstObject];
  [v11 setImage:v25];

  v26 = [(LPiTunesMediaSoftwareMetadata *)self previewVideo];
  [v11 setVideo:v26];

  return v11;
}

id __83__LPiTunesMediaSoftwareMetadata_Transformer__presentationPropertiesForTransformer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 properties];
  uint64_t v5 = [v4 type];

  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    v7 = objc_alloc_init(LPImageProperties);
    [(LPImageProperties *)v7 setType:*(void *)(a1 + 32)];
    id v6 = [[LPImage alloc] _initWithImage:v3 properties:v7];
  }

  return v6;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = LPLocalizedString(@"App Store: %@");
  id v6 = [(LPiTunesMediaSoftwareMetadata *)self name];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v8 = a3;
  id v4 = [(LPiTunesMediaSoftwareMetadata *)self name];
  [v8 setTitle:v4];

  uint64_t v5 = [(LPiTunesMediaSoftwareMetadata *)self icon];
  [v8 setIcon:v5];

  id v6 = [(LPiTunesMediaSoftwareMetadata *)self screenshots];
  v7 = [v6 firstObject];
  [v8 setImage:v7];
}

- (id)storeIdentifierForTransformer:(id)a3
{
  id v3 = [(LPiTunesMediaSoftwareMetadata *)self storeIdentifier];

  return v3;
}

@end
@interface LPiCloudFamilyInvitationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPImage)icon;
- (LPImage)image;
- (LPiCloudFamilyInvitationMetadata)initWithCoder:(id)a3;
- (NSString)action;
- (NSString)kind;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setAction:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setKind:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPiCloudFamilyInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPiCloudFamilyInvitationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LPiCloudFamilyInvitationMetadata;
  v5 = [(LPiCloudFamilyInvitationMetadata *)&v20 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = decodeStringForKey(v4, @"action");
    action = v5->_action;
    v5->_action = (NSString *)v10;

    uint64_t v12 = decodeStringForKey(v4, @"kind");
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"image");
    image = v5->_image;
    v5->_image = (LPImage *)v14;

    uint64_t v16 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_subtitle, @"subtitle");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_action, @"action");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_kind, @"kind");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_image, @"image");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"icon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPiCloudFamilyInvitationMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPiCloudFamilyInvitationMetadata *)self title];
    [(LPiCloudFamilyInvitationMetadata *)v4 setTitle:v5];

    uint64_t v6 = [(LPiCloudFamilyInvitationMetadata *)self subtitle];
    [(LPiCloudFamilyInvitationMetadata *)v4 setSubtitle:v6];

    v7 = [(LPiCloudFamilyInvitationMetadata *)self action];
    [(LPiCloudFamilyInvitationMetadata *)v4 setAction:v7];

    uint64_t v8 = [(LPiCloudFamilyInvitationMetadata *)self kind];
    [(LPiCloudFamilyInvitationMetadata *)v4 setKind:v8];

    v9 = [(LPiCloudFamilyInvitationMetadata *)self image];
    [(LPiCloudFamilyInvitationMetadata *)v4 setImage:v9];

    uint64_t v10 = [(LPiCloudFamilyInvitationMetadata *)self icon];
    [(LPiCloudFamilyInvitationMetadata *)v4 setIcon:v10];

    v11 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPiCloudFamilyInvitationMetadata;
  if ([(LPiCloudFamilyInvitationMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_subtitle)
        && objectsAreEqual_0(v6[4], self->_action)
        && objectsAreEqual_0(v6[5], self->_kind)
        && objectsAreEqual_0(v6[6], self->_image))
      {
        char v5 = objectsAreEqual_0(v6[7], self->_icon);
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
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_action hash];
  return v4 ^ v5 ^ [(LPImage *)self->_image hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  NSUInteger v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"image");
  v3[2](v3, @"icon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", @"action", @"kind", @"image", @"icon", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 commonPresentationPropertiesForStyle:24];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  if (sizeClassAllowsMedia([v4 effectiveSizeClass]))
  {
    v7 = [(LPiCloudFamilyInvitationMetadata *)self image];
    objc_super v8 = v7;
    if (!v7)
    {
      objc_super v8 = [(LPiCloudFamilyInvitationMetadata *)self icon];
    }
    [v4 _populateProperties:v5 withPrimaryImage:v8];
  }
  else
  {
    v7 = [(LPiCloudFamilyInvitationMetadata *)self icon];
    objc_super v8 = v7;
    if (!v7)
    {
      objc_super v8 = [(LPiCloudFamilyInvitationMetadata *)self image];
    }
    [v4 _populateProperties:v5 withPrimaryIcon:v8];
  }
  if (!v7) {

  }
  uint64_t v9 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v9 - 1) >= 3)
  {
    if (v9) {
      goto LABEL_24;
    }
    v25 = [(LPiCloudFamilyInvitationMetadata *)self kind];

    if (!v25)
    {
      uint64_t v16 = [(LPiCloudFamilyInvitationMetadata *)self title];
      v17 = [v5 captionBar];
      v18 = [v17 top];
      v19 = [v18 leading];
      [v19 setText:v16];
      goto LABEL_23;
    }
    uint64_t v16 = [(LPiCloudFamilyInvitationMetadata *)self kind];
    v17 = LPLocalizedString(@"Invitation");
    v18 = joinedByEmDash(v16, v17);
    v19 = [v5 captionBar];
    v26 = [v19 top];
    v27 = [v26 leading];
    [v27 setText:v18];

    goto LABEL_22;
  }
  uint64_t v10 = [(LPiCloudFamilyInvitationMetadata *)self kind];
  if (!v10 || (uint64_t v11 = [v4 effectiveSizeClass], v10, v11 != 2))
  {
    objc_super v20 = [v4 preferredContentSizeCategory];
    uint64_t v16 = v20;
    if (v20
      && UIContentSizeCategoryCompareToCategory(v20, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) == NSOrderedDescending)
    {
      v21 = [(LPiCloudFamilyInvitationMetadata *)self title];
      v22 = [v5 captionBar];
      v23 = [v22 top];
      v24 = [v23 leading];
      [v24 setText:v21];
    }
    else
    {
      v21 = [(LPiCloudFamilyInvitationMetadata *)self subtitle];
      v22 = [v5 captionBar];
      v23 = [v22 top];
      v24 = [v23 leading];
      [v24 setText:v21];
    }

    v17 = [(LPiCloudFamilyInvitationMetadata *)self action];
    v18 = [v5 captionBar];
    v19 = [v18 bottom];
    v26 = [v19 leading];
    [v26 setText:v17];
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v12 = [(LPiCloudFamilyInvitationMetadata *)self kind];
  v13 = [v5 captionBar];
  uint64_t v14 = [v13 top];
  v15 = [v14 leading];
  [v15 setText:v12];

  uint64_t v16 = LPLocalizedString(@"Invitation");
  v17 = [v5 captionBar];
  v18 = [v17 bottom];
  v19 = [v18 leading];
  [v19 setText:v16];
LABEL_23:

LABEL_24:

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = [(LPiCloudFamilyInvitationMetadata *)self kind];

  if (v4)
  {
    NSUInteger v5 = [(LPiCloudFamilyInvitationMetadata *)self kind];
    uint64_t v6 = LPLocalizedString(@"Invitation");
    v7 = joinedByEmDash(v5, v6);
  }
  else
  {
    v7 = [(LPiCloudFamilyInvitationMetadata *)self title];
  }

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  NSUInteger v3 = [(LPiCloudFamilyInvitationMetadata *)self image];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v8 = a3;
  id v4 = [(LPiCloudFamilyInvitationMetadata *)self title];
  [v8 setTitle:v4];

  NSUInteger v5 = [(LPiCloudFamilyInvitationMetadata *)self image];
  [v8 setImage:v5];

  uint64_t v6 = [(LPiCloudFamilyInvitationMetadata *)self icon];
  [v8 setIcon:v6];

  v7 = [(LPiCloudFamilyInvitationMetadata *)self action];
  [v8 setSummary:v7];
}

@end
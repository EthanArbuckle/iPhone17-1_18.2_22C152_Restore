@interface LPFaceTimeInviteMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPFaceTimeInviteMetadata)initWithCoder:(id)a3;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPFaceTimeInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPFaceTimeInviteMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPFaceTimeInviteMetadata;
  v5 = [(LPFaceTimeInviteMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPFaceTimeInviteMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPFaceTimeInviteMetadata *)self title];
    [(LPFaceTimeInviteMetadata *)v4 setTitle:v5];

    uint64_t v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPFaceTimeInviteMetadata;
  if ([(LPFaceTimeInviteMetadata *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = objectsAreEqual_0(v4[2], self->_title);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:46];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  objc_super v7 = objc_alloc_init(LPImagePresentationProperties);
  if ([v4 effectiveSizeClass] == 2 || objc_msgSend(v4, "effectiveSizeClass") == 12)
  {
    v8 = [(LPFaceTimeInviteMetadata *)self title];
    v9 = v8;
    if (!v8)
    {
      v9 = LPLocalizedString(@"FaceTime Link");
    }
    objc_super v10 = [v5 captionBar];
    v11 = [v10 top];
    v12 = [v11 leading];
    [v12 setText:v9];

    if (!v8) {
    v13 = +[LPResources linkIcon];
    }
  }
  else
  {
    v13 = +[LPResources faceTimeIcon];
    v14 = objc_alloc_init(LPImagePresentationProperties);

    [(LPImagePresentationProperties *)v14 setFilter:1];
    [(LPImagePresentationProperties *)v14 setScalingMode:1];
    v15 = [(LPFaceTimeInviteMetadata *)self title];
    v16 = v15;
    if (!v15)
    {
      v16 = LPLocalizedString(@"FaceTime");
    }
    v17 = [v5 captionBar];
    v18 = [v17 top];
    v19 = [v18 leading];
    [v19 setText:v16];

    if (!v15) {
    v20 = [(LPFaceTimeInviteMetadata *)self title];
    }
    if (v20) {
      LPLocalizedString(@"FaceTime Link");
    }
    else {
    v21 = LPLocalizedString(@"Link");
    }
    v22 = [v5 captionBar];
    v23 = [v22 bottom];
    v24 = [v23 leading];
    [v24 setText:v21];

    if ([v4 effectiveSizeClass] != 1 && (objc_msgSend(v4, "hasOverriddenBackgroundColor") & 1) == 0)
    {
      v25 = [MEMORY[0x1E4FB1618] whiteColor];
      [(LPImagePresentationProperties *)v14 setMaskColor:v25];

      v26 = [MEMORY[0x1E4FB1618] whiteColor];
      v27 = [v5 captionBar];
      v28 = [v27 top];
      v29 = [v28 leading];
      [v29 setColor:v26];

      v30 = [MEMORY[0x1E4FB1618] whiteColor];
      v31 = [v30 colorWithAlphaComponent:0.6];
      v32 = [v5 captionBar];
      v33 = [v32 bottom];
      v34 = [v33 leading];
      [v34 setColor:v31];
    }
    objc_super v7 = v14;
  }
  [v4 _populateProperties:v5 withPrimaryIcon:v13 iconProperties:v7];

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return objc_msgSend(a3, "_lp_isFaceTimeInviteURL");
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = [(LPFaceTimeInviteMetadata *)self title];

  if (v4)
  {
    char v5 = NSString;
    uint64_t v6 = LPLocalizedString(@"FaceTime Link: %@");
    objc_super v7 = [(LPFaceTimeInviteMetadata *)self title];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = LPLocalizedString(@"FaceTime Link");
  }

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (id)fallbackIconForTransformer:(id)a3
{
  v3 = +[LPResources faceTimeIcon];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v6 = a3;
  id v4 = [(LPFaceTimeInviteMetadata *)self title];
  char v5 = v4;
  if (!v4)
  {
    char v5 = LPLocalizedString(@"FaceTime Link");
  }
  [v6 setTitle:v5];
  if (!v4) {
}
  }

@end
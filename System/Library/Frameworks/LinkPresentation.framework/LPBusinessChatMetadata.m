@interface LPBusinessChatMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3;
- (LPBusinessChatMetadata)initWithCoder:(id)a3;
- (NSString)subtitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation LPBusinessChatMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPBusinessChatMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPBusinessChatMetadata;
  v5 = [(LPBusinessChatMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"subtitle");
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPBusinessChatMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPBusinessChatMetadata *)self subtitle];
    [(LPBusinessChatMetadata *)v4 setSubtitle:v5];

    uint64_t v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPBusinessChatMetadata;
  if ([(LPBusinessChatMetadata *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = objectsAreEqual_0(v4[2], self->_subtitle);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_subtitle hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"subtitle", 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = [a3 unspecializedPresentationProperties];
  char v5 = [(LPBusinessChatMetadata *)self subtitle];

  if (v5)
  {
    uint64_t v6 = [(LPBusinessChatMetadata *)self subtitle];
    objc_super v7 = [v4 captionBar];
    v8 = [v7 bottom];
    v9 = [v8 leading];
    [v9 setText:v6];
  }

  return v4;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return objc_msgSend(a3, "_lp_isHTTPFamilyURL") ^ 1;
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 metadata];
  uint64_t v6 = [v5 title];
  if ([v6 length])
  {
    objc_super v7 = [(LPBusinessChatMetadata *)self subtitle];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      v9 = NSString;
      objc_super v10 = LPLocalizedString(@"%@: %@");
      v11 = [(LPBusinessChatMetadata *)self subtitle];
      v12 = [v4 metadata];
      v13 = [v12 title];
      v14 = objc_msgSend(v9, "stringWithFormat:", v10, v11, v13);

      goto LABEL_7;
    }
  }
  else
  {
  }
  v15 = [v4 metadata];
  v16 = [v15 title];
  uint64_t v17 = [v16 length];

  if (!v17)
  {
    v18 = [(LPBusinessChatMetadata *)self subtitle];
    uint64_t v19 = [v18 length];

    if (v19) {
      [(LPBusinessChatMetadata *)self subtitle];
    }
    else {
    v14 = LPLocalizedString(@"Messages for Business");
    }
    goto LABEL_12;
  }
  objc_super v10 = [v4 metadata];
  v14 = [v10 title];
LABEL_7:

LABEL_12:

  return v14;
}

- (id)previewImageForTransformer:(id)a3
{
  return 0;
}

- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3
{
  return 0;
}

@end
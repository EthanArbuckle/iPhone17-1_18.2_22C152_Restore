@interface LPAppStoreStoryMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPAppStoreStoryMetadata)initWithCoder:(id)a3;
- (NSString)subtitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation LPAppStoreStoryMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPAppStoreStoryMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPAppStoreStoryMetadata;
  v5 = [(LPAppStoreStoryMetadata *)&v10 init];
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
  id v4 = +[LPAppStoreStoryMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPAppStoreStoryMetadata *)self subtitle];
    [(LPAppStoreStoryMetadata *)v4 setSubtitle:v5];

    uint64_t v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPAppStoreStoryMetadata;
  if ([(LPAppStoreStoryMetadata *)&v7 isEqual:v4])
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
  id v4 = a3;
  char v5 = [v4 unspecializedPresentationProperties];
  if ((unint64_t)(objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style")) - 1) < 3)
  {
    uint64_t v6 = [(LPAppStoreStoryMetadata *)self subtitle];
    objc_super v7 = v6;
    if (!v6)
    {
      objc_super v7 = LPLocalizedString(@"App Store");
    }
    v8 = [v5 captionBar];
    v9 = [v8 bottom];
    objc_super v10 = [v9 leading];
    [v10 setText:v7];

    if (!v6) {
  }
    }

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v3 = a3;
  id v4 = NSString;
  char v5 = LPLocalizedString(@"App Store: %@");
  uint64_t v6 = [v3 metadata];
  objc_super v7 = [v6 title];
  v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  id v3 = [a3 metadata];
  id v4 = [v3 image];

  return v4;
}

@end
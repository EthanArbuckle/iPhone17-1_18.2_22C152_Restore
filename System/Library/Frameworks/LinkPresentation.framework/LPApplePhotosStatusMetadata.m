@interface LPApplePhotosStatusMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPApplePhotosStatusMetadata)initWithCoder:(id)a3;
- (NSAttributedString)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation LPApplePhotosStatusMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPApplePhotosStatusMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPApplePhotosStatusMetadata;
  v5 = [(LPApplePhotosStatusMetadata *)&v10 init];
  if (v5)
  {
    uint64_t v6 = decodeAttributedStringForKey(v4, @"title");
    status = v5->_status;
    v5->_status = (NSAttributedString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPApplePhotosStatusMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPApplePhotosStatusMetadata *)self status];
    [(LPApplePhotosStatusMetadata *)v4 setStatus:v5];

    uint64_t v6 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)LPApplePhotosStatusMetadata;
  if ([(LPApplePhotosStatusMetadata *)&v7 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = objectsAreEqual_0(v4[2], self->_status);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSAttributedString *)self->_status hash];
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"status", 0);
}

- (NSAttributedString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  if (sizeClassAllowsStatusTransformation([v4 effectiveSizeClass]))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [v4 metadata];
    objc_super v7 = [v6 image];

    if (v7)
    {
      v8 = [v4 metadata];
      v9 = [v8 image];
      [v5 addObject:v9];
    }
    objc_super v10 = [v4 metadata];
    v11 = [v10 alternateImages];

    if (v11)
    {
      v12 = [v4 metadata];
      v13 = [v12 alternateImages];
      [v5 addObjectsFromArray:v13];
    }
    v14 = [v4 metadata];
    v15 = [v14 icon];

    if (v15)
    {
      v16 = [v4 metadata];
      v17 = [v16 icon];
      [v5 addObject:v17];
    }
    if (![v5 count])
    {
      v18 = [v4 sourceContextIcon];
      [v5 addObject:v18];
    }
    v19 = [LPCardHeadingPresentationProperties alloc];
    v20 = [v4 metadata];
    v21 = [v20 title];
    v22 = [(LPApplePhotosStatusMetadata *)self status];
    v23 = [(LPCardHeadingPresentationProperties *)v19 initWithStyle:38 topCaption:v21 attributedBottomCaption:v22 icons:v5];
  }
  else
  {
    v23 = [v4 unspecializedPresentationProperties];
  }

  return v23;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:a3];
}

@end
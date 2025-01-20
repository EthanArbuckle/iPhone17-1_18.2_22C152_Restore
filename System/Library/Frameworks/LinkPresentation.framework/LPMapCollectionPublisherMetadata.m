@interface LPMapCollectionPublisherMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPImage)icon;
- (LPMapCollectionPublisherMetadata)initWithCoder:(id)a3;
- (NSString)name;
- (id)_guideCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (unsigned)numberOfPublishedCollections;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfPublishedCollections:(unsigned int)a3;
@end

@implementation LPMapCollectionPublisherMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPMapCollectionPublisherMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LPMapCollectionPublisherMetadata;
  v5 = [(LPMapCollectionPublisherMetadata *)&v13 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    v7 = *(void **)&v5->_numberOfPublishedCollections;
    *(void *)&v5->_numberOfPublishedCollections = v6;

    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = decodeNumberForKey(v4, @"numberOfPublishedCollections");
    *(_DWORD *)(&v5->super.__disallowsURLOverrideByDelegate + 2) = [v10 unsignedIntValue];

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_numberOfPublishedCollections, @"name");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_name, @"icon");
  id v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(&self->super.__disallowsURLOverrideByDelegate + 2)];
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", v4, @"numberOfPublishedCollections");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPMapCollectionPublisherMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(LPMapCollectionPublisherMetadata *)self name];
    [(LPMapCollectionPublisherMetadata *)v4 setName:v5];

    uint64_t v6 = [(LPMapCollectionPublisherMetadata *)self icon];
    [(LPMapCollectionPublisherMetadata *)v4 setIcon:v6];

    [(LPMapCollectionPublisherMetadata *)v4 setNumberOfPublishedCollections:[(LPMapCollectionPublisherMetadata *)self numberOfPublishedCollections]];
    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPMapCollectionPublisherMetadata;
  if ([(LPMapCollectionPublisherMetadata *)&v8 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      BOOL v5 = (objectsAreEqual_0(v6[2], *(void **)&self->_numberOfPublishedCollections) & 1) != 0
        && objectsAreEqual_0(v6[3], self->_name)
        && *((_DWORD *)v6 + 3) == *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
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
  return [*(id *)&self->_numberOfPublishedCollections hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"icon", @"numberOfPublishedCollections", 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfPublishedCollections;
}

- (void)setName:(id)a3
{
}

- (LPImage)icon
{
  return (LPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
}

- (unsigned)numberOfPublishedCollections
{
  return *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
}

- (void)setNumberOfPublishedCollections:(unsigned int)a3
{
  *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_numberOfPublishedCollections, 0);
}

- (id)_guideCount
{
  if ([(LPMapCollectionPublisherMetadata *)self numberOfPublishedCollections])
  {
    v3 = NSString;
    id v4 = LPLocalizedString(@"%d Guide(s)");
    BOOL v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, -[LPMapCollectionPublisherMetadata numberOfPublishedCollections](self, "numberOfPublishedCollections"));
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 commonPresentationPropertiesForStyle:31];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [(LPMapCollectionPublisherMetadata *)self icon];
  [v4 _populateProperties:v5 withPrimaryIcon:v7];

  uint64_t v8 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v8 - 2) < 2)
  {
    v19 = [(LPMapCollectionPublisherMetadata *)self name];
    v20 = [v5 captionBar];
    v21 = [v20 top];
    v22 = [v21 leading];
    [v22 setText:v19];

    v23 = [(LPMapCollectionPublisherMetadata *)self _guideCount];
    v24 = [v5 captionBar];
    v25 = [v24 bottom];
    v26 = [v25 leading];
    [v26 setText:v23];

    objc_super v13 = LPLocalizedString(@" Maps");
    v14 = [v5 captionBar];
    v15 = [v14 belowBottom];
    v16 = [v15 leading];
    [v16 setText:v13];
  }
  else if (v8)
  {
    if (v8 != 1) {
      goto LABEL_8;
    }
    v9 = [(LPMapCollectionPublisherMetadata *)self name];
    v10 = [v5 captionBar];
    v11 = [v10 top];
    v12 = [v11 leading];
    [v12 setText:v9];

    objc_super v13 = LPLocalizedString(@" Maps");
    v14 = [(LPMapCollectionPublisherMetadata *)self _guideCount];
    v15 = joinedByDot(v13, v14);
    v16 = [v5 captionBar];
    v17 = [v16 bottom];
    v18 = [v17 leading];
    [v18 setText:v15];
  }
  else
  {
    objc_super v13 = [(LPMapCollectionPublisherMetadata *)self name];
    v14 = [v5 captionBar];
    v15 = [v14 top];
    v16 = [v15 leading];
    [v16 setText:v13];
  }

LABEL_8:
  [v4 effectiveSizeClass];
  populatePropertiesForVisualRefresh(v5);

  return v5;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[LPPresentationSpecializations isAppleMapsURL:](LPPresentationSpecializations, "isAppleMapsURL:", v3)|| +[LPPresentationSpecializations isAppleMapsCollectionURL:v3];

  return v4;
}

- (id)previewSummaryForTransformer:(id)a3
{
  BOOL v4 = NSString;
  BOOL v5 = LPLocalizedString(@"Maps Guide: %@");
  uint64_t v6 = [(LPMapCollectionPublisherMetadata *)self name];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  id v3 = [(LPMapCollectionPublisherMetadata *)self icon];

  return v3;
}

- (id)fallbackIconForTransformer:(id)a3
{
  id v3 = +[LPResources mapIcon];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(LPMapCollectionPublisherMetadata *)self name];
  [v6 setTitle:v4];

  BOOL v5 = [(LPMapCollectionPublisherMetadata *)self icon];
  [v6 setIcon:v5];
}

@end
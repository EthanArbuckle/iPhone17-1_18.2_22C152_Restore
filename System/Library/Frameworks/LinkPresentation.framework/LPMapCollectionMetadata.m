@interface LPMapCollectionMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPImage)darkImage;
- (LPImage)icon;
- (LPImage)image;
- (LPImage)publisherIcon;
- (LPMapCollectionMetadata)initWithCoder:(id)a3;
- (NSArray)addresses;
- (NSString)name;
- (NSString)publisherName;
- (id)_bottomLine;
- (id)_resolvedImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fallbackIconForTransformer:(id)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (unsigned)numberOfItems;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setDarkImage:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfItems:(unsigned int)a3;
- (void)setPublisherIcon:(id)a3;
- (void)setPublisherName:(id)a3;
@end

@implementation LPMapCollectionMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPMapCollectionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)LPMapCollectionMetadata;
  v5 = [(LPMapCollectionMetadata *)&v26 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"name");
    v7 = *(void **)&v5->_numberOfItems;
    *(void *)&v5->_numberOfItems = v6;

    v8 = decodeNumberForKey(v4, @"numberOfItems");
    *(_DWORD *)(&v5->super.__disallowsURLOverrideByDelegate + 2) = [v8 unsignedIntValue];

    uint64_t v9 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"icon");
    name = v5->_name;
    v5->_name = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"image");
    icon = v5->_icon;
    v5->_icon = (LPImage *)v11;

    uint64_t v13 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"darkImage");
    image = v5->_image;
    v5->_image = (LPImage *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClasses:forKey:", v17, @"addresses");
    darkImage = v5->_darkImage;
    v5->_darkImage = (LPImage *)v18;

    uint64_t v20 = decodeStringForKey(v4, @"publisherName");
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v20;

    uint64_t v22 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"publisherIcon");
    publisherName = v5->_publisherName;
    v5->_publisherName = (NSString *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", *(void *)&self->_numberOfItems, @"name");
  id v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(&self->super.__disallowsURLOverrideByDelegate + 2)];
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", v4, @"numberOfItems");

  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_name, @"icon");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_icon, @"image");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_image, @"darkImage");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_darkImage, @"addresses");
  objc_msgSend(v5, "_lp_encodeStringIfNotNil:forKey:", self->_addresses, @"publisherName");
  objc_msgSend(v5, "_lp_encodeObjectIfNotNil:forKey:", self->_publisherName, @"publisherIcon");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPMapCollectionMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(LPMapCollectionMetadata *)self name];
    [(LPMapCollectionMetadata *)v4 setName:v5];

    [(LPMapCollectionMetadata *)v4 setNumberOfItems:[(LPMapCollectionMetadata *)self numberOfItems]];
    uint64_t v6 = [(LPMapCollectionMetadata *)self icon];
    [(LPMapCollectionMetadata *)v4 setIcon:v6];

    v7 = [(LPMapCollectionMetadata *)self image];
    [(LPMapCollectionMetadata *)v4 setImage:v7];

    v8 = [(LPMapCollectionMetadata *)self darkImage];
    [(LPMapCollectionMetadata *)v4 setDarkImage:v8];

    uint64_t v9 = [(LPMapCollectionMetadata *)self addresses];
    [(LPMapCollectionMetadata *)v4 setAddresses:v9];

    v10 = [(LPMapCollectionMetadata *)self publisherName];
    [(LPMapCollectionMetadata *)v4 setPublisherName:v10];

    uint64_t v11 = [(LPMapCollectionMetadata *)self publisherIcon];
    [(LPMapCollectionMetadata *)v4 setPublisherIcon:v11];

    v12 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPMapCollectionMetadata;
  if ([(LPMapCollectionMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], *(void **)&self->_numberOfItems) & 1) != 0
        && *((_DWORD *)v6 + 3) == *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2)
        && objectsAreEqual_0(v6[3], self->_name)
        && objectsAreEqual_0(v6[6], self->_darkImage)
        && objectsAreEqual_0(v6[4], self->_icon)
        && objectsAreEqual_0(v6[5], self->_image)
        && objectsAreEqual_0(v6[7], self->_addresses))
      {
        char v5 = objectsAreEqual_0(v6[8], self->_publisherName);
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
  return [*(id *)&self->_numberOfItems hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  v3 = (void (**)(id, __CFString *))a3;
  v3[2](v3, @"image");
  v3[2](v3, @"darkImage");
  v3[2](v3, @"icon");
  v3[2](v3, @"publisherIcon");
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"numberOfItems", @"icon", @"image", @"darkImage", @"addresses", @"publisherName", @"publisherIcon", 0);
}

- (NSString)name
{
  return *(NSString **)&self->_numberOfItems;
}

- (void)setName:(id)a3
{
}

- (unsigned)numberOfItems
{
  return *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2);
}

- (void)setNumberOfItems:(unsigned int)a3
{
  *(_DWORD *)(&self->super.__disallowsURLOverrideByDelegate + 2) = a3;
}

- (LPImage)icon
{
  return (LPImage *)self->_name;
}

- (void)setIcon:(id)a3
{
}

- (LPImage)image
{
  return self->_icon;
}

- (void)setImage:(id)a3
{
}

- (LPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
}

- (NSArray)addresses
{
  return (NSArray *)self->_darkImage;
}

- (void)setAddresses:(id)a3
{
}

- (NSString)publisherName
{
  return (NSString *)&self->_addresses->super.isa;
}

- (void)setPublisherName:(id)a3
{
}

- (LPImage)publisherIcon
{
  return (LPImage *)self->_publisherName;
}

- (void)setPublisherIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_darkImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_numberOfItems, 0);
}

- (id)_resolvedImage
{
  v3 = [(LPMapCollectionMetadata *)self image];
  id v4 = [v3 platformImage];

  if (v4)
  {
    char v5 = [LPImage alloc];
    uint64_t v6 = [(LPMapCollectionMetadata *)self image];
    id v4 = [(LPImage *)v5 _initWithImage:v6];

    v7 = [(LPMapCollectionMetadata *)self darkImage];
    [v4 _setDarkInterfaceAlternativeImage:v7];
  }

  return v4;
}

- (id)_bottomLine
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = LPLocalizedString(@"%d Place(s)");
  char v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, -[LPMapCollectionMetadata numberOfItems](self, "numberOfItems"));

  uint64_t v6 = [(LPMapCollectionMetadata *)self publisherName];

  if (v6)
  {
    v7 = [(LPMapCollectionMetadata *)self publisherName];
    objc_super v8 = joinedByDot(v7, v5);
  }
  else
  {
    uint64_t v9 = [(LPMapCollectionMetadata *)self addresses];
    v10 = (void *)[v9 count];

    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v12 = [(LPMapCollectionMetadata *)self addresses];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v17 = [v16 city];

            if (v17)
            {
              uint64_t v18 = [v16 city];
              [v11 addObject:v18];
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v13);
      }

      if ([v11 count])
      {
        v19 = (void *)MEMORY[0x1E4F28DF8];
        uint64_t v20 = [v11 allObjects];
        v10 = [v19 localizedStringByJoiningStrings:v20];
      }
      else
      {
        v10 = 0;
      }
    }
    objc_super v8 = joinedByDot(v5, v10);
  }

  return v8;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:31];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  if ([v4 effectiveSizeClass] == 2
    && ([(LPMapCollectionMetadata *)self icon], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    objc_super v8 = [(LPMapCollectionMetadata *)self image];

    if (v8)
    {
      uint64_t v9 = [(LPMapCollectionMetadata *)self _resolvedImage];
      [v4 _populateProperties:v5 withPrimaryImage:v9];
      goto LABEL_7;
    }
  }
  uint64_t v9 = [(LPMapCollectionMetadata *)self icon];
  [v4 _populateProperties:v5 withPrimaryIcon:v9];
LABEL_7:

  v10 = [v5 image];

  if (v10)
  {
    id v11 = [(LPMapCollectionMetadata *)self publisherIcon];
    v12 = [v5 captionBar];
    [v12 setTrailingIcon:v11];
  }
  else
  {
    if (!sizeClassRequiresLargeMedia([v4 effectiveSizeClass])) {
      goto LABEL_12;
    }
    id v11 = +[LPResources mapIcon];
    [v5 setImage:v11];
  }

LABEL_12:
  uint64_t v13 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style"));
  if ((unint64_t)(v13 - 2) < 2)
  {
    uint64_t v18 = [(LPMapCollectionMetadata *)self name];
    v19 = [v5 captionBar];
    uint64_t v20 = [v19 top];
    v21 = [v20 leading];
    [v21 setText:v18];

    long long v22 = [(LPMapCollectionMetadata *)self _bottomLine];
    long long v23 = [v5 captionBar];
    long long v24 = [v23 bottom];
    long long v25 = [v24 leading];
    [v25 setText:v22];

    uint64_t v14 = LPLocalizedString(@" Maps");
    v15 = [v5 captionBar];
    uint64_t v16 = [v15 belowBottom];
    v17 = [v16 leading];
    [v17 setText:v14];
  }
  else if (v13 == 1)
  {
    objc_super v26 = [(LPMapCollectionMetadata *)self name];
    uint64_t v27 = [v5 captionBar];
    v28 = [v27 top];
    v29 = [v28 leading];
    [v29 setText:v26];

    uint64_t v14 = [(LPMapCollectionMetadata *)self _bottomLine];
    v15 = [v5 captionBar];
    uint64_t v16 = [v15 bottom];
    v17 = [v16 leading];
    [v17 setText:v14];
  }
  else
  {
    if (v13) {
      goto LABEL_19;
    }
    uint64_t v14 = [(LPMapCollectionMetadata *)self name];
    v15 = [v5 captionBar];
    uint64_t v16 = [v15 top];
    v17 = [v16 leading];
    [v17 setText:v14];
  }

LABEL_19:
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
  char v5 = LPLocalizedString(@"Maps Guide: %@");
  uint64_t v6 = [(LPMapCollectionMetadata *)self name];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  BOOL v4 = [(LPMapCollectionMetadata *)self image];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(LPMapCollectionMetadata *)self icon];
  }
  v7 = v6;

  return v7;
}

- (id)fallbackIconForTransformer:(id)a3
{
  id v3 = +[LPImage _systemImageNamed:@"mappin"];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(LPMapCollectionMetadata *)self name];
  [v7 setTitle:v4];

  char v5 = [(LPMapCollectionMetadata *)self icon];
  [v7 setIcon:v5];

  id v6 = [(LPMapCollectionMetadata *)self image];
  [v7 setImage:v6];
}

@end
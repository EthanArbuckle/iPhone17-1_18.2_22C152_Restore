@interface MPModelRecordLabel
+ (id)__artworkCatalogBlock_KEY;
+ (id)__descriptionText_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
+ (id)__name_KEY;
+ (id)__shortDescriptionText_KEY;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyRecordLabelArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyRecordLabelDescriptionText__MAPPING_MISSING__;
+ (void)__MPModelPropertyRecordLabelEditorialArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyRecordLabelName__MAPPING_MISSING__;
+ (void)__MPModelPropertyRecordLabelShortDescriptionText__MAPPING_MISSING__;
- (id)artworkCatalog;
- (id)editorialArtworkCatalog;
@end

@implementation MPModelRecordLabel

+ (int64_t)genericObjectType
{
  return 19;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MPModelRecordLabel *)self editorialArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelRecordLabel *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelRecordLabel *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelRecordLabel *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyRecordLabelEditorialArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRecordLabel.m" lineNumber:31 description:@"Translator was missing mapping for MPModelPropertyRecordLabelEditorialArtwork"];
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyRecordLabelEditorialArtwork";
}

+ (void)__MPModelPropertyRecordLabelArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRecordLabel.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertyRecordLabelArtwork"];
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyRecordLabelArtwork";
}

+ (void)__MPModelPropertyRecordLabelShortDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRecordLabel.m" lineNumber:29 description:@"Translator was missing mapping for MPModelPropertyRecordLabelShortDescriptionText"];
}

+ (id)__shortDescriptionText_KEY
{
  return @"MPModelPropertyRecordLabelShortDescriptionText";
}

+ (void)__MPModelPropertyRecordLabelDescriptionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRecordLabel.m" lineNumber:28 description:@"Translator was missing mapping for MPModelPropertyRecordLabelDescriptionText"];
}

+ (id)__descriptionText_KEY
{
  return @"MPModelPropertyRecordLabelDescriptionText";
}

+ (void)__MPModelPropertyRecordLabelName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelRecordLabel.m" lineNumber:27 description:@"Translator was missing mapping for MPModelPropertyRecordLabelName"];
}

+ (id)__name_KEY
{
  return @"MPModelPropertyRecordLabelName";
}

@end
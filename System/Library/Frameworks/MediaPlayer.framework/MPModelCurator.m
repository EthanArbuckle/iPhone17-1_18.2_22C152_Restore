@interface MPModelCurator
+ (id)__brandLogoArtworkCatalogBlock_KEY;
+ (id)__curatorKind_KEY;
+ (id)__curatorSubKind_KEY;
+ (id)__editorNotes_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
+ (id)__handle_KEY;
+ (id)__shortEditorNotes_KEY;
+ (id)__shortName_KEY;
+ (id)kindWithVariants:(unint64_t)a3;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyCuratorBrandLogoArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorEditorialArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorHandle__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorKind__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorShortEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorShortName__MAPPING_MISSING__;
+ (void)__MPModelPropertyCuratorSubKind__MAPPING_MISSING__;
- (id)brandLogoArtworkCatalog;
- (id)editorialArtworkCatalog;
@end

@implementation MPModelCurator

+ (id)__shortName_KEY
{
  return @"MPModelPropertyCuratorShortName";
}

+ (id)__shortEditorNotes_KEY
{
  return @"MPModelPropertyCuratorShortEditorNotes";
}

+ (id)__handle_KEY
{
  return @"MPModelPropertyCuratorHandle";
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyCuratorEditorialArtwork";
}

+ (id)__editorNotes_KEY
{
  return @"MPModelPropertyCuratorEditorNotes";
}

+ (id)__curatorSubKind_KEY
{
  return @"MPModelPropertyCuratorSubKind";
}

+ (id)__curatorKind_KEY
{
  return @"MPModelPropertyCuratorKind";
}

+ (id)__brandLogoArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyCuratorBrandLogoArtwork";
}

+ (int64_t)genericObjectType
{
  return 16;
}

- (id)brandLogoArtworkCatalog
{
  uint64_t v3 = [(MPModelCurator *)self brandLogoArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelCurator *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MPModelCurator *)self editorialArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelCurator *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyCuratorHandle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:96 description:@"Translator was missing mapping for MPModelPropertyCuratorHandle"];
}

+ (void)__MPModelPropertyCuratorBrandLogoArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:95 description:@"Translator was missing mapping for MPModelPropertyCuratorBrandLogoArtwork"];
}

+ (void)__MPModelPropertyCuratorEditorialArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:94 description:@"Translator was missing mapping for MPModelPropertyCuratorEditorialArtwork"];
}

+ (void)__MPModelPropertyCuratorSubKind__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:93 description:@"Translator was missing mapping for MPModelPropertyCuratorSubKind"];
}

+ (void)__MPModelPropertyCuratorKind__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:92 description:@"Translator was missing mapping for MPModelPropertyCuratorKind"];
}

+ (void)__MPModelPropertyCuratorShortEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:91 description:@"Translator was missing mapping for MPModelPropertyCuratorShortEditorNotes"];
}

+ (void)__MPModelPropertyCuratorEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:90 description:@"Translator was missing mapping for MPModelPropertyCuratorEditorNotes"];
}

+ (void)__MPModelPropertyCuratorShortName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCurator.m" lineNumber:89 description:@"Translator was missing mapping for MPModelPropertyCuratorShortName"];
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return +[MPModelCuratorActualKind kindWithVariants:a3];
}

@end
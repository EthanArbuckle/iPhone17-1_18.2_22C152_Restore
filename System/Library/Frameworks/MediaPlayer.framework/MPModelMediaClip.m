@interface MPModelMediaClip
+ (id)__previewArtworkCatalogBlock_KEY;
+ (id)__staticAssets_KEY;
+ (id)__title_KEY;
+ (id)classesForSecureCoding;
+ (id)kind;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyMediaClipPreviewArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyMediaClipTitle__MAPPING_MISSING__;
+ (void)__MPModelRelationshipMediaClipStaticAssets__MAPPING_MISSING__;
- (id)humanDescription;
- (id)previewArtworkCatalog;
@end

@implementation MPModelMediaClip

- (id)previewArtworkCatalog
{
  uint64_t v3 = [(MPModelMediaClip *)self previewArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelMediaClip *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)humanDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(MPModelObject *)self identifiers];
  v5 = [v4 humanDescription];
  v6 = [v3 stringWithFormat:@"mediaClip %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyMediaClipTitle"])
  {
    v7 = NSString;
    v8 = [(MPModelMediaClip *)self title];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyMediaClipTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMediaClip.m" lineNumber:48 description:@"Translator was missing mapping for MPModelPropertyMediaClipTitle"];
}

+ (id)__title_KEY
{
  return @"MPModelPropertyMediaClipTitle";
}

+ (void)__MPModelRelationshipMediaClipStaticAssets__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMediaClip.m" lineNumber:47 description:@"Translator was missing mapping for MPModelRelationshipMediaClipStaticAssets"];
}

+ (id)__staticAssets_KEY
{
  return @"MPModelRelationshipMediaClipStaticAssets";
}

+ (void)__MPModelPropertyMediaClipPreviewArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelMediaClip.m" lineNumber:46 description:@"Translator was missing mapping for MPModelPropertyMediaClipPreviewArtwork"];
}

+ (id)__previewArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyMediaClipPreviewArtwork";
}

+ (id)kind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

+ (id)classesForSecureCoding
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (int64_t)genericObjectType
{
  return 10;
}

@end
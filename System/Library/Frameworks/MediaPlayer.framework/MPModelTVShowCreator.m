@interface MPModelTVShowCreator
+ (id)__artworkCatalogBlock_KEY;
+ (void)__MPModelPropertyTVShowCreatorArtwork__MAPPING_MISSING__;
- (id)artworkCatalog;
@end

@implementation MPModelTVShowCreator

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyTVShowCreatorArtwork";
}

+ (void)__MPModelPropertyTVShowCreatorArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShowCreator.m" lineNumber:18 description:@"Translator was missing mapping for MPModelPropertyTVShowCreatorArtwork"];
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelTVShowCreator *)self artworkCatalogBlock];
  id v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelTVShowCreator *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
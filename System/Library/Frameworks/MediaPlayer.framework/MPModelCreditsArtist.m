@interface MPModelCreditsArtist
+ (id)__artist_KEY;
+ (id)__artworkCatalogBlock_KEY;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyCreditsArtistArtwork__MAPPING_MISSING__;
+ (void)__MPModelRelationshipCreditsArtistRelatedArtist__MAPPING_MISSING__;
- (id)artworkCatalog;
@end

@implementation MPModelCreditsArtist

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelCreditsArtist *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelCreditsArtist *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyCreditsArtistArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCreditsArtist.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertyCreditsArtistArtwork"];
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyCreditsArtistArtwork";
}

+ (void)__MPModelRelationshipCreditsArtistRelatedArtist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelCreditsArtist.m" lineNumber:29 description:@"Translator was missing mapping for MPModelRelationshipCreditsArtistRelatedArtist"];
}

+ (id)__artist_KEY
{
  return @"MPModelRelationshipCreditsArtistRelatedArtist";
}

+ (int64_t)genericObjectType
{
  return 20;
}

@end
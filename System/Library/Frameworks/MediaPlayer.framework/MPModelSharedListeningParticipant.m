@interface MPModelSharedListeningParticipant
+ (id)__artworkCatalogBlock_KEY;
+ (id)kind;
+ (void)__MPModelPropertySharedListeningParticipantArtwork__MAPPING_MISSING__;
- (id)artworkCatalog;
@end

@implementation MPModelSharedListeningParticipant

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelSharedListeningParticipant *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelSharedListeningParticipant *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)kind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

+ (void)__MPModelPropertySharedListeningParticipantArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelSharedListeningParticipant.m" lineNumber:29 description:@"Translator was missing mapping for MPModelPropertySharedListeningParticipantArtwork"];
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertySharedListeningParticipantArtwork";
}

@end
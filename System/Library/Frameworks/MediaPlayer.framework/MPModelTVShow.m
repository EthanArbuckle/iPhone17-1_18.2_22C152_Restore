@interface MPModelTVShow
+ (id)__artworkCatalogBlock_KEY;
+ (id)__creator_KEY;
+ (id)__editorNotes_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
+ (id)__episodesCount_KEY;
+ (id)__shortEditorNotes_KEY;
+ (id)__shortTitle_KEY;
+ (id)__storeCanonicalID_KEY;
+ (id)__tagline_KEY;
+ (id)__title_KEY;
+ (id)kindWithSeasonKind:(id)a3;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyTVShowArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowEditorialArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowEpisodeCount__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowShortEditorNotes__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowShortTitle__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowStoreCanonicalID__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowTagline__MAPPING_MISSING__;
+ (void)__MPModelPropertyTVShowTitle__MAPPING_MISSING__;
+ (void)__MPModelRelationshipTVShowCreator__MAPPING_MISSING__;
- (id)artworkCatalog;
- (id)editorialArtworkCatalog;
- (id)humanDescription;
@end

@implementation MPModelTVShow

+ (id)__title_KEY
{
  return @"MPModelPropertyTVShowTitle";
}

+ (id)__tagline_KEY
{
  return @"MPModelPropertyTVShowTagline";
}

+ (id)__storeCanonicalID_KEY
{
  return @"MPModelPropertyTVShowStoreCanonicalID";
}

+ (id)__shortTitle_KEY
{
  return @"MPModelPropertyTVShowShortTitle";
}

+ (id)__shortEditorNotes_KEY
{
  return @"MPModelPropertyTVShowShortEditorNotes";
}

+ (id)__episodesCount_KEY
{
  return @"MPModelPropertyTVShowEpisodeCount";
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyTVShowEditorialArtwork";
}

+ (id)__editorNotes_KEY
{
  return @"MPModelPropertyTVShowEditorNotes";
}

+ (id)__creator_KEY
{
  return @"MPModelRelationshipTVShowCreator";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyTVShowArtwork";
}

+ (int64_t)genericObjectType
{
  return 8;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MPModelTVShow *)self editorialArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelTVShow *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelTVShow *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelTVShow *))(v3 + 16))(v3, self);
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
  v6 = [v3 stringWithFormat:@"TV show %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyTVShowTitle"])
  {
    v7 = NSString;
    v8 = [(MPModelTVShow *)self title];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyTVShowStoreCanonicalID__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:87 description:@"Translator was missing mapping for MPModelPropertyTVShowStoreCanonicalID"];
}

+ (void)__MPModelPropertyTVShowTagline__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:86 description:@"Translator was missing mapping for MPModelPropertyTVShowTagline"];
}

+ (void)__MPModelPropertyTVShowEpisodeCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:85 description:@"Translator was missing mapping for MPModelPropertyTVShowEpisodeCount"];
}

+ (void)__MPModelPropertyTVShowEditorialArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:84 description:@"Translator was missing mapping for MPModelPropertyTVShowEditorialArtwork"];
}

+ (void)__MPModelPropertyTVShowArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:83 description:@"Translator was missing mapping for MPModelPropertyTVShowArtwork"];
}

+ (void)__MPModelRelationshipTVShowCreator__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:82 description:@"Translator was missing mapping for MPModelRelationshipTVShowCreator"];
}

+ (void)__MPModelPropertyTVShowShortEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:81 description:@"Translator was missing mapping for MPModelPropertyTVShowShortEditorNotes"];
}

+ (void)__MPModelPropertyTVShowEditorNotes__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:80 description:@"Translator was missing mapping for MPModelPropertyTVShowEditorNotes"];
}

+ (void)__MPModelPropertyTVShowShortTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:79 description:@"Translator was missing mapping for MPModelPropertyTVShowShortTitle"];
}

+ (void)__MPModelPropertyTVShowTitle__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelTVShow.m" lineNumber:78 description:@"Translator was missing mapping for MPModelPropertyTVShowTitle"];
}

+ (id)kindWithSeasonKind:(id)a3
{
  return +[MPModelTVShowKind kindWithSeasonKind:a3];
}

@end
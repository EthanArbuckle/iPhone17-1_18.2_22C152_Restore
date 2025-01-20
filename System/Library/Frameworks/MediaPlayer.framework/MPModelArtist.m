@interface MPModelArtist
+ (id)__albumCount_KEY;
+ (id)__artworkCatalogBlock_KEY;
+ (id)__classicalExperienceAvailable_KEY;
+ (id)__dateFavorited_KEY;
+ (id)__editorialArtworkCatalogBlock_KEY;
+ (id)__genre_KEY;
+ (id)__hasBiography_KEY;
+ (id)__isDisliked_KEY;
+ (id)__isFavorite_KEY;
+ (id)__libraryAddedDate_KEY;
+ (id)__libraryAdded_KEY;
+ (id)__songCount_KEY;
+ (id)kindWithAlbumKind:(id)a3;
+ (id)requiredStoreLibraryPersonalizationProperties;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyArtistAlbumCount__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistClassicalExperienceAvailable__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistDateFavorited__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistEditorialArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistHasBiography__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistIsDisliked__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistIsFavorite__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistLibraryAdded__MAPPING_MISSING__;
+ (void)__MPModelPropertyArtistSongCount__MAPPING_MISSING__;
+ (void)__MPModelRelationshipArtistGenre__MAPPING_MISSING__;
- (id)artworkCatalog;
- (id)editorialArtworkCatalog;
- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3;
- (id)personalizationScopedPropertiesForProperties:(id)a3;
@end

@implementation MPModelArtist

+ (id)__songCount_KEY
{
  return @"MPModelPropertyArtistSongCount";
}

+ (id)__libraryAdded_KEY
{
  return @"MPModelPropertyArtistLibraryAdded";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyArtistLibraryAddedDate";
}

+ (id)__isFavorite_KEY
{
  return @"MPModelPropertyArtistIsFavorite";
}

+ (id)__isDisliked_KEY
{
  return @"MPModelPropertyArtistIsDisliked";
}

+ (id)__hasBiography_KEY
{
  return @"MPModelPropertyArtistHasBiography";
}

+ (id)__genre_KEY
{
  return @"MPModelRelationshipArtistGenre";
}

+ (id)__editorialArtworkCatalogBlock_KEY
{
  return @"MPModelPropertyArtistEditorialArtwork";
}

+ (id)__dateFavorited_KEY
{
  return @"MPModelPropertyArtistDateFavorited";
}

+ (id)__classicalExperienceAvailable_KEY
{
  return @"MPModelPropertyArtistClassicalExperienceAvailable";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyArtistArtwork";
}

+ (id)__albumCount_KEY
{
  return @"MPModelPropertyArtistAlbumCount";
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelPropertyArtistIsFavorite";
  v5[1] = @"MPModelPropertyArtistIsDisliked";
  v5[2] = @"MPModelPropertyArtistLibraryAdded";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)editorialArtworkCatalog
{
  uint64_t v3 = [(MPModelArtist *)self editorialArtworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelArtist *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelArtist *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelArtist *))(v3 + 16))(v3, self);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)__MPModelPropertyArtistLibraryAdded__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:84 description:@"Translator was missing mapping for MPModelPropertyArtistLibraryAdded"];
}

+ (void)__MPModelPropertyArtistDateFavorited__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:83 description:@"Translator was missing mapping for MPModelPropertyArtistDateFavorited"];
}

+ (void)__MPModelPropertyArtistIsDisliked__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:82 description:@"Translator was missing mapping for MPModelPropertyArtistIsDisliked"];
}

+ (void)__MPModelPropertyArtistIsFavorite__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:81 description:@"Translator was missing mapping for MPModelPropertyArtistIsFavorite"];
}

+ (void)__MPModelPropertyArtistClassicalExperienceAvailable__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:80 description:@"Translator was missing mapping for MPModelPropertyArtistClassicalExperienceAvailable"];
}

+ (void)__MPModelPropertyArtistLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:79 description:@"Translator was missing mapping for MPModelPropertyArtistLibraryAddedDate"];
}

+ (void)__MPModelPropertyArtistAlbumCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:78 description:@"Translator was missing mapping for MPModelPropertyArtistAlbumCount"];
}

+ (void)__MPModelPropertyArtistSongCount__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:77 description:@"Translator was missing mapping for MPModelPropertyArtistSongCount"];
}

+ (void)__MPModelRelationshipArtistGenre__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:76 description:@"Translator was missing mapping for MPModelRelationshipArtistGenre"];
}

+ (void)__MPModelPropertyArtistEditorialArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:75 description:@"Translator was missing mapping for MPModelPropertyArtistEditorialArtwork"];
}

+ (void)__MPModelPropertyArtistArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:74 description:@"Translator was missing mapping for MPModelPropertyArtistArtwork"];
}

+ (void)__MPModelPropertyArtistHasBiography__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelArtist.m" lineNumber:73 description:@"Translator was missing mapping for MPModelPropertyArtistHasBiography"];
}

+ (id)kindWithAlbumKind:(id)a3
{
  return +[MPModelArtistKind kindWithAlbumKind:a3];
}

+ (int64_t)genericObjectType
{
  return 3;
}

- (id)objectWithStoreLibraryPersonalizationRelativeModelObject:(id)a3
{
  return a3;
}

- (id)personalizationScopedPropertiesForProperties:(id)a3
{
  return a3;
}

@end
@interface MPModelGenre
+ (id)__artworkCatalogBlock_KEY;
+ (id)__libraryAddedDate_KEY;
+ (id)__name_KEY;
+ (id)kindWithAlbumKind:(id)a3;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyGenreArtwork__MAPPING_MISSING__;
+ (void)__MPModelPropertyGenreLibraryAddedDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyGenreName__MAPPING_MISSING__;
- (id)artworkCatalog;
- (id)humanDescription;
@end

@implementation MPModelGenre

+ (id)__name_KEY
{
  return @"MPModelPropertyGenreName";
}

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyGenreLibraryAddedDate";
}

+ (id)__artworkCatalogBlock_KEY
{
  return @"MPModelPropertyGenreArtwork";
}

+ (int64_t)genericObjectType
{
  return 15;
}

- (id)artworkCatalog
{
  uint64_t v3 = [(MPModelGenre *)self artworkCatalogBlock];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t, MPModelGenre *))(v3 + 16))(v3, self);
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
  v6 = [v3 stringWithFormat:@"genre %@", v5];

  if ([(MPModelObject *)self hasLoadedValueForKey:@"MPModelPropertyGenreName"])
  {
    v7 = NSString;
    v8 = [(MPModelGenre *)self name];
    v9 = [v7 stringWithFormat:@"“%@” ", v8];

    [v6 insertString:v9 atIndex:0];
  }

  return v6;
}

+ (void)__MPModelPropertyGenreLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenre.m" lineNumber:80 description:@"Translator was missing mapping for MPModelPropertyGenreLibraryAddedDate"];
}

+ (void)__MPModelPropertyGenreArtwork__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenre.m" lineNumber:79 description:@"Translator was missing mapping for MPModelPropertyGenreArtwork"];
}

+ (void)__MPModelPropertyGenreName__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelGenre.m" lineNumber:78 description:@"Translator was missing mapping for MPModelPropertyGenreName"];
}

+ (id)kindWithAlbumKind:(id)a3
{
  return +[MPModelGenreKind kindWithAlbumKind:a3];
}

@end
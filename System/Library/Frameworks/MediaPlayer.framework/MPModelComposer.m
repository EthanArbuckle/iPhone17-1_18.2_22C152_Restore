@interface MPModelComposer
+ (id)__libraryAddedDate_KEY;
+ (id)kindWithAlbumKind:(id)a3;
+ (int64_t)genericObjectType;
+ (void)__MPModelPropertyComposerLibraryAddedDate__MAPPING_MISSING__;
@end

@implementation MPModelComposer

+ (id)__libraryAddedDate_KEY
{
  return @"MPModelPropertyComposerLibraryAddedDate";
}

+ (void)__MPModelPropertyComposerLibraryAddedDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelComposer.m" lineNumber:70 description:@"Translator was missing mapping for MPModelPropertyComposerLibraryAddedDate"];
}

+ (id)kindWithAlbumKind:(id)a3
{
  return +[MPModelComposerKind kindWithAlbumKind:a3];
}

+ (int64_t)genericObjectType
{
  return 14;
}

@end
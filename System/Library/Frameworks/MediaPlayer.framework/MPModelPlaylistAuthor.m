@interface MPModelPlaylistAuthor
+ (id)__isPendingApproval_KEY;
+ (id)__playlist_KEY;
+ (id)__position_KEY;
+ (id)__role_KEY;
+ (id)__socialProfile_KEY;
+ (id)kindWithVariants:(unint64_t)a3;
+ (void)__MPModelPropertyPlaylistAuthorIsPendingApproval__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistAuthorPosition__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistAuthorRole__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistAuthorPlaylist__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistAuthorSocialProfile__MAPPING_MISSING__;
@end

@implementation MPModelPlaylistAuthor

+ (id)__socialProfile_KEY
{
  return @"MPModelRelationshipPlaylistAuthorSocialProfile";
}

+ (id)__role_KEY
{
  return @"MPModelPropertyPlaylistAuthorRole";
}

+ (id)__position_KEY
{
  return @"MPModelPropertyPlaylistAuthorPosition";
}

+ (id)__playlist_KEY
{
  return @"MPModelRelationshipPlaylistAuthorPlaylist";
}

+ (id)__isPendingApproval_KEY
{
  return @"MPModelPropertyPlaylistAuthorIsPendingApproval";
}

+ (id)kindWithVariants:(unint64_t)a3
{
  return +[MPModelPlaylistAuthorKind kindWithVariants:a3];
}

+ (void)__MPModelPropertyPlaylistAuthorPosition__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistAuthor.m" lineNumber:51 description:@"Translator was missing mapping for MPModelPropertyPlaylistAuthorPosition"];
}

+ (void)__MPModelPropertyPlaylistAuthorIsPendingApproval__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistAuthor.m" lineNumber:50 description:@"Translator was missing mapping for MPModelPropertyPlaylistAuthorIsPendingApproval"];
}

+ (void)__MPModelPropertyPlaylistAuthorRole__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistAuthor.m" lineNumber:49 description:@"Translator was missing mapping for MPModelPropertyPlaylistAuthorRole"];
}

+ (void)__MPModelRelationshipPlaylistAuthorSocialProfile__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistAuthor.m" lineNumber:48 description:@"Translator was missing mapping for MPModelRelationshipPlaylistAuthorSocialProfile"];
}

+ (void)__MPModelRelationshipPlaylistAuthorPlaylist__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistAuthor.m" lineNumber:47 description:@"Translator was missing mapping for MPModelRelationshipPlaylistAuthorPlaylist"];
}

@end
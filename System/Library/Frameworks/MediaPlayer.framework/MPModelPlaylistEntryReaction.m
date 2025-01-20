@interface MPModelPlaylistEntryReaction
+ (id)__date_KEY;
+ (id)__playlistEntry_KEY;
+ (id)__reactionText_KEY;
+ (id)__socialProfile_KEY;
+ (void)__MPModelPropertyPlaylistEntryReactionDate__MAPPING_MISSING__;
+ (void)__MPModelPropertyPlaylistEntryReactionText__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntryReactionPlaylistEntry__MAPPING_MISSING__;
+ (void)__MPModelRelationshipPlaylistEntryReactionSocialProfile__MAPPING_MISSING__;
@end

@implementation MPModelPlaylistEntryReaction

+ (id)__socialProfile_KEY
{
  return @"MPModelRelationshipPlaylistEntryReactionSocialProfile";
}

+ (id)__reactionText_KEY
{
  return @"MPModelPropertyPlaylistEntryReactionText";
}

+ (id)__playlistEntry_KEY
{
  return @"MPModelRelationshipPlaylistEntryReactionPlaylistEntry";
}

+ (id)__date_KEY
{
  return @"MPModelPropertyPlaylistEntryReactionDate";
}

+ (void)__MPModelPropertyPlaylistEntryReactionDate__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntryReaction.m" lineNumber:31 description:@"Translator was missing mapping for MPModelPropertyPlaylistEntryReactionDate"];
}

+ (void)__MPModelPropertyPlaylistEntryReactionText__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntryReaction.m" lineNumber:30 description:@"Translator was missing mapping for MPModelPropertyPlaylistEntryReactionText"];
}

+ (void)__MPModelRelationshipPlaylistEntryReactionSocialProfile__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntryReaction.m" lineNumber:29 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntryReactionSocialProfile"];
}

+ (void)__MPModelRelationshipPlaylistEntryReactionPlaylistEntry__MAPPING_MISSING__
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"MPModelPlaylistEntryReaction.m" lineNumber:28 description:@"Translator was missing mapping for MPModelRelationshipPlaylistEntryReactionPlaylistEntry"];
}

@end
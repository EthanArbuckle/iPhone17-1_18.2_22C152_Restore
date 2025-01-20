@interface MPModelPlaylistEntryReactionKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelPlaylistEntryReactionKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (id)humanDescription
{
  return @"playlist entry reaction";
}

@end
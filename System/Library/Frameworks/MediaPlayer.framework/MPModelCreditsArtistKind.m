@interface MPModelCreditsArtistKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelCreditsArtistKind

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

- (id)humanDescription
{
  return @"credits artist";
}

@end
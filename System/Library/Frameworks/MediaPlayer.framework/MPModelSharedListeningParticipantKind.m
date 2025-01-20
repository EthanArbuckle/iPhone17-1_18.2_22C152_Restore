@interface MPModelSharedListeningParticipantKind
+ (id)identityKind;
- (id)humanDescription;
@end

@implementation MPModelSharedListeningParticipantKind

- (id)humanDescription
{
  return @"shared listening participant";
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

@end
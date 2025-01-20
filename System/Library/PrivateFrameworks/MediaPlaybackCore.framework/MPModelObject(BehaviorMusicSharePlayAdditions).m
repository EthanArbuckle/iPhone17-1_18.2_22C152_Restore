@interface MPModelObject(BehaviorMusicSharePlayAdditions)
- (id)msp_shortDescription;
@end

@implementation MPModelObject(BehaviorMusicSharePlayAdditions)

- (id)msp_shortDescription
{
  v2 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@:", objc_opt_class()];
  v3 = [a1 identifiers];
  int v4 = [v3 isPlaceholder];

  if (v4) {
    [v2 appendString:@" placeholder"];
  }
  [v2 appendString:@">"];
  v5 = (void *)[v2 copy];

  return v5;
}

@end
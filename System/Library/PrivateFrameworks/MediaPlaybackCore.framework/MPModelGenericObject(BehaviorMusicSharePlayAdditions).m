@interface MPModelGenericObject(BehaviorMusicSharePlayAdditions)
- (id)msp_shortDescription;
@end

@implementation MPModelGenericObject(BehaviorMusicSharePlayAdditions)

- (id)msp_shortDescription
{
  v1 = [a1 anyObject];
  v2 = objc_msgSend(v1, "msp_shortDescription");
  v3 = (void *)[v2 mutableCopy];

  [v3 insertString:@"Generic-" atIndex:1];
  v4 = (void *)[v3 copy];

  return v4;
}

@end
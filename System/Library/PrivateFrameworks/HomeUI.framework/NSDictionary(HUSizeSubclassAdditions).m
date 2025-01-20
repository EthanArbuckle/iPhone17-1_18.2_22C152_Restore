@interface NSDictionary(HUSizeSubclassAdditions)
- (id)hu_objectForViewSizeSubclass:()HUSizeSubclassAdditions;
@end

@implementation NSDictionary(HUSizeSubclassAdditions)

- (id)hu_objectForViewSizeSubclass:()HUSizeSubclassAdditions
{
  return _HUObjectForSizeSubclass(a3, a1);
}

@end
@interface _EARUserProfileContainer(SFUtilitiesAdditions)
- (id)loadDate;
- (void)setLoadDate:()SFUtilitiesAdditions;
@end

@implementation _EARUserProfileContainer(SFUtilitiesAdditions)

- (void)setLoadDate:()SFUtilitiesAdditions
{
}

- (id)loadDate
{
  return objc_getAssociatedObject(a1, kEARUserProfileContainerLoadDateKey);
}

@end
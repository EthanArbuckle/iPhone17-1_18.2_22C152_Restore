@interface _EARUserProfileContainer(CESRUtilitiesAdditions)
- (id)loadDate;
- (void)setLoadDate:()CESRUtilitiesAdditions;
@end

@implementation _EARUserProfileContainer(CESRUtilitiesAdditions)

- (void)setLoadDate:()CESRUtilitiesAdditions
{
}

- (id)loadDate
{
  return objc_getAssociatedObject(a1, kEARUserProfileContainerLoadDateKey);
}

@end
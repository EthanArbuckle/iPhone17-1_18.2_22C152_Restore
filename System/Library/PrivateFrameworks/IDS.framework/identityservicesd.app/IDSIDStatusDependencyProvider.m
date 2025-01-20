@interface IDSIDStatusDependencyProvider
- (id)currentDate;
- (id)newRemoteCredential;
@end

@implementation IDSIDStatusDependencyProvider

- (id)newRemoteCredential
{
  return objc_alloc_init((Class)IDSRemoteCredential);
}

- (id)currentDate
{
  id v2 = objc_alloc_init((Class)NSDate);

  return v2;
}

@end
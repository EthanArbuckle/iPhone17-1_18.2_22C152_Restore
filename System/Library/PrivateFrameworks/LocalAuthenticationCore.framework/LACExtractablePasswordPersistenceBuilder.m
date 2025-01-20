@interface LACExtractablePasswordPersistenceBuilder
+ (id)passwordPersistenceWithOptions:(id)a3;
@end

@implementation LACExtractablePasswordPersistenceBuilder

+ (id)passwordPersistenceWithOptions:(id)a3
{
  id v3 = a3;
  v4 = [[LACExtractablePasswordPersistenceStandardAdapter alloc] initWithOptions:v3];

  return v4;
}

@end
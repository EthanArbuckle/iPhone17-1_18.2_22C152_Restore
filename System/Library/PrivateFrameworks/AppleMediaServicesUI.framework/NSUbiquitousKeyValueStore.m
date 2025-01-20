@interface NSUbiquitousKeyValueStore
+ (id)ams_encryptedAllPlatformsStoreWithIdentifier:(id)a3;
@end

@implementation NSUbiquitousKeyValueStore

+ (id)ams_encryptedAllPlatformsStoreWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:v3 type:2];

  return v4;
}

@end
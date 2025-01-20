@interface APSigningAuthoritySettings
+ (id)storageWithDefaultValues:(id)a3;
@end

@implementation APSigningAuthoritySettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  v4 = [[APSettingsStorageUserDefaults alloc] initWithDefaultValues:v3];

  return v4;
}

@end
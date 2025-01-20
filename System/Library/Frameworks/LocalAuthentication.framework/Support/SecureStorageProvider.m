@interface SecureStorageProvider
+ (id)sharedInstance;
- (id)secureStorage;
- (id)secureStorageWithConfig:(id)a3;
@end

@implementation SecureStorageProvider

+ (id)sharedInstance
{
  if (qword_100046E00 != -1) {
    dispatch_once(&qword_100046E00, &stru_100038850);
  }
  v2 = (void *)qword_100046DF8;

  return v2;
}

- (id)secureStorage
{
  v2 = objc_alloc_init(SecureStorage);

  return v2;
}

- (id)secureStorageWithConfig:(id)a3
{
  id v3 = a3;
  v4 = [[SecureStorage alloc] initWithConfig:v3];

  return v4;
}

@end
@interface OTManagedConfigurationActualAdapter
- (BOOL)isCloudKeychainSyncAllowed;
@end

@implementation OTManagedConfigurationActualAdapter

- (BOOL)isCloudKeychainSyncAllowed
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)qword_1002B0FB0;
  uint64_t v11 = qword_1002B0FB0;
  if (!qword_1002B0FB0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10021044C;
    v7[3] = &unk_100282FC0;
    v7[4] = &v8;
    sub_10021044C((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  v4 = [v3 sharedConnection];
  unsigned __int8 v5 = [v4 isCloudKeychainSyncAllowed];

  return v5;
}

@end
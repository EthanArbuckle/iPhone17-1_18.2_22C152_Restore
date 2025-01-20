@interface CRKASMCredentialStoreFactory
+ (CRKASMCredentialStore)instructorCredentialStore;
+ (CRKASMCredentialStore)instructorCredentialStoreWithoutKeychain;
+ (CRKASMCredentialStore)studentCredentialStore;
+ (id)makeCredentialStoreWithRole:(id)a3 keychainOverride:(id)a4;
+ (id)makeInstructorCredentialStoreWithKeychainOverride:(id)a3;
+ (id)storageKeyWithRole:(id)a3 suffix:(id)a4;
@end

@implementation CRKASMCredentialStoreFactory

+ (CRKASMCredentialStore)studentCredentialStore
{
  return (CRKASMCredentialStore *)[a1 makeCredentialStoreWithRole:@"student" keychainOverride:0];
}

+ (CRKASMCredentialStore)instructorCredentialStore
{
  return (CRKASMCredentialStore *)[a1 makeInstructorCredentialStoreWithKeychainOverride:0];
}

+ (CRKASMCredentialStore)instructorCredentialStoreWithoutKeychain
{
  v3 = objc_opt_new();
  v4 = [a1 makeInstructorCredentialStoreWithKeychainOverride:v3];

  return (CRKASMCredentialStore *)v4;
}

+ (id)makeInstructorCredentialStoreWithKeychainOverride:(id)a3
{
  return (id)[a1 makeCredentialStoreWithRole:@"instructor" keychainOverride:a3];
}

+ (id)makeCredentialStoreWithRole:(id)a3 keychainOverride:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 storageKeyWithRole:v7 suffix:@"certificates"];
  v9 = [a1 storageKeyWithRole:v7 suffix:@"identities"];

  if (v6)
  {
    id v10 = v6;
  }
  else
  {
    v11 = +[CRKKeychainProvider sharedProvider];
    id v10 = [v11 keychain];
  }
  v12 = [[CRKASMCredentialStore alloc] initWithKeychain:v10 accessGroup:@"com.apple.classroom" certificateManifestStorageKey:v8 identityManifestStorageKey:v9];

  return v12;
}

+ (id)storageKeyWithRole:(id)a3 suffix:(id)a4
{
  return (id)[NSString stringWithFormat:@"com.apple.classroom.asm.%@.annotations.%@", a3, a4];
}

@end
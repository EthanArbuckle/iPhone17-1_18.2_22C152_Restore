@interface MKFCKSharedUserPrivateRoot
+ (id)createWithHomeModelID:(id)a3 persistentStore:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)rootKeyPath;
+ (unint64_t)cloudStoreTypes;
@end

@implementation MKFCKSharedUserPrivateRoot

+ (id)createWithHomeModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithContext:v8];
  [v8 assignObject:v11 toPersistentStore:v9];

  [v11 setModelID:v10];
  [v11 setHomeModelID:v10];

  v12 = [MEMORY[0x263EFF910] now];
  [v11 setWriterTimestamp:v12];

  v13 = MKFCKModelCurrentWriterVersionString();
  [v11 setWriterVersion:v13];

  return v11;
}

+ (id)rootKeyPath
{
  return 0;
}

+ (unint64_t)cloudStoreTypes
{
  return 1;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKSharedUserPrivateRoot"];
}

@end
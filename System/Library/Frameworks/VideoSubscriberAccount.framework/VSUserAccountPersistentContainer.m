@interface VSUserAccountPersistentContainer
+ (id)loadStoreURL;
- (id)initInMemory:(BOOL)a3;
- (void)configureDescriptonInMemory:(BOOL)a3;
@end

@implementation VSUserAccountPersistentContainer

- (id)initInMemory:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C120];
  v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v8 = [v5 mergedModelFromBundles:v7];

  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The model parameter must not be nil."];
  }
  v12.receiver = self;
  v12.super_class = (Class)VSUserAccountPersistentContainer;
  v9 = [(NSPersistentCloudKitContainer *)&v12 initWithName:@"VSPersistentUserAccount" managedObjectModel:v8];
  v10 = v9;
  if (v9) {
    [(VSUserAccountPersistentContainer *)v9 configureDescriptonInMemory:v3];
  }

  return v10;
}

- (void)configureDescriptonInMemory:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = [(NSPersistentContainer *)self persistentStoreDescriptions];
  v6 = [v5 firstObject];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[self persistentStoreDescriptions] firstObject] parameter must not be nil."];
  }
  v7 = [(NSPersistentContainer *)self persistentStoreDescriptions];
  v8 = [v7 firstObject];

  if (v3)
  {
    [v8 setShouldAddStoreAsynchronously:0];
    v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"/dev/null"];
    [v8 setURL:v9];

    [v8 setType:*MEMORY[0x1E4F1BDE0]];
  }
  else
  {
    [v8 setShouldAddStoreAsynchronously:1];
    v10 = +[VSUserAccountPersistentContainer loadStoreURL];
    [v8 setURL:v10];

    [v8 setShouldMigrateStoreAutomatically:1];
    [v8 setShouldInferMappingModelAutomatically:1];
    [v8 setType:*MEMORY[0x1E4F1BF70]];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C148]) initWithContainerIdentifier:@"com.apple.tv.federated"];
    [v11 setApsConnectionMachServiceName:@"com.apple.videosubscriptionsd"];
    [v11 setOperationMemoryThresholdBytes:&unk_1F34D0CD0];
    [v8 setCloudKitContainerOptions:v11];
    objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C058]) initWithContainerIdentifier:@"com.apple.tv.federated"];
    [v12 setApsConnectionMachServiceName:@"com.apple.videosubscriptionsd"];
    [v8 setOption:v12 forMirroringKey:*MEMORY[0x1E4F1BED0]];
  }
  v14[0] = v8;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(NSPersistentCloudKitContainer *)self setPersistentStoreDescriptions:v13];
}

+ (id)loadStoreURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v3 = [v2 URLsForDirectory:14 inDomains:1];
  v4 = [v3 firstObject];

  v5 = [v4 URLByAppendingPathComponent:@"videosubscriptionsd" isDirectory:1];
  v6 = [v5 URLByAppendingPathComponent:@"VSUserAccounts.sqlite" isDirectory:0];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [serviceSupportDirectory URLByAppendingPathComponent:@\"VSUserAccounts.sqlite\" isDirectory:__objc_no] parameter must not be nil."];
  }
  v7 = [v5 URLByAppendingPathComponent:@"VSUserAccounts.sqlite" isDirectory:0];

  return v7;
}

@end
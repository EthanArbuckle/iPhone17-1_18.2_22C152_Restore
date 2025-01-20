@interface NSMemoryObjectStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
- (NSMemoryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)type;
@end

@implementation NSMemoryObjectStore

- (NSMemoryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  self;
  if (!a5) {
    a5 = (id)[MEMORY[0x1E4F1CB10] URLWithString:objc_msgSend(NSString, "stringWithFormat:", @"memory://%lx", self)];
  }
  v16.receiver = self;
  v16.super_class = (Class)NSMemoryObjectStore;
  v11 = [(NSMappedObjectStore *)&v16 initWithPersistentStoreCoordinator:a3 configurationName:a4 URL:a5 options:a6];
  if (v11)
  {
    uint64_t v12 = [a6 objectForKey:@"_NSInMemoryStoreArchivedData"];
    if (v12) {
      v13 = [[NSDictionaryStoreMap alloc] initWithStore:v11 fromArchivedData:v12];
    }
    else {
      v13 = [[NSDictionaryStoreMap alloc] initWithStore:v11];
    }
    v14 = v13;
    -[NSMappedObjectStore _setMap:](v11, v13);
    -[NSMappedObjectStore setMetadata:](v11, "setMetadata:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", -[NSPersistentStoreMap databaseUUID]((uint64_t)v14), @"NSStoreUUID", @"InMemory", @"NSStoreType", 0));
  }
  return v11;
}

- (id)type
{
  return @"InMemory";
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)[a1 metadataForPersistentStoreWithURL:a3 options:0 error:a4];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return [a1 setMetadata:a3 forPersistentStoreWithURL:a4 options:0 error:a5];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:0];
  }
  return 0;
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134000 userInfo:0];
  }
  return 0;
}

@end
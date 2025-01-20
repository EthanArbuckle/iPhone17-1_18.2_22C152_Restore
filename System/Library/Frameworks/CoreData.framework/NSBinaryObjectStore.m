@interface NSBinaryObjectStore
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5;
+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4;
+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (uint64_t)_classesForPropertyValues;
- (NSBinaryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6;
- (id)type;
- (void)saveDocumentToPath:(id)a3;
@end

@implementation NSBinaryObjectStore

+ (uint64_t)_classesForPropertyValues
{
  self;
  if (!_classesForPropertyValues_expectedClasses)
  {
    v0 = (void *)[(id)+[_PFRoutines attributeClassesForSecureCoding]() mutableCopy];
    [v0 addObject:objc_opt_class()];
    uint64_t v1 = 0;
    atomic_compare_exchange_strong(&_classesForPropertyValues_expectedClasses, (unint64_t *)&v1, (unint64_t)v0);
    if (v1) {
  }
    }
  return _classesForPropertyValues_expectedClasses;
}

- (NSBinaryObjectStore)initWithPersistentStoreCoordinator:(id)a3 configurationName:(id)a4 URL:(id)a5 options:(id)a6
{
  self;
  if (!a5)
  {

    v26 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v27 = *MEMORY[0x1E4F1C3C8];
    v28 = @"Cannot create a binary store with a nil URL.";
    goto LABEL_29;
  }
  if (([a5 isFileURL] & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v30 = *MEMORY[0x1E4F1C3C8];
    v28 = (__CFString *)[NSString stringWithFormat:@"CoreData binary stores only support file URLs (got %@).", a5];
    v26 = v29;
    uint64_t v27 = v30;
LABEL_29:
    objc_exception_throw((id)[v26 exceptionWithName:v27 reason:v28 userInfo:0]);
  }
  id v43 = 0;
  __int16 v42 = 0;
  if (!+[NSPersistentStore doURLStuff:a5 createdStubFile:(char *)&v42 + 1 readOnly:&v42 error:&v43 options:a6])
  {

    uint64_t v31 = *MEMORY[0x1E4F1C3C8];
    uint64_t v32 = [v43 code];
    v33 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v43, @"NSUnderlyingException", 0);
    v34 = @"Error validating url for store";
    uint64_t v35 = v31;
    uint64_t v36 = v32;
    goto LABEL_36;
  }
  if ((_BYTE)v42
    && (objc_msgSend((id)objc_msgSend(a6, "valueForKey:", @"NSReadOnlyPersistentStoreOption"), "BOOLValue") & 1) == 0)
  {
    if ([a6 valueForKey:@"NSReadOnlyPersistentStoreOption"]) {
      BOOL v11 = BYTE5(z9dsptsiQ80etb9782fsrs98bfdle88) == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      uint64_t v39 = *MEMORY[0x1E4F1C3C8];
      if (v43) {
        v33 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v43 forKey:*MEMORY[0x1E4F28A50]];
      }
      else {
        v33 = 0;
      }
      v34 = @"Attempt to add read-only store read-write";
      uint64_t v35 = v39;
      uint64_t v36 = 513;
LABEL_36:
      id v40 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v35, v36, (uint64_t)v34, v33);
      objc_exception_throw(v40);
    }
    if (a6)
    {
      a6 = (id)[a6 mutableCopy];
      objc_msgSend(a6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption");
    }
    else
    {
      a6 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSReadOnlyPersistentStoreOption");
    }
    _NSCoreDataLog(2, @"Attempt to add read-only file at path %@ read/write. Adding it read-only instead. This will be a hard error in the future; you must specify the NSReadOnlyPersistentStoreOption.",
      v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      (uint64_t)a5);
  }
  v41.receiver = self;
  v41.super_class = (Class)NSBinaryObjectStore;
  v18 = [(NSMappedObjectStore *)&v41 initWithPersistentStoreCoordinator:a3 configurationName:a4 URL:a5 options:a6];
  v19 = v18;
  if (v18)
  {
    if (HIBYTE(v42))
    {
      [(NSPersistentStore *)v18 _setMetadataDirty:1];
      [(NSPersistentStore *)v19 doFilesystemCleanupOnRemove:1];
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    if (([a5 isFileURL] & 1) == 0)
    {
      v37 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v38 = [NSString stringWithFormat:@"NSBinaryObjectStore only supports file URLs right now."];
      objc_exception_throw((id)[v37 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v38 userInfo:0]);
    }
    v21 = (void *)[a5 path];
    memset(&v44, 0, sizeof(v44));
    if (stat((const char *)[v21 fileSystemRepresentation], &v44) || v44.st_size < 1) {
      v22 = [[NSDictionaryStoreMap alloc] initWithStore:v19];
    }
    else {
      v22 = -[NSDictionaryStoreMap initWithStore:fromPath:]([NSDictionaryStoreMap alloc], "initWithStore:fromPath:", v19, [a5 path]);
    }
    v23 = v22;
    if (v22) {
      -[NSMappedObjectStore _setMap:](v19, v22);
    }
    [v20 drain];

    id v24 = 0;
  }
  return v19;
}

- (void)saveDocumentToPath:(id)a3
{
  if ([(NSPersistentStore *)self isReadOnly]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Can't save store to %@ (read-only store)", a3), 0 reason userInfo]);
  }
  if (self) {
    theMap = self->super._theMap;
  }
  else {
    theMap = 0;
  }
  -[NSDictionaryStoreMap saveToPath:]((uint64_t)theMap, a3);

  [(NSPersistentStore *)self doFilesystemCleanupOnRemove:0];
}

- (id)type
{
  return @"Binary";
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 error:(id *)a4
{
  return (id)[a1 metadataForPersistentStoreWithURL:a3 options:0 error:a4];
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 error:(id *)a5
{
  return [a1 setMetadata:a3 forPersistentStoreWithURL:a4 options:0 error:a5];
}

+ (id)metadataForPersistentStoreWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  if (([a3 isFileURL] & 1) == 0)
  {
    if (!a5) {
      return 0;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v8 = (NSBinaryObjectStoreFile *)objc_msgSend(v11, "initWithObjectsAndKeys:", a3, *MEMORY[0x1E4F289D0], 0);
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:262 userInfo:v8];
LABEL_20:

    return 0;
  }
  uint64_t v16 = 0;
  v8 = objc_alloc_init(NSBinaryObjectStoreFile);
  if (byte_1EB270AB4)
  {
    v9 = (void *)[a4 objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
    if (v9) {
      int v10 = [v9 BOOLValue] ^ 1;
    }
    else {
      int v10 = 1;
    }
  }
  else
  {
    int v10 = 0;
  }
  if ((-[NSBinaryObjectStoreFile readMetadataFromFile:securely:error:]((uint64_t)v8, [a3 path], v10, &v16) & 1) == 0)
  {
    if (a5) {
      *a5 = v16;
    }
    goto LABEL_20;
  }
  if (v8) {
    fullMetadata = v8->_fullMetadata;
  }
  else {
    fullMetadata = 0;
  }
  id v13 = (id)[(NSDictionary *)fullMetadata copy];

  uint64_t v14 = (void *)[v13 objectForKey:@"NSStoreType"];
  if (v14 && ![v14 isEqualToString:@"Binary"]) {
    id v13 = 0;
  }
  if (v13) {
    return v13;
  }
  else {
    return (id)NSDictionary_EmptyDictionary;
  }
}

+ (BOOL)setMetadata:(id)a3 forPersistentStoreWithURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___NSBinaryObjectStore;
  if (!objc_msgSendSuper2(&v26, sel_setMetadata_forPersistentStoreWithURL_error_, a3, a4, a6)) {
    return 0;
  }
  if (byte_1EB270AB4)
  {
    int v10 = (void *)[a5 objectForKey:@"_NSBinaryStoreInsecureDecodingCompatibilityOption"];
    if (v10) {
      int v11 = [v10 BOOLValue] ^ 1;
    }
    else {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  id v13 = objc_alloc_init(NSBinaryObjectStoreFile);
  if (!-[NSBinaryObjectStoreFile readMetadataFromFile:securely:error:]((uint64_t)v13, [a4 path], v11, a6))
  {
    BOOL v12 = 0;
    if (!v13) {
      return v12;
    }
LABEL_40:

    return v12;
  }
  uint64_t v14 = (NSDictionary *)[a3 mutableCopy];
  uint64_t v15 = v14;
  if (v13) {
    fullMetadata = v13->_fullMetadata;
  }
  else {
    fullMetadata = 0;
  }
  if (![(NSDictionary *)v14 objectForKey:0x1ED796A00])
  {
    uint64_t v17 = [(NSDictionary *)fullMetadata objectForKey:0x1ED796A00];
    if (v17) {
      [(NSDictionary *)v15 setObject:v17 forKey:0x1ED796A00];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:@"NSStoreModelVersionHashes"])
  {
    uint64_t v18 = [(NSDictionary *)fullMetadata objectForKey:@"NSStoreModelVersionHashes"];
    if (v18) {
      [(NSDictionary *)v15 setObject:v18 forKey:@"NSStoreModelVersionHashes"];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:@"NSStoreModelVersionIdentifiers"])
  {
    uint64_t v19 = [(NSDictionary *)fullMetadata objectForKey:@"NSStoreModelVersionIdentifiers"];
    if (v19) {
      [(NSDictionary *)v15 setObject:v19 forKey:@"NSStoreModelVersionIdentifiers"];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:0x1ED796400])
  {
    uint64_t v20 = [(NSDictionary *)fullMetadata objectForKey:0x1ED796400];
    if (v20) {
      [(NSDictionary *)v15 setObject:v20 forKey:0x1ED796400];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:@"NSStoreModelVersionChecksumKey"])
  {
    uint64_t v21 = [(NSDictionary *)fullMetadata objectForKey:@"NSStoreModelVersionChecksumKey"];
    if (v21) {
      [(NSDictionary *)v15 setObject:v21 forKey:@"NSStoreModelVersionChecksumKey"];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:@"NSStoreType"])
  {
    uint64_t v22 = [(NSDictionary *)fullMetadata objectForKey:@"NSStoreType"];
    if (v22) {
      [(NSDictionary *)v15 setObject:v22 forKey:@"NSStoreType"];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:@"NSStoreUUID"])
  {
    uint64_t v23 = [(NSDictionary *)fullMetadata objectForKey:@"NSStoreUUID"];
    if (v23) {
      [(NSDictionary *)v15 setObject:v23 forKey:@"NSStoreUUID"];
    }
  }
  if (![(NSDictionary *)v15 objectForKey:0x1ED796A20]) {
    [(NSDictionary *)v15 setObject:+[_PFRoutines _getPFBundleVersionNumber]() forKey:0x1ED796A20];
  }
  if (v13 && v13->_fullMetadata != v15)
  {
    uint64_t v24 = [(NSDictionary *)v15 copy];

    v13->_fullMetadata = (NSDictionary *)v24;
  }

  BOOL v12 = -[NSBinaryObjectStoreFile writeMetadataToFile:error:](v13, [a4 path], a6);
  if (v13) {
    goto LABEL_40;
  }
  return v12;
}

@end
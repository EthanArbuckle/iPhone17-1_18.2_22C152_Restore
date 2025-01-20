@interface _MKFApplicationData
+ (Class)cd_modelClass;
+ (Protocol)backingModelProtocol;
+ (id)appDataDictionaryForContainer:(id)a3;
+ (id)castIfApplicationDataContainer:(id)a3;
+ (id)fetchRequest;
+ (id)hmd_parentAttributeKeyPaths;
+ (id)modelIDForContainerUUID:(id)a3;
+ (id)modelIDForParentRelationshipTo:(id)a3;
+ (void)setAppDataDictionary:(id)a3 forContainer:(id)a4;
- (BOOL)hasValidContainer;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
- (MKFApplicationDataDatabaseID)databaseID;
- (NSUUID)hmd_parentModelID;
@end

@implementation _MKFApplicationData

- (NSUUID)hmd_parentModelID
{
  uint64_t v3 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v3) & 1) == 0)
  {
    v8 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  v4 = objc_msgSend((id)objc_opt_class(), "hmd_parentAttributeKeyPaths");
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__138097;
  v14 = __Block_byref_object_dispose__138098;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68___MKFApplicationData_HMDBackingStoreModelObject__hmd_parentModelID__block_invoke;
  v9[3] = &unk_264A21138;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);
  v5 = (void *)v11[5];
  if (v5)
  {
    v6 = objc_msgSend(v5, "hmd_modelID");
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return (NSUUID *)v6;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (MKFApplicationDataDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFApplicationDataDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (BOOL)hasValidContainer
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = +[_MKFApplicationData hmd_parentAttributeKeyPaths];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [(_MKFApplicationData *)self valueForKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * i)];

        if (v9) {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
    BOOL v10 = v6 == 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MKFApplicationData;
  BOOL v5 = -[_MKFModel validateForInsertOrUpdate:](&v8, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    if ([(_MKFApplicationData *)self hasValidContainer])
    {
      LOBYTE(v5) = 1;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", @"Must have exactly one container");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v6;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E580A60;
}

+ (id)hmd_parentAttributeKeyPaths
{
  if (hmd_parentAttributeKeyPaths__hmf_once_t3 != -1) {
    dispatch_once(&hmd_parentAttributeKeyPaths__hmf_once_t3, &__block_literal_global_259_204219);
  }
  v2 = (void *)hmd_parentAttributeKeyPaths__hmf_once_v4;
  return v2;
}

+ (id)castIfApplicationDataContainer:(id)a3
{
  uint64_t v3 = castIfApplicationDataContainer___hmf_once_t0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&castIfApplicationDataContainer___hmf_once_t0, &__block_literal_global_204239);
  }
  if ([(id)castIfApplicationDataContainer___hmf_once_v1 objectConforms:v4]) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = [a3 modelID];
  BOOL v5 = [a1 modelIDForContainerUUID:v4];

  return v5;
}

+ (id)modelIDForContainerUUID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08C38];
  id v4 = a3;
  BOOL v5 = [@"AppData" dataUsingEncoding:4];
  id v6 = objc_msgSend(v3, "hmf_UUIDWithNamespace:data:", v4, v5);

  return v6;
}

+ (void)setAppDataDictionary:(id)a3 forContainer:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 applicationData];
  if ([v13 count])
  {
    if (v7)
    {
      objc_super v8 = [(_MKFApplicationData *)v7 appDataDictionary];
      char v9 = HMFEqualObjects();

      if (v9) {
        goto LABEL_9;
      }
      BOOL v10 = (void *)[v13 copy];
      [(_MKFApplicationData *)v7 setAppDataDictionary:v10];
    }
    else
    {
      BOOL v10 = [v6 managedObjectContext];
      uint64_t v7 = [[_MKFApplicationData alloc] initWithContext:v10];
      v11 = [a1 modelIDForParentRelationshipTo:v6];
      [(_MKFApplicationData *)v7 setModelID:v11];

      long long v12 = (void *)[v13 copy];
      [(_MKFApplicationData *)v7 setAppDataDictionary:v12];

      [v6 setApplicationData:v7];
    }
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    [v6 setApplicationData:0];
    BOOL v10 = [(_MKFApplicationData *)v7 managedObjectContext];
    [v10 deleteObject:v7];
  }

LABEL_9:
}

+ (id)appDataDictionaryForContainer:(id)a3
{
  uint64_t v3 = [a3 applicationData];
  id v4 = [v3 appDataDictionary];

  return v4;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFApplicationData"];
}

@end
@interface NSManagedObject
@end

@implementation NSManagedObject

void __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 entity];
  __keyNameForEntity(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v6 = [v3 valueForKey:v7];
  [v5 setObject:v3 forKey:v6];
}

void __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 backingModelKey];
  if (!v3)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  v4 = (void *)v3;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v3];
  if (v5)
  {
    v6 = (void *)v5;
    [*(id *)(a1 + 32) removeObjectForKey:v4];
  }
  else
  {
    id v7 = [v13 backingModelType];
    v8 = +[HMCContext managedObjectClassFromProtocol:v7];

    if (!*(unsigned char *)(a1 + 72))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_8;
    }
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = [v13 backingModelKey];
    v6 = __createNewObject(v9, v8, v10, v11);
  }
  if (([v13 updateBackingModel:v6 error:0] & 1) == 0)
  {
LABEL_13:
    uint64_t v12 = _HMFPreconditionFailure();
    __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_3(v12);
    return;
  }
  [*(id *)(a1 + 56) addObject:v6];

LABEL_8:
}

void __78__NSManagedObject_HomeKitDaemon__mkf_synchronizeRelation_items_allowCreation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 managedObjectContext];
  [v3 deleteObject:v2];
}

@end
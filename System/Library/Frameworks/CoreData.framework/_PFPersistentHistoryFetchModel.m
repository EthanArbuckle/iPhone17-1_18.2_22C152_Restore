@interface _PFPersistentHistoryFetchModel
+ (id)ancillaryModelNamespace;
+ (id)newFetchHistoryModelForCoordinator:andOptions:;
+ (unint64_t)ancillaryEntityCount;
+ (unint64_t)ancillaryEntityOffset;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
@end

@implementation _PFPersistentHistoryFetchModel

+ (id)ancillaryModelNamespace
{
  return @"PersistentFetchHistory";
}

+ (id)newFetchHistoryModelForCoordinator:andOptions:
{
  v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  if (!historyFetchModel)
  {
    v1 = (void *)MEMORY[0x18C127630](v0);
    id v2 = [[NSEntityDescription alloc] _initWithName:@"Transaction"];
    id v3 = [[NSAttributeDescription alloc] _initWithName:@"author" type:700];
    [v2 _addProperty:v3];

    id v4 = [[NSAttributeDescription alloc] _initWithName:@"contextName" type:700];
    [v2 _addProperty:v4];

    id v5 = [[NSAttributeDescription alloc] _initWithName:@"bundleID" type:700];
    [v2 _addProperty:v5];

    id v6 = [[NSAttributeDescription alloc] _initWithName:@"processID" type:700];
    [v2 _addProperty:v6];

    id v7 = [[NSAttributeDescription alloc] _initWithName:@"timestamp" type:900];
    [v2 _addProperty:v7];

    id v8 = [[NSAttributeDescription alloc] _initWithName:@"transactionNumber" type:300];
    [v2 _addProperty:v8];

    id v9 = [[NSAttributeDescription alloc] _initWithName:@"token" type:300];
    [v2 _addProperty:v9];

    id v10 = [[NSEntityDescription alloc] _initWithName:@"Change"];
    id v11 = [[NSAttributeDescription alloc] _initWithName:@"changeID" type:300];
    [v10 _addProperty:v11];

    id v12 = [[NSAttributeDescription alloc] _initWithName:@"changeType" type:300];
    [v10 _addProperty:v12];

    id v13 = [[NSAttributeDescription alloc] _initWithName:@"changedEntity" type:300];
    [v10 _addProperty:v13];

    v14 = objc_alloc_init(NSAttributeDescription);
    [(NSPropertyDescription *)v14 setName:@"changedObjectID"];
    if (v14)
    {
      [(NSPropertyDescription *)v14 _throwIfNotEditable];
      v14->_type = 2000;
    }
    [v10 _addProperty:v14];

    [v2 _flattenProperties];
    [v10 _flattenProperties];
    v15 = [NSManagedObjectModel alloc];
    v19[0] = v2;
    v19[1] = v10;
    id v16 = -[NSManagedObjectModel _initWithEntities:](v15, "_initWithEntities:", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2]);
    objc_msgSend(v16, "_setModelsReferenceIDOffset:", +[_PFPersistentHistoryFetchModel ancillaryEntityOffset](_PFPersistentHistoryFetchModel, "ancillaryEntityOffset"));
    [v16 _setIsEditable:0];

    uint64_t v17 = 0;
    atomic_compare_exchange_strong(&historyFetchModel, (unint64_t *)&v17, (unint64_t)v16);
    if (v17) {
  }
    }
  return (id)historyFetchModel;
}

+ (unint64_t)ancillaryEntityOffset
{
  return 16050;
}

+ (unint64_t)ancillaryEntityCount
{
  return 2;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    self;
  }
}

+ (void)_invalidateStaticCaches
{
  uint64_t v2 = (void *)historyFetchModel;
  if (historyFetchModel)
  {
    uint64_t v3 = historyFetchModel;
    atomic_compare_exchange_strong(&historyFetchModel, (unint64_t *)&v3, 0);
    if ((void *)v3 == v2) {
  }
    }
}

@end
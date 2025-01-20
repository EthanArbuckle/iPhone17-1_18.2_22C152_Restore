@interface HDDemoDataBaseSampleGeneratorObjectCollection
- (HDDemoDataBaseSampleGeneratorObjectCollection)init;
- (id)objectsFromPhone;
- (id)objectsFromPhoneApps;
- (id)objectsFromWatch;
- (void)addObjectFromPhone:(id)a3;
- (void)addObjectFromWatch:(id)a3;
- (void)addObjects:(id)a3 fromPhoneAppWithBundleIdentifier:(id)a4;
- (void)addObjectsFromPhone:(id)a3;
- (void)addObjectsFromWatch:(id)a3;
- (void)enumerateLooseObjectAssociations:(id)a3;
- (void)enumerateObjectAssociations:(id)a3;
- (void)setAssociatedObjectUUIDs:(id)a3 forObjectUUID:(id)a4;
- (void)setLooseAssociatedObjectUUIDs:(id)a3 forObjectUUID:(id)a4;
@end

@implementation HDDemoDataBaseSampleGeneratorObjectCollection

- (HDDemoDataBaseSampleGeneratorObjectCollection)init
{
  v14.receiver = self;
  v14.super_class = (Class)HDDemoDataBaseSampleGeneratorObjectCollection;
  v2 = [(HDDemoDataBaseSampleGeneratorObjectCollection *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objectsFromPhone = v2->_objectsFromPhone;
    v2->_objectsFromPhone = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objectsFromWatch = v2->_objectsFromWatch;
    v2->_objectsFromWatch = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectsFromPhoneApps = v2->_objectsFromPhoneApps;
    v2->_objectsFromPhoneApps = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectUUIDToAssocatedObjectUUIDs = v2->_objectUUIDToAssocatedObjectUUIDs;
    v2->_objectUUIDToAssocatedObjectUUIDs = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objectUUIDToLooseAssocatedObjectUUIDs = v2->_objectUUIDToLooseAssocatedObjectUUIDs;
    v2->_objectUUIDToLooseAssocatedObjectUUIDs = v11;
  }
  return v2;
}

- (void)addObjectFromPhone:(id)a3
{
}

- (void)addObjectsFromPhone:(id)a3
{
}

- (void)addObjects:(id)a3 fromPhoneAppWithBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_objectsFromPhoneApps objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_objectsFromPhoneApps objectForKeyedSubscript:v6];
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    v8 = (void *)[v9 mutableCopy];
    [(NSMutableDictionary *)self->_objectsFromPhoneApps setObject:v8 forKeyedSubscript:v6];
  }
}

- (void)addObjectFromWatch:(id)a3
{
}

- (void)addObjectsFromWatch:(id)a3
{
}

- (id)objectsFromPhone
{
  return (id)[(NSMutableSet *)self->_objectsFromPhone allObjects];
}

- (id)objectsFromWatch
{
  return (id)[(NSMutableSet *)self->_objectsFromWatch allObjects];
}

- (id)objectsFromPhoneApps
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_objectsFromPhoneApps, "count"));
  objectsFromPhoneApps = self->_objectsFromPhoneApps;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HDDemoDataBaseSampleGeneratorObjectCollection_objectsFromPhoneApps__block_invoke;
  v7[3] = &unk_1E630E9D0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)objectsFromPhoneApps enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __69__HDDemoDataBaseSampleGeneratorObjectCollection_objectsFromPhoneApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 allObjects];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)setAssociatedObjectUUIDs:(id)a3 forObjectUUID:(id)a4
{
}

- (void)enumerateObjectAssociations:(id)a3
{
  id v4 = a3;
  objectUUIDToAssocatedObjectUUIDs = self->_objectUUIDToAssocatedObjectUUIDs;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateObjectAssociations___block_invoke;
  v7[3] = &unk_1E630E9F8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)objectUUIDToAssocatedObjectUUIDs enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __77__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateObjectAssociations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLooseAssociatedObjectUUIDs:(id)a3 forObjectUUID:(id)a4
{
}

- (void)enumerateLooseObjectAssociations:(id)a3
{
  id v4 = a3;
  objectUUIDToLooseAssocatedObjectUUIDs = self->_objectUUIDToLooseAssocatedObjectUUIDs;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateLooseObjectAssociations___block_invoke;
  v7[3] = &unk_1E630E9F8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)objectUUIDToLooseAssocatedObjectUUIDs enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __82__HDDemoDataBaseSampleGeneratorObjectCollection_enumerateLooseObjectAssociations___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUUIDToLooseAssocatedObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_objectUUIDToAssocatedObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_objectsFromPhoneApps, 0);
  objc_storeStrong((id *)&self->_objectsFromWatch, 0);

  objc_storeStrong((id *)&self->_objectsFromPhone, 0);
}

@end
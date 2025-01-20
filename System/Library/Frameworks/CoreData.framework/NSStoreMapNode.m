@interface NSStoreMapNode
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSStoreMapNode)initWithCoder:(id)a3;
- (NSStoreMapNode)initWithObjectID:(id)a3;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)configurationName;
- (id)destinationsForRelationship:(id)a3;
- (id)entity;
- (id)key;
- (id)objectID;
- (unsigned)_versionNumber;
- (void)_setMap:(uint64_t)a1;
- (void)_setVersionNumber:(unsigned int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSStoreMapNode

+ (void)initialize
{
}

- (NSStoreMapNode)initWithObjectID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSStoreMapNode;
  v4 = [(NSStoreMapNode *)&v6 init];
  if (v4)
  {
    v4->_objectID = (NSManagedObjectID *)a3;
    v4->_relatedNodes = (NSMutableDictionary *)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
    v4->_map = 0;
    v4->_version = 1;
  }
  return v4;
}

- (NSStoreMapNode)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSStoreMapNode;
  v4 = [(NSStoreMapNode *)&v9 init];
  v4->_version = 1;
  uint64_t v5 = [a3 decodeInt64ForKey:@"NSPrimaryKey64"];
  if (v5) {
    objc_super v6 = (NSManagedObjectID *)[objc_alloc(NSNumber) initWithUnsignedLongLong:v5];
  }
  else {
    objc_super v6 = (NSManagedObjectID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSKey"];
  }
  v4->_objectID = v6;
  if (!v6) {
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4864, &unk_1ED7E23E8));
  }
  v7 = (NSMutableDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines attributeClassesForSecureCoding]() forKey:@"NSRelatedNodes"];
  v4->_relatedNodes = v7;
  if (!v7) {
    v4->_relatedNodes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v4->_entityName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSEntityName"];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = [(NSManagedObjectID *)self->_objectID _referenceData];
  if ([v5 isNSNumber]) {
    objc_msgSend(a3, "encodeInt64:forKey:", objc_msgSend(v5, "unsignedLongLongValue"), @"NSPrimaryKey64");
  }
  else {
    [a3 encodeObject:v5 forKey:@"NSKey"];
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[NSEntityDescription name](-[NSManagedObjectID entity](self->_objectID, "entity"), "name"), @"NSEntityName");
  if ([(NSMutableDictionary *)self->_relatedNodes count])
  {
    relatedNodes = self->_relatedNodes;
    [a3 encodeObject:relatedNodes forKey:@"NSRelatedNodes"];
  }
}

- (void)dealloc
{
  self->_objectID = 0;
  self->_relatedNodes = 0;

  self->_entityName = 0;
  self->_map = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSStoreMapNode;
  [(NSStoreMapNode *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || !objc_msgSend(-[NSStoreMapNode objectID](self, "objectID"), "isEqual:", objc_msgSend(a3, "objectID")))
  {
    return 0;
  }
  if (!self)
  {
    relatedNodes = 0;
    if (a3) {
      goto LABEL_5;
    }
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  relatedNodes = self->_relatedNodes;
  if (!a3) {
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v7 = *((void *)a3 + 3);
LABEL_6:

  return [(NSMutableDictionary *)relatedNodes isEqual:v7];
}

- (id)objectID
{
  return self->_objectID;
}

- (id)key
{
  return [(NSManagedObjectID *)self->_objectID _referenceData];
}

- (id)entity
{
  return [(NSManagedObjectID *)self->_objectID entity];
}

- (id)configurationName
{
  return [(NSPersistentStoreMap *)self->_map configurationName];
}

- (id)destinationsForRelationship:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_relatedNodes objectForKey:a3];
}

- (void)_setMap:(uint64_t)a1
{
  if (a1)
  {
    *(void *)(a1 + 8) = a2;
    if (*(void *)(a1 + 32))
    {
      if (a2) {
        objc_super v3 = *(void **)(a2 + 8);
      }
      else {
        objc_super v3 = 0;
      }
      v4 = *(void **)(a1 + 16);
      uint64_t v5 = objc_msgSend((id)objc_msgSend(v3, "_persistentStoreCoordinator"), "managedObjectModel");
      uint64_t v6 = v5;
      if (!v5 || (uint64_t v7 = [*(id *)(v5 + 32) objectForKey:*(void *)(a1 + 32)]) == 0)
      {
        uint64_t v8 = [NSString stringWithFormat:@"Can't find entity %@ in model %@", *(void *)(a1 + 32), v6];

        *(void *)(a1 + 32) = 0;
        id v9 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134020, v8, 0);
        objc_exception_throw(v9);
      }
      *(void *)(a1 + 16) = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "objectIDFactoryForEntity:", v7)), "initWithObject:", v4);

      *(void *)(a1 + 32) = 0;
    }
  }
}

- (unsigned)_versionNumber
{
  return self->_version;
}

- (void)_setVersionNumber:(unsigned int)a3
{
  self->_version = a3;
}

- (const)knownKeyValuesPointer
{
  return 0;
}

- (id)_snapshot_
{
  return 0;
}

@end
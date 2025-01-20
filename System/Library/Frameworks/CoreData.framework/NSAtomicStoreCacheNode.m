@interface NSAtomicStoreCacheNode
+ (BOOL)accessInstanceVariablesDirectly;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSAtomicStoreCacheNode)init;
- (NSAtomicStoreCacheNode)initWithObjectID:(NSManagedObjectID *)moid;
- (NSManagedObjectID)objectID;
- (NSMutableDictionary)propertyCache;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)valueForKey:(NSString *)key;
- (unsigned)_versionNumber;
- (void)_setVersionNumber:(unsigned int)a3;
- (void)dealloc;
- (void)setPropertyCache:(NSMutableDictionary *)propertyCache;
- (void)setValue:(id)value forKey:(NSString *)key;
@end

@implementation NSAtomicStoreCacheNode

+ (void)initialize
{
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (NSAtomicStoreCacheNode)init
{
}

- (NSAtomicStoreCacheNode)initWithObjectID:(NSManagedObjectID *)moid
{
  if (!moid) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSAtomicStoreCacheNodes must be created with an objectID" userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSAtomicStoreCacheNode;
  v4 = [(NSAtomicStoreCacheNode *)&v6 init];
  if (v4)
  {
    v4->_objectID = moid;
    v4->__versionNumber = 1;
    v4->_propertyCache = 0;
  }
  return v4;
}

- (void)dealloc
{
  self->_objectID = 0;
  self->_propertyCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSAtomicStoreCacheNode;
  [(NSAtomicStoreCacheNode *)&v3 dealloc];
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (unsigned)_versionNumber
{
  return self->__versionNumber;
}

- (void)_setVersionNumber:(unsigned int)a3
{
  self->__versionNumber = a3;
}

- (const)knownKeyValuesPointer
{
  return 0;
}

- (id)_snapshot_
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  objectID = self->_objectID;
  uint64_t v8 = *((void *)a3 + 1);

  return [(NSManagedObjectID *)objectID isEqual:v8];
}

- (NSMutableDictionary)propertyCache
{
  return self->_propertyCache;
}

- (void)setPropertyCache:(NSMutableDictionary *)propertyCache
{
  v4 = self->_propertyCache;
  if (v4 != propertyCache)
  {
    uint64_t v5 = v4;
    self->_propertyCache = propertyCache;
  }
}

- (id)valueForKey:(NSString *)key
{
  uint64_t v5 = [(NSManagedObjectID *)self->_objectID entity];
  if (v5) {
    uint64_t v5 = (NSEntityDescription *)v5->_propertyMapping;
  }
  if ([(NSEntityDescription *)v5 indexForKey:key] == 0x7FFFFFFFFFFFFFFFLL) {
    return -[NSAtomicStoreCacheNode valueForKey:](&v10, sel_valueForKey_, key, v9.receiver, v9.super_class, self, NSAtomicStoreCacheNode);
  }
  v7 = [(NSManagedObjectID *)self->_objectID entity];
  if (v7) {
    v7 = [(NSDictionary *)[(NSEntityDescription *)v7 propertiesByName] objectForKey:key];
  }
  if ([(NSEntityDescription *)v7 isTransient]) {
    return -[NSAtomicStoreCacheNode valueForKey:](&v9, sel_valueForKey_, key, self, NSAtomicStoreCacheNode, v10.receiver, v10.super_class);
  }
  propertyCache = self->_propertyCache;

  return (id)[(NSMutableDictionary *)propertyCache valueForKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  v7 = [(NSManagedObjectID *)self->_objectID entity];
  if (v7) {
    v7 = (NSEntityDescription *)v7->_propertyMapping;
  }
  if ([(NSEntityDescription *)v7 indexForKey:key] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSAtomicStoreCacheNode;
    [(NSAtomicStoreCacheNode *)&v9 setValue:value forKey:key];
  }
  propertyCache = self->_propertyCache;
  if (propertyCache)
  {
    if (value)
    {
LABEL_7:
      [(NSMutableDictionary *)propertyCache setValue:value forKey:key];
      return;
    }
  }
  else
  {
    propertyCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_propertyCache = propertyCache;
    if (value) {
      goto LABEL_7;
    }
  }
  [(NSMutableDictionary *)propertyCache removeObjectForKey:key];
}

@end
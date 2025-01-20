@interface NSIncrementalStoreNode
+ (void)initialize;
- (NSIncrementalStoreNode)initWithObjectID:(NSManagedObjectID *)objectID withValues:(NSDictionary *)values version:(uint64_t)version;
- (NSIncrementalStoreNode)initWithObjectID:(id)a3 fromSQLRow:(id)a4;
- (NSManagedObjectID)objectID;
- (const)knownKeyValuesPointer;
- (id)_propertyCache;
- (id)_snapshot_;
- (id)description;
- (id)valueForPropertyDescription:(NSPropertyDescription *)prop;
- (uint64_t)version;
- (unsigned)_versionNumber;
- (void)dealloc;
- (void)updateWithValues:(NSDictionary *)values version:(uint64_t)version;
@end

@implementation NSIncrementalStoreNode

- (const)knownKeyValuesPointer
{
  return (const void **)[self->_propertyCache values];
}

- (unsigned)_versionNumber
{
  return self->_versionNumber;
}

- (id)_snapshot_
{
  return 0;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSIncrementalStoreNode)initWithObjectID:(id)a3 fromSQLRow:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)NSIncrementalStoreNode;
  v6 = [(NSIncrementalStoreNode *)&v27 init];
  if (v6)
  {
    v6->_objectID = (NSManagedObjectID *)a3;
    v6->_reserved1 = 0;
    v6->_versionNumber = [a4 _versionNumber];
    uint64_t v7 = [a3 entity];
    uint64_t v8 = v7;
    if (v7) {
      v9 = *(void **)(v7 + 104);
    }
    else {
      v9 = 0;
    }
    v10 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:v9];
    uint64_t v11 = [(NSKnownKeysDictionary *)v10 values];
    uint64_t v12 = [v9 keys];
    uint64_t v13 = v12;
    v14 = *(void **)(v8 + 112);
    unint64_t v15 = v14[6];
    uint64_t v16 = v14[7];
    if (v15 < v16 + v15)
    {
      v17 = (void *)(v11 + 8 * v15);
      v18 = (void *)(v12 + 8 * v15);
      do
      {
        v19 = (void *)[a4 valueForKey:*v18];
        if (v19) {
          void *v17 = v19;
        }
        ++v17;
        ++v18;
        --v16;
      }
      while (v16);
    }
    unint64_t v20 = v14[12];
    uint64_t v21 = v14[13];
    if (v20 < v21 + v20)
    {
      v22 = (void *)(v11 + 8 * v20);
      v23 = (void *)(v13 + 8 * v20);
      do
      {
        v24 = (void *)[a4 valueForKey:*v23];
        if (v24) {
          id v25 = v24;
        }
        else {
          id v25 = (id)NSKeyValueCoding_NullValue;
        }
        *v22++ = v25;
        ++v23;
        --v21;
      }
      while (v21);
    }
    v6->_propertyCache = v10;
  }
  return v6;
}

- (NSIncrementalStoreNode)initWithObjectID:(NSManagedObjectID *)objectID withValues:(NSDictionary *)values version:(uint64_t)version
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)NSIncrementalStoreNode;
  uint64_t v8 = [(NSIncrementalStoreNode *)&v40 init];
  if (v8)
  {
    v9 = objectID;
    v8->_reserved1 = 0;
    v8->_objectID = v9;
    v8->_versionNumber = version;
    v10 = [(NSManagedObjectID *)objectID entity];
    uint64_t v11 = v10;
    if (v10) {
      id propertyMapping = v10->_propertyMapping;
    }
    else {
      id propertyMapping = 0;
    }
    uint64_t v13 = [[NSKnownKeysDictionary alloc] initWithSearchStrategy:propertyMapping];
    NSUInteger v14 = [(NSDictionary *)values count];
    uint64_t v15 = [(NSKnownKeysDictionary *)v13 values];
    v38 = &v35;
    uint64_t v39 = v15;
    MEMORY[0x1F4188790](v15);
    v18 = (char *)&v35 - v17;
    size_t v19 = 8 * v16;
    if (v14 > 0x200)
    {
      v18 = (char *)NSAllocateScannedUncollectable();
      uint64_t v21 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v35 - v17, 8 * v16);
      MEMORY[0x1F4188790](v20);
      uint64_t v21 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v21, v19);
    }
    [(NSDictionary *)values getObjects:v18 andKeys:v21];
    propertyRanges = v11->_propertyRanges;
    NSUInteger location = propertyRanges[6].location;
    NSUInteger length = propertyRanges[6].length;
    if (location < length + location)
    {
      id v25 = (void *)(v39 + 8 * location);
      NSUInteger v26 = length;
      do
      {
        *v25++ = NSKeyValueCoding_NullValue;
        --v26;
      }
      while (v26);
    }
    if (v14)
    {
      v36 = v13;
      v37 = v8;
      for (uint64_t i = 0; i != v14; ++i)
      {
        unint64_t v28 = [propertyMapping indexForKey:*(void *)&v21[8 * i]];
        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v29 = v28;
          v30 = *(void **)&v18[8 * i];
          if (v30 == NSKeyValueCoding_NullValue && v28 - location < length && v28 >= location) {
            v30 = 0;
          }
          id v33 = v30;
          *(void *)(v39 + 8 * v29) = v33;
        }
      }
      uint64_t v13 = v36;
      uint64_t v8 = v37;
      if (v14 >= 0x201)
      {
        NSZoneFree(0, v21);
        NSZoneFree(0, v18);
      }
    }
    v8->_propertyCache = v13;
  }
  return v8;
}

- (void)dealloc
{
  self->_objectID = 0;
  self->_propertyCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSIncrementalStoreNode;
  [(NSIncrementalStoreNode *)&v3 dealloc];
}

- (id)valueForPropertyDescription:(NSPropertyDescription *)prop
{
  v5 = [(NSPropertyDescription *)prop entity];
  v6 = [(NSManagedObjectID *)self->_objectID entity];
  uint64_t v7 = v6;
  if (prop && v5 == v6) {
    goto LABEL_3;
  }
  if (!prop
    || ![(NSEntityDescription *)v6 isKindOfEntity:[(NSPropertyDescription *)prop entity]])
  {
    return 0;
  }
  unint64_t v16 = [(NSPropertyDescription *)prop _propertyType];
  if ([(NSPropertyDescription *)prop _isAttribute])
  {
LABEL_3:
    uint64_t v8 = [(NSPropertyDescription *)prop _entitysReferenceID];
  }
  else
  {
    if (v16 != 4) {
      return 0;
    }
    uint64_t v8 = [(NSEntityDescription *)v7 _offsetRelationshipIndex:[(NSPropertyDescription *)prop _entitysReferenceID] fromSuperEntity:v5 andIsToMany:[(NSPropertyDescription *)prop isToMany]];
  }
  unint64_t v9 = v8;
  if (v8 < 0) {
    return 0;
  }
  id result = (id)[self->_propertyCache valueAtIndex:v8];
  propertyRanges = v7->_propertyRanges;
  unint64_t location = propertyRanges[6].location;
  NSUInteger length = propertyRanges[6].length;
  BOOL v15 = v9 >= location;
  unint64_t v14 = v9 - location;
  BOOL v15 = !v15 || v14 >= length;
  if (!v15)
  {
    if (result != (id)NSKeyValueCoding_NullValue)
    {
      if (!result) {
        return (id)NSKeyValueCoding_NullValue;
      }
      return result;
    }
    return 0;
  }
  return result;
}

+ (void)initialize
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ - %u", self->_objectID, self->_versionNumber];
}

- (void)updateWithValues:(NSDictionary *)values version:(uint64_t)version
{
  uint64_t v30 = version;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v6 = [(NSManagedObjectID *)self->_objectID entity];
  uint64_t v7 = v6;
  if (v6) {
    id propertyMapping = v6->_propertyMapping;
  }
  else {
    id propertyMapping = 0;
  }
  id propertyCache = self->_propertyCache;
  NSUInteger v10 = [(NSDictionary *)values count];
  unint64_t v11 = MEMORY[0x1F4188790](v10);
  unint64_t v14 = (char *)&v28 - v13;
  size_t v15 = 8 * v12;
  unint64_t v29 = self;
  if (v11 > 0x200)
  {
    unint64_t v14 = (char *)NSAllocateScannedUncollectable();
    uint64_t v17 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)&v28 - v13, 8 * v12);
    MEMORY[0x1F4188790](v16);
    uint64_t v17 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v17, v15);
  }
  [(NSDictionary *)values getObjects:v14 andKeys:v17];
  [propertyCache removeAllObjects];
  propertyRanges = v7->_propertyRanges;
  NSUInteger location = propertyRanges[6].location;
  NSUInteger length = propertyRanges[6].length;
  if (location < length + location)
  {
    NSUInteger v21 = propertyRanges[6].length;
    NSUInteger v22 = propertyRanges[6].location;
    do
    {
      [propertyCache setValue:NSKeyValueCoding_NullValue atIndex:v22++];
      --v21;
    }
    while (v21);
  }
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      unint64_t v24 = [propertyMapping indexForKey:*(void *)&v17[8 * i]];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (*(void *)&v14[8 * i] == NSKeyValueCoding_NullValue && v24 - location < length && v24 >= location) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = *(void *)&v14[8 * i];
        }
        [propertyCache setValue:v27 atIndex:v24];
      }
    }
    if (v10 >= 0x201)
    {
      NSZoneFree(0, v17);
      NSZoneFree(0, v14);
    }
  }
  v29->_versionNumber = v30;
}

- (uint64_t)version
{
  return self->_versionNumber;
}

- (id)_propertyCache
{
  return self->_propertyCache;
}

@end
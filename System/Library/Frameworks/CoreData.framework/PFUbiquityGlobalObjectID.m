@interface PFUbiquityGlobalObjectID
- (BOOL)isEqual:(id)a3;
- (PFUbiquityGlobalObjectID)init;
- (PFUbiquityGlobalObjectID)initWithCompressedString:(id)a3 forStoreWithName:(id)a4 andEntityNames:(id)a5 primaryKeys:(id)a6 peerIDs:(id)a7;
- (PFUbiquityGlobalObjectID)initWithStoreName:(id)a3 entityName:(id)a4 primaryKey:(id)a5 andPeerID:(id)a6;
- (PFUbiquityGlobalObjectID)initWithStoreName:(id)a3 entityName:(id)a4 primaryKeyInteger:(unint64_t)a5 andPeerID:(id)a6;
- (PFUbiquityGlobalObjectID)initWithString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createCompressedStringWithEntityNameToIndex:(void *)a3 primaryKeyToIndex:(void *)a4 peerIDToIndex:;
- (id)createGlobalIDString;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)updateHash;
@end

@implementation PFUbiquityGlobalObjectID

- (PFUbiquityGlobalObjectID)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityGlobalObjectID;
  result = [(PFUbiquityGlobalObjectID *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_primaryKey = 0u;
    *(_OWORD *)&result->_storeName = 0u;
    result->_hash = 0x7FFFFFFFFFFFFFFFLL;
    result->_managedObjectID = 0;
    result->_primaryKeyInteger = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PFUbiquityGlobalObjectID)initWithStoreName:(id)a3 entityName:(id)a4 primaryKeyInteger:(unint64_t)a5 andPeerID:(id)a6
{
  v10 = [(PFUbiquityGlobalObjectID *)self init];
  if (v10)
  {
    v10->_storeName = (NSString *)a3;
    v10->_entityName = (NSString *)[a4 copy];
    v10->_primaryKeyInteger = a5;
    v10->_primaryKey = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"p%lu", a5);
    v10->_owningPeerID = (NSString *)a6;
    [(PFUbiquityGlobalObjectID *)v10 updateHash];
  }
  return v10;
}

- (PFUbiquityGlobalObjectID)initWithStoreName:(id)a3 entityName:(id)a4 primaryKey:(id)a5 andPeerID:(id)a6
{
  v10 = [(PFUbiquityGlobalObjectID *)self init];
  if (v10)
  {
    v10->_storeName = (NSString *)a3;
    v10->_entityName = (NSString *)[a4 copy];
    v10->_primaryKey = (NSString *)a5;
    v10->_owningPeerID = (NSString *)a6;
    [(PFUbiquityGlobalObjectID *)v10 updateHash];
  }
  return v10;
}

- (PFUbiquityGlobalObjectID)initWithString:(id)a3
{
  v4 = [(PFUbiquityGlobalObjectID *)self init];
  if (v4)
  {
    v5 = (void *)[a3 componentsSeparatedByString:PFUbiquityGlobalObjectIDSeparator];
    v4->_storeName = (NSString *)(id)[v5 objectAtIndex:0];
    v4->_entityName = (NSString *)(id)[v5 objectAtIndex:1];
    v4->_primaryKey = (NSString *)(id)[v5 objectAtIndex:2];
    v4->_owningPeerID = (NSString *)(id)[v5 objectAtIndex:3];
    [(PFUbiquityGlobalObjectID *)v4 updateHash];
  }
  return v4;
}

- (PFUbiquityGlobalObjectID)initWithCompressedString:(id)a3 forStoreWithName:(id)a4 andEntityNames:(id)a5 primaryKeys:(id)a6 peerIDs:(id)a7
{
  v12 = [(PFUbiquityGlobalObjectID *)self init];
  if (v12)
  {
    v12->_storeName = (NSString *)a4;
    v13 = (void *)[a3 componentsSeparatedByString:PFUbiquityGlobalObjectIDSeparator];
    v12->_entityName = (NSString *)(id)+[PFUbiquityGlobalObjectID stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectID, "stringValueFromArray:atIndexDescribedByStringNumber:", a5, [v13 objectAtIndex:0]);
    v12->_primaryKey = (NSString *)(id)+[PFUbiquityGlobalObjectID stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectID, "stringValueFromArray:atIndexDescribedByStringNumber:", a6, [v13 objectAtIndex:1]);
    v12->_owningPeerID = (NSString *)(id)+[PFUbiquityGlobalObjectID stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectID, "stringValueFromArray:atIndexDescribedByStringNumber:", a7, [v13 objectAtIndex:2]);
    [(PFUbiquityGlobalObjectID *)v12 updateHash];
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PFUbiquityGlobalObjectID allocWithZone:a3];
  if (!v4) {
    return 0;
  }
  storeName = self->_storeName;
  entityName = self->_entityName;
  primaryKey = self->_primaryKey;
  owningPeerID = self->_owningPeerID;
  unint64_t hash = self->_hash;
  managedObjectID = self->_managedObjectID;
  unint64_t primaryKeyInteger = self->_primaryKeyInteger;
  v12 = [(PFUbiquityGlobalObjectID *)v4 init];
  if (v12)
  {
    v12->_storeName = storeName;
    v12->_entityName = (NSString *)[(NSString *)entityName copy];
    v12->_primaryKey = primaryKey;
    v12->_owningPeerID = owningPeerID;
    v12->_unint64_t hash = hash;
    v12->_managedObjectID = managedObjectID;
    v12->_unint64_t primaryKeyInteger = primaryKeyInteger;
  }
  return v12;
}

- (void)dealloc
{
  self->_entityName = 0;
  self->_storeName = 0;

  self->_primaryKey = 0;
  self->_owningPeerID = 0;

  self->_managedObjectID = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityGlobalObjectID;
  [(PFUbiquityGlobalObjectID *)&v3 dealloc];
}

- (id)description
{
  id v3 = -[PFUbiquityGlobalObjectID createGlobalIDString](self);
  v6.receiver = self;
  v6.super_class = (Class)PFUbiquityGlobalObjectID;
  v4 = (void *)[NSString stringWithFormat:@"%@ (%@)", -[PFUbiquityGlobalObjectID description](&v6, sel_description), v3];

  return v4;
}

- (id)createGlobalIDString
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v2 appendString:a1[1]];
  [v2 appendString:PFUbiquityGlobalObjectIDSeparator];
  [v2 appendString:a1[2]];
  [v2 appendString:PFUbiquityGlobalObjectIDSeparator];
  [v2 appendString:a1[3]];
  [v2 appendString:PFUbiquityGlobalObjectIDSeparator];
  [v2 appendString:a1[4]];
  return v2;
}

- (void)updateHash
{
  if (self->_primaryKeyInteger == 0x7FFFFFFFFFFFFFFFLL) {
    self->_unint64_t primaryKeyInteger = +[PFUbiquityPeerRangeCache integerFromPrimaryKeyString:]((uint64_t)PFUbiquityPeerRangeCache, self->_primaryKey);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:self->_primaryKey];
  [v3 appendString:self->_entityName];
  [v3 appendString:self->_owningPeerID];
  [v3 appendString:self->_storeName];
  self->_unint64_t hash = +[_PFRoutines _generateUbiquityHashForPath:]((uint64_t)_PFRoutines, v3);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    goto LABEL_10;
  }
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  unint64_t hash = self->_hash;
  if (hash == [a3 hash] && self->_primaryKeyInteger == *((void *)a3 + 7))
  {
    BOOL v6 = [(NSString *)self->_owningPeerID isEqualToString:*((void *)a3 + 4)];
    if (v6)
    {
      BOOL v6 = [(NSString *)self->_entityName isEqualToString:*((void *)a3 + 2)];
      if (v6)
      {
        storeName = self->_storeName;
        uint64_t v8 = *((void *)a3 + 1);
        LOBYTE(v6) = [(NSString *)storeName isEqualToString:v8];
      }
    }
  }
  else
  {
LABEL_10:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (int64_t)compare:(id)a3
{
  unint64_t primaryKeyInteger = self->_primaryKeyInteger;
  if (a3)
  {
    unint64_t v6 = *((void *)a3 + 7);
    if (primaryKeyInteger == v6)
    {
      int64_t result = [(NSString *)self->_owningPeerID compare:*((void *)a3 + 4)];
      if (result) {
        return result;
      }
      int64_t result = [(NSString *)self->_entityName compare:*((void *)a3 + 2)];
      if (result) {
        return result;
      }
      uint64_t v8 = *((void *)a3 + 1);
      goto LABEL_6;
    }
    if (primaryKeyInteger < v6) {
      return -1;
    }
    return primaryKeyInteger > v6;
  }
  if (primaryKeyInteger)
  {
    unint64_t v6 = 0;
    return primaryKeyInteger > v6;
  }
  int64_t result = [(NSString *)self->_owningPeerID compare:0];
  if (result) {
    return result;
  }
  int64_t result = [(NSString *)self->_entityName compare:0];
  if (result) {
    return result;
  }
  uint64_t v8 = 0;
LABEL_6:
  storeName = self->_storeName;

  return [(NSString *)storeName compare:v8];
}

- (id)createCompressedStringWithEntityNameToIndex:(void *)a3 primaryKeyToIndex:(void *)a4 peerIDToIndex:
{
  if (!a1) {
    return 0;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v9 = (void *)[a2 objectForKey:a1[2]];
  v10 = (void *)[a3 objectForKey:a1[3]];
  v11 = (void *)[a4 objectForKey:a1[4]];
  objc_msgSend(v8, "appendString:", objc_msgSend(v9, "stringValue"));
  [v8 appendString:PFUbiquityGlobalObjectIDSeparator];
  objc_msgSend(v8, "appendString:", objc_msgSend(v10, "stringValue"));
  [v8 appendString:PFUbiquityGlobalObjectIDSeparator];
  objc_msgSend(v8, "appendString:", objc_msgSend(v11, "stringValue"));
  return v8;
}

- (unint64_t)hash
{
  return self->_hash;
}

@end
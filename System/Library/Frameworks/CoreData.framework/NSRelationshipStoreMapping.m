@interface NSRelationshipStoreMapping
- (BOOL)isEqual:(id)a3;
- (id)destinationEntityExternalName;
- (id)foreignKeys;
- (id)joins;
- (uint64_t)setDestinationEntityExternalName:(uint64_t)result;
- (uint64_t)setForeignKeys:(uint64_t)result;
- (uint64_t)setJoins:(uint64_t)result;
- (unsigned)joinSemantic;
- (void)dealloc;
@end

@implementation NSRelationshipStoreMapping

- (void)dealloc
{
  -[NSRelationshipStoreMapping setDestinationEntityExternalName:]((uint64_t)self, 0);
  -[NSRelationshipStoreMapping setForeignKeys:]((uint64_t)self, 0);
  -[NSRelationshipStoreMapping setJoins:]((uint64_t)self, 0);
  v3.receiver = self;
  v3.super_class = (Class)NSRelationshipStoreMapping;
  [(NSPropertyStoreMapping *)&v3 dealloc];
}

- (uint64_t)setDestinationEntityExternalName:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 24);
    if (v4 != a2)
    {

      result = [a2 copy];
      *(void *)(v3 + 24) = result;
    }
  }
  return result;
}

- (uint64_t)setForeignKeys:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 32);
    if (v4 != a2)
    {

      result = [a2 copy];
      *(void *)(v3 + 32) = result;
    }
  }
  return result;
}

- (uint64_t)setJoins:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 40);
    if (v4 != a2)
    {

      result = [a2 copy];
      *(void *)(v3 + 40) = result;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NSRelationshipStoreMapping;
  unsigned int v5 = -[NSPropertyStoreMapping isEqual:](&v11, sel_isEqual_);
  if (v5)
  {
    id v6 = [(NSRelationshipStoreMapping *)self destinationEntityExternalName];
    if (v6 == (id)[a3 destinationEntityExternalName]
      || (unsigned int v5 = objc_msgSend(-[NSRelationshipStoreMapping destinationEntityExternalName](self, "destinationEntityExternalName"), "isEqual:", objc_msgSend(a3, "destinationEntityExternalName"))) != 0)
    {
      id v7 = [(NSRelationshipStoreMapping *)self foreignKeys];
      if (v7 == (id)[a3 foreignKeys]
        || (unsigned int v5 = objc_msgSend(-[NSRelationshipStoreMapping foreignKeys](self, "foreignKeys"), "isEqual:", objc_msgSend(a3, "foreignKeys"))) != 0)
      {
        id v8 = [(NSRelationshipStoreMapping *)self joins];
        if (v8 == (id)[a3 joins]
          || (unsigned int v5 = objc_msgSend(-[NSRelationshipStoreMapping joins](self, "joins"), "isEqual:", objc_msgSend(a3, "joins"))) != 0)
        {
          unsigned int v9 = [(NSRelationshipStoreMapping *)self joinSemantic];
          LOBYTE(v5) = v9 == [a3 joinSemantic];
        }
      }
    }
  }
  return v5;
}

- (id)destinationEntityExternalName
{
  return self->_destinationEntityExternalName;
}

- (id)foreignKeys
{
  return self->_foreignKeys;
}

- (id)joins
{
  return self->_joins;
}

- (unsigned)joinSemantic
{
  return self->_joinSemantic;
}

@end
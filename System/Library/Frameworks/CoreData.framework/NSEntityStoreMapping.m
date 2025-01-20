@interface NSEntityStoreMapping
- (BOOL)isEqual:(id)a3;
- (BOOL)isSingleTableEntity;
- (NSEntityStoreMapping)initWithEntity:(id)a3;
- (id)description;
- (id)entity;
- (id)primaryKeys;
- (id)propertyMappings;
- (id)subentityColumn;
- (uint64_t)setPropertyMappings:(uint64_t)result;
- (unsigned)subentityID;
- (void)dealloc;
- (void)setPrimaryKeys:(uint64_t)a1;
@end

@implementation NSEntityStoreMapping

- (NSEntityStoreMapping)initWithEntity:(id)a3
{
  v5 = +[NSStoreMappingGenerator defaultMappingGenerator]();
  v6 = (void *)[a3 name];
  if (v5) {
    uint64_t v7 = [v6 uppercaseString];
  }
  else {
    uint64_t v7 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)NSEntityStoreMapping;
  v8 = [(NSStoreMapping *)&v13 initWithExternalName:v7];
  v9 = v8;
  if (v8)
  {
    v8->_entity = (NSEntityDescription *)a3;
    propertyMappings = v8->_propertyMappings;
    if (propertyMappings)
    {

      v9->_propertyMappings = (NSDictionary *)[0 copy];
    }
    -[NSEntityStoreMapping setPrimaryKeys:]((uint64_t)v9, 0);
    v9->_isSingleTableEntity = 1;
    subentityColumn = v9->_subentityColumn;
    if (subentityColumn)
    {

      v9->_subentityColumn = (NSString *)[0 copy];
    }
    v9->_subentityID = 0;
  }
  return v9;
}

- (uint64_t)setPropertyMappings:(uint64_t)result
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

- (void)setPrimaryKeys:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      uint64_t v3 = [a2 copy];

      *(void *)(a1 + 32) = v3;
    }
  }
}

- (void)dealloc
{
  if (self)
  {
    self->_entity = 0;
    -[NSEntityStoreMapping setPropertyMappings:]((uint64_t)self, 0);
    -[NSEntityStoreMapping setPrimaryKeys:]((uint64_t)self, 0);
    subentityColumn = self->_subentityColumn;
    if (subentityColumn)
    {

      self->_subentityColumn = (NSString *)[0 copy];
    }
  }
  else
  {
    -[NSEntityStoreMapping setPropertyMappings:](0, 0);
    -[NSEntityStoreMapping setPrimaryKeys:](0, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSEntityStoreMapping;
  [(NSStoreMapping *)&v4 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSEntityStoreMapping;
  return (id)[NSString stringWithFormat:@"%@ -> %@", -[NSEntityStoreMapping description](&v3, sel_description), -[NSEntityDescription name](self->_entity, "name")];
}

- (BOOL)isEqual:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NSEntityStoreMapping;
  unsigned int v5 = -[NSStoreMapping isEqual:](&v13, sel_isEqual_);
  if (v5)
  {
    id v6 = [(NSEntityStoreMapping *)self entity];
    if (v6 == (id)[a3 entity]
      || (unsigned int v5 = objc_msgSend(-[NSEntityStoreMapping entity](self, "entity"), "isEqual:", objc_msgSend(a3, "entity"))) != 0)
    {
      id v7 = [(NSEntityStoreMapping *)self propertyMappings];
      if (v7 == (id)[a3 propertyMappings]
        || (unsigned int v5 = objc_msgSend(-[NSEntityStoreMapping propertyMappings](self, "propertyMappings"), "isEqual:", objc_msgSend(a3, "propertyMappings"))) != 0)
      {
        id v8 = [(NSEntityStoreMapping *)self primaryKeys];
        if (v8 == (id)[a3 primaryKeys]
          || (unsigned int v5 = objc_msgSend(-[NSEntityStoreMapping primaryKeys](self, "primaryKeys"), "isEqual:", objc_msgSend(a3, "primaryKeys"))) != 0)
        {
          int v9 = [(NSEntityStoreMapping *)self isSingleTableEntity];
          if (v9 == [a3 isSingleTableEntity])
          {
            id v10 = [(NSEntityStoreMapping *)self subentityColumn];
            if (v10 == (id)[a3 subentityColumn]
              || (unsigned int v5 = objc_msgSend(-[NSEntityStoreMapping subentityColumn](self, "subentityColumn"), "isEqual:", objc_msgSend(a3, "subentityColumn"))) != 0)
            {
              unsigned int v11 = [(NSEntityStoreMapping *)self subentityID];
              LOBYTE(v5) = v11 == [a3 subentityID];
            }
          }
          else
          {
            LOBYTE(v5) = 0;
          }
        }
      }
    }
  }
  return v5;
}

- (id)entity
{
  return self->_entity;
}

- (id)propertyMappings
{
  return self->_propertyMappings;
}

- (id)primaryKeys
{
  return self->_primaryKeys;
}

- (BOOL)isSingleTableEntity
{
  return self->_isSingleTableEntity;
}

- (id)subentityColumn
{
  return self->_subentityColumn;
}

- (unsigned)subentityID
{
  return self->_subentityID;
}

@end
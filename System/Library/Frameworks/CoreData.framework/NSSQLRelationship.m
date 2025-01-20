@interface NSSQLRelationship
- (NSSQLRelationship)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)correlationTableName;
- (id)destinationEntity;
- (id)foreignKey;
- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)name;
- (void)_setInverseRelationship:(void *)a1;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLRelationship

- (id)destinationEntity
{
  return self->_destinationEntity;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLRelationship;
  -[NSSQLProperty copyValuesForReadOnlyFetch:](&v5, sel_copyValuesForReadOnlyFetch_);
  self->_name = (NSString *)objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
  self->_destinationEntity = (NSSQLEntity *)[a3 destinationEntity];
}

- (id)name
{
  return self->_name;
}

- (void)_setInverseRelationship:(void *)a1
{
  if (a1)
  {
    v3 = (void *)a1[7];
    BOOL v4 = v3 != a2 || v3 == 0;
    if (v4 || v3 != a1)
    {
      a1[7] = a2;
      if (!a1[6]) {
        a1[6] = [a2 sourceEntity];
      }
      uint64_t v6 = [a1 foreignKey];
      v7 = (void *)a1[7];
      if (v7) {
        v7 = (void *)[v7 propertyDescription];
      }
      if ([v7 _isOrdered] && v6)
      {
        v8 = -[NSSQLForeignOrderKey initWithEntity:foreignKey:]([NSSQLForeignOrderKey alloc], "initWithEntity:foreignKey:", [a1 entity], v6);
        [a1 _setForeignOrderKey:v8];
      }
    }
  }
}

- (id)foreignKey
{
  return 0;
}

- (void)dealloc
{
  self->_destinationEntity = 0;
  self->_inverse = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLRelationship;
  [(NSSQLProperty *)&v3 dealloc];
}

- (NSSQLRelationship)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NSSQLRelationship;
  uint64_t v6 = -[NSSQLProperty initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  if (v6)
  {
    v7 = (void *)[a4 destinationEntity];
    if (v7) {
      v6->_destinationEntity = (NSSQLEntity *)objc_msgSend((id)objc_msgSend(a3, "model"), "entityNamed:", objc_msgSend(v7, "name"));
    }
    uint64_t v8 = [a4 name];
    name = v6->_name;
    if (name != (NSString *)v8)
    {
      v10 = (void *)v8;

      v6->_name = (NSString *)[v10 copy];
    }
  }
  return v6;
}

- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NSSQLRelationship;
  uint64_t v6 = -[NSSQLProperty initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  v7 = v6;
  if (v6)
  {
    v6->_destinationEntity = (NSSQLEntity *)a3;
    uint64_t v8 = [a4 name];
    name = v7->_name;
    if (name != (NSString *)v8)
    {
      v10 = (void *)v8;

      v7->_name = (NSString *)[v10 copy];
    }
  }
  return v7;
}

- (id)correlationTableName
{
  return 0;
}

@end
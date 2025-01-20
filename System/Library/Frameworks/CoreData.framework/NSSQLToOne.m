@interface NSSQLToOne
- (NSSQLToOne)initWithEntity:(id)a3 inverseToMany:(id)a4;
- (NSSQLToOne)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)columnName;
- (id)description;
- (id)foreignKey;
- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4;
- (unsigned)slot;
- (void)_setForeignOrderKey:(id)a3;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
- (void)initWithEntity:(uint64_t)a3 propertyDescription:(void *)a4 virtualForToMany:;
@end

@implementation NSSQLToOne

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NSSQLToOne;
  -[NSSQLRelationship copyValuesForReadOnlyFetch:](&v10, sel_copyValuesForReadOnlyFetch_);
  v5 = objc_alloc_init(NSSQLForeignKey);
  self->_foreignKey = v5;
  -[NSSQLForeignKey copyValuesForReadOnlyFetch:](v5, "copyValuesForReadOnlyFetch:", [a3 foreignKey]);
  foreignKey = self->_foreignKey;
  v7 = [(NSSQLProperty *)self propertyDescription];
  if (foreignKey) {
    foreignKey->super.super._propertyDescription = v7;
  }
  if (a3)
  {
    if (*((void *)a3 + 9))
    {
      v8 = objc_alloc_init(NSSQLForeignEntityKey);
      self->_foreignEntityKey = v8;
      [(NSSQLForeignEntityKey *)v8 copyValuesForReadOnlyFetch:*((void *)a3 + 9)];
    }
    if (*((void *)a3 + 10))
    {
      v9 = objc_alloc_init(NSSQLForeignOrderKey);
      self->_foreignOrderKey = v9;
      [(NSSQLForeignOrderKey *)v9 copyValuesForReadOnlyFetch:*((void *)a3 + 10)];
    }
  }
}

- (unsigned)slot
{
  return self->super.super._slot;
}

- (id)columnName
{
  id v2 = [(NSSQLToOne *)self foreignKey];

  return (id)[v2 columnName];
}

- (id)foreignKey
{
  return self->_foreignKey;
}

- (void)initWithEntity:(uint64_t)a3 propertyDescription:(void *)a4 virtualForToMany:
{
  if (!a1) {
    return 0;
  }
  v21.receiver = a1;
  v21.super_class = (Class)NSSQLToOne;
  v6 = objc_msgSendSuper2(&v21, sel_initWithEntity_propertyDescription_, a2, a3);
  if (v6)
  {
    if (a4)
    {
      id v7 = [NSString alloc];
      uint64_t v8 = [a4 sourceEntity];
      if (v8) {
        uint64_t v9 = *(unsigned int *)(v8 + 184);
      }
      else {
        uint64_t v9 = 0;
      }
      objc_super v10 = (void *)[v7 initWithFormat:@"%d%@", v9, objc_msgSend(a4, "name")];
      v11 = (void *)v6[5];
      if (v11 != v10)
      {

        v6[5] = [v10 copy];
      }

      *((unsigned char *)v6 + 88) = 1;
    }
    if (*((unsigned char *)v6 + 88))
    {
      __int16 v12 = -1;
    }
    else
    {
      if (a2 && (uint64_t v13 = *(void *)(a2 + 24)) != 0) {
        v14 = *(void **)(v13 + 104);
      }
      else {
        v14 = 0;
      }
      __int16 v15 = objc_msgSend(v14, "fastIndexForKnownKey:", objc_msgSend(v6, "name"));
      if (a2) {
        __int16 v16 = *(_WORD *)(a2 + 192);
      }
      else {
        __int16 v16 = 0;
      }
      __int16 v12 = v15 - v16;
    }
    *((_WORD *)v6 + 14) = v12;
    *((unsigned char *)v6 + 24) = 7;
    v17 = [[NSSQLForeignKey alloc] initWithEntity:a2 toOneRelationship:v6];
    v6[8] = v17;
    uint64_t v18 = [v6 destinationEntity];
    if (v18)
    {
      v19 = *(void **)(v18 + 152);
      if (v19)
      {
        if ([v19 count]) {
          v6[9] = [[NSSQLForeignEntityKey alloc] initWithEntity:a2 foreignKey:v17];
        }
      }
    }
  }
  return v6;
}

- (NSSQLToOne)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  return (NSSQLToOne *)-[NSSQLToOne initWithEntity:propertyDescription:virtualForToMany:](self, (uint64_t)a3, (uint64_t)a4, 0);
}

- (void)_setForeignOrderKey:(id)a3
{
  foreignOrderKey = self->_foreignOrderKey;
  if (foreignOrderKey != a3)
  {

    self->_foreignOrderKey = (NSSQLForeignOrderKey *)a3;
  }
}

- (void)dealloc
{
  self->_foreignKey = 0;
  self->_foreignEntityKey = 0;

  self->_foreignOrderKey = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLToOne;
  [(NSSQLRelationship *)&v3 dealloc];
}

- (id)initForReadOnlyFetchWithEntity:(id)a3 propertyDescription:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NSSQLToOne;
  v6 = -[NSSQLRelationship initForReadOnlyFetchWithEntity:propertyDescription:](&v10, sel_initForReadOnlyFetchWithEntity_propertyDescription_);
  id v7 = v6;
  if (v6)
  {
    v6[24] = 7;
    uint64_t v8 = [[NSSQLForeignKey alloc] initForReadOnlyFetchingOfEntity:a3 toOneRelationship:v6];
    if ([a4 _propertyType] == 4 && v8) {
      v8[1] = a4;
    }
    v7[8] = v8;
    v7[9] = [[NSSQLForeignEntityKey alloc] initForReadOnlyFetchingOfEntity:a3 toOneRelationship:v7];
    v7[10] = [[NSSQLForeignOrderKey alloc] initForReadOnlyFetchingOfEntity:a3 toOneRelationship:v7];
  }
  return v7;
}

- (NSSQLToOne)initWithEntity:(id)a3 inverseToMany:(id)a4
{
  return (NSSQLToOne *)-[NSSQLToOne initWithEntity:propertyDescription:virtualForToMany:](self, (uint64_t)a3, 0, a4);
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %@ (%@)>", NSStringFromClass(v4), -[NSSQLRelationship name](self, "name"), objc_msgSend(-[NSSQLRelationship destinationEntity](self, "destinationEntity"), "name")];
}

@end
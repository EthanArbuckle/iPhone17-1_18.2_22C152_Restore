@interface NSSQLProperty
- (BOOL)isConstrained;
- (BOOL)isEqual:(id)a3;
- (BOOL)isToMany;
- (NSSQLProperty)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)columnName;
- (id)description;
- (id)entity;
- (id)name;
- (id)propertyDescription;
- (unsigned)propertyType;
- (unsigned)slot;
- (unsigned)sqlType;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
- (void)setConstrained:(BOOL)a3;
@end

@implementation NSSQLProperty

- (id)propertyDescription
{
  return self->_propertyDescription;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_propertyDescription = (NSPropertyDescription *)[a3 propertyDescription];
  self->_propertyType = [a3 propertyType];
}

- (unsigned)propertyType
{
  return self->_propertyType;
}

- (BOOL)isToMany
{
  return self->_propertyType == 8;
}

- (BOOL)isConstrained
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)name
{
  return [(NSPropertyDescription *)self->_propertyDescription name];
}

- (NSSQLProperty)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NSSQLProperty;
  v6 = [(NSSQLProperty *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_propertyDescription = (NSPropertyDescription *)a4;
    v6->_entity = (NSSQLEntity *)a3;
    if (a4)
    {
      if (-[NSEntityDescription _hasUniquedProperty:]([a3 entityDescription], a4))
      {
        *(_WORD *)&v7->_flags |= 6u;
        if (a3)
        {
          v8 = (void *)[a3 rootEntity];
          if (v8) {
            v8 = (void *)v8[26];
          }
          [v8 addObject:v7];
        }
      }
    }
  }
  return v7;
}

- (void)setConstrained:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (id)entity
{
  return self->_entity;
}

- (void)dealloc
{
  self->_propertyDescription = 0;
  self->_entity = 0;
  v2.receiver = self;
  v2.super_class = (Class)NSSQLProperty;
  [(NSSQLProperty *)&v2 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v11 = v3;
    uint64_t v12 = v4;
    v10.receiver = self;
    v10.super_class = (Class)NSSQLProperty;
    BOOL v7 = -[NSSQLProperty isEqual:](&v10, sel_isEqual_);
    if (v7)
    {
      id v8 = [(NSSQLProperty *)self propertyDescription];
      LOBYTE(v7) = v8 == (id)[a3 propertyDescription];
    }
  }
  return v7;
}

- (id)columnName
{
  return 0;
}

- (unsigned)sqlType
{
  return self->_sqlType;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(NSSQLProperty *)self name];
  if (self) {
    id v7 = [(NSSQLProperty *)self columnName];
  }
  else {
    id v7 = 0;
  }
  return (id)[v3 stringWithFormat:@"<%@ %@ (%@)>", v5, v6, v7];
}

- (unsigned)slot
{
  return -1;
}

@end
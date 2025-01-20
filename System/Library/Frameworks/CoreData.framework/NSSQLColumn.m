@interface NSSQLColumn
- (NSSQLColumn)initWithColumnName:(id)a3 sqlType:(unsigned __int8)a4;
- (NSSQLColumn)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)columnName;
- (id)description;
- (id)initForReadOnlyFetching;
- (uint64_t)_setColumnName:(uint64_t)result;
- (uint64_t)roughSizeEstimate;
- (unsigned)slot;
- (unsigned)sqlType;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLColumn

- (uint64_t)roughSizeEstimate
{
  if (result)
  {
    unsigned int v1 = *(unsigned __int8 *)(result + 25) - 1;
    if (v1 > 0xA) {
      return 16;
    }
    else {
      return dword_18AE542A0[(char)v1];
    }
  }
  return result;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLColumn;
  -[NSSQLProperty copyValuesForReadOnlyFetch:](&v6, sel_copyValuesForReadOnlyFetch_);
  self->_columnName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "columnName"), "copy");
  self->super._sqlType = [a3 sqlType];
  if (a3) {
    __int16 v5 = *((_WORD *)a3 + 16) & 1;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->super._flags = *(_WORD *)&self->super._flags & 0xFFFE | v5;
}

- (unsigned)sqlType
{
  return self->super._sqlType;
}

- (id)columnName
{
  return self->_columnName;
}

- (id)initForReadOnlyFetching
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLColumn;
  id result = [(NSSQLColumn *)&v3 init];
  if (result) {
    *((_WORD *)result + 14) = -1;
  }
  return result;
}

- (unsigned)slot
{
  return self->super._slot;
}

- (NSSQLColumn)initWithColumnName:(id)a3 sqlType:(unsigned __int8)a4
{
  objc_super v6 = [(NSSQLColumn *)self initWithEntity:0 propertyDescription:0];
  v7 = v6;
  if (v6)
  {
    columnName = v6->_columnName;
    if (columnName != a3)
    {

      v7->_columnName = (NSString *)[a3 copy];
    }
    v7->super._sqlType = a4;
  }
  return v7;
}

- (NSSQLColumn)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLColumn;
  objc_super v6 = -[NSSQLProperty initWithEntity:propertyDescription:](&v9, sel_initWithEntity_propertyDescription_);
  if (v6)
  {
    if (a4)
    {
      if (a3) {
        uint64_t v7 = *((void *)a3 + 22);
      }
      else {
        uint64_t v7 = 0;
      }
      v6->_columnName = (NSString *)-[NSSQLStoreMappingGenerator newGeneratedPropertyName:](v7, a4);
    }
    v6->super._slot = -1;
    *(_WORD *)&v6->super._flags |= 1u;
  }
  return v6;
}

- (void)dealloc
{
  self->_columnName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLColumn;
  [(NSSQLProperty *)&v3 dealloc];
}

- (uint64_t)_setColumnName:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(result + 40);
    if (v4 != a2)
    {

      id result = [a2 copy];
      *(void *)(v3 + 40) = result;
    }
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: columnName = %@, type = %d, slot = %d, fetchIndex = %d propertyType = %d", objc_opt_class(), self->_columnName, self->super._sqlType, self->super._slot, self->super._fetchIndex, -[NSSQLProperty propertyType](self, "propertyType")];
}

@end
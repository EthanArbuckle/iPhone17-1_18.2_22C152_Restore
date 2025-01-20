@interface NSSQLBindVariable
- (BOOL)allowsCoercion;
- (BOOL)hasObjectValue;
- (NSSQLBindVariable)initWithInt64:(int64_t)a3 sqlType:(unsigned __int8)a4;
- (NSSQLBindVariable)initWithUnsignedInt:(unsigned int)a3 sqlType:(unsigned __int8)a4;
- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5;
- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5 allowCoercion:(BOOL)a6;
- (id)propertyDescription;
- (id)tombstonedPropertyDescription;
- (id)value;
- (int64_t)int64;
- (unsigned)index;
- (unsigned)sqlType;
- (unsigned)unsignedInt;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
- (void)setInt64:(int64_t)a3;
- (void)setSQLType:(unsigned __int8)a3;
- (void)setTombstonedPropertyDescription:(id)a3;
- (void)setUnsignedInt:(unsigned int)a3;
- (void)setValue:(id)a3;
@end

@implementation NSSQLBindVariable

- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5 allowCoercion:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NSSQLBindVariable;
  v10 = [(NSSQLBindVariable *)&v14 init];
  if (v10)
  {
    if ((id)[MEMORY[0x1E4F1CA98] null] == a3) {
      id v11 = 0;
    }
    else {
      id v11 = a3;
    }
    if (v8 == 6 && v11)
    {
      if (([v11 isNSString] & 1) == 0) {
        a3 = (id)[v11 description];
      }
    }
    else
    {
      a3 = v11;
    }
    id v12 = a3;
    v10->_sqlType = v8;
    v10->_value = v12;
    v10->_propertyDescription = (NSPropertyDescription *)a5;
    v10->_flags = v6;
  }
  return v10;
}

- (void)dealloc
{
  self->_value = 0;
  self->_propertyDescription = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBindVariable;
  [(NSSQLBindVariable *)&v3 dealloc];
}

- (unsigned)sqlType
{
  return self->_sqlType;
}

- (BOOL)hasObjectValue
{
  return self->_int64 == 0;
}

- (id)value
{
  id result = self->_value;
  if (!result)
  {
    if (self->_int64) {
      return (id)objc_msgSend(NSNumber, "numberWithLongLong:");
    }
    else {
      return 0;
    }
  }
  return result;
}

- (int64_t)int64
{
  id value = self->_value;
  if (value) {
    return [value longLongValue];
  }
  else {
    return self->_int64;
  }
}

- (BOOL)allowsCoercion
{
  return self->_flags != 0;
}

- (void)setTombstonedPropertyDescription:(id)a3
{
  self->_tombstonedPropertyDescription = (NSPropertyDescription *)a3;
}

- (id)tombstonedPropertyDescription
{
  return self->_tombstonedPropertyDescription;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (void)setInt64:(int64_t)a3
{
  self->_int64 = a3;
}

- (NSSQLBindVariable)initWithInt64:(int64_t)a3 sqlType:(unsigned __int8)a4
{
  v5 = [(NSSQLBindVariable *)self initWithValue:0 sqlType:a4 propertyDescription:0];
  BOOL v6 = v5;
  if (a3 && v5) {
    [(NSSQLBindVariable *)v5 setInt64:a3];
  }
  return v6;
}

- (NSSQLBindVariable)initWithValue:(id)a3 sqlType:(unsigned __int8)a4 propertyDescription:(id)a5
{
  return [(NSSQLBindVariable *)self initWithValue:a3 sqlType:a4 propertyDescription:a5 allowCoercion:0];
}

- (NSSQLBindVariable)initWithUnsignedInt:(unsigned int)a3 sqlType:(unsigned __int8)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = [(NSSQLBindVariable *)self initWithValue:0 sqlType:a4 propertyDescription:0];
  BOOL v6 = v5;
  if (v4 && v5) {
    [(NSSQLBindVariable *)v5 setUnsignedInt:v4];
  }
  return v6;
}

- (void)setUnsignedInt:(unsigned int)a3
{
  self->_int64 = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setValue:(id)a3
{
  id value = self->_value;
  if (value != a3)
  {

    self->_id value = a3;
  }
}

- (id)propertyDescription
{
  return self->_propertyDescription;
}

- (unsigned)unsignedInt
{
  id value = self->_value;
  if (value) {
    return [value unsignedIntValue];
  }
  else {
    return self->_int64;
  }
}

- (void)setSQLType:(unsigned __int8)a3
{
  self->_sqlType = a3;
}

@end
@interface BSIntegerMap
- (BOOL)containsObjectForKey:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BSIntegerMap)init;
- (BSIntegerMap)initWithCapacity:(unint64_t)a3;
- (id)_initWithMapTable:(void *)a3 zeroIndexValue:;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(int64_t)a3;
- (unint64_t)hash;
- (void)enumerateKeysWithBlock:(id)a3;
- (void)enumerateWithBlock:(id)a3;
@end

@implementation BSIntegerMap

- (void).cxx_destruct
{
  objc_storeStrong(&self->_zeroIndexValue, 0);
  objc_storeStrong((id *)&self->_mapTable, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = +[BSMutableIntegerMap allocWithZone:](BSMutableIntegerMap, "allocWithZone:");
  v6 = (void *)[(NSMapTable *)self->_mapTable copyWithZone:a3];
  v7 = -[BSIntegerMap _initWithMapTable:zeroIndexValue:]((id *)&v5->super.super.isa, v6, self->_zeroIndexValue);

  return v7;
}

- (void)enumerateWithBlock:(id)a3
{
}

- (id)_initWithMapTable:(void *)a3 zeroIndexValue:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BSIntegerMap;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (BSIntegerMap)init
{
  return [(BSIntegerMap *)self initWithCapacity:8];
}

- (BSIntegerMap)initWithCapacity:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:a3];
  v5 = (BSIntegerMap *)-[BSIntegerMap _initWithMapTable:zeroIndexValue:]((id *)&self->super.isa, v4, 0);

  return v5;
}

- (id)objectForKey:(int64_t)a3
{
  return BSIntegerMapObjectForKey(self, a3);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BSIntegerMap *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSMapTable *)self->_mapTable isEqual:v5->_mapTable])
      {
        id zeroIndexValue = self->_zeroIndexValue;
        id v7 = v5->_zeroIndexValue;
        if (zeroIndexValue == v7)
        {
          char v8 = 1;
        }
        else
        {
          char v8 = 0;
          if (zeroIndexValue && v7) {
            char v8 = objc_msgSend(zeroIndexValue, "isEqual:");
          }
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMapTable *)self->_mapTable hash];
  return [self->_zeroIndexValue hash] + v3;
}

- (void)enumerateKeysWithBlock:(id)a3
{
}

- (BOOL)containsObjectForKey:(int64_t)a3
{
  return BSIntegerMapContainsObjectForKey(self, a3);
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:self];
}

@end
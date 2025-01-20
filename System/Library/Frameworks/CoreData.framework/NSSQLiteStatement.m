@interface NSSQLiteStatement
- (NSSQLiteStatement)initWithEntity:(id)a3;
- (NSSQLiteStatement)initWithEntity:(id)a3 sqlString:(id)a4;
- (id)bindIntarrays;
- (id)bindVariables;
- (id)description;
- (id)entity;
- (id)sqlString;
- (sqlite3_stmt)setCachedSQLiteStatement:(uint64_t)a3 forConnection:;
- (uint64_t)addBindVariable:(uint64_t)a1;
- (void)cacheFakeEntityForFetch:(uint64_t)a1;
- (void)clearCaches:(void *)key;
- (void)dealloc;
- (void)setBindIntarrays:(uint64_t)a1;
@end

@implementation NSSQLiteStatement

- (id)bindVariables
{
  return self->_bindVariables;
}

- (id)entity
{
  return self->_entity;
}

- (NSSQLiteStatement)initWithEntity:(id)a3 sqlString:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLiteStatement;
  v6 = [(NSSQLiteStatement *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_entity = (NSSQLEntity *)a3;
    v6->_sqlString = (NSString *)[a4 copy];
  }
  return v7;
}

- (NSSQLiteStatement)initWithEntity:(id)a3
{
  return [(NSSQLiteStatement *)self initWithEntity:a3 sqlString:0];
}

- (void)setBindIntarrays:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 24) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 24) = a2;
    }
  }
}

- (void)cacheFakeEntityForFetch:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 48) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 48) = a2;
    }
  }
}

- (void)dealloc
{
  self->_entity = 0;

  *(_OWORD *)&self->_bindIntarrays = 0u;
  *(_OWORD *)&self->_entity = 0u;
  -[NSSQLiteStatement clearCaches:](self, 1);

  self->_fakeEntityForFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteStatement;
  [(NSSQLiteStatement *)&v3 dealloc];
}

- (void)clearCaches:(void *)key
{
  if (key)
  {
    objc_super v3 = (sqlite3_stmt *)*((void *)key + 8);
    if (v3)
    {
      uint64_t v4 = *((void *)key + 9);
      if (v4) {
        BOOL v5 = a2 == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (!v5)
      {
        v6 = *(__CFDictionary **)(v4 + 152);
        if (v6)
        {
          CFDictionaryRemoveValue(v6, key);
          objc_super v3 = (sqlite3_stmt *)*((void *)key + 8);
        }
      }
      sqlite3_finalize(v3);
      *((void *)key + 8) = 0;
    }

    *((void *)key + 7) = 0;
    *((void *)key + 9) = 0;
  }
}

- (id)bindIntarrays
{
  return self->_bindIntarrays;
}

- (id)sqlString
{
  return self->_sqlString;
}

- (sqlite3_stmt)setCachedSQLiteStatement:(uint64_t)a3 forConnection:
{
  if (result)
  {
    uint64_t v4 = result;
    if (!*((void *)result + 9)) {
      *((void *)result + 9) = a3;
    }
    result = (sqlite3_stmt *)*((void *)result + 8);
    if (result != a2)
    {
      if (result) {
        result = (sqlite3_stmt *)sqlite3_finalize(result);
      }
      *((void *)v4 + 8) = a2;
    }
    if (!a2) {
      *((void *)v4 + 9) = 0;
    }
  }
  return result;
}

- (uint64_t)addBindVariable:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = *(id *)(a1 + 16);
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(a1 + 16) = v4;
  }
  uint64_t v5 = [v4 count];
  [*(id *)(a1 + 16) addObject:a2];
  [a2 setIndex:v5];
  return v5;
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%s <%p> on entity '%@' with sql text '%@'", class_getName(v4), self, -[NSSQLEntity name](self->_entity, "name"), self->_sqlString];
}

@end
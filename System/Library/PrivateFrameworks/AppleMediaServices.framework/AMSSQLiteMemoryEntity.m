@interface AMSSQLiteMemoryEntity
+ (Class)databaseEntityClass;
+ (id)anyOnConnection:(id)a3 predicate:(id)a4;
+ (id)defaultProperties;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
- (AMSSQLiteMemoryEntity)init;
- (AMSSQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)externalPropertyValues;
- (NSDictionary)propertyValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)databaseID;
- (unint64_t)hash;
- (void)setDatabaseID:(int64_t)a3;
- (void)setExternalValuesWithDictionary:(id)a3;
- (void)setValue:(id)a3 forExternalProperty:(id)a4;
- (void)setValue:(id)a3 forProperty:(id)a4;
- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5;
- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5;
- (void)setValuesWithDictionary:(id)a3;
@end

@implementation AMSSQLiteMemoryEntity

- (AMSSQLiteMemoryEntity)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSSQLiteMemoryEntity;
  v2 = [(AMSSQLiteMemoryEntity *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    propertyValues = v2->_propertyValues;
    v2->_propertyValues = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalPropertyValues = v2->_externalPropertyValues;
    v2->_externalPropertyValues = v5;
  }
  return v2;
}

- (AMSSQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(AMSSQLiteMemoryEntity *)self init];
  v9 = v8;
  if (v8)
  {
    [(AMSSQLiteMemoryEntity *)v8 reloadFromDatabaseEntity:v6 properties:v7];
    v9->_databaseID = [v6 persistentID];
  }

  return v9;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return 0;
}

- (void)setExternalValuesWithDictionary:(id)a3
{
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  [(AMSSQLiteMemoryEntity *)self setValues:&v7 forProperties:&v8 count:1];
  id v6 = v7;
}

- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5
{
  if (a5 >= 1)
  {
    int64_t v5 = a5;
    do
    {
      propertyValues = self->_propertyValues;
      if (*a3) {
        [(NSMutableDictionary *)propertyValues setObject:*a3 forKey:*a4];
      }
      else {
        [(NSMutableDictionary *)propertyValues removeObjectForKey:*a4];
      }
      ++a4;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (void)setValuesWithDictionary:(id)a3
{
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  [(AMSSQLiteMemoryEntity *)self setValues:&v7 forExternalProperties:&v8 count:1];
  id v6 = v7;
}

- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5
{
  if (a5 >= 1)
  {
    int64_t v5 = a5;
    do
    {
      externalPropertyValues = self->_externalPropertyValues;
      if (*a3) {
        [(NSMutableDictionary *)externalPropertyValues setObject:*a3 forKey:*a4];
      }
      else {
        [(NSMutableDictionary *)externalPropertyValues removeObjectForKey:*a4];
      }
      ++a4;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (id)valueForProperty:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_propertyValues objectForKeyedSubscript:a3];
}

- (id)valueForExternalProperty:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_externalPropertyValues objectForKeyedSubscript:a3];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AMSSQLiteMemoryEntity;
  v4 = [(AMSSQLiteMemoryEntity *)&v7 description];
  int64_t v5 = [v3 stringWithFormat:@"%@: %lld", v4, self->_databaseID];

  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_propertyValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (int64_t v6 = -[AMSSQLiteMemoryEntity databaseID](self, "databaseID"), v6 == [v4 databaseID]))
  {
    objc_super v7 = [(AMSSQLiteMemoryEntity *)self propertyValues];
    id v8 = [v4 propertyValues];
    if ([v7 isEqualToDictionary:v8])
    {
      v9 = [(AMSSQLiteMemoryEntity *)self externalPropertyValues];
      v10 = [v4 externalPropertyValues];
      char v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_databaseID;
  [*(id *)(v4 + 16) addEntriesFromDictionary:self->_propertyValues];
  [*(id *)(v4 + 24) addEntriesFromDictionary:self->_externalPropertyValues];
  return (id)v4;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSDictionary)propertyValues
{
  return &self->_propertyValues->super;
}

- (NSDictionary)externalPropertyValues
{
  return &self->_externalPropertyValues->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPropertyValues, 0);
  objc_storeStrong((id *)&self->_propertyValues, 0);
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__63;
  v16 = __Block_byref_object_dispose__63;
  id v17 = 0;
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__AMSSQLiteMemoryEntity_AMSSQLiteQuery__anyOnConnection_predicate___block_invoke;
  v11[3] = &unk_1E55A6A10;
  v11[4] = &v12;
  [v8 enumerateMemoryEntitiesUsingBlock:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __67__AMSSQLiteMemoryEntity_AMSSQLiteQuery__anyOnConnection_predicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return (id)[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = objc_alloc_init(AMSSQLiteQueryDescriptor);
  -[AMSSQLiteQueryDescriptor setEntityClass:](v11, "setEntityClass:", [a1 databaseEntityClass]);
  [(AMSSQLiteQueryDescriptor *)v11 setMemoryEntityClass:a1];
  [(AMSSQLiteQueryDescriptor *)v11 setOrderingProperties:v8];

  [(AMSSQLiteQueryDescriptor *)v11 setPredicate:v9];
  id v12 = [[AMSSQLiteQuery alloc] initOnConnection:v10 descriptor:v11];

  return v12;
}

@end
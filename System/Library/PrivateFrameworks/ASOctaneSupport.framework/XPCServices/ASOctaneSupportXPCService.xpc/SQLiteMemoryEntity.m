@interface SQLiteMemoryEntity
+ (Class)databaseEntityClass;
+ (id)anyOnConnection:(id)a3 predicate:(id)a4;
+ (id)defaultProperties;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6;
- (BOOL)BOOLValueForProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)externalPropertyValues;
- (NSDictionary)propertyValues;
- (SQLiteMemoryEntity)init;
- (SQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4;
- (SQLiteMemoryEntity)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (SQLiteMemoryEntity)initWithPropertyValues:(id)a3;
- (id)arrayValueForProperty:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateValueForProperty:(id)a3;
- (id)description;
- (id)dictValueForProperty:(id)a3;
- (id)numberValueForProperty:(id)a3;
- (id)stringValueForProperty:(id)a3;
- (id)urlValueForProperty:(id)a3;
- (id)uuidValueForProperty:(id)a3;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)databaseID;
- (int64_t)integerValueForProperty:(id)a3;
- (unint64_t)hash;
- (void)reloadFromDatabaseEntity:(id)a3 properties:(id)a4;
- (void)setDatabaseID:(int64_t)a3;
- (void)setExternalValuesWithDictionary:(id)a3;
- (void)setValue:(id)a3 forExternalProperty:(id)a4;
- (void)setValue:(id)a3 forProperty:(id)a4;
- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5;
- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5;
- (void)setValuesWithDictionary:(id)a3;
@end

@implementation SQLiteMemoryEntity

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10000B74C;
  v16 = sub_10000B75C;
  id v17 = 0;
  v8 = [a1 queryOnConnection:v6 predicate:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C044;
  v11[3] = &unk_1002D4E28;
  v11[4] = &v12;
  [v8 enumerateMemoryEntitiesUsingBlock:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = -[SQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:]([SQLiteQueryDescriptor alloc], "initWithEntityClass:memoryEntityClass:", [a1 databaseEntityClass], a1);
  [(SQLiteQueryDescriptor *)v11 setOrderingProperties:v8];

  [(SQLiteQueryDescriptor *)v11 setPredicate:v9];
  id v12 = [[SQLiteQuery alloc] initOnConnection:v10 descriptor:v11];

  return v12;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = -[SQLiteQueryDescriptor initWithEntityClass:memoryEntityClass:]([SQLiteQueryDescriptor alloc], "initWithEntityClass:memoryEntityClass:", [a1 databaseEntityClass], a1);
  [(SQLiteQueryDescriptor *)v14 setOrderingProperties:v11];

  [(SQLiteQueryDescriptor *)v14 setOrderingDirections:v10];
  [(SQLiteQueryDescriptor *)v14 setPredicate:v12];

  id v15 = [[SQLiteQuery alloc] initOnConnection:v13 descriptor:v14];
  return v15;
}

- (SQLiteMemoryEntity)init
{
  return [(SQLiteMemoryEntity *)self initWithDatabaseID:0 propertyValues:&__NSDictionary0__struct externalPropertyValues:&__NSDictionary0__struct];
}

- (SQLiteMemoryEntity)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SQLiteMemoryEntity;
  id v10 = [(SQLiteMemoryEntity *)&v19 init];
  id v11 = v10;
  if (v10)
  {
    v10->_databaseID = a3;
    if (v8) {
      id v12 = v8;
    }
    else {
      id v12 = &__NSDictionary0__struct;
    }
    id v13 = (NSMutableDictionary *)[v12 mutableCopy];
    propertyValues = v11->_propertyValues;
    v11->_propertyValues = v13;

    if (v9) {
      id v15 = v9;
    }
    else {
      id v15 = &__NSDictionary0__struct;
    }
    v16 = (NSMutableDictionary *)[v15 mutableCopy];
    externalPropertyValues = v11->_externalPropertyValues;
    v11->_externalPropertyValues = v16;
  }
  return v11;
}

- (SQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[SQLiteMemoryEntity initWithDatabaseID:propertyValues:externalPropertyValues:](self, "initWithDatabaseID:propertyValues:externalPropertyValues:", [v6 persistentID], &__NSDictionary0__struct, &__NSDictionary0__struct);
  if (v8 && [v7 count]) {
    [(SQLiteMemoryEntity *)v8 reloadFromDatabaseEntity:v6 properties:v7];
  }

  return v8;
}

- (SQLiteMemoryEntity)initWithPropertyValues:(id)a3
{
  return [(SQLiteMemoryEntity *)self initWithDatabaseID:0 propertyValues:a3 externalPropertyValues:&__NSDictionary0__struct];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return &__NSArray0__struct;
}

- (void)reloadFromDatabaseEntity:(id)a3 properties:(id)a4
{
  v5 = [a3 getValuesForProperties:a4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F6F4;
  v6[3] = &unk_1002D5090;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)setExternalValuesWithDictionary:(id)a3
{
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  [(SQLiteMemoryEntity *)self setValues:&v7 forProperties:&v8 count:1];
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
      if (*a3)
      {
        [(NSMutableDictionary *)self->_propertyValues setObject:*a3 forKey:*a4];
      }
      else
      {
        id v10 = +[NSNull null];
        [(NSMutableDictionary *)propertyValues setObject:v10 forKey:*a4];
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
  [(SQLiteMemoryEntity *)self setValues:&v7 forExternalProperties:&v8 count:1];
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
  return [(NSMutableDictionary *)self->_propertyValues objectForKeyedSubscript:a3];
}

- (id)valueForExternalProperty:(id)a3
{
  return [(NSMutableDictionary *)self->_externalPropertyValues objectForKeyedSubscript:a3];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SQLiteMemoryEntity;
  v3 = [(SQLiteMemoryEntity *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@: %lld", v3, self->_databaseID];

  return v4;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableDictionary *)self->_propertyValues hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (id v6 = -[SQLiteMemoryEntity databaseID](self, "databaseID"), v6 == [v4 databaseID]))
  {
    id v7 = [(SQLiteMemoryEntity *)self propertyValues];
    id v8 = [v4 propertyValues];
    if ([v7 isEqualToDictionary:v8])
    {
      id v9 = [(SQLiteMemoryEntity *)self externalPropertyValues];
      id v10 = [v4 externalPropertyValues];
      unsigned __int8 v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  int64_t databaseID = self->_databaseID;
  propertyValues = self->_propertyValues;
  externalPropertyValues = self->_externalPropertyValues;
  return [v4 initWithDatabaseID:databaseID propertyValues:propertyValues externalPropertyValues:externalPropertyValues];
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_int64_t databaseID = a3;
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

- (BOOL)BOOLValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self numberValueForProperty:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)dateValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (int64_t)integerValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self numberValueForProperty:a3];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)numberValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)stringValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)uuidValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)urlValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)arrayValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)dictValueForProperty:(id)a3
{
  v3 = [(SQLiteMemoryEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end
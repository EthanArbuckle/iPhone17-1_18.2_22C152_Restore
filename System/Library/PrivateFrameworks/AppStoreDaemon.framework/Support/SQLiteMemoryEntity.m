@interface SQLiteMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)externalPropertyValues;
- (NSDictionary)propertyValues;
- (SQLiteMemoryEntity)init;
- (SQLiteMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4;
- (SQLiteMemoryEntity)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (SQLiteMemoryEntity)initWithPropertyValues:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForExternalProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)databaseID;
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
  v10 = [(SQLiteMemoryEntity *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->_databaseID = a3;
    if (v8) {
      v12 = v8;
    }
    else {
      v12 = &__NSDictionary0__struct;
    }
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
    propertyValues = v11->_propertyValues;
    v11->_propertyValues = v13;

    if (v9) {
      v15 = v9;
    }
    else {
      v15 = &__NSDictionary0__struct;
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
  v6[2] = sub_10026E3B8;
  v6[3] = &unk_100523298;
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
      v10 = [v4 externalPropertyValues];
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

@end
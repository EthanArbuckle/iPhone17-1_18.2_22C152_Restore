@interface HDSignedClinicalDataRegistryMetadataEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForEntityWithKey:(id)a3;
+ (id)databaseTable;
+ (id)entityForKey:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)numericValueForKey:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)setNumericValue:(id)a3 forKey:(id)a4 database:(id)a5 error:(id *)a6;
@end

@implementation HDSignedClinicalDataRegistryMetadataEntity

+ (id)numericValueForKey:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 entityForKey:a3 database:v8 error:a5];
  v10 = [v9 numberForProperty:@"integer" database:v8];

  return v10;
}

+ (id)_predicateForEntityWithKey:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:@"key" equalToValue:a3];
}

+ (id)entityForKey:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 _predicateForEntityWithKey:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)setNumericValue:(id)a3 forKey:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v21[0] = @"key";
  v21[1] = @"integer";
  id v12 = a5;
  v13 = +[NSArray arrayWithObjects:v21 count:2];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_93EB8;
  v18[3] = &unk_1126B8;
  id v19 = v11;
  id v20 = v10;
  id v14 = v10;
  id v15 = v11;
  v16 = [a1 insertOrReplaceEntity:1 database:v12 properties:v13 error:a6 bindingHandler:v18];

  return v16;
}

+ (id)databaseTable
{
  return @"metadata";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $3277B6B2C620D6D29E09CE5B70810548 *)off_114960;
}

@end
@interface HDSignedClinicalDataRegistryIssuerEntity
+ (BOOL)deleteIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_predicateForRegistryEntityWithIssuerIdentifier:(id)a3;
+ (id)databaseTable;
+ (id)entityForIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)insertOrReplaceIssuerWithIdentifier:(id)a3 title:(id)a4 logoURL:(id)a5 softwareLogoURL:(id)a6 database:(id)a7 error:(id *)a8;
- (id)titleInDatabase:(id)a3;
@end

@implementation HDSignedClinicalDataRegistryIssuerEntity

- (id)titleInDatabase:(id)a3
{
  return [(HDSignedClinicalDataRegistryIssuerEntity *)self stringForProperty:@"title" database:a3];
}

+ (id)_predicateForRegistryEntityWithIssuerIdentifier:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:@"iss" equalToValue:a3];
}

+ (id)entityForIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 _predicateForRegistryEntityWithIssuerIdentifier:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9 error:a5];

  return v10;
}

+ (id)insertOrReplaceIssuerWithIdentifier:(id)a3 title:(id)a4 logoURL:(id)a5 softwareLogoURL:(id)a6 database:(id)a7 error:(id *)a8
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1247C;
  v20[3] = &unk_111D50;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v14 = v24;
  id v15 = v23;
  id v16 = v22;
  id v17 = v21;
  v18 = [a1 insertOrReplaceEntity:1 database:a7 properties:&off_11D690 error:a8 bindingHandler:v20];

  return v18;
}

+ (BOOL)deleteIssuerWithIdentifier:(id)a3 database:(id)a4 error:(id *)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_12604;
  v9[3] = &unk_111DB8;
  id v10 = a3;
  id v7 = v10;
  LOBYTE(a5) = [a4 executeCachedStatementForKey:&unk_F2818 error:a5 SQLGenerator:&stru_111D90 bindingHandler:v9 enumerationHandler:0];

  return (char)a5;
}

+ (id)databaseTable
{
  return @"issuer";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $3277B6B2C620D6D29E09CE5B70810548 *)off_111DD8;
}

@end
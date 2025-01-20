@interface HDCorrelationSampleEntity
+ (BOOL)acceptsObject:(id)a3;
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isBackedByTable;
+ (BOOL)isConcreteEntity;
+ (BOOL)requiresSampleTypePredicate;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)createTableSQL;
+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDCorrelationSampleEntity

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  return 0;
}

+ (BOOL)isBackedByTable
{
  return 0;
}

+ (BOOL)requiresSampleTypePredicate
{
  return 1;
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  return 1;
}

+ (id)createTableSQL
{
  return 0;
}

+ (BOOL)acceptsObject:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HDCorrelationSampleEntity;
  if (objc_msgSendSuper2(&v7, sel_acceptsObject_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v5 = [v4 _containsObjects];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)deleteStatementsForRelatedEntitiesWithTransaction:(id)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HDCorrelationSampleEntity;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v8, sel_deleteStatementsForRelatedEntitiesWithTransaction_, v3);
  char v5 = +[HDAssociationEntity deleteStatementForParentIDWithTransaction:](HDAssociationEntity, "deleteStatementForParentIDWithTransaction:", v3, v8.receiver, v8.super_class);

  v6 = [v4 arrayByAddingObject:v5];

  return v6;
}

uint64_t __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    char v5 = *(void **)(a1 + 32);
    v6 = NSNumber;
    id v7 = a2;
    objc_super v8 = [v6 numberWithLongLong:a3];
    [v5 addObject:v8];

    [*(id *)(a1 + 40) addObject:v7];
  }
  return 1;
}

uint64_t __53__HDCorrelationSampleEntity__objectsWithIDs_profile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 correlations];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addCorrelations:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDCorrelationSampleEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

@end
@interface HDWorkoutStatisticsPredicate
+ (id)_predicateForColumn:(id)a3 quantity:(id)a4 quantityType:(id)a5 operatorType:(unint64_t)a6;
+ (id)predicateForAverageQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5;
+ (id)predicateForMaximumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5;
+ (id)predicateForMinimumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5;
+ (id)predicateForSumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5;
- (id)SQLForEntityClass:(Class)a3;
- (id)_init;
- (id)description;
- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4;
@end

@implementation HDWorkoutStatisticsPredicate

- (id)description
{
  quantityType = self->_quantityType;
  v4 = NSString;
  column = self->_column;
  v6 = HDSQLOperatorForComparisonType();
  v7 = [v4 stringWithFormat:@"<\"data_type\"=\"%@\" and \"%@\" %@ \"%@\"", quantityType, column, v6, self->_quantity];

  return v7;
}

+ (id)predicateForSumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)[a1 _predicateForColumn:0x1F1729EE0 quantity:a3 quantityType:a4 operatorType:a5];
}

+ (id)predicateForMinimumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)[a1 _predicateForColumn:0x1F1729F00 quantity:a3 quantityType:a4 operatorType:a5];
}

+ (id)predicateForMaximumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)[a1 _predicateForColumn:0x1F1729F20 quantity:a3 quantityType:a4 operatorType:a5];
}

+ (id)predicateForAverageQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)[a1 _predicateForColumn:0x1F1729EE0 quantity:a3 quantityType:a4 operatorType:a5];
}

- (id)SQLForEntityClass:(Class)a3
{
  v26 = HDSQLOperatorForComparisonType();
  int v5 = [(objc_class *)a3 isEqual:objc_opt_class()];
  v6 = NSString;
  if (v5)
  {
    v7 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v8 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:*MEMORY[0x1E4F65C70]];
    v9 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:0x1F1729EA0];
    v10 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:0x1F1729EC0];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKQuantityType code](self->_quantityType, "code"));
    column = self->_column;
    v13 = (void *)v8;
    v14 = [v6 stringWithFormat:@"(EXISTS (SELECT 1 FROM %@ WHERE %@=%@ AND %@=%@ AND %@%@?))", v7, v8, v9, v10, v11, column, v26];
  }
  else
  {
    uint64_t v25 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v24 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    uint64_t v15 = *MEMORY[0x1E4F65C70];
    uint64_t v23 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:*MEMORY[0x1E4F65C70]];
    v10 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:0x1F1729EA0];
    v11 = objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedSQLForProperty:", v15);
    v16 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"owner_id"];
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:@"is_primary_activity"];
    v17 = v22 = v6;
    v18 = +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:0x1F1729EC0];
    v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKQuantityType code](self->_quantityType, "code"));
    v7 = (void *)v25;
    v20 = self->_column;
    v9 = (void *)v23;
    v13 = (void *)v24;
    v14 = [v22 stringWithFormat:@"(EXISTS (SELECT 1 FROM %@ INNER JOIN %@ ON %@=%@ WHERE %@=%@ AND %@ AND %@=%@ AND %@%@?))", v25, v24, v23, v10, v11, v16, v17, v18, v19, v20, v26];
  }

  return v14;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  quantity = self->_quantity;
  v7 = [(HKQuantityType *)self->_quantityType canonicalUnit];
  [(HKQuantity *)quantity doubleValueForUnit:v7];
  double v9 = v8;

  sqlite3_bind_double(a3, *a4, v9);
  ++*a4;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutStatisticsPredicate;
  return [(HDWorkoutStatisticsPredicate *)&v3 init];
}

+ (id)_predicateForColumn:(id)a3 quantity:(id)a4 quantityType:(id)a5 operatorType:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)[objc_alloc((Class)a1) _init];
  v13 = (void *)v12[1];
  v12[1] = v9;
  id v14 = v9;

  uint64_t v15 = (void *)v12[2];
  v12[2] = v10;
  id v16 = v10;

  v17 = (void *)v12[3];
  v12[3] = v11;

  v12[4] = HDSQLiteComparisonTypeForPredicateOperator();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_quantity, 0);

  objc_storeStrong((id *)&self->_column, 0);
}

@end
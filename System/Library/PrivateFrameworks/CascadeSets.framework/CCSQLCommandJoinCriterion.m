@interface CCSQLCommandJoinCriterion
+ (CCSQLCommandJoinCriterion)criterionWithANDSubCriteria:(id)a3;
+ (CCSQLCommandJoinCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 comparingTableName:(id)a6;
- (CCSQLCommandJoinCriterion)initWithColumnName:(id)a3 onTable:(id)a4 comparingColumnName:(id)a5 comparingTableName:(id)a6 sqlOperator:(int64_t)a7;
- (CCSQLCommandJoinCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4;
- (NSArray)subCriteria;
- (NSString)columnName;
- (NSString)comparingColumnName;
- (NSString)comparingTableName;
- (NSString)tableName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sqlOperator;
@end

@implementation CCSQLCommandJoinCriterion

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_columnName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_tableName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_comparingColumnName copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_comparingTableName copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  v5[5] = self->_sqlOperator;
  uint64_t v14 = [(NSArray *)self->_subCriteria copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  return v5;
}

+ (CCSQLCommandJoinCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 comparingTableName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[CCSQLCommandJoinCriterion alloc] initWithColumnName:v12 onTable:v11 comparingColumnName:v10 comparingTableName:v9 sqlOperator:1];

  return v13;
}

- (CCSQLCommandJoinCriterion)initWithColumnName:(id)a3 onTable:(id)a4 comparingColumnName:(id)a5 comparingTableName:(id)a6 sqlOperator:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CCSQLCommandJoinCriterion;
  v17 = [(CCSQLCommandJoinCriterion *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_columnName, a3);
    objc_storeStrong((id *)&v18->_tableName, a4);
    objc_storeStrong((id *)&v18->_comparingColumnName, a5);
    objc_storeStrong((id *)&v18->_comparingTableName, a6);
    v18->_sqlOperator = a7;
  }

  return v18;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSArray)subCriteria
{
  return self->_subCriteria;
}

- (int64_t)sqlOperator
{
  return self->_sqlOperator;
}

- (NSString)comparingTableName
{
  return self->_comparingTableName;
}

- (NSString)comparingColumnName
{
  return self->_comparingColumnName;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subCriteria, 0);
  objc_storeStrong((id *)&self->_comparingTableName, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_columnName, 0);
}

- (CCSQLCommandJoinCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CCSQLCommandJoinCriterion;
  v7 = [(CCSQLCommandJoinCriterion *)&v16 init];
  uint64_t v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    comparingColumnName = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    id v11 = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    comparingTableName = v8->_comparingTableName;
    v8->_comparingTableName = 0;

    v8->_sqlOperator = a4;
    uint64_t v13 = [v6 copy];
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v13;
  }
  return v8;
}

+ (CCSQLCommandJoinCriterion)criterionWithANDSubCriteria:(id)a3
{
  id v3 = a3;
  v4 = [[CCSQLCommandJoinCriterion alloc] initWithSubCriteria:v3 sqlOperator:10];

  return v4;
}

@end
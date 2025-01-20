@interface HMBLocalSQLContextQueryTable
- (HMBLocalSQLContextQueryTable)initWithColumnNames:(id)a3;
- (NSDictionary)indexes;
- (NSMutableDictionary)mutableIndexes;
- (NSSet)columnNames;
- (id)description;
@end

@implementation HMBLocalSQLContextQueryTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableIndexes, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

- (NSMutableDictionary)mutableIndexes
{
  return self->_mutableIndexes;
}

- (NSSet)columnNames
{
  return self->_columnNames;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMBLocalSQLContextQueryTable *)self columnNames];
  v5 = [v4 allObjects];
  v6 = [v5 componentsJoinedByString:@", "];
  v7 = [(HMBLocalSQLContextQueryTable *)self mutableIndexes];
  v8 = [v3 stringWithFormat:@"<%@, %@>", v6, v7];

  return v8;
}

- (NSDictionary)indexes
{
  v2 = [(HMBLocalSQLContextQueryTable *)self mutableIndexes];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (HMBLocalSQLContextQueryTable)initWithColumnNames:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBLocalSQLContextQueryTable;
  v6 = [(HMBLocalSQLContextQueryTable *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_columnNames, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    mutableIndexes = v7->_mutableIndexes;
    v7->_mutableIndexes = (NSMutableDictionary *)v8;
  }
  return v7;
}

@end
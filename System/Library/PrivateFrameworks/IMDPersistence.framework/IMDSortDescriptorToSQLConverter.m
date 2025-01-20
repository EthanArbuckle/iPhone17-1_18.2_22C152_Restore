@interface IMDSortDescriptorToSQLConverter
- (IMDSortDescriptorToSQLConverter)init;
- (IMDSortDescriptorToSQLConverter)initWithSortDescriptor:(id)a3 keyPathsToColumns:(id)a4;
- (NSDictionary)keyPathsToColumns;
- (NSString)expression;
- (id)_columnWithSortDescriptor:(id)a3;
- (id)_orderByClauseWithSortDescriptor:(id)a3;
@end

@implementation IMDSortDescriptorToSQLConverter

- (id)_columnWithSortDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];

  if (v5)
  {
    v6 = [(IMDSortDescriptorToSQLConverter *)self keyPathsToColumns];
    v7 = [v4 key];
    v8 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_orderByClauseWithSortDescriptor:(id)a3
{
  id v4 = a3;
  int v5 = [v4 ascending];
  v6 = @"DESC";
  if (v5) {
    v6 = @"ASC";
  }
  v7 = v6;
  v8 = [(IMDSortDescriptorToSQLConverter *)self _columnWithSortDescriptor:v4];

  v9 = [NSString stringWithFormat:@"%@ %@", v8, v7];

  return v9;
}

- (IMDSortDescriptorToSQLConverter)init
{
  return 0;
}

- (IMDSortDescriptorToSQLConverter)initWithSortDescriptor:(id)a3 keyPathsToColumns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMDSortDescriptorToSQLConverter;
  v8 = [(IMDSortDescriptorToSQLConverter *)&v14 init];
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_keyPathsToColumns, a4),
        [(IMDSortDescriptorToSQLConverter *)v9 _orderByClauseWithSortDescriptor:v6], uint64_t v10 = objc_claimAutoreleasedReturnValue(), expression = v9->_expression, v9->_expression = (NSString *)v10, expression, !v9->_expression))
  {
    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (NSDictionary)keyPathsToColumns
{
  return self->_keyPathsToColumns;
}

- (NSString)expression
{
  return self->_expression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_keyPathsToColumns, 0);
}

@end
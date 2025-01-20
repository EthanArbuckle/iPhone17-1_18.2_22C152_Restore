@interface IMDPredicateToSQLConverter
- (IMDPredicateToSQLConverter)init;
- (IMDPredicateToSQLConverter)initWithPredicate:(id)a3 keyPathsToColumns:(id)a4;
- (NSArray)parameters;
- (NSDictionary)keyPathsToColumns;
- (NSString)expression;
- (void)bindParametersToSqliteWithStatement:(CSDBSqliteStatement *)a3;
@end

@implementation IMDPredicateToSQLConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundParameters, 0);
  objc_storeStrong((id *)&self->_expression, 0);
  objc_storeStrong((id *)&self->_keyPathsToColumns, 0);
}

- (IMDPredicateToSQLConverter)initWithPredicate:(id)a3 keyPathsToColumns:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMDPredicateToSQLConverter;
  v8 = [(IMDPredicateToSQLConverter *)&v15 init];
  if (v8)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    foundParameters = v8->_foundParameters;
    v8->_foundParameters = v9;

    objc_storeStrong((id *)&v8->_keyPathsToColumns, a4);
    uint64_t v11 = sub_1AFB58FD4((__CFString *)v8, v6);
    expression = v8->_expression;
    v8->_expression = (NSString *)v11;
  }
  v13 = v8;

  return v13;
}

- (void)bindParametersToSqliteWithStatement:(CSDBSqliteStatement *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(IMDPredicateToSQLConverter *)self parameters];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CSDBSqliteBindTextFromCFString();
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 integerValue];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
          objc_msgSend(v8, "__im_nanosecondTimeInterval");
        }
        CSDBSqliteBindInt64();
LABEL_13:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NSDictionary)keyPathsToColumns
{
  return self->_keyPathsToColumns;
}

- (NSArray)parameters
{
  v2 = (void *)[(NSMutableArray *)self->_foundParameters copy];
  return (NSArray *)v2;
}

- (NSString)expression
{
  return self->_expression;
}

- (IMDPredicateToSQLConverter)init
{
  return 0;
}

@end
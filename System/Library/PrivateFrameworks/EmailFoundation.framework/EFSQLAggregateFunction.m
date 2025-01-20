@interface EFSQLAggregateFunction
+ (id)avg:(id)a3;
+ (id)avgDistinct:(id)a3;
+ (id)count:(id)a3;
+ (id)countDistinct:(id)a3;
+ (id)groupConcat:(id)a3 separator:(id)a4;
+ (id)max:(id)a3;
+ (id)maxDistinct:(id)a3;
+ (id)min:(id)a3;
+ (id)minDistinct:(id)a3;
+ (id)sum:(id)a3;
+ (id)sumDistinct:(id)a3;
+ (id)total:(id)a3;
+ (id)totalDistinct:(id)a3;
- (EFSQLAggregateFunction)initWithName:(id)a3 arguments:(id)a4;
- (NSArray)arguments;
- (NSString)ef_SQLExpression;
- (NSString)name;
- (void)ef_renderSQLExpressionInto:(id)a3;
@end

@implementation EFSQLAggregateFunction

- (void)ef_renderSQLExpressionInto:(id)a3
{
  id v4 = a3;
  name = self->_name;
  arguments = self->_arguments;
  id v9 = v4;
  v7 = name;
  v8 = arguments;
  [v9 appendString:v7];
  objc_msgSend(v9, "appendString:", @"(");
  [(NSArray *)v8 ef_renderSQLExpressionInto:v9];
  [v9 appendString:@""]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)countDistinct:(id)a3
{
  id v4 = a3;
  v5 = [[_EFSQLDistinctExpression alloc] initWithExpression:v4];
  v6 = [a1 count:v5];

  return v6;
}

+ (id)count:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v8[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = [[EFSQLAggregateFunction alloc] initWithName:@"count" arguments:v5];

  return v6;
}

- (EFSQLAggregateFunction)initWithName:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLAggregateFunction;
  v8 = [(EFSQLAggregateFunction *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    arguments = v8->_arguments;
    v8->_arguments = (NSArray *)v11;
  }
  return v8;
}

+ (id)avg:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(EFSQLAggregateFunction *)v4 initWithName:@"avg" arguments:v5];

  return v6;
}

+ (id)avgDistinct:(id)a3
{
  id v4 = a3;
  v5 = [[_EFSQLDistinctExpression alloc] initWithExpression:v4];
  id v6 = [a1 avg:v5];

  return v6;
}

+ (id)groupConcat:(id)a3 separator:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v13[0] = v5;
    v13[1] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    id v12 = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }
  uint64_t v9 = (void *)v8;
  v10 = [[EFSQLAggregateFunction alloc] initWithName:@"group_concat" arguments:v8];

  return v10;
}

+ (id)max:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(EFSQLAggregateFunction *)v4 initWithName:@"max" arguments:v5];

  return v6;
}

+ (id)maxDistinct:(id)a3
{
  id v4 = a3;
  id v5 = [[_EFSQLDistinctExpression alloc] initWithExpression:v4];
  id v6 = [a1 max:v5];

  return v6;
}

+ (id)min:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(EFSQLAggregateFunction *)v4 initWithName:@"min" arguments:v5];

  return v6;
}

+ (id)minDistinct:(id)a3
{
  id v4 = a3;
  id v5 = [[_EFSQLDistinctExpression alloc] initWithExpression:v4];
  id v6 = [a1 min:v5];

  return v6;
}

+ (id)sum:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(EFSQLAggregateFunction *)v4 initWithName:@"sum" arguments:v5];

  return v6;
}

+ (id)sumDistinct:(id)a3
{
  id v4 = a3;
  id v5 = [[_EFSQLDistinctExpression alloc] initWithExpression:v4];
  id v6 = [a1 sum:v5];

  return v6;
}

+ (id)total:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [EFSQLAggregateFunction alloc];
  v8[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(EFSQLAggregateFunction *)v4 initWithName:@"total" arguments:v5];

  return v6;
}

+ (id)totalDistinct:(id)a3
{
  id v4 = a3;
  id v5 = [[_EFSQLDistinctExpression alloc] initWithExpression:v4];
  id v6 = [a1 total:v5];

  return v6;
}

- (NSString)ef_SQLExpression
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(EFSQLAggregateFunction *)self ef_renderSQLExpressionInto:v3];
  return (NSString *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)arguments
{
  return self->_arguments;
}

@end
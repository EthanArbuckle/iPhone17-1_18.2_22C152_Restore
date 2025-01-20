@interface FHDatabaseClauseFromBuilder
+ (id)initWithBuilder:(id)a3;
+ (id)initWithBuilder:(id)a3 logicalOperator:(id)a4;
- (NSArray)clauseList;
- (id)_init:(id)a3 logicalOperator:(id)a4;
- (id)clausesAndOperatorsInOrder;
- (id)description;
- (id)expressionFromClausesAndOperators;
- (void)_extractDeepLinkedClauses:(id)a3 clausesAndOperatorsInReversOrder:(id)a4;
@end

@implementation FHDatabaseClauseFromBuilder

+ (id)initWithBuilder:(id)a3
{
  return (id)[a1 initWithBuilder:a3 logicalOperator:@"AND"];
}

+ (id)initWithBuilder:(id)a3 logicalOperator:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(id, void *))a3;
  v7 = objc_opt_new();
  v6[2](v6, v7);

  id v8 = [[FHDatabaseClauseFromBuilder alloc] _init:v7 logicalOperator:v5];
  return v8;
}

- (id)_init:(id)a3 logicalOperator:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FHDatabaseClauseFromBuilder;
  id v8 = [(FHDatabaseClauseFromBuilder *)&v16 init];
  if (v8)
  {
    v17[0] = v7;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    clauseList = v8->_clauseList;
    v8->_clauseList = (NSArray *)v9;

    v11 = v8->_clauseList;
    v12 = [v6 clauseStack];
    uint64_t v13 = [(NSArray *)v11 arrayByAddingObjectsFromArray:v12];
    v14 = v8->_clauseList;
    v8->_clauseList = (NSArray *)v13;
  }
  return v8;
}

- (id)expressionFromClausesAndOperators
{
  v2 = [(FHDatabaseClauseFromBuilder *)self clausesAndOperatorsInOrder];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v2 count])
  {
    v4 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      id v6 = [v2 objectAtIndex:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [v6 shortDescription];
        [v3 addObject:v7];
        id v8 = v4;
      }
      else
      {
        id v8 = [NSString stringWithFormat:@" %@ ", v6];

        if (!v3 || ![v3 count]) {
          goto LABEL_9;
        }
        uint64_t v9 = NSString;
        v10 = [v3 componentsJoinedByString:v8];
        id v7 = [v9 stringWithFormat:@"(%@)", v10];

        [v3 removeAllObjects];
        [v15 addObject:v7];
      }

LABEL_9:
      ++v5;
      v4 = v8;
      if (v5 >= [v2 count]) {
        goto LABEL_12;
      }
    }
  }
  id v8 = 0;
LABEL_12:
  v11 = NSString;
  v12 = [v15 componentsJoinedByString:v8];
  uint64_t v13 = [v11 stringWithFormat:@"(%@)", v12];

  return v13;
}

- (id)clausesAndOperatorsInOrder
{
  id v3 = objc_opt_new();
  [(FHDatabaseClauseFromBuilder *)self _extractDeepLinkedClauses:self->_clauseList clausesAndOperatorsInReversOrder:v3];
  v4 = [v3 reverseObjectEnumerator];
  unint64_t v5 = [v4 allObjects];

  return v5;
}

- (void)_extractDeepLinkedClauses:(id)a3 clausesAndOperatorsInReversOrder:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 clauseList];
          [(FHDatabaseClauseFromBuilder *)self _extractDeepLinkedClauses:v13 clausesAndOperatorsInReversOrder:v7];
        }
        else
        {
          [v7 addObject:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)description
{
  id v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"clauseList: '%@'; ", self->_clauseList];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSArray)clauseList
{
  return self->_clauseList;
}

- (void).cxx_destruct
{
}

@end
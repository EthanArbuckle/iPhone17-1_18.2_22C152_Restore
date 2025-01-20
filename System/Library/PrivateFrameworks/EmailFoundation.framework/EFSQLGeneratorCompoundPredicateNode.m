@interface EFSQLGeneratorCompoundPredicateNode
- (EFSQLGeneratorCompoundPredicateNode)initWithPredicateType:(unint64_t)a3 childPredicates:(id)a4;
- (EFSQLValueExpressable)sqlExpressable;
- (NSArray)childPredicates;
- (unint64_t)predicateType;
@end

@implementation EFSQLGeneratorCompoundPredicateNode

- (void).cxx_destruct
{
}

- (EFSQLValueExpressable)sqlExpressable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(EFSQLGeneratorCompoundPredicateNode *)self childPredicates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) sqlExpressable];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  if ([(EFSQLGeneratorCompoundPredicateNode *)self predicateType] == 1)
  {
    v9 = off_1E61214B0;
LABEL_12:
    v10 = [(__objc2_class *)*v9 combined:v3];
    goto LABEL_13;
  }
  if ([(EFSQLGeneratorCompoundPredicateNode *)self predicateType] == 2)
  {
    v9 = off_1E6121540;
    goto LABEL_12;
  }
  if ([(EFSQLGeneratorCompoundPredicateNode *)self predicateType])
  {
    v10 = 0;
  }
  else
  {
    v12 = [EFSQLNotExpression alloc];
    v13 = +[EFSQLAndExpression combined:v3];
    v10 = [(EFSQLNotExpression *)v12 initWithExpression:v13];
  }
LABEL_13:

  return (EFSQLValueExpressable *)v10;
}

- (unint64_t)predicateType
{
  return self->_predicateType;
}

- (NSArray)childPredicates
{
  return self->_childPredicates;
}

- (EFSQLGeneratorCompoundPredicateNode)initWithPredicateType:(unint64_t)a3 childPredicates:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EFSQLGeneratorCompoundPredicateNode;
  v8 = [(EFSQLGeneratorCompoundPredicateNode *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_predicateType = a3;
    objc_storeStrong((id *)&v8->_childPredicates, a4);
  }

  return v9;
}

@end
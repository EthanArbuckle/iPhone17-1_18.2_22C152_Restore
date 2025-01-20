@interface _DKBiomePredicateScanner
+ (id)searchForKeys:(id)a3 inPredicate:(id)a4;
- (id)_initWithSearchKeys:(id)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _DKBiomePredicateScanner

- (void)visitPredicateExpression:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(NSMutableSet *)self->_matchedKeys count];
  BOOL v5 = v4 == [(NSSet *)self->_searchKeys count];
  v6 = v10;
  if (!v5)
  {
    BOOL v5 = [v10 expressionType] == 3;
    v6 = v10;
    if (v5 || (BOOL v5 = [v10 expressionType] == 10, v6 = v10, v5))
    {
      v7 = [v6 keyPath];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [v7 componentsSeparatedByString:@"."];
        v9 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
        [v9 intersectSet:self->_searchKeys];
        [(NSMutableSet *)self->_matchedKeys unionSet:v9];
      }
      v6 = v10;
    }
  }
}

+ (id)searchForKeys:(id)a3 inPredicate:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    v7 = [[_DKBiomePredicateScanner alloc] _initWithSearchKeys:v6];

    [v5 acceptVisitor:v7 flags:1];
    if ([v7[2] count]) {
      id v8 = v7[2];
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)_initWithSearchKeys:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKBiomePredicateScanner;
  id v5 = [(_DKBiomePredicateScanner *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    searchKeys = v5->_searchKeys;
    v5->_searchKeys = (NSSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    matchedKeys = v5->_matchedKeys;
    v5->_matchedKeys = (NSMutableSet *)v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedKeys, 0);
  objc_storeStrong((id *)&self->_searchKeys, 0);
}

@end
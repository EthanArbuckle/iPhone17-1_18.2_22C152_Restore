@interface _DKBiomePredicateValueScanner
+ (id)searchForValuesForKey:(id)a3 inPredicate:(id)a4;
- (id)_initWithSearchKeys:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _DKBiomePredicateValueScanner

- (void)visitPredicateExpression:(id)a3
{
  id v12 = a3;
  v4 = (void *)MEMORY[0x192FB2F20]();
  unint64_t state = self->_state;
  if (state == 3)
  {
    if ([v12 expressionType])
    {
LABEL_16:
      if ([v12 expressionType] != 14) {
        goto LABEL_20;
      }
      v6 = [v12 collection];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        matchedValues = self->_matchedValues;
        v11 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_18);
        [(NSMutableSet *)matchedValues addObjectsFromArray:v11];

        self->_unint64_t state = 1;
      }
      goto LABEL_19;
    }
    v9 = [v12 constantValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NSMutableSet *)self->_matchedValues addObject:v9];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      [(NSMutableSet *)self->_matchedValues addObjectsFromArray:v9];
    }
    self->_unint64_t state = 1;
    goto LABEL_15;
  }
  if (state == 2 && ([v12 expressionType] == 3 || objc_msgSend(v12, "expressionType") == 10))
  {
    v6 = [v12 keyPath];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 componentsSeparatedByString:@"."];
      v8 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
      [v8 intersectSet:self->_searchKeys];
      if ([v8 count]) {
        self->_unint64_t state = 3;
      }
    }
LABEL_19:
  }
LABEL_20:
}

- (void)visitPredicateOperator:(id)a3
{
  id v4 = a3;
  unint64_t state = self->_state;
  if (state - 2 >= 2)
  {
    if (state != 1) {
      goto LABEL_8;
    }
  }
  else
  {
    self->_unint64_t state = 1;
  }
  id v7 = v4;
  BOOL v6 = [v4 operatorType] == 4;
  id v4 = v7;
  if (v6 || (v6 = [v7 operatorType] == 10, id v4 = v7, v6)) {
    self->_unint64_t state = 2;
  }
LABEL_8:
}

+ (id)searchForValuesForKey:(id)a3 inPredicate:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [_DKBiomePredicateValueScanner alloc];
  v13[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v9 = [(_DKBiomePredicateValueScanner *)v7 _initWithSearchKeys:v8];

  [v5 acceptVisitor:v9 flags:15];
  id v10 = (id)[v9[2] count];
  if (v10) {
    id v10 = v9[2];
  }
  id v11 = v10;

  return v11;
}

- (id)_initWithSearchKeys:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKBiomePredicateValueScanner;
  id v5 = [(_DKBiomePredicateValueScanner *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    searchKeys = v5->_searchKeys;
    v5->_searchKeys = (NSSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    matchedValues = v5->_matchedValues;
    v5->_matchedValues = (NSMutableSet *)v8;

    v5->_unint64_t state = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedValues, 0);
  objc_storeStrong((id *)&self->_searchKeys, 0);
}

@end
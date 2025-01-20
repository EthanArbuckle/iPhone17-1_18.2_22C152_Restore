@interface CNPredicateValidator
- (BOOL)validateWithError:(id *)a3;
- (BOOL)validated;
- (NSArray)allowedKeys;
- (NSArray)usedKeys;
- (NSError)error;
- (NSMutableSet)usedKeysSet;
- (NSPredicate)predicate;
- (NSSet)allowedKeysSet;
- (void)resetUsedKeys;
- (void)setAllowedKeys:(id)a3;
- (void)setAllowedKeysSet:(id)a3;
- (void)setError:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setUsedKeysSet:(id)a3;
- (void)setValidated:(BOOL)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation CNPredicateValidator

- (BOOL)validateWithError:(id *)a3
{
  [(CNPredicateValidator *)self setValidated:1];
  uint64_t v5 = [(CNPredicateValidator *)self predicate];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(CNPredicateValidator *)self allowedKeys];

    if (v7)
    {
      v8 = [(CNPredicateValidator *)self predicate];
      [v8 acceptVisitor:self flags:3];

      if (a3)
      {
        v9 = [(CNPredicateValidator *)self error];

        if (v9)
        {
          *a3 = [(CNPredicateValidator *)self error];
        }
      }
    }
  }

  return [(CNPredicateValidator *)self validated];
}

- (void)setAllowedKeys:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {

LABEL_11:
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __39__CNPredicateValidator_setAllowedKeys___block_invoke;
          v14[3] = &unk_1E56B8BC8;
          id v15 = v4;
          objc_msgSend(v10, "_cn_executeGetterForRepresentedKeys:", v14);

          goto LABEL_12;
        }
        int v11 = [v10 conformsToProtocol:&unk_1EE097850];

        if (v11) {
          goto LABEL_11;
        }
LABEL_12:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }

  [(CNPredicateValidator *)self setAllowedKeysSet:v4];
}

uint64_t __39__CNPredicateValidator_setAllowedKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (NSArray)allowedKeys
{
  v2 = [(CNPredicateValidator *)self allowedKeysSet];
  id v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CNPredicateValidator *)self validated]) {
    goto LABEL_34;
  }
  if (visitPredicateExpression__cn_once_token_0 != -1) {
    dispatch_once(&visitPredicateExpression__cn_once_token_0, &__block_literal_global_138);
  }
  id v5 = (id)visitPredicateExpression__cn_once_object_0;
  uint64_t v6 = [v4 expressionType];
  id v29 = v4;
  if (v6 != 10)
  {
    if (v6 == 4)
    {
      v22 = (void *)MEMORY[0x1E4F28C68];
      v23 = [v4 function];
      v24 = [v4 arguments];
      v25 = [v22 expressionForFunction:v23 arguments:v24];

      if (!v25)
      {
        [(CNPredicateValidator *)self setValidated:0];
        v26 = +[CNErrorFactory errorWithCode:400 userInfo:0];
        [(CNPredicateValidator *)self setError:v26];

        v25 = 0;
      }

      goto LABEL_33;
    }
    if (v6 != 3) {
      goto LABEL_33;
    }
  }
  v28 = [v4 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = +[CNErrorFactory errorWithCode:400 userInfo:0];
    [(CNPredicateValidator *)self setError:v27];

    [(CNPredicateValidator *)self setValidated:0];
    goto LABEL_32;
  }
  uint64_t v7 = [v4 keyPath];
  uint64_t v8 = [v7 componentsSeparatedByString:@"."];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (!v10) {
    goto LABEL_25;
  }
  uint64_t v11 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v9);
      }
      v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if (objc_msgSend(v13, "hasPrefix:", @"@", v28))
      {
        if ((unint64_t)[v13 length] < 2) {
          goto LABEL_22;
        }
        v14 = [v13 substringFromIndex:1];
        if (([v5 containsObject:v14] & 1) == 0) {
          [(CNPredicateValidator *)self setValidated:0];
        }
      }
      else
      {
        id v15 = [(CNPredicateValidator *)self allowedKeysSet];
        char v16 = [v15 containsObject:v13];

        if ((v16 & 1) == 0)
        {
LABEL_22:
          [(CNPredicateValidator *)self setValidated:0];
          continue;
        }
        usedKeysSet = self->_usedKeysSet;
        if (!usedKeysSet)
        {
          long long v18 = [MEMORY[0x1E4F1CA80] set];
          [(CNPredicateValidator *)self setUsedKeysSet:v18];

          usedKeysSet = self->_usedKeysSet;
        }
        [(NSMutableSet *)usedKeysSet addObject:v13];
      }
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v37 count:16];
  }
  while (v10);
LABEL_25:

  if (![(CNPredicateValidator *)self validated])
  {
    v34 = v28;
    v35 = @"CNKeyPaths";
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    v36 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v21 = +[CNErrorFactory errorWithCode:400 userInfo:v20];
    [(CNPredicateValidator *)self setError:v21];
  }
LABEL_32:

LABEL_33:
  id v4 = v29;
LABEL_34:
}

uint64_t __49__CNPredicateValidator_visitPredicateExpression___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F281E0], *MEMORY[0x1E4F28200], *MEMORY[0x1E4F28238], *MEMORY[0x1E4F28240], *MEMORY[0x1E4F28248], *MEMORY[0x1E4F285B0], *MEMORY[0x1E4F28748], *MEMORY[0x1E4F28910], *MEMORY[0x1E4F28AA0], *MEMORY[0x1E4F28AA8], *MEMORY[0x1E4F28AB0], 0);
  uint64_t v2 = visitPredicateExpression__cn_once_object_0;
  visitPredicateExpression__cn_once_object_0 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (NSArray)usedKeys
{
  uint64_t v2 = [(NSMutableSet *)self->_usedKeysSet allObjects];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)resetUsedKeys
{
}

- (void)visitPredicateOperator:(id)a3
{
  if ([a3 operatorType] == 11)
  {
    [(CNPredicateValidator *)self setValidated:0];
  }
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSSet)allowedKeysSet
{
  return self->_allowedKeysSet;
}

- (void)setAllowedKeysSet:(id)a3
{
}

- (NSMutableSet)usedKeysSet
{
  return self->_usedKeysSet;
}

- (void)setUsedKeysSet:(id)a3
{
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_usedKeysSet, 0);
  objc_storeStrong((id *)&self->_allowedKeysSet, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
@interface _DKPredicateValidator
+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5;
+ (BOOL)validateSortDescriptors:(id)a3;
- (BOOL)validateWithError:(id *)a3;
- (BOOL)validated;
- (NSError)error;
- (NSPredicate)predicate;
- (NSSet)allowedKeys;
- (_DKPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4;
- (void)setAllowedKeys:(id)a3;
- (void)setError:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setValidated:(BOOL)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _DKPredicateValidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_allowedKeys, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (BOOL)validateSortDescriptors:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"alloc", @"new", @"init", @"mutableCopy", @"release", @"retain", @"autorelease", @"dealloc", @"finalize", 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) key];
        v11 = [v10 componentsSeparatedByString:@"."];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if ([v4 containsObject:*(void *)(*((void *)&v19 + 1) + 8 * j)])
              {

                BOOL v17 = 0;
                goto LABEL_19;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v17 = 1;
    }
    while (v7);
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_19:

  return v17;
}

+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = (void *)[objc_alloc((Class)a1) initWithPredicate:v9 allowedKeys:v8];

    if (v10)
    {
      LOBYTE(a5) = [v10 validateWithError:a5];
    }
    else if (a5)
    {
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14[0] = @"Predicate was invalid because it was nil.";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMQueryErrorDomain" code:2 userInfo:v11];

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    LOBYTE(a5) = 1;
  }
  return (char)a5;
}

- (BOOL)validateWithError:(id *)a3
{
  [(_DKPredicateValidator *)self setValidated:1];
  id v5 = [(_DKPredicateValidator *)self predicate];

  if (v5)
  {
    uint64_t v6 = [(_DKPredicateValidator *)self predicate];
    [v6 acceptVisitor:self flags:3];

    if (a3)
    {
      uint64_t v7 = [(_DKPredicateValidator *)self error];

      if (v7)
      {
        *a3 = [(_DKPredicateValidator *)self error];
      }
    }
  }
  return [(_DKPredicateValidator *)self validated];
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (_DKPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)_DKPredicateValidator;
    id v8 = [(_DKPredicateValidator *)&v15 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      predicate = v8->_predicate;
      v8->_predicate = (NSPredicate *)v9;

      if (v7)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
        allowedKeys = v8->_allowedKeys;
        v8->_allowedKeys = (NSSet *)v11;
      }
    }
    self = v8;
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (NSError)error
{
  return self->_error;
}

- (void)visitPredicateExpression:(id)a3
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_DKPredicateValidator *)self validated])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v42 = objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E4F281E0], *MEMORY[0x1E4F28200], *MEMORY[0x1E4F28238], *MEMORY[0x1E4F28240], *MEMORY[0x1E4F28248], *MEMORY[0x1E4F285B0], *MEMORY[0x1E4F28748], *MEMORY[0x1E4F28910], *MEMORY[0x1E4F28AA0], *MEMORY[0x1E4F28AA8], *MEMORY[0x1E4F28AB0], 0);
    uint64_t v6 = [v4 expressionType];
    id v41 = v4;
    if (v6 == 10)
    {
LABEL_5:
      v40 = [v4 keyPath];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v55 = *MEMORY[0x1E4F28568];
        v27 = [NSString stringWithFormat:@"Invalid keypath class: %@", objc_opt_class()];
        v56[0] = v27;
        obuint64_t j = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];

        v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMQueryErrorDomain" code:2 userInfo:obj];
        [(_DKPredicateValidator *)self setError:v28];

        [(_DKPredicateValidator *)self setValidated:0];
        goto LABEL_38;
      }
      id v7 = [v4 keyPath];
      id v8 = [v7 componentsSeparatedByString:@"."];

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      obuint64_t j = v8;
      uint64_t v9 = 0;
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (!v10) {
        goto LABEL_24;
      }
      uint64_t v11 = *(void *)v45;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v13 hasPrefix:@"@"])
          {
            if ((unint64_t)[v13 length] < 2) {
              goto LABEL_21;
            }
            uint64_t v14 = [v13 substringFromIndex:1];
            if (([v42 containsObject:v14] & 1) == 0) {
              [(_DKPredicateValidator *)self setValidated:0];
            }
          }
          else
          {
            objc_super v15 = [(_DKPredicateValidator *)self allowedKeys];
            if (v15)
            {
              v16 = [(_DKPredicateValidator *)self allowedKeys];
              char v17 = [v16 containsObject:v13];

              if ((v17 & 1) == 0)
              {
LABEL_21:
                [(_DKPredicateValidator *)self setValidated:0];
                continue;
              }
            }
            if (!v9) {
              uint64_t v9 = objc_opt_new();
            }
            [v9 addObject:v13];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (!v10)
        {
LABEL_24:

          if (![(_DKPredicateValidator *)self validated])
          {
            uint64_t v52 = *MEMORY[0x1E4F28568];
            v18 = [NSString stringWithFormat:@"Used keys: %@", v9];
            v53 = v18;
            long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];

            long long v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMQueryErrorDomain" code:2 userInfo:v19];
            [(_DKPredicateValidator *)self setError:v20];
          }
          goto LABEL_38;
        }
      }
    }
    if (v6 != 4)
    {
      if (v6 == 3) {
        goto LABEL_5;
      }
      goto LABEL_39;
    }
    v40 = [v4 function];
    obuint64_t j = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"valueForKey:", @"valueForKeyPath:", @"value", 0);
    if ([obj containsObject:v40]) {
      goto LABEL_38;
    }
    if (![v40 isEqual:@"castObject:toType:"])
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C68];
      v30 = [v4 function];
      v31 = [v4 arguments];
      v32 = [v29 expressionForFunction:v30 arguments:v31];

      if (!v32)
      {
        [(_DKPredicateValidator *)self setValidated:0];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        v33 = [NSString stringWithFormat:@"Invalid function: %@", v40];
        v49 = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];

        v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMQueryErrorDomain" code:2 userInfo:v34];
        [(_DKPredicateValidator *)self setError:v35];

        v32 = 0;
      }

LABEL_38:
LABEL_39:

      id v4 = v41;
      goto LABEL_40;
    }
    long long v21 = [v4 arguments];
    if ([v21 count] == 2)
    {
      long long v22 = [v4 arguments];
      long long v23 = [v22 objectAtIndexedSubscript:1];
      if (![v23 expressionType])
      {
        v36 = [v4 arguments];
        v37 = [v36 objectAtIndexedSubscript:1];
        v38 = [v37 constantValue];
        char v39 = [v38 isEqual:@"NSDate"];

        if (v39) {
          goto LABEL_38;
        }
LABEL_33:
        [(_DKPredicateValidator *)self setValidated:0];
        long long v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v51 = @"Unsupported cast";
        long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        long long v26 = [v24 errorWithDomain:@"BMQueryErrorDomain" code:3 userInfo:v25];
        [(_DKPredicateValidator *)self setError:v26];

        goto LABEL_38;
      }
    }
    goto LABEL_33;
  }
LABEL_40:
}

- (BOOL)validated
{
  return self->_validated;
}

- (NSSet)allowedKeys
{
  return self->_allowedKeys;
}

- (void)setPredicate:(id)a3
{
}

- (void)setAllowedKeys:(id)a3
{
}

- (void)setError:(id)a3
{
}

@end
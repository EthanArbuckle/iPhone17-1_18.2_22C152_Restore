@interface _CDPredicateValidator
+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5;
- (BOOL)validateWithError:(id *)a3;
- (BOOL)validated;
- (NSError)error;
- (NSPredicate)predicate;
- (NSSet)allowedKeys;
- (_CDPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4;
- (void)_cd_validateKeypath:(id)a3;
- (void)setAllowedKeys:(id)a3;
- (void)setError:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setValidated:(BOOL)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _CDPredicateValidator

+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
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
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:v11];

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (_CDPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)_CDPredicateValidator;
    id v8 = [(_CDPredicateValidator *)&v15 init];
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

- (BOOL)validateWithError:(id *)a3
{
  [(_CDPredicateValidator *)self setValidated:1];
  v5 = [(_CDPredicateValidator *)self predicate];

  if (v5)
  {
    id v6 = [(_CDPredicateValidator *)self predicate];
    [v6 acceptVisitor:self flags:3];

    if (a3)
    {
      id v7 = [(_CDPredicateValidator *)self error];

      if (v7)
      {
        *a3 = [(_CDPredicateValidator *)self error];
      }
    }
  }
  if (![(_CDPredicateValidator *)self validated])
  {
    id v8 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_CDPredicateValidator validateWithError:](self, v8);
    }
  }
  return [(_CDPredicateValidator *)self validated];
}

- (void)_cd_validateKeypath:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [(_CDPredicateValidator *)self setValidated:0];
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F5B658];
      uint64_t v30 = *MEMORY[0x1E4F5B668];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42[0] = @"Invalid keypath type";
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      id v6 = objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v30);
      [(_CDPredicateValidator *)self setError:v6];
      goto LABEL_29;
    }
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v33 = objc_msgSend(v5, "initWithObjects:", *MEMORY[0x1E4F281E0], *MEMORY[0x1E4F28200], *MEMORY[0x1E4F28238], *MEMORY[0x1E4F28240], *MEMORY[0x1E4F28248], *MEMORY[0x1E4F285B0], *MEMORY[0x1E4F28748], *MEMORY[0x1E4F28910], *MEMORY[0x1E4F28AA0], *MEMORY[0x1E4F28AA8], *MEMORY[0x1E4F28AB0], 0);
  id v31 = v4;
  id v6 = [v4 componentsSeparatedByString:@"."];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v35;
  uint64_t v11 = @"@";
  do
  {
    uint64_t v12 = 0;
    uint64_t v32 = v8;
    do
    {
      if (*(void *)v35 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
      if ([v13 hasPrefix:v11])
      {
        if ((unint64_t)[v13 length] < 2) {
          goto LABEL_20;
        }
        v14 = [v13 substringFromIndex:1];
        if (([v33 containsObject:v14] & 1) == 0) {
          [(_CDPredicateValidator *)self setValidated:0];
        }
      }
      else
      {
        if ([v13 isEqual:@"class"]) {
          goto LABEL_20;
        }
        uint64_t v15 = [(_CDPredicateValidator *)self allowedKeys];
        if (v15)
        {
          v16 = (void *)v15;
          [(_CDPredicateValidator *)self allowedKeys];
          uint64_t v17 = v10;
          v18 = self;
          v19 = v11;
          v20 = v6;
          v22 = v21 = v9;
          char v23 = [v22 containsObject:v13];

          uint64_t v9 = v21;
          id v6 = v20;
          uint64_t v11 = v19;
          self = v18;
          uint64_t v10 = v17;
          uint64_t v8 = v32;

          if ((v23 & 1) == 0)
          {
LABEL_20:
            [(_CDPredicateValidator *)self setValidated:0];
            goto LABEL_21;
          }
        }
        if (!v9) {
          uint64_t v9 = objc_opt_new();
        }
        [v9 addObject:v13];
      }
LABEL_21:
      ++v12;
    }
    while (v8 != v12);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  }
  while (v8);
LABEL_25:
  if (![(_CDPredicateValidator *)self validated])
  {
    uint64_t v38 = *MEMORY[0x1E4F28568];
    [NSString stringWithFormat:@"Used keys: %@", v9];
    v25 = v24 = v9;
    v39 = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

    v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:v26];
    [(_CDPredicateValidator *)self setError:v27];

    uint64_t v9 = v24;
  }

  id v4 = v31;
LABEL_29:
}

- (void)visitPredicateExpression:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_CDPredicateValidator *)self validated]) {
    goto LABEL_34;
  }
  uint64_t v5 = [v4 expressionType];
  switch(v5)
  {
    case 10:
LABEL_5:
      id v6 = [v4 keyPath];
      [(_CDPredicateValidator *)self _cd_validateKeypath:v6];

      break;
    case 4:
      uint64_t v7 = [v4 function];
      if ([v7 isEqual:@"objectFrom:withIndex:"])
      {
LABEL_33:

        break;
      }
      if ([v7 isEqual:@"castObject:toType:"])
      {
        uint64_t v8 = [v4 arguments];
        if ([v8 count] == 2)
        {
          uint64_t v9 = [v4 arguments];
          uint64_t v10 = [v9 objectAtIndexedSubscript:1];
          if (![v10 expressionType])
          {
            v28 = [v4 arguments];
            uint64_t v29 = [v28 objectAtIndexedSubscript:1];
            uint64_t v30 = [v29 constantValue];
            char v31 = [v30 isEqual:@"NSDate"];

            if (v31) {
              goto LABEL_33;
            }
            goto LABEL_12;
          }
        }
LABEL_12:
        [(_CDPredicateValidator *)self setValidated:0];
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40[0] = @"Unsupported cast";
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        uint64_t v13 = [v11 errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:v12];
        [(_CDPredicateValidator *)self setError:v13];

LABEL_32:
        goto LABEL_33;
      }
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"valueForKey:", @"valueForKeyPath:", 0);
      if (![v12 containsObject:v7])
      {
        v16 = (void *)MEMORY[0x1E4F28C68];
        uint64_t v17 = [v4 function];
        uint64_t v18 = [v4 arguments];
        v19 = (void *)v18;
        if (v18) {
          uint64_t v20 = v18;
        }
        else {
          uint64_t v20 = MEMORY[0x1E4F1CBF0];
        }
        v21 = [v16 expressionForFunction:v17 arguments:v20];

        if (!v21)
        {
          [(_CDPredicateValidator *)self setValidated:0];
          v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v35 = *MEMORY[0x1E4F28568];
          long long v36 = @"Unsupported function";
          char v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          v24 = [v22 errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:v23];
          [(_CDPredicateValidator *)self setError:v24];

          v21 = 0;
        }

        goto LABEL_32;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [v4 pathExpression];
        if (![v14 expressionType] || objc_msgSend(v14, "expressionType") == 10)
        {
          uint64_t v15 = [v14 constantValue];
          [(_CDPredicateValidator *)self _cd_validateKeypath:v15];
LABEL_27:

          goto LABEL_32;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = [v4 arguments];
          uint64_t v26 = [v25 count];

          if (v26 == 1)
          {
            v14 = [v4 arguments];
            uint64_t v15 = [v14 firstObject];
            v27 = [v15 constantValue];
            [(_CDPredicateValidator *)self _cd_validateKeypath:v27];

            goto LABEL_27;
          }
        }
      }
      [(_CDPredicateValidator *)self setValidated:0];
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      uint64_t v38 = @"Unsupported format";
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      long long v34 = [v32 errorWithDomain:*MEMORY[0x1E4F5B658] code:*MEMORY[0x1E4F5B668] userInfo:v33];
      [(_CDPredicateValidator *)self setError:v34];

      goto LABEL_32;
    case 3:
      goto LABEL_5;
  }
LABEL_34:
}

- (void)visitPredicateOperator:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a3 operatorType];
  if (v4 >= 0xB && v4 - 99 >= 2)
  {
    if (v4 == 11)
    {
      [(_CDPredicateValidator *)self setValidated:0];
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = *MEMORY[0x1E4F5B658];
      uint64_t v7 = *MEMORY[0x1E4F5B668];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16[0] = @"Unsupported operator type";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = (__CFString **)v16;
      uint64_t v10 = &v15;
    }
    else
    {
      [(_CDPredicateValidator *)self setValidated:0];
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = *MEMORY[0x1E4F5B658];
      uint64_t v7 = *MEMORY[0x1E4F5B668];
      uint64_t v13 = *MEMORY[0x1E4F28568];
      v14 = @"Unhandled operator type";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v14;
      uint64_t v10 = &v13;
    }
    uint64_t v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    uint64_t v12 = [v5 errorWithDomain:v6 code:v7 userInfo:v11];
    [(_CDPredicateValidator *)self setError:v12];
  }
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSSet)allowedKeys
{
  return self->_allowedKeys;
}

- (void)setAllowedKeys:(id)a3
{
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
  objc_storeStrong((id *)&self->_allowedKeys, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)validateWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [a1 predicate];
  uint64_t v5 = [a1 error];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_18EC9B000, a2, OS_LOG_TYPE_ERROR, "Rejecting predicate: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

@end
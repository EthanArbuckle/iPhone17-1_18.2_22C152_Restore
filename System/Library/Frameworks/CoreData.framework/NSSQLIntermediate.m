@interface NSSQLIntermediate
+ (BOOL)expressionIsBasicKeypath:(id)a3;
+ (BOOL)isSimpleKeypath:(id)a3;
- (BOOL)_functionExpressionIsSubqueryFollowedByKeypath:(BOOL)result;
- (BOOL)disambiguationKeypathHasToMany;
- (BOOL)isFunctionScoped;
- (BOOL)isHavingScoped;
- (BOOL)isIndexExpressionScoped;
- (BOOL)isIndexScoped;
- (BOOL)isOrScoped;
- (BOOL)isTargetColumnsScoped;
- (BOOL)isUpdateColumnsScoped;
- (BOOL)isUpdateScoped;
- (BOOL)isWhereScoped;
- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3;
- (NSArray)disambiguationKeypath;
- (NSSQLEntity)disambiguatingEntity;
- (NSSQLIntermediate)initWithScope:(id)a3;
- (id)_generateSQLForExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:;
- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5;
- (id)_lastScopedItem;
- (id)fetchIntermediate;
- (id)fetchIntermediateForKeypathExpression:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)governingAlias;
- (id)governingAliasForKeypathExpression:(id)a3;
- (id)governingEntity;
- (id)governingEntityForKeypathExpression:(id)a3;
- (uint64_t)_generateSQLForConstantCollection:(uint64_t)a3 reboundFrom:(void *)a4 inContext:;
- (uint64_t)_generateSQLForConstantValue:(uint64_t)a3 inContext:;
- (uint64_t)_generateSQLForFetchExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:;
- (uint64_t)_generateSQLForSubqueryExpression:(uint64_t)a3 trailingKeypath:(void *)a4 inContext:;
- (uint64_t)isSimpleNoIndexFunction:(uint64_t)a1;
- (uint64_t)isVariableBasedKeypathScopedBySubquery:(uint64_t)result;
- (uint64_t)promoteJoinsInKeypathsForExpression:(uint64_t)result;
- (void)_generateSQLForExpressionCollection:(uint64_t)a3 allowToMany:(void *)a4 inContext:;
- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3;
- (void)_promoteJoinsForSubqueryScopedKeypaths;
- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5;
@end

@implementation NSSQLIntermediate

- (BOOL)isIndexScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isIndexScoped];
  }
  return (char)scope;
}

- (BOOL)isUpdateScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isUpdateScoped];
  }
  return (char)scope;
}

- (BOOL)isTargetColumnsScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isTargetColumnsScoped];
  }
  return (char)scope;
}

- (id)governingEntityForKeypathExpression:(id)a3
{
  return [(NSSQLIntermediate *)self->_scope governingEntityForKeypathExpression:a3];
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  return [(NSSQLIntermediate *)self->_scope governingAliasForKeypathExpression:a3];
}

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  return [(NSSQLIntermediate *)self->_scope fetchIntermediateForKeypathExpression:a3];
}

- (NSSQLEntity)disambiguatingEntity
{
  return [(NSSQLIntermediate *)self->_scope disambiguatingEntity];
}

- (BOOL)isOrScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isOrScoped];
  }
  return (char)scope;
}

- (NSArray)disambiguationKeypath
{
  return [(NSSQLIntermediate *)self->_scope disambiguationKeypath];
}

- (BOOL)isFunctionScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isFunctionScoped];
  }
  return (char)scope;
}

- (id)_lastScopedItem
{
  id result = self->_scope;
  if (result) {
    return (id)[result _lastScopedItem];
  }
  return result;
}

+ (BOOL)isSimpleKeypath:(id)a3
{
  if ([a3 expressionType] == 3) {
    return 1;
  }

  return [a1 expressionIsBasicKeypath:a3];
}

- (id)_generateSQLForExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  id v4 = a1;
  if (!a1) {
    return v4;
  }
  if ([a4 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  uint64_t v9 = [a2 expressionType];
  switch(v9)
  {
    case 0:
      uint64_t v13 = [a2 constantValue];
      return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)v4, v13, (uint64_t)a4);
    case 1:
      uint64_t v11 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"_pk"];
      v10 = v4;
      uint64_t v12 = 0;
      goto LABEL_17;
    case 2:
      return (id)[v4 _generateSQLForVariableExpression:a2 allowToMany:a3 inContext:a4];
    case 3:
    case 10:
      goto LABEL_7;
    case 4:
      if (([(id)objc_opt_class() expressionIsBasicKeypath:a2] & 1) != 0
        || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)v4, a2))
      {
LABEL_7:
        v10 = v4;
        uint64_t v11 = (uint64_t)a2;
        uint64_t v12 = a3;
LABEL_17:
        return (id)[v10 _generateSQLForKeyPathExpression:v11 allowToMany:v12 inContext:a4];
      }
      else
      {
        if (!-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((BOOL)v4, a2))
        {
          v21 = [(NSSQLExpressionIntermediate *)[NSSQLFunctionExpressionIntermediate alloc] initWithExpression:a2 allowToMany:0 inScope:v4];
          id v4 = [(NSSQLFunctionExpressionIntermediate *)v21 generateSQLStringInContext:a4];
          if (!v4 && ![a4 objectForKey:@"NSUnderlyingExceptionKey"]) {
            [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported function expression %@", a2), 0), @"NSUnderlyingException" forKey];
          }

          return v4;
        }
        uint64_t v14 = [a2 operand];
        uint64_t v15 = objc_msgSend((id)objc_msgSend(a2, "arguments"), "objectAtIndex:", 0);
        uint64_t v16 = (uint64_t)v4;
        v17 = (void *)v14;
LABEL_28:
        return (id)-[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:](v16, v17, v15, a4);
      }
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 12:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      goto LABEL_12;
    case 13:
      uint64_t v16 = (uint64_t)v4;
      v17 = a2;
      uint64_t v15 = 0;
      goto LABEL_28;
    case 14:
      v18 = (void *)[a2 constantValue];
      return -[NSSQLIntermediate _generateSQLForExpressionCollection:allowToMany:inContext:](v4, v18, a3, a4);
    case 20:
      v19 = [(NSSQLExpressionIntermediate *)[NSSQLTernaryExpressionIntermediate alloc] initWithExpression:a2 allowToMany:a3 inScope:v4];
      uint64_t v20 = [(NSSQLTernaryExpressionIntermediate *)v19 generateSQLStringInContext:a4];

      return (id)v20;
    default:
      if (v9 != 50)
      {
LABEL_12:
        [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported expression type (%u, %@)", objc_msgSend(a2, "expressionType"), a2), 0), @"NSUnderlyingException" forKey];
        return 0;
      }
      id result = (id)-[NSSQLIntermediate _generateSQLForFetchExpression:allowToMany:inContext:](v4, a2, 0, a4);
      break;
  }
  return result;
}

- (id)_generateSQLForKeyPathExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  BOOL v6 = a4;
  if (objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType"))
  {
    uint64_t v9 = [(NSSQLExpressionIntermediate *)[NSSQLKeypathExpressionIntermediate alloc] initWithExpression:a3 allowToMany:v6 inScope:self];
    id v10 = [(NSSQLKeypathExpressionIntermediate *)v9 generateSQLStringInContext:a5];

    return v10;
  }
  else
  {
    uint64_t v12 = (void *)[a3 constantValue];
    if (([v12 isNSArray] & 1) != 0
      || ([v12 isNSSet] & 1) != 0
      || [v12 isNSOrderedSet])
    {
      return (id)-[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)self, v12, 0, a5);
    }
    else
    {
      return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, (uint64_t)v12, (uint64_t)a5);
    }
  }
}

- (uint64_t)isVariableBasedKeypathScopedBySubquery:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)result;
    if ([a2 expressionType] == 4 && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 2)
    {
      id result = [v3 governingEntityForKeypathExpression:a2];
      if (result) {
        return sel_valueForKey_ == (char *)[a2 selector]
      }
            || sel_valueForKeyPath_ == (char *)[a2 selector];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_promoteJoinsForSubqueryScopedKeypaths
{
}

- (uint64_t)_generateSQLForConstantValue:(uint64_t)a3 inContext:
{
  if (result)
  {
    id v4 = [[NSSQLConstantValueIntermediate alloc] initWithConstantValue:a2 inScope:result context:a3];
    uint64_t v5 = [(NSSQLConstantValueIntermediate *)v4 generateSQLStringInContext:a3];

    return v5;
  }
  return result;
}

- (NSSQLIntermediate)initWithScope:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLIntermediate;
  id result = [(NSSQLIntermediate *)&v5 init];
  if (result) {
    result->_scope = (NSSQLIntermediate *)a3;
  }
  return result;
}

+ (BOOL)expressionIsBasicKeypath:(id)a3
{
  if ([a3 expressionType] != 4
    || objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType") != 1
    && objc_msgSend((id)objc_msgSend(a3, "operand"), "expressionType"))
  {
    return 0;
  }
  if (sel_valueForKey_ == (char *)[a3 selector]) {
    return 1;
  }
  return sel_valueForKeyPath_ == (char *)[a3 selector];
}

- (uint64_t)_generateSQLForConstantCollection:(uint64_t)a3 reboundFrom:(void *)a4 inContext:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"nestingLevel"), "intValue");
  if ([a2 isNSArray] & 1) != 0 || (objc_msgSend(a2, "isNSSet")) {
    int v9 = 1;
  }
  else {
    int v9 = [a2 isNSOrderedSet];
  }
  if (v8 <= 0 && v9 && (unint64_t)[a2 count] >= 0x65)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (!v10)
    {
LABEL_34:
      id v26 = (id)[a4 objectForKey:@"bindIntarrays"];
      if (!v26)
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [a4 setObject:v26 forKey:@"bindIntarrays"];
      }
      v27 = [[NSSQLBindIntarray alloc] initWithValue:a2];
      -[NSSQLBindIntarray setTableName:](v27, "setTableName:", -[NSSQLAliasGenerator generateTempTableName]([a4 objectForKey:@"aliasGenerator"]));
      uint64_t v28 = [v26 count];
      [v26 addObject:v27];
      [(NSSQLBindIntarray *)v27 setIndex:v28];

      if (a3)
      {
        uint64_t v29 = [v26 count];
        uint64_t v30 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"entity"), "entityDescription");
        id v31 = (id)[a4 objectForKey:@"bindIntarraysSubstitutionOrder"];
        if (!v31)
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [a4 setObject:v31 forKey:@"bindIntarraysSubstitutionOrder"];
        }
        [v31 addObject:a3];
        [v31 addObject:v30];
        objc_msgSend(v31, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v29));
      }
      return [objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"(SELECT * FROM %@) ", -[NSSQLBindIntarray tableName](v27, "tableName")];
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
LABEL_11:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v51 != v12) {
        objc_enumerationMutation(a2);
      }
      uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * v13);
      if (![v14 isNSNumber]) {
        break;
      }
      uint64_t v15 = (char *)[v14 objCType];
      if (v15)
      {
        unsigned int v16 = *v15 - 66;
        BOOL v17 = v16 > 0x31;
        uint64_t v18 = (1 << v16) & 0x2848200028483;
        if (v17 || v18 == 0) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [a2 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v11) {
          goto LABEL_11;
        }
        goto LABEL_34;
      }
    }
    +[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, a2);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a2 = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, a2);
    }
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"entity"), "entityDescription");
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v21 = [a2 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (!v21) {
      goto LABEL_34;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
LABEL_27:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v47 != v23) {
        objc_enumerationMutation(a2);
      }
      v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend((id)objc_msgSend(v25, "entity"), "isKindOfEntity:", v20))
      {
        break;
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [a2 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v22) {
          goto LABEL_27;
        }
        goto LABEL_34;
      }
    }
  }
  v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @" (");
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"generatePairs"), "BOOLValue")) {
    [v32 appendString:@"VALUES "];
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v33 = [a2 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v43;
    char v36 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(a2);
        }
        uint64_t v38 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if ((v36 & 1) == 0) {
          [v32 appendString:@","];
        }
        uint64_t v39 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](a1, v38, (uint64_t)a4);
        if (!v39)
        {

          return 0;
        }
        v40 = (void *)v39;
        [v32 appendString:v39];

        char v36 = 0;
      }
      uint64_t v34 = [a2 countByEnumeratingWithState:&v42 objects:v54 count:16];
      char v36 = 0;
      if (v34) {
        continue;
      }
      break;
    }
  }
  [v32 appendString:@" "]);
  return (uint64_t)v32;
}

- (void)setDisambiguatingEntity:(id)a3 withKeypath:(id)a4 hasToMany:(BOOL)a5
{
}

- (BOOL)_functionExpressionIsSubqueryFollowedByKeypath:(BOOL)result
{
  if (result) {
    return [a2 expressionType] == 4
  }
        && objc_msgSend((id)objc_msgSend(a2, "operand"), "expressionType") == 13
        && (sel_valueForKey_ == (char *)[a2 selector]
         || sel_valueForKeyPath_ == (char *)[a2 selector])
        && objc_msgSend((id)objc_msgSend(a2, "arguments"), "count") == 1;
  return result;
}

- (id)governingAlias
{
  return [(NSSQLIntermediate *)self->_scope governingAlias];
}

- (uint64_t)promoteJoinsInKeypathsForExpression:(uint64_t)result
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v3 = (void *)result;
  while (1)
  {
    id result = [a2 expressionType];
    if (result != 20) {
      break;
    }
    -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, [a2 trueExpression]);
    a2 = (void *)[a2 falseExpression];
  }
  if (result <= 9)
  {
    if (result != 3)
    {
      if (result == 4)
      {
        id result = [a2 selector];
        if (sel_max_ != (char *)result && sel_min_ != (char *)result && sel_count_ != (char *)result)
        {
          if ([(id)objc_opt_class() isSimpleKeypath:a2])
          {
            return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:]([v3 fetchIntermediate], objc_msgSend((id)objc_msgSend(a2, "predicateFormat"), "componentsSeparatedByString:", @"."));
          }
          else if (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)v3, a2))
          {
            return [v3 _promoteJoinsForSubqueryScopedKeypath:a2];
          }
          else
          {
            long long v16 = 0u;
            long long v17 = 0u;
            long long v14 = 0u;
            long long v15 = 0u;
            uint64_t v10 = objc_msgSend(a2, "arguments", 0);
            id result = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (result)
            {
              uint64_t v11 = result;
              uint64_t v12 = *(void *)v15;
              do
              {
                uint64_t v13 = 0;
                do
                {
                  if (*(void *)v15 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, *(void *)(*((void *)&v14 + 1) + 8 * v13++));
                }
                while (v11 != v13);
                id result = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
                uint64_t v11 = result;
              }
              while (result);
            }
          }
        }
      }
      return result;
    }
    goto LABEL_15;
  }
  if (result != 14)
  {
    if (result != 10) {
      return result;
    }
LABEL_15:
    id v4 = objc_msgSend((id)objc_msgSend(a2, "predicateFormat"), "componentsSeparatedByString:", @".");
    uint64_t v5 = [v3 fetchIntermediate];
    return -[NSSQLFetchIntermediate promoteToOuterJoinsAlongKeypathWithComponents:](v5, v4);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v6 = objc_msgSend(a2, "constantValue", 0);
  id result = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:](v3, *(void *)(*((void *)&v14 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      id result = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (id)fetchIntermediate
{
  return [(NSSQLIntermediate *)self->_scope fetchIntermediate];
}

- (void)_promoteJoinsForSubqueryScopedKeypath:(id)a3
{
  scope = self->_scope;
  if (scope) {
    [(NSSQLIntermediate *)scope _promoteJoinsForSubqueryScopedKeypath:a3];
  }
}

- (void)_generateSQLForExpressionCollection:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([a1 isIndexExpressionScoped]) {
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Unsupported: collections not allowed in index expressions.", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a2, @"Bad value")), @"NSUnderlyingException");
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @" (");
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(a2);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        if ((v12 & 1) == 0) {
          [v8 appendString:@","];
        }
        uint64_t v15 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v14, a3, a4);
        if (!v15)
        {

          [a4 setValue:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported element in aggregate expression %@", v14), 0), @"NSUnderlyingException" forKey];
          return 0;
        }
        long long v16 = (void *)v15;
        [v8 appendString:v15];

        char v12 = 0;
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      char v12 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  [v8 appendString:@" "]);
  return v8;
}

- (BOOL)isIndexExpressionScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isIndexExpressionScoped];
  }
  return (char)scope;
}

- (uint64_t)_generateSQLForSubqueryExpression:(uint64_t)a3 trailingKeypath:(void *)a4 inContext:
{
  if (a1)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "collection"), "expressionType") - 3 <= 1)
    {
      uint64_t v8 = [[NSSQLSubqueryExpressionIntermediate alloc] initWithExpression:a2 trailingKeypath:a3 inScope:a1];
      uint64_t v9 = [(NSSQLSubqueryExpressionIntermediate *)v8 generateSQLStringInContext:a4];

      return v9;
    }
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Unsupported subquery collection expression type", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a2, @"subquery")), @"NSUnderlyingException");
  }
  return 0;
}

- (BOOL)isUpdateColumnsScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isUpdateColumnsScoped];
  }
  return (char)scope;
}

- (id)generateSQLStringInContext:(id)a3
{
  return 0;
}

- (BOOL)isHavingScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isHavingScoped];
  }
  return (char)scope;
}

- (BOOL)isWhereScoped
{
  scope = self->_scope;
  if (scope) {
    LOBYTE(scope) = [(NSSQLIntermediate *)scope isWhereScoped];
  }
  return (char)scope;
}

- (BOOL)disambiguationKeypathHasToMany
{
  return [(NSSQLIntermediate *)self->_scope disambiguationKeypathHasToMany];
}

- (uint64_t)isSimpleNoIndexFunction:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if ([a2 expressionType] != 4) {
    return 0;
  }
  if (sel_noindex_ != (char *)[a2 selector]) {
    return 0;
  }
  id v4 = (void *)[a2 arguments];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if ([v4 count] != 1) {
    return 0;
  }
  uint64_t v6 = [v5 lastObject];
  uint64_t v7 = objc_opt_class();

  return [v7 isSimpleKeypath:v6];
}

- (id)governingEntity
{
  return [(NSSQLIntermediate *)self->_scope governingEntity];
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  return [(NSSQLIntermediate *)self->_scope keypathExpressionIsSafeLHSForIn:a3];
}

- (id)_generateSQLForVariableExpression:(id)a3 allowToMany:(BOOL)a4 inContext:(id)a5
{
  scope = self->_scope;
  if (scope)
  {
    return -[NSSQLIntermediate _generateSQLForVariableExpression:allowToMany:inContext:](scope, "_generateSQLForVariableExpression:allowToMany:inContext:");
  }
  else
  {
    uint64_t v10 = [(NSSQLExpressionIntermediate *)[NSSQLVariableExpressionIntermediate alloc] initWithExpression:a3 allowToMany:a4 inScope:self];
    id v11 = [(NSSQLVariableExpressionIntermediate *)v10 generateSQLStringInContext:a5];

    if (!v11)
    {
      if (![a5 objectForKey:@"NSUnderlyingException"]) {
        [a5 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Undefined variable expression %@", a3), 0), @"NSUnderlyingException" forKey];
      }
      return 0;
    }
    return v11;
  }
}

- (uint64_t)_generateSQLForFetchExpression:(uint64_t)a3 allowToMany:(void *)a4 inContext:
{
  if (!a1 || [a4 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  if ([a1 isIndexScoped])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a2 forKey:@"expression"];
    uint64_t v10 = @"Fetch request expressions not allowed in indexes";
    id v11 = v7;
    uint64_t v12 = v8;
LABEL_5:
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v10, v9), @"NSUnderlyingException");
    return 0;
  }
  uint64_t v15 = (void *)[a2 requestExpression];
  long long v16 = (void *)[v15 expressionValueWithObject:0 context:0];
  uint64_t v17 = [a4 objectForKey:@"persistentStore"];
  long long v18 = (void *)[a2 requestExpression];
  long long v19 = (void *)[a2 contextExpression];
  if (![v18 expressionType])
  {
    long long v20 = objc_msgSend((id)objc_msgSend(v18, "constantValue"), "affectedStores");
    long long v21 = v20;
    if ((!v20 || ![v20 count]) && !objc_msgSend(v19, "expressionType")) {
      long long v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "constantValue"), "persistentStoreCoordinator"), "persistentStores");
    }
    if ([v21 count] == 1 && (objc_msgSend(v21, "containsObject:", v17) & 1) != 0)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      uint64_t v23 = (void *)[a4 objectForKey:@"nestingLevel"];
      uint64_t v24 = [a4 objectForKey:@"persistentStore"];
      int v25 = ([a2 isCountOnlyRequest] & 1) != 0 || objc_msgSend(v16, "resultType") == 4;
      uint64_t v30 = [[NSSQLGenerator alloc] initWithPersistentStore:v24];
      objc_msgSend(v16, "_resolveEntityWithContext:", objc_msgSend((id)objc_msgSend(a2, "contextExpression"), "expressionValueWithObject:context:", 0, 0));
      int v31 = [v23 unsignedIntValue];
      int v32 = [a1 isWhereScoped];
      if (v30) {
        uint64_t v33 = (void *)-[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]((uint64_t)v30, v16, 0, v25, (v31 + 1), v32, 0);
      }
      else {
        uint64_t v33 = 0;
      }

      if (v33)
      {
        uint64_t v13 = objc_msgSend(@"("), "mutableCopy";
        objc_msgSend(v13, "appendString:", objc_msgSend(v33, "sqlString"));
        [v13 appendString:@""]);
        objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"bindVars"), "addObjectsFromArray:", objc_msgSend(v33, "bindVariables"));
      }
      else
      {
        uint64_t v13 = 0;
      }
      [v22 drain];
      return (uint64_t)v13;
    }
  }
  id v26 = objc_msgSend(a2, "expressionValueWithObject:context:", 0, objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"));
  v27 = v26;
  if (!v26 || [v26 isNSNumber])
  {
    uint64_t v28 = (uint64_t)a1;
    uint64_t v29 = (uint64_t)v27;
LABEL_20:
    return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v28, v29, (uint64_t)a4);
  }
  if ([a1 isUpdateScoped])
  {
    if ([v27 count])
    {
      if ([v27 count] != 1)
      {
        uint64_t v34 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v35 = *MEMORY[0x1E4F1C3C8];
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v15 forKey:@"expression"];
        uint64_t v10 = @"Unsupported fetch request expression in update - too many results";
        id v11 = v34;
        uint64_t v12 = v35;
        goto LABEL_5;
      }
      uint64_t v29 = [v27 objectAtIndex:0];
      uint64_t v28 = (uint64_t)a1;
    }
    else
    {
      uint64_t v28 = (uint64_t)a1;
      uint64_t v29 = 0;
    }
    goto LABEL_20;
  }

  return -[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)a1, v27, 0, a4);
}

@end
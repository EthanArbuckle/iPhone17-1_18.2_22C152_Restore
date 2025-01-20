@interface NSSQLFetchIntermediate
- (BOOL)isFunctionScoped;
- (NSSQLFetchIntermediate)initWithScope:(id)a3;
- (id)fetchIntermediateForKeypathExpression:(id)a3;
- (id)generateSQLStringInContext:(id)a3;
- (id)selectIntermediate;
- (uint64_t)addGroupByKeypath:(uint64_t)result;
- (uint64_t)finalJoinForKeypathWithComponents:(uint64_t)result;
- (uint64_t)groupByClauseContainsKeypath:(uint64_t)a1;
- (uint64_t)promoteToOuterJoinAtKeypathWithComponents:(uint64_t)result;
- (uint64_t)promoteToOuterJoinsAlongKeypathWithComponents:(uint64_t)result;
- (void)addJoinIntermediate:(void *)a3 atKeypathWithComponents:;
- (void)dealloc;
- (void)setGroupByIntermediate:(uint64_t)a1;
- (void)setHavingIntermediate:(uint64_t)a1;
- (void)setOffsetIntermediate:(uint64_t)a1;
- (void)setSelectIntermediate:(uint64_t)a1;
@end

@implementation NSSQLFetchIntermediate

- (id)fetchIntermediateForKeypathExpression:(id)a3
{
  scope = self->super.super._scope;
  if (!scope)
  {
    if ([(id)objc_opt_class() isSimpleKeypath:a3]) {
      return self;
    }
    scope = self->super.super._scope;
  }

  return [(NSSQLIntermediate *)scope fetchIntermediateForKeypathExpression:a3];
}

- (void)addJoinIntermediate:(void *)a3 atKeypathWithComponents:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 112) addObject:a2];
    v6 = *(void **)(a1 + 120);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          v11 = v6;
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v6 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v12), "objectAtIndex:", 1);
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v12 = 0;
      v11 = 0;
    }
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    [v13 addObject:a2];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 addObject:v14];

    [v11 setObject:v13 forKey:v12];
  }
}

- (BOOL)isFunctionScoped
{
  return self->_isDictionaryCountFetch
      || [(NSSQLIntermediate *)self->super.super._scope isFunctionScoped];
}

- (uint64_t)groupByClauseContainsKeypath:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = a2;
  if ([*(id *)(a1 + 96) containsObject:a2]) {
    return 1;
  }
  do
  {
    v5 = (void *)[v2 componentsSeparatedByString:@"."];
    uint64_t v6 = [v5 count];
    BOOL v4 = v6 != 1;
    if (v6 == 1) {
      break;
    }
    v2 = objc_msgSend((id)objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - 1), "componentsJoinedByString:", @".");
  }
  while (![*(id *)(a1 + 96) containsObject:v2]);
  return v4;
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  if (self && (whereClause = self->super._whereClause) != 0)
  {
    id v6 = [(NSSQLIntermediate *)whereClause generateSQLStringInContext:a3];
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = 0;
  }
  havingClause = self->_havingClause;
  if (havingClause)
  {
    id v8 = [(NSSQLHavingIntermediate *)havingClause generateSQLStringInContext:a3];
    if (!v8)
    {

LABEL_10:
      id v9 = 0;
LABEL_64:

      return 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  groupByClause = self->_groupByClause;
  if (groupByClause)
  {
    id v11 = [(NSSQLGroupByIntermediate *)groupByClause generateSQLStringInContext:a3];
    if (!v11)
    {
      id v9 = 0;
      int v12 = 1;
      v13 = v6;
      goto LABEL_63;
    }
  }
  else
  {
    id v11 = 0;
  }
  [(NSSQLIntermediate *)self _promoteJoinsForSubqueryScopedKeypaths];
  if (self->super._correlationToken)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
    [v13 appendString:self->super._correlationToken];
    if (v6)
    {
      objc_msgSend(v13, "appendString:", @" AND (");
      [v13 appendString:v6];
      id v14 = @")");
    }
    else
    {
      id v14 = @"");
    }
    [v13 appendString:v14];
  }
  else
  {
    v13 = v6;
  }
  id v9 = [(NSSQLSelectIntermediate *)self->_selectClause generateSQLStringInContext:a3];
  if (v9)
  {
    orderIntermediate = self->super._orderIntermediate;
    if (!orderIntermediate
      || (orderIntermediate = [(NSSQLOrderIntermediate *)orderIntermediate generateSQLStringInContext:a3]) != 0)
    {
      v30 = orderIntermediate;
      v31 = v11;
      v32 = v8;
      v33 = v13;
      id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      joinIntermediates = self->_joinIntermediates;
      uint64_t v18 = [(NSMutableArray *)joinIntermediates countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(joinIntermediates);
            }
            uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "generateSQLStringInContext:", a3, v30, v31, v32);
            if (!v22)
            {

              goto LABEL_40;
            }
            v23 = (void *)v22;
            [v16 appendString:v22];
            [v16 appendString:@" "];
          }
          uint64_t v19 = [(NSMutableArray *)joinIntermediates countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }
      if (!v16)
      {
LABEL_40:
        int v12 = 1;
        id v11 = v31;
        id v8 = v32;
        v13 = v33;
        v24 = v30;
LABEL_61:

        goto LABEL_62;
      }
      id v11 = v31;
      id v8 = v32;
      v24 = v30;
      if (self && (limitClause = self->super._limitClause) != 0)
      {
        id v26 = [(NSSQLLimitIntermediate *)limitClause generateSQLStringInContext:a3];
        if (!v26)
        {
          int v12 = 1;
LABEL_60:

          v13 = v33;
          goto LABEL_61;
        }
      }
      else
      {
        id v26 = 0;
      }
      offsetClause = self->_offsetClause;
      if (offsetClause)
      {
        id v28 = [(NSSQLOffsetIntermediate *)offsetClause generateSQLStringInContext:a3];
        if (!v28)
        {
          int v12 = 1;
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {
        id v28 = 0;
      }
      objc_msgSend(v9, "appendString:", v16, v30, v31, v32);
      if (v33)
      {
        [v9 appendString:@"WHERE "];
        [v9 appendString:v33];
        [v9 appendString:@" "];
      }
      if (v11)
      {
        [v9 appendString:@"GROUP BY "];
        [v9 appendString:v11];
        [v9 appendString:@" "];
      }
      if (v8)
      {
        [v9 appendString:@"HAVING "];
        [v9 appendString:v8];
        [v9 appendString:@" "];
      }
      if (v24) {
        [v9 appendString:v24];
      }
      if (v26) {
        [v9 appendString:v26];
      }
      if (v28) {
        [v9 appendString:v28];
      }

      int v12 = 0;
      goto LABEL_59;
    }
  }
  int v12 = 1;
LABEL_62:

LABEL_63:
  if (v12) {
    goto LABEL_64;
  }
  return v9;
}

- (id)selectIntermediate
{
  return self->_selectClause;
}

- (void)setSelectIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 64) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 64) = a2;
    }
  }
}

- (NSSQLFetchIntermediate)initWithScope:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSSQLFetchIntermediate;
  v3 = [(NSSQLIntermediate *)&v5 initWithScope:a3];
  if (v3)
  {
    v3->_joinIntermediates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_joinKeypaths = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (uint64_t)finalJoinForKeypathWithComponents:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = *(void **)(result + 120);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(a2);
          }
          id v8 = (void *)[v3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)];
          v3 = (void *)[v8 objectAtIndex:1];
        }
        uint64_t v5 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    else
    {
      id v8 = 0;
    }
    return [v8 objectAtIndex:0];
  }
  return result;
}

- (uint64_t)addGroupByKeypath:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 96);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)(v3 + 96) = v4;
    }
    return [v4 addObject:a2];
  }
  return result;
}

- (uint64_t)promoteToOuterJoinAtKeypathWithComponents:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = *(void **)(result + 120);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a2);
          }
          uint64_t v7 = (void *)[v3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
          uint64_t v8 = [v7 objectAtIndex:0];
          uint64_t v3 = (void *)[v7 objectAtIndex:1];
          ++v6;
        }
        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v4 = result;
      }
      while (result);
      if (v8) {
        *(void *)(v8 + 48) = 2;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  self->_selectClause = 0;
  self->_groupByClause = 0;

  self->_groupByKeypaths = 0;
  self->_havingClause = 0;

  self->_offsetClause = 0;
  self->_joinIntermediates = 0;

  self->_joinKeypaths = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLFetchIntermediate;
  [(NSSQLStatementIntermediate *)&v3 dealloc];
}

- (uint64_t)promoteToOuterJoinsAlongKeypathWithComponents:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    objc_super v3 = *(void **)(result + 120);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(a2);
          }
          uint64_t v7 = (void *)[v3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
          uint64_t v8 = [v7 objectAtIndex:0];
          if (v8) {
            *(void *)(v8 + 48) = 2;
          }
          objc_super v3 = (void *)[v7 objectAtIndex:1];
          ++v6;
        }
        while (v4 != v6);
        result = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setGroupByIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 72) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 72) = a2;
    }
  }
}

- (void)setOffsetIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 88) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 88) = a2;
    }
  }
}

- (void)setHavingIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 80) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 80) = a2;
    }
  }
}

@end
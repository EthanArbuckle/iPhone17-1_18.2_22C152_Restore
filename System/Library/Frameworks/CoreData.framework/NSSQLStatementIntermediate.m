@interface NSSQLStatementIntermediate
- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3;
- (NSSQLStatementIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5;
- (id)governingAlias;
- (id)governingAliasForKeypathExpression:(id)a3;
- (id)governingEntity;
- (id)governingEntityForKeypathExpression:(id)a3;
- (void)dealloc;
- (void)setCorrelationToken:(uint64_t)a1;
- (void)setGoverningAlias:(id)a3;
- (void)setGoverningEntity:(id)a3;
- (void)setLimitIntermediate:(uint64_t)a1;
- (void)setOrderIntermediate:(uint64_t)a1;
- (void)setWhereIntermediate:(uint64_t)a1;
@end

@implementation NSSQLStatementIntermediate

- (id)governingEntityForKeypathExpression:(id)a3
{
  scope = self->super._scope;
  if (!scope)
  {
    if ([(id)objc_opt_class() isSimpleKeypath:a3]) {
      return self->_governingEntity;
    }
    scope = self->super._scope;
  }

  return [(NSSQLIntermediate *)scope governingEntityForKeypathExpression:a3];
}

- (id)governingAliasForKeypathExpression:(id)a3
{
  scope = self->super._scope;
  if (!scope)
  {
    if ([(id)objc_opt_class() isSimpleKeypath:a3]) {
      return self->_governingAlias;
    }
    scope = self->super._scope;
  }

  return [(NSSQLIntermediate *)scope governingAliasForKeypathExpression:a3];
}

- (id)governingAlias
{
  return self->_governingAlias;
}

- (NSSQLStatementIntermediate)initWithEntity:(id)a3 alias:(id)a4 inScope:(id)a5
{
  v7 = [(NSSQLIntermediate *)self initWithScope:a5];
  v8 = v7;
  if (v7)
  {
    v7->_governingEntity = (NSSQLEntity *)a3;
    v7->_governingAlias = (NSString *)a4;
  }
  return v8;
}

- (void)setWhereIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 40) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 40) = a2;
    }
  }
}

- (void)setOrderIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 56) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 56) = a2;
    }
  }
}

- (void)setLimitIntermediate:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 48) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 48) = a2;
    }
  }
}

- (id)governingEntity
{
  return self->_governingEntity;
}

- (void)setGoverningEntity:(id)a3
{
  self->_governingEntity = (NSSQLEntity *)a3;
}

- (void)setGoverningAlias:(id)a3
{
  if (self->_governingAlias != a3)
  {
    id v5 = a3;

    self->_governingAlias = (NSString *)a3;
  }
}

- (void)setCorrelationToken:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 32) = a2;
    }
  }
}

- (void)dealloc
{
  self->_governingAlias = 0;
  self->_whereClause = 0;

  self->_limitClause = 0;
  self->_orderIntermediate = 0;

  self->_correlationToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLStatementIntermediate;
  [(NSSQLStatementIntermediate *)&v3 dealloc];
}

- (BOOL)keypathExpressionIsSafeLHSForIn:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  scope = self->super._scope;
  if (scope) {
    goto LABEL_6;
  }
  if (([(id)objc_opt_class() isSimpleKeypath:a3] & 1) == 0)
  {
    scope = self->super._scope;
LABEL_6:
    return [(NSSQLIntermediate *)scope keypathExpressionIsSafeLHSForIn:a3];
  }
  v6 = [(NSSQLStatementIntermediate *)self governingEntityForKeypathExpression:a3];
  if ([a3 expressionType] == 3) {
    v7 = (void *)[a3 keyPath];
  }
  else {
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue");
  }
  v9 = (void *)[v7 componentsSeparatedByString:@"."];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v20;
LABEL_12:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v9);
      }
      if (!v6) {
        return 1;
      }
      v15 = (unsigned __int8 *)[v6[5] objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
      if (!v15) {
        return 1;
      }
      v16 = v15;
      if ([v15 isToMany]) {
        break;
      }
      int v17 = v16[24];
      if (v17 == 7)
      {
        v6 = (id *)[v16 destinationEntity];
      }
      else
      {
        if (v17 == 9) {
          break;
        }
        v6 = 0;
      }
LABEL_24:
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        BOOL result = 1;
        if (v11) {
          goto LABEL_12;
        }
        return result;
      }
    }
    uint64_t v18 = [v16 destinationEntity];
    if (v12) {
      return 0;
    }
    v6 = (id *)v18;
    uint64_t v12 = 1;
    goto LABEL_24;
  }
  return 1;
}

@end
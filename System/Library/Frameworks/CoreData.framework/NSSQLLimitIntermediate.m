@interface NSSQLLimitIntermediate
- (NSSQLLimitIntermediate)initWithLimit:(unint64_t)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLLimitIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  v6 = (void *)[a3 valueForKey:@"substitutionVariables"];
  if (v6
    && (v13 = v6, (v14 = (void *)[v6 valueForKey:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"]) != 0))
  {
    v15 = v14;
    if ([v14 expressionType])
    {
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v18 = @"Unable to generate SQL - non-constant expression for limit substitution.";
LABEL_20:
      objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, v13), @"NSUnderlyingException");
      return 0;
    }
    uint64_t v20 = [v15 constantValue];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v18 = @"Unable to generate SQL - non-NSNumber value for limit substitution.";
      goto LABEL_20;
    }
    uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"bindVars"), "count");
    v22 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v20, (uint64_t)a3);
    if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"bindVars"), "count") - v21 >= 2)
    {
      if (![a3 valueForKey:@"NSUnderlyingException"]) {
        [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid variable substitution - multiple values not supported for limit %@", v20), 0), @"NSUnderlyingException" forKey];
      }

      return 0;
    }
    v23 = (void *)[a3 valueForKey:@"subOrder"];
    [v23 addObject:@"FETCH_REQUEST_LIMIT_SUBSTITUTION"];
    objc_msgSend(v23, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", v21));
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@" LIMIT %@", v22];

    return v24;
  }
  else
  {
    unint64_t limit = self->_limit;
    if (limit)
    {
      if ((limit & 0x8000000000000000) != 0) {
        _NSCoreDataLog(2, @"CoreData: warning: Fetch Limit is too large, please set it to a value less than or equal to NSIntegerMax", v7, v8, v9, v10, v11, v12, v25);
      }
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" LIMIT %lu", self->_limit);
    }
    else
    {
      return (id)[@" LIMIT -1" mutableCopy];
    }
  }
}

- (NSSQLLimitIntermediate)initWithLimit:(unint64_t)a3 inScope:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLLimitIntermediate;
  result = [(NSSQLIntermediate *)&v6 initWithScope:a4];
  if (result) {
    result->_unint64_t limit = a3;
  }
  return result;
}

@end
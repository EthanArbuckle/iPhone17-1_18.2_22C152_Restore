@interface NSSQLOffsetIntermediate
- (NSSQLOffsetIntermediate)initWithOffset:(unint64_t)a3 inScope:(id)a4;
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLOffsetIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  if ([(NSSQLIntermediate *)self isUpdateScoped])
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = NSString;
    v8 = @"Unsupported join (offsets not allowed in updates)";
LABEL_12:
    [a3 setObject:objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, objc_msgSend(v7, "stringWithFormat:", v8), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  v9 = [(NSSQLIntermediate *)self fetchIntermediate];
  if (!v9 || !v9[6])
  {
    v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    v7 = NSString;
    v8 = @"Invalid SQL (must specify a limit with an offset)";
    goto LABEL_12;
  }
  v10 = (void *)[a3 valueForKey:@"substitutionVariables"];
  if (!v10) {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" OFFSET %lu", self->_offset);
  }
  v11 = v10;
  v12 = (void *)[v10 valueForKey:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"];
  if (!v12) {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @" OFFSET %lu", self->_offset);
  }
  v13 = v12;
  if ([v12 expressionType])
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Unable to generate SQL - non-constant expression for offset substitution.";
LABEL_20:
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, v11), @"NSUnderlyingException");
    return 0;
  }
  uint64_t v18 = [v13 constantValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Unable to generate SQL - non-NSNumber value for offset substitution.";
    goto LABEL_20;
  }
  uint64_t v19 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"bindVars"), "count");
  v20 = (void *)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)self, v18, (uint64_t)a3);
  if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"bindVars"), "count") - v19 >= 2)
  {
    if (![a3 valueForKey:@"NSUnderlyingException"]) {
      [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid variable substitution - multiple values not supported for limit %@", v18), 0), @"NSUnderlyingException" forKey];
    }

    return 0;
  }
  v21 = (void *)[a3 valueForKey:@"subOrder"];
  [v21 addObject:@"FETCH_REQUEST_OFFSET_SUBSTITUTION"];
  objc_msgSend(v21, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", v19));
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@" OFFSET %@", v20];

  return v22;
}

- (NSSQLOffsetIntermediate)initWithOffset:(unint64_t)a3 inScope:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSSQLOffsetIntermediate;
  result = [(NSSQLIntermediate *)&v6 initWithScope:a4];
  if (result) {
    result->_offset = a3;
  }
  return result;
}

@end
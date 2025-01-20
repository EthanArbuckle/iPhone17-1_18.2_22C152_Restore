@interface NSSQLBoundedByIntermediate
- (NSSQLBoundedByIntermediate)initWithWorkingEntity:(id)a3 target:(id)a4 bounds:(id)a5 scope:(id)a6;
- (id)generateSQLStringInContext:(id)a3;
- (void)dealloc;
@end

@implementation NSSQLBoundedByIntermediate

- (NSSQLBoundedByIntermediate)initWithWorkingEntity:(id)a3 target:(id)a4 bounds:(id)a5 scope:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NSSQLBoundedByIntermediate;
  v9 = [(NSSQLIntermediate *)&v11 initWithScope:a6];
  if (v9)
  {
    v9->_entity = (NSSQLEntity *)a3;
    v9->_target = (NSAttributeDescription *)a4;
    v9->_bounds = (NSExpression *)a5;
  }
  return v9;
}

- (void)dealloc
{
  self->_entity = 0;
  self->_target = 0;

  self->_bounds = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBoundedByIntermediate;
  [(NSSQLBoundedByIntermediate *)&v3 dealloc];
}

- (id)generateSQLStringInContext:(id)a3
{
  NSExpressionType v5 = [(NSExpression *)self->_bounds expressionType];
  if (v5 == NSConstantValueExpressionType)
  {
    id v16 = [(NSExpression *)self->_bounds constantValue];
    if ([v16 count] == 2)
    {
      v14 = (void *)[v16 firstObject];
      uint64_t v17 = [v16 lastObject];
      goto LABEL_19;
    }
LABEL_26:
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Unsupported predicate, RHS of boundBy: must contain 2 values";
    goto LABEL_29;
  }
  if (v5 != NSAggregateExpressionType)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Unsupported predicate, RHS of boundBy: must be an aggregate or constant";
    goto LABEL_29;
  }
  id v6 = [(NSExpression *)self->_bounds constantValue];
  if ([v6 count] != 2) {
    goto LABEL_26;
  }
  v7 = (void *)[v6 objectAtIndex:0];
  uint64_t v8 = [v7 expressionType];
  v9 = (void *)[v6 objectAtIndex:0];
  uint64_t v10 = [v9 expressionType];
  if (v8) {
    BOOL v11 = v8 == 3;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Unsupported predicate, topLeft parameter of boundBy: RHS must be a constant or keypath";
LABEL_29:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, v21, 0), @"NSUnderlyingException");
    return 0;
  }
  uint64_t v12 = v10;
  if (v10) {
    BOOL v13 = v10 == 3;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Unsupported predicate, bottomRight parameter of boundBy: RHS must be a constant or keypath";
    goto LABEL_29;
  }
  if (v8)
  {
    v14 = 0;
    if (v10)
    {
LABEL_16:
      v15 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v14 = (void *)[v7 constantValue];
    if (v12) {
      goto LABEL_16;
    }
  }
  uint64_t v17 = [v9 constantValue];
LABEL_19:
  v15 = (void *)v17;
LABEL_20:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Unsupported predicate, constant topLeft parameter of boundBy: RHS must respond to coordinate";
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    v21 = @"Unsupported predicate, constant lowerRight parameter of boundBy: RHS must respond to coordinate";
    goto LABEL_29;
  }
  id v18 = [(NSDictionary *)[(NSPropertyDescription *)self->_target userInfo] objectForKey:@"_NSLocationAttributeDerivedComponents"];
  if (([v18 isNSArray] & 1) == 0)
  {
    if ([v18 isNSString]) {
      id v18 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "description"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_1ED787880), "componentsSeparatedByString:", @",");
    }
    else {
      id v18 = 0;
    }
  }
  entity = self->_entity;
  uint64_t v24 = [v18 firstObject];
  if (entity) {
    v25 = (void *)[(NSMutableDictionary *)entity->_properties objectForKey:v24];
  }
  else {
    v25 = 0;
  }
  uint64_t v26 = [v25 columnName];
  v27 = self->_entity;
  uint64_t v28 = [v18 lastObject];
  if (v27) {
    v29 = (void *)[(NSMutableDictionary *)v27->_properties objectForKey:v28];
  }
  else {
    v29 = 0;
  }
  uint64_t v30 = [v29 columnName];
  v31 = -[NSSQLAliasGenerator initWithNestingLevel:]([NSSQLAliasGenerator alloc], "initWithNestingLevel:", objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"nestingLevel"), "integerValue") + 1);
  uint64_t v32 = [(NSSQLAliasGenerator *)v31 generateTableAlias];

  v33 = (void *)+[NSSQLLocationAttributeRTreeExtension newRTReeTableNameForAttribute:onEntity:]((uint64_t)NSSQLLocationAttributeRTreeExtension, self->_target, (uint64_t)[(NSSQLEntity *)self->_entity entityDescription]);
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"SELECT %@.Z_PK FROM %@ %@ WHERE ? <= %@.%@_MAX AND %@.%@_MIN <= ? AND ? <= %@.%@_MAX AND %@.%@_MIN <= ?", v32, v33, v32, v32, v26, v32, v26, v32, v30, v32, v30];

  if ([(NSSQLIntermediate *)self isWhereScoped]) {
    v35 = @"bindVars";
  }
  else {
    v35 = @"selectBindVars";
  }
  v36 = (void *)[a3 objectForKey:v35];
  [v14 coordinate];
  double v38 = v37;
  [v15 coordinate];
  double v40 = v39;
  [v15 coordinate];
  double v42 = v41;
  [v14 coordinate];
  double v44 = v43;
  v45 = [NSSQLBindVariable alloc];
  v46 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v45, "initWithValue:sqlType:propertyDescription:", [NSNumber numberWithDouble:v42], 7, 0);
  [v36 addObject:v46];

  v47 = [NSSQLBindVariable alloc];
  v48 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v47, "initWithValue:sqlType:propertyDescription:", [NSNumber numberWithDouble:v44], 7, 0);
  [v36 addObject:v48];

  v49 = [NSSQLBindVariable alloc];
  v50 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v49, "initWithValue:sqlType:propertyDescription:", [NSNumber numberWithDouble:v38], 7, 0);
  [v36 addObject:v50];

  v51 = [NSSQLBindVariable alloc];
  v52 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v51, "initWithValue:sqlType:propertyDescription:", [NSNumber numberWithDouble:v40], 7, 0);
  [v36 addObject:v52];

  return v34;
}

@end
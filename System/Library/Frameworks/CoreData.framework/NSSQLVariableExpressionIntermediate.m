@interface NSSQLVariableExpressionIntermediate
- (id)generateSQLStringInContext:(id)a3;
@end

@implementation NSSQLVariableExpressionIntermediate

- (id)generateSQLStringInContext:(id)a3
{
  v5 = [(NSExpression *)self->super._expression variable];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"substitutionVariables"), "valueForKey:", v5);
  if (!v6)
  {
    id v10 = (id)objc_msgSend((id)objc_msgSend(-[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate"), "selectIntermediate"), "resolveVariableExpression:inContext:", self->super._expression, a3);
    if (v10) {
      return v10;
    }
    if (![a3 objectForKey:@"NSUnderlyingException"]) {
      [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"unable to resolve variable expression: %@", self->super._expression), 0), @"NSUnderlyingException" forKey];
    }
    return 0;
  }
  v7 = (void *)v6;
  BOOL v8 = [(NSSQLIntermediate *)self isTargetColumnsScoped];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"selectBindVars"), "count");
  id v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v7, self->super._allowToMany, a3);
  if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"selectBindVars"), "count") - v9 >= 2)
  {
    if (![a3 valueForKey:@"NSUnderlyingException"]) {
      [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid variable substitution - multiple values not supported here %@", self->super._expression), 0), @"NSUnderlyingException" forKey];
    }

    return 0;
  }
  if (v8) {
    v11 = @"columnSubOrder";
  }
  else {
    v11 = @"subOrder";
  }
  v12 = (void *)[a3 valueForKey:v11];
  [v12 addObject:v5];
  objc_msgSend(v12, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", v9));
  return v10;
}

@end
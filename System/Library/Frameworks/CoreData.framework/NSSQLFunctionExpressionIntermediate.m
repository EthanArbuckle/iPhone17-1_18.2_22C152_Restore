@interface NSSQLFunctionExpressionIntermediate
+ (BOOL)functionIsAcceptableAsAggregate:(uint64_t)a1;
- (BOOL)isFunctionScoped;
- (id)_generateType4SQLForSymbol:(void *)a3 inContext:;
- (id)generateSQLStringInContext:(id)a3;
- (id)generateType1SQLString:(void *)a3 inContext:;
- (uint64_t)_generateCorrelatedSubqueryStringWithSymbol:(void *)a3 forExpression:(void *)a4 inContext:;
- (uint64_t)_generateNowStringInContext:(id *)a1;
- (uint64_t)_generateRtreeIndexStringInContext:(uint64_t)result;
- (uint64_t)_generateSQLForCountInContext:(uint64_t)a1;
- (void)_generateArgumentStringForCollection:(void *)a3 inContext:;
- (void)_generateDistinctStringInContext:(id *)a1;
- (void)_generateLengthStringInContext:(id *)a1;
- (void)_generateMathStringWithSymbol:(void *)a3 inContext:;
- (void)_generateUncorrelatedSubqueryStringWithSymbol:(void *)a3 forAttribute:(void *)a4 inContext:;
- (void)generateType2SQLString:(void *)a3 inContext:;
- (void)generateType3SQLString:(int)a3 keypathOnly:(void *)a4 inContext:;
@end

@implementation NSSQLFunctionExpressionIntermediate

- (BOOL)isFunctionScoped
{
  return 1;
}

+ (BOOL)functionIsAcceptableAsAggregate:(uint64_t)a1
{
  self;
  if (!_MergedGlobals_80)
  {
    _MergedGlobals_80 = (uint64_t)sel_count_;
    *(void *)algn_1EB270738 = sel_max_;
    qword_1EB270740 = (uint64_t)sel_min_;
    unk_1EB270748 = sel_average_;
    qword_1EB270750 = (uint64_t)sel_sum_;
  }
  uint64_t v3 = [a2 selector];
  if (v3 != _MergedGlobals_80
    && v3 != *(void *)algn_1EB270738
    && v3 != qword_1EB270740
    && v3 != unk_1EB270748
    && v3 != qword_1EB270750)
  {
    return 0;
  }
  uint64_t v8 = v3;
  v9 = (void *)[a2 arguments];
  if ([v9 count] != 1) {
    return 0;
  }
  v10 = (void *)[v9 objectAtIndex:0];
  if ([v10 expressionType] == 1 && v8 == _MergedGlobals_80) {
    return 1;
  }
  BOOL result = +[NSSQLIntermediate isSimpleKeypath:v10];
  if (result) {
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "arguments"), "objectAtIndex:", 0), "predicateFormat"), "rangeOfString:", @".") == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)generateType3SQLString:(int)a3 keypathOnly:(void *)a4 inContext:
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count");
  if (v8 != 1)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    if (v8)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Invalid number of parameters passed to function (%@)", a1[2]];
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a1[2] forKey:@"Bad value"];
      v12 = v9;
      uint64_t v13 = v10;
      uint64_t v11 = v18;
    }
    else
    {
      uint64_t v11 = [NSString stringWithFormat:@"Unable to generate sql for %@, empty expression", a1[2]];
      v12 = v9;
      uint64_t v13 = v10;
      uint64_t v14 = 0;
    }
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, v14), @"NSUnderlyingException");
    return 0;
  }
  if (a3)
  {
    v15 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
    if (([(id)objc_opt_class() isSimpleKeypath:v15] & 1) == 0
      && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v15) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unable to generate sql for %@, can't drop index on non-keypath", a1[2]), 0), @"NSUnderlyingException" forKey];
      }
    }
  }
  v16 = (void *)[a2 mutableCopy];
  id v17 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0), 0, a4);
  if (!v17)
  {

    v16 = 0;
  }
  [v16 appendString:v17];
  [v16 appendString:@""]);

  return v16;
}

- (uint64_t)_generateSQLForCountInContext:(uint64_t)a1
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([(id)a1 isIndexScoped])
  {
    if ([a2 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), 'count' not supported in this context", *(void *)(a1 + 16)];
    uint64_t v7 = *(void *)(a1 + 16);
    v32 = @"expression";
    v33[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    goto LABEL_5;
  }
  uint64_t v13 = (void *)[*(id *)(a1 + 16) arguments];
  unint64_t v14 = [v13 count];
  if (![v13 count])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = @"Invalid number of arguments to count (requires at least 1 argument)";
    goto LABEL_12;
  }
  if (v14 >= 2)
  {
    id v15 = (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:](a1, [NSNumber numberWithInteger:v14], (uint64_t)a2);
    if (v15) {
      return (uint64_t)v15;
    }
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = [NSString stringWithFormat:@"Unable to generate SQL for count expression %@", *(void *)(a1 + 16)];
LABEL_10:
    v12 = (__CFString *)v18;
    uint64_t v10 = v16;
    uint64_t v11 = v17;
LABEL_12:
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  v20 = (void *)[v13 objectAtIndex:0];
  uint64_t v21 = [v20 expressionType];
  if ([(id)a1 isTargetColumnsScoped]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates")&& objc_msgSend(MEMORY[0x1E4F28C68], "expressionForEvaluatedObject") == v20)
  {
    v24 = @"count(*)";
    goto LABEL_38;
  }
  if ([(id)a1 isTargetColumnsScoped]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates")&& ((objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v20) & 1) != 0|| -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v20))&& objc_msgSend((id)objc_msgSend(v20, "keyPath"), "rangeOfString:", @".") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = [(NSSQLExpressionIntermediate *)[NSSQLKeypathExpressionIntermediate alloc] initWithExpression:v20 allowToMany:1 inScope:a1];
    v23 = (NSSQLSubqueryExpressionIntermediate *)v22;
    goto LABEL_43;
  }
  if (v21 == 1 && [(id)a1 isHavingScoped])
  {
    v24 = @"COUNT(*)";
LABEL_38:
    return [(__CFString *)v24 mutableCopy];
  }
  if (([(id)objc_opt_class() isSimpleKeypath:v20] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v20))
  {
    if (v21 == 4)
    {
      if (-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:](a1, v20))
      {
        v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "arguments"), "objectAtIndex:", 0), "constantValue"), "mutableCopy");
        [v27 appendString:@".@count"];
        v28 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:v27];

        v23 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", [v20 operand], v28, *(void *)(a1 + 8));
        v22 = (NSSQLKeypathExpressionIntermediate *)v23;
LABEL_43:
        id v29 = [(NSSQLKeypathExpressionIntermediate *)v22 generateSQLStringInContext:a2];

        if (v29)
        {
          v30 = CFSTR("COUNT(");
          goto LABEL_45;
        }
LABEL_46:
        if ([a2 objectForKey:@"NSUnderlyingException"]) {
          return 0;
        }
        v16 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v17 = *MEMORY[0x1E4F1C3C8];
        uint64_t v18 = [NSString stringWithFormat:@"Unsupported expression %@", *(void *)(a1 + 16)];
        goto LABEL_10;
      }
      if (objc_msgSend(@"distinct:", "isEqual:", objc_msgSend(v20, "function")))
      {
        v31 = [(NSSQLExpressionIntermediate *)[NSSQLFunctionExpressionIntermediate alloc] initWithExpression:v20 allowToMany:1 inScope:a1];
        id v29 = [(NSSQLFunctionExpressionIntermediate *)v31 generateSQLStringInContext:a2];

        if (!v29)
        {
          if ([a2 objectForKey:@"NSUnderlyingException"]) {
            return 0;
          }
          v16 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v17 = *MEMORY[0x1E4F1C3C8];
          uint64_t v18 = [NSString stringWithFormat:@"Unable to generate SQL for expression: %@", *(void *)(a1 + 16)];
          goto LABEL_10;
        }
        v30 = CFSTR("COUNT (");
LABEL_45:
        id v15 = (id)[(__CFString *)v30 mutableCopy];
        [v15 appendString:v29];

        [v15 appendString:@""]);
        return (uint64_t)v15;
      }
    }
    else if (v21 == 13)
    {
      v25 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:@".@count"];
      v26 = [[NSSQLSubqueryExpressionIntermediate alloc] initWithExpression:v20 trailingKeypath:v25 inScope:*(void *)(a1 + 8)];

      id v15 = [(NSSQLSubqueryExpressionIntermediate *)v26 generateSQLStringInContext:a2];
      if (v15) {
        return (uint64_t)v15;
      }
      goto LABEL_46;
    }
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = [NSString stringWithFormat:@"Unsupported function expression : %@", *(void *)(a1 + 16)];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*(void *)(a1 + 16) forKey:@"Bad value"];
LABEL_5:
    uint64_t v9 = v8;
    uint64_t v10 = v4;
    uint64_t v11 = v5;
    v12 = (__CFString *)v6;
LABEL_13:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, v9), @"NSUnderlyingException");
    return 0;
  }

  return -[NSSQLFunctionExpressionIntermediate _generateCorrelatedSubqueryStringWithSymbol:forExpression:inContext:]((void *)a1, @"count", v20, a2);
}

- (id)generateSQLStringInContext:(id)a3
{
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  uint64_t v6 = (char *)[(NSExpression *)self->super._expression selector];
  if (sel_max_ == v6)
  {
    v12 = @"max";
LABEL_31:
    return -[NSSQLFunctionExpressionIntermediate generateType1SQLString:inContext:]((uint64_t)self, v12, a3);
  }
  if (sel_min_ == v6)
  {
    v12 = @"min";
    goto LABEL_31;
  }
  if (sel_uppercase_ == v6)
  {
    uint64_t v13 = CFSTR("NSCoreDataToUpper(");
LABEL_36:
    return -[NSSQLFunctionExpressionIntermediate generateType2SQLString:inContext:]((id *)&self->super.super.super.isa, v13, a3);
  }
  if (sel_lowercase_ == v6)
  {
    uint64_t v13 = CFSTR("NSCoreDataToLower(");
    goto LABEL_36;
  }
  if (sel_onesComplement_ == v6)
  {
    unint64_t v14 = CFSTR("(~");
LABEL_41:
    id v15 = self;
    int v16 = 0;
LABEL_42:
    return -[NSSQLFunctionExpressionIntermediate generateType3SQLString:keypathOnly:inContext:]((id *)&v15->super.super.super.isa, v14, v16, a3);
  }
  if (sel_abs_ == v6)
  {
    unint64_t v14 = CFSTR("abs(");
    goto LABEL_41;
  }
  if (sel_noindex_ == v6)
  {
    unint64_t v14 = CFSTR("+(");
    id v15 = self;
    int v16 = 1;
    goto LABEL_42;
  }
  if (sel_average_ == v6)
  {
    uint64_t v17 = @"avg";
LABEL_48:
    return -[NSSQLFunctionExpressionIntermediate _generateType4SQLForSymbol:inContext:]((uint64_t)self, v17, a3);
  }
  if (sel_sum_ == v6)
  {
    uint64_t v17 = @"total";
    goto LABEL_48;
  }
  if (sel_count_ == v6)
  {
    return (id)-[NSSQLFunctionExpressionIntermediate _generateSQLForCountInContext:]((uint64_t)self, a3);
  }
  if (sel_add_to_ == v6)
  {
    uint64_t v18 = @" + ";
LABEL_63:
    return -[NSSQLFunctionExpressionIntermediate _generateMathStringWithSymbol:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v18, a3);
  }
  if (sel_from_subtract_ == v6)
  {
    uint64_t v18 = @" - ";
    goto LABEL_63;
  }
  if (sel_multiply_by_ == v6)
  {
    uint64_t v18 = @" * ";
    goto LABEL_63;
  }
  if (sel_divide_by_ == v6)
  {
    uint64_t v18 = @" / ";
    goto LABEL_63;
  }
  if (sel_modulus_by_ == v6)
  {
    uint64_t v18 = @" % ";
    goto LABEL_63;
  }
  if (sel_bitwiseAnd_with_ == v6)
  {
    uint64_t v18 = @" & ";
    goto LABEL_63;
  }
  if (sel_bitwiseOr_with_ == v6)
  {
    uint64_t v18 = @" | ";
    goto LABEL_63;
  }
  if (sel_leftshift_by_ == v6)
  {
    uint64_t v18 = @" << ";
    goto LABEL_63;
  }
  if (sel_rightshift_by_ == v6)
  {
    uint64_t v18 = @" >> ";
    goto LABEL_63;
  }
  if (sel_distinct_ == v6)
  {
    return -[NSSQLFunctionExpressionIntermediate _generateDistinctStringInContext:]((id *)&self->super.super.super.isa, a3);
  }
  else if (sel_now == v6)
  {
    return (id)-[NSSQLFunctionExpressionIntermediate _generateNowStringInContext:]((id *)&self->super.super.super.isa, a3);
  }
  else
  {
    if (sel_length_ != v6)
    {
      if (sel_indexed_by_ == v6)
      {
        -[NSSQLFunctionExpressionIntermediate _generateRtreeIndexStringInContext:]((uint64_t)self, a3);
      }
      else if (![a3 objectForKey:@"NSUnderlyingException"])
      {
        BOOL v7 = [(NSSQLIntermediate *)self isIndexScoped];
        uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v9 = *MEMORY[0x1E4F1C3C8];
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:self->super._expression forKey:@"Bad value"];
        if (v7) {
          uint64_t v11 = @"Unsupported function type passed as index component (either not a valid function at all, or just not valid in this context).";
        }
        else {
          uint64_t v11 = @"Unsupported function type passed to SQL store";
        }
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v11, v10), @"NSUnderlyingException");
      }
      return 0;
    }
    return -[NSSQLFunctionExpressionIntermediate _generateLengthStringInContext:]((id *)&self->super.super.super.isa, a3);
  }
}

- (uint64_t)_generateCorrelatedSubqueryStringWithSymbol:(void *)a3 forExpression:(void *)a4 inContext:
{
  v60[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isIndexScoped])
  {
    if ([a4 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), '%@' not supported in this context", a1[2], a2];
    uint64_t v11 = a1[2];
    v59 = @"expression";
    v60[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
    uint64_t v13 = v8;
    uint64_t v14 = v9;
    uint64_t v15 = v10;
LABEL_7:
    uint64_t v19 = [v13 exceptionWithName:v14 reason:v15 userInfo:v12];
    v20 = a4;
LABEL_8:
    [v20 setObject:v19 forKey:@"NSUnderlyingException"];
    return 0;
  }
  if ([a1 isUpdateScoped])
  {
    int v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported join (min/max(key.path) not allowed in updates)", v51);
LABEL_6:
    uint64_t v15 = v18;
    uint64_t v13 = v16;
    uint64_t v14 = v17;
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  uint64_t v56 = a2;
  v54 = a1;
  uint64_t v23 = [a1 governingEntityForKeypathExpression:a3];
  v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "arguments"), "objectAtIndex:", 0), "constantValue"), "componentsSeparatedByString:", @".");
  uint64_t v25 = [v24 count];
  if (v25)
  {
    uint64_t v26 = v25;
    char v27 = 0;
    id v28 = 0;
    unint64_t v29 = 0;
    v57 = 0;
    unint64_t v58 = v25 - 1;
    v55 = a4;
    v53 = a3;
    while (1)
    {
      v52 = v28;
      id v30 = v28;
      unint64_t v31 = v29;
      while (1)
      {
        uint64_t v32 = [v24 objectAtIndex:v31];
        if (!v23)
        {
          id v30 = v52;
LABEL_56:

          v39 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v40 = *MEMORY[0x1E4F1C3C8];
          uint64_t v41 = [NSString stringWithFormat:@"Invalid keypath element (not a relationship or attribute): %@", v32];
LABEL_57:
          uint64_t v19 = [v39 exceptionWithName:v40 reason:v41 userInfo:0];
          v20 = v55;
          goto LABEL_8;
        }
        v33 = (void *)[*(id *)(v23 + 40) objectForKey:v32];
        if (!v33) {
          goto LABEL_56;
        }
        v34 = v33;
        int v35 = [v33 propertyType];
        if (v35 != 1) {
          break;
        }
        if (v29 < v58)
        {

          v39 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v40 = *MEMORY[0x1E4F1C3C8];
          uint64_t v41 = [NSString stringWithFormat:@"Invalid keypath (continues after attribute name): %@", v32];
          goto LABEL_57;
        }
        if ((v27 & 1) == 0)
        {

          v39 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v40 = *MEMORY[0x1E4F1C3C8];
          uint64_t v41 = [NSString stringWithFormat:@"Invalid keypath (request for aggregate operation on a toOne-only keypath): %@", v53];
          goto LABEL_57;
        }
        if (v30) {
          [v30 appendString:@"."];
        }
        else {
          id v30 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        }
        [v30 appendString:v32];
        ++v31;
        char v27 = 1;
        if (v26 == v31)
        {
          a4 = v55;
          a3 = v53;
          goto LABEL_49;
        }
      }
      if (v35 == 7)
      {
        if (v27)
        {
          if (v30)
          {
            [v30 appendString:@"."];
            id v36 = v30;
          }
          else
          {
            id v36 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            id v30 = v36;
          }
        }
        else if (v57)
        {
          [v57 appendString:@"."];
          id v36 = v57;
        }
        else
        {
          id v36 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          v57 = v36;
        }
        [v36 appendString:v32];
        uint64_t v23 = [v34 destinationEntity];
        unint64_t v29 = v31 + 1;
        id v28 = v30;
        BOOL v38 = v58 == v31;
        a4 = v55;
        a3 = v53;
        if (v38) {
          goto LABEL_45;
        }
      }
      else
      {
        if ((v35 & 0xFE) == 8)
        {
          if (v27)
          {

            v39 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v40 = *MEMORY[0x1E4F1C3C8];
            uint64_t v41 = [NSString stringWithFormat:@"Invalid keypath (too many toMany relationships): %@", v53];
            goto LABEL_57;
          }
          id v37 = v57;
          if (v57) {
            [v57 appendString:@"."];
          }
          else {
            id v37 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          }
          v57 = v37;
          [v37 appendString:v32];
          uint64_t v23 = [v34 destinationEntity];
          char v27 = 1;
        }
        unint64_t v29 = v31 + 1;
        id v28 = v30;
        BOOL v38 = v58 == v31;
        a4 = v55;
        a3 = v53;
        if (v38) {
          goto LABEL_45;
        }
      }
    }
  }
  v57 = 0;
  id v30 = 0;
LABEL_45:
  if (([@"count" isEqual:v56] & 1) == 0)
  {

    int v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = [NSString stringWithFormat:@"Invalid keypath (no terminal attribute in call to math aggregate): %@", a3];
    goto LABEL_6;
  }
LABEL_49:
  if (v30)
  {
    [v30 appendString:@".@"];
    v42 = v30;
  }
  else
  {
    v42 = (void *)[@".@" mutableCopy];
    id v30 = v42;
  }
  [v42 appendString:v56];
  uint64_t v43 = [a3 operand];
  v44 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:v57];

  v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v44, 0);
  uint64_t v46 = [MEMORY[0x1E4F28C68] expressionForFunction:v43 selectorName:@"valueForKeyPath:" arguments:v45];

  uint64_t v47 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"aliasGenerator"), "generateSubqueryVariableAlias");
  uint64_t v48 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionForSubquery:usingIteratorVariable:predicate:", v46, v47, objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", 1));
  v49 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:v30];

  v50 = [[NSSQLSubqueryExpressionIntermediate alloc] initWithExpression:v48 trailingKeypath:v49 inScope:v54[1]];
  uint64_t v21 = [(NSSQLSubqueryExpressionIntermediate *)v50 generateSQLStringInContext:a4];

  if (!v21)
  {
    int v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = [NSString stringWithFormat:@"Failed to generate SQL for function expression: %@", a3];
    goto LABEL_6;
  }
  return v21;
}

- (void)_generateMathStringWithSymbol:(void *)a3 inContext:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = (void *)[a1[2] arguments];
  if ([v6 count] != 2)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = NSString;
    uint64_t v17 = (uint64_t)v6;
    uint64_t v14 = @"Wrong number of arguments to function add:to: (%@)";
LABEL_7:
    [a3 setObject:objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, objc_msgSend(v13, "stringWithFormat:", v14, v17), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  id v7 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0), 0, a3);
  if (!v7)
  {
    if ([a3 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    int v16 = NSString;
    uint64_t v17 = [v6 objectAtIndex:0];
    uint64_t v14 = @"Unable to generate sql for add:to: argument 0(%@)";
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, "insertString:atIndex:", @"("), 0;
  [v8 appendString:a2];
  id v9 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 1), 0, a3);
  if (!v9)
  {

    if ([a3 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    int v16 = NSString;
    uint64_t v17 = [v6 objectAtIndex:1];
    uint64_t v14 = @"Unable to generate sql for add:to: argument 1(%@)";
LABEL_14:
    uint64_t v13 = v16;
    goto LABEL_7;
  }
  uint64_t v10 = v9;
  [v8 appendString:v9];
  [v8 appendString:@""]);

  return v8;
}

- (void)_generateArgumentStringForCollection:(void *)a3 inContext:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  uint64_t v6 = (void *)[&stru_1ED787880 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      uint64_t v11 = 0;
      int v12 = v9;
      int v17 = v9 + v8;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if (v12 + (int)v11 >= 1) {
          [v6 appendString:@", "];
        }
        id v14 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v13, 1, a3);
        if (!v14)
        {
          if (![a3 objectForKey:@"NSUnderlyingException"]) {
            [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unable to generate sql for %@ as part of  expression (%@)", v13, a1[2]), 0), @"NSUnderlyingException" forKey];
          }

          return 0;
        }
        uint64_t v15 = v14;
        [v6 appendString:v14];

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      int v9 = v17;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (void)_generateUncorrelatedSubqueryStringWithSymbol:(void *)a3 forAttribute:(void *)a4 inContext:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isIndexScoped])
  {
    if ([a4 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = [NSString stringWithFormat:@"Unsupported expression in index description (%@)", a1[2]];
    uint64_t v11 = a1[2];
    uint64_t v32 = @"expression";
    v33[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v13 = v8;
    uint64_t v14 = v9;
    uint64_t v15 = (__CFString *)v10;
LABEL_14:
    objc_msgSend(a4, "setObject:forKey:", objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, v12), @"NSUnderlyingException");
    return 0;
  }
  int v16 = (void *)[a3 entity];
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"aliasGenerator"), "generateTableAlias");
  long long v18 = objc_msgSend(@"(SELECT "), "mutableCopy";
  [v18 appendString:a2];
  objc_msgSend(v18, "appendString:", @"(");
  [v18 appendString:v17];
  [v18 appendString:@"."];
  objc_msgSend(v18, "appendString:", objc_msgSend(a3, "columnName"));
  [v18 appendString:@" FROM "]);
  objc_msgSend(v18, "appendString:", objc_msgSend(v16, "tableName"));
  [v18 appendString:@" "];
  [v18 appendString:v17];
  uint64_t v19 = [a4 objectForKey:@"restrictingEntityPredicate"];
  if (v19)
  {
    long long v20 = (void *)v19;
    if ([a1 isTargetColumnsScoped])
    {
      uint64_t v21 = self;
      if (v21 == objc_opt_class())
      {
        uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "subpredicates"), "objectAtIndex:", 0), "rightExpression"), "constantValue");
        uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "subpredicates"), "objectAtIndex:", 1), "rightExpression"), "constantValue");
        objc_msgSend(v18, "appendString:", @" WHERE (");
        [v18 appendString:v17];
        [v18 appendString:@"."];
        [v18 appendString:@"Z_ENT"];
        [v18 appendString:@" >= "];
        uint64_t v27 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v25, (uint64_t)a4);
        if (v27)
        {
          id v28 = (void *)v27;
          [v18 appendString:v27];

          [v18 appendString:@" AND "];
          [v18 appendString:v17];
          [v18 appendString:@"."];
          [v18 appendString:@"Z_ENT"];
          [v18 appendString:@" <= "];
          uint64_t v29 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v26, (uint64_t)a4);
          if (v29)
          {
            id v30 = (void *)v29;
            [v18 appendString:v29];

            [v18 appendString:@""]);
            goto LABEL_12;
          }
        }
      }
      else
      {
        uint64_t v22 = objc_msgSend((id)objc_msgSend(v20, "rightExpression"), "constantValue");
        [v18 appendString:@" WHERE "];
        [v18 appendString:v17];
        [v18 appendString:@"."];
        [v18 appendString:@"Z_ENT"];
        [v18 appendString:@" = "];
        uint64_t v23 = -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v22, (uint64_t)a4);
        if (v23)
        {
          v24 = (void *)v23;
          [v18 appendString:v23];

          goto LABEL_12;
        }
      }

      uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3B8];
      uint64_t v15 = @"Can't generate sql for entityID";
      uint64_t v12 = 0;
      goto LABEL_14;
    }
  }
LABEL_12:
  [v18 appendString:@""]);
  return v18;
}

- (id)generateType1SQLString:(void *)a3 inContext:
{
  v54[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([(id)a1 isIndexScoped])
  {
    if (![a3 objectForKey:@"NSUnderlyingException"])
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3C8];
      uint64_t v8 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), aggregate operations not allowed here", *(void *)(a1 + 16)];
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v51 = @"expression";
      uint64_t v52 = v9;
      uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v11 = &v52;
      uint64_t v12 = &v51;
LABEL_5:
      uint64_t v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
      uint64_t v14 = v6;
      uint64_t v15 = v7;
      uint64_t v16 = v8;
LABEL_18:
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, v13), @"NSUnderlyingException");
      return 0;
    }
    return 0;
  }
  uint64_t v17 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "count");
  if (!v17)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    uint64_t v16 = [NSString stringWithFormat:@"Unable to generate sql for %@, empty %@ expression", *(void *)(a1 + 16), a2];
    uint64_t v14 = v24;
LABEL_16:
    uint64_t v15 = v25;
LABEL_17:
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v18 = v17;
  if ([(id)a1 isTargetColumnsScoped]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates"))
  {
    uint64_t v19 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0), 1, a1);
    id v20 = [(NSSQLKeypathExpressionIntermediate *)v19 generateSQLStringInContext:a3];

    if (!v20) {
      return 0;
    }
    id v21 = (id)[a2 mutableCopy];
    objc_msgSend(v21, "appendString:", @"(");
LABEL_24:
    [v21 appendString:v20];

    [v21 appendString:@""]);
    return v21;
  }
  if (v18 != 1)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v21 appendString:a2];
    objc_msgSend(v21, "appendString:", @"(");
    uint64_t v27 = (void *)[*(id *)(a1 + 16) arguments];
    id v28 = (void *)a1;
    goto LABEL_22;
  }
  uint64_t v22 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0);
  if (![(id)a1 isIndexScoped])
  {
    uint64_t v30 = [v22 expressionType];
    if (([(id)objc_opt_class() isSimpleKeypath:v22] & 1) != 0
      || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v22))
    {
      unint64_t v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "arguments"), "objectAtIndex:", 0), "constantValue");
      if ([v31 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL) {
        return (id)-[NSSQLFunctionExpressionIntermediate _generateCorrelatedSubqueryStringWithSymbol:forExpression:inContext:]((void *)a1, (uint64_t)a2, v22, a3);
      }
      uint64_t v32 = [(id)a1 governingEntityForKeypathExpression:v22];
      if (v32) {
        v33 = (void *)[*(id *)(v32 + 40) objectForKey:v31];
      }
      else {
        v33 = 0;
      }
      if ([v33 propertyType] == 1) {
        return -[NSSQLFunctionExpressionIntermediate _generateUncorrelatedSubqueryStringWithSymbol:forAttribute:inContext:]((void *)a1, (uint64_t)a2, v33, a3);
      }
      id v37 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v38 = *MEMORY[0x1E4F1C3C8];
      uint64_t v39 = [NSString stringWithFormat:@"Non-attribute property passed to math function: %@", v22];
      goto LABEL_42;
    }
    if (v30 <= 12)
    {
      if (!v30)
      {
        uint64_t v46 = (void *)[v22 constantValue];
        if (([v46 isNSSet] & 1) != 0
          || ([v46 isNSArray] & 1) != 0
          || ([v46 isNSOrderedSet] & 1) != 0)
        {
          if (objc_opt_respondsToSelector()) {
            [*(id *)(a1 + 16) allowEvaluation];
          }
          uint64_t v47 = [*(id *)(a1 + 16) expressionValueWithObject:0 context:0];
          uint64_t v48 = a1;
        }
        else
        {
          uint64_t v48 = a1;
          uint64_t v47 = (uint64_t)v46;
        }
        return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v48, v47, (uint64_t)a3);
      }
      if (v30 == 4 && -[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:](a1, v22))
      {
        int v35 = -[NSSQLSubqueryExpressionIntermediate initWithExpression:trailingKeypath:inScope:]([NSSQLSubqueryExpressionIntermediate alloc], "initWithExpression:trailingKeypath:inScope:", [*(id *)(a1 + 16) operand], objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0), *(void *)(a1 + 8));
        id v36 = [(NSSQLSubqueryExpressionIntermediate *)v35 generateSQLStringInContext:a3];

        if (v36)
        {
          id v21 = (id)[a2 mutableCopy];
          [v21 appendString:v36];

          return v21;
        }
        if ([a3 objectForKey:@"NSUnderlyingException"]) {
          return 0;
        }
        v42 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v43 = *MEMORY[0x1E4F1C3C8];
        uint64_t v44 = [NSString stringWithFormat:@"Unsupported expression %@", *(void *)(a1 + 16)];
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (v30 == 13)
    {
      uint64_t v49 = -[NSSQLIntermediate _generateSQLForSubqueryExpression:trailingKeypath:inContext:](a1, v22, 0, a3);
      if (v49)
      {
        v50 = (void *)v49;
        id v21 = (id)[a2 mutableCopy];
        [v21 appendString:v50];

        return v21;
      }
      if ([a3 objectForKey:@"NSUnderlyingException"]) {
        return 0;
      }
      id v37 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v38 = *MEMORY[0x1E4F1C3C8];
      uint64_t v39 = [NSString stringWithFormat:@"Unable to generate sql for subquery: %@", v22];
LABEL_42:
      uint64_t v16 = v39;
      uint64_t v14 = v37;
      uint64_t v15 = v38;
      goto LABEL_17;
    }
    if (v30 != 14)
    {
LABEL_49:
      v45 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      uint64_t v16 = [NSString stringWithFormat:@"Unable to generate sql for %@() : argument (%@) not supported", a2, v22];
      uint64_t v14 = v45;
      goto LABEL_16;
    }
    uint64_t v40 = (void *)[v22 constantValue];
    uint64_t v41 = [v40 count];
    if (v41 == 1)
    {
      id v21 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, (void *)[v40 objectAtIndex:0], 1, a3);
      if (v21) {
        return v21;
      }
      if ([a3 objectForKey:@"NSUnderlyingException"]) {
        return 0;
      }
      v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v44 = [NSString stringWithFormat:@"Unable to generate sql for %@", *(void *)(a1 + 16)];
      goto LABEL_48;
    }
    if (!v41)
    {
      v42 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v43 = *MEMORY[0x1E4F1C3C8];
      uint64_t v44 = [NSString stringWithFormat:@"Unable to generate sql for %@, empty max/etc expression", *(void *)(a1 + 16)];
LABEL_48:
      uint64_t v16 = v44;
      uint64_t v14 = v42;
      uint64_t v15 = v43;
      goto LABEL_17;
    }
    id v21 = (id)[a2 mutableCopy];
    objc_msgSend(v21, "appendString:", @"(");
    id v28 = (void *)a1;
    uint64_t v27 = v40;
LABEL_22:
    uint64_t v29 = -[NSSQLFunctionExpressionIntermediate _generateArgumentStringForCollection:inContext:](v28, v27, a3);
    if (!v29)
    {

      return 0;
    }
    id v20 = v29;
    goto LABEL_24;
  }
  if (![a3 objectForKey:@"NSUnderlyingException"])
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), aggregates not allowed here.", *(void *)(a1 + 16)];
    uint64_t v23 = *(void *)(a1 + 16);
    v53 = @"expression";
    v54[0] = v23;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = v54;
    uint64_t v12 = &v53;
    goto LABEL_5;
  }
  return 0;
}

- (void)generateType2SQLString:(void *)a3 inContext:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count");
  if (v6 != 1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    if (v6)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a1[2] forKey:@"Bad value"];
      uint64_t v9 = @"Invalid number of parameters passed to uppercase: function";
      uint64_t v10 = v7;
      uint64_t v11 = v8;
    }
    else
    {
      uint64_t v9 = (__CFString *)[NSString stringWithFormat:@"Unable to generate sql for %@, empty expression", a1[2]];
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 0;
    }
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, v12), @"NSUnderlyingException");
    return 0;
  }
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
  uint64_t v14 = [v13 expressionType];
  if (([(id)objc_opt_class() isSimpleKeypath:v13] & 1) == 0
    && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v13) & 1) == 0
    && (v14 || !objc_msgSend((id)objc_msgSend(v13, "constantValue"), "isNSString")))
  {
    [a3 setValue:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Bad argument to upper/lower function (needs to be a keypath or a string) : %@", v13), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  uint64_t v15 = (void *)[a2 mutableCopy];
  id v16 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v13, 0, a3);
  if (!v16)
  {

    uint64_t v15 = 0;
  }
  [v15 appendString:v16];
  [v15 appendString:@""]);

  return v15;
}

- (id)_generateType4SQLForSymbol:(void *)a3 inContext:
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([(id)a1 isIndexScoped])
  {
    if (![a3 objectForKey:@"NSUnderlyingException"])
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), aggregate operations not allowed here", *(void *)(a1 + 16)];
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v39 = @"expression";
      v40[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], v7, v9), @"NSUnderlyingException");
    }
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "count") != 1)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    id v16 = NSString;
    uint64_t v38 = *(void *)(a1 + 16);
    uint64_t v17 = @"Invalid number of arguments to avg function : %@";
LABEL_15:
    uint64_t v18 = objc_msgSend(v16, "stringWithFormat:", v17, v38);
    goto LABEL_16;
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "arguments"), "objectAtIndex:", 0);
  if (![v10 expressionType])
  {
    uint64_t v23 = (void *)[v10 constantValue];
    if (([v23 isNSArray] & 1) != 0
      || ([v23 isNSSet] & 1) != 0
      || [v23 isNSOrderedSet])
    {
      if ([v23 count])
      {
        if ([@"avg" isEqual:a2]) {
          uint64_t v24 = [NSClassFromString((NSString *)@"_NSPredicateUtilities") average:v23];
        }
        else {
          uint64_t v24 = [NSClassFromString((NSString *)@"_NSPredicateUtilities") sum:v23];
        }
      }
      else
      {
        uint64_t v24 = [NSNumber numberWithInt:0];
      }
      uint64_t v31 = a1;
    }
    else
    {
      if (![v23 isNSNumber])
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v15 = *MEMORY[0x1E4F1C3C8];
        id v37 = NSString;
        uint64_t v38 = [*(id *)(a1 + 16) arguments];
        uint64_t v17 = @"Bad argument to sum (non-numeric, non-collection argument) : %@";
LABEL_57:
        id v16 = v37;
        goto LABEL_15;
      }
      uint64_t v31 = a1;
      uint64_t v24 = (uint64_t)v23;
    }
    return (id)-[NSSQLIntermediate _generateSQLForConstantValue:inContext:](v31, v24, (uint64_t)a3);
  }
  if ([(id)a1 isTargetColumnsScoped]
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "fetchIntermediate"), "selectIntermediate"), "onlyFetchesAggregates") & 1) != 0|| objc_msgSend((id)a1, "isHavingScoped"))
  {
    if (([(id)objc_opt_class() isSimpleKeypath:v10] & 1) != 0
      || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v10))
    {
      uint64_t v11 = [(NSSQLExpressionIntermediate *)[NSSQLKeypathExpressionIntermediate alloc] initWithExpression:v10 allowToMany:1 inScope:a1];
      id v12 = [(NSSQLKeypathExpressionIntermediate *)v11 generateSQLStringInContext:a3];

      if (v12)
      {
        id v13 = (id)[a2 mutableCopy];
        objc_msgSend(v13, "appendString:", @"(");
        [v13 appendString:v12];

        [v13 appendString:@""]);
        return v13;
      }
      if (![a3 objectForKey:@"NSUnderlyingException"])
      {
        id v28 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v29 = *MEMORY[0x1E4F1C3C8];
        uint64_t v30 = [NSString stringWithFormat:@"Unable to generate SQL for keypath: %@", *(void *)(a1 + 16)];
LABEL_38:
        objc_msgSend(a3, "setValue:forKey:", objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0), @"NSUnderlyingException");
      }
      return 0;
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    uint64_t v19 = [NSString stringWithFormat:@"Bad argument to aggregate %@ in select (must be a keypath or constant value) : %@", a2, objc_msgSend(*(id *)(a1 + 16), "arguments")];
    id v20 = v32;
    uint64_t v21 = v33;
LABEL_17:
    objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v19, 0), @"NSUnderlyingException");
    return 0;
  }
  if (([(id)objc_opt_class() isSimpleKeypath:v10] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v10))
  {
    if ([v10 expressionType] == 13)
    {
      v34 = (void *)[@".@" mutableCopy];
      [v34 appendString:a2];
      int v35 = (void *)[(id)objc_opt_class() _newKeyPathExpressionForString:v34];

      id v36 = [[NSSQLSubqueryExpressionIntermediate alloc] initWithExpression:v10 trailingKeypath:v35 inScope:*(void *)(a1 + 8)];
      id v13 = [(NSSQLSubqueryExpressionIntermediate *)v36 generateSQLStringInContext:a3];

      if (v13) {
        return v13;
      }
      if ([a3 objectForKey:@"NSUnderlyingException"]) {
        return 0;
      }
      id v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      uint64_t v30 = [NSString stringWithFormat:@"Unable to generate SQL for subquery: %@", *(void *)(a1 + 16)];
      goto LABEL_38;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    id v37 = NSString;
    uint64_t v38 = [*(id *)(a1 + 16) arguments];
    uint64_t v17 = @"Unsupported argument to sum : %@";
    goto LABEL_57;
  }
  uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "arguments"), "objectAtIndex:", 0), "constantValue");
  if ([v25 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v26 = [(id)a1 governingEntityForKeypathExpression:v10];
    if (v26) {
      uint64_t v27 = (void *)[*(id *)(v26 + 40) objectForKey:v25];
    }
    else {
      uint64_t v27 = 0;
    }
    if ([v27 propertyType] == 1)
    {
      return -[NSSQLFunctionExpressionIntermediate _generateUncorrelatedSubqueryStringWithSymbol:forAttribute:inContext:]((void *)a1, (uint64_t)a2, v27, a3);
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    uint64_t v18 = [NSString stringWithFormat:@"Non-attribute property passed to sum: %@", *(void *)(a1 + 16)];
LABEL_16:
    uint64_t v19 = v18;
    id v20 = v14;
    uint64_t v21 = v15;
    goto LABEL_17;
  }

  return (id)-[NSSQLFunctionExpressionIntermediate _generateCorrelatedSubqueryStringWithSymbol:forExpression:inContext:]((void *)a1, (uint64_t)a2, v10, a3);
}

- (void)_generateDistinctStringInContext:(id *)a1
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([a1 isIndexScoped])
  {
    if ([a2 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), 'distinct' not allowed here", a1[2]];
    id v7 = a1[2];
    uint64_t v21 = @"expression";
    v22[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    uint64_t v11 = v6;
LABEL_13:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, v8), @"NSUnderlyingException");
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count") != 1)
  {
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = [NSString stringWithFormat:@"Invalid number of arguments to distinct : %@", a1[2]];
    uint64_t v9 = v16;
LABEL_12:
    uint64_t v10 = v17;
    uint64_t v8 = 0;
    goto LABEL_13;
  }
  id v12 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
  if ([v12 expressionType] != 1
    && ([(id)objc_opt_class() isSimpleKeypath:v12] & 1) == 0
    && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v12) & 1) == 0)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = [NSString stringWithFormat:@"Invalid argument to distinct : %@", v12];
LABEL_19:
    uint64_t v11 = v20;
    uint64_t v9 = v19;
    goto LABEL_12;
  }
  id v13 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v12, 1, a2);
  if (!v13)
  {
    if ([a2 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = [NSString stringWithFormat:@"Unable to generate SQL for distinct : %@", v12];
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  uint64_t v15 = (void *)[@"DISTINCT " mutableCopy];
  [v15 appendString:v14];

  return v15;
}

- (uint64_t)_generateNowStringInContext:(id *)a1
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if ([a1 isIndexScoped])
  {
    if ([a2 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = [NSString stringWithFormat:@"Unsupported expression in index description (%@), 'now' not allowed here", a1[2]];
    id v7 = a1[2];
    id v16 = @"expression";
    v17[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    uint64_t v11 = v6;
LABEL_7:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, v8), @"NSUnderlyingException");
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count"))
  {
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v11 = [NSString stringWithFormat:@"Invalid number of arguments to now function : %@", a1[2]];
    uint64_t v9 = v12;
    uint64_t v10 = v13;
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:");

  return -[NSSQLIntermediate _generateSQLForConstantValue:inContext:]((uint64_t)a1, v15, (uint64_t)a2);
}

- (void)_generateLengthStringInContext:(id *)a1
{
  if (!a1) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "count") != 1)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = [NSString stringWithFormat:@"Invalid number of arguments to length: function : %@", a1[2]];
    uint64_t v11 = v8;
LABEL_13:
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v9, v10, 0), @"NSUnderlyingException");
    return 0;
  }
  v4 = objc_msgSend((id)objc_msgSend(a1[2], "arguments"), "objectAtIndex:", 0);
  if ([v4 expressionType]
    && ([(id)objc_opt_class() isSimpleKeypath:v4] & 1) == 0
    && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)a1, v4) & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = [NSString stringWithFormat:@"Invalid argument to length: : %@", v4];
LABEL_12:
    uint64_t v10 = v13;
    uint64_t v11 = v12;
    goto LABEL_13;
  }
  id v5 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, v4, 0, a2);
  if (!v5)
  {
    if ([a2 objectForKey:@"NSUnderlyingException"]) {
      return 0;
    }
    id v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = [NSString stringWithFormat:@"Unable to generate SQL for length : %@", v4];
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(@"length("), "mutableCopy";
  [v7 appendString:v6];
  [v7 appendString:@""]);

  return v7;
}

- (uint64_t)_generateRtreeIndexStringInContext:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"You should not have made it here, scope failed at its job : %@", *(void *)(result + 16)), 0 reason userInfo];
    return [a2 setObject:v3 forKey:@"NSUnderlyingException"];
  }
  return result;
}

@end
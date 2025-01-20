@interface NSSQLSimpleWhereIntermediate
- (BOOL)isWhereScoped;
- (NSSQLSimpleWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4;
- (__CFString)_sqlTokenForPredicateOperator:(unint64_t)a1 inContext:(void *)a2;
- (id)_generateSQLBeginsWithStringInContext:(uint64_t)a1;
- (id)_generateSQLBoundByStringInContext:(uint64_t)a1;
- (id)_generateSQLForConst:(void *)a3 inToMany:(void *)a4 inContext:;
- (id)_generateSQLType3InContext:(uint64_t)a1;
- (id)_lastScopedItem;
- (id)generateSQLStringInContext:(id)a3;
- (uint64_t)_upperBoundSearchStringForString:(__CFString *)a1 context:(void *)a2;
- (void)_generateSQLBetweenStringInContext:(uint64_t)a1;
- (void)_generateSQLForConst:(__CFString *)a3 inManyToMany:(uint64_t)a4 expression:(void *)a5 inContext:;
- (void)_generateSQLForConst:(uint64_t)a1 inAttribute:(uint64_t)a2 expression:(uint64_t)a3 inContext:(uint64_t)a4;
- (void)_generateSQLForMatchingOperator:(void *)a3 inContext:;
- (void)_generateSQLForString:(void *)a3 expressionPath:(int)a4 wildStart:(int)a5 wildEnd:(uint64_t)a6 allowToMany:(void *)a7 inContext:;
- (void)_generateSQLSubstringWildStart:(int)a3 wildEnd:(void *)a4 inContext:;
- (void)dealloc;
@end

@implementation NSSQLSimpleWhereIntermediate

- (id)_lastScopedItem
{
  return (id)[(NSMutableArray *)self->_comparisonPredicateScopedItem lastObject];
}

- (id)generateSQLStringInContext:(id)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKey:@"NSUnderlyingException"]) {
    return 0;
  }
  uint64_t v5 = [(NSPredicate *)self->super._predicate predicateOperatorType];
  if ([(NSPredicate *)self->super._predicate comparisonPredicateModifier] != 1)
  {
    effectiveLeftExpression = self->_effectiveLeftExpression;
    if ([(NSExpression *)effectiveLeftExpression expressionType] == NSConstantValueExpressionType)
    {
      uint64_t v20 = [(NSExpression *)effectiveLeftExpression constantValue];
      if (!v20 || [MEMORY[0x1E4F1CA98] null] == v20)
      {
        v6 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v7 = *MEMORY[0x1E4F1C3C8];
        v8 = @"can't use NULL on left hand side";
        goto LABEL_4;
      }
    }
    v12 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
    if (v5 <= 98)
    {
      switch(v5)
      {
        case 0:
        case 1:
        case 2:
        case 3:
          v13 = self->_effectiveLeftExpression;
          effectiveRightExpression = self->_effectiveRightExpression;
          uint64_t v15 = [(NSPredicate *)self->super._predicate comparisonPredicateModifier];
          if ([(NSExpression *)v13 expressionType] == NSConstantValueExpressionType
            && ((uint64_t v38 = [(NSExpression *)v13 constantValue]) == 0
             || [MEMORY[0x1E4F1CA98] null] == v38)
            || [(NSExpression *)effectiveRightExpression expressionType] == NSConstantValueExpressionType
            && ((uint64_t v39 = [(NSExpression *)effectiveRightExpression constantValue]) == 0
             || [MEMORY[0x1E4F1CA98] null] == v39))
          {
            v40 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v41 = *MEMORY[0x1E4F1C3C8];
            v42 = @"illegal comparison with NULL";
            goto LABEL_48;
          }
          if ([(NSPredicate *)self->super._predicate options]) {
            goto LABEL_101;
          }
          if (!self->_comparisonPredicateScopedItem) {
            self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          if ([(NSExpression *)v13 expressionType] == NSKeyPathExpressionType
            && (uint64_t v17 = [(NSExpression *)effectiveRightExpression expressionType], v16 = v13, !v17)
            || [(NSExpression *)effectiveRightExpression expressionType] == NSKeyPathExpressionType
            && (uint64_t v18 = [(NSExpression *)v13 expressionType], v16 = effectiveRightExpression, !v18))
          {
            [(NSMutableArray *)self->_comparisonPredicateScopedItem addObject:v16];
            int v19 = 1;
          }
          else
          {
            int v19 = 0;
          }
          v55 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v13, v15 == 2, a3);
          if (!v55) {
            goto LABEL_104;
          }
          v9 = v55;
          id v56 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, effectiveRightExpression, v15 == 2, a3);
          if (v56)
          {
            v57 = v56;
            v58 = -[NSSQLSimpleWhereIntermediate _sqlTokenForPredicateOperator:inContext:]([(NSPredicate *)self->super._predicate predicateOperatorType], a3);
            if (v58) {
              goto LABEL_141;
            }
          }
          else
          {
          }
          goto LABEL_104;
        case 4:
        case 5:
          if ([(NSPredicate *)self->super._predicate predicateOperatorType] == 5) {
            v33 = @"IS NOT NULL";
          }
          else {
            v33 = @"IS NULL";
          }
          v34 = self->_effectiveLeftExpression;
          v35 = self->_effectiveRightExpression;
          uint64_t v36 = [(NSPredicate *)self->super._predicate comparisonPredicateModifier];
          if ([(NSExpression *)v34 expressionType])
          {
            BOOL v37 = 0;
          }
          else
          {
            uint64_t v47 = [(NSExpression *)v34 constantValue];
            if (v47) {
              BOOL v37 = [MEMORY[0x1E4F1CA98] null] == v47;
            }
            else {
              BOOL v37 = 1;
            }
          }
          if ([(NSExpression *)v35 expressionType])
          {
            BOOL v59 = 0;
          }
          else
          {
            uint64_t v60 = [(NSExpression *)v35 constantValue];
            if (!v60)
            {
              if (v37) {
                v62 = v35;
              }
              else {
                v62 = v34;
              }
LABEL_121:
              id v72 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v62, v36 == 2, a3);
              if (!v72) {
                goto LABEL_104;
              }
              v73 = v72;
              -[NSSQLIntermediate promoteJoinsInKeypathsForExpression:]((uint64_t)self, v62);
              v9 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v73];
              [(__CFString *)v9 appendString:@" "];
              [(__CFString *)v9 appendString:v33];

LABEL_103:
              if (v9)
              {
LABEL_109:
                uint64_t v66 = v12[114];

                *(Class *)((char *)&self->super.super.super.isa + v66) = 0;
                [a3 setValue:0 forKey:@"entitySpecificationKeypath"];
                [a3 setValue:0 forKey:@"entitySpecificationKeypathContainsToMany"];
                [a3 setValue:0 forKey:@"generatePairs"];
                return v9;
              }
LABEL_104:
              if ([a3 objectForKey:@"LastKeyPathWasTransientProperty"])
              {
                [a3 removeObjectForKey:@"NSUnderlyingException"];
                [a3 removeObjectForKey:@"LastKeyPathWasTransientProperty"];
              }
              else if (![a3 objectForKey:@"NSUnderlyingException"])
              {
                v63 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v64 = *MEMORY[0x1E4F1C3C8];
                uint64_t v65 = [NSString stringWithFormat:@"Unable to generate where clause for predicate (%@) (unknown problem)", self->super._predicate];
                objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v63, "exceptionWithName:reason:userInfo:", v64, v65, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", self->super._predicate, @"predicate")), @"NSUnderlyingException");
              }
              v9 = 0;
              goto LABEL_109;
            }
            BOOL v59 = [MEMORY[0x1E4F1CA98] null] == v60;
          }
          int v61 = v37 || v59;
          if (v37) {
            v62 = v35;
          }
          else {
            v62 = v34;
          }
          if (v61 != 1)
          {
            if ([(NSPredicate *)self->super._predicate options])
            {
LABEL_101:
              v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLType3InContext:]((uint64_t)self, a3);
              goto LABEL_102;
            }
            if (!self->_comparisonPredicateScopedItem) {
              self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            if ([(NSExpression *)v34 expressionType] == NSKeyPathExpressionType
              && (uint64_t v68 = [(NSExpression *)v35 expressionType], v67 = v34, !v68)
              || [(NSExpression *)v35 expressionType] == NSKeyPathExpressionType
              && (uint64_t v69 = [(NSExpression *)v34 expressionType], v67 = v35, !v69))
            {
              [(NSMutableArray *)self->_comparisonPredicateScopedItem addObject:v67];
              BOOL v70 = v36 == 2;
              v81 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v34, v70, a3);
              if (v81)
              {
                v9 = v81;
                int v19 = 1;
                goto LABEL_139;
              }
              [(NSMutableArray *)self->_comparisonPredicateScopedItem removeLastObject];
            }
            else
            {
              BOOL v70 = v36 == 2;
              v71 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v34, v70, a3);
              if (v71)
              {
                v9 = v71;
                int v19 = 0;
LABEL_139:
                id v82 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v35, v70, a3);
                if (v82)
                {
                  v57 = v82;
                  v58 = -[NSSQLSimpleWhereIntermediate _sqlTokenForPredicateOperator:inContext:]([(NSPredicate *)self->super._predicate predicateOperatorType], a3);
                  if (v58)
                  {
LABEL_141:
                    v83 = v58;
                    [(__CFString *)v9 appendString:@" "];
                    [(__CFString *)v9 appendString:v83];
                    [(__CFString *)v9 appendString:@" "];
                    [(__CFString *)v9 appendString:v57];

                    if (v19) {
                      [(NSMutableArray *)self->_comparisonPredicateScopedItem removeLastObject];
                    }
                    goto LABEL_109;
                  }
                  [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unable to generate SQL for predicate (%@) (problem with operator)", self->super._predicate), 0), @"NSUnderlyingException" forKey];

                  if (v19) {
                    [(NSMutableArray *)self->_comparisonPredicateScopedItem removeLastObject];
                  }
                  goto LABEL_104;
                }

                if (v19) {
                  [(NSMutableArray *)self->_comparisonPredicateScopedItem removeLastObject];
                }
                if ([a3 objectForKey:@"LastKeyPathWasTransientProperty"]
                  || [a3 objectForKey:@"NSUnderlyingException"])
                {
                  goto LABEL_104;
                }
                v85 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v86 = *MEMORY[0x1E4F1C3C8];
                uint64_t v87 = [NSString stringWithFormat:@"Unable to generate SQL for predicate (%@) (problem on RHS)", self->super._predicate];
LABEL_171:
                v42 = (__CFString *)v87;
                v40 = v85;
                uint64_t v41 = v86;
LABEL_48:
                uint64_t v43 = 0;
                goto LABEL_57;
              }
            }
            if ([a3 objectForKey:@"LastKeyPathWasTransientProperty"]
              || [a3 objectForKey:@"NSUnderlyingException"])
            {
              goto LABEL_104;
            }
            v85 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v86 = *MEMORY[0x1E4F1C3C8];
            uint64_t v87 = [NSString stringWithFormat:@"Unable to generate SQL for predicate (%@) (problem on LHS)", self->super._predicate];
            goto LABEL_171;
          }
          goto LABEL_121;
        case 6:
          v44 = CFSTR(" NSCoreDataMatches(");
          goto LABEL_54;
        case 7:
          v44 = CFSTR(" NSCoreDataLike(");
LABEL_54:
          v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForMatchingOperator:inContext:]((uint64_t)self, v44, a3);
          goto LABEL_102;
        case 8:
          v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLBeginsWithStringInContext:]((uint64_t)self, a3);
          goto LABEL_102;
        case 9:
          v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLSubstringWildStart:wildEnd:inContext:]((uint64_t)self, 1, 0, a3);
          goto LABEL_102;
        case 10:
          goto LABEL_27;
        default:
          goto LABEL_56;
      }
    }
    if (v5 != 99)
    {
      if (v5 == 100)
      {
        v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLBetweenStringInContext:]((uint64_t)self, a3);
      }
      else
      {
        if (v5 != 2000)
        {
LABEL_56:
          v45 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v46 = *MEMORY[0x1E4F1C3C8];
          uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:self->super._predicate forKey:@"predicate"];
          v42 = @"Unknown/unsupported comparison predicate operator type";
          v40 = v45;
          uint64_t v41 = v46;
LABEL_57:
          objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v40, "exceptionWithName:reason:userInfo:", v41, v42, v43), @"NSUnderlyingException");
          goto LABEL_104;
        }
        v21 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLBoundByStringInContext:]((uint64_t)self, a3);
      }
LABEL_102:
      v9 = v21;
      goto LABEL_103;
    }
LABEL_27:
    uint64_t v22 = [(NSPredicate *)self->super._predicate predicateOperatorType];
    uint64_t v23 = [(NSPredicate *)self->super._predicate comparisonPredicateModifier];
    v24 = self->_effectiveLeftExpression;
    v25 = self->_effectiveRightExpression;
    if (!self->_comparisonPredicateScopedItem) {
      self->_comparisonPredicateScopedItem = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (v22 == 99) {
      v26 = v25;
    }
    else {
      v26 = v24;
    }
    if (v22 != 99) {
      v24 = v25;
    }
    unint64_t v27 = [(NSExpression *)v26 expressionType];
    uint64_t v28 = [(NSExpression *)v24 expressionType];
    if (v28 == 2)
    {
      uint64_t v29 = [(NSExpression *)v24 variable];
      v30 = (NSExpression *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"substitutionVariables"), "objectForKey:", v29);
      if (v30)
      {
        v31 = v30;
        uint64_t v130 = v29;
        uint64_t v32 = [(NSExpression *)v30 expressionType];
        BOOL v131 = [a3 objectForKey:@"duringPrefetching"] != 0;
        v24 = v31;
        v12 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
      }
      else
      {
        uint64_t v130 = 0;
        BOOL v131 = 0;
        uint64_t v32 = 2;
      }
    }
    else
    {
      uint64_t v32 = v28;
      uint64_t v130 = 0;
      BOOL v131 = 0;
    }
    if (v27 >= 5
      && ([(id)objc_opt_class() isSimpleKeypath:v26] & 1) == 0
      && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v26) & 1) == 0
      && (-[NSSQLIntermediate isSimpleNoIndexFunction:]((uint64_t)self, v26) & 1) == 0)
    {
      v49 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v50 = *MEMORY[0x1E4F1C3C8];
      uint64_t v51 = [NSString stringWithFormat:@"unimplemented SQL generation for predicate : (%@) (bad LHS)", self->super._predicate];
      goto LABEL_74;
    }
    BOOL v48 = (unint64_t)v32 > 0x32 || ((1 << v32) & 0x400000000600DLL) == 0;
    if (v48
      && ([(id)objc_opt_class() isSimpleKeypath:v26] & 1) == 0
      && (-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v24) & 1) == 0
      && !-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((BOOL)self, v24))
    {
      v49 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v50 = *MEMORY[0x1E4F1C3C8];
      uint64_t v51 = [NSString stringWithFormat:@"unimplemented SQL generation for predicate : (%@) (bad RHS)", self->super._predicate];
      goto LABEL_74;
    }
    if ((v27 == 3 || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v26))
      && (v32 == 3 || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v24)))
    {
      v49 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v50 = *MEMORY[0x1E4F1C3C8];
      uint64_t v51 = [NSString stringWithFormat:@"unimplemented SQL generation for predicate : (%@) (LHS and RHS both keypaths)", self->super._predicate];
LABEL_74:
      objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v49, "exceptionWithName:reason:userInfo:", v50, v51, 0), @"NSUnderlyingException");
      v9 = 0;
      goto LABEL_103;
    }
    [*(id *)((char *)&self->super.super.super.isa + v12[114]) addObject:v26];
    if (v32 > 13)
    {
      if (v32 == 50) {
        goto LABEL_132;
      }
      if (v32 == 14)
      {
        v52 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, v23 == 2, a3);
        v9 = v52;
        if (v52)
        {
          [(__CFString *)v52 appendString:@" IN "];
          v53 = -[NSSQLIntermediate _generateSQLForExpressionCollection:allowToMany:inContext:](self, [(NSExpression *)v24 constantValue], 0, a3);
          if (v53)
          {
LABEL_135:
            v80 = v53;
            [(__CFString *)v9 appendString:v53];

LABEL_193:
            LODWORD(v54) = 1;
            goto LABEL_221;
          }
          goto LABEL_83;
        }
        goto LABEL_220;
      }
LABEL_131:
      if (-[NSSQLIntermediate _functionExpressionIsSubqueryFollowedByKeypath:]((BOOL)self, v24))
      {
LABEL_132:
        v76 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, v23 == 2, a3);
        v9 = v76;
        if (v76)
        {
          [(__CFString *)v76 appendString:@" IN "];
          v77 = self;
          v78 = v24;
          BOOL v79 = 1;
          goto LABEL_134;
        }
LABEL_220:
        LODWORD(v54) = 0;
        goto LABEL_221;
      }
      if ((([(id)objc_opt_class() isSimpleKeypath:v26] & 1) != 0
         || -[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v26))
        && ![(NSSQLIntermediate *)self->super.super._scope keypathExpressionIsSafeLHSForIn:v26])
      {
        goto LABEL_84;
      }
      if (v27 || v32 == 2)
      {
        if (v27 || v32 != 2)
        {
          v110 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v24, 1, a3);
          v9 = v110;
          if (!v110) {
            goto LABEL_220;
          }
          [(__CFString *)v110 appendString:@" = "];
          v77 = self;
          v78 = v26;
          BOOL v79 = v23 == 2;
        }
        else
        {
          id v101 = [(NSExpression *)v26 constantValue];
          if ([v101 isNSString])
          {
            LODWORD(v54) = 1;
            v9 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v101, v24, 1, 1, 1, a3);
            goto LABEL_221;
          }
          v111 = [(NSSQLIntermediate *)self _generateSQLForVariableExpression:v24 allowToMany:0 inContext:a3];
          v9 = v111;
          if (!v111) {
            goto LABEL_220;
          }
          [(__CFString *)v111 appendString:@" = "];
          v77 = self;
          v78 = v26;
          BOOL v79 = 0;
        }
LABEL_134:
        v53 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](v77, v78, v79, a3);
        if (v53) {
          goto LABEL_135;
        }
LABEL_83:

LABEL_84:
        LODWORD(v54) = 0;
        goto LABEL_85;
      }
      [*(id *)((char *)&self->super.super.super.isa + v12[114]) addObject:v24];
      if (v32 == 3) {
        uint64_t v84 = [(NSExpression *)v24 keyPath];
      }
      else {
        uint64_t v84 = objc_msgSend(-[NSArray objectAtIndex:](-[NSExpression arguments](v24, "arguments"), "objectAtIndex:", 0), "constantValue");
      }
      v103 = (void *)v84;
      id v104 = [(NSExpression *)v26 constantValue];
      if ([v103 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v104 isNSString])
        {
          LODWORD(v54) = 1;
          v9 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]((id *)&self->super.super.super.isa, (uint64_t)v104, v24, 1, 1, 1, a3);
        }
        else
        {
          v114 = [(NSSQLIntermediate *)self _generateSQLForKeyPathExpression:v24 allowToMany:1 inContext:a3];
          v9 = v114;
          if (v114)
          {
            [(__CFString *)v114 appendString:@" = "];
            id v115 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, 0, a3);
            if (v115)
            {
              v116 = v115;
              [(__CFString *)v9 appendString:v115];

              LODWORD(v54) = 1;
            }
            else
            {

              LODWORD(v54) = 0;
              v9 = 0;
            }
          }
          else
          {
            LODWORD(v54) = 0;
          }
        }
        goto LABEL_260;
      }
      v105 = [(NSSQLIntermediate *)self governingEntityForKeypathExpression:v24];
      if (v105)
      {
        v9 = (__CFString *)[v105[5] objectForKey:v103];
        v106 = (void *)[a3 valueForKey:@"explicitRestrictingEntityQualifier"];
        if (v9)
        {
LABEL_212:
          if (LOBYTE(v9->length) == 9)
          {
            v109 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForConst:inManyToMany:expression:inContext:](self, (uint64_t)v104, v9, (uint64_t)v24, a3);
            goto LABEL_258;
          }
          if (![(__CFString *)v9 isToMany])
          {
            if (LOBYTE(v9->length) != 1)
            {
              LODWORD(v54) = 0;
              v9 = 0;
LABEL_259:
              v12 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
LABEL_260:
              [*(id *)((char *)&self->super.super.super.isa + v12[114]) removeLastObject];
              goto LABEL_221;
            }
            v109 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForConst:inAttribute:expression:inContext:]((uint64_t)self, (uint64_t)v104, (uint64_t)v24, (uint64_t)a3);
LABEL_258:
            v9 = v109;
            LODWORD(v54) = 1;
            goto LABEL_259;
          }
LABEL_257:
          v109 = (__CFString *)-[NSSQLSimpleWhereIntermediate _generateSQLForConst:inToMany:inContext:](self, (uint64_t)v104, v9, a3);
          goto LABEL_258;
        }
      }
      else
      {
        v106 = (void *)[a3 valueForKey:@"explicitRestrictingEntityQualifier"];
      }
      v107 = v106;
      if ([v106 count])
      {
        uint64_t v108 = [v107 lastObject];
        if (v108)
        {
          v9 = (__CFString *)[*(id *)(v108 + 40) objectForKey:v103];
          [v107 removeLastObject];
          if (v9) {
            goto LABEL_212;
          }
        }
        else
        {
          [v107 removeLastObject];
        }
      }
      v9 = 0;
      if (([0 isToMany] & 1) == 0)
      {
        LODWORD(v54) = 0;
        goto LABEL_259;
      }
      goto LABEL_257;
    }
    if (v32)
    {
      if (v32 == 13) {
        goto LABEL_132;
      }
      goto LABEL_131;
    }
    v74 = (__CFString *)-[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](self, v26, v23 == 2, a3);
    v9 = v74;
    if (!v74) {
      goto LABEL_220;
    }
    [(__CFString *)v74 appendString:@" IN "];
    if ([(NSExpression *)v26 expressionType] == NSEvaluatedObjectExpressionType)
    {
      v75 = objc_msgSend((id)objc_msgSend(-[NSSQLIntermediate fetchIntermediate](self, "fetchIntermediate"), "governingEntity"), "entityDescription");
    }
    else if ([(id)objc_opt_class() isSimpleKeypath:v26] {
           && (v88 = (void *)[(NSExpression *)v26 predicateFormat],
    }
               v75 = objc_msgSend(-[NSSQLIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", v26), "entityDescription"), obj = (id)objc_msgSend(v88, "componentsSeparatedByString:", @"."), (uint64_t v89 = objc_msgSend(obj, "count")) != 0))
    {
      uint64_t v90 = 0;
      uint64_t v125 = v89 - 1;
      while (1)
      {
        uint64_t v91 = [obj objectAtIndex:v90];
        v92 = v75 ? objc_msgSend((id)objc_msgSend(v75, "propertiesByName"), "objectForKey:", v91) : 0;
        uint64_t v93 = [v92 _propertyType];
        v75 = 0;
        if (!v92) {
          break;
        }
        if (v93 != 4) {
          break;
        }
        v75 = (void *)[v92 destinationEntity];
        if (v125 == v90) {
          break;
        }
        ++v90;
      }
    }
    else
    {
      v75 = 0;
    }
    char v94 = !v131;
    if (v75) {
      char v94 = 1;
    }
    if ((v94 & 1) == 0)
    {
      uint64_t v95 = v130;
      if (![(id)objc_opt_class() isSimpleKeypath:v26]) {
        goto LABEL_185;
      }
      v96 = (void *)[(NSExpression *)v26 predicateFormat];
      v97 = [(NSSQLIntermediate *)self governingEntityForKeypathExpression:v26];
      uint64_t v98 = objc_msgSend((id)objc_msgSend(v96, "componentsSeparatedByString:", @"."), "firstObject");
      if (v97) {
        v97 = (id *)[v97[5] objectForKey:v98];
      }
      if ([v97 propertyType] != 7 || objc_msgSend(v97, "propertyDescription")) {
        goto LABEL_185;
      }
      v75 = objc_msgSend((id)objc_msgSend(v97, "destinationEntity"), "entityDescription");
    }
    uint64_t v95 = v130;
    if (v75)
    {
      id v99 = [(NSExpression *)v24 constantValue];
      v12 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
      if ((int)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"nestingLevel"), "intValue") <= 0
        && (([v99 isNSArray] & 1) != 0
         || ([v99 isNSSet] & 1) != 0
         || [v99 isNSOrderedSet]))
      {
        id obja = v99;
        unint64_t v102 = [v99 count];
        if (v130 || v102 >= 0x64)
        {
          +[_PFRoutines anyObjectFromCollection:]((uint64_t)_PFRoutines, v99);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id obja = (id)+[_PFRoutines newArrayOfObjectIDsFromCollection:]((uint64_t)_PFRoutines, v99);
          }
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          uint64_t v117 = [obja countByEnumeratingWithState:&v133 objects:v132 count:16];
          if (v117)
          {
            uint64_t v118 = v117;
            uint64_t v126 = *(void *)v134;
            while (2)
            {
              for (uint64_t i = 0; i != v118; ++i)
              {
                if (*(void *)v134 != v126) {
                  objc_enumerationMutation(obja);
                }
                v120 = *(void **)(*((void *)&v133 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || !objc_msgSend((id)objc_msgSend(v120, "entity"), "isKindOfEntity:", v75))
                {
                  v54 = 0;
                  goto LABEL_249;
                }
              }
              uint64_t v118 = [obja countByEnumeratingWithState:&v133 objects:v132 count:16];
              if (v118) {
                continue;
              }
              break;
            }
          }
          id v121 = (id)[a3 objectForKey:@"bindIntarrays"];
          if (!v121)
          {
            id v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [a3 setObject:v121 forKey:@"bindIntarrays"];
          }
          uint64_t v127 = [v121 count];
          v122 = [[NSSQLBindIntarray alloc] initWithValue:obja];
          -[NSSQLBindIntarray setTableName:](v122, "setTableName:", -[NSSQLAliasGenerator generateTempTableName]([a3 objectForKey:@"aliasGenerator"]));
          uint64_t v123 = [v121 count];
          [v121 addObject:v122];
          [(NSSQLBindIntarray *)v122 setIndex:v123];

          if (v130)
          {
            id v124 = (id)[a3 objectForKey:@"bindIntarraysSubstitutionOrder"];
            if (!v124)
            {
              id v124 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [a3 setObject:v124 forKey:@"bindIntarraysSubstitutionOrder"];
            }
            [v124 addObject:v130];
            [v124 addObject:v75];
            objc_msgSend(v124, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v127));
          }
          v54 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"(SELECT * FROM %@) ", -[NSSQLBindIntarray tableName](v122, "tableName")];
LABEL_249:
          v12 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
        }
        else
        {
          v54 = 0;
        }
        uint64_t v95 = v130;
      }
      else
      {
        v54 = 0;
      }
      goto LABEL_186;
    }
LABEL_185:
    v54 = 0;
    v12 = &OBJC_IVAR___NSExpressionDescription__reservedtype2_2;
LABEL_186:
    if (v54) {
      char v100 = 1;
    }
    else {
      char v100 = v131;
    }
    if ((v100 & 1) == 0) {
      v54 = (void *)-[NSSQLIntermediate _generateSQLForConstantCollection:reboundFrom:inContext:]((uint64_t)self, [(NSExpression *)v24 constantValue], v95, a3);
    }
    if (v54)
    {
      [(__CFString *)v9 appendString:v54];

      goto LABEL_193;
    }

LABEL_85:
    v9 = 0;
LABEL_221:
    [*(id *)((char *)&self->super.super.super.isa + v12[114]) removeLastObject];
    if (!v54 || !v9)
    {
      uint64_t v112 = [a3 valueForKey:@"NSUnderlyingException"];
      *(void *)&long long v133 = @"NSUnderlyingException";
      v132[0] = v112;
      uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:&v133 count:1];
      [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"unimplemented SQL generation for predicate : (%@)", self->super._predicate), v113), @"NSUnderlyingException" forKey];
    }
    goto LABEL_103;
  }
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = @"ALL modifier is not implemented";
LABEL_4:
  objc_msgSend(a3, "setObject:forKey:", objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0), @"NSUnderlyingException");
  return 0;
}

- (__CFString)_sqlTokenForPredicateOperator:(unint64_t)a1 inContext:(void *)a2
{
  if (![a2 objectForKey:@"NSUnderlyingException"])
  {
    if (a1 < 6) {
      return off_1E544E410[a1];
    }
    objc_msgSend(a2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Unknown predicate operator type parameter", 0), @"NSUnderlyingException");
  }
  return 0;
}

- (NSSQLSimpleWhereIntermediate)initWithPredicate:(id)a3 inScope:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NSSQLSimpleWhereIntermediate;
  uint64_t v5 = [(NSSQLWhereIntermediate *)&v11 initWithPredicate:a3 inScope:a4];
  if (v5)
  {
    v5->_effectiveLeftExpression = (NSExpression *)(id)[a3 leftExpression];
    v5->_effectiveRightExpression = (NSExpression *)(id)[a3 rightExpression];
    if ([(NSExpression *)v5->_effectiveLeftExpression expressionType] == NSFunctionExpressionType
      && [[(NSExpression *)v5->_effectiveLeftExpression operand] expressionType] == NSConstantValueExpressionType&& (sel_valueForKey_ == (char *)[(NSExpression *)v5->_effectiveLeftExpression selector]|| sel_valueForKeyPath_ == (char *)[(NSExpression *)v5->_effectiveLeftExpression selector]))
    {
      uint64_t v6 = [(NSExpression *)v5->_effectiveLeftExpression expressionValueWithObject:0 context:0];
      uint64_t v7 = (void *)[MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

      v5->_effectiveLeftExpression = (NSExpression *)v7;
    }
    if ([(NSExpression *)v5->_effectiveRightExpression expressionType] == NSFunctionExpressionType
      && [[(NSExpression *)v5->_effectiveRightExpression operand] expressionType] == NSConstantValueExpressionType&& (sel_valueForKey_ == (char *)[(NSExpression *)v5->_effectiveRightExpression selector]|| sel_valueForKeyPath_ == (char *)[(NSExpression *)v5->_effectiveRightExpression selector]))
    {
      uint64_t v8 = [(NSExpression *)v5->_effectiveRightExpression expressionValueWithObject:0 context:0];
      v9 = (void *)[MEMORY[0x1E4F28C68] expressionForConstantValue:v8];

      v5->_effectiveRightExpression = (NSExpression *)v9;
    }
  }
  return v5;
}

- (id)_generateSQLType3InContext:(uint64_t)a1
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 16) comparisonPredicateModifier];
  uint64_t v7 = [*(id *)(a1 + 16) options];
  unint64_t v8 = [*(id *)(a1 + 16) predicateOperatorType];
  if (!*(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  if ([v4 expressionType] == 3 && (uint64_t v10 = objc_msgSend(v5, "expressionType"), v9 = v4, !v10)
    || objc_msgSend(v5, "expressionType", v9) == 3 && (uint64_t v11 = objc_msgSend(v4, "expressionType"), v9 = v5, !v11))
  {
    [*(id *)(a1 + 24) addObject:v9];
    int v12 = 1;
  }
  else
  {
    int v12 = 0;
  }
  id v13 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, v4, v6 == 2, a2);
  if (!v13) {
    return 0;
  }
  v14 = v13;
  id v15 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, v5, v6 == 2, a2);
  if (!v15)
  {

    return 0;
  }
  v16 = v15;
  if ((v7 & 4) != 0)
  {
    v21 = (void *)[*(id *)(a1 + 16) predicateOperator];
    id v20 = v14;
    [v20 appendString:@" "];
    objc_msgSend(v20, "appendString:", objc_msgSend(v21, "symbol"));
    [v20 appendString:@" "];
    [v20 appendString:v16];
  }
  else
  {
    uint64_t v17 = (v7 << 63 >> 63) & 0x101;
    if ((v7 & 2) != 0) {
      uint64_t v17 = (v7 << 63 >> 63) & 1 | 0x180;
    }
    if ((v7 & 8) != 0) {
      uint64_t v18 = v17 | 0x120;
    }
    else {
      uint64_t v18 = v17;
    }
    if (v8 >= 6)
    {
      NSLog((NSString *)@"You really shouldn't be here");
      uint64_t v19 = 7;
    }
    else
    {
      uint64_t v19 = dword_18AE544B8[v8];
    }
    id v20 = (id)objc_msgSend(@"NSCoreDataStringCompare("), "mutableCopy";
    [v20 appendString:v14];
    [v20 appendString:@", "];
    [v20 appendString:v16];
    [v20 appendFormat:@", %d, %lu, %d"], v19, v18, (v7 >> 3) & 1);
  }

  if (v12) {
    [*(id *)(a1 + 24) removeLastObject];
  }
  return v20;
}

- (void)_generateSQLSubstringWildStart:(int)a3 wildEnd:(void *)a4 inContext:
{
  if (!a1) {
    return 0;
  }
  unint64_t v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  if (([(id)objc_opt_class() isSimpleKeypath:v8] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v8)
    || [v9 expressionType]
    || (uint64_t v10 = (void *)[v9 constantValue], !objc_msgSend(v10, "isNSString")))
  {
    [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"unimplemented SQL generation for predicate (%@).", *(void *)(a1 + 16)), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  BOOL v11 = [*(id *)(a1 + 16) comparisonPredicateModifier] == 2;

  return -[NSSQLSimpleWhereIntermediate _generateSQLForString:expressionPath:wildStart:wildEnd:allowToMany:inContext:]((id *)a1, (uint64_t)v10, v8, a2, a3, v11, a4);
}

- (id)_generateSQLBeginsWithStringInContext:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = (void *)[*(id *)(a1 + 16) predicateOperator];
  if ([*(id *)(a1 + 40) expressionType]
    || ([v4 options] & 4) == 0
    || (uint64_t v5 = (__CFString *)[*(id *)(a1 + 40) constantValue],
        ![(__CFString *)v5 isNSString])
    || (uint64_t v6 = -[NSSQLSimpleWhereIntermediate _upperBoundSearchStringForString:context:](v5, a2)) == 0)
  {
    id v9 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = (void *)v6;
  unint64_t v8 = -[NSSQLSimpleWhereIntermediate initWithPredicate:inScope:]([NSSQLSimpleWhereIntermediate alloc], "initWithPredicate:inScope:", objc_msgSend(MEMORY[0x1E4F28B98], "predicateWithLeftExpression:rightExpression:modifier:type:options:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier"), 3, 0), a1);
  id v9 = [(NSSQLSimpleWhereIntermediate *)v8 generateSQLStringInContext:a2];

  if (v9)
  {
    id v10 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:]((void *)a1, (void *)[MEMORY[0x1E4F28C68] expressionForConstantValue:v7], 0, a2);
    if (!v10)
    {
      id v13 = v9;
      id v9 = 0;
      goto LABEL_20;
    }
    BOOL v11 = v10;
    uint64_t v12 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "rangeOfString:", @">") - 1);
    [v9 appendString:@" AND "];
    [v9 appendString:v12];
    [v9 appendString:@" < "];
    [v9 appendString:v11];
  }
  id v13 = 0;
LABEL_20:

LABEL_11:
  if ([a2 objectForKey:@"NSUnderlyingException"])
  {

    return 0;
  }
  if (v9) {
    return v9;
  }

  return -[NSSQLSimpleWhereIntermediate _generateSQLSubstringWildStart:wildEnd:inContext:](a1, 0, 1, a2);
}

- (id)_generateSQLForConst:(void *)a3 inToMany:(void *)a4 inContext:
{
  if ([a1 isUpdateScoped])
  {
    [a4 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported clause (not allowed in updates): %@.", a1[4]), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  else
  {
    id v9 = [NSSQLKeypathExpressionIntermediate alloc];
    id v10 = (void *)MEMORY[0x1E4F28C68];
    BOOL v11 = (void *)[a3 entity];
    if (v11) {
      BOOL v11 = (void *)v11[16];
    }
    uint64_t v12 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:](v9, "initWithExpression:allowToMany:inScope:", objc_msgSend(v10, "expressionForKeyPath:", objc_msgSend(v11, "name")), 0, a1);
    id v8 = [(NSSQLKeypathExpressionIntermediate *)v12 generateSQLStringInContext:a4];

    if (v8)
    {
      objc_msgSend(v8, "appendString:", @" IN (SELECT ");
      if (a3) {
        id v13 = (void *)a3[7];
      }
      else {
        id v13 = 0;
      }
      uint64_t v14 = [a3 destinationEntity];
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v13, "foreignKey"), "columnName"));
      [v8 appendString:@" FROM "];
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v13, "entity"), "tableName"));
      [v8 appendString:@" WHERE "];
      if (v14) {
        id v15 = *(void **)(v14 + 128);
      }
      else {
        id v15 = 0;
      }
      objc_msgSend(v8, "appendString:", objc_msgSend(v15, "columnName"));
      v16 = [[NSSQLForeignKeyIntermediate alloc] initWithConstantValue:a2 inScope:a1];
      id v17 = [(NSSQLForeignKeyIntermediate *)v16 generateSQLStringInContext:a4];
      [v8 appendString:@" = "];
      [v8 appendString:v17];
      [v8 appendString:@" "]);
    }
  }
  return v8;
}

- (void)_generateSQLForConst:(__CFString *)a3 inManyToMany:(uint64_t)a4 expression:(void *)a5 inContext:
{
  if ([a1 isUpdateScoped])
  {
    [a5 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unsupported join (not allowed in updates): %@", a4), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", -[__CFString name](a3, "name"), 0);
  BOOL v11 = +[NSSQLJoinIntermediate createJoinIntermediatesForKeypath:startEntity:startAlias:forScope:inStatementIntermediate:inContext:]((uint64_t)NSSQLJoinIntermediate, v10, -[__CFString entity](a3, "entity"), (void *)[a1 governingAlias], a1, objc_msgSend(a1, "fetchIntermediateForKeypathExpression:", a4), a5);

  if ([a5 objectForKey:@"NSUnderlyingException"])
  {

    return 0;
  }
  uint64_t v14 = [[NSSQLForeignKeyIntermediate alloc] initWithConstantValue:a2 inScope:a1];
  id v15 = [(NSSQLForeignKeyIntermediate *)v14 generateSQLStringInContext:a5];
  if (v11) {
    v16 = (void *)v11[5];
  }
  else {
    v16 = 0;
  }
  uint64_t v12 = (void *)[v16 mutableCopy];
  [v12 appendString:@"."];
  [v12 appendString:-[NSSQLManyToMany inverseColumnName](a3)];
  [v12 appendString:@" = "];
  [v12 appendString:v15];

  return v12;
}

- (void)dealloc
{
  self->_comparisonPredicateScopedItem = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLSimpleWhereIntermediate;
  [(NSSQLSimpleWhereIntermediate *)&v3 dealloc];
}

- (void)_generateSQLForString:(void *)a3 expressionPath:(int)a4 wildStart:(int)a5 wildEnd:(uint64_t)a6 allowToMany:(void *)a7 inContext:
{
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a1[2], "predicateOperator"), "options");
  unsigned int v15 = v14;
  if ((v14 & 4) != 0)
  {
    uint64_t v17 = 2;
    if (!a5) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v16 = (v14 << 63 >> 63) & 0x101;
    if ((v14 & 2) != 0) {
      uint64_t v16 = (v14 << 63 >> 63) & 1 | 0x180;
    }
    if ((v14 & 8) != 0) {
      uint64_t v17 = v16 | 0x120;
    }
    else {
      uint64_t v17 = v16;
    }
    if (!a5) {
      goto LABEL_12;
    }
  }
  if ((a4 & 1) == 0)
  {
    v17 |= 8uLL;
    goto LABEL_18;
  }
LABEL_12:
  if (!a4 || (a5 & 1) != 0)
  {
    if ((a4 & 1) == 0 && (a5 & 1) == 0)
    {
      [a7 setValue:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unimplemented SQL generatio for predicate (%@)", a1[2]), 0), @"NSUnderlyingException" forKey];
      return 0;
    }
  }
  else
  {
    v17 |= 0xCuLL;
  }
LABEL_18:
  uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @" NSCoreDataStringSearch(");
  if ([a3 expressionType] == 2) {
    id v19 = -[NSSQLIntermediate _generateSQLForExpression:allowToMany:inContext:](a1, a3, a6, a7);
  }
  else {
    id v19 = (id)[a1 _generateSQLForKeyPathExpression:a3 allowToMany:a6 inContext:a7];
  }
  id v20 = v19;
  if (!v19)
  {

    return 0;
  }
  [v18 appendString:v19];

  [v18 appendString:@", "];
  v21 = [[NSSQLConstantValueIntermediate alloc] initWithConstantValue:a2 ofType:5 inScope:a1 context:a7];
  id v22 = [(NSSQLConstantValueIntermediate *)v21 generateSQLStringInContext:a7];
  [v18 appendString:v22];

  [v18 appendString:@", "];
  [v18 appendFormat:@"%lu, %u"], v17, (v15 >> 3) & 1);
  return v18;
}

- (BOOL)isWhereScoped
{
  return 1;
}

- (void)_generateSQLForMatchingOperator:(void *)a3 inContext:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  if (([(id)objc_opt_class() isSimpleKeypath:v6] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v6))
  {
    goto LABEL_12;
  }
  if (![v7 expressionType])
  {
    uint64_t v14 = (void *)[v7 constantValue];
    if (([v14 isNSString] & 1) != 0 || !v14)
    {
      char v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
      uint64_t v17 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v6, objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2, a3);
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        BOOL v11 = (void *)[a2 mutableCopy];
        [v11 appendString:v18];

        id v19 = [[NSSQLConstantValueIntermediate alloc] initWithConstantValue:v14 ofType:5 inScope:a1 context:a3];
        id v20 = [(NSSQLConstantValueIntermediate *)v19 generateSQLStringInContext:a3];
        [v11 appendString:@", "];
        [v11 appendString:v20];
        [v11 appendString:@", "];
        [v11 appendFormat:@"%lu "], v16 & 3);

        return v11;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (([(id)objc_opt_class() isSimpleKeypath:v7] & 1) == 0
    && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v7))
  {
LABEL_12:
    [a3 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unimplemented SQL generation for predicate (%@)", *(void *)(a1 + 16)), 0), @"NSUnderlyingException" forKey];
    return 0;
  }
  char v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
  uint64_t v9 = objc_msgSend((id)a1, "_generateSQLForKeyPathExpression:allowToMany:inContext:", v6, objc_msgSend(*(id *)(a1 + 16), "comparisonPredicateModifier") == 2, a3);
  if (!v9) {
    return 0;
  }
  id v10 = (void *)v9;
  BOOL v11 = (void *)[a2 mutableCopy];
  [v11 appendString:v10];

  uint64_t v12 = [(id)a1 _generateSQLForKeyPathExpression:v7 allowToMany:0 inContext:a3];
  if (!v12)
  {

    return 0;
  }
  id v13 = (void *)v12;
  [v11 appendString:@", "];
  [v11 appendString:v13];
  [v11 appendString:@", "];
  [v11 appendFormat:@"%lu "], v8 & 3);

  return v11;
}

- (uint64_t)_upperBoundSearchStringForString:(__CFString *)a1 context:(void *)a2
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t Length = CFStringGetLength(a1);
  uint64_t result = 0;
  if (a1 && Length <= 0x3FFFFFFF)
  {
    if (CFStringGetCharactersPtr(a1))
    {
      int v6 = CFStringEncodingUnicodeToBytes();
      if (v6)
      {
        uint64_t v7 = @"Unknown error during string conversion";
        if (v6 == 1) {
          uint64_t v7 = @"Invalid input string";
        }
        char v8 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v9 = *MEMORY[0x1E4F1C3C8];
        uint64_t v10 = [NSString stringWithFormat:@"Malformed string (%@)", v7];
        objc_msgSend(a2, "setValue:forKey:", objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a1, @"Bad string")), @"NSUnderlyingException");
        return 0;
      }
    }
    else
    {
      MEMORY[0x1F4188790](0);
      uint64_t v12 = (UniChar *)((char *)v20 - v11);
      if (Length >= 256) {
        uint64_t v12 = (UniChar *)malloc_type_malloc(4 * Length, 0x9C60114FuLL);
      }
      v21.location = 0;
      v21.length = Length;
      CFStringGetCharacters(a1, v21, v12);
      int v13 = CFStringEncodingUnicodeToBytes();
      if (v13)
      {
        if (v13 == 1) {
          uint64_t v14 = @"Invalid input string";
        }
        else {
          uint64_t v14 = @"Unknown error during string conversion";
        }
        if (Length >= 256) {
          free(v12);
        }
        unsigned int v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        uint64_t v17 = [NSString stringWithFormat:@"Malformed string 2 (%@)", v14];
        objc_msgSend(a2, "setValue:forKey:", objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", a1, @"Bad string")), @"NSUnderlyingException");
        return 0;
      }
      if (Length >= 256) {
        free(v12);
      }
    }
    if (Length < 2) {
      uint64_t v18 = &stru_1ED787880;
    }
    else {
      uint64_t v18 = (__CFString *)[(__CFString *)a1 substringToIndex:Length - 1];
    }
    int v19 = [(__CFString *)a1 characterAtIndex:Length - 1];
    uint64_t result = 0;
    if (v19 != 55295 && v19 != 57343 && v19 != 0xFFFF) {
      return [[NSString alloc] initWithFormat:@"%@%C", v18, (unsigned __int16)(v19 + 1)];
    }
  }
  return result;
}

- (void)_generateSQLForConst:(uint64_t)a1 inAttribute:(uint64_t)a2 expression:(uint64_t)a3 inContext:(uint64_t)a4
{
  uint64_t v7 = [(NSSQLExpressionIntermediate *)[NSSQLKeypathExpressionIntermediate alloc] initWithExpression:a3 allowToMany:0 inScope:a1];
  id v8 = [(NSSQLKeypathExpressionIntermediate *)v7 generateSQLStringInContext:a4];

  if (!v8) {
    return 0;
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "predicateOperator"), "options");
  unsigned int v10 = v9;
  uint64_t v11 = (v9 << 63 >> 63) & 0x101;
  if ((v9 & 2) != 0) {
    uint64_t v11 = (v9 << 63 >> 63) & 1 | 0x180;
  }
  if ((v9 & 8) != 0) {
    v11 |= 0x120uLL;
  }
  if ((v9 & 4) != 0) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = v11;
  }
  int v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @" NSCoreDataStringSearch(");
  [v13 appendString:v8];

  uint64_t v14 = [[NSSQLForeignKeyIntermediate alloc] initWithConstantValue:a2 inScope:a1];
  id v15 = [(NSSQLForeignKeyIntermediate *)v14 generateSQLStringInContext:a4];
  [v13 appendString:@", "];
  [v13 appendString:v15];
  [v13 appendString:@", "];
  [v13 appendFormat:@"%lu, %u"], v12, (v10 >> 3) & 1);

  return v13;
}

- (void)_generateSQLBetweenStringInContext:(uint64_t)a1
{
  v51[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  objc_super v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v3 expressionType];
  id v6 = *(id *)(a1 + 24);
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)(a1 + 24) = v6;
  }
  [v6 addObject:v3];
  if (v5)
  {
    if (([(id)objc_opt_class() isSimpleKeypath:v3] & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v3))
    {
      if (v5 != 4 || sel_indexed_by_ != (char *)[*(id *)(a1 + 32) selector])
      {
        [*(id *)(a1 + 24) removeLastObject];
        uint64_t v7 = 0;
        goto LABEL_45;
      }
      uint64_t v36 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "arguments"), "lastObject");
      v51[0] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "arguments"), "firstObject");
      uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      uint64_t v50 = *(void *)(a1 + 40);
      id v38 = -[NSSQLRTreeIndexQueryIntermediate initForIndexNamed:onEntity:properties:ranges:inScope:]([NSSQLRTreeIndexQueryIntermediate alloc], "initForIndexNamed:onEntity:properties:ranges:inScope:", v36, [*(id *)(a1 + 8) governingEntity], v37, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v50, 1), *(void *)(a1 + 8));
      uint64_t v7 = (void *)[v38 generateSQLStringInContext:a2];

      v34 = *(void **)(a1 + 24);
      goto LABEL_53;
    }
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
    uint64_t v8 = [(id)a1 _generateSQLForKeyPathExpression:v3 allowToMany:0 inContext:a2];
    if (!v8)
    {
LABEL_46:

      return 0;
    }
    uint64_t v9 = (void *)v8;
    [v7 appendString:v8];
  }
  else
  {
    unsigned int v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
    [*(id *)(a1 + 24) addObject:a1];
    uint64_t v11 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", [v3 constantValue], a1, a2);
    id v12 = [(NSSQLConstantValueIntermediate *)v11 generateSQLStringInContext:a2];
    [v10 appendString:v12];

    uint64_t v7 = v10;
    [*(id *)(a1 + 24) removeLastObject];
  }
  [v7 appendString:@" BETWEEN "];
  uint64_t v13 = [v4 expressionType];
  if (!v13)
  {
    v25 = (void *)[v4 constantValue];
    if ([v25 count] != 2) {
      goto LABEL_44;
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (!v26) {
      goto LABEL_44;
    }
    uint64_t v27 = v26;
    uint64_t v28 = a1;
    uint64_t v29 = *(void *)v41;
    char v30 = 1;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v25);
        }
        uint64_t v32 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", [*(id *)(*((void *)&v40 + 1) + 8 * i) constantValue], v28, a2);
        id v33 = [(NSSQLConstantValueIntermediate *)v32 generateSQLStringInContext:a2];
        [v7 appendString:v33];

        if (v30) {
          [v7 appendString:@" AND "];
        }
        char v30 = 0;
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
      char v30 = 0;
    }
    while (v27);
    [v7 appendString:@""]);
    v34 = *(void **)(v28 + 24);
LABEL_53:
    [v34 removeLastObject];
    return v7;
  }
  if (v13 != 14
    || (uint64_t v14 = (void *)[v4 constantValue], objc_msgSend(v14, "count") != 2)
    || (long long v46 = 0u,
        long long v47 = 0u,
        long long v44 = 0u,
        long long v45 = 0u,
        (uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16]) == 0))
  {
LABEL_44:
    [v7 appendString:@""]);
    [*(id *)(a1 + 24) removeLastObject];
LABEL_45:
    [a2 setObject:objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Unimplemented SQL generation for predicate : (%@)", *(void *)(a1 + 16)), 0), @"NSUnderlyingException" forKey];
    goto LABEL_46;
  }
  uint64_t v16 = v15;
  int v17 = 0;
  char v18 = 0;
  uint64_t v19 = *(void *)v45;
  do
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v45 != v19) {
        objc_enumerationMutation(v14);
      }
      CFRange v21 = *(void **)(*((void *)&v44 + 1) + 8 * j);
      if ([v21 expressionType])
      {
        if (([(id)objc_opt_class() isSimpleKeypath:v21] & 1) == 0
          && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:](a1, v21))
        {
          int v17 = -12;
          continue;
        }
        uint64_t v22 = [(id)a1 _generateSQLForKeyPathExpression:v21 allowToMany:0 inContext:a2];
        if (!v22) {
          goto LABEL_46;
        }
        uint64_t v23 = (NSSQLConstantValueIntermediate *)v22;
        [v7 appendString:v22];
      }
      else
      {
        uint64_t v23 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:]([NSSQLConstantValueIntermediate alloc], "initWithConstantValue:inScope:context:", [v21 constantValue], a1, a2);
        id v24 = [(NSSQLConstantValueIntermediate *)v23 generateSQLStringInContext:a2];
        [v7 appendString:v24];
      }
      if (v17)
      {
        char v18 = 1;
      }
      else
      {
        [v7 appendString:@" AND "];
        char v18 = 1;
        int v17 = 1;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
  }
  while (v16);
  [v7 appendString:@""]);
  [*(id *)(a1 + 24) removeLastObject];
  if (v17 <= 0 && (v18 & 1) == 0) {
    goto LABEL_45;
  }
  return v7;
}

- (id)_generateSQLBoundByStringInContext:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if ([*(id *)(a1 + 32) expressionType] != 3)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    CFRange v21 = @"Unsupported predicate, LHS of boundedBy: must be a keypath";
    goto LABEL_27;
  }
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "keyPath"), "componentsSeparatedByString:", @".");
  if (!v4 || (uint64_t v5 = v4, ![v4 count]))
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    CFRange v21 = @"Unsupported predicate, LHS of boundedBy: is a bad keypath a keypath";
    goto LABEL_27;
  }
  id v6 = (void *)[(id)a1 governingEntityForKeypathExpression:*(void *)(a1 + 32)];
  uint64_t v7 = [v5 count];
  uint64_t v8 = [v6 entityDescription];
  if (!v7)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    CFRange v21 = @"Unsupported predicate, LHS of boundedBy: can't find location attribute";
LABEL_27:
    uint64_t v22 = [v19 exceptionWithName:v20 reason:v21 userInfo:0];
    uint64_t v23 = a2;
LABEL_28:
    [v23 setObject:v22 forKey:@"NSUnderlyingException"];
    return 0;
  }
  uint64_t v9 = (void *)v8;
  v34 = a2;
  unsigned int v10 = 0;
  uint64_t v11 = 0;
  uint64_t v35 = v7 - 1;
  do
  {
    uint64_t v12 = [v5 objectAtIndex:v11];
    if (!v9 || (uint64_t v13 = objc_msgSend((id)objc_msgSend(v9, "propertiesByName"), "objectForKey:", v12)) == 0)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      uint64_t v30 = [NSString stringWithFormat:@"Unsupported predicate, LHS of boundedBy: has a keypath (can't find %@)", v12];
LABEL_35:
      uint64_t v27 = (__CFString *)v30;
      v25 = v28;
      uint64_t v26 = v29;
      goto LABEL_38;
    }
    uint64_t v14 = v13;
    uint64_t v15 = [v13 _propertyType];
    if (![v14 _isAttribute])
    {
      if (v15 != 4)
      {
        v25 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v26 = *MEMORY[0x1E4F1C3C8];
        uint64_t v27 = @"Unsupported predicate, LHS of boundedBy: does not terminate with a location";
        goto LABEL_38;
      }
      uint64_t v9 = (void *)[v14 destinationEntity];
      goto LABEL_20;
    }
    if (v35 != v11)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v29 = *MEMORY[0x1E4F1C3C8];
      uint64_t v30 = [NSString stringWithFormat:@"Malformed keypath: non-terminal attribute %@", v12];
      goto LABEL_35;
    }
    if ([v14 attributeType])
    {
      v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3C8];
      uint64_t v27 = @"Unsupported predicate, LHS of boundedBy: does not terminate with a location attribute";
      goto LABEL_38;
    }
    unsigned int v10 = objc_msgSend((id)objc_msgSend(v14, "userInfo"), "objectForKey:", @"_NSLocationAttributeDerivedComponents");
    if (([v10 isNSArray] & 1) == 0)
    {
      if (![v10 isNSString]) {
        goto LABEL_32;
      }
      unsigned int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "description"), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_1ED787880), "componentsSeparatedByString:", @",");
    }
    if (!v10 || [v10 count] != 2)
    {
LABEL_32:
      v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3C8];
      uint64_t v27 = @"Bad LHS attribute, missing derived lat/long names";
LABEL_38:
      uint64_t v22 = [v25 exceptionWithName:v26 reason:v27 userInfo:0];
      uint64_t v23 = v34;
      goto LABEL_28;
    }
LABEL_20:
    ++v11;
  }
  while (v7 != v11);
  uint64_t v16 = -[NSSQLBoundedByIntermediate initWithWorkingEntity:target:bounds:scope:]([NSSQLBoundedByIntermediate alloc], "initWithWorkingEntity:target:bounds:scope:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v34, "objectForKey:", @"persistentStore"), "model"), "entityNamed:", objc_msgSend(v9, "name")), v14, *(void *)(a1 + 40), a1);
  id v17 = [(NSSQLBoundedByIntermediate *)v16 generateSQLStringInContext:v34];

  if (!v17) {
    return 0;
  }
  if (v7 == 1)
  {
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@.Z_PK IN ", objc_msgSend((id)a1, "governingAliasForKeypathExpression:", *(void *)(a1 + 32))];
    if (!v18) {
      goto LABEL_44;
    }
LABEL_43:
    [v18 appendFormat:@"(%@) ", v17];
    goto LABEL_44;
  }
  uint64_t v31 = [(id)objc_msgSend((id)objc_msgSend(v5 subarrayWithRange:0, v35), "componentsJoinedByString:", @".", "stringByAppendingFormat:", @".%@", objc_msgSend(v10, "firstObject")];
  uint64_t v32 = -[NSSQLExpressionIntermediate initWithExpression:allowToMany:inScope:]([NSSQLKeypathExpressionIntermediate alloc], "initWithExpression:allowToMany:inScope:", [MEMORY[0x1E4F28C68] expressionForKeyPath:v31], 1, a1);
  id v33 = v32;
  if (v32) {
    *(&v32->super._allowToMany + 1) = 1;
  }
  id v18 = [(NSSQLKeypathExpressionIntermediate *)v32 generateSQLStringInContext:v34];

  if (v18)
  {
    [v18 appendString:@" IN "];
    goto LABEL_43;
  }
LABEL_44:

  return v18;
}

@end
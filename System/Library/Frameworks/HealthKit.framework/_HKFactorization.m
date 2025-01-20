@interface _HKFactorization
+ (BOOL)supportsSecureCoding;
+ (_HKFactorization)factorizationWithFactor:(id)a3 exponent:(int64_t)a4;
+ (_HKFactorization)factorizationWithFactorsAndExponents:(id)a3;
+ (id)factorization;
+ (id)factorizationFromString:(id)a3 factorGrammar:(id)a4;
- (BOOL)isEqual:(id)a3;
- (_HKFactorization)init;
- (_HKFactorization)initWithCoder:(id)a3;
- (id)anyFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)factorizationByDividing:(id)a3;
- (id)factorizationByMultiplying:(id)a3;
- (id)factorizationByRaisingToExponent:(int64_t)a3;
- (id)reciprocal;
- (id)unitString;
- (int64_t)_exponentForFactor:(id)a3;
- (int64_t)exponentForFactor:(id)a3;
- (unint64_t)factorCount;
- (unint64_t)hash;
- (void)_enumerateFactorsWithHandler:(id)a3;
- (void)_multiplyByFactor:(id)a3 exponent:(int64_t)a4;
- (void)_multiplyByFactorization:(id)a3;
- (void)_raiseToExponent:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateFactorsWithHandler:(id)a3;
@end

@implementation _HKFactorization

- (BOOL)isEqual:(id)a3
{
  v4 = (_HKFactorization *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSMapTable *)self->_factors isEqual:v4->_factors];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (void)enumerateFactorsWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v5 = [(NSMapTable *)self->_factors keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      v11 = [(NSMapTable *)self->_factors objectForKey:v10];
      v4[2](v4, v10, [v11 integerValue], &v16);

      if (v16) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (int64_t)_exponentForFactor:(id)a3
{
  v3 = [(NSMapTable *)self->_factors objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)unitString
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v3 = [MEMORY[0x1E4F28E78] string];
  int64_t v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __30___HKFactorization_unitString__block_invoke;
  long long v14 = &unk_1E58C4688;
  v17 = &v23;
  id v5 = v3;
  id v15 = v5;
  uint64_t v18 = &v19;
  id v6 = v4;
  id v16 = v6;
  [(_HKFactorization *)self enumerateFactorsWithHandler:&v11];
  uint64_t v7 = v20[3];
  if (v24[3])
  {
    if (v7)
    {
      uint64_t v8 = [NSString stringWithFormat:@"%@/%@", v5, v6, v11, v12, v13, v14, v15];
    }
    else
    {
      uint64_t v8 = (__CFString *)v5;
    }
    goto LABEL_7;
  }
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"1/%@", v6];
LABEL_7:
    uint64_t v9 = v8;
    goto LABEL_8;
  }
  uint64_t v9 = @"()";
LABEL_8:

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

+ (id)factorizationFromString:(id)a3 factorGrammar:(id)a4
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_FactorizationGrammarWithFactorGrammar_lock);
  uint64_t v7 = (void *)_FactorizationGrammarWithFactorGrammar_cache;
  if (!_FactorizationGrammarWithFactorGrammar_cache)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v9 = (void *)_FactorizationGrammarWithFactorGrammar_cache;
    _FactorizationGrammarWithFactorGrammar_cache = v8;

    uint64_t v7 = (void *)_FactorizationGrammarWithFactorGrammar_cache;
  }
  uint64_t v10 = [v7 objectForKey:v6];
  if (!v10)
  {
    id v27 = v6;
    uint64_t v11 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"Q"];
    uint64_t v12 = +[_HKCFGNonTerminal nonTerminalWithLabel:@"P"];
    long long v13 = [v27 rootNonTerminal];

    uint64_t v26 = +[_HKCFGTerminal terminalMatchingCharacterInString:@"*.·"];
    long long v14 = +[_HKCFGTerminal terminalMatchingAnyInteger];
    [v11 addReplacementRuleWithExpressions:&unk_1EECE6C78 nodeEvaluator:&__block_literal_global_70];
    v35[0] = CFSTR("(");
    v35[1] = v11;
    v35[2] = @"");
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    [v11 addReplacementRuleWithExpressions:v15 nodeEvaluator:&__block_literal_global_122];

    v34 = v12;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v11 addReplacementRuleWithExpressions:v16 nodeEvaluator:&__block_literal_global_124_1];

    v33[0] = v12;
    v33[1] = @"/";
    v33[2] = v12;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
    [v11 addReplacementRuleWithExpressions:v17 nodeEvaluator:&__block_literal_global_129];

    [v12 addReplacementRuleWithExpressions:&unk_1EECE6C90 nodeEvaluator:&__block_literal_global_137];
    v32 = v13;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v12 addReplacementRuleWithExpressions:v18 nodeEvaluator:&__block_literal_global_139];

    v31[0] = v13;
    v31[1] = @"^";
    v31[2] = v14;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
    [v12 addReplacementRuleWithExpressions:v19 nodeEvaluator:&__block_literal_global_144];

    v30[0] = CFSTR("(");
    v30[1] = v12;
    v30[2] = @"");
    v30[3] = @"^";
    v30[4] = v14;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    [v12 addReplacementRuleWithExpressions:v20 nodeEvaluator:&__block_literal_global_146];

    v29[0] = CFSTR("(");
    v29[1] = v12;
    v29[2] = @"");
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    [v12 addReplacementRuleWithExpressions:v21 nodeEvaluator:&__block_literal_global_148];

    v28[0] = v12;
    v28[1] = v26;
    v28[2] = v12;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
    [v12 addReplacementRuleWithExpressions:v22 nodeEvaluator:&__block_literal_global_150];

    uint64_t v10 = +[_HKContextFreeGrammar grammarWithRootNonTerminal:v11 emptyStringEvaluator:&__block_literal_global_154];

    [(id)_FactorizationGrammarWithFactorGrammar_cache setObject:v10 forKey:v27];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_FactorizationGrammarWithFactorGrammar_lock);

  uint64_t v23 = [v10 parseTreeForString:v5];
  if (!v23) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unable to parse factorization string %@", v5 format];
  }
  v24 = [v23 evaluate];

  return v24;
}

+ (_HKFactorization)factorizationWithFactor:(id)a3 exponent:(int64_t)a4
{
  return (_HKFactorization *)objc_msgSend(a1, "factorizationWithFactorsAndExponents:", a3, a4, 0);
}

+ (_HKFactorization)factorizationWithFactorsAndExponents:(id)a3
{
  id v4 = a3;
  id v5 = [a1 factorization];
  uint64_t v12 = &v14;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6;
    do
    {
      [v5 _multiplyByFactor:v8 exponent:*v12];
      uint64_t v9 = (id *)(v12 + 1);
      v12 += 2;
      id v10 = *v9;

      uint64_t v8 = v10;
    }
    while (v10);
  }

  return (_HKFactorization *)v5;
}

+ (id)factorization
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (_HKFactorization)init
{
  v6.receiver = self;
  v6.super_class = (Class)_HKFactorization;
  id v2 = [(_HKFactorization *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    factors = v2->_factors;
    v2->_factors = (NSMapTable *)v3;
  }
  return v2;
}

- (void)_multiplyByFactor:(id)a3 exponent:(int64_t)a4
{
  id v9 = a3;
  int64_t v6 = -[_HKFactorization _exponentForFactor:](self, "_exponentForFactor:");
  factors = self->_factors;
  if (v6 + a4)
  {
    uint64_t v8 = [NSNumber numberWithInteger:v6 + a4];
    [(NSMapTable *)factors setObject:v8 forKey:v9];
  }
  else
  {
    [(NSMapTable *)factors removeObjectForKey:v9];
  }
}

- (unint64_t)factorCount
{
  return [(NSMapTable *)self->_factors count];
}

- (id)anyFactor
{
  id v2 = [(NSMapTable *)self->_factors keyEnumerator];
  uint64_t v3 = [v2 nextObject];

  return v3;
}

- (int64_t)exponentForFactor:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_factors objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33___HKFactorization_copyWithZone___block_invoke;
  v7[3] = &unk_1E58C4638;
  id v5 = v4;
  id v8 = v5;
  [(_HKFactorization *)self enumerateFactorsWithHandler:v7];

  return v5;
}

- (id)factorizationByDividing:(id)a3
{
  int64_t v4 = [a3 reciprocal];
  id v5 = [(_HKFactorization *)self factorizationByMultiplying:v4];

  return v5;
}

- (id)reciprocal
{
  return [(_HKFactorization *)self factorizationByRaisingToExponent:-1];
}

- (id)factorizationByRaisingToExponent:(int64_t)a3
{
  int64_t v4 = (void *)[(_HKFactorization *)self copy];
  [v4 _raiseToExponent:a3];

  return v4;
}

- (void)_raiseToExponent:(int64_t)a3
{
  factors = self->_factors;
  if (a3)
  {
    int64_t v6 = (void *)[(NSMapTable *)factors copy];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37___HKFactorization__raiseToExponent___block_invoke;
    v10[3] = &unk_1E58C46D8;
    uint64_t v7 = v6;
    uint64_t v11 = v7;
    int64_t v12 = a3;
    [(_HKFactorization *)self enumerateFactorsWithHandler:v10];
    id v8 = self->_factors;
    self->_factors = v7;
    id v9 = v7;
  }
  else
  {
    [(NSMapTable *)factors removeAllObjects];
  }
}

- (id)factorizationByMultiplying:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(_HKFactorization *)self copy];
  [v5 _multiplyByFactorization:v4];

  return v5;
}

- (void)_multiplyByFactorization:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45___HKFactorization__multiplyByFactorization___block_invoke;
  v3[3] = &unk_1E58C4638;
  v3[4] = self;
  [a3 enumerateFactorsWithHandler:v3];
}

- (unint64_t)hash
{
  uint64_t v5 = 0;
  int64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24___HKFactorization_hash__block_invoke;
  v4[3] = &unk_1E58C4660;
  v4[4] = &v5;
  [(_HKFactorization *)self _enumerateFactorsWithHandler:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_enumerateFactorsWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void *, char *))a3;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_factors keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      uint64_t v11 = [(NSMapTable *)self->_factors objectForKey:v10];
      v4[2](v4, v10, v11, &v16);

      if (v16) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __36___HKFactorization_encodeWithCoder___block_invoke;
  long long v13 = &unk_1E58C46B0;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_HKFactorization *)self _enumerateFactorsWithHandler:&v10];
  objc_msgSend(v5, "encodeObject:forKey:", v9, @"HKFactorizationFactorsKey", v10, v11, v12, v13);
  [v5 encodeObject:v8 forKey:@"HKFactorizationExponentsKey"];
}

- (_HKFactorization)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allowedClasses];
  uint64_t v6 = [v5 setByAddingObject:objc_opt_class()];

  uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"HKFactorizationFactorsKey"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"HKFactorizationExponentsKey"];
  uint64_t v12 = [v7 count];
  if (v12 != [v11 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498] format:@"_HKFactorization unequal number of factors and exponents"];
  }
  long long v13 = [(_HKFactorization *)self init];
  if (v13)
  {
    uint64_t v25 = v7;
    id v14 = [v7 objectEnumerator];
    id v15 = [v11 objectEnumerator];
    uint64_t v16 = [v14 nextObject];
    if (v16)
    {
      v17 = (void *)v16;
      uint64_t v23 = v6;
      id v24 = v4;
      uint64_t v18 = 0;
      uint64_t v19 = *MEMORY[0x1E4F28488];
      do
      {
        v20 = v18;
        uint64_t v18 = [v15 nextObject];

        if (!v18) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v19, @"_HKFactorization exponent is not of class NSNumber: %@", v18 format];
        }
        -[_HKFactorization _multiplyByFactor:exponent:](v13, "_multiplyByFactor:exponent:", v17, [v18 integerValue]);
        uint64_t v21 = [v14 nextObject];

        v17 = (void *)v21;
      }
      while (v21);

      uint64_t v6 = v23;
      id v4 = v24;
    }

    uint64_t v7 = v25;
  }

  return v13;
}

@end
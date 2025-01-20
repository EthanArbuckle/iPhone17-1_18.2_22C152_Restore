@interface _HKCFGReplacementRule
+ (_HKCFGReplacementRule)ruleWithLHS:(id)a3 RHS:(id)a4 nodeEvaluator:(id)a5;
- (NSArray)rightHandSide;
- (id)description;
- (id)nodeEvaluator;
- (unint64_t)lengthIncrease;
- (void)setRightHandSide:(id)a3;
@end

@implementation _HKCFGReplacementRule

- (unint64_t)lengthIncrease
{
  return self->_lengthIncrease;
}

- (NSArray)rightHandSide
{
  return self->_rightHandSide;
}

- (id)nodeEvaluator
{
  return self->_nodeEvaluator;
}

+ (_HKCFGReplacementRule)ruleWithLHS:(id)a3 RHS:(id)a4 nodeEvaluator:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 count])
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:a1 file:@"_HKContextFreeGrammar.m" lineNumber:270 description:@"Replacement rule must have at least one expression on the right-hand side"];
  }
  id v11 = objc_alloc_init((Class)a1);
  v44 = v10;
  uint64_t v12 = [v10 copy];
  v13 = (void *)*((void *)v11 + 3);
  v43 = v11;
  *((void *)v11 + 3) = v12;

  v14 = [MEMORY[0x1E4F1CA48] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v55;
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v14 addObject:v21];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = +[_HKCFGTerminal terminalMatchingString:v21];
            [v14 addObject:v22];
          }
          else
          {
            [MEMORY[0x1E4F1CA00] raise:v19, @"Invalid expression in replacement rule: %@", v21 format];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v17);
  }

  v23 = v11;
  objc_storeStrong((id *)v11 + 2, v14);
  v24 = (void *)MEMORY[0x1E4F28E78];
  v25 = [v45 _label];
  v26 = [v24 stringWithFormat:@"%@ -> ", v25];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = v14;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = [*(id *)(*((void *)&v50 + 1) + 8 * j) _label];
        [v26 appendString:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v29);
  }

  uint64_t v33 = [v26 copy];
  v34 = (void *)v43[1];
  v43[1] = v33;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v35 = v27;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = 0;
    uint64_t v39 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(v35);
        }
        v38 += [*(id *)(*((void *)&v46 + 1) + 8 * k) _minimumLength];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v37);
  }
  else
  {
    uint64_t v38 = 0;
  }

  v43[4] = v38 - [v45 _minimumLength];

  return (_HKCFGReplacementRule *)v23;
}

- (id)description
{
  return self->_description;
}

- (void)setRightHandSide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nodeEvaluator, 0);
  objc_storeStrong((id *)&self->_rightHandSide, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

@end
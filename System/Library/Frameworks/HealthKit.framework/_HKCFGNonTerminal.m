@interface _HKCFGNonTerminal
+ (id)nonTerminalWithLabel:(id)a3;
- (BOOL)_tryNodesForExpressions:(id)a3 nodes:(id)a4 context:(id)a5 solutionTest:(id)a6;
- (NSCharacterSet)charactersToBeSkipped;
- (_HKCFGNonTerminal)initWithLabel:(id)a3;
- (id)_label;
- (id)_parseTreeWithContext:(id)a3;
- (id)_replacementRules;
- (unint64_t)_minimumLength;
- (void)_checkForCycles;
- (void)_checkForCycles:(id)a3;
- (void)_invalidate;
- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4;
- (void)addReplacementRuleWithExpressions:(id)a3 nodeEvaluator:(id)a4;
- (void)setCharactersToBeSkipped:(id)a3;
@end

@implementation _HKCFGNonTerminal

- (id)_parseTreeWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43___HKCFGNonTerminal__parseTreeWithContext___block_invoke;
  v8[3] = &unk_1E58C08E0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(_HKCFGNonTerminal *)self _tryNodesWithContext:v5 solutionTest:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (uint64_t (**)(id, void *))a4;
  v30 = [v5 scanner];
  uint64_t v29 = [v30 scanLocation];
  v7 = [v5 cache];
  v26 = objc_msgSend(v7, "nodesForPosition:nonTerminal:withLengthAllowance:", v29, self, objc_msgSend(v5, "lengthAllowance"));

  if (v26)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v8 = v26;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v49;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v5, "scanner", v26);
        uint64_t v14 = [v12 rangeOfString];
        [v13 setScanLocation:v14 + v15];

        if (v6[2](v6, v12)) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v53 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    [v30 setCharactersToBeSkipped:self->_charactersToBeSkipped];
    long long v43 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    id v16 = self->_replacementRules;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v41;
      v27 = v32;
LABEL_13:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v41 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v40 + 1) + 8 * v19);
        unint64_t v21 = objc_msgSend(v5, "lengthAllowance", v26, v27);
        if (v21 >= [v20 lengthIncrease])
        {
          objc_msgSend(v5, "decreaseLengthAllowance:", objc_msgSend(v20, "lengthIncrease"));
          [v5 incrementRecursiveDepth];
          v22 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v23 = [v20 rightHandSide];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v32[0] = __55___HKCFGNonTerminal__tryNodesWithContext_solutionTest___block_invoke;
          v32[1] = &unk_1E58C0890;
          uint64_t v39 = v29;
          id v33 = v30;
          id v24 = v22;
          id v34 = v24;
          v35 = v20;
          id v36 = v8;
          v38 = &v44;
          v37 = v6;
          [(_HKCFGNonTerminal *)self _tryNodesForExpressions:v23 nodes:v24 context:v5 solutionTest:v31];

          objc_msgSend(v5, "increaseLengthAllowance:", objc_msgSend(v20, "lengthIncrease"));
          [v5 decrementRecursiveDepth];
          LOBYTE(v23) = *((unsigned char *)v45 + 24) == 0;

          if ((v23 & 1) == 0) {
            break;
          }
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v40 objects:v52 count:16];
          if (v17) {
            goto LABEL_13;
          }
          break;
        }
      }
    }

    v25 = [v5 cache];
    objc_msgSend(v25, "cacheNodes:forPosition:nonTerminal:lengthAllowance:", v8, v29, self, objc_msgSend(v5, "lengthAllowance"));

    _Block_object_dispose(&v44, 8);
  }

  [v30 setScanLocation:v29];
}

- (BOOL)_tryNodesForExpressions:(id)a3 nodes:(id)a4 context:(id)a5 solutionTest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (uint64_t (**)(void))a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  unint64_t v14 = [v11 count];
  if (v14 >= [v10 count])
  {
    char v16 = v13[2](v13);
    *((unsigned char *)v26 + 24) = v16;
  }
  else
  {
    uint64_t v15 = [v10 objectAtIndexedSubscript:v14];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72___HKCFGNonTerminal__tryNodesForExpressions_nodes_context_solutionTest___block_invoke;
    v18[3] = &unk_1E58C08B8;
    id v24 = &v25;
    id v19 = v11;
    v20 = self;
    id v21 = v10;
    id v22 = v12;
    uint64_t v23 = v13;
    [v15 _tryNodesWithContext:v22 solutionTest:v18];

    char v16 = *((unsigned char *)v26 + 24) != 0;
  }
  _Block_object_dispose(&v25, 8);

  return v16;
}

+ (id)nonTerminalWithLabel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithLabel:v4];

  return v5;
}

- (_HKCFGNonTerminal)initWithLabel:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKCFGNonTerminal;
  id v5 = [(_HKCFGNonTerminal *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    replacementRules = v5->_replacementRules;
    v5->_replacementRules = v8;

    uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    charactersToBeSkipped = v5->_charactersToBeSkipped;
    v5->_charactersToBeSkipped = (NSCharacterSet *)v10;
  }
  return v5;
}

- (void)addReplacementRuleWithExpressions:(id)a3 nodeEvaluator:(id)a4
{
  replacementRules = self->_replacementRules;
  id v5 = +[_HKCFGReplacementRule ruleWithLHS:self RHS:a3 nodeEvaluator:a4];
  [(NSMutableArray *)replacementRules addObject:v5];
}

- (id)_label
{
  return self->_label;
}

- (unint64_t)_minimumLength
{
  return 1;
}

- (id)_replacementRules
{
  return self->_replacementRules;
}

- (void)_checkForCycles
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  [(_HKCFGNonTerminal *)self _checkForCycles:v3];
}

- (void)_checkForCycles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 containsObject:self]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Grammar contains cycle involving non-terminal %@", self->_label format];
  }
  [v4 addObject:self];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_replacementRules;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) rightHandSide];
        if ([v10 count] == 1)
        {
          id v11 = [v10 objectAtIndexedSubscript:0];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            objc_super v13 = [v10 objectAtIndexedSubscript:0];
            [v13 _checkForCycles:v4];
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_invalidate
{
}

- (NSCharacterSet)charactersToBeSkipped
{
  return self->_charactersToBeSkipped;
}

- (void)setCharactersToBeSkipped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charactersToBeSkipped, 0);
  objc_storeStrong((id *)&self->_replacementRules, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
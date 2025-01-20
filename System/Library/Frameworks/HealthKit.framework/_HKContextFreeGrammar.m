@interface _HKContextFreeGrammar
+ (id)grammarWithRootNonTerminal:(id)a3;
+ (id)grammarWithRootNonTerminal:(id)a3 emptyStringEvaluator:(id)a4;
- (_HKCFGNonTerminal)rootNonTerminal;
- (_HKContextFreeGrammar)initWithRootNonTerminal:(id)a3 emptyStringEvaluator:(id)a4;
- (id)emptyStringEvaluator;
- (id)parseTreeForString:(id)a3;
- (void)_gatherExpressions;
- (void)_gatherExpressionsStartingAt:(id)a3;
- (void)invalidate;
@end

@implementation _HKContextFreeGrammar

- (id)parseTreeForString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4F28FE8] scannerWithString:v4];
    [v5 setCharactersToBeSkipped:0];
    uint64_t v6 = 0;
    if (([v5 isAtEnd] & 1) == 0)
    {
      uint64_t v6 = 0;
      do
      {
        [v5 scanUpToCharactersFromSet:self->_terminalCharacters intoString:0];
        terminalCharacters = self->_terminalCharacters;
        id v12 = 0;
        [v5 scanCharactersFromSet:terminalCharacters intoString:&v12];
        id v8 = v12;
        v6 += [v8 length];
      }
      while (![v5 isAtEnd]);
    }
    [v5 setScanLocation:0];
    v9 = [[_HKCFGParseContext alloc] initWithScanner:v5 lengthAllowance:v6];
    v10 = [(_HKCFGNonTerminal *)self->_rootNonTerminal _parseTreeWithContext:v9];
  }
  else if (self->_emptyStringEvaluator)
  {
    v10 = +[_HKCFGEmptyStringNode nodeWithEvaluator:](_HKCFGEmptyStringNode, "nodeWithEvaluator:");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)grammarWithRootNonTerminal:(id)a3
{
  return (id)[a1 grammarWithRootNonTerminal:a3 emptyStringEvaluator:0];
}

+ (id)grammarWithRootNonTerminal:(id)a3 emptyStringEvaluator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithRootNonTerminal:v7 emptyStringEvaluator:v6];

  return v8;
}

- (_HKContextFreeGrammar)initWithRootNonTerminal:(id)a3 emptyStringEvaluator:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_HKContextFreeGrammar;
  v9 = [(_HKContextFreeGrammar *)&v30 init];
  if (v9)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    nonTerminals = v9->_nonTerminals;
    v9->_nonTerminals = v10;

    id v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    terminals = v9->_terminals;
    v9->_terminals = v12;

    objc_storeStrong((id *)&v9->_rootNonTerminal, a3);
    uint64_t v14 = [v8 copy];
    id emptyStringEvaluator = v9->_emptyStringEvaluator;
    v9->_id emptyStringEvaluator = (id)v14;

    [(_HKContextFreeGrammar *)v9 _gatherExpressions];
    [(NSMutableSet *)v9->_nonTerminals makeObjectsPerformSelector:sel__checkForCycles];
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = v9->_terminals;
    uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v21), "characterSet", (void)v26);
          [v16 formUnionWithCharacterSet:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }

    uint64_t v23 = [v16 copy];
    terminalCharacters = v9->_terminalCharacters;
    v9->_terminalCharacters = (NSCharacterSet *)v23;
  }
  return v9;
}

- (void)invalidate
{
}

- (void)_gatherExpressions
{
}

- (void)_gatherExpressionsStartingAt:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(NSMutableSet *)self->_nonTerminals containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_nonTerminals addObject:v4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v4;
    id obj = [v4 _replacementRules];
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          v10 = [v9 rightHandSide];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v19;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v19 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [(_HKContextFreeGrammar *)self _gatherExpressionsStartingAt:v15];
                }
                else {
                  [(NSMutableSet *)self->_terminals addObject:v15];
                }
                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v12);
          }

          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    id v4 = v16;
  }
}

- (_HKCFGNonTerminal)rootNonTerminal
{
  return self->_rootNonTerminal;
}

- (id)emptyStringEvaluator
{
  return self->_emptyStringEvaluator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_emptyStringEvaluator, 0);
  objc_storeStrong((id *)&self->_rootNonTerminal, 0);
  objc_storeStrong((id *)&self->_terminalCharacters, 0);
  objc_storeStrong((id *)&self->_terminals, 0);

  objc_storeStrong((id *)&self->_nonTerminals, 0);
}

@end
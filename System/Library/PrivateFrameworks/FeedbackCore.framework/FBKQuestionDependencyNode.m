@interface FBKQuestionDependencyNode
- (BOOL)isVisibleInFormResponse:(id)a3;
- (FBKQuestionDependencyGraph)graph;
- (FBKQuestionDependencyNode)initWithQuestion:(id)a3;
- (NSHashTable)dependencyChildren;
- (NSNumber)questionID;
- (NSPredicate)visibilityPredicateTemplate;
- (NSSet)dependencyTats;
- (NSSet)dependentChildren;
- (NSString)tat;
- (id)_predicateFromLeafArray:(id)a3;
- (id)_substitutionFromToken:(id)a3;
- (id)dependentTatsForConditions:(id)a3;
- (id)predicateForConditions:(id)a3;
- (void)registerDependentChild:(id)a3;
- (void)setDependencyChildren:(id)a3;
- (void)setDependencyTats:(id)a3;
- (void)setGraph:(id)a3;
- (void)setVisibilityPredicateTemplate:(id)a3;
@end

@implementation FBKQuestionDependencyNode

- (FBKQuestionDependencyNode)initWithQuestion:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FBKQuestionDependencyNode;
  v5 = [(FBKQuestionDependencyNode *)&v22 init];
  if (v5)
  {
    v6 = [v4 role];
    uint64_t v7 = [v6 copy];
    tat = v5->_tat;
    v5->_tat = (NSString *)v7;

    v9 = [v4 conditions];
    v10 = [(FBKQuestionDependencyNode *)v5 dependentTatsForConditions:v9];

    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v11 = [MEMORY[0x263EFFA08] set];
    }
    dependencyTats = v5->_dependencyTats;
    v5->_dependencyTats = v11;

    v13 = [v4 conditions];
    uint64_t v14 = [(FBKQuestionDependencyNode *)v5 predicateForConditions:v13];
    visibilityPredicateTemplate = v5->_visibilityPredicateTemplate;
    v5->_visibilityPredicateTemplate = (NSPredicate *)v14;

    uint64_t v16 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    dependencyChildren = v5->_dependencyChildren;
    v5->_dependencyChildren = (NSHashTable *)v16;

    v18 = [v4 ID];
    uint64_t v19 = [v18 copy];
    questionID = v5->_questionID;
    v5->_questionID = (NSNumber *)v19;
  }
  return v5;
}

- (void)registerDependentChild:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKQuestionDependencyNode *)self dependencyChildren];
  [v5 addObject:v4];
}

- (NSSet)dependentChildren
{
  v2 = [(FBKQuestionDependencyNode *)self dependencyChildren];
  v3 = [v2 setRepresentation];

  return (NSSet *)v3;
}

- (BOOL)isVisibleInFormResponse:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v4 = [(FBKQuestionDependencyNode *)self graph];
  if (v4
    && ([(FBKQuestionDependencyNode *)self dependencyTats],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    v8 = [(FBKQuestionDependencyNode *)self dependencyTats];
    v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v26 = self;
    id obj = [(FBKQuestionDependencyNode *)self dependencyTats];
    uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v15 = [v4 tatToQuestionMap];
          uint64_t v16 = [v15 objectForKey:v14];

          if (!v16
            || ([v28 answerForQuestion:v16], (v17 = objc_claimAutoreleasedReturnValue()) == 0)
            || (v18 = v17,
                [v17 value],
                uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                v18,
                !v19))
          {
            uint64_t v19 = [MEMORY[0x263EFF9D0] null];
          }
          v20 = NSString;
          v21 = [v14 substringFromIndex:1];
          objc_super v22 = [v20 stringWithFormat:@"tat_%@", v21];
          [v9 setObject:v19 forKey:v22];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    v23 = [(FBKQuestionDependencyNode *)v26 visibilityPredicateTemplate];
    char v24 = [v23 evaluateWithObject:0 substitutionVariables:v9];
  }
  else
  {
    char v24 = 1;
  }

  return v24;
}

- (id)dependentTatsForConditions:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    v9 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 hasPrefix:@":"])
    {
      v9 = [MEMORY[0x263EFFA08] setWithObject:v4];
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = v4;
  if ([v6 count] == 1)
  {
    id v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [(FBKQuestionDependencyNode *)self dependentTatsForConditions:v7];

    if (v8) {
      [v5 unionSet:v8];
    }
  }
  else if ((unint64_t)[v6 count] >= 3)
  {
    uint64_t v10 = [v6 count];
    if (v10)
    {
      unint64_t v11 = v10;
      for (unint64_t i = 0; i < v11; i += 2)
      {
        v13 = [v6 objectAtIndexedSubscript:i];
        uint64_t v14 = [(FBKQuestionDependencyNode *)self dependentTatsForConditions:v13];

        if (v14) {
          [v5 unionSet:v14];
        }
      }
    }
  }
  v9 = (void *)[v5 copy];

LABEL_18:

  return v9;
}

- (id)predicateForConditions:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v9 = [MEMORY[0x263F08A98] predicateWithValue:1];
LABEL_18:
    v8 = (void *)v9;
    goto LABEL_19;
  }
  uint64_t v6 = [v4 count];
  id v7 = [v5 objectAtIndexedSubscript:0];
  if (v6 == 1)
  {
    v8 = [(FBKQuestionDependencyNode *)self predicateForConditions:v7];

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_17;
  }
  uint64_t v10 = [v5 objectAtIndexedSubscript:2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_17:
    uint64_t v9 = [(FBKQuestionDependencyNode *)self _predicateFromLeafArray:v5];
    goto LABEL_18;
  }
  unint64_t v12 = [v5 count];
  v13 = [v5 objectAtIndexedSubscript:0];
  v8 = [(FBKQuestionDependencyNode *)self predicateForConditions:v13];

  if (v12 >= 3)
  {
    unint64_t v14 = 2;
    unint64_t v15 = 0x263EFF000uLL;
    v25 = self;
    do
    {
      uint64_t v16 = objc_msgSend(v5, "objectAtIndexedSubscript:", v14 - 1, v25);
      v17 = [v5 objectAtIndexedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [(FBKQuestionDependencyNode *)self predicateForConditions:v17];
        if ([v16 isEqualToString:@":or"]) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 1;
        }
        unint64_t v20 = v12;
        id v21 = objc_alloc(MEMORY[0x263F08730]);
        v26[0] = v8;
        v26[1] = v18;
        objc_super v22 = [*(id *)(v15 + 2240) arrayWithObjects:v26 count:2];
        uint64_t v23 = [v21 initWithType:v19 subpredicates:v22];

        unint64_t v15 = 0x263EFF000;
        v8 = (void *)v23;
        unint64_t v12 = v20;
        self = v25;
      }

      v14 += 2;
    }
    while (v14 < v12);
  }
LABEL_19:

  return v8;
}

- (id)_substitutionFromToken:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 hasPrefix:@":"])
  {
    id v4 = NSString;
    id v5 = [v3 substringFromIndex:1];
    uint64_t v6 = [v4 stringWithFormat:@"$tat_%@", v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_predicateFromLeafArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v4 objectAtIndexedSubscript:1];
  uint64_t v7 = [v4 objectAtIndexedSubscript:2];

  v8 = [(FBKQuestionDependencyNode *)self _substitutionFromToken:v5];
  uint64_t v9 = [(FBKQuestionDependencyNode *)self _substitutionFromToken:v7];
  uint64_t v10 = (void *)v9;
  unint64_t v11 = @"%@";
  if (v8) {
    unint64_t v12 = v8;
  }
  else {
    unint64_t v12 = @"%@";
  }
  if (v9) {
    unint64_t v11 = (__CFString *)v9;
  }
  v13 = v11;
  unint64_t v14 = (objc_class *)MEMORY[0x263EFF980];
  unint64_t v15 = v12;
  uint64_t v16 = (void *)[[v14 alloc] initWithCapacity:2];
  v17 = v16;
  if (v8)
  {
    if (v10) {
      goto LABEL_8;
    }
  }
  else
  {
    [v16 addObject:v5];
    if (v10) {
      goto LABEL_8;
    }
  }
  [v17 addObject:v7];
LABEL_8:
  v25 = (void *)v7;
  v18 = [v6 substringFromIndex:1];
  uint64_t v19 = [v18 uppercaseString];

  v26 = (void *)v5;
  if ([(__CFString *)v19 isEqualToString:@"IS"])
  {

    uint64_t v19 = @"==";
  }
  unint64_t v20 = [NSString stringWithFormat:@"(%@ %@ %@)", v15, v19, v13];
  id v21 = (void *)MEMORY[0x263F08A98];
  objc_super v22 = (void *)[v17 copy];
  uint64_t v23 = [v21 predicateWithFormat:v20 argumentArray:v22];

  return v23;
}

- (FBKQuestionDependencyGraph)graph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_graph);

  return (FBKQuestionDependencyGraph *)WeakRetained;
}

- (void)setGraph:(id)a3
{
}

- (NSNumber)questionID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tat
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)dependencyTats
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDependencyTats:(id)a3
{
}

- (NSHashTable)dependencyChildren
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDependencyChildren:(id)a3
{
}

- (NSPredicate)visibilityPredicateTemplate
{
  return (NSPredicate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVisibilityPredicateTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityPredicateTemplate, 0);
  objc_storeStrong((id *)&self->_dependencyChildren, 0);
  objc_storeStrong((id *)&self->_dependencyTats, 0);
  objc_storeStrong((id *)&self->_tat, 0);
  objc_storeStrong((id *)&self->_questionID, 0);

  objc_destroyWeak((id *)&self->_graph);
}

@end
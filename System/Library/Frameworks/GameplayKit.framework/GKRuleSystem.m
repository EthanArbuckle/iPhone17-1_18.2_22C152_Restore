@interface GKRuleSystem
- (GKRuleSystem)init;
- (NSArray)agenda;
- (NSArray)executed;
- (NSArray)facts;
- (NSArray)rules;
- (NSMutableDictionary)state;
- (float)gradeForFact:(id)fact;
- (float)maximumGradeForFacts:(NSArray *)facts;
- (float)minimumGradeForFacts:(NSArray *)facts;
- (void)_addRuleToAgenda:(id)a3;
- (void)addRule:(GKRule *)rule;
- (void)addRulesFromArray:(NSArray *)rules;
- (void)assertFact:(id)fact;
- (void)assertFact:(id)fact grade:(float)grade;
- (void)evaluate;
- (void)removeAllRules;
- (void)reset;
- (void)retractFact:(id)fact;
- (void)retractFact:(id)fact grade:(float)grade;
@end

@implementation GKRuleSystem

- (GKRuleSystem)init
{
  v16.receiver = self;
  v16.super_class = (Class)GKRuleSystem;
  v2 = [(GKRuleSystem *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    state = v2->_state;
    v2->_state = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    rules = v2->_rules;
    v2->_rules = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    agenda = v2->_agenda;
    v2->_agenda = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    toBeExecuted = v2->_toBeExecuted;
    v2->_toBeExecuted = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    executed = v2->_executed;
    v2->_executed = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    gradeByFact = v2->_gradeByFact;
    v2->_gradeByFact = (NSMapTable *)v13;
  }
  return v2;
}

- (void)evaluate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_agenda;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 == v6)
        {
          v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (![v8 evaluatePredicateWithSystem:self]) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v3);
          v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (!objc_msgSend(v8, "evaluatePredicateWithSystem:", self, (void)v10)) {
            continue;
          }
        }
        -[NSMutableArray addObject:](self->_toBeExecuted, "addObject:", v8, (void)v10);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_agenda removeObjectsInArray:self->_toBeExecuted];
  while ([(NSMutableArray *)self->_toBeExecuted count])
  {
    uint64_t v9 = [(NSMutableArray *)self->_toBeExecuted firstObject];
    [(NSMutableArray *)self->_toBeExecuted removeObjectAtIndex:0];
    [(NSMutableArray *)self->_executed addObject:v9];
    [v9 performActionWithSystem:self];
  }
}

- (NSArray)rules
{
  return (NSArray *)self->_rules;
}

- (NSArray)agenda
{
  return (NSArray *)self->_agenda;
}

- (NSArray)executed
{
  return (NSArray *)self->_executed;
}

- (void)_addRuleToAgenda:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_agenda;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "salience", (void)v13);
        if (v12 < [v4 salience])
        {
          uint64_t v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_12:

  [(NSMutableArray *)self->_agenda insertObject:v4 atIndex:v11];
}

- (void)addRule:(GKRule *)rule
{
  rules = self->_rules;
  uint64_t v5 = rule;
  [(NSMutableArray *)rules addObject:v5];
  [(GKRuleSystem *)self _addRuleToAgenda:v5];
}

- (void)addRulesFromArray:(NSArray *)rules
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = rules;
  [(NSMutableArray *)self->_rules addObjectsFromArray:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = v4;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GKRuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeAllRules
{
  [(NSMutableArray *)self->_rules removeAllObjects];
  [(NSMutableArray *)self->_agenda removeAllObjects];
  executed = self->_executed;

  [(NSMutableArray *)executed removeAllObjects];
}

- (NSArray)facts
{
  v2 = [(NSMapTable *)self->_gradeByFact keyEnumerator];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (float)gradeForFact:(id)fact
{
  uint64_t v3 = [(NSMapTable *)self->_gradeByFact objectForKey:fact];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (float)minimumGradeForFacts:(NSArray *)facts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v4 = facts;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    float v8 = 1.0;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [(NSMapTable *)self->_gradeByFact objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        [v10 floatValue];
        float v12 = v11;

        float v8 = fminf(v12, v8);
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 1.0;
  }

  return v8;
}

- (float)maximumGradeForFacts:(NSArray *)facts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  float v4 = facts;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    float v8 = 0.0;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = [(NSMapTable *)self->_gradeByFact objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        [v10 floatValue];
        float v12 = v11;

        float v8 = fmaxf(v12, v8);
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    float v8 = 0.0;
  }

  return v8;
}

- (void)assertFact:(id)fact
{
  LODWORD(v3) = 1.0;
  [(GKRuleSystem *)self assertFact:fact grade:v3];
}

- (void)assertFact:(id)fact grade:(float)grade
{
  id v11 = fact;
  uint64_t v6 = -[NSMapTable objectForKey:](self->_gradeByFact, "objectForKey:");
  [v6 floatValue];
  float v8 = v7;

  if (fminf(v8 + grade, 1.0) != v8)
  {
    gradeByFact = self->_gradeByFact;
    long long v10 = objc_msgSend(NSNumber, "numberWithFloat:");
    [(NSMapTable *)gradeByFact setObject:v10 forKey:v11];

    [(GKRuleSystem *)self evaluate];
  }
}

- (void)retractFact:(id)fact
{
  LODWORD(v3) = 1.0;
  [(GKRuleSystem *)self retractFact:fact grade:v3];
}

- (void)retractFact:(id)fact grade:(float)grade
{
  id v13 = fact;
  uint64_t v6 = [(NSMapTable *)self->_gradeByFact objectForKey:v13];
  [v6 floatValue];
  float v8 = v7;

  long long v10 = v13;
  if (v8 != 0.0)
  {
    *(float *)&double v9 = v8 - grade;
    if ((float)(v8 - grade) >= 0.0)
    {
      long long v10 = v13;
      if (*(float *)&v9 == v8) {
        goto LABEL_7;
      }
      gradeByFact = self->_gradeByFact;
      float v12 = objc_msgSend(NSNumber, "numberWithFloat:");
      [(NSMapTable *)gradeByFact setObject:v12 forKey:v13];
    }
    else
    {
      -[NSMapTable removeObjectForKey:](self->_gradeByFact, "removeObjectForKey:", v13, v9);
    }
    [(GKRuleSystem *)self evaluate];
    long long v10 = v13;
  }
LABEL_7:
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_agenda removeAllObjects];
  [(NSMutableArray *)self->_executed removeAllObjects];
  [(NSMapTable *)self->_gradeByFact removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = self->_rules;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[GKRuleSystem _addRuleToAgenda:](self, "_addRuleToAgenda:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (NSMutableDictionary)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradeByFact, 0);
  objc_storeStrong((id *)&self->_executed, 0);
  objc_storeStrong((id *)&self->_toBeExecuted, 0);
  objc_storeStrong((id *)&self->_agenda, 0);
  objc_storeStrong((id *)&self->_rules, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end
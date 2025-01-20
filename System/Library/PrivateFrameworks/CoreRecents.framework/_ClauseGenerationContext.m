@interface _ClauseGenerationContext
- (BOOL)hadError;
- (BOOL)wantsGroups;
- (NSMutableArray)kindPredicates;
- (NSMutableArray)predicates;
- (_ClauseGenerationContext)init;
- (id)clauseWithBindings:(id)a3;
- (id)kindClauseWithBindings:(id)a3;
- (void)addPredicate:(id)a3 forFieldName:(id)a4;
- (void)dealloc;
- (void)setHadError:(BOOL)a3;
- (void)setKindPredicates:(id)a3;
- (void)setPredicates:(id)a3;
- (void)setWantsGroups:(BOOL)a3;
@end

@implementation _ClauseGenerationContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_ClauseGenerationContext;
  [(_ClauseGenerationContext *)&v3 dealloc];
}

- (_ClauseGenerationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)_ClauseGenerationContext;
  v2 = [(_ClauseGenerationContext *)&v5 init];
  if (v2)
  {
    v2->_kindPredicates = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_predicates = v3;
    v10[1] = v3;
    v11[0] = @"kind";
    v10[0] = v2->_kindPredicates;
    v12[0] = +[NSArray arrayWithObjects:v10 count:2];
    v11[1] = @"groupName";
    predicates = v2->_predicates;
    v12[1] = +[NSArray arrayWithObjects:&predicates count:1];
    v11[2] = @"displayName";
    v8 = v2->_predicates;
    v12[2] = +[NSArray arrayWithObjects:&v8 count:1];
    v11[3] = @"address";
    v7 = v2->_predicates;
    v12[3] = +[NSArray arrayWithObjects:&v7 count:1];
    v11[4] = @"sendingAddress";
    v6 = v2->_predicates;
    v12[4] = +[NSArray arrayWithObjects:&v6 count:1];
    v2->_predicateCollectionsMap = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  }
  return v2;
}

- (id)clauseWithBindings:(id)a3
{
  id v5 = +[NSMutableString string];
  v6 = v5;
  if (self->_wantsGroups)
  {
    id v7 = [(_ClauseGenerationContext *)self kindClauseWithBindings:a3];
    if (v7)
    {
      [v6 appendString:v7];
      CFStringRef v8 = @"\n AND ";
    }
    else
    {
      CFStringRef v8 = @"   ";
    }
    objc_msgSend(v6, "appendFormat:", @"%@recents.rowid IN (\n      SELECT contacts.recent_id\n        FROM contacts\n        JOIN recents ON (recents.ROWID = contacts.recent_id)\n       WHERE "), v8;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    predicates = self->_predicates;
    id v15 = [(NSMutableArray *)predicates countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      CFStringRef v18 = &stru_10002D980;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(predicates);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "cr_addToClause:usingOperator:bindings:", v6, v18, a3);
          CFStringRef v18 = @"\n AND ";
        }
        id v16 = [(NSMutableArray *)predicates countByEnumeratingWithState:&v25 objects:v30 count:16];
        CFStringRef v18 = @"\n AND ";
      }
      while (v16);
    }
    [v6 appendString:@""]);
  }
  else
  {
    [v5 appendString:@"    recents.count = 1\n"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = self->_predicates;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (j = 0; j != v11; j = (char *)j + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "cr_addToClause:usingOperator:bindings:", v6, @"\n AND ", a3);
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v11);
    }
  }
  return v6;
}

- (BOOL)wantsGroups
{
  return self->_wantsGroups;
}

- (void)setWantsGroups:(BOOL)a3
{
  self->_wantsGroups = a3;
}

- (BOOL)hadError
{
  return self->_hadError;
}

- (void)addPredicate:(id)a3 forFieldName:(id)a4
{
  id v8 = -[NSDictionary objectForKey:](self->_predicateCollectionsMap, "objectForKey:", objc_msgSend(objc_msgSend(a4, "componentsSeparatedByString:", @"."), "objectAtIndex:", 0));
  if (!v8) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSPredicateBindings.m", 652, @"failed to find collections for field '%@'", a4 object file lineNumber description];
  }
  [v8 makeObjectsPerformSelector:"addObject:" withObject:a3];
}

- (id)kindClauseWithBindings:(id)a3
{
  id v6 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  kindPredicates = self->_kindPredicates;
  id v8 = [(NSMutableArray *)kindPredicates countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(kindPredicates);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"NSPredicateBindings.m" lineNumber:662 description:@"unexpected kind of predicate present"];
        }
        objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(objc_msgSend(v12, "rightExpression"), "constantValue"));
      }
      id v9 = [(NSMutableArray *)kindPredicates countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  id v13 = +[NSMutableString string];
  [+[NSComparisonPredicate predicateWithLeftExpression:rightExpression:modifier:type:options:](NSComparisonPredicate, "predicateWithLeftExpression:rightExpression:modifier:type:options:", +[NSExpression expressionForKeyPath:](NSExpression, "expressionForKeyPath:", @"kind"), +[NSExpression expressionForConstantValue:v6], 0, 10, 0) cr_addToClause:v13 usingOperator:&stru_10002D980 bindings:a3];
  return v13;
}

- (void)setHadError:(BOOL)a3
{
  self->_hadError = a3;
}

- (NSMutableArray)kindPredicates
{
  return self->_kindPredicates;
}

- (void)setKindPredicates:(id)a3
{
}

- (NSMutableArray)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
}

@end
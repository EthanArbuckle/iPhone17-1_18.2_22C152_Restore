@interface NSCompoundPredicate
- (id)cr_simplifiedPredicateSingleStep;
- (void)cr_addToClause:(id)a3 usingOperator:(id)a4 bindings:(id)a5;
- (void)cr_mergeSubcontext:(id)a3 intoContext:(id)a4;
- (void)cr_processWithContext:(id)a3;
@end

@implementation NSCompoundPredicate

- (id)cr_simplifiedPredicateSingleStep
{
  v2 = self;
  v3 = [(NSCompoundPredicate *)self subpredicates];
  id v4 = [(NSArray *)v3 count];
  v5 = [(NSCompoundPredicate *)v2 compoundPredicateType];
  id v6 = v5;
  if ((unint64_t)(v5 - 1) < 2)
  {
    if (v4 == (id)1)
    {
      id v7 = [(NSArray *)v3 lastObject];
      return objc_msgSend(v7, "cr_simplifiedPredicateSingleStep");
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (!v11) {
      return v2;
    }
    id v12 = v11;
    v22 = v2;
    uint64_t v23 = 0;
    v13 = 0;
    uint64_t v14 = *(void *)v25;
LABEL_14:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v25 != v14) {
        objc_enumerationMutation(v3);
      }
      id v16 = *(id *)(*((void *)&v24 + 1) + 8 * v15);
      id v17 = objc_msgSend(v16, "cr_simplifiedPredicateSingleStep", v22);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 compoundPredicateType] == v6)
      {
        v18 = (NSArray *)[v17 subpredicates];
        if (v18) {
          break;
        }
      }
      if (!v13)
      {
        if (v16 == v17
          || (id v28 = v17,
              (v19 = +[NSArray arrayWithObjects:&v28 count:1]) == 0))
        {
          v13 = 0;
          goto LABEL_29;
        }
LABEL_26:
        id v20 = -[NSArray mutableCopy](-[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 0, v23 + v15), "mutableCopy");
        v13 = v20;
LABEL_27:
        [v20 addObjectsFromArray:v19];
        goto LABEL_29;
      }
      [v13 addObject:v17];
LABEL_29:
      if (v12 == (id)++v15)
      {
        id v12 = [(NSArray *)v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
        v23 += v15;
        if (!v12)
        {
          v2 = v22;
          if (v13)
          {
            id v21 = [objc_alloc((Class)NSCompoundPredicate) initWithType:v6 subpredicates:v13];

            return v21;
          }
          return v2;
        }
        goto LABEL_14;
      }
    }
    v19 = v18;
    if (!v13) {
      goto LABEL_26;
    }
    id v20 = v13;
    goto LABEL_27;
  }
  if (v5) {
    sub_10001B5EC();
  }
  if (v4 != (id)1) {
    sub_10001B618();
  }
  id v9 = [(NSArray *)v3 lastObject];
  id v10 = objc_msgSend(v9, "cr_simplifiedPredicateSingleStep");
  if (v10 == v9) {
    return v2;
  }
  return +[NSCompoundPredicate notPredicateWithSubpredicate:v10];
}

- (void)cr_processWithContext:(id)a3
{
  if ([(NSCompoundPredicate *)self compoundPredicateType])
  {
    v5 = objc_alloc_init(_ClauseGenerationContext);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NSCompoundPredicate *)self subpredicates];
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cr_processWithContext:", v5);
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
    [(NSCompoundPredicate *)self cr_mergeSubcontext:v5 intoContext:a3];
  }
  else
  {
    [a3 setHadError:1];
  }
}

- (void)cr_mergeSubcontext:(id)a3 intoContext:(id)a4
{
  objc_msgSend(a4, "setHadError:", objc_msgSend(a3, "hadError") | objc_msgSend(a4, "hadError"));
  objc_msgSend(a4, "setWantsGroups:", objc_msgSend(a3, "wantsGroups") | objc_msgSend(a4, "wantsGroups"));
  if (([a4 hadError] & 1) == 0)
  {
    objc_msgSend(objc_msgSend(a4, "kindPredicates"), "addObjectsFromArray:", objc_msgSend(a3, "kindPredicates"));
    [a3 setKindPredicates:0];
    NSCompoundPredicateType v7 = [(NSCompoundPredicate *)self compoundPredicateType];
    id v8 = objc_msgSend(objc_msgSend(a3, "predicates"), "count");
    if (v8)
    {
      if (v8 == (id)1)
      {
        id v9 = [a4 predicates];
        id v10 = objc_msgSend(objc_msgSend(a3, "predicates"), "lastObject");
      }
      else
      {
        id v9 = [a4 predicates];
        id v10 = objc_msgSend(objc_alloc((Class)NSCompoundPredicate), "initWithType:subpredicates:", v7, objc_msgSend(a3, "predicates"));
      }
      [v9 addObject:v10];
    }
  }
}

- (void)cr_addToClause:(id)a3 usingOperator:(id)a4 bindings:(id)a5
{
  id v9 = [(NSCompoundPredicate *)self subpredicates];
  if ([(NSArray *)v9 count])
  {
    if ((id)[(NSCompoundPredicate *)self compoundPredicateType] == (id)1) {
      CFStringRef v10 = @"\n AND ";
    }
    else {
      CFStringRef v10 = @"\n OR ";
    }
    objc_msgSend(a3, "appendFormat:", @"%@("), a4;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      char v13 = 0;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v9);
          }
          if (v13) {
            CFStringRef v16 = v10;
          }
          else {
            CFStringRef v16 = &stru_10002D980;
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "cr_addToClause:usingOperator:bindings:", a3, v16, a5);
          char v13 = 1;
        }
        id v12 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    [a3 appendString:@""]);
  }
}

@end
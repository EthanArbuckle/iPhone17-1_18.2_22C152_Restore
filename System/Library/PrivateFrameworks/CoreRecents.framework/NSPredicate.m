@interface NSPredicate
- (BOOL)cr_isInvalidOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
- (id)cr_predicateClauseWithBindings:(id)a3 error:(id *)a4;
- (id)cr_simplifiedPredicate;
- (void)cr_addToClause:(id)a3 usingOperator:(id)a4 bindings:(id)a5;
- (void)cr_processWithContext:(id)a3;
@end

@implementation NSPredicate

- (id)cr_predicateClauseWithBindings:(id)a3 error:(id *)a4
{
  id v7 = [(NSPredicate *)self cr_simplifiedPredicate];
  v8 = objc_alloc_init(_ClauseGenerationContext);
  objc_msgSend(v7, "cr_processWithContext:", v8);
  if ([(_ClauseGenerationContext *)v8 hadError])
  {
    if (a4)
    {
      CFStringRef v11 = @"predicate";
      v12 = self;
      id v9 = 0;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CRRecentContactsErrorDomain, 1000, +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = [(_ClauseGenerationContext *)v8 clauseWithBindings:a3];
  }

  return v9;
}

- (BOOL)cr_isInvalidOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5 = [a4 componentsSeparatedByString:@"."];
  if ([v5 count]
    && (id v6 = [v5 objectAtIndex:0]) != 0
    && (id v7 = sub_100006960((uint64_t)v6)) != 0
    && (v8 = v7,
        id v9 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"count"), "unsignedIntegerValue"),
        v9 >= [v5 count]))
  {
    id v10 = [v8 objectForKey:@"operator"];
    if (v10) {
      LOBYTE(v10) = [v10 unsignedIntegerValue] != (id)a3;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return (char)v10;
}

- (id)cr_simplifiedPredicate
{
  v2 = self;
  if ([(NSPredicate *)self cr_simplifiedPredicateSingleStep] != self)
  {
    uint64_t v3 = -4;
    while (1)
    {
      v4 = [(NSPredicate *)v2 cr_simplifiedPredicateSingleStep];
      if (v4 == v2) {
        break;
      }
      if (__CFADD__(v3++, 1)) {
        return v4;
      }
    }
  }
  return v2;
}

- (void)cr_processWithContext:(id)a3
{
}

- (void)cr_addToClause:(id)a3 usingOperator:(id)a4 bindings:(id)a5
{
}

@end
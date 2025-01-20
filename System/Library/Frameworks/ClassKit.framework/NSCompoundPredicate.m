@interface NSCompoundPredicate
- (BOOL)pd_containsKeyPath:(id)a3;
- (id)pd_filterSubpredicatesForKeyPath:(id)a3;
- (void)_populateKeypathValueMap:(id)a3;
@end

@implementation NSCompoundPredicate

- (BOOL)pd_containsKeyPath:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(NSCompoundPredicate *)self subpredicates];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "pd_containsKeyPath:", v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)pd_filterSubpredicatesForKeyPath:(id)a3
{
  id v4 = a3;
  NSCompoundPredicateType v5 = [(NSCompoundPredicate *)self compoundPredicateType];
  id v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(NSCompoundPredicate *)self subpredicates];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "pd_filterSubpredicatesForKeyPath:", v4);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    if ([v6 count] == (id)1)
    {
      id v13 = [v6 firstObject];
    }
    else
    {
      id v13 = [objc_alloc((Class)NSCompoundPredicate) initWithType:v5 subpredicates:v6];
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_populateKeypathValueMap:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSCompoundPredicateType v5 = [(NSCompoundPredicate *)self subpredicates];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        [v10 _populateKeypathValueMap:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

@end
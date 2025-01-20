@interface SCATAggregateElementProvider
- (BOOL)containsElement:(id)a3;
- (BOOL)providesElements;
- (NSMutableOrderedSet)providers;
- (NSString)description;
- (SCATAggregateElementProvider)init;
- (id)addProviderWithElements:(id)a3 passingTest:(id)a4;
- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5;
- (id)firstElementWithOptions:(int *)a3;
- (id)lastElementWithOptions:(int *)a3;
- (unint64_t)_indexOfProviderAfterProviderWithIndex:(unint64_t)a3 didWrap:(BOOL *)a4;
- (unint64_t)_indexOfProviderBeforeProviderWithIndex:(unint64_t)a3 didWrap:(BOOL *)a4;
- (unint64_t)_indexOfProviderContainingElement:(id)a3;
- (void)addProvider:(id)a3;
- (void)removeAllProviders;
- (void)removeProvider:(id)a3;
- (void)setProviders:(id)a3;
@end

@implementation SCATAggregateElementProvider

- (SCATAggregateElementProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCATAggregateElementProvider;
  v2 = [(SCATAggregateElementProvider *)&v6 init];
  if (v2)
  {
    v3 = +[NSMutableOrderedSet orderedSet];
    [(SCATAggregateElementProvider *)v2 setProviders:v3];

    v4 = v2;
  }

  return v2;
}

- (NSString)description
{
  v3 = +[NSMutableString stringWithFormat:@"SCATAggregateElementProvider<%p>\n", self];
  [v3 appendFormat:@"Providers:\n"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(SCATAggregateElementProvider *)self providers];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSString *)v3;
}

- (void)addProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATAggregateElementProvider *)self providers];
  [v5 addObject:v4];
}

- (id)addProviderWithElements:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void))a4;
  if (v7)
  {
    v8 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (v7[2](v7, v14)) {
            objc_msgSend(v8, "addObject:", v14, (void)v18);
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v8 = v6;
  }
  if (objc_msgSend(v8, "count", (void)v18))
  {
    v15 = [[SCATStaticElementProvider alloc] initWithElements:v8];
    v16 = [(SCATAggregateElementProvider *)self providers];
    [v16 addObject:v15];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)removeProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATAggregateElementProvider *)self providers];
  [v5 removeObject:v4];
}

- (void)removeAllProviders
{
  id v2 = [(SCATAggregateElementProvider *)self providers];
  [v2 removeAllObjects];
}

- (unint64_t)_indexOfProviderAfterProviderWithIndex:(unint64_t)a3 didWrap:(BOOL *)a4
{
  id v6 = [(SCATAggregateElementProvider *)self providers];
  id v7 = [v6 count];

  BOOL v8 = a3 + 1 == (void)v7;
  if ((id)(a3 + 1) == v7) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = a3 + 1;
  }
  if (!v7)
  {
    BOOL v8 = 0;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 0;
    unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t result = v9;
  }
  if (a4) {
    *a4 = v8;
  }
  return result;
}

- (unint64_t)_indexOfProviderBeforeProviderWithIndex:(unint64_t)a3 didWrap:(BOOL *)a4
{
  id v6 = [(SCATAggregateElementProvider *)self providers];
  id v7 = [v6 count];

  if (a4) {
    *a4 = a3 == 0;
  }
  if (a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = (unint64_t)v7;
  }
  unint64_t v9 = v8 - 1;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v9;
  }
}

- (unint64_t)_indexOfProviderContainingElement:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATAggregateElementProvider *)self providers];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(SCATAggregateElementProvider *)self providers];
      unint64_t v9 = [(id)v8 objectAtIndex:v7];

      LOBYTE(v8) = [v9 containsElement:v4];
      if (v8) {
        break;
      }
      if (v6 == (id)++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)providesElements
{
  return 1;
}

- (id)firstElementWithOptions:(int *)a3
{
  id v5 = [(SCATAggregateElementProvider *)self providers];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = [(SCATAggregateElementProvider *)self providers];
    uint64_t v8 = [v7 objectAtIndex:0];

    unint64_t v9 = [v8 firstElementWithOptions:a3];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)lastElementWithOptions:(int *)a3
{
  id v5 = [(SCATAggregateElementProvider *)self providers];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = [(SCATAggregateElementProvider *)self providers];
    uint64_t v8 = [v7 lastObject];

    unint64_t v9 = [v8 lastElementWithOptions:a3];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)elementBefore:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  char v21 = 0;
  unint64_t v9 = [(SCATAggregateElementProvider *)self _indexOfProviderContainingElement:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [(SCATAggregateElementProvider *)self providers];
    id v10 = [v11 objectAtIndex:v9];
  }
  uint64_t v12 = [v10 elementBefore:v8 didWrap:&v21 options:a5];
  if (v21)
  {
    char v20 = 0;
    unint64_t v13 = [(SCATAggregateElementProvider *)self _indexOfProviderBeforeProviderWithIndex:v9 didWrap:&v20];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = 0;
    }
    else
    {
      unint64_t v16 = v13;
      v17 = [(SCATAggregateElementProvider *)self providers];
      uint64_t v14 = [v17 objectAtIndex:v16];
    }
    BOOL v15 = v20 != 0;
    uint64_t v18 = [v14 lastElementWithOptions:a5];

    uint64_t v12 = (void *)v18;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v15 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v15;
LABEL_12:

  return v12;
}

- (id)elementAfter:(id)a3 didWrap:(BOOL *)a4 options:(int *)a5
{
  id v8 = a3;
  char v21 = 0;
  unint64_t v9 = [(SCATAggregateElementProvider *)self _indexOfProviderContainingElement:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = [(SCATAggregateElementProvider *)self providers];
    id v10 = [v11 objectAtIndex:v9];
  }
  uint64_t v12 = [v10 elementAfter:v8 didWrap:&v21 options:a5];
  if (v21)
  {
    char v20 = 0;
    unint64_t v13 = [(SCATAggregateElementProvider *)self _indexOfProviderAfterProviderWithIndex:v9 didWrap:&v20];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = 0;
    }
    else
    {
      unint64_t v16 = v13;
      v17 = [(SCATAggregateElementProvider *)self providers];
      uint64_t v14 = [v17 objectAtIndex:v16];
    }
    BOOL v15 = v20 != 0;
    uint64_t v18 = [v14 firstElementWithOptions:a5];

    uint64_t v12 = (void *)v18;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v15 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v15;
LABEL_12:

  return v12;
}

- (BOOL)containsElement:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(SCATAggregateElementProvider *)self providers];
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
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsElement:v4])
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

- (NSMutableOrderedSet)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
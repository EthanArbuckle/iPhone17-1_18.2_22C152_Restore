@interface NSArray
- (id)bds_arrayByRemovingNSNulls;
- (id)bds_arrayByRemovingNSNullsInvokingBlockForNulls:(id)a3;
- (id)bds_dictionaryUsingPropertyAsKey:(id)a3 uniquingKeysWith:(id)a4;
- (void)bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:(SEL)a3 completion:(id)a4;
- (void)bds_chainUntilNoErrorCompletionSelectorCallsForSelector:(SEL)a3 completion:(id)a4;
- (void)bds_traverseBatchesOfSize:(unint64_t)a3 block:(id)a4;
@end

@implementation NSArray

- (id)bds_dictionaryUsingPropertyAsKey:(id)a3 uniquingKeysWith:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "valueForKey:", v6, v21);
        objc_opt_class();
        v21 = &OBJC_PROTOCOL___NSCopying;
        v15 = BUClassAndProtocolCast();
        if (v15)
        {
          v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v15, &OBJC_PROTOCOL___NSCopying);

          if (v16)
          {
            v17 = [v8 objectForKeyedSubscript:v15];
            v18 = v7[2](v7, v17, v13);
            [v8 setObject:v18 forKeyedSubscript:v15];
          }
          else
          {
            [v8 setObject:v13 forKeyedSubscript:v15];
          }
        }
      }
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  id v19 = [v8 copy];
  return v19;
}

- (id)bds_arrayByRemovingNSNullsInvokingBlockForNulls:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  NSUInteger v6 = [(NSArray *)self count];
  if (v6)
  {
    NSUInteger v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v9 = [(NSArray *)self objectAtIndex:i];
      id v10 = +[NSNull null];

      if (v9 == v10)
      {
        id v11 = objc_retainBlock(v4);
        v12 = v11;
        if (v11) {
          (*((void (**)(id, uint64_t))v11 + 2))(v11, i);
        }
      }
      else
      {
        [v5 addObject:v9];
      }
    }
  }
  id v13 = [v5 copy];

  return v13;
}

- (id)bds_arrayByRemovingNSNulls
{
  return [(NSArray *)self bds_arrayByRemovingNSNullsInvokingBlockForNulls:0];
}

- (void)bds_traverseBatchesOfSize:(unint64_t)a3 block:(id)a4
{
  v16 = (void (**)(id, void *, void, unint64_t))a4;
  if (v16)
  {
    NSUInteger v6 = [(NSArray *)self count];
    if (v6)
    {
      uint64_t v7 = 0;
      unint64_t v8 = v6 + a3;
      uint64_t v9 = -(uint64_t)a3;
      NSUInteger v10 = v6;
      do
      {
        NSUInteger v11 = v10 - a3;
        if (v10 >= a3) {
          unint64_t v12 = a3;
        }
        else {
          unint64_t v12 = v10;
        }
        id v13 = -[NSArray subarrayWithRange:](self, "subarrayWithRange:", v7, v12);
        v16[2](v16, v13, v7, v12);

        v8 -= a3;
        if (a3 >= v8) {
          unint64_t v14 = v8;
        }
        else {
          unint64_t v14 = a3;
        }
        v9 += a3;
        NSUInteger v15 = v14 + v9;
        v7 += a3;
        NSUInteger v10 = v11;
      }
      while (v15 < v6);
    }
    else
    {
      ((void (*)(void))v16[2])();
    }
  }
}

- (void)bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSPointerArray) initWithOptions:5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v8 = self;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addPointer:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v12), (void)v13);
        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(v7, "bds_chainSuccessAndErrorCompletionSelectorCallsForSelector:successSoFar:errorSoFar:completion:", a3, 1, 0, v6);
}

- (void)bds_chainUntilNoErrorCompletionSelectorCallsForSelector:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSPointerArray) initWithOptions:5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v8 = self;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addPointer:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  long long v13 = +[NSError errorWithDomain:@"BDSArrayAdditionsErrorDomain" code:0 userInfo:0];
  objc_msgSend(v7, "bds_chainUntilNoErrorCompletionSelectorCallsForSelector:successSoFar:errorSoFar:completion:", a3, 1, v13, v6);
}

@end
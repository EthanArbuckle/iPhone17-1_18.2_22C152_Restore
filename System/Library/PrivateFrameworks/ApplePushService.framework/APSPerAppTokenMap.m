@interface APSPerAppTokenMap
- (APSPerAppTokenMap)init;
- (BOOL)flagForTopic:(id)a3 identifier:(id)a4;
- (BOOL)hasMissingTokens;
- (BOOL)isEmpty;
- (id)allPerAppTokens;
- (id)debugDescription;
- (id)description;
- (id)identifiersForTopic:(id)a3;
- (id)infoForTopic:(id)a3 identifier:(id)a4;
- (id)tokenForTopic:(id)a3 identifier:(id)a4;
- (id)tokensForTopic:(id)a3;
- (id)topics;
- (void)enumerateMissingTokensUsingBlock:(id)a3;
- (void)enumerateTokensUsingBlock:(id)a3;
- (void)enumerateTokensWithInfoUsingBlock:(id)a3;
- (void)removeAllTokens;
- (void)removeIdentifier:(id)a3 forTopic:(id)a4;
- (void)setFlag:(BOOL)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)setToken:(id)a3 forInfo:(id)a4;
- (void)setToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
@end

@implementation APSPerAppTokenMap

- (APSPerAppTokenMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)APSPerAppTokenMap;
  v2 = [(APSPerAppTokenMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    perAppTokenMap = v2->_perAppTokenMap;
    v2->_perAppTokenMap = v3;
  }
  return v2;
}

- (void)removeIdentifier:(id)a3 forTopic:(id)a4
{
  id v6 = a4;
  v7 = &stru_10012F350;
  if (a3) {
    v7 = (__CFString *)a3;
  }
  v14 = v7;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_enumerating)
  {
    id v13 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"illegal modification during enumeration" userInfo:0];
    objc_exception_throw(v13);
  }
  v9 = [(NSMutableDictionary *)v8->_perAppTokenMap objectForKey:v6];
  v10 = [v9 objectForKey:v14];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 perAppToken];
    if (!v12) {
      --v8->_missingTokens;
    }
    [v9 removeObjectForKey:v14];
  }
  objc_sync_exit(v8);
}

- (void)setToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)APSAppTokenInfo) initUnextendedAppTokenWithTopic:v9 identifier:v8];

  [(APSPerAppTokenMap *)self setToken:v10 forInfo:v11];
}

- (void)setToken:(id)a3 forInfo:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 identifier];
  id v8 = (void *)v7;
  id v9 = &stru_10012F350;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  id v11 = self;
  objc_sync_enter(v11);
  if (v11->_enumerating)
  {
    id v22 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"illegal modification during enumeration" userInfo:0];
    objc_exception_throw(v22);
  }
  perAppTokenMap = v11->_perAppTokenMap;
  id v13 = [v6 topic];
  v14 = [(NSMutableDictionary *)perAppTokenMap objectForKey:v13];

  if (!v14)
  {
    v14 = +[NSMutableDictionary dictionaryWithCapacity:1];
    v15 = v11->_perAppTokenMap;
    v16 = [v6 topic];
    [(NSMutableDictionary *)v15 setObject:v14 forKey:v16];
  }
  v17 = [v14 objectForKey:v10];
  v18 = v17;
  if (!v17)
  {
    v18 = objc_alloc_init(APSPerAppTokenMapEntry);
    [v14 setObject:v18 forKey:v10];
    if (v23) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v19 = [(APSPerAppTokenMapEntry *)v17 perAppToken];

  if (v23 && !v19)
  {
    uint64_t v20 = -1;
LABEL_15:
    v11->_missingTokens += v20;
    goto LABEL_16;
  }
  v21 = [(APSPerAppTokenMapEntry *)v18 perAppToken];

  if (!v23 && v21)
  {
LABEL_14:
    uint64_t v20 = 1;
    goto LABEL_15;
  }
LABEL_16:
  [(APSPerAppTokenMapEntry *)v18 setPerAppToken:v23];
  [(APSPerAppTokenMapEntry *)v18 setInfo:v6];

  objc_sync_exit(v11);
}

- (void)removeAllTokens
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_enumerating)
  {
    id v12 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"illegal modification during enumeration" userInfo:0];
    objc_exception_throw(v12);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = v2->_perAppTokenMap;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(obj);
        }
        v5 = [(NSMutableDictionary *)v2->_perAppTokenMap objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v6 = [v5 copy];
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v16;
          do
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = [v5 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)j)];
              id v11 = [v10 perAppToken];
              if (v11)
              {
                [v10 setPerAppToken:0];
                ++v2->_missingTokens;
              }
            }
            id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v7);
        }
      }
      id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v3);
  }

  objc_sync_exit(v2);
}

- (id)tokenForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = (__CFString *)a4;
  objc_sync_enter(v7);
  id v9 = &stru_10012F350;
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = [(NSMutableDictionary *)v7->_perAppTokenMap objectForKey:v6];
  id v12 = [v11 objectForKey:v10];
  id v13 = [v12 perAppToken];

  objc_sync_exit(v7);
  return v13;
}

- (id)infoForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = (__CFString *)a4;
  objc_sync_enter(v7);
  id v9 = &stru_10012F350;
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = [(NSMutableDictionary *)v7->_perAppTokenMap objectForKey:v6];
  id v12 = [v11 objectForKey:v10];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 info];
  }
  else
  {
    uint64_t v14 = 0;
  }

  objc_sync_exit(v7);
  return v14;
}

- (BOOL)flagForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = (__CFString *)a4;
  objc_sync_enter(v7);
  id v9 = &stru_10012F350;
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = [(NSMutableDictionary *)v7->_perAppTokenMap objectForKey:v6];
  id v12 = [v11 objectForKey:v10];
  unsigned __int8 v13 = [v12 flag];

  objc_sync_exit(v7);
  return v13;
}

- (void)setFlag:(BOOL)a3 forTopic:(id)a4 identifier:(id)a5
{
  BOOL v6 = a3;
  id v14 = a4;
  uint64_t v8 = self;
  id v9 = (__CFString *)a5;
  objc_sync_enter(v8);
  id v10 = &stru_10012F350;
  if (v9) {
    id v10 = v9;
  }
  id v11 = v10;

  id v12 = [(NSMutableDictionary *)v8->_perAppTokenMap objectForKey:v14];
  unsigned __int8 v13 = [v12 objectForKey:v11];
  [v13 setFlag:v6];

  objc_sync_exit(v8);
}

- (id)allPerAppTokens
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = +[NSMutableSet setWithCapacity:[(NSMutableDictionary *)v2->_perAppTokenMap count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = v2->_perAppTokenMap;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = -[APSPerAppTokenMap tokensForTopic:](v2, "tokensForTopic:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        [v3 unionSet:v8];
      }
      id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v3;
}

- (id)tokensForTopic:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = +[NSMutableSet setWithCapacity:[(NSMutableDictionary *)v5->_perAppTokenMap count]];
  id v7 = [(NSMutableDictionary *)v5->_perAppTokenMap objectForKey:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = objc_msgSend(v7, "allValues", 0);
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) perAppToken];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v5);
  return v6;
}

- (BOOL)hasMissingTokens
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_missingTokens > 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEmpty
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableDictionary *)v2->_perAppTokenMap count] == 0;
  objc_sync_exit(v2);

  return v3;
}

- (id)topics
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableDictionary *)v2->_perAppTokenMap allKeys];
  id v4 = +[NSSet setWithArray:v3];

  objc_sync_exit(v2);
  return v4;
}

- (id)identifiersForTopic:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_perAppTokenMap objectForKey:v4];
  id v7 = [v6 allKeys];
  uint64_t v8 = +[NSSet setWithArray:v7];

  objc_sync_exit(v5);
  return v8;
}

- (void)enumerateMissingTokensUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(APSPerAppTokenMap *)v5 hasMissingTokens])
  {
    v5->_enumerating = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10007B38C;
    v6[3] = &unk_10012BA70;
    id v7 = v4;
    [(APSPerAppTokenMap *)v5 enumerateTokensUsingBlock:v6];
    v5->_enumerating = 0;
  }
  objc_sync_exit(v5);
}

- (void)enumerateTokensUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, uint64_t, char *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_enumerating = 1;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = v5->_perAppTokenMap;
  long long v20 = v5;
  id v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v7 = -[NSMutableDictionary objectForKey:](v5->_perAppTokenMap, "objectForKey:", v6, v16);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              char v21 = 0;
              long long v13 = [v8 objectForKey:v12];
              long long v14 = [v13 perAppToken];
              v4[2](v4, v14, v6, v12, &v21);
              if (v21)
              {
                v20->_enumerating = 0;

                long long v15 = v20;
                goto LABEL_18;
              }
            }
            id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v5 = v20;
      }
      id v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v16);
  }

  long long v15 = v20;
  v20->_enumerating = 0;
LABEL_18:
  objc_sync_exit(v15);
}

- (void)enumerateTokensWithInfoUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_enumerating = 1;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = v5->_perAppTokenMap;
  id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v18 = *(void *)v27;
    long long v19 = v5;
    do
    {
      id v17 = v6;
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(NSMutableDictionary *)v5->_perAppTokenMap objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              char v21 = 0;
              long long v14 = [v9 objectForKey:v13];
              long long v15 = [v14 perAppToken];
              id v16 = [v14 info];
              v4[2](v4, v15, v16, &v21);

              if (v21)
              {
                v19->_enumerating = 0;

                id v5 = v19;
                goto LABEL_18;
              }
            }
            id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        id v5 = v19;
      }
      id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  v5->_enumerating = 0;
LABEL_18:
  objc_sync_exit(v5);
}

- (id)debugDescription
{
  return [(NSMutableDictionary *)self->_perAppTokenMap debugDescription];
}

- (id)description
{
  return (id)APSPrettyPrintCollection();
}

- (void).cxx_destruct
{
}

@end
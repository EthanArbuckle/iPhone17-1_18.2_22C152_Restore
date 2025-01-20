@interface NSArray
- (NSString)tcr_keyPath;
- (id)_tcr_associatedReader;
- (id)lib_batchedWithMaxSize:(unint64_t)a3;
- (id)lib_categorizeItemsUsingBlock:(id)a3;
- (id)lib_filterUsingBlock:(id)a3;
- (id)lib_firstObjectPassingTest:(id)a3;
- (id)lib_firstResultApplyingTransform:(id)a3;
- (id)lib_flatMapAndFilterUsingBlock:(id)a3;
- (id)lib_mapAndFilterUsingBlock:(id)a3;
- (id)tcr_dictionaryEnumerator;
- (id)tcr_numberEnumerator;
- (id)tcr_stringEnumerator;
@end

@implementation NSArray

- (NSString)tcr_keyPath
{
  return [(NSArray *)self componentsJoinedByString:@"."];
}

- (id)tcr_dictionaryEnumerator
{
  v2 = [(NSArray *)self _tcr_associatedReader];
  v3 = [v2 enumeratorForObjectsOfClass:objc_opt_class()];

  return v3;
}

- (id)tcr_numberEnumerator
{
  v2 = [(NSArray *)self _tcr_associatedReader];
  v3 = [v2 enumeratorForObjectsOfClass:objc_opt_class()];

  return v3;
}

- (id)tcr_stringEnumerator
{
  v2 = [(NSArray *)self _tcr_associatedReader];
  v3 = [v2 enumeratorForObjectsOfClass:objc_opt_class()];

  return v3;
}

- (id)_tcr_associatedReader
{
  v6.receiver = self;
  v6.super_class = (Class)NSArray;
  v3 = [(NSArray *)&v6 _tcr_associatedReader];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [[TypeCheckedArrayReader alloc] initWithArray:self];

    [(NSArray *)self _tcr_associateWithReader:v4];
    v3 = v4;
  }

  return v3;
}

- (id)lib_categorizeItemsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = +[NSMutableDictionary dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = v4[2](v4, v11);
        if (v12)
        {
          v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v18);
          v14 = v13;
          if (v13)
          {
            [v13 addObject:v11];
          }
          else
          {
            v15 = +[NSMutableArray arrayWithObject:v11];
            [v5 setObject:v15 forKeyedSubscript:v12];
          }
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v16 = [objc_alloc((Class)NSDictionary) initWithDictionary:v5 copyItems:1];

  return v16;
}

- (id)lib_firstObjectPassingTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000877D0;
  v8[3] = &unk_10035A2B8;
  id v4 = a3;
  id v9 = v4;
  NSUInteger v5 = [(NSArray *)self indexOfObjectPassingTest:v8];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = 0;
  }
  else
  {
    objc_super v6 = [(NSArray *)self objectAtIndexedSubscript:v5];
  }

  return v6;
}

- (id)lib_firstResultApplyingTransform:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  NSUInteger v5 = self;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (id)lib_flatMapAndFilterUsingBlock:(id)a3
{
  id v4 = a3;
  +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_100087A08;
  v12 = &unk_10035A2E0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v4;
  id v5 = v13;
  id v6 = v4;
  [(NSArray *)self enumerateObjectsUsingBlock:&v9];
  id v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

- (id)lib_mapAndFilterUsingBlock:(id)a3
{
  id v4 = a3;
  +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_100087BFC;
  v12 = &unk_10035A308;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v4;
  id v5 = v13;
  id v6 = v4;
  [(NSArray *)self enumerateObjectsUsingBlock:&v9];
  id v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

- (id)lib_filterUsingBlock:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100087D98;
  long long v15 = sub_100087DA8;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100087DB0;
  v8[3] = &unk_10035A330;
  id v4 = a3;
  id v9 = v4;
  uint64_t v10 = &v11;
  void v8[4] = self;
  [(NSArray *)self enumerateObjectsUsingBlock:v8];
  if (v12[5]) {
    id v5 = (NSArray *)v12[5];
  }
  else {
    id v5 = self;
  }
  id v6 = [(NSArray *)v5 copy];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)lib_batchedWithMaxSize:(unint64_t)a3
{
  unint64_t v5 = [(NSArray *)self count];
  id v6 = objc_opt_new();
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      if (v5 >= a3) {
        unint64_t v8 = a3;
      }
      else {
        unint64_t v8 = v5;
      }
      id v9 = -[NSArray subarrayWithRange:](self, "subarrayWithRange:", v7, v8);
      v5 -= v8;
      v7 += v8;
      [v6 addObject:v9];
    }
    while (v5);
  }

  return v6;
}

@end
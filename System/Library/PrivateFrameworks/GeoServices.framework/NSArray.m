@interface NSArray
- (id)_geo_compactMap:(id)a3;
- (id)_geo_filtered:(id)a3;
- (id)_geo_map:(id)a3;
@end

@implementation NSArray

- (id)_geo_compactMap:(id)a3
{
  v4 = (void (**)(id, void))a3;
  if ([(NSArray *)self count])
  {
    v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)_geo_filtered:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004AD90;
    v8[3] = &unk_100072280;
    id v9 = v4;
    v5 = +[NSPredicate predicateWithBlock:v8];
    v6 = [(NSArray *)self filteredArrayUsingPredicate:v5];
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_geo_map:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(NSArray *)self count])
  {
    v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11, (void)v13);
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

@end
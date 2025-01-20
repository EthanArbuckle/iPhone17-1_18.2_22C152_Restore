@interface NSArray
- (id)buddy_filterToOrderedSet:(id)a3;
- (id)buddy_mapArray:(id)a3;
- (id)buddy_mapCountedSet:(id)a3;
- (id)buddy_mapOrderedSet:(id)a3;
- (id)buddy_mapSet:(id)a3;
- (unint64_t)indexOfFirstMatchingCondition:(id)a3;
@end

@implementation NSArray

- (id)buddy_mapCountedSet:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = objc_alloc_init((Class)NSCountedSet);
  memset(v11, 0, sizeof(v11));
  id v3 = v15;
  id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v11[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v7 = v13;
        id v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        [v7 addObject:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = v13;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (id)buddy_mapSet:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = objc_alloc_init((Class)NSMutableSet);
  memset(v11, 0, sizeof(v11));
  id v3 = v15;
  id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v11[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v7 = v13;
        id v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        [v7 addObject:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = [v13 copy];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (id)buddy_mapOrderedSet:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = +[NSMutableOrderedSet orderedSet];
  memset(v11, 0, sizeof(v11));
  id v3 = v15;
  id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v11[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v7 = v13;
        id v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        [v7 addObject:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = [v13 copy];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (id)buddy_filterToOrderedSet:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = +[NSMutableOrderedSet orderedSet];
  memset(v9, 0, sizeof(v9));
  id v3 = v13;
  id v4 = [v3 countByEnumeratingWithState:v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v9[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(v9[1] + 8 * i);
        if ((*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v10)) {
          [v11 addObject:v10];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:v9 objects:v14 count:16];
    }
    while (v4);
  }

  id v7 = [v11 copy];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)buddy_mapArray:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = objc_alloc_init((Class)NSMutableArray);
  memset(v11, 0, sizeof(v11));
  id v3 = v15;
  id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v11[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void *)(v11[1] + 8 * i);
        id v7 = v13;
        id v8 = (id)(*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v12);
        [v7 addObject:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:v11 objects:v16 count:16];
    }
    while (v4);
  }

  id v9 = [v13 copy];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);

  return v9;
}

- (unint64_t)indexOfFirstMatchingCondition:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v11 = 0;
  memset(__b, 0, sizeof(__b));
  id v3 = v13;
  id v4 = [v3 countByEnumeratingWithState:__b objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(__b[1] + 8 * i);
        if ((*((uint64_t (**)(id, uint64_t))location[0] + 2))(location[0], v10))
        {
          unint64_t v14 = v11;
          int v8 = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v15 count:16];
    }
    while (v4);
  }
  int v8 = 0;
LABEL_11:

  if (!v8) {
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_storeStrong(location, 0);
  return v14;
}

@end
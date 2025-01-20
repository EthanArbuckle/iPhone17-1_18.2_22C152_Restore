@interface ICOrderedMediaSet
- (BOOL)removeMediaItemFromIndex:(id)a3;
- (BOOL)removeMediaItemWithHandleFromIndex:(unint64_t)a3;
- (BOOL)removeMediaItemsFromIndex:(id)a3;
- (ICOrderedMediaSet)initWithTypes:(id)a3;
- (NSMutableDictionary)mediaItems;
- (id)arrayForType:(id)a3;
- (id)mediaItemWithHandle:(unint64_t)a3 inTypes:(id)a4;
- (id)orderedSetForType:(id)a3;
- (os_unfair_lock_s)mediaLock;
- (unint64_t)mediaItemCount;
- (void)addMediaItemToIndex:(id)a3;
- (void)performSelector:(id)a3 onTypes:(id)a4;
- (void)removeAllItems;
- (void)setMediaItems:(id)a3;
- (void)setMediaLock:(os_unfair_lock_s)a3;
@end

@implementation ICOrderedMediaSet

- (ICOrderedMediaSet)initWithTypes:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICOrderedMediaSet;
  v5 = [(ICOrderedMediaSet *)&v20 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mediaItems = v5->_mediaItems;
    v5->_mediaItems = v6;

    v5->_mediaLock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v4;
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v12);
            v14 = +[NSMutableOrderedSet orderedSet];
            [(NSMutableDictionary *)v5->_mediaItems setObject:v14 forKeyedSubscript:v13];

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }
    }
  }

  return v5;
}

- (unint64_t)mediaItemCount
{
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableDictionary *)self->_mediaItems allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        v7 += (unint64_t)[v10 count];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  os_unfair_lock_unlock(p_mediaLock);
  return v7;
}

- (void)addMediaItemToIndex:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mediaItemType];
  if (v5)
  {
    id v6 = [v4 unsignedIntegerValue];
    unint64_t v7 = [v4 mediaItemType];
    long long v14 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v14 count:1];
    id v9 = [(ICOrderedMediaSet *)self mediaItemWithHandle:v6 inTypes:v8];

    if (!v9)
    {
      p_mediaLock = &self->_mediaLock;
      os_unfair_lock_lock(&self->_mediaLock);
      uint64_t v11 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:v5];
      long long v12 = v11;
      if (v11)
      {
        id v13 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v11, "count"), 1024, &stru_100034C78);
        if (v13 != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v12 insertObject:v4 atIndex:v13];
        }
      }
      os_unfair_lock_unlock(p_mediaLock);
    }
  }
}

- (BOOL)removeMediaItemFromIndex:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mediaItemType];
  if (v5)
  {
    p_mediaLock = &self->_mediaLock;
    os_unfair_lock_lock(&self->_mediaLock);
    unint64_t v7 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:v5];
    uint64_t v8 = v7;
    BOOL v9 = v7 != 0;
    if (v7) {
      [v7 removeObject:v4];
    }
    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)removeMediaItemsFromIndex:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void *)v12;
    id v8 = v5;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ICOrderedMediaSet *)self removeMediaItemFromIndex:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        BOOL v9 = (char *)v9 + 1;
      }
      while (v8 != v9);
      id v8 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  return v6 != 0;
}

- (BOOL)removeMediaItemWithHandleFromIndex:(unint64_t)a3
{
  id v4 = [(ICOrderedMediaSet *)self mediaItemWithHandle:a3 inTypes:0];
  if (v4) {
    [(ICOrderedMediaSet *)self removeMediaItemFromIndex:v4];
  }

  return v4 != 0;
}

- (void)removeAllItems
{
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableDictionary *)self->_mediaItems allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        [v9 removeAllObjects];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_mediaLock);
}

- (id)mediaItemWithHandle:(unint64_t)a3 inTypes:(id)a4
{
  id v6 = a4;
  p_mediaLock = &self->_mediaLock;
  os_unfair_lock_lock(&self->_mediaLock);
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(NSMutableDictionary *)self->_mediaItems allKeys];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    id v19 = v6;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        id v14 = [v13 count];
        long long v15 = +[NSNumber numberWithUnsignedInteger:a3];
        id v16 = objc_msgSend(v13, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, v14, 256, &stru_100034CB8);

        if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          long long v17 = [v13 objectAtIndexedSubscript:v16];

          goto LABEL_14;
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    long long v17 = 0;
LABEL_14:
    p_mediaLock = &self->_mediaLock;
    id v6 = v19;
  }
  else
  {
    long long v17 = 0;
  }

  os_unfair_lock_unlock(p_mediaLock);

  return v17;
}

- (id)orderedSetForType:(id)a3
{
  if (a3)
  {
    p_mediaLock = &self->_mediaLock;
    id v5 = a3;
    os_unfair_lock_lock(p_mediaLock);
    id v6 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:v5];

    id v7 = [v6 copy];
    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)arrayForType:(id)a3
{
  if (a3)
  {
    p_mediaLock = &self->_mediaLock;
    id v5 = a3;
    os_unfair_lock_lock(p_mediaLock);
    id v6 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:v5];

    id v7 = [v6 array];
    id v8 = [v7 copy];

    os_unfair_lock_unlock(p_mediaLock);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)performSelector:(id)a3 onTypes:(id)a4
{
  id v6 = a4;
  SEL v7 = NSSelectorFromString((NSString *)a3);
  os_unfair_lock_lock(&self->_mediaLock);
  id v19 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(NSMutableDictionary *)self->_mediaItems allKeys];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = [(NSMutableDictionary *)self->_mediaItems objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              if (objc_opt_respondsToSelector()) {
                [v18 performSelector:v7];
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v15);
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_mediaLock);
}

- (os_unfair_lock_s)mediaLock
{
  return self->_mediaLock;
}

- (void)setMediaLock:(os_unfair_lock_s)a3
{
  self->_mediaLock = a3;
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
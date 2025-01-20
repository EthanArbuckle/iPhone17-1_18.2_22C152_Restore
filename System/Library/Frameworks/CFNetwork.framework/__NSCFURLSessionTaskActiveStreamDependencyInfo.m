@interface __NSCFURLSessionTaskActiveStreamDependencyInfo
- (BOOL)isEmpty;
- (__NSCFURLSessionTaskActiveStreamDependencyInfo)init;
- (uint64_t)parentStreamIDForMimeType:(uint64_t)result;
- (uint64_t)parentStreamIDForURLString:(uint64_t)result;
- (uint64_t)removeStreamWithStreamID:(uint64_t)a3 requestURLString:;
- (void)dealloc;
@end

@implementation __NSCFURLSessionTaskActiveStreamDependencyInfo

- (BOOL)isEmpty
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = *(id *)(result + 16);
    if (!v2)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)(v1 + 16) = v2;
    }
    if ([v2 count])
    {
      return 0;
    }
    else
    {
      v3 = *(void **)(v1 + 24);
      return !v3 || [v3 count] == 0;
    }
  }
  return result;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 8);
    objc_setProperty_nonatomic(self, v3, 0, 16);
    objc_setProperty_nonatomic(self, v4, 0, 24);
  }
  v5.receiver = self;
  v5.super_class = (Class)__NSCFURLSessionTaskActiveStreamDependencyInfo;
  [(__NSCFURLSessionTaskActiveStreamDependencyInfo *)&v5 dealloc];
}

- (uint64_t)removeStreamWithStreamID:(uint64_t)a3 requestURLString:
{
  if (result)
  {
    uint64_t v5 = result;
    if ([*(id *)(result + 8) isEqualToNumber:a2]) {
      objc_setProperty_nonatomic((id)v5, v6, 0, 8);
    }
    id v7 = *(id *)(v5 + 16);
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)(v5 + 16) = v7;
    }
    objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", a3), "removeObject:", a2);
    id v8 = *(id *)(v5 + 16);
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)(v5 + 16) = v8;
    }
    result = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", a3), "count");
    if (!result)
    {
      id v9 = *(id *)(v5 + 16);
      if (!v9)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *(void *)(v5 + 16) = v9;
      }
      result = [v9 setObject:0 forKeyedSubscript:a3];
    }
    if (*(void *)(v5 + 24))
    {
      result = +[NSURLSessionTaskDependencyTree mimeTypeForURLString:]((uint64_t)NSURLSessionTaskDependencyTree, a3);
      if (result)
      {
        uint64_t v10 = result;
        result = [*(id *)(v5 + 24) objectForKey:result];
        if (result)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(v5 + 24), "objectForKeyedSubscript:", v10), "removeObject:", a2);
          result = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 24), "objectForKeyedSubscript:", v10), "count");
          if (!result)
          {
            v11 = *(void **)(v5 + 24);
            return [v11 setObject:0 forKeyedSubscript:v10];
          }
        }
      }
    }
  }
  return result;
}

- (__NSCFURLSessionTaskActiveStreamDependencyInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)__NSCFURLSessionTaskActiveStreamDependencyInfo;
  return [(__NSCFURLSessionTaskActiveStreamDependencyInfo *)&v3 init];
}

- (uint64_t)parentStreamIDForURLString:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(id *)(result + 16);
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)(v3 + 16) = v4;
    }
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", a2), "lastObject");
    return [v5 intValue];
  }
  return result;
}

- (uint64_t)parentStreamIDForMimeType:(uint64_t)result
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    if (!*(void *)(result + 24))
    {
      *(void *)(result + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v4 = *(id *)(v3 + 16);
      if (!v4)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *(void *)(v3 + 16) = v4;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
            uint64_t v10 = +[NSURLSessionTaskDependencyTree mimeTypeForURLString:]((uint64_t)NSURLSessionTaskDependencyTree, v9);
            if (v10)
            {
              uint64_t v11 = v10;
              id v12 = *(id *)(v3 + 16);
              if (!v12)
              {
                id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                *(void *)(v3 + 16) = v12;
              }
              objc_msgSend(*(id *)(v3 + 24), "setObject:forKeyedSubscript:", (id)objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", v9, (void)v13), "mutableCopy"), v11);
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }
    }
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 24), "objectForKeyedSubscript:", a2, (void)v13), "lastObject"), "intValue");
  }
  return result;
}

@end
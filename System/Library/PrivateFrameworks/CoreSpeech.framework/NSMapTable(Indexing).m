@interface NSMapTable(Indexing)
- (uint64_t)setObject:()Indexing forKeyedSubscript:;
- (void)enumerateObjects:()Indexing;
@end

@implementation NSMapTable(Indexing)

- (void)enumerateObjects:()Indexing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (uint64_t)setObject:()Indexing forKeyedSubscript:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

@end
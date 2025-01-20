@interface NSCoder(HMExtensions)
- (id)hm_decodeArrayOfConditionalObjects:()HMExtensions forKey:;
- (id)hm_decodeSetOfConditionalObjects:()HMExtensions forKey:;
- (void)hm_encodeArrayOfConditionalObjects:()HMExtensions forKey:;
- (void)hm_encodeSetOfConditionalObjects:()HMExtensions forKey:;
@end

@implementation NSCoder(HMExtensions)

- (id)hm_decodeSetOfConditionalObjects:()HMExtensions forKey:
{
  id v6 = a4;
  v13 = [NSString stringWithFormat:@"%@-$count", v6];
  int v7 = objc_msgSend(a1, "decodeInt32ForKey:");
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v7];
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [NSString stringWithFormat:@"%@-$%d", v6, v9];
      v11 = [a1 decodeObjectOfClass:a3 forKey:v10];
      if (v11) {
        [v8 addObject:v11];
      }

      uint64_t v9 = (v9 + 1);
    }
    while (v7 != v9);
  }

  return v8;
}

- (void)hm_encodeSetOfConditionalObjects:()HMExtensions forKey:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CAD0] set];
  [a1 encodeObject:v8 forKey:v7];

  v17 = [NSString stringWithFormat:@"%@-$count", v7];
  objc_msgSend(a1, "encodeInt32:forKey:", objc_msgSend(v6, "count"), v17);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        v16 = [NSString stringWithFormat:@"%@-$%d", v7, v12 + v14];
        [a1 encodeConditionalObject:v15 forKey:v16];

        ++v14;
      }
      while (v11 != v14);
      uint64_t v12 = (v12 + v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)hm_decodeArrayOfConditionalObjects:()HMExtensions forKey:
{
  id v6 = a4;
  uint64_t v13 = [NSString stringWithFormat:@"%@-$count", v6];
  int v7 = objc_msgSend(a1, "decodeInt32ForKey:");
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = [NSString stringWithFormat:@"%@-$%d", v6, v9];
      uint64_t v11 = [a1 decodeObjectOfClass:a3 forKey:v10];
      if (v11) {
        [v8 addObject:v11];
      }

      uint64_t v9 = (v9 + 1);
    }
    while (v7 != v9);
  }

  return v8;
}

- (void)hm_encodeArrayOfConditionalObjects:()HMExtensions forKey:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1C978] array];
  [a1 encodeObject:v8 forKey:v7];

  v17 = [NSString stringWithFormat:@"%@-$count", v7];
  objc_msgSend(a1, "encodeInt32:forKey:", objc_msgSend(v6, "count"), v17);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        v16 = [NSString stringWithFormat:@"%@-$%d", v7, v12 + v14];
        [a1 encodeConditionalObject:v15 forKey:v16];

        ++v14;
      }
      while (v11 != v14);
      uint64_t v12 = (v12 + v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

@end
@interface NSCountedSet(CLSNSCountedSet)
- (void)enumerateObjectsSortedByCountUsingBlock:()CLSNSCountedSet ascending:;
@end

@implementation NSCountedSet(CLSNSCountedSet)

- (void)enumerateObjectsSortedByCountUsingBlock:()CLSNSCountedSet ascending:
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__NSCountedSet_CLSNSCountedSet__enumerateObjectsSortedByCountUsingBlock_ascending___block_invoke;
  v26[3] = &unk_1E690F5F8;
  id v8 = v7;
  id v27 = v8;
  v28 = a1;
  [a1 enumerateObjectsUsingBlock:v26];
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"count" ascending:a4];
  v30[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v20 = v8;
  v11 = [v8 sortedArrayUsingDescriptors:v10];

  char v25 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
      v18 = [v17 objectForKeyedSubscript:@"object"];
      v19 = [v17 objectForKeyedSubscript:@"count"];
      v6[2](v6, v18, &v25, [v19 unsignedIntegerValue]);

      if (v25) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end
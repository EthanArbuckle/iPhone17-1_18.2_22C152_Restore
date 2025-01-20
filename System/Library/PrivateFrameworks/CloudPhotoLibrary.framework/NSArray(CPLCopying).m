@interface NSArray(CPLCopying)
- (__CFString)cplFullDescription;
- (uint64_t)cplDeepCopy;
@end

@implementation NSArray(CPLCopying)

- (uint64_t)cplDeepCopy
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  size_t v2 = [a1 count];
  if (v2)
  {
    size_t v3 = v2;
    memset(v11, 0, sizeof(v11));
    if (v2 >= 0xB) {
      v4 = malloc_type_calloc(v2, 8uLL, 0x80040B8603338uLL);
    }
    else {
      v4 = v11;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__NSArray_CPLCopying__cplDeepCopy__block_invoke;
    v10[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v10[4] = v4;
    [a1 enumerateObjectsUsingBlock:v10];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v4 count:v3];
    for (uint64_t i = 0; i != v3; ++i)
    {
      v8 = (void *)*((void *)v4 + i);
      *((void *)v4 + i) = 0;
    }
    if (v4 != v11) {
      free(v4);
    }
    for (uint64_t j = 72; j != -8; j -= 8)

    return v6;
  }
  else
  {
    return [a1 copy];
  }
}

- (__CFString)cplFullDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a1 count])
  {
    size_t v2 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obuint64_t j = a1;
    uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      char v5 = 1;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) cplFullDescription];
          v9 = [v8 componentsSeparatedByString:@"\n"];
          uint64_t v10 = [v9 componentsJoinedByString:@"\n  "];
          v11 = (void *)v10;
          if (v5) {
            uint64_t v12 = @"\n  %@";
          }
          else {
            uint64_t v12 = @",\n  %@";
          }
          -[__CFString appendFormat:](v2, "appendFormat:", v12, v10);

          char v5 = 0;
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v5 = 0;
      }
      while (v4);
    }

    [(__CFString *)v2 appendString:@"\n]"];
  }
  else
  {
    size_t v2 = @"[]";
  }
  return v2;
}

@end
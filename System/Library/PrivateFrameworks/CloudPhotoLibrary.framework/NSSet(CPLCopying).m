@interface NSSet(CPLCopying)
- (__CFString)cplFullDescription;
@end

@implementation NSSet(CPLCopying)

- (__CFString)cplFullDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a1 count])
  {
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"{(");
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = a1;
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
            v12 = @"\n  %@";
          }
          else {
            v12 = @",\n  %@";
          }
          -[__CFString appendFormat:](v2, "appendFormat:", v12, v10);

          char v5 = 0;
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v5 = 0;
      }
      while (v4);
    }

    [(__CFString *)v2 appendString:@"\n}"]);
  }
  else
  {
    v2 = @"{()}";
  }
  return v2;
}

@end
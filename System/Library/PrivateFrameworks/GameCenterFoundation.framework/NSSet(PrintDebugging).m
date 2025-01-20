@interface NSSet(PrintDebugging)
- (id)_gkDescriptionWithChildren:()PrintDebugging;
@end

@implementation NSSet(PrintDebugging)

- (id)_gkDescriptionWithChildren:()PrintDebugging
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = _gkTabStringForTabLevel(a3);
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_msgSend(v6, "appendFormat:", @"%@<%@ %p> {(\n"), v5, v8, a1;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a1;
  uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v14)
        {
          v15 = [v14 _gkDescriptionWithChildren:v12];
          v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v17 = [v15 stringByTrimmingCharactersInSet:v16];
        }
        else
        {
          v17 = @"(null)\n";
        }
        [v6 appendFormat:@"%@    %@", v5, v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  [v6 appendFormat:@"%@}\n"], v5);

  return v6;
}

@end
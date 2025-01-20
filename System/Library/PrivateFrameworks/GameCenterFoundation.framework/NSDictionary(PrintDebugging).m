@interface NSDictionary(PrintDebugging)
- (id)_gkDescriptionWithChildren:()PrintDebugging;
@end

@implementation NSDictionary(PrintDebugging)

- (id)_gkDescriptionWithChildren:()PrintDebugging
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _gkTabStringForTabLevel(a3);
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v24 = (void *)v5;
  [v6 appendFormat:@"%@<%@ %p> {\n", v5, v8, a1];

  v9 = v6;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = a1;
  id obj = [a1 allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    uint64_t v23 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v10 objectForKeyedSubscript:v15];
        v17 = v16;
        if (v16)
        {
          v18 = [v16 _gkDescriptionWithChildren:v23];
          v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v20 = [v18 stringByTrimmingCharactersInSet:v19];
        }
        else
        {
          v20 = @"(null)\n";
        }
        [v9 appendFormat:@"%@    %@ : %@", v24, v15, v20];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  [v9 appendFormat:@"%@}\n", v24];

  return v9;
}

@end
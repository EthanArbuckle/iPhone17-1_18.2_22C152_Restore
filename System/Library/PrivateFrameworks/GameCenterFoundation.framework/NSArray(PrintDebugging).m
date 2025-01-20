@interface NSArray(PrintDebugging)
- (id)_gkDescriptionWithChildren:()PrintDebugging;
@end

@implementation NSArray(PrintDebugging)

- (id)_gkDescriptionWithChildren:()PrintDebugging
{
  v5 = _gkTabStringForTabLevel(a3);
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 appendFormat:@"%@<%@ %p> {\n", v5, v8, a1];

  uint64_t v9 = [a1 count];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = a3 + 1;
    do
    {
      v13 = [a1 objectAtIndex:v11];
      v14 = v13;
      if (v13)
      {
        v15 = [v13 _gkDescriptionWithChildren:v12];
        v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v17 = [v15 stringByTrimmingCharactersInSet:v16];
      }
      else
      {
        v17 = @"(null)\n";
      }
      v18 = [NSNumber numberWithInteger:v11];
      [v6 appendFormat:@"%@    %@ : %@", v5, v18, v17];

      ++v11;
    }
    while (v10 != v11);
  }
  [v6 appendFormat:@"%@}\n", v5];

  return v6;
}

@end
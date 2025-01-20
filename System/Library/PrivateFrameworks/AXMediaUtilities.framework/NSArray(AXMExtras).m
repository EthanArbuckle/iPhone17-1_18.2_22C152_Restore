@interface NSArray(AXMExtras)
+ (id)axmArrayByIgnoringNilElementsWithCount:()AXMExtras;
@end

@implementation NSArray(AXMExtras)

+ (id)axmArrayByIgnoringNilElementsWithCount:()AXMExtras
{
  v10 = [MEMORY[0x1E4F1CA48] array];
  for (i = &a9; a3; --a3)
  {
    v11 = i++;
    if (*v11) {
      objc_msgSend(v10, "addObject:");
    }
  }

  return v10;
}

@end
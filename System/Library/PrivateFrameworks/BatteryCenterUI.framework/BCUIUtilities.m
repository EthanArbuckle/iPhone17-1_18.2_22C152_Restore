@interface BCUIUtilities
+ (BOOL)isAX1PlusLayoutRequiredForContentSizeCategory:(id)a3;
+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3;
@end

@implementation BCUIUtilities

+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  return UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a3, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;
}

+ (BOOL)isAX1PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  v3 = (NSString *)a3;
  v4 = (NSString *)*MEMORY[0x1E4FB2798];
  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2798])) {
    BOOL v5 = UIContentSizeCategoryCompareToCategory(v3, v4) == NSOrderedDescending;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

@end
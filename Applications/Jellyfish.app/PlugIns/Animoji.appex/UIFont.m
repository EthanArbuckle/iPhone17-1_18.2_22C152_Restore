@interface UIFont
+ (id)appropriateContentSizeCategoryForCategory:(id)a3 maxCategory:(id)a4;
@end

@implementation UIFont

+ (id)appropriateContentSizeCategoryForCategory:(id)a3 maxCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v7, (UIContentSizeCategory)v6) == NSOrderedDescending)
  {
    id v8 = v6;
  }

  return v8;
}

@end
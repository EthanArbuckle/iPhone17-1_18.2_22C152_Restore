@interface SUCellConfigurationCacheAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)configurationForRow:(unint64_t)a3;
@end

@implementation SUCellConfigurationCacheAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUCellConfigurationCache";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)configurationForRow:(unint64_t)a3
{
  v4 = [(SUCellConfigurationCacheAccessibility *)self safeValueForKey:@"_configurations"];
  unint64_t v5 = [v4 count];
  if (v5 <= a3)
  {
    unint64_t v6 = v5;
    v7 = [v4 objectAtIndex:0];
    v8 = (objc_class *)objc_opt_class();

    if (a3 + 5 != v6)
    {
      if (a3 + 5 - v6 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = a3 + 5 - v6;
      }
      do
      {
        id v10 = objc_alloc_init(v8);
        [v4 addObject:v10];

        --v9;
      }
      while (v9);
    }
  }
  v11 = [v4 objectAtIndex:a3];

  return v11;
}

@end
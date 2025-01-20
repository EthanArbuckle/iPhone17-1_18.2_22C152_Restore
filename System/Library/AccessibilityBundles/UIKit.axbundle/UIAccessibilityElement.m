@interface UIAccessibilityElement
- (BOOL)elementMatchesSubview:(void *)a1;
- (BOOL)representsSubview;
@end

@implementation UIAccessibilityElement

- (BOOL)representsSubview
{
  id v4 = a1;
  if (a1)
  {
    id location = (id)[v4 _accessibilityValueForKey:@"TableViewStorage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v1 = (id)[location objectForKey:@"class"];
      BOOL v5 = v1 != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (BOOL)elementMatchesSubview:(void *)a1
{
  id v11 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v11)
  {
    id v8 = (id)[v11 _accessibilityValueForKey:@"TableViewStorage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((id)[v8 objectForKey:@"class"])
      {
        v6 = (NSString *)(id)[v8 objectForKey:@"size"];
        CGSize v2 = CGSizeFromString(v6);

        BOOL v7 = 0;
        if (objc_opt_isKindOfClass())
        {
          [location frame];
          BOOL v7 = __CGSizeEqualToSize_1(v2.width, v2.height, v3, v4);
        }
        BOOL v12 = v7;
        int v9 = 1;
      }
      else
      {
        BOOL v12 = 0;
        int v9 = 1;
      }
    }
    else
    {
      BOOL v12 = 0;
      int v9 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    BOOL v12 = 0;
    int v9 = 1;
  }
  objc_storeStrong(&location, 0);
  return v12;
}

@end
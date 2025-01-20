@interface UIViewController(JITAppKit)
+ (id)jitappkit:()JITAppKit;
- (id)identifier;
- (id)tkPage;
- (void)setIdentifier:()JITAppKit;
- (void)setTkPage:()JITAppKit;
@end

@implementation UIViewController(JITAppKit)

- (id)tkPage
{
  return objc_getAssociatedObject(a1, &PAGE_KEY);
}

- (void)setTkPage:()JITAppKit
{
  id v4 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_setAssociatedObject(v4, &PAGE_KEY, location[0], (void *)1);
  objc_storeStrong(location, 0);
}

- (id)identifier
{
  id v6 = a1;
  v5[1] = a2;
  v5[0] = objc_getAssociatedObject(a1, &IDENTIFIER_KEY);
  if (!v5[0])
  {
    id v4 = (id)[v6 tkPage];
    v5[0] = (id)[v4 viewName];
  }
  id v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)setIdentifier:()JITAppKit
{
  id v4 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  objc_setAssociatedObject(v4, &IDENTIFIER_KEY, location[0], (void *)3);
  objc_storeStrong(location, 0);
}

+ (id)jitappkit:()JITAppKit
{
  id location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v5 = +[TKApplication shared];
  id v4 = (id)[v5 loadPage:location[0]];
  id v6 = WithFinalizer(v4);

  objc_storeStrong(location, 0);
  return v6;
}

@end
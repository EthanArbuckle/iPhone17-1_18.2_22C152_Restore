@interface NSDictionary(Utils)
- (id)dds_dateForKey:()Utils;
- (id)dds_numberForKey:()Utils;
- (id)dds_stringForKey:()Utils;
@end

@implementation NSDictionary(Utils)

- (id)dds_stringForKey:()Utils
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dds_numberForKey:()Utils
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dds_dateForKey:()Utils
{
  id v4 = a3;
  v5 = [a1 objectForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
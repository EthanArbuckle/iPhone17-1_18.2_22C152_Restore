@interface HMFPrivateObjectFormatter
+ (id)defaultFormatter;
- (id)privateStringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation HMFPrivateObjectFormatter

- (id)privateStringForObjectValue:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 privateDescription];
LABEL_5:
    v5 = (__CFString *)v4;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 redactedDescription];
    goto LABEL_5;
  }
  v5 = @"<redacted>";
LABEL_7:

  return v5;
}

+ (id)defaultFormatter
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (id)stringForObjectValue:(id)a3
{
  return (id)[a3 description];
}

@end
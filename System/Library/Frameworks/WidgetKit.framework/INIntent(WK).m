@interface INIntent(WK)
- (id)_wk_asMigratedAppIntent;
@end

@implementation INIntent(WK)

- (id)_wk_asMigratedAppIntent
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
  }
  else if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 _asMigratedAppIntent];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

@end
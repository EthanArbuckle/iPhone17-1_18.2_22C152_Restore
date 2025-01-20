@interface NSMutableDictionary(CMSCodingUtils)
- (uint64_t)cmsSetOptionalObject:()CMSCodingUtils forKey:;
- (void)cmsSetNullableCodedObject:()CMSCodingUtils forKey:;
- (void)cmsSetNullableObject:()CMSCodingUtils forKey:;
- (void)cmsSetOptionalCodedObject:()CMSCodingUtils forKey:;
@end

@implementation NSMutableDictionary(CMSCodingUtils)

- (void)cmsSetOptionalCodedObject:()CMSCodingUtils forKey:
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v9 cmsCoded], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = (void *)v7;
      [a1 setObject:v7 forKey:v6];
    }
    else
    {
      [a1 removeObjectForKey:v6];
    }
  }
}

- (void)cmsSetNullableCodedObject:()CMSCodingUtils forKey:
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v9 cmsCoded], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v7 = [MEMORY[0x263EFF9D0] null];
    }
    v8 = (void *)v7;
    [a1 setObject:v7 forKey:v6];
  }
}

- (uint64_t)cmsSetOptionalObject:()CMSCodingUtils forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

- (void)cmsSetNullableObject:()CMSCodingUtils forKey:
{
  if (a3)
  {
    id v8 = a4;
    objc_msgSend(a1, "setObject:forKey:", a3);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFF9D0];
    id v7 = a4;
    id v8 = [v6 null];
    objc_msgSend(a1, "setObject:forKey:");
  }
}

@end
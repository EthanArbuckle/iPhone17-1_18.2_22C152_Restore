@interface NSDictionary(Safe)
- (id)alwaysGetArrayForKey:()Safe default:;
- (id)alwaysGetDictionaryForKey:()Safe default:;
- (id)alwaysGetKey:()Safe ofType:;
- (id)alwaysGetKey:()Safe ofType:default:;
- (id)alwaysGetNumberForKey:()Safe default:;
- (id)alwaysGetStringForKey:()Safe default:;
- (id)getArrayForKey:()Safe;
- (id)getDictionaryForKey:()Safe;
- (id)getKey:()Safe ofType:;
- (id)getNumberForKey:()Safe;
- (id)getStringForKey:()Safe;
- (uint64_t)getBoolForKey:()Safe;
@end

@implementation NSDictionary(Safe)

- (id)getStringForKey:()Safe
{
  id v4 = a3;
  v5 = [a1 getKey:v4 ofType:objc_opt_class()];

  return v5;
}

- (id)getNumberForKey:()Safe
{
  id v4 = a3;
  v5 = [a1 getKey:v4 ofType:objc_opt_class()];

  return v5;
}

- (uint64_t)getBoolForKey:()Safe
{
  id v4 = a3;
  v5 = [a1 getKey:v4 ofType:objc_opt_class()];

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (id)getDictionaryForKey:()Safe
{
  id v4 = a3;
  v5 = [a1 getKey:v4 ofType:objc_opt_class()];

  return v5;
}

- (id)getArrayForKey:()Safe
{
  id v4 = a3;
  v5 = [a1 getKey:v4 ofType:objc_opt_class()];

  return v5;
}

- (id)getKey:()Safe ofType:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)alwaysGetStringForKey:()Safe default:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 alwaysGetKey:v7 ofType:objc_opt_class() default:v6];

  return v8;
}

- (id)alwaysGetNumberForKey:()Safe default:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 alwaysGetKey:v7 ofType:objc_opt_class() default:v6];

  return v8;
}

- (id)alwaysGetDictionaryForKey:()Safe default:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 alwaysGetKey:v7 ofType:objc_opt_class() default:v6];

  return v8;
}

- (id)alwaysGetArrayForKey:()Safe default:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 alwaysGetKey:v7 ofType:objc_opt_class() default:v6];

  return v8;
}

- (id)alwaysGetKey:()Safe ofType:default:
{
  id v8 = a5;
  v9 = [a1 getKey:a3 ofType:a4];
  if (!v9) {
    v9 = (void *)[v8 copy];
  }

  return v9;
}

- (id)alwaysGetKey:()Safe ofType:
{
  objc_msgSend(a1, "getKey:ofType:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    id v5 = objc_alloc_init(a4);
  }
  return v5;
}

@end
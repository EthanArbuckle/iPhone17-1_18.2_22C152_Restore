@interface NSMutableDictionary(FMAdditions)
- (id)fm_objectForKey:()FMAdditions withDefaultValue:;
- (void)fm_safeSetObject:()FMAdditions forKey:;
- (void)fm_safelyMapKey:()FMAdditions toObject:;
- (void)fm_safelySetObject:()FMAdditions forKey:;
@end

@implementation NSMutableDictionary(FMAdditions)

- (void)fm_safeSetObject:()FMAdditions forKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKeyedSubscript:");
    }
  }
  return a1;
}

- (id)fm_objectForKey:()FMAdditions withDefaultValue:
{
  id v6 = a3;
  v7 = a4;
  v8 = [a1 objectForKeyedSubscript:v6];
  if (!v8)
  {
    v8 = v7[2](v7);
    [a1 setObject:v8 forKeyedSubscript:v6];
  }

  return v8;
}

- (void)fm_safelySetObject:()FMAdditions forKey:
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v7) {
      [a1 setObject:v7 forKeyedSubscript:v6];
    }
    else {
      [a1 removeObjectForKey:v6];
    }
  }
}

- (void)fm_safelyMapKey:()FMAdditions toObject:
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    if (v6) {
      [a1 setObject:v6 forKeyedSubscript:v7];
    }
    else {
      [a1 removeObjectForKey:v7];
    }
  }
}

@end
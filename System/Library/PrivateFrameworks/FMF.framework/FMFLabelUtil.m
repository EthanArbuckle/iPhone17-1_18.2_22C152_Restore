@interface FMFLabelUtil
+ (BOOL)isDefaultLabel:(id)a3;
+ (id)defaultLabelKeys;
@end

@implementation FMFLabelUtil

+ (id)defaultLabelKeys
{
  v2 = (void *)_defaultLabelKeys;
  if (!_defaultLabelKeys)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"_$!<home>!$_", @"_$!<work>!$_", @"_$!<school>!$_", @"_$!<gym>!$_", 0);
    v4 = (void *)_defaultLabelKeys;
    _defaultLabelKeys = v3;

    v2 = (void *)_defaultLabelKeys;
  }

  return v2;
}

+ (BOOL)isDefaultLabel:(id)a3
{
  id v4 = a3;
  v5 = [a1 defaultLabelKeys];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

@end
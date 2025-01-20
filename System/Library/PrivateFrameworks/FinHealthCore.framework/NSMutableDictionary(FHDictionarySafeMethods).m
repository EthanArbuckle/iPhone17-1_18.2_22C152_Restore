@interface NSMutableDictionary(FHDictionarySafeMethods)
- (void)safelyAddObjectToArrayCollection:()FHDictionarySafeMethods forKey:;
- (void)safelyAddObjectToSetCollection:()FHDictionarySafeMethods forKey:;
- (void)safelySetObject:()FHDictionarySafeMethods forKey:;
- (void)setBool:()FHDictionarySafeMethods forKey:;
- (void)setDate:()FHDictionarySafeMethods forKey:;
- (void)setDouble:()FHDictionarySafeMethods forKey:;
- (void)setInt32:()FHDictionarySafeMethods forKey:;
- (void)setInteger:()FHDictionarySafeMethods forKey:;
- (void)setLongLong:()FHDictionarySafeMethods forKey:;
- (void)setObjectOrNull:()FHDictionarySafeMethods forKey:;
- (void)setOrAddToDecimalValue:()FHDictionarySafeMethods forKey:;
- (void)setOrAddToDoubleValue:()FHDictionarySafeMethods forKey:;
- (void)setUnsignedLongLong:()FHDictionarySafeMethods forKey:;
@end

@implementation NSMutableDictionary(FHDictionarySafeMethods)

- (void)safelySetObject:()FHDictionarySafeMethods forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (void)setObjectOrNull:()FHDictionarySafeMethods forKey:
{
  if (a3)
  {
    id v8 = a4;
    objc_msgSend(a1, "setObject:forKey:", a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFF9D0];
    id v7 = a4;
    id v8 = [v6 null];
    objc_msgSend(a1, "setObject:forKey:");
  }
}

- (void)setInt32:()FHDictionarySafeMethods forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setInteger:()FHDictionarySafeMethods forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setLongLong:()FHDictionarySafeMethods forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithLongLong:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setUnsignedLongLong:()FHDictionarySafeMethods forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedLongLong:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setDouble:()FHDictionarySafeMethods forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a2];
  [a1 setObject:v8 forKey:v7];
}

- (void)setBool:()FHDictionarySafeMethods forKey:
{
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:a3];
  [a1 setObject:v8 forKey:v7];
}

- (void)setDate:()FHDictionarySafeMethods forKey:
{
  id v6 = a4;
  id v7 = [a3 description];
  [a1 safelySetObject:v7 forKey:v6];
}

- (void)setOrAddToDecimalValue:()FHDictionarySafeMethods forKey:
{
  id v6 = a4;
  [a3 doubleValue];
  objc_msgSend(a1, "setOrAddToDoubleValue:forKey:", v6);
}

- (void)setOrAddToDoubleValue:()FHDictionarySafeMethods forKey:
{
  id v6 = a4;
  id v7 = [a1 objectForKey:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F087B0] zero];
  }
  id v13 = v9;

  id v10 = objc_alloc(MEMORY[0x263F087B0]);
  [v13 doubleValue];
  v12 = (void *)[v10 initWithDouble:v11 + a2];
  [a1 safelySetObject:v12 forKey:v6];
}

- (void)safelyAddObjectToArrayCollection:()FHDictionarySafeMethods forKey:
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [a1 objectForKey:v6];
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF980] arrayWithArray:v7];
    [v8 addObject:v10];
    uint64_t v9 = [v8 copy];
    [a1 safelySetObject:v9 forKey:v6];

    id v6 = (id)v9;
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v10, 0);
    [a1 safelySetObject:v8 forKey:v6];
  }
}

- (void)safelyAddObjectToSetCollection:()FHDictionarySafeMethods forKey:
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [a1 objectForKey:v6];
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF9C0] setWithSet:v7];
    [v8 addObject:v10];
    uint64_t v9 = [v8 copy];
    [a1 safelySetObject:v9 forKey:v6];

    id v6 = (id)v9;
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v10, 0);
    [a1 safelySetObject:v8 forKey:v6];
  }
}

@end
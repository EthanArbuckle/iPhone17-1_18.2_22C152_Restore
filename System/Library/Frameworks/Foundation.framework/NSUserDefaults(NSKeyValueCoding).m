@interface NSUserDefaults(NSKeyValueCoding)
- (uint64_t)setValue:()NSKeyValueCoding forKey:;
- (uint64_t)valueForKey:()NSKeyValueCoding;
@end

@implementation NSUserDefaults(NSKeyValueCoding)

- (uint64_t)setValue:()NSKeyValueCoding forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

- (uint64_t)valueForKey:()NSKeyValueCoding
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 length];
  if (v5
    && (uint64_t v6 = v5, [a3 characterAtIndex:0] == 64)
    && (uint64_t v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0)) != 0)
  {
    v8 = (void *)v7;
    v11.receiver = a1;
    v11.super_class = (Class)&off_1ECAF4220;
    id v9 = objc_msgSendSuper2(&v11, sel_valueForKey_, v7);

    return (uint64_t)v9;
  }
  else
  {
    return [a1 objectForKey:a3];
  }
}

@end
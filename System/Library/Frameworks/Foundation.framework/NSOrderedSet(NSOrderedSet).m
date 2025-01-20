@interface NSOrderedSet(NSOrderedSet)
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (uint64_t)supportsSecureCoding;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSOrderedSet;
- (uint64_t)initWithCoder:()NSOrderedSet;
@end

@implementation NSOrderedSet(NSOrderedSet)

- (uint64_t)classForCoder
{
  return self;
}

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)encodeWithCoder:()NSOrderedSet
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBE0]);
  }
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSOrderedSets cannot be encoded by non-keyed coders" userInfo:0]);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a1);
        }
        [a3 encodeObject:*(void *)(*((void *)&v12 + 1) + 8 * v10), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object.%lu", v8 + v10) forKey];
        ++v10;
      }
      while (v7 != v10);
      uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
      uint64_t v7 = result;
      v8 += v10;
    }
    while (result);
  }
  return result;
}

- (uint64_t)initWithCoder:()NSOrderedSet
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSOrderedSets cannot be decoded by non-keyed coders" userInfo:0]);
  }
  unint64_t v6 = 128;
  uint64_t v7 = NSAllocateObjectArray(0x80uLL);
  for (unint64_t i = 0; ; ++i)
  {
    if (v6 > i) {
      goto LABEL_6;
    }
    v6 *= 2;
    uint64_t v9 = NSReallocateObjectArray(v7, v6);
    if (!v9) {
      break;
    }
    uint64_t v7 = v9;
LABEL_6:
    uint64_t v10 = +[NSString stringWithFormat:@"NS.object.%lu", i];
    if (![a3 containsValueForKey:v10])
    {
      uint64_t v12 = [a1 initWithObjects:v7 count:i];
      goto LABEL_12;
    }
    uint64_t v11 = [a3 decodeObjectForKey:v10];
    *((void *)v7 + i) = v11;
    if (!v11) {
      goto LABEL_11;
    }
  }
  long long v15 = @"NSLocalizedDescription";
  v16[0] = +[NSString stringWithFormat:@"%@: ordered set is too large to decode (%llu)", _NSMethodExceptionProem((objc_class *)a1, a2), v6];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F1D148], 4864, v13));
  uint64_t v7 = 0;
LABEL_11:
  uint64_t v12 = 0;
LABEL_12:
  free(v7);
  return v12;
}

@end
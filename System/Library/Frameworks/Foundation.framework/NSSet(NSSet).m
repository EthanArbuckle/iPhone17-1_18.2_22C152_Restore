@interface NSSet(NSSet)
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (uint64_t)supportsSecureCoding;
- (uint64_t)classForCoder;
- (uint64_t)initWithCoder:()NSSet;
- (void)encodeWithCoder:()NSSet;
@end

@implementation NSSet(NSSet)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)classForCoder
{
  return self;
}

- (void)encodeWithCoder:()NSSet
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBE8]);
  }
  if ([a3 allowsKeyedCoding])
  {
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    {
      unint64_t v6 = [a1 count];
      unint64_t v7 = v6;
      if (v6 >> 60)
      {
        CFStringRef v20 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
        v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v20 userInfo:0];
        CFRelease(v20);
        objc_exception_throw(v21);
      }
      uint64_t v22 = 0;
      uint64_t v8 = _CFCreateArrayStorage();
      [a1 getObjects:v8];
      if (v8)
      {
        if (v7)
        {
          v9 = (id *)v8;
          unint64_t v10 = v7;
          do
          {
            id v11 = *v9++;
            --v10;
          }
          while (v10);
        }
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C978]) _initByAdoptingBuffer:v8 count:v7 size:v7];
      }
      else
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:0 count:v7];
      }
      v15 = (void *)v12;
      [a3 _encodeArrayOfObjects:v12 forKey:@"NS.objects"];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v16 = [a1 countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v16)
      {
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(a1);
            }
            [a3 encodeObject:*(void *)(*((void *)&v24 + 1) + 8 * i), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object.%ld", v17 + i) forKey];
          }
          uint64_t v16 = [a1 countByEnumeratingWithState:&v24 objects:v23 count:16];
          v17 += i;
        }
        while (v16);
      }
    }
  }
  else
  {
    LODWORD(v22) = [a1 count];
    [a3 encodeValueOfObjCType:"I" at:&v22];
    v13 = (void *)[a1 objectEnumerator];
    for (uint64_t j = [v13 nextObject]; j; uint64_t j = objc_msgSend(v13, "nextObject"))
      [a3 encodeBycopyObject:j];
  }
}

- (uint64_t)initWithCoder:()NSSet
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    unsigned int v27 = 0;
    [a3 decodeValueOfObjCType:"I" at:&v27 size:4];
    uint64_t v8 = v27;
    if (v27) {
      uint64_t v9 = v27;
    }
    else {
      uint64_t v9 = 1;
    }
    double v10 = MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)v26 - v11;
    v26[1] = 0;
    if (v8 >= 0x101)
    {
      v13 = (char *)_CFCreateArrayStorage();
      uint64_t v12 = v13;
    }
    else
    {
      v13 = 0;
      if (!v8)
      {
LABEL_18:
        uint64_t v16 = objc_msgSend(a1, "initWithObjects:count:", v12, v8, v10);
        for (uint64_t i = 8 * v8; i; i -= 8)
        {
          uint64_t v18 = *(void **)&v12[i - 8];
        }
        free(v13);
        return v16;
      }
    }
    v14 = v12;
    uint64_t v15 = v8;
    do
    {
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", v14, 8, v10);
      v14 += 8;
      --v15;
    }
    while (v15);
    goto LABEL_18;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    && [a3 containsValueForKey:@"NS.objects"])
  {
    uint64_t v6 = [a3 _decodeArrayOfObjectsForKey:@"NS.objects"];
    if (v6)
    {
      return [a1 initWithArray:v6];
    }
    a1 = 0;
  }
  v19 = (char *)NSAllocateObjectArray(0x80uLL);
  if (!v19) {
    return 0;
  }
  CFStringRef v20 = v19;
  unint64_t v21 = 0;
  unint64_t v22 = 128;
  while (1)
  {
    if (v22 > v21) {
      goto LABEL_28;
    }
    v22 *= 2;
    v23 = NSReallocateObjectArray(v20, v22);
    if (!v23) {
      break;
    }
    CFStringRef v20 = v23;
LABEL_28:
    long long v24 = +[NSString stringWithFormat:@"NS.object.%ld", v21];
    if (![a3 containsValueForKey:v24])
    {
      uint64_t v16 = [a1 initWithObjects:v20 count:v21];
LABEL_33:
      free(v20);
      return v16;
    }
    uint64_t v25 = [a3 decodeObjectForKey:v24];
    *(void *)&v20[8 * v21] = v25;
    if (!v25)
    {
      uint64_t v16 = 0;
      goto LABEL_33;
    }
    ++v21;
  }
  free(v20);
  uint64_t v28 = @"NSLocalizedDescription";
  v29[0] = +[NSString stringWithFormat:@"%@: set is too large to unarchive (%qd)", _NSMethodExceptionProem((objc_class *)a1, a2), v22];
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1)));
  return 0;
}

@end
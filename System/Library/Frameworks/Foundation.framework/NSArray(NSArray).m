@interface NSArray(NSArray)
+ (id)arrayWithContentsOfFile:()NSArray;
+ (id)arrayWithContentsOfURL:()NSArray;
+ (id)arrayWithContentsOfURL:()NSArray error:;
+ (id)newWithContentsOf:()NSArray immutable:;
+ (id)newWithContentsOf:()NSArray immutable:error:;
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
- (id)debugDescription;
- (id)initWithContentsOfURL:()NSArray error:;
- (uint64_t)_stringToWrite;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSArray;
- (uint64_t)initWithCoder:()NSArray;
- (uint64_t)initWithContentsOfFile:()NSArray;
- (uint64_t)initWithContentsOfURL:()NSArray;
- (uint64_t)sortedArrayHint;
- (uint64_t)sortedArrayUsingFunction:()NSArray context:hint:;
- (uint64_t)sortedArrayUsingSelector:()NSArray hint:;
- (uint64_t)writeToFile:()NSArray atomically:;
- (uint64_t)writeToURL:()NSArray atomically:;
- (uint64_t)writeToURL:()NSArray error:;
@end

@implementation NSArray(NSArray)

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)encodeWithCoder:()NSArray
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBC8]);
  }
  if ([a3 allowsKeyedCoding])
  {
    Class = (__objc2_class *)object_getClass(a3);
    if (Class == NSKeyedArchiver) {
      return [a3 _encodeArrayOfObjects:a1 forKey:@"NS.objects"];
    }
    v8 = (objc_class *)Class;
    if (Class == NSXPCEncoder) {
      return [a3 _encodeArrayOfObjects:a1 forKey:@"NS.objects"];
    }
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__NSArray_NSArray__encodeWithCoder___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_encodeObject_forKey_;
    if (qword_1EB1ED140 != -1) {
      dispatch_once(&qword_1EB1ED140, block);
    }
    IMP MethodImplementation = class_getMethodImplementation(v8, sel_encodeObject_forKey_);
    if (MethodImplementation == (IMP)_MergedGlobals_90 || MethodImplementation == (IMP)qword_1EB1ED138)
    {
      return [a3 _encodeArrayOfObjects:a1 forKey:@"NS.objects"];
    }
    else
    {
LABEL_12:
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t result = [a1 countByEnumeratingWithState:&v22 objects:v21 count:16];
      if (result)
      {
        uint64_t v11 = result;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v23;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(a1);
            }
            [a3 encodeObject:*(void *)(*((void *)&v22 + 1) + 8 * v14), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object.%ld", v12 + v14) forKey];
            ++v14;
          }
          while (v11 != v14);
          uint64_t result = [a1 countByEnumeratingWithState:&v22 objects:v21 count:16];
          uint64_t v11 = result;
          v12 += v14;
        }
        while (result);
      }
    }
  }
  else
  {
    unint64_t v15 = [a1 count];
    if (v15 >> 29)
    {
      return objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", @"NSArchiverArchiveInconsistency", 4864, @"%@: array count (%lu) makes array too large to fit in non-keyed archive", _NSMethodExceptionProem((objc_class *)a1, a2), v15);
    }
    else
    {
      int v20 = v15;
      [a3 encodeValueOfObjCType:"i" at:&v20];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t result = [a1 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (result)
      {
        uint64_t v16 = result;
        uint64_t v17 = *(void *)v28;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(a1);
            }
            [a3 encodeBycopyObject:*(void *)(*((void *)&v27 + 1) + 8 * v18++)];
          }
          while (v16 != v18);
          uint64_t result = [a1 countByEnumeratingWithState:&v27 objects:v26 count:16];
          uint64_t v16 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (uint64_t)initWithCoder:()NSArray
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    unsigned int v26 = 0;
    [a3 decodeValueOfObjCType:"i" at:&v26 size:4];
    uint64_t v8 = v26;
    if (v26) {
      uint64_t v9 = v26;
    }
    else {
      uint64_t v9 = 1;
    }
    MEMORY[0x1F4188790](v9);
    uint64_t v11 = (char *)v25 - v10;
    v25[1] = 0;
    if (v8 >= 0x101)
    {
      uint64_t v12 = (char *)_CFCreateArrayStorage();
      uint64_t v11 = v12;
    }
    else
    {
      uint64_t v12 = 0;
      if (!v8)
      {
LABEL_18:
        uint64_t v15 = [a1 initWithObjects:v11 count:v8];
        for (uint64_t i = 8 * v8; i; i -= 8)
        {
          uint64_t v17 = *(void **)&v11[i - 8];
        }
        free(v12);
        return v15;
      }
    }
    uint64_t v13 = v11;
    uint64_t v14 = v8;
    do
    {
      [a3 decodeValueOfObjCType:"@" at:v13 size:8];
      v13 += 8;
      --v14;
    }
    while (v14);
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
  uint64_t v18 = (char *)NSAllocateObjectArray(0x80uLL);
  if (!v18) {
    return 0;
  }
  v19 = v18;
  unint64_t v20 = 0;
  unint64_t v21 = 128;
  while (1)
  {
    if (v21 > v20) {
      goto LABEL_28;
    }
    v21 *= 2;
    long long v22 = NSReallocateObjectArray(v19, v21);
    if (!v22) {
      break;
    }
    v19 = v22;
LABEL_28:
    long long v23 = +[NSString stringWithFormat:@"NS.object.%ld", v20];
    if (![a3 containsValueForKey:v23])
    {
      uint64_t v15 = [a1 initWithObjects:v19 count:v20];
      goto LABEL_35;
    }
    uint64_t v24 = [a3 decodeObjectForKey:v23];
    *(void *)&v19[8 * v20] = v24;
    if (!v24) {
      goto LABEL_34;
    }
    ++v20;
  }
  long long v27 = @"NSLocalizedDescription";
  v28[0] = +[NSString stringWithFormat:@"%@: array is too large to unarchive (%qd)", _NSMethodExceptionProem((objc_class *)a1, a2), v21];
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1)));
LABEL_34:
  uint64_t v15 = 0;
LABEL_35:
  free(v19);
  return v15;
}

- (uint64_t)writeToFile:()NSArray atomically:
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBC8]);
  }
  uint64_t v8 = (void *)MEMORY[0x185308110]();
  if (_NSIsPList((uint64_t)a1, 1, (void *)[MEMORY[0x1E4F1CA80] set]) == 3)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0
      || !objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSWriteOldStylePropertyLists"))
    {
      uint64_t v9 = [(NSData *)+[NSPropertyListSerialization dataWithPropertyList:a1 format:100 options:0 error:0] writeToFile:a3 atomically:a4];
    }
    else
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "_stringToWrite"), "writeToFile:atomically:encoding:error:", a3, a4, +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"), 0);
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (uint64_t)classForCoder
{
  return self;
}

- (id)debugDescription
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBC8]);
  }
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSMutableString) init];
  objc_msgSend(v3, "appendFormat:", @"<%@ %p>(\n"), objc_opt_class(), a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a1);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (v6) {
          [v3 appendString:@",\n"];
        }
        objc_msgSend(v3, "appendString:", objc_msgSend(v9, "debugDescription"));
        ++v8;
        char v6 = 1;
      }
      while (v5 != v8);
      uint64_t v5 = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }
  [v3 appendString:@"\n\n"]);
  return v3;
}

+ (id)arrayWithContentsOfURL:()NSArray error:
{
  uint64_t v4 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3 error:a4];

  return v4;
}

+ (id)newWithContentsOf:()NSArray immutable:error:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  long long v15 = 0;
  if (a3)
  {
    int v8 = _NSIsNSString();
    id v9 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
    uint64_t v10 = v8
        ? [v9 initWithContentsOfFile:a3 options:0 error:&v15]
        : [v9 initWithContentsOfURL:a3 options:0 error:&v15];
    uint64_t v11 = (void *)v10;
    if (v10)
    {
      id v12 = +[NSPropertyListSerialization propertyListWithData:v10 options:a4 ^ 1u format:0 error:&v15];

      if (_NSIsNSArray()) {
        goto LABEL_9;
      }

      long long v13 = [[NSString alloc] initWithFormat:@"%@ did not contain a top-level array value", a3];
      uint64_t v16 = @"NSDebugDescription";
      v17[0] = v13;
      long long v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1]);
    }
  }
  id v12 = 0;
LABEL_9:
  if (a5) {
    *a5 = v15;
  }
  return v12;
}

+ (id)arrayWithContentsOfFile:()NSArray
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfFile:a3];

  return v3;
}

+ (id)newWithContentsOf:()NSArray immutable:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  long long v13 = 0;
  if (!a3) {
    return 0;
  }
  int v6 = _NSIsNSString();
  id v7 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
  uint64_t v8 = v6
     ? [v7 initWithContentsOfFile:a3 options:0 error:&v13]
     : [v7 initWithContentsOfURL:a3 options:0 error:&v13];
  id v9 = (void *)v8;
  if (!v8) {
    return 0;
  }
  id v10 = +[NSPropertyListSerialization propertyListWithData:v8 options:a4 ^ 1u format:0 error:&v13];

  if ((_NSIsNSArray() & 1) == 0)
  {

    uint64_t v11 = [[NSString alloc] initWithFormat:@"%@ did not contain a top-level array value", a3];
    long long v14 = @"NSDebugDescription";
    v15[0] = v11;
    long long v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1]);

    return 0;
  }
  return v10;
}

- (uint64_t)sortedArrayUsingFunction:()NSArray context:hint:
{
  if (!a3)
  {
    v35 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: compare function pointer is NULL", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v35);
  }
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v5, *MEMORY[0x1E4F1CBC8]);
  }
  unint64_t v8 = [a5 length];
  unint64_t v9 = v8 >> 2;
  uint64_t v10 = [(objc_class *)a1 count];
  uint64_t v11 = (char *)NSAllocateObjectArray(2 * v10 + (v8 >> 2));
  bzero(v11, v8 & 0xFFFFFFFFFFFFFFFCLL);
  -[objc_class getObjects:range:](a1, "getObjects:range:", &v11[8 * (v8 >> 2)], 0, v10);
  size_t v12 = (v8 & 0xFFFFFFFFFFFFFFFCLL) + 13;
  long long v13 = malloc_type_calloc(v12, 0x10uLL, 0x100004000313F17uLL);
  long long v14 = (unsigned int *)[a5 bytes];
  if (v8 >= 4)
  {
    uint64_t v15 = 0;
    if (v9 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v8 >> 2;
    }
    do
    {
      unsigned int v18 = *v14++;
      uint64_t v17 = v18;
      uint64_t v19 = -8;
      size_t v20 = v18;
      while (1)
      {
        size_t v21 = v20 % v12;
        if (!v13[2 * v21]) {
          break;
        }
        size_t v20 = v21 + 5;
        BOOL v22 = __CFADD__(v19++, 1);
        if (v22)
        {
          ++v15;
          goto LABEL_14;
        }
      }
      v13[2 * v21] = ++v15;
      *(void *)((char *)v13 + ((16 * v21) | 8)) = v17;
LABEL_14:
      ;
    }
    while (v15 != v16);
  }
  if (v10)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v24 = *(void **)&v11[8 * i + 8 * v9];
      uint64_t v25 = [v24 hash];
      uint64_t v26 = -8;
      unint64_t v27 = v25;
      while (1)
      {
        size_t v28 = v27 % v12;
        uint64_t v29 = v13[2 * v28];
        if (v29)
        {
          if (*(void *)((char *)v13 + ((16 * v28) | 8)) == v25) {
            break;
          }
        }
        unint64_t v27 = v28 + 5;
        BOOL v22 = __CFADD__(v26++, 1);
        if (v22) {
          goto LABEL_25;
        }
      }
      if (!*(void *)&v11[8 * v29 - 8])
      {
        *(void *)&v11[8 * v29 - 8] = v24;
        *(void *)&v11[8 * i + 8 * v9] = 0;
      }
LABEL_25:
      ;
    }
  }
  free(v13);
  unint64_t v30 = v9 + v10;
  if (v9 + v10)
  {
    uint64_t v31 = 0;
    v32 = v11;
    do
    {
      if (*(void *)v32) {
        *(void *)&v11[8 * v31++] = *(void *)v32;
      }
      v32 += 8;
      --v30;
    }
    while (v30);
  }
  CFMergeSortArray();
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:v10];
  free(v11);
  return v33;
}

- (uint64_t)sortedArrayHint
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  size_t v2 = 4 * [a1 count];
  uint64_t v3 = malloc_type_malloc(v2, 0x6C64A1FCuLL);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    id v7 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a1);
        }
        *v7++ = [*(id *)(*((void *)&v11 + 1) + 8 * v8++) hash];
      }
      while (v5 != v8);
      uint64_t v5 = [a1 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v5);
  }
  return [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v3 length:v2 freeWhenDone:1];
}

- (uint64_t)sortedArrayUsingSelector:()NSArray hint:
{
  if (!a3)
  {
    unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: compare selector is 0", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBC8]);
  }

  return [(objc_class *)a1 sortedArrayUsingFunction:_NSUseParamAsSortSelector context:a3 hint:a4];
}

+ (id)arrayWithContentsOfURL:()NSArray
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3];

  return v3;
}

- (uint64_t)initWithContentsOfFile:()NSArray
{
  uint64_t v4 = [MEMORY[0x1E4F1C978] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSArray
{
  uint64_t v4 = [MEMORY[0x1E4F1C978] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (id)initWithContentsOfURL:()NSArray error:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  long long v14 = 0;
  if (a3)
  {
    int v7 = _NSIsNSString();
    id v8 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
    uint64_t v9 = v7
       ? [v8 initWithContentsOfFile:a3 options:0 error:&v14]
       : [v8 initWithContentsOfURL:a3 options:0 error:&v14];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      id v11 = +[NSPropertyListSerialization propertyListWithData:v9 options:0 format:0 error:&v14];

      if (_NSIsNSArray()) {
        goto LABEL_9;
      }

      long long v12 = [[NSString alloc] initWithFormat:@"%@ did not contain a top-level array value", a3];
      uint64_t v15 = @"NSDebugDescription";
      v16[0] = v12;
      long long v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1]);
    }
  }
  id v11 = 0;
LABEL_9:
  if (a4) {
    *a4 = v14;
  }

  return v11;
}

- (uint64_t)_stringToWrite
{
  uint64_t v1 = (void *)[a1 descriptionWithLocale:0 indent:0];
  if ([v1 hasSuffix:@"\n"]) {
    return (uint64_t)v1;
  }

  return [v1 stringByAppendingString:@"\n"];
}

- (uint64_t)writeToURL:()NSArray atomically:
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10])
  {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBC8]);
    if (!a3) {
      return 0;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  v13[0] = 0;
  id v8 = (void *)MEMORY[0x185308110]();
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:a1 format:100 options:0 error:v13];
  if (v9 && [(NSData *)v9 writeToURL:a3 options:a4 error:v13])
  {
    return 1;
  }
  id v11 = v13[0];
  id v12 = v13[0];
  return 0;
}

- (uint64_t)writeToURL:()NSArray error:
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBC8]);
  }
  v14[0] = 0;
  id v8 = (void *)MEMORY[0x185308110]();
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:a1 format:100 options:0 error:v14];
  if (v9 && [(NSData *)v9 writeToURL:a3 options:1 error:v14])
  {
    return 1;
  }
  else
  {
    id v11 = v14[0];
    id v12 = v14[0];
    if (a4) {
      *a4 = v14[0];
    }
    id v13 = v12;
    return 0;
  }
}

@end
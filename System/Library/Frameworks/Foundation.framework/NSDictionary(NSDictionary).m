@interface NSDictionary(NSDictionary)
+ (id)dictionaryWithContentsOfFile:()NSDictionary;
+ (id)dictionaryWithContentsOfURL:()NSDictionary;
+ (id)dictionaryWithContentsOfURL:()NSDictionary error:;
+ (id)newWithContentsOf:()NSDictionary immutable:;
+ (id)newWithContentsOf:()NSDictionary immutable:error:;
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (uint64_t)supportsSecureCoding;
- (id)descriptionInStringsFileFormat;
- (id)initWithContentsOfURL:()NSDictionary error:;
- (uint64_t)_stringToWrite;
- (uint64_t)classForCoder;
- (uint64_t)initWithCoder:()NSDictionary;
- (uint64_t)initWithContentsOfFile:()NSDictionary;
- (uint64_t)initWithContentsOfURL:()NSDictionary;
- (uint64_t)writeToFile:()NSDictionary atomically:;
- (uint64_t)writeToURL:()NSDictionary atomically:;
- (uint64_t)writeToURL:()NSDictionary error:;
- (void)encodeWithCoder:()NSDictionary;
@end

@implementation NSDictionary(NSDictionary)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (uint64_t)classForCoder
{
  return self;
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (void)encodeWithCoder:()NSDictionary
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD8]);
  }
  if ([a3 allowsKeyedCoding])
  {
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    {
      unint64_t v6 = [a1 count];
      uint64_t v7 = v6;
      if (v6 >> 60)
      {
        CFStringRef v28 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v6);
        v29 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v28 userInfo:0];
        CFRelease(v28);
        objc_exception_throw(v29);
      }
      uint64_t v30 = 0;
      uint64_t v8 = _CFCreateArrayStorage();
      uint64_t v9 = _CFCreateArrayStorage();
      [a1 getObjects:v9 andKeys:v8 count:v7];
      if (v8)
      {
        if (v7)
        {
          v10 = (id *)v8;
          uint64_t v11 = v7;
          do
          {
            id v12 = *v10++;
            --v11;
          }
          while (v11);
        }
        uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1C978]) _initByAdoptingBuffer:v8 count:v7 size:v7];
      }
      else
      {
        uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:0 count:v7];
      }
      v17 = (void *)v13;
      [a3 _encodeArrayOfObjects:v13 forKey:@"NS.keys"];

      if (v9)
      {
        if (v7 >= 1)
        {
          v18 = (id *)v9;
          uint64_t v19 = v7;
          do
          {
            id v20 = *v18++;
            --v19;
          }
          while (v19);
        }
        uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C978]) _initByAdoptingBuffer:v9 count:v7 size:v7];
      }
      else
      {
        uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:0 count:v7];
      }
      v22 = (void *)v21;
      [a3 _encodeArrayOfObjects:v21 forKey:@"NS.objects"];
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v23 = [a1 countByEnumeratingWithState:&v32 objects:v31 count:16];
      if (v23)
      {
        uint64_t v24 = 0;
        uint64_t v25 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v33 != v25) {
              objc_enumerationMutation(a1);
            }
            uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            [a3 encodeObject:v27, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.key.%ld", v24 + i) forKey];
            [a3 encodeObject:objc_msgSend(a1, "objectForKey:", v27), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.object.%ld", v24 + i) forKey];
          }
          uint64_t v23 = [a1 countByEnumeratingWithState:&v32 objects:v31 count:16];
          v24 += i;
        }
        while (v23);
      }
    }
  }
  else
  {
    LODWORD(v30) = [a1 count];
    [a3 encodeValueOfObjCType:"i" at:&v30];
    v14 = (void *)[a1 keyEnumerator];
    for (uint64_t j = [v14 nextObject]; ; uint64_t j = objc_msgSend(v14, "nextObject"))
    {
      uint64_t v16 = j;
      if (!j) {
        break;
      }
      [a3 encodeBycopyObject:j];
      objc_msgSend(a3, "encodeBycopyObject:", objc_msgSend(a1, "objectForKey:", v16));
    }
  }
}

- (uint64_t)initWithCoder:()NSDictionary
{
  v49[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    unsigned int v45 = 0;
    uint64_t v13 = [a3 decodeValueOfObjCType:"i" at:&v45 size:4];
    uint64_t v14 = v45;
    if (v45 >> 29)
    {
      objc_msgSend(a3, "__failWithExceptionName:errorCode:format:", @"NSArchiverArchiveInconsistency", 4864, @"%@: array is too large to decode", _NSMethodExceptionProem(a1, a2));
      return 0;
    }
    uint64_t v15 = MEMORY[0x1F4188790](v13);
    v17 = (objc_class *)((char *)&v41 - v16);
    uint64_t v44 = 0;
    if (v14 >= 0x101)
    {
      v17 = (objc_class *)_CFCreateArrayStorage();
      uint64_t v43 = 0;
      uint64_t v19 = (char *)_CFCreateArrayStorage();
      id v20 = v19;
      uint64_t v21 = v17;
    }
    else
    {
      MEMORY[0x1F4188790](v15);
      uint64_t v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFF0);
      id v20 = 0;
      uint64_t v21 = 0;
      uint64_t v43 = 0;
      if (!v14)
      {
LABEL_20:
        uint64_t v24 = [(objc_class *)a1 initWithObjects:v19 forKeys:v17 count:v14];
        uint64_t v25 = 8 * v14;
        v26 = v19 - 8;
        uint64_t v27 = (char *)v17 - 8;
        while (v25)
        {

          CFStringRef v28 = *(void **)&v26[v25];
          v25 -= 8;
        }
        free(v20);
        free(v21);
        return (uint64_t)v24;
      }
    }
    v42 = v21;
    uint64_t v22 = 0;
    uint64_t v23 = v14;
    do
    {
      [a3 decodeValueOfObjCType:"@" at:(char *)v17 + v22 size:8];
      [a3 decodeValueOfObjCType:"@" at:&v19[v22] size:8];
      v22 += 8;
      --v23;
    }
    while (v23);
    uint64_t v21 = v42;
    goto LABEL_20;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    && [a3 containsValueForKey:@"NS.objects"])
  {
    uint64_t v6 = [a3 _decodeArrayOfObjectsForKey:@"NS.objects"];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = [a3 _decodeArrayOfObjectsForKey:@"NS.keys"];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [v7 count];
        uint64_t v11 = [v9 count];
        if (v10 == v11)
        {
          return (uint64_t)[(objc_class *)a1 initWithObjects:v7 forKeys:v9];
        }
        v48 = @"NSLocalizedDescription";
        v49[0] = +[NSString stringWithFormat:@"counts dont match between objects (%lu) and keys (%lu)", v10, v11];
        objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1)));
        return 0;
      }
    }
    a1 = 0;
  }
  v29 = (char *)NSAllocateObjectArray(0x40uLL);
  if (!v29) {
    return 0;
  }
  uint64_t v30 = v29;
  v31 = (char *)NSAllocateObjectArray(0x40uLL);
  if (!v31)
  {
    free(v30);
    return 0;
  }
  long long v32 = v31;
  v41 = a2;
  v42 = a1;
  unint64_t v33 = 0;
  unint64_t v34 = 64;
  while (1)
  {
    if (v34 > v33) {
      goto LABEL_32;
    }
    v34 *= 2;
    long long v35 = NSReallocateObjectArray(v30, v34);
    uint64_t v36 = NSReallocateObjectArray(v32, v34);
    v37 = v36;
    if (!v35 || !v36) {
      break;
    }
    uint64_t v30 = v35;
    long long v32 = v36;
LABEL_32:
    v38 = +[NSString stringWithFormat:@"NS.key.%ld", v33];
    if (!objc_msgSend(a3, "containsValueForKey:", v38, v41))
    {
      uint64_t v24 = [(objc_class *)v42 initWithObjects:v32 forKeys:v30 count:v33];
      goto LABEL_43;
    }
    v39 = +[NSString stringWithFormat:@"NS.object.%ld", v33];
    if (![a3 containsValueForKey:v39]) {
      goto LABEL_42;
    }
    *(void *)&v30[8 * v33] = [a3 decodeObjectForKey:v38];
    uint64_t v40 = [a3 decodeObjectForKey:v39];
    *(void *)&v32[8 * v33] = v40;
    if (!*(void *)&v30[8 * v33] || !v40) {
      goto LABEL_42;
    }
    ++v33;
  }
  free(v35);
  free(v37);
  v46 = @"NSLocalizedDescription";
  v47 = +[NSString stringWithFormat:@"%@: dictionary is too large to unarchive (%qd)", _NSMethodExceptionProem(v42, v41), v34];
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1)));
LABEL_42:
  uint64_t v24 = 0;
LABEL_43:
  free(v30);
  free(v32);
  return (uint64_t)v24;
}

- (uint64_t)writeToURL:()NSDictionary atomically:
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10])
  {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD8]);
    if (!a3) {
      return 0;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  v13[0] = 0;
  uint64_t v8 = (void *)MEMORY[0x185308110]();
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:a1 format:100 options:0 error:v13];
  if (v9 && [(NSData *)v9 writeToURL:a3 options:a4 error:v13])
  {
    return 1;
  }
  id v11 = v13[0];
  id v12 = v13[0];
  return 0;
}

- (uint64_t)writeToURL:()NSDictionary error:
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD8]);
  }
  v14[0] = 0;
  uint64_t v8 = (void *)MEMORY[0x185308110]();
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

+ (id)dictionaryWithContentsOfURL:()NSDictionary error:
{
  uint64_t v4 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3 error:a4];

  return v4;
}

+ (id)dictionaryWithContentsOfURL:()NSDictionary
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3];

  return v3;
}

+ (id)newWithContentsOf:()NSDictionary immutable:error:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  if (a3)
  {
    int v8 = _NSIsNSString();
    id v9 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
    uint64_t v10 = v8
        ? [v9 initWithContentsOfFile:a3 options:0 error:&v15]
        : [v9 initWithContentsOfURL:a3 options:0 error:&v15];
    id v11 = (void *)v10;
    if (v10)
    {
      id v12 = +[NSPropertyListSerialization propertyListWithData:v10 options:a4 ^ 1u format:0 error:&v15];

      if (_NSIsNSDictionary()) {
        goto LABEL_9;
      }

      id v13 = [[NSString alloc] initWithFormat:@"%@ did not contain a top-level dictionary value", a3];
      uint64_t v16 = @"NSDebugDescription";
      v17[0] = v13;
      uint64_t v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1]);
    }
  }
  id v12 = 0;
LABEL_9:
  if (a5) {
    *a5 = v15;
  }
  return v12;
}

+ (id)dictionaryWithContentsOfFile:()NSDictionary
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfFile:a3];

  return v3;
}

+ (id)newWithContentsOf:()NSDictionary immutable:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v13 = 0;
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

  if ((_NSIsNSDictionary() & 1) == 0)
  {

    id v11 = [[NSString alloc] initWithFormat:@"%@ did not contain a top-level dictionary value", a3];
    uint64_t v14 = @"NSDebugDescription";
    v15[0] = v11;
    id v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1]);

    return 0;
  }
  return v10;
}

- (id)descriptionInStringsFileFormat
{
  id v2 = (id)[objc_allocWithZone((Class)NSMutableString) init];
  uint64_t v3 = (void *)[a1 keyEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      int v6 = (void *)[a1 objectForKey:v5];
      if (_NSIsNSString()) {
        uint64_t v7 = [v6 quotedStringRepresentation];
      }
      else {
        uint64_t v7 = [v6 description];
      }
      uint64_t v8 = v7;
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, objc_msgSend(v5, "quotedStringRepresentation"));
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, @" = ");
      [v2 appendString:v8];
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, @";\n");
      v5 = (void *)[v3 nextObject];
    }
    while (v5);
  }
  return v2;
}

- (uint64_t)_stringToWrite
{
  v1 = (void *)[a1 descriptionWithLocale:0 indent:0];
  if ([v1 hasSuffix:@"\n"]) {
    return (uint64_t)v1;
  }

  return [v1 stringByAppendingString:@"\n"];
}

- (uint64_t)writeToFile:()NSDictionary atomically:
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD8]);
  }
  uint64_t v8 = (void *)MEMORY[0x185308110]();
  if (_NSIsPList((uint64_t)a1, 1, (void *)[MEMORY[0x1E4F1CA80] set]) == 4)
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

- (uint64_t)initWithContentsOfFile:()NSDictionary
{
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSDictionary
{
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (id)initWithContentsOfURL:()NSDictionary error:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
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

      if (_NSIsNSDictionary()) {
        goto LABEL_9;
      }

      id v12 = [[NSString alloc] initWithFormat:@"%@ did not contain a top-level dictionary value", a3];
      uint64_t v15 = @"NSDebugDescription";
      v16[0] = v12;
      uint64_t v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1]);
    }
  }
  id v11 = 0;
LABEL_9:
  if (a4) {
    *a4 = v14;
  }

  return v11;
}

@end
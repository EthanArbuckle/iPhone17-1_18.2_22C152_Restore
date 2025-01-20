@interface NSSQLStoreMappingGenerator
+ (NSSQLStoreMappingGenerator)defaultMappingGenerator;
- (CFStringRef)newGeneratedPropertyName:(uint64_t)a1;
- (NSSQLStoreMappingGenerator)init;
- (uint64_t)generateTableName:(int)a3 isAncillary:;
- (uint64_t)uniqueNameWithBase:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSSQLStoreMappingGenerator

- (CFStringRef)newGeneratedPropertyName:(uint64_t)a1
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v3 = (void *)[a2 name];
  uint64_t v4 = [v3 length];
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) < 0x201)
  {
    uint64_t v8 = v4;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    *(_OWORD *)chars = 0u;
    long long v23 = 0u;
    chars[0] = 90;
    long long v24 = 0u;
    long long v25 = 0u;
    [v3 getCharacters:&chars[1]];
    chars[v5] = 0;
    if (v5 >= 2)
    {
      v9 = &chars[1];
      uint64_t v10 = v8;
      do
      {
        UniChar *v9 = __toupper(*v9);
        ++v9;
        --v10;
      }
      while (v10);
    }
    if (!v5) {
      goto LABEL_13;
    }
    int v11 = chars[0] << 24;
    if (v11 < 0)
    {
      if (__maskrune(SLOBYTE(chars[0]), 0x100uLL)) {
        goto LABEL_13;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * SLOBYTE(chars[0]) + 60) & 0x100) != 0)
    {
LABEL_13:
      v12 = (__CFString *)CFStringCreateWithCharacters(0, chars, v5);
      long long v85 = 0u;
      long long v84 = 0u;
      long long v83 = 0u;
      long long v82 = 0u;
      long long v81 = 0u;
      long long v80 = 0u;
      long long v79 = 0u;
      long long v78 = 0u;
      long long v77 = 0u;
      long long v76 = 0u;
      long long v75 = 0u;
      long long v74 = 0u;
      long long v73 = 0u;
      long long v72 = 0u;
      long long v71 = 0u;
      long long v70 = 0u;
      long long v69 = 0u;
      long long v68 = 0u;
      long long v67 = 0u;
      long long v66 = 0u;
      long long v65 = 0u;
      long long v64 = 0u;
      long long v63 = 0u;
      long long v62 = 0u;
      long long v61 = 0u;
      long long v60 = 0u;
      long long v59 = 0u;
      long long v58 = 0u;
      long long v57 = 0u;
      long long v56 = 0u;
      long long v55 = 0u;
      long long v54 = 0u;
      CFAllocatorRef v13 = _PFStackAllocatorCreate((unint64_t *)&v54, 1024);
      v14 = (void *)[*(id *)(a1 + 8) objectForKey:v12];
      if (v14)
      {
        int v15 = [v14 unsignedIntValue];
        CFMutableStringRef MutableWithExternalCharactersNoCopy = 0;
        CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
        uint64_t v18 = (v15 + 1);
        do
        {
          if (*((void *)&v55 + 1))
          {
            if (MutableWithExternalCharactersNoCopy) {
              CFRelease(MutableWithExternalCharactersNoCopy);
            }
          }
          else
          {
            *((void *)&v54 + 1) = v54;
          }
          CFMutableStringRef MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(v13, chars, v5, 512, v17);
          int valuePtr = v18;
          CFStringAppendFormat(MutableWithExternalCharactersNoCopy, 0, @"%d", v18);
          uint64_t v18 = (v18 + 1);
        }
        while ([*(id *)(a1 + 8) objectForKey:MutableWithExternalCharactersNoCopy]);
        CFStringRef Copy = CFStringCreateCopy(0, MutableWithExternalCharactersNoCopy);
      }
      else
      {
        int valuePtr = 0;
        CFStringRef Copy = v12;
        CFMutableStringRef MutableWithExternalCharactersNoCopy = 0;
      }
      CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      [*(id *)(a1 + 8) setObject:v20 forKey:v12];

      if (MutableWithExternalCharactersNoCopy && *((void *)&v55 + 1)) {
        CFRelease(MutableWithExternalCharactersNoCopy);
      }
      return Copy;
    }
    __memmove_chk();
    chars[0] = (HIBYTE(v11)
                               - 48
                               - 26
                               * ((unsigned __int16)((v11 >> 24) - 48) / 0x1Au
                                + ((((20165 * ((v11 >> 24) - 48)) >> 16) & 0x8000u) != 0))
                               + 65);
    unint64_t v5 = v8 + 2;
    chars[v8 + 2] = 0;
    goto LABEL_13;
  }
  v6 = (void *)-[NSSQLStoreMappingGenerator uniqueNameWithBase:](a1, objc_msgSend(@"Z", "stringByAppendingString:", objc_msgSend(v3, "uppercaseString")));

  return (CFStringRef)v6;
}

+ (NSSQLStoreMappingGenerator)defaultMappingGenerator
{
  self;
  result = (NSSQLStoreMappingGenerator *)_NSSQLDefaultMappingGenerator;
  if (!_NSSQLDefaultMappingGenerator)
  {
    result = objc_alloc_init(NSSQLStoreMappingGenerator);
    _NSSQLDefaultMappingGenerator = (uint64_t)result;
  }
  return result;
}

- (NSSQLStoreMappingGenerator)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSSQLStoreMappingGenerator;
  v2 = [(NSSQLStoreMappingGenerator *)&v4 init];
  if (v2) {
    v2->_names = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (uint64_t)generateTableName:(int)a3 isAncillary:
{
  if (result)
  {
    do
    {
      objc_super v4 = a2;
      a2 = (void *)[a2 superentity];
    }
    while (a2);
    if (a3) {
      unint64_t v5 = @"A";
    }
    else {
      unint64_t v5 = @"Z";
    }
    return [[NSString alloc] initWithFormat:@"%@%@", v5, objc_msgSend((id)objc_msgSend(v4, "name"), "uppercaseString")];
  }
  return result;
}

- (uint64_t)uniqueNameWithBase:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = a2;
  if ([a2 length])
  {
    int v4 = [v2 characterAtIndex:0];
    int v5 = v4 << 24;
    if (v4 << 24 < 0)
    {
      if (__maskrune((char)v4, 0x100uLL)) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * (char)v4 + 60) & 0x100) == 0) {
LABEL_5:
    }
      v2 = (void *)[NSString stringWithFormat:@"%c%@", (unsigned __int16)((__int16)((v5 >> 24) - 48) % 26 + 65), objc_msgSend(v2, "substringFromIndex:", 1)];
  }
LABEL_6:
  v6 = (void *)[*(id *)(a1 + 8) objectForKey:v2];
  if (v6)
  {
    LODWORD(v7) = [v6 unsignedIntValue];
    do
    {
      uint64_t v7 = (v7 + 1);
      uint64_t v8 = objc_msgSend(v2, "stringByAppendingFormat:", @"%d", v7);
    }
    while ([*(id *)(a1 + 8) objectForKey:v8]);
  }
  else
  {
    LODWORD(v7) = 0;
    uint64_t v8 = (uint64_t)v2;
  }
  int valuePtr = v7;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  [*(id *)(a1 + 8) setObject:v9 forKey:v2];

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLStoreMappingGenerator;
  [(NSSQLStoreMappingGenerator *)&v3 dealloc];
}

@end
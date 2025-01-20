@interface NSKnownKeysMappingStrategy1
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CFMutableArrayRef)_makeBranchTableForKeys:(const void *)a1 count:(unint64_t)a2;
- (Class)classForCoder;
- (NSKnownKeysMappingStrategy1)initWithCoder:(id)a3;
- (id)allKeys;
- (id)description;
- (id)initForKeys:(id *)a3 count:(unint64_t)a4;
- (id)initForKeys:(id)a3;
- (id)keys;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)fastIndexForKnownKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)indexForKey:(id)a3;
- (unint64_t)length;
- (void)_coreCreationForKeys:(unint64_t)a3 count:;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSKnownKeysMappingStrategy1

- (unint64_t)fastIndexForKnownKey:(id)a3
{
  return _PFRawFastIndexForKnownKey(self, (__CFString *)a3, &v4);
}

- (id)initForKeys:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 count];
  unint64_t v6 = MEMORY[0x1F4188790](v5);
  v9 = (char *)v12 - v8;
  if (v6 > 0x200) {
    v9 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v12 - v8, 8 * v7);
  }
  objc_msgSend(a3, "getObjects:range:", v9, 0, v5);
  id v10 = [(NSKnownKeysMappingStrategy1 *)self initForKeys:v9 count:v5];
  if (v5 >= 0x201) {
    NSZoneFree(0, v9);
  }
  return v10;
}

- (id)initForKeys:(id *)a3 count:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NSKnownKeysMappingStrategy1;
  unint64_t v6 = [(NSKnownKeysMappingStrategy1 *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    -[NSKnownKeysMappingStrategy1 _coreCreationForKeys:count:](v6, (uint64_t)a3, a4);
  }
  return v7;
}

- (id)keys
{
  return self->_keys;
}

- (void)_coreCreationForKeys:(unint64_t)a3 count:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (a3 > 0x8000)
  {
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = [NSString stringWithFormat:@"%@ supports a maximum of 32,768 elements.  parameter was %lu", objc_opt_class(), a3];
    v21 = v23;
    uint64_t v22 = v24;
LABEL_18:
    objc_exception_throw((id)[v21 exceptionWithName:v22 reason:v20 userInfo:0]);
  }
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = (const void **)((char *)v25 - v7);
  if (a3 >= 0x201)
  {
    uint64_t v8 = (const void **)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v25 - v7, 8 * v6);
    if (!a3)
    {
      char v9 = 1;
      goto LABEL_11;
    }
  }
  uint64_t v10 = 0;
  do
  {
    v11 = *(void **)(a2 + 8 * v10);
    id v12 = v11;
    uint64_t v13 = [v11 UTF8String];
    if (!v13)
    {
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3C8];
      uint64_t v20 = [NSString stringWithFormat:@"%@ cannot be encoded as UTF-8", v11];
      v21 = v18;
      uint64_t v22 = v19;
      goto LABEL_18;
    }
    v8[v10++] = (const void *)v13;
  }
  while (a3 != v10);
  char v9 = 0;
LABEL_11:
  a1[3] = a3;
  a1[4] = 0;
  CFArrayRef v14 = -[NSKnownKeysMappingStrategy1 _makeBranchTableForKeys:count:](v8, a3);
  CFIndex Count = CFArrayGetCount(v14);
  v16 = (const void **)PF_CALLOC_SCANNED_BYTES(8 * Count + 8);
  a1[2] = v16;
  v26.location = 0;
  v26.length = Count;
  CFArrayGetValues(v14, v26, v16);
  CFRelease(v14);
  *(void *)(a1[2] + 8 * Count) = 0;
  a1[5] = PF_ALLOCATE_OBJECT_ARRAY(a3);
  if ((v9 & 1) == 0)
  {
    uint64_t v17 = 0;
    do
    {
      *(void *)(a1[5] + 8 * v17) = *(void *)(a2 + 8 * v17);
      ++v17;
    }
    while (a3 != v17);
  }
  if (a3 >= 0x201) {
    NSZoneFree(0, v8);
  }
}

- (CFMutableArrayRef)_makeBranchTableForKeys:(const void *)a1 count:(unint64_t)a2
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(&valueCallBacks, 0, sizeof(valueCallBacks));
  valueCallBacks.release = *(CFDictionaryReleaseCallBack *)(MEMORY[0x1E4F1D540] + 16);
  if (a2)
  {
    unint64_t v2 = a2;
    if (a2 >= 0x201) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = a2;
    }
    unint64_t v5 = (8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v6 = (const void **)((char *)&v22 - v5);
    size_t v7 = 8 * a2;
    if (v2 > 0x200) {
      uint64_t v6 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v22 - v5, v7);
    }
    for (i = 0; i != (const void *)v2; i = (char *)i + 1)
      v6[(void)i] = i;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v6, v2, 0, 0);
    if (v2 >= 0x201) {
      NSZoneFree(0, v6);
    }
    CFDictionaryRef v13 = CFDictionaryCreateMutable(v11, 0, 0, &valueCallBacks);
    do
    {
      CFArrayRef v14 = *a1;
      v15 = (const void *)strlen((const char *)*a1);
      Value = (void *)CFDictionaryGetValue(v13, v15);
      if (!Value)
      {
        Value = CFArrayCreateMutable(v11, 0, 0);
        CFDictionarySetValue(v13, v15, Value);
      }
      CFArrayAppendValue((CFMutableArrayRef)Value, v14);
      ++a1;
      --v2;
    }
    while (v2);
    unint64_t Count = CFDictionaryGetCount(v13);
    unint64_t v18 = Count;
    if (Count <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = Count;
    }
    if (Count >= 0x201) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    v21 = (const void **)((char *)&v22 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (Count > 0x200) {
      v21 = (const void **)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v22 - ((8 * v20 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v19);
    }
    CFDictionaryGetKeysAndValues(v13, 0, v21);
    long long v25 = xmmword_1ED787220;
    CFMergeSortArray();
    CFArrayRef Mutable = CFArrayCreateMutable(v11, 0, 0);
    makeBranchRow(&Mutable, (CFArrayRef *)v21, v18, v12, 0, 0, 0, 0);
    CFRelease(v12);
    if (v18 >= 0x201) {
      NSZoneFree(0, v21);
    }
    CFRelease(v13);
    return Mutable;
  }
  else
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    return CFArrayCreateMutable(v8, 0, 0);
  }
}

- (void)dealloc
{
  if (self)
  {
    table = (void **)self->_table;
    if (table)
    {
      uint64_t v4 = *table;
      if (*table)
      {
        unint64_t v5 = table + 1;
        do
        {
          uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone)
          {
            uint64_t v6 = malloc_default_zone();
            uint64_t v4 = *(v5 - 1);
          }
          malloc_zone_free(v6, v4);
          size_t v7 = *v5++;
          uint64_t v4 = v7;
        }
        while (v7);
      }
      CFAllocatorRef v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        CFAllocatorRef v8 = malloc_default_zone();
      }
      malloc_zone_free(v8, self->_table);
    }
    self->_table = 0;
    keys = self->_keys;
    if (keys)
    {
      unint64_t length = self->_length;
      if (length)
      {
        do
        {
          CFAllocatorRef v11 = *keys++;

          --length;
        }
        while (length);
        keys = self->_keys;
      }
      PF_FREE_OBJECT_ARRAY(keys);
    }
    self->_keys = 0;
    self->_unint64_t length = 0;
    _PFDeallocateObject(self);
  }
}

- (unint64_t)indexForKey:(id)a3
{
  return _PFRawIndexForKnownKey(self, (__CFString *)a3);
}

- (unint64_t)length
{
  return self->_length;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = &self->_length;
  }
  unint64_t v6 = 0;
  a3->var1 = a4;
  if (a5)
  {
    unint64_t length = self->_length;
    if (var0 < length)
    {
      unint64_t v6 = 0;
      do
        a4[v6] = (id)*((void *)&self->_keys[var0] + v6);
      while (++v6 + var0 < length && v6 < a5);
      var0 += v6;
    }
  }
  a3->unint64_t var0 = var0;
  return v6;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    self;
    objc_opt_class();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (id)allKeys
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:self->_keys count:self->_length];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }
  else if (a3 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (unint64_t length = self->_length, length == *((void *)a3 + 3)))
  {
    if (length)
    {
      uint64_t v6 = 0;
      while (1)
      {
        id v7 = self->_keys[v6];
        if (v7 != *(id *)(*((void *)a3 + 5) + 8 * v6))
        {
          int v8 = objc_msgSend(v7, "isEqual:");
          if (!v8) {
            break;
          }
        }
        if (length == ++v6) {
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t length = self->_length;
  if (length) {
    return length & 0x7F | ([*self->_keys hash] << 7);
  }
  return length;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (NSKnownKeysMappingStrategy1)initWithCoder:(id)a3
{
  uint64_t v4 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_unint64_t length = [a3 decodeInt64ForKey:@"length"];
  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"keys");
  unint64_t v8 = [v7 count];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v23 + 1) + 8 * v12) isNSString])
        {
          v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v16 = *MEMORY[0x1E4F281F8];
          uint64_t v17 = &unk_1ED7E1C68;
          uint64_t v18 = 4866;
          goto LABEL_16;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v10 = v9;
      if (v9) {
        continue;
      }
      break;
    }
  }
  unint64_t length = v4->_length;
  if (length != v8 || length >= 0x7FFF)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F281F8];
    uint64_t v17 = &unk_1ED7E1C90;
    uint64_t v18 = 4864;
LABEL_16:
    objc_msgSend(a3, "failWithError:", objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v18, v17));

    return 0;
  }
  else
  {
    MEMORY[0x1F4188790](v9);
    uint64_t v22 = (char *)&v23 - v21;
    if (v8 > 0x200) {
      uint64_t v22 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v23 - v21, 8 * v20);
    }
    objc_msgSend(v7, "getObjects:range:", v22, 0, v8);
    -[NSKnownKeysMappingStrategy1 _coreCreationForKeys:count:](v4, (uint64_t)v22, v8);
    if (v8 >= 0x201) {
      NSZoneFree(0, v22);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:1 forKey:@"version"];
  [a3 encodeInt64:self->_length forKey:@"length"];
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:self->_keys count:self->_length];
  [a3 encodeObject:v5 forKey:@"keys"];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:self->_keys count:self->_length];
  table = (uint64_t *)self->_table;
  if (self->_length < 0x401)
  {
    if (table)
    {
      if (*table)
      {
        uint64_t v7 = 0;
        while (table[++v7])
          ;
        uint64_t v9 = (__CFString *)objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"mapping table %p has %d branch rows:", self->_table, v7);
        uint64_t v10 = *table;
        if (*table)
        {
          uint64_t v11 = 0;
          do
          {
            [(__CFString *)v9 appendFormat:@"\n\t %@", descriptionForBranchRow(v10, v11)];
            uint64_t v10 = table[++v11];
          }
          while (v10);
        }
      }
      else
      {
        uint64_t v9 = @"mapping table has 0 branch rows";
      }
    }
    else
    {
      uint64_t v9 = @"mapping table pointer is NULL";
    }
  }
  else
  {
    if (table)
    {
      uint64_t v5 = *table;
      if (*table)
      {
        uint64_t v5 = 0;
        while (table[++v5])
          ;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v9 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"mapping table %p has %d branch rows: (...)", self->_table, v5);
  }
  uint64_t v12 = NSString;
  CFDictionaryRef v13 = (objc_class *)objc_opt_class();
  CFArrayRef v14 = (void *)[v12 stringWithFormat:@"%@ (%p) table of length %d with known keys:%@ and %@", NSStringFromClass(v13), self, self->_length, v3, v9];

  return v14;
}

@end
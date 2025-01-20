@interface NSTaggedPointerString
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5;
- (BOOL)_isCString;
- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isNSString__;
- (const)UTF8String;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (const)cStringUsingEncoding:(unint64_t)a3;
- (id)lowercaseStringWithLocale:(id)a3;
- (id)substringWithRange:(_NSRange)a3;
- (id)uppercaseStringWithLocale:(id)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (unint64_t)fastestEncoding;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSTaggedPointerString

- (unint64_t)fastestEncoding
{
  return 1;
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  v24[2] = *(void *)off_1ECE0A5B0;
  if (a7 || a6 > 5 || ((1 << a6) & 0x32) == 0)
  {
    v23.receiver = self;
    v23.super_class = (Class)NSTaggedPointerString;
    return [(NSTaggedPointerString *)&v23 getBytes:a3 maxLength:a4 usedLength:a5 encoding:a6 options:a8.location range:a8.length remainingRange:a9];
  }
  if (!a3)
  {
    int v18 = *(_DWORD *)off_1ECE0A6F0;
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      int v18 = 7;
    }
    NSUInteger v15 = ((unint64_t)(v18 ^ self) >> 3) & 0xF;
    if (v15 >= a8.length && a8.location <= v15 - a8.length)
    {
      size_t length = a8.length;
      if (!a5) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
LABEL_35:
    uint64_t v21 = __CFExceptionProem((objc_class *)self, a2);
    v22 = "";
    if (a8.length == 64) {
      v22 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v21,
      a8.location,
      a8.length,
      v15,
      v22);
  }
  v24[0] = 0;
  v24[1] = 0;
  uint64_t v11 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v11 ^ (unint64_t)self;
  BOOL v13 = (~(v11 ^ self) & 7) == 0;
  uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
  if (v13) {
    uint64_t v14 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger v15 = (v12 >> 3) & 0xF;
  unint64_t v16 = (v14 & (v12 >> 3)) >> 4;
  if (v15 < 8)
  {
    v24[0] = v16;
  }
  else
  {
    uint64_t v17 = (v12 >> 3) & 0xF;
    if (v15 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v23.super_class + v17 + 7) = sixBitToCharLookup[v16 & 0x1F];
        v16 >>= 5;
        --v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        *((unsigned char *)&v23.super_class + v17 + 7) = sixBitToCharLookup[v16 & 0x3F];
        v16 >>= 6;
        --v17;
      }
      while (v17);
    }
  }
  if (v15 < a8.length || a8.location > v15 - a8.length) {
    goto LABEL_35;
  }
  if (a8.length >= a4) {
    size_t length = a4;
  }
  else {
    size_t length = a8.length;
  }
  memmove(a3, (char *)v24 + a8.location, length);
  if (!a5) {
    goto LABEL_32;
  }
LABEL_31:
  *a5 = length;
LABEL_32:
  if (a9)
  {
    a9->location = length + a8.location;
    a9->size_t length = a8.length - length;
  }
  return 1;
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  __s2[2] = *(void *)off_1ECE0A5B0;
  if (self == a3) {
    return 0;
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  char v8 = a4;
  if (a4 > 3 || !a3 || a6)
  {
    v36.receiver = self;
    v36.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString compare:options:range:locale:](&v36, sel_compare_options_range_locale_);
  }
  __s2[0] = 0;
  __s2[1] = 0;
  if (((unint64_t)a3 & 0x8000000000000000) == 0) {
    goto LABEL_24;
  }
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)off_1ECE0A6F0;
  uint64_t v13 = (~(unint64_t)a3 & 0xC000000000000007) != 0 ? *(void *)off_1ECE0A6F0 : 0;
  unint64_t v14 = v13 ^ (unint64_t)a3;
  unint64_t v15 = v14 & 7;
  while (v15 != *((unsigned __int8 *)off_1ECE0A6E0 + v11))
  {
    if (++v11 == 7) {
      goto LABEL_24;
    }
  }
  if (v11 == 2)
  {
    uint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
    if (v15 == 7) {
      uint64_t v17 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t v18 = (v14 >> 3) & 0xF;
    unint64_t v19 = (v17 & (v14 >> 3)) >> 4;
    if (v18 < 8)
    {
      __s2[0] = v19;
      uint64_t v21 = (unsigned __int8 *)__s2;
    }
    else
    {
      unint64_t v20 = v18;
      if (v18 >= 0xA)
      {
        do
        {
          uint64_t v21 = (unsigned __int8 *)__s2;
          *((unsigned char *)__s2 + v20 - 1) = sixBitToCharLookup[v19 & 0x1F];
          v19 >>= 5;
          --v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          uint64_t v21 = (unsigned __int8 *)__s2;
          *((unsigned char *)__s2 + v20 - 1) = sixBitToCharLookup[v19 & 0x3F];
          v19 >>= 6;
          --v20;
        }
        while (v20);
      }
    }
  }
  else
  {
LABEL_24:
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
    if (!CStringPtr)
    {
      v35.receiver = self;
      v35.super_class = (Class)NSTaggedPointerString;
      return -[NSTaggedPointerString compare:options:range:locale:](&v35, sel_compare_options_range_locale_);
    }
    uint64_t v21 = (unsigned __int8 *)CStringPtr;
    unint64_t v18 = [a3 length];
    uint64_t v12 = *(void *)off_1ECE0A6F0;
  }
  v37[0] = 0;
  v37[1] = 0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v12 = 0;
  }
  unint64_t v23 = v12 ^ (unint64_t)self;
  uint64_t v24 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v23 & 7) == 0) {
    uint64_t v24 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v25 = v24 & (v23 >> 3);
  unint64_t v26 = (v23 >> 3) & 0xF;
  if (v26 < 8)
  {
    v37[0] = v25 >> 4;
  }
  else
  {
    unint64_t v27 = v25 >> 4;
    if (v26 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v36.super_class + v26 + 7) = sixBitToCharLookup[v27 & 0x1F];
        v27 >>= 5;
        --v26;
      }
      while (v26);
    }
    else
    {
      do
      {
        *((unsigned char *)&v36.super_class + v26 + 7) = sixBitToCharLookup[v27 & 0x3F];
        v27 >>= 6;
        --v26;
      }
      while (v26);
    }
  }
  v28 = (unsigned __int8 *)v37 + location;
  if (length >= v18) {
    size_t v29 = v18;
  }
  else {
    size_t v29 = length;
  }
  if (v8) {
    int v30 = _CFStringCompareASCIICaseInsensitive(v28, v21, v29);
  }
  else {
    int v30 = memcmp(v28, v21, v29);
  }
  int v31 = length - v18;
  if (v30) {
    int v31 = v30;
  }
  BOOL v32 = v31 == 0;
  BOOL v33 = v31 < 0;
  int64_t v34 = -1;
  if (!v33) {
    int64_t v34 = 1;
  }
  if (v32) {
    return 0;
  }
  else {
    return v34;
  }
}

- (unint64_t)length
{
  int v2 = *(_DWORD *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    int v2 = 7;
  }
  return ((unint64_t)(v2 ^ self) >> 3) & 0xF;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }
  else if (a3)
  {
    if (((unint64_t)a3 & 0x8000000000000000) == 0) {
      goto LABEL_11;
    }
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)off_1ECE0A6F0;
    if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)a3;
    do
    {
      if ((v7 & 7) == *((unsigned char *)off_1ECE0A6E0 + v5)) {
        break;
      }
      ++v5;
    }
    while (v5 != 7);
    LOBYTE(v8) = 0;
    if ((~(_BYTE)v5 & 7) == 0 && ((v5 | v7) & 0x7F80000000000000) == 0x700000000000000)
    {
LABEL_11:
      int v8 = _NSIsNSString((uint64_t)a3);
      if (v8)
      {
        LOBYTE(v8) = isEqualToString((uint64_t)self, a3);
      }
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
  v11[2] = *(void *)off_1ECE0A5B0;
  v11[0] = 0;
  v11[1] = 0;
  uint64_t v2 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  BOOL v4 = (~(v2 ^ self) & 7) == 0;
  uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
  if (v4) {
    uint64_t v5 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = (v3 >> 3) & 0xF;
  unint64_t v7 = (v5 & (v3 >> 3)) >> 4;
  if (v6 < 8)
  {
    v11[0] = v7;
  }
  else
  {
    uint64_t v8 = (v3 >> 3) & 0xF;
    if (v6 >= 0xA)
    {
      do
      {
        *(&v10 + v8) = sixBitToCharLookup[v7 & 0x1F];
        v7 >>= 5;
        --v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        *(&v10 + v8) = sixBitToCharLookup[v7 & 0x3F];
        v7 >>= 6;
        --v8;
      }
      while (v8);
    }
  }
  return CFStringHashISOLatin1CString((unsigned __int8 *)v11, v6);
}

- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5
{
  uint64_t v5 = a3;
  __src[2] = *(void *)off_1ECE0A5B0;
  if (a5 == 513 || a5 == 134217984 || a5 == 1536)
  {
    __src[0] = 0;
    __src[1] = 0;
    uint64_t v6 = *(void *)off_1ECE0A6F0;
    if ((~(unint64_t)self & 0xC000000000000007) == 0) {
      uint64_t v6 = 0;
    }
    unint64_t v7 = v6 ^ (unint64_t)self;
    BOOL v8 = (~(v6 ^ self) & 7) == 0;
    uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
    if (v8) {
      uint64_t v9 = 0xFFFFFFFFFFFFFLL;
    }
    size_t v10 = (v7 >> 3) & 0xF;
    unint64_t v11 = (v9 & (v7 >> 3)) >> 4;
    if (v10 < 8)
    {
      __src[0] = v11;
    }
    else
    {
      uint64_t v12 = (v7 >> 3) & 0xF;
      if (v10 >= 0xA)
      {
        do
        {
          *((unsigned char *)&v15.super_class + v12 + 7) = sixBitToCharLookup[v11 & 0x1F];
          v11 >>= 5;
          --v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          *((unsigned char *)&v15.super_class + v12 + 7) = sixBitToCharLookup[v11 & 0x3F];
          v11 >>= 6;
          --v12;
        }
        while (v12);
      }
    }
    BOOL v13 = v10 <= a4;
    if (v10 <= a4)
    {
      memmove(a3, __src, v10);
      v5 += v10;
    }
    *uint64_t v5 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString _getCString:maxLength:encoding:](&v15, sel__getCString_maxLength_encoding_, a3, a4);
  }
  return v13;
}

- (const)_fastCStringContents:(BOOL)a3
{
  return 0;
}

- (BOOL)isNSString__
{
  return 1;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v21 = *(void *)off_1ECE0A5B0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v4 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ (unint64_t)self;
  uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v5 & 7) == 0) {
    uint64_t v6 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6 & (v5 >> 3);
  NSUInteger v8 = (v5 >> 3) & 0xF;
  unint64_t v9 = v7 >> 4;
  if (v8 < 8)
  {
    unint64_t v19 = v9;
  }
  else
  {
    NSUInteger v10 = v8;
    if (v8 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v18 + v10 + 7) = sixBitToCharLookup[v9 & 0x1F];
        v9 >>= 5;
        --v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        *((unsigned char *)&v18 + v10 + 7) = sixBitToCharLookup[v9 & 0x3F];
        v9 >>= 6;
        --v10;
      }
      while (v10);
    }
  }
  if (v8 < a4.length || a4.location > v8 - a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    NSUInteger v15 = v8;
    uint64_t v16 = __CFExceptionProem((objc_class *)self, a2);
    uint64_t v17 = "";
    if (length == 64) {
      uint64_t v17 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v16,
      location,
      length,
      v15,
      v17,
      v19,
      v20,
      v21);
  }
  if (a4.length)
  {
    unint64_t v11 = (unsigned __int8 *)&v19 + a4.location;
    do
    {
      unsigned __int16 v12 = *v11++;
      *a3++ = v12;
      --a4.length;
    }
    while (a4.length);
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v3 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v3 = 0;
  }
  unint64_t v4 = v3 ^ (unint64_t)self;
  uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v4 & 7) == 0) {
    uint64_t v5 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = v5 & (v4 >> 3);
  unint64_t v7 = (v4 >> 3) & 0xF;
  unint64_t v8 = v6 >> 4;
  if (v7 < 8)
  {
    unint64_t v15 = v8;
  }
  else
  {
    unint64_t v9 = v7;
    if (v7 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v14 + v9 + 7) = sixBitToCharLookup[v8 & 0x1F];
        v8 >>= 5;
        --v9;
      }
      while (v9);
    }
    else
    {
      do
      {
        *((unsigned char *)&v14 + v9 + 7) = sixBitToCharLookup[v8 & 0x3F];
        v8 >>= 6;
        --v9;
      }
      while (v9);
    }
  }
  if (v7 <= a3)
  {
    unint64_t v12 = v7;
    uint64_t v13 = __CFExceptionProem((objc_class *)self, a2);
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Index %lu out of bounds; string length %lu",
      v13,
      a3,
      v12,
      v15,
      v16,
      v17);
  }
  return *((unsigned __int8 *)&v15 + a3);
}

- (const)_fastCharacterContents
{
  return 0;
}

- (const)UTF8String
{
  __src[2] = *(void *)off_1ECE0A5B0;
  __src[0] = 0;
  __src[1] = 0;
  uint64_t v2 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0) {
    uint64_t v2 = 0;
  }
  unint64_t v3 = v2 ^ (unint64_t)self;
  BOOL v4 = (~(v2 ^ self) & 7) == 0;
  uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
  if (v4) {
    uint64_t v5 = 0xFFFFFFFFFFFFFLL;
  }
  size_t v6 = (v3 >> 3) & 0xF;
  unint64_t v7 = (v5 & (v3 >> 3)) >> 4;
  if (v6 < 8)
  {
    __src[0] = v7;
  }
  else
  {
    uint64_t v8 = (v3 >> 3) & 0xF;
    if (v6 >= 0xA)
    {
      do
      {
        *(&v13 + v8) = sixBitToCharLookup[v7 & 0x1F];
        v7 >>= 5;
        --v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        *(&v13 + v8) = sixBitToCharLookup[v7 & 0x3F];
        v7 >>= 6;
        --v8;
      }
      while (v8);
    }
  }
  os_unfair_lock_lock_with_options();
  int v9 = nextAvailableCacheSlot;
  if (nextAvailableCacheSlot <= 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
LABEL_16:
    NSUInteger v10 = objc_alloc_init(NSTaggedPointerStringCStringContainer);
    goto LABEL_17;
  }
  --nextAvailableCacheSlot;
  NSUInteger v10 = (NSTaggedPointerStringCStringContainer *)cache[v9 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  if (!v10) {
    goto LABEL_16;
  }
LABEL_17:
  unint64_t v11 = (char *)v10 + 8;
  memmove(v11, __src, v6);
  v11[v6] = 0;
  return v11;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  v25[2] = *(void *)off_1ECE0A5B0;
  v25[0] = 0;
  v25[1] = 0;
  uint64_t v4 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) != 0) {
    uint64_t v5 = *(void *)off_1ECE0A6F0;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 ^ (unint64_t)self;
  uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v6 & 7) == 0) {
    uint64_t v7 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v8 = v7 & (v6 >> 3);
  NSUInteger v9 = (v6 >> 3) & 0xF;
  unint64_t v10 = v8 >> 4;
  if (v9 < 8)
  {
    v25[0] = v10;
  }
  else
  {
    NSUInteger v11 = v9;
    if (v9 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v24 + v11 + 7) = sixBitToCharLookup[v10 & 0x1F];
        v10 >>= 5;
        --v11;
      }
      while (v11);
    }
    else
    {
      do
      {
        *((unsigned char *)&v24 + v11 + 7) = sixBitToCharLookup[v10 & 0x3F];
        v10 >>= 6;
        --v11;
      }
      while (v11);
    }
  }
  if (v9 < a3.length || a3.location > v9 - a3.length)
  {
    NSUInteger location = a3.location;
    NSUInteger v21 = v9;
    uint64_t v22 = __CFExceptionProem((objc_class *)self, a2);
    unint64_t v23 = "";
    if (length == 64) {
      unint64_t v23 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    }
    _CFThrowFormattedException(@"NSInvalidArgumentException", @"%@: Range {%lu, %lu} out of bounds; string length %lu%s",
      v22,
      location,
      length,
      v21,
      v23);
  }
  if (!a3.length) {
    return &stru_1ECE10768;
  }
  unint64_t v12 = (unsigned __int8 *)v25 + a3.location;
  if ((uint64_t)a3.length < 8)
  {
    uint64_t v24 = 0;
    __memmove_chk();
    id result = 0;
    if ((v24 & 0x8080808080808080) == 0)
    {
      id result = (id)((8 * length) | (v24 << 7) | 0x8000000000000002);
      unint64_t v17 = *(void *)off_1ECE0A6F0 ^ (unint64_t)result;
LABEL_30:
      if ((~v17 & 0xC000000000000007) != 0) {
        return (id)(v17 & 0xFFFFFFFFFFFFFFF8 | *((unsigned __int8 *)off_1ECE0A6E0 + (v17 & 7)));
      }
    }
  }
  else
  {
    if (a3.length <= 0xB)
    {
      if (a3.length >= 0xA)
      {
        uint64_t v13 = 0;
        NSUInteger v18 = a3.length;
        while (1)
        {
          unint64_t v19 = charToSixBitLookup[*v12];
          if (v19 > 0x1F) {
            break;
          }
          uint64_t v13 = v19 | (32 * v13);
          ++v12;
          if (!--v18)
          {
LABEL_29:
            id result = (id)((8 * a3.length) | (v13 << 7) | 0x8000000000000002);
            unint64_t v17 = (unint64_t)result ^ v4;
            goto LABEL_30;
          }
        }
      }
      else
      {
        uint64_t v13 = 0;
        NSUInteger v14 = a3.length;
        while (1)
        {
          unint64_t v15 = charToSixBitLookup[*v12];
          if (v15 > 0x3F) {
            break;
          }
          uint64_t v13 = v15 | (v13 << 6);
          ++v12;
          if (!--v14) {
            goto LABEL_29;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (((unint64_t)a3 & 0x8000000000000000) == 0) {
    return isEqualToString((uint64_t)self, a3);
  }
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ (unint64_t)a3;
  unint64_t v6 = (v4 ^ (unint64_t)a3) & 7;
  do
  {
    if (v6 == *((unsigned __int8 *)off_1ECE0A6E0 + v3)) {
      break;
    }
    ++v3;
  }
  while (v3 != 7);
  BOOL v7 = 0;
  if ((~(_BYTE)v3 & 7) == 0 && ((v3 | v5) & 0x7F80000000000000) == 0x700000000000000) {
    return isEqualToString((uint64_t)self, a3);
  }
  return v7;
}

- (id)lowercaseStringWithLocale:(id)a3
{
  v25[2] = *(void *)off_1ECE0A5B0;
  if (a3)
  {
LABEL_2:
    v23.receiver = self;
    v23.super_class = (Class)NSTaggedPointerString;
    return [(NSTaggedPointerString *)&v23 lowercaseStringWithLocale:a3];
  }
  v25[0] = 0;
  v25[1] = 0;
  uint64_t v6 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) != 0) {
    uint64_t v7 = *(void *)off_1ECE0A6F0;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 ^ (unint64_t)self;
  uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v8 & 7) == 0) {
    uint64_t v9 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v10 = (v8 >> 3) & 0xF;
  unint64_t v11 = (v9 & (v8 >> 3)) >> 4;
  if (v10 < 8)
  {
    v25[0] = v11;
    if (!v10) {
      return &stru_1ECE10768;
    }
  }
  else
  {
    unint64_t v12 = v10;
    if (v10 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v24 + v12 + 7) = sixBitToCharLookup[v11 & 0x1F];
        v11 >>= 5;
        --v12;
      }
      while (v12);
    }
    else
    {
      do
      {
        *((unsigned char *)&v24 + v12 + 7) = sixBitToCharLookup[v11 & 0x3F];
        v11 >>= 6;
        --v12;
      }
      while (v12);
    }
  }
  for (uint64_t i = 0; i != v10; ++i)
  {
    int v14 = *((unsigned __int8 *)v25 + i);
    if ((v14 - 65) <= 0x19) {
      *((unsigned char *)v25 + i) = v14 + 32;
    }
  }
  if (v10 >= 8)
  {
    if (v10 <= 0xB)
    {
      if (v10 >= 0xA)
      {
        uint64_t v15 = 0;
        uint64_t v20 = (unsigned __int8 *)v25;
        unint64_t v21 = v10;
        while (1)
        {
          unint64_t v22 = charToSixBitLookup[*v20];
          if (v22 > 0x1F) {
            break;
          }
          uint64_t v15 = v22 | (32 * v15);
          ++v20;
          if (!--v21)
          {
LABEL_33:
            id result = (id)((8 * v10) | (v15 << 7) | 0x8000000000000002);
            unint64_t v19 = (unint64_t)result ^ v6;
            goto LABEL_34;
          }
        }
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v16 = (unsigned __int8 *)v25;
        unint64_t v17 = v10;
        while (1)
        {
          unint64_t v18 = charToSixBitLookup[*v16];
          if (v18 > 0x3F) {
            break;
          }
          uint64_t v15 = v18 | (v15 << 6);
          ++v16;
          if (!--v17) {
            goto LABEL_33;
          }
        }
      }
    }
    goto LABEL_2;
  }
  uint64_t v24 = 0;
  __memmove_chk();
  id result = 0;
  if ((v24 & 0x8080808080808080) == 0)
  {
    id result = (id)((8 * v10) | (v24 << 7) | 0x8000000000000002);
    unint64_t v19 = *(void *)off_1ECE0A6F0 ^ (unint64_t)result;
LABEL_34:
    if ((~v19 & 0xC000000000000007) != 0) {
      id result = (id)(v19 & 0xFFFFFFFFFFFFFFF8 | *((unsigned __int8 *)off_1ECE0A6E0 + (v19 & 7)));
    }
  }
  if (!result) {
    goto LABEL_2;
  }
  return result;
}

- (id)uppercaseStringWithLocale:(id)a3
{
  v25[2] = *(void *)off_1ECE0A5B0;
  if (a3)
  {
LABEL_2:
    v23.receiver = self;
    v23.super_class = (Class)NSTaggedPointerString;
    return [(NSTaggedPointerString *)&v23 uppercaseStringWithLocale:a3];
  }
  v25[0] = 0;
  v25[1] = 0;
  uint64_t v6 = *(void *)off_1ECE0A6F0;
  if ((~(unint64_t)self & 0xC000000000000007) != 0) {
    uint64_t v7 = *(void *)off_1ECE0A6F0;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 ^ (unint64_t)self;
  uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v8 & 7) == 0) {
    uint64_t v9 = 0xFFFFFFFFFFFFFLL;
  }
  unint64_t v10 = (v8 >> 3) & 0xF;
  unint64_t v11 = (v9 & (v8 >> 3)) >> 4;
  if (v10 < 8)
  {
    v25[0] = v11;
    if (!v10) {
      return &stru_1ECE10768;
    }
  }
  else
  {
    unint64_t v12 = v10;
    if (v10 >= 0xA)
    {
      do
      {
        *((unsigned char *)&v24 + v12 + 7) = sixBitToCharLookup[v11 & 0x1F];
        v11 >>= 5;
        --v12;
      }
      while (v12);
    }
    else
    {
      do
      {
        *((unsigned char *)&v24 + v12 + 7) = sixBitToCharLookup[v11 & 0x3F];
        v11 >>= 6;
        --v12;
      }
      while (v12);
    }
  }
  for (uint64_t i = 0; i != v10; ++i)
  {
    int v14 = *((unsigned __int8 *)v25 + i);
    if ((v14 - 97) <= 0x19) {
      *((unsigned char *)v25 + i) = v14 - 32;
    }
  }
  if (v10 >= 8)
  {
    if (v10 <= 0xB)
    {
      if (v10 >= 0xA)
      {
        uint64_t v15 = 0;
        uint64_t v20 = (unsigned __int8 *)v25;
        unint64_t v21 = v10;
        while (1)
        {
          unint64_t v22 = charToSixBitLookup[*v20];
          if (v22 > 0x1F) {
            break;
          }
          uint64_t v15 = v22 | (32 * v15);
          ++v20;
          if (!--v21)
          {
LABEL_33:
            id result = (id)((8 * v10) | (v15 << 7) | 0x8000000000000002);
            unint64_t v19 = (unint64_t)result ^ v6;
            goto LABEL_34;
          }
        }
      }
      else
      {
        uint64_t v15 = 0;
        uint64_t v16 = (unsigned __int8 *)v25;
        unint64_t v17 = v10;
        while (1)
        {
          unint64_t v18 = charToSixBitLookup[*v16];
          if (v18 > 0x3F) {
            break;
          }
          uint64_t v15 = v18 | (v15 << 6);
          ++v16;
          if (!--v17) {
            goto LABEL_33;
          }
        }
      }
    }
    goto LABEL_2;
  }
  uint64_t v24 = 0;
  __memmove_chk();
  id result = 0;
  if ((v24 & 0x8080808080808080) == 0)
  {
    id result = (id)((8 * v10) | (v24 << 7) | 0x8000000000000002);
    unint64_t v19 = *(void *)off_1ECE0A6F0 ^ (unint64_t)result;
LABEL_34:
    if ((~v19 & 0xC000000000000007) != 0) {
      id result = (id)(v19 & 0xFFFFFFFFFFFFFFF8 | *((unsigned __int8 *)off_1ECE0A6E0 + (v19 & 7)));
    }
  }
  if (!result) {
    goto LABEL_2;
  }
  return result;
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  if (a3 <= 5 && ((1 << a3) & 0x32) != 0)
  {
    return [(NSTaggedPointerString *)self UTF8String];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString cStringUsingEncoding:](&v4, sel_cStringUsingEncoding_);
  }
}

- (BOOL)_isCString
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_1EC093AA8 = (uint64_t)"NSTaggedPointerString cannot be allocated";
  __break(1u);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (unint64_t)smallestEncoding
{
  return 1;
}

@end
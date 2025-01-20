@interface NSBigMutableString
- (BOOL)_copyDataFrom:(id)a3 range:(_NSRange)a4;
- (BOOL)_copyStorage:(__CFStorage *)a3 encoding:(unint64_t *)a4;
- (BOOL)_getData:(id *)a3 encoding:(unint64_t *)a4;
- (BOOL)_isCString;
- (BOOL)_isMarkedAsImmutable;
- (BOOL)_setData:(id)a3 encoding:(unint64_t)a4;
- (BOOL)_setStorage:(__CFStorage *)a3 encoding:(unint64_t)a4;
- (NSBigMutableString)initWithStorage:(__CFStorage *)a3 length:(unint64_t)a4 isUnicode:(BOOL)a5;
- (NSBigMutableString)initWithString:(id)a3;
- (id)_createSubstringWithRange:(_NSRange)a3;
- (id)_newBigSubstringWithRange:(_NSRange)a3 wantsMutable:(BOOL)a4 zone:(_NSZone *)a5;
- (id)_newSmallImmutableSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_checkForInvalidMutationWithSelector:(SEL)a3;
- (void)_markAsImmutable;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation NSBigMutableString

- (unint64_t)length
{
  return self->length;
}

- (id)_newBigSubstringWithRange:(_NSRange)a3 wantsMutable:(BOOL)a4 zone:(_NSZone *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v7 = self->length;
  if (a3.location + a3.length > v7)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a3.location,
                      a3.length,
                      self->length),
                    0);
    objc_exception_throw(v17);
  }
  BOOL v9 = a4;
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
  if (!a3.location && a3.length == v7 && !a4 && (*(unsigned char *)&flags & 0x10) != 0)
  {
    return self;
  }
  if (a3.length)
  {
    if (*(unsigned char *)&flags)
    {
      if (a4 || a3.length << ((*(unsigned char *)&flags & 2) != 0) >= 0x201)
      {
        v19 = self;
        v16 = (const void *)CFStorageCreateWithSubrange();
        id v12 = (id)[objc_alloc((Class)objc_opt_class()) initWithStorage:v16 length:length isUnicode:(*(_DWORD *)&v19->flags >> 1) & 1];
        CFRelease(v16);
LABEL_24:
        if (!v9) {
          [v12 _markAsImmutable];
        }
        return v12;
      }
    }
    else if (a3.length > 0x10 || a4)
    {
      v18 = self;
      id v12 = objc_alloc_init((Class)objc_opt_class());
      if (!objc_msgSend(v12, "_copyDataFrom:range:", v18, location, length))
      {

        if (v9)
        {
          v13 = NSZoneMalloc(a5, 2 * length);
          -[NSBigMutableString getCharacters:range:](v18, "getCharacters:range:", v13, location, length);
          v14 = +[NSMutableString allocWithZone:a5];
          return [(NSString *)v14 initWithCharactersNoCopy:v13 length:length freeWhenDone:1];
        }
        self = v18;
        goto LABEL_28;
      }
      goto LABEL_24;
    }
LABEL_28:
    return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:](self, "_newSmallImmutableSubstringWithRange:zone:", location, length, a5);
  }
  v15 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v15);
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v8 = self->length;
  BOOL v9 = v8 >= a3.length;
  NSUInteger v10 = v8 - a3.length;
  if (!v9 || a3.location > v10)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                        _NSMethodExceptionProem((objc_class *)self, a2),
                        location,
                        length,
                        self->length),
                      0);
      objc_exception_throw(v19);
    }
    if ((_newSubstringWithRange_zone__warnonce & 1) == 0)
    {
      _newSubstringWithRange_zone__warnonce = 1;
      v13 = _NSMethodExceptionProem((objc_class *)self, a2);
      v21.NSUInteger location = location;
      v21.NSUInteger length = length;
      v14 = NSStringFromRange(v21);
      NSLog((NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v13,
        v14);
    }
    unint64_t v15 = self->length;
    if (location <= v15) {
      NSUInteger v16 = location;
    }
    else {
      NSUInteger v16 = 0;
    }
    BOOL v9 = v15 >= location;
    NSUInteger v17 = v15 - location;
    if (v9) {
      NSUInteger length = v17;
    }
    else {
      NSUInteger length = 0;
    }
    NSUInteger location = v16;
  }

  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:](self, "_newBigSubstringWithRange:wantsMutable:zone:", location, length, 0, a4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:](self, "_newBigSubstringWithRange:wantsMutable:zone:", 0, self->length, 0, a3);
}

- (id)_newSmallImmutableSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  if (!a3.length) {
    return &stru_1ECA5C228;
  }
  size_t length = a3.length;
  NSUInteger location = a3.location;
  if ((*(unsigned char *)&self->flags & 2) != 0)
  {
    id v12 = (malloc_zone_t *)a4;
    if (!a4) {
      id v12 = malloc_default_zone();
    }
    v13 = malloc_type_zone_malloc(v12, 2 * length, 0x4A6F13AEuLL);
    -[NSBigMutableString getCharacters:range:](self, "getCharacters:range:", v13, location, length);
    v14 = +[NSString allocWithZone:a4];
    return [(NSString *)v14 initWithCharactersNoCopy:v13 length:length freeWhenDone:1];
  }
  else
  {
    NSUInteger v8 = (malloc_zone_t *)a4;
    if (!a4) {
      NSUInteger v8 = malloc_default_zone();
    }
    BOOL v9 = malloc_type_zone_malloc(v8, length, 0x4A6F13AEuLL);
    NSUInteger v10 = v9;
    if (*(unsigned char *)&self->flags) {
      CFStorageGetValues();
    }
    else {
      memmove(v9, &self->contents.d.dataBytes[location], length);
    }
    unint64_t v15 = +[NSString allocWithZone:a4];
    uint64_t v16 = _NSCStringEncoding;
    return [(NSString *)v15 initWithBytesNoCopy:v10 length:length encoding:v16 freeWhenDone:1];
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSBigMutableString;
  [(NSBigMutableString *)&v3 dealloc];
}

- (BOOL)_setData:(id)a3 encoding:(unint64_t)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  [(NSBigMutableString *)self _checkForInvalidMutationWithSelector:a2];
  p_contents = &self->contents;
  data = self->contents.d.data;
  if ((*(unsigned char *)&self->flags & 1) == 0 && data == a3) {
    id v25 = a3;
  }
  else {

  }
  p_contents->d.data = 0;
  if (a4 != 1 && _NSCStringEncoding != a4)
  {
    CFStringEncoding v16 = CFStringConvertNSStringEncodingToEncoding(a4);
    switch(BYTE1(v16))
    {
      case 0:
        if ((v16 > 0x22 || ((1 << v16) & 0x600000032) == 0) && v16 != 152) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 1:
        if (v16 == 134217984) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 2:
        if (v16 != 518) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 6:
        if (v16 == 1536) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 8:
      case 0xC:
        goto LABEL_6;
      case 0xA:
        if (v16 - 2561 > 0xF) {
          goto LABEL_46;
        }
        int v28 = 1 << (v16 - 1);
        int v29 = 32785;
        goto LABEL_45;
      case 0xB:
        if (v16 - 3059 > 0xC) {
          goto LABEL_46;
        }
        int v28 = 1 << (v16 + 13);
        int v29 = 4099;
LABEL_45:
        if ((v28 & v29) == 0) {
          goto LABEL_46;
        }
        goto LABEL_6;
      default:
        if ((v16 & 0xFF00) > 0xC00) {
          goto LABEL_6;
        }
LABEL_46:
        unint64_t v30 = [a3 length];
        v31 = (uint64_t *)[a3 bytes];
        break;
    }
    while (v30 > 7)
    {
      uint64_t v32 = *v31++;
      v30 -= 8;
      if ((v32 & 0x8080808080808080) != 0) {
        goto LABEL_6;
      }
    }
    while (v30 > 3)
    {
      int v33 = *(_DWORD *)v31;
      v31 = (uint64_t *)((char *)v31 + 4);
      v30 -= 4;
      if ((v33 & 0x80808080) != 0) {
        goto LABEL_6;
      }
    }
    uint64_t v34 = 0;
    while (v30 != v34)
    {
      int v35 = *((char *)v31 + v34++);
      if (v35 < 0) {
        goto LABEL_6;
      }
    }
    a4 = 1;
  }
LABEL_6:
  *(_DWORD *)&self->flags &= 0xFFFFFFF0;
  self->size_t length = 0;
  if (!a3 || a4 == 1 || a4 == _NSCStringEncoding)
  {
    if (a3) {
      unint64_t v15 = [a3 length];
    }
    else {
      unint64_t v15 = 0;
    }
    self->size_t length = v15;
    v26 = (NSData *)[a3 copyWithZone:0];
    p_contents->d.data = v26;
    self->contents.d.dataBytes = (char *)[(NSData *)v26 bytes];
LABEL_28:
    LOBYTE(v20) = 1;
    return v20;
  }
  if (a4 == 10)
  {
    unint64_t v9 = [a3 length];
    NSUInteger v10 = (NSData *)[a3 copyWithZone:0];
    p_contents->d.data = v10;
    v11 = [(NSData *)v10 bytes];
    self->contents.d.dataBytes = v11;
    if (v9 >= 2 && ((int v12 = *(unsigned __int16 *)v11, v12 == 65279) || v12 == 65534))
    {
      $12A8D912EA621CF5C78D0B17F79410D4 v13 = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags | 4);
      self->$12A8D912EA621CF5C78D0B17F79410D4 flags = v13;
      if (*(__int16 *)self->contents.d.dataBytes == -257) {
        int v14 = 2;
      }
      else {
        int v14 = 10;
      }
    }
    else
    {
      $12A8D912EA621CF5C78D0B17F79410D4 v13 = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFFB);
      int v14 = 2;
    }
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v14 | *(_DWORD *)&v13 & 0xFFFFFFF5);
    self->size_t length = (v9 >> 1) - ((*(unsigned int *)&v13 >> 2) & 1);
    if ((*(unsigned char *)&self->flags & 4) != 0) {
      self->contents.d.dataBytes += 2;
    }
    goto LABEL_28;
  }
  unint64_t v37 = 0;
  v38[0] = 0;
  char v36 = 0;
  NSUInteger v17 = (unsigned __int16 *)[a3 bytes];
  size_t v18 = [a3 length];
  v19 = malloc_default_zone();
  int v20 = _NSConvertToASCIIorUnicode(v17, v18, a4, v38, &v37, &v36, v19);
  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    unint64_t v22 = v37;
    BOOL v23 = v36 == 0;
    v24 = (NSData *)[v21 initWithBytesNoCopy:v38[0] length:v37 << (v36 == 0) freeWhenDone:1];
    p_contents->d.data = v24;
    self->contents.d.dataBytes = (char *)[(NSData *)v24 bytes];
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFFD | (2 * v23));
    self->size_t length = v22;
  }
  return v20;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v24[1] = *MEMORY[0x1E4F143B8];
  [(NSBigMutableString *)self _checkForInvalidMutationWithSelector:a2];
  if (!a4)
  {
    v19 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    int v20 = (void *)MEMORY[0x1E4F1CA00];
    id v21 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_37;
  }
  uint64_t v9 = location + length;
  if (location + length > self->length)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
            _NSMethodExceptionProem((objc_class *)self, a2),
            location,
            length,
            self->length);
    int v20 = (void *)MEMORY[0x1E4F1CA00];
    id v21 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_37:
    objc_exception_throw((id)[v20 exceptionWithName:*v21 reason:v19 userInfo:0]);
  }
  unint64_t v10 = [a4 length];
  unint64_t v11 = self->length;
  if ((*(unsigned char *)&self->flags & 2) != 0)
  {
    BOOL v12 = 1;
  }
  else if ([a4 _isCString])
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v13 = [a4 length];
    BOOL v12 = v13 != [a4 lengthOfBytesUsingEncoding:_NSCStringEncoding];
  }
  if (length != v11) {
    goto LABEL_11;
  }
  if (object_getClass(a4) == (Class)NSBigMutableString)
  {
    id v23 = 0;
    v24[0] = 0;
    if (-[NSBigMutableString _copyDataFrom:range:](self, "_copyDataFrom:range:", a4, 0, v10)) {
      return;
    }
    if ([a4 _copyStorage:&v23 encoding:v24])
    {
      [(NSBigMutableString *)self _setStorage:v23 encoding:v24[0]];

      return;
    }
LABEL_11:
    unint64_t v14 = v10 - length + v11;
    $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
    if (*(unsigned char *)&flags)
    {
      if ((*(unsigned char *)&flags & 2) != 0 || !v12)
      {
        if (v14 <= v11) {
          CFStorageDeleteValues();
        }
        else {
          CFStorageInsertValues();
        }
        goto LABEL_24;
      }
      unint64_t v22 = v10;
      CFStringEncoding v16 = (NSData *)CFStorageCreate();
      CFStorageInsertValues();
      copyFromStringToStorage((uint64_t)self, 0, location, (uint64_t)v16, 0, 1);
      copyFromStringToStorage((uint64_t)self, v9, v11 - v9, (uint64_t)v16, v22 + location, 1);
      *(_DWORD *)&self->flags |= 2u;
    }
    else
    {
      unint64_t v22 = v10;
      CFStringEncoding v16 = (NSData *)CFStorageCreate();
      CFStorageInsertValues();
      if (self->contents.d.data)
      {
        copyFromStringToStorage((uint64_t)self, 0, location, (uint64_t)v16, 0, v12);
        copyFromStringToStorage((uint64_t)self, v9, v11 - v9, (uint64_t)v16, v22 + location, v12);
      }
      if (v12) {
        int v17 = 3;
      }
      else {
        int v17 = 1;
      }
      self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFFC | v17);
    }
    self->contents.d.data = v16;
    unint64_t v10 = v22;
LABEL_24:
    copyFromStringToStorage((uint64_t)a4, 0, v10, (uint64_t)self->contents.d.data, location, v12);
    self->NSUInteger length = v14;
    return;
  }
  if ([a4 length]) {
    goto LABEL_11;
  }

  [(NSBigMutableString *)self _setData:0 encoding:1];
}

- (void)_checkForInvalidMutationWithSelector:(SEL)a3
{
  if ((*(unsigned char *)&self->flags & 0x10) != 0)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Attempt to mutate immutable object with %s", sel_getName(a3)), 0 reason userInfo];
    objc_exception_throw(v3);
  }
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  if (a4.location + a4.length > self->length)
  {
    unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a4.location,
                      a4.length,
                      self->length),
                    0);
    objc_exception_throw(v15);
  }
  v6 = a3;
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
  if (*(unsigned char *)&flags)
  {
    CFStorageGetValues();
    if ((*(unsigned char *)&self->flags & 2) == 0 && (uint64_t)(length - 1) >= 0)
    {
      uint64_t v12 = _NSCStringCharToUnicharTable;
      do
      {
        v6[length - 1] = *(_WORD *)(v12 + 2 * *((unsigned __int8 *)v6 + length - 1));
        --length;
      }
      while (length);
    }
  }
  else
  {
    dataBytes = self->contents.d.dataBytes;
    if ((*(unsigned char *)&flags & 2) != 0)
    {
      uint64_t v13 = &dataBytes[2 * a4.location];
      if ((*(unsigned char *)&flags & 8) != 0)
      {
        if (a4.length)
        {
          do
          {
            unsigned int v14 = *(unsigned __int16 *)v13;
            v13 += 2;
            *v6++ = bswap32(v14) >> 16;
            --length;
          }
          while (length);
        }
      }
      else
      {
        memmove(a3, v13, 2 * a4.length);
      }
    }
    else if (a4.length)
    {
      uint64_t v9 = &dataBytes[a4.location];
      uint64_t v10 = _NSCStringCharToUnicharTable;
      do
      {
        unsigned int v11 = *v9++;
        *v6++ = *(_WORD *)(v10 + 2 * v11);
        --length;
      }
      while (length);
    }
  }
}

- (NSBigMutableString)initWithString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSBigMutableString;
  uint64_t v4 = [(NSString *)&v7 init];
  v5 = v4;
  if (v4) {
    [(NSMutableString *)v4 appendString:a3];
  }
  return v5;
}

- (NSBigMutableString)initWithStorage:(__CFStorage *)a3 length:(unint64_t)a4 isUnicode:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSBigMutableString;
  uint64_t v8 = [(NSString *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->NSUInteger length = a4;
    if (v5) {
      int v10 = 3;
    }
    else {
      int v10 = 1;
    }
    v8->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&v8->flags & 0xFFFFFFFC | v10);
    v8->contents.d.data = (NSData *)a3;
  }
  return v9;
}

- (void)_markAsImmutable
{
  *(_DWORD *)&self->flags |= 0x10u;
}

- (BOOL)_isMarkedAsImmutable
{
  return (*(unsigned char *)&self->flags >> 4) & 1;
}

- (BOOL)_getData:(id *)a3 encoding:(unint64_t *)a4
{
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
    if (a3) {
      *a3 = self->contents.d.data;
    }
    if (a4)
    {
      unint64_t v5 = 10;
      if ((*(_DWORD *)&self->flags & 2) == 0) {
        unint64_t v5 = _NSCStringEncoding;
      }
      *a4 = v5;
    }
  }
  return (*(unsigned char *)&flags & 1) == 0;
}

- (BOOL)_copyStorage:(__CFStorage *)a3 encoding:(unint64_t *)a4
{
  if (*(unsigned char *)&self->flags)
  {
    data = self->contents.d.data;
    if (data)
    {
      if (a3) {
        *a3 = (__CFStorage *)CFStorageCreateWithSubrange();
      }
      if (a4)
      {
        unint64_t v7 = 10;
        if ((*(_DWORD *)&self->flags & 2) == 0) {
          unint64_t v7 = _NSCStringEncoding;
        }
        *a4 = v7;
      }
      LOBYTE(data) = 1;
    }
  }
  else
  {
    LOBYTE(data) = 0;
  }
  return (char)data;
}

- (BOOL)_setStorage:(__CFStorage *)a3 encoding:(unint64_t)a4
{
  [(NSBigMutableString *)self _checkForInvalidMutationWithSelector:a2];
  if (a4 != 1 && a4 != 10 && _NSCStringEncoding != a4)
  {
    int v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s called with unsupported string encoding %lu", sel_getName(a2), a4), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  self->contents.d.data = 0;
  if (a4 == 10) {
    int v8 = 3;
  }
  else {
    int v8 = 1;
  }
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFF0 | v8);
  self->contents.d.data = (NSData *)a3;
  self->NSUInteger length = CFStorageGetCount();
  return 1;
}

- (BOOL)_copyDataFrom:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || (*((unsigned char *)a3 + 8)) {
    return 0;
  }
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;

  self->contents.d.data = 0;
  if (*(unsigned char *)&flags) {
    *(_DWORD *)&self->flags &= ~1u;
  }
  if (location)
  {
    $12A8D912EA621CF5C78D0B17F79410D4 v9 = self->flags;
LABEL_10:
    unint64_t v16 = *((unsigned int *)a3 + 2);
    unsigned int v17 = *((_DWORD *)a3 + 2) & 2 | *(_DWORD *)&v9 & 0xFFFFFFFD;
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)v17;
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v17 & 0xFFFFFFF3 | *((_DWORD *)a3 + 2) & 8);
    uint64_t v18 = (v16 >> 1) & 1;
    NSUInteger v19 = location << ((v16 & 2) != 0);
    if ((*((_DWORD *)a3 + 2) & 4) != 0) {
      NSUInteger v20 = v19 + 2;
    }
    else {
      NSUInteger v20 = v19;
    }
    id v21 = (NSData *)(id)objc_msgSend(*((id *)a3 + 3), "subdataWithRange:", v20, length << v18);
    self->contents.d.data = v21;
    unint64_t v15 = [(NSData *)v21 bytes];
    goto LABEL_14;
  }
  uint64_t v11 = [a3 length];
  $12A8D912EA621CF5C78D0B17F79410D4 v9 = self->flags;
  if (length != v11) {
    goto LABEL_10;
  }
  unsigned int v12 = *(_DWORD *)&v9 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 2) >> 1) & 1));
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)v12;
  unsigned int v13 = v12 & 0xFFFFFFF7 | (8 * ((*((_DWORD *)a3 + 2) >> 3) & 1));
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)v13;
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v13 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 2) >> 2) & 1)));
  unsigned int v14 = (NSData *)*((id *)a3 + 3);
  self->contents.d.data = v14;
  unint64_t v15 = (char *)([(NSData *)v14 bytes] + (((unint64_t)self->flags >> 1) & 2));
LABEL_14:
  self->contents.d.dataBytes = v15;
  self->NSUInteger length = length;
  return 1;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->length <= a3)
  {
    int v8 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a3,
                     self->length),
                   0);
    objc_exception_throw(v8);
  }
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
  if (*(unsigned char *)&flags)
  {
    ConstValueAtIndex = (_WORD *)CFStorageGetConstValueAtIndex();
    if ((*(unsigned char *)&flags & 2) != 0)
    {
LABEL_7:
      LOWORD(v5) = *ConstValueAtIndex;
      return v5;
    }
LABEL_6:
    ConstValueAtIndex = (_WORD *)(_NSCStringCharToUnicharTable + 2 * *(unsigned __int8 *)ConstValueAtIndex);
    goto LABEL_7;
  }
  if ((*(unsigned char *)&flags & 2) == 0)
  {
    ConstValueAtIndex = [(NSData *)self->contents.d.data bytes] + a3;
    goto LABEL_6;
  }
  unsigned int v5 = *(unsigned __int16 *)&self->contents.d.dataBytes[2 * a3];
  unsigned int v6 = bswap32(v5) >> 16;
  if ((*(unsigned char *)&flags & 8) != 0) {
    LOWORD(v5) = v6;
  }
  return v5;
}

- (BOOL)_isCString
{
  return (*(unsigned char *)&self->flags & 2) == 0;
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v6 = self->length;
  BOOL v7 = v6 >= a3.length;
  NSUInteger v8 = v6 - a3.length;
  if (!v7 || a3.location > v8)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      unsigned int v17 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                        _NSMethodExceptionProem((objc_class *)self, a2),
                        location,
                        length,
                        self->length),
                      0);
      objc_exception_throw(v17);
    }
    if ((_createSubstringWithRange__warnonce & 1) == 0)
    {
      _createSubstringWithRange__warnonce = 1;
      uint64_t v11 = _NSMethodExceptionProem((objc_class *)self, a2);
      v20.NSUInteger location = location;
      v20.NSUInteger length = length;
      unsigned int v12 = NSStringFromRange(v20);
      NSLog((NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v11,
        v12);
    }
    unint64_t v13 = self->length;
    if (location <= v13) {
      NSUInteger v14 = location;
    }
    else {
      NSUInteger v14 = 0;
    }
    BOOL v7 = v13 >= location;
    NSUInteger v15 = v13 - location;
    if (v7) {
      NSUInteger length = v15;
    }
    else {
      NSUInteger length = 0;
    }
    NSUInteger location = v14;
  }
  v18.receiver = self;
  v18.super_class = (Class)NSBigMutableString;
  return -[NSString _createSubstringWithRange:](&v18, sel__createSubstringWithRange_, location, length);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:](self, "_newBigSubstringWithRange:wantsMutable:zone:", 0, self->length, 1, a3);
}

@end
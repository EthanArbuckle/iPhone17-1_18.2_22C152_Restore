@interface _NSBPlistMappedString
+ (id)createStringWithOffset:(int64_t)a3 intoMappingData:(id)a4;
+ (void)initialize;
- (CFIndex)getBPlistPtr:(CFIndex *)a3 bplistSize:(void *)a4 stringPtr:(unsigned char *)a5 isUTF16BE:;
- (const)_fastCStringContents:(BOOL)a3;
- (uint64_t)isUTF16BE;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _NSBPlistMappedString

- (unint64_t)length
{
  if (self)
  {
    if ((unint64_t)self & 0x8000000000000000) == 0 || (enableTaggedPointerBPlistMappedStrings)
    {
      unint64_t payload = self->payload;
    }
    else
    {
      uint64_t v2 = *MEMORY[0x1E4FBA8E0];
      if ((~(unint64_t)self & 0xC000000000000007) == 0) {
        uint64_t v2 = 0;
      }
      unint64_t v3 = v2 ^ (unint64_t)self;
      uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v3 & 7) == 0) {
        uint64_t v4 = 0xFFFFFFFFFFFFFLL;
      }
      unint64_t payload = v4 & (v3 >> 3);
    }
  }
  else
  {
    unint64_t payload = 0;
  }
  return (payload >> 1) & 0x1FFF;
}

- (unint64_t)fastestEncoding
{
  if (-[_NSBPlistMappedString isUTF16BE]((uint64_t)self)) {
    return 2415919360;
  }
  else {
    return 1;
  }
}

- (uint64_t)isUTF16BE
{
  if (result)
  {
    if (result & 0x8000000000000000) == 0 || (enableTaggedPointerBPlistMappedStrings)
    {
      uint64_t v4 = *(void *)(result + 8);
    }
    else
    {
      uint64_t v1 = *MEMORY[0x1E4FBA8E0];
      if ((~result & 0xC000000000000007) == 0) {
        uint64_t v1 = 0;
      }
      unint64_t v2 = v1 ^ result;
      uint64_t v3 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v2 & 7) == 0) {
        uint64_t v3 = 0xFFFFFFFFFFFFFLL;
      }
      uint64_t v4 = v3 & (v2 >> 3);
    }
    return v4 & 1;
  }
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v4 = 0;
  -[_NSBPlistMappedString getCharacters:range:](self, "getCharacters:range:", &v4, a3, 1);
  return v4;
}

+ (id)createStringWithOffset:(int64_t)a3 intoMappingData:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((__objc2_class *)objc_opt_class() != _NSBPlistMappedData) {
    return 0;
  }
  uint64_t v7 = [a4 mappingIndex];
  id result = 0;
  if (a3 <= 0xFFFFFFF && v7 != -1 && v7 <= 1023)
  {
    int v8 = *(unsigned char *)([a4 bytes] + a3) & 0xF0;
    [a4 bytes];
    [a4 _bplistObjectsRangeEnd];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    if (v8 == 96)
    {
      v14 = ___getStringLength_block_invoke_2;
      v15 = &unk_1E51F8318;
      char v9 = __CFBinaryPlistParseUnicode16String();
    }
    else
    {
      v14 = ___getStringLength_block_invoke;
      v15 = &unk_1E51F82F0;
      char v9 = __CFBinaryPlistParseASCIIString();
    }
    if ((v9 & 1) == 0) {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Plist data is corrupt!", 0, v13, 3221225472, v14, v15, &v16, v16));
    }
    unint64_t v10 = v17[3];
    _Block_object_dispose(&v16, 8);
    if (v10 >> 13) {
      return 0;
    }
    int64_t v11 = (v7 << 14) | (a3 << 24) | (v8 == 96) | (2 * v10);
    if (enableTaggedPointerBPlistMappedStrings)
    {
      id result = objc_alloc_init(_NSBPlistMappedString);
      if (result) {
        *((void *)result + 1) = v11;
      }
    }
    else
    {
      id result = (id)((8 * (v11 & 0xFFFFFFFFFFFFFLL)) | 0x8700000000000007);
      unint64_t v12 = *MEMORY[0x1E4FBA8E0] ^ (unint64_t)result;
      if ((~v12 & 0xC000000000000007) != 0) {
        return (id)(v12 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v12 & 7)));
      }
    }
  }
  return result;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v21 = 0;
  CFIndex v19 = 0;
  uint64_t v20 = 0;
  uint64_t v18 = 0;
  -[_NSBPlistMappedString getBPlistPtr:bplistSize:stringPtr:isUTF16BE:]((CFIndex)self, &v20, &v19, &v18, &v21);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  int64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v7 = v21;
  if (v21) {
    char v8 = __CFBinaryPlistParseUnicode16String();
  }
  else {
    char v8 = __CFBinaryPlistParseASCIIString();
  }
  if ((v8 & 1) == 0)
  {
    char v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Plist data is corrupt!" userInfo:0];
    goto LABEL_8;
  }
  if (*((unsigned char *)v11 + 24))
  {
    v23.NSUInteger location = location;
    v23.NSUInteger length = length;
    char v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Out of range. Requested range: %@, reported length: %ld, encoded length: %ld, isUTF16BE: %d", NSStringFromRange(v23), v15[3], -[_NSBPlistMappedString length](self, "length"), v7), 0 reason userInfo];
LABEL_8:
    objc_exception_throw(v9);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

- (const)_fastCStringContents:(BOOL)a3
{
  uint64_t v3 = 0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (!a3)
  {
    char v9 = 0;
    CFIndex v7 = 0;
    char v8 = 0;
    uint64_t v6 = 0;
    -[_NSBPlistMappedString getBPlistPtr:bplistSize:stringPtr:isUTF16BE:]((CFIndex)self, &v8, &v7, &v6, &v9);
    if (!v9)
    {
      uint64_t v5 = MEMORY[0x1E4F143A8];
      if ((__CFBinaryPlistParseASCIIString() & 1) == 0) {
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3B8], @"Plist data is corrupt!", 0, v5, 3221225472, __46___NSBPlistMappedString__fastCStringContents___block_invoke, &unk_1E51F82F0, &v10));
      }
    }
    uint64_t v3 = (const char *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (CFIndex)getBPlistPtr:(CFIndex *)a3 bplistSize:(void *)a4 stringPtr:(unsigned char *)a5 isUTF16BE:
{
  if (result)
  {
    if (result & 0x8000000000000000) == 0 || (enableTaggedPointerBPlistMappedStrings)
    {
      unint64_t v11 = *(void *)(result + 8);
    }
    else
    {
      uint64_t v8 = *MEMORY[0x1E4FBA8E0];
      if ((~result & 0xC000000000000007) == 0) {
        uint64_t v8 = 0;
      }
      unint64_t v9 = v8 ^ result;
      uint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v9 & 7) == 0) {
        uint64_t v10 = 0xFFFFFFFFFFFFFLL;
      }
      unint64_t v11 = v10 & (v9 >> 3);
    }
    *a5 = v11 & 1;
    CFDataRef MappedStringsFile = (const __CFData *)_CFBundleGetMappedStringsFile();
    if (!MappedStringsFile) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Invalid tagged pointer reference" userInfo:0]);
    }
    CFDataRef v13 = MappedStringsFile;
    *a2 = CFDataGetBytePtr(MappedStringsFile);
    id result = CFDataGetLength(v13);
    *a3 = result;
    *a4 = &(*a2)[(v11 >> 24) & 0xFFFFFFF];
  }
  return result;
}

+ (void)initialize
{
  if (_NSBPlistMappedString == a1)
  {
    if (*MEMORY[0x1E4FBA8D8] && dyld_program_sdk_at_least())
    {
      _objc_registerTaggedPointerClass();
    }
    else
    {
      enableTaggedPointerBPlistMappedStrings = 1;
    }
  }
}

- (unint64_t)smallestEncoding
{
  if (-[_NSBPlistMappedString isUTF16BE]((uint64_t)self)) {
    return 2415919360;
  }
  else {
    return 1;
  }
}

@end
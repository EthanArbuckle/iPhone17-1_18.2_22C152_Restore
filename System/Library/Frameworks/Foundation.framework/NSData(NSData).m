@interface NSData(NSData)
+ (BOOL)_base64DecodingAlwaysSucceedsForOptions:()NSData;
+ (__objc2_class)allocWithZone:()NSData;
+ (id)_alloc;
+ (id)data;
+ (id)dataWithBytes:()NSData length:;
+ (id)dataWithBytesNoCopy:()NSData length:;
+ (id)dataWithBytesNoCopy:()NSData length:freeWhenDone:;
+ (id)dataWithContentsOfFile:()NSData;
+ (id)dataWithContentsOfFile:()NSData options:error:;
+ (id)dataWithContentsOfMappedFile:()NSData;
+ (id)dataWithContentsOfURL:()NSData;
+ (id)dataWithContentsOfURL:()NSData options:error:;
+ (id)dataWithContentsOfURL:()NSData options:maxLength:error:;
+ (id)dataWithData:()NSData;
+ (uint64_t)_newZeroingDataWithBytes:()NSData length:;
+ (uint64_t)_newZeroingDataWithBytesNoCopy:()NSData length:deallocator:;
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
- (BOOL)_canReplaceWithDispatchDataForXPCCoder;
- (NSString)_base64EncodingAsString:()NSData withOptions:;
- (dispatch_data_t)replacementObjectForCoder:()NSData;
- (id)_asciiDescription;
- (id)debugDescription;
- (id)description;
- (id)initWithCoder:()NSData;
- (id)subdataWithRange:()NSData;
- (uint64_t)_allowsDirectEncoding;
- (uint64_t)_copyWillRetain;
- (uint64_t)_createDispatchData;
- (uint64_t)_decodeBase64EncodedCharacterBuffer:()NSData length:options:buffer:bufferLength:state:;
- (uint64_t)_initWithBase64EncodedObject:()NSData options:;
- (uint64_t)_isCompact;
- (uint64_t)_isDispatchData;
- (uint64_t)_providesConcreteBacking;
- (uint64_t)base64EncodedDataWithOptions:()NSData;
- (uint64_t)base64EncodedStringWithOptions:()NSData;
- (uint64_t)base64Encoding;
- (uint64_t)classForCoder;
- (uint64_t)copyWithZone:()NSData;
- (uint64_t)encodeWithCoder:()NSData;
- (uint64_t)enumerateByteRangesUsingBlock:()NSData;
- (uint64_t)hash;
- (uint64_t)initWithBase64EncodedData:()NSData options:;
- (uint64_t)initWithBase64EncodedString:()NSData options:;
- (uint64_t)initWithBase64Encoding:()NSData;
- (uint64_t)initWithBytes:()NSData length:;
- (uint64_t)initWithBytes:()NSData length:copy:freeWhenDone:bytesAreVM:;
- (uint64_t)initWithBytesNoCopy:()NSData length:;
- (uint64_t)initWithBytesNoCopy:()NSData length:deallocator:;
- (uint64_t)initWithBytesNoCopy:()NSData length:freeWhenDone:;
- (uint64_t)initWithContentsOfFile:()NSData;
- (uint64_t)initWithContentsOfFile:()NSData error:;
- (uint64_t)initWithContentsOfFile:()NSData options:error:;
- (uint64_t)initWithContentsOfFile:()NSData options:maxLength:error:;
- (uint64_t)initWithContentsOfMappedFile:()NSData;
- (uint64_t)initWithContentsOfMappedFile:()NSData error:;
- (uint64_t)initWithContentsOfURL:()NSData;
- (uint64_t)initWithContentsOfURL:()NSData options:error:;
- (uint64_t)initWithContentsOfURL:()NSData options:maxLength:error:;
- (uint64_t)initWithData:()NSData;
- (uint64_t)isEqual:()NSData;
- (uint64_t)isEqualToData:()NSData;
- (uint64_t)mutableCopyWithZone:()NSData;
- (uint64_t)rangeOfData:()NSData options:range:;
- (uint64_t)writeToFile:()NSData atomically:;
- (uint64_t)writeToFile:()NSData atomically:error:;
- (uint64_t)writeToFile:()NSData options:error:;
- (uint64_t)writeToURL:()NSData atomically:;
- (uint64_t)writeToURL:()NSData options:error:;
- (void)bytes;
- (void)getBytes:()NSData;
- (void)getBytes:()NSData length:;
- (void)getBytes:()NSData range:;
- (void)initWithBytes:()NSData length:copy:deallocator:;
- (void)length;
@end

@implementation NSData(NSData)

- (uint64_t)isEqual:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  if (a3 == a1) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t result = _NSIsNSData();
  if (result)
  {
    return [a1 isEqualToData:a3];
  }
  return result;
}

- (uint64_t)hash
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBD0]);
  }
  [a1 length];
  [a1 bytes];

  return CFHashBytes();
}

- (uint64_t)encodeWithCoder:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  if ([a3 allowsKeyedCoding])
  {
    if (object_getClass(a3) == (Class)NSKeyedArchiver)
    {
      return [a3 _encodePropertyList:a1 forKey:@"NS.data"];
    }
    else
    {
      uint64_t v6 = [a1 bytes];
      uint64_t v7 = [a1 length];
      return [a3 encodeBytes:v6 length:v7 forKey:@"NS.bytes"];
    }
  }
  else
  {
    return [a3 encodeDataObject:a1];
  }
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (uint64_t)initWithData:()NSData
{
  uint64_t v5 = [a3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a3 bytes];
    v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 1;
  }
  else
  {
    v8 = a1;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  return [v8 initWithBytes:v7 length:v9 copy:v10 freeWhenDone:0 bytesAreVM:0];
}

- (uint64_t)isEqualToData:()NSData
{
  uint64_t v5 = a1;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10])
  {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
    if (!a3) {
      return 0;
    }
  }
  else if (!a3)
  {
    return 0;
  }
  if (a3 == v5) {
    return 1;
  }
  size_t v6 = [v5 length];
  if (v6 != [a3 length]) {
    return 0;
  }
  BOOL v7 = 1;
  if (v6)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    if ([v5 _isCompact]) {
      v8 = (const void *)[v5 bytes];
    }
    else {
      v8 = 0;
    }
    if ([a3 _isCompact])
    {
      uint64_t v9 = (const void *)[a3 bytes];
      uint64_t v10 = v9;
      BOOL v11 = v8 != 0;
      BOOL v12 = v9 != 0;
      if (v8 && v9)
      {
        BOOL v7 = memcmp(v8, v9, v6) == 0;
        *((unsigned char *)v23 + 24) = v7;
LABEL_22:
        _Block_object_dispose(&v22, 8);
        return v7;
      }
    }
    else
    {
      BOOL v12 = 0;
      uint64_t v10 = 0;
      BOOL v11 = v8 != 0;
    }
    if (v11 || v12)
    {
      v20[1] = MEMORY[0x1E4F143A8];
      v20[2] = 3221225472;
      v20[3] = __32__NSData_NSData__isEqualToData___block_invoke;
      v20[4] = &unk_1E51F7090;
      if (v11) {
        uint64_t v5 = a3;
      }
      v21[1] = v8;
      v21[2] = v10;
      v13 = v21;
    }
    else
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __32__NSData_NSData__isEqualToData___block_invoke_2;
      v18 = &unk_1E51F7068;
      v19 = a3;
      v13 = v20;
    }
    void *v13 = &v22;
    objc_msgSend(v5, "enumerateByteRangesUsingBlock:", v15, v16, v17, v18, v19);
    BOOL v7 = *((unsigned char *)v23 + 24) != 0;
    goto LABEL_22;
  }
  return v7;
}

- (id)subdataWithRange:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD0]);
  }
  unint64_t v9 = [a1 length];
  if (a4)
  {
    if (__CFADD__(a4, a3))
    {
      uint64_t v15 = _NSMethodExceptionProem((objc_class *)a1, a2);
      v21.location = a3;
      v21.length = a4;
      uint64_t v16 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v15, NSStringFromRange(v21), v19];
    }
    else
    {
      if (a3 + a4 <= v9)
      {
        if (a3 || a4 != v9)
        {
          if (a4 >= 0x40
            && ((__objc2_class *)objc_opt_class() != NSConcreteData
             || [a1 _copyWillRetain])
            && ((__objc2_class *)objc_opt_class() == NSConcreteData
             || (uint64_t v13 = objc_opt_class(), v13 == objc_opt_class())
             || (uint64_t v14 = objc_opt_class(), v14 == objc_opt_class())
             || a4 >> 15))
          {
            uint64_t v10 = objc_msgSend(objc_allocWithZone((Class)NSSubrangeData), "initWithData:range:", a1, a3, a4);
          }
          else
          {
            uint64_t v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", objc_msgSend(a1, "bytes") + a3, a4);
          }
        }
        else
        {
          uint64_t v10 = (void *)[a1 copyWithZone:0];
        }
        return v10;
      }
      unint64_t v17 = v9;
      v18 = _NSMethodExceptionProem((objc_class *)a1, a2);
      v22.location = a3;
      v22.length = a4;
      uint64_t v16 = +[NSString stringWithFormat:@"%@: range %@ exceeds data length %lu", v18, NSStringFromRange(v22), v17];
    }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v16 userInfo:0]);
  }
  BOOL v11 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v11 data];
}

+ (id)dataWithBytesNoCopy:()NSData length:freeWhenDone:
{
  uint64_t v5 = (void *)[objc_allocWithZone(a1) initWithBytesNoCopy:a3 length:a4 freeWhenDone:a5];

  return v5;
}

- (uint64_t)initWithBytesNoCopy:()NSData length:freeWhenDone:
{
  return [a1 initWithBytes:a3 length:a4 copy:0 freeWhenDone:a5 bytesAreVM:0];
}

+ (id)dataWithBytes:()NSData length:
{
  uint64_t v4 = (void *)[objc_allocWithZone(a1) initWithBytes:a3 length:a4];

  return v4;
}

- (uint64_t)initWithBytes:()NSData length:
{
  return [a1 initWithBytes:a3 length:a4 copy:1 freeWhenDone:0 bytesAreVM:0];
}

+ (id)dataWithBytesNoCopy:()NSData length:
{
  uint64_t v4 = (void *)[objc_allocWithZone(a1) initWithBytesNoCopy:a3 length:a4];

  return v4;
}

+ (__objc2_class)allocWithZone:()NSData
{
  if ((objc_class *)MEMORY[0x1E4F1C9B8] == a1) {
    return &___placeholderData;
  }
  else {
    return (__objc2_class **)NSAllocateObject(a1, 0, a3);
  }
}

- (uint64_t)initWithBytes:()NSData length:copy:freeWhenDone:bytesAreVM:
{
  BOOL v7 = &__block_literal_global_6;
  if (a7) {
    BOOL v7 = &__block_literal_global_2;
  }
  if (a6) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  return [a1 initWithBytes:a3 length:a4 copy:a5 deallocator:v8];
}

- (uint64_t)initWithBytesNoCopy:()NSData length:
{
  return [a1 initWithBytes:a3 length:a4 copy:0 freeWhenDone:1 bytesAreVM:0];
}

- (uint64_t)copyWithZone:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBD0]);
  }
  id v3 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
  uint64_t v4 = [a1 bytes];
  uint64_t v5 = [a1 length];

  return [v3 initWithBytes:v4 length:v5 copy:1 freeWhenDone:0 bytesAreVM:0];
}

- (void)getBytes:()NSData range:
{
  NSUInteger v6 = a5;
  if (*MEMORY[0x1E4F1CC10])
  {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v5, *MEMORY[0x1E4F1CBD0]);
    if (!v6) {
      return;
    }
  }
  else if (!a5)
  {
    return;
  }
  unint64_t v11 = [a1 length];
  if (!_CFExecutableLinkedOnOrAfter())
  {
    if (v11 > a4)
    {
      if (v6 >= v11 - a4) {
        NSUInteger v6 = v11 - a4;
      }
      goto LABEL_10;
    }
    v20 = (NSString *)a4;
    unint64_t v21 = v11;
    uint64_t v19 = _NSMethodExceptionProem((objc_class *)a1, a2);
    uint64_t v13 = @"%@: location %lu exceeds data length %lu";
LABEL_22:
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v19, v20, v21);
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v18 userInfo:0]);
  }
  if (__CFADD__(v6, a4))
  {
    unint64_t v17 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v24.location = a4;
    v24.length = v6;
    uint64_t v19 = v17;
    v20 = NSStringFromRange(v24);
    uint64_t v13 = @"%@: range %@ causes integer overflow";
    goto LABEL_22;
  }
  if (a4 + v6 > v11)
  {
    BOOL v12 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v23.location = a4;
    v23.length = v6;
    v20 = NSStringFromRange(v23);
    unint64_t v21 = v11;
    uint64_t v19 = v12;
    uint64_t v13 = @"%@: range %@ exceeds data length %lu";
    goto LABEL_22;
  }
LABEL_10:
  NSUInteger v14 = [a1 bytes] + a4;
  if (v6 < 0x80000) {
    goto LABEL_14;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (v14 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v16 = v6 & -*v15;
      NSCopyMemoryPages((const void *)v14, (void *)a3, v16);
      v14 += v16;
      a3 += v16;
      v6 -= v16;
LABEL_14:
      if (!v6) {
        return;
      }
    }
  }

  memmove((void *)a3, (const void *)v14, v6);
}

- (uint64_t)enumerateByteRangesUsingBlock:()NSData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  char v7 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, char *))(a3 + 16))(a3, [a1 bytes], 0, objc_msgSend(a1, "length"), &v7);
}

- (uint64_t)_providesConcreteBacking
{
  return 0;
}

+ (id)_alloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___NSData_0;
  return objc_msgSendSuper2(&v2, sel_allocWithZone_, 0);
}

- (uint64_t)writeToFile:()NSData atomically:
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD0]);
  }
  if (_NSIsNSURL())
  {
    return [a1 writeToURL:a3 atomically:a4];
  }
  else
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1C9B8];
    return [v9 _writeDataToPath:a3 data:a1 options:a4 reportProgress:1 error:0];
  }
}

- (uint64_t)writeToFile:()NSData options:error:
{
  if (!*MEMORY[0x1E4F1CC10])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v13 = +[NSString stringWithFormat:@"%@: nil file argument", _NSMethodExceptionProem(a1, a2)];
    goto LABEL_14;
  }
  ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v5, *MEMORY[0x1E4F1CBD0]);
  if (!a3) {
    goto LABEL_12;
  }
LABEL_3:
  if ((~(_BYTE)a4 & 3) == 0)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%@: NSDataWritingWithoutOverwriting is not supported with NSDataWritingAtomic", _NSMethodExceptionProem(a1, a2)];
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
  }
  if (_NSIsNSURL())
  {
    return [(objc_class *)a1 writeToURL:a3 options:a4 error:a5];
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x1E4F1C9B8];
    return [v12 _writeDataToPath:a3 data:a1 options:a4 reportProgress:1 error:a5];
  }
}

- (uint64_t)classForCoder
{
  return self;
}

- (uint64_t)_allowsDirectEncoding
{
  return [a1 _canReplaceWithDispatchDataForXPCCoder] ^ 1;
}

- (dispatch_data_t)replacementObjectForCoder:()NSData
{
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![a1 _canReplaceWithDispatchDataForXPCCoder]) {
    return (dispatch_data_t)a1;
  }
  NSUInteger v2 = [a1 length];
  uint64_t v3 = NSAllocateMemoryPages(v2);
  [a1 getBytes:v3 length:v2];
  dispatch_data_t v4 = dispatch_data_create(v3, v2, 0, (dispatch_block_t)*MEMORY[0x1E4F14408]);

  return v4;
}

- (BOOL)_canReplaceWithDispatchDataForXPCCoder
{
  return ([a1 _isDispatchData] & 1) == 0 && (unint64_t)objc_msgSend(a1, "length") > 0xFFF5;
}

- (uint64_t)_isDispatchData
{
  return 0;
}

- (void)getBytes:()NSData length:
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD0]);
  }
  unint64_t v8 = [a1 length];
  if (v8 < a4) {
    a4 = v8;
  }
  uint64_t v9 = [a1 bytes];
  uint64_t v10 = (char *)v9;
  if (a4 < 0x80000)
  {
LABEL_9:
    if (!a4) {
      return;
    }
    goto LABEL_10;
  }
  unint64_t v11 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (v9 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v12 = a4 & -*v11;
      NSCopyMemoryPages(v10, (void *)a3, v12);
      v10 += v12;
      a3 += v12;
      a4 -= v12;
      goto LABEL_9;
    }
  }
LABEL_10:

  memmove((void *)a3, v10, a4);
}

- (uint64_t)_createDispatchData
{
  return _NSDataCreateDispatchDataFromData(a1, 1);
}

- (uint64_t)initWithContentsOfURL:()NSData options:maxLength:error:
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!a3)
  {
    unint64_t v17 = +[NSString stringWithFormat:@"%@: nil URL argument", _NSMethodExceptionProem(a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0]);
  }
  if (![a3 isFileURL])
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:a3 cachePolicy:1 timeoutInterval:60.0];
    v18[0] = 0;
    uint64_t v14 = [MEMORY[0x1E4F18D80] sendSynchronousRequest:v13 returningResponse:v18 error:0];

    if (v18[0] && v14)
    {
      self;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(v18[0], "statusCode")) & 1) != 0)
      {
LABEL_11:

        uint64_t v15 = 0;
        if (!a6) {
          return v15;
        }
LABEL_15:
        if (!v15)
        {
          NSUInteger v16 = _NSErrorWithFilePath(256, (uint64_t)a3);
LABEL_19:
          *a6 = v16;
        }
        return v15;
      }
    }
    else if (!v14)
    {
      goto LABEL_11;
    }
    uint64_t v15 = [(objc_class *)a1 initWithData:v14];
    if (!a6) {
      return v15;
    }
    goto LABEL_15;
  }
  uint64_t v11 = [a3 _securePath];
  if (!v11)
  {

    if (!a6) {
      return 0;
    }
    NSUInteger v16 = _NSErrorWithFilePath(4, (uint64_t)a3);
    uint64_t v15 = 0;
    goto LABEL_19;
  }

  return (uint64_t)[(objc_class *)a1 initWithContentsOfFile:v11 options:a4 maxLength:a5 error:a6];
}

- (id)initWithCoder:()NSData
{
  v14[5] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [a3 containsValueForKey:@"NS.xpcdata"])
    {
      uint64_t v5 = (void *)[a3 decodeXPCObjectOfType:MEMORY[0x1E4F14580] forKey:@"NS.xpcdata"];
      if (v5)
      {
        NSUInteger v6 = v5;
        xpc_retain(v5);
        bytes_ptr = xpc_data_get_bytes_ptr(v6);
        size_t length = xpc_data_get_length(v6);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __32__NSData_NSData__initWithCoder___block_invoke;
        v14[3] = &unk_1E51F7040;
        v14[4] = v6;
        return (id)[a1 initWithBytes:bytes_ptr length:length copy:0 deallocator:v14];
      }
      goto LABEL_16;
    }
    if (object_getClass(a3) == (Class)NSKeyedUnarchiver
      || [a3 containsValueForKey:@"NS.data"])
    {
      uint64_t v11 = [a3 _decodePropertyListForKey:@"NS.data"];
      if (!_NSIsNSData())
      {
        objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"Decoded object is not a data"));
LABEL_16:

        return 0;
      }
      return (id)[a1 initWithData:v11];
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = [a3 decodeBytesForKey:@"NS.bytes" returnedLength:&v13];
      if ([a3 decodeBoolForKey:@"NS.zeroing"])
      {

        return (id)[MEMORY[0x1E4F1C9B8] _newZeroingDataWithBytes:v12 length:v13];
      }
      else
      {
        return (id)[a1 initWithBytes:v12 length:v13];
      }
    }
  }
  else
  {

    uint64_t v10 = (void *)[a3 decodeDataObject];
    return v10;
  }
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    unint64_t v2 = [a1 length];
    uint64_t v3 = (unsigned __int8 *)[a1 bytes];
    uint64_t v4 = (void *)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:512];
    [v4 appendFormat:@"{size_t length = %lu, bytes = 0x", v2];
    if (v2 < 0x19)
    {
      for (; v2; --v2)
      {
        unsigned int v8 = *v3++;
        unsigned int v7 = v8;
        if (v8 >= 0xA0) {
          char v9 = 87;
        }
        else {
          char v9 = 48;
        }
        bytes[0] = v9 + (v7 >> 4);
        unsigned int v10 = v7 & 0xF;
        if (v10 >= 0xA) {
          char v11 = 87;
        }
        else {
          char v11 = 48;
        }
        bytes[1] = v11 + v10;
        CFStringRef v12 = CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
        [v4 appendString:v12];
        CFRelease(v12);
      }
    }
    else
    {
      unint64_t v5 = -4;
      do
      {
        v5 += 4;
        append4Bytes(v4, &v3[v5]);
      }
      while (v5 < 0xC);
      [v4 appendString:@"... "];
      unint64_t v6 = v2 - 8;
      do
      {
        append4Bytes(v4, &v3[v6]);
        v6 += 4;
      }
      while (v6 < v2);
    }
    [v4 appendString:@"}"];
    return v4;
  }
  else
  {
    return (id)[a1 debugDescription];
  }
}

+ (id)dataWithContentsOfURL:()NSData options:maxLength:error:
{
  unint64_t v6 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3 options:a4 maxLength:a5 error:a6];

  return v6;
}

+ (id)dataWithContentsOfURL:()NSData
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3];

  return v3;
}

- (uint64_t)initWithContentsOfURL:()NSData
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  if (![a3 isFileURL])
  {
    if (!a3) {
      return 0;
    }
    unsigned int v7 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:a3 cachePolicy:1 timeoutInterval:60.0];
    v9[0] = 0;
    uint64_t v8 = [MEMORY[0x1E4F18D80] sendSynchronousRequest:v7 returningResponse:v9 error:0];

    if (v9[0] && v8)
    {
      self;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(v9[0], "statusCode")) & 1) != 0)
      {
        goto LABEL_11;
      }
    }
    else if (!v8)
    {
      goto LABEL_11;
    }
    return [a1 initWithData:v8];
  }
  uint64_t v5 = [a3 _securePath];
  if (!v5)
  {
LABEL_11:

    return 0;
  }

  return [a1 initWithContentsOfFile:v5];
}

+ (id)dataWithContentsOfFile:()NSData options:error:
{
  uint64_t v5 = (void *)[objc_allocWithZone(a1) initWithContentsOfFile:a3 options:a4 error:a5];

  return v5;
}

+ (id)dataWithContentsOfFile:()NSData
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfFile:a3];

  return v3;
}

- (uint64_t)initWithContentsOfFile:()NSData
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = pathifiedNSURL(a3, 0);
  if (v5
    && (uint64_t v9 = 0,
        v10[0] = 0,
        char v8 = 0,
        LOBYTE(v7) = 1,
        ([MEMORY[0x1E4F1C9B8] _readBytesFromPath:v5 maxLength:0x7FFFFFFFFFFFFFFFLL bytes:v10 length:&v9 didMap:&v8 options:0 reportProgress:v7 error:0] & 1) != 0))
  {
    if (v8) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"NSData.m" lineNumber:918 description:@"Data should not have been mapped"];
    }
    return [a1 initWithBytes:v10[0] length:v9 copy:0 freeWhenDone:1 bytesAreVM:0];
  }
  else
  {

    return 0;
  }
}

- (uint64_t)initWithContentsOfFile:()NSData options:maxLength:error:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    NSUInteger v16 = +[NSString stringWithFormat:@"%@: nil file argument", _NSMethodExceptionProem(a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0]);
  }
  uint64_t v19 = 0;
  v20[0] = 0;
  char v18 = 0;
  uint64_t v10 = pathifiedNSURL(a3, a6);
  if (v10
    && ((uint64_t v11 = v10, a5 >= 0x7FFFFFFFFFFFFFFFLL) ? (v12 = 0x7FFFFFFFFFFFFFFFLL) : (v12 = a5),
        LOBYTE(v17) = 1,
        ([MEMORY[0x1E4F1C9B8] _readBytesFromPath:v10 maxLength:v12 bytes:v20 length:&v19 didMap:&v18 options:a4 reportProgress:v17 error:a6] & 1) != 0))
  {
    if (v18) {
      uint64_t v13 = &__block_literal_global_4;
    }
    else {
      uint64_t v13 = &__block_literal_global_6;
    }
    uint64_t result = [(objc_class *)a1 initWithBytes:v20[0] length:v19 copy:0 deallocator:v13];
    if (a6)
    {
      if (!result)
      {
        uint64_t v15 = _NSErrorWithFilePath(256, v11);
        uint64_t result = 0;
        *a6 = v15;
      }
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (uint64_t)initWithContentsOfFile:()NSData options:error:
{
  return [a1 initWithContentsOfFile:a3 options:a4 maxLength:-1 error:a5];
}

+ (id)dataWithContentsOfURL:()NSData options:error:
{
  uint64_t v5 = (void *)[objc_allocWithZone(a1) initWithContentsOfURL:a3 options:a4 error:a5];

  return v5;
}

- (uint64_t)initWithContentsOfURL:()NSData options:error:
{
  return [a1 initWithContentsOfURL:a3 options:a4 maxLength:-1 error:a5];
}

+ (id)data
{
  uint64_t v1 = (void *)[objc_allocWithZone(a1) initWithBytes:0 length:0];

  return v1;
}

- (id)debugDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBD0]);
  }
  unint64_t v3 = [a1 length];
  uint64_t v4 = (unsigned __int8 *)[a1 bytes];
  unint64_t v5 = v3 << ((v3 & 0x8000000000000000) == 0);
  unint64_t v6 = v3 >> 2;
  BOOL v8 = __CFADD__(v5, v3 >> 2) || (v3 & 0x8000000000000000) != 0;
  if (v8) {
    unint64_t v6 = 0;
  }
  unint64_t v9 = v6 + v5;
  int v10 = v9 > 0xFFFFFFFFFFFFFFEFLL || v8;
  unint64_t v11 = v9 + 16;
  if (v10) {
    unint64_t v12 = -1;
  }
  else {
    unint64_t v12 = v11;
  }
  uint64_t v13 = (void *)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:v12];
  objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length"), 0, @"<");
  if (v3 < 5)
  {
    unint64_t v14 = 2;
    if (v3)
    {
LABEL_23:
      unint64_t v16 = v14 - 2;
      v14 += 2 * v3;
      while (1)
      {
        v16 += 2;
        if (v16 > v12 - 2) {
          break;
        }
        --v3;
        unsigned int v18 = *v4++;
        unsigned int v17 = v18;
        if (v18 >= 0xA0) {
          char v19 = 87;
        }
        else {
          char v19 = 48;
        }
        bytes[0] = v19 + (v17 >> 4);
        unsigned int v20 = v17 & 0xF;
        if (v20 >= 0xA) {
          char v21 = 87;
        }
        else {
          char v21 = 48;
        }
        bytes[1] = v21 + v20;
        CFStringRef v22 = CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
        [v13 appendString:v22];
        CFRelease(v22);
        if (!v3) {
          goto LABEL_32;
        }
      }
    }
    else
    {
LABEL_32:
      if (v14 < v12) {
        objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length"), 0, @">");
      }
    }
    return v13;
  }
  else
  {
    unint64_t v14 = 9 * ((v3 - 5) >> 2) + 11;
    unint64_t v15 = -7;
    while (1)
    {
      v15 += 9;
      if (v15 > v12 - 9) {
        break;
      }
      v3 -= 4;
      append4Bytes(v13, v4);
      v4 += 4;
      if (v3 <= 4) {
        goto LABEL_23;
      }
    }
    return v13;
  }
}

+ (id)dataWithData:()NSData
{
  if (!a3) {
    goto LABEL_4;
  }
  unint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA58];
  if ((Class)MEMORY[0x1E4F1C9B8] == a1 && _CFExecutableLinkedOnOrAfter())
  {
    unint64_t v6 = (void *)[a3 copyWithZone:0];
    goto LABEL_8;
  }
  if (v5 != a1)
  {
LABEL_4:
    unint64_t v6 = objc_msgSend(objc_allocWithZone(a1), "initWithBytes:length:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
    goto LABEL_8;
  }
  unint64_t v6 = (void *)[a3 mutableCopyWithZone:0];
LABEL_8:

  return v6;
}

- (uint64_t)base64EncodedStringWithOptions:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }

  return [a1 _base64EncodingAsString:1 withOptions:a3];
}

- (uint64_t)mutableCopyWithZone:()NSData
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBD0]);
  }
  uint64_t v3 = [a1 length];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__NSData_NSData__mutableCopyWithZone___block_invoke;
    v7[3] = &unk_1E51F7018;
    v7[4] = v4;
    [a1 enumerateByteRangesUsingBlock:v7];
  }
  return v5;
}

- (NSString)_base64EncodingAsString:()NSData withOptions:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ([a1 length])
  {
    unint64_t v8 = [a1 length];
    size_t v9 = 4 * (v8 / 3) + 4 * (v8 != 3 * (v8 / 3));
    if (v9 < v8)
    {
LABEL_17:
      unint64_t v14 = +[NSString stringWithFormat:@"%@: data is too large to encode", _NSMethodExceptionProem((objc_class *)a1, a2)];
      unint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
      unint64_t v16 = (void *)MEMORY[0x1E4F1C4A8];
      goto LABEL_33;
    }
    if ((a4 & 3) == 1)
    {
      unint64_t v10 = 64;
    }
    else
    {
      if ((a4 & 3) != 2)
      {
        unint64_t v10 = 0;
        unint64_t v12 = a4 & 0x30;
        goto LABEL_19;
      }
      unint64_t v10 = 76;
    }
    if ((a4 & 0x30) != 0) {
      unint64_t v12 = a4 & 0x30;
    }
    else {
      unint64_t v12 = 48;
    }
    uint64_t v13 = (v12 >> 4) & 1;
    if (v12 > 0x1F) {
      ++v13;
    }
    v9 += ((__PAIR128__(v9 / v10, v9 % v10) - 1) >> 64) * v13;
    if (v9 < v8) {
      goto LABEL_17;
    }
LABEL_19:
    unsigned int v17 = malloc_type_malloc(v9, 0x6A30901AuLL);
    if (!v17)
    {
      unint64_t v14 = +[NSString stringWithFormat:@"%@: unable to allocate memory for length (%lu)", _NSMethodExceptionProem((objc_class *)a1, a2), v9];
      unint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
      unint64_t v16 = (void *)MEMORY[0x1E4F1C4A0];
LABEL_33:
      objc_exception_throw((id)[v15 exceptionWithName:*v16 reason:v14 userInfo:0]);
    }
    unsigned int v18 = v17;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = v10;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __54__NSData_NSData___base64EncodingAsString_withOptions___block_invoke;
    v29[3] = &unk_1E51F7108;
    v29[4] = &v39;
    v29[5] = v30;
    v29[8] = v10;
    v29[9] = v12;
    v29[10] = v17;
    v29[6] = &v35;
    v29[7] = &v31;
    [a1 enumerateByteRangesUsingBlock:v29];
    unint64_t v19 = v40[3] % 3uLL;
    if (v19 == 1)
    {
      char v22 = _base64EncodingAsString_withOptions__DataEncodeTable[16 * (v32[3] & 3)];
      char v21 = v36 + 3;
      uint64_t v23 = v36[3];
      v36[3] = v23 + 1;
      v18[v23] = v22;
      char v20 = 61;
    }
    else
    {
      if (v19 != 2)
      {
LABEL_25:
        if (a3) {
          uint64_t v26 = [[NSString alloc] initWithBytesNoCopy:v18 length:v9 encoding:1 freeWhenDone:1];
        }
        else {
          uint64_t v26 = (NSString *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v18 length:v9 copy:0 freeWhenDone:1 bytesAreVM:0];
        }
        v27 = v26;
        _Block_object_dispose(v30, 8);
        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v39, 8);
        return v27;
      }
      char v20 = _base64EncodingAsString_withOptions__DataEncodeTable[4 * (v32[3] & 0xF)];
      char v21 = v36 + 3;
    }
    uint64_t v24 = (*v21)++;
    v18[v24] = v20;
    uint64_t v25 = (*v21)++;
    v18[v25] = 61;
    goto LABEL_25;
  }
  if (a3)
  {
    return +[NSString string];
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4F1C9B8];
    return (NSString *)[v28 data];
  }
}

- (uint64_t)writeToURL:()NSData options:error:
{
  if (!*MEMORY[0x1E4F1CC10])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_16:
    unint64_t v14 = +[NSString stringWithFormat:@"%@: nil URL argument", _NSMethodExceptionProem(a1, a2)];
    goto LABEL_18;
  }
  ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v5, *MEMORY[0x1E4F1CBD0]);
  if (!a3) {
    goto LABEL_16;
  }
LABEL_3:
  if ((~a4 & 3) == 0)
  {
    unint64_t v14 = +[NSString stringWithFormat:@"%@: NSDataWritingWithoutOverwriting is not supported with NSDataWritingAtomic", _NSMethodExceptionProem(a1, a2)];
LABEL_18:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v13 = 518;
LABEL_13:
      *a5 = _NSErrorWithFilePath(v13, (uint64_t)a3);
    }
    return 0;
  }
  uint64_t v11 = [a3 _securePath];
  if (!v11)
  {
    if (a5)
    {
      uint64_t v13 = 4;
      goto LABEL_13;
    }
    return 0;
  }

  return [(objc_class *)a1 writeToFile:v11 options:a4 error:a5];
}

- (uint64_t)initWithBytesNoCopy:()NSData length:deallocator:
{
  return [a1 initWithBytes:a3 length:a4 copy:0 deallocator:a5];
}

- (uint64_t)_initWithBase64EncodedObject:()NSData options:
{
  uint64_t v31 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a3 length];
  if (v7)
  {
    unint64_t v8 = v7;
    size_t v9 = 3 * (v7 >> 2);
    unint64_t v10 = malloc_default_zone();
    uint64_t v11 = malloc_type_zone_malloc(v10, v9, 0x8B37E73CuLL);
    if (!v11)
    {
      v29 = +[NSString stringWithFormat:@"%@: unable to allocate memory for length (%lu)", _NSMethodExceptionProem(a1, a2), v9];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:v29 userInfo:0]);
    }
    unint64_t v12 = v11;
    uint64_t v33 = 0;
    char v34 = &v33;
    uint64_t v35 = 0x4810000000;
    v36 = &unk_18246906D;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v39 = 0;
    uint64_t v13 = _NSIsNSString();
    if (v13)
    {
      uint64_t v14 = 0;
      do
      {
        if (v8 == v14) {
          break;
        }
        if (v8 - v14 >= 0x400) {
          uint64_t v15 = 1024;
        }
        else {
          uint64_t v15 = v8 - v14;
        }
        MEMORY[0x1F4188790](v13);
        unsigned int v17 = (unsigned __int16 *)((char *)&v30 - v16);
        double v19 = MEMORY[0x1F4188790](v18);
        char v21 = (char *)&v30 - v20;
        objc_msgSend(a3, "getCharacters:range:", v17, v14, v15, v19);
        if (v15)
        {
          char v22 = v21;
          uint64_t v23 = v15;
          do
          {
            unsigned int v25 = *v17++;
            char v24 = v25;
            if (v25 >= 0x80) {
              char v24 = 0;
            }
            *v22++ = v24;
            --v23;
          }
          while (v23);
        }
        uint64_t v13 = [(objc_class *)a1 _decodeBase64EncodedCharacterBuffer:v21 length:v15 options:v31 buffer:v12 bufferLength:v9 state:v34 + 4];
        v14 += v15;
      }
      while ((v13 & 1) != 0);
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __55__NSData_NSData___initWithBase64EncodedObject_options___block_invoke;
      v32[3] = &unk_1E51F70E0;
      v32[6] = v31;
      v32[7] = v12;
      v32[8] = v9;
      v32[4] = a1;
      v32[5] = &v33;
      [a3 enumerateByteRangesUsingBlock:v32];
    }
    v27 = v34;
    if (*((unsigned char *)v34 + 32) || v34[6])
    {
      if (![(id)objc_opt_class() _base64DecodingAlwaysSucceedsForOptions:v31])
      {

        free(v12);
        uint64_t v28 = 0;
        goto LABEL_26;
      }
      v27 = v34;
    }
    uint64_t v28 = [(objc_class *)a1 initWithBytes:v12 length:v27[5] copy:0 freeWhenDone:1 bytesAreVM:0];
LABEL_26:
    _Block_object_dispose(&v33, 8);
    return v28;
  }

  return (uint64_t)[(objc_class *)a1 initWithBytes:0 length:0];
}

- (uint64_t)_decodeBase64EncodedCharacterBuffer:()NSData length:options:buffer:bufferLength:state:
{
  if (a8)
  {
    BOOL v8 = *(unsigned char *)a8 != 0;
    BOOL v9 = *(unsigned char *)(a8 + 1) != 0;
    unint64_t v11 = *(void *)(a8 + 8);
    uint64_t v10 = *(void *)(a8 + 16);
    unint64_t v12 = *(void *)(a8 + 24);
    int v13 = *(_DWORD *)(a8 + 32);
  }
  else
  {
    int v13 = 0;
    unint64_t v12 = 0;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    BOOL v9 = 0;
    BOOL v8 = 0;
  }
  unint64_t v14 = 0;
  BOOL v15 = a4 == 0;
  if (a4 && !v9)
  {
    unint64_t v14 = 0;
    unint64_t v16 = a4 - 1;
    int v17 = 2;
    while (1)
    {
      if (*(char *)(a3 + v14) < 0 || (int v18 = _decodeCharacter_DataDecodeTable[*(unsigned __int8 *)(a3 + v14)], v18 < 0))
      {
        if ((a5 & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_14;
      }
      if (*(unsigned char *)(a3 + v14) == 61)
      {
        if ((a5 & 0x10000000) != 0 && !v10) {
          goto LABEL_14;
        }
        ++v12;
      }
      else if ((a5 & 1) == 0 && v12)
      {
LABEL_60:
        char v25 = 0;
        goto LABEL_61;
      }
      int v13 = v18 + (v13 << 6);
      if (++v10 == 4) {
        break;
      }
LABEL_14:
      ++v14;
      ++v17;
      if (v14 == a4)
      {
        BOOL v9 = 0;
        BOOL v15 = 1;
        unint64_t v14 = a4;
        goto LABEL_42;
      }
    }
    int v19 = 1;
    if (a7 < 3 || a7 - 3 < v11 || v12 == 3)
    {
      char v25 = 0;
      unint64_t v24 = v11;
      uint64_t v10 = 4;
      goto LABEL_62;
    }
    BOOL v20 = v14 == v16;
    if (v14 != v16 && v12)
    {
      unint64_t v21 = (int)v14 + 1;
      if (v21 < a4)
      {
        int v22 = v17;
        while (1)
        {
          uint64_t v23 = *(unsigned __int8 *)(a3 + v21);
          if (v23 != 61
            && ((a5 & 1) == 0 || (v23 & 0x80) == 0 && (_decodeCharacter_DataDecodeTable[v23] & 0x80000000) == 0))
          {
            break;
          }
          unint64_t v21 = v22++;
          if (v21 >= a4) {
            goto LABEL_31;
          }
        }
        BOOL v20 = 0;
        unint64_t v24 = v11 + 1;
        *(unsigned char *)(a6 + v11) = BYTE2(v13);
LABEL_36:
        *(unsigned char *)(a6 + v24) = BYTE1(v13);
        unint64_t v24 = v11 + 2;
        if (!v20)
        {
LABEL_38:
          *(unsigned char *)(a6 + v24++) = v13;
LABEL_39:
          uint64_t v10 = 0;
          if ((a5 & 1) == 0 && v12)
          {
            uint64_t v10 = 0;
            char v25 = 1;
            int v19 = 1;
            if (v8) {
              goto LABEL_62;
            }
            goto LABEL_44;
          }
          unint64_t v11 = v24;
          unint64_t v12 = 0;
          goto LABEL_14;
        }
LABEL_37:
        if (v12) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
LABEL_31:
      BOOL v20 = 1;
    }
    unint64_t v24 = v11 + 1;
    *(unsigned char *)(a6 + v11) = BYTE2(v13);
    if (v20 && v12 > 1) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_42:
  char v25 = v9 || !v15;
  if (v8)
  {
LABEL_61:
    int v19 = 1;
    unint64_t v24 = v11;
    goto LABEL_62;
  }
  unint64_t v24 = v11;
LABEL_44:
  if (v14 >= a4)
  {
    int v19 = 0;
  }
  else
  {
    unint64_t v26 = ~v14 + a4;
    v27 = (unsigned __int8 *)(a3 + v14);
    do
    {
      unsigned int v29 = *v27++;
      uint64_t v28 = v29;
      if (a5)
      {
        if ((v28 & 0x80) != 0) {
          char v31 = -1;
        }
        else {
          char v31 = _decodeCharacter_DataDecodeTable[v28];
        }
        BOOL v30 = v31 < 0;
      }
      else
      {
        BOOL v30 = 0;
      }
      int v32 = v28 == 61 || v30;
      BOOL v33 = v26-- != 0;
    }
    while (v33 && (v32 & 1) != 0);
    int v19 = v32 ^ 1;
  }
LABEL_62:
  if (a8)
  {
    *(unsigned char *)a8 = v19;
    *(unsigned char *)(a8 + 1) = v25;
    *(void *)(a8 + 8) = v24;
    *(void *)(a8 + 16) = v10;
    *(void *)(a8 + 24) = v12;
    *(_DWORD *)(a8 + 32) = v13;
  }
  return v19 ^ 1u;
}

- (uint64_t)initWithBase64EncodedString:()NSData options:
{
  if (!a3)
  {
    unint64_t v6 = +[NSString stringWithFormat:@"%@: nil string argument", _NSMethodExceptionProem(a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
}

- (uint64_t)initWithBase64EncodedData:()NSData options:
{
  if (!a3)
  {
    unint64_t v6 = +[NSString stringWithFormat:@"%@: nil data argument", _NSMethodExceptionProem(a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
}

- (uint64_t)base64EncodedDataWithOptions:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }

  return [a1 _base64EncodingAsString:0 withOptions:a3];
}

- (uint64_t)writeToURL:()NSData atomically:
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v4, *MEMORY[0x1E4F1CBD0]);
  }
  if (![a3 isFileURL]) {
    return 0;
  }
  uint64_t v8 = [a3 _securePath];
  if (!v8) {
    return 0;
  }

  return [a1 writeToFile:v8 atomically:a4];
}

- (void)length
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v2, *MEMORY[0x1E4F1CBD0]);
  }
  uint64_t v5 = NSClassFromString((NSString *)@"NSData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)bytes
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v2, *MEMORY[0x1E4F1CBD0]);
  }
  uint64_t v5 = NSClassFromString((NSString *)@"NSData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (id)_asciiDescription
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [a1 bytes];
  if (v2)
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    unint64_t v6 = 0;
    uint64_t v7 = 69;
    do
    {
      int v9 = *v5++;
      LODWORD(v8) = v9;
      if ((v9 - 127) >= 0xFFFFFFA1) {
        uint64_t v8 = v8;
      }
      else {
        uint64_t v8 = 32;
      }
      objc_msgSend(v3, "appendFormat:", @"%c", v8);
      if (!(v7 + 70 * (v6 / 0x46))) {
        [v3 appendString:@"\n"];
      }
      ++v6;
      --v7;
      --v2;
    }
    while (v2);
  }

  return v3;
}

- (uint64_t)_copyWillRetain
{
  return 0;
}

- (void)getBytes:()NSData
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v3, *MEMORY[0x1E4F1CBD0]);
  }
  uint64_t v6 = [a1 bytes];
  size_t v7 = [a1 length];
  if (v7 < 0x80000)
  {
LABEL_7:
    if (!v7) {
      return;
    }
    goto LABEL_8;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F14B00];
  if (((*MEMORY[0x1E4F14B00] - 1) & (v6 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v9 = v7 & -*v8;
      NSCopyMemoryPages((const void *)v6, (void *)a3, v9);
      v6 += v9;
      a3 += v9;
      v7 -= v9;
      goto LABEL_7;
    }
  }
LABEL_8:

  memmove((void *)a3, (const void *)v6, v7);
}

- (uint64_t)_isCompact
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBD0]);
  }
  uint64_t v6 = 0;
  size_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__NSData_NSData___isCompact__block_invoke;
  v5[3] = &unk_1E51F7068;
  v5[4] = a1;
  v5[5] = &v6;
  [a1 enumerateByteRangesUsingBlock:v5];
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)writeToFile:()NSData atomically:error:
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v5, *MEMORY[0x1E4F1CBD0]);
  }

  return [a1 writeToFile:a3 options:a4 error:a5];
}

+ (id)dataWithContentsOfMappedFile:()NSData
{
  uint64_t v3 = (void *)[objc_allocWithZone(a1) initWithContentsOfMappedFile:a3];

  return v3;
}

- (void)initWithBytes:()NSData length:copy:deallocator:
{
}

- (uint64_t)initWithContentsOfMappedFile:()NSData
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  v9[0] = 0;
  char v7 = 0;
  LOBYTE(v6) = 1;
  if ([MEMORY[0x1E4F1C9B8] _readBytesFromPath:a3 maxLength:0x7FFFFFFFFFFFFFFFLL bytes:v9 length:&v8 didMap:&v7 options:8 reportProgress:v6 error:0])
  {
    if (v7) {
      uint64_t v4 = &__block_literal_global_4;
    }
    else {
      uint64_t v4 = &__block_literal_global_6;
    }
    return [a1 initWithBytes:v9[0] length:v8 copy:0 deallocator:v4];
  }
  else
  {

    return 0;
  }
}

- (uint64_t)initWithContentsOfMappedFile:()NSData error:
{
  return [a1 initWithContentsOfFile:a3 options:1 error:a4];
}

- (uint64_t)initWithContentsOfFile:()NSData error:
{
  return [a1 initWithContentsOfFile:a3 options:0 error:a4];
}

+ (uint64_t)_newZeroingDataWithBytes:()NSData length:
{
  uint64_t v6 = [_NSClrDat alloc];

  return (uint64_t)[(NSConcreteData *)v6 initWithBytes:a3 length:a4 copy:1 deallocator:0];
}

+ (uint64_t)_newZeroingDataWithBytesNoCopy:()NSData length:deallocator:
{
  uint64_t v8 = [_NSClrDat alloc];

  return (uint64_t)[(NSConcreteData *)v8 initWithBytes:a3 length:a4 copy:0 deallocator:a5];
}

- (uint64_t)rangeOfData:()NSData options:range:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (!*MEMORY[0x1E4F1CC10])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_16:
    unint64_t v21 = +[NSString stringWithFormat:@"%@: nil data argument", _NSMethodExceptionProem(a1, a2)];
    int v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_22;
  }
  ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v6, *MEMORY[0x1E4F1CBD0]);
  if (!a3) {
    goto LABEL_16;
  }
LABEL_3:
  unint64_t v13 = [(objc_class *)a1 length];
  if (__CFADD__(a6, a5))
  {
    unint64_t v24 = _NSMethodExceptionProem(a1, a2);
    v30.location = a5;
    v30.size_t length = a6;
    char v25 = +[NSString stringWithFormat:@"%@: range %@ causes integer overflow", v24, NSStringFromRange(v30)];
LABEL_21:
    unint64_t v21 = v25;
    int v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_22:
    objc_exception_throw((id)[v22 exceptionWithName:*v23 reason:v21 userInfo:0]);
  }
  if (a5 + a6 > v13)
  {
    unint64_t v26 = v13;
    v27 = _NSMethodExceptionProem(a1, a2);
    uint64_t v28 = v27;
    if (a6)
    {
      v31.location = a5;
      v31.size_t length = a6;
      char v25 = +[NSString stringWithFormat:@"%@: range %@ exceeds data length %lu", v28, NSStringFromRange(v31), v26];
    }
    else
    {
      char v25 = +[NSString stringWithFormat:@"%@: location %lu exceeds data length %lu", v27, a5, v26];
    }
    goto LABEL_21;
  }
  uint64_t v14 = [(objc_class *)a1 _isCompact];
  if (v14)
  {
    uint64_t result = _CFDataFindBytes();
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    MEMORY[0x1F4188790](v14);
    int v17 = (char *)v29 - v16;
    int v18 = (char *)v29 - v16;
    if (a6 >= 0x101) {
      int v18 = (char *)malloc_type_malloc(a6, 0x100004077774924uLL);
    }
    -[objc_class getBytes:range:](a1, "getBytes:range:", v18, a5, a6);
    int v19 = [(NSData *)[NSConcreteData alloc] initWithBytesNoCopy:v18 length:a6 freeWhenDone:v18 != v17];
    uint64_t v20 = -[NSData rangeOfData:options:range:](v19, "rangeOfData:options:range:", a3, a4, 0, a6);

    if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return v20 + a5;
    }
  }
  return result;
}

+ (BOOL)_base64DecodingAlwaysSucceedsForOptions:()NSData
{
  return a3 == 1 && _CFAppVersionCheck() != 0;
}

- (uint64_t)initWithBase64Encoding:()NSData
{
  if (!a3)
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@: nil string argument", _NSMethodExceptionProem(a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }
  return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
}

- (uint64_t)base64Encoding
{
  if (*MEMORY[0x1E4F1CC10]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x1E4F1CC10])(a1, v1, *MEMORY[0x1E4F1CBD0]);
  }

  return [a1 _base64EncodingAsString:1 withOptions:0];
}

@end
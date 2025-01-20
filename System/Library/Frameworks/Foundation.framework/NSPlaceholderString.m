@interface NSPlaceholderString
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPlaceholderString)init;
- (NSPlaceholderString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6;
- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6;
- (NSPlaceholderString)initWithCString:(const char *)a3;
- (NSPlaceholderString)initWithCString:(const char *)a3 encoding:(unint64_t)a4;
- (NSPlaceholderString)initWithCString:(const char *)a3 length:(unint64_t)a4;
- (NSPlaceholderString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderString)initWithData:(id)a3 encoding:(unint64_t)a4;
- (NSPlaceholderString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5;
- (NSPlaceholderString)initWithString:(id)a3;
- (NSPlaceholderString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
@end

@implementation NSPlaceholderString

- (NSPlaceholderString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v9 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v9 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a5);
      }
      CFStringEncoding v9 = 1536;
    }
  }

  return (NSPlaceholderString *)CFStringCreateWithBytes(v8, (const UInt8 *)a3, a4, v9, 1u);
}

- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  BOOL v6 = a6;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding v11 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v11 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v11 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a5);
      }
      CFStringEncoding v11 = 1536;
    }
  }
  v12 = (const __CFAllocator **)MEMORY[0x1E4F1CF90];
  if (!v6) {
    v12 = (const __CFAllocator **)MEMORY[0x1E4F1CFA0];
  }
  CFAllocatorRef v13 = *v12;

  return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v10, (const UInt8 *)a3, a4, v11, 1u, v13);
}

- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  v5 = (CFAllocatorRef *)MEMORY[0x1E4F1CF90];
  if (!a5) {
    v5 = (CFAllocatorRef *)MEMORY[0x1E4F1CFA0];
  }
  return (NSPlaceholderString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a4, *v5);
}

- (NSPlaceholderString)initWithString:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  v3 = (NSPlaceholderString *)a3;
  if (((unint64_t)a3 & 0x8000000000000000) != 0) {
    return v3;
  }
  v5 = (objc_class *)objc_opt_class();
  if (v5 == (objc_class *)__NSCFStringClass || class_getSuperclass(v5) == (Class)__NSCFStringClass)
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    return (NSPlaceholderString *)CFStringCreateCopy(v10, (CFStringRef)v3);
  }
  else
  {
    unint64_t v6 = [(NSString *)v3 fastestEncoding];
    v7 = [(NSString *)v3 _fastCStringContents:0];
    unint64_t v8 = [(NSString *)v3 lengthOfBytesUsingEncoding:v6];
    if (v7)
    {
      CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding(v6);
      if (v9 == -1)
      {
        if (v6 != 134217984 && v6)
        {
          CFStringEncoding v9 = -1;
        }
        else
        {
          if (_CFExecutableLinkedOnOrAfter()) {
            NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", v6);
          }
          CFStringEncoding v9 = 1536;
        }
      }
      CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      return (NSPlaceholderString *)CFStringCreateWithBytes(v20, v7, v8, v9, 0);
    }
    else
    {
      uint64_t v11 = [(NSString *)v3 _fastCharacterContents];
      if (!v11)
      {
        size_t v14 = v8 + 1;
        CFIndex v23 = 0;
        MEMORY[0x1F4188790](0);
        v16 = (const UInt8 *)&v23 - v15;
        if (v14 >= 0x101) {
          v16 = (const UInt8 *)malloc_type_malloc(v14, 0x100004077774924uLL);
        }
        -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16, v14, &v23, v6, 0, 0, [(NSPlaceholderString *)v3 length], 0);
        CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFIndex v18 = v23;
        CFStringEncoding v19 = CFStringConvertNSStringEncodingToEncoding(v6);
        if (v19 == -1)
        {
          if (v6 != 134217984 && v6)
          {
            CFStringEncoding v19 = -1;
          }
          else
          {
            if (_CFExecutableLinkedOnOrAfter()) {
              NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", v6);
            }
            CFStringEncoding v19 = 1536;
          }
        }
        if (v14 > 0x100) {
          return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v17, v16, v18, v19, 0, (CFAllocatorRef)*MEMORY[0x1E4F1CF90]);
        }
        else {
          return (NSPlaceholderString *)CFStringCreateWithBytes(v17, v16, v18, v19, 0);
        }
      }
      v12 = (const UniChar *)v11;
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      return (NSPlaceholderString *)CFStringCreateWithCharacters(v13, v12, v8 >> 1);
    }
  }
}

- (NSPlaceholderString)init
{
  return (NSPlaceholderString *)&stru_1ECA5C228;
}

- (NSPlaceholderString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  if (!a3)
  {
    CFAllocatorRef v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  uint64_t v8 = objc_msgSend(a3, "__baseAttributedString");
  if (v8)
  {
    id v9 = [[NSAttributedString alloc] _initWithFormat:v8 options:0 locale:a4 arguments:a5];
    CFAllocatorRef v10 = (NSPlaceholderString *)objc_msgSend((id)objc_msgSend(v9, "string"), "copy");

    return v10;
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F1CF80];
    return (NSPlaceholderString *)MEMORY[0x1F40D9148](v12, _NSDescriptionWithLocaleFunc, _NSDescriptionWithStringProxyFunc, a4, 0, a3, a5);
  }
}

- (NSPlaceholderString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  if (!a3 || !a4)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  StringWithValidatedFormatAndArguments = (NSPlaceholderString *)CFStringCreateStringWithValidatedFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDictionaryRef)a5, (CFStringRef)a4, (CFStringRef)a3, a6, (CFErrorRef *)a7);
  if (a7 && *a7) {
    id v9 = *a7;
  }
  return StringWithValidatedFormatAndArguments;
}

- (NSPlaceholderString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  return (NSPlaceholderString *)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a4);
}

- (NSPlaceholderString)initWithCString:(const char *)a3 encoding:(unint64_t)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding v7 = CFStringConvertNSStringEncodingToEncoding(a4);
  if (v7 == -1)
  {
    if (a4 != 134217984 && a4)
    {
      CFStringEncoding v7 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a4);
      }
      CFStringEncoding v7 = 1536;
    }
  }

  return (NSPlaceholderString *)CFStringCreateWithCString(v6, a3, v7);
}

- (NSPlaceholderString)initWithData:(id)a3 encoding:(unint64_t)a4
{
  if (!a3) {
    return (NSPlaceholderString *)&stru_1ECA5C228;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding v7 = CFStringConvertNSStringEncodingToEncoding(a4);
  if (v7 == -1)
  {
    if (a4 != 134217984 && a4)
    {
      CFStringEncoding v7 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a4);
      }
      CFStringEncoding v7 = 1536;
    }
  }

  return (NSPlaceholderString *)CFStringCreateFromExternalRepresentation(v6, (CFDataRef)a3, v7);
}

uint64_t __71__NSPlaceholderString_initWithBytesNoCopy_length_encoding_deallocator___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

- (NSPlaceholderString)initWithCString:(const char *)a3 length:(unint64_t)a4
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();

  return (NSPlaceholderString *)CFStringCreateWithBytes(v6, (const UInt8 *)a3, a4, SystemEncoding, 0);
}

- (NSPlaceholderString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__NSPlaceholderString_initWithBytesNoCopy_length_encoding_deallocator___block_invoke;
    v14[3] = &unk_1E51FA7E0;
    v14[4] = a6;
    v14[5] = a3;
    v14[6] = a4;
    memset(&context, 0, sizeof(context));
    context.info = (void *)[v14 copy];
    context.allocate = (CFAllocatorAllocateCallBack)_NSAllocatorAllocateHALTIfUsed;
    context.deallocate = (CFAllocatorDeallocateCallBack)_NSAllocatorDeallocateWithBlock;
    CFAllocatorRef v9 = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], &context);
  }
  else
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding v11 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v11 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v11 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a5);
      }
      CFStringEncoding v11 = 1536;
    }
  }
  uint64_t v12 = (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v10, (const UInt8 *)a3, a4, v11, 1u, v9);
  if (v9) {
    CFRelease(v9);
  }
  return v12;
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (NSPlaceholderString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__NSPlaceholderString_initWithCharactersNoCopy_length_deallocator___block_invoke;
    v10[3] = &unk_1E51FA7E0;
    v10[4] = a5;
    v10[5] = a3;
    v10[6] = a4;
    memset(&context, 0, sizeof(context));
    context.info = (void *)[v10 copy];
    context.allocate = (CFAllocatorAllocateCallBack)_NSAllocatorAllocateHALTIfUsed;
    context.deallocate = (CFAllocatorDeallocateCallBack)_NSAllocatorDeallocateWithBlock;
    CFAllocatorRef v7 = CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], &context);
  }
  else
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
  }
  uint64_t v8 = (NSPlaceholderString *)CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, a4, v7);
  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

uint64_t __67__NSPlaceholderString_initWithCharactersNoCopy_length_deallocator___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

- (NSPlaceholderString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFAllocatorRef v10 = (const __CFAllocator **)MEMORY[0x1E4F1CF90];
  if (!v5) {
    CFAllocatorRef v10 = (const __CFAllocator **)MEMORY[0x1E4F1CFA0];
  }
  CFAllocatorRef v11 = *v10;

  return (NSPlaceholderString *)CFStringCreateWithBytesNoCopy(v8, (const UInt8 *)a3, a4, SystemEncoding, 0, v11);
}

- (NSPlaceholderString)initWithCString:(const char *)a3
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();

  return (NSPlaceholderString *)CFStringCreateWithCString(v4, a3, SystemEncoding);
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  if (!a3)
  {
    CFAllocatorRef v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  uint64_t v9 = *MEMORY[0x1E4F1CF80];
  uint64_t v10 = [a5 pluralizationNumber];

  return (id)MEMORY[0x1F40D9148](v9, _NSDescriptionWithLocaleFunc, _NSDescriptionWithStringProxyFunc, a4, v10, a3, a6);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  if (!a3 || !a4)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  [a6 pluralizationNumber];
  StringWithValidatedFormatAux = (void *)_CFStringCreateStringWithValidatedFormatAux();
  if (a7 && *a7) {
    id v10 = *a7;
  }
  return StringWithValidatedFormatAux;
}

- (unint64_t)length
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
}

@end
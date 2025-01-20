@interface NSPlaceholderMutableString
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSPlaceholderMutableString)init;
- (NSPlaceholderMutableString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6;
- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6;
- (NSPlaceholderMutableString)initWithCString:(const char *)a3 encoding:(unint64_t)a4;
- (NSPlaceholderMutableString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderMutableString)initWithCapacity:(unint64_t)a3;
- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (NSPlaceholderMutableString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5;
- (NSPlaceholderMutableString)initWithString:(id)a3;
- (NSPlaceholderMutableString)initWithUTF8String:(const char *)a3;
- (NSPlaceholderMutableString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation NSPlaceholderMutableString

- (NSPlaceholderMutableString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  Mutable = (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  _CFStringAppendFormatAndArgumentsAux2();
  return Mutable;
}

- (NSPlaceholderMutableString)init
{
  return (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

- (NSPlaceholderMutableString)initWithString:(id)a3
{
  if (!a3)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  v4 = (objc_class *)objc_opt_class();
  if (v4 == (objc_class *)__NSCFStringClass || class_getSuperclass(v4) == (Class)__NSCFStringClass)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    return (NSPlaceholderMutableString *)CFStringCreateMutableCopy(v7, 0, (CFStringRef)a3);
  }
  else
  {
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    CFStringAppend(Mutable, (CFStringRef)a3);
    return (NSPlaceholderMutableString *)Mutable;
  }
}

- (NSPlaceholderMutableString)initWithCapacity:(unint64_t)a3
{
  return (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
}

- (NSPlaceholderMutableString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v8 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v8 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a5);
      }
      CFStringEncoding v8 = 1536;
    }
  }
  result = (NSPlaceholderMutableString *)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, v8, 1u);
  if (result)
  {
    v10 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFStringRef)result);
    CFRelease(v10);
    return MutableCopy;
  }
  return result;
}

- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringAppendCharacters(Mutable, a3, a4);
  if (v5) {
    free(a3);
  }
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithUTF8String:(const char *)a3
{
  if (!a3)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (self == (NSPlaceholderMutableString *)&__mutablePlaceholder || _CFExecutableLinkedOnOrAfter())
  {
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    v6 = (NSPlaceholderMutableString *)Mutable;
    if (Mutable) {
      CFStringAppendCString(Mutable, a3, 0x8000100u);
    }
    return v6;
  }
  else
  {
    size_t v8 = strlen(a3);
    return [(NSPlaceholderMutableString *)self initWithBytes:a3 length:v8 encoding:4];
  }
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

- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  BOOL v6 = a6;
  CFStringEncoding v10 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v10 == -1)
  {
    if (a5 != 134217984 && a5)
    {
      CFStringEncoding v10 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", a5);
      }
      CFStringEncoding v10 = 1536;
    }
  }
  v11 = (CFAllocatorRef *)MEMORY[0x1E4F1CF90];
  if (!v6) {
    v11 = (CFAllocatorRef *)MEMORY[0x1E4F1CFA0];
  }
  result = (NSPlaceholderMutableString *)CFStringCreateWithBytesNoCopy(0, (const UInt8 *)a3, a4, v10, 1u, *v11);
  if (result)
  {
    v13 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFStringRef)result);
    CFRelease(v13);
    return MutableCopy;
  }
  return result;
}

- (NSPlaceholderMutableString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  result = [[NSString alloc] initWithBytesNoCopy:a3 length:a4 encoding:a5 deallocator:a6];
  if (result)
  {
    CFAllocatorRef v7 = result;
    MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFStringRef)result);

    return MutableCopy;
  }
  return result;
}

- (NSPlaceholderMutableString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringAppendCharacters(Mutable, a3, a4);
  if (a5) {
    (*((void (**)(id, unsigned __int16 *, unint64_t))a5 + 2))(a5, a3, a4);
  }
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCString:(const char *)a3 encoding:(unint64_t)a4
{
  if (!a3)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
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
  CFStringAppendCString(Mutable, a3, v7);
  return (NSPlaceholderMutableString *)Mutable;
}

- (NSPlaceholderMutableString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v9 = CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, SystemEncoding, 0);
  if (v5) {
    free(a3);
  }
  if (!v9) {
    return 0;
  }
  MutableCopy = (NSPlaceholderMutableString *)CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v9);
  CFRelease(v9);
  return MutableCopy;
}

- (NSPlaceholderMutableString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  if (!a3 || !a4)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  Mutable = (NSPlaceholderMutableString *)CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!_CFStringAppendValidatedFormatAndArguments())
  {
    CFRelease(Mutable);
    if (a7 && *a7) {
      id v9 = *a7;
    }
    return 0;
  }
  return Mutable;
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  if (!a3)
  {
    id v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  [a5 pluralizationNumber];
  _CFStringAppendFormatAndArgumentsAux2();
  return Mutable;
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  if (!a3 || !a4)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  [a6 pluralizationNumber];
  if (!_CFStringAppendValidatedFormatAndArguments())
  {
    CFRelease(Mutable);
    if (a7 && *a7) {
      id v11 = *a7;
    }
    return 0;
  }
  return Mutable;
}

- (unint64_t)length
{
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSLog((NSString *)@"Did you forget to nest alloc and init?", a2, a3.location, a3.length, a4);
  BOOL v6 = (objc_class *)__NSMutableStringClass;

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

@end
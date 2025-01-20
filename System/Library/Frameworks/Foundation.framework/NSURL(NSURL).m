@interface NSURL(NSURL)
+ (id)URLByResolvingAliasFileAtURL:()NSURL options:error:;
+ (id)URLByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:;
+ (id)URLWithDataRepresentation:()NSURL relativeToURL:;
+ (id)URLWithString:()NSURL encodingInvalidCharacters:;
+ (id)URLWithString:()NSURL relativeToURL:;
+ (id)absoluteURLWithDataRepresentation:()NSURL relativeToURL:;
+ (id)allocWithZone:()NSURL;
+ (id)fileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:;
+ (id)fileURLWithPath:()NSURL;
+ (id)fileURLWithPath:()NSURL isDirectory:;
+ (id)fileURLWithPath:()NSURL isDirectory:relativeToURL:;
+ (id)fileURLWithPath:()NSURL relativeToURL:;
+ (uint64_t)URLWithString:()NSURL;
- (BOOL)_isAbsolute;
- (BOOL)getFileSystemRepresentation:()NSURL maxLength:;
- (BOOL)hasDirectoryPath;
- (BOOL)isEqual:()NSURL;
- (BOOL)isFileURL;
- (CFIndex)retainCount;
- (CFStringRef)parameterString;
- (CFURLRef)absoluteURL;
- (CFURLRef)initFileURLWithPath:()NSURL;
- (CFURLRef)initFileURLWithPath:()NSURL isDirectory:;
- (CFURLRef)initWithCoder:()NSURL;
- (CFURLRef)initWithString:()NSURL relativeToURL:encodingInvalidCharacters:;
- (NSNumber)port;
- (NSString)description;
- (NSString)resourceSpecifier;
- (__CFString)fileSystemRepresentation;
- (__CFString)fragment;
- (__CFString)host;
- (__CFString)path;
- (__CFString)query;
- (__CFString)relativePath;
- (__CFString)relativeString;
- (__CFString)scheme;
- (__CFString)user;
- (char)_cfurl;
- (char)initByResolvingAliasFileAtURL:()NSURL options:error:;
- (char)initByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:;
- (char)initFileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:;
- (char)initFileURLWithPath:()NSURL isDirectory:relativeToURL:;
- (char)initFileURLWithPath:()NSURL relativeToURL:;
- (const)absoluteString;
- (const)baseURL;
- (id)_tryRetain;
- (id)dealloc;
- (id)retain;
- (id)standardizedURL;
- (objc_class)initAbsoluteURLWithDataRepresentation:()NSURL relativeToURL:;
- (objc_class)initWithDataRepresentation:()NSURL relativeToURL:;
- (objc_class)password;
- (uint64_t)_clientsCreatingIfNecessary:()NSURL;
- (uint64_t)_securePath;
- (uint64_t)dataRepresentation;
- (uint64_t)encodeWithCoder:()NSURL;
- (uint64_t)hash;
- (uint64_t)init;
- (uint64_t)initWithScheme:()NSURL host:path:;
- (uint64_t)initWithString:()NSURL;
- (uint64_t)initWithString:()NSURL encodingInvalidCharacters:;
- (uint64_t)initWithString:()NSURL relativeToURL:;
- (uint64_t)isKindOfClass:()NSURL;
- (uint64_t)isMemberOfClass:()NSURL;
- (unint64_t)_isDeallocating;
- (void)_freeClients;
- (void)release;
@end

@implementation NSURL(NSURL)

- (__CFString)relativeString
{
  v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  v4 = (id)CFURLGetString(v3);

  return v4;
}

- (uint64_t)isMemberOfClass:()NSURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848 && qword_1EB1ED848 == a3) {
    return 1;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&off_1ECAF3790;
  return (uint64_t)objc_msgSendSuper2(&v7, sel_isMemberOfClass_, a3);
}

+ (uint64_t)URLWithString:()NSURL
{
  return [a1 URLWithString:a3 relativeToURL:0];
}

- (NSString)description
{
  if (objc_msgSend((id)objc_msgSend(a1, "scheme"), "caseInsensitiveCompare:", @"data"))
  {
    if ([a1 baseURL])
    {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ -- %@", [a1 relativeString], objc_msgSend(a1, "baseURL"));
    }
    else
    {
      return (NSString *)[a1 relativeString];
    }
  }
  else
  {
    unint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "relativeString"), "length");
    if (v3 > 0x80) {
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ... %@", objc_msgSend((id)objc_msgSend(a1, "relativeString"), "substringToIndex:", 120), objc_msgSend((id)objc_msgSend(a1, "relativeString"), "substringFromIndex:", v3 - 8));
    }
    else {
      v4 = (NSString *)[a1 relativeString];
    }
    v5 = v4;
    if ([a1 baseURL]) {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ -- %@", v5, [a1 baseURL]);
    }
    else {
      return v5;
    }
  }
}

- (__CFString)scheme
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  v4 = (__CFString *)CFURLCopyScheme(v3);

  return v4;
}

- (const)baseURL
{
  unint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = CFURLGetBaseURL(v3);

  return v4;
}

- (NSString)resourceSpecifier
{
  if ([a1 _isAbsolute])
  {
    CFURLRef v4 = (objc_class *)[a1 _cfurl];
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if (v4 == (objc_class *)qword_1EB1ED838)
    {
      v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
      objc_exception_throw(v9);
    }
    if (!v4) {
      return 0;
    }
    if (!CFURLCanBeDecomposed(v4))
    {
      v5 = (__CFString *)CFURLCopyResourceSpecifier(v4);
      goto LABEL_14;
    }
    if (CFURLGetBaseURL(v4))
    {
      v5 = (id)CFURLGetString(v4);
LABEL_14:
      return (NSString *)v5;
    }
    CFStringRef v7 = (id)CFURLCopyNetLocation(v4);
    CFStringRef v8 = (id)CFURLCopyPath(v4);
    result = (id)CFURLCopyResourceSpecifier(v4);
    if (v7)
    {
      if (v8)
      {
        if (result) {
          return +[NSString stringWithFormat:@"//%@%@%@", v7, v8, result];
        }
        else {
          return +[NSString stringWithFormat:@"//%@%@", v7, v8, v11];
        }
      }
      else if (result)
      {
        return +[NSString stringWithFormat:@"//%@", v7, v10, v11];
      }
      else
      {
        return +[NSString stringWithFormat:@"//%@%@", v7, 0, v11];
      }
    }
    else if (v8)
    {
      if (result) {
        return +[NSString stringWithFormat:@"%@%@", v8, result, v11];
      }
      else {
        return (NSString *)v8;
      }
    }
  }
  else
  {
    return (NSString *)[a1 relativeString];
  }
  return result;
}

- (BOOL)_isAbsolute
{
  return ![a1 baseURL] && objc_msgSend(a1, "scheme") != 0;
}

+ (id)fileURLWithPath:()NSURL isDirectory:relativeToURL:
{
  v5 = (void *)[objc_allocWithZone(a1) initFileURLWithPath:a3 isDirectory:a4 relativeToURL:a5];

  return v5;
}

+ (id)fileURLWithPath:()NSURL isDirectory:
{
  CFURLRef v4 = (void *)[objc_allocWithZone(a1) initFileURLWithPath:a3 isDirectory:a4];

  return v4;
}

+ (id)fileURLWithPath:()NSURL
{
  unint64_t v3 = (void *)[objc_allocWithZone(a1) initFileURLWithPath:a3];

  return v3;
}

- (CFURLRef)initFileURLWithPath:()NSURL
{
  CFURLRef v4 = (char *)a1;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v9 = +[NSString stringWithFormat:@"%@: nil string parameter", _NSMethodExceptionProem(a1, a2)];

    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_23;
  }
  v5 = a3;
  if (![(__CFString *)a3 length]) {
    goto LABEL_15;
  }
  if (([(__CFString *)v5 isAbsolutePath] & 1) == 0) {
    v5 = (__CFString *)[(__CFString *)v5 stringByStandardizingPath];
  }
  Boolean isDirectory = 0;
  if ([(__CFString *)v5 characterAtIndex:[(__CFString *)v5 length] - 1] == 47)
  {
    Boolean isDirectory = 1;
  }
  else if ((_NSFileExists((uint64_t)v5, (BOOL *)&isDirectory) & 1) == 0)
  {
    Boolean isDirectory = 0;
  }
  Class Class = object_getClass(v4);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((char *)qword_1EB1ED838 == v4)
    {

      return CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, isDirectory);
    }
    v9 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem((objc_class *)v4, a2)];

    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = (void *)MEMORY[0x1E4F1C3A8];
LABEL_23:
    objc_exception_throw((id)[v10 exceptionWithName:*v11 reason:v9 userInfo:0]);
  }
  v12.receiver = v4;
  v12.super_class = (Class)&off_1ECAF3790;
  CFURLRef v4 = (char *)[(objc_class *)&v12 init];
  if (v4)
  {
    CFURLRef v7 = CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, isDirectory);
    if (v7)
    {
      *(void *)&v4[*MEMORY[0x1E4F1CB48]] = v7;
      return (CFURLRef)v4;
    }
LABEL_15:

    return 0;
  }
  return (CFURLRef)v4;
}

- (char)initFileURLWithPath:()NSURL isDirectory:relativeToURL:
{
  v6 = (char *)a1;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v13 = +[NSString stringWithFormat:@"%@: nil string parameter", _NSMethodExceptionProem(a1, a2)];

    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_21;
  }
  v9 = a3;
  if (![a3 length]) {
    goto LABEL_11;
  }
  if (([v9 isAbsolutePath] & 1) == 0) {
    v9 = (void *)[v9 stringByStandardizingPath];
  }
  Class Class = object_getClass(v6);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((char *)qword_1EB1ED838 == v6)
    {
      JUMPOUT(0x185305B90);
    }
    v13 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem((objc_class *)v6, a2)];

    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = (void *)MEMORY[0x1E4F1C3A8];
LABEL_21:
    objc_exception_throw((id)[v14 exceptionWithName:*v15 reason:v13 userInfo:0]);
  }
  v16.receiver = v6;
  v16.super_class = (Class)&off_1ECAF3790;
  v6 = (char *)[(objc_class *)&v16 init];
  if (v6)
  {
    uint64_t v11 = MEMORY[0x185305B90](0, v9, 0, a4, a5);
    if (v11)
    {
      *(void *)&v6[*MEMORY[0x1E4F1CB48]] = v11;
      return v6;
    }
LABEL_11:

    return 0;
  }
  return v6;
}

- (CFURLRef)initFileURLWithPath:()NSURL isDirectory:
{
  v5 = (char *)a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%@: nil string parameter", _NSMethodExceptionProem(a1, a2)];

    objc_super v12 = (void *)MEMORY[0x1E4F1CA00];
    v13 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_21;
  }
  CFURLRef v7 = a3;
  if (![(__CFString *)a3 length]) {
    goto LABEL_11;
  }
  if (([(__CFString *)v7 isAbsolutePath] & 1) == 0) {
    CFURLRef v7 = (__CFString *)[(__CFString *)v7 stringByStandardizingPath];
  }
  Class Class = object_getClass(v5);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class != (Class)qword_1EB1ED848)
  {
    v14.receiver = v5;
    v14.super_class = (Class)&off_1ECAF3790;
    v5 = (char *)[(objc_class *)&v14 init];
    if (!v5) {
      return (CFURLRef)v5;
    }
    CFURLRef v9 = CFURLCreateWithFileSystemPath(0, v7, kCFURLPOSIXPathStyle, a4);
    if (v9)
    {
      *(void *)&v5[*MEMORY[0x1E4F1CB48]] = v9;
      return (CFURLRef)v5;
    }
LABEL_11:

    return 0;
  }
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if ((char *)qword_1EB1ED838 != v5)
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem((objc_class *)v5, a2)];

    objc_super v12 = (void *)MEMORY[0x1E4F1CA00];
    v13 = (void *)MEMORY[0x1E4F1C3A8];
LABEL_21:
    objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
  }

  return CFURLCreateWithFileSystemPath(0, v7, kCFURLPOSIXPathStyle, a4);
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((void *)qword_1EB1ED838 != a1)
    {
      JUMPOUT(0x185306420);
    }
  }
  else
  {
    v3.receiver = a1;
    v3.super_class = (Class)&off_1ECAF3790;
    objc_msgSendSuper2(&v3, sel_release);
  }
}

- (id)retain
{
  v1 = a1;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class != (Class)qword_1EB1ED848)
  {
    v5.receiver = v1;
    v5.super_class = (Class)&off_1ECAF3790;
    return objc_msgSendSuper2(&v5, sel_retain);
  }
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if ((void *)qword_1EB1ED838 == v1) {
    return v1;
  }

  return (id)MEMORY[0x1F40D8EC0](v1, v2);
}

+ (id)URLWithString:()NSURL relativeToURL:
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (void *)[objc_allocWithZone(a1) initWithString:a3 relativeToURL:a4];

  return v4;
}

+ (id)allocWithZone:()NSURL
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if ((void *)qword_1EB1ED848 == a1)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    return (id)qword_1EB1ED838;
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)off_1ECAF2D70;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (uint64_t)initWithString:()NSURL relativeToURL:
{
  return [a1 initWithString:a3 relativeToURL:a4 encodingInvalidCharacters:1];
}

- (uint64_t)initWithString:()NSURL
{
  return [a1 initWithString:a3 relativeToURL:0];
}

- (id)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 _freeClients];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class != (Class)qword_1EB1ED848) {

  }
  v4.receiver = a1;
  v4.super_class = (Class)&off_1ECAF3790;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

- (void)_freeClients
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  if (v3)
  {
    objc_super v4 = (void *)__CFURLReservedPtr();
    if (v4)
    {

      __CFURLSetReservedPtr();
    }
  }
}

- (CFURLRef)initWithCoder:()NSURL
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    buf[0] = 0;
    [a3 decodeValueOfObjCType:"c" at:buf size:1];
    if (buf[0])
    {
      uint64_t v7 = [a3 decodeObject];
      if (!v7) {
        goto LABEL_30;
      }
      CFURLRef v8 = (const __CFURL *)v7;
      self;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
    }
    else
    {
      CFURLRef v8 = 0;
    }
    uint64_t v20 = [a3 decodeObject];
    if (v20)
    {
      CFStringRef v21 = (const __CFString *)v20;
      if (_NSIsNSString())
      {
        CFURLRef result = (CFURLRef)[a1 initWithString:v21 relativeToURL:v8];
        if (!result)
        {
          CFURLRef result = CFURLCreateWithString(0, v21, v8);
          if (result) {
            goto LABEL_23;
          }
        }
        goto LABEL_33;
      }
    }
LABEL_30:

    LODWORD(a1) = 0;
    goto LABEL_37;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [a3 containsValueForKey:@"NS.minimalBookmarkData"]
    && [a3 _strictSecureDecodingEnabled])
  {
    objc_super v6 = _NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = _NSMethodExceptionProem((objc_class *)a1, sel_initWithCoder_);
      _os_log_fault_impl(&dword_181795000, v6, OS_LOG_TYPE_FAULT, "%@: Skipped decoding bookmark data due to NSKeyedUnarchiver mode.", buf, 0xCu);
    }
LABEL_18:
    uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.relative"];
    if (v17)
    {
      CFStringRef v18 = (const __CFString *)v17;
      if (_NSIsNSString())
      {
        uint64_t v19 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.base"];
        CFURLRef result = (CFURLRef)[a1 initWithString:v18 relativeToURL:v19];
        if (result) {
          return result;
        }
        CFStringRef v15 = v18;
        CFURLRef v16 = (const __CFURL *)v19;
LABEL_22:
        CFURLRef result = CFURLCreateWithString(0, v15, v16);
        if (result)
        {
LABEL_23:
          CFRelease(result);
          LODWORD(a1) = 1;
          goto LABEL_37;
        }
LABEL_36:
        LODWORD(a1) = 0;
        goto LABEL_37;
      }
    }
    goto LABEL_35;
  }
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.minimalBookmarkData"];
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  if (!_NSIsNSData()) {
    goto LABEL_18;
  }
  if (a1)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v10 options:768 relativeToURL:0 bookmarkDataIsStale:0 error:0];
    if (v11)
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "filePathURL"), "absoluteString");
      if (v12)
      {
        CFStringRef v13 = (const __CFString *)v12;
        CFURLRef result = (CFURLRef)[a1 initWithString:v12];
        if (result) {
          return result;
        }
        CFStringRef v15 = v13;
        CFURLRef v16 = 0;
        goto LABEL_22;
      }
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v22 = *MEMORY[0x1E4F1C700];
    uint64_t v23 = *MEMORY[0x1E4F1C628];
    v24 = objc_msgSend(MEMORY[0x1E4F1CB10], "resourceValuesForKeys:fromBookmarkData:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F1C700], *MEMORY[0x1E4F1C628], 0), v10);
    uint64_t v25 = [v24 objectForKey:v22];
    if (!v25) {
      goto LABEL_35;
    }
    CFURLRef result = (CFURLRef)objc_msgSend(a1, "initFileURLWithPath:isDirectory:", v25, objc_msgSend((id)objc_msgSend(v24, "objectForKey:", v23), "BOOLValue"));
LABEL_33:
    LODWORD(a1) = 0;
    if (result) {
      return result;
    }
  }
LABEL_37:
  if (dyld_program_sdk_at_least() && (a1 & _os_feature_enabled_impl()) == 1) {
    return (CFURLRef)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:&stru_1ECA5C228];
  }
  [a3 failWithError:+[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"%@: invalid archived object", _NSMethodExceptionProem((objc_class *)objc_alloc(MEMORY[0x1E4F1CB10]), a2))];
  return 0;
}

- (CFURLRef)initWithString:()NSURL relativeToURL:encodingInvalidCharacters:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v17 = +[NSString stringWithFormat:@"%@: nil string parameter", _NSMethodExceptionProem(a1, a2)];

    CFStringRef v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_21;
  }
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class != (Class)qword_1EB1ED848)
  {
    v20.receiver = a1;
    v20.super_class = (Class)&off_1ECAF3790;
    uint64_t v11 = [(objc_class *)&v20 init];
    if (v11)
    {
      CFURLRef v12 = CFURLCreateWithString(0, a3, a4);
      if (v12)
      {
        *(void *)&v11[*MEMORY[0x1E4F1CB48]] = v12;
      }
      else
      {

        return 0;
      }
    }
    return (CFURLRef)v11;
  }
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if ((objc_class *)qword_1EB1ED838 != a1)
  {
    uint64_t v17 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem(a1, a2)];

    CFStringRef v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = (void *)MEMORY[0x1E4F1C3A8];
LABEL_21:
    objc_exception_throw((id)[v18 exceptionWithName:*v19 reason:v17 userInfo:0]);
  }
  if (dyld_program_sdk_at_least() && _os_feature_enabled_impl())
  {
    CFStringRef v13 = [[NSURLComponents alloc] initWithString:a3 encodingInvalidCharacters:a5];
    objc_super v14 = (void *)MEMORY[0x185308110]();
    CFURLRef v15 = CFURLCreateWithString(0, (CFStringRef)[(NSURLComponents *)v13 string], a4);

    return v15;
  }
  else
  {
    return CFURLCreateWithString(0, a3, a4);
  }
}

- (id)standardizedURL
{
  objc_super v3 = a1;
  objc_super v4 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_1EB1ED838)
  {
    objc_super v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v4) {
    return 0;
  }
  if (_CFURLCopyComponents()) {
    return (id)_CFURLCreateFromComponents();
  }
  return v3;
}

- (__CFString)host
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    objc_super v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  objc_super v4 = (__CFString *)CFURLCopyHostName(v3);

  return v4;
}

- (const)absoluteString
{
  objc_super v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    CFURLRef v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = CFURLCopyAbsoluteURL(v3);
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = v4;
  CFStringRef v6 = (id)(id)CFURLGetString(v4);
  CFRelease(v5);
  return v6;
}

- (uint64_t)hash
{
  CFURLRef v4 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_1EB1ED838)
  {
    CFURLRef v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  if (!v4) {
    return 0;
  }

  return MEMORY[0x1F40D8EB0](v4, v3);
}

- (BOOL)isFileURL
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    CFURLRef v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  return v3 && _CFURLIsFileURL() != 0;
}

- (BOOL)isEqual:()NSURL
{
  self;
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v6 = (objc_class *)[a1 _cfurl];
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if (v6 == (objc_class *)qword_1EB1ED838)
    {
      uint64_t v9 = +[NSString stringWithFormat:@"%@: object was not initialized", _NSMethodExceptionProem(v6, a2)];
    }
    else
    {
      uint64_t v7 = (objc_class *)[a3 _cfurl];
      if (qword_1EB1ED840 != -1) {
        dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
      }
      if (v7 != (objc_class *)qword_1EB1ED838) {
        return _CFNonObjCEqual() != 0;
      }
      uint64_t v9 = +[NSString stringWithFormat:@"%@: object was not initialized", _NSMethodExceptionProem(v7, a2)];
    }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0]);
  }
  return 0;
}

- (__CFString)path
{
  uint64_t v3 = a1;
  if ([a1 isFileReferenceURL] && objc_msgSend(v3, "_resolveFlags")) {
    uint64_t v3 = (void *)[v3 filePathURL];
  }
  CFURLRef v4 = (objc_class *)[v3 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_1EB1ED838)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (!v4) {
    return 0;
  }
  CFURLRef v5 = CFURLCopyAbsoluteURL(v4);
  if (!v5) {
    return 0;
  }
  CFURLRef v6 = v5;
  uint64_t v7 = (__CFString *)CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  CFRelease(v6);

  return v7;
}

- (char)_cfurl
{
  v1 = a1;
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class != (Class)qword_1EB1ED848) {
    return *(char **)&v1[*MEMORY[0x1E4F1CB48]];
  }
  return v1;
}

- (uint64_t)isKindOfClass:()NSURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848 && qword_1EB1ED848 == a3) {
    return 1;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&off_1ECAF3790;
  return (uint64_t)objc_msgSendSuper2(&v7, sel_isKindOfClass_, a3);
}

+ (id)fileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:
{
  CFURLRef v5 = (void *)[objc_allocWithZone(a1) initFileURLWithFileSystemRepresentation:a3 isDirectory:a4 relativeToURL:a5];

  return v5;
}

- (char)initFileURLWithFileSystemRepresentation:()NSURL isDirectory:relativeToURL:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((void *)qword_1EB1ED838 == a1)
    {
      strlen(a3);
      JUMPOUT(0x185305B30);
    }
    CFURLRef v15 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem((objc_class *)a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v15 userInfo:0]);
  }
  v16.receiver = a1;
  v16.super_class = (Class)&off_1ECAF3790;
  uint64_t v11 = (char *)objc_msgSendSuper2(&v16, sel_init);
  if (v11)
  {
    size_t v12 = strlen(a3);
    uint64_t v13 = MEMORY[0x185305B30](*MEMORY[0x1E4F1CF80], a3, v12, a4, a5);
    *(void *)&v11[*MEMORY[0x1E4F1CB50]] = 0;
    *(void *)&v11[*MEMORY[0x1E4F1CB38]] = 0;
    *(void *)&v11[*MEMORY[0x1E4F1CB40]] = 0;
    if (v13)
    {
      *(void *)&v11[*MEMORY[0x1E4F1CB48]] = v13;
    }
    else
    {

      return 0;
    }
  }
  return v11;
}

- (BOOL)getFileSystemRepresentation:()NSURL maxLength:
{
  objc_super v7 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v7 == (objc_class *)qword_1EB1ED838)
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v7, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (v7) {
    return CFURLGetFileSystemRepresentation(v7, 1u, a3, a4) != 0;
  }
  BOOL result = 0;
  *a3 = 0;
  return result;
}

- (CFStringRef)parameterString
{
  block[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    CFURLRef v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__NSURL_NSURL__parameterString__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (_MergedGlobals_123 == -1)
  {
    if (v3) {
      return (id)CFURLCopyParameterString(v3, 0);
    }
  }
  else
  {
    dispatch_once(&_MergedGlobals_123, block);
    if (v3) {
      return (id)CFURLCopyParameterString(v3, 0);
    }
  }
  return 0;
}

- (CFURLRef)absoluteURL
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    CFURLRef v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = CFURLCopyAbsoluteURL(v3);

  return v4;
}

- (uint64_t)encodeWithCoder:()NSURL
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v5 = [a3 allowsKeyedCoding];
  int v6 = [a1 isFileReferenceURL];
  if (v5)
  {
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(a1, "baseURL"), @"NS.base");
      uint64_t v7 = [a1 relativeString];
      uint64_t v8 = @"NS.relative";
      uint64_t v9 = a3;
LABEL_5:
      return [v9 encodeObject:v7 forKey:v8];
    }
    size_t v12 = (void *)[a1 filePathURL];
    uint64_t v13 = [a1 bookmarkDataWithOptions:512 includingResourceValuesForKeys:0 relativeToURL:0 error:0];
    if (v12
      || (result = [MEMORY[0x1E4F1CB10] URLWithString:@"com-apple-unresolvable-file-reference-url:"], (size_t v12 = (void *)result) != 0))
    {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v12, "baseURL"), @"NS.base");
      uint64_t result = objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v12, "relativeString"), @"NS.relative");
    }
    if (v13)
    {
      uint64_t v8 = @"NS.minimalBookmarkData";
      uint64_t v9 = a3;
      uint64_t v7 = v13;
      goto LABEL_5;
    }
  }
  else
  {
    if (v6)
    {
      a1 = (void *)[a1 filePathURL];
      if (!a1) {
        a1 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:@"com-apple-unresolvable-file-reference-url:"];
      }
    }
    uint64_t v11 = [a1 baseURL];
    BOOL v14 = v11 != 0;
    [a3 encodeValueOfObjCType:"c" at:&v14];
    if (v11) {
      [a3 encodeObject:v11];
    }
    return objc_msgSend(a3, "encodeObject:", objc_msgSend(a1, "relativeString"));
  }
  return result;
}

- (__CFString)query
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  String = (__CFString *)CFURLCopyQueryString(v3, 0);

  return String;
}

- (BOOL)hasDirectoryPath
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    char v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  return v3 && CFURLHasDirectoryPath(v3) != 0;
}

- (__CFString)fileSystemRepresentation
{
  CFURLRef v4 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v4 == (objc_class *)qword_1EB1ED838)
  {
    BOOL v14 = +[NSString stringWithFormat:@"%@: object was not initialized", _NSMethodExceptionProem(v4, a2)];
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
    objc_super v16 = (void *)MEMORY[0x1E4F1C3A8];
    goto LABEL_22;
  }
  if (!v4)
  {
    size_t v12 = +[NSString stringWithFormat:@"%@: %@ was not initialized", _NSMethodExceptionProem((objc_class *)a1, a2), a1];
    goto LABEL_19;
  }
  char v5 = malloc_type_malloc(0x400uLL, 0x347E2AC6uLL);
  if (!v5)
  {
    uint64_t v17 = +[NSString stringWithFormat:@"%@: unable to allocate memory for length (%ld)", _NSMethodExceptionProem((objc_class *)a1, a2), 1024];
    goto LABEL_21;
  }
  int v6 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v5, 1024), "bytes");
  if (!CFURLGetFileSystemRepresentation(v4, 1u, (UInt8 *)v6, 1024))
  {
    CFURLRef v7 = CFURLCopyAbsoluteURL(v4);
    if (v7)
    {
      CFURLRef v8 = v7;
      CFStringRef v9 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
      int v6 = (__CFString *)v9;
      if (v9)
      {
        CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v9);
        CFRelease(v6);
        if (MaximumSizeOfFileSystemRepresentation != -1)
        {
          uint64_t v11 = malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0xE1C71144uLL);
          if (v11)
          {
            int v6 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:", v11, MaximumSizeOfFileSystemRepresentation), "bytes");
            if (!CFURLGetFileSystemRepresentation(v8, 1u, (UInt8 *)v6, MaximumSizeOfFileSystemRepresentation))
            {
              size_t v12 = +[NSString stringWithFormat:@"%@: conversion failed for %@", _NSMethodExceptionProem((objc_class *)a1, a2), a1];
LABEL_19:
              BOOL v14 = v12;
              uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
              objc_super v16 = (void *)MEMORY[0x1E4F1C3C8];
              goto LABEL_22;
            }
            goto LABEL_15;
          }
          uint64_t v17 = +[NSString stringWithFormat:@"%@: unable to allocate memory for length (%ld)", _NSMethodExceptionProem((objc_class *)a1, a2), MaximumSizeOfFileSystemRepresentation];
LABEL_21:
          BOOL v14 = v17;
          uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
          objc_super v16 = (void *)MEMORY[0x1E4F1C4A0];
LABEL_22:
          objc_exception_throw((id)[v15 exceptionWithName:*v16 reason:v14 userInfo:0]);
        }
        int v6 = 0;
      }
LABEL_15:
      CFRelease(v8);
      return v6;
    }
    return 0;
  }
  return v6;
}

- (__CFString)fragment
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  CFURLRef v4 = (__CFString *)CFURLCopyFragment(v3, 0);

  return v4;
}

- (NSNumber)port
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  SInt32 v4 = CFURLGetPortNumber(v3);
  if (v4 == -1) {
    return 0;
  }

  return +[NSNumber numberWithInteger:v4];
}

- (unint64_t)_isDeallocating
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    return (void *)qword_1EB1ED838 == a1 || _CFIsDeallocating() != 0;
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1ECAF3790;
    return (unint64_t)objc_msgSendSuper2(&v4, sel__isDeallocating);
  }
}

- (__CFString)relativePath
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  objc_super v4 = (__CFString *)CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);

  return v4;
}

- (id)_tryRetain
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((void *)qword_1EB1ED838 == a1) {
      return 0;
    }
    else {
      return (id)(_CFTryRetain() != 0);
    }
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1ECAF3790;
    return objc_msgSendSuper2(&v4, sel__tryRetain);
  }
}

+ (id)URLByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:
{
  CFURLRef v7 = (void *)[objc_allocWithZone(a1) initByResolvingBookmarkData:a3 options:a4 relativeToURL:a5 bookmarkDataIsStale:a6 error:a7];

  return v7;
}

- (char)initByResolvingBookmarkData:()NSURL options:relativeToURL:bookmarkDataIsStale:error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((void *)qword_1EB1ED838 != a1)
    {
      uint64_t v22 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem((objc_class *)a1, a2)];

      uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v24 = *MEMORY[0x1E4F1C3A8];
      uint64_t v25 = v22;
      goto LABEL_30;
    }
    uint64_t v19 = [a5 _cfurl];
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if (v19 != qword_1EB1ED838)
    {
      uint64_t v15 = (char *)MEMORY[0x185305AE0](*MEMORY[0x1E4F1CF80], a3, a4, v19, 0, a6, a7);
      if (v15) {
        return v15;
      }
      if (a7 && *a7)
      {
        uint64_t v15 = 0;
        *a7 = *a7;
        return v15;
      }
      return 0;
    }
    uint64_t v21 = (objc_class *)v19;
LABEL_29:
    uint64_t v25 = +[NSString stringWithFormat:@"%@: object was not initialized", _NSMethodExceptionProem(v21, a2)];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3A8];
LABEL_30:
    objc_exception_throw((id)[v23 exceptionWithName:v24 reason:v25 userInfo:0]);
  }
  v26.receiver = a1;
  v26.super_class = (Class)&off_1ECAF3790;
  uint64_t v15 = (char *)objc_msgSendSuper2(&v26, sel_init);
  if (v15)
  {
    uint64_t v16 = [a5 _cfurl];
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if (v16 != qword_1EB1ED838)
    {
      uint64_t v17 = MEMORY[0x185305AE0](*MEMORY[0x1E4F1CF80], a3, a4, v16, 0, a6, a7);
      *(void *)&v15[*MEMORY[0x1E4F1CB50]] = 0;
      *(void *)&v15[*MEMORY[0x1E4F1CB38]] = 0;
      *(void *)&v15[*MEMORY[0x1E4F1CB40]] = 0;
      uint64_t v18 = (int)*MEMORY[0x1E4F1CB48];
      if (v17)
      {
        *(void *)&v15[v18] = v17;
        return v15;
      }
      *(void *)&v15[v18] = 0;
      if (a7 && *a7) {
        *a7 = *a7;
      }

      return 0;
    }
    uint64_t v21 = (objc_class *)v16;
    goto LABEL_29;
  }
  return v15;
}

- (char)initFileURLWithPath:()NSURL relativeToURL:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (!a3)
  {
    uint64_t v17 = +[NSString stringWithFormat:@"%@: nil string parameter", _NSMethodExceptionProem(a1, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0]);
  }
  CFURLRef v7 = a3;
  if (![a3 length]) {
    goto LABEL_15;
  }
  if (([v7 isAbsolutePath] & 1) == 0) {
    CFURLRef v7 = (void *)[v7 stringByStandardizingPath];
  }
  int v8 = objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1);
  uint64_t v9 = *MEMORY[0x1E4F1CF80];
  if (v8 == 47)
  {
    uint64_t v10 = MEMORY[0x185305B90](v9, v7, 0, 1, a4);
    v21[3] = v10;
    if (!v10)
    {
LABEL_15:

LABEL_16:
      uint64_t v13 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x185305B90](v9, v7, 0, 0, a4);
    v21[3] = v11;
    if (!v11) {
      goto LABEL_15;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__NSURL_NSURL__initFileURLWithPath_relativeToURL___block_invoke;
    v19[3] = &unk_1E51FA948;
    v19[5] = a4;
    v19[6] = &v20;
    v19[4] = v7;
    +[NSURL setIOPolicy:type:scope:forBlock:](MEMORY[0x1E4F1CB10], (uint64_t)v19);
    if (!v21[3]) {
      goto LABEL_15;
    }
  }
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    uint64_t v13 = (char *)v21[3];
    if ((objc_class *)qword_1EB1ED838 != a1)
    {
      CFRelease((CFTypeRef)v21[3]);
      uint64_t v16 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem(a1, a2)];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v16 userInfo:0]);
    }
  }
  else
  {
    v18.receiver = a1;
    v18.super_class = (Class)&off_1ECAF3790;
    uint64_t v13 = (char *)[(objc_class *)&v18 init];
    BOOL v14 = (const void *)v21[3];
    if (!v13)
    {
      CFRelease(v14);
      goto LABEL_16;
    }
    *(void *)&v13[*MEMORY[0x1E4F1CB48]] = v14;
  }
LABEL_17:
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (CFIndex)retainCount
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((void *)qword_1EB1ED838 == a1)
    {
      return -1;
    }
    else
    {
      return CFGetRetainCount(a1);
    }
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&off_1ECAF3790;
    return (CFIndex)objc_msgSendSuper2(&v4, sel_retainCount);
  }
}

- (uint64_t)_clientsCreatingIfNecessary:()NSURL
{
  uint64_t v5 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v5 == (objc_class *)qword_1EB1ED838)
  {
    int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v5, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (!v5) {
    return 0;
  }
  uint64_t Mutable = __CFURLReservedPtr();
  if (!Mutable && a3)
  {
    uint64_t Mutable = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
    __CFURLSetReservedPtr();
  }
  return Mutable;
}

- (uint64_t)init
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    uint64_t v2 = [a1 initWithString:&stru_1ECA5C228];
    uint64_t v3 = @"this results in an NSURL instance with an empty URL string.";
  }
  else
  {

    uint64_t v2 = 0;
    uint64_t v3 = @"the NSURL object has been released and nil returned.";
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__NSURL_NSURL__init__block_invoke;
  v5[3] = &unk_1E51F71D0;
  v5[4] = v3;
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, v5);
  }
  return v2;
}

- (uint64_t)initWithString:()NSURL encodingInvalidCharacters:
{
  return [a1 initWithString:a3 relativeToURL:0 encodingInvalidCharacters:a4];
}

+ (id)URLWithString:()NSURL encodingInvalidCharacters:
{
  if (!a3) {
    return 0;
  }
  objc_super v4 = (void *)[objc_allocWithZone(a1) initWithString:a3 relativeToURL:0 encodingInvalidCharacters:a4];

  return v4;
}

- (uint64_t)initWithScheme:()NSURL host:path:
{
  if (([a5 isAbsolutePath] & 1) == 0)
  {
    uint64_t v21 = +[NSString stringWithFormat:@"%@: path %@ is not absolute.", _NSMethodExceptionProem(a1, a2), a5];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0]);
  }
  if (a4) {
    uint64_t v10 = (__CFString *)[a4 stringByAddingPercentEscapes];
  }
  else {
    uint64_t v10 = &stru_1ECA5C228;
  }
  uint64_t v11 = [a5 standardizedURLPath];
  if (!a3) {
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  uint64_t v13 = [a3 length];
  if (v13 >= 1)
  {
    unint64_t v14 = v13;
    uint64_t v15 = MEMORY[0x1E4F14390];
    do
    {
      unint64_t v16 = v14 - 1;
      unsigned int v17 = [a3 characterAtIndex:v14 - 1];
      unsigned int v18 = v17;
      if (v17 > 0x7F)
      {
        if (__maskrune(v17, 0x100uLL)) {
          goto LABEL_16;
        }
      }
      else if ((*(_DWORD *)(v15 + 4 * v17 + 60) & 0x100) != 0)
      {
        goto LABEL_16;
      }
      if (v14 < 2 || v18 - 48 >= 0xA && (v18 > 0x2E || ((1 << v18) & 0x680000000000) == 0)) {
        goto LABEL_22;
      }
LABEL_16:
      --v14;
    }
    while (v16 + 1 > 1);
  }
  if (v10 && v12)
  {
    uint64_t v19 = +[NSString stringWithFormat:@"%@://%@%@", a3, v10, v12];
    return (uint64_t)[(objc_class *)a1 initWithString:v19];
  }
  else
  {
LABEL_22:

    return 0;
  }
}

- (objc_class)initWithDataRepresentation:()NSURL relativeToURL:
{
  CFURLRef v7 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((objc_class *)qword_1EB1ED838 != v7)
    {
      unint64_t v14 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem(v7, a2)];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v14 userInfo:0]);
    }
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFURLRef v12 = CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x8000100u, a4);
    if (!v12) {
      CFURLRef v12 = CFURLCreateWithBytes(v11, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x201u, a4);
    }
    if (v12) {
      return v12;
    }
  }
  else
  {
    v15.receiver = v7;
    v15.super_class = (Class)&off_1ECAF3790;
    CFURLRef v7 = (objc_class *)[(objc_class *)&v15 init];
    if (v7)
    {
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFURLRef v10 = CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x8000100u, a4);
      if (!v10) {
        CFURLRef v10 = CFURLCreateWithBytes(v9, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x201u, a4);
      }
      *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB50]) = 0;
      *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB38]) = 0;
      *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB40]) = 0;
      if (v10)
      {
        *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB48]) = v10;
      }
      else
      {

        return 0;
      }
    }
  }
  return v7;
}

+ (id)URLWithDataRepresentation:()NSURL relativeToURL:
{
  objc_super v4 = (void *)[objc_allocWithZone(a1) initWithDataRepresentation:a3 relativeToURL:a4];

  return v4;
}

- (objc_class)initAbsoluteURLWithDataRepresentation:()NSURL relativeToURL:
{
  CFURLRef v7 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((objc_class *)qword_1EB1ED838 != v7)
    {
      unint64_t v14 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem(v7, a2)];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v14 userInfo:0]);
    }
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFURLRef v12 = CFURLCreateAbsoluteURLWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x8000100u, a4, 1u);
    if (!v12) {
      CFURLRef v12 = CFURLCreateAbsoluteURLWithBytes(v11, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x201u, a4, 1u);
    }
    if (v12) {
      return v12;
    }
  }
  else
  {
    v15.receiver = v7;
    v15.super_class = (Class)&off_1ECAF3790;
    CFURLRef v7 = (objc_class *)[(objc_class *)&v15 init];
    if (v7)
    {
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFURLRef v10 = CFURLCreateAbsoluteURLWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x8000100u, a4, 1u);
      if (!v10) {
        CFURLRef v10 = CFURLCreateAbsoluteURLWithBytes(v9, (const UInt8 *)[a3 bytes], objc_msgSend(a3, "length"), 0x201u, a4, 1u);
      }
      *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB50]) = 0;
      *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB38]) = 0;
      *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB40]) = 0;
      if (v10)
      {
        *(void *)((char *)v7 + (int)*MEMORY[0x1E4F1CB48]) = v10;
      }
      else
      {

        return 0;
      }
    }
  }
  return v7;
}

+ (id)absoluteURLWithDataRepresentation:()NSURL relativeToURL:
{
  objc_super v4 = (void *)[objc_allocWithZone(a1) initAbsoluteURLWithDataRepresentation:a3 relativeToURL:a4];

  return v4;
}

- (uint64_t)dataRepresentation
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    CFURLRef v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  if (!v3) {
    return 0;
  }
  size_t v4 = CFURLGetBytes(v3, 0, 0);
  if (v4 == -1) {
    return 0;
  }
  CFIndex v5 = v4;
  int v6 = (UInt8 *)malloc_type_malloc(v4, 0xE065D0A1uLL);
  if (!v6) {
    return 0;
  }
  CFURLRef v7 = v6;
  if (CFURLGetBytes(v3, v6, v5) != v5)
  {
    free(v7);
    return 0;
  }
  int v8 = (void *)MEMORY[0x1E4F1C9B8];

  return [v8 dataWithBytesNoCopy:v7 length:v5 freeWhenDone:1];
}

+ (id)fileURLWithPath:()NSURL relativeToURL:
{
  size_t v4 = (void *)[objc_allocWithZone(a1) initFileURLWithPath:a3 relativeToURL:a4];

  return v4;
}

- (char)initByResolvingAliasFileAtURL:()NSURL options:error:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class == (Class)qword_1EB1ED848)
  {
    if (qword_1EB1ED840 != -1) {
      dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
    }
    if ((void *)qword_1EB1ED838 != a1)
    {
      objc_super v15 = +[NSString stringWithFormat:@"%@: object already initialized", _NSMethodExceptionProem((objc_class *)a1, a2)];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v15 userInfo:0]);
    }
    CFAllocatorRef v11 = (char *)MEMORY[0x185306940](*MEMORY[0x1E4F1CF80], a3, a4, 0, a5);
    if (!v11)
    {
      if (a5 && *a5)
      {
        CFAllocatorRef v11 = 0;
        *a5 = *a5;
        return v11;
      }
      return 0;
    }
  }
  else
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_1ECAF3790;
    CFAllocatorRef v11 = (char *)objc_msgSendSuper2(&v16, sel_init);
    if (v11)
    {
      uint64_t v12 = MEMORY[0x185306940](*MEMORY[0x1E4F1CF80], a3, a4, 0, a5);
      *(void *)&v11[*MEMORY[0x1E4F1CB50]] = 0;
      *(void *)&v11[*MEMORY[0x1E4F1CB38]] = 0;
      *(void *)&v11[*MEMORY[0x1E4F1CB40]] = 0;
      uint64_t v13 = (int)*MEMORY[0x1E4F1CB48];
      if (v12)
      {
        *(void *)&v11[v13] = v12;
        return v11;
      }
      *(void *)&v11[v13] = 0;
      if (a5 && *a5) {
        *a5 = *a5;
      }

      return 0;
    }
  }
  return v11;
}

+ (id)URLByResolvingAliasFileAtURL:()NSURL options:error:
{
  CFIndex v5 = (void *)[objc_allocWithZone(a1) initByResolvingAliasFileAtURL:a3 options:a4 error:a5];

  return v5;
}

- (__CFString)user
{
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  if (!v3) {
    return 0;
  }
  size_t v4 = (__CFString *)CFURLCopyUserName(v3);

  return v4;
}

- (objc_class)password
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)[a1 _cfurl];
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if (v3 == (objc_class *)qword_1EB1ED838)
  {
    CFAllocatorRef v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: object was not initialized", _NSMethodExceptionProem(v3, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  if (v3)
  {
    CFStringRef v4 = CFURLCopyNetLocation(v3);
    if (v4)
    {
      CFStringRef v5 = v4;
      CFIndex location = CFStringFind(v4, @"@", 4uLL).location;
      if (location == -1
        || (uint64_t v7 = location,
            result.CFIndex location = 0,
            result.length = 0,
            v12.CFIndex location = 0,
            v12.length = location,
            !CFStringFindWithOptions(v5, @":", v12, 0, &result)))
      {
        uint64_t v3 = 0;
      }
      else
      {
        v13.CFIndex location = result.location + 1;
        v13.length = v7 + ~result.location;
        uint64_t v3 = (id)CFStringCreateWithSubstring(0, v5, v13);
      }
      CFRelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (uint64_t)_securePath
{
  v1 = a1;
  if ([a1 isFileReferenceURL] && (objc_msgSend(v1, "_resolveFlags") & 1) == 0) {
    v1 = (void *)[v1 _URLByInsertingResolveFlags:1];
  }

  return [v1 path];
}

@end
@interface __NSPlaceholderFileSecurity
+ (BOOL)supportsSecureCoding;
+ (id)immutablePlaceholder;
- (__NSPlaceholderFileSecurity)init;
- (__NSPlaceholderFileSecurity)initWithCoder:(id)a3;
- (__NSPlaceholderFileSecurity)initWithFileSec:(_filesec *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)retainCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation __NSPlaceholderFileSecurity

- (__NSPlaceholderFileSecurity)initWithFileSec:(_filesec *)a3
{
  if (self == (__NSPlaceholderFileSecurity *)&___immutablePlaceholderFileSecurity) {
    return (__NSPlaceholderFileSecurity *)+[__NSFileSecurity __new:a3];
  }
  else {
    return 0;
  }
}

+ (id)immutablePlaceholder
{
  return &___immutablePlaceholderFileSecurity;
}

- (__NSPlaceholderFileSecurity)init
{
  result = (__NSPlaceholderFileSecurity *)filesec_init();
  if (result)
  {
    return [(__NSPlaceholderFileSecurity *)self initWithFileSec:result];
  }
  return result;
}

- (unint64_t)retainCount
{
  return -1;
}

- (__NSPlaceholderFileSecurity)initWithCoder:(id)a3
{
  uint64_t v22 = *(void *)off_1ECE0A5B0;
  if (![a3 allowsKeyedCoding])
  {

    objc_exception_throw(+[NSException exceptionWithName:@"NSInvalidArgumentException" reason:@"FileSecurity cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  CFStringRef v5 = @"NSCocoaErrorDomain";
  size_t size = 0;
  uint64_t v6 = [a3 decodeBytesForKey:@"NS.filesec" returnedLength:&size];
  if (!v6)
  {
    v8 = &off_1ECF556B0;
    CFIndex v9 = 4865;
    goto LABEL_6;
  }
  size_t v7 = size;
  if (size - 10313 < 0xFFFFFFFFFFFFD7FFLL)
  {
    v8 = &off_1ECF556D8;
    CFIndex v9 = 4864;
LABEL_6:

    CFErrorRef v10 = CFErrorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v5, v9, (CFDictionaryRef)v8);
    [a3 failWithError:CFAutorelease(v10)];
    return 0;
  }
  v13 = (const void *)v6;
  if (size < 0x449)
  {
    v15 = v21;
  }
  else
  {
    v14 = malloc_type_malloc(size, 0x7B064E45uLL);
    if (!v14)
    {
      CFStringRef v5 = @"NSPOSIXErrorDomain";
      CFIndex v9 = *__error();
      v8 = &off_1ECF55700;
      goto LABEL_6;
    }
    v15 = v14;
    size_t v7 = size;
  }
  memcpy(v15, v13, v7);
  v16 = filesec_init();
  v17 = v16;
  if (!v16)
  {
    CFStringRef v5 = @"NSPOSIXErrorDomain";
    v11 = 0;
    CFIndex v9 = *__error();
    v8 = &off_1ECF55728;
    goto LABEL_45;
  }
  int v18 = *(_DWORD *)v15;
  if (*(_DWORD *)v15)
  {
    LODWORD(obj_p) = v15[1];
    if (filesec_set_property(v16, FILESEC_OWNER, &obj_p))
    {
      CFStringRef v5 = @"NSPOSIXErrorDomain";
      v11 = 0;
      CFIndex v9 = *__error();
      v8 = &off_1ECF55750;
      goto LABEL_45;
    }
    int v18 = *(_DWORD *)v15;
  }
  if ((v18 & 2) != 0)
  {
    LODWORD(obj_p) = v15[2];
    if (filesec_set_property(v17, FILESEC_GROUP, &obj_p))
    {
      CFStringRef v5 = @"NSPOSIXErrorDomain";
      v11 = 0;
      CFIndex v9 = *__error();
      v8 = &off_1ECF55778;
      goto LABEL_45;
    }
    int v18 = *(_DWORD *)v15;
  }
  if ((v18 & 0x10) != 0)
  {
    LOWORD(obj_p) = v15[3];
    if (filesec_set_property(v17, FILESEC_MODE, &obj_p))
    {
      CFStringRef v5 = @"NSPOSIXErrorDomain";
      v11 = 0;
      CFIndex v9 = *__error();
      v8 = &off_1ECF557A0;
      goto LABEL_45;
    }
    int v18 = *(_DWORD *)v15;
  }
  if ((v18 & 4) != 0)
  {
    if (filesec_set_property(v17, FILESEC_UUID, v15 + 4))
    {
      CFStringRef v5 = @"NSPOSIXErrorDomain";
      v11 = 0;
      CFIndex v9 = *__error();
      v8 = &off_1ECF557C8;
      goto LABEL_45;
    }
    int v18 = *(_DWORD *)v15;
  }
  if ((v18 & 8) != 0)
  {
    if (filesec_set_property(v17, FILESEC_GRPUUID, v15 + 6))
    {
      CFStringRef v5 = @"NSPOSIXErrorDomain";
      v11 = 0;
      CFIndex v9 = *__error();
      v8 = &off_1ECF557F0;
      goto LABEL_45;
    }
    int v18 = *(_DWORD *)v15;
  }
  if ((v18 & 0x20) == 0) {
    goto LABEL_36;
  }
  obj_p = 0;
  if (!memchr(v15 + 8, 0, size - 64))
  {
    v8 = &off_1ECF55818;
LABEL_43:
    CFIndex v9 = 4864;
    goto LABEL_44;
  }
  obj_p = acl_from_text((const char *)v15 + 64);
  if (!obj_p)
  {
    v8 = &off_1ECF55840;
    goto LABEL_43;
  }
  if (!filesec_set_property(v17, FILESEC_ACL, &obj_p))
  {
    acl_free(obj_p);
LABEL_36:
    v11 = -[__NSPlaceholderFileSecurity initWithFileSec:](self, "initWithFileSec:", v17, obj_p);
    v8 = &off_1ECF55688;
    CFIndex v9 = 4864;
    goto LABEL_45;
  }
  CFStringRef v5 = @"NSPOSIXErrorDomain";
  CFIndex v9 = *__error();
  v8 = &off_1ECF55868;
LABEL_44:
  v11 = 0;
LABEL_45:
  if (v15 != (void *)v21) {
    free(v15);
  }
  if (!v11)
  {
    if (v17) {
      filesec_free(v17);
    }
    goto LABEL_6;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  CFStringRef v5 = __CFLookUpClass("NSFileSecurity");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized FileSecurity object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFStringRef v5 = __CFLookUpClass("NSFileSecurity");
  uint64_t v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %@: method sent to an uninitialized FileSecurity object", v6);
  v8 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v7) userInfo:0];
  objc_exception_throw(v8);
}

@end
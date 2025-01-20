__CFString *_stringValueForPropertyDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  char *v6;
  int v7;
  int v8;
  unint64_t v9;
  UInt8 *v10;
  __CFString *v11;
  unint64_t v12;
  UInt8 *v13;
  char v14;
  unsigned char v16[2048];
  uint64_t v17;
  uint64_t vars8;

  v17 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = [v1 objectForKey:*MEMORY[0x263F174D8]];
  v3 = [v1 objectForKey:*MEMORY[0x263F174E0]];
  if (![v2 isEqualToString:*MEMORY[0x263F174F0]])
  {
    if (![v2 isEqualToString:*MEMORY[0x263F174E8]])
    {
      if ([v2 isEqualToString:*MEMORY[0x263F17508]])
      {
        v4 = [v3 absoluteString];
      }
      else
      {
        v4 = v3;
      }
      goto LABEL_17;
    }
    v5 = v3;
    v6 = (char *)[v5 bytes];
    v7 = [v5 length];
    v8 = v7;
    v9 = (3 * v7);
    if (v9 < 0x801)
    {
      v10 = v16;
    }
    else
    {
      v10 = (UInt8 *)malloc_type_malloc((3 * v7), 0x100004077774924uLL);
      if (!v10)
      {
        v11 = 0;
LABEL_15:

        goto LABEL_18;
      }
    }
    if (v8)
    {
      v12 = 0;
      do
      {
        v13 = &v10[v12];
        *v13 = a0123456789abcd[(unint64_t)*v6 >> 4];
        v14 = *v6++;
        v13[1] = a0123456789abcd[v14 & 0xF];
        v12 += 3;
        v13[2] = 32;
      }
      while (v12 < v9);
    }
    v11 = (__CFString *)CFStringCreateWithBytes(0, v10, v9, 0x600u, 0);
    if (v10 != v16) {
      free(v10);
    }
    goto LABEL_15;
  }
  v4 = [MEMORY[0x263F08790] localizedStringFromDate:v3 dateStyle:1 timeStyle:1];
LABEL_17:
  v11 = v4;
LABEL_18:

  return v11;
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B90](space, pattern, components);
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
}

uint64_t CGPatternCreateWithImage2()
{
  return MEMORY[0x270EE7118]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x270EFD748]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x270EFD780]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
}

uint64_t SecCertificateIsSelfSignedCA()
{
  return MEMORY[0x270EFD848]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

uint64_t SecTrustCopyDetailedPropertiesAtIndex()
{
  return MEMORY[0x270EFDD00]();
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x270EFDD70](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x270EFDD78](trust);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}
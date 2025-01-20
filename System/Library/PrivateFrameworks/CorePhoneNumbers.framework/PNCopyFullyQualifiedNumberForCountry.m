@interface PNCopyFullyQualifiedNumberForCountry
@end

@implementation PNCopyFullyQualifiedNumberForCountry

CFStringRef ___PNCopyFullyQualifiedNumberForCountry_block_invoke(uint64_t a1, const __CFString *a2)
{
  CFStringRef v3 = *(const __CFString **)(a1 + 32);
  if (!v3) {
    return 0;
  }
  CFStringRef v5 = 0;
  if (a2 && *(void *)(a1 + 40))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    *(_OWORD *)cStr = 0u;
    long long v11 = 0u;
    v6 = _PNCopyNormalized(v3);
    if (_PNDecomposeForCountry(v6, *(const __CFString **)(a1 + 40), (uint64_t)cStr, 1))
    {
      CFStringRef v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr[0], 0x8000100u);
      CFStringRef v8 = _PNCopyCountryCodeForInternationalCode(v7);
      if (CFStringCompare(a2, v8, 1uLL)) {
        CFStringRef v5 = 0;
      }
      else {
        CFStringRef v5 = _PNCopyAreaCodeForCountry(*(const __CFString **)(a1 + 32), a2);
      }
      CFRelease(v7);
      CFRelease(v8);
    }
    else
    {
      CFStringRef v5 = 0;
    }
    free(v6);
  }
  return v5;
}

@end
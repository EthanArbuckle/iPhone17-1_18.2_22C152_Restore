@interface FigHTTPRequestSessionNoteNativeConnectionForNSURLSession
@end

@implementation FigHTTPRequestSessionNoteNativeConnectionForNSURLSession

CFTypeRef ___FigHTTPRequestSessionNoteNativeConnectionForNSURLSession_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    CFTypeRef v3 = *(CFTypeRef *)(*(void *)(a1 + 40) + 40);
    if (result != v3)
    {
      if (!v3
        || (CFRelease(*(CFTypeRef *)(*(void *)(a1 + 40) + 40)),
            *(void *)(*(void *)(a1 + 40) + 40) = 0,
            (CFTypeRef result = *(CFTypeRef *)(a1 + 32)) != 0))
      {
        CFTypeRef result = CFRetain(result);
      }
      *(void *)(*(void *)(a1 + 40) + 40) = result;
    }
  }
  return result;
}

@end
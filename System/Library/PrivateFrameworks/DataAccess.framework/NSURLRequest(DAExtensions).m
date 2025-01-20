@interface NSURLRequest(DAExtensions)
- (id)DARequestByApplyingStorageSession:()DAExtensions;
@end

@implementation NSURLRequest(DAExtensions)

- (id)DARequestByApplyingStorageSession:()DAExtensions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = DALoggingwithCategory();
  os_log_type_t v6 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 7);
  if (os_log_type_enabled(v5, v6))
  {
    int v10 = 138412546;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    v13 = a1;
    _os_log_impl(&dword_1BA384000, v5, v6, "Applying storage session %@ to request %@", (uint8_t *)&v10, 0x16u);
  }

  [a1 _CFURLRequest];
  MutableCopy = (const void *)CFURLRequestCreateMutableCopy();
  _CFURLRequestSetStorageSession();
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) _initWithCFURLRequest:MutableCopy];
  CFRelease(MutableCopy);
  return v8;
}

@end
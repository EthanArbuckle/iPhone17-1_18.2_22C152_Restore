@interface CFPDDataBuffer
+ (id)newBufferFromCFData:(__CFData *)a3;
+ (id)newBufferFromFile:(int)a3 allowMappingIfSafe:(BOOL)a4;
+ (id)newBufferFromPropertyList:(void *)a3;
- (BOOL)beginAccessing;
- (BOOL)purgable;
- (BOOL)validatePlist;
- (__CFData)copyCFData;
- (id)copyXPCData;
- (unint64_t)length;
- (void)bytes;
- (void)copyPropertyListWithMutability:(unint64_t)a3 error:(__CFError *)a4;
- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(id)a3;
@end

@implementation CFPDDataBuffer

- (BOOL)validatePlist
{
  v6[1] = *(void *)off_1ECE0A5B0;
  CFDataRef v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)[(CFPDDataBuffer *)self bytes], [(CFPDDataBuffer *)self length], (CFAllocatorRef)&__kCFAllocatorNull);
  v6[0] = 0;
  char v3 = _CFPropertyListValidateData(v2, v6);
  if (v6[0] == 18) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

- (id)copyXPCData
{
  char v3 = [(CFPDDataBuffer *)self bytes];
  size_t v4 = [(CFPDDataBuffer *)self length];

  return xpc_data_create(v3, v4);
}

- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(id)a3
{
  if ([(CFPDDataBuffer *)self length] < 8
    || (v5 = [(CFPDDataBuffer *)self bytes], strncmp(v5, "bplist00", 8uLL)) && strncmp(v5, "<?xml", 5uLL))
  {
    (*((void (**)(id))a3 + 2))(a3);
    CFDataRef v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)[(CFPDDataBuffer *)self bytes], [(CFPDDataBuffer *)self length], (CFAllocatorRef)&__kCFAllocatorNull);
    if (os_variant_has_internal_diagnostics())
    {
      v7 = os_log_create("com.apple.defaults", "diagnostics");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CFPDDataBuffer quicklyValidatePlistAndOnFailureInvokeBlock:]((uint64_t)v6, v7);
      }
    }
    CFRelease(v6);
  }
}

+ (id)newBufferFromFile:(int)a3 allowMappingIfSafe:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  memset(&v8, 0, sizeof(v8));
  int v5 = fstat(a3, &v8);
  id result = 0;
  if (!v5 && v8.st_size >= 1)
  {
    v7 = [CFPDPurgeableBuffer alloc];
    return [(CFPDPurgeableBuffer *)v7 initWithFileDescriptor:v4 size:v8.st_size];
  }
  return result;
}

- (void)copyPropertyListWithMutability:(unint64_t)a3 error:(__CFError *)a4
{
  CFDataRef v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)[(CFPDDataBuffer *)self bytes], [(CFPDDataBuffer *)self length], (CFAllocatorRef)&__kCFAllocatorNull);
  CFPropertyListRef v7 = CFPropertyListCreateWithData((CFAllocatorRef)&__kCFAllocatorSystemDefault, v6, a3, 0, a4);
  CFRelease(v6);
  if (v7 && CFGetTypeID(v7) != 18)
  {
    stat v8 = _CFPrefsDaemonLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CFPDDataBuffer copyPropertyListWithMutability:error:](v8);
    }
    CFRelease(v7);
    CFPropertyListRef v7 = 0;
    if (a4) {
      *a4 = 0;
    }
  }
  return (void *)v7;
}

+ (id)newBufferFromPropertyList:(void *)a3
{
  uint64_t v4 = [CFPDPurgeableBuffer alloc];

  return [(CFPDPurgeableBuffer *)v4 initWithPropertyList:a3];
}

+ (id)newBufferFromCFData:(__CFData *)a3
{
  uint64_t v4 = [CFPDCFDataBuffer alloc];

  return [(CFPDCFDataBuffer *)v4 initWithCFData:a3];
}

- (void)bytes
{
}

- (unint64_t)length
{
}

- (__CFData)copyCFData
{
  char v3 = [(CFPDDataBuffer *)self bytes];
  CFIndex v4 = [(CFPDDataBuffer *)self length];

  return CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v3, v4);
}

- (BOOL)beginAccessing
{
  return 1;
}

- (BOOL)purgable
{
  return 0;
}

- (void)copyPropertyListWithMutability:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "Found non-dictionary property list, which is invalid for preferences. Ignoring it.", v1, 2u);
}

- (void)quicklyValidatePlistAndOnFailureInvokeBlock:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182B90000, a2, OS_LOG_TYPE_ERROR, "bad plist data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
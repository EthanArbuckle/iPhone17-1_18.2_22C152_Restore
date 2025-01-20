@interface NSThread(AppleMediaServices)
+ (id)ams_symbolicatedCallStackSymbols;
@end

@implementation NSThread(AppleMediaServices)

+ (id)ams_symbolicatedCallStackSymbols
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  v1 = 0;
  if ((CSIsNull() & 1) == 0)
  {
    mach_absolute_time();
    CSSymbolicatorGetArchitecture();
    int v2 = CSArchitectureIs64Bit();
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v17 = v0;
    id obj = v0;
    uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v22)
    {
      uint64_t v23 = 0;
      if (v2) {
        uint64_t v3 = 16;
      }
      else {
        uint64_t v3 = 8;
      }
      uint64_t v19 = *(void *)v27;
      uint64_t v20 = v3;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = [*(id *)(*((void *)&v26 + 1) + 8 * i) unsignedIntegerValue];
          CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
          CSSymbolicatorGetSymbolWithAddressAtTime();
          v25 = 0;
          uint64_t Range = CSSymbolGetRange();
          Name = (const char *)CSSymbolGetName();
          if (Name) {
            asprintf(&v25, " %s + %llu", Name, v5 - Range);
          }
          CSSymbolOwnerGetSourceInfoWithAddress();
          uint64_t Filename = CSSourceInfoGetFilename();
          v24 = 0;
          if (Filename)
          {
            v9 = (const char *)Filename;
            int LineNumber = CSSourceInfoGetLineNumber();
            asprintf(&v24, " (%s:%u)", v9, LineNumber);
          }
          uint64_t v11 = CSSymbolOwnerGetName();
          if (v11) {
            v12 = (const char *)v11;
          }
          else {
            v12 = "";
          }
          v14 = v24;
          v13 = v25;
          if (!v25) {
            v13 = "";
          }
          if (!v24) {
            v14 = "";
          }
          v15 = objc_msgSend(NSString, "stringWithFormat:", @"%-3d %-30s\t0x%0*llx%s%s\n", v23 + i, v12, v20, v5, v13, v14);
          if (v25) {
            free(v25);
          }
          if (v24) {
            free(v24);
          }
          [v21 appendString:v15];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        uint64_t v23 = (v23 + i);
      }
      while (v22);
    }

    v1 = (void *)[v21 copy];
    v0 = v17;
  }

  return v1;
}

@end
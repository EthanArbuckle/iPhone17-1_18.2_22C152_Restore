@interface NSError(SRReaderUnderlyingError)
+ (SRError)errorWithUnderlyingErrorFromExistingError:()SRReaderUnderlyingError;
@end

@implementation NSError(SRReaderUnderlyingError)

+ (SRError)errorWithUnderlyingErrorFromExistingError:()SRReaderUnderlyingError
{
  v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = (void *)[a3 domain];
  if ([v4 isEqualToString:SRErrorDomain])
  {
    uint64_t v5 = [v3 code];
    if (v5 == 8196)
    {
      v6 = +[SRError errorWithCode:8196];
    }
    else if (v5 == 8201)
    {
      v6 = +[SRError errorWithCode:8201];
      v7 = qword_26AB1A170;
      if (os_log_type_enabled((os_log_t)qword_26AB1A170, OS_LOG_TYPE_FAULT))
      {
        int v9 = 138543362;
        v10 = v3;
        _os_log_fault_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_FAULT, "Invalid authorization request. Requested services are already authorized: %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      v6 = 0;
    }
    return +[SRError errorWithCode:4 underlyingError:v6];
  }
  return (SRError *)v3;
}

@end
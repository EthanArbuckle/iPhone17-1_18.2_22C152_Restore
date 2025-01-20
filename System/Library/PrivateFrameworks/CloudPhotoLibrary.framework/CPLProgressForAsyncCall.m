@interface CPLProgressForAsyncCall
@end

@implementation CPLProgressForAsyncCall

void ___CPLProgressForAsyncCall_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v2 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "-[%@ %@] was cancelled by caller", (uint8_t *)&v5, 0x16u);
    }
  }
}

void ___CPLProgressForAsyncCall_block_invoke_0(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v2 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      v8 = v4;
      _os_log_impl(&dword_1B4CAC000, v2, OS_LOG_TYPE_DEFAULT, "-[%@ %@] was cancelled by caller", (uint8_t *)&v5, 0x16u);
    }
  }
}

@end
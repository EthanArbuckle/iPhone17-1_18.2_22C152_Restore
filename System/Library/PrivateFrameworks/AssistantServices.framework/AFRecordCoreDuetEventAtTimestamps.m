@interface AFRecordCoreDuetEventAtTimestamps
@end

@implementation AFRecordCoreDuetEventAtTimestamps

void ___AFRecordCoreDuetEventAtTimestamps_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = AFSiriLogContextEvent;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextEvent, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "_AFRecordCoreDuetEventAtTimestamps_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s Error recoding events: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

@end
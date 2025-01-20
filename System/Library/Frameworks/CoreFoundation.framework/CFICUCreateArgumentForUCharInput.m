@interface CFICUCreateArgumentForUCharInput
@end

@implementation CFICUCreateArgumentForUCharInput

void _____CFICUCreateArgumentForUCharInput_block_invoke(uint64_t a1)
{
  if (___CFICULoggingFD_block_invoke_tempBufferCount <= *(int *)(a1 + 32))
  {
    ___CFICULogWithArguments(1, &stru_1ECE10768);
    ___CFICULogWithArguments(1, @"UChar tempBuffer%ld[TEMP_BUFFER_SIZE];",
      ___CFICULoggingFD_block_invoke_tempBufferCount);
    ___CFICULogWithArguments(1, @"#define TEMP_UCHAR%ld(str) u_uastrncpy(tempBuffer%ld, str, TEMP_BUFFER_SIZE)", ___CFICULoggingFD_block_invoke_tempBufferCount, ___CFICULoggingFD_block_invoke_tempBufferCount);
    ___CFICULogWithArguments(1, &stru_1ECE10768);
    ++___CFICULoggingFD_block_invoke_tempBufferCount;
  }
}

@end
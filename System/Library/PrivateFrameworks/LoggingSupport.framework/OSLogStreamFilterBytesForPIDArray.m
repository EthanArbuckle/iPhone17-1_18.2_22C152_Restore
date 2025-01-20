@interface OSLogStreamFilterBytesForPIDArray
@end

@implementation OSLogStreamFilterBytesForPIDArray

uint64_t ___OSLogStreamFilterBytesForPIDArray_block_invoke(uint64_t a1, int a2, xpc_object_t xint)
{
  v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:xpc_int64_get_value(xint)];
  [v3 addProcessID:v4 flags:0 returningDict:0];

  return 1;
}

@end
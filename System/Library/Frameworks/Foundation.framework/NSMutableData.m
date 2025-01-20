@interface NSMutableData
@end

@implementation NSMutableData

uint64_t __40__NSMutableData_NSMutableData__setData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceBytesInRange:withBytes:", a3, a4, a2);
}

uint64_t __84__NSMutableData_NSMutableDataCompression___compressUsingCompressionAlgorithm_error___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    return [*(id *)(result + 32) setData:a2];
  }
  return result;
}

uint64_t __86__NSMutableData_NSMutableDataCompression___decompressUsingCompressionAlgorithm_error___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    return [*(id *)(result + 32) setData:a2];
  }
  return result;
}

@end
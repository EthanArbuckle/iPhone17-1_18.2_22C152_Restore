@interface NSData
@end

@implementation NSData

uint64_t __44__NSData_CertInfoAdditions__CertUIHexString__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = a4;
    uint64_t v7 = result;
    do
    {
      if (a3) {
        [*(id *)(v7 + 32) appendString:@" "];
      }
      result = objc_msgSend(*(id *)(v7 + 32), "appendFormat:", @"%02lx", *(unsigned __int8 *)(a2 + a3++));
      --v4;
    }
    while (v4);
  }
  return result;
}

@end
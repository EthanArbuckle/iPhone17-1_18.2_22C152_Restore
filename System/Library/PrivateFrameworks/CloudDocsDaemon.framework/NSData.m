@interface NSData
@end

@implementation NSData

void __57__NSData_BRCCryptographicAdditions__brc_generateBogusKey__block_invoke()
{
  uint64_t v2 = 0;
  uint64_t v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v2 length:8];
  v1 = (void *)brc_generateBogusKey_key;
  brc_generateBogusKey_key = v0;
}

@end
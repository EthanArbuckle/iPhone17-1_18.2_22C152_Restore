@interface NSString
@end

@implementation NSString

uint64_t __55__NSString_MCUtilities__MCSHA256DigestWithPasscodeSalt__block_invoke()
{
  MCSHA256DigestWithPasscodeSalt_salt = [MEMORY[0x1E4F1C9B8] dataWithBytes:&_block_invoke_saltBytes length:8];
  return MEMORY[0x1F41817F8]();
}

@end
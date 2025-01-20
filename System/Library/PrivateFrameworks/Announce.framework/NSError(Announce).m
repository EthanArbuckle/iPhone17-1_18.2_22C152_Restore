@interface NSError(Announce)
+ (uint64_t)an_errorWithCode:()Announce;
@end

@implementation NSError(Announce)

+ (uint64_t)an_errorWithCode:()Announce
{
  return objc_msgSend(MEMORY[0x263F087E8], "an_errorWithCode:component:", a3, 0);
}

@end
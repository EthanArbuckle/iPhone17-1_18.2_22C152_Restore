@interface NSURL
@end

@implementation NSURL

void __44__NSURL_DAVExtensions__initWithDirtyString___block_invoke()
{
  v0 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@";?:@&=+$,|"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)initWithDirtyString__allowedCharacterSet;
  initWithDirtyString__allowedCharacterSet = v1;
}

@end
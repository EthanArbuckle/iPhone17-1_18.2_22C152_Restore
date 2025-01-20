@interface SPURLQueryAllowedCharacterSet
@end

@implementation SPURLQueryAllowedCharacterSet

uint64_t __spUtils_SPURLQueryAllowedCharacterSet_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089C0]);
  v1 = (void *)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;
  spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet = (uint64_t)v0;

  v2 = (void *)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;
  v3 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  v4 = (void *)spUtils_SPURLQueryAllowedCharacterSet__spURLQueryAllowedCharacterSet;

  return [v4 removeCharactersInString:@"="];
}

@end
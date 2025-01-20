@interface NSDictionary(BLTSizeOf)
- (uint64_t)blt_sizeof;
@end

@implementation NSDictionary(BLTSizeOf)

- (uint64_t)blt_sizeof
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  size_t v8 = 0;
  size_t v8 = malloc_size(a1);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__NSDictionary_BLTSizeOf__blt_sizeof__block_invoke;
  v4[3] = &unk_264685920;
  v4[4] = &v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end
@interface NSDictionary(HPSAdditions)
- (id)hps_dictionarySwappingKeysWithValues;
@end

@implementation NSDictionary(HPSAdditions)

- (id)hps_dictionarySwappingKeysWithValues
{
  v2 = objc_opt_new();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NSDictionary_HPSAdditions__hps_dictionarySwappingKeysWithValues__block_invoke;
  v6[3] = &unk_264E896C8;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
  v4 = (void *)[v3 copy];

  return v4;
}

@end
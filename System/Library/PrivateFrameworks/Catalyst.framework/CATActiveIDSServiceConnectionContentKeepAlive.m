@interface CATActiveIDSServiceConnectionContentKeepAlive
+ (id)instanceWithDictionary:(id)a3;
- (NSDictionary)dictionaryValue;
- (int64_t)contentType;
@end

@implementation CATActiveIDSServiceConnectionContentKeepAlive

- (int64_t)contentType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

+ (id)instanceWithDictionary:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

@end
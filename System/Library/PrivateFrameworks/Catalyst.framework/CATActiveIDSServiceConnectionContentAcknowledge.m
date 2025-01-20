@interface CATActiveIDSServiceConnectionContentAcknowledge
+ (id)instanceWithDictionary:(id)a3;
- (NSDictionary)dictionaryValue;
- (int64_t)contentType;
@end

@implementation CATActiveIDSServiceConnectionContentAcknowledge

- (int64_t)contentType
{
  return 3;
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
@interface NSDictionary(JSONConformance)
- (id)crk_JSONRepresentationWithPrettyPrinting:()JSONConformance sortKeys:;
@end

@implementation NSDictionary(JSONConformance)

- (id)crk_JSONRepresentationWithPrettyPrinting:()JSONConformance sortKeys:
{
  v6 = +[CRKJSONConverter JSONDictionaryForDictionary:a1];
  v7 = JSONStringRepresentation((uint64_t)v6, a3, a4);

  return v7;
}

@end
@interface INCodableEnumAttributeRelationshipValueTransformer
@end

@implementation INCodableEnumAttributeRelationshipValueTransformer

BOOL __79___INCodableEnumAttributeRelationshipValueTransformer__transformedNumberValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 index];
  return v3 == [*(id *)(a1 + 32) integerValue];
}

uint64_t __79___INCodableEnumAttributeRelationshipValueTransformer__transformedStringValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end
@interface SAHAIdentifierListFilter(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAIdentifierListFilter(HMLogging)

- (id)hm_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = (void *)*MEMORY[0x1E4F97028];
  v4 = [a1 identifiers];
  appendToShortDescription(v2, v3, v4);

  return v2;
}

@end
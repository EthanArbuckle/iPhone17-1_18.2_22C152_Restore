@interface PLImageFormat(PHAdoptionUtilities)
- (uint64_t)contentMode;
- (uint64_t)sizeWithFallBackSize:()PHAdoptionUtilities;
@end

@implementation PLImageFormat(PHAdoptionUtilities)

- (uint64_t)sizeWithFallBackSize:()PHAdoptionUtilities
{
  return [a1 size];
}

- (uint64_t)contentMode
{
  return [a1 dimensionsReferToShortSide];
}

@end
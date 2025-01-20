@interface NSSortDescriptor(MPMediaLibraryEntityTranslatorAdditions)
- (uint64_t)_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering;
@end

@implementation NSSortDescriptor(MPMediaLibraryEntityTranslatorAdditions)

- (uint64_t)_MPMediaLibraryEntityTranslator_MLCoreSortDescriptorOrdering
{
  return [a1 ascending] ^ 1;
}

@end
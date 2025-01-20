@interface CSVisualizerPredicate
@end

@implementation CSVisualizerPredicate

void __80___CSVisualizerPredicate_getRanges_inDescription_options_limit_searchedInRange___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$HAYSTACK LIKE[cd] $NEEDLE"];
  v1 = (void *)-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate;
  -[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::likePredicate = v0;

  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$HAYSTACK MATCHES[cd] $NEEDLE"];
  v3 = (void *)-[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate;
  -[_CSVisualizerPredicate getRanges:inDescription:options:limit:searchedInRange:]::matchesPredicate = v2;
}

@end
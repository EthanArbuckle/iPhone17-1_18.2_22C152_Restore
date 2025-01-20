@interface INParameterCombinationsWithDictionary
@end

@implementation INParameterCombinationsWithDictionary

uint64_t ___INParameterCombinationsWithDictionary_block_invoke()
{
  _INParameterCombinationsWithDictionary_predicate = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.length > 0"];

  return MEMORY[0x1F41817F8]();
}

@end
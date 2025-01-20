@interface NotPatternSet
@end

@implementation NotPatternSet

id ___NotPatternSet_block_invoke()
{
  if (qword_1EB1ECB60 != -1) {
    dispatch_once(&qword_1EB1ECB60, &__block_literal_global_7);
  }
  id result = (id)[(id)_MergedGlobals_5 invertedSet];
  qword_1EB1ECB68 = (uint64_t)result;
  return result;
}

@end
@interface NLStringTokenizerCopyPossibleStringLanguages
@end

@implementation NLStringTokenizerCopyPossibleStringLanguages

void ___NLStringTokenizerCopyPossibleStringLanguages_block_invoke()
{
}

__CFArray *___NLStringTokenizerCopyPossibleStringLanguages_block_invoke_2(uint64_t a1)
{
  result = CoreNLP::NLLangid::copyPossibleLanguageStrings((int **)_NLStringTokenizerCopyPossibleStringLanguages::nlLangid, *(const __CFString **)(a1 + 40), *(CFRange *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
@interface NSLexiconIterateFormsOfWord
@end

@implementation NSLexiconIterateFormsOfWord

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) lowercaseStringWithLocale:*(void *)(a1 + 40)];
    return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return result;
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) uppercaseStringWithLocale:*(void *)(a1 + 40)];
    return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return result;
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) capitalizedStringWithLocale:*(void *)(a1 + 40)];
    return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return result;
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 lowercaseStringWithLocale:*(void *)(a1 + 32)];
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 uppercaseStringWithLocale:*(void *)(a1 + 32)];
}

uint64_t ___NSLexiconIterateFormsOfWord_block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 capitalizedStringWithLocale:*(void *)(a1 + 32)];
}

@end
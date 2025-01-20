@interface UTGetActiveTypeForIdentifier
@end

@implementation UTGetActiveTypeForIdentifier

uint64_t ___UTGetActiveTypeForIdentifier_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>((void *)(a2 + 240), (unsigned int *)(a1 + 56));
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(_DWORD *)(result + 20);
    uint64_t result = CSStoreGetUnit();
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

uint64_t ___UTGetActiveTypeForIdentifier_block_invoke_2(uint64_t result, uint64_t a2, int a3, uint64_t a4, unsigned char *a5)
{
  if (*(unsigned char *)(a4 + 8))
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a4;
    *a5 = 1;
  }
  return result;
}

void *___UTGetActiveTypeForIdentifier_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int const&,unsigned int &>(a2 + 240, (unsigned int *)(a1 + 40), (_DWORD *)(a1 + 40), (int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

@end
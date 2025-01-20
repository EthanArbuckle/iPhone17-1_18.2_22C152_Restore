@interface CTServerConnectionRegisterForEvent
@end

@implementation CTServerConnectionRegisterForEvent

void ___CTServerConnectionRegisterForEvent_block_invoke(uint64_t a1)
{
  v2 = *(const void **)(a1 + 32);
  if (v2) {
    v3 = (uint64_t *)_Block_copy(v2);
  }
  else {
    v3 = 0;
  }
  v4 = (uint64_t **)(*(void *)(a1 + 40) + 32);
  v7 = (_DWORD *)(a1 + 48);
  v5 = std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(__CFDictionary const*)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(__CFDictionary const*)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(__CFDictionary const*)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, (int *)(a1 + 48), (uint64_t)&std::piecewise_construct, &v7);
  v6 = v5[5];
  v5[5] = v3;
  if (v6) {
    _Block_release(v6);
  }
}

@end
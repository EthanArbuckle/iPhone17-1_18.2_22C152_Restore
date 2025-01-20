@interface CSArrayCreate
@end

@implementation CSArrayCreate

unint64_t ___CSArrayCreate_block_invoke@<X0>(uint64_t a1@<X0>, CSStore2::Store *a2@<X1>, CSStore2::Array *a3@<X8>)
{
  return CSStore2::Array::_Create(a3, a2, 0, *(const unsigned int **)(a1 + 32), *(_DWORD *)(a1 + 40));
}

@end
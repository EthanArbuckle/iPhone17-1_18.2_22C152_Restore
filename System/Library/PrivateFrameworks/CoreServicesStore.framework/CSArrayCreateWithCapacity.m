@interface CSArrayCreateWithCapacity
@end

@implementation CSArrayCreateWithCapacity

unint64_t ___CSArrayCreateWithCapacity_block_invoke@<X0>(uint64_t a1@<X0>, CSStore2::Store *a2@<X1>, CSStore2::Array *a3@<X8>)
{
  return CSStore2::Array::_Create(a3, a2, *(_DWORD *)(a1 + 32), 0, 0);
}

@end
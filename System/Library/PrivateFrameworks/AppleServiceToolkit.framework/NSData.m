@interface NSData
@end

@implementation NSData

uint64_t __32__NSData_GZip__dataGZipDeflated__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  do
  {
    do
    {
      [*(id *)(a1 + 32) _resizeOutputBuffer:*(void *)(a1 + 40) forStream:v5 + 32];
      uint64_t result = deflate((z_streamp)(*(void *)(*(void *)(a1 + 48) + 8) + 32), 0);
      uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    while (!*(_DWORD *)(v5 + 64));
  }
  while (*(_DWORD *)(v5 + 40));
  return result;
}

@end
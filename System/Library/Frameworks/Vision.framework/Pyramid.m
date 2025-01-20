@interface Pyramid
@end

@implementation Pyramid

unsigned __int8 *__Pyramid_loadImage_block_invoke(unsigned __int8 *result, uint64_t a2, uint64_t a3, int a4, int a5)
{
  v9 = result;
  v10 = (unsigned __int16 *)*((void *)result + 4);
  unint64_t v11 = *v10;
  if (*v10)
  {
    result = filterSubsampling1channel((unsigned __int8 *)(*(void *)&v10[4 * v11 + 8] + *(void *)(a3 + 8 * v11)), *(void *)&v10[4 * v11 + 168], *(void *)(a2 + 8 * v11), *(void *)&v10[4 * v11 + 88], a4, a5, *((void *)result + 5) + *(void *)(a3 + 8 * (v11 - 1)), *((void *)result + 6), *((_DWORD *)result + 14), *((_DWORD *)result + 15));
    v10 = (unsigned __int16 *)*((void *)v9 + 4);
  }
  if (v11 < v10[1])
  {
    uint64_t v12 = 8 * v11 + 176;
    uint64_t v13 = a2 + 8;
    uint64_t v14 = a3 + 8;
    do
    {
      ++v11;
      v15 = (char *)v10 + v12;
      result = filterSubsampling1channel((unsigned __int8 *)(*((void *)v15 - 19) + *(void *)(v14 + v12 - 176)), *((void *)v15 + 21), *(void *)(v13 + v12 - 176), *((void *)v15 + 1), a4, a5, *((void *)v15 - 20) + *(void *)(v14 + v12 - 184), *(void *)v15, a4, a5);
      v10 = (unsigned __int16 *)*((void *)v9 + 4);
      v12 += 8;
    }
    while (v11 < v10[1]);
  }
  return result;
}

uint64_t __Pyramid_loadImage_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) + 496, *(void *)(a1 + 40) + 656, *(unsigned __int16 *)(*(void *)(a1 + 40) + 8), *(unsigned __int16 *)(*(void *)(a1 + 40) + 8));
}

uint64_t __Pyramid_loadImage_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) + 576, *(void *)(a1 + 40) + 736, *(unsigned __int16 *)(*(void *)(a1 + 40) + 8), 0);
}

@end
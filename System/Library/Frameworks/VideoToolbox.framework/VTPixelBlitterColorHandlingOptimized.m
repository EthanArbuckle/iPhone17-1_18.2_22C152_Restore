@interface VTPixelBlitterColorHandlingOptimized
@end

@implementation VTPixelBlitterColorHandlingOptimized

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a2 + 4);
  return 1;
}

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  CGColorTRCGetFunction();
  *(void *)(a1[10] + ((unint64_t)*(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24) << 7)) = 0;
  uint64_t v5 = a1[10];
  *(void *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24) << 7) + 24) = 0;
  *(_DWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24) << 7) + 32) = 0;
  *(void *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24) << 7) + 36) = 0;
  *(_DWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24) << 7) + 44) = 0;
  *(_DWORD *)(v5 + ((unint64_t)*(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24) << 7) + 48) = 0;
  if (a3)
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24) - 1 == a3) {
      uint64_t v6 = a1[7];
    }
    else {
      uint64_t v6 = a1[8];
    }
  }
  else
  {
    uint64_t v6 = a1[5];
  }
  *(unsigned char *)(*(void *)(v6 + 8) + 24) = 1;
  *(void *)(a1[10] + ((unint64_t)(*(unsigned char *)(*(void *)(a1[4] + 8) + 24))++ << 7)) = vtptsPixelOpTrcType0;
  return 1;
}

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke_3(uint64_t a1)
{
  CGColorMatrixGetMatrix();
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    *(_DWORD *)(v2 + 72) = 0;
    *(_OWORD *)(v2 + 76) = 0uLL;
    *(_DWORD *)(v2 + 92) = 0;
    *(void *)(v2 + 96) = 0;
    *(_DWORD *)(v2 + 104) = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v3 + 24) = 1;
  return 1;
}

uint64_t __VTPixelBlitterColorHandlingOptimized_setup_block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return 1;
}

@end
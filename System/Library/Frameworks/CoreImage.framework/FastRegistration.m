@interface FastRegistration
@end

@implementation FastRegistration

uint64_t __FastRegistration_computeSignatures_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 60))
  {
    result = FastRegistration_processProjections(*(void *)(*(void *)(result + 48) + 32), *(void *)(*(void *)(result + 48) + 40));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24))
  {
    if (*(_DWORD *)(v1 + 56))
    {
      result = Projections_computeMeanStdTable(*(float **)(*(void *)(v1 + 48) + 32), *(_DWORD *)(*(void *)(v1 + 48) + 40), (void *)(*(void *)(v1 + 48) + 48));
      *(_DWORD *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __FastRegistration_computeSignatures_block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 60))
  {
    result = FastRegistration_processProjections(**(void **)(result + 48), *(void *)(*(void *)(result + 48) + 8));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24))
  {
    if (*(_DWORD *)(v1 + 56))
    {
      result = Projections_computeMeanStdTable(**(float ***)(v1 + 48), *(_DWORD *)(*(void *)(v1 + 48) + 8), (void *)(*(void *)(v1 + 48) + 16));
      *(_DWORD *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __FastRegistration_register_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  STACK[0x19878] = *MEMORY[0x1E4F143B8];
  uint64_t result = Projections_computeShiftBruteForce(*(void *)(*(void *)(a1 + 40) + 32), *(_DWORD *)(*(void *)(a1 + 40) + 40), (void *)(*(void *)(a1 + 40) + 48), *(void *)(*(void *)(a1 + 48) + 32), *(_DWORD *)(*(void *)(a1 + 48) + 40), (void *)(*(void *)(a1 + 48) + 48), *(_DWORD *)(a1 + 72), (float *)&STACK[0x13260], 0.0, (float *)&a9, *(float **)(a1 + 56), *(float **)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __FastRegistration_register_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  STACK[0x19878] = *MEMORY[0x1E4F143B8];
  uint64_t result = Projections_computeShiftBruteForce(**(void **)(a1 + 40), *(_DWORD *)(*(void *)(a1 + 40) + 8), (void *)(*(void *)(a1 + 40) + 16), **(void **)(a1 + 48), *(_DWORD *)(*(void *)(a1 + 48) + 8), (void *)(*(void *)(a1 + 48) + 16), *(_DWORD *)(a1 + 72), (float *)&STACK[0x13260], 0.0, (float *)&a9, *(float **)(a1 + 56), *(float **)(a1 + 64));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
@interface GEOLocationShiftLocation
@end

@implementation GEOLocationShiftLocation

uint64_t __93___GEOLocationShiftLocation_performCompletionHandlerWithShiftedCoordinate_accuracy_function___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  if (v3)
  {
    (*(void (**)(double, double, double))(v3 + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = *(void *)(v2 + 56);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __49___GEOLocationShiftLocation_performErrorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

uint64_t __51___GEOLocationShiftLocation_performMustGoToNetwork__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

@end
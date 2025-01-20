@interface NSDate
@end

@implementation NSDate

void __66__NSDate_TimeManipulationForTesting__test_beginManipulationOfTime__block_invoke(uint64_t a1)
{
  if (timeManipulationIsAllowed == 1)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"NSDate+TimeManipulationForTesting.m" lineNumber:45 description:@"Time manipulation is allowed already"];
  }
  swapMethodImplementations();
  timeManipulationIsAllowed = 1;
}

void __64__NSDate_TimeManipulationForTesting__test_endManipulationOfTime__block_invoke(uint64_t a1)
{
  if ((timeManipulationIsAllowed & 1) == 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    [v2 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"NSDate+TimeManipulationForTesting.m" lineNumber:56 description:@"Time manipulation is not allowed"];
  }
  swapMethodImplementations();
  timeManipulationIsAllowed = 0;
}

void __58__NSDate_TimeManipulationForTesting__test_setCurrentDate___block_invoke(void *a1)
{
  if ((timeManipulationIsAllowed & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[5] object:a1[6] file:@"NSDate+TimeManipulationForTesting.m" lineNumber:65 description:@"Time manipulation is not allowed"];
  }
  v2 = (void *)a1[4];

  objc_storeStrong((id *)&currentDate, v2);
}

uint64_t __77__NSDate_TimeManipulationForTesting__test_adjustCurrentDateWithTimeInterval___block_invoke(uint64_t a1)
{
  if ((timeManipulationIsAllowed & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"NSDate+TimeManipulationForTesting.m" lineNumber:73 description:@"Time manipulation is not allowed"];
  }
  uint64_t v2 = [(id)currentDate dateByAddingTimeInterval:*(double *)(a1 + 48)];
  uint64_t v3 = currentDate;
  currentDate = v2;

  return MEMORY[0x1F41817F8](v2, v3);
}

void __46__NSDate_TimeManipulationForTesting___atx_now__block_invoke(uint64_t a1)
{
}

void __47__NSDate_TimeManipulationForTesting___atx_date__block_invoke(uint64_t a1)
{
}

uint64_t __72__NSDate_TimeManipulationForTesting___atx_dateWithTimeIntervalSinceNow___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)currentDate dateByAddingTimeInterval:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __73__NSDate_TimeManipulationForTesting___atx_timeIntervalSinceReferenceDate__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)currentDate timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

uint64_t __63__NSDate_TimeManipulationForTesting___atx_timeIntervalSinceNow__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) timeIntervalSinceDate:currentDate];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

@end
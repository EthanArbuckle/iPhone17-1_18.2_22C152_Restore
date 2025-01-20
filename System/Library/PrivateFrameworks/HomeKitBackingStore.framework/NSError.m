@interface NSError
@end

@implementation NSError

uint64_t __62__NSError_HMB___hmbIsCKErrorOrHasPartialFailurePassingFilter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _hmbIsCKErrorOrHasPartialFailurePassingFilter:*(void *)(a1 + 32)];
}

uint64_t __57__NSError_HMB___hmbIsCKErrorOrHasPartialFailureWithCode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _hmbIsCKErrorWithCode:*(void *)(a1 + 32)];
}

uint64_t __39__NSError_HMB__hmbIsCKZoneDeletedError__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (([v2 _hmbIsCKErrorWithCode:26] & 1) != 0
    || ([v2 _hmbIsCKErrorWithCode:28] & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 _hmbHasCKUnderlyingErrorWithCode:2036];
  }

  return v3;
}

@end
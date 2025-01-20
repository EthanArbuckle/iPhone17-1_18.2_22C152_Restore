@interface NSISLinearExpressionObservable
@end

@implementation NSISLinearExpressionObservable

uint64_t __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40);
  if (v1)
  {
    *(unsigned char *)(v1 + 80) = 1;
    result = _NSConstraintBasedLayoutVariableChangeTransactions();
    if ((result & 1) == 0)
    {
      return -[_NSISLinearExpressionObservable emitValueIfNeeded](v1);
    }
  }
  return result;
}

uint64_t __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 BOOLValue];
  if (result)
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return -[_NSISLinearExpressionObservable emitValueIfNeeded](v4);
  }
  return result;
}

@end
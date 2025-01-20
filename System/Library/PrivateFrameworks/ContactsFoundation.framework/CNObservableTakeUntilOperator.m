@interface CNObservableTakeUntilOperator
@end

@implementation CNObservableTakeUntilOperator

void __44___CNObservableTakeUntilOperator_subscribe___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

@end
@interface CNObservableResultEvent
@end

@implementation CNObservableResultEvent

BOOL __36___CNObservableResultEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) value];
  v3 = [*(id *)(a1 + 40) value];
  BOOL v4 = +[CNEqualsBuilder isObject:v2 equalToOther:v3];

  return v4;
}

unint64_t __32___CNObservableResultEvent_hash__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) value];
  unint64_t v2 = +[CNHashBuilder objectHash:v1];

  return v2;
}

@end
@interface NSConcreteObservation
@end

@implementation NSConcreteObservation

void __38___NSConcreteObservation__receiveBox___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, *(void **)(a1 + 32), 0);
  [v3 _receiveBox:a2];
}

@end
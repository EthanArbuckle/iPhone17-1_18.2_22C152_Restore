@interface _NSConcreteObservation
- (BOOL)isEqual:(id)a3;
- (_NSConcreteObservation)initWithObservable:(id)a3 observer:(id)a4;
- (id)debugDescription;
- (void)_observerStorageOfSize:(unint64_t)a3;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)finishObserving;
- (void)remove;
@end

@implementation _NSConcreteObservation

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 && (NSObservable *)*((void *)a3 + 1) == self->_LHSobservable) {
    return (NSObserver *)*((void *)a3 + 2) == self->_RHSobserver;
  }
  return 0;
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:@"%@(%p) (%@ => %@)", objc_opt_class(), self, [(NSObservable *)self->_LHSobservable debugDescription], [(NSObserver *)self->_RHSobserver debugDescription]];
}

- (_NSConcreteObservation)initWithObservable:(id)a3 observer:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_NSConcreteObservation;
  v6 = [(_NSConcreteObservation *)&v10 init];
  if (v6)
  {
    v6->_RHSobserver = (NSObserver *)a4;
    v6->_LHSobservable = (NSObservable *)a3;
    if ([(NSObserver *)v6->_RHSobserver conformsToProtocol:&unk_1ECACD308]) {
      [(NSObserver *)v6->_RHSobserver setObservation:v6];
    }
    if ([(_NSConcreteObservation *)v6 conformsToProtocol:&unk_1ECACB590])
    {
      if (([(NSObserver *)v6->_RHSobserver conformsToProtocol:&unk_1ECACB590] & 1) == 0) {
        __assert_rtn("-[_NSConcreteObservation initWithObservable:observer:]", "NSObserving.m", 113, "[_RHSobserver conformsToProtocol:@protocol(NSObservable)]");
      }
      v7 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, v6->_RHSobserver, 1);
      v8 = v7;
      if (v7) {
        addObserver((uint64_t)v7, v6);
      }
    }
  }
  return v6;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  if (a3 != 32) {
    __assert_rtn("-[_NSConcreteObservation _observerStorageOfSize:]", "NSObserving.m", 126, "sz == 4 * sizeof(id)");
  }
  return self->_observers;
}

- (void)remove
{
  LHSobservable = self->_LHSobservable;
  if (LHSobservable)
  {
    v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, LHSobservable, 0);
    if (v4)
    {
      v5 = v4;
      removeObservation((uint64_t)v4, (uint64_t)self->_RHSobserver);
      v4 = v5;
    }
  }
}

- (void)finishObserving
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_NSConcreteObservation *)self remove];
  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteObservation;
  [(_NSConcreteObservation *)&v3 finishObserving];
}

- (void)_receiveBox:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ((NSObserver *)*((void *)a3 + 2) == self->_RHSobserver)
  {
    uint64_t v5 = *((void *)a3 + 1);
    int v6 = *((_DWORD *)a3 + 6);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v13 = __38___NSConcreteObservation__receiveBox___block_invoke;
    v14 = &unk_1E51F76A8;
    v15 = self;
    v16[0] = 0;
    uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v16);
    MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
    objc_super v10 = objc_constructInstance(v9, (char *)&v12[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
    v10[6] = v6;
    *((void *)v10 + 1) = v5;
    *((void *)v10 + 2) = self;
    v13((uint64_t)v12, (uint64_t)v10);
  }
  else
  {
    LHSobservable = self->_LHSobservable;
    -[NSObservable _receiveBox:](LHSobservable, "_receiveBox:");
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(_NSConcreteObservation *)self remove];

  [(_NSConcreteObservation *)self _destroyObserverList];
  v3.receiver = self;
  v3.super_class = (Class)_NSConcreteObservation;
  [(_NSConcreteObservation *)&v3 dealloc];
}

@end
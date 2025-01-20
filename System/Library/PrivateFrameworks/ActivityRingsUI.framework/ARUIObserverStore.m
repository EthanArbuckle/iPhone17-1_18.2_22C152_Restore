@interface ARUIObserverStore
- (ARUIObserverStore)init;
- (unint64_t)count;
- (void)addObserver:(id)a3;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation ARUIObserverStore

- (void)enumerateObserversWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  [(NSPointerArray *)self->_observers compact];
  v5 = [(NSPointerArray *)self->_observers allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(void *)(*((void *)&v10 + 1) + 8 * v9)) {
          v4[2](v4);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)count
{
  [(NSPointerArray *)self->_observers compact];
  observers = self->_observers;

  return [(NSPointerArray *)observers count];
}

- (void)addObserver:(id)a3
{
}

- (ARUIObserverStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARUIObserverStore;
  v2 = [(ARUIObserverStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;
  }
  return v2;
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  if ([(NSPointerArray *)self->_observers count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [(NSPointerArray *)self->_observers pointerAtIndex:v4];
      if (v5 == v6) {
        break;
      }

      if (++v4 >= [(NSPointerArray *)self->_observers count]) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_observers replacePointerAtIndex:v4 withPointer:0];
  }
LABEL_7:
  [(NSPointerArray *)self->_observers compact];
}

- (void).cxx_destruct
{
}

@end
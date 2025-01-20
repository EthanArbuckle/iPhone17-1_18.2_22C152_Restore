@interface _FMKeyValueObserverProxy
- (NSString)keyPath;
- (_FMKeyValueObserverProxy)initWithWeakObserver:(id)a3 observedObject:(id)a4 keyPath:(id)a5 options:(unint64_t)a6 observerBlock:(id)a7;
- (id)observedObject;
- (id)observerBlock;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _FMKeyValueObserverProxy

- (_FMKeyValueObserverProxy)initWithWeakObserver:(id)a3 observedObject:(id)a4 keyPath:(id)a5 options:(unint64_t)a6 observerBlock:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)_FMKeyValueObserverProxy;
  v15 = [(_FMObserverProxy *)&v20 initWithWeakObserver:a3];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_observedObject, v12);
    objc_storeStrong((id *)&v16->_keyPath, a5);
    uint64_t v17 = MEMORY[0x1B3EB3F00](v14);
    id observerBlock = v16->_observerBlock;
    v16->_id observerBlock = (id)v17;

    v16->_isObserving = 1;
    [v12 addObserver:v16 forKeyPath:v13 options:a6 context:0];
  }

  return v16;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if ([(_FMObserverProxy *)self isValid])
  {
    v7 = [(_FMObserverProxy *)self weakObserver];
    (*((void (**)(void))self->_observerBlock + 2))();
  }
}

- (void)invalidate
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    id WeakRetained = objc_loadWeakRetained(&self->_observedObject);
    [WeakRetained removeObserver:self forKeyPath:self->_keyPath];
  }
  v4.receiver = self;
  v4.super_class = (Class)_FMKeyValueObserverProxy;
  [(_FMObserverProxy *)&v4 invalidate];
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (id)observedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_observedObject);
  return WeakRetained;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak(&self->_observedObject);
  objc_storeStrong(&self->_observerBlock, 0);
}

@end
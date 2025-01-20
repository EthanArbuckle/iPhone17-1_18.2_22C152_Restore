@interface MPKeyValueObserver
- (MPKeyValueObserver)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 handler:(id)a6;
- (NSString)keyPath;
- (id)handler;
- (id)object;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation MPKeyValueObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_destroyWeak(&self->_object);
}

- (id)handler
{
  return self->_handler;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)MPKeyValueObserverContext == a6)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_object);
    if (WeakRetained == v11)
    {
      int v14 = [v10 isEqualToString:self->_keyPath];

      if (v14) {
        (*((void (**)(void))self->_handler + 2))();
      }
    }
    else
    {
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MPKeyValueObserver;
    [(MPKeyValueObserver *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  [WeakRetained removeObserver:self forKeyPath:self->_keyPath context:MPKeyValueObserverContext];

  v4.receiver = self;
  v4.super_class = (Class)MPKeyValueObserver;
  [(MPKeyValueObserver *)&v4 dealloc];
}

- (MPKeyValueObserver)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MPKeyValueObserver;
  v13 = [(MPKeyValueObserver *)&v20 init];
  int v14 = v13;
  if (v13)
  {
    objc_storeWeak(&v13->_object, v10);
    uint64_t v15 = [v11 copy];
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v15;

    uint64_t v17 = MEMORY[0x19971E0F0](v12);
    id handler = v14->_handler;
    v14->_id handler = (id)v17;

    [v10 addObserver:v14 forKeyPath:v11 options:a5 context:MPKeyValueObserverContext];
  }

  return v14;
}

@end
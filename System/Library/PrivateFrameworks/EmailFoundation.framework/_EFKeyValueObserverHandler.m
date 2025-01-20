@interface _EFKeyValueObserverHandler
- (_EFKeyValueObserverHandler)initWithObject:(id)a3 keyPath:(id)a4 usingBlock:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startObservingWithOptions:(unint64_t)a3;
@end

@implementation _EFKeyValueObserverHandler

- (void)startObservingWithOptions:(unint64_t)a3
{
  self->_observing = 1;
}

- (_EFKeyValueObserverHandler)initWithObject:(id)a3 keyPath:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_EFKeyValueObserverHandler;
  v11 = [(_EFKeyValueObserverHandler *)&v19 init];
  v12 = v11;
  if (v11)
  {
    v11->_object = v8;
    uint64_t v13 = [v9 copy];
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    id block = v12->_block;
    v12->_id block = (id)v15;

    v17 = v12;
  }

  return v12;
}

- (void)dealloc
{
  [(_EFKeyValueObserverHandler *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)_EFKeyValueObserverHandler;
  [(_EFKeyValueObserverHandler *)&v3 dealloc];
}

- (void)cancel
{
  if (self->_observing)
  {
    [self->_object removeObserver:self forKeyPath:self->_keyPath context:sHandlerContext];
    self->_observing = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)sHandlerContext == a6)
  {
    (*((void (**)(void))self->_block + 2))();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_EFKeyValueObserverHandler;
    [(_EFKeyValueObserverHandler *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

@end
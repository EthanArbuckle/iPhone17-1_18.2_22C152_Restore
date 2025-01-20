@interface _AMSKeyValueObservable
- (BOOL)cancel;
- (BOOL)sendCompletion;
- (NSObject)context;
- (NSObject)object;
- (NSString)keyPath;
- (_AMSKeyValueObservable)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContext:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation _AMSKeyValueObservable

- (_AMSKeyValueObservable)initWithObject:(id)a3 keyPath:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_AMSKeyValueObservable;
  v10 = [(AMSObservable *)&v17 initWithObserver:0];
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    context = v10->_context;
    v10->_context = v11;

    uint64_t v13 = [v9 copy];
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v13;

    id v15 = objc_storeWeak((id *)&v10->_object, v8);
    [v8 addObserver:v10 forKeyPath:v10->_keyPath options:a5 context:v10->_context];
  }
  return v10;
}

- (BOOL)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)_AMSKeyValueObservable;
  BOOL v3 = [(AMSObservable *)&v8 cancel];
  if (v3)
  {
    v4 = [(_AMSKeyValueObservable *)self object];
    v5 = [(_AMSKeyValueObservable *)self keyPath];
    v6 = [(_AMSKeyValueObservable *)self context];
    [v4 removeObserver:self forKeyPath:v5 context:v6];
  }
  return v3;
}

- (BOOL)sendCompletion
{
  v8.receiver = self;
  v8.super_class = (Class)_AMSKeyValueObservable;
  BOOL v3 = [(AMSObservable *)&v8 sendCompletion];
  if (v3)
  {
    v4 = [(_AMSKeyValueObservable *)self object];
    v5 = [(_AMSKeyValueObservable *)self keyPath];
    v6 = [(_AMSKeyValueObservable *)self context];
    [v4 removeObserver:self forKeyPath:v5 context:v6];
  }
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(_AMSKeyValueObservable *)self context];

  if (v13 == a6)
  {
    [(AMSObservable *)self sendResult:v12];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_AMSKeyValueObservable;
    [(_AMSKeyValueObservable *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (NSObject)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
}

- (NSObject)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  return WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
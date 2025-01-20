@interface _MKKVOProxy
- (_MKKVOProxy)initWithDelegate:(id)a3;
- (_MKKVOProxyDelegate)delegate;
- (void)addObserverForObject:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserverForObject:(id)a3 forKeyPath:(id)a4;
- (void)removeObserverForObject:(id)a3 forKeyPath:(id)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation _MKKVOProxy

- (void)addObserverForObject:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
}

- (_MKKVOProxy)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MKKVOProxy;
  v5 = [(_MKKVOProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(_MKKVOProxy *)self delegate];
  [v13 _mkObserveValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
}

- (_MKKVOProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKKVOProxyDelegate *)WeakRetained;
}

- (void)removeObserverForObject:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
}

- (void)removeObserverForObject:(id)a3 forKeyPath:(id)a4
{
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
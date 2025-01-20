@interface LNWeakProxy
- (LNWeakProxy)initWithValue:(id)a3;
- (LNWeakProxy)initWithValue:(id)a3 wrapper:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)value;
@end

@implementation LNWeakProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_value);
  if (WeakRetained)
  {
    wrapper = (void (**)(id, void *, id))self->_wrapper;
    if (wrapper)
    {
      v7 = NSStringFromSelector(a3);
      wrapper[2](wrapper, v7, WeakRetained);
    }
  }
  return WeakRetained;
}

- (LNWeakProxy)initWithValue:(id)a3 wrapper:(id)a4
{
  id v6 = a4;
  v7 = [(LNWeakProxy *)self initWithValue:a3];
  if (v7)
  {
    v8 = _Block_copy(v6);
    id wrapper = v7->_wrapper;
    v7->_id wrapper = v8;

    v10 = v7;
  }

  return v7;
}

- (LNWeakProxy)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LNWeakProxy;
  v5 = [(LNWeakProxy *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_value, v4);
    v7 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_value);
  objc_storeStrong(&self->_wrapper, 0);
}

- (id)value
{
  id WeakRetained = objc_loadWeakRetained(&self->_value);
  return WeakRetained;
}

@end
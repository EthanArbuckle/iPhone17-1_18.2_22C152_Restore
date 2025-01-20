@interface _AFAssertionProxy
- (AFAssertionContext)context;
- (NSString)description;
- (NSUUID)uuid;
- (_AFAssertionProxy)initWithImpl:(id)a3 coordinator:(id)a4;
- (void)dealloc;
- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4;
- (void)relinquishWithError:(id)a3 options:(unint64_t)a4;
@end

@implementation _AFAssertionProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v4 = [(_AFAssertionImpl *)self->_impl uuid];
  v5 = +[AFError errorWithCode:41];
  [WeakRetained relinquishAssertionWithUUID:v4 error:v5 options:0];

  v6.receiver = self;
  v6.super_class = (Class)_AFAssertionProxy;
  [(_AFAssertionProxy *)&v6 dealloc];
}

- (AFAssertionContext)context
{
  return [(_AFAssertionImpl *)self->_impl context];
}

- (NSUUID)uuid
{
  return [(_AFAssertionImpl *)self->_impl uuid];
}

- (void)relinquishWithError:(id)a3 options:(unint64_t)a4
{
  p_coordinator = &self->_coordinator;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  v8 = [(_AFAssertionImpl *)self->_impl uuid];
  [WeakRetained relinquishAssertionWithUUID:v8 error:v7 options:a4];
}

- (void)relinquishWithContext:(id)a3 options:(unint64_t)a4
{
  p_coordinator = &self->_coordinator;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  v8 = [(_AFAssertionImpl *)self->_impl uuid];
  [WeakRetained relinquishAssertionWithUUID:v8 context:v7 options:a4];
}

- (_AFAssertionProxy)initWithImpl:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AFAssertionProxy;
  v9 = [(_AFAssertionProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_impl, a3);
    objc_storeWeak((id *)&v10->_coordinator, v8);
  }

  return v10;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)_AFAssertionProxy;
  v4 = [(_AFAssertionProxy *)&v8 description];
  v5 = _AFAssertionCreateDescriptionOfProperties(self->_impl);
  objc_super v6 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v5];

  return (NSString *)v6;
}

@end
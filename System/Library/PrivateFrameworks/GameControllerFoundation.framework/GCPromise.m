@interface GCPromise
- (BOOL)isCancelled;
- (GCPromise)init;
- (id)debugDescription;
- (id)description;
- (id)future;
- (id)initWithFuture:(id *)a1;
- (id)redactedDescription;
- (void)cancel;
- (void)dealloc;
- (void)failWithError:(id)a3;
- (void)succeedWithResult:(id)a3;
@end

@implementation GCPromise

- (id)initWithFuture:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)GCPromise;
    a1 = (id *)objc_msgSendSuper2(&v6, sel_init);
    objc_storeStrong(a1 + 1, a2);
  }

  return a1;
}

- (GCPromise)init
{
  return 0;
}

- (void)dealloc
{
  if ((atomic_load_explicit(&self->_future->_state, memory_order_acquire) & 0x80) != 0)
  {
    id v4 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    v5 = [(GCPromise *)self debugDescription];
    [v4 handleFailureInMethod:a2, self, @"GCFuture.mm", 1981, @"Promise deallocated without finishing: %@", v5 object file lineNumber description];

    [(GCFuture *)self->_future cancel];
  }
  v6.receiver = self;
  v6.super_class = (Class)GCPromise;
  [(GCPromise *)&v6 dealloc];
}

- (id)future
{
  return self->_future;
}

- (BOOL)isCancelled
{
  return *(&self->_future->_state + 3) & 1;
}

- (void)succeedWithResult:(id)a3
{
}

- (void)failWithError:(id)a3
{
}

- (void)cancel
{
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(GCFuture *)self->_future debugDescription];
  objc_super v6 = +[NSString stringWithFormat:@"<%@ %p> -> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(GCFuture *)self->_future redactedDescription];
  objc_super v6 = +[NSString stringWithFormat:@"<%@> -> %@", v4, v5];

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(GCFuture *)self->_future description];
  objc_super v6 = +[NSString stringWithFormat:@"<%@> -> %@", v4, v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end
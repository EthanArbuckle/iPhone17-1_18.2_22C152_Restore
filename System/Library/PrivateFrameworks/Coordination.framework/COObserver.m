@interface COObserver
- (COObservable)observable;
- (NSOperationQueue)queue;
- (NSString)name;
- (id)handler;
- (id)initForName:(id)a3 onObservable:(id)a4 handler:(id)a5 queue:(id)a6;
- (unint64_t)hash;
- (void)dealloc;
- (void)notify:(id)a3;
@end

@implementation COObserver

- (id)initForName:(id)a3 onObservable:(id)a4 handler:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)COObserver;
  v14 = [(COObserver *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    objc_storeStrong((id *)&v14->_observable, a4);
    uint64_t v17 = [v12 copy];
    id handler = v14->_handler;
    v14->_id handler = (id)v17;

    objc_storeStrong((id *)&v14->_queue, a6);
  }

  return v14;
}

- (void)dealloc
{
  v3 = [(COObserver *)self observable];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)COObserver;
  [(COObserver *)&v4 dealloc];
}

- (unint64_t)hash
{
  v2 = [(COObserver *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)notify:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(COObserver *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __21__COObserver_notify___block_invoke;
  v7[3] = &unk_2644449F0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 addOperationWithBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __21__COObserver_notify___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    unint64_t v3 = [WeakRetained handler];
    v3[2](v3, *(void *)(a1 + 32));

    id WeakRetained = v4;
  }
}

- (NSString)name
{
  return self->_name;
}

- (COObservable)observable
{
  return self->_observable;
}

- (id)handler
{
  return self->_handler;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
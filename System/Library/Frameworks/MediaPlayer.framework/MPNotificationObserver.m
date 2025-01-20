@interface MPNotificationObserver
- (MPNotificationObserver)initWithName:(id)a3 object:(id)a4 handler:(id)a5;
- (NSString)name;
- (id)description;
- (id)handler;
- (id)object;
- (void)_handleNotification:(id)a3;
- (void)dealloc;
@end

@implementation MPNotificationObserver

- (MPNotificationObserver)initWithName:(id)a3 object:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPNotificationObserver;
  v11 = [(MPNotificationObserver *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeWeak(&v11->_object, v9);
    uint64_t v14 = [v10 copy];
    id handler = v11->_handler;
    v11->_id handler = (id)v14;

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v11 selector:sel__handleNotification_ name:v8 object:v9];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  name = self->_name;
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  [v3 removeObserver:self name:name object:WeakRetained];

  v6.receiver = self;
  v6.super_class = (Class)MPNotificationObserver;
  [(MPNotificationObserver *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak(&self->_object);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)handler
{
  return self->_handler;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);

  return WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void)_handleNotification:(id)a3
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p %@ handlerCallCount=%ld>", objc_opt_class(), self, self->_name, self->_handlerCallCount];
}

@end
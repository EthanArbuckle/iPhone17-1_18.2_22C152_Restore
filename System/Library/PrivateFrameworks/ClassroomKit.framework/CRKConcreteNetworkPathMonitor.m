@interface CRKConcreteNetworkPathMonitor
- (CRKConcreteNetworkPath)path;
- (CRKConcreteNetworkPathMonitor)initWithUnderlyingPathMonitor:(id)a3;
- (OS_nw_path_monitor)underlyingPathMonitor;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setPath:(id)a3;
- (void)updateWithPath:(id)a3;
@end

@implementation CRKConcreteNetworkPathMonitor

- (void)dealloc
{
  [(CRKConcreteNetworkPathMonitor *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteNetworkPathMonitor;
  [(CRKConcreteNetworkPathMonitor *)&v3 dealloc];
}

- (CRKConcreteNetworkPathMonitor)initWithUnderlyingPathMonitor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkPathMonitor;
  v6 = [(CRKConcreteNetworkPathMonitor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingPathMonitor, a3);
  }

  return v7;
}

- (void)cancel
{
  v2 = [(CRKConcreteNetworkPathMonitor *)self underlyingPathMonitor];
  nw_path_monitor_cancel(v2);
}

- (void)resume
{
  objc_initWeak(&location, self);
  underlyingPathMonitor = self->_underlyingPathMonitor;
  v4 = MEMORY[0x263EF83A0];
  id v5 = MEMORY[0x263EF83A0];
  nw_path_monitor_set_queue(underlyingPathMonitor, v4);

  v6 = self->_underlyingPathMonitor;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __39__CRKConcreteNetworkPathMonitor_resume__block_invoke;
  v11 = &unk_2646F4558;
  objc_copyWeak(&v12, &location);
  nw_path_monitor_set_update_handler(v6, &v8);
  v7 = [(CRKConcreteNetworkPathMonitor *)self underlyingPathMonitor];
  nw_path_monitor_start(v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __39__CRKConcreteNetworkPathMonitor_resume__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained updateWithPath:v3];
}

- (void)updateWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [[CRKConcreteNetworkPath alloc] initWithUnderlyingPath:v4];

  [(CRKConcreteNetworkPathMonitor *)self setPath:v5];
}

- (OS_nw_path_monitor)underlyingPathMonitor
{
  return self->_underlyingPathMonitor;
}

- (CRKConcreteNetworkPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_underlyingPathMonitor, 0);
}

@end
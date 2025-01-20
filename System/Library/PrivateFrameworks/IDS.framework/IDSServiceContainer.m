@interface IDSServiceContainer
- (BOOL)addListenerID:(id)a3;
- (BOOL)hasListenerID:(id)a3;
- (BOOL)removeListenerID:(id)a3;
- (IDSServiceContainer)initWithService:(id)a3;
- (IDSServiceMonitor)monitor;
- (NSMutableSet)listeners;
- (void)setMonitor:(id)a3;
@end

@implementation IDSServiceContainer

- (IDSServiceContainer)initWithService:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSServiceContainer;
  v5 = [(IDSServiceContainer *)&v11 init];
  if (v5)
  {
    v6 = [[IDSServiceMonitor alloc] initWithService:v4];
    monitor = v5->_monitor;
    v5->_monitor = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    listeners = v5->_listeners;
    v5->_listeners = v8;
  }
  return v5;
}

- (BOOL)hasListenerID:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_listeners, "containsObject:");
  }
  else {
    return 0;
  }
}

- (BOOL)addListenerID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    [(NSMutableSet *)self->_listeners addObject:v5];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)removeListenerID:(id)a3
{
  if (a3) {
    [(NSMutableSet *)self->_listeners removeObject:a3];
  }
  return a3 != 0;
}

- (IDSServiceMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
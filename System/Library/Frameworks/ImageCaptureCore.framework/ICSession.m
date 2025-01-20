@interface ICSession
- (BOOL)forwardPTPEvents;
- (BOOL)interestedInNotification:(id)a3;
- (BOOL)openSession;
- (ICSession)initWithConnection:(id)a3;
- (NSMutableArray)notifications;
- (NSXPCConnection)connection;
- (int)pid;
- (unint64_t)objectHandle;
- (void)addNotifications:(id)a3;
- (void)dealloc;
- (void)remNotifications:(id)a3;
- (void)setConnection:(id)a3;
- (void)setForwardPTPEvents:(BOOL)a3;
- (void)setObjectHandle:(unint64_t)a3;
- (void)setOpenSession:(BOOL)a3;
@end

@implementation ICSession

- (ICSession)initWithConnection:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSession;
  v5 = [(ICSession *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(ICSession *)v5 setConnection:v4];
    [(ICSession *)v6 setOpenSession:0];
    [(ICSession *)v6 setObjectHandle:0];
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    notifications = v6->_notifications;
    v6->_notifications = v7;

    v6->_resourceLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (int)pid
{
  connection = self->_connection;
  if (connection) {
    return [(NSXPCConnection *)connection processIdentifier];
  }
  else {
    return -1;
  }
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
  self->_objectHandle = 0;
  v5.receiver = self;
  v5.super_class = (Class)ICSession;
  [(ICSession *)&v5 dealloc];
}

- (BOOL)interestedInNotification:(id)a3
{
  v3 = self;
  p_resourceLock = &self->_resourceLock;
  id v5 = a3;
  os_unfair_lock_lock(p_resourceLock);
  LOBYTE(v3) = [(NSMutableArray *)v3->_notifications containsObject:v5];

  os_unfair_lock_unlock(p_resourceLock);
  return (char)v3;
}

- (void)addNotifications:(id)a3
{
  p_resourceLock = &self->_resourceLock;
  id v5 = a3;
  os_unfair_lock_lock(p_resourceLock);
  [(NSMutableArray *)self->_notifications addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_resourceLock);
}

- (void)remNotifications:(id)a3
{
  p_resourceLock = &self->_resourceLock;
  id v5 = a3;
  os_unfair_lock_lock(p_resourceLock);
  [(NSMutableArray *)self->_notifications removeObjectsInArray:v5];

  os_unfair_lock_unlock(p_resourceLock);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableArray)notifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)openSession
{
  return self->_openSession;
}

- (void)setOpenSession:(BOOL)a3
{
  self->_openSession = a3;
}

- (unint64_t)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unint64_t)a3
{
  self->_objectHandle = a3;
}

- (BOOL)forwardPTPEvents
{
  return self->_forwardPTPEvents;
}

- (void)setForwardPTPEvents:(BOOL)a3
{
  self->_forwardPTPEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end
@interface CRKConcreteDistributedNotificationSubscription
- (BOOL)isActive;
- (CRKConcreteDistributedNotificationSubscription)initWithNotificationName:(id)a3 handler:(id)a4;
- (NSString)name;
- (id)handler;
- (void)cancel;
- (void)dealloc;
- (void)notificationDidFire:(id)a3;
- (void)resume;
- (void)setActive:(BOOL)a3;
@end

@implementation CRKConcreteDistributedNotificationSubscription

- (void)dealloc
{
  [(CRKConcreteDistributedNotificationSubscription *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteDistributedNotificationSubscription;
  [(CRKConcreteDistributedNotificationSubscription *)&v3 dealloc];
}

- (CRKConcreteDistributedNotificationSubscription)initWithNotificationName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKConcreteDistributedNotificationSubscription;
  v8 = [(CRKConcreteDistributedNotificationSubscription *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = MEMORY[0x22A620AF0](v7);
    id handler = v8->_handler;
    v8->_id handler = (id)v11;
  }
  return v8;
}

- (void)resume
{
  if (![(CRKConcreteDistributedNotificationSubscription *)self isActive])
  {
    [(CRKConcreteDistributedNotificationSubscription *)self setActive:1];
    objc_super v3 = [(CRKConcreteDistributedNotificationSubscription *)self center];
    v4 = [(CRKConcreteDistributedNotificationSubscription *)self name];
    CFNotificationCenterAddObserver(v3, self, (CFNotificationCallback)notificationDidFireCFunction, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)notificationDidFire:(id)a3
{
  id v5 = a3;
  if ([(CRKConcreteDistributedNotificationSubscription *)self isActive])
  {
    v4 = [(CRKConcreteDistributedNotificationSubscription *)self handler];
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (void)cancel
{
  if ([(CRKConcreteDistributedNotificationSubscription *)self isActive])
  {
    [(CRKConcreteDistributedNotificationSubscription *)self setActive:0];
    objc_super v3 = [(CRKConcreteDistributedNotificationSubscription *)self center];
    v4 = [(CRKConcreteDistributedNotificationSubscription *)self name];
    CFNotificationCenterRemoveObserver(v3, self, v4, 0);
  }
}

- (NSString)name
{
  return self->_name;
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
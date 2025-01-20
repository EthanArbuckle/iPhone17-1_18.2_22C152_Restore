@interface CRKConcreteNotificationCenterSubscription
+ (id)subscriptionWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6;
- (CRKConcreteNotificationCenterSubscription)initWithNotificationCenter:(id)a3 object:(id)a4 notificationHandler:(id)a5;
- (NSNotificationCenter)notificationCenter;
- (id)notificationHandler;
- (id)object;
- (void)cancel;
- (void)dealloc;
- (void)notificationDidFire:(id)a3;
- (void)setNotificationHandler:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation CRKConcreteNotificationCenterSubscription

- (void)dealloc
{
  [(CRKConcreteNotificationCenterSubscription *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteNotificationCenterSubscription;
  [(CRKConcreteNotificationCenterSubscription *)&v3 dealloc];
}

- (CRKConcreteNotificationCenterSubscription)initWithNotificationCenter:(id)a3 object:(id)a4 notificationHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKConcreteNotificationCenterSubscription;
  v12 = [(CRKConcreteNotificationCenterSubscription *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationCenter, a3);
    objc_storeStrong(&v13->_object, a4);
    uint64_t v14 = MEMORY[0x22A620AF0](v11);
    id notificationHandler = v13->_notificationHandler;
    v13->_id notificationHandler = (id)v14;
  }
  return v13;
}

+ (id)subscriptionWithNotificationCenter:(id)a3 notificationName:(id)a4 object:(id)a5 notificationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithNotificationCenter:v13 object:v11 notificationHandler:v10];

  [v13 addObserver:v14 selector:sel_notificationDidFire_ name:v12 object:v11];

  return v14;
}

- (void)cancel
{
  objc_super v3 = [(CRKConcreteNotificationCenterSubscription *)self notificationCenter];
  [v3 removeObserver:self];

  [(CRKConcreteNotificationCenterSubscription *)self setNotificationHandler:0];

  [(CRKConcreteNotificationCenterSubscription *)self setObject:0];
}

- (void)notificationDidFire:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CRKConcreteNotificationCenterSubscription *)self notificationHandler];
  v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (id)notificationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong(&self->_object, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
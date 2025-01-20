@interface CRKConcreteDarwinNotificationSubscription
+ (id)subscriptionWithNotificationName:(id)a3 handler:(id)a4;
- (CRKConcreteDarwinNotificationSubscription)initWithNotificationToken:(int)a3;
- (int)notificationToken;
- (void)cancel;
- (void)dealloc;
- (void)setNotificationToken:(int)a3;
@end

@implementation CRKConcreteDarwinNotificationSubscription

- (void)dealloc
{
  [(CRKConcreteDarwinNotificationSubscription *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteDarwinNotificationSubscription;
  [(CRKConcreteDarwinNotificationSubscription *)&v3 dealloc];
}

- (CRKConcreteDarwinNotificationSubscription)initWithNotificationToken:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKConcreteDarwinNotificationSubscription;
  result = [(CRKConcreteDarwinNotificationSubscription *)&v5 init];
  if (result) {
    result->_notificationToken = a3;
  }
  return result;
}

+ (id)subscriptionWithNotificationName:(id)a3 handler:(id)a4
{
  id v6 = a4;
  int out_token = -1;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __86__CRKConcreteDarwinNotificationSubscription_subscriptionWithNotificationName_handler___block_invoke;
  v18 = &unk_2646F54B0;
  id v19 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = (void *)MEMORY[0x22A620AF0](&v15);
  id v10 = v8;
  v11 = (const char *)objc_msgSend(v10, "UTF8String", v15, v16, v17, v18);

  if (notify_register_dispatch(v11, &out_token, MEMORY[0x263EF83A0], v9))
  {
    v12 = 0;
  }
  else
  {
    id v13 = objc_alloc((Class)a1);
    v12 = (void *)[v13 initWithNotificationToken:out_token];
  }

  return v12;
}

uint64_t __86__CRKConcreteDarwinNotificationSubscription_subscriptionWithNotificationName_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancel
{
  if ([(CRKConcreteDarwinNotificationSubscription *)self notificationToken] != -1)
  {
    notify_cancel([(CRKConcreteDarwinNotificationSubscription *)self notificationToken]);
    [(CRKConcreteDarwinNotificationSubscription *)self setNotificationToken:0xFFFFFFFFLL];
  }
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

@end
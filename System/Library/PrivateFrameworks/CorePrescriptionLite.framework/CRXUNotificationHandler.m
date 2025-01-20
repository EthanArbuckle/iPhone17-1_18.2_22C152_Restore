@interface CRXUNotificationHandler
- (CRXUNotificationHandler)initWithNotification:(id)a3 timeout:(double)a4 queue:(id)a5 block:(id)a6;
- (void)handleNotification:(id)a3;
- (void)handleTimer:(id)a3;
- (void)invalidate;
@end

@implementation CRXUNotificationHandler

- (CRXUNotificationHandler)initWithNotification:(id)a3 timeout:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CRXUNotificationHandler;
  v13 = [(CRXUNotificationHandler *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a5);
    uint64_t v15 = [v12 copy];
    id block = v14->_block;
    v14->_id block = (id)v15;

    v17 = +[CRXUNotificationCenter sharedInstance];
    [v17 addObserver:v14 selector:sel_handleNotification_ queue:v14->_queue name:v10];

    uint64_t v18 = +[CRXUTimer scheduledTimerWithTimeInterval:v14 weakTarget:sel_handleTimer_ selector:0 repeats:v14->_queue queue:a4];
    timer = v14->_timer;
    v14->_timer = (CRXUTimer *)v18;
  }
  return v14;
}

- (void)handleNotification:(id)a3
{
  uint64_t v5 = MEMORY[0x24C5DB9E0](self->_block, a2, a3);
  [(CRXUNotificationHandler *)self invalidate];
  v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    v4 = (void *)v5;
  }
}

- (void)handleTimer:(id)a3
{
  v4 = (void (**)(id, void))MEMORY[0x24C5DB9E0](self->_block, a2, a3);
  [(CRXUNotificationHandler *)self invalidate];
  v4[2](v4, 0);
}

- (void)invalidate
{
  [(CRXUTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  v4 = +[CRXUNotificationCenter sharedInstance];
  [v4 removeObserver:self->_notificationToken];

  id block = self->_block;
  self->_id block = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
@interface CRKConcreteStudentNotificationObservation
- (CRKConcreteStudentNotificationObservation)initWithNotificationName:(id)a3 notificationHandler:(id)a4;
- (NSString)notificationName;
- (id)notificationHandler;
- (void)dealloc;
- (void)invalidate;
- (void)receiveNotificationWithName:(id)a3 userInfo:(id)a4;
- (void)setNotificationHandler:(id)a3;
@end

@implementation CRKConcreteStudentNotificationObservation

- (void)dealloc
{
  [(CRKConcreteStudentNotificationObservation *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteStudentNotificationObservation;
  [(CRKConcreteStudentNotificationObservation *)&v3 dealloc];
}

- (CRKConcreteStudentNotificationObservation)initWithNotificationName:(id)a3 notificationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKConcreteStudentNotificationObservation;
  v8 = [(CRKConcreteStudentNotificationObservation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    notificationName = v8->_notificationName;
    v8->_notificationName = (NSString *)v9;

    uint64_t v11 = MEMORY[0x22A620AF0](v7);
    id notificationHandler = v8->_notificationHandler;
    v8->_id notificationHandler = (id)v11;
  }
  return v8;
}

- (void)receiveNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(CRKConcreteStudentNotificationObservation *)self notificationHandler];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(CRKConcreteStudentNotificationObservation *)self notificationName];
    int v10 = [v9 isEqualToString:v12];

    if (v10)
    {
      uint64_t v11 = [(CRKConcreteStudentNotificationObservation *)self notificationHandler];
      ((void (**)(void, id))v11)[2](v11, v6);
    }
  }
}

- (void)invalidate
{
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (id)notificationHandler
{
  return self->_notificationHandler;
}

- (void)setNotificationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);

  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
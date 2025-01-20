@interface Notification
- (BOOL)suspended;
- (LANotificationObserverXPC)observer;
- (NSString)className;
- (NSString)description;
- (Notification)initWithObserver:(id)a3 observerPid:(int)a4 className:(id)a5;
- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5;
- (void)resumeAndNotify:(BOOL)a3 completionHandler:(id)a4;
- (void)suspendWithCompletionHandler:(id)a3;
@end

@implementation Notification

- (Notification)initWithObserver:(id)a3 observerPid:(int)a4 className:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)Notification;
  v11 = [(Notification *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_observer, a3);
    v12->_observerPid = a4;
    objc_storeStrong((id *)&v12->_className, a5);
  }

  return v12;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(Notification *)self className];
  v6 = +[NSString stringWithFormat:@"<%@ %p: className:%@, suspended:%d, PID:%d>", v4, self, v5, [(Notification *)self suspended], self->_observerPid];

  return (NSString *)v6;
}

- (void)resumeAndNotify:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  v7 = sub_100007298();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "resume";
    if (v4) {
      v8 = "resume and notify observer";
    }
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2082;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will %{public}s", (uint8_t *)&v12, 0x16u);
  }

  self->_suspended = 0;
  if (v4)
  {
    id v9 = (void *)qword_100046E08;
    id v10 = [(Notification *)self className];
    v11 = [v9 objectForKeyedSubscript:v10];
    [(Notification *)self newValue:v11 oldValue:0 completionHandler:v6];
  }
  else
  {
    v6[2](v6);
  }
}

- (void)suspendWithCompletionHandler:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  v5 = sub_100007298();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will suspend", (uint8_t *)&v6, 0xCu);
  }

  self->_suspended = 1;
  v4[2](v4);
}

- (void)newValue:(id)a3 oldValue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([(Notification *)self suspended])
  {
    v10[2](v10);
  }
  else
  {
    if (v8)
    {
      if (qword_100046E10 != -1) {
        dispatch_once(&qword_100046E10, &stru_100038980);
      }
      v11 = (void *)qword_100046E08;
      int v12 = [(Notification *)self className];
      [v11 setObject:v8 forKey:v12];
    }
    v13 = sub_100007298();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int observerPid = self->_observerPid;
      int v16 = 138544130;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = v8;
      __int16 v20 = 2114;
      id v21 = v9;
      __int16 v22 = 1024;
      int v23 = observerPid;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ has received newValue: %{public}@, oldValue: %{public}@, notifying PID %d", (uint8_t *)&v16, 0x26u);
    }

    v15 = [(Notification *)self observer];
    [v15 newValue:v8 oldValue:v9 completionHandler:v10];
  }
}

- (NSString)className
{
  return self->_className;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (LANotificationObserverXPC)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_className, 0);
}

@end
@interface PDUserNotificationTrigger
- (BOOL)isIncompleteHandout:(id)a3;
- (PDDatabase)database;
- (PDUserNotificationTrigger)initWithDatabase:(id)a3;
- (PDUserNotificationTriggerDelegate)delegate;
- (id)classIDFromHandout:(id)a3;
- (void)fireTriggerWithNotificationData:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PDUserNotificationTrigger

- (PDUserNotificationTrigger)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDUserNotificationTrigger;
  v6 = [(PDUserNotificationTrigger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (void)fireTriggerWithNotificationData:(id)a3
{
  id v5 = a3;
  v4 = [(PDUserNotificationTrigger *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 triggerDidFire:self notificationData:v5];
  }
}

- (BOOL)isIncompleteHandout:(id)a3
{
  id v4 = a3;
  id v5 = [(PDUserNotificationTrigger *)self database];
  uint64_t v6 = objc_opt_class();
  v7 = [v4 objectID];
  v16 = v7;
  v8 = +[NSArray arrayWithObjects:&v16 count:1];
  objc_super v9 = [v5 select:v6 where:@"parentObjectID = ?" bindings:v8];

  if (v9)
  {
    LODWORD(v10) = [v9 isCompletedHandout] ^ 1;
  }
  else
  {
    CLSInitLog();
    v11 = (void *)CLSLogDefault;
    LOBYTE(v10) = 0;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v11;
      v12 = [v4 objectID];
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDUserNotificationTrigger: collaboration state for handout with id: %{public}@ not available.", (uint8_t *)&v14, 0xCu);

      LOBYTE(v10) = 0;
    }
  }

  return (char)v10;
}

- (id)classIDFromHandout:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];

  if (v5)
  {
    uint64_t v6 = [(PDUserNotificationTrigger *)self database];
    uint64_t v7 = objc_opt_class();
    v8 = [v4 objectID];
    v13 = v8;
    objc_super v9 = +[NSArray arrayWithObjects:&v13 count:1];
    v10 = [v6 select:v7 where:@"parentObjectID = ?" bindings:v9];

    v11 = [v10 classID];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PDDatabase)database
{
  return self->_database;
}

- (PDUserNotificationTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PDUserNotificationTriggerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_database, 0);
}

@end
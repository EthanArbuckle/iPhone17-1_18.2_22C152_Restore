@interface AVSystemControllerMonitor
- (AVSystemControllerMonitor)init;
- (AVSystemControllerMonitor)initWithBlock:(id)a3;
- (BOOL)subscribe:(id)a3;
- (BOOL)wombatActive;
- (void)notificationDispatch:(BOOL)a3;
- (void)notificationHandler:(id)a3;
- (void)setupAVSystemController;
@end

@implementation AVSystemControllerMonitor

- (AVSystemControllerMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVSystemControllerMonitor;
  v2 = [(AVSystemControllerMonitor *)&v7 init];
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  subscribers = v2->_subscribers;
  v2->_subscribers = v3;

  if (v2->_subscribers
    && ([(AVSystemControllerMonitor *)v2 setupAVSystemController], v2->_avSystemController))
  {
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AVSystemControllerMonitor)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [(AVSystemControllerMonitor *)self init];
  v6 = v5;
  if (v5)
  {
    [(AVSystemControllerMonitor *)v5 subscribe:v4];
    objc_super v7 = v6;
  }

  return v6;
}

- (void)notificationDispatch:(BOOL)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_subscribers;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        objc_super v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)notificationHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1000A36A0, OS_LOG_TYPE_DEBUG)) {
    sub_100067FD0();
  }
  id v5 = [v4 userInfo];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_super v7 = [v5 objectForKey:AVSystemController_WombatEnabledDidChangeNotificationParameter];
    long long v8 = v7;
    if (v7)
    {
      -[AVSystemControllerMonitor notificationDispatch:](self, "notificationDispatch:", [v7 BOOLValue]);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000A36A0, OS_LOG_TYPE_FAULT))
    {
      sub_100067F5C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A36A0, OS_LOG_TYPE_FAULT))
  {
    sub_100067EE8();
  }
}

- (void)setupAVSystemController
{
  v3 = qword_1000A36A0;
  if (os_log_type_enabled((os_log_t)qword_1000A36A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up AVSC listener\n", v12, 2u);
  }
  if (self->_avSystemController)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:self->_avSystemController];

    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:AVSystemController_WombatEnabledDidChangeNotification object:self->_avSystemController];

    sub_10002E0AC();
    avSystemController = self->_avSystemController;
    self->_avSystemController = 0;
  }
  objc_super v7 = +[AVSystemController sharedAVSystemController];
  long long v8 = self->_avSystemController;
  self->_avSystemController = v7;

  if (self->_avSystemController)
  {
    v13[0] = AVSystemController_ServerConnectionDiedNotification;
    v13[1] = AVSystemController_WombatEnabledDidChangeNotification;
    long long v9 = +[NSArray arrayWithObjects:v13 count:2];
    if (v9)
    {
      [(AVSystemController *)self->_avSystemController setAttribute:v9 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
      long long v10 = +[NSNotificationCenter defaultCenter];
      [v10 addObserver:self selector:"setupAVSystemController" name:AVSystemController_ServerConnectionDiedNotification object:self->_avSystemController];

      long long v11 = +[NSNotificationCenter defaultCenter];
      [v11 addObserver:self selector:"notificationHandler:" name:AVSystemController_WombatEnabledDidChangeNotification object:self->_avSystemController];

      [(AVSystemControllerMonitor *)self notificationDispatch:[(AVSystemControllerMonitor *)self wombatActive]];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000A36A0, OS_LOG_TYPE_ERROR))
  {
    sub_100068038();
  }
}

- (BOOL)wombatActive
{
  return [(AVSystemController *)self->_avSystemController attributeForKey:AVSystemController_WombatEnabledAttribute] == kCFBooleanTrue;
}

- (BOOL)subscribe:(id)a3
{
  subscribers = self->_subscribers;
  id v5 = a3;
  id v6 = objc_retainBlock(v5);
  [(NSMutableArray *)subscribers addObject:v6];

  (*((void (**)(id, BOOL))v5 + 2))(v5, [(AVSystemControllerMonitor *)self wombatActive]);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);

  objc_storeStrong((id *)&self->_avSystemController, 0);
}

@end
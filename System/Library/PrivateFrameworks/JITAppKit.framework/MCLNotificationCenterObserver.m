@interface MCLNotificationCenterObserver
- (BOOL)enabled;
- (MCLNotificationCenterObserver)init;
- (NSString)notification;
- (id)object;
- (void)dealloc;
- (void)observeNotification:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNotification:(id)a3;
- (void)setObject:(id)a3;
- (void)setup;
@end

@implementation MCLNotificationCenterObserver

- (MCLNotificationCenterObserver)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCLNotificationCenterObserver;
  v6 = [(MCLNotificationCenterObserver *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    v6->_enabled = 1;
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  SEL v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)MCLNotificationCenterObserver;
  [(MCLNotificationCenterObserver *)&v3 dealloc];
}

- (void)setNotification:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  notification = v6->_notification;
  v6->_notification = (NSString *)v3;

  [(MCLNotificationCenterObserver *)v6 setup];
  objc_storeStrong(location, 0);
}

- (void)setObject:(id)a3
{
  SEL v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(&v4->_object, location[0]);
  [(MCLNotificationCenterObserver *)v4 setup];
  objc_storeStrong(location, 0);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(MCLNotificationCenterObserver *)self setup];
}

- (void)setup
{
  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  if (self->_enabled)
  {
    if ([(NSString *)self->_notification length])
    {
      id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
      [v2 addObserver:self selector:sel_observeNotification_ name:self->_notification object:self->_object];
    }
  }
}

- (void)observeNotification:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v11->_enabled)
  {
    SEL v4 = v11;
    id v5 = (id)[location[0] userInfo];
    char v8 = 0;
    char v6 = 0;
    if (v5)
    {
      id v9 = (id)[location[0] userInfo];
      char v8 = 1;
      v12[0] = v9;
      id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      char v6 = 1;
      id v3 = v7;
    }
    else
    {
      id v3 = 0;
    }
    [(MCLNotificationCenterObserver *)v4 emitTMLSignal:@"notification" withArguments:v3];
    if (v6) {

    }
    if (v8) {
  }
    }
  objc_storeStrong(location, 0);
}

- (NSString)notification
{
  return self->_notification;
}

- (id)object
{
  return self->_object;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end
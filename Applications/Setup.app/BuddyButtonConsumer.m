@interface BuddyButtonConsumer
- (BSInvalidatable)buttonConsumer;
- (BuddyButtonConsumer)initWithButtonKind:(int64_t)a3 handler:(id)a4;
- (id)menuHandler;
- (void)dealloc;
- (void)setButtonConsumer:(id)a3;
- (void)setMenuHandler:(id)a3;
@end

@implementation BuddyButtonConsumer

- (BuddyButtonConsumer)initWithButtonKind:(int64_t)a3 handler:(id)a4
{
  id v14 = self;
  SEL v13 = a2;
  int64_t v12 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v14;
  id v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)BuddyButtonConsumer;
  v5 = [(BuddyButtonConsumer *)&v10 init];
  id v14 = v5;
  objc_storeStrong(&v14, v5);
  if (v5)
  {
    v6 = +[SBSHardwareButtonService sharedInstance];
    id v7 = [(SBSHardwareButtonService *)v6 beginConsumingPressesForButtonKind:v12 eventConsumer:v14 priority:0];
    [v14 setButtonConsumer:v7];

    [v14 setMenuHandler:location];
  }
  v8 = (BuddyButtonConsumer *)v14;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  [(BSInvalidatable *)self->_buttonConsumer invalidate];
  v2.receiver = v4;
  v2.super_class = (Class)BuddyButtonConsumer;
  [(BuddyButtonConsumer *)&v2 dealloc];
}

- (id)menuHandler
{
  return self->_menuHandler;
}

- (void)setMenuHandler:(id)a3
{
}

- (BSInvalidatable)buttonConsumer
{
  return self->_buttonConsumer;
}

- (void)setButtonConsumer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
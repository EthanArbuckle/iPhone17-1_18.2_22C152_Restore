@interface BuddyButtonMonitor
- (BOOL)isAnyButtonPressed;
- (BuddyButtonMonitor)init;
- (void)setAnyButtonPressed:(BOOL)a3;
@end

@implementation BuddyButtonMonitor

- (BuddyButtonMonitor)init
{
  SEL v13 = a2;
  id location = 0;
  v12.receiver = self;
  v12.super_class = (Class)BuddyButtonMonitor;
  id location = [(BuddyButtonMonitor *)&v12 init];
  objc_storeStrong(&location, location);
  if (!location) {
    goto LABEL_6;
  }
  id v11 = [objc_alloc((Class)HIDEventSystemClient) initWithType:1];
  if (v11)
  {
    [v11 setMatching:&off_1002C1610];
    v2 = &_dispatch_main_q;
    [v11 setDispatchQueue:v2];

    v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    v8 = sub_10019C500;
    v9 = &unk_1002B4448;
    id v10 = location;
    [v11 setEventHandler:&v5];
    [v11 activate];
    objc_storeStrong(&v10, 0);
    int v4 = 0;
  }
  else
  {
    v15 = 0;
    int v4 = 1;
  }
  objc_storeStrong(&v11, 0);
  if (!v4) {
LABEL_6:
  }
    v15 = (BuddyButtonMonitor *)location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (BOOL)isAnyButtonPressed
{
  return self->_anyButtonPressed;
}

- (void)setAnyButtonPressed:(BOOL)a3
{
  self->_anyButtonPressed = a3;
}

@end
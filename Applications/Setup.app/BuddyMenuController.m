@interface BuddyMenuController
+ (BOOL)_useSideButton;
+ (BOOL)supportsHomeGesture;
+ (id)menuButtonConsumerWithHandler:(id)a3;
- (BuddyMenuController)initWithHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BuddyMenuController

+ (BOOL)supportsHomeGesture
{
  return [a1 _useSideButton:a2];
}

+ (BOOL)_useSideButton
{
  id v2 = +[BYDevice currentDevice];
  BOOL v3 = ([v2 hasHomeButton] & 1) == 0;

  return v3;
}

+ (id)menuButtonConsumerWithHandler:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [BuddyMenuController alloc];
  id v6 = [(BuddyMenuController *)v3 initWithHandler:location[0]];
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BuddyMenuController)initWithHandler:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v16;
  id v16 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)BuddyMenuController;
  id v4 = [(BuddyMenuController *)&v14 init];
  id v16 = v4;
  objc_storeStrong(&v16, v4);
  if (v4)
  {
    id obj = (id)objc_opt_new();
    if ([(id)objc_opt_class() _useSideButton])
    {
      v5 = [BuddyLongPressButtonConsumer alloc];
      id v12 = [(BuddyButtonConsumer *)v5 initWithButtonKind:2 handler:location[0]];
      [obj addObject:v12];
      id v6 = location[0];
      location[0] = 0;

      objc_storeStrong(&v12, 0);
    }
    v7 = [BuddySinglePressUpButtonConsumer alloc];
    v8 = [(BuddyButtonConsumer *)v7 initWithButtonKind:1 handler:location[0]];
    [obj addObject:v8, v8];
    objc_storeStrong((id *)v16 + 1, obj);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&obj, 0);
  }
  v9 = (BuddyMenuController *)v16;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v16, 0);
  return v9;
}

- (void)invalidate
{
  v10 = self;
  SEL v9 = a2;
  memset(v7, 0, sizeof(v7));
  id v2 = v10->_consumers;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(void *)v7[2] != v4) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(id *)(v7[1] + 8 * i);
        id v6 = [v8 buttonConsumer];
        [v6 invalidate];
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:v7 objects:v11 count:16];
    }
    while (v3);
  }

  objc_storeStrong((id *)&v10->_consumers, 0);
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  [(BuddyMenuController *)self invalidate];
  v2.receiver = v4;
  v2.super_class = (Class)BuddyMenuController;
  [(BuddyMenuController *)&v2 dealloc];
}

- (void).cxx_destruct
{
}

@end
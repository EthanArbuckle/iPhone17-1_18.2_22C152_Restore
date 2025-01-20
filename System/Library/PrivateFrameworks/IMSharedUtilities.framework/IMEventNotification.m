@interface IMEventNotification
+ (id)eventNotification:(id)a3;
+ (id)eventNotification:(id)a3 eventNotificationBlock:(id)a4;
+ (id)eventNotification:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5;
- (BOOL)invoke;
- (BOOL)wasCancelled;
- (IMEventNotification)eventNotificationWithSenderBlock;
- (id)eventNotificationBlock;
- (id)sender;
- (id)target;
- (void)cancel;
- (void)setEventNotificationBlock:(id)a3;
- (void)setEventNotificationWithSenderBlock:(id)a3;
- (void)setSender:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation IMEventNotification

+ (id)eventNotification:(id)a3 eventNotificationBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setTarget:v6];

  [v7 setEventNotificationBlock:v5];

  return v7;
}

+ (id)eventNotification:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setTarget:v9];

  [v10 setSender:v8];
  [v10 setEventNotificationWithSenderBlock:v7];

  return v10;
}

+ (id)eventNotification:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setTarget:v3];

  [v4 setEventNotificationBlock:0];

  return v4;
}

- (BOOL)invoke
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(IMEventNotification *)v2 target];
  id v4 = [(IMEventNotification *)v2 sender];
  id v5 = [(IMEventNotification *)v2 eventNotificationBlock];
  uint64_t v6 = [(IMEventNotification *)v2 eventNotificationWithSenderBlock];
  id v7 = (void *)v6;
  if (v3 && v5)
  {
    ((void (**)(void, void *))v5)[2](v5, v3);
LABEL_8:
    BOOL v8 = 1;
    goto LABEL_9;
  }
  BOOL v8 = 0;
  if (v3 && v4 && v6)
  {
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v3, v4);
    goto LABEL_8;
  }
LABEL_9:

  objc_sync_exit(v2);
  return v8;
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  objc_storeWeak(&obj->_target, 0);
  id eventNotificationBlock = obj->_eventNotificationBlock;
  obj->_id eventNotificationBlock = 0;

  id eventNotificationWithSenderBlock = obj->_eventNotificationWithSenderBlock;
  obj->_id eventNotificationWithSenderBlock = 0;

  objc_sync_exit(obj);
}

- (BOOL)wasCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&v2->_target);
  BOOL v4 = WeakRetained == 0;

  objc_sync_exit(v2);
  return v4;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (id)sender
{
  id WeakRetained = objc_loadWeakRetained(&self->_sender);

  return WeakRetained;
}

- (void)setSender:(id)a3
{
}

- (IMEventNotification)eventNotificationWithSenderBlock
{
  return (IMEventNotification *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEventNotificationWithSenderBlock:(id)a3
{
}

- (id)eventNotificationBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setEventNotificationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventNotificationBlock, 0);
  objc_storeStrong(&self->_eventNotificationWithSenderBlock, 0);
  objc_destroyWeak(&self->_sender);

  objc_destroyWeak(&self->_target);
}

@end
@interface IMEventNotificationQueue
- (BOOL)containsNotificationTarget:(id)a3;
- (BOOL)isBusy;
- (BOOL)isPaused;
- (BOOL)isScheduled;
- (IMDoubleLinkedList)eventNotificationList;
- (IMEventNotificationQueue)init;
- (IMEventNotificationQueueDelegate)delegate;
- (int64_t)count;
- (void)_didChangePausedState:(BOOL)a3;
- (void)_dispatchProcessQueue;
- (void)_invokeEvent:(id)a3;
- (void)_invokeNotifications;
- (void)_processQueue;
- (void)_scheduleIfNeeded:(BOOL)a3;
- (void)_setBusy:(BOOL)a3;
- (void)appendEventNotification:(id)a3;
- (void)appendEventTarget:(id)a3 eventNotificationBlock:(id)a4;
- (void)appendEventTarget:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5;
- (void)cancelAllEventNotifications;
- (void)cancelEventNotificationsForNotificationTarget:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)pushEventNotification:(id)a3;
- (void)pushEventTarget:(id)a3 eventNotificationBlock:(id)a4;
- (void)pushEventTarget:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation IMEventNotificationQueue

- (void)setDelegate:(id)a3
{
}

- (IMEventNotificationQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMEventNotificationQueue;
  v2 = [(IMEventNotificationQueue *)&v6 init];
  if (v2)
  {
    v3 = (IMDoubleLinkedList *)objc_alloc_init(MEMORY[0x1E4F6C330]);
    eventNotificationList = v2->_eventNotificationList;
    v2->_eventNotificationList = v3;
  }
  return v2;
}

- (void)_dispatchProcessQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A07E46A0;
  block[3] = &unk_1E5A11D40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_scheduleIfNeeded:(BOOL)a3
{
  if (!self->_scheduled || a3)
  {
    self->_scheduled = 1;
    if (!self->_paused) {
      MEMORY[0x1F4181798](self, sel__dispatchProcessQueue);
    }
  }
}

- (void)_invokeEvent:(id)a3
{
  if (a3) {
    [a3 invoke];
  }
}

- (BOOL)isBusy
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL busy = v2->_busy;
  objc_sync_exit(v2);

  return busy;
}

- (void)_setBusy:(BOOL)a3
{
  if (self->_busy != a3)
  {
    self->_BOOL busy = a3;
    v4 = [(IMEventNotificationQueue *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = [(IMEventNotificationQueue *)self delegate];
      [v6 eventNotificationQueue:self didChangeBusyState:self->_busy];
    }
    MEMORY[0x1F4181798](self, sel__didChangeBusyState_);
  }
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, id, unsigned char *))a3;
  if (v4)
  {
    unsigned __int8 v8 = 0;
    char v5 = [(IMDoubleLinkedList *)self->_eventNotificationList first];
    do
    {
      if (!v5) {
        break;
      }
      id v6 = v5;
      char v5 = [v6 next];

      if ([v6 wasCancelled])
      {
        [(IMDoubleLinkedList *)self->_eventNotificationList removeLinkedListNode:v6];
        [v6 cache];
      }
      else
      {
        v4[2](v4, v6, &v8);
      }
      int v7 = v8;
    }
    while (!v7);
  }
}

- (void)_invokeNotifications
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1A07E4900;
  v2[3] = &unk_1E5A11D68;
  v2[4] = self;
  [(IMEventNotificationQueue *)self enumerateObjectsUsingBlock:v2];
}

- (void)_processQueue
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_paused)
  {
    v3 = [(IMEventNotificationQueue *)obj delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      char v5 = [(IMEventNotificationQueue *)obj delegate];
      [v5 eventNotificationQueueWillSendNotifications:obj];
    }
    [(IMEventNotificationQueue *)obj _willProcessQueue];
    [(IMEventNotificationQueue *)obj _invokeNotifications];
    [(IMEventNotificationQueue *)obj _didProcessQueue];
    id v6 = [(IMEventNotificationQueue *)obj delegate];
    char v7 = objc_opt_respondsToSelector();

    v2 = obj;
    if (v7)
    {
      unsigned __int8 v8 = [(IMEventNotificationQueue *)obj delegate];
      [v8 eventNotificationQueueDidSendNotifications:obj];

      v2 = obj;
    }
  }
  v2->_scheduled = 0;
  objc_sync_exit(v2);
}

- (void)pushEventNotification:(id)a3
{
  id v5 = a3;
  char v4 = self;
  objc_sync_enter(v4);
  [(IMDoubleLinkedList *)v4->_eventNotificationList pushLinkedListNode:v5];
  [(IMEventNotificationQueue *)v4 _didAddNotification:v5];
  objc_sync_exit(v4);
}

- (void)appendEventNotification:(id)a3
{
  id v5 = a3;
  char v4 = self;
  objc_sync_enter(v4);
  [(IMDoubleLinkedList *)v4->_eventNotificationList appendLinkedListNode:v5];
  [(IMEventNotificationQueue *)v4 _didAddNotification:v5];
  objc_sync_exit(v4);
}

- (void)cancelEventNotificationsForNotificationTarget:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = sub_1A07E4C04;
  v10 = &unk_1E5A11D90;
  id v6 = v4;
  id v11 = v6;
  v12 = v5;
  [(IMEventNotificationQueue *)v5 enumerateObjectsUsingBlock:&v7];
  [(IMEventNotificationQueue *)v5 _didCancelNotifications];

  objc_sync_exit(v5);
}

- (void)cancelAllEventNotifications
{
  v2 = self;
  objc_sync_enter(v2);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1A07E4D38;
  v3[3] = &unk_1E5A11D68;
  v3[4] = v2;
  [(IMEventNotificationQueue *)v2 enumerateObjectsUsingBlock:v3];
  [(IMEventNotificationQueue *)v2 _didCancelNotifications];
  objc_sync_exit(v2);
}

- (void)appendEventTarget:(id)a3 eventNotificationBlock:(id)a4
{
  id v5 = +[IMEventNotification eventNotification:a3 eventNotificationBlock:a4];
  [(IMEventNotificationQueue *)self appendEventNotification:v5];
}

- (void)pushEventTarget:(id)a3 eventNotificationBlock:(id)a4
{
  id v5 = +[IMEventNotification eventNotification:a3 eventNotificationBlock:a4];
  [(IMEventNotificationQueue *)self pushEventNotification:v5];
}

- (void)appendEventTarget:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v6 = +[IMEventNotification eventNotification:a3 sender:a4 eventNotificationBlock:a5];
  [(IMEventNotificationQueue *)self appendEventNotification:v6];
}

- (void)pushEventTarget:(id)a3 sender:(id)a4 eventNotificationBlock:(id)a5
{
  id v6 = +[IMEventNotification eventNotification:a3 sender:a4 eventNotificationBlock:a5];
  [(IMEventNotificationQueue *)self pushEventNotification:v6];
}

- (void)_didChangePausedState:(BOOL)a3
{
  if (!a3) {
    [(IMEventNotificationQueue *)self _scheduleIfNeeded:self->_scheduled];
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_paused != v3)
  {
    obj->_paused = v3;
    id v4 = [(IMEventNotificationQueue *)obj delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(IMEventNotificationQueue *)obj delegate];
      [v6 eventNotificationQueue:obj didChangePausedState:obj->_paused];
    }
    [(IMEventNotificationQueue *)obj _didChangePausedState:obj->_paused];
  }
  objc_sync_exit(obj);
}

- (BOOL)isScheduled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL scheduled = v2->_scheduled;
  objc_sync_exit(v2);

  return scheduled;
}

- (BOOL)isPaused
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL paused = v2->_paused;
  objc_sync_exit(v2);

  return paused;
}

- (int64_t)count
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(IMDoubleLinkedList *)v2->_eventNotificationList count];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)containsNotificationTarget:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = self;
    objc_sync_enter(v5);
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1A07E51D0;
    v8[3] = &unk_1E5A11DB8;
    id v9 = v4;
    v10 = &v11;
    [(IMEventNotificationQueue *)v5 enumerateObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
    objc_sync_exit(v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (IMEventNotificationQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMEventNotificationQueueDelegate *)WeakRetained;
}

- (IMDoubleLinkedList)eventNotificationList
{
  return self->_eventNotificationList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventNotificationList, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
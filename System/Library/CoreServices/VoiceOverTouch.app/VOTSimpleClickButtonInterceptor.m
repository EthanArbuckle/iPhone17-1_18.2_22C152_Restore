@interface VOTSimpleClickButtonInterceptor
- (BOOL)touchEventOccurred:(id)a3 inTVDirectTouch:(BOOL)a4;
- (NSMutableArray)eventQueue;
- (SCRCTargetSelectorTimer)timer;
- (VOTSimpleClickButtonInterceptor)initWithThreadKey:(id)a3 simpleClickHandler:(id)a4;
- (id)simpleClickHandler;
- (void)_drainQueue:(BOOL)a3;
- (void)_timerFired;
- (void)buttonDownOccurred:(id)a3;
- (void)buttonUpOccurred:(id)a3;
- (void)dealloc;
- (void)setEventQueue:(id)a3;
- (void)setSimpleClickHandler:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation VOTSimpleClickButtonInterceptor

- (VOTSimpleClickButtonInterceptor)initWithThreadKey:(id)a3 simpleClickHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VOTSimpleClickButtonInterceptor;
  v8 = [(VOTSimpleClickButtonInterceptor *)&v16 init];
  if (v8)
  {
    id v9 = [objc_allocWithZone((Class)SCRCTargetSelectorTimer) initWithTarget:v8 selector:"_timerFired" threadKey:v6];
    id simpleClickHandler = v8->_simpleClickHandler;
    v8->_id simpleClickHandler = v9;

    v11 = (SCRCTargetSelectorTimer *)objc_alloc_init((Class)NSMutableArray);
    timer = v8->_timer;
    v8->_timer = v11;

    [(VOTSimpleClickButtonInterceptor *)v8 setSimpleClickHandler:v7];
    dispatch_queue_t v13 = dispatch_queue_create("ButtonInterceptorQueue", 0);
    v14 = *(void **)&v8->_clickDown;
    *(void *)&v8->_clickDown = v13;
  }
  return v8;
}

- (void)dealloc
{
  v3 = [(VOTSimpleClickButtonInterceptor *)self timer];
  [v3 invalidate];

  v4 = *(void **)&self->_clickDown;
  *(void *)&self->_clickDown = 0;

  v5.receiver = self;
  v5.super_class = (Class)VOTSimpleClickButtonInterceptor;
  [(VOTSimpleClickButtonInterceptor *)&v5 dealloc];
}

- (void)buttonDownOccurred:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VOTSimpleClickButtonInterceptor;
  [(VOTButtonInterceptor *)&v14 buttonDownOccurred:v4];
  *(&self->super._listensPassively + 1) = 1;
  objc_super v5 = *(NSObject **)&self->_clickDown;
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10010CC0C;
  v11 = &unk_1001B3448;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v8);
  id v7 = [(VOTSimpleClickButtonInterceptor *)self timer];
  [v7 dispatchAfterDelay:0.3];
}

- (void)buttonUpOccurred:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VOTSimpleClickButtonInterceptor;
  [(VOTButtonInterceptor *)&v16 buttonUpOccurred:v4];
  objc_super v5 = *(NSObject **)&self->_clickDown;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10010CDB4;
  id v13 = &unk_1001B3448;
  objc_super v14 = self;
  id v15 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v10);
  id v7 = [(VOTSimpleClickButtonInterceptor *)self timer];
  [v7 cancel];

  if (*(&self->super._listensPassively + 1)
    && ([(VOTSimpleClickButtonInterceptor *)self simpleClickHandler],
        v8 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v9 = v8[2](),
        v8,
        v9))
  {
    [(VOTSimpleClickButtonInterceptor *)self _drainQueue:0];
  }
  else
  {
    [(VOTSimpleClickButtonInterceptor *)self _drainQueue:1];
    *(&self->super._listensPassively + 2) = 1;
  }
  *(&self->super._listensPassively + 1) = 0;
}

- (void)_timerFired
{
  *(&self->super._listensPassively + 1) = 0;
  *(&self->super._listensPassively + 2) = 1;
  [(VOTSimpleClickButtonInterceptor *)self _drainQueue:1];
}

- (BOOL)touchEventOccurred:(id)a3 inTVDirectTouch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 handInfo];
  unsigned int v8 = [v7 eventType];

  if (v4)
  {
    if (v8 == 1 && [v6 fingerCount] == (id)2)
    {
      int v9 = +[VOTElement systemWideElement];
      [v9 sendTouchCancelledEvent];
    }
    BOOL v10 = 0;
  }
  else
  {
    BOOL v11 = v8 < 0xB;
    v12 = *(NSObject **)&self->_clickDown;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010CFB0;
    block[3] = &unk_1001B7150;
    block[4] = self;
    unsigned int v13 = v11 & (0x540u >> v8);
    BOOL v17 = v8 == 1;
    char v18 = v11 & (0x540u >> v8);
    id v16 = v6;
    dispatch_sync(v12, block);
    if (v8 == 1)
    {
      *(&self->super._listensPassively + 2) = 0;
    }
    else if (v13 && !*(&self->super._listensPassively + 2))
    {
      [(VOTSimpleClickButtonInterceptor *)self _drainQueue:0];
    }
    BOOL v10 = *(&self->super._listensPassively + 2);
    if (*(&self->super._listensPassively + 2)) {
      [(VOTSimpleClickButtonInterceptor *)self _drainQueue:1];
    }
  }
  return v10;
}

- (void)_drainQueue:(BOOL)a3
{
  v3 = *(NSObject **)&self->_clickDown;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010D0B4;
  v4[3] = &unk_1001B4658;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(v3, v4);
}

- (id)simpleClickHandler
{
  return self->_accessQueue;
}

- (void)setSimpleClickHandler:(id)a3
{
}

- (SCRCTargetSelectorTimer)timer
{
  return (SCRCTargetSelectorTimer *)self->_simpleClickHandler;
}

- (void)setTimer:(id)a3
{
}

- (NSMutableArray)eventQueue
{
  return (NSMutableArray *)self->_timer;
}

- (void)setEventQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_simpleClickHandler, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_clickDown, 0);
}

@end
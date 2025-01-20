@interface VOTDragOutputManager
- (VOTDragOutputManager)init;
- (void)_announceDragCount;
- (void)_announceDragPickup;
- (void)_announceDropReady;
- (void)_announceDropUnready;
- (void)currentElementChanged;
- (void)dragCancelled;
- (void)dragDropped;
- (void)dragEnded;
- (void)dragMoved;
- (void)dragSessionStarted;
- (void)dragStatusChanged:(id)a3;
@end

@implementation VOTDragOutputManager

- (VOTDragOutputManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VOTDragOutputManager;
  v2 = [(VOTDragOutputManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.VoiceOver.dragoutput", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_dragActive = 0;
    v2->_dropReadyAnnounced = 0;
    currentStatus = v2->_currentStatus;
    v2->_currentStatus = 0;

    v6 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:v2->_queue];
    timer = v2->_timer;
    v2->_timer = v6;

    v2->_lastDragMove = -3061152000.0;
  }
  return v2;
}

- (void)dragSessionStarted
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ECD24;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dragMoved
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ECDB0;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dragStatusChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000ECF30;
  v7[3] = &unk_1001B3448;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dragEnded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED1E0;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)currentElementChanged
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED27C;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dragDropped
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED304;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dragCancelled
{
}

- (void)_announceDragPickup
{
  id v3 = +[VOTOutputManager outputManager];
  v2 = +[VOSOutputEvent DidBeginPassthrough];
  [v3 sendEvent:v2];
}

- (void)_announceDragCount
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED4E8;
  block[3] = &unk_1001B33B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_announceDropReady
{
  sub_100051804(off_1001EA9E8, @"drop.ready", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  +[VOTOutputRequest sendRequestWithString:v2 shouldQueue:1];
}

- (void)_announceDropUnready
{
  sub_100051804(off_1001EA9E8, @"drop.unready", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  +[VOTOutputRequest sendRequestWithString:v2 shouldQueue:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_currentStatus, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
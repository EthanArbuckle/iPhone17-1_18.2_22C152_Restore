@interface CSDarwinVoiceTriggerHandlerPool
- (CSDarwinVoiceTriggerHandlerPool)initWithVoiceTriggerEventsCoordinator:(id)a3;
- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator;
- (NSMutableArray)handlers;
- (OS_dispatch_queue)queue;
- (OS_remote_device_browser)deviceBrowser;
- (void)_createHandlerWithDevice:(id)a3;
- (void)didReceiveDarwinDeviceDisconnected:(id)a3;
- (void)onDaemonExit;
- (void)setDeviceBrowser:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVoiceTriggerEventsCoordinator:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation CSDarwinVoiceTriggerHandlerPool

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceBrowser, 0);
  objc_destroyWeak((id *)&self->_voiceTriggerEventsCoordinator);
}

- (void)setHandlers:(id)a3
{
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDeviceBrowser:(id)a3
{
}

- (OS_remote_device_browser)deviceBrowser
{
  return self->_deviceBrowser;
}

- (void)setVoiceTriggerEventsCoordinator:(id)a3
{
}

- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceTriggerEventsCoordinator);
  return (CSVoiceTriggerEventsCoordinator *)WeakRetained;
}

- (void)didReceiveDarwinDeviceDisconnected:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029240;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_createHandlerWithDevice:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [CSDarwinVoiceTriggerHandler alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceTriggerEventsCoordinator);
  id v8 = [(CSDarwinVoiceTriggerHandler *)v6 initWithRemoteDevice:v5 voiceTriggerEventsCoordinator:WeakRetained delegate:self];

  if (v8)
  {
    [(CSDarwinVoiceTriggerHandler *)v8 start];
    [(NSMutableArray *)self->_handlers addObject:v8];
  }
}

- (void)onDaemonExit
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000295B4;
  v16 = sub_1000295C4;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000295CC;
  block[3] = &unk_100253A90;
  block[4] = self;
  block[5] = &v12;
  dispatch_async_and_wait(queue, block);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "onDaemonExit", (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)stop
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000295B4;
  v16 = sub_1000295C4;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000297D8;
  block[3] = &unk_100253A90;
  block[4] = self;
  block[5] = &v12;
  dispatch_async_and_wait(queue, block);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "stop", (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)start
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  started = (OS_remote_device_browser *)remote_device_start_browsing();
  deviceBrowser = self->_deviceBrowser;
  self->_deviceBrowser = started;

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (CSDarwinVoiceTriggerHandlerPool)initWithVoiceTriggerEventsCoordinator:(id)a3
{
  id v4 = a3;
  if (+[CSUtils supportRemoteDarwinVoiceTrigger])
  {
    v12.receiver = self;
    v12.super_class = (Class)CSDarwinVoiceTriggerHandlerPool;
    id v5 = [(CSDarwinVoiceTriggerHandlerPool *)&v12 init];
    if (v5)
    {
      dispatch_queue_t v6 = dispatch_queue_create("CSDarwinVoiceTriggerHandlerPool", 0);
      queue = v5->_queue;
      v5->_queue = (OS_dispatch_queue *)v6;

      objc_storeWeak((id *)&v5->_voiceTriggerEventsCoordinator, v4);
      uint64_t v8 = +[NSMutableArray array];
      handlers = v5->_handlers;
      v5->_handlers = (NSMutableArray *)v8;
    }
    self = v5;
    long long v10 = self;
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

@end
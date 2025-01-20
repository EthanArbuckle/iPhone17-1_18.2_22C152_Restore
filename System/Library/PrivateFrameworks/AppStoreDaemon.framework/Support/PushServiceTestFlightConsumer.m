@interface PushServiceTestFlightConsumer
- (void)_handleBagChangedNotification:(id)a3;
- (void)dealloc;
- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4;
- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5;
@end

@implementation PushServiceTestFlightConsumer

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PushServiceTestFlightConsumer;
  [(PushServiceTestFlightConsumer *)&v4 dealloc];
}

- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4
{
  id v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003687A0;
  v8[3] = &unk_1005218C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100368B2C;
  v9[3] = &unk_1005218C0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, v9);
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100368D88;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unsentPushToken, 0);
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_testFlightServiceHost, 0);
}

@end
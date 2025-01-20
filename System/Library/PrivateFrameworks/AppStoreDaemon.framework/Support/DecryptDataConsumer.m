@interface DecryptDataConsumer
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation DecryptDataConsumer

- (void)dealloc
{
  free(self->_partialSampleBuffer);
  self->_partialSampleBuffer = 0;
  free(self->_sampleSizes);
  self->_sampleSizes = 0;
  session = self->_session;
  if (session)
  {
    sub_1000FD3C0((uint64_t)session);
    self->_session = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DecryptDataConsumer;
  [(DecryptDataConsumer *)&v4 dealloc];
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  consumerQueue = self->_consumerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002345A8;
  block[3] = &unk_100521DE0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(consumerQueue, block);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100234CA8;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100235010;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023523C;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100235390;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002354E4;
  v7[3] = &unk_100521698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamAdapter, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_digestVerifier, 0);
  objc_storeStrong((id *)&self->_consumerQueue, 0);
}

@end
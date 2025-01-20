@interface DVTSecureSocketProxy
- (BOOL)cancelled;
- (DVTSecureSocketProxyBufferPool)receiveFromConnectionBufferPool;
- (OS_dispatch_group)sendToConnectionCompleted;
- (OS_dispatch_io)socketIOChannel;
- (OS_dispatch_queue)ioQueue;
- (OS_dispatch_queue)receiveFromConnectionQueue;
- (OS_dispatch_queue)sendToConnectionQueue;
- (OS_dispatch_source)canReceiveFromConnection;
- (OS_dispatch_source)canSendToConnection;
- (id)cleanupConnection;
- (id)receiveDataFromConnection;
- (id)sendDataToConnection;
- (unint64_t)pendingWrites;
- (void)_onIOQueue_cancelProxy;
- (void)_onIOQueue_finishCleanup;
- (void)_onIOQueue_sendDataToConnection:(id)a3;
- (void)readDataFromSocketAndSendToConnection;
- (void)receiveDataFromConnectionAndWriteToSocket;
- (void)setCanReceiveFromConnection:(id)a3;
- (void)setCanSendToConnection:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCleanupConnection:(id)a3;
- (void)setIoQueue:(id)a3;
- (void)setPendingWrites:(unint64_t)a3;
- (void)setReceiveDataFromConnection:(id)a3;
- (void)setReceiveFromConnectionBufferPool:(id)a3;
- (void)setReceiveFromConnectionQueue:(id)a3;
- (void)setSendDataToConnection:(id)a3;
- (void)setSendToConnectionCompleted:(id)a3;
- (void)setSendToConnectionQueue:(id)a3;
- (void)setSocketIOChannel:(id)a3;
@end

@implementation DVTSecureSocketProxy

- (void)_onIOQueue_cancelProxy
{
  v3 = [(DVTSecureSocketProxy *)self ioQueue];
  dispatch_assert_queue_V2(v3);

  if (![(DVTSecureSocketProxy *)self cancelled])
  {
    [(DVTSecureSocketProxy *)self setCancelled:1];
    [(DVTSecureSocketProxy *)self setSendDataToConnection:0];
    [(DVTSecureSocketProxy *)self setReceiveDataFromConnection:0];
    if (![(DVTSecureSocketProxy *)self pendingWrites])
    {
      v4 = [(DVTSecureSocketProxy *)self socketIOChannel];
      dispatch_io_close(v4, 1uLL);
    }
    v5 = [(DVTSecureSocketProxy *)self canReceiveFromConnection];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_230891718;
    handler[3] = &unk_264B8D590;
    handler[4] = self;
    dispatch_source_set_cancel_handler(v5, handler);

    v6 = [(DVTSecureSocketProxy *)self canSendToConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_230891800;
    v9[3] = &unk_264B8D590;
    v9[4] = self;
    dispatch_source_set_cancel_handler(v6, v9);

    v7 = [(DVTSecureSocketProxy *)self canReceiveFromConnection];
    dispatch_source_cancel(v7);

    v8 = [(DVTSecureSocketProxy *)self canSendToConnection];
    dispatch_source_cancel(v8);
  }
}

- (void)_onIOQueue_finishCleanup
{
  v3 = [(DVTSecureSocketProxy *)self ioQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(DVTSecureSocketProxy *)self cleanupConnection];
  if (v4)
  {
    id v8 = (id)v4;
    v5 = [(DVTSecureSocketProxy *)self canReceiveFromConnection];
    if (v5
      || ([(DVTSecureSocketProxy *)self canSendToConnection],
          (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v6 = [(DVTSecureSocketProxy *)self socketIOChannel];

      if (!v6)
      {
        v7 = [(DVTSecureSocketProxy *)self cleanupConnection];
        v7[2]();

        [(DVTSecureSocketProxy *)self setCleanupConnection:0];
      }
    }
  }
}

- (void)receiveDataFromConnectionAndWriteToSocket
{
  v3 = [(DVTSecureSocketProxy *)self receiveFromConnectionQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_230891B44;
  v12 = sub_230891B54;
  uint64_t v4 = [(DVTSecureSocketProxy *)self receiveFromConnectionBufferPool];
  id v13 = [v4 blockingAcquireBuffer];

  v5 = [(DVTSecureSocketProxy *)self ioQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_230891B5C;
  v7[3] = &unk_264B8DDD8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v5, v7);

  if (v9[5])
  {
    v6 = [(DVTSecureSocketProxy *)self receiveFromConnectionBufferPool];
    [v6 releaseBuffer:v9[5]];
  }
  _Block_object_dispose(&v8, 8);
}

- (void)readDataFromSocketAndSendToConnection
{
  v3 = [(DVTSecureSocketProxy *)self sendToConnectionQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(DVTSecureSocketProxy *)self ioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_230892034;
  block[3] = &unk_264B8D590;
  block[4] = self;
  dispatch_sync(v4, block);

  v5 = [(DVTSecureSocketProxy *)self sendToConnectionCompleted];
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_onIOQueue_sendDataToConnection:(id)a3
{
  uint64_t v4 = a3;
  v5 = [(DVTSecureSocketProxy *)self ioQueue];
  dispatch_assert_queue_V2(v5);

  if (![(DVTSecureSocketProxy *)self cancelled])
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = sub_2308923D0;
    applier[3] = &unk_264B8DE28;
    applier[4] = self;
    dispatch_data_apply(v4, applier);
  }
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (void)setIoQueue:(id)a3
{
}

- (OS_dispatch_queue)receiveFromConnectionQueue
{
  return self->_receiveFromConnectionQueue;
}

- (void)setReceiveFromConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)sendToConnectionQueue
{
  return self->_sendToConnectionQueue;
}

- (void)setSendToConnectionQueue:(id)a3
{
}

- (DVTSecureSocketProxyBufferPool)receiveFromConnectionBufferPool
{
  return self->_receiveFromConnectionBufferPool;
}

- (void)setReceiveFromConnectionBufferPool:(id)a3
{
}

- (OS_dispatch_group)sendToConnectionCompleted
{
  return self->_sendToConnectionCompleted;
}

- (void)setSendToConnectionCompleted:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (OS_dispatch_io)socketIOChannel
{
  return self->_socketIOChannel;
}

- (void)setSocketIOChannel:(id)a3
{
}

- (unint64_t)pendingWrites
{
  return self->_pendingWrites;
}

- (void)setPendingWrites:(unint64_t)a3
{
  self->_pendingWrites = a3;
}

- (OS_dispatch_source)canReceiveFromConnection
{
  return self->_canReceiveFromConnection;
}

- (void)setCanReceiveFromConnection:(id)a3
{
}

- (OS_dispatch_source)canSendToConnection
{
  return self->_canSendToConnection;
}

- (void)setCanSendToConnection:(id)a3
{
}

- (id)receiveDataFromConnection
{
  return self->_receiveDataFromConnection;
}

- (void)setReceiveDataFromConnection:(id)a3
{
}

- (id)sendDataToConnection
{
  return self->_sendDataToConnection;
}

- (void)setSendDataToConnection:(id)a3
{
}

- (id)cleanupConnection
{
  return self->_cleanupConnection;
}

- (void)setCleanupConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cleanupConnection, 0);
  objc_storeStrong(&self->_sendDataToConnection, 0);
  objc_storeStrong(&self->_receiveDataFromConnection, 0);
  objc_storeStrong((id *)&self->_canSendToConnection, 0);
  objc_storeStrong((id *)&self->_canReceiveFromConnection, 0);
  objc_storeStrong((id *)&self->_socketIOChannel, 0);
  objc_storeStrong((id *)&self->_sendToConnectionCompleted, 0);
  objc_storeStrong((id *)&self->_receiveFromConnectionBufferPool, 0);
  objc_storeStrong((id *)&self->_sendToConnectionQueue, 0);
  objc_storeStrong((id *)&self->_receiveFromConnectionQueue, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

@end
@interface BLTBulletinSendQueuePassthrough
- (BLTBulletinSendQueueDelegate)delegate;
- (BOOL)handleFileURL:(id)a3;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5 didQueue:(id)a6;
- (void)sendRequest:(id)a3 withTimeout:(id)a4 didSend:(id)a5;
- (void)sendRequest:(id)a3 withTimeout:(id)a4 isTrafficRestricted:(BOOL)a5 didSend:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation BLTBulletinSendQueuePassthrough

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 didSend:(id)a5 didQueue:(id)a6
{
  uint64_t v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(BLTBulletinSendQueuePassthrough *)self delegate];
  [v13 sendRequest:v12 type:v7 withTimeout:0 didSend:v11 didQueue:v10];
}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 isTrafficRestricted:(BOOL)a5 didSend:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(BLTBulletinSendQueuePassthrough *)self delegate];
  [v12 sendRequest:v11 type:1 withTimeout:v10 didSend:v9 didQueue:0];
}

- (void)sendRequest:(id)a3 withTimeout:(id)a4 didSend:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BLTBulletinSendQueuePassthrough *)self delegate];
  [v11 sendRequest:v10 type:27 withTimeout:v9 didSend:v8 didQueue:0];
}

- (BOOL)handleFileURL:(id)a3
{
  return 0;
}

- (BLTBulletinSendQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTBulletinSendQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
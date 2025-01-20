@interface IDSAppleCareDaemonResponseListener
- (IDSAppleCareDaemonResponseListener)initWithDisconnectedBlockAndNoTimeout:(id)a3;
- (IDSAppleCareDaemonResponseListener)initWithRequestTimer:(id)a3;
- (void)applecareResponseForRequestID:(id)a3 withError:(id)a4;
- (void)daemonDisconnected;
@end

@implementation IDSAppleCareDaemonResponseListener

- (IDSAppleCareDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAppleCareDaemonResponseListener;
  v6 = [(IDSAppleCareDaemonResponseListener *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestTimer, a3);
  }

  return v7;
}

- (IDSAppleCareDaemonResponseListener)initWithDisconnectedBlockAndNoTimeout:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSAppleCareDaemonResponseListener;
  id v5 = [(IDSAppleCareDaemonResponseListener *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id disconnectedBlock = v5->_disconnectedBlock;
    v5->_id disconnectedBlock = (id)v6;
  }
  return v5;
}

- (void)applecareResponseForRequestID:(id)a3 withError:(id)a4
{
  id v6 = a4;
  v7 = [(IDSDaemonRequestTimer *)self->_requestTimer invalidateTimeoutAndReturnHandlerForRequestID:a3];
  v8 = [v7 block];
  uint64_t v9 = [v7 queue];
  v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191950C68;
    v12[3] = &unk_1E5729230;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
}

- (void)daemonDisconnected
{
  id disconnectedBlock = (void (**)(void))self->_disconnectedBlock;
  if (disconnectedBlock) {
    disconnectedBlock[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectedBlock, 0);

  objc_storeStrong((id *)&self->_requestTimer, 0);
}

@end
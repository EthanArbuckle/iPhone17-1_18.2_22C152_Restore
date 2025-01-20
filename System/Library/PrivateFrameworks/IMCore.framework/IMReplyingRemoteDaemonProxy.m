@interface IMReplyingRemoteDaemonProxy
- (BOOL)synchronousReplies;
- (IMDaemonController)daemonController;
- (IMReplyingRemoteDaemonProxy)initWithDaemonController:(id)a3 synchronousReplies:(BOOL)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setSynchronousReplies:(BOOL)a3;
@end

@implementation IMReplyingRemoteDaemonProxy

- (IMReplyingRemoteDaemonProxy)initWithDaemonController:(id)a3 synchronousReplies:(BOOL)a4
{
  if (self)
  {
    objc_storeWeak((id *)&self->_daemonController, a3);
    self->_synchronousReplies = a4;
  }
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v5 = objc_msgSend_daemonController(self, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_methodSignatureForSelector_(v5, v6, (uint64_t)a3, v7);

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_daemonController(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_synchronousReplies(self, v9, v10, v11);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1A4C04758;
  v15[3] = &unk_1E5B7B130;
  id v16 = v4;
  v17 = self;
  id v13 = v4;
  objc_msgSend_sendQueryWithReply_query_(v8, v14, v12, (uint64_t)v15);
}

- (BOOL)synchronousReplies
{
  return self->_synchronousReplies;
}

- (void)setSynchronousReplies:(BOOL)a3
{
  self->_synchronousReplies = a3;
}

- (IMDaemonController)daemonController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonController);

  return (IMDaemonController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
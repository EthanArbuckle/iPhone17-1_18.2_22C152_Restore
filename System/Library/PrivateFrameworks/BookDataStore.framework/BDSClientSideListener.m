@interface BDSClientSideListener
- (BDSClientSideProtocol)delegate;
- (void)handleServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BDSClientSideListener

- (void)handleServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4
{
  id v6 = a3;
  objc_msgSend_delegate(self, v7, v8, v9, v10, v11, v12, v13);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleServiceNotificationNames_latestChangeToken_(v19, v14, (uint64_t)v6, a4, v15, v16, v17, v18);
}

- (BDSClientSideProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BDSClientSideProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
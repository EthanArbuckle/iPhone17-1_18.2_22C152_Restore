@interface CKDCancelToken
- (BOOL)isCancelled;
- (id)cancelAction;
- (void)cancel;
- (void)setCancelAction:(id)a3;
@end

@implementation CKDCancelToken

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)cancel
{
  self->_isCancelled = 1;
  v5 = objc_msgSend_cancelAction(self, a2, v2, v3);

  if (v5)
  {
    objc_msgSend_cancelAction(self, v6, v7, v8);
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
  }
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
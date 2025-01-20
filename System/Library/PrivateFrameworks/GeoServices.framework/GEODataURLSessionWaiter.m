@interface GEODataURLSessionWaiter
- (GEODataURLSessionWaiter)init;
- (void)cancel;
- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4;
@end

@implementation GEODataURLSessionWaiter

- (GEODataURLSessionWaiter)init
{
  result = (GEODataURLSessionWaiter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self)
  {
    v7 = (void (**)(id, id))self->_handler;
    objc_setProperty_nonatomic_copy(self, v8, 0, 24);
    id strongReferenceToSelf = self->_strongReferenceToSelf;
    self->_id strongReferenceToSelf = 0;

    if (!v7) {
      goto LABEL_5;
    }
    v7[2](v7, v6);
  }
  else
  {
    v7 = (void (**)(id, id))MEMORY[0x20];
    MEMORY[0x20] = 0;
  }

LABEL_5:
}

- (void)cancel
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongReferenceToSelf, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end
@interface SLAssistantFacebookPost
- (id)session;
- (void)dealloc;
- (void)performCreateWithObject:(id)a3 completion:(id)a4;
- (void)performPostRequestWithObject:(id)a3 completion:(id)a4;
@end

@implementation SLAssistantFacebookPost

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SLAssistantFacebookPost;
  [(SLAssistantFacebookPost *)&v3 dealloc];
}

- (id)session
{
  id result = self->_session;
  if (!result)
  {
    id result = objc_alloc_init((Class)SLFacebookSession);
    self->_session = (SLFacebookSession *)result;
  }
  return result;
}

- (void)performCreateWithObject:(id)a3 completion:(id)a4
{
  if (+[ACAccountStore accountsWithAccountTypeIdentifierExist:ACAccountTypeIdentifierFacebook] == 1)id v5 = 0; {
  else
  }
    id v5 = [+[SACommandFailed commandFailedWithErrorCode:1301] dictionary];
  v6 = (void (*)(id, id))*((void *)a4 + 2);

  v6(a4, v5);
}

- (void)performPostRequestWithObject:(id)a3 completion:(id)a4
{
  id v5 = [a3 identifier];
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (v6 = +[SACommandFailed commandFailedWithReason:](SACommandFailed, "commandFailedWithReason:", @"Received object of the wrong type.")) == 0)&& ([v5 content]|| (v6 = +[SACommandFailed commandFailedWithReason:](SACommandFailed, "commandFailedWithReason:", @"No string to send.")) == 0))
  {
    v8 = (void (*)(id, id))*((void *)a4 + 2);
    id v7 = &__NSDictionary0__struct;
  }
  else
  {
    id v7 = [(SACommandFailed *)v6 dictionary];
    v8 = (void (*)(id, id))*((void *)a4 + 2);
  }

  v8(a4, v7);
}

@end
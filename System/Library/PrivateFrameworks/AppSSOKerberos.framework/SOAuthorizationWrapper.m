@interface SOAuthorizationWrapper
- (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4;
- (SOAuthorizationWrapper)init;
- (id)authorizationCompletion;
- (void)authorization:(id)a3 didCompleteWithError:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5;
- (void)authorizationDidCancel:(id)a3;
- (void)authorizationDidComplete:(id)a3;
- (void)authorizationDidNotHandle:(id)a3;
- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6 andCompletion:(id)a7;
- (void)setAuthorizationCompletion:(id)a3;
@end

@implementation SOAuthorizationWrapper

- (SOAuthorizationWrapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)SOAuthorizationWrapper;
  v2 = [(SOAuthorizationWrapper *)&v7 init];
  if (v2)
  {
    v3 = (SOAuthorizationCore *)objc_alloc_init(MEMORY[0x263F25280]);
    authorization = v2->_authorization;
    v2->_authorization = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppSSO.wrapper", 0);
    [(SOAuthorizationCore *)v2->_authorization setDelegateDispatchQueue:v5];

    [(SOAuthorizationCore *)v2->_authorization setDelegate:v2];
  }
  return v2;
}

- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6 andCompletion:(id)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v17 = a3;
  v15 = (void *)MEMORY[0x223C7F7B0](a7);
  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = v15;

  [(SOAuthorizationCore *)self->_authorization beginAuthorizationWithOperation:v17 url:v14 httpHeaders:v13 httpBody:v12];
}

- (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4
{
  return [MEMORY[0x263F25280] canPerformAuthorizationWithURL:a3 responseCode:a4];
}

- (void)authorizationDidNotHandle:(id)a3
{
  (*((void (**)(void))self->_authorizationCompletion + 2))();
  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (void)authorizationDidCancel:(id)a3
{
  (*((void (**)(void))self->_authorizationCompletion + 2))();
  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (void)authorizationDidComplete:(id)a3
{
  (*((void (**)(void))self->_authorizationCompletion + 2))();
  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  (*((void (**)(void))self->_authorizationCompletion + 2))();
  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  id authorizationCompletion = (void (**)(id, uint64_t, void *, void))self->_authorizationCompletion;
  objc_super v7 = objc_msgSend(a4, "allHeaderFields", a3);
  authorizationCompletion[2](authorizationCompletion, 1, v7, 0);

  id v8 = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  (*((void (**)(void))self->_authorizationCompletion + 2))();
  id authorizationCompletion = self->_authorizationCompletion;
  self->_id authorizationCompletion = 0;
}

- (id)authorizationCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthorizationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationCompletion, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

@end
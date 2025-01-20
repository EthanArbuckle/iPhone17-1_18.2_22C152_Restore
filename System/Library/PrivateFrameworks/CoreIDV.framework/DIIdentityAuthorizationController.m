@interface DIIdentityAuthorizationController
- (DIIdentityAuthorizationController)init;
- (_TtC7CoreIDV25DigitalPresentmentSession)session;
- (void)cancelRequest;
- (void)checkCanRequestDocument:(id)a3 completion:(id)a4;
- (void)requestDocument:(id)a3 completion:(id)a4;
- (void)setSession:(id)a3;
@end

@implementation DIIdentityAuthorizationController

- (DIIdentityAuthorizationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIIdentityAuthorizationController;
  v2 = [(DIIdentityAuthorizationController *)&v5 init];
  v3 = objc_alloc_init(_TtC7CoreIDV25DigitalPresentmentSession);
  [(DIIdentityAuthorizationController *)v2 setSession:v3];

  return v2;
}

- (void)checkCanRequestDocument:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DIIdentityAuthorizationController *)self session];
  [v8 checkCanRequestDocument:v7 completionHandler:v6];
}

- (void)requestDocument:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DIIdentityAuthorizationController *)self session];
  [v8 requestDocument:v7 completionHandler:v6];
}

- (void)cancelRequest
{
  id v2 = [(DIIdentityAuthorizationController *)self session];
  [v2 cancelRequest];
}

- (_TtC7CoreIDV25DigitalPresentmentSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
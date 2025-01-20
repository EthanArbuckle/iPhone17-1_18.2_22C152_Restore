@interface ReviewDialogCoordinator
- (_TtC20AppleMediaServicesUI23ReviewDialogCoordinator)init;
- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6;
- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleDialogRequest:(AMSDialogRequest *)a5 completion:(id)a6;
@end

@implementation ReviewDialogCoordinator

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleDialogRequest:(AMSDialogRequest *)a5 completion:(id)a6
{
}

- (_TtC20AppleMediaServicesUI23ReviewDialogCoordinator)init
{
  return (_TtC20AppleMediaServicesUI23ReviewDialogCoordinator *)ReviewDialogCoordinator.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__authenticateRequest));
  sub_21C204BE8((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__authenticateContinuation, &qword_267C7AC40);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__dialogRequest));
  sub_21C204BE8((uint64_t)self + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator__dialogContinuation, &qword_267C7AC58);
  v3 = (char *)self + OBJC_IVAR____TtC20AppleMediaServicesUI23ReviewDialogCoordinator___observationRegistrar;
  sub_21C2BD840();
  OUTLINED_FUNCTION_3();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

@end
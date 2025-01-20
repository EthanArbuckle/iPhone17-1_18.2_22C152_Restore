@interface PasswordSettingsViewModel
- (_TtC20AppleMediaServicesUI25PasswordSettingsViewModel)init;
- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6;
- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleDialogRequest:(AMSDialogRequest *)a5 completion:(id)a6;
- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 completion:(id)a4;
- (void)handleDialogRequest:(AMSDialogRequest *)a3 completion:(id)a4;
@end

@implementation PasswordSettingsViewModel

- (_TtC20AppleMediaServicesUI25PasswordSettingsViewModel)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20AppleMediaServicesUI25PasswordSettingsViewModel_account));
  v3 = (char *)self + OBJC_IVAR____TtC20AppleMediaServicesUI25PasswordSettingsViewModel__isUpdating;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267C782D0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6
{
}

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleDialogRequest:(AMSDialogRequest *)a5 completion:(id)a6
{
}

- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 completion:(id)a4
{
}

- (void)handleDialogRequest:(AMSDialogRequest *)a3 completion:(id)a4
{
}

@end
@interface AuthURLDelegate
- (_TtC12amsaccountsd15AuthURLDelegate)init;
- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6;
@end

@implementation AuthURLDelegate

- (_TtC12amsaccountsd15AuthURLDelegate)init
{
  return (_TtC12amsaccountsd15AuthURLDelegate *)sub_10008F678();
}

- (void)AMSURLSession:(AMSURLSession *)a3 task:(NSURLSessionTask *)a4 handleAuthenticateRequest:(AMSAuthenticateRequest *)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_10000E8D0((uint64_t)&unk_10012EF80, (uint64_t)v11);
}

@end
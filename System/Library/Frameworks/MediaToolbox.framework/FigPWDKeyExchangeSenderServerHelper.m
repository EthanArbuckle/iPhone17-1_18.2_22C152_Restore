@interface FigPWDKeyExchangeSenderServerHelper
- (FigPWDKeyExchangeSenderServerHelper)init;
- (FigPWDKeyExchangeSenderServerHelper)initWithKeyServerURLString:(id)a3 certServerURLString:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)requestCertDataFromServer:(id)a3;
- (void)requestKeyDataFromServer:(id)a3 completionHandler:(id)a4;
@end

@implementation FigPWDKeyExchangeSenderServerHelper

- (FigPWDKeyExchangeSenderServerHelper)init
{
  return [(FigPWDKeyExchangeSenderServerHelper *)self initWithKeyServerURLString:0 certServerURLString:0];
}

- (FigPWDKeyExchangeSenderServerHelper)initWithKeyServerURLString:(id)a3 certServerURLString:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)FigPWDKeyExchangeSenderServerHelper;
  v6 = [(FigPWDKeyExchangeSenderServerHelper *)&v11 init];
  if (v6)
  {
    if (!a3) {
      a3 = @"https://mortimer.apple.com/drm/fppas/Q1.0.0/m";
    }
    if (!a4) {
      a4 = @"https://mortimer.apple.com/Mortimer/mortimer2048-apple.cer";
    }
    v6->_keyServerURL = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:a3];
    v6->_certServerURL = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:a4];
    v6->_opQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v7 = [MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
    v8 = (NSURLSession *)[MEMORY[0x1E4F18DC0] sessionWithConfiguration:v7 delegate:v6 delegateQueue:v6->_opQueue];
    v6->_URLSession = v8;
    v9 = v8;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigPWDKeyExchangeSenderServerHelper;
  [(FigPWDKeyExchangeSenderServerHelper *)&v3 dealloc];
}

- (void)requestCertDataFromServer:(id)a3
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:self->_certServerURL cachePolicy:1 timeoutInterval:600.0];
  URLSession = self->_URLSession;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__FigPWDKeyExchangeSenderServerHelper_requestCertDataFromServer___block_invoke;
  v7[3] = &unk_1E57A36D8;
  v7[4] = a3;
  [(NSURLSessionDataTask *)[(NSURLSession *)URLSession dataTaskWithRequest:v5 completionHandler:v7] resume];
}

void __65__FigPWDKeyExchangeSenderServerHelper_requestCertDataFromServer___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199711A30]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestKeyDataFromServer:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:self->_keyServerURL cachePolicy:1 timeoutInterval:600.0];
  [v7 setHTTPMethod:@"POST"];
  [v7 setHTTPBody:a3];
  URLSession = self->_URLSession;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__FigPWDKeyExchangeSenderServerHelper_requestKeyDataFromServer_completionHandler___block_invoke;
  v9[3] = &unk_1E57A36D8;
  v9[4] = a4;
  [(NSURLSessionDataTask *)[(NSURLSession *)URLSession dataTaskWithRequest:v7 completionHandler:v9] resume];
}

void __82__FigPWDKeyExchangeSenderServerHelper_requestKeyDataFromServer_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199711A30]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  v6 = (void *)MEMORY[0x199711A30](self, a2, a3, a4);
  (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
}

@end
@interface GEORPProblemOptInRequester
+ (id)sharedInstance;
- (id)_validateResponse:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5;
@end

@implementation GEORPProblemOptInRequester

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__GEORPProblemOptInRequester_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29F3E0 != -1) {
    dispatch_once(&qword_1EB29F3E0, block);
  }
  v2 = (void *)qword_1EB29F3D8;

  return v2;
}

void __44__GEORPProblemOptInRequester_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB29F3D8;
  qword_1EB29F3D8 = (uint64_t)v1;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[GEORPProblemOptInRequestConfig standardConfig];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__GEORPProblemOptInRequester_startWithRequest_traits_completionHandler___block_invoke;
  v13[3] = &unk_1E53D7E50;
  id v14 = v8;
  id v12 = v8;
  [(GEOServiceRequester *)self _startWithRequest:v10 traits:v9 auditToken:0 config:v11 throttleToken:0 options:0 completionHandler:v13];
}

uint64_t __72__GEORPProblemOptInRequester_startWithRequest_traits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_validateResponse:(id)a3
{
  int v3 = [a3 statusCode];
  if (v3)
  {
    uint64_t v4 = -7;
    if (v3 == 20) {
      uint64_t v4 = -8;
    }
    if (v3 == 5) {
      uint64_t v5 = -10;
    }
    else {
      uint64_t v5 = v4;
    }
    v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
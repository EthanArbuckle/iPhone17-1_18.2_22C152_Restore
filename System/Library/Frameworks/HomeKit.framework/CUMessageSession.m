@interface CUMessageSession
@end

@implementation CUMessageSession

void __89__CUMessageSession_HMCUMessageSession__sendRequestData_qualityOfService_responseHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  if (a2)
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:a2 userInfo:0];
  }
  else
  {
    v6 = 0;
  }
  v7 = [v10 dataForKey:@"da"];
  v8 = [v10 errorForKey:@"err"];
  if (v8) {
    v9 = v8;
  }
  else {
    v9 = v6;
  }
  (*(void (**)(void, void *, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, v7);
}

@end
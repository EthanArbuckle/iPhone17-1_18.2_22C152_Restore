@interface ASDIAPInfoUpdateRequest
+ (int64_t)requestType;
- (ASDIAPInfoUpdateRequest)init;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation ASDIAPInfoUpdateRequest

- (ASDIAPInfoUpdateRequest)init
{
  return (ASDIAPInfoUpdateRequest *)-[ASDEphemeralRequest _initWithOptions:](self, 0);
}

+ (int64_t)requestType
{
  return 5;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __52__ASDIAPInfoUpdateRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E58B30E0;
  id v7 = v4;
  id v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);
}

uint64_t __52__ASDIAPInfoUpdateRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

@end
@interface ASDAccountLookupRequest
+ (int64_t)requestType;
- (ASDAccountLookupRequest)initWithOptions:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation ASDAccountLookupRequest

- (ASDAccountLookupRequest)initWithOptions:(id)a3
{
  return (ASDAccountLookupRequest *)-[ASDEphemeralRequest _initWithOptions:](self, a3);
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __52__ASDAccountLookupRequest_startWithCompletionBlock___block_invoke;
  newValue[3] = &unk_1E58B30E0;
  id v7 = v4;
  id v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);
}

void __52__ASDAccountLookupRequest_startWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v4;
    v6 = [v4 error];
    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);

    id v4 = v7;
  }
}

+ (int64_t)requestType
{
  return 0;
}

@end
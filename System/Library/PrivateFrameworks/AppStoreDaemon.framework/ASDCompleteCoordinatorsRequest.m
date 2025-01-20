@interface ASDCompleteCoordinatorsRequest
+ (int64_t)requestType;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation ASDCompleteCoordinatorsRequest

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __61__ASDCompleteCoordinatorsRequest_startWithCompletionHandler___block_invoke;
  newValue[3] = &unk_1E58B30E0;
  id v7 = v4;
  id v5 = v4;
  -[ASDEphemeralRequest _startWithCompletionHandler:](self, (char *)newValue);
}

void __61__ASDCompleteCoordinatorsRequest_startWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = a4;
    (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a3 success], v6);
  }
}

+ (int64_t)requestType
{
  return 1;
}

@end
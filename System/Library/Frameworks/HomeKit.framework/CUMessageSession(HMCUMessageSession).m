@interface CUMessageSession(HMCUMessageSession)
- (void)sendRequestData:()HMCUMessageSession qualityOfService:responseHandler:;
@end

@implementation CUMessageSession(HMCUMessageSession)

- (void)sendRequestData:()HMCUMessageSession qualityOfService:responseHandler:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v16[0] = @"da";
  v16[1] = @"qos";
  v17[0] = a3;
  v9 = NSNumber;
  id v10 = a3;
  v11 = [v9 numberWithInteger:a4];
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__CUMessageSession_HMCUMessageSession__sendRequestData_qualityOfService_responseHandler___block_invoke;
  v14[3] = &unk_1E59405D8;
  id v15 = v8;
  id v13 = v8;
  [a1 sendRequestID:@"HMDSS.cu.rq" options:0 request:v12 responseHandler:v14];
}

@end
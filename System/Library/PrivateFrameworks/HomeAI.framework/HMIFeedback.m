@interface HMIFeedback
+ (void)submitFeedbackWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5;
+ (void)submitFeedbackWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 runRemotely:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation HMIFeedback

+ (void)submitFeedbackWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 completionHandler:(id)a5
{
}

+ (void)submitFeedbackWithCameraProfileUUID:(id)a3 clipUUID:(id)a4 runRemotely:(BOOL)a5 completionHandler:(id)a6
{
  v18[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v17[0] = @"taskType";
  v17[1] = @"cameraProfileUUID";
  v18[0] = HMITaskTypeFeedbackTask;
  v18[1] = v9;
  v17[2] = @"clipUUID";
  v18[2] = v10;
  v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  if (a5) {
    +[HMITaskService taskServiceClient];
  }
  else {
  v13 = +[HMITaskService taskService];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__HMIFeedback_submitFeedbackWithCameraProfileUUID_clipUUID_runRemotely_completionHandler___block_invoke;
  v15[3] = &unk_26477CF18;
  id v16 = v11;
  id v14 = v11;
  [v13 submitTaskWithOptions:v12 progressHandler:0 completionHandler:v15];
}

uint64_t __90__HMIFeedback_submitFeedbackWithCameraProfileUUID_clipUUID_runRemotely_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
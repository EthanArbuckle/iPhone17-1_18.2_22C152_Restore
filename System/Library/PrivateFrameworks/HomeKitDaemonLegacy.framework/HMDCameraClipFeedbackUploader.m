@interface HMDCameraClipFeedbackUploader
- (void)uploadFeedbackWithCameraProfileUUID:(id)a3 clipModel:(id)a4 completionHandler:(id)a5;
@end

@implementation HMDCameraClipFeedbackUploader

- (void)uploadFeedbackWithCameraProfileUUID:(id)a3 clipModel:(id)a4 completionHandler:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F697F8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 hmbModelID];
  [v7 submitFeedbackWithCameraProfileUUID:v9 clipUUID:v10 completionHandler:v8];
}

@end
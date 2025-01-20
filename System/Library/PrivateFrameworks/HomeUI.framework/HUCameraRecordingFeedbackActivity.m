@interface HUCameraRecordingFeedbackActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (HMCameraClip)cameraClip;
- (HMCameraProfile)cameraProfile;
- (HUCameraRecordingFeedbackActivity)initWithCameraClip:(id)a3 cameraProfile:(id)a4 completionHandler:(id)a5;
- (UINavigationController)previewNavigationController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)submissionHandler;
- (void)prepareWithActivityItems:(id)a3;
- (void)setCameraClip:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setPreviewNavigationController:(id)a3;
- (void)setSubmissionHandler:(id)a3;
@end

@implementation HUCameraRecordingFeedbackActivity

- (HUCameraRecordingFeedbackActivity)initWithCameraClip:(id)a3 cameraProfile:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HUCameraRecordingFeedbackActivity;
  v12 = [(UIActivity *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cameraClip, a3);
    objc_storeStrong((id *)&v13->_cameraProfile, a4);
    v14 = _Block_copy(v11);
    id submissionHandler = v13->_submissionHandler;
    v13->_id submissionHandler = v14;

    v16 = [HUCameraRecordingExportPreviewViewController alloc];
    v17 = [(HUCameraRecordingFeedbackActivity *)v13 cameraClip];
    v18 = [(HUCameraRecordingFeedbackActivity *)v13 cameraProfile];
    v19 = [(HUCameraRecordingFeedbackActivity *)v13 submissionHandler];
    v20 = [(HUCameraRecordingExportPreviewViewController *)v16 initWithCameraClip:v17 cameraProfile:v18 completionHandler:v19];

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v20];
    previewNavigationController = v13->_previewNavigationController;
    v13->_previewNavigationController = (UINavigationController *)v21;
  }
  return v13;
}

- (id)activityType
{
  return @"com.apple.Home.feedbackActivity";
}

- (id)activityTitle
{
  return _HULocalizedStringWithDefaultValue(@"HUCameraExportFeedbackActivityTitle", @"HUCameraExportFeedbackActivityTitle", 1);
}

- (id)activityImage
{
  return (id)[MEMORY[0x1E4F42A80] _systemImageNamed:@"apple.bubble.middle.bottom"];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Preparing with activity items :%@", (uint8_t *)&v5, 0xCu);
  }
}

- (HMCameraClip)cameraClip
{
  return self->_cameraClip;
}

- (void)setCameraClip:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (id)submissionHandler
{
  return self->_submissionHandler;
}

- (void)setSubmissionHandler:(id)a3
{
}

- (UINavigationController)previewNavigationController
{
  return self->_previewNavigationController;
}

- (void)setPreviewNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewNavigationController, 0);
  objc_storeStrong(&self->_submissionHandler, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);

  objc_storeStrong((id *)&self->_cameraClip, 0);
}

@end
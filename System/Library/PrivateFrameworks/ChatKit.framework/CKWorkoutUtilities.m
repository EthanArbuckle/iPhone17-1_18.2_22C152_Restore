@interface CKWorkoutUtilities
+ (BOOL)_presentWorkoutRemoteViewServiceOnHostViewController:(id)a3 withWorkoutData:(id)a4;
+ (void)_launchWorkoutPreviewWithWorkoutData:(id)a3;
@end

@implementation CKWorkoutUtilities

+ (void)_launchWorkoutPreviewWithWorkoutData:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v4 = (void *)getWorkoutKitXPCServiceHelperClass_softClass;
  uint64_t v11 = getWorkoutKitXPCServiceHelperClass_softClass;
  if (!getWorkoutKitXPCServiceHelperClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getWorkoutKitXPCServiceHelperClass_block_invoke;
    v7[3] = &unk_1E5620B90;
    v7[4] = &v8;
    __getWorkoutKitXPCServiceHelperClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  v6 = [v5 sharedInstance];
  [v6 presentWorkoutCompositionData:v3 completion:&__block_literal_global_30];
}

void __59__CKWorkoutUtilities__launchWorkoutPreviewWithWorkoutData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
}

+ (BOOL)_presentWorkoutRemoteViewServiceOnHostViewController:(id)a3 withWorkoutData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v7 = (void *)getWKUIRemoteViewServiceAdaptorClass_softClass;
  uint64_t v20 = getWKUIRemoteViewServiceAdaptorClass_softClass;
  if (!getWKUIRemoteViewServiceAdaptorClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getWKUIRemoteViewServiceAdaptorClass_block_invoke;
    v16[3] = &unk_1E5620B90;
    v16[4] = &v17;
    __getWKUIRemoteViewServiceAdaptorClass_block_invoke((uint64_t)v16);
    v7 = (void *)v18[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v17, 8);
  id v9 = objc_alloc_init(v8);
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__CKWorkoutUtilities__presentWorkoutRemoteViewServiceOnHostViewController_withWorkoutData___block_invoke;
  v13[3] = &unk_1E5620AF8;
  id v14 = v9;
  id v15 = v5;
  id v10 = v5;
  id v11 = v9;
  [v11 presentRemoteViewControllerOnHostController:v10 workoutPlanData:v6 dismissHandler:v13 completionHandler:&__block_literal_global_43];

  return 1;
}

uint64_t __91__CKWorkoutUtilities__presentWorkoutRemoteViewServiceOnHostViewController_withWorkoutData___block_invoke(uint64_t a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 dismissRemoteViewControllerOnHostController:v3];
}

void __91__CKWorkoutUtilities__presentWorkoutRemoteViewServiceOnHostViewController_withWorkoutData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
}

@end
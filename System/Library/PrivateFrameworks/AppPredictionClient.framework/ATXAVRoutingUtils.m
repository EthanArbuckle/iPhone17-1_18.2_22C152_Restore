@interface ATXAVRoutingUtils
+ (BOOL)isTVAppWithBundleId:(id)a3;
+ (BOOL)isTVExperienceAppWithBundleId:(id)a3;
@end

@implementation ATXAVRoutingUtils

+ (BOOL)isTVExperienceAppWithBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)getAVSystemControllerClass_softClass;
  uint64_t v13 = getAVSystemControllerClass_softClass;
  if (!getAVSystemControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getAVSystemControllerClass_block_invoke;
    v9[3] = &unk_1E5D04E28;
    v9[4] = &v10;
    __getAVSystemControllerClass_block_invoke((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  v6 = [v5 sharedAVSystemController];
  char v7 = [v6 hasRouteSharingPolicyLongFormVideo:v3];

  return v7;
}

+ (BOOL)isTVAppWithBundleId:(id)a3
{
  return [a3 isEqualToString:@"com.apple.tv"];
}

@end
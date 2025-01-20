@interface HUCameraManageCloudPlanItem
- (HMCameraProfile)cameraProfile;
- (HUCameraManageCloudPlanItem)initWithCameraProfile:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUCameraManageCloudPlanItem

- (HUCameraManageCloudPlanItem)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraManageCloudPlanItem;
  v6 = [(HFStaticItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F68AB8];
  v4 = _HULocalizedStringWithDefaultValue(@"HUCameraManageCloudPlan", @"HUCameraManageCloudPlan", 1);
  v14[0] = v4;
  v13[1] = *MEMORY[0x1E4F68908];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(HUCameraManageCloudPlanItem *)self cameraProfile];
  v7 = [v5 setWithObject:v6];
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  objc_super v9 = (void *)MEMORY[0x1E4F7A0D8];
  v10 = [MEMORY[0x1E4F69228] outcomeWithResults:v8];
  v11 = [v9 futureWithResult:v10];

  return v11;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void).cxx_destruct
{
}

@end
@interface HUCameraAccessLevelOptionItem
- (HMHome)home;
- (HMUser)user;
- (HUCameraAccessLevelOptionItem)initWithUser:(id)a3 home:(id)a4 accessLevel:(unint64_t)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)accessLevel;
@end

@implementation HUCameraAccessLevelOptionItem

- (HUCameraAccessLevelOptionItem)initWithUser:(id)a3 home:(id)a4 accessLevel:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraAccessLevelOptionItem;
  v11 = [(HUCameraAccessLevelOptionItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_user, a3);
    objc_storeStrong((id *)&v12->_home, a4);
    v12->_accessLevel = a5;
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v21[5] = *MEMORY[0x1E4F143B8];
  v4 = [(HUCameraAccessLevelOptionItem *)self home];
  v5 = [(HUCameraAccessLevelOptionItem *)self user];
  v6 = [v4 homeAccessControlForUser:v5];
  uint64_t v7 = [v6 camerasAccessLevel];

  v20[0] = *MEMORY[0x1E4F68AB8];
  [(HUCameraAccessLevelOptionItem *)self accessLevel];
  v8 = HFLocalizedStringFromHMUserCameraAccessLevel();
  v21[0] = v8;
  v20[1] = *MEMORY[0x1E4F68B40];
  id v9 = objc_msgSend(NSNumber, "numberWithInt:", -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel") == v7);
  v21[1] = v9;
  v20[2] = *MEMORY[0x1E4F68908];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  v11 = [(HUCameraAccessLevelOptionItem *)self user];
  v12 = [v10 setWithObject:v11];
  v21[2] = v12;
  v20[3] = @"HUCameraSettingResultKey";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel"));
  v21[3] = v13;
  v20[4] = *MEMORY[0x1E4F68B48];
  objc_super v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraAccessLevelOptionItem accessLevel](self, "accessLevel") + 1);
  v21[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];

  v16 = (void *)MEMORY[0x1E4F7A0D8];
  v17 = [MEMORY[0x1E4F69228] outcomeWithResults:v15];
  v18 = [v16 futureWithResult:v17];

  return v18;
}

- (HMUser)user
{
  return self->_user;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end
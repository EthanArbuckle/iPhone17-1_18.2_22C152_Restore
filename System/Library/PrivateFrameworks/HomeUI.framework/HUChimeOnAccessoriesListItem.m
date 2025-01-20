@interface HUChimeOnAccessoriesListItem
- (BOOL)accessoryIsCameraWithDoorbell;
- (HMHome)home;
- (HUChimeOnAccessoriesListItem)init;
- (HUChimeOnAccessoriesListItem)initWithAccessory:(id)a3;
- (HUChimeOnAccessoriesListItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setAccessoryIsCameraWithDoorbell:(BOOL)a3;
@end

@implementation HUChimeOnAccessoriesListItem

- (HUChimeOnAccessoriesListItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUChimeOnAccessoriesListItem.m", 20, @"%s is unavailable; use %@ instead",
    "-[HUChimeOnAccessoriesListItem init]",
    v5);

  return 0;
}

- (HUChimeOnAccessoriesListItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUChimeOnAccessoriesListItem;
  v6 = [(HUChimeOnAccessoriesListItem *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v7->_accessoryIsCameraWithDoorbell = 1;
  }

  return v7;
}

- (HUChimeOnAccessoriesListItem)initWithAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 home];
  v6 = [(HUChimeOnAccessoriesListItem *)self initWithHome:v5];

  if (v6)
  {
    if (objc_msgSend(v4, "hf_isCamera"))
    {
      v7 = objc_msgSend(v4, "hf_serviceOfType:", *MEMORY[0x1E4F2DE20]);
      v6->_accessoryIsCameraWithDoorbell = v7 != 0;
    }
    else
    {
      v6->_accessoryIsCameraWithDoorbell = 0;
    }
  }

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(HUChimeOnAccessoriesListItem *)self home];
  v6 = objc_msgSend(v5, "hf_allHomePodsOrStereoPairs");
  uint64_t v7 = [v6 count];

  v8 = [(HUChimeOnAccessoriesListItem *)self home];
  if (!objc_msgSend(v8, "hf_currentUserIsAdministrator")
    || ![(HUChimeOnAccessoriesListItem *)self accessoryIsCameraWithDoorbell])
  {

    goto LABEL_8;
  }

  if (!v7)
  {
LABEL_8:
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
    v20 = (void *)MEMORY[0x1E4F7A0D8];
    v21 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
    v22 = [v20 futureWithResult:v21];
    goto LABEL_9;
  }
  objc_super v9 = _HULocalizedStringWithDefaultValue(@"HUDoorbellChimeSetting", @"HUDoorbellChimeSetting", 1);
  [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v10 = [(HUChimeOnAccessoriesListItem *)self home];
  v11 = objc_msgSend(v10, "hf_allHomePodsOrStereoPairsThatWillChime");
  uint64_t v12 = [v11 count];

  v13 = [(HUChimeOnAccessoriesListItem *)self home];
  v14 = objc_msgSend(v13, "hf_allSiriEndPointProfileContainersThatWillChime");
  uint64_t v15 = [v14 count] + v12;

  v16 = [(HUChimeOnAccessoriesListItem *)self home];
  v17 = objc_msgSend(v16, "hf_allSiriEndPointProfileContainers");
  uint64_t v18 = [v17 count];

  if (v15)
  {
    if (v15 != v18 + v7)
    {
      v24 = (void *)MEMORY[0x1E4F28EE0];
      v25 = [NSNumber numberWithUnsignedInteger:v15];
      v21 = [v24 localizedStringFromNumber:v25 numberStyle:0];

      goto LABEL_15;
    }
    v19 = @"HUChimeOnAccessories_ValueAll";
  }
  else
  {
    v19 = @"HUChimeOnAccessories_ValueOff";
  }
  v21 = _HULocalizedStringWithDefaultValue(v19, v19, 1);
LABEL_15:
  [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  v26 = (void *)MEMORY[0x1E4F1CA80];
  v27 = [(HUChimeOnAccessoriesListItem *)self home];
  v28 = objc_msgSend(v27, "hf_homePods");
  v29 = [v26 setWithArray:v28];
  [v4 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v30 = (void *)MEMORY[0x1E4F7A0D8];
  v31 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v22 = [v30 futureWithResult:v31];

LABEL_9:

  return v22;
}

- (HMHome)home
{
  return self->_home;
}

- (BOOL)accessoryIsCameraWithDoorbell
{
  return self->_accessoryIsCameraWithDoorbell;
}

- (void)setAccessoryIsCameraWithDoorbell:(BOOL)a3
{
  self->_accessoryIsCameraWithDoorbell = a3;
}

- (void).cxx_destruct
{
}

@end
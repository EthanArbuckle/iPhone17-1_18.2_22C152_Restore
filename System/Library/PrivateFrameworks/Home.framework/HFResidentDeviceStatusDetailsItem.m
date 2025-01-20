@interface HFResidentDeviceStatusDetailsItem
- (HFResidentDeviceStatusDetailsItem)init;
- (HFResidentDeviceStatusDetailsItem)initWithHome:(id)a3 residentDevice:(id)a4;
- (HMHome)home;
- (HMResidentDevice)residentDevice;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFResidentDeviceStatusDetailsItem

- (HFResidentDeviceStatusDetailsItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_residentDevice_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFResidentDeviceStatusDetailsItem.m", 18, @"%s is unavailable; use %@ instead",
    "-[HFResidentDeviceStatusDetailsItem init]",
    v5);

  return 0;
}

- (HFResidentDeviceStatusDetailsItem)initWithHome:(id)a3 residentDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFResidentDeviceStatusDetailsItem;
  v9 = [(HFResidentDeviceStatusDetailsItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_residentDevice, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HFResidentDeviceStatusDetailsItem *)self residentDevice];
  v5 = [v4 device];
  v6 = [v5 name];
  if ([v6 length])
  {
    id v7 = [(HFResidentDeviceStatusDetailsItem *)self residentDevice];
    id v8 = [v7 device];
    v9 = [v8 name];
  }
  else
  {
    v9 = _HFLocalizedStringWithDefaultValue(@"HFResidentDeviceUnknownName", @"HFResidentDeviceUnknownName", 1);
  }

  v10 = +[HFHomeKitDispatcher sharedDispatcher];
  v11 = [v10 homeManager];
  int v12 = [v11 hasOptedToHH2];

  v13 = [(HFResidentDeviceStatusDetailsItem *)self residentDevice];
  v14 = v13;
  if (v12)
  {
    v15 = objc_msgSend(v13, "hf_linkedAccessory");
    char v16 = [v15 isReachable];

    if (v16)
    {
LABEL_6:
      int v17 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    char v18 = objc_msgSend(v13, "hf_isReachable");

    if (v18) {
      goto LABEL_6;
    }
  }
  v19 = [(HFResidentDeviceStatusDetailsItem *)self home];
  int v17 = objc_msgSend(v19, "hf_shouldHideResidentDeviceReachabilityIssues");

LABEL_9:
  v20 = [(HFResidentDeviceStatusDetailsItem *)self residentDevice];
  char v21 = [v20 status];

  v22 = [(HFResidentDeviceStatusDetailsItem *)self residentDevice];
  int v23 = [v22 isEnabled];

  v24 = objc_opt_new();
  id v25 = v9;
  v32 = v25;
  if (v17)
  {
    if ((v21 & 8) != 0)
    {
      v33 = HFLocalizedStringWithFormat(@"HFStatusDetailsResidentLowBatteryTitle", @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);

      v34 = _HFLocalizedStringWithDefaultValue(@"HFStatusDetailsResidentLowBatteryDescription", @"HFStatusDetailsResidentLowBatteryDescription", 1);
      [v24 setObject:v34 forKeyedSubscript:@"description"];

      if ((v23 & 1) == 0)
      {
        v35 = (void *)MEMORY[0x263EFFA88];
        v36 = HFResultHiddenKey;
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  else
  {
    v37 = HFLocalizedStringWithFormat(@"HFStatusDetailsResidentUnreachableFormat", @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
    [v24 setObject:v37 forKeyedSubscript:@"description"];

    v33 = v32;
    if (v23)
    {
LABEL_14:
      [v24 setObject:v33 forKeyedSubscript:@"title"];
      v35 = &unk_26C0F6C48;
      v36 = HFResultDisplayPriorityKey;
      goto LABEL_16;
    }
  }
  v35 = (void *)MEMORY[0x263EFFA88];
  v36 = HFResultHiddenKey;
  v33 = v32;
LABEL_16:
  [v24 setObject:v35 forKeyedSubscript:*v36];
  v38 = (void *)MEMORY[0x263F58190];
  v39 = +[HFItemUpdateOutcome outcomeWithResults:v24];
  v40 = [v38 futureWithResult:v39];

  return v40;
}

- (HMHome)home
{
  return self->_home;
}

- (HMResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDevice, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
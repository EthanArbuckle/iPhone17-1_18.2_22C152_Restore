@interface HUServiceDetailsStatusAndNotificationItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsStatusAndNotificationItem

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v5 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v6 = [v5 homeKitObject];

  id v7 = v6;
  if ([v7 conformsToProtocol:&unk_1F1ABACC0]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  int v10 = objc_msgSend(v9, "hf_supportsHomeStatus");
  v11 = (void *)MEMORY[0x1E4F68F98];
  v12 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  char v13 = [v11 cameraContainsMotionServiceItem:v12];

  id v14 = v7;
  if ([v14 conformsToProtocol:&unk_1F1AD8EB0]) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  objc_opt_class();
  v17 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  uint64_t v42 = [v19 mediaAccessoryItemType];
  if (v19)
  {
    v20 = [v19 accessories];
    v21 = [v20 anyObject];
    if ([v21 conformsToProtocol:&unk_1F1AD8EB0]) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    id v16 = v23;
  }
  v24 = objc_msgSend(v16, "hf_userNotificationSettings");
  if (v24) {
    char v25 = v13;
  }
  else {
    char v25 = 1;
  }

  v26 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v27 = [v26 homeManager];
  int v28 = [v27 hasOptedToHH2];

  v29 = [(HUServiceDetailsAbstractItem *)self home];
  v30 = [v29 residentDevices];

  if (v25)
  {
    int v31 = 0;
  }
  else if (v28 && [v30 count])
  {
    int v31 = 1;
  }
  else
  {
    int v31 = v28 ^ 1;
  }
  v32 = HFLogForCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v44 = "-[HUServiceDetailsStatusAndNotificationItem _subclass_updateWithOptions:]";
    __int16 v45 = 1024;
    int v46 = v28;
    __int16 v47 = 2048;
    uint64_t v48 = [v30 count];
    _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%s hasOptedToHH2 = %{BOOL}d residents = %lu", buf, 0x1Cu);
  }

  if (v10 & v31)
  {
    v33 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsStatusAndNotificationTitle", @"HUServiceDetailsStatusAndNotificationTitle", 1);
    [v4 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v34 = @"AccessoryDetails.Status";
    v35 = (void *)MEMORY[0x1E4F68928];
LABEL_36:
    [v4 setObject:v34 forKeyedSubscript:*v35];
    goto LABEL_37;
  }
  if ((v31 & 1) == 0)
  {
    v37 = _HULocalizedStringWithDefaultValue(@"HUStatusTitle", @"HUStatusTitle", 1);
    [v4 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v4 setObject:@"AccessoryDetails.Status" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    if (v10) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  v36 = _HULocalizedStringWithDefaultValue(@"HUNotificationsTitle", @"HUNotificationsTitle", 1);
  [v4 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v4 setObject:@"AccessoryDetails.Status" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  if ((v10 & 1) == 0
    && ![(HUServiceDetailsAbstractItem *)self isService]
    && ![(HUServiceDetailsAbstractItem *)self isNotificationSupportedCamera]
    && ![(HUServiceDetailsAbstractItem *)self isAudioAnalysisSupportedDevice])
  {
LABEL_35:
    v34 = (__CFString *)MEMORY[0x1E4F1CC38];
    v35 = (void *)MEMORY[0x1E4F68B10];
    goto LABEL_36;
  }
LABEL_37:
  if (v42 == 3) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v38 = (void *)MEMORY[0x1E4F7A0D8];
  v39 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v40 = [v38 futureWithResult:v39];

  return v40;
}

@end
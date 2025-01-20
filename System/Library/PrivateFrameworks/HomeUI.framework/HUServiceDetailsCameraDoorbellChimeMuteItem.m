@interface HUServiceDetailsCameraDoorbellChimeMuteItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsCameraDoorbellChimeMuteItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 profile];
    v8 = objc_msgSend(v7, "hf_doorbellChimeMuteCharacteristic");

    if (v8)
    {
      v9 = [MEMORY[0x1E4F1CA60] dictionary];
      v10 = _HULocalizedStringWithDefaultValue(@"HUCameraDoorbellChimeMuteSwitchTitle", @"HUCameraDoorbellChimeMuteSwitchTitle", 1);
      [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

      v11 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      v12 = [v11 home];
      if (objc_msgSend(v12, "hf_currentUserIsAdministrator")) {
        uint64_t v13 = MEMORY[0x1E4F1CC28];
      }
      else {
        uint64_t v13 = MEMORY[0x1E4F1CC38];
      }
      [v9 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68A08]];

      objc_opt_class();
      v14 = [v8 value];
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
      id v16 = v15;

      int v17 = [v16 BOOLValue];
      int v18 = v17 ^ 1;
      v19 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
      [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68BC0]];

      v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v30[0] = 67109120;
        v30[1] = v18;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "Displaying doorbell chime state - should play sound = %{BOOL}d.", (uint8_t *)v30, 8u);
      }

      v21 = (void *)MEMORY[0x1E4F7A0D8];
      v22 = (void *)MEMORY[0x1E4F69228];
    }
    else
    {
      v26 = HFLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30[0]) = 0;
        _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "Hiding doorbell chime item for camera. Missing mute characteristic.", (uint8_t *)v30, 2u);
      }

      v21 = (void *)MEMORY[0x1E4F7A0D8];
      v27 = (void *)MEMORY[0x1E4F69228];
      uint64_t v31 = *MEMORY[0x1E4F68B10];
      uint64_t v32 = MEMORY[0x1E4F1CC38];
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      v22 = v27;
    }
    v28 = [v22 outcomeWithResults:v9];
    v25 = [v21 futureWithResult:v28];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F7A0D8];
    v24 = (void *)MEMORY[0x1E4F69228];
    uint64_t v33 = *MEMORY[0x1E4F68B10];
    v34[0] = MEMORY[0x1E4F1CC38];
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v9 = [v24 outcomeWithResults:v8];
    v25 = [v23 futureWithResult:v9];
  }

  return v25;
}

@end
@interface HUServiceDetailsCameraActivityZonesItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsCameraActivityZonesItem

- (id)_subclass_updateWithOptions:(id)a3
{
  objc_opt_class();
  v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [(HUServiceDetailsAbstractItem *)self home];
  if (objc_msgSend(v8, "hf_currentUserIsAdministrator")) {
    v9 = @"HUServiceDetailsDisplayCameraActivityZonesEditorTitle";
  }
  else {
    v9 = @"HUServiceDetailsDisplayCameraActivityZonesEditorNonAdminTitle";
  }
  v10 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  v11 = [(HUServiceDetailsAbstractItem *)self home];
  if (objc_msgSend(v11, "hf_hasResidentDeviceCapableOfSupportingActivityZones"))
  {
    v12 = [v6 profile];
    int v13 = objc_msgSend(v12, "hf_supportsRecordingEvents");

    if (v13)
    {
      v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      [v7 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F68900]];

      v15 = [v6 profile];
      v16 = [v15 userSettings];
      v17 = [v16 activityZones];
      v18 = [v17 allObjects];
      uint64_t v19 = [v18 count];

      v20 = [(HUServiceDetailsAbstractItem *)self home];
      LODWORD(v15) = objc_msgSend(v20, "hf_hasResidentDeviceCapableOfSupportingEnhancedDetectionModes");

      v21 = [v6 profile];
      v22 = v21;
      if (v15)
      {
        char v23 = objc_msgSend(v21, "hf_cameraIsNotSetToRecord");

        uint64_t v24 = *MEMORY[0x1E4F68B10];
        if (v23)
        {
LABEL_11:
          uint64_t v25 = MEMORY[0x1E4F1CC38];
LABEL_16:
          [v7 setObject:v25 forKeyedSubscript:v24];
          if (v19)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"%lu", v19);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = &stru_1F18F92B8;
          }
          [v7 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F68980]];

          goto LABEL_20;
        }
      }
      else
      {
        v26 = [v21 userSettings];
        uint64_t v27 = [v26 recordingEventTriggers] & 0xE;

        uint64_t v24 = *MEMORY[0x1E4F68B10];
        if (!v27) {
          goto LABEL_11;
        }
      }
      uint64_t v25 = MEMORY[0x1E4F1CC28];
      goto LABEL_16;
    }
  }
  else
  {
  }
  [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
LABEL_20:
  v29 = (void *)MEMORY[0x1E4F7A0D8];
  v30 = [MEMORY[0x1E4F69228] outcomeWithResults:v7];
  v31 = [v29 futureWithResult:v30];

  return v31;
}

@end
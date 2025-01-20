@interface HMCameraClip(HUAdditions)
- (id)hu_accessibilityStringForSignificantEvent:()HUAdditions inReferenceDate:;
- (id)hu_accessibilityStringForSignificantEvents;
@end

@implementation HMCameraClip(HUAdditions)

- (id)hu_accessibilityStringForSignificantEvents
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  id v15 = [NSString string];
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = objc_msgSend(a1, "hf_sortedSignificantEvents");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMCameraClip_HUAdditions__hu_accessibilityStringForSignificantEvents__block_invoke;
  v7[3] = &unk_1E6385570;
  v9 = &v10;
  v7[4] = a1;
  id v4 = v2;
  id v8 = v4;
  objc_msgSend(v3, "na_each:", v7);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (id)hu_accessibilityStringForSignificantEvent:()HUAdditions inReferenceDate:
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F68FF8];
  id v7 = a4;
  id v8 = [v5 dateOfOccurrence];
  v9 = [v6 attributedShortTimeStringFromDate:v8];
  uint64_t v10 = [v9 string];

  v11 = (void *)MEMORY[0x1E4F68FF8];
  uint64_t v12 = [v5 dateOfOccurrence];
  v13 = [v11 localizerKeyDayNameFromDate:v12];

  v14 = [v5 dateOfOccurrence];
  [v7 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 > 604800.0)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Last%@", v13];

    v13 = (void *)v17;
  }
  v18 = [NSString stringWithFormat:@"HUCameraEventRecordingCellAccessibilityLabelSignificantEventTimeOn%@Format", v13];
  v25 = HULocalizedStringWithFormat(v18, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v10);
  v26 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hf_sharedCalendar");
  v27 = [v5 dateOfOccurrence];
  uint64_t v28 = [v26 component:32 fromDate:v27];

  if ([v5 confidenceLevel] == 100)
  {
    v29 = objc_msgSend(v5, "hf_faceClassificationName");

    if (v29)
    {
      v30 = &stru_1F18F92B8;
      if (v28 == 1) {
        v30 = @"Singular";
      }
      v31 = [NSString stringWithFormat:@"HFCameraSignificantEventReasonFamiliarFace%@Title", v30];
      v32 = objc_msgSend(v5, "hf_faceClassificationName");
    }
    else
    {
      if (v5)
      {
        objc_msgSend(v5, "hf_reasonKey");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = @"AnyMotion";
      }
      v35 = &stru_1F18F92B8;
      if (v28 == 1) {
        v35 = @"Singular";
      }
      v32 = [NSString stringWithFormat:@"HFCameraSignificantEventReason%@%@Title", v31, v35];
    }
    v34 = HFLocalizedStringWithFormat();
  }
  else
  {
    v33 = &stru_1F18F92B8;
    if (v28 == 1) {
      v33 = @"Singular";
    }
    v31 = [NSString stringWithFormat:@"HFCameraSignificantEventReasonAnyMotion%@Title", v33];
    v34 = HFLocalizedStringWithFormat();
  }

  return v34;
}

@end
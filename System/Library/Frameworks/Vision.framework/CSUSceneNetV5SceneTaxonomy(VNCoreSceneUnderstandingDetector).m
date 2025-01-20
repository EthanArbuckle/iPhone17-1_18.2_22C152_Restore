@interface CSUSceneNetV5SceneTaxonomy(VNCoreSceneUnderstandingDetector)
- (BOOL)VNGetClassificationMetrics:()VNCoreSceneUnderstandingDetector forLabel:error:;
@end

@implementation CSUSceneNetV5SceneTaxonomy(VNCoreSceneUnderstandingDetector)

- (BOOL)VNGetClassificationMetrics:()VNCoreSceneUnderstandingDetector forLabel:error:
{
  id v8 = a4;
  if ([a1 hasLabelAttributes])
  {
    v9 = [a1 attributesForLabel:v8 error:a5];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 precisionOperatingPointCurve];
      v12 = [v10 recallOperatingPointCurve];
      uint64_t v13 = [v11 count];
      uint64_t v14 = [v12 count];
      uint64_t v15 = v14;
      if (v13 && v14)
      {
        v16 = [MEMORY[0x1E4FB3F58] VNCurveForCSUMetricOperatingPointCurve:v11 error:a5];
        if (v16)
        {
          v17 = [MEMORY[0x1E4FB3F58] VNCurveForCSUMetricOperatingPointCurve:v12 error:a5];
          BOOL v18 = v17 != 0;
          if (v17) {
            *a3 = (id)[objc_alloc(MEMORY[0x1E4FB3E68]) initWithPrecisionCurve:v16 recallCurve:v17];
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        if (!v13)
        {
          uint64_t v19 = [v8 UTF8String];
          VNValidatedLog(2, @"%s does not have prevision curve", v20, v21, v22, v23, v24, v25, v19);
        }
        if (!v15)
        {
          uint64_t v26 = [v8 UTF8String];
          VNValidatedLog(2, @"%s does not have recall curve", v27, v28, v29, v30, v31, v32, v26);
        }
        *a3 = 0;
        BOOL v18 = 1;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    *a3 = 0;
    BOOL v18 = 1;
  }

  return v18;
}

@end
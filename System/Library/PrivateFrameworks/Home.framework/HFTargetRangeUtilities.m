@interface HFTargetRangeUtilities
+ (id)targetRelativePercentValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetRelativePercentValue:(id)a5 minimumThresholdRelativePercentValue:(id)a6 maximumThresholdRelativePercentValue:(id)a7;
+ (id)targetRelativePercentValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetResponse:(id)a5 minimumThresholdResponse:(id)a6 maximumThresholdResponse:(id)a7;
+ (id)targetValueForService:(id)a3 valueProvider:(id)a4;
+ (id)targetValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetResponse:(id)a5 minimumThresholdResponse:(id)a6 maximumThresholdResponse:(id)a7;
+ (unint64_t)rangeModeForCurrentHeaterCoolerState:(int64_t)a3;
+ (unint64_t)rangeModeForCurrentHumidifierDehumidifierState:(int64_t)a3;
+ (unint64_t)rangeModeForHeatingCoolingMode:(int64_t)a3;
+ (unint64_t)rangeModeForTargetHeaterCoolerState:(int64_t)a3;
+ (unint64_t)rangeModeForTargetHumidifierDehumidifierState:(int64_t)a3;
@end

@implementation HFTargetRangeUtilities

+ (unint64_t)rangeModeForHeatingCoolingMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)targetValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetResponse:(id)a5 minimumThresholdResponse:(id)a6 maximumThresholdResponse:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = [(id)objc_opt_class() targetRelativePercentValueWithTargetMode:a3 currentMode:a4 rawTargetResponse:v13 minimumThresholdResponse:v12 maximumThresholdResponse:v11];

  if (v14)
  {
    v15 = [v14 value];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)targetRelativePercentValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetResponse:(id)a5 minimumThresholdResponse:(id)a6 maximumThresholdResponse:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = [[HFRelativePercentValue alloc] initWithCharacteristicReadResponse:v13];

  v15 = [[HFRelativePercentValue alloc] initWithCharacteristicReadResponse:v12];
  v16 = [[HFRelativePercentValue alloc] initWithCharacteristicReadResponse:v11];

  v17 = [(id)objc_opt_class() targetRelativePercentValueWithTargetMode:a3 currentMode:a4 rawTargetRelativePercentValue:v14 minimumThresholdRelativePercentValue:v15 maximumThresholdRelativePercentValue:v16];

  return v17;
}

+ (id)targetRelativePercentValueWithTargetMode:(unint64_t)a3 currentMode:(unint64_t)a4 rawTargetRelativePercentValue:(id)a5 minimumThresholdRelativePercentValue:(id)a6 maximumThresholdRelativePercentValue:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (a4 == 3) {
    NSLog(&cfstr_CurrentmodeSho.isa);
  }
  v19[0] = (void *)MEMORY[0x263EF8330];
  v19[1] = (void *)3221225472;
  v19[2] = __183__HFTargetRangeUtilities_targetRelativePercentValueWithTargetMode_currentMode_rawTargetRelativePercentValue_minimumThresholdRelativePercentValue_maximumThresholdRelativePercentValue___block_invoke;
  v19[3] = &unk_264097CF8;
  unint64_t v23 = a4;
  unint64_t v24 = a3;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  v17 = __183__HFTargetRangeUtilities_targetRelativePercentValueWithTargetMode_currentMode_rawTargetRelativePercentValue_minimumThresholdRelativePercentValue_maximumThresholdRelativePercentValue___block_invoke(v19);

  return v17;
}

void **__183__HFTargetRangeUtilities_targetRelativePercentValueWithTargetMode_currentMode_rawTargetRelativePercentValue_minimumThresholdRelativePercentValue_maximumThresholdRelativePercentValue___block_invoke(void **a1)
{
  switch((unint64_t)a1[7])
  {
    case 0uLL:
    case 3uLL:
      v1 = a1[8];
      switch((unint64_t)v1)
      {
        case 0uLL:
        case 3uLL:
          v2 = a1[4];
          if (v2) {
            goto LABEL_22;
          }
          v2 = a1[6];
          if (a1[5])
          {
            if (!v2)
            {
              v2 = a1[5];
              goto LABEL_22;
            }
          }
          else if (v2)
          {
            goto LABEL_22;
          }
          a1 = 0;
          break;
        case 1uLL:
          v2 = a1[4];
          if (v2) {
            goto LABEL_22;
          }
          v3 = a1 + 5;
          goto LABEL_16;
        case 2uLL:
          v2 = a1[4];
          if (v2) {
            goto LABEL_22;
          }
          v3 = a1 + 6;
          goto LABEL_16;
        default:
          goto LABEL_8;
      }
      break;
    case 1uLL:
      v1 = a1[8];
LABEL_8:
      if (v1 != (void *)3)
      {
        v2 = a1[4];
        if (v2) {
          goto LABEL_22;
        }
      }
      v2 = a1[5];
      if (v2) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2uLL:
      if (a1[8] == (void *)3 || (v2 = a1[4]) == 0)
      {
        v2 = a1[6];
        if (!v2)
        {
LABEL_15:
          v3 = a1 + 4;
LABEL_16:
          v2 = *v3;
        }
      }
LABEL_22:
      a1 = v2;
      break;
    default:
      break;
  }
  return a1;
}

+ (unint64_t)rangeModeForTargetHeaterCoolerState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_20BD138D8[a3];
  }
}

+ (unint64_t)rangeModeForCurrentHeaterCoolerState:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

+ (unint64_t)rangeModeForTargetHumidifierDehumidifierState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_20BD138D8[a3];
  }
}

+ (unint64_t)rangeModeForCurrentHumidifierDehumidifierState:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

+ (id)targetValueForService:(id)a3 valueProvider:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"HFTargetRangeUtilities.m", 183, @"Invalid parameter not satisfying: %@", @"valueProvider != nil" object file lineNumber description];
  }
  v9 = [v7 serviceType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0D870]];

  if (!v10)
  {
    id v15 = [v7 serviceType];
    int v16 = [v15 isEqualToString:*MEMORY[0x263F0D708]];

    if (v16)
    {
      uint64_t v12 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C1A0]);
      v45 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C020]);
      v17 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C4D0]);
      if (v17)
      {
        v18 = v8[2](v8, v17);
        if (v18) {
          uint64_t v44 = objc_msgSend((id)objc_opt_class(), "rangeModeForTargetHeaterCoolerState:", objc_msgSend(v18, "integerValue"));
        }
        else {
          uint64_t v44 = 0;
        }
      }
      else
      {
        uint64_t v44 = 0;
      }
      v31 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C058]);
      if (v31)
      {
        v32 = v8[2](v8, v31);
        if (v32)
        {
          uint64_t v33 = objc_msgSend((id)objc_opt_class(), "rangeModeForCurrentHeaterCoolerState:", objc_msgSend(v32, "integerValue"));
LABEL_40:
          uint64_t v24 = v33;
LABEL_43:

          goto LABEL_44;
        }
        goto LABEL_42;
      }
    }
    else
    {
      v19 = [v7 serviceType];
      int v20 = [v19 isEqualToString:*MEMORY[0x263F0D720]];

      if (!v20)
      {
        id v22 = 0;
        unint64_t v23 = 0;
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        v45 = 0;
        v26 = 0;
        id v11 = 0;
        v27 = 0;
        goto LABEL_53;
      }
      uint64_t v12 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C1C8]);
      v45 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C148]);
      v17 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C4F8]);
      if (v17)
      {
        id v21 = v8[2](v8, v17);
        if (v21) {
          uint64_t v44 = objc_msgSend((id)objc_opt_class(), "rangeModeForTargetHumidifierDehumidifierState:", objc_msgSend(v21, "integerValue"));
        }
        else {
          uint64_t v44 = 0;
        }
      }
      else
      {
        uint64_t v44 = 0;
      }
      v31 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C088]);
      if (v31)
      {
        v32 = v8[2](v8, v31);
        if (v32)
        {
          uint64_t v33 = objc_msgSend((id)objc_opt_class(), "rangeModeForCurrentHumidifierDehumidifierState:", objc_msgSend(v32, "integerValue"));
          goto LABEL_40;
        }
LABEL_42:
        uint64_t v24 = 0;
        goto LABEL_43;
      }
    }
    uint64_t v24 = 0;
LABEL_44:

    unint64_t v23 = 0;
    id v11 = 0;
    goto LABEL_45;
  }
  id v11 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C550]);
  uint64_t v12 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C1A0]);
  v45 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C020]);
  id v13 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C4D8]);
  if (v13)
  {
    id v14 = v8[2](v8, v13);
    if (v14) {
      uint64_t v44 = objc_msgSend((id)objc_opt_class(), "rangeModeForHeatingCoolingMode:", objc_msgSend(v14, "integerValue"));
    }
    else {
      uint64_t v44 = 0;
    }
  }
  else
  {
    uint64_t v44 = 0;
  }
  v28 = objc_msgSend(v7, "hf_characteristicOfType:", *MEMORY[0x263F0C068]);
  if (v28)
  {
    v29 = v8[2](v8, v28);
    if (v29) {
      uint64_t v24 = objc_msgSend((id)objc_opt_class(), "rangeModeForHeatingCoolingMode:", objc_msgSend(v29, "integerValue"));
    }
    else {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  if (v11)
  {
    v30 = [HFRelativePercentValue alloc];
    v17 = v8[2](v8, v11);
    unint64_t v23 = [(HFRelativePercentValue *)v30 initWithValue:v17 forCharacteristic:v11];
LABEL_45:

    goto LABEL_46;
  }
  unint64_t v23 = 0;
LABEL_46:
  id v22 = (HFRelativePercentValue *)v12;
  if (v12)
  {
    v34 = [HFRelativePercentValue alloc];
    v35 = v8[2](v8, (void *)v12);
    v36 = (void *)v12;
    id v22 = [(HFRelativePercentValue *)v34 initWithValue:v35 forCharacteristic:v12];
  }
  else
  {
    v36 = 0;
  }
  if (v45)
  {
    v37 = [HFRelativePercentValue alloc];
    v38 = v8[2](v8, v45);
    v27 = [(HFRelativePercentValue *)v37 initWithValue:v38 forCharacteristic:v45];
  }
  else
  {
    v45 = 0;
    v27 = 0;
  }
  v26 = v36;
  uint64_t v25 = v44;
LABEL_53:
  v39 = [(id)objc_opt_class() targetRelativePercentValueWithTargetMode:v25 currentMode:v24 rawTargetRelativePercentValue:v23 minimumThresholdRelativePercentValue:v22 maximumThresholdRelativePercentValue:v27];
  v40 = v39;
  if (v39)
  {
    v41 = [v39 value];
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

@end
@interface HFThermostatItemUtilities
+ (void)getDescription:(id *)a3 controlDescription:(id *)a4 optionalDescriptions:(id *)a5 forResponse:(id)a6 primaryService:(id)a7 temperatureFormatter:(id)a8;
@end

@implementation HFThermostatItemUtilities

+ (void)getDescription:(id *)a3 controlDescription:(id *)a4 optionalDescriptions:(id *)a5 forResponse:(id)a6 primaryService:(id)a7 temperatureFormatter:(id)a8
{
  v116[2] = *MEMORY[0x263EF8340];
  id v14 = a6;
  id v95 = a7;
  id v15 = a8;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__15;
  v113 = __Block_byref_object_dispose__15;
  id v114 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__15;
  v107 = __Block_byref_object_dispose__15;
  id v108 = 0;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__15;
  v101 = __Block_byref_object_dispose__15;
  id v102 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__HFThermostatItemUtilities_getDescription_controlDescription_optionalDescriptions_forResponse_primaryService_temperatureFormatter___block_invoke;
  aBlock[3] = &unk_264095E08;
  aBlock[4] = &v109;
  aBlock[5] = &v103;
  aBlock[8] = a4;
  aBlock[9] = a5;
  aBlock[6] = &v97;
  aBlock[7] = a3;
  v16 = (void (**)(void))_Block_copy(aBlock);
  v17 = [(id)objc_opt_class() currentHeatingCoolingModeValueInResponse:v14];
  uint64_t v18 = [(id)objc_opt_class() targetHeatingCoolingModeValueInResponse:v14];
  v19 = (void *)v18;
  if (v17 && v18)
  {
    v20 = [v14 responseForCharacteristicType:*MEMORY[0x263F0C020]];
    v93 = [v20 valueWithExpectedClass:objc_opt_class()];

    v21 = [v14 responseForCharacteristicType:*MEMORY[0x263F0C1A0]];
    v94 = [v21 valueWithExpectedClass:objc_opt_class()];

    v22 = objc_msgSend(v95, "hf_childServices");
    v23 = objc_msgSend(v22, "na_firstObjectPassingTest:", &__block_literal_global_113);

    if (v23)
    {
      v24 = [v14 responseForCharacteristicType:*MEMORY[0x263F0BEF8] inService:v23];
      v91 = [v24 valueWithExpectedClass:objc_opt_class()];
    }
    else
    {
      v91 = 0;
    }
    v25 = (void *)[@"HFServiceDescriptionThermostat" mutableCopy];
    if ([v19 integerValue] == 3)
    {
      [v25 appendString:@"Auto"];
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v27 = [v17 integerValue];
      switch(v27)
      {
        case 0:
          uint64_t v29 = [v19 integerValue];
          v28 = @"TargetCooling";
          uint64_t v26 = 1;
          switch(v29)
          {
            case 0:
              if (objc_msgSend(v91, "BOOLValue", @"TargetCooling")) {
                v30 = @"FanOnly";
              }
              else {
                v30 = @"Off";
              }
              [v25 appendString:v30];
              uint64_t v26 = 0;
              goto LABEL_19;
            case 1:
              v28 = @"TargetHeating";
              goto LABEL_18;
            case 2:
              goto LABEL_18;
            case 3:
              goto LABEL_19;
            default:
              NSLog(&cfstr_UnexpectedTarg.isa, v19);
              break;
          }
          goto LABEL_28;
        case 1:
          v28 = @"Heating";
          break;
        case 2:
          v28 = @"Cooling";
          break;
        default:
          NSLog(&cfstr_UnexpectedCurr.isa, v17);
          goto LABEL_28;
      }
LABEL_18:
      [v25 appendString:v28];
      uint64_t v26 = 1;
    }
LABEL_19:
    v31 = [a1 targetTemperatureValueInResponse:v14];
    v92 = [v15 stringForObjectValue:v31];
    if (v26)
    {
      if (v26 != 1 && v94 && v93)
      {
        [v25 appendString:@"WithTemperatureRange"];
        v32 = [v15 stringForObjectValue:v94];
        v33 = [v15 stringForObjectValue:v93];
        uint64_t v40 = HFLocalizedStringWithFormat(v25, @"%@%@", v34, v35, v36, v37, v38, v39, (uint64_t)v32);
        v41 = (void *)v110[5];
        v110[5] = v40;

        v42 = [v15 stringForObjectValue:v94];
        v88 = [v15 stringForObjectValue:v93];
        uint64_t v49 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionThermostatAutoWithTemperatureRange", @"%@%@", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
        v50 = (void *)v104[5];
        v104[5] = v49;

        v115[0] = @"heatingThresholdDescription";
        v51 = [v15 stringForObjectValue:v94];
        v90 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionThermostatAutoHeatingWithTemperature", @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v51);
        v116[0] = v90;
        v115[1] = @"coolingThresholdDescription";
        v89 = [v15 stringForObjectValue:v93];
        v64 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionThermostatAutoCoolingWithTemperature", @"%@", v58, v59, v60, v61, v62, v63, (uint64_t)v89);
        v116[1] = v64;
        uint64_t v65 = [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
        v66 = (void *)v98[5];
        v98[5] = v65;
      }
      else
      {
        [v25 appendString:@"WithTemperature"];
        uint64_t v73 = HFLocalizedStringWithFormat(v25, @"%@", v67, v68, v69, v70, v71, v72, (uint64_t)v92);
        v74 = (void *)v110[5];
        v110[5] = v73;

        v75 = v104;
        id v76 = (id)v110[5];
        v51 = (void *)v75[5];
        v75[5] = (uint64_t)v76;
      }
    }
    else
    {
      uint64_t v77 = _HFLocalizedStringWithDefaultValue(v25, v25, 1);
      v78 = (void *)v110[5];
      v110[5] = v77;

      uint64_t v79 = _HFLocalizedStringWithDefaultValue(v25, v25, 1);
      v80 = (void *)v104[5];
      v104[5] = v79;

      if (v104[5]) {
        goto LABEL_27;
      }
      if (v31 && v92)
      {
        uint64_t v87 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionThermostatOff", @"%@", v81, v82, v83, v84, v85, v86, (uint64_t)v92);
      }
      else
      {
        uint64_t v87 = _HFLocalizedStringWithDefaultValue(@"HFServiceControlDescriptionThermostatOffNoTargetTemperature", @"HFServiceControlDescriptionThermostatOffNoTargetTemperature", 1);
      }
      v51 = (void *)v104[5];
      v104[5] = v87;
    }

LABEL_27:
LABEL_28:
  }
  if (v16) {
    v16[2](v16);
  }

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

  _Block_object_dispose(&v109, 8);
}

void __132__HFThermostatItemUtilities_getDescription_controlDescription_optionalDescriptions_forResponse_primaryService_temperatureFormatter___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  if (*(void *)(a1 + 64))
  {
    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v2) {
      v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    **(void **)(a1 + 64) = v2;
  }
  if (*(void *)(a1 + 72))
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v3)
    {
      **(void **)(a1 + 72) = v3;
    }
    else
    {
      id v4 = [NSDictionary dictionary];
      **(void **)(a1 + 72) = v4;
    }
  }
}

uint64_t __132__HFThermostatItemUtilities_getDescription_controlDescription_optionalDescriptions_forResponse_primaryService_temperatureFormatter___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

@end
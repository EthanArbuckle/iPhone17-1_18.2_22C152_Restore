@interface StepByStepUtilities
+ (id)findSourceBaseByName:(id)a3 fromParamDict:(id)a4;
+ (id)findSourceBaseByRadioName:(id)a3 fromParamDict:(id)a4;
+ (id)findSourceConfigByName:(id)a3 fromParamDict:(id)a4;
+ (id)findSourceNetworkByName:(id)a3 fromParamDict:(id)a4;
+ (id)getProductLocalizedStringWithFormat:(id)a3 fromParamDict:(id)a4;
+ (id)nameForNetworkOrDevice:(id)a3;
+ (id)productIDForNetworkOrDevice:(id)a3;
+ (id)selectorChoiceToReplaceOption:(int)a3;
+ (int)getDeviceKindFromParamDict:(id)a3;
+ (int)matrixTagToSelectorChoice:(int64_t)a3;
+ (int64_t)autoGuessRecommendationToMatrixTag:(id)a3;
+ (int64_t)selectorChoiceToMatrixTag:(int)a3;
+ (unsigned)getProductIDFromParamDict:(id)a3;
+ (void)formatRecommendation:(id)a3 fromParamDict:(id)a4 forStep:(int)a5 restoreString:(id *)a6 restoreSpecificString:(id *)a7 dontRecommendString:(id *)a8;
@end

@implementation StepByStepUtilities

+ (unsigned)getProductIDFromParamDict:(id)a3
{
  CFStringRef v4 = (const __CFString *)objc_msgSend_objectForKey_(a3, a2, @"kSBSKey_TargetBase");
  if (v4)
  {
    return sub_22685AB94(v4, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v14 = objc_msgSend_objectForKey_(a3, v5, @"kSBSKey_TargetNetwork");
    return objc_msgSend_scanInfoAppleProductID_(WiFiUtils, v13, v14);
  }
}

+ (int)getDeviceKindFromParamDict:(id)a3
{
  uint64_t v4 = objc_msgSend_objectForKey_(a3, a2, @"kSBSKey_TargetBase");
  if (v4)
  {
    return sub_22685AB68(v4, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    uint64_t v14 = objc_msgSend_objectForKey_(a3, v5, @"kSBSKey_TargetNetwork");
    return objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v13, v14);
  }
}

+ (id)getProductLocalizedStringWithFormat:(id)a3 fromParamDict:(id)a4
{
  uint64_t v7 = NSString;
  uint64_t ProductIDFromParamDict = objc_msgSend_getProductIDFromParamDict_(a1, a2, (uint64_t)a4);
  int DeviceKindFromParamDict = objc_msgSend_getDeviceKindFromParamDict_(a1, v9, (uint64_t)a4);
  uint64_t v11 = sub_22685D75C(ProductIDFromParamDict, DeviceKindFromParamDict);
  uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v7, v12, (uint64_t)a3, @"%@", 0, v11);
  if (!valid) {
    return &stru_26DA6BE88;
  }
  uint64_t v14 = qword_268148378;

  return (id)sub_22685D62C(valid, v14);
}

+ (id)findSourceBaseByName:(id)a3 fromParamDict:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend_objectForKey_(a4, a2, @"kSBSKey_BrowseRecordList", 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7) {
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v17;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(v5);
    }
    v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
    v13 = objc_msgSend_objectForKey_(v12, v8, @"name");
    if (objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3)) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)findSourceBaseByRadioName:(id)a3 fromParamDict:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend_objectForKey_(a4, a2, @"kSBSKey_BrowseRecordList", 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7) {
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v17;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(v5);
    }
    v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
    v13 = objc_msgSend_objectForKey_(v12, v8, @"name");
    if (objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3)) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)findSourceNetworkByName:(id)a3 fromParamDict:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend_objectForKey_(a4, a2, @"kSBSKey_NetworkScanRecordList", 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7) {
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v17;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(v5);
    }
    v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
    v13 = objc_msgSend_objectForKey_(v12, v8, @"SSID_STR");
    if (objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3)) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)findSourceConfigByName:(id)a3 fromParamDict:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend_objectForKey_(a4, a2, @"kSBSKey_PreviousConfigurationList", 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, v20, 16);
  if (!v7) {
    return 0;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v17;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v17 != v10) {
      objc_enumerationMutation(v5);
    }
    v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
    v13 = objc_msgSend_objectForKey_(v12, v8, @"device");
    if (objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3)) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v16, v20, 16);
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)selectorChoiceToReplaceOption:(int)a3
{
  if ((a3 - 311) > 3) {
    return @"Restore";
  }
  else {
    return off_2647BAAB0[a3 - 311];
  }
}

+ (int64_t)selectorChoiceToMatrixTag:(int)a3
{
  int64_t v3 = 1131570529;
  if (a3 == 200) {
    int64_t v3 = 1165522021;
  }
  if (a3 == 300) {
    int64_t v3 = 1382379628;
  }
  if (a3 == 400) {
    return 1382380404;
  }
  else {
    return v3;
  }
}

+ (int)matrixTagToSelectorChoice:(int64_t)a3
{
  if (a3 == 1165522021) {
    int v3 = 200;
  }
  else {
    int v3 = 100;
  }
  if (a3 == 1382379628) {
    int v3 = 300;
  }
  if (a3 == 1382380404) {
    return 400;
  }
  else {
    return v3;
  }
}

+ (int64_t)autoGuessRecommendationToMatrixTag:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"BSSetupRecommend_OfferCreate")) {
    return 1131570529;
  }
  int64_t v5 = 1165522021;
  if ((objc_msgSend_isEqualToString_(a3, v4, @"BSSetupRecommend_OfferExtendOverEthernet") & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v6, @"BSSetupRecommend_OfferExtendWirelessly") & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v7, @"BSSetupRecommend_OfferJoinNetwork") & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v8, @"BSSetupRecommend_AskUserChooseBaseWired") & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v9, @"BSSetupRecommend_AskUserChooseBaseWireless") & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v10, @"BSSetupRecommend_AskUserChooseNetworkToJoin") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(a3, v11, @"BSSetupRecommend_OfferReplace")) {
      return 1382379628;
    }
    int64_t v5 = 1131570529;
    if (objc_msgSend_isEqualToString_(a3, v12, @"BSSetupRecommend_OfferReplaceConfiguration"))return 1382379628; {
  }
    }
  return v5;
}

+ (void)formatRecommendation:(id)a3 fromParamDict:(id)a4 forStep:(int)a5 restoreString:(id *)a6 restoreSpecificString:(id *)a7 dontRecommendString:(id *)a8
{
  id v13 = a3;
  if (a3
    || (uint64_t v14 = objc_msgSend_objectForKey_(a4, a2, @"kSBSKey_RestoreRecommendation"),
        (id v13 = v14) != 0))
  {
    v59 = a8;
    v15 = objc_msgSend_objectForKey_(v13, a2, @"BSAutoGuess_Recommendation");
    long long v17 = objc_msgSend_objectForKey_(v13, v16, @"BSAutoGuess_RestoreData");
    long long v19 = objc_msgSend_objectForKey_(v13, v18, @"BSAutoGuess_RestoreNetworkMode");
    int v22 = objc_msgSend_integerValue(v19, v20, v21);
    char isEqualToString = objc_msgSend_isEqualToString_(v15, v23, @"BSSetupRecommend_OfferRestore");
    v27 = 0;
    if (v22 <= 2)
    {
      if (!v22)
      {
        if (objc_msgSend_length(v17, v24, v25))
        {
          if (a5 == 16) {
            uint64_t ProductLocalizedStringWithFormat_fromParamDict = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v43, @"WillRestoreToCreateNetworkSpecific%@", a4);
          }
          else {
            uint64_t ProductLocalizedStringWithFormat_fromParamDict = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v43, @"CanRestoreToCreateNetworkSpecific%@", a4);
          }
          uint64_t v45 = sub_22685D62C(ProductLocalizedStringWithFormat_fromParamDict, qword_268148378);
          uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v46, v45, @"%@", 0, v17);
        }
        else
        {
          uint64_t valid = 0;
        }
        uint64_t v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v43, @"CanRestoreToCreateNetwork%@", a4);
        goto LABEL_49;
      }
      uint64_t valid = 0;
      if (v22 != 1) {
        goto LABEL_50;
      }
      if (objc_msgSend_length(v17, v24, v25))
      {
        if (a5 == 16) {
          uint64_t v33 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, @"WillRestoreToJoinNetworkSpecific%@", a4);
        }
        else {
          uint64_t v33 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, @"CanRestoreToJoinNetworkSpecific%@", a4);
        }
        uint64_t v34 = sub_22685D62C(v33, qword_268148378);
        uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v35, v34, @"%@", 0, v17);
      }
      else
      {
        uint64_t valid = 0;
      }
      v47 = @"CanRestoreToJoinNetwork%@";
      v48 = @"WillRestoreToJoinNetwork%@";
    }
    else if (v22 == 3)
    {
      if (objc_msgSend_length(v17, v24, v25))
      {
        if (a5 == 16) {
          uint64_t v36 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, @"WillRestoreToWirelessDisabledSpecific%@", a4);
        }
        else {
          uint64_t v36 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, @"CanRestoreToWirelessDisabledSpecific%@", a4);
        }
        uint64_t v37 = sub_22685D62C(v36, qword_268148378);
        uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v38, v37, @"%@", 0, v17);
      }
      else
      {
        uint64_t valid = 0;
      }
      v47 = @"CanRestoreToWirelessDisabled%@";
      v48 = @"WillRestoreToWirelessDisabled%@";
    }
    else
    {
      if (v22 == 10)
      {
        if (objc_msgSend_length(v17, v24, v25))
        {
          if (a5 == 16) {
            uint64_t v40 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v39, @"WillRestoreToExtendNetworkSpecific%@", a4);
          }
          else {
            uint64_t v40 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v39, @"CanRestoreToExtendNetworkSpecific%@", a4);
          }
          uint64_t v41 = sub_22685D62C(v40, qword_268148378);
          uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v42, v41, @"%@", 0, v17);
        }
        else
        {
          uint64_t valid = 0;
        }
        uint64_t v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v39, @"CanRestoreToExtendNetwork%@", a4);
        goto LABEL_49;
      }
      uint64_t valid = 0;
      if (v22 != 20) {
        goto LABEL_50;
      }
      if (objc_msgSend_length(v17, v24, v25))
      {
        if (a5 == 16) {
          uint64_t v30 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, @"WillRestoreToExtendNetworkSpecific%@", a4);
        }
        else {
          uint64_t v30 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, @"CanRestoreToExtendNetworkSpecific%@", a4);
        }
        uint64_t v31 = sub_22685D62C(v30, qword_268148378);
        uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v32, v31, @"%@", 0, v17);
      }
      else
      {
        uint64_t valid = 0;
      }
      v47 = @"CanRestoreToExtendNetwork%@";
      v48 = @"WillRestoreToExtendNetwork%@";
    }
    if (a5 == 16) {
      uint64_t v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)v48, a4);
    }
    else {
      uint64_t v49 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v29, (uint64_t)v47, a4);
    }
LABEL_49:
    v27 = (void *)sub_22685D62C(v49, qword_268148378);
LABEL_50:
    if (isEqualToString)
    {
LABEL_51:
      uint64_t v14 = 0;
      goto LABEL_61;
    }
    v50 = objc_msgSend_objectForKey_(v13, v24, @"BSAutoGuess_NoRestoreReason");
    uint64_t v53 = objc_msgSend_integerValue(v50, v51, v52);
    switch(v53)
    {
      case 4:
        uint64_t v58 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v54, @"CannotRecommendRestoreDHCPRangeConflict%@", a4);
        break;
      case 3:
        uint64_t v58 = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v54, @"CannotRecommendRestoreDisabledNoWanLink%@", a4);
        break;
      case 2:
        uint64_t v14 = 0;
        if (v22 <= 0x14 && ((1 << v22) & 0x100402) != 0)
        {
          uint64_t v55 = sub_22685D62C(@"CannotRecommendRestoreCantFindWiFi", qword_268148378);
          uint64_t v56 = sub_22685D62C(@"TextualSentenceConcatenator", qword_268148378);
          uint64_t v14 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v57, v56, @"%@", 0, v55);
        }
LABEL_61:
        a8 = v59;
        if (!a6) {
          goto LABEL_63;
        }
        goto LABEL_62;
      default:
        goto LABEL_51;
    }
    uint64_t v14 = (void *)sub_22685D62C(v58, qword_268148378);
    goto LABEL_61;
  }
  v27 = 0;
  uint64_t valid = 0;
  if (a6) {
LABEL_62:
  }
    *a6 = v27;
LABEL_63:
  if (a7) {
    *a7 = valid;
  }
  if (a8) {
    *a8 = v14;
  }
}

+ (id)nameForNetworkOrDevice:(id)a3
{
  uint64_t v4 = objc_msgSend_valueForKey_(a3, a2, @"SSID_STR");
  if (objc_msgSend_length(v4, v5, v6)) {
    return v4;
  }

  return (id)objc_msgSend_valueForKey_(a3, v7, @"name");
}

+ (id)productIDForNetworkOrDevice:(id)a3
{
  int v3 = NSNumber;
  uint64_t v5 = objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, (uint64_t)a3);

  return (id)objc_msgSend_numberWithInteger_(v3, v4, v5);
}

@end
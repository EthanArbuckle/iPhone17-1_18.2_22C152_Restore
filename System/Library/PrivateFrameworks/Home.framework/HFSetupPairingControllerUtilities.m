@interface HFSetupPairingControllerUtilities
+ (BOOL)_context:(id)a3 requiresUserConsentToReplaceInHome:(id)a4;
+ (BOOL)_shouldViewProgSwitchVisibleService:(id)a3;
+ (BOOL)isPairingPhaseIdle:(unint64_t)a3;
+ (double)accessoryDiscoveryFatalTimeout;
+ (double)accessoryDiscoverySoftTimeout;
+ (id)_accessoryNotFoundStatusDescriptionSuffixForSetupResult:(id)a3;
+ (id)_progSwitchVisibleServiceToView:(id)a3;
+ (id)descriptionForPairingPhase:(unint64_t)a3;
+ (id)urlComponentHomeSettingsForAccessory:(id)a3 forHome:(id)a4;
+ (unint64_t)processFirstPartyAccessorySetupProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 home:(id)a8 callerClass:(Class)a9;
+ (unint64_t)processSetupAccessoryProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 home:(id)a8 callerClass:(Class)aClass thirdParty:(BOOL)a10;
+ (unint64_t)processThirdPartyAccessorySetupProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 callerClass:(Class)a8;
+ (void)getStatusTitle:(id *)a3 statusDescription:(id *)a4 forPairingPhase:(unint64_t)a5 phaseStartDate:(id)a6 discoveredAccessory:(id)a7 setupResult:(id)a8 context:(id)a9 setupError:(id)a10;
@end

@implementation HFSetupPairingControllerUtilities

+ (double)accessoryDiscoverySoftTimeout
{
  return 30.0;
}

+ (double)accessoryDiscoveryFatalTimeout
{
  return 120.0;
}

+ (id)descriptionForPairingPhase:(unint64_t)a3
{
  if (a3 > 0xA) {
    return 0;
  }
  else {
    return off_2640915E0[a3];
  }
}

+ (BOOL)isPairingPhaseIdle:(unint64_t)a3
{
  return a3 - 8 < 0xFFFFFFFFFFFFFFF9;
}

+ (id)_accessoryNotFoundStatusDescriptionSuffixForSetupResult:(id)a3
{
  v3 = [a3 setupPayload];
  int v4 = objc_msgSend(v3, "hf_requiresEthernet");

  if (v4) {
    return @"Ethernet";
  }
  else {
    return @"Generic";
  }
}

+ (void)getStatusTitle:(id *)a3 statusDescription:(id *)a4 forPairingPhase:(unint64_t)a5 phaseStartDate:(id)a6 discoveredAccessory:(id)a7 setupResult:(id)a8 context:(id)a9 setupError:(id)a10
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v16 = a7;
  id v17 = a8;
  id v90 = a9;
  id v18 = a10;
  v19 = (void *)MEMORY[0x263EFF910];
  id v20 = a6;
  v21 = [v19 date];
  [v21 timeIntervalSinceDate:v20];
  double v23 = v22;

  v24 = [v17 error];

  v25 = v17;
  if (v24
    || ([v16 error], v26 = objc_claimAutoreleasedReturnValue(), v26, v25 = v16, v26))
  {
    uint64_t v27 = [v25 error];

    id v18 = (id)v27;
  }
  if (v18) {
    BOOL v28 = a5 == 1;
  }
  else {
    BOOL v28 = 0;
  }
  if (v28) {
    unint64_t v29 = 9;
  }
  else {
    unint64_t v29 = a5;
  }
  v30 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureGeneric", @"HFSetupPairingControllerStatusDescriptionFailureGeneric", 1);
  switch(v29)
  {
    case 0uLL:
    case 1uLL:
      v32 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionNotStarted", @"HFSetupPairingControllerStatusDescriptionNotStarted", 1);

      v33 = @"HFSetupPairingControllerStatusTitleNotStarted";
      goto LABEL_83;
    case 2uLL:
      [(id)objc_opt_class() accessoryDiscoverySoftTimeout];
      if (v23 >= v34) {
        v33 = @"HFSetupPairingControllerStatusTitleWaitingToDiscoverAccessorySoftTimeout";
      }
      else {
        v33 = @"HFSetupPairingControllerStatusTitleWaitingToDiscoverAccessory";
      }
      v35 = [a1 _accessoryNotFoundStatusDescriptionSuffixForSetupResult:v17];
      v36 = [NSString stringWithFormat:@"HFSetupPairingControllerStatusDescriptionWaitingToDiscoverAccessory_%@", v35];
      v32 = _HFLocalizedStringWithDefaultValue(v36, v36, 1);

      goto LABEL_83;
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
      v31 = @"HFSetupPairingControllerStatusDescriptionSettingUp";
      goto LABEL_12;
    case 5uLL:
      v31 = @"HFSetupPairingControllerStatusDescriptionAddingToHome";
LABEL_12:
      v32 = _HFLocalizedStringWithDefaultValue(v31, v31, 1);

      v33 = 0;
      goto LABEL_83;
    case 8uLL:
      v43 = [v16 name];
      v44 = v43;
      if (!v43)
      {
        a1 = [v90 setupAccessoryDescription];
        v44 = [a1 accessoryName];
      }
      v32 = HFLocalizedStringWithFormat(@"HFSetupPairingControllerStatusDescriptionFailureAlreadyPaired", @"%@", v37, v38, v39, v40, v41, v42, (uint64_t)v44);

      if (!v43)
      {
      }
      v33 = @"HFSetupPairingControllerStatusTitleFailureAlreadyPaired";
      goto LABEL_83;
    case 9uLL:
      v45 = [v18 userInfo];
      v46 = [v45 objectForKeyedSubscript:*MEMORY[0x263F08320]];
      if (v46) {
        [v18 localizedDescription];
      }
      else {
      v32 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureGeneric", @"HFSetupPairingControllerStatusDescriptionFailureGeneric", 1);
      }

      v47 = [v18 domain];
      int v48 = [v47 isEqualToString:*MEMORY[0x263F0C710]];

      if (!v48)
      {
        v51 = [v18 domain];
        int v52 = [v51 isEqualToString:@"HFErrorDomain"];

        if (!v52)
        {
LABEL_78:
          v33 = @"HFSetupPairingControllerStatusTitleFailureGeneric";
          goto LABEL_83;
        }
        uint64_t v53 = [v18 code];
        if (v53 != 33)
        {
          if (v53 == 22)
          {
            uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode", @"HFSetupPairingControllerStatusDescriptionFailureAccessoryNotInPairingMode", 1);

            v33 = @"HFSetupPairingControllerStatusTitleFailureAccessoryNotInPairingMode";
            goto LABEL_82;
          }
          if (v53 == 6)
          {
            uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureAccessoryNotFound", @"HFSetupPairingControllerStatusDescriptionFailureAccessoryNotFound", 1);

            v33 = @"HFSetupPairingControllerStatusTitleFailureAccessoryNotFound";
LABEL_82:
            v32 = (void *)v54;
            goto LABEL_83;
          }
          v63 = HFLogForCategory(0x3BuLL);
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            goto LABEL_77;
          }
          goto LABEL_96;
        }
        goto LABEL_52;
      }
      uint64_t v49 = [v18 code];
      if (v49 > 77)
      {
        if (v49 <= 2001)
        {
          switch(v49)
          {
            case 'N':
              v50 = @"HFSetupPairingControllerStatusDescriptionFailureInternetConnectionRequired";
              goto LABEL_60;
            case 'Z':
              if (+[HFUtilities useWLANInsteadOfWiFi]) {
                v64 = @"HFSetupPairingControllerStatusDescriptionFailureIncompatibleNetwork_WLAN";
              }
              else {
                v64 = @"HFSetupPairingControllerStatusDescriptionFailureIncompatibleNetwork_WIFI";
              }
              goto LABEL_80;
            case '[':
              goto LABEL_68;
            case '\\':
              v66 = [v16 accessory];
              v67 = [v66 home];
              v68 = [v67 residentDevices];
              uint64_t v69 = [v68 count];

              if (v69)
              {
                uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureNoCompatibleHomeHub", @"HFSetupPairingControllerStatusDescriptionFailureNoCompatibleHomeHub", 1);

                v33 = @"HFSetupPairingControllerStatusTitleFailureNoCompatibleHomeHub";
              }
              else
              {
LABEL_68:
                uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureNoHomeHub", @"HFSetupPairingControllerStatusDescriptionFailureNoHomeHub", 1);

                v33 = @"HFSetupPairingControllerStatusTitleFailureNoHomeHub";
              }
              break;
              v64 = @"HFSetupPairingControllerStatusDescriptionFailureOwnershipFailure";
              goto LABEL_80;
            case 'a':
              v70 = (void *)MEMORY[0x263F0DF00];
              v71 = [v17 setupPayload];
              v72 = [v71 category];
              v73 = [v72 categoryType];
              v74 = objc_msgSend(v70, "hf_userFriendlyLocalizedCapitalizedDescription:", v73);

              if (v74) {
                HFLocalizedStringWithFormat(@"HFSetupPairingControllerStatusDescriptionFailureMaximumAccessoriesOfTypeInHome", @"%@", v75, v76, v77, v78, v79, v80, (uint64_t)v74);
              }
              else {
              uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureMaximumAccessoriesOfTypeInHome_Generic", @"HFSetupPairingControllerStatusDescriptionFailureMaximumAccessoriesOfTypeInHome_Generic", 1);
              }

              v33 = @"HFSetupPairingControllerStatusTitleFailureMaximumAccessoriesOfTypeInHome";
              goto LABEL_82;
            case 'b':
              v64 = @"HFSetupPairingControllerStatusDescriptionFailureWifiCredentialGenerationFailed";
              goto LABEL_80;
            case 'c':
              v64 = @"HFSetupPairingControllerStatusDescriptionFailureEnterpriseNetworkNotSupported";
              goto LABEL_80;
            case 'd':
            case 'f':
              goto LABEL_59;
            default:
              goto LABEL_76;
          }
          goto LABEL_82;
        }
        if (v49 > 2014)
        {
          if (v49 == 2015)
          {
            v81 = [a1 _accessoryNotFoundStatusDescriptionSuffixForSetupResult:v17];
            v82 = [NSString stringWithFormat:@"HFSetupPairingControllerStatusDescriptionWaitingToDiscoverAccessory_%@", v81];
            uint64_t v83 = _HFLocalizedStringWithDefaultValue(v82, v82, 1);

            v33 = @"HFSetupPairingControllerStatusTitleFailureAccessoryConnectionFailed";
            v32 = (void *)v83;
            goto LABEL_83;
          }
          if (v49 == 2016)
          {
            uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureAccessoryFailedToJoinNetwork", @"HFSetupPairingControllerStatusDescriptionFailureAccessoryFailedToJoinNetwork", 1);

            v33 = @"HFSetupPairingControllerStatusTitleFailureAccessoryFailedToJoinNetwork";
            goto LABEL_82;
          }
          goto LABEL_76;
        }
        if (v49 != 2002)
        {
          if (v49 == 2004)
          {
            uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureUnsupportedSetupPayload", @"HFSetupPairingControllerStatusDescriptionFailureUnsupportedSetupPayload", 1);

            v33 = @"HFSetupPairingControllerStatusTitleFailureUnsupportedSetupPayload";
            goto LABEL_82;
          }
LABEL_76:
          v63 = HFLogForCategory(0x3BuLL);
          if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
LABEL_77:

            goto LABEL_78;
          }
LABEL_96:
          v89 = [v18 domain];
          *(_DWORD *)buf = 138412546;
          v92 = v89;
          __int16 v93 = 2112;
          id v94 = v18;
          _os_log_error_impl(&dword_20B986000, v63, OS_LOG_TYPE_ERROR, "Unexpected accessory %@ setup error %@", buf, 0x16u);

          goto LABEL_77;
        }
        v64 = @"HFSetupPairingControllerStatusDescriptionFailureIncorrectSetupCode";
        goto LABEL_80;
      }
      if (v49 > 53)
      {
        if (v49 == 54)
        {
LABEL_59:
          v50 = @"HFSetupPairingControllerStatusDescriptionFailureGenericNetwork";
LABEL_60:
          uint64_t v65 = HFLocalizedWiFiString(v50);
          goto LABEL_81;
        }
        if (v49 != 55) {
          goto LABEL_76;
        }
        v64 = @"HFSetupPairingControllerStatusDescriptionFailureAuthenticationFailed";
LABEL_80:
        uint64_t v65 = _HFLocalizedStringWithDefaultValue(v64, v64, 1);
LABEL_81:
        uint64_t v54 = v65;

        v33 = @"HFSetupPairingControllerStatusTitleFailureGeneric";
        goto LABEL_82;
      }
      if (v49 == 3)
      {
LABEL_52:
        uint64_t v54 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionFailureInvalidCode", @"HFSetupPairingControllerStatusDescriptionFailureInvalidCode", 1);

        v33 = @"HFSetupPairingControllerStatusTitleFailureInvalidCode";
        goto LABEL_82;
      }
      if (v49 != 13) {
        goto LABEL_76;
      }
      v61 = [v16 name];
      v62 = v61;
      if (!v61)
      {
        a1 = [v90 setupAccessoryDescription];
        v62 = [a1 accessoryName];
      }
      v30 = HFLocalizedStringWithFormat(@"HFSetupPairingControllerStatusDescriptionFailureAlreadyPaired", @"%@", v55, v56, v57, v58, v59, v60, (uint64_t)v62);

      if (!v61)
      {
      }
      v33 = @"HFSetupPairingControllerStatusTitleFailureAlreadyPaired";
LABEL_15:
      v32 = v30;
LABEL_83:
      v84 = HFLocalizedWiFiStringKeyForKey(v33);
      v85 = _HFLocalizedStringWithDefaultValue(v84, 0, 0);

      if (v85)
      {
        v85 = HFLocalizedWiFiString(v33);
      }
      v86 = [NSString stringWithFormat:@"%@_withoutName", v33];
      v87 = _HFLocalizedStringWithDefaultValue(v86, 0, 0);

      if (v87)
      {
        uint64_t v88 = _HFLocalizedStringWithDefaultValue(v86, v86, 1);

        v85 = (void *)v88;
      }
      if (!v85)
      {
        v85 = _HFLocalizedStringWithDefaultValue(v33, 0, 0);
      }
      if (a3) {
        *a3 = v85;
      }
      if (a4) {
        *a4 = v32;
      }

      return;
    case 0xAuLL:
      v32 = _HFLocalizedStringWithDefaultValue(@"HFSetupPairingControllerStatusDescriptionSuccess", @"HFSetupPairingControllerStatusDescriptionSuccess", 1);

      v33 = @"HFSetupPairingControllerStatusTitleSuccess";
      goto LABEL_83;
    default:
      v33 = 0;
      goto LABEL_15;
  }
}

+ (unint64_t)processFirstPartyAccessorySetupProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 home:(id)a8 callerClass:(Class)a9
{
  LOBYTE(v10) = 0;
  return +[HFSetupPairingControllerUtilities processSetupAccessoryProgressChange:a3 currentPhase:a4 context:a5 discoveredAccessory:a6 setupResult:a7 home:a8 callerClass:a9 thirdParty:v10];
}

+ (unint64_t)processThirdPartyAccessorySetupProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 callerClass:(Class)a8
{
  LOBYTE(v9) = 1;
  return +[HFSetupPairingControllerUtilities processSetupAccessoryProgressChange:a3 currentPhase:a4 context:a5 discoveredAccessory:a6 setupResult:a7 home:0 callerClass:a8 thirdParty:v9];
}

+ (unint64_t)processSetupAccessoryProgressChange:(int64_t)a3 currentPhase:(unint64_t)a4 context:(id)a5 discoveredAccessory:(id)a6 setupResult:(id)a7 home:(id)a8 callerClass:(Class)aClass thirdParty:(BOOL)a10
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = [v15 setupAccessoryDescription];
  v19 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass(aClass);
    id v20 = v37 = v17;
    HMSetupAccessoryProgressAsString();
    v21 = v18;
    id v22 = v15;
    v24 = id v23 = a7;
    v25 = +[HFSetupPairingControllerUtilities descriptionForPairingPhase:a4];
    *(_DWORD *)buf = 138413570;
    id v40 = a1;
    __int16 v41 = 2112;
    uint64_t v42 = v20;
    __int16 v43 = 2112;
    v44 = v24;
    __int16 v45 = 2048;
    int64_t v46 = a3;
    __int16 v47 = 2112;
    int v48 = v25;
    __int16 v49 = 2048;
    unint64_t v50 = a4;
    _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "%@ [%@] didUpdateProgress: %@ [%ld] with currentPhase: %@ [%lu]", buf, 0x3Eu);

    a7 = v23;
    id v15 = v22;
    id v18 = v21;

    id v17 = v37;
  }

  if (a4 == 9)
  {
    v26 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "...but we're already in a 'failed' state, so ignoring the progress update", buf, 2u);
    }

    unint64_t v27 = 9;
  }
  else
  {
    objc_msgSend(v16, "setCertificationStatus:", objc_msgSend(v18, "certificationStatus"));
    if ([v16 certificationStatus])
    {
      BOOL v28 = [v18 accessoryName];
      [v16 setName:v28];

      unint64_t v29 = [v18 category];
      [v16 setCategory:v29];

      v30 = [v18 manufacturerName];
      [v16 setManufacturer:v30];
    }
    if (a4 == 6)
    {
LABEL_10:
      unint64_t v27 = 6;
    }
    else
    {
      unint64_t v27 = 5;
      switch(a3)
      {
        case 0:
        case 1:
        case 2:
          if (a4 == 4) {
            unint64_t v27 = 4;
          }
          else {
            unint64_t v27 = 3;
          }
          break;
        case 3:
          break;
        case 6:
          if (!a10) {
            [v17 userDidRespondToConsentRequestForSetupAccessoryDescription:v18 withResponse:1];
          }
          BOOL v31 = a4 == 1;
          goto LABEL_24;
        case 7:
        case 21:
        case 24:
          if (a7) {
            BOOL v31 = a4 == 1;
          }
          else {
            BOOL v31 = 1;
          }
LABEL_24:
          if (v31) {
            unint64_t v27 = 1;
          }
          else {
            unint64_t v27 = 4;
          }
          break;
        case 8:
        case 10:
          goto LABEL_10;
        case 9:
          int v34 = [(id)objc_opt_class() _context:v15 requiresUserConsentToReplaceInHome:v17];
          unint64_t v35 = 7;
          if (!v34) {
            unint64_t v35 = a4;
          }
          if ((v34 & 1) == 0 && !a10)
          {
            [v17 userDidRespondToConsentRequestForSetupAccessoryDescription:v18 withResponse:3];
            unint64_t v35 = a4;
          }
          if (a4 == 1) {
            unint64_t v27 = v35;
          }
          else {
            unint64_t v27 = 4;
          }
          break;
        default:
          v32 = HFLogForCategory(0x3BuLL);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v36 = HMSetupAccessoryProgressAsString();
            *(_DWORD *)buf = 138412290;
            id v40 = v36;
            _os_log_error_impl(&dword_20B986000, v32, OS_LOG_TYPE_ERROR, "Unexpected accessory setup progress %@", buf, 0xCu);
          }
          unint64_t v27 = a4;
          break;
      }
    }
  }

  return v27;
}

+ (BOOL)_context:(id)a3 requiresUserConsentToReplaceInHome:(id)a4
{
  int v4 = [a3 setupAccessoryDescription];
  v5 = [v4 category];
  v6 = [v5 categoryType];
  char v7 = [v6 isEqualToString:*MEMORY[0x263F0B1C0]];

  return v7;
}

+ (id)urlComponentHomeSettingsForAccessory:(id)a3 forHome:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 cameraProfiles];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [v5 cameraProfiles];
    uint64_t v10 = [v9 firstObject];
    v11 = +[HFURLComponents cameraProfileDetailsURLForCameraProfile:v10 home:v6];

LABEL_3:
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "hf_isNetworkRouter"))
  {
    v13 = objc_msgSend(v5, "hf_irrigationSystemServices");
    uint64_t v14 = [v13 count];

    if (v14)
    {
LABEL_7:
      uint64_t v12 = +[HFURLComponents accessoryDetailsURLForAccessory:v5 home:v6];
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "hf_isCategorizedAsBridge"))
    {
      uint64_t v12 = +[HFURLComponents bridgeSettingsURLForAccessory:v5 home:v6];
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "hf_isSingleServiceAccessory"))
    {
      uint64_t v9 = objc_msgSend(v5, "hf_primaryService");
    }
    else
    {
      if (!+[HFSetupPairingControllerUtilities _shouldViewProgSwitchVisibleService:v5])goto LABEL_7; {
      uint64_t v9 = +[HFSetupPairingControllerUtilities _progSwitchVisibleServiceToView:v5];
      }
    }
    v11 = +[HFURLComponents serviceDetailsURLForService:v9 home:v6];
    goto LABEL_3;
  }
  uint64_t v12 = +[HFURLComponents networkRouterSettingsURLForHome:v6];
LABEL_10:
  v11 = (void *)v12;
LABEL_11:
  id v15 = [MEMORY[0x263F08BA0] componentsWithURL:v11 resolvingAgainstBaseURL:1];
  id v16 = [v15 queryItems];
  id v17 = (void *)MEMORY[0x263F08BD0];
  id v18 = [NSString stringWithFormat:@"%@", MEMORY[0x263EFFA88]];
  v19 = [v17 queryItemWithName:@"HFURLComponentsFromHUIS" value:v18];
  id v20 = [v16 arrayByAddingObject:v19];
  [v15 setQueryItems:v20];

  return v15;
}

+ (BOOL)_shouldViewProgSwitchVisibleService:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hf_isProgrammableSwitch"))
  {
    int v4 = objc_msgSend(v3, "hf_visibleServices");
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_progSwitchVisibleServiceToView:(id)a3
{
  id v4 = a3;
  if ([a1 _shouldViewProgSwitchVisibleService:v4])
  {
    BOOL v5 = objc_msgSend(v4, "hf_visibleServices");
    id v6 = objc_msgSend(v4, "hf_primaryService");
    int v7 = objc_msgSend(v5, "na_safeContainsObject:", v6);

    if (v7)
    {
      uint64_t v8 = objc_msgSend(v4, "hf_primaryService");
    }
    else
    {
      uint64_t v9 = objc_msgSend(v4, "hf_visibleServices");
      uint64_t v8 = [v9 anyObject];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end
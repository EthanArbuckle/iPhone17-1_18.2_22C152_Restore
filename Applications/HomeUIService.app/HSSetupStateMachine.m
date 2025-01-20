@interface HSSetupStateMachine
- (BOOL)_deviceIsOnAMultiUserLanguage;
- (BOOL)_isVoiceRecognitionEnabled:(id)a3;
- (BOOL)_shouldShowSiriEndpointStep:(id)a3;
- (BOOL)_shouldSkipRestrictedGuestAccessStep:(id)a3;
- (BOOL)_shouldSkipSafetyAndSecurityStep:(id)a3;
- (BOOL)_shouldSkipSiriUpdateRequiredStep:(id)a3;
- (BOOL)_shouldSkipSiriVoiceRecognitionStep:(id)a3;
- (BOOL)_shouldSkipUseSiriFlow:(id)a3;
- (BOOL)_shouldSkipUseSiriStep:(id)a3;
- (BOOL)_sync_shouldSkipPersonalRequestsStep:(id)a3;
- (BOOL)_sync_shouldSkipSetupSiriStep:(id)a3;
- (BOOL)_sync_shouldSkipSiriForEveryoneStep:(id)a3;
- (BOOL)_sync_shouldSkipSiriVoiceTrainingStep:(id)a3;
- (BOOL)_sync_shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4;
- (BOOL)_sync_shouldSkipUseAirPlayStep:(id)a3;
- (BOOL)configSupportsPairing:(id)a3;
- (BOOL)stepRequiresDismissalConfirmation:(int64_t)a3 withCoordinator:(id)a4 configuration:(id)a5;
- (BOOL)stepRequiresIdentifyButton:(int64_t)a3 withCoordinator:(id)a4 configuration:(id)a5;
- (Class)configurationObjectClass;
- (id)_voiceProfileCheckFuture;
- (id)shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4;
- (int64_t)stepFollowingStep:(int64_t)a3 withConfiguration:(id)a4;
@end

@implementation HSSetupStateMachine

- (Class)configurationObjectClass
{
  return (Class)objc_opt_class();
}

- (BOOL)configSupportsPairing:(id)a3
{
  id v3 = a3;
  v4 = [v3 delegate];
  id v5 = [v4 stateMachineConfigurationGetLaunchReason:v3];

  v6 = [v3 home];

  if (v6) {
    BOOL v7 = v5 == (id)4;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v10 = !v7 && v5 != (id)5 && v5 != (id)6;

  return v10;
}

- (int64_t)stepFollowingStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v7 = a4;
  v8 = [(HSSetupStateMachine *)self configurationObjectClass];
  id v9 = v7;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
    id v11 = v10;
    if (!v11)
    {
      v12 = +[NSAssertionHandler currentHandler];
      v13 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v11 = 0;
  }

  unsigned int v14 = [(HSSetupStateMachine *)self configSupportsPairing:v11];
  if (a3 >= 9 && v14) {
    [v11 setIsReadyToPair:1];
  }
  v15 = [v11 pairingError];

  if (v15)
  {
LABEL_12:
    int64_t v16 = 53;
  }
  else
  {
    v18 = [v11 delegate];
    v19 = (char *)[v18 stateMachineConfigurationGetLaunchReason:v11];

    int64_t v16 = 3;
    switch(a3)
    {
      case 0:
        int64_t v16 = 12;
        switch((unint64_t)v19)
        {
          case 0uLL:
            v34 = [v11 delegate];
            unsigned int v35 = [v34 stateMachineConfigurationIsLaunchedToSetupSpecificAccessory:v11];

            if (v35) {
              int64_t v16 = 4;
            }
            else {
              int64_t v16 = 1;
            }
            break;
          case 1uLL:
            goto LABEL_13;
          case 2uLL:
            goto LABEL_19;
          case 3uLL:
            v36 = [v11 delegate];
            unsigned int v37 = [v36 stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:v11];

            if (v37) {
              int64_t v16 = 36;
            }
            else {
              int64_t v16 = 35;
            }
            break;
          case 4uLL:
            int64_t v16 = 17;
            break;
          case 5uLL:
            goto LABEL_15;
          case 6uLL:
            goto LABEL_20;
          case 7uLL:
          case 8uLL:
            v20 = +[NSAssertionHandler currentHandler];
            [v20 handleFailureInMethod:a2 object:self file:@"HSSetupStateMachine.m" lineNumber:112 description:@"Unsupported Launch Reason %ld" v19];

            goto LABEL_18;
          default:
            goto LABEL_18;
        }
        break;
      case 1:
LABEL_18:
        int64_t v16 = 2;
        break;
      case 2:
        break;
      case 3:
        int64_t v16 = 4;
        break;
      case 4:
        v21 = [v11 setupDescription];
        v22 = [v21 setupAccessoryPayload];

        if (v22)
        {
          int64_t v16 = 5;
        }
        else
        {
          v30 = [v11 delegate];
          v31 = [v30 stateMachineConfigurationGetDiscoveredAccessory:v11];

          v32 = [v11 delegate];
          v33 = [v32 stateMachineConfigurationGetSetupCode:v11];

          if (v31 && (![v31 requiresSetupCode] || objc_msgSend(v33, "length"))) {
            int64_t v16 = 5;
          }
          else {
            int64_t v16 = 1;
          }
        }
        break;
      case 5:
        int64_t v16 = 6;
        break;
      case 6:
        int64_t v16 = 7;
        break;
      case 7:
        if (_os_feature_enabled_impl())
        {
          int64_t v16 = 8;
          break;
        }
        BOOL v28 = CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) == 0;
        uint64_t v29 = 8;
        goto LABEL_83;
      case 8:
        int64_t v16 = 9;
        break;
      case 9:
        int64_t v16 = 10;
        break;
      case 10:
        if (_os_feature_enabled_impl())
        {
          int64_t v16 = 11;
        }
        else if (CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
        {
          int64_t v16 = 11;
        }
        else
        {
          int64_t v16 = 14;
        }
        break;
      case 11:
        int64_t v16 = 14;
        break;
      case 12:
        v23 = [v11 delegate];
        unsigned int v24 = [v23 stateMachineConfigurationShouldJumpToDoneStep:v11];

        if (v24) {
          int64_t v16 = 52;
        }
        else {
          int64_t v16 = 13;
        }
        break;
      case 13:
        v25 = [v11 addedAccessory];
        v26 = [v25 pendingConfigurationIdentifier];

        int64_t v16 = +[HSSetupContentProvider hsProxCardSetupUIStepForString:v26];
        if (v16 <= 13)
        {
          v27 = [v11 addedAccessory];

          if (!v27)
          {
            v38 = +[NSAssertionHandler currentHandler];
            [v38 handleFailureInMethod:a2, self, @"HSSetupStateMachine.m", 187, @"Invalid parameter not satisfying: %@", @"config.addedAccessory" object file lineNumber description];
          }
          int64_t v16 = 14;
        }

        break;
      case 14:
        int64_t v16 = 15;
        break;
      case 15:
        int64_t v16 = 16;
        break;
      case 16:
      case 17:
LABEL_15:
        int64_t v16 = 18;
        break;
      case 18:
        BOOL v28 = _os_feature_enabled_impl() == 0;
        uint64_t v29 = 19;
        goto LABEL_83;
      case 19:
        int64_t v16 = 20;
        break;
      case 20:
LABEL_20:
        int64_t v16 = 21;
        break;
      case 21:
        int64_t v16 = 22;
        break;
      case 22:
        if ((unint64_t)(v19 - 4) >= 3) {
          int64_t v16 = 23;
        }
        else {
          int64_t v16 = 52;
        }
        break;
      case 23:
        int64_t v16 = 24;
        break;
      case 24:
        int64_t v16 = 25;
        break;
      case 25:
        int64_t v16 = 26;
        break;
      case 26:
        int64_t v16 = 27;
        break;
      case 27:
        int64_t v16 = 28;
        break;
      case 28:
        int64_t v16 = 29;
        break;
      case 29:
        int64_t v16 = 30;
        break;
      case 30:
        int64_t v16 = 31;
        break;
      case 31:
        int64_t v16 = 32;
        break;
      case 32:
        int64_t v16 = 33;
        break;
      case 33:
        int64_t v16 = 34;
        break;
      case 34:
        int64_t v16 = 35;
        break;
      case 35:
        int64_t v16 = 36;
        break;
      case 36:
        int64_t v16 = 37;
        break;
      case 37:
        int64_t v16 = 38;
        break;
      case 38:
        int64_t v16 = 39;
        break;
      case 39:
        int64_t v16 = 40;
        break;
      case 40:
        int64_t v16 = 41;
        break;
      case 41:
        int64_t v16 = 42;
        break;
      case 42:
        int64_t v16 = 43;
        break;
      case 43:
        int64_t v16 = 44;
        break;
      case 44:
        int64_t v16 = 45;
        break;
      case 45:
        int64_t v16 = 46;
        break;
      case 46:
        int64_t v16 = 47;
        break;
      case 47:
LABEL_19:
        int64_t v16 = 48;
        break;
      case 48:
        int64_t v16 = 49;
        break;
      case 49:
        int64_t v16 = 50;
        break;
      case 50:
        if (_os_feature_enabled_impl())
        {
          int64_t v16 = 51;
        }
        else
        {
          BOOL v28 = CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) == 0;
          uint64_t v29 = 51;
LABEL_83:
          if (v28) {
            int64_t v16 = v29 + 1;
          }
          else {
            int64_t v16 = v29;
          }
        }
        break;
      case 51:
        int64_t v16 = 52;
        break;
      default:
        goto LABEL_12;
    }
  }
LABEL_13:

  return v16;
}

- (id)shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = [v6 delegate];
  unsigned int v8 = [v7 stateMachineConfigurationIsLaunchedToSetupSpecificAccessory:v6];

  if (v8)
  {
    if (a3 > 9)
    {
      BOOL v11 = 0;
      if (a3 == 10 || a3 == 53)
      {
LABEL_11:
        v12 = +[NSNumber numberWithBool:v11];
        uint64_t v15 = +[NAFuture futureWithResult:v12];
LABEL_12:
        unsigned int v14 = (void *)v15;
        goto LABEL_13;
      }
    }
    else if (a3 == 1 || a3 == 4)
    {
      id v9 = [v6 delegate];
      BOOL v10 = [v9 stateMachineConfigurationGetSetupCode:v6];
      BOOL v11 = [v10 length] != 0;

      goto LABEL_11;
    }
    BOOL v11 = 1;
    goto LABEL_11;
  }
  if (a3 == 12)
  {
    v12 = [v6 delegate];
    v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 stateMachineConfigurationShouldSkipResumeSelectAccessoryStep:v6]);
    unsigned int v14 = +[NAFuture futureWithResult:v13];

LABEL_13:
    goto LABEL_14;
  }
  v17 = [v6 delegate];
  id v18 = [v17 stateMachineConfigurationGetLaunchReason:v6];

  v19 = [v6 addedAccessory];
  if (objc_msgSend(v19, "hf_isNetworkRouter"))
  {
    v20 = [v6 delegate];
    unsigned int v21 = [v20 stateMachineConfigurationActiveTupleIsTopTuple];

    if (v21)
    {
      BOOL v23 = a3 > 10 && a3 != 47;
      unsigned int v24 = +[NSNumber numberWithInt:v23];
      unsigned int v14 = +[NAFuture futureWithResult:v24];

      goto LABEL_14;
    }
  }
  else
  {
  }
  switch(a3)
  {
    case 17:
      v25 = [v6 home];
      unsigned int v134 = [v25 hf_currentUserIsAdministrator];
      if ([v25 hasOnboardedForWalletKey])
      {
        unsigned int v137 = 0;
      }
      else
      {
        v80 = [v25 hf_walletKeyAccessories];
        if ([v80 count])
        {
          if (v134 && (objc_msgSend(v25, "hf_hasHomeHubSupportingWalletKey") & 1) != 0) {
            unsigned int v137 = 1;
          }
          else {
            unsigned int v137 = [v25 hf_currentUserIsOwner];
          }
        }
        else
        {
          unsigned int v137 = 0;
        }
      }
      v97 = HFLogForCategory();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBOOL();
        v127 = (char *)objc_claimAutoreleasedReturnValue();
        v132 = [v25 name];
        v129 = [v25 uniqueIdentifier];
        [v25 hasOnboardedForWalletKey];
        NSStringFromBOOL();
        v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v98 = [v25 hf_walletKeyAccessories];
        CFStringRef v99 = (const __CFString *)[v98 count];
        v100 = [v25 hf_walletKeyAccessories];
        v101 = +[HMAccessory hf_minimumDescriptionsOfAccessories:v100];
        [v25 hf_hasHomeHubSupportingWalletKey];
        v102 = NSStringFromBOOL();
        v103 = [v25 currentUser];
        v104 = [v103 hf_prettyDescription];
        *(_DWORD *)buf = 136317186;
        uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        __int16 v161 = 2112;
        v162 = v127;
        __int16 v163 = 2112;
        uint64_t v164 = (uint64_t)v132;
        __int16 v165 = 2112;
        *(void *)v166 = v129;
        *(_WORD *)&v166[8] = 2112;
        CFStringRef v167 = v125;
        __int16 v168 = 2048;
        CFStringRef v169 = v99;
        __int16 v170 = 2112;
        *(void *)v171 = v101;
        *(_WORD *)&v171[8] = 2112;
        v172 = v102;
        __int16 v173 = 2112;
        v174 = v104;
        _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "(%s) showWalletKeyFeature = %@ | home <Name: %@, uniqueIdentifier: %@> | hasOnboardedForWalletKey = %@ | walletKeyAccessories (%ld) %@ | hasHomeHubSupportingWalletKey %@ | user %@", buf, 0x5Cu);
      }
      if ([v25 hasOnboardedForAccessCode])
      {
        unsigned int v136 = 0;
      }
      else
      {
        v105 = [v25 hf_accessoriesSupportingAccessCodes];
        if ([v105 count])
        {
          if (v134 && (objc_msgSend(v25, "hf_hasHomeHubSupportingAccessCodes") & 1) != 0) {
            unsigned int v136 = 1;
          }
          else {
            unsigned int v136 = [v25 hf_currentUserIsOwner];
          }
        }
        else
        {
          unsigned int v136 = 0;
        }
      }
      v106 = HFLogForCategory();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBOOL();
        v128 = (char *)objc_claimAutoreleasedReturnValue();
        v133 = [v25 name];
        v130 = [v25 uniqueIdentifier];
        [v25 hasOnboardedForAccessCode];
        NSStringFromBOOL();
        v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v107 = [v25 hf_accessoriesSupportingAccessCodes];
        CFStringRef v108 = (const __CFString *)[v107 count];
        v109 = [v25 hf_accessoriesSupportingAccessCodes];
        v110 = +[HMAccessory hf_minimumDescriptionsOfAccessories:v109];
        [v25 hf_hasHomeHubSupportingAccessCodes];
        v111 = NSStringFromBOOL();
        v112 = [v25 currentUser];
        v113 = [v112 hf_prettyDescription];
        *(_DWORD *)buf = 136317186;
        uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        __int16 v161 = 2112;
        v162 = v128;
        __int16 v163 = 2112;
        uint64_t v164 = (uint64_t)v133;
        __int16 v165 = 2112;
        *(void *)v166 = v130;
        *(_WORD *)&v166[8] = 2112;
        CFStringRef v167 = v126;
        __int16 v168 = 2048;
        CFStringRef v169 = v108;
        __int16 v170 = 2112;
        *(void *)v171 = v110;
        *(_WORD *)&v171[8] = 2112;
        v172 = v111;
        __int16 v173 = 2112;
        v174 = v113;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "(%s) showAccessCodeFeature = %@ | home <Name: %@, uniqueIdentifier: %@> | hasOnboardedForAccessCode = %@ | accessoriesSupportingAccessCodes (%ld) %@ | hasHomeHubSupportingAccessCodes %@ | user %@", buf, 0x5Cu);
      }
      v114 = HFLogForCategory();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromBOOL();
        v115 = (char *)objc_claimAutoreleasedReturnValue();
        v116 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:17];
        v117 = NSStringFromBOOL();
        NSStringFromBOOL();
        v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        __int16 v161 = 2112;
        v162 = v115;
        __int16 v163 = 2112;
        uint64_t v164 = (uint64_t)v116;
        __int16 v165 = 2112;
        *(void *)v166 = v117;
        *(_WORD *)&v166[8] = 2112;
        CFStringRef v167 = v118;
        _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "(%s) shouldShow = %@ for %@ because showWalletKeyFeature = %@ and showAccessCodeFeature = %@", buf, 0x34u);
      }
      v119 = +[NSNumber numberWithInt:(v137 | v136) ^ 1];
      unsigned int v14 = +[NAFuture futureWithResult:v119];

      goto LABEL_14;
    case 18:
      v27 = [v6 home];
      unsigned int v28 = [v27 hf_currentUserIsOwner];
      unsigned int v138 = [v27 hf_currentUserIsAdministrator];
      unsigned int v135 = [v27 hf_hasHomeHubSupportingWalletKey];
      uint64_t v29 = [v6 addedAccessory];
      unsigned int v30 = [v29 supportsWalletKey] ^ 1;
      if (((v30 | v28) & 1) == 0)
      {
        if (v135 & v138) {
          unsigned int v30 = 0;
        }
        else {
          unsigned int v30 = [v27 hasOnboardedForWalletKey] ^ 1;
        }
      }

      v81 = HFLogForCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v131 = [(id)objc_opt_class() description];
        if (v30) {
          CFStringRef v82 = @"Skipping";
        }
        else {
          CFStringRef v82 = @"Not Skipping";
        }
        v83 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:18];
        v84 = [v6 addedAccessory];
        v85 = [v6 addedAccessory];
        unsigned int v86 = [v85 supportsWalletKey];
        *(_DWORD *)buf = 138414338;
        CFStringRef v87 = @"doesn't support";
        __int16 v161 = 2080;
        v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        uint64_t v160 = (uint64_t)v131;
        __int16 v163 = 2112;
        if (v86) {
          CFStringRef v87 = @"supports";
        }
        uint64_t v164 = (uint64_t)v82;
        __int16 v165 = 2112;
        *(void *)v166 = v83;
        *(_WORD *)&v166[8] = 2112;
        CFStringRef v167 = v84;
        __int16 v168 = 2112;
        CFStringRef v169 = v87;
        __int16 v170 = 1024;
        *(_DWORD *)v171 = v28;
        *(_WORD *)&v171[4] = 1024;
        *(_DWORD *)&v171[6] = v138;
        LOWORD(v172) = 1024;
        *(_DWORD *)((char *)&v172 + 2) = v135;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ %@ because %@ %@ wallet key. isOwner: %{BOOL}d  isAdmin: %{BOOL}d  home hub supports wallet key:(%{BOOL}d)", buf, 0x50u);
      }
      if (v30)
      {
        v88 = +[NSNumber numberWithInt:1];
        unsigned int v14 = +[NAFuture futureWithResult:v88];
      }
      else if (+[HFUtilities isAnIPad])
      {
        v89 = HFLogForCategory();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          v90 = [(id)objc_opt_class() description];
          v91 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:18];
          *(_DWORD *)buf = 138412802;
          uint64_t v160 = (uint64_t)v90;
          __int16 v161 = 2080;
          v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          __int16 v163 = 2112;
          uint64_t v164 = (uint64_t)v91;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "(%@:%s) Not skipping %@ for iPads", buf, 0x20u);
        }
        unsigned int v14 = +[NAFuture futureWithResult:&__kCFBooleanFalse];
      }
      else
      {
        v94 = [v27 hf_hasWalletKeyCompatibleDevice];
        v158[0] = _NSConcreteStackBlock;
        v158[1] = 3221225472;
        v158[2] = sub_10000E48C;
        v158[3] = &unk_1000A9218;
        v158[4] = self;
        v158[5] = 18;
        unsigned int v14 = [v94 flatMap:v158];
      }
      goto LABEL_14;
    case 19:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        v64 = HFLogForCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:19];
          *(_DWORD *)buf = 136315394;
          uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          __int16 v161 = 2112;
          v162 = v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because feature flag is NOT enabled.", buf, 0x16u);
        }
        goto LABEL_71;
      }
      v31 = [v6 home];
      if (v31)
      {
        v32 = [v6 addedAccessory];
        unsigned int v33 = [v32 supportsUWBUnlock];

        v34 = HFLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v35 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:19];
          uint64_t v36 = [v6 addedAccessory];
          unsigned int v37 = (void *)v36;
          CFStringRef v38 = @"doesn't support";
          *(_DWORD *)buf = 136316162;
          uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          if (v33) {
            CFStringRef v38 = @"supports";
          }
          CFStringRef v39 = @"Skipping UWB prox card.";
          if (v33) {
            CFStringRef v39 = &stru_1000ABBA8;
          }
          __int16 v161 = 2112;
          v162 = v35;
          __int16 v163 = 2112;
          uint64_t v164 = v36;
          __int16 v165 = 2112;
          *(void *)v166 = v38;
          *(_WORD *)&v166[8] = 2112;
          CFStringRef v167 = v39;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "(%s) step = %@. %@ %@ UWB unlock. %@", buf, 0x34u);
        }
        if ((v33 & 1) == 0)
        {
          v121 = +[NSNumber numberWithInt:1];
          unsigned int v14 = +[NAFuture futureWithResult:v121];

          goto LABEL_146;
        }
        if (+[HFUtilities isAnIPhone])
        {
          if ((MGGetBoolAnswer() & 1) != 0
            || (+[HFUtilities isInternalTest] & 1) != 0)
          {
            v40 = [v6 home];
            v41 = [v40 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];
            v153[0] = _NSConcreteStackBlock;
            v153[1] = 3221225472;
            v153[2] = sub_10000E638;
            v153[3] = &unk_1000A9290;
            uint64_t v156 = 19;
            id v42 = v6;
            id v157 = v18;
            id v154 = v42;
            v155 = self;
            v43 = [v41 flatMap:v153];
            v150[0] = _NSConcreteStackBlock;
            v150[1] = 3221225472;
            v150[2] = sub_10000EB8C;
            v150[3] = &unk_1000A9268;
            v150[4] = self;
            uint64_t v152 = 19;
            id v151 = v42;
            unsigned int v14 = [v43 recover:v150];

LABEL_146:
            goto LABEL_14;
          }
          v95 = HFLogForCategory();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            v123 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:19];
            v124 = +[HUHomeUIServiceLaunchUserInfo launchReasonDescription:v18];
            *(_DWORD *)buf = 136315650;
            uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
            __int16 v161 = 2112;
            v162 = v123;
            __int16 v163 = 2112;
            uint64_t v164 = (uint64_t)v124;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because this device does not have UWB capability. Launch reason = %@", buf, 0x20u);
          }
        }
        else
        {
          v95 = HFLogForCategory();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            v122 = +[HUHomeUIServiceLaunchUserInfo launchReasonDescription:v18];
            *(_DWORD *)buf = 136315394;
            uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
            __int16 v161 = 2112;
            v162 = v122;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because this device is not iPhone. This prox card should only displayed on iPhones.", buf, 0x16u);
          }
        }
      }
      else
      {
        v95 = HFLogForCategory();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          v96 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:19];
          *(_DWORD *)buf = 136315650;
          uint64_t v160 = (uint64_t)"-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          __int16 v161 = 2112;
          v162 = v96;
          __int16 v163 = 2112;
          uint64_t v164 = (uint64_t)v6;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "(%s) Skipping %@ because config %@ has no home.", buf, 0x20u);
        }
      }

      unsigned int v14 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
      goto LABEL_146;
    case 20:
      if ((+[HFUtilities isAnIPhone] & 1) == 0)
      {
        v66 = HFLogForCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v67 = [(id)objc_opt_class() description];
          *(_DWORD *)buf = 138412546;
          uint64_t v160 = (uint64_t)v67;
          __int16 v161 = 2080;
          v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping HSProxCardSetupUIStepWalletKeyExpressMode because this device is not iPhone", buf, 0x16u);
        }
        goto LABEL_140;
      }
      v44 = [v6 home];

      if (!v44)
      {
        v64 = HFLogForCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v160 = 20;
          __int16 v161 = 2112;
          v162 = (const char *)v6;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Skipping step because config has no home. step: %lu config: %@", buf, 0x16u);
        }
LABEL_71:

        uint64_t v26 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
        goto LABEL_141;
      }
      if ((+[HFUtilities isUsingiCloud] & 1) == 0)
      {
        v66 = HFLogForCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v120 = [(id)objc_opt_class() description];
          *(_DWORD *)buf = 138412546;
          uint64_t v160 = (uint64_t)v120;
          __int16 v161 = 2080;
          v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping HSProxCardSetupUIStepWalletKeyExpressMode because not signed into iCloud", buf, 0x16u);
        }
        goto LABEL_140;
      }
      v45 = [v6 home];
      v46 = [v45 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];
      v147[0] = _NSConcreteStackBlock;
      v147[1] = 3221225472;
      v147[2] = sub_10000EC24;
      v147[3] = &unk_1000A9218;
      id v148 = v6;
      id v149 = v18;
      unsigned int v14 = [v46 flatMap:v147];

      goto LABEL_14;
    case 21:
      if ((+[HFUtilities isUsingiCloud] & 1) == 0 && !v18) {
        goto LABEL_57;
      }
      v68 = [v6 home];
      unsigned int v69 = [v68 hf_currentUserIsOwner];

      v70 = [v6 home];
      unsigned int v71 = [v70 hf_hasHomeHubSupportingAccessCodes];

      v72 = [v6 addedAccessory];
      unsigned int v73 = [v72 supportsAccessCodes];

      v74 = HFLogForCategory();
      int v75 = v73 & (v69 | v71);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        if (v75) {
          CFStringRef v76 = @"Not";
        }
        else {
          CFStringRef v76 = &stru_1000ABBA8;
        }
        v77 = [v6 addedAccessory];
        *(_DWORD *)buf = 138413570;
        uint64_t v160 = (uint64_t)self;
        __int16 v161 = 2080;
        v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
        __int16 v163 = 2112;
        uint64_t v164 = (uint64_t)v76;
        __int16 v165 = 1024;
        *(_DWORD *)v166 = [v77 supportsAccessCodes];
        *(_WORD *)&v166[4] = 1024;
        *(_DWORD *)&v166[6] = v69;
        LOWORD(v167) = 1024;
        *(_DWORD *)((char *)&v167 + 2) = v71;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "(%@:%s) %@ Skipping PIN Code prox card. supportsAccessCodes:%{BOOL}d  currentUserIsOwner:%{BOOL}d  hubSupported:%{BOOL}d", buf, 0x32u);
      }
      v78 = +[NSNumber numberWithInt:v75 ^ 1u];
      unsigned int v14 = +[NAFuture futureWithResult:v78];

      goto LABEL_14;
    case 22:
      v47 = [v6 addedAccessory];
      unsigned __int8 v48 = [v47 supportsAccessCodes];

      if ((v48 & 1) == 0)
      {
LABEL_57:
        uint64_t v26 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
        goto LABEL_141;
      }
      if ((+[HFUtilities isUsingiCloud] & 1) == 0)
      {
        v66 = HFLogForCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v160 = (uint64_t)self;
          __int16 v161 = 2080;
          v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping PIN code text field prox card because user isn't signed into iCloud.", buf, 0x16u);
        }
        goto LABEL_140;
      }
      v49 = [v6 home];
      v50 = +[HFHomeKitDispatcher sharedDispatcher];
      v51 = [v50 pinCodeManagerForHome:v49];

      objc_initWeak((id *)buf, self);
      v52 = [v51 hasValidConstraints];
      v143[0] = _NSConcreteStackBlock;
      v143[1] = 3221225472;
      v143[2] = sub_10000F388;
      v143[3] = &unk_1000A92E0;
      objc_copyWeak(&v146, (id *)buf);
      id v53 = v49;
      id v144 = v53;
      id v145 = v6;
      unsigned int v14 = [v52 flatMap:v143];

      objc_destroyWeak(&v146);
      objc_destroyWeak((id *)buf);

      goto LABEL_14;
    case 23:
      if ((+[HFUtilities isUsingiCloud] & 1) == 0)
      {
        v66 = HFLogForCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v79 = [(HSSetupStateMachine *)self description];
          *(_DWORD *)buf = 138412546;
          uint64_t v160 = objc_opt_class();
          __int16 v161 = 2080;
          v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping guest access PIN code prox card because user isn't signed into iCloud.", buf, 0x16u);
        }
LABEL_140:

        uint64_t v26 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
        goto LABEL_141;
      }
      v54 = [v6 addedAccessory];
      v55 = [v6 home];
      unsigned int v56 = [v55 hf_currentUserIsOwner];

      v57 = [v6 home];
      unsigned int v58 = [v57 hf_hasHomeHubSupportingAccessCodes];

      if [v54 supportsAccessCodes] && ((v56 | v58))
      {
        v59 = +[HFHomeKitDispatcher sharedDispatcher];
        v60 = [v6 home];
        v61 = [v59 pinCodeManagerForHome:v60];

        objc_initWeak((id *)buf, self);
        v62 = [v61 guestPinCodes];
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472;
        v141[2] = sub_10000F58C;
        v141[3] = &unk_1000A9308;
        objc_copyWeak(&v142, (id *)buf);
        v63 = [v62 flatMap:v141];
        v139[0] = _NSConcreteStackBlock;
        v139[1] = 3221225472;
        v139[2] = sub_10000F738;
        v139[3] = &unk_1000A9330;
        objc_copyWeak(&v140, (id *)buf);
        unsigned int v14 = [v63 recover:v139];
        objc_destroyWeak(&v140);

        objc_destroyWeak(&v142);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v92 = HFLogForCategory();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          v93 = [(HSSetupStateMachine *)self description];
          *(_DWORD *)buf = 138413570;
          uint64_t v160 = objc_opt_class();
          __int16 v161 = 2080;
          v162 = "-[HSSetupStateMachine shouldSkipStep:withConfiguration:]";
          __int16 v163 = 2112;
          uint64_t v164 = (uint64_t)v54;
          __int16 v165 = 1024;
          *(_DWORD *)v166 = [v54 supportsAccessCodes];
          *(_WORD *)&v166[4] = 1024;
          *(_DWORD *)&v166[6] = v56;
          LOWORD(v167) = 1024;
          *(_DWORD *)((char *)&v167 + 2) = v58;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "(%@:%s) Skipping guest access for %@. supportsAccessCodes: %{BOOL}d  currentUserIsOwner:%{BOOL}d  hubSupported:%{BOOL}d", buf, 0x32u);
        }
        unsigned int v14 = +[NAFuture futureWithResult:&__kCFBooleanTrue];
      }

      goto LABEL_14;
    default:
      if (a3 == 42)
      {
        if ([(HSSetupStateMachine *)self _sync_shouldSkipSiriVoiceTrainingStep:v6])
        {
LABEL_33:
          +[NAFuture futureWithResult:&__kCFBooleanTrue];
          goto LABEL_34;
        }
      }
      else
      {
        if (a3 != 41)
        {
          v12 = +[NSNumber numberWithBool:[(HSSetupStateMachine *)self _sync_shouldSkipStep:a3 withConfiguration:v6]];
          uint64_t v15 = +[NAFuture futureWithResult:v12];
          goto LABEL_12;
        }
        if ([(HSSetupStateMachine *)self _sync_shouldSkipSetupSiriStep:v6]) {
          goto LABEL_33;
        }
      }
      [(HSSetupStateMachine *)self _voiceProfileCheckFuture];
      uint64_t v26 = LABEL_34:;
LABEL_141:
      unsigned int v14 = (void *)v26;
LABEL_14:

      return v14;
  }
}

- (BOOL)_sync_shouldSkipStep:(int64_t)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  LOBYTE(v8) = 0;
  switch(a3)
  {
    case 1:
    case 4:
      BOOL v10 = [v6 setupDescription];
      BOOL v11 = [v10 setupAccessoryPayload];

      if (v11) {
        goto LABEL_77;
      }
      v12 = [v7 delegate];
      v13 = [v12 stateMachineConfigurationGetDiscoveredAccessory:v7];

      unsigned int v14 = [v7 delegate];
      uint64_t v15 = [v14 stateMachineConfigurationGetSetupCode:v7];

      LOBYTE(v8) = v13 && ![v13 requiresSetupCode] || [v15 length];
      goto LABEL_80;
    case 2:
    case 3:
      int64_t v16 = [v6 setupDescription];
      v17 = [v16 setupAccessoryPayload];

      if (v17) {
        goto LABEL_77;
      }
      unsigned int v8 = [v7 delegate];
      v13 = [v8 stateMachineConfigurationGetDiscoveredAccessory:v7];

      LOBYTE(v8) = v13 != 0;
      goto LABEL_81;
    case 5:
      v13 = [v6 delegate];
      unsigned __int8 v18 = [v13 stateMachineConfigurationShouldSkipDetectedStep:v7];
      goto LABEL_73;
    case 6:
    case 7:
      id v9 = [v6 home];
      goto LABEL_19;
    case 8:
      v13 = [v6 delegate];
      unsigned __int8 v18 = [v13 stateMachineConfigurationShouldSkipHomeHubUpgradeStep:v7];
      goto LABEL_73;
    case 9:
      v13 = [v6 delegate];
      unsigned __int8 v18 = [v13 stateMachineConfigurationShouldSkipHomeHubStep:v7];
      goto LABEL_73;
    case 10:
      id v9 = [v6 addedAccessory];
      goto LABEL_19;
    case 11:
      v19 = [v6 home];
      unsigned int v20 = [v19 hf_hasResidentDeviceCapableOfSupportingThreadBorderRouter];

      unsigned int v21 = [v7 addedAccessory];
      unsigned int v22 = [v21 requiresThreadRouter];

      unsigned int v8 = HFLogForCategory();
      BOOL v23 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (!v22 || v20)
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315650;
          v70 = "-[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:]";
          __int16 v71 = 1024;
          *(_DWORD *)v72 = v22;
          *(_WORD *)&v72[4] = 1024;
          *(_DWORD *)&v72[6] = v20;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Skipping HSProxCardSetupUIThreadRouterWarning - accessoryIsSED: [%d], hasThreadEnabledResident: [%d]", buf, 0x18u);
        }

LABEL_77:
        LOBYTE(v8) = 1;
      }
      else
      {
        if (v23)
        {
          *(_DWORD *)buf = 136315650;
          v70 = "-[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:]";
          __int16 v71 = 1024;
          *(_DWORD *)v72 = v22;
          *(_WORD *)&v72[4] = 1024;
          *(_DWORD *)&v72[6] = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Showing HSProxCardSetupUIThreadRouterWarning - accessoryIsSED: [%d], hasThreadEnabledResident: [%d]", buf, 0x18u);
        }

        LOBYTE(v8) = 0;
      }
      break;
    case 15:
      id v9 = [v6 roomName];
LABEL_19:
      LOBYTE(v8) = v9 != 0;

      break;
    case 24:
      unsigned int v24 = [v6 addedAccessory];
      v25 = [v24 hf_primaryService];
      uint64_t v26 = [v25 serviceType];
      v27 = +[HFAssociatedServiceTypeFactory associatedServiceTypesSetFor:v26];

      unsigned int v28 = [v7 addedAccessory];
      uint64_t v29 = +[HSPCNameServicesViewController applicableServicesForAccessory:v28];
      id v30 = [v29 count];

      if (v27) {
        BOOL v31 = (unint64_t)v30 > 1;
      }
      else {
        BOOL v31 = 1;
      }
      LOBYTE(v8) = v31;
      break;
    case 25:
      v32 = [v6 addedAccessory];
      unsigned int v33 = [v32 hf_isCamera];

      if (!v33 || ![v7 supportsRichConfiguration]) {
        goto LABEL_77;
      }
      v13 = [v7 home];
      unsigned __int8 v34 = [v13 hf_currentUserIsAdministrator];
      goto LABEL_70;
    case 26:
      unsigned int v35 = [v6 addedAccessory];
      unsigned int v36 = [v35 hf_isCamera];

      if (!v36) {
        goto LABEL_77;
      }
      unsigned int v37 = [v7 home];
      CFStringRef v38 = [v37 hf_allUsersIncludingCurrentUser];
      CFStringRef v39 = +[NSSet setWithArray:v38];

      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100010274;
      v67[3] = &unk_1000A9358;
      id v40 = v7;
      id v68 = v40;
      v13 = [v39 na_filter:v67];

      id v41 = [v13 count];
      unsigned int v8 = [v40 cameraProfile];
      unsigned __int8 v42 = [v8 hf_cameraIsNotSetToRecord];

      LOBYTE(v8) = 1;
      if ((unint64_t)v41 >= 2 && (v42 & 1) == 0)
      {
        v43 = [v40 home];
        LODWORD(v8) = [v43 hf_currentUserIsAdministrator] ^ 1;
      }
      v44 = [v13 na_map:&stru_1000A9398];
      v45 = HFLogForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = NSStringFromBOOL();
        v47 = NSStringFromBOOL();
        *(_DWORD *)buf = 136315906;
        v70 = "-[HSSetupStateMachine _sync_shouldSkipStep:withConfiguration:]";
        __int16 v71 = 2112;
        *(void *)v72 = v46;
        *(_WORD *)&v72[8] = 2112;
        unsigned int v73 = v44;
        __int16 v74 = 2112;
        int v75 = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "(%s) shouldSkip = %@ because users = %@, cameraIsRecording = %@", buf, 0x2Au);
      }
      goto LABEL_81;
    case 27:
      unsigned __int8 v48 = [v6 addedAccessory];
      unsigned int v49 = [v48 hf_isDoorbell];

      if (!v49) {
        goto LABEL_77;
      }
      v13 = [v7 cameraProfile];
      unsigned __int8 v18 = [v13 hf_cameraIsNotSetToRecord];
      goto LABEL_73;
    case 28:
      v50 = [v6 addedAccessory];
      unsigned int v51 = [v50 hf_isDoorbell];

      if (!v51
        || [(HSSetupStateMachine *)self _sync_shouldSkipStep:27 withConfiguration:v7])
      {
        goto LABEL_77;
      }
      unsigned int v8 = [v7 home];
      v52 = [v8 personManagerSettings];
      unsigned __int8 v53 = [v52 isFaceClassificationEnabled];

      LOBYTE(v8) = v53 ^ 1;
      break;
    case 29:
      v54 = [v6 addedAccessory];
      unsigned int v55 = [v54 hf_isDoorbell];

      if (!v55) {
        goto LABEL_77;
      }
      v13 = [v7 addedAccessory];
      uint64_t v15 = [v7 home];
      LOBYTE(v8) = +[HSPCChimeViewController shouldSkipForAccessory:v13 inHome:v15];
      goto LABEL_80;
    case 31:
      v13 = [v6 addedAccessory];
      uint64_t v15 = [v13 category];
      unsigned int v56 = [v15 categoryType];
      LODWORD(v8) = [v56 isEqualToString:HMAccessoryCategoryTypeShowerHead] ^ 1;

      goto LABEL_80;
    case 32:
      v13 = [v6 addedAccessory];
      if (objc_msgSend(v13, "hf_isSprinkler"))
      {
        uint64_t v15 = +[HSPCNameZonesViewController applicableServicesForAccessory:v13];
        LOBYTE(v8) = [v15 count] == 0;
LABEL_80:
      }
      else
      {
        LOBYTE(v8) = 1;
      }
      goto LABEL_81;
    case 33:
      v13 = [v6 addedAccessory];
      unsigned int v57 = [v13 hf_isCategorizedAsBridge];
      unsigned int v58 = +[HSPCNameServicesViewController applicableServicesForAccessory:v13];
      id v59 = [v58 count];

      unsigned __int8 v60 = [v13 hf_isProgrammableSwitch];
      BOOL v61 = (unint64_t)v59 < 2;
      if (v57) {
        BOOL v61 = v59 == 0;
      }
      LOBYTE(v8) = v61 | v60;
      goto LABEL_81;
    case 35:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _shouldSkipUseSiriStep:v6];
      goto LABEL_68;
    case 36:
      v63 = [v6 delegate];
      id v64 = [v63 stateMachineConfigurationGetLaunchReason:v7];

      if (v64 != (id)3) {
        goto LABEL_77;
      }
      v13 = [v7 delegate];
      unsigned __int8 v34 = [v13 stateMachineConfigurationIsLaunchedToSetupMultipleAccessories:v7];
      goto LABEL_70;
    case 37:
      if (![(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v6]) {
        goto LABEL_77;
      }
      unsigned __int8 v65 = [v7 shouldShowSiriRecognitionLanguageSetup];
      goto LABEL_56;
    case 38:
      if (![(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v6]) {
        goto LABEL_77;
      }
      unsigned __int8 v65 = [v7 shouldShowVoiceSelectionSetup];
LABEL_56:
      LOBYTE(v8) = v65 ^ 1;
      break;
    case 39:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _shouldSkipSiriUpdateRequiredStep:v6];
      goto LABEL_68;
    case 40:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _shouldSkipSiriVoiceRecognitionStep:v6];
      goto LABEL_68;
    case 41:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _sync_shouldSkipSetupSiriStep:v6];
      goto LABEL_68;
    case 42:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _sync_shouldSkipSiriVoiceTrainingStep:v6];
      goto LABEL_68;
    case 43:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _sync_shouldSkipPersonalRequestsStep:v6];
      goto LABEL_68;
    case 44:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _sync_shouldSkipSiriForEveryoneStep:v6];
      goto LABEL_68;
    case 45:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _sync_shouldSkipUseAirPlayStep:v6];
      goto LABEL_68;
    case 46:
      v13 = [v6 delegate];
      unsigned __int8 v18 = [v13 stateMachineConfigurationShouldSkipBridgeAddedStep:v7];
      goto LABEL_73;
    case 47:
      v13 = [v6 delegate];
      unsigned __int8 v34 = [v13 stateMachineConfigurationShouldSetupBridgedAccessories:v7];
      goto LABEL_70;
    case 48:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _shouldSkipSafetyAndSecurityStep:v6];
      goto LABEL_68;
    case 49:
      unsigned __int8 v62 = [(HSSetupStateMachine *)self _shouldSkipRestrictedGuestAccessStep:v6];
LABEL_68:
      LOBYTE(v8) = v62;
      break;
    case 50:
      v13 = [v6 delegate];
      unsigned __int8 v34 = [v13 stateMachineConfigurationShouldSetupRouters:v7];
LABEL_70:
      LOBYTE(v8) = v34 ^ 1;
      goto LABEL_81;
    case 51:
      v13 = [v6 delegate];
      unsigned __int8 v18 = [v13 stateMachineConfigurationShouldSkipAccessoryUpdateStep:v7];
      goto LABEL_73;
    case 52:
      v13 = [v6 delegate];
      unsigned __int8 v18 = [v13 stateMachineConfigurationShouldSkipDoneStep:v7];
LABEL_73:
      LOBYTE(v8) = v18;
LABEL_81:

      break;
    default:
      break;
  }

  return (char)v8;
}

- (BOOL)stepRequiresDismissalConfirmation:(int64_t)a3 withCoordinator:(id)a4 configuration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if ((unint64_t)a3 > 0x35) {
    goto LABEL_8;
  }
  if (((1 << a3) & 0x2000000000021ELL) == 0)
  {
    if (((1 << a3) & 0x21) != 0)
    {
      BOOL v11 = [v8 addedAccessory];
      BOOL v10 = v11 != 0;

      goto LABEL_9;
    }
    if (a3 == 52)
    {
      v12 = [v7 activeTuple];
      v13 = [v12 accessory];
      unsigned int v14 = [v7 allAccessories];
      uint64_t v15 = [v14 lastObject];
      BOOL v10 = v13 != v15;

      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)stepRequiresIdentifyButton:(int64_t)a3 withCoordinator:(id)a4 configuration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if ((unint64_t)a3 > 0x18) {
    goto LABEL_6;
  }
  if (((1 << a3) & 0x1016000) == 0)
  {
    if (a3 == 5)
    {
      BOOL v11 = [v8 addedAccessory];
      BOOL v10 = v11 != 0;

      goto LABEL_7;
    }
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (BOOL)_shouldSkipSafetyAndSecurityStep:(id)a3
{
  id v5 = a3;
  id v6 = [v5 delegate];
  id v7 = [v6 stateMachineConfigurationGetLaunchReason:v5];

  if (v7 == (id)2
    && ([v5 addedAccessory],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = objc_msgSend(v8, "hf_isAudioAnalysisSupportedDevice"),
        v8,
        v9))
  {
    BOOL v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = NSStringFromSelector(a2);
      int v14 = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing Safety and Security card based on launch reason AND added accessory supports Audio Analysis", (uint8_t *)&v14, 0x16u);
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (BOOL)_shouldSkipRestrictedGuestAccessStep:(id)a3
{
  id v5 = a3;
  id v6 = [v5 addedAccessory];
  if ((objc_msgSend(v6, "hf_isRestrictedGuestAllowedAccessory") & 1) == 0)
  {

    goto LABEL_7;
  }
  id v7 = [v5 home];
  unsigned int v8 = [v7 hf_hasAtLeastOneRestrictedGuest];

  if (!v8)
  {
LABEL_7:
    BOOL v11 = 1;
    goto LABEL_8;
  }
  unsigned int v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = NSStringFromSelector(a2);
    int v13 = 138412546;
    int v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Showing Restricted Guest access card based on the added accessory being a supported accessory AND at least one RG already existing in the home.", (uint8_t *)&v13, 0x16u);
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)_shouldSkipUseSiriStep:(id)a3
{
  id v5 = a3;
  id v6 = [v5 addedAccessory];
  id v7 = [v6 hf_siriEndpointProfile];

  if (v7)
  {
    unsigned int v8 = [v5 addedAccessory];
    unsigned int v9 = [v8 home];
    unsigned int v10 = [v9 hf_hasHomePods] ^ 1;
  }
  else
  {
    BOOL v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = NSStringFromSelector(a2);
      int v13 = [v5 addedAccessory];
      int v15 = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2112;
      unsigned __int8 v18 = v12;
      __int16 v19 = 2112;
      unsigned int v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri endpoint profile does not exist. Added accessory is %@", (uint8_t *)&v15, 0x20u);
    }
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)_shouldSkipSiriUpdateRequiredStep:(id)a3
{
  id v4 = a3;
  id v5 = [v4 addedAccessory];
  id v6 = [v5 hf_siriEndpointProfile];

  if (v6
    && ([v4 addedAccessory],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 home],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = objc_msgSend(v8, "hf_hasHomePods"),
        v8,
        v7,
        v9)
    && ![(HSSetupStateMachine *)self _shouldSkipUseSiriFlow:v4])
  {
    unsigned __int8 v10 = [v6 supportsOnboarding];
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)_shouldSkipSiriVoiceRecognitionStep:(id)a3
{
  id v4 = a3;
  if ([(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v4]
    && ![(HSSetupStateMachine *)self _shouldSkipUseSiriFlow:v4]
    && [(HSSetupStateMachine *)self _deviceIsOnAMultiUserLanguage])
  {
    BOOL v5 = [(HSSetupStateMachine *)self _isVoiceRecognitionEnabled:v4];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipSetupSiriStep:(id)a3
{
  id v4 = a3;
  if ([(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v4]
    && ![(HSSetupStateMachine *)self _shouldSkipUseSiriFlow:v4]
    && [(HSSetupStateMachine *)self _deviceIsOnAMultiUserLanguage])
  {
    unsigned __int8 v5 = [v4 shouldSkipVoiceProfileSetup];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipSiriVoiceTrainingStep:(id)a3
{
  id v4 = a3;
  if ([(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v4]
    && ![(HSSetupStateMachine *)self _shouldSkipUseSiriFlow:v4]
    && [(HSSetupStateMachine *)self _deviceIsOnAMultiUserLanguage])
  {
    unsigned __int8 v5 = [v4 shouldSkipVoiceProfileSetup];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipPersonalRequestsStep:(id)a3
{
  id v4 = a3;
  if ([(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v4]
    && ![(HSSetupStateMachine *)self _shouldSkipUseSiriFlow:v4]
    && [(HSSetupStateMachine *)self _deviceIsOnAMultiUserLanguage])
  {
    unsigned __int8 v5 = [v4 shouldSkipVoiceProfileSetup];
  }
  else
  {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)_sync_shouldSkipSiriForEveryoneStep:(id)a3
{
  id v4 = a3;
  if ([(HSSetupStateMachine *)self _shouldShowSiriEndpointStep:v4]
    && ![(HSSetupStateMachine *)self _shouldSkipUseSiriFlow:v4]
    && [(HSSetupStateMachine *)self _deviceIsOnAMultiUserLanguage])
  {
    unsigned __int8 v5 = [v4 home];
    unsigned __int8 v6 = [v5 isMultiUserEnabled];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)_sync_shouldSkipUseAirPlayStep:(id)a3
{
  return 1;
}

- (BOOL)_shouldShowSiriEndpointStep:(id)a3
{
  id v3 = a3;
  id v4 = [v3 addedAccessory];
  unsigned __int8 v5 = [v4 hf_siriEndpointProfile];

  if (v5 && [v5 supportsOnboarding])
  {
    unsigned __int8 v6 = [v3 addedAccessory];
    id v7 = [v6 home];
    unsigned __int8 v8 = [v7 hf_hasHomePods];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_isVoiceRecognitionEnabled:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc((Class)HFUserItem);
  id v7 = [v5 home];
  unsigned __int8 v8 = [v5 home];

  unsigned int v9 = [v8 currentUser];
  id v10 = [v6 initWithHome:v7 user:v9 nameStyle:0];

  unsigned int v11 = [v10 isIdentifyVoiceEnabled];
  BOOL v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = NSStringFromSelector(a2);
    int v15 = 138412802;
    __int16 v16 = self;
    __int16 v17 = 2112;
    unsigned __int8 v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v15, 0x1Cu);
  }
  return v11;
}

- (BOOL)_shouldSkipUseSiriFlow:(id)a3
{
  id v3 = a3;
  id v4 = [v3 onboardingSelections];
  if (v4)
  {
    id v5 = [v3 onboardingSelections];
    unsigned int v6 = [v5 allowHeySiri] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_deviceIsOnAMultiUserLanguage
{
  id v3 = +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages];
  if (v3)
  {
    unsigned __int8 v4 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:v3 shouldFallbackToBestSupportedLanguage:1];
  }
  else
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100065F18(a2, v5);
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_voiceProfileCheckFuture
{
  unsigned __int8 v4 = +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010F34;
  v8[3] = &unk_1000A9218;
  v8[4] = self;
  v8[5] = a2;
  id v5 = [v4 flatMap:v8];
  unsigned int v6 = [v5 recover:&stru_1000A93B8];

  return v6;
}

@end
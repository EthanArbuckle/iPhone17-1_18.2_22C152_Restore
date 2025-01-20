@interface AKLivenessRequestProvider
- (AKFollowUpProvider)followUpProvider;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (NSString)event;
- (NSString)pushToken;
- (id)authKitBody;
- (id)requestURLOverride;
- (unint64_t)livenessReason;
- (void)_updateTelemtryOptInForAccount:(id)a3 withWalrusStatus:(unint64_t)a4;
- (void)addMDMInformationIfNecessaryToRequest:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFollowUpProvider:(id)a3;
- (void)setLivenessReason:(unint64_t)a3;
- (void)setPushToken:(id)a3;
@end

@implementation AKLivenessRequestProvider

- (id)requestURLOverride
{
  v3 = [(AKURLRequestProviderImpl *)self context];
  v4 = [v3 altDSID];
  v5 = +[AKURLBag bagForAltDSID:v4];

  v6 = [(AKURLRequestProviderImpl *)self urlBagKey];
  v7 = [v5 urlAtKey:v6];

  return v7;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKLivenessRequestProvider;
  BOOL v7 = [(AKGrandSlamRequestProvider *)&v9 signRequest:v6 error:a4];
  if (v7) {
    [(AKLivenessRequestProvider *)self addMDMInformationIfNecessaryToRequest:v6];
  }

  return v7;
}

- (void)addMDMInformationIfNecessaryToRequest:(id)a3
{
  id v4 = a3;
  if (+[AKFeatureManager isEnforceMDMPolicyEnabled])
  {
    v5 = [(AKLivenessRequestProvider *)self event];
    if ([v5 isEqualToString:AKPostDataEventLiveness])
    {
    }
    else
    {
      id v6 = [(AKLivenessRequestProvider *)self event];
      unsigned int v7 = [v6 isEqualToString:AKPostDataEventUpdateDeviceState];

      if (!v7) {
        goto LABEL_12;
      }
    }
    v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "E+E: Checking if we need to gather MDM information", v20, 2u);
    }

    objc_super v9 = [(AKURLRequestProviderImpl *)self accountManager];
    v10 = [(AKURLRequestProviderImpl *)self context];
    v11 = [v10 altDSID];
    v12 = [v9 authKitAccountWithAltDSID:v11 error:0];

    v13 = objc_alloc_init(AKMDMInformationProvider);
    v14 = [(AKURLRequestProviderImpl *)self accountManager];
    v15 = [(AKMDMInformationProvider *)v13 fetchMDMInformationIfNecessaryForAccount:v12 accountManager:v14];

    v16 = [v15 deviceManagedState];

    if (v16)
    {
      v17 = [v15 deviceManagedState];
      objc_msgSend(v4, "ak_addHeaderForDeviceManagementState:", v17);
    }
    v18 = [v15 organizationToken];

    if (v18)
    {
      v19 = [v15 organizationToken];
      objc_msgSend(v4, "ak_addHeaderForMDMOrganizationToken:", v19);
    }
  }
LABEL_12:
}

- (id)authKitBody
{
  v3 = +[AKDevice currentDevice];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:&off_10023B1A0 forKeyedSubscript:@"ut"];
  v5 = [(AKLivenessRequestProvider *)self event];
  [v4 setObject:v5 forKeyedSubscript:@"event"];

  uint64_t v6 = [v3 serialNumber];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"sn"];
  }
  uint64_t v7 = [v3 internationalMobileEquipmentIdentity];
  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"imei"];
  }
  uint64_t v8 = [v3 internationalMobileEquipmentIdentity2];
  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"imei2"];
  }
  v177 = (void *)v8;
  v165 = (void *)v6;
  uint64_t v9 = [v3 userChosenName];
  if (v9) {
    [v4 setObject:v9 forKeyedSubscript:@"dn"];
  }
  v176 = (void *)v9;
  v178 = (void *)v7;
  v10 = [(AKLivenessRequestProvider *)self pushToken];

  if (v10)
  {
    v11 = [(AKLivenessRequestProvider *)self pushToken];
    [v4 setObject:v11 forKeyedSubscript:AKRequestBodyPushTokenKey];
  }
  else
  {
    v12 = [(AKLivenessRequestProvider *)self event];
    unsigned int v13 = [v12 isEqualToString:AKPostDataEventLiveness];

    if (v13)
    {
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100193A24();
      }

      [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"noptkn"];
    }
  }
  uint64_t v15 = [v3 mobileEquipmentIdentifier];
  if (v15) {
    [v4 setObject:v15 forKeyedSubscript:@"meid"];
  }
  uint64_t v16 = [v3 integratedCircuitCardIdentifier];
  if (v16) {
    [v4 setObject:v16 forKeyedSubscript:@"iccid"];
  }
  uint64_t v17 = [v3 color];
  if (v17) {
    [v4 setObject:v17 forKeyedSubscript:@"dc"];
  }
  v162 = (void *)v17;
  uint64_t v18 = [v3 enclosureColor];
  if (v18) {
    [v4 setObject:v18 forKeyedSubscript:@"dec"];
  }
  v161 = (void *)v18;
  v19 = [v3 coverGlassColor];
  v20 = v19;
  if (v19)
  {
    v21 = [v19 stringValue];
    [v4 setObject:v21 forKeyedSubscript:@"clcg"];
  }
  v22 = [v3 housingColor];
  v174 = v22;
  if (v22)
  {
    v23 = [v22 stringValue];
    [v4 setObject:v23 forKeyedSubscript:@"clhs"];
  }
  v24 = [v3 backingColor];
  v173 = v24;
  if (v24)
  {
    v25 = [v24 stringValue];
    [v4 setObject:v25 forKeyedSubscript:@"clbg"];
  }
  uint64_t v26 = [v3 modelNumber];
  if (v26) {
    [v4 setObject:v26 forKeyedSubscript:@"prtn"];
  }
  v172 = (void *)v26;
  uint64_t v27 = [v3 phoneNumber];
  if (v27) {
    [v4 setObject:v27 forKeyedSubscript:@"pn"];
  }
  v163 = v3;
  v164 = (void *)v16;
  v171 = (void *)v27;
  v175 = (void *)v15;
  v28 = +[NSLocale currentLocale];
  uint64_t v29 = [v28 localeIdentifier];

  if (v29) {
    [v4 setObject:v29 forKeyedSubscript:@"loc"];
  }
  v170 = (void *)v29;
  v30 = +[AKAccountManager sharedInstance];
  v31 = +[AKAccountManager sharedInstance];
  v32 = [v31 primaryAuthKitAccount];
  v33 = [v30 passkeysInKeychainCountForAccount:v32];

  if (v33)
  {
    v34 = [v33 stringValue];
    [v4 setObject:v34 forKeyedSubscript:@"pkc"];
  }
  id v35 = objc_alloc_init((Class)AKBiometricRatchetController);
  v168 = v35;
  v169 = v33;
  if ([v35 isDTOEnabled])
  {
    v36 = [v35 currentRachetState];
    v37 = v36;
    if (v36)
    {
      v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v36 rawState]);
      v39 = [v38 stringValue];
      [v4 setObject:v39 forKeyedSubscript:@"biometricRatchetEnablementState"];
    }
    else
    {
      v40 = _AKLogSystem();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1001939F0();
      }

      [v4 setObject:@"9" forKeyedSubscript:@"biometricRatchetEnablementState"];
    }
  }
  else
  {
    [v4 setObject:@"-1" forKeyedSubscript:@"biometricRatchetEnablementState"];
  }
  id v167 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  unsigned int v41 = [v167 BOOLForKey:12];
  v42 = &AKTrueValue;
  if (!v41) {
    v42 = &AKFalseValue;
  }
  [v4 setObject:*v42 forKeyedSubscript:@"biometricLivenessInLast24Hours"];
  v43 = +[AKDevice currentDevice];
  id v44 = [v43 isProtectedWithPasscode];

  v45 = +[NSNumber numberWithBool:v44];
  [v4 setObject:v45 forKeyedSubscript:AKPasscodeIndicatorKey];

  v46 = +[AKCarrierBundleUtilities sharedInstance];
  id v184 = 0;
  uint64_t v47 = [v46 phoneBundleInfoWithAdditionalInfo:0 error:&v184];
  id v179 = v184;

  v166 = (void *)v47;
  if (v47)
  {
    [v4 setObject:v47 forKeyedSubscript:@"phones"];
  }
  else
  {
    v48 = _AKLogSystem();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100193988();
    }
  }
  v49 = +[AKAccountManager sharedInstance];
  v50 = [(AKURLRequestProviderImpl *)self context];
  v51 = [v50 altDSID];
  uint64_t v52 = [v49 authKitAccountWithAltDSID:v51 error:0];

  v53 = [(AKLivenessRequestProvider *)self event];
  LODWORD(v50) = [v53 isEqualToString:AKPostDataEventLiveness];

  v180 = v20;
  v181 = (void *)v52;
  if (v50)
  {
    v54 = +[NSNumber numberWithUnsignedInteger:[(AKLivenessRequestProvider *)self livenessReason]];
    [v4 setObject:v54 forKeyedSubscript:@"reason"];

    v55 = [(AKLivenessRequestProvider *)self followUpProvider];
    id v183 = 0;
    v56 = [v55 pendingFollowUpItems:&v183];
    id v57 = v183;
    uint64_t v58 = +[AKFollowUpServerPayloadFormatter pendingAuthKitFollowUpPayload:v56];

    uint64_t v159 = v58;
    if (v57)
    {
      v59 = _AKLogSystem();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        sub_100193920();
      }
    }
    else
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, AKRequestBodyFollowupKey, v58);
    }
    v60 = +[AKAccountManager sharedInstance];
    v61 = [v60 altDSIDforPrimaryiCloudAccount];

    if (v61)
    {
      v62 = [(AKURLRequestProviderImpl *)self context];
      v63 = [v62 altDSID];
      unsigned int v64 = [v61 isEqualToString:v63];

      if (v64)
      {
        v65 = +[AKCDPFactory walrusStatusLiveValue];
        v66 = [v65 captureCurrentValue];

        id v67 = [v66 unsignedIntegerValue];
        if (v67)
        {
          id v68 = v67;
          v69 = +[NSNumber numberWithBool:v67 == (id)1];
          [v4 setObject:v69 forKeyedSubscript:@"stingrayDisabledIndicator"];

          [(AKLivenessRequestProvider *)self _updateTelemtryOptInForAccount:v52 withWalrusStatus:v68];
        }
        v70 = +[AKCDPFactory webAccessStatusLiveValue];
        v71 = [v70 captureCurrentValue];

        id v72 = [v71 unsignedIntegerValue];
        if (v72)
        {
          v73 = +[NSNumber numberWithBool:v72 == (id)1];
          [v4 setObject:v73 forKeyedSubscript:@"denyICloudWebAccess"];
        }
      }
    }
    v74 = +[AKAccountManager sharedInstance];
    v75 = [v74 _matchingServiceAccountForAuthKitAccount:v52 service:2];

    if (v75)
    {
      v76 = [v75 objectForKeyedSubscript:@"isRegulatoryAccount"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v76 BOOLValue])
      {
        v77 = _AKLogSystem();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
          sub_1001938E0();
        }

        v78 = +[AKRegulatoryEligibilityHandler regulatoryEligibilities];
        if (v78) {
          [v4 setObject:v78 forKeyedSubscript:@"3prsd"];
        }
      }
    }
    v79 = +[AKAccountManager sharedInstance];
    v80 = [(AKURLRequestProviderImpl *)self context];
    v81 = [v80 altDSID];
    v82 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v79 signInPartitionForLivenessWithAltDSID:v81]);

    [v4 setObject:v82 forKeyedSubscript:AKSignInPartitionLivenessBodyKey];
    v83 = +[AKAccountManager sharedInstance];
    id v84 = [v83 securityLevelForAccount:v52];

    v85 = +[NSNumber numberWithUnsignedInteger:v84];
    [v4 setObject:v85 forKeyedSubscript:@"usrt"];

    v20 = v180;
  }
  if (v52)
  {
    v86 = +[AKAccountManager sharedInstance];
    v87 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v86 repairStateForAccount:v52]);
    [v4 setObject:v87 forKeyedSubscript:@"rep"];

    v88 = +[AKAccountManager sharedInstance];
    v89 = [v88 DSIDForAccount:v52];

    objc_opt_class();
    id v90 = v89;
    if (objc_opt_isKindOfClass())
    {
      id v91 = v90;

      if (v91)
      {
        id v92 = v91;
        id v93 = v92;
LABEL_84:

        v95 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[AKCDPFactory cdpAccountIsICDPEnabledForDSID:v93]);
        [v4 setObject:v95 forKeyedSubscript:@"cdpStatus"];

        v96 = [(AKURLRequestProviderImpl *)self context];
        v97 = [v96 altDSID];
        v98 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[AKCDPFactory cdpAccountIsOTEnabledForAltDSID:v97]);
        [v4 setObject:v98 forKeyedSubscript:@"otStatus"];

        v20 = v180;
        goto LABEL_85;
      }
    }
    else
    {
    }
    objc_opt_class();
    id v94 = v90;
    if (objc_opt_isKindOfClass()) {
      id v92 = v94;
    }
    else {
      id v92 = 0;
    }

    id v93 = [v92 stringValue];

    goto LABEL_84;
  }
LABEL_85:
  v99 = [(AKLivenessRequestProvider *)self event];
  unsigned __int8 v100 = [v99 isEqual:AKPostDataEventFinalSignOut];

  if ((v100 & 1) == 0)
  {
    v101 = +[AKAccountManager sharedInstance];
    v102 = [v101 activeServiceNamesForAccount:v52];

    id v103 = [v102 count];
    v104 = _AKLogSystem();
    v105 = v104;
    if (v103)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v186 = v102;
        _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "Posting active services as: %@", buf, 0xCu);
      }

      [v4 setObject:v102 forKeyedSubscript:@"services"];
    }
    else
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        sub_100193878();
      }
    }
  }
  v106 = +[AKDevice currentDevice];
  v107 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v106 isInCircle]);
  [v4 setObject:v107 forKeyedSubscript:@"circleStatus"];

  v108 = +[AKAccountManager sharedInstance];
  v109 = [v108 primaryiCloudAccount];

  if (v109)
  {
    uint64_t v110 = [v109 accountPropertyForKey:@"custodianAssigneeStatus"];
    v111 = (void *)v110;
    if (v110) {
      v112 = (_UNKNOWN **)v110;
    }
    else {
      v112 = &off_10023B1B8;
    }
    [v4 setObject:v112 forKeyedSubscript:@"isRecoveryContactAssignee"];
    uint64_t v113 = [v109 accountPropertyForKey:@"beneficiaryAssigneeStatus"];
    v114 = (void *)v113;
    if (v113) {
      v115 = (_UNKNOWN **)v113;
    }
    else {
      v115 = &off_10023B1B8;
    }
    [v4 setObject:v115 forKeyedSubscript:@"isLegacyContactAssignee"];
    v116 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v109 isEnabledForDataclass:ACAccountDataclassMail]);
    [v4 setObject:v116 forKeyedSubscript:@"icloudMailEnabled"];
  }
  if ((id)[(AKLivenessRequestProvider *)self livenessReason] != (id)1)
  {
    v127 = KCSharingGroupFetchRequest_ptr;
    goto LABEL_124;
  }
  v117 = +[AKAccountManager sharedInstance];
  v118 = [v117 nextLivenessNonce:v52];

  if (v118)
  {
    v119 = +[AKSecureKey osVersionAttestationRefKey];
    if (v119)
    {
      v120 = v119;
      v121 = [v118 dataUsingEncoding:4];
      id v182 = 0;
      v122 = +[AKSecurityHelper signData:v121 withKey:v120 error:&v182];
      v123 = v182;
      v124 = v123;
      if (v122)
      {
        v125 = [v122 base64EncodedStringWithOptions:0];
        [v4 setObject:v125 forKeyedSubscript:@"livenessNonceSig"];

        [v4 setObject:v118 forKeyedSubscript:@"livenessNonce"];
        v126 = 0;
      }
      else
      {
        v126 = v123;
      }
      CFRelease(v120);
    }
    else
    {
      v126 = +[NSError ak_generalErrorWithCode:-10009 errorDomain:AKAttestationErrorDomain underlyingError:0];
      v124 = _AKLogSystem();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
        sub_100193844();
      }
    }

    if (!v126) {
      goto LABEL_116;
    }
  }
  else
  {
    v126 = +[NSError ak_generalErrorWithCode:-10008 errorDomain:AKAttestationErrorDomain underlyingError:0];
    if (!v126) {
      goto LABEL_116;
    }
  }
  v128 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:@"com.apple.authkit.sendLivenessNonce" error:v126];
  v129 = +[AKAnalyticsReporterRTC rtcAnalyticsReporter];
  [v129 sendEvent:v128];

  v130 = [v126 errorDescriptionIncludingUnderlyingErrorsWithMaxDepth:3];
  [v4 setObject:v130 forKeyedSubscript:@"livenessNonceError"];

LABEL_116:
  if (v52)
  {
    v131 = +[AKAccountManager sharedInstance];
    id v132 = [v131 edpStateValueForAccount:v52];

    if (v132 == (id)1)
    {
      v133 = [(AKURLRequestProviderImpl *)self context];
      v134 = [v133 altDSID];
      v135 = +[AKCDPFactory contextForAltDSID:v134];

      v136 = +[AKCDPFactory stateControllerWithContext:v135];
      v137 = [v136 createEDPLivenessDictionaryWithContext:v135 error:0];
      v138 = objc_msgSend(v4, "aaf_dictionaryByAddingEntriesFromDictionary:", v137);
      id v139 = [v138 mutableCopy];

      id v4 = v139;
    }
    else
    {
      v135 = _AKLogSystem();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "EDP not eligible, couldn't fetch EDP health", buf, 2u);
      }
    }
  }
  else
  {
    v135 = _AKLogSystem();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      v140 = [(AKURLRequestProviderImpl *)self context];
      v141 = [v140 altDSID];
      *(_DWORD *)buf = 138412290;
      v186 = v141;
      _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Couldn't find AuthKit account for altDSID: %@", buf, 0xCu);
    }
  }
  v127 = KCSharingGroupFetchRequest_ptr;

  v20 = v180;
LABEL_124:
  v142 = [(AKURLRequestProviderImpl *)self context];
  v143 = [v142 altDSID];

  if (v143)
  {
    v144 = v127;
    v145 = +[AKAccountManager sharedInstance];
    v146 = [(AKURLRequestProviderImpl *)self context];
    v147 = [v146 altDSID];
    v148 = [v145 iCloudAccountForAltDSID:v147];

    if (v148)
    {
      objc_opt_class();
      id v149 = [v148 accountPropertyForKey:@"escrowRecordHealthCheckFailureCount"];
      if (objc_opt_isKindOfClass()) {
        v150 = v149;
      }
      else {
        v150 = 0;
      }
      v154 = v161;
      v153 = v162;

      if (v150)
      {
        v156 = objc_msgSend(v144[36], "numberWithBool:", (int)-[NSObject intValue](v150, "intValue") < 1);
        [v4 setObject:v156 forKeyedSubscript:@"icscStatus"];
      }
      v155 = v163;
      v152 = v164;
    }
    else
    {
      v150 = _AKLogSystem();
      v155 = v163;
      v152 = v164;
      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
        sub_100193798(self, v150);
      }
      v154 = v161;
      v153 = v162;
    }

    v151 = v165;
  }
  else
  {
    v148 = _AKLogSystem();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR)) {
      sub_100193764();
    }
    v152 = v164;
    v151 = v165;
    v154 = v161;
    v153 = v162;
    v155 = v163;
  }

  id v157 = [v4 copy];

  return v157;
}

- (void)_updateTelemtryOptInForAccount:(id)a3 withWalrusStatus:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[AKAccountManager sharedInstance];
  unsigned int v7 = [v6 accountAccessTelemetryOptInForAccount:v5];

  uint64_t v8 = +[AKAccountManager sharedInstance];
  uint64_t v9 = [v8 accountAccessTelemetryOptInDateForAccount:v5];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Telemetry opt-in time was not set, updating now in response to liveness...", buf, 2u);
    }

    uint64_t v17 = +[AKAccountManager sharedInstance];
    [v17 updateAccountAccessTelemetryOptInTimestampForAccount:v5 withOptIn:1];

    uint64_t v18 = +[AKAccountManager sharedInstance];
    id v29 = 0;
    [v18 saveAccount:v5 error:&v29];
    v19 = v29;

    if (!v19) {
      goto LABEL_30;
    }
    v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100193A58();
    }
    goto LABEL_29;
  }
  v11 = +[AKDevice currentDevice];
  if (([v11 isInternalBuild] & 1) == 0)
  {

LABEL_19:
    v21 = +[NSDate date];
    [v21 timeIntervalSinceDate:v9];
    double v23 = v22;

    v24 = _AKLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = +[NSNumber numberWithDouble:v23];
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Opt-in was last set %@ seconds ago", buf, 0xCu);
    }
    if (a4 == 2) {
      char v26 = v7 ^ 1;
    }
    else {
      char v26 = 1;
    }
    if ((v26 & 1) != 0 || v23 < 172800.0)
    {
      if (v23 >= 172800.0) {
        goto LABEL_31;
      }
      v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "It has NOT been more than 48 hours since the last time telemetry opt-in was set.", buf, 2u);
      }
      goto LABEL_30;
    }
    goto LABEL_26;
  }
  v12 = +[AKConfiguration sharedConfiguration];
  id v13 = [v12 telemetryOptInGracePeriodOverride];

  if (v13 != (id)1) {
    goto LABEL_19;
  }
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Telemetry opt-in grace period override is set, forcing update...", buf, 2u);
  }

  char v15 = v7 ^ 1;
  if (a4 != 2) {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
LABEL_26:
    uint64_t v27 = +[AKAccountManager sharedInstance];
    id v28 = 0;
    [v27 setAccountAccessTelemetryOptIn:0 forAccount:v5 error:&v28];
    v19 = v28;

    if (!v19)
    {
LABEL_30:

      goto LABEL_31;
    }
    v20 = _AKLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100193AC0();
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (unint64_t)livenessReason
{
  return self->_livenessReason;
}

- (void)setLivenessReason:(unint64_t)a3
{
  self->_livenessReason = a3;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (AKFollowUpProvider)followUpProvider
{
  return self->_followUpProvider;
}

- (void)setFollowUpProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpProvider, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end
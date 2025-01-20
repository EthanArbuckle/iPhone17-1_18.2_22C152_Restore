@interface IDSClientDataGenerator
+ (BOOL)_isKTAsyncEnrollmentDisabledViaServerBag;
+ (BOOL)_isKTAsyncEnrollmentDisabledViaUserDefaults;
+ (BOOL)_shouldAddECKeysForServiceType:(id)a3;
+ (id)_createClientDatasForServiceTypes:(id)a3 withAppleIDRegistrationsForServiceTypes:(id)a4 ktRegDataByServiceType:(id)a5 publicIdentityData:(id)a6 publicIdentityError:(id)a7 keyStore:(id)a8 isPresenceCapable:(BOOL)a9 isStewieCapable:(BOOL)a10;
+ (id)clientDatasForRegistrations:(id)a3 keyStore:(id)a4 keyTransparencyVerifier:(id)a5;
+ (id)serviceTypesFromRegistrations:(id)a3;
+ (id)serviceTypesFromRegistrations:(id)a3 withRegistrationType:(int)a4;
+ (void)_fetchKTDataSignatureForServiceTypes:(id)a3 publicIdentityData:(id)a4 keyStore:(id)a5 withCompletion:(id)a6;
+ (void)_fetchPresenceCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4;
+ (void)_fetchStewieCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSClientDataGenerator

+ (id)serviceTypesFromRegistrations:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "serviceType", (void)v13);
        [v4 setObject:v10 forKey:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)serviceTypesFromRegistrations:(id)a3 withRegistrationType:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "registrationType", (void)v15) == a4)
        {
          long long v13 = [v12 serviceType];
          [v6 setObject:v12 forKey:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)clientDatasForRegistrations:(id)a3 keyStore:(id)a4 keyTransparencyVerifier:(id)a5
{
  id v124 = a3;
  id v127 = a4;
  id v123 = a5;
  id v126 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  v144[0] = 0;
  v144[1] = v144;
  v144[2] = 0x3032000000;
  v144[3] = sub_1000FD498;
  v144[4] = sub_1000FD4A8;
  id v145 = (id)0xAAAAAAAAAAAAAAAALL;
  id v145 = objc_alloc_init((Class)NSMutableDictionary);
  v142[0] = 0;
  v142[1] = v142;
  v142[2] = 0x3032000000;
  v142[3] = sub_1000FD498;
  v142[4] = sub_1000FD4A8;
  id v143 = (id)0xAAAAAAAAAAAAAAAALL;
  id v143 = objc_alloc_init((Class)NSMutableDictionary);
  id v141 = 0;
  id v7 = [v127 publicMessageProtectionIdentityDataToRegisterWithError:&v141];
  id v125 = v141;
  id v8 = [v7 publicLegacyIdentityData];
  LODWORD(a5) = v8 == 0;

  if (!a5)
  {
    id v9 = [v127 errorContainerToReport];
    uint64_t v10 = [IDSNGMKeyLoadingMetric alloc];
    v11 = [v7 publicNGMIdentityData];
    v12 = [v7 publicNGMPrekeyData];
    v122 = [(IDSNGMKeyLoadingMetric *)v10 initWithErrorContainer:v9 missingIdentity:v11 == 0 missingPrekey:v12 == 0];

    long long v13 = +[IDSRTCLogger loggerWithCategory:4000];
    [v13 logMetric:v122];

    long long v14 = [v7 publicNGMIdentityData];
    if (v14)
    {
      long long v15 = [v7 publicNGMPrekeyData];
      BOOL v16 = v15 == 0;

      if (!v16) {
        goto LABEL_62;
      }
    }
    long long v17 = +[IMRGLog registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v105 = [v7 publicNGMIdentityData];
      if (v105) {
        CFStringRef v106 = @"YES";
      }
      else {
        CFStringRef v106 = @"NO";
      }
      CFStringRef v118 = v106;
      v107 = [v7 publicNGMPrekeyData];
      if (v107) {
        CFStringRef v108 = @"YES";
      }
      else {
        CFStringRef v108 = @"NO";
      }
      CFStringRef v117 = v108;
      if ([v9 hasRegisteredContainer]) {
        CFStringRef v109 = @"YES";
      }
      else {
        CFStringRef v109 = @"NO";
      }
      CFStringRef v116 = v109;
      if ([v9 hasUnregisteredContainer]) {
        CFStringRef v110 = @"YES";
      }
      else {
        CFStringRef v110 = @"NO";
      }
      CFStringRef v115 = v110;
      if ([v9 hasUnregisteredContainer]) {
        [v9 unregisteredKeychainError];
      }
      else {
      v119 = [v9 registeredKeychainError];
      }
      if ([v9 hasUnregisteredContainer]) {
        [v9 unregisteredDeserializationError];
      }
      else {
      v111 = [v9 registeredKeychainError];
      }
      v112 = [v9 generationError];
      v113 = [v9 rollingError];
      v114 = [v9 identityToRegisterError];
      *(_DWORD *)buf = 138414338;
      CFStringRef v147 = v118;
      __int16 v148 = 2112;
      CFStringRef v149 = v117;
      __int16 v150 = 2112;
      CFStringRef v151 = v116;
      __int16 v152 = 2112;
      CFStringRef v153 = v115;
      __int16 v154 = 2112;
      v155 = v119;
      __int16 v156 = 2112;
      v157 = v111;
      __int16 v158 = 2112;
      v159 = v112;
      __int16 v160 = 2112;
      v161 = v113;
      __int16 v162 = 2112;
      v163 = v114;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Registering without an NGM key { hasIdentityData: %@, hasPrekeyData: %@, hasRegIdentity: %@, hasUnregIdentity: %@, keychainError: %@, serializationError: %@, generationError: %@, rollingError: %@, dataToRegisterError: %@ }", buf, 0x5Cu);
    }
    if (!+[IDSAutoBugCapture isSupported]) {
      goto LABEL_62;
    }
    long long v18 = [v7 publicNGMIdentityData];
    if (v18) {
      CFStringRef v19 = @"YES";
    }
    else {
      CFStringRef v19 = @"NO";
    }
    v20 = [v7 publicNGMPrekeyData];
    if (v20) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    unsigned int v22 = [v9 hasRegisteredContainer];
    unsigned int v23 = [v9 hasUnregisteredContainer];
    if (v22) {
      CFStringRef v24 = @"YES";
    }
    else {
      CFStringRef v24 = @"NO";
    }
    if (v23) {
      CFStringRef v25 = @"YES";
    }
    else {
      CFStringRef v25 = @"NO";
    }
    v26 = +[NSString stringWithFormat:@"EC Key Loading Failure (iden:%@, pre:%@, reg:%@, unreg:%@)", v19, v21, v24, v25];

    v27 = [v9 registeredKeychainError];
    if (v27)
    {
      v28 = [v9 shouldHaveRegisteredIdentity];
      if (v28)
      {
        v29 = [v9 shouldHaveRegisteredIdentity];
        unsigned int v30 = [v29 BOOLValue];

        if (!v30) {
          goto LABEL_32;
        }
      }
      else
      {
      }
      v34 = [v9 registeredKeychainError];
      v35 = [v34 domain];

      v36 = [v9 registeredKeychainError];
      v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v36 code]);

      v38 = [v9 registeredKeychainError];
      v39 = [v38 userInfo];

      v40 = [v39 objectForKey:@"IDSKeychainWrapperErrorOSStatus"];
      unsigned int v41 = [v35 isEqualToString:@"IDSKeychainWrapperErrorDomain"];
      if (v40) {
        unsigned int v42 = v41;
      }
      else {
        unsigned int v42 = 0;
      }
      if (v42 == 1)
      {
        id v43 = v40;

        v37 = v43;
      }
      v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (regKeychain %@:%ld)", v35, [v37 integerValue]);
      uint64_t v45 = [v26 stringByAppendingString:v44];

      v26 = (void *)v45;
    }
LABEL_32:
    v46 = [v9 registeredDeserializationError];
    if (!v46) {
      goto LABEL_38;
    }
    v47 = [v9 shouldHaveRegisteredIdentity];
    if (v47)
    {
      v48 = [v9 shouldHaveRegisteredIdentity];
      unsigned int v49 = [v48 BOOLValue];

      if (!v49)
      {
LABEL_38:
        v55 = [v9 unregisteredKeychainError];
        if (!v55) {
          goto LABEL_49;
        }
        v56 = [v9 shouldHaveUnregisteredIdentity];
        if (v56)
        {
          v57 = [v9 shouldHaveUnregisteredIdentity];
          unsigned int v58 = [v57 BOOLValue];

          if (!v58) {
            goto LABEL_49;
          }
        }
        else
        {
        }
        v59 = [v9 unregisteredKeychainError];
        v60 = [v59 domain];

        v61 = [v9 unregisteredKeychainError];
        v62 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v61 code]);

        v63 = [v9 unregisteredKeychainError];
        v64 = [v63 userInfo];

        v65 = [v64 objectForKey:@"IDSKeychainWrapperErrorOSStatus"];
        unsigned int v66 = [v60 isEqualToString:@"IDSKeychainWrapperErrorDomain"];
        if (v65) {
          unsigned int v67 = v66;
        }
        else {
          unsigned int v67 = 0;
        }
        if (v67 == 1)
        {
          id v68 = v65;

          v62 = v68;
        }
        v69 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (unregKeychain %@:%ld)", v60, [v62 integerValue]);
        uint64_t v70 = [v26 stringByAppendingString:v69];

        v26 = (void *)v70;
LABEL_49:
        v71 = [v9 unregisteredDeserializationError];
        if (v71)
        {
          v72 = [v9 shouldHaveUnregisteredIdentity];
          if (v72)
          {
            v73 = [v9 shouldHaveUnregisteredIdentity];
            unsigned int v74 = [v73 BOOLValue];

            if (!v74) {
              goto LABEL_55;
            }
          }
          else
          {
          }
          v75 = [v9 unregisteredDeserializationError];
          v76 = [v75 domain];
          v77 = [v9 unregisteredDeserializationError];
          v78 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (unregDeserial %@:%ld)", v76, [v77 code]);
          uint64_t v79 = [v26 stringByAppendingString:v78];

          v26 = (void *)v79;
        }
LABEL_55:
        v80 = [v9 generationError];

        if (v80)
        {
          v81 = [v9 generationError];
          v82 = [v81 domain];
          v83 = [v9 generationError];
          v84 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (generate %@:%ld)", v82, [v83 code]);
          uint64_t v85 = [v26 stringByAppendingString:v84];

          v26 = (void *)v85;
        }
        v86 = [v9 rollingError];

        if (v86)
        {
          v87 = [v9 rollingError];
          v88 = [v87 domain];
          v89 = [v9 rollingError];
          v90 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (rolling %@:%ld)", v88, [v89 code]);
          uint64_t v91 = [v26 stringByAppendingString:v90];

          v26 = (void *)v91;
        }
        v92 = [v9 identityToRegisterError];

        if (v92)
        {
          v93 = [v9 identityToRegisterError];
          v94 = [v93 domain];
          v95 = [v9 identityToRegisterError];
          v96 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (toRegister %@:%ld)", v94, [v95 code]);
          uint64_t v97 = [v26 stringByAppendingString:v96];

          v26 = (void *)v97;
        }
        v138[0] = _NSConcreteStackBlock;
        v138[1] = 3221225472;
        v138[2] = sub_1000FD4B0;
        v138[3] = &unk_10097FCF8;
        id v98 = v26;
        id v139 = v98;
        id v140 = v9;
        +[IDSAutoBugCapture triggerCaptureWithEvent:202 context:v98 completion:v138];

LABEL_62:
        v99 = [a1 serviceTypesFromRegistrations:v124];
        v100 = [a1 serviceTypesFromRegistrations:v124 withRegistrationType:1];
        v128[0] = _NSConcreteStackBlock;
        v128[1] = 3221225472;
        v128[2] = sub_1000FD588;
        v128[3] = &unk_100982428;
        id v137 = a1;
        id v101 = v99;
        id v129 = v101;
        v135 = v142;
        id v130 = v127;
        id v131 = v7;
        v136 = v144;
        id v102 = v100;
        id v132 = v102;
        id v133 = v125;
        id v103 = v126;
        id v134 = v103;
        [a1 _fetchKTDataSignatureForServiceTypes:v101 publicIdentityData:v131 keyStore:v130 withCompletion:v128];
        v33 = [v103 promise];

        goto LABEL_63;
      }
    }
    else
    {
    }
    v50 = [v9 registeredDeserializationError];
    v51 = [v50 domain];
    v52 = [v9 registeredDeserializationError];
    v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (regDeserial %@:%ld)", v51, [v52 code]);
    uint64_t v54 = [v26 stringByAppendingString:v53];

    v26 = (void *)v54;
    goto LABEL_38;
  }
  v31 = +[IMRGLog registration];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
    sub_100710618((uint64_t)v125, (uint64_t)v7, v31);
  }

  v32 = +[NSError errorWithDomain:@"IDSClientDataErrorDomain" code:-2000 userInfo:0];
  [v126 failWithError:v32];

  v33 = [v126 promise];
LABEL_63:

  _Block_object_dispose(v142, 8);
  _Block_object_dispose(v144, 8);

  return v33;
}

+ (id)_createClientDatasForServiceTypes:(id)a3 withAppleIDRegistrationsForServiceTypes:(id)a4 ktRegDataByServiceType:(id)a5 publicIdentityData:(id)a6 publicIdentityError:(id)a7 keyStore:(id)a8 isPresenceCapable:(BOOL)a9 isStewieCapable:(BOOL)a10
{
  id v15 = a3;
  id v232 = a4;
  id v245 = a5;
  id v16 = a6;
  v138 = a7;
  id v244 = a8;
  id v243 = objc_alloc_init((Class)NSMutableDictionary);
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  id obj = v15;
  id v246 = [obj countByEnumeratingWithState:&v250 objects:v262 count:16];
  if (v246)
  {
    uint64_t v242 = *(void *)v251;
    key = (void *)_IDSIdentityClientDataMessageProtectionIdentityKey;
    v234 = (void *)_IDSIdentityClientDataMessageProtectionVersionNumberKey;
    v241 = (void *)IDSRegistrationPropertyShowPeerErrors;
    v231 = (void *)IDSRegistrationPropertyIsC2KEquipment;
    v146 = (void *)IDSGameCenterContactsAssociationID;
    id v145 = (void *)IDSGameCenterContactsSharingState;
    id v143 = (void *)IDSGameCenterContactsLastUpdatedDate;
    v161 = (void *)IDSGameCenterSupportsFriendingViaPush;
    v186 = (void *)IDSGameCenterSupportsMessageTransportV2;
    v164 = (void *)_IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
    v163 = (void *)_IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
    v190 = (void *)IDSRegistrationPropertyKeyTransparencyVersion;
    v144 = (void *)IDSRegistrationPropertyKeyTransparencyDeviceKeySignature;
    v159 = (void *)IDSRegistrationPropertySupportsModernGFT;
    __int16 v158 = (void *)IDSRegistrationPropertySupportsCo;
    v142 = (void *)IDSRegistrationPropertyIsGreenTea;
    v157 = (void *)IDSRegistrationPropertySupportsGondola;
    id v141 = (void *)IDSRegistrationPropertyDoesNotSupportGFTCalls;
    __int16 v156 = (void *)IDSRegistrationPropertySupportsSelfOneToOneInvites;
    id v140 = (void *)IDSRegistrationPropertySupportsHiResVideoMessaging;
    v155 = (void *)IDSRegistrationPropertySupportsAVLess;
    v185 = (void *)IDSRegistrationPropertySupportsHEIFEncoding;
    v184 = (void *)IDSRegistrationPropertySupportsAnimojiV2;
    v189 = (void *)IDSRegistrationPropertySupportsHDRVideo;
    v233 = (void *)IDSRegistrationPropertyPrefersSDRVideo;
    v191 = (void *)IDSRegistrationPropertySupportsUWB;
    v192 = (void *)IDSRegistrationPropertySupportsActivitySharing;
    __int16 v160 = (const void *)IDSRegistrationPropertySupportsSSRC;
    *(void *)&long long v17 = 138412546;
    long long v137 = v17;
    v180 = (void *)IDSRegistrationPropertySupportsScreenTimeV2;
    v179 = (void *)IDSRegistrationPropertySupportsMapsRoutingPathLeg;
    v178 = (void *)IDSRegistrationPropertySupportsBeaconSharingV2;
    v177 = (void *)IDSRegistrationPropertySupportsBeneficiaryInvites;
    v176 = (void *)IDSRegistrationPropertySupportsMapsWaypointRouteSharing;
    v238 = (void *)IDSRegistrationPropertySupportsCrossPlatformSharing;
    v237 = (void *)IDSRegistrationPropertySupportsRecurringPaymentBubbles;
    __int16 v154 = (void *)IDSRegistrationPropertySupportsSharedExperiencePresence;
    v175 = (void *)IDSRegistrationPropertySupportsIncomingFindMyV1;
    CFStringRef v153 = (void *)IDSRegistrationPropertySupportsFMDV2;
    __int16 v162 = (void *)IDSRegistrationPropertySupportsFMFenceV1;
    v174 = (void *)IDSRegistrationPropertySupportsSecureLocationsV1;
    __int16 v152 = (void *)IDSRegistrationPropertySupportsKeySharing;
    CFStringRef v151 = (void *)IDSRegistrationPropertySupportsHarmony;
    __int16 v150 = (void *)IDSRegistrationPropertySupportsManateeForAppleCash;
    CFStringRef v149 = (void *)IDSRegistrationPropertySupportsRegionForAppleCash;
    __int16 v148 = (void *)IDSRegistrationPropertySupportsHomeKitResident;
    v173 = (void *)IDSRegistrationPropertySupportsMapsProtocolV5;
    CFStringRef v147 = (void *)IDSRegistrationPropertySupportsManateeActivitySharing;
    v188 = (void *)IDSRegistrationPropertySupportsZelkova;
    v172 = (void *)IDSRegistrationPropertySupportsPeopleRangingV1;
    v171 = (void *)IDSRegistrationPropertySupportsBeaconSharingV3;
    v236 = (void *)IDSRegistrationPropertySupportsFindMyPluginMessages;
    v170 = (void *)IDSRegistrationPropertySupportsRestrictedGuest;
    v169 = (void *)IDSRegistrationPropertySupportsRemoteATVSignIn;
    v168 = (const void *)IDSRegistrationPropertySupportsRecoveryContactUpsell;
    v230 = (void *)IDSRegistrationPropertySupportsInlineAttachments;
    v229 = (void *)IDSRegistrationPropertySupportsKeepReceipts;
    v228 = (void *)IDSRegistrationPropertySupportsLocationSharing;
    v227 = (void *)IDSRegistrationPropertySupportsMediaV2;
    v226 = (void *)IDSRegistrationPropertySupportsStickersV1;
    v225 = (void *)IDSRegistrationPropertySupportsChatAppsV1;
    v224 = (void *)IDSRegistrationPropertySupportsBubbleEditingV1;
    v223 = (void *)IDSRegistrationPropertySupportsAcknowledgementsV1;
    v222 = (void *)IDSRegistrationPropertySupportsInvisibleInkV1;
    v221 = (void *)IDSRegistrationPropertySupportsFullScreenMomentsV1;
    v220 = (void *)IDSRegistrationPropertySupportsFullScreenMomentsV2;
    v219 = (void *)IDSRegistrationPropertySupportsFullScreenMomentsV3;
    v218 = (void *)IDSRegistrationPropertySupportsImpactEffectsV1;
    v217 = (void *)IDSRegistrationPropertySupportsUpdateAttachmentsV1;
    v216 = (void *)IDSRegistrationPropertySupportsAutoloopVideoV1;
    v215 = (void *)IDSRegistrationPropertySupportsPhotosExtensionV1;
    v214 = (void *)IDSRegistrationPropertySupportsPhotosExtensionV2;
    v213 = (void *)IDSRegistrationPropertySupportsAudioMessagingV2;
    v212 = (void *)IDSRegistrationPropertySupportsCertifiedDeliveryV1;
    v211 = (void *)IDSRegistrationPropertySupportsOriginalTimestampOrderingV1;
    v210 = (void *)IDSRegistrationPropertyOptionallyReceiveTypingIndicator;
    v209 = (void *)IDSRegistrationPropertyNicknamesVersion;
    v183 = (void *)IDSRegistrationPropertyECVersion;
    v208 = (void *)IDSRegistrationPropertySupportsProtobufPayloadDataV2;
    v207 = (void *)IDSRegistrationPropertySupportsSyndicationActionsV1;
    v206 = (void *)IDSRegistrationPropertySupportsDeliveredQuietlyAndNotifyRecipient;
    v205 = (void *)IDSRegistrationPropertySupportsRetractAndEditMessages;
    v204 = (void *)IDSRegistrationPropertySupportsEmojiStickers;
    v203 = (void *)IDSRegistrationPropertySupportsStickerEditing;
    v202 = (void *)IDSRegistrationPropertySupportsHybridGroupsV1;
    v182 = (void *)IDSRegistrationPropertySupportsGroupPhotoRefreshVersion;
    v187 = (void *)IDSRegistrationPropertySupportsSOSAlerting;
    v201 = (void *)IDSRegistrationPropertySupportsPeopleRequestMessages;
    v200 = (void *)IDSRegistrationPropertySupportsPeopleRequestMessagesV2;
    v199 = (void *)IDSRegistrationPropertySupportsPeopleRequestMessagesV3;
    v198 = (void *)IDSRegistrationPropertySupportsAskTo;
    v197 = (void *)IDSRegistrationPropertySupportsFamilyInviteMessageBubble;
    v196 = (void *)IDSRegistrationPropertySupportsEmojiTapbacks;
    v195 = (void *)IDSRegistrationPropertySupportsSendLaterMessages;
    v167 = (void *)IDSRegistrationPropertySupportsStickMojiBacks;
    v166 = (void *)IDSRegistrationPropertySupportsEmojiImages;
    v194 = (void *)IDSRegistrationPropertySupportsHighQualityPhotoFileSizes;
    v165 = (void *)IDSRegistrationPropertySupportsStewie;
    v181 = (void *)IDSRegistrationPropertySenderKeyMessageVersion;
    v193 = (void *)IDSRegistrationPropertySupportsSenderKey;
    v240 = (void *)IDSRegistrationPropertySupportsLiveDelivery;
    long long v18 = &IDSRegistrationPropertySupportsAVLess_ptr;
    CFStringRef v19 = IDSValidationQueue;
    id v239 = v16;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v251 != v242) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v21 = *(NSObject **)(*((void *)&v250 + 1) + 8 * (void)v20);
        unsigned int v22 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        unsigned int v23 = +[IMRGLog registration];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_1007106A0(v260, v16, &v261, v23);
        }

        CFStringRef v24 = [v16 publicLegacyIdentityData];
        if (v24) {
          CFDictionarySetValue(v22, key, v24);
        }

        CFStringRef v25 = _IDSIdentityVersionNumber();
        if (v25) {
          CFDictionarySetValue(v22, v234, v25);
        }

        CFDictionarySetValue(v22, v241, &__kCFBooleanTrue);
        v26 = +[FTDeviceSupport sharedInstance];
        unsigned int v27 = [v26 isC2KEquipment];

        if (v27) {
          CFDictionarySetValue(v22, v231, &__kCFBooleanTrue);
        }
        if (IDSIsGameCenterRegistrationServiceType())
        {
          v28 = [v232 objectForKey:v21];
          if (v28)
          {
            v29 = [v18[236] sharedInstance];
            unsigned int v30 = [v28 userID];
            v31 = [v29 gameCenterPropertiesFromAccountWithUsername:v30];

            v32 = +[IMRGLog registration];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v255 = v31;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Game center contacts client data: %@", buf, 0xCu);
            }

            if (v31)
            {
              v33 = [v31 contactsAssociationID];
              if (v33) {
                CFDictionarySetValue(v22, v146, v33);
              }

              v34 = [v31 contactsSharingState];
              if (v34) {
                CFDictionarySetValue(v22, v145, v34);
              }

              v35 = [v31 contactsLastUpdatedDate];

              if (v35)
              {
                v36 = [v31 contactsLastUpdatedDate];
                [v36 timeIntervalSince1970];
                v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

                if (v37) {
                  CFDictionarySetValue(v22, v143, v37);
                }
              }
            }
            v38 = +[FTDeviceSupport sharedInstance];
            v39 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v38 supportsFriendingViaPush]);

            if (v39) {
              CFDictionarySetValue(v22, v161, v39);
            }

            CFDictionarySetValue(v22, v186, &__kCFBooleanTrue);
          }
          else
          {
            v31 = +[IMRGLog registration];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v40 = [obj objectForKey:v21];
              *(_DWORD *)buf = 138412290;
              v255 = v40;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Game center registration %@ found. Skipping", buf, 0xCu);
            }
          }

          CFStringRef v19 = IDSValidationQueue;
        }
        uint64_t v41 = objc_msgSend(v16, "publicNGMIdentityData", v137);
        if (v41
          && (unsigned int v42 = (void *)v41,
              [v16 publicNGMPrekeyData],
              id v43 = objc_claimAutoreleasedReturnValue(),
              v43,
              v42,
              v43))
        {
          v44 = [v16 publicNGMPrekeyData];
          if (v44) {
            CFDictionarySetValue(v22, v164, v44);
          }

          uint64_t v45 = [v16 NGMVersion];
          if (v45) {
            CFDictionarySetValue(v22, v163, v45);
          }
        }
        else
        {
          uint64_t v45 = +[IMRGLog registration];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            v128 = [v16 publicNGMIdentityData];
            if (v128) {
              CFStringRef v129 = @"YES";
            }
            else {
              CFStringRef v129 = @"NO";
            }
            id v130 = [v16 publicNGMPrekeyData];
            *(_DWORD *)buf = 138544131;
            if (v130) {
              CFStringRef v131 = @"YES";
            }
            else {
              CFStringRef v131 = @"NO";
            }
            long long v18 = &IDSRegistrationPropertySupportsAVLess_ptr;
            v255 = v138;
            __int16 v256 = 2113;
            *(void *)v257 = v129;
            CFStringRef v19 = IDSValidationQueue;
            *(_WORD *)&v257[8] = 2113;
            *(void *)&v257[10] = v131;
            __int16 v258 = 2113;
            id v259 = v239;
            _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "Missing ngm public identity data from -[<IDSClientDataRegistrationKeyManager> publicMessageProtectionIdentityDataToRegisterWithError:] -- {error: %{public}@, publicNGMIdentityData: %{private}@, publicNGMPrekeyData: %{private}@, publicIdentityData: %{private}@ }", buf, 0x2Au);

            id v16 = v239;
          }
        }

        v46 = [v244 keyTransparencyVersionNumberToRegisterForServiceType:v21];
        if ([v46 unsignedIntValue])
        {
          id v47 = v46;
          if (v47) {
            CFDictionarySetValue(v22, v190, v47);
          }
        }
        v249 = v46;
        v48 = [obj objectForKeyedSubscript:v21];
        unsigned int v49 = [&v19[80] sharedInstance];
        v248 = v48;
        v50 = [v48 serviceIdentifier];
        v51 = [v49 serviceWithIdentifier:v50];

        if ([v51 adHocServiceType])
        {
          v52 = [&v19[80] sharedInstance];
          uint64_t v53 = objc_msgSend(v52, "primaryServiceForAdhocServiceType:", objc_msgSend(v51, "adHocServiceType"));

          v51 = (void *)v53;
        }
        uint64_t v54 = [v245 objectForKeyedSubscript:v21];
        v55 = +[IDSFoundationLog KeyTransparency];
        v56 = v55;
        if (!v54)
        {
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            unsigned int v63 = [v51 ktRegistrationDataIndex];
            *(_DWORD *)buf = v137;
            v255 = v21;
            __int16 v256 = 1024;
            *(_DWORD *)v257 = v63;
            v64 = v56;
            v65 = "No KT Registration Data found for key index. { serviceType: %@, ktKeyIndex: %u }";
            uint32_t v66 = 18;
            goto LABEL_155;
          }
LABEL_59:

          goto LABEL_60;
        }
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v57 = [v51 ktRegistrationDataIndex];
          *(_DWORD *)buf = 138412802;
          v255 = v21;
          __int16 v256 = 1024;
          *(_DWORD *)v257 = v57;
          *(_WORD *)&v257[4] = 2112;
          *(void *)&v257[6] = v54;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Found KT Registration Data for key index. { serviceType: %@, ktKeyIndex: %u, ktRegData: %@ }", buf, 0x1Cu);
        }

        if ([v51 ktRegistrationDataIndex])
        {
          uint64_t v58 = [v54 ktPublicAccountKey];
          if (v58
            && (v59 = (void *)v58,
                [v54 ktDataSignature],
                v60 = objc_claimAutoreleasedReturnValue(),
                v60,
                v59,
                v60))
          {
            v61 = [v54 ktDataSignature];
            if (v61) {
              CFDictionarySetValue(v22, v144, v61);
            }

            v56 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v62 = [v51 ktRegistrationDataIndex];
              *(_DWORD *)buf = 138412802;
              v255 = v21;
              __int16 v256 = 1024;
              *(_DWORD *)v257 = v62;
              *(_WORD *)&v257[4] = 2112;
              *(void *)&v257[6] = v54;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Adding KT data signature to IDS client data. { serviceType: %@, ktKeyIndex: %u, ktRegData: %@ }", buf, 0x1Cu);
            }
          }
          else
          {
            v56 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              unsigned int v133 = [v51 ktRegistrationDataIndex];
              *(_DWORD *)buf = 138412802;
              v255 = v21;
              __int16 v256 = 1024;
              *(_DWORD *)v257 = v133;
              *(_WORD *)&v257[4] = 2112;
              *(void *)&v257[6] = v54;
              v64 = v56;
              v65 = "KT Registration data missing public account key or data signature. { serviceType: %@, ktKeyIndex: %u"
                    ", ktRegData: %@ }";
              uint32_t v66 = 28;
LABEL_155:
              _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v65, buf, v66);
            }
          }
          goto LABEL_59;
        }
LABEL_60:
        if (IDSIsiMessageRegistrationServiceType())
        {
          CFDictionarySetValue(v22, v230, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v229, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v228, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v227, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v226, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v225, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v224, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v223, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v222, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v221, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v220, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v219, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v218, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v217, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v216, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v215, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v214, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v213, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v213, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v212, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v211, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v210, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v209, &off_1009D1050);
          unsigned int v67 = _IDSECVersion();
          if (v67) {
            CFDictionarySetValue(v22, v183, v67);
          }

          CFDictionarySetValue(v22, v208, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v207, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v206, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v205, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v238, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v204, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v203, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v202, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v237, &__kCFBooleanTrue);
          id v68 = _IDSGroupPhotoRefreshVersionNumber();
          if (v68) {
            CFDictionarySetValue(v22, v182, v68);
          }

          CFDictionarySetValue(v22, v236, &__kCFBooleanTrue);
          v69 = +[FTDeviceSupport sharedInstance];
          if ([v69 deviceType] == (id)2)
          {

            goto LABEL_97;
          }
          v92 = +[FTDeviceSupport sharedInstance];
          id v93 = [v92 deviceType];

          if (v93 == (id)6) {
LABEL_97:
          }
            CFDictionarySetValue(v22, v187, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v201, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v200, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v199, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v198, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v197, &__kCFBooleanTrue);
          v94 = +[FTDeviceSupport sharedInstance];
          unsigned int v95 = [v94 supportsHEIFEncoding];

          if (v95) {
            CFDictionarySetValue(v22, v185, &__kCFBooleanTrue);
          }
          v96 = +[FTDeviceSupport sharedInstance];
          unsigned int v97 = [v96 supportsAnimojiV2];

          if (v97) {
            CFDictionarySetValue(v22, v184, &__kCFBooleanTrue);
          }
          id v98 = +[FTDeviceSupport sharedInstance];
          unsigned int v99 = [v98 supportsZelkova];

          if (v99) {
            CFDictionarySetValue(v22, v188, &__kCFBooleanTrue);
          }
          v100 = +[FTDeviceSupport sharedInstance];
          id v101 = [v100 supportsHDRdecoding];

          id v102 = +[NSNumber numberWithBool:v101];
          if (v102) {
            CFDictionarySetValue(v22, v189, v102);
          }

          CFDictionarySetValue(v22, v233, &__kCFBooleanFalse);
          id v103 = +[FTDeviceSupport sharedInstance];
          unsigned int v104 = [v103 supportsUWB];

          if (v104) {
            CFDictionarySetValue(v22, v191, &__kCFBooleanTrue);
          }
          v105 = +[FTDeviceSupport sharedInstance];
          if ([v105 deviceType] == (id)2)
          {

            id v16 = v239;
            goto LABEL_129;
          }
          v120 = +[FTDeviceSupport sharedInstance];
          id v121 = [v120 deviceType];

          BOOL v122 = v121 == (id)6;
          id v16 = v239;
          if (v122) {
LABEL_129:
          }
            CFDictionarySetValue(v22, v192, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v196, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v195, &__kCFBooleanTrue);
          if (_os_feature_enabled_impl()) {
            CFDictionarySetValue(v22, v167, &__kCFBooleanTrue);
          }
          id v123 = +[FTDeviceSupport sharedInstance];
          unsigned int v124 = [v123 supportsEmojiImages];

          if (v124) {
            CFDictionarySetValue(v22, v166, &__kCFBooleanTrue);
          }
          CFDictionarySetValue(v22, v194, &__kCFBooleanTrue);
          if (a10) {
            CFDictionarySetValue(v22, v165, &__kCFBooleanTrue);
          }
          id v125 = _IDSSenderKeyMessageVersionNumber();
          if (v125) {
            CFDictionarySetValue(v22, v181, v125);
          }

          uint64_t v91 = v193;
          goto LABEL_139;
        }
        if (IDSIsMultiplex1RegistrationServiceType())
        {
          CFDictionarySetValue(v22, v180, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v179, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v178, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v177, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v176, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v238, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v237, &__kCFBooleanTrue);
          if (a9) {
            CFDictionarySetValue(v22, v154, &__kCFBooleanTrue);
          }
          CFDictionarySetValue(v22, v175, &__kCFBooleanTrue);
          uint64_t v70 = +[FTDeviceSupport sharedInstance];
          unsigned int v71 = [v70 supportsFMDV2];

          if (v71) {
            CFDictionarySetValue(v22, v153, &__kCFBooleanTrue);
          }
          v72 = +[FTDeviceSupport sharedInstance];
          if ([v72 deviceType] == (id)2) {
            goto LABEL_77;
          }
          v73 = +[FTDeviceSupport sharedInstance];
          if ([v73 deviceType] == (id)6) {
            goto LABEL_76;
          }
          unsigned int v74 = +[FTDeviceSupport sharedInstance];
          if ([v74 deviceType] == (id)4)
          {

            long long v18 = &IDSRegistrationPropertySupportsAVLess_ptr;
LABEL_76:

            id v16 = v239;
LABEL_77:

LABEL_78:
            CFDictionarySetValue(v22, v162, &__kCFBooleanTrue);
          }
          else
          {
            id v132 = +[FTDeviceSupport sharedInstance];
            id v139 = [v132 deviceType];

            id v16 = v239;
            long long v18 = &IDSRegistrationPropertySupportsAVLess_ptr;
            if (v139 == (id)3) {
              goto LABEL_78;
            }
          }
          CFDictionarySetValue(v22, v174, &__kCFBooleanTrue);
          v75 = +[FTDeviceSupport sharedInstance];
          unsigned int v76 = [v75 supportsKeySharing];

          if (v76) {
            CFDictionarySetValue(v22, v152, &__kCFBooleanTrue);
          }
          v77 = +[FTDeviceSupport sharedInstance];
          unsigned int v78 = [v77 supportsHarmony];

          if (v78) {
            CFDictionarySetValue(v22, v151, &__kCFBooleanTrue);
          }
          uint64_t v79 = +[FTDeviceSupport sharedInstance];
          unsigned int v80 = [v79 supportsManateeForAppleCash];

          if (v80) {
            CFDictionarySetValue(v22, v150, &__kCFBooleanTrue);
          }
          v81 = +[FTDeviceSupport sharedInstance];
          unsigned int v82 = [v81 supportsRegionForAppleCash];

          if (v82) {
            CFDictionarySetValue(v22, v149, &__kCFBooleanTrue);
          }
          v83 = +[FTDeviceSupport sharedInstance];
          unsigned int v84 = [v83 supportsUWB];

          if (v84) {
            CFDictionarySetValue(v22, v191, &__kCFBooleanTrue);
          }
          uint64_t v85 = +[FTDeviceSupport sharedInstance];
          unsigned int v86 = [v85 supportsHomeKitResident];

          if (v86) {
            CFDictionarySetValue(v22, v148, &__kCFBooleanTrue);
          }
          CFDictionarySetValue(v22, v173, &__kCFBooleanTrue);
          v87 = +[FTDeviceSupport sharedInstance];
          unsigned int v88 = [v87 supportsManateeActivitySharing];

          if (v88) {
            CFDictionarySetValue(v22, v147, &__kCFBooleanTrue);
          }
          v89 = +[FTDeviceSupport sharedInstance];
          unsigned int v90 = [v89 supportsZelkova];

          if (v90) {
            CFDictionarySetValue(v22, v188, &__kCFBooleanTrue);
          }
          CFDictionarySetValue(v22, v172, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v171, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v236, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v170, &__kCFBooleanTrue);
          CFDictionarySetValue(v22, v169, &__kCFBooleanTrue);
          uint64_t v91 = v168;
          goto LABEL_139;
        }
        if (!IDSIsAnyFaceTimeRelatedRegistrationServiceType()) {
          goto LABEL_140;
        }
        CFDictionarySetValue(v22, v159, &__kCFBooleanTrue);
        CFDictionarySetValue(v22, v158, &__kCFBooleanTrue);
        CFStringRef v106 = +[FTDeviceSupport sharedInstance];
        unsigned int v107 = [v106 isGreenTea];

        if (v107) {
          CFDictionarySetValue(v22, v142, &__kCFBooleanTrue);
        }
        CFDictionarySetValue(v22, v157, &__kCFBooleanTrue);
        CFStringRef v108 = +[FTDeviceSupport sharedInstance];
        unsigned __int8 v109 = [v108 supportsVenice];

        if ((v109 & 1) == 0) {
          CFDictionarySetValue(v22, v141, &__kCFBooleanTrue);
        }
        CFDictionarySetValue(v22, v156, &__kCFBooleanTrue);
        if (_os_feature_enabled_impl()) {
          CFDictionarySetValue(v22, v140, &__kCFBooleanTrue);
        }
        CFDictionarySetValue(v22, v155, &__kCFBooleanTrue);
        CFStringRef v110 = +[FTDeviceSupport sharedInstance];
        unsigned int v111 = [v110 supportsHEIFEncoding];

        if (v111) {
          CFDictionarySetValue(v22, v185, &__kCFBooleanTrue);
        }
        v112 = +[FTDeviceSupport sharedInstance];
        unsigned int v113 = [v112 supportsAnimojiV2];

        if (v113) {
          CFDictionarySetValue(v22, v184, &__kCFBooleanTrue);
        }
        v114 = +[FTDeviceSupport sharedInstance];
        id v115 = [v114 supportsHDRdecoding];

        CFStringRef v116 = +[NSNumber numberWithBool:v115];
        if (v116) {
          CFDictionarySetValue(v22, v189, v116);
        }

        CFDictionarySetValue(v22, v233, &__kCFBooleanFalse);
        CFStringRef v117 = +[FTDeviceSupport sharedInstance];
        unsigned int v118 = [v117 supportsUWB];

        if (v118) {
          CFDictionarySetValue(v22, v191, &__kCFBooleanTrue);
        }
        v119 = +[FTDeviceSupport sharedInstance];
        if ([v119 deviceType] == (id)2)
        {
        }
        else
        {
          id v126 = +[FTDeviceSupport sharedInstance];
          id v127 = [v126 deviceType];

          uint64_t v91 = v160;
          BOOL v122 = v127 == (id)6;
          id v16 = v239;
          if (!v122) {
            goto LABEL_139;
          }
        }
        CFDictionarySetValue(v22, v192, &__kCFBooleanTrue);
        uint64_t v91 = v160;
LABEL_139:
        CFDictionarySetValue(v22, v91, &__kCFBooleanTrue);
LABEL_140:
        CFDictionarySetValue(v22, v240, &__kCFBooleanTrue);
        [v243 setObject:v22 forKeyedSubscript:v21];

        v20 = (char *)v20 + 1;
        CFStringRef v19 = IDSValidationQueue;
      }
      while (v246 != v20);
      id v134 = [obj countByEnumeratingWithState:&v250 objects:v262 count:16];
      id v246 = v134;
    }
    while (v134);
  }

  id v135 = v243;
  return v135;
}

+ (BOOL)_shouldAddECKeysForServiceType:(id)a3
{
  return 1;
}

+ (BOOL)_isKTAsyncEnrollmentDisabledViaUserDefaults
{
  unsigned int v2 = +[IMUserDefaults isKTAsyncEnrollmentDisabled];
  if (v2)
  {
    LOBYTE(v2) = CUTIsInternalInstall();
  }
  return v2;
}

+ (BOOL)_isKTAsyncEnrollmentDisabledViaServerBag
{
  unsigned int v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"kt-async-enrollment-disabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (void)_fetchStewieCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  id v8 = (char *)[v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        v9 |= IDSIsiMessageRegistrationServiceType();
      }
      id v8 = (char *)[v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);

    if (v9)
    {
      *(void *)buf = 0;
      CFStringRef v25 = buf;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      im_primary_queue();
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000FF960;
      v21[3] = &unk_1009824A0;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = v12;
      unsigned int v23 = buf;
      long long v13 = objc_retainBlock(v21);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000FFBAC;
      v17[3] = &unk_1009824F0;
      id v14 = v12;
      id v18 = v14;
      id v19 = v6;
      v20 = buf;
      id v15 = objc_retainBlock(v17);
      dispatch_time(0, 10000000000);
      im_dispatch_async_with_timeout();

      _Block_object_dispose(buf, 8);
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not checking stewie capability because we're not registering madrid", buf, 2u);
  }

  (*((void (**)(id, void))v6 + 2))(v6, 0);
LABEL_14:
}

+ (void)_fetchPresenceCapabilityForServiceTypes:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = IMWeakLinkClass();
  if (!v7)
  {
    id v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "StatusKit framework not available on this platform", buf, 2u);
    }
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v5;
  uint64_t v10 = (char *)[v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v10)
  {

LABEL_15:
    id v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not checking presence capability because we're not registering multiplex", buf, 2u);
    }
LABEL_17:

    v6[2](v6, 0);
    goto LABEL_18;
  }
  int v11 = 0;
  uint64_t v12 = *(void *)v32;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v9);
      }
      v11 |= IDSIsMultiplex1RegistrationServiceType();
    }
    uint64_t v10 = (char *)[v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_15;
  }
  *(void *)buf = 0;
  long long v28 = buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  im_primary_queue();
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100100028;
  v23[3] = &unk_100982588;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  CFStringRef v25 = buf;
  uint64_t v26 = v8;
  id v24 = v14;
  id v15 = objc_retainBlock(v23);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100100250;
  v19[3] = &unk_1009824F0;
  id v16 = v14;
  id v20 = v16;
  CFStringRef v21 = v6;
  id v22 = buf;
  long long v17 = objc_retainBlock(v19);
  dispatch_time(0, 10000000000);
  im_dispatch_async_with_timeout();

  _Block_object_dispose(buf, 8);
LABEL_18:
}

+ (void)_fetchKTDataSignatureForServiceTypes:(id)a3 publicIdentityData:(id)a4 keyStore:(id)a5 withCompletion:(id)a6
{
}

@end
@interface IDSServiceProperties
- (BOOL)allowCrossAccountMessages;
- (BOOL)allowLaunchOnNearbyDevicesChanged;
- (BOOL)allowLocalDelivery;
- (BOOL)allowMagnetDelivery;
- (BOOL)allowPartialSendsToSucceed;
- (BOOL)allowPendingMessagesForInactiveDevice;
- (BOOL)allowSendingMessagesToInactiveDevice;
- (BOOL)allowUrgentMessages;
- (BOOL)allowWakingMessages;
- (BOOL)allowWiProxDelivery;
- (BOOL)allowsDuplicates;
- (BOOL)blockRemoteTimeouts;
- (BOOL)canUseLargePayload;
- (BOOL)disableOnLowRAMDevice;
- (BOOL)disabledOnTinkerWatch;
- (BOOL)disallowFirewallAutoEnroll;
- (BOOL)dontFilterSelfMessagesForUnknownDevice;
- (BOOL)enabledOnlyOnStandaloneDevices;
- (BOOL)enabledOnlyWhenPaired;
- (BOOL)forceHTTPQueriesOnly;
- (BOOL)hadStandalonePreferences;
- (BOOL)holdsMessagesUntilFirstUnlock;
- (BOOL)iCloudBasedService;
- (BOOL)isFamilyService;
- (BOOL)isFirewallEnabled;
- (BOOL)isInvitationService;
- (BOOL)isUltraConstrainedPushAllowed;
- (BOOL)isUserDrivenRealTime;
- (BOOL)needsLaunchOnNearbyDevicesChanged;
- (BOOL)passThroughMessagesFromStorage;
- (BOOL)prototypingOnly;
- (BOOL)pushToWakeDisabled;
- (BOOL)requiresPinnedIdentity;
- (BOOL)sendOnePerToken;
- (BOOL)shouldAllowCloudDelivery;
- (BOOL)shouldAllowLiveMessageDelivery;
- (BOOL)shouldAllowProxyDelivery;
- (BOOL)shouldAutoRegisterAllHandles;
- (BOOL)shouldHaveRestrictedStorage;
- (BOOL)shouldNotSyncPhoneNumberAccounts;
- (BOOL)shouldProtectTrafficUsingClassA;
- (BOOL)shouldRegisterUsingDSHandle;
- (BOOL)shouldShowUsageNotifications;
- (BOOL)shouldSilentlyFailMessagesOnSwitch;
- (BOOL)shouldSyncAccounts;
- (BOOL)supportsOfflineDelivery;
- (BOOL)tinkerMessagingOnly;
- (BOOL)tunnelService;
- (BOOL)useFaceTimeCallerID;
- (BOOL)useTransportZone;
- (BOOL)useiMessageCallerID;
- (BOOL)wantsLocalReflectedSend;
- (BOOL)wantsNetworkAvailableHint;
- (BOOL)wantsPendingMessageUpdates;
- (BOOL)wantsPendingResourceUpdates;
- (BOOL)wantsPhoneNumberAccount;
- (BOOL)wantsRemoteErrors;
- (BOOL)wantsTinkerDevices;
- (BOOL)watchOnlyService;
- (IDSServiceProperties)initWithServiceDictionary:(id)a3;
- (IDSServiceProperties)initWithServiceIdentifier:(id)a3;
- (NSArray)allInterestedQueryServices;
- (NSArray)duetIdentifiers;
- (NSArray)linkedServiceNames;
- (NSArray)queryLinkedServiceNames;
- (NSSet)allowedTrafficClasses;
- (NSString)dataUsageBundleID;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)launchDarwinNotification;
- (NSString)launchMachServiceNotification;
- (NSString)legacyIdentifier;
- (NSString)legacyPreferencesDomain;
- (NSString)preferencesDomain;
- (NSString)protocolName;
- (NSString)pushTopic;
- (NSString)queryService;
- (NSString)serviceName;
- (NSString)superService;
- (id)_identifierWithProtocolAndMachServiceSuffix;
- (id)_resolveProtocolName:(id)a3;
- (id)_resolveShouldUseMachNotification:(id)a3;
- (id)_stringToUseGivenName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)linkedDeviceRelationships;
- (unint64_t)accountSyncMinCompatibilityVersion;
- (unint64_t)minCompatibilityVersion;
- (unsigned)adHocServiceType;
- (unsigned)applicationKeyIndex;
- (unsigned)constraintType;
- (unsigned)controlCategory;
- (unsigned)dataProtectionClass;
- (unsigned)firewallNotificationRateLimitType;
- (unsigned)firewallNotificationStyle;
- (unsigned)ktRegistrationDataIndex;
- (void)setDataUsageBundleID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLegacyIdentifier:(id)a3;
- (void)setLinkedServiceNames:(id)a3;
- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3;
- (void)setProtocolName:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setQueryLinkedServiceNames:(id)a3;
- (void)setQueryService:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSuperService:(id)a3;
@end

@implementation IDSServiceProperties

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_resolveProtocolName:(id)a3
{
  v4 = objc_msgSend_objectForKey_(a3, a2, @"ProtocolName", v3);
  v7 = v4;
  v8 = @"com.apple.private.alloy";
  if (v4 && (objc_msgSend_isEqualToString_(v4, v5, @"com.apple.private.alloy", v6) & 1) == 0) {
    v8 = v7;
  }

  return v8;
}

- (IDSServiceProperties)initWithServiceIdentifier:(id)a3
{
  v5 = _IDSServiceDictionaryForIdentifier((uint64_t)a3);
  if (v5)
  {
    self = (IDSServiceProperties *)(id)objc_msgSend_initWithServiceDictionary_(self, v4, (uint64_t)v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)canUseLargePayload
{
  if (_os_feature_enabled_impl()) {
    LOBYTE(v3) = 1;
  }
  else {
    return (*((unsigned __int8 *)self + 43) >> 5) & 1;
  }
  return v3;
}

- (IDSServiceProperties)initWithServiceDictionary:(id)a3
{
  uint64_t v543 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v541.receiver = self;
  v541.super_class = (Class)IDSServiceProperties;
  double v6 = [(IDSServiceProperties *)&v541 init];
  if (!v6)
  {
LABEL_186:
    v52 = v6;
    goto LABEL_187;
  }
  v8 = objc_msgSend_objectForKey_(v4, v5, @"Identifier", v7);

  if (v8)
  {
    uint64_t v11 = objc_msgSend__resolveProtocolName_(v6, v9, (uint64_t)v4, v10);
    protocolName = v6->_protocolName;
    v6->_protocolName = (NSString *)v11;

    uint64_t v15 = objc_msgSend_objectForKey_(v4, v13, @"Identifier", v14);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v15;

    v19 = objc_msgSend_objectForKey_(v4, v17, @"ServiceName", v18);
    uint64_t v22 = objc_msgSend__stringToUseGivenName_(v6, v20, (uint64_t)v19, v21);
    serviceName = v6->_serviceName;
    v6->_serviceName = (NSString *)v22;

    v26 = objc_msgSend_objectForKey_(v4, v24, @"PushTopic", v25);
    uint64_t v29 = objc_msgSend__stringToUseGivenName_(v6, v27, (uint64_t)v26, v28);
    pushTopic = v6->_pushTopic;
    v6->_pushTopic = (NSString *)v29;

    uint64_t v33 = objc_msgSend_objectForKey_(v4, v31, @"LegacyIdentifier", v32);
    legacyIdentifier = v6->_legacyIdentifier;
    v6->_legacyIdentifier = (NSString *)v33;

    uint64_t v37 = objc_msgSend_objectForKey_(v4, v35, @"DisplayName", v36);
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v37;

    v41 = objc_msgSend_objectForKey_(v4, v39, @"DataProtectionClass", v40);
    v536 = v41;
    if (v41) {
      LOBYTE(v41) = objc_msgSend_unsignedIntValue(v41, v42, v43, v44);
    }
    v6->_dataProtectionClass = v41;
    v45 = objc_msgSend_objectForKey_(v4, v42, @"LaunchDarwinNotification", v44);
    uint64_t v48 = objc_msgSend_objectForKey_(v4, v46, @"LaunchMachServiceNotification", v47);
    v534 = (void *)v48;
    if (v48)
    {
      objc_msgSend__resolveShouldUseMachNotification_(v6, v49, v48, v50);
      v51 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v45)
      {
LABEL_11:
        v535 = v45;
        uint64_t v54 = objc_msgSend_objectForKey_(v4, v49, @"SuperService", v50);
        superService = v6->_superService;
        v6->_superService = (NSString *)v54;

        uint64_t v58 = objc_msgSend_objectForKey_(v4, v56, @"DataUsageBundleID", v57);
        dataUsageBundleID = v6->_dataUsageBundleID;
        v6->_dataUsageBundleID = (NSString *)v58;

        v62 = objc_msgSend_objectForKey_(v4, v60, @"AdHocServiceType", v61);
        v6->_adHocServiceType = objc_msgSend_unsignedIntValue(v62, v63, v64, v65);

        v68 = objc_msgSend_objectForKey_(v4, v66, @"ControlCategory", v67);
        v6->_controlCategory = objc_msgSend_unsignedIntValue(v68, v69, v70, v71);

        v74 = objc_msgSend_objectForKey_(v4, v72, @"ConstraintType", v73);
        v6->_constraintType = objc_msgSend_unsignedIntValue(v74, v75, v76, v77);

        v80 = objc_msgSend_objectForKey_(v4, v78, @"FirewallNotificationStyle", v79);
        v6->_firewallNotificationStyle = objc_msgSend_unsignedIntValue(v80, v81, v82, v83);

        v86 = objc_msgSend_objectForKey_(v4, v84, @"FirewallNotificationRateLimitType", v85);
        v6->_firewallNotificationRateLimitType = objc_msgSend_unsignedIntValue(v86, v87, v88, v89);

        v533 = objc_msgSend_objectForKey_(v4, v90, @"AllowedTrafficClasses", v91);
        uint64_t v92 = sub_19D9C256C(v533);
        allowedTrafficClassesIndices = v6->_allowedTrafficClassesIndices;
        v6->_allowedTrafficClassesIndices = (NSSet *)v92;

        v96 = objc_msgSend_objectForKey_(v4, v94, @"AllowLocalDelivery", v95);
        if (objc_msgSend_BOOLValue(v96, v97, v98, v99)) {
          char v100 = 2;
        }
        else {
          char v100 = 0;
        }
        *((unsigned char *)v6 + 43) = *((unsigned char *)v6 + 43) & 0xFD | v100;

        v103 = objc_msgSend_objectForKey_(v4, v101, @"AllowPartialSendsToSucceed", v102);
        if (objc_msgSend_BOOLValue(v103, v104, v105, v106)) {
          char v107 = 16;
        }
        else {
          char v107 = 0;
        }
        *((unsigned char *)v6 + 43) = *((unsigned char *)v6 + 43) & 0xEF | v107;

        v110 = objc_msgSend_objectForKey_(v4, v108, @"CanUseLargePayload", v109);
        if (objc_msgSend_BOOLValue(v110, v111, v112, v113)) {
          char v114 = 32;
        }
        else {
          char v114 = 0;
        }
        *((unsigned char *)v6 + 43) = *((unsigned char *)v6 + 43) & 0xDF | v114;

        v117 = objc_msgSend_objectForKey_(v4, v115, @"SendOnePerToken", v116);
        if (objc_msgSend_BOOLValue(v117, v118, v119, v120)) {
          char v121 = 64;
        }
        else {
          char v121 = 0;
        }
        *((unsigned char *)v6 + 43) = *((unsigned char *)v6 + 43) & 0xBF | v121;

        v124 = objc_msgSend_objectForKey_(v4, v122, @"SupportsPhoneNumberRegistration", v123);
        if (objc_msgSend_BOOLValue(v124, v125, v126, v127)) {
          char v128 = 0x80;
        }
        else {
          char v128 = 0;
        }
        *((unsigned char *)v6 + 43) = v128 & 0x80 | *((unsigned char *)v6 + 43) & 0x7F;

        v131 = objc_msgSend_objectForKey_(v4, v129, @"iCloudService", v130);
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xFE | objc_msgSend_BOOLValue(v131, v132, v133, v134);

        v137 = objc_msgSend_objectForKey_(v4, v135, @"TunnelService", v136);
        if (objc_msgSend_BOOLValue(v137, v138, v139, v140)) {
          char v141 = 2;
        }
        else {
          char v141 = 0;
        }
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xFD | v141;

        v144 = objc_msgSend_objectForKey_(v4, v142, @"ShouldShowUsageNotifications", v143);
        if (objc_msgSend_BOOLValue(v144, v145, v146, v147)) {
          char v148 = 8;
        }
        else {
          char v148 = 0;
        }
        *((unsigned char *)v6 + 43) = *((unsigned char *)v6 + 43) & 0xF7 | v148;

        v151 = objc_msgSend_objectForKey_(v4, v149, @"AutoConfigureVettedAddresses", v150);
        if (objc_msgSend_BOOLValue(v151, v152, v153, v154)) {
          char v155 = 8;
        }
        else {
          char v155 = 0;
        }
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xF7 | v155;

        v158 = objc_msgSend_objectForKey_(v4, v156, @"AutoConfigureDSID", v157);
        if (objc_msgSend_BOOLValue(v158, v159, v160, v161)) {
          char v162 = 16;
        }
        else {
          char v162 = 0;
        }
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xEF | v162;

        v165 = objc_msgSend_objectForKey_(v4, v163, @"SyncAccounts", v164);
        if (objc_msgSend_BOOLValue(v165, v166, v167, v168)) {
          char v169 = 32;
        }
        else {
          char v169 = 0;
        }
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xDF | v169;

        v172 = objc_msgSend_objectForKey_(v4, v170, @"NoSyncPhoneNumberAccounts", v171);
        if (objc_msgSend_BOOLValue(v172, v173, v174, v175)) {
          char v176 = 64;
        }
        else {
          char v176 = 0;
        }
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xBF | v176;

        v179 = objc_msgSend_objectForKey_(v4, v177, @"AllowProxyDelivery", v178);
        if (objc_msgSend_BOOLValue(v179, v180, v181, v182)) {
          char v183 = 0x80;
        }
        else {
          char v183 = 0;
        }
        *((unsigned char *)v6 + 44) = v183 & 0x80 | *((unsigned char *)v6 + 44) & 0x7F;

        v186 = objc_msgSend_objectForKey_(v4, v184, @"WantsLocalReflectedSend", v185);
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xFE | objc_msgSend_BOOLValue(v186, v187, v188, v189);

        v192 = objc_msgSend_objectForKey_(v4, v190, @"WantsNetworkAvailableHint", v191);
        if (objc_msgSend_BOOLValue(v192, v193, v194, v195)) {
          char v196 = 2;
        }
        else {
          char v196 = 0;
        }
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xFD | v196;

        v199 = objc_msgSend_objectForKey_(v4, v197, @"AllowLaunchOnNearbyDevicesChanged", v198);
        v6->_allowLaunchOnNearbyDevicesChanged = objc_msgSend_BOOLValue(v199, v200, v201, v202);

        v205 = objc_msgSend_objectForKey_(v4, v203, @"WatchOnlyService", v204);
        if (objc_msgSend_BOOLValue(v205, v206, v207, v208)) {
          char v209 = 4;
        }
        else {
          char v209 = 0;
        }
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xFB | v209;

        v212 = objc_msgSend_objectForKey_(v4, v210, @"AllowDuplicateMessages", v211);
        if (objc_msgSend_BOOLValue(v212, v213, v214, v215)) {
          char v216 = 8;
        }
        else {
          char v216 = 0;
        }
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xF7 | v216;

        v219 = objc_msgSend_objectForKey_(v4, v217, @"UseiMessageCallerID", v218);
        if (objc_msgSend_BOOLValue(v219, v220, v221, v222)) {
          char v223 = 16;
        }
        else {
          char v223 = 0;
        }
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xEF | v223;

        v226 = objc_msgSend_objectForKey_(v4, v224, @"UseFaceTimeCallerID", v225);
        if (objc_msgSend_BOOLValue(v226, v227, v228, v229)) {
          char v230 = 32;
        }
        else {
          char v230 = 0;
        }
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xDF | v230;

        v233 = objc_msgSend_objectForKey_(v4, v231, @"AllowPendingMessagesForInactiveDevice", v232);
        if (objc_msgSend_BOOLValue(v233, v234, v235, v236)) {
          char v237 = 64;
        }
        else {
          char v237 = 0;
        }
        *((unsigned char *)v6 + 45) = *((unsigned char *)v6 + 45) & 0xBF | v237;

        v240 = objc_msgSend_objectForKey_(v4, v238, @"AllowSendingMessagesToInactiveDevice", v239);
        if (objc_msgSend_BOOLValue(v240, v241, v242, v243)) {
          char v244 = 0x80;
        }
        else {
          char v244 = 0;
        }
        *((unsigned char *)v6 + 45) = v244 & 0x80 | *((unsigned char *)v6 + 45) & 0x7F;

        v247 = objc_msgSend_objectForKey_(v4, v245, @"ClassAProtectedTraffic", v246);
        *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xFE | objc_msgSend_BOOLValue(v247, v248, v249, v250);

        v253 = objc_msgSend_objectForKey_(v4, v251, @"SilentlyFailMessagesOnSwitch", v252);
        if (objc_msgSend_BOOLValue(v253, v254, v255, v256)) {
          char v257 = 2;
        }
        else {
          char v257 = 0;
        }
        *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xFD | v257;

        v260 = objc_msgSend_objectForKey_(v4, v258, @"AllowCloudDelivery", v259);
        if (objc_msgSend_BOOLValue(v260, v261, v262, v263)) {
          char v264 = 4;
        }
        else {
          char v264 = 0;
        }
        *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xFB | v264;

        if (v6->_adHocServiceType == 2)
        {
          *((unsigned char *)v6 + 46) &= ~8u;
        }
        else
        {
          v267 = objc_msgSend_objectForKey_(v4, v265, @"AllowLiveMessageDelivery", v266);
          *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xF7 | (8 * (v267 != 0));
        }
        v268 = objc_msgSend_objectForKey_(v4, v265, @"EnabledOnlyWhenPaired", v266);
        if (objc_msgSend_BOOLValue(v268, v269, v270, v271)) {
          char v272 = 16;
        }
        else {
          char v272 = 0;
        }
        *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xEF | v272;

        v275 = objc_msgSend_objectForKey_(v4, v273, @"forceHTTPQueries", v274);
        if (objc_msgSend_BOOLValue(v275, v276, v277, v278)) {
          char v279 = 32;
        }
        else {
          char v279 = 0;
        }
        *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xDF | v279;

        v282 = objc_msgSend_objectForKey_(v4, v280, @"WantsRemoteErrors", v281);
        if (objc_msgSend_BOOLValue(v282, v283, v284, v285)) {
          char v286 = 64;
        }
        else {
          char v286 = 0;
        }
        *((unsigned char *)v6 + 46) = *((unsigned char *)v6 + 46) & 0xBF | v286;

        v289 = objc_msgSend_objectForKey_(v4, v287, @"UseTransportZone", v288);
        if (objc_msgSend_BOOLValue(v289, v290, v291, v292)) {
          char v293 = 0x80;
        }
        else {
          char v293 = 0;
        }
        *((unsigned char *)v6 + 46) = v293 & 0x80 | *((unsigned char *)v6 + 46) & 0x7F;

        v296 = objc_msgSend_objectForKey_(v4, v294, @"DontFilterSelfMessagesForUnknownDevice", v295);
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xFE | objc_msgSend_BOOLValue(v296, v297, v298, v299);

        v302 = objc_msgSend_objectForKey_(v4, v300, @"PassThroughMessagesFromStorage", v301);
        if (objc_msgSend_BOOLValue(v302, v303, v304, v305)) {
          char v306 = 2;
        }
        else {
          char v306 = 0;
        }
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xFD | v306;

        v309 = objc_msgSend_objectForKey_(v4, v307, @"PushToWakeDisabled", v308);
        if (objc_msgSend_BOOLValue(v309, v310, v311, v312)) {
          char v313 = 4;
        }
        else {
          char v313 = 0;
        }
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xFB | v313;

        v316 = objc_msgSend_objectForKey_(v4, v314, @"DisableOnLowRAMDevice", v315);
        if (objc_msgSend_BOOLValue(v316, v317, v318, v319)) {
          char v320 = 8;
        }
        else {
          char v320 = 0;
        }
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xF7 | v320;

        if (v6->_adHocServiceType == 2)
        {
          *((unsigned char *)v6 + 43) |= 4u;
        }
        else
        {
          v323 = objc_msgSend_objectForKey_(v4, v321, @"AllowMagnetDelivery", v322);
          if (objc_msgSend_BOOLValue(v323, v324, v325, v326)) {
            LOBYTE(v327) = 4;
          }
          else {
            int v327 = (*((unsigned __int8 *)v6 + 44) >> 5) & 4;
          }
          *((unsigned char *)v6 + 43) = *((unsigned char *)v6 + 43) & 0xFB | v327;
        }
        v328 = objc_msgSend_objectForKey_(v4, v321, @"HoldMessagesUntilClassCUnlock", v322);
        if (objc_msgSend_BOOLValue(v328, v329, v330, v331)) {
          char v332 = 4;
        }
        else {
          char v332 = 0;
        }
        *((unsigned char *)v6 + 44) = *((unsigned char *)v6 + 44) & 0xFB | v332;

        v335 = objc_msgSend_objectForKey_(v4, v333, @"WantsPendingMessageUpdates", v334);
        if (objc_msgSend_BOOLValue(v335, v336, v337, v338)) {
          char v339 = 16;
        }
        else {
          char v339 = 0;
        }
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xEF | v339;

        v342 = objc_msgSend_objectForKey_(v4, v340, @"WantsPendingResourceUpdates", v341);
        if (objc_msgSend_BOOLValue(v342, v343, v344, v345)) {
          char v346 = 64;
        }
        else {
          char v346 = 0;
        }
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xBF | v346;

        v349 = objc_msgSend_objectForKey_(v4, v347, @"CrossAccountMessages", v348);
        if (objc_msgSend_BOOLValue(v349, v350, v351, v352)) {
          char v353 = 2;
        }
        else {
          char v353 = 0;
        }
        *((unsigned char *)v6 + 48) = *((unsigned char *)v6 + 48) & 0xFD | v353;

        v356 = objc_msgSend_objectForKey_(v4, v354, @"BlockRemoteTimeouts", v355);
        if (objc_msgSend_BOOLValue(v356, v357, v358, v359)) {
          char v360 = 4;
        }
        else {
          char v360 = 0;
        }
        *((unsigned char *)v6 + 48) = *((unsigned char *)v6 + 48) & 0xFB | v360;

        v363 = objc_msgSend_objectForKey_(v4, v361, @"AllowWakingMessages", v362);
        if (objc_msgSend_BOOLValue(v363, v364, v365, v366)) {
          char v367 = 8;
        }
        else {
          char v367 = 0;
        }
        *((unsigned char *)v6 + 48) = *((unsigned char *)v6 + 48) & 0xF7 | v367;

        v370 = objc_msgSend_objectForKey_(v4, v368, @"AllowUrgentMessages", v369);
        if (objc_msgSend_BOOLValue(v370, v371, v372, v373)) {
          char v374 = 16;
        }
        else {
          char v374 = 0;
        }
        *((unsigned char *)v6 + 48) = *((unsigned char *)v6 + 48) & 0xEF | v374;

        v377 = objc_msgSend_objectForKey_(v4, v375, @"PrototypingOnly", v376);
        if (objc_msgSend_BOOLValue(v377, v378, v379, v380)) {
          char v381 = 32;
        }
        else {
          char v381 = 0;
        }
        *((unsigned char *)v6 + 48) = *((unsigned char *)v6 + 48) & 0xDF | v381;

        v384 = objc_msgSend_objectForKey_(v4, v382, @"IsFamilyService", v383);
        if (objc_msgSend_BOOLValue(v384, v385, v386, v387)) {
          char v388 = 64;
        }
        else {
          char v388 = 0;
        }
        *((unsigned char *)v6 + 48) = *((unsigned char *)v6 + 48) & 0xBF | v388;

        v391 = objc_msgSend_objectForKey_(v4, v389, @"IsInvitationService", v390);
        if (objc_msgSend_BOOLValue(v391, v392, v393, v394)) {
          char v395 = 0x80;
        }
        else {
          char v395 = 0;
        }
        *((unsigned char *)v6 + 48) = v395 & 0x80 | *((unsigned char *)v6 + 48) & 0x7F;

        v398 = objc_msgSend_objectForKey_(v4, v396, @"HadStandalonePreference", v397);
        if (objc_msgSend_BOOLValue(v398, v399, v400, v401)) {
          char v402 = 2;
        }
        else {
          char v402 = 0;
        }
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xFD | v402;

        v405 = objc_msgSend_objectForKey_(v4, v403, @"RestrictedLogging", v404);
        if (objc_msgSend_BOOLValue(v405, v406, v407, v408)) {
          char v409 = 4;
        }
        else {
          char v409 = 0;
        }
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xFB | v409;

        v412 = objc_msgSend_objectForKey_(v4, v410, @"FirewallAutoEnroll", v411);
        if (objc_msgSend_BOOLValue(v412, v413, v414, v415)) {
          char v416 = 8;
        }
        else {
          char v416 = 0;
        }
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xF7 | v416;

        v419 = objc_msgSend_objectForKey_(v4, v417, @"DisableFirewall", v418);
        if (objc_msgSend_BOOLValue(v419, v420, v421, v422)) {
          char v423 = 16;
        }
        else {
          char v423 = 0;
        }
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xEF | v423;

        v426 = objc_msgSend_objectForKey_(v4, v424, @"SupportsOfflineDelivery", v425);
        if (objc_msgSend_BOOLValue(v426, v427, v428, v429)) {
          char v430 = 0x80;
        }
        else {
          char v430 = 0;
        }
        *((unsigned char *)v6 + 49) = v430 & 0x80 | *((unsigned char *)v6 + 49) & 0x7F;

        v433 = objc_msgSend_objectForKey_(v4, v431, @"ApplicationKeyIndex", v432);
        int v437 = objc_msgSend_unsignedIntValue(v433, v434, v435, v436);
        if (v437)
        {
          if (objc_msgSend_unsignedIntValue(v433, v438, v439, v440) > 1) {
            LOBYTE(v437) = 0;
          }
          else {
            LOBYTE(v437) = objc_msgSend_unsignedIntValue(v433, v438, v441, v440);
          }
        }
        v6->_applicationKeyIndex = v437;
        v442 = objc_msgSend_objectForKey_(v4, v438, @"KTRegistrationDataIndex", v440);
        int v446 = objc_msgSend_unsignedIntValue(v442, v443, v444, v445);
        if (v446)
        {
          if (objc_msgSend_unsignedIntValue(v442, v447, v448, v449) > 3) {
            LOBYTE(v446) = 0;
          }
          else {
            LOBYTE(v446) = objc_msgSend_unsignedIntValue(v442, v447, v450, v449);
          }
        }
        v6->_ktRegistrationDataIndex = v446;
        v451 = objc_msgSend_objectForKey_(v4, v447, @"TinkerMessagingOnly", v449);
        if (objc_msgSend_BOOLValue(v451, v452, v453, v454)) {
          char v455 = 0x80;
        }
        else {
          char v455 = 0;
        }
        *((unsigned char *)v6 + 47) = v455 & 0x80 | *((unsigned char *)v6 + 47) & 0x7F;

        v458 = objc_msgSend_objectForKey_(v4, v456, @"DefaultSendModeNormal", v457);
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xFE | objc_msgSend_BOOLValue(v458, v459, v460, v461);

        v6->_linkedDeviceRelationships = 1;
        v464 = objc_msgSend_objectForKey_(v4, v462, @"LinkedDeviceRelationships", v463);
        long long v537 = 0u;
        long long v538 = 0u;
        long long v539 = 0u;
        long long v540 = 0u;
        uint64_t v466 = objc_msgSend_countByEnumeratingWithState_objects_count_(v464, v465, (uint64_t)&v537, 0.0, v542, 16);
        if (v466)
        {
          uint64_t v470 = v466;
          uint64_t v471 = *(void *)v538;
          do
          {
            for (uint64_t i = 0; i != v470; ++i)
            {
              if (*(void *)v538 != v471) {
                objc_enumerationMutation(v464);
              }
              v6->_linkedDeviceRelationships |= objc_msgSend_intValue(*(void **)(*((void *)&v537 + 1) + 8 * i), v467, v468, v469);
            }
            uint64_t v470 = objc_msgSend_countByEnumeratingWithState_objects_count_(v464, v467, (uint64_t)&v537, v469, v542, 16);
          }
          while (v470);
        }
        v473 = objc_msgSend_objectForKey_(v4, v467, @"EnabledOnlyOnStandaloneDevices", v469);
        if (objc_msgSend_BOOLValue(v473, v474, v475, v476)) {
          char v477 = 64;
        }
        else {
          char v477 = 0;
        }
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xBF | v477;

        v480 = objc_msgSend_objectForKey_(v4, v478, @"DisabledOnTinkerWatch", v479);
        if (objc_msgSend_BOOLValue(v480, v481, v482, v483)) {
          char v484 = 32;
        }
        else {
          char v484 = 0;
        }
        *((unsigned char *)v6 + 47) = *((unsigned char *)v6 + 47) & 0xDF | v484;

        v487 = objc_msgSend_objectForKey_(v4, v485, @"DuetIdentifiers", v486);
        uint64_t v488 = sub_19D9C256C(v487);
        duetIdentifiersIndices = v6->_duetIdentifiersIndices;
        v6->_duetIdentifiersIndices = (NSSet *)v488;

        v492 = objc_msgSend_objectForKey_(v4, v490, @"MinCompatibilityVersion", v491);
        v496 = v492;
        if (v492) {
          LOBYTE(v492) = objc_msgSend_unsignedCharValue(v492, v493, v494, v495);
        }
        v6->_minCompatibilityVersion = v492;
        v497 = objc_msgSend_objectForKey_(v4, v493, @"AccountSyncMinCompatibilityVersion", v495);
        v501 = v497;
        if (v497) {
          LOBYTE(v497) = objc_msgSend_unsignedCharValue(v497, v498, v499, v500);
        }
        v6->_accountSyncMinCompatibilityVersion = v497;
        uint64_t v502 = objc_msgSend_objectForKey_(v4, v498, @"QueryServiceName", v500);
        queryService = v6->_queryService;
        v6->_queryService = (NSString *)v502;

        if (!v6->_queryService) {
          objc_storeStrong((id *)&v6->_queryService, v6->_pushTopic);
        }
        uint64_t v506 = objc_msgSend_objectForKey_(v4, v504, @"LinkedServices", v505);
        linkedServiceNames = v6->_linkedServiceNames;
        v6->_linkedServiceNames = (NSArray *)v506;

        uint64_t v510 = objc_msgSend_objectForKey_(v4, v508, @"QueryLinkedServices", v509);
        queryLinkedServiceNames = v6->_queryLinkedServiceNames;
        v6->_queryLinkedServiceNames = (NSArray *)v510;

        v514 = objc_msgSend_objectForKey_(v4, v512, @"IsUserDrivenRealTime", v513);
        if (objc_msgSend_BOOLValue(v514, v515, v516, v517)) {
          char v518 = 32;
        }
        else {
          char v518 = 0;
        }
        *((unsigned char *)v6 + 49) = *((unsigned char *)v6 + 49) & 0xDF | v518;

        v521 = objc_msgSend_objectForKey_(v4, v519, @"IsUltraConstrainedPushAllowed", v520);
        *((unsigned char *)v6 + 50) = *((unsigned char *)v6 + 50) & 0xFE | objc_msgSend_BOOLValue(v521, v522, v523, v524);

        v527 = objc_msgSend_objectForKey_(v4, v525, @"RequiresPinnedIdentity", v526);
        if (objc_msgSend_BOOLValue(v527, v528, v529, v530)) {
          char v531 = 2;
        }
        else {
          char v531 = 0;
        }
        *((unsigned char *)v6 + 50) = *((unsigned char *)v6 + 50) & 0xFD | v531;

        goto LABEL_186;
      }
      *((unsigned char *)v6 + 48) |= 1u;
      v51 = v45;
    }
    launchNotification = v6->_launchNotification;
    v6->_launchNotification = v51;

    goto LABEL_11;
  }
  _IMWarn();
  v52 = 0;
LABEL_187:

  return v52;
}

- (id)_stringToUseGivenName:(id)a3
{
  v5 = (NSString *)a3;
  if (!v5
    || (int isEqualToString = objc_msgSend_isEqualToString_(self->_identifier, v4, (uint64_t)v5, v6),
        identifier = v5,
        isEqualToString))
  {
    identifier = self->_identifier;
  }
  v9 = identifier;

  return v9;
}

- (BOOL)wantsTinkerDevices
{
  return (self->_linkedDeviceRelationships >> 1) & 1;
}

- (BOOL)isInvitationService
{
  return *((unsigned __int8 *)self + 48) >> 7;
}

- (BOOL)isFamilyService
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (unsigned)adHocServiceType
{
  return self->_adHocServiceType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (id)_resolveShouldUseMachNotification:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend__identifierWithProtocolAndMachServiceSuffix(self, v5, v6, v7);
  char isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)v4, v10);

  if (isEqualToString) {
    id v12 = 0;
  }
  else {
    id v12 = v4;
  }

  return v12;
}

- (id)_identifierWithProtocolAndMachServiceSuffix
{
  return (id)objc_msgSend_stringByAppendingString_(self->_identifier, a2, @"-idswake", v2);
}

- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_sharedDefaults(MEMORY[0x1E4F6C408], a2, a3, v3);
  uint64_t v9 = objc_msgSend_numberWithBool_(NSNumber, v7, v4, v8);
  v13 = objc_msgSend_preferencesDomain(self, v10, v11, v12);
  objc_msgSend_setValue_forKey_appID_(v6, v14, v9, v15, @"needsLaunchOnNearbyDevicesChanged", v13);

  objc_msgSend_sharedDefaults(MEMORY[0x1E4F6C408], v16, v17, v18);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = objc_msgSend_preferencesDomain(self, v19, v20, v21);
  objc_msgSend_synchronizeAppID_(v25, v23, (uint64_t)v22, v24);
}

- (BOOL)needsLaunchOnNearbyDevicesChanged
{
  int v5 = objc_msgSend_allowLaunchOnNearbyDevicesChanged(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v9 = objc_msgSend_sharedDefaults(MEMORY[0x1E4F6C408], v6, v7, v8);
    v13 = objc_msgSend_preferencesDomain(self, v10, v11, v12);
    v16 = objc_msgSend_copyValueForKey_appID_(v9, v14, @"needsLaunchOnNearbyDevicesChanged", v15, v13);
    char v20 = objc_msgSend_BOOLValue(v16, v17, v18, v19);

    LOBYTE(v5) = v20;
  }
  return v5;
}

- (BOOL)allowLocalDelivery
{
  if (objc_msgSend_allowWiProxDelivery(self, a2, v2, v3)) {
    return 1;
  }
  return MEMORY[0x1F4181798](self, sel_allowMagnetDelivery, v5, v6);
}

- (NSString)preferencesDomain
{
  BOOL v4 = NSString;
  uint64_t v5 = qword_1E944E018;
  double v6 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v4, v7, @"%@.%@", v8, v5, v6);

  return (NSString *)v9;
}

- (NSString)legacyPreferencesDomain
{
  uint64_t v5 = objc_msgSend_legacyIdentifier(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = qword_1E944E018;
    uint64_t v11 = objc_msgSend_legacyIdentifier(self, v6, v7, v8);
    double v14 = objc_msgSend_stringWithFormat_(v9, v12, @"%@.%@", v13, v10, v11);
  }
  else
  {
    double v14 = 0;
  }
  return (NSString *)v14;
}

- (id)description
{
  uint64_t v5 = NSString;
  double v6 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_displayName(self, v7, v8, v9);
  double v14 = objc_msgSend_pushTopic(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_serviceName(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_protocolName(self, v19, v20, v21);
  id v25 = objc_msgSend_stringWithFormat_(v5, v23, @"IDSServiceProperties: %p [Identifier: %@ Display Name: %@ Topic: %@   Service: %@   Protocol: %@]", v24, self, v6, v10, v14, v18, v22);

  return v25;
}

- (NSArray)duetIdentifiers
{
  v15[1] = *MEMORY[0x1E4F143B8];
  duetIdentifiersIndices = self->_duetIdentifiersIndices;
  if (duetIdentifiersIndices)
  {
    double v6 = sub_19DA19040(duetIdentifiersIndices);
  }
  else
  {
    double v9 = objc_msgSend_serviceName(self, a2, v2, v3);
    if (v9)
    {
      uint64_t v11 = objc_msgSend_serviceName(self, v7, v8, v10);
      v15[0] = v11;
      double v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v15, v13, 1);
    }
    else
    {
      double v6 = 0;
    }
  }
  return (NSArray *)v6;
}

- (unint64_t)minCompatibilityVersion
{
  return self->_minCompatibilityVersion;
}

- (unint64_t)accountSyncMinCompatibilityVersion
{
  return self->_accountSyncMinCompatibilityVersion;
}

- (NSString)launchDarwinNotification
{
  if (*((unsigned char *)self + 48)) {
    return self->_launchNotification;
  }
  else {
    return (NSString *)0;
  }
}

- (NSString)launchMachServiceNotification
{
  if (*((unsigned char *)self + 48))
  {
    launchNotification = 0;
  }
  else
  {
    launchNotification = self->_launchNotification;
    if (!launchNotification)
    {
      objc_msgSend__identifierWithProtocolAndMachServiceSuffix(self, a2, v2, v3);
      uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  uint64_t v5 = launchNotification;
LABEL_6:
  return v5;
}

- (NSSet)allowedTrafficClasses
{
  if (self->_allowedTrafficClassesIndices)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    BOOL v4 = sub_19DA19040(self->_allowedTrafficClassesIndices);
    uint64_t v7 = objc_msgSend_initWithArray_(v3, v5, (uint64_t)v4, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (NSSet *)v7;
}

- (BOOL)isFirewallEnabled
{
  int v5 = objc_msgSend_allowCrossAccountMessages(self, a2, v2, v3);
  if (v5) {
    LOBYTE(v5) = (*((unsigned char *)self + 49) & 0x10) == 0 && (*((unsigned char *)self + 48) & 0x40) == 0 && *((char *)self + 47) >= 0;
  }
  return v5;
}

- (BOOL)disallowFirewallAutoEnroll
{
  if ((*((unsigned char *)self + 49) & 8) != 0) {
    return 1;
  }
  else {
    return objc_msgSend_isFirewallEnabled(self, a2, v2, v3) ^ 1;
  }
}

- (BOOL)shouldAllowLiveMessageDelivery
{
  return (*((unsigned __int8 *)self + 46) >> 3) & 1;
}

- (NSArray)allInterestedQueryServices
{
  v16[1] = *MEMORY[0x1E4F143B8];
  queryLinkedServiceNames = self->_queryLinkedServiceNames;
  if (queryLinkedServiceNames || self->_queryService)
  {
    if (objc_msgSend_count(queryLinkedServiceNames, a2, v2, v3))
    {
      uint64_t v8 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v6, (uint64_t)self->_queryService, v7);
      objc_msgSend_addObjectsFromArray_(v8, v9, (uint64_t)self->_queryLinkedServiceNames, v10);
      double v14 = objc_msgSend_copy(v8, v11, v12, v13);
    }
    else
    {
      v16[0] = self->_queryService;
      double v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v16, v7, 1);
    }
  }
  else
  {
    double v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v14;
}

- (unsigned)constraintType
{
  return self->_constraintType;
}

- (unsigned)ktRegistrationDataIndex
{
  return self->_ktRegistrationDataIndex;
}

- (unsigned)applicationKeyIndex
{
  return self->_applicationKeyIndex;
}

- (unsigned)firewallNotificationStyle
{
  return self->_firewallNotificationStyle;
}

- (unsigned)firewallNotificationRateLimitType
{
  return self->_firewallNotificationRateLimitType;
}

- (int64_t)linkedDeviceRelationships
{
  return self->_linkedDeviceRelationships;
}

- (unsigned)controlCategory
{
  return self->_controlCategory;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(IDSServiceProperties);
  objc_msgSend_setServiceName_(v4, v5, (uint64_t)self->_serviceName, v6);
  objc_msgSend_setProtocolName_(v4, v7, (uint64_t)self->_protocolName, v8);
  objc_msgSend_setDisplayName_(v4, v9, (uint64_t)self->_displayName, v10);
  objc_msgSend_setIdentifier_(v4, v11, (uint64_t)self->_identifier, v12);
  objc_msgSend_setLegacyIdentifier_(v4, v13, (uint64_t)self->_legacyIdentifier, v14);
  objc_msgSend_setPushTopic_(v4, v15, (uint64_t)self->_pushTopic, v16);
  objc_storeStrong((id *)&v4->_launchNotification, self->_launchNotification);
  *((unsigned char *)v4 + 48) = *((unsigned char *)v4 + 48) & 0xFE | *((unsigned char *)self + 48) & 1;
  objc_msgSend_setSuperService_(v4, v17, (uint64_t)self->_superService, v18);
  objc_msgSend_setDataUsageBundleID_(v4, v19, (uint64_t)self->_dataUsageBundleID, v20);
  v4->_adHocServiceType = self->_adHocServiceType;
  v4->_controlCategory = self->_controlCategory;
  v4->_constraintType = self->_constraintType;
  v4->_firewallNotificationStyle = self->_firewallNotificationStyle;
  v4->_firewallNotificationRateLimitType = self->_firewallNotificationRateLimitType;
  objc_storeStrong((id *)&v4->_allowedTrafficClassesIndices, self->_allowedTrafficClassesIndices);
  int v21 = *((unsigned char *)v4 + 43) & 0xFD | (2 * ((*((unsigned __int8 *)self + 43) >> 1) & 1));
  *((unsigned char *)v4 + 43) = v21;
  unsigned int v22 = v21 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 43) >> 4) & 1));
  *((unsigned char *)v4 + 43) = v22;
  unsigned int v23 = v22 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 43) >> 5) & 1));
  *((unsigned char *)v4 + 43) = v23;
  LOBYTE(v23) = v23 & 0xBF | (((*((unsigned char *)self + 43) & 0x40) != 0) << 6);
  *((unsigned char *)v4 + 43) = v23;
  char v24 = *((unsigned char *)self + 43) & 0x80 | v23 & 0x7F;
  *((unsigned char *)v4 + 43) = v24;
  int v25 = *((unsigned char *)v4 + 48) & 0xFD | (2 * ((*((unsigned __int8 *)self + 48) >> 1) & 1));
  *((unsigned char *)v4 + 48) = v25;
  unsigned int v26 = v25 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 48) >> 2) & 1));
  *((unsigned char *)v4 + 48) = v26;
  unsigned int v27 = v26 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 48) >> 3) & 1));
  *((unsigned char *)v4 + 48) = v27;
  unsigned int v28 = v27 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 48) >> 4) & 1));
  *((unsigned char *)v4 + 48) = v28;
  unsigned int v29 = v28 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 48) >> 5) & 1));
  *((unsigned char *)v4 + 48) = v29;
  LOBYTE(v29) = v29 & 0xBF | (((*((unsigned char *)self + 48) & 0x40) != 0) << 6);
  *((unsigned char *)v4 + 48) = v29;
  *((unsigned char *)v4 + 48) = *((unsigned char *)self + 48) & 0x80 | v29 & 0x7F;
  int v30 = *((unsigned char *)v4 + 44) & 0xFE | *((unsigned char *)self + 44) & 1;
  *((unsigned char *)v4 + 44) = v30;
  unsigned int v31 = v30 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 44) >> 1) & 1));
  *((unsigned char *)v4 + 44) = v31;
  char v32 = v24 & 0xF7 | (8 * ((*((unsigned char *)self + 43) & 8) != 0));
  *((unsigned char *)v4 + 43) = v32;
  unsigned int v33 = v31 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 44) >> 3) & 1));
  *((unsigned char *)v4 + 44) = v33;
  unsigned int v34 = v33 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 44) >> 4) & 1));
  *((unsigned char *)v4 + 44) = v34;
  unsigned int v35 = v34 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 44) >> 5) & 1));
  *((unsigned char *)v4 + 44) = v35;
  LOBYTE(v35) = v35 & 0xBF | (((*((unsigned char *)self + 44) & 0x40) != 0) << 6);
  *((unsigned char *)v4 + 44) = v35;
  LOBYTE(v23) = *((unsigned char *)self + 44) & 0x80 | v35 & 0x7F;
  *((unsigned char *)v4 + 44) = v23;
  int v36 = *((unsigned char *)v4 + 45) & 0xFE | *((unsigned char *)self + 45) & 1;
  *((unsigned char *)v4 + 45) = v36;
  unsigned int v37 = v36 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 45) >> 1) & 1));
  *((unsigned char *)v4 + 45) = v37;
  v4->_allowLaunchOnNearbyDevicesChanged = self->_allowLaunchOnNearbyDevicesChanged;
  unsigned int v38 = v37 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 45) >> 2) & 1));
  *((unsigned char *)v4 + 45) = v38;
  unsigned int v39 = v38 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 45) >> 3) & 1));
  *((unsigned char *)v4 + 45) = v39;
  unsigned int v40 = v39 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 45) >> 4) & 1));
  *((unsigned char *)v4 + 45) = v40;
  unsigned int v41 = v40 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 45) >> 5) & 1));
  *((unsigned char *)v4 + 45) = v41;
  LOBYTE(v41) = v41 & 0xBF | (((*((unsigned char *)self + 45) & 0x40) != 0) << 6);
  *((unsigned char *)v4 + 45) = v41;
  *((unsigned char *)v4 + 45) = *((unsigned char *)self + 45) & 0x80 | v41 & 0x7F;
  int v42 = *((unsigned char *)v4 + 46) & 0xFE | *((unsigned char *)self + 46) & 1;
  *((unsigned char *)v4 + 46) = v42;
  unsigned int v43 = v42 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 46) >> 1) & 1));
  *((unsigned char *)v4 + 46) = v43;
  unsigned int v44 = v43 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 46) >> 2) & 1));
  *((unsigned char *)v4 + 46) = v44;
  unsigned int v45 = v44 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 46) >> 4) & 1));
  *((unsigned char *)v4 + 46) = v45;
  unsigned int v46 = v45 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 46) >> 5) & 1));
  *((unsigned char *)v4 + 46) = v46;
  LOBYTE(v46) = v46 & 0xBF | (((*((unsigned char *)self + 46) & 0x40) != 0) << 6);
  *((unsigned char *)v4 + 46) = v46;
  LOBYTE(v35) = *((unsigned char *)self + 46) & 0x80 | v46 & 0x7F;
  *((unsigned char *)v4 + 46) = v35;
  int v47 = *((unsigned char *)v4 + 47) & 0xFE | *((unsigned char *)self + 47) & 1;
  *((unsigned char *)v4 + 47) = v47;
  unsigned int v48 = v47 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 47) >> 1) & 1));
  *((unsigned char *)v4 + 47) = v48;
  *((unsigned char *)v4 + 43) = *((unsigned char *)self + 43) & 4 | v32 & 0xFB;
  *((unsigned char *)v4 + 44) = *((unsigned char *)self + 44) & 4 | v23 & 0xFB;
  *((unsigned char *)v4 + 46) = *((unsigned char *)self + 46) & 8 | v35 & 0xF7;
  unsigned int v49 = v48 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 47) >> 3) & 1));
  *((unsigned char *)v4 + 47) = v49;
  unsigned int v50 = v49 & 0xFFFFFFEF | (16 * ((*((unsigned __int8 *)self + 47) >> 4) & 1));
  *((unsigned char *)v4 + 47) = v50;
  v4->_linkedDeviceRelationships = self->_linkedDeviceRelationships;
  unsigned int v51 = v50 & 0xFFFFFFBF | (((*((unsigned __int8 *)self + 47) >> 6) & 1) << 6);
  *((unsigned char *)v4 + 47) = v51;
  int v52 = *((unsigned char *)self + 47) & 0x80 | v51 & 0x7F;
  *((unsigned char *)v4 + 47) = v52;
  unsigned int v53 = v52 & 0xFFFFFFDF | (32 * ((*((unsigned __int8 *)self + 47) >> 5) & 1));
  *((unsigned char *)v4 + 47) = v53;
  *((unsigned char *)v4 + 47) = v53 & 0xFB | *((unsigned char *)self + 47) & 4;
  objc_storeStrong((id *)&v4->_duetIdentifiersIndices, self->_duetIdentifiersIndices);
  v4->_minCompatibilityVersion = self->_minCompatibilityVersion;
  v4->_accountSyncMinCompatibilityVersion = self->_accountSyncMinCompatibilityVersion;
  v4->_dataProtectionClass = self->_dataProtectionClass;
  objc_msgSend_setQueryService_(v4, v54, (uint64_t)self->_queryService, v55);
  objc_msgSend_setLinkedServiceNames_(v4, v56, (uint64_t)self->_linkedServiceNames, v57);
  objc_msgSend_setQueryLinkedServiceNames_(v4, v58, (uint64_t)self->_queryLinkedServiceNames, v59);
  int v60 = *((unsigned char *)v4 + 49) & 0xFE | *((unsigned char *)self + 49) & 1;
  *((unsigned char *)v4 + 49) = v60;
  v4->_applicationKeyIndex = self->_applicationKeyIndex;
  v4->_ktRegistrationDataIndex = self->_ktRegistrationDataIndex;
  unsigned int v61 = v60 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 49) >> 3) & 1));
  *((unsigned char *)v4 + 49) = v61;
  LOBYTE(v61) = v61 & 0xEF | (16 * ((*((unsigned char *)self + 49) & 0x10) != 0));
  *((unsigned char *)v4 + 49) = v61;
  char v62 = *((unsigned char *)self + 49) & 0x80 | v61 & 0x7F;
  *((unsigned char *)v4 + 49) = v62;
  *((unsigned char *)v4 + 49) = v62 & 0xDF | *((unsigned char *)self + 49) & 0x20;
  LOBYTE(v61) = *((unsigned char *)v4 + 50) & 0xFE | *((unsigned char *)self + 50) & 1;
  *((unsigned char *)v4 + 50) = v61;
  *((unsigned char *)v4 + 50) = v61 & 0xFD | *((unsigned char *)self + 50) & 2;
  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (void)setServiceName:(id)a3
{
}

- (NSString)queryService
{
  return self->_queryService;
}

- (void)setQueryService:(id)a3
{
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
}

- (NSString)superService
{
  return self->_superService;
}

- (void)setSuperService:(id)a3
{
}

- (NSString)dataUsageBundleID
{
  return self->_dataUsageBundleID;
}

- (void)setDataUsageBundleID:(id)a3
{
}

- (BOOL)allowWiProxDelivery
{
  return (*((unsigned __int8 *)self + 43) >> 1) & 1;
}

- (BOOL)allowMagnetDelivery
{
  return (*((unsigned __int8 *)self + 43) >> 2) & 1;
}

- (BOOL)shouldShowUsageNotifications
{
  return (*((unsigned __int8 *)self + 43) >> 3) & 1;
}

- (BOOL)allowPartialSendsToSucceed
{
  return (*((unsigned __int8 *)self + 43) >> 4) & 1;
}

- (BOOL)sendOnePerToken
{
  return (*((unsigned __int8 *)self + 43) >> 6) & 1;
}

- (BOOL)wantsPhoneNumberAccount
{
  return *((unsigned __int8 *)self + 43) >> 7;
}

- (BOOL)iCloudBasedService
{
  return *((unsigned char *)self + 44) & 1;
}

- (BOOL)tunnelService
{
  return (*((unsigned __int8 *)self + 44) >> 1) & 1;
}

- (BOOL)holdsMessagesUntilFirstUnlock
{
  return (*((unsigned __int8 *)self + 44) >> 2) & 1;
}

- (BOOL)shouldAutoRegisterAllHandles
{
  return (*((unsigned __int8 *)self + 44) >> 3) & 1;
}

- (BOOL)shouldRegisterUsingDSHandle
{
  return (*((unsigned __int8 *)self + 44) >> 4) & 1;
}

- (BOOL)shouldSyncAccounts
{
  return (*((unsigned __int8 *)self + 44) >> 5) & 1;
}

- (BOOL)shouldNotSyncPhoneNumberAccounts
{
  return (*((unsigned __int8 *)self + 44) >> 6) & 1;
}

- (BOOL)shouldAllowProxyDelivery
{
  return *((unsigned __int8 *)self + 44) >> 7;
}

- (BOOL)wantsLocalReflectedSend
{
  return *((unsigned char *)self + 45) & 1;
}

- (BOOL)wantsNetworkAvailableHint
{
  return (*((unsigned __int8 *)self + 45) >> 1) & 1;
}

- (BOOL)allowLaunchOnNearbyDevicesChanged
{
  return self->_allowLaunchOnNearbyDevicesChanged;
}

- (BOOL)watchOnlyService
{
  return (*((unsigned __int8 *)self + 45) >> 2) & 1;
}

- (BOOL)allowsDuplicates
{
  return (*((unsigned __int8 *)self + 45) >> 3) & 1;
}

- (BOOL)useiMessageCallerID
{
  return (*((unsigned __int8 *)self + 45) >> 4) & 1;
}

- (BOOL)useFaceTimeCallerID
{
  return (*((unsigned __int8 *)self + 45) >> 5) & 1;
}

- (BOOL)allowPendingMessagesForInactiveDevice
{
  return (*((unsigned __int8 *)self + 45) >> 6) & 1;
}

- (BOOL)allowSendingMessagesToInactiveDevice
{
  return *((unsigned __int8 *)self + 45) >> 7;
}

- (BOOL)shouldProtectTrafficUsingClassA
{
  return *((unsigned char *)self + 46) & 1;
}

- (BOOL)shouldSilentlyFailMessagesOnSwitch
{
  return (*((unsigned __int8 *)self + 46) >> 1) & 1;
}

- (BOOL)shouldAllowCloudDelivery
{
  return (*((unsigned __int8 *)self + 46) >> 2) & 1;
}

- (BOOL)enabledOnlyWhenPaired
{
  return (*((unsigned __int8 *)self + 46) >> 4) & 1;
}

- (BOOL)forceHTTPQueriesOnly
{
  return (*((unsigned __int8 *)self + 46) >> 5) & 1;
}

- (BOOL)wantsRemoteErrors
{
  return (*((unsigned __int8 *)self + 46) >> 6) & 1;
}

- (BOOL)useTransportZone
{
  return *((unsigned __int8 *)self + 46) >> 7;
}

- (BOOL)dontFilterSelfMessagesForUnknownDevice
{
  return *((unsigned char *)self + 47) & 1;
}

- (BOOL)passThroughMessagesFromStorage
{
  return (*((unsigned __int8 *)self + 47) >> 1) & 1;
}

- (BOOL)pushToWakeDisabled
{
  return (*((unsigned __int8 *)self + 47) >> 2) & 1;
}

- (BOOL)disableOnLowRAMDevice
{
  return (*((unsigned __int8 *)self + 47) >> 3) & 1;
}

- (BOOL)wantsPendingMessageUpdates
{
  return (*((unsigned __int8 *)self + 47) >> 4) & 1;
}

- (BOOL)wantsPendingResourceUpdates
{
  return (*((unsigned __int8 *)self + 49) >> 6) & 1;
}

- (BOOL)allowCrossAccountMessages
{
  return (*((unsigned __int8 *)self + 48) >> 1) & 1;
}

- (BOOL)blockRemoteTimeouts
{
  return (*((unsigned __int8 *)self + 48) >> 2) & 1;
}

- (BOOL)allowWakingMessages
{
  return (*((unsigned __int8 *)self + 48) >> 3) & 1;
}

- (BOOL)allowUrgentMessages
{
  return (*((unsigned __int8 *)self + 48) >> 4) & 1;
}

- (BOOL)prototypingOnly
{
  return (*((unsigned __int8 *)self + 48) >> 5) & 1;
}

- (BOOL)hadStandalonePreferences
{
  return (*((unsigned __int8 *)self + 49) >> 1) & 1;
}

- (BOOL)shouldHaveRestrictedStorage
{
  return (*((unsigned __int8 *)self + 49) >> 2) & 1;
}

- (BOOL)supportsOfflineDelivery
{
  return *((unsigned __int8 *)self + 49) >> 7;
}

- (BOOL)enabledOnlyOnStandaloneDevices
{
  return (*((unsigned __int8 *)self + 47) >> 6) & 1;
}

- (BOOL)tinkerMessagingOnly
{
  return *((unsigned __int8 *)self + 47) >> 7;
}

- (BOOL)disabledOnTinkerWatch
{
  return (*((unsigned __int8 *)self + 47) >> 5) & 1;
}

- (BOOL)isUltraConstrainedPushAllowed
{
  return *((unsigned char *)self + 50) & 1;
}

- (BOOL)requiresPinnedIdentity
{
  return (*((unsigned __int8 *)self + 50) >> 1) & 1;
}

- (NSString)legacyIdentifier
{
  return self->_legacyIdentifier;
}

- (void)setLegacyIdentifier:(id)a3
{
}

- (NSArray)linkedServiceNames
{
  return self->_linkedServiceNames;
}

- (void)setLinkedServiceNames:(id)a3
{
}

- (BOOL)isUserDrivenRealTime
{
  return (*((unsigned __int8 *)self + 49) >> 5) & 1;
}

- (NSArray)queryLinkedServiceNames
{
  return self->_queryLinkedServiceNames;
}

- (void)setQueryLinkedServiceNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLinkedServiceNames, 0);
  objc_storeStrong((id *)&self->_linkedServiceNames, 0);
  objc_storeStrong((id *)&self->_legacyIdentifier, 0);
  objc_storeStrong((id *)&self->_dataUsageBundleID, 0);
  objc_storeStrong((id *)&self->_superService, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_queryService, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_duetIdentifiersIndices, 0);
  objc_storeStrong((id *)&self->_allowedTrafficClassesIndices, 0);
  objc_storeStrong((id *)&self->_launchNotification, 0);
}

@end
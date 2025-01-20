@interface CKEntitlements
- (BOOL)hasAllowAccessDuringBuddyEntitlement;
- (BOOL)hasAllowFakeEntitlementsEntitlement;
- (BOOL)hasAllowOnDeviceAssetStreamingEntitlement;
- (BOOL)hasAllowPackagesEntitlement;
- (BOOL)hasAllowRealTimeOperationsEntitlement;
- (BOOL)hasAllowUnverifiedAccountEntitlement;
- (BOOL)hasAlwaysAllowPublishAssetsEntitlement;
- (BOOL)hasAssetBoundaryKeyEntitlement;
- (BOOL)hasCloudKitSupportServiceEntitlement;
- (BOOL)hasCloudKitSystemServiceEntitlement;
- (BOOL)hasCustomAccountsEntitlement;
- (BOOL)hasDarkWakeNetworkReachabilityEnabledEntitlement;
- (BOOL)hasDisplaysSystemAcceptPromptEntitlement;
- (BOOL)hasEnvironmentEntitlement;
- (BOOL)hasExplicitCodeOperationURLEntitlement;
- (BOOL)hasLightweightPCSEntitlement;
- (BOOL)hasMasqueradingEntitlement;
- (BOOL)hasNetworkSocketDelegateEntitlement;
- (BOOL)hasNonLegacyShareURLEntitlement;
- (BOOL)hasOutOfProcessUIEntitlement;
- (BOOL)hasParticipantPIIEntitlement;
- (BOOL)hasProtectionDataEntitlement;
- (BOOL)hasSPIEntitlement;
- (BOOL)hasSystemLaunchDaemonEntitlement;
- (BOOL)hasTemporaryDeviceCapabilitiesEntitlement;
- (BOOL)hasVFSOpenByIDEntitlement;
- (BOOL)hasZoneProtectionDataEntitlement;
- (BOOL)isBackgroundAssetsExtension;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateEntitlementsWithSDKVersion:(unsigned int)a3 error:(id *)a4;
- (CKEntitlements)initWithAuditToken:(id *)a3 pid:(int)a4;
- (CKEntitlements)initWithCurrentProcess;
- (CKEntitlements)initWithEntitlementsDict:(id)a3;
- (CKEntitlements)initWithSqliteRepresentation:(id)a3;
- (NSArray)cloudServices;
- (NSArray)developmentContainerEnvironmentOverrides;
- (NSDictionary)codeServiceURLByContainerAndServiceEntitlement;
- (NSDictionary)codeServiceURLByServiceEntitlement;
- (NSDictionary)serviceNameForContainerIdentifierMapEntitlement;
- (NSString)applicationBundleID;
- (NSString)apsEnvironmentEntitlement;
- (NSString)associatedApplicationBundleID;
- (NSString)clientPrefixEntitlement;
- (NSString)codeServiceURLEntitlement;
- (NSString)description;
- (id)entitlementsByAddingOverlay:(id)a3;
- (id)sqliteRepresentation;
- (int64_t)containerEnvironment;
- (unint64_t)hash;
- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation CKEntitlements

- (BOOL)isBackgroundAssetsExtension
{
  if (byte_1E9124EF0) {
    BOOL v5 = byte_1E912FED0 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, v2, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, (uint64_t)self, @"CKEntitlements.m", 433, @"This value should only be read in the daemon");
  }

  return sub_18AF2D364(self, @"com.apple.private.cloudkit.isBackgroundAssetsExtension");
}

- (CKEntitlements)initWithSqliteRepresentation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    v10 = objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    id v19 = 0;
    v12 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v11, (uint64_t)v10, 0, &v19);
    id v15 = v19;
    if (v15 || !v12)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v17 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v15;
        _os_log_error_impl(&dword_18AF10000, v17, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKEntitlements: %{public}@", buf, 0xCu);
      }
      v16 = 0;
    }
    else
    {
      self = (CKEntitlements *)(id)objc_msgSend_initWithEntitlementsDict_(self, v13, (uint64_t)v12, v14);
      v16 = self;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CKEntitlements)initWithEntitlementsDict:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKEntitlements;
  v8 = [(CKEntitlements *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_CKDeepCopy(v4, v5, v6, v7);
    entitlementsDict = v8->_entitlementsDict;
    v8->_entitlementsDict = (NSDictionary *)v9;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKEntitlements *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      uint64_t v6 = sub_18AF2E43C(v5);
      uint64_t v7 = sub_18AF2E43C(self);
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = sub_18AF2E43C(v5);
        v10 = sub_18AF2E43C(self);
        int isEqual = objc_msgSend_isEqual_(v9, v11, (uint64_t)v10, v12);

        if (!isEqual) {
          goto LABEL_78;
        }
      }
      v18 = objc_msgSend_applicationBundleID(v5, v14, v15, v16);
      uint64_t v22 = objc_msgSend_applicationBundleID(self, v19, v20, v21);
      if (v18 == (void *)v22)
      {
      }
      else
      {
        v26 = (void *)v22;
        v27 = objc_msgSend_applicationBundleID(v5, v23, v24, v25);
        v31 = objc_msgSend_applicationBundleID(self, v28, v29, v30);
        int v34 = objc_msgSend_isEqual_(v27, v32, (uint64_t)v31, v33);

        if (!v34) {
          goto LABEL_78;
        }
      }
      v38 = objc_msgSend_associatedApplicationBundleID(v5, v35, v36, v37);
      uint64_t v42 = objc_msgSend_associatedApplicationBundleID(self, v39, v40, v41);
      if (v38 == (void *)v42)
      {
      }
      else
      {
        v46 = (void *)v42;
        v47 = objc_msgSend_associatedApplicationBundleID(v5, v43, v44, v45);
        v51 = objc_msgSend_associatedApplicationBundleID(self, v48, v49, v50);
        int v54 = objc_msgSend_isEqual_(v47, v52, (uint64_t)v51, v53);

        if (!v54) {
          goto LABEL_78;
        }
      }
      v58 = objc_msgSend_apsEnvironmentEntitlement(v5, v55, v56, v57);
      uint64_t v62 = objc_msgSend_apsEnvironmentEntitlement(self, v59, v60, v61);
      if (v58 == (void *)v62)
      {
      }
      else
      {
        v66 = (void *)v62;
        v67 = objc_msgSend_apsEnvironmentEntitlement(v5, v63, v64, v65);
        v71 = objc_msgSend_apsEnvironmentEntitlement(self, v68, v69, v70);
        int v74 = objc_msgSend_isEqual_(v67, v72, (uint64_t)v71, v73);

        if (!v74) {
          goto LABEL_78;
        }
      }
      BOOL v75 = sub_18AF2E5CC(v5);
      if (v75 != sub_18AF2E5CC(self)) {
        goto LABEL_78;
      }
      int hasMasqueradingEntitlement = objc_msgSend_hasMasqueradingEntitlement(v5, v76, v77, v78);
      if (hasMasqueradingEntitlement != objc_msgSend_hasMasqueradingEntitlement(self, v80, v81, v82)) {
        goto LABEL_78;
      }
      int hasProtectionDataEntitlement = objc_msgSend_hasProtectionDataEntitlement(v5, v83, v84, v85);
      if (hasProtectionDataEntitlement != objc_msgSend_hasProtectionDataEntitlement(self, v87, v88, v89)) {
        goto LABEL_78;
      }
      int hasZoneProtectionDataEntitlement = objc_msgSend_hasZoneProtectionDataEntitlement(v5, v90, v91, v92);
      if (hasZoneProtectionDataEntitlement != objc_msgSend_hasZoneProtectionDataEntitlement(self, v94, v95, v96))goto LABEL_78; {
      int hasCloudKitSystemServiceEntitlement = objc_msgSend_hasCloudKitSystemServiceEntitlement(v5, v97, v98, v99);
      }
      if (hasCloudKitSystemServiceEntitlement != objc_msgSend_hasCloudKitSystemServiceEntitlement(self, v101, v102, v103))goto LABEL_78; {
      int hasSystemLaunchDaemonEntitlement = objc_msgSend_hasSystemLaunchDaemonEntitlement(v5, v104, v105, v106);
      }
      if (hasSystemLaunchDaemonEntitlement != objc_msgSend_hasSystemLaunchDaemonEntitlement(self, v108, v109, v110))goto LABEL_78; {
      int hasDarkWakeNetworkReachabilityEnabledEntitlement = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v5, v111, v112, v113);
      }
      if (hasDarkWakeNetworkReachabilityEnabledEntitlement != objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(self, v115, v116, v117))goto LABEL_78; {
      int hasAllowAccessDuringBuddyEntitlement = objc_msgSend_hasAllowAccessDuringBuddyEntitlement(v5, v118, v119, v120);
      }
      if (hasAllowAccessDuringBuddyEntitlement != objc_msgSend_hasAllowAccessDuringBuddyEntitlement(self, v122, v123, v124))goto LABEL_78; {
      int hasLightweightPCSEntitlement = objc_msgSend_hasLightweightPCSEntitlement(v5, v125, v126, v127);
      }
      if (hasLightweightPCSEntitlement != objc_msgSend_hasLightweightPCSEntitlement(self, v129, v130, v131))goto LABEL_78; {
      int hasOutOfProcessUIEntitlement = objc_msgSend_hasOutOfProcessUIEntitlement(v5, v132, v133, v134);
      }
      if (hasOutOfProcessUIEntitlement != objc_msgSend_hasOutOfProcessUIEntitlement(self, v136, v137, v138))goto LABEL_78; {
      int hasParticipantPIIEntitlement = objc_msgSend_hasParticipantPIIEntitlement(v5, v139, v140, v141);
      }
      if (hasParticipantPIIEntitlement != objc_msgSend_hasParticipantPIIEntitlement(self, v143, v144, v145))goto LABEL_78; {
      int hasDisplaysSystemAcceptPromptEntitlement = objc_msgSend_hasDisplaysSystemAcceptPromptEntitlement(v5, v146, v147, v148);
      }
      if (hasDisplaysSystemAcceptPromptEntitlement != objc_msgSend_hasDisplaysSystemAcceptPromptEntitlement(self, v150, v151, v152))goto LABEL_78; {
      v156 = objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v5, v153, v154, v155);
      }
      uint64_t v160 = objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(self, v157, v158, v159);
      if (v156 == (void *)v160)
      {
      }
      else
      {
        v164 = (void *)v160;
        v165 = objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(v5, v161, v162, v163);
        v169 = objc_msgSend_serviceNameForContainerIdentifierMapEntitlement(self, v166, v167, v168);
        int v172 = objc_msgSend_isEqual_(v165, v170, (uint64_t)v169, v171);

        if (!v172) {
          goto LABEL_78;
        }
      }
      int hasNonLegacyShareURLEntitlement = objc_msgSend_hasNonLegacyShareURLEntitlement(v5, v173, v174, v175);
      if (hasNonLegacyShareURLEntitlement != objc_msgSend_hasNonLegacyShareURLEntitlement(self, v177, v178, v179))goto LABEL_78; {
      int hasAllowUnverifiedAccountEntitlement = objc_msgSend_hasAllowUnverifiedAccountEntitlement(v5, v180, v181, v182);
      }
      if (hasAllowUnverifiedAccountEntitlement != objc_msgSend_hasAllowUnverifiedAccountEntitlement(self, v184, v185, v186))goto LABEL_78; {
      if (v5)
      }
      {
        unsigned int v190 = sub_18AF2D364(v5, @"com.apple.private.cloudkit.notifyOnAccountWarmup");
        if (self)
        {
          if (v190 != sub_18AF2D364(self, @"com.apple.private.cloudkit.notifyOnAccountWarmup")) {
            goto LABEL_78;
          }
        }
        else if (v190)
        {
          goto LABEL_78;
        }
      }
      else if (self {
             && (sub_18AF2D364(self, @"com.apple.private.cloudkit.notifyOnAccountWarmup") & 1) != 0)
      }
      {
        goto LABEL_78;
      }
      int hasAllowRealTimeOperationsEntitlement = objc_msgSend_hasAllowRealTimeOperationsEntitlement(v5, v187, v188, v189);
      if (hasAllowRealTimeOperationsEntitlement != objc_msgSend_hasAllowRealTimeOperationsEntitlement(self, v192, v193, v194))goto LABEL_78; {
      int hasExplicitCodeOperationURLEntitlement = objc_msgSend_hasExplicitCodeOperationURLEntitlement(v5, v195, v196, v197);
      }
      if (hasExplicitCodeOperationURLEntitlement != objc_msgSend_hasExplicitCodeOperationURLEntitlement(self, v199, v200, v201))goto LABEL_78; {
      v205 = objc_msgSend_codeServiceURLEntitlement(v5, v202, v203, v204);
      }
      uint64_t v209 = objc_msgSend_codeServiceURLEntitlement(self, v206, v207, v208);
      if (v205 == (void *)v209)
      {
      }
      else
      {
        v213 = (void *)v209;
        v214 = objc_msgSend_codeServiceURLEntitlement(v5, v210, v211, v212);
        v218 = objc_msgSend_codeServiceURLEntitlement(self, v215, v216, v217);
        int v221 = objc_msgSend_isEqual_(v214, v219, (uint64_t)v218, v220);

        if (!v221) {
          goto LABEL_78;
        }
      }
      v225 = objc_msgSend_codeServiceURLByServiceEntitlement(v5, v222, v223, v224);
      uint64_t v229 = objc_msgSend_codeServiceURLByServiceEntitlement(self, v226, v227, v228);
      if (v225 == (void *)v229)
      {
      }
      else
      {
        v233 = (void *)v229;
        v234 = objc_msgSend_codeServiceURLByServiceEntitlement(v5, v230, v231, v232);
        v238 = objc_msgSend_codeServiceURLByServiceEntitlement(self, v235, v236, v237);
        int v241 = objc_msgSend_isEqual_(v234, v239, (uint64_t)v238, v240);

        if (!v241) {
          goto LABEL_78;
        }
      }
      v245 = objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(v5, v242, v243, v244);
      uint64_t v249 = objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(self, v246, v247, v248);
      if (v245 == (void *)v249)
      {
      }
      else
      {
        v253 = (void *)v249;
        v254 = objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(v5, v250, v251, v252);
        v258 = objc_msgSend_codeServiceURLByContainerAndServiceEntitlement(self, v255, v256, v257);
        int v261 = objc_msgSend_isEqual_(v254, v259, (uint64_t)v258, v260);

        if (!v261) {
          goto LABEL_78;
        }
      }
      int hasVFSOpenByIDEntitlement = objc_msgSend_hasVFSOpenByIDEntitlement(v5, v262, v263, v264);
      if (hasVFSOpenByIDEntitlement != objc_msgSend_hasVFSOpenByIDEntitlement(self, v266, v267, v268)) {
        goto LABEL_78;
      }
      int hasNetworkSocketDelegateEntitlement = objc_msgSend_hasNetworkSocketDelegateEntitlement(v5, v269, v270, v271);
      if (hasNetworkSocketDelegateEntitlement != objc_msgSend_hasNetworkSocketDelegateEntitlement(self, v273, v274, v275))goto LABEL_78; {
      int hasAllowPackagesEntitlement = objc_msgSend_hasAllowPackagesEntitlement(v5, v276, v277, v278);
      }
      if (hasAllowPackagesEntitlement != objc_msgSend_hasAllowPackagesEntitlement(self, v280, v281, v282)) {
        goto LABEL_78;
      }
      int hasEnvironmentEntitlement = objc_msgSend_hasEnvironmentEntitlement(v5, v283, v284, v285);
      if (hasEnvironmentEntitlement != objc_msgSend_hasEnvironmentEntitlement(self, v287, v288, v289)) {
        goto LABEL_78;
      }
      int hasCustomAccountsEntitlement = objc_msgSend_hasCustomAccountsEntitlement(v5, v290, v291, v292);
      if (hasCustomAccountsEntitlement != objc_msgSend_hasCustomAccountsEntitlement(self, v294, v295, v296))goto LABEL_78; {
      v300 = objc_msgSend_clientPrefixEntitlement(v5, v297, v298, v299);
      }
      uint64_t v304 = objc_msgSend_clientPrefixEntitlement(self, v301, v302, v303);
      if (v300 == (void *)v304)
      {
      }
      else
      {
        v308 = (void *)v304;
        v309 = objc_msgSend_clientPrefixEntitlement(v5, v305, v306, v307);
        v313 = objc_msgSend_clientPrefixEntitlement(self, v310, v311, v312);
        int v316 = objc_msgSend_isEqual_(v309, v314, (uint64_t)v313, v315);

        if (!v316) {
          goto LABEL_78;
        }
      }
      int hasAssetBoundaryKeyEntitlement = objc_msgSend_hasAssetBoundaryKeyEntitlement(v5, v317, v318, v319);
      if (hasAssetBoundaryKeyEntitlement != objc_msgSend_hasAssetBoundaryKeyEntitlement(self, v321, v322, v323))goto LABEL_78; {
      int hasTemporaryDeviceCapabilitiesEntitlement = objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(v5, v324, v325, v326);
      }
      if (hasTemporaryDeviceCapabilitiesEntitlement != objc_msgSend_hasTemporaryDeviceCapabilitiesEntitlement(self, v328, v329, v330))goto LABEL_78; {
      int hasAllowFakeEntitlementsEntitlement = objc_msgSend_hasAllowFakeEntitlementsEntitlement(v5, v331, v332, v333);
      }
      if (hasAllowFakeEntitlementsEntitlement != objc_msgSend_hasAllowFakeEntitlementsEntitlement(self, v335, v336, v337))goto LABEL_78; {
      uint64_t v341 = objc_msgSend_containerEnvironment(v5, v338, v339, v340);
      }
      if (v341 != objc_msgSend_containerEnvironment(self, v342, v343, v344)) {
        goto LABEL_78;
      }
      v348 = objc_msgSend_developmentContainerEnvironmentOverrides(v5, v345, v346, v347);
      uint64_t v352 = objc_msgSend_developmentContainerEnvironmentOverrides(self, v349, v350, v351);
      if (v348 == (void *)v352)
      {
      }
      else
      {
        v356 = (void *)v352;
        v357 = objc_msgSend_developmentContainerEnvironmentOverrides(v5, v353, v354, v355);
        v361 = objc_msgSend_developmentContainerEnvironmentOverrides(self, v358, v359, v360);
        int v364 = objc_msgSend_isEqual_(v357, v362, (uint64_t)v361, v363);

        if (!v364) {
          goto LABEL_78;
        }
      }
      v368 = objc_msgSend_cloudServices(v5, v365, v366, v367);
      uint64_t v372 = objc_msgSend_cloudServices(self, v369, v370, v371);
      if (v368 == (void *)v372)
      {
      }
      else
      {
        v376 = (void *)v372;
        v377 = objc_msgSend_cloudServices(v5, v373, v374, v375);
        v381 = objc_msgSend_cloudServices(self, v378, v379, v380);
        int v384 = objc_msgSend_isEqual_(v377, v382, (uint64_t)v381, v383);

        if (!v384) {
          goto LABEL_78;
        }
      }
      int hasAlwaysAllowPublishAssetsEntitlement = objc_msgSend_hasAlwaysAllowPublishAssetsEntitlement(v5, v385, v386, v387);
      if (hasAlwaysAllowPublishAssetsEntitlement == objc_msgSend_hasAlwaysAllowPublishAssetsEntitlement(self, v389, v390, v391))
      {
        int hasAllowOnDeviceAssetStreamingEntitlement = objc_msgSend_hasAllowOnDeviceAssetStreamingEntitlement(v5, v392, v393, v394);
        int v17 = hasAllowOnDeviceAssetStreamingEntitlement ^ objc_msgSend_hasAllowOnDeviceAssetStreamingEntitlement(self, v397, v398, v399) ^ 1;
        goto LABEL_79;
      }
LABEL_78:
      LOBYTE(v17) = 0;
LABEL_79:

      goto LABEL_80;
    }
    LOBYTE(v17) = 0;
  }
LABEL_80:

  return v17;
}

- (NSArray)cloudServices
{
  return (NSArray *)sub_18AF2D840(self, @"com.apple.developer.icloud-services");
}

- (BOOL)hasCloudKitSystemServiceEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.systemService");
}

- (NSDictionary)serviceNameForContainerIdentifierMapEntitlement
{
  return (NSDictionary *)sub_18AF2D840(self, @"com.apple.private.cloudkit.serviceNameForContainerMap");
}

- (NSString)apsEnvironmentEntitlement
{
  uint64_t v2 = sub_18AF2D840(self, @"aps-environment");
  uint64_t v6 = objc_msgSend_lowercaseString(v2, v3, v4, v5);

  return (NSString *)v6;
}

- (BOOL)hasZoneProtectionDataEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.zoneprotectiondata");
}

- (BOOL)hasVFSOpenByIDEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.vfs.open-by-id");
}

- (BOOL)hasTemporaryDeviceCapabilitiesEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.temporary.deviceCapabilities");
}

- (BOOL)hasSystemLaunchDaemonEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.systemLaunchDaemonAccess");
}

- (BOOL)hasProtectionDataEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.protectiondata");
}

- (BOOL)hasParticipantPIIEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.participant-pii");
}

- (BOOL)hasOutOfProcessUIEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.oopui");
}

- (BOOL)hasNonLegacyShareURLEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.nonLegacySharingURL");
}

- (BOOL)hasNetworkSocketDelegateEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.network.socket-delegate");
}

- (BOOL)hasMasqueradingEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.masquerade");
}

- (BOOL)hasLightweightPCSEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.lightweightPCS");
}

- (BOOL)hasExplicitCodeOperationURLEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.explicitCodeOperationURL");
}

- (BOOL)hasEnvironmentEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.setEnvironment");
}

- (BOOL)hasDisplaysSystemAcceptPromptEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.displaysSystemAcceptPrompt");
}

- (BOOL)hasDarkWakeNetworkReachabilityEnabledEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.dark-wake-push");
}

- (BOOL)hasCustomAccountsEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.customAccounts");
}

- (BOOL)hasAssetBoundaryKeyEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.assetBoundaryKey");
}

- (BOOL)hasAlwaysAllowPublishAssetsEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.publishAssets");
}

- (BOOL)hasAllowUnverifiedAccountEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.allowUnverifiedAccount");
}

- (BOOL)hasAllowRealTimeOperationsEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.realTimeOperations");
}

- (BOOL)hasAllowPackagesEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.packages");
}

- (BOOL)hasAllowOnDeviceAssetStreamingEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.onDeviceStreaming");
}

- (BOOL)hasAllowFakeEntitlementsEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.fakeEntitlements");
}

- (BOOL)hasAllowAccessDuringBuddyEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.buddyAccess");
}

- (NSArray)developmentContainerEnvironmentOverrides
{
  return (NSArray *)sub_18AF2D840(self, @"com.apple.developer.icloud-container-development-container-identifiers");
}

- (int64_t)containerEnvironment
{
  uint64_t v2 = sub_18AF2D840(self, @"com.apple.developer.icloud-container-environment");
  uint64_t v4 = v2;
  if (!v2) {
    goto LABEL_4;
  }
  int64_t v5 = 1;
  if (objc_msgSend_compare_options_(v2, v3, @"production", 1))
  {
    objc_msgSend_compare_options_(v4, v6, @"development", 1);
LABEL_4:
    int64_t v5 = 2;
  }

  return v5;
}

- (NSString)codeServiceURLEntitlement
{
  return (NSString *)sub_18AF2D840(self, @"com.apple.developer.icloud-code-destination");
}

- (NSDictionary)codeServiceURLByServiceEntitlement
{
  return (NSDictionary *)sub_18AF2D840(self, @"com.apple.developer.icloud-code-destination-by-service");
}

- (NSDictionary)codeServiceURLByContainerAndServiceEntitlement
{
  return (NSDictionary *)sub_18AF2D840(self, @"com.apple.developer.icloud-code-destination-by-container-and-service");
}

- (NSString)clientPrefixEntitlement
{
  return (NSString *)sub_18AF2D840(self, @"com.apple.private.cloudkit.prefix");
}

- (NSString)associatedApplicationBundleID
{
  uint64_t v3 = sub_18AF2D840(self, @"com.apple.developer.associated-application-identifier");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend_firstObject(v3, v4, v5, v6);

    uint64_t v3 = (void *)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self) {
      procName = self->_procName;
    }
    else {
      procName = 0;
    }
    uint64_t v9 = CKAppIdentifierFromTeamAppTuple(v3, procName);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSString *)v9;
}

- (NSString)applicationBundleID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2)
  {
    cachedApplicationBundleID = v2->_cachedApplicationBundleID;
    if (cachedApplicationBundleID)
    {
      uint64_t v4 = cachedApplicationBundleID;
      goto LABEL_22;
    }
  }
  uint64_t v5 = sub_18AF2E43C(v2);
  if (v5)
  {
    if (v2) {
      procName = v2->_procName;
    }
    else {
      procName = 0;
    }
    uint64_t v7 = procName;
    v8 = CKAppIdentifierFromTeamAppTuple(v5, v7);
    if (v2) {
      objc_storeStrong((id *)&v2->_cachedApplicationBundleID, v8);
    }

    goto LABEL_17;
  }
  if (v2) {
    int pid = v2->_pid;
  }
  else {
    int pid = 0;
  }
  buffer[0] = 0;
  if (!proc_pidinfo(pid, 11, 1uLL, buffer, 1024) && buffer[0])
  {
    if (v2) {
      v10 = v2->_procName;
    }
    else {
      v10 = 0;
    }
    uint64_t v7 = v10;
    CKWarnForInvalidApplicationIdentifier(0, v7);
LABEL_17:
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B180384;
  v13[3] = &unk_1E5460350;
  v13[4] = v2;
  if (qword_1EB279A00 != -1)
  {
    dispatch_once(&qword_1EB279A00, v13);
    if (v2) {
      goto LABEL_20;
    }
LABEL_26:
    v11 = 0;
    goto LABEL_21;
  }
  if (!v2) {
    goto LABEL_26;
  }
LABEL_20:
  v11 = v2->_cachedApplicationBundleID;
LABEL_21:
  uint64_t v4 = v11;

LABEL_22:
  objc_sync_exit(v2);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_procName, 0);
  objc_storeStrong((id *)&self->_secEntitlementsError, 0);
  objc_storeStrong((id *)&self->_entitlementsDict, 0);

  objc_storeStrong((id *)&self->_cachedApplicationBundleID, 0);
}

- (CKEntitlements)initWithAuditToken:(id *)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(0, &token);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B17FF60;
  aBlock[3] = &unk_1E545FFA8;
  aBlock[4] = v8;
  v10 = (void (**)(void))_Block_copy(aBlock);
  CFErrorRef error = 0;
  if (v8)
  {
    self;
    *(void *)token.val = @"com.apple.private.cloudkit.masquerade";
    *(void *)&token.val[2] = @"com.apple.private.cloudkit.setEnvironment";
    *(void *)&token.val[4] = @"com.apple.private.cloudkit.customAccounts";
    *(void *)&token.val[6] = @"com.apple.private.cloudkit.assetBoundaryKey";
    uint64_t v57 = @"com.apple.private.cloudkit.protectiondata";
    v58 = @"com.apple.private.cloudkit.systemService";
    v59 = @"com.apple.private.dark-wake-push";
    uint64_t v60 = @"com.apple.private.cloudkit.buddyAccess";
    uint64_t v61 = @"com.apple.private.cloudkit.lightweightPCS";
    uint64_t v62 = @"com.apple.private.cloudkit.oopui";
    v63 = @"com.apple.private.cloudkit.participant-pii";
    uint64_t v64 = @"com.apple.private.cloudkit.displaysSystemAcceptPrompt";
    uint64_t v65 = @"com.apple.private.cloudkit.spi";
    v66 = @"com.apple.private.cloudkit.systemLaunchDaemonAccess";
    v67 = @"com.apple.private.cloudkit.packages";
    v68 = @"com.apple.private.vfs.open-by-id";
    uint64_t v69 = @"com.apple.private.network.socket-delegate";
    uint64_t v70 = @"com.apple.private.cloudkit.serviceNameForContainerMap";
    v71 = @"application-identifier";
    v72 = @"com.apple.developer.associated-application-identifier";
    uint64_t v73 = @"com.apple.private.cloudkit.prefix";
    int v74 = @"aps-environment";
    BOOL v75 = @"aps-connection-initiate";
    v76 = @"com.apple.developer.icloud-container-environment";
    uint64_t v77 = @"com.apple.developer.icloud-container-development-container-identifiers";
    uint64_t v78 = @"com.apple.developer.icloud-services";
    v79 = @"com.apple.private.cloudkit.fakeEntitlements";
    v80 = @"com.apple.private.cloudkit.zoneprotectiondata";
    uint64_t v81 = @"com.apple.private.cloudkit.nonLegacySharingURL";
    uint64_t v82 = @"com.apple.private.cloudkit.allowUnverifiedAccount";
    v83 = @"com.apple.private.cloudkit.notifyOnAccountWarmup";
    uint64_t v84 = @"com.apple.private.cloudkit.realTimeOperations";
    uint64_t v85 = @"com.apple.developer.icloud-code-destination";
    v86 = @"com.apple.developer.icloud-code-destination-by-service";
    v87 = @"com.apple.developer.icloud-code-destination-by-container-and-service";
    uint64_t v88 = @"com.apple.private.cloudkit.explicitCodeOperationURL";
    uint64_t v89 = @"com.apple.private.cloudkit.supportservice";
    v90 = @"com.apple.private.cloudkit.publishAssets";
    uint64_t v91 = @"com.apple.private.cloudkit.onDeviceStreaming";
    uint64_t v92 = @"com.apple.private.cloudkit.temporary.deviceCapabilities";
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)&token, 40);
    CFArrayRef v12 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v13 = SecTaskCopyValuesForEntitlements(v8, v12, &error);

    if (error)
    {
      secEntitlementsError = self->_secEntitlementsError;
      self->_secEntitlementsError = (NSError *)error;

      CFErrorRef error = 0;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v18 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        v51 = self->_secEntitlementsError;
        token.val[0] = 138543618;
        *(void *)&token.val[1] = v8;
        LOWORD(token.val[3]) = 2114;
        *(void *)((char *)&token.val[3] + 2) = v51;
        _os_log_error_impl(&dword_18AF10000, v18, OS_LOG_TYPE_ERROR, "Couldn't fetch client entitlements from sec task %{public}@ because we got an error from Security: %{public}@", (uint8_t *)&token, 0x16u);
      }
      id v19 = 0;
    }
    else
    {
      v23 = objc_msgSend_mutableCopy(v13, v14, v15, v16);
      if (objc_opt_respondsToSelector())
      {
        long long v25 = *(_OWORD *)&a3->var0[4];
        *(_OWORD *)token.val = *(_OWORD *)a3->var0;
        *(_OWORD *)&token.val[4] = v25;
        objc_msgSend_daemonInitHook_mutableEntitlements_(self, v24, (uint64_t)&token, (uint64_t)v23);
      }
      int v26 = proc_name(v4, &token, 0x40u);
      id v27 = [NSString alloc];
      p_audit_token_t token = (audit_token_t *)"???";
      if (v26 > 0) {
        p_audit_token_t token = &token;
      }
      v31 = objc_msgSend_initWithFormat_(v27, v28, @"%s(%d)", v29, p_token, v4);
      int v34 = v31;
      if (__sTestOverridesAvailable {
        && ((objc_msgSend_isEqualToString_(v31, v32, @"xctest", v33) & 1) != 0
      }
         || objc_msgSend_hasPrefix_(v34, v35, @"xctest("), v36))
      {
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        uint64_t v37 = ck_log_facility_ck;
        if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AF10000, v37, OS_LOG_TYPE_ERROR, "Allowing xctest access to CloudKitTesting.  Note that parts of CloudKit are non-functional in an un-entitled process.  Strongly consider moving to an entitled test host", buf, 2u);
        }
        uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v23, v38, @"application-identifier", v39);
        BOOL v41 = v40 == 0;

        if (v41) {
          objc_msgSend_setObject_forKeyedSubscript_(v23, v42, @"com.apple.xctest", @"application-identifier");
        }
        uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v23, v42, @"com.apple.developer.icloud-services", v43);
        BOOL v45 = v44 == 0;

        if (v45)
        {
          v55 = @"CloudKit";
          v46 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v32, (uint64_t)&v55, 1);
          objc_msgSend_setObject_forKeyedSubscript_(v23, v47, (uint64_t)v46, @"com.apple.developer.icloud-services");
        }
      }
      uint64_t v48 = objc_msgSend_initWithEntitlementsDict_(self, v32, (uint64_t)v23, v33);
      uint64_t v49 = (void *)v48;
      if (v48)
      {
        *(_DWORD *)(v48 + 8) = v4;
        objc_storeStrong((id *)(v48 + 40), v34);
      }
      self = v49;

      id v19 = self;
    }
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v9, @"CKErrorDomain", 1, @"Can't fetch client entitlements from a NULL secTask for pid %d", v4);
    uint64_t v20 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = self->_secEntitlementsError;
    self->_secEntitlementsError = v20;

    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v22 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      token.val[0] = 67109120;
      token.val[1] = v4;
      _os_log_error_impl(&dword_18AF10000, v22, OS_LOG_TYPE_ERROR, "Can't fetch client entitlements from a NULL secTask for pid %d", (uint8_t *)&token, 8u);
    }
    id v19 = 0;
  }
  v10[2](v10);

  return v19;
}

- (CKEntitlements)initWithCurrentProcess
{
  kern_return_t v3;
  kern_return_t v4;
  NSObject *v5;
  CKEntitlements *v6;
  uint64_t v7;
  const char *v8;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  long long v12;
  uint8_t buf[16];
  long long v14;
  uint64_t v15;

  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)task_info_out = 0u;
  CFArrayRef v12 = 0u;
  task_info_outCnt = 8;
  uint64_t v3 = task_info(*MEMORY[0x1E4F14960], 0xFu, task_info_out, &task_info_outCnt);
  if (v3)
  {
    uint64_t v4 = v3;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v4;
      _os_log_error_impl(&dword_18AF10000, v5, OS_LOG_TYPE_ERROR, "Unable to get a self audit token: %d", buf, 8u);
    }
    uint64_t v6 = 0;
  }
  else
  {
    long long v7 = getpid();
    *(_OWORD *)buf = *(_OWORD *)task_info_out;
    uint64_t v14 = v12;
    self = (CKEntitlements *)(id)objc_msgSend_initWithAuditToken_pid_(self, v8, (uint64_t)buf, v7);
    uint64_t v6 = self;
  }

  return v6;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v8 = objc_msgSend_stringWithFormat_(v3, v6, @"%@<%p>: entitlements = %@, CFErrorRef error = %@", v7, v5, self, self->_entitlementsDict, self->_secEntitlementsError);

  return (NSString *)v8;
}

- (id)entitlementsByAddingOverlay:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self)
  {
    id Property = objc_getProperty(self, v4, 24, 1);
    CFArrayRef v12 = objc_msgSend_mutableCopy(Property, v9, v10, v11);
  }
  else
  {
    CFArrayRef v12 = objc_msgSend_mutableCopy(0, v4, v5, v6);
  }
  CFDictionaryRef v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  uint64_t v15 = v14;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v7;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v18)
  {
    uint64_t v21 = v18;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v16);
        }
        uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        long long v25 = objc_msgSend_objectForKeyedSubscript_(v16, v19, v24, v20, (void)v39);
        uint64_t v29 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v26, v27, v28);

        if (v25 == v29) {
          objc_msgSend_setObject_forKeyedSubscript_(v15, v30, 0, v24);
        }
        else {
          objc_msgSend_setObject_forKeyedSubscript_(v15, v30, (uint64_t)v25, v24);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v21);
  }

  id v31 = objc_alloc((Class)objc_opt_class());
  uint64_t v34 = objc_msgSend_initWithEntitlementsDict_(v31, v32, (uint64_t)v15, v33);
  v35 = (id *)v34;
  if (self)
  {
    int pid = self->_pid;
    if (!v34) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int pid = 0;
  if (v34) {
LABEL_18:
  }
    *(_DWORD *)(v34 + 8) = pid;
LABEL_19:
  if (self)
  {
    sub_18B180350(v34, self->_procName);
    secEntitlementsError = self->_secEntitlementsError;
    if (!v35) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  sub_18B180350(v34, 0);
  secEntitlementsError = 0;
  if (v35) {
LABEL_21:
  }
    objc_storeStrong(v35 + 4, secEntitlementsError);
LABEL_22:

  return v35;
}

- (BOOL)hasCloudKitSupportServiceEntitlement
{
  return sub_18AF2D364(self, @"com.apple.private.cloudkit.supportservice");
}

- (BOOL)hasSPIEntitlement
{
  uint64_t v2 = sub_18AF2D840(self, @"com.apple.private.cloudkit.spi");
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  BOOL v3 = sub_18AF2E43C(self);
  uint64_t v7 = objc_msgSend_hash(v3, v4, v5, v6);

  uint64_t v11 = objc_msgSend_applicationBundleID(self, v8, v9, v10);
  unint64_t v15 = objc_msgSend_hash(v11, v12, v13, v14) ^ v7;

  return v15;
}

- (id)sqliteRepresentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (CKEntitlements *)objc_getProperty(self, a2, 24, 1);
  }
  uint64_t v4 = objc_msgSend_mutableCopy(self, a2, v2, v3);
  id v13 = 0;
  uint64_t v6 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v5, (uint64_t)v4, 0, &v13);
  id v7 = v13;
  if (v7)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v8 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_error_impl(&dword_18AF10000, v8, OS_LOG_TYPE_ERROR, "Error converting CKEntitlements to JSON: %{public}@", buf, 0xCu);
    }
  }
  id v9 = [NSString alloc];
  uint64_t v11 = objc_msgSend_initWithData_encoding_(v9, v10, (uint64_t)v6, 4);

  return v11;
}

- (BOOL)validateEntitlementsWithSDKVersion:(unsigned int)a3 error:(id *)a4
{
  v229[27] = *MEMORY[0x1E4F143B8];
  int v172 = self;
  if (self) {
    self = (CKEntitlements *)objc_getProperty(self, a2, 24, 1);
  }
  uint64_t v5 = self;
  id newValue = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  v229[0] = @"com.apple.private.cloudkit.masquerade";
  v229[1] = @"com.apple.private.cloudkit.setEnvironment";
  v229[2] = @"com.apple.private.cloudkit.customAccounts";
  v229[3] = @"com.apple.private.cloudkit.assetBoundaryKey";
  v229[4] = @"com.apple.private.cloudkit.protectiondata";
  v229[5] = @"com.apple.private.cloudkit.systemService";
  v229[6] = @"com.apple.private.dark-wake-push";
  v229[7] = @"com.apple.private.cloudkit.buddyAccess";
  v229[8] = @"com.apple.private.cloudkit.lightweightPCS";
  v229[9] = @"com.apple.private.cloudkit.oopui";
  v229[10] = @"com.apple.private.cloudkit.participant-pii";
  v229[11] = @"com.apple.private.cloudkit.displaysSystemAcceptPrompt";
  v229[12] = @"com.apple.private.cloudkit.systemLaunchDaemonAccess";
  v229[13] = @"com.apple.private.cloudkit.packages";
  v229[14] = @"com.apple.private.vfs.open-by-id";
  v229[15] = @"com.apple.private.network.socket-delegate";
  v229[16] = @"com.apple.private.cloudkit.fakeEntitlements";
  v229[17] = @"com.apple.private.cloudkit.zoneprotectiondata";
  v229[18] = @"com.apple.private.cloudkit.nonLegacySharingURL";
  v229[19] = @"com.apple.private.cloudkit.allowUnverifiedAccount";
  v229[20] = @"com.apple.private.cloudkit.notifyOnAccountWarmup";
  v229[21] = @"com.apple.private.cloudkit.explicitCodeOperationURL";
  v229[22] = @"com.apple.private.cloudkit.realTimeOperations";
  v229[23] = @"com.apple.private.cloudkit.supportservice";
  v229[24] = @"com.apple.private.cloudkit.publishAssets";
  v229[25] = @"com.apple.private.cloudkit.onDeviceStreaming";
  v229[26] = @"com.apple.private.cloudkit.temporary.deviceCapabilities";
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v229, 27);
  v228[0] = @"application-identifier";
  v228[1] = @"com.apple.private.cloudkit.prefix";
  v228[2] = @"aps-environment";
  v228[3] = @"com.apple.developer.icloud-code-destination";
  v166 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v228, 4);
  v227[0] = @"com.apple.developer.icloud-container-development-container-identifiers";
  v227[1] = @"com.apple.developer.icloud-services";
  v165 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v227, 2);
  v226[0] = @"com.apple.private.cloudkit.serviceNameForContainerMap";
  v226[1] = @"com.apple.developer.icloud-code-destination-by-service";
  v164 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v226, 2);
  long long v205 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  uint64_t v14 = v10;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v205, (uint64_t)v225, 16);
  unsigned int v169 = HIWORD(a3);
  uint64_t v171 = v14;
  if (v16)
  {
    uint64_t v19 = v16;
    uint64_t v20 = *(void *)v206;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v206 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void **)(*((void *)&v205 + 1) + 8 * v21);
        objc_msgSend_addObject_(0, v17, (uint64_t)v22, v18);
        v23 = sub_18AF2D840(v172, v22);
        if (v23 && (objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v24 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, v24);
          }

          long long v25 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v210 = v23;
            __int16 v211 = 2114;
            uint64_t v212 = (uint64_t)v22;
            _os_log_error_impl(&dword_18AF10000, v25, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected something that supports -BOOLValue", buf, 0x16u);
          }

          if (v169 > 0xE)
          {
            uint64_t v14 = v171;
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v26, @"CKErrorDomain", 8, @"Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected something that supports -BOOLValue", v23, v22);
              BOOL v99 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v99 = 0;
            }
            uint64_t v27 = v171;
            goto LABEL_169;
          }
          objc_msgSend_setObject_forKeyedSubscript_(newValue, v26, 0, (uint64_t)v22);
          uint64_t v14 = v171;
        }

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v205, (uint64_t)v225, 16);
    }
    while (v19);
  }

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  uint64_t v27 = v166;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v201, (uint64_t)v224, 16);
  v32 = v172;
  if (v29)
  {
    uint64_t v33 = v29;
    uint64_t v34 = *(void *)v202;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v202 != v34) {
          objc_enumerationMutation(v27);
        }
        uint64_t v36 = *(void **)(*((void *)&v201 + 1) + 8 * v35);
        objc_msgSend_addObject_(0, v30, (uint64_t)v36, v31);
        v23 = sub_18AF2D840(v172, v36);
        if (v23)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v37 = ck_log_initialization_block;
            if (ck_log_initialization_predicate != -1) {
              dispatch_once(&ck_log_initialization_predicate, v37);
            }

            v38 = (id)ck_log_facility_ck;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v210 = v23;
              __int16 v211 = 2114;
              uint64_t v212 = (uint64_t)v36;
              _os_log_error_impl(&dword_18AF10000, v38, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a string", buf, 0x16u);
            }

            if (v169 > 0xE)
            {
              uint64_t v14 = v171;
              uint64_t v98 = a4;
              if (a4)
              {
                uint64_t v151 = v36;
                goto LABEL_111;
              }
LABEL_168:
              BOOL v99 = 0;
              goto LABEL_169;
            }
            objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, (uint64_t)v36);
            uint64_t v14 = v171;
          }
        }

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v201, (uint64_t)v224, 16);
    }
    while (v33);
  }

  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  uint64_t v27 = v165;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v40, (uint64_t)&v197, (uint64_t)v223, 16);
  if (!v41) {
    goto LABEL_60;
  }
  uint64_t v44 = v41;
  uint64_t v45 = *(void *)v198;
  uint64_t v154 = *(void *)v198;
  v157 = v27;
  do
  {
    uint64_t v46 = 0;
    uint64_t v160 = v44;
    do
    {
      if (*(void *)v198 != v45) {
        objc_enumerationMutation(v27);
      }
      v47 = *(void **)(*((void *)&v197 + 1) + 8 * v46);
      objc_msgSend_addObject_(0, v42, (uint64_t)v47, v43);
      v23 = sub_18AF2D840(v32, v47);
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_50;
        }
        long long v195 = 0u;
        long long v196 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        id v48 = v23;
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v193, (uint64_t)v222, 16);
        if (!v50)
        {

          uint64_t v14 = v171;
          goto LABEL_58;
        }
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v194;
        char v53 = 1;
        do
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v194 != v52) {
              objc_enumerationMutation(v48);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              char v53 = 0;
            }
          }
          uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v55, (uint64_t)&v193, (uint64_t)v222, 16);
        }
        while (v51);

        uint64_t v14 = v171;
        uint64_t v45 = v154;
        uint64_t v27 = v157;
        uint64_t v44 = v160;
        if ((v53 & 1) == 0)
        {
LABEL_50:
          uint64_t v56 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, v56);
          }

          uint64_t v57 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v210 = v23;
            __int16 v211 = 2114;
            uint64_t v212 = (uint64_t)v47;
            _os_log_error_impl(&dword_18AF10000, v57, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected an array of strings", buf, 0x16u);
          }

          if (v169 > 0xE
            || (objc_msgSend_isEqualToString_(v47, v39, @"com.apple.developer.icloud-services", v58) & 1) != 0)
          {
            uint64_t v98 = a4;
            if (a4)
            {
              v150 = v23;
              uint64_t v151 = v47;
              v100 = @"Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected an array of strings";
              goto LABEL_118;
            }
            goto LABEL_168;
          }
          objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, (uint64_t)v47);
        }
      }
LABEL_58:

      ++v46;
      v32 = v172;
    }
    while (v46 != v44);
    uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v42, (uint64_t)&v197, (uint64_t)v223, 16);
  }
  while (v44);
LABEL_60:

  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  uint64_t v27 = v164;
  uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v59, (uint64_t)&v189, (uint64_t)v221, 16);
  if (!v60)
  {
LABEL_87:

    uint64_t v27 = @"com.apple.developer.associated-application-identifier";
    v23 = sub_18AF2D840(v32, v27);
    objc_msgSend_addObject_(0, v86, (uint64_t)v27, v87);
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_100:
          uint64_t v96 = ck_log_initialization_block;
          if (ck_log_initialization_predicate != -1) {
            dispatch_once(&ck_log_initialization_predicate, v96);
          }

          v97 = (id)ck_log_facility_ck;
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v210 = v23;
            __int16 v211 = 2114;
            uint64_t v212 = (uint64_t)v27;
            _os_log_error_impl(&dword_18AF10000, v97, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a string", buf, 0x16u);
          }

          if (v169 > 0xE)
          {
            uint64_t v98 = a4;
            if (a4)
            {
              uint64_t v151 = v27;
LABEL_111:
              v150 = v23;
              v100 = @"Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected a string";
              goto LABEL_118;
            }
            goto LABEL_168;
          }
          objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, (uint64_t)v27);
          goto LABEL_122;
        }
        long long v183 = 0u;
        long long v184 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        id v88 = v23;
        uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v181, (uint64_t)v219, 16);
        if (v90)
        {
          uint64_t v91 = v90;
          uint64_t v92 = *(void *)v182;
          char v93 = 1;
          do
          {
            for (uint64_t j = 0; j != v91; ++j)
            {
              if (*(void *)v182 != v92) {
                objc_enumerationMutation(v88);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                char v93 = 0;
              }
            }
            uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v95, (uint64_t)&v181, (uint64_t)v219, 16);
          }
          while (v91);

          uint64_t v14 = v171;
          v32 = v172;
          if ((v93 & 1) == 0) {
            goto LABEL_100;
          }
        }
        else
        {
        }
      }
    }
LABEL_122:
    uint64_t v102 = @"com.apple.developer.icloud-code-destination-by-container-and-service";

    uint64_t v103 = sub_18AF2D840(v32, v102);

    objc_msgSend_addObject_(0, v104, (uint64_t)v102, v105);
    if (v103)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_148;
      }
      long long v177 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      id v106 = v103;
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v107, (uint64_t)&v177, (uint64_t)v218, 16);
      if (!v108)
      {

        goto LABEL_157;
      }
      uint64_t v109 = v108;
      v153 = v103;
      v156 = v102;
      uint64_t v110 = *(void *)v178;
      char v111 = 1;
      uint64_t v159 = *(void *)v178;
      id v162 = v106;
      do
      {
        uint64_t v112 = 0;
        uint64_t v168 = v109;
        do
        {
          if (*(void *)v178 != v110) {
            objc_enumerationMutation(v106);
          }
          uint64_t v113 = *(void *)(*((void *)&v177 + 1) + 8 * v112);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v116 = objc_msgSend_objectForKeyedSubscript_(v106, v114, v113, v115);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v117 = v116;
              long long v173 = 0u;
              long long v174 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              id v118 = v117;
              uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v119, (uint64_t)&v173, (uint64_t)v217, 16);
              if (v120)
              {
                uint64_t v121 = v120;
                uint64_t v122 = *(void *)v174;
                do
                {
                  for (uint64_t k = 0; k != v121; ++k)
                  {
                    if (*(void *)v174 != v122) {
                      objc_enumerationMutation(v118);
                    }
                    uint64_t v124 = *(void *)(*((void *)&v173 + 1) + 8 * k);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v127 = objc_msgSend_objectForKeyedSubscript_(v118, v125, v124, v126);
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();

                      if (isKindOfClass) {
                        continue;
                      }
                    }
                    char v111 = 0;
                  }
                  uint64_t v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v125, (uint64_t)&v173, (uint64_t)v217, 16);
                }
                while (v121);
              }

              uint64_t v14 = v171;
              v32 = v172;
              uint64_t v110 = v159;
              id v106 = v162;
              uint64_t v109 = v168;
            }
            else
            {
              char v111 = 0;
            }
          }
          else
          {
            char v111 = 0;
          }
          ++v112;
        }
        while (v112 != v109);
        uint64_t v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v114, (uint64_t)&v177, (uint64_t)v218, 16);
      }
      while (v109);

      uint64_t v102 = v156;
      uint64_t v103 = v153;
      if ((v111 & 1) == 0)
      {
LABEL_148:
        v129 = ck_log_initialization_block;
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, v129);
        }

        uint64_t v130 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v210 = v103;
          __int16 v211 = 2114;
          uint64_t v212 = (uint64_t)v102;
          _os_log_error_impl(&dword_18AF10000, v130, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a type of [ string : [ string : string ] ]", buf, 0x16u);
        }

        if (v169 > 0xE)
        {
          if (a4)
          {
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v131, @"CKErrorDomain", 8, @"Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected a type of [ string : [ string : string ] ]", v103, v102);
            BOOL v99 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v99 = 0;
          }
          v23 = v103;
          uint64_t v27 = v102;
          goto LABEL_169;
        }
        objc_msgSend_setObject_forKeyedSubscript_(newValue, v131, 0, (uint64_t)v102);
      }
    }
LABEL_157:
    uint64_t v27 = @"com.apple.developer.icloud-container-environment";

    v23 = sub_18AF2D840(v32, v27);

    objc_msgSend_addObject_(0, v132, (uint64_t)v27, v133);
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || objc_msgSend_compare_options_(v23, v136, @"production", 1)
        && objc_msgSend_compare_options_(v23, v134, @"development", 1))
      {
        uint64_t v137 = ck_log_initialization_block;
        if (ck_log_initialization_predicate != -1) {
          dispatch_once(&ck_log_initialization_predicate, v137);
        }

        uint64_t v138 = (id)ck_log_facility_ck;
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v210 = v23;
          __int16 v211 = 2114;
          uint64_t v212 = (uint64_t)v27;
          __int16 v213 = 2114;
          v214 = @"production";
          __int16 v215 = 2114;
          uint64_t v216 = @"development";
          _os_log_error_impl(&dword_18AF10000, v138, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected \"%{public}@\" or \"%{public}@\"", buf, 0x2Au);
        }

        if (v169 > 0xE)
        {
          if (a4)
          {
            v101 = a4;
            objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v139, @"CKErrorDomain", 8, @"Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected \"%@\" or \"%@\", v23, v27, @"production", @"development"");
            goto LABEL_119;
          }
          goto LABEL_168;
        }
        objc_msgSend_setObject_forKeyedSubscript_(newValue, v139, 0, (uint64_t)v27);
      }
    }
    objc_msgSend_addObject_(0, v134, @"com.apple.private.cloudkit.spi", v135);
    objc_msgSend_addObject_(0, v141, @"aps-connection-initiate", v142);
    if (v169 <= 0xE)
    {
      if (v32) {
        id Property = objc_getProperty(v32, v143, 24, 1);
      }
      else {
        id Property = 0;
      }
      id v145 = Property;
      char isEqual = objc_msgSend_isEqual_(v145, v146, (uint64_t)newValue, v147);

      BOOL v99 = 1;
      if (v32 && (isEqual & 1) == 0) {
        objc_setProperty_atomic_copy(v32, v149, newValue, 24);
      }
    }
    else
    {
      BOOL v99 = 1;
    }
    goto LABEL_169;
  }
  uint64_t v63 = v60;
  uint64_t v64 = *(void *)v190;
  uint64_t v158 = v27;
  uint64_t v152 = *(void *)v190;
LABEL_62:
  uint64_t v65 = 0;
  uint64_t v155 = v63;
  while (1)
  {
    if (*(void *)v190 != v64) {
      objc_enumerationMutation(v27);
    }
    v66 = *(void **)(*((void *)&v189 + 1) + 8 * v65);
    objc_msgSend_addObject_(0, v61, (uint64_t)v66, v62);
    v23 = sub_18AF2D840(v32, v66);
    if (!v23) {
      goto LABEL_85;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v161 = v66;
      uint64_t v167 = v65;
      id v67 = v23;
      long long v185 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      v71 = objc_msgSend_allKeys(v67, v68, v69, v70);
      uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v185, (uint64_t)v220, 16);
      if (!v73)
      {

        uint64_t v14 = v171;
        goto LABEL_85;
      }
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v186;
      char v76 = 1;
      do
      {
        for (uint64_t m = 0; m != v74; ++m)
        {
          if (*(void *)v186 != v75) {
            objc_enumerationMutation(v71);
          }
          uint64_t v78 = *(void *)(*((void *)&v185 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v67, v79, v78, v80);
            objc_opt_class();
            char v82 = objc_opt_isKindOfClass();

            if (v82) {
              continue;
            }
          }
          char v76 = 0;
        }
        uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v79, (uint64_t)&v185, (uint64_t)v220, 16);
      }
      while (v74);

      uint64_t v14 = v171;
      uint64_t v63 = v155;
      uint64_t v27 = v158;
      uint64_t v64 = v152;
      uint64_t v65 = v167;
      v66 = v161;
      if (v76) {
        goto LABEL_85;
      }
    }
    uint64_t v83 = (uint64_t)v66;
    uint64_t v84 = ck_log_initialization_block;
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, v84);
    }

    uint64_t v85 = (id)ck_log_facility_ck;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v210 = v23;
      __int16 v211 = 2114;
      uint64_t v212 = v83;
      _os_log_error_impl(&dword_18AF10000, v85, OS_LOG_TYPE_ERROR, "This application has a malformed value \"%{public}@\" for entitlement %{public}@, expected a dict of string : string", buf, 0x16u);
    }

    if (v169 > 0xE) {
      break;
    }
    objc_msgSend_setObject_forKeyedSubscript_(newValue, v39, 0, v83);
LABEL_85:

    ++v65;
    v32 = v172;
    if (v65 == v63)
    {
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v61, (uint64_t)&v189, (uint64_t)v221, 16);
      if (v63) {
        goto LABEL_62;
      }
      goto LABEL_87;
    }
  }
  uint64_t v98 = a4;
  if (!a4) {
    goto LABEL_168;
  }
  v150 = v23;
  uint64_t v151 = (void *)v83;
  v100 = @"Application has malformed entitlements.  Found value \"%@\" for entitlement %@, expected a dict of string : string";
LABEL_118:
  v101 = v98;
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKErrorDomain", 8, v100, v150, v151);
LABEL_119:
  BOOL v99 = 0;
  id *v101 = (id)objc_claimAutoreleasedReturnValue();
LABEL_169:

  return v99;
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);
}

@end
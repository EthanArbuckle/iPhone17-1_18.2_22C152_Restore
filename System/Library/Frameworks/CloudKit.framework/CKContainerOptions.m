@interface CKContainerOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)acceptServerSignedRecords;
- (BOOL)accountInfoCacheIsDisabled;
- (BOOL)addDatabaseScopeToZoneIDs;
- (BOOL)bypassPCSEncryption;
- (BOOL)captureResponseHTTPHeaders;
- (BOOL)encryptMergeableValueMetadata;
- (BOOL)enforceNamedOperationGroups;
- (BOOL)fetchChangesForMergeableValues;
- (BOOL)forceEnableReadOnlyManatee;
- (BOOL)holdAllOperations;
- (BOOL)isEqual:(id)a3;
- (BOOL)isServiceManatee;
- (BOOL)maintainRecordUploadOrder;
- (BOOL)prefersHiddenAllowedSharingOptionsUI;
- (BOOL)returnPCSMetadata;
- (BOOL)returnRequestOperationProto;
- (BOOL)useAnonymousToServerShareParticipants;
- (BOOL)useClearAssetEncryption;
- (BOOL)useZoneWidePCS;
- (CKAccountOverrideInfo)accountOverrideInfo;
- (CKContainerOptions)init;
- (CKContainerOptions)initWithCoder:(id)a3;
- (CKContainerOptions)initWithSqliteRepresentation:(id)a3;
- (CKTestDeviceReferenceProtocol)testDeviceReferenceProtocol;
- (CKUploadRequestConfiguration)uploadRequestConfiguration;
- (NSArray)supportedDeviceCapabilities;
- (NSDictionary)fakeEntitlements;
- (NSNumber)immediateUseDatabaseScopeForTesting;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)applicationBundleIdentifierOverrideForPushTopicGeneration;
- (NSString)applicationBundleIdentifierOverrideForTCC;
- (NSString)description;
- (NSString)encryptionServiceName;
- (NSString)personaIdentifier;
- (id)CKShortDescriptionRedact:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (id)sqliteRepresentation;
- (int64_t)qualityOfService;
- (unint64_t)hash;
- (unint64_t)mmcsEncryptionSupport;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptServerSignedRecords:(BOOL)a3;
- (void)setAccountInfoCacheIsDisabled:(BOOL)a3;
- (void)setAccountOverrideInfo:(id)a3;
- (void)setAddDatabaseScopeToZoneIDs:(BOOL)a3;
- (void)setApplicationBundleIdentifierOverride:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForPushTopicGeneration:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForTCC:(id)a3;
- (void)setBypassPCSEncryption:(BOOL)a3;
- (void)setCaptureResponseHTTPHeaders:(BOOL)a3;
- (void)setEncryptMergeableValueMetadata:(BOOL)a3;
- (void)setEncryptionServiceName:(id)a3;
- (void)setEnforceNamedOperationGroups:(BOOL)a3;
- (void)setFakeEntitlements:(id)a3;
- (void)setFetchChangesForMergeableValues:(BOOL)a3;
- (void)setForceEnableReadOnlyManatee:(BOOL)a3;
- (void)setHoldAllOperations:(BOOL)a3;
- (void)setImmediateUseDatabaseScopeForTesting:(id)a3;
- (void)setIsServiceManatee:(BOOL)a3;
- (void)setMaintainRecordUploadOrder:(BOOL)a3;
- (void)setMmcsEncryptionSupport:(unint64_t)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setPrefersHiddenAllowedSharingOptionsUI:(BOOL)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setReturnPCSMetadata:(BOOL)a3;
- (void)setReturnRequestOperationProto:(BOOL)a3;
- (void)setSupportedDeviceCapabilities:(id)a3;
- (void)setTestDeviceReferenceProtocol:(id)a3;
- (void)setUploadRequestConfiguration:(id)a3;
- (void)setUseAnonymousToServerShareParticipants:(BOOL)a3;
- (void)setUseClearAssetEncryption:(BOOL)a3;
- (void)setUseMMCSEncryptionV2:(BOOL)a3;
- (void)setUseZoneWidePCS:(BOOL)a3;
@end

@implementation CKContainerOptions

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
  id v12 = a3;
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(self, v4, (uint64_t)v12, v5);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(self, v6, (uint64_t)v12, v7);
  objc_msgSend_setApplicationBundleIdentifierOverrideForPushTopicGeneration_(self, v8, (uint64_t)v12, v9);
  objc_msgSend_setApplicationBundleIdentifierOverrideForTCC_(self, v10, (uint64_t)v12, v11);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForTCC:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForPushTopicGeneration:(id)a3
{
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
}

- (void)setUseZoneWidePCS:(BOOL)a3
{
  self->_useZoneWidePCS = a3;
}

- (BOOL)accountInfoCacheIsDisabled
{
  return self->_accountInfoCacheIsDisabled;
}

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v10, (uint64_t)v11, a4);
}

- (id)sqliteRepresentation
{
  uint64_t v297 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = NSNumber;
  uint64_t v8 = objc_msgSend_captureResponseHTTPHeaders(self, v5, v6, v7);
  id v11 = objc_msgSend_numberWithBool_(v4, v9, v8, v10);
  id v12 = NSStringFromSelector(sel_captureResponseHTTPHeaders);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v11, (uint64_t)v12);

  v14 = NSNumber;
  uint64_t v18 = objc_msgSend_useZoneWidePCS(self, v15, v16, v17);
  v21 = objc_msgSend_numberWithBool_(v14, v19, v18, v20);
  v22 = NSStringFromSelector(sel_useZoneWidePCS);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v21, (uint64_t)v22);

  v24 = NSNumber;
  uint64_t v28 = objc_msgSend_holdAllOperations(self, v25, v26, v27);
  v31 = objc_msgSend_numberWithBool_(v24, v29, v28, v30);
  v32 = NSStringFromSelector(sel_holdAllOperations);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v31, (uint64_t)v32);

  v37 = objc_msgSend_accountOverrideInfo(self, v34, v35, v36);
  v41 = objc_msgSend_sqliteRepresentation(v37, v38, v39, v40);
  v42 = NSStringFromSelector(sel_accountOverrideInfo);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v43, (uint64_t)v41, (uint64_t)v42);

  v44 = NSNumber;
  uint64_t v48 = objc_msgSend_qualityOfService(self, v45, v46, v47);
  v51 = objc_msgSend_numberWithInteger_(v44, v49, v48, v50);
  v52 = NSStringFromSelector(sel_qualityOfService);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v53, (uint64_t)v51, (uint64_t)v52);

  v54 = NSNumber;
  uint64_t v58 = objc_msgSend_returnPCSMetadata(self, v55, v56, v57);
  v61 = objc_msgSend_numberWithBool_(v54, v59, v58, v60);
  v62 = NSStringFromSelector(sel_returnPCSMetadata);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v63, (uint64_t)v61, (uint64_t)v62);

  v64 = NSNumber;
  uint64_t v68 = objc_msgSend_mmcsEncryptionSupport(self, v65, v66, v67);
  v71 = objc_msgSend_numberWithUnsignedInteger_(v64, v69, v68, v70);
  v72 = NSStringFromSelector(sel_mmcsEncryptionSupport);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v73, (uint64_t)v71, (uint64_t)v72);

  v77 = objc_msgSend_encryptionServiceName(self, v74, v75, v76);
  v78 = NSStringFromSelector(sel_encryptionServiceName);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v79, (uint64_t)v77, (uint64_t)v78);

  v80 = NSNumber;
  uint64_t isServiceManatee = objc_msgSend_isServiceManatee(self, v81, v82, v83);
  v87 = objc_msgSend_numberWithBool_(v80, v85, isServiceManatee, v86);
  v88 = NSStringFromSelector(sel_isServiceManatee);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v89, (uint64_t)v87, (uint64_t)v88);

  v90 = NSNumber;
  uint64_t v94 = objc_msgSend_bypassPCSEncryption(self, v91, v92, v93);
  v97 = objc_msgSend_numberWithBool_(v90, v95, v94, v96);
  v98 = NSStringFromSelector(sel_bypassPCSEncryption);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v99, (uint64_t)v97, (uint64_t)v98);

  v100 = NSNumber;
  uint64_t v104 = objc_msgSend_enforceNamedOperationGroups(self, v101, v102, v103);
  v107 = objc_msgSend_numberWithBool_(v100, v105, v104, v106);
  v108 = NSStringFromSelector(sel_enforceNamedOperationGroups);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v107, (uint64_t)v108);

  v110 = NSNumber;
  uint64_t OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v111, v112, v113);
  v117 = objc_msgSend_numberWithBool_(v110, v115, OnlyManatee, v116);
  v118 = NSStringFromSelector(sel_forceEnableReadOnlyManatee);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v119, (uint64_t)v117, (uint64_t)v118);

  v123 = objc_msgSend_uploadRequestConfiguration(self, v120, v121, v122);
  v127 = objc_msgSend_sqliteRepresentation(v123, v124, v125, v126);
  v128 = NSStringFromSelector(sel_uploadRequestConfiguration);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v129, (uint64_t)v127, (uint64_t)v128);

  v130 = NSNumber;
  uint64_t v134 = objc_msgSend_forceEnableReadOnlyManatee(self, v131, v132, v133);
  v137 = objc_msgSend_numberWithBool_(v130, v135, v134, v136);
  v138 = NSStringFromSelector(sel_forceEnableReadOnlyManatee);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v139, (uint64_t)v137, (uint64_t)v138);

  v143 = objc_msgSend_personaIdentifier(self, v140, v141, v142);
  v144 = NSStringFromSelector(sel_personaIdentifier);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v145, (uint64_t)v143, (uint64_t)v144);

  v146 = NSNumber;
  uint64_t v150 = objc_msgSend_useClearAssetEncryption(self, v147, v148, v149);
  v153 = objc_msgSend_numberWithBool_(v146, v151, v150, v152);
  v154 = NSStringFromSelector(sel_useClearAssetEncryption);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v155, (uint64_t)v153, (uint64_t)v154);

  v159 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v156, v157, v158);
  v160 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v161, (uint64_t)v159, (uint64_t)v160);

  v165 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v162, v163, v164);
  v166 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v167, (uint64_t)v165, (uint64_t)v166);

  v171 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v168, v169, v170);
  v172 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v173, (uint64_t)v171, (uint64_t)v172);

  v177 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v174, v175, v176);
  v178 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v179, (uint64_t)v177, (uint64_t)v178);

  v183 = objc_msgSend_fakeEntitlements(self, v180, v181, v182);
  v184 = NSStringFromSelector(sel_fakeEntitlements);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v185, (uint64_t)v183, (uint64_t)v184);

  v186 = NSNumber;
  uint64_t v190 = objc_msgSend_useAnonymousToServerShareParticipants(self, v187, v188, v189);
  v193 = objc_msgSend_numberWithBool_(v186, v191, v190, v192);
  v194 = NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v195, (uint64_t)v193, (uint64_t)v194);

  v196 = NSNumber;
  uint64_t v200 = objc_msgSend_encryptMergeableValueMetadata(self, v197, v198, v199);
  v203 = objc_msgSend_numberWithBool_(v196, v201, v200, v202);
  v204 = NSStringFromSelector(sel_encryptMergeableValueMetadata);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v205, (uint64_t)v203, (uint64_t)v204);

  v209 = objc_msgSend_testDeviceReferenceProtocol(self, v206, v207, v208);
  v213 = objc_msgSend_sqliteRepresentation(v209, v210, v211, v212);
  v214 = NSStringFromSelector(sel_testDeviceReferenceProtocol);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v215, (uint64_t)v213, (uint64_t)v214);

  v216 = NSNumber;
  uint64_t v220 = objc_msgSend_returnRequestOperationProto(self, v217, v218, v219);
  v223 = objc_msgSend_numberWithBool_(v216, v221, v220, v222);
  v224 = NSStringFromSelector(sel_returnRequestOperationProto);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v225, (uint64_t)v223, (uint64_t)v224);

  v226 = NSNumber;
  uint64_t v230 = objc_msgSend_maintainRecordUploadOrder(self, v227, v228, v229);
  v233 = objc_msgSend_numberWithBool_(v226, v231, v230, v232);
  v234 = NSStringFromSelector(sel_maintainRecordUploadOrder);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v235, (uint64_t)v233, (uint64_t)v234);

  v236 = NSNumber;
  uint64_t v240 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v237, v238, v239);
  v243 = objc_msgSend_numberWithBool_(v236, v241, v240, v242);
  v244 = NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v245, (uint64_t)v243, (uint64_t)v244);

  v246 = NSNumber;
  uint64_t ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v247, v248, v249);
  v253 = objc_msgSend_numberWithBool_(v246, v251, ChangesForMergeableValues, v252);
  v254 = NSStringFromSelector(sel_fetchChangesForMergeableValues);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v255, (uint64_t)v253, (uint64_t)v254);

  v256 = NSNumber;
  uint64_t v260 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v257, v258, v259);
  v263 = objc_msgSend_numberWithBool_(v256, v261, v260, v262);
  v264 = NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v265, (uint64_t)v263, (uint64_t)v264);

  v269 = objc_msgSend_supportedDeviceCapabilities(self, v266, v267, v268);

  if (v269)
  {
    v273 = objc_msgSend_supportedDeviceCapabilities(self, v270, v271, v272);
    v276 = objc_msgSend_sqliteRepresentations_(CKDeviceCapability, v274, (uint64_t)v273, v275);
    v277 = NSStringFromSelector(sel_supportedDeviceCapabilities);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v278, (uint64_t)v276, (uint64_t)v277);
  }
  else
  {
    v273 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v270, v271, v272);
    v276 = NSStringFromSelector(sel_supportedDeviceCapabilities);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v279, (uint64_t)v273, (uint64_t)v276);
  }

  v283 = objc_msgSend_immediateUseDatabaseScopeForTesting(self, v280, v281, v282);
  v284 = NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v285, (uint64_t)v283, (uint64_t)v284);

  id v294 = 0;
  v287 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v286, (uint64_t)v3, 0, &v294);
  id v288 = v294;
  if (v288)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v289 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v296 = v288;
      _os_log_error_impl(&dword_18AF10000, v289, OS_LOG_TYPE_ERROR, "Error converting CKContainerOptions to JSON: %@", buf, 0xCu);
    }
  }
  id v290 = [NSString alloc];
  v292 = objc_msgSend_initWithData_encoding_(v290, v291, (uint64_t)v287, 4);

  return v292;
}

- (void)encodeWithCoder:(id)a3
{
  id v188 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_captureResponseHTTPHeaders(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_captureResponseHTTPHeaders);
  objc_msgSend_encodeBool_forKey_(v188, v10, v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_useZoneWidePCS(self, v11, v12, v13);
  v15 = NSStringFromSelector(sel_useZoneWidePCS);
  objc_msgSend_encodeBool_forKey_(v188, v16, v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_holdAllOperations(self, v17, v18, v19);
  v21 = NSStringFromSelector(sel_holdAllOperations);
  objc_msgSend_encodeBool_forKey_(v188, v22, v20, (uint64_t)v21);

  uint64_t v26 = objc_msgSend_accountOverrideInfo(self, v23, v24, v25);
  uint64_t v27 = NSStringFromSelector(sel_accountOverrideInfo);
  objc_msgSend_encodeObject_forKey_(v188, v28, (uint64_t)v26, (uint64_t)v27);

  uint64_t v32 = objc_msgSend_qualityOfService(self, v29, v30, v31);
  v33 = NSStringFromSelector(sel_qualityOfService);
  objc_msgSend_encodeInteger_forKey_(v188, v34, v32, (uint64_t)v33);

  uint64_t v38 = objc_msgSend_returnPCSMetadata(self, v35, v36, v37);
  uint64_t v39 = NSStringFromSelector(sel_returnPCSMetadata);
  objc_msgSend_encodeBool_forKey_(v188, v40, v38, (uint64_t)v39);

  uint64_t v44 = objc_msgSend_mmcsEncryptionSupport(self, v41, v42, v43);
  v45 = NSStringFromSelector(sel_mmcsEncryptionSupport);
  objc_msgSend_encodeInteger_forKey_(v188, v46, v44, (uint64_t)v45);

  uint64_t v50 = objc_msgSend_encryptionServiceName(self, v47, v48, v49);
  v51 = NSStringFromSelector(sel_encryptionServiceName);
  objc_msgSend_encodeObject_forKey_(v188, v52, (uint64_t)v50, (uint64_t)v51);

  uint64_t isServiceManatee = objc_msgSend_isServiceManatee(self, v53, v54, v55);
  uint64_t v57 = NSStringFromSelector(sel_isServiceManatee);
  objc_msgSend_encodeBool_forKey_(v188, v58, isServiceManatee, (uint64_t)v57);

  uint64_t v62 = objc_msgSend_bypassPCSEncryption(self, v59, v60, v61);
  v63 = NSStringFromSelector(sel_bypassPCSEncryption);
  objc_msgSend_encodeBool_forKey_(v188, v64, v62, (uint64_t)v63);

  uint64_t v68 = objc_msgSend_enforceNamedOperationGroups(self, v65, v66, v67);
  v69 = NSStringFromSelector(sel_enforceNamedOperationGroups);
  objc_msgSend_encodeBool_forKey_(v188, v70, v68, (uint64_t)v69);

  uint64_t OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v71, v72, v73);
  uint64_t v75 = NSStringFromSelector(sel_forceEnableReadOnlyManatee);
  objc_msgSend_encodeBool_forKey_(v188, v76, OnlyManatee, (uint64_t)v75);

  v80 = objc_msgSend_uploadRequestConfiguration(self, v77, v78, v79);
  v81 = NSStringFromSelector(sel_uploadRequestConfiguration);
  objc_msgSend_encodeObject_forKey_(v188, v82, (uint64_t)v80, (uint64_t)v81);

  uint64_t v86 = objc_msgSend_personaIdentifier(self, v83, v84, v85);
  v87 = NSStringFromSelector(sel_personaIdentifier);
  objc_msgSend_encodeObject_forKey_(v188, v88, (uint64_t)v86, (uint64_t)v87);

  uint64_t v92 = objc_msgSend_useClearAssetEncryption(self, v89, v90, v91);
  uint64_t v93 = NSStringFromSelector(sel_useClearAssetEncryption);
  objc_msgSend_encodeBool_forKey_(v188, v94, v92, (uint64_t)v93);

  v98 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v95, v96, v97);
  v99 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
  objc_msgSend_encodeObject_forKey_(v188, v100, (uint64_t)v98, (uint64_t)v99);

  uint64_t v104 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v101, v102, v103);
  v105 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
  objc_msgSend_encodeObject_forKey_(v188, v106, (uint64_t)v104, (uint64_t)v105);

  v110 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v107, v108, v109);
  v111 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
  objc_msgSend_encodeObject_forKey_(v188, v112, (uint64_t)v110, (uint64_t)v111);

  uint64_t v116 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v113, v114, v115);
  v117 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
  objc_msgSend_encodeObject_forKey_(v188, v118, (uint64_t)v116, (uint64_t)v117);

  uint64_t v122 = objc_msgSend_fakeEntitlements(self, v119, v120, v121);
  v123 = NSStringFromSelector(sel_fakeEntitlements);
  objc_msgSend_encodeObject_forKey_(v188, v124, (uint64_t)v122, (uint64_t)v123);

  uint64_t v128 = objc_msgSend_useAnonymousToServerShareParticipants(self, v125, v126, v127);
  v129 = NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
  objc_msgSend_encodeBool_forKey_(v188, v130, v128, (uint64_t)v129);

  uint64_t v134 = objc_msgSend_encryptMergeableValueMetadata(self, v131, v132, v133);
  v135 = NSStringFromSelector(sel_encryptMergeableValueMetadata);
  objc_msgSend_encodeBool_forKey_(v188, v136, v134, (uint64_t)v135);

  if (__sTestOverridesAvailable)
  {
    v140 = objc_msgSend_testDeviceReferenceProtocol(self, v137, v138, v139);
    uint64_t v141 = NSStringFromSelector(sel_testDeviceReferenceProtocol);
    objc_msgSend_encodeObject_forKey_(v188, v142, (uint64_t)v140, (uint64_t)v141);
  }
  uint64_t v143 = objc_msgSend_returnRequestOperationProto(self, v137, v138, v139);
  v144 = NSStringFromSelector(sel_returnRequestOperationProto);
  objc_msgSend_encodeBool_forKey_(v188, v145, v143, (uint64_t)v144);

  uint64_t v149 = objc_msgSend_maintainRecordUploadOrder(self, v146, v147, v148);
  uint64_t v150 = NSStringFromSelector(sel_maintainRecordUploadOrder);
  objc_msgSend_encodeBool_forKey_(v188, v151, v149, (uint64_t)v150);

  uint64_t v155 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v152, v153, v154);
  v156 = NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
  objc_msgSend_encodeBool_forKey_(v188, v157, v155, (uint64_t)v156);

  uint64_t ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v158, v159, v160);
  v162 = NSStringFromSelector(sel_fetchChangesForMergeableValues);
  objc_msgSend_encodeBool_forKey_(v188, v163, ChangesForMergeableValues, (uint64_t)v162);

  uint64_t v167 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v164, v165, v166);
  v168 = NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
  objc_msgSend_encodeBool_forKey_(v188, v169, v167, (uint64_t)v168);

  uint64_t v173 = objc_msgSend_acceptServerSignedRecords(self, v170, v171, v172);
  v174 = NSStringFromSelector(sel_acceptServerSignedRecords);
  objc_msgSend_encodeBool_forKey_(v188, v175, v173, (uint64_t)v174);

  v179 = objc_msgSend_supportedDeviceCapabilities(self, v176, v177, v178);
  v180 = NSStringFromSelector(sel_supportedDeviceCapabilities);
  objc_msgSend_encodeObject_forKey_(v188, v181, (uint64_t)v179, (uint64_t)v180);

  v185 = objc_msgSend_immediateUseDatabaseScopeForTesting(self, v182, v183, v184);
  v186 = NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
  objc_msgSend_encodeObject_forKey_(v188, v187, (uint64_t)v185, (uint64_t)v186);
}

- (NSString)applicationBundleIdentifierOverrideForTCC
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)applicationBundleIdentifierOverrideForPushTopicGeneration
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (CKAccountOverrideInfo)accountOverrideInfo
{
  return (CKAccountOverrideInfo *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)forceEnableReadOnlyManatee
{
  return self->_forceEnableReadOnlyManatee;
}

- (BOOL)bypassPCSEncryption
{
  return self->_bypassPCSEncryption;
}

- (BOOL)holdAllOperations
{
  return self->_holdAllOperations;
}

- (BOOL)useZoneWidePCS
{
  return self->_useZoneWidePCS;
}

- (BOOL)useClearAssetEncryption
{
  return self->_useClearAssetEncryption;
}

- (BOOL)useAnonymousToServerShareParticipants
{
  return self->_useAnonymousToServerShareParticipants;
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return (CKUploadRequestConfiguration *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)supportedDeviceCapabilities
{
  return self->_supportedDeviceCapabilities;
}

- (BOOL)returnRequestOperationProto
{
  return self->_returnRequestOperationProto;
}

- (BOOL)returnPCSMetadata
{
  return self->_returnPCSMetadata;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (BOOL)prefersHiddenAllowedSharingOptionsUI
{
  return self->_prefersHiddenAllowedSharingOptionsUI;
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)mmcsEncryptionSupport
{
  return self->_mmcsEncryptionSupport;
}

- (BOOL)maintainRecordUploadOrder
{
  return self->_maintainRecordUploadOrder;
}

- (BOOL)isServiceManatee
{
  return self->_isServiceManatee;
}

- (NSNumber)immediateUseDatabaseScopeForTesting
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)fetchChangesForMergeableValues
{
  return self->_fetchChangesForMergeableValues;
}

- (NSDictionary)fakeEntitlements
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fakeEntitlements;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)enforceNamedOperationGroups
{
  return self->_enforceNamedOperationGroups;
}

- (NSString)encryptionServiceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)encryptMergeableValueMetadata
{
  return self->_encryptMergeableValueMetadata;
}

- (BOOL)captureResponseHTTPHeaders
{
  return self->_captureResponseHTTPHeaders;
}

- (BOOL)addDatabaseScopeToZoneIDs
{
  return self->_addDatabaseScopeToZoneIDs;
}

- (BOOL)acceptServerSignedRecords
{
  return self->_acceptServerSignedRecords;
}

- (CKTestDeviceReferenceProtocol)testDeviceReferenceProtocol
{
  return (CKTestDeviceReferenceProtocol *)objc_getProperty(self, a2, 136, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContainerOptions)initWithCoder:(id)a3
{
  v136[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v135.receiver = self;
  v135.super_class = (Class)CKContainerOptions;
  uint64_t v5 = [(CKContainerOptions *)&v135 init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_captureResponseHTTPHeaders);
    v5->_captureResponseHTTPHeaders = objc_msgSend_decodeBoolForKey_(v4, v7, (uint64_t)v6, v8);

    uint64_t v9 = NSStringFromSelector(sel_useZoneWidePCS);
    v5->_useZoneWidePCS = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)v9, v11);

    uint64_t v12 = NSStringFromSelector(sel_holdAllOperations);
    v5->_holdAllOperations = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)v12, v14);

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = NSStringFromSelector(sel_accountOverrideInfo);
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    accountOverrideInfo = v5->_accountOverrideInfo;
    v5->_accountOverrideInfo = (CKAccountOverrideInfo *)v18;

    uint64_t v20 = NSStringFromSelector(sel_qualityOfService);
    v5->_qualityOfService = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)v20, v22);

    v23 = NSStringFromSelector(sel_returnPCSMetadata);
    v5->_returnPCSMetadata = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)v23, v25);

    uint64_t v26 = NSStringFromSelector(sel_mmcsEncryptionSupport);
    v5->_mmcsEncryptionSupport = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)v26, v28);

    uint64_t v29 = objc_opt_class();
    uint64_t v30 = NSStringFromSelector(sel_encryptionServiceName);
    uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v29, (uint64_t)v30);
    encryptionServiceName = v5->_encryptionServiceName;
    v5->_encryptionServiceName = (NSString *)v32;

    v34 = NSStringFromSelector(sel_isServiceManatee);
    v5->_uint64_t isServiceManatee = objc_msgSend_decodeBoolForKey_(v4, v35, (uint64_t)v34, v36);

    uint64_t v37 = NSStringFromSelector(sel_bypassPCSEncryption);
    v5->_bypassPCSEncryption = objc_msgSend_decodeBoolForKey_(v4, v38, (uint64_t)v37, v39);

    uint64_t v40 = NSStringFromSelector(sel_enforceNamedOperationGroups);
    v5->_enforceNamedOperationGroups = objc_msgSend_decodeBoolForKey_(v4, v41, (uint64_t)v40, v42);

    uint64_t v43 = NSStringFromSelector(sel_forceEnableReadOnlyManatee);
    v5->_forceEnableReaduint64_t OnlyManatee = objc_msgSend_decodeBoolForKey_(v4, v44, (uint64_t)v43, v45);

    uint64_t v46 = objc_opt_class();
    uint64_t v47 = NSStringFromSelector(sel_uploadRequestConfiguration);
    uint64_t v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v46, (uint64_t)v47);
    uploadRequestConfiguration = v5->_uploadRequestConfiguration;
    v5->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v49;

    uint64_t v51 = objc_opt_class();
    v52 = NSStringFromSelector(sel_personaIdentifier);
    uint64_t v54 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v51, (uint64_t)v52);
    personaIdentifier = v5->_personaIdentifier;
    v5->_personaIdentifier = (NSString *)v54;

    uint64_t v56 = NSStringFromSelector(sel_useClearAssetEncryption);
    v5->_useClearAssetEncryption = objc_msgSend_decodeBoolForKey_(v4, v57, (uint64_t)v56, v58);

    uint64_t v59 = objc_opt_class();
    uint64_t v60 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v61, v59, (uint64_t)v60);
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v62;

    uint64_t v64 = objc_opt_class();
    v65 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    uint64_t v67 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v66, v64, (uint64_t)v65);
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v67;

    uint64_t v69 = objc_opt_class();
    uint64_t v70 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    uint64_t v72 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v71, v69, (uint64_t)v70);
    applicationBundleIdentifierOverrideForPushTopicGeneration = v5->_applicationBundleIdentifierOverrideForPushTopicGeneration;
    v5->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v72;

    uint64_t v74 = objc_opt_class();
    uint64_t v75 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    uint64_t v77 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v74, (uint64_t)v75);
    applicationBundleIdentifierOverrideForTCC = v5->_applicationBundleIdentifierOverrideForTCC;
    v5->_applicationBundleIdentifierOverrideForTCC = (NSString *)v77;

    uint64_t v79 = (void *)MEMORY[0x1E4F1CAD0];
    v136[0] = objc_opt_class();
    v136[1] = objc_opt_class();
    v136[2] = objc_opt_class();
    v136[3] = objc_opt_class();
    v136[4] = objc_opt_class();
    v81 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v80, (uint64_t)v136, 5);
    uint64_t v84 = objc_msgSend_setWithArray_(v79, v82, (uint64_t)v81, v83);
    uint64_t v85 = NSStringFromSelector(sel_fakeEntitlements);
    uint64_t v87 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v84, (uint64_t)v85);
    fakeEntitlements = v5->_fakeEntitlements;
    v5->_fakeEntitlements = (NSDictionary *)v87;

    v89 = NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
    v5->_useAnonymousToServerShareParticipants = objc_msgSend_decodeBoolForKey_(v4, v90, (uint64_t)v89, v91);

    uint64_t v92 = NSStringFromSelector(sel_encryptMergeableValueMetadata);
    v5->_encryptMergeableValueMetadata = objc_msgSend_decodeBoolForKey_(v4, v93, (uint64_t)v92, v94);

    if (__sTestOverridesAvailable)
    {
      id v95 = sub_18B072758();
      uint64_t v96 = NSStringFromSelector(sel_testDeviceReferenceProtocol);
      uint64_t v98 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v97, (uint64_t)v95, (uint64_t)v96);
      testDeviceReferenceProtocol = v5->_testDeviceReferenceProtocol;
      v5->_testDeviceReferenceProtocol = (CKTestDeviceReferenceProtocol *)v98;
    }
    v100 = NSStringFromSelector(sel_returnRequestOperationProto);
    v5->_returnRequestOperationProto = objc_msgSend_decodeBoolForKey_(v4, v101, (uint64_t)v100, v102);

    uint64_t v103 = NSStringFromSelector(sel_maintainRecordUploadOrder);
    v5->_maintainRecordUploadOrder = objc_msgSend_decodeBoolForKey_(v4, v104, (uint64_t)v103, v105);

    uint64_t v106 = NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
    v5->_addDatabaseScopeToZoneIDs = objc_msgSend_decodeBoolForKey_(v4, v107, (uint64_t)v106, v108);

    uint64_t v109 = NSStringFromSelector(sel_fetchChangesForMergeableValues);
    v5->_fetchuint64_t ChangesForMergeableValues = objc_msgSend_decodeBoolForKey_(v4, v110, (uint64_t)v109, v111);

    uint64_t v112 = NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
    v5->_prefersHiddenAllowedSharingOptionsUI = objc_msgSend_decodeBoolForKey_(v4, v113, (uint64_t)v112, v114);

    uint64_t v115 = NSStringFromSelector(sel_acceptServerSignedRecords);
    v5->_acceptServerSignedRecords = objc_msgSend_decodeBoolForKey_(v4, v116, (uint64_t)v115, v117);

    v118 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v119 = objc_opt_class();
    uint64_t v120 = objc_opt_class();
    uint64_t v121 = objc_opt_class();
    v124 = objc_msgSend_setWithObjects_(v118, v122, v119, v123, v120, v121, 0);
    uint64_t v125 = NSStringFromSelector(sel_supportedDeviceCapabilities);
    uint64_t v127 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v126, (uint64_t)v124, (uint64_t)v125);
    supportedDeviceCapabilities = v5->_supportedDeviceCapabilities;
    v5->_supportedDeviceCapabilities = (NSArray *)v127;

    uint64_t v129 = objc_opt_class();
    v130 = NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
    uint64_t v132 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v131, v129, (uint64_t)v130);
    immediateUseDatabaseScopeForTesting = v5->_immediateUseDatabaseScopeForTesting;
    v5->_immediateUseDatabaseScopeForTesting = (NSNumber *)v132;
  }
  return v5;
}

- (CKContainerOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKContainerOptions;
  result = [(CKContainerOptions *)&v3 init];
  if (result)
  {
    result->_mmcsEncryptionSupport = 1;
    result->_qualityOfService = -1;
  }
  return result;
}

- (void)setUseMMCSEncryptionV2:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  ((void (*)(CKContainerOptions *, char *, uint64_t))MEMORY[0x1F4181798])(self, sel_setMmcsEncryptionSupport_, v3);
}

- (void)setFakeEntitlements:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  fakeEntitlements = v4->_fakeEntitlements;
  v4->_fakeEntitlements = (NSDictionary *)v8;

  objc_sync_exit(v4);
}

- (id)CKShortDescriptionRedact:(BOOL)a3
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_CKDescriptionClassName(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_hash(self, v7, v8, v9);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v5, v11, @"%@:(%tu)", v12, v6, v10);

  return v13;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v174 = a3;
  uint64_t v7 = objc_msgSend_captureResponseHTTPHeaders(self, v4, v5, v6);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v8, @"captureResponseHTTPHeaders", v7, 0);
  uint64_t v12 = objc_msgSend_useZoneWidePCS(self, v9, v10, v11);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v13, @"useZoneWidePCS", v12, 0);
  uint64_t v17 = objc_msgSend_holdAllOperations(self, v14, v15, v16);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v18, @"holdAllOperations", v17, 0);
  uint64_t v22 = objc_msgSend_accountOverrideInfo(self, v19, v20, v21);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v23, @"accountOverrideInfo", (uint64_t)v22, 1);

  if (objc_msgSend_qualityOfService(self, v24, v25, v26) != -1)
  {
    uint64_t v30 = objc_msgSend_qualityOfService(self, v27, v28, v29);
    v34 = CKStringForQOS(v30, v31, v32, v33);
    objc_msgSend_addProperty_value_shouldRedact_(v174, v35, @"qualityOfService", (uint64_t)v34, 0);
  }
  uint64_t v36 = objc_msgSend_returnPCSMetadata(self, v27, v28, v29);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v37, @"returnPCSMetadata", v36, 0);
  if (objc_msgSend_mmcsEncryptionSupport(self, v38, v39, v40) != 1)
  {
    uint64_t v44 = objc_msgSend_mmcsEncryptionSupport(self, v41, v42, v43);
    uint64_t v45 = CKStringFromCKMMCSEncryptionSupport(v44);
    objc_msgSend_addProperty_value_shouldRedact_(v174, v46, @"mmcsEncryptionSupport", (uint64_t)v45, 0);
  }
  uint64_t v47 = objc_msgSend_encryptionServiceName(self, v41, v42, v43);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v48, @"encryptionServiceName", (uint64_t)v47, 0);

  uint64_t isServiceManatee = objc_msgSend_isServiceManatee(self, v49, v50, v51);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v53, @"isServiceManatee", isServiceManatee, 0);
  uint64_t v57 = objc_msgSend_bypassPCSEncryption(self, v54, v55, v56);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v58, @"bypassPCSEncryption", v57, 0);
  uint64_t v62 = objc_msgSend_enforceNamedOperationGroups(self, v59, v60, v61);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v63, @"enforceNamedOperationGroups", v62, 0);
  uint64_t OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v64, v65, v66);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v68, @"forceEnableReadOnlyManatee", OnlyManatee, 0);
  uint64_t v72 = objc_msgSend_uploadRequestConfiguration(self, v69, v70, v71);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v73, @"uploadRequestConfiguration", (uint64_t)v72, 1);

  uint64_t v77 = objc_msgSend_forceEnableReadOnlyManatee(self, v74, v75, v76);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v78, @"forceEnableReadOnlyManatee", v77, 0);
  uint64_t v82 = objc_msgSend_personaIdentifier(self, v79, v80, v81);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v83, @"personaIdentifier", (uint64_t)v82, 0);

  uint64_t v87 = objc_msgSend_useClearAssetEncryption(self, v84, v85, v86);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v88, @"useClearAssetEncryption", v87, 0);
  uint64_t v92 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v89, v90, v91);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v93, @"applicationBundleIdentifierOverrideForContainerAccess", (uint64_t)v92, 0);

  uint64_t v97 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v94, v95, v96);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v98, @"applicationBundleIdentifierOverrideForNetworkAttribution", (uint64_t)v97, 0);

  uint64_t v102 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v99, v100, v101);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v103, @"applicationBundleIdentifierOverrideForPushTopicGeneration", (uint64_t)v102, 0);

  v107 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v104, v105, v106);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v108, @"applicationBundleIdentifierOverrideForTCC", (uint64_t)v107, 0);

  uint64_t v112 = objc_msgSend_fakeEntitlements(self, v109, v110, v111);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v113, @"fakeEntitlements", (uint64_t)v112, 0);

  uint64_t v117 = objc_msgSend_useAnonymousToServerShareParticipants(self, v114, v115, v116);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v118, @"useAnonymousToServerShareParticipants", v117, 0);
  uint64_t v122 = objc_msgSend_encryptMergeableValueMetadata(self, v119, v120, v121);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v123, @"encryptMergeableValueMetadata", v122, 0);
  uint64_t v127 = objc_msgSend_testDeviceReferenceProtocol(self, v124, v125, v126);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v128, @"testDeviceReferenceProtocol", (uint64_t)v127, 0);

  uint64_t v132 = objc_msgSend_returnRequestOperationProto(self, v129, v130, v131);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v133, @"returnRequestOperationProto", v132, 0);
  uint64_t v137 = objc_msgSend_maintainRecordUploadOrder(self, v134, v135, v136);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v138, @"maintainRecordUploadOrder", v137, 0);
  uint64_t v142 = objc_msgSend_addDatabaseScopeToZoneIDs(self, v139, v140, v141);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v143, @"addDatabaseScopeToZoneIDs", v142, 0);
  uint64_t ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v144, v145, v146);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v148, @"fetchChangesForMergeableValues", ChangesForMergeableValues, 0);
  uint64_t v152 = objc_msgSend_fetchChangesForMergeableValues(self, v149, v150, v151);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v153, @"fetchChangesForMergeableValues", v152, 0);
  uint64_t v157 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v154, v155, v156);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v158, @"prefersHiddenAllowedSharingOptionsUI", v157, 0);
  uint64_t v162 = objc_msgSend_acceptServerSignedRecords(self, v159, v160, v161);
  objc_msgSend_addBooleanProperty_value_defaultValue_(v174, v163, @"acceptServerSignedRecords", v162, 0);
  uint64_t v167 = objc_msgSend_supportedDeviceCapabilities(self, v164, v165, v166);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v168, @"supportedDeviceCapabilities", (uint64_t)v167, 0);

  uint64_t v172 = objc_msgSend_immediateUseDatabaseScopeForTesting(self, v169, v170, v171);
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v174, v173, @"immediateUseDatabaseScopeForTesting", (uint64_t)v172, 0);
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKContainerOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKContainerOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKContainerOptions);
  v4->_captureResponseHTTPHeaders = objc_msgSend_captureResponseHTTPHeaders(self, v5, v6, v7);
  v4->_useZoneWidePCS = objc_msgSend_useZoneWidePCS(self, v8, v9, v10);
  v4->_holdAllOperations = objc_msgSend_holdAllOperations(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_accountOverrideInfo(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  accountOverrideInfo = v4->_accountOverrideInfo;
  v4->_accountOverrideInfo = (CKAccountOverrideInfo *)v21;

  v4->_qualityOfService = objc_msgSend_qualityOfService(self, v23, v24, v25);
  v4->_returnPCSMetadata = objc_msgSend_returnPCSMetadata(self, v26, v27, v28);
  v4->_mmcsEncryptionSupport = objc_msgSend_mmcsEncryptionSupport(self, v29, v30, v31);
  uint64_t v35 = objc_msgSend_encryptionServiceName(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_copy(v35, v36, v37, v38);
  encryptionServiceName = v4->_encryptionServiceName;
  v4->_encryptionServiceName = (NSString *)v39;

  v4->_uint64_t isServiceManatee = objc_msgSend_isServiceManatee(self, v41, v42, v43);
  v4->_bypassPCSEncryption = objc_msgSend_bypassPCSEncryption(self, v44, v45, v46);
  v4->_enforceNamedOperationGroups = objc_msgSend_enforceNamedOperationGroups(self, v47, v48, v49);
  v4->_forceEnableReaduint64_t OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(self, v50, v51, v52);
  uint64_t v56 = objc_msgSend_uploadRequestConfiguration(self, v53, v54, v55);
  uploadRequestConfiguration = v4->_uploadRequestConfiguration;
  v4->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v56;

  uint64_t v61 = objc_msgSend_personaIdentifier(self, v58, v59, v60);
  uint64_t v65 = objc_msgSend_copy(v61, v62, v63, v64);
  personaIdentifier = v4->_personaIdentifier;
  v4->_personaIdentifier = (NSString *)v65;

  v4->_useClearAssetEncryption = objc_msgSend_useClearAssetEncryption(self, v67, v68, v69);
  uint64_t v73 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v70, v71, v72);
  uint64_t v77 = objc_msgSend_copy(v73, v74, v75, v76);
  applicationBundleIdentifierOverrideForContainerAccess = v4->_applicationBundleIdentifierOverrideForContainerAccess;
  v4->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v77;

  uint64_t v82 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v79, v80, v81);
  uint64_t v86 = objc_msgSend_copy(v82, v83, v84, v85);
  applicationBundleIdentifierOverrideForNetworkAttribution = v4->_applicationBundleIdentifierOverrideForNetworkAttribution;
  v4->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v86;

  uint64_t v91 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v88, v89, v90);
  uint64_t v95 = objc_msgSend_copy(v91, v92, v93, v94);
  applicationBundleIdentifierOverrideForPushTopicGeneration = v4->_applicationBundleIdentifierOverrideForPushTopicGeneration;
  v4->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v95;

  uint64_t v100 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v97, v98, v99);
  uint64_t v104 = objc_msgSend_copy(v100, v101, v102, v103);
  applicationBundleIdentifierOverrideForTCC = v4->_applicationBundleIdentifierOverrideForTCC;
  v4->_applicationBundleIdentifierOverrideForTCC = (NSString *)v104;

  uint64_t v109 = objc_msgSend_fakeEntitlements(self, v106, v107, v108);
  uint64_t v113 = objc_msgSend_CKDeepCopy(v109, v110, v111, v112);
  fakeEntitlements = v4->_fakeEntitlements;
  v4->_fakeEntitlements = (NSDictionary *)v113;

  v4->_useAnonymousToServerShareParticipants = objc_msgSend_useAnonymousToServerShareParticipants(self, v115, v116, v117);
  v4->_encryptMergeableValueMetadata = objc_msgSend_encryptMergeableValueMetadata(self, v118, v119, v120);
  uint64_t v124 = objc_msgSend_testDeviceReferenceProtocol(self, v121, v122, v123);
  testDeviceReferenceProtocol = v4->_testDeviceReferenceProtocol;
  v4->_testDeviceReferenceProtocol = (CKTestDeviceReferenceProtocol *)v124;

  v4->_returnRequestOperationProto = objc_msgSend_returnRequestOperationProto(self, v126, v127, v128);
  v4->_maintainRecordUploadOrder = objc_msgSend_maintainRecordUploadOrder(self, v129, v130, v131);
  v4->_addDatabaseScopeToZoneIDs = objc_msgSend_addDatabaseScopeToZoneIDs(self, v132, v133, v134);
  v4->_fetchuint64_t ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(self, v135, v136, v137);
  v4->_prefersHiddenAllowedSharingOptionsUI = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v138, v139, v140);
  v4->_acceptServerSignedRecords = objc_msgSend_acceptServerSignedRecords(self, v141, v142, v143);
  uint64_t v147 = objc_msgSend_supportedDeviceCapabilities(self, v144, v145, v146);
  supportedDeviceCapabilities = v4->_supportedDeviceCapabilities;
  v4->_supportedDeviceCapabilities = (NSArray *)v147;

  uint64_t v152 = objc_msgSend_immediateUseDatabaseScopeForTesting(self, v149, v150, v151);
  uint64_t v156 = objc_msgSend_copy(v152, v153, v154, v155);
  immediateUseDatabaseScopeForTesting = v4->_immediateUseDatabaseScopeForTesting;
  v4->_immediateUseDatabaseScopeForTesting = (NSNumber *)v156;

  return v4;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_accountOverrideInfo(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_personaIdentifier(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  uint64_t v21 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);

  uint64_t v29 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v26, v27, v28);
  uint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  uint64_t v37 = objc_msgSend_fakeEntitlements(self, v34, v35, v36);
  unint64_t v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKContainerOptions *)a3;
  if (self == v4)
  {
    char v246 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int v9 = objc_msgSend_captureResponseHTTPHeaders(v5, v6, v7, v8);
      if (v9 != objc_msgSend_captureResponseHTTPHeaders(self, v10, v11, v12)) {
        goto LABEL_36;
      }
      int v16 = objc_msgSend_useZoneWidePCS(v5, v13, v14, v15);
      if (v16 != objc_msgSend_useZoneWidePCS(self, v17, v18, v19)) {
        goto LABEL_36;
      }
      int v23 = objc_msgSend_holdAllOperations(v5, v20, v21, v22);
      if (v23 != objc_msgSend_holdAllOperations(self, v24, v25, v26)) {
        goto LABEL_36;
      }
      uint64_t v30 = objc_msgSend_accountOverrideInfo(v5, v27, v28, v29);
      uint64_t v34 = objc_msgSend_accountOverrideInfo(self, v31, v32, v33);
      int v35 = CKObjectsAreBothNilOrEqual(v30, v34);

      if (!v35) {
        goto LABEL_36;
      }
      uint64_t v39 = objc_msgSend_qualityOfService(v5, v36, v37, v38);
      if (v39 != objc_msgSend_qualityOfService(self, v40, v41, v42)) {
        goto LABEL_36;
      }
      int v46 = objc_msgSend_returnPCSMetadata(v5, v43, v44, v45);
      if (v46 != objc_msgSend_returnPCSMetadata(self, v47, v48, v49)) {
        goto LABEL_36;
      }
      uint64_t v53 = objc_msgSend_mmcsEncryptionSupport(v5, v50, v51, v52);
      if (v53 != objc_msgSend_mmcsEncryptionSupport(self, v54, v55, v56)) {
        goto LABEL_36;
      }
      uint64_t v60 = objc_msgSend_encryptionServiceName(v5, v57, v58, v59);
      uint64_t v64 = objc_msgSend_encryptionServiceName(self, v61, v62, v63);
      int v65 = CKObjectsAreBothNilOrEqual(v60, v64);

      if (!v65) {
        goto LABEL_36;
      }
      int isServiceManatee = objc_msgSend_isServiceManatee(v5, v66, v67, v68);
      if (isServiceManatee != objc_msgSend_isServiceManatee(self, v70, v71, v72)) {
        goto LABEL_36;
      }
      int v76 = objc_msgSend_bypassPCSEncryption(v5, v73, v74, v75);
      if (v76 != objc_msgSend_bypassPCSEncryption(self, v77, v78, v79)) {
        goto LABEL_36;
      }
      int v83 = objc_msgSend_enforceNamedOperationGroups(v5, v80, v81, v82);
      if (v83 != objc_msgSend_enforceNamedOperationGroups(self, v84, v85, v86)) {
        goto LABEL_36;
      }
      int OnlyManatee = objc_msgSend_forceEnableReadOnlyManatee(v5, v87, v88, v89);
      if (OnlyManatee != objc_msgSend_forceEnableReadOnlyManatee(self, v91, v92, v93)) {
        goto LABEL_36;
      }
      uint64_t v97 = objc_msgSend_uploadRequestConfiguration(v5, v94, v95, v96);
      uint64_t v101 = objc_msgSend_uploadRequestConfiguration(self, v98, v99, v100);
      int v102 = CKObjectsAreBothNilOrEqual(v97, v101);

      if (!v102) {
        goto LABEL_36;
      }
      uint64_t v106 = objc_msgSend_personaIdentifier(v5, v103, v104, v105);
      uint64_t v110 = objc_msgSend_personaIdentifier(self, v107, v108, v109);
      int v111 = CKObjectsAreBothNilOrEqual(v106, v110);

      if (!v111) {
        goto LABEL_36;
      }
      int v115 = objc_msgSend_useClearAssetEncryption(v5, v112, v113, v114);
      if (v115 != objc_msgSend_useClearAssetEncryption(self, v116, v117, v118)) {
        goto LABEL_36;
      }
      uint64_t v122 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v5, v119, v120, v121);
      uint64_t v126 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v123, v124, v125);
      int v127 = CKObjectsAreBothNilOrEqual(v122, v126);

      if (!v127) {
        goto LABEL_36;
      }
      uint64_t v131 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v5, v128, v129, v130);
      uint64_t v135 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v132, v133, v134);
      int v136 = CKObjectsAreBothNilOrEqual(v131, v135);

      if (!v136) {
        goto LABEL_36;
      }
      uint64_t v140 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v5, v137, v138, v139);
      v144 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v141, v142, v143);
      int v145 = CKObjectsAreBothNilOrEqual(v140, v144);

      if (!v145) {
        goto LABEL_36;
      }
      uint64_t v149 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v5, v146, v147, v148);
      uint64_t v153 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v150, v151, v152);
      int v154 = CKObjectsAreBothNilOrEqual(v149, v153);

      if (!v154) {
        goto LABEL_36;
      }
      uint64_t v158 = objc_msgSend_fakeEntitlements(v5, v155, v156, v157);
      uint64_t v162 = objc_msgSend_fakeEntitlements(self, v159, v160, v161);
      int v163 = CKObjectsAreBothNilOrEqual(v158, v162);

      if (!v163) {
        goto LABEL_36;
      }
      int v167 = objc_msgSend_useAnonymousToServerShareParticipants(v5, v164, v165, v166);
      if (v167 != objc_msgSend_useAnonymousToServerShareParticipants(self, v168, v169, v170)) {
        goto LABEL_36;
      }
      int v174 = objc_msgSend_encryptMergeableValueMetadata(v5, v171, v172, v173);
      if (v174 != objc_msgSend_encryptMergeableValueMetadata(self, v175, v176, v177)) {
        goto LABEL_36;
      }
      uint64_t v181 = objc_msgSend_testDeviceReferenceProtocol(v5, v178, v179, v180);
      v185 = objc_msgSend_testDeviceReferenceProtocol(self, v182, v183, v184);
      int v186 = CKObjectsAreBothNilOrEqual(v181, v185);

      if (!v186) {
        goto LABEL_36;
      }
      int v190 = objc_msgSend_returnRequestOperationProto(v5, v187, v188, v189);
      if (v190 != objc_msgSend_returnRequestOperationProto(self, v191, v192, v193)) {
        goto LABEL_36;
      }
      int v197 = objc_msgSend_maintainRecordUploadOrder(v5, v194, v195, v196);
      if (v197 != objc_msgSend_maintainRecordUploadOrder(self, v198, v199, v200)) {
        goto LABEL_36;
      }
      int v204 = objc_msgSend_addDatabaseScopeToZoneIDs(v5, v201, v202, v203);
      if (v204 != objc_msgSend_addDatabaseScopeToZoneIDs(self, v205, v206, v207)) {
        goto LABEL_36;
      }
      int ChangesForMergeableValues = objc_msgSend_fetchChangesForMergeableValues(v5, v208, v209, v210);
      if (ChangesForMergeableValues != objc_msgSend_fetchChangesForMergeableValues(self, v212, v213, v214))goto LABEL_36; {
      int v218 = objc_msgSend_prefersHiddenAllowedSharingOptionsUI(v5, v215, v216, v217);
      }
      if (v218 != objc_msgSend_prefersHiddenAllowedSharingOptionsUI(self, v219, v220, v221)) {
        goto LABEL_36;
      }
      int v225 = objc_msgSend_acceptServerSignedRecords(v5, v222, v223, v224);
      if (v225 != objc_msgSend_acceptServerSignedRecords(self, v226, v227, v228)) {
        goto LABEL_36;
      }
      uint64_t v232 = objc_msgSend_supportedDeviceCapabilities(v5, v229, v230, v231);
      v236 = objc_msgSend_supportedDeviceCapabilities(self, v233, v234, v235);
      int v237 = CKObjectsAreBothNilOrEqual(v232, v236);

      if (v237)
      {
        v241 = objc_msgSend_immediateUseDatabaseScopeForTesting(v5, v238, v239, v240);
        v245 = objc_msgSend_immediateUseDatabaseScopeForTesting(self, v242, v243, v244);
        char v246 = CKObjectsAreBothNilOrEqual(v241, v245);
      }
      else
      {
LABEL_36:
        char v246 = 0;
      }
    }
    else
    {
      char v246 = 0;
    }
  }

  return v246;
}

- (CKContainerOptions)initWithSqliteRepresentation:(id)a3
{
  uint64_t v238 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    id v235 = 0;
    uint64_t v12 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v11, (uint64_t)v10, 0, &v235);
    id v13 = v235;
    if (v13 || !v12)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v227 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v237 = v13;
        _os_log_error_impl(&dword_18AF10000, v227, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKContainerOptions: %@", buf, 0xCu);
      }
      v226 = 0;
    }
    else
    {
      v234.receiver = self;
      v234.super_class = (Class)CKContainerOptions;
      uint64_t v14 = [(CKContainerOptions *)&v234 init];
      if (v14)
      {
        uint64_t v15 = NSStringFromSelector(sel_captureResponseHTTPHeaders);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
        v14->_captureResponseHTTPHeaders = objc_msgSend_BOOLValue(v18, v19, v20, v21);

        uint64_t v22 = NSStringFromSelector(sel_useZoneWidePCS);
        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v12, v23, (uint64_t)v22, v24);
        v14->_useZoneWidePCS = objc_msgSend_BOOLValue(v25, v26, v27, v28);

        uint64_t v29 = NSStringFromSelector(sel_holdAllOperations);
        uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v12, v30, (uint64_t)v29, v31);
        v14->_holdAllOperations = objc_msgSend_BOOLValue(v32, v33, v34, v35);

        uint64_t v36 = [CKAccountOverrideInfo alloc];
        uint64_t v37 = NSStringFromSelector(sel_accountOverrideInfo);
        uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v12, v38, (uint64_t)v37, v39);
        uint64_t v43 = objc_msgSend_initWithSqliteRepresentation_(v36, v41, (uint64_t)v40, v42);
        accountOverrideInfo = v14->_accountOverrideInfo;
        v14->_accountOverrideInfo = (CKAccountOverrideInfo *)v43;

        uint64_t v45 = NSStringFromSelector(sel_qualityOfService);
        uint64_t v48 = objc_msgSend_objectForKeyedSubscript_(v12, v46, (uint64_t)v45, v47);
        v14->_qualityOfService = objc_msgSend_integerValue(v48, v49, v50, v51);

        uint64_t v52 = NSStringFromSelector(sel_returnPCSMetadata);
        uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v12, v53, (uint64_t)v52, v54);
        v14->_returnPCSMetadata = objc_msgSend_BOOLValue(v55, v56, v57, v58);

        uint64_t v59 = NSStringFromSelector(sel_mmcsEncryptionSupport);
        uint64_t v62 = objc_msgSend_objectForKeyedSubscript_(v12, v60, (uint64_t)v59, v61);
        v14->_mmcsEncryptionSupport = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65);

        uint64_t v66 = NSStringFromSelector(sel_encryptionServiceName);
        uint64_t v69 = objc_msgSend_objectForKeyedSubscript_(v12, v67, (uint64_t)v66, v68);
        encryptionServiceName = v14->_encryptionServiceName;
        v14->_encryptionServiceName = (NSString *)v69;

        uint64_t v71 = NSStringFromSelector(sel_isServiceManatee);
        uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v12, v72, (uint64_t)v71, v73);
        v14->_int isServiceManatee = objc_msgSend_BOOLValue(v74, v75, v76, v77);

        uint64_t v78 = NSStringFromSelector(sel_bypassPCSEncryption);
        uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v12, v79, (uint64_t)v78, v80);
        v14->_bypassPCSEncryption = objc_msgSend_BOOLValue(v81, v82, v83, v84);

        uint64_t v85 = NSStringFromSelector(sel_enforceNamedOperationGroups);
        uint64_t v88 = objc_msgSend_objectForKeyedSubscript_(v12, v86, (uint64_t)v85, v87);
        v14->_enforceNamedOperationGroups = objc_msgSend_BOOLValue(v88, v89, v90, v91);

        uint64_t v92 = NSStringFromSelector(sel_forceEnableReadOnlyManatee);
        uint64_t v95 = objc_msgSend_objectForKeyedSubscript_(v12, v93, (uint64_t)v92, v94);
        v14->_forceEnableReadint OnlyManatee = objc_msgSend_BOOLValue(v95, v96, v97, v98);

        uint64_t v99 = [CKUploadRequestConfiguration alloc];
        uint64_t v100 = NSStringFromSelector(sel_uploadRequestConfiguration);
        uint64_t v103 = objc_msgSend_objectForKeyedSubscript_(v12, v101, (uint64_t)v100, v102);
        uint64_t v106 = objc_msgSend_initWithSqliteRepresentation_(v99, v104, (uint64_t)v103, v105);
        uploadRequestConfiguration = v14->_uploadRequestConfiguration;
        v14->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v106;

        uint64_t v108 = NSStringFromSelector(sel_forceEnableReadOnlyManatee);
        int v111 = objc_msgSend_objectForKeyedSubscript_(v12, v109, (uint64_t)v108, v110);
        v14->_forceEnableReadint OnlyManatee = objc_msgSend_BOOLValue(v111, v112, v113, v114);

        int v115 = NSStringFromSelector(sel_personaIdentifier);
        uint64_t v118 = objc_msgSend_objectForKeyedSubscript_(v12, v116, (uint64_t)v115, v117);
        personaIdentifier = v14->_personaIdentifier;
        v14->_personaIdentifier = (NSString *)v118;

        uint64_t v120 = NSStringFromSelector(sel_useClearAssetEncryption);
        uint64_t v123 = objc_msgSend_objectForKeyedSubscript_(v12, v121, (uint64_t)v120, v122);
        v14->_useClearAssetEncryption = objc_msgSend_BOOLValue(v123, v124, v125, v126);

        int v127 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
        uint64_t v130 = objc_msgSend_objectForKeyedSubscript_(v12, v128, (uint64_t)v127, v129);
        applicationBundleIdentifierOverrideForContainerAccess = v14->_applicationBundleIdentifierOverrideForContainerAccess;
        v14->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v130;

        uint64_t v132 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
        uint64_t v135 = objc_msgSend_objectForKeyedSubscript_(v12, v133, (uint64_t)v132, v134);
        applicationBundleIdentifierOverrideForNetworkAttribution = v14->_applicationBundleIdentifierOverrideForNetworkAttribution;
        v14->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v135;

        uint64_t v137 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
        uint64_t v140 = objc_msgSend_objectForKeyedSubscript_(v12, v138, (uint64_t)v137, v139);
        applicationBundleIdentifierOverrideForPushTopicGeneration = v14->_applicationBundleIdentifierOverrideForPushTopicGeneration;
        v14->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v140;

        uint64_t v142 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
        uint64_t v145 = objc_msgSend_objectForKeyedSubscript_(v12, v143, (uint64_t)v142, v144);
        applicationBundleIdentifierOverrideForTCC = v14->_applicationBundleIdentifierOverrideForTCC;
        v14->_applicationBundleIdentifierOverrideForTCC = (NSString *)v145;

        uint64_t v147 = NSStringFromSelector(sel_fakeEntitlements);
        uint64_t v150 = objc_msgSend_objectForKeyedSubscript_(v12, v148, (uint64_t)v147, v149);
        fakeEntitlements = v14->_fakeEntitlements;
        v14->_fakeEntitlements = (NSDictionary *)v150;

        uint64_t v152 = NSStringFromSelector(sel_useAnonymousToServerShareParticipants);
        uint64_t v155 = objc_msgSend_objectForKeyedSubscript_(v12, v153, (uint64_t)v152, v154);
        v14->_useAnonymousToServerShareParticipants = objc_msgSend_BOOLValue(v155, v156, v157, v158);

        uint64_t v159 = NSStringFromSelector(sel_encryptMergeableValueMetadata);
        uint64_t v162 = objc_msgSend_objectForKeyedSubscript_(v12, v160, (uint64_t)v159, v161);
        v14->_encryptMergeableValueMetadata = objc_msgSend_BOOLValue(v162, v163, v164, v165);

        if (__sTestOverridesAvailable)
        {
          id v166 = objc_alloc((Class)sub_18B072758());
          int v167 = NSStringFromSelector(sel_testDeviceReferenceProtocol);
          uint64_t v170 = objc_msgSend_objectForKeyedSubscript_(v12, v168, (uint64_t)v167, v169);
          uint64_t v173 = objc_msgSend_initWithSqliteRepresentation_(v166, v171, (uint64_t)v170, v172);
          testDeviceReferenceProtocol = v14->_testDeviceReferenceProtocol;
          v14->_testDeviceReferenceProtocol = (CKTestDeviceReferenceProtocol *)v173;
        }
        uint64_t v175 = NSStringFromSelector(sel_returnRequestOperationProto);
        uint64_t v178 = objc_msgSend_objectForKeyedSubscript_(v12, v176, (uint64_t)v175, v177);
        v14->_returnRequestOperationProto = objc_msgSend_BOOLValue(v178, v179, v180, v181);

        uint64_t v182 = NSStringFromSelector(sel_maintainRecordUploadOrder);
        v185 = objc_msgSend_objectForKeyedSubscript_(v12, v183, (uint64_t)v182, v184);
        v14->_maintainRecordUploadOrder = objc_msgSend_BOOLValue(v185, v186, v187, v188);

        uint64_t v189 = NSStringFromSelector(sel_addDatabaseScopeToZoneIDs);
        uint64_t v192 = objc_msgSend_objectForKeyedSubscript_(v12, v190, (uint64_t)v189, v191);
        v14->_addDatabaseScopeToZoneIDs = objc_msgSend_BOOLValue(v192, v193, v194, v195);

        uint64_t v196 = NSStringFromSelector(sel_fetchChangesForMergeableValues);
        uint64_t v199 = objc_msgSend_objectForKeyedSubscript_(v12, v197, (uint64_t)v196, v198);
        v14->_fetchint ChangesForMergeableValues = objc_msgSend_BOOLValue(v199, v200, v201, v202);

        uint64_t v203 = NSStringFromSelector(sel_prefersHiddenAllowedSharingOptionsUI);
        uint64_t v206 = objc_msgSend_objectForKeyedSubscript_(v12, v204, (uint64_t)v203, v205);
        v14->_prefersHiddenAllowedSharingOptionsUI = objc_msgSend_BOOLValue(v206, v207, v208, v209);

        uint64_t v213 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v210, v211, v212);
        uint64_t v214 = NSStringFromSelector(sel_supportedDeviceCapabilities);
        uint64_t v217 = objc_msgSend_objectForKeyedSubscript_(v12, v215, (uint64_t)v214, v216);

        if (v213 == v217)
        {
          supportedDeviceCapabilities = v14->_supportedDeviceCapabilities;
          v14->_supportedDeviceCapabilities = 0;
        }
        else
        {
          int v218 = NSStringFromSelector(sel_supportedDeviceCapabilities);
          supportedDeviceCapabilities = objc_msgSend_objectForKeyedSubscript_(v12, v219, (uint64_t)v218, v220);

          uint64_t v224 = objc_msgSend_fromSqliteRepresentations_(CKDeviceCapability, v222, (uint64_t)supportedDeviceCapabilities, v223);
          int v225 = v14->_supportedDeviceCapabilities;
          v14->_supportedDeviceCapabilities = (NSArray *)v224;
        }
        uint64_t v228 = NSStringFromSelector(sel_immediateUseDatabaseScopeForTesting);
        uint64_t v231 = objc_msgSend_objectForKeyedSubscript_(v12, v229, (uint64_t)v228, v230);
        immediateUseDatabaseScopeForTesting = v14->_immediateUseDatabaseScopeForTesting;
        v14->_immediateUseDatabaseScopeForTesting = (NSNumber *)v231;
      }
      self = v14;
      v226 = self;
    }
  }
  else
  {
    v226 = 0;
  }

  return v226;
}

- (void)setSupportedDeviceCapabilities:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v51 = self;
    uint64_t v5 = objc_opt_new();
    uint64_t v54 = (NSArray *)objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v52 = v4;
    obuint64_t j = v4;
    uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v61, (uint64_t)v66, 16);
    if (v56)
    {
      uint64_t v55 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v62 != v55) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend_name(v11, v7, v8, v9, v51);
          uint64_t v15 = objc_msgSend_objectForKey_(v5, v13, (uint64_t)v12, v14);

          if (v15)
          {
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v19 = v15;
            uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v57, (uint64_t)v65, 16);
            if (v21)
            {
              uint64_t v25 = v21;
              uint64_t v26 = *(void *)v58;
              while (2)
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v58 != v26) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v28 = *(void **)(*((void *)&v57 + 1) + 8 * j);
                  uint64_t v29 = objc_msgSend_value(v11, v22, v23, v24);
                  LOBYTE(v28) = objc_msgSend_isEqualToString_(v28, v30, (uint64_t)v29, v31);

                  if (v28)
                  {

                    goto LABEL_20;
                  }
                }
                uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v57, (uint64_t)v65, 16);
                if (v25) {
                  continue;
                }
                break;
              }
            }

            uint64_t v35 = objc_msgSend_value(v11, v32, v33, v34);
            objc_msgSend_addObject_(v19, v36, (uint64_t)v35, v37);
          }
          else
          {
            uint64_t v38 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v35 = objc_msgSend_value(v11, v16, v17, v18);
            uint64_t v41 = objc_msgSend_arrayWithObject_(v38, v39, (uint64_t)v35, v40);
            uint64_t v45 = objc_msgSend_name(v11, v42, v43, v44);
            objc_msgSend_setObject_forKey_(v5, v46, (uint64_t)v41, (uint64_t)v45);
          }
          objc_msgSend_addObject_(v54, v47, (uint64_t)v11, v48);
LABEL_20:
        }
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v61, (uint64_t)v66, 16);
      }
      while (v56);
    }

    supportedDeviceCapabilities = v51->_supportedDeviceCapabilities;
    v51->_supportedDeviceCapabilities = v54;

    id v4 = v52;
  }
  else
  {
    uint64_t v50 = self->_supportedDeviceCapabilities;
    self->_supportedDeviceCapabilities = 0;
  }
}

- (void)setCaptureResponseHTTPHeaders:(BOOL)a3
{
  self->_captureResponseHTTPHeaders = a3;
}

- (void)setAccountOverrideInfo:(id)a3
{
}

- (void)setMmcsEncryptionSupport:(unint64_t)a3
{
  self->_mmcsEncryptionSupport = a3;
}

- (void)setEncryptionServiceName:(id)a3
{
}

- (void)setIsServiceManatee:(BOOL)a3
{
  self->_int isServiceManatee = a3;
}

- (void)setBypassPCSEncryption:(BOOL)a3
{
  self->_bypassPCSEncryption = a3;
}

- (void)setEnforceNamedOperationGroups:(BOOL)a3
{
  self->_enforceNamedOperationGroups = a3;
}

- (void)setForceEnableReadOnlyManatee:(BOOL)a3
{
  self->_forceEnableReadint OnlyManatee = a3;
}

- (void)setUseClearAssetEncryption:(BOOL)a3
{
  self->_useClearAssetEncryption = a3;
}

- (void)setAccountInfoCacheIsDisabled:(BOOL)a3
{
  self->_accountInfoCacheIsDisabled = a3;
}

- (void)setUseAnonymousToServerShareParticipants:(BOOL)a3
{
  self->_useAnonymousToServerShareParticipants = a3;
}

- (void)setEncryptMergeableValueMetadata:(BOOL)a3
{
  self->_encryptMergeableValueMetadata = a3;
}

- (void)setMaintainRecordUploadOrder:(BOOL)a3
{
  self->_maintainRecordUploadOrder = a3;
}

- (void)setAddDatabaseScopeToZoneIDs:(BOOL)a3
{
  self->_addDatabaseScopeToZoneIDs = a3;
}

- (void)setFetchChangesForMergeableValues:(BOOL)a3
{
  self->_fetchint ChangesForMergeableValues = a3;
}

- (void)setPrefersHiddenAllowedSharingOptionsUI:(BOOL)a3
{
  self->_prefersHiddenAllowedSharingOptionsUI = a3;
}

- (void)setAcceptServerSignedRecords:(BOOL)a3
{
  self->_acceptServerSignedRecords = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setReturnPCSMetadata:(BOOL)a3
{
  self->_returnPCSMetadata = a3;
}

- (void)setUploadRequestConfiguration:(id)a3
{
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (void)setReturnRequestOperationProto:(BOOL)a3
{
  self->_returnRequestOperationProto = a3;
}

- (void)setHoldAllOperations:(BOOL)a3
{
  self->_holdAllOperations = a3;
}

- (void)setImmediateUseDatabaseScopeForTesting:(id)a3
{
}

- (void)setTestDeviceReferenceProtocol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDeviceReferenceProtocol, 0);
  objc_storeStrong((id *)&self->_immediateUseDatabaseScopeForTesting, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForTCC, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForPushTopicGeneration, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_encryptionServiceName, 0);
  objc_storeStrong((id *)&self->_accountOverrideInfo, 0);
  objc_storeStrong((id *)&self->_supportedDeviceCapabilities, 0);

  objc_storeStrong((id *)&self->_fakeEntitlements, 0);
}

@end
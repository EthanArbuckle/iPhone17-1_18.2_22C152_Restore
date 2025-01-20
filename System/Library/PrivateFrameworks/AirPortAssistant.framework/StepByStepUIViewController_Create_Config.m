@interface StepByStepUIViewController_Create_Config
- (BOOL)hasDisk;
- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6;
- (BOOL)useDifferentDiskPassword;
- (BOOL)useSinglePassword;
- (BOOL)validateAndSetValues;
- (NSString)basePassword;
- (NSString)basePasswordVerify;
- (NSString)diskPassword;
- (NSString)diskPasswordVerify;
- (NSString)personalizedBaseName;
- (NSString)wifiName;
- (NSString)wifiPassword;
- (NSString)wifiPasswordVerify;
- (RecommendationActionController)actionController;
- (void)addDiskPasswordSection;
- (void)setActionController:(id)a3;
- (void)setBasePassword:(id)a3;
- (void)setBasePasswordVerify:(id)a3;
- (void)setDiskPassword:(id)a3;
- (void)setDiskPasswordVerify:(id)a3;
- (void)setHasDisk:(BOOL)a3;
- (void)setPersonalizedBaseName:(id)a3;
- (void)setUseDifferentDiskPassword:(BOOL)a3;
- (void)setUseSinglePassword:(BOOL)a3;
- (void)setWifiName:(id)a3;
- (void)setWifiPassword:(id)a3;
- (void)setWifiPasswordVerify:(id)a3;
- (void)setupInitialTableHeaderConfiguration;
- (void)setupTable;
- (void)switchTouchedInCellAtIndexPath:(id)a3 forSwitchIndex:(unint64_t)a4 isOn:(BOOL)a5;
- (void)touchInCellAtIndexPath:(id)a3;
- (void)updateSinglePasswordSwitchExplanation:(BOOL)a3;
- (void)updateTable;
- (void)updateTableForMultiplePasswords;
- (void)updateTableForSinglePassword;
- (void)validateAndUpdateNextButton;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StepByStepUIViewController_Create_Config

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_setUseSinglePassword_(self, a2, 1);
  objc_msgSend_setDelegate_(self, v5, (uint64_t)self);
  v8 = objc_msgSend_inParamDict(self, v6, v7);
  v10 = objc_msgSend_objectForKey_(v8, v9, @"kSBSKey_SelectorChoice");
  if ((unint64_t)(objc_msgSend_integerValue(v10, v11, v12) - 101) > 1)
  {
    v231 = 0;
    v232 = 0;
    uint64_t v19 = 0;
    uint64_t v34 = 0;
    uint64_t v27 = 0;
    uint64_t NetworkPasswordForNetworkNamed = 0;
  }
  else
  {
    v15 = objc_msgSend_inParamDict(self, v13, v14);
    v17 = (__CFString *)objc_msgSend_objectForKey_(v15, v16, @"kSBSKey_SourceBase");
    uint64_t v19 = objc_msgSend_objectForKey_(v17, v18, @"name");
    uint64_t v27 = (uint64_t)sub_22685B73C(v17, v20, v21, v22, v23, v24, v25, v26);
    v231 = off_268147F80;
    v30 = objc_msgSend_sharedInstance(WiFiUtils, v28, v29);
    uint64_t NetworkPasswordForNetworkNamed = objc_msgSend_getNetworkPasswordForNetworkNamed_(v30, v31, v27);
    v232 = v17;
    uint64_t v34 = objc_msgSend_keychainPasswordForBaseStation_(AssistantCallbackController, v33, (uint64_t)v17);
  }
  v35 = objc_msgSend_inParamDict(self, v13, v14);
  CFStringRef v37 = (const __CFString *)objc_msgSend_objectForKey_(v35, v36, @"kSBSKey_TargetBase");
  v45 = (const char *)sub_22685AB94(v37, v38, v39, v40, v41, v42, v43, v44);
  v48 = objc_msgSend_inParamDict(self, v46, v47);
  uint64_t v50 = objc_msgSend_objectForKey_(v48, v49, @"kSBSKey_TargetBase");
  unsigned int v58 = sub_22685AB68(v50, v51, v52, v53, v54, v55, v56, v57);
  uint64_t v60 = objc_msgSend_valueForKey_(self->super.super._inParamDict, v59, @"kSBSKey_TargetBaseFeatures");
  BOOL v61 = sub_22684EA0C(v60, 1297314927);
  objc_msgSend_setHasDisk_(self, v62, v61);
  objc_msgSend_setPersonalizedBaseName_(self, v63, v19);
  v66 = objc_msgSend_personalizedBaseName(self, v64, v65);
  if (!objc_msgSend_length(v66, v67, v68))
  {
    v71 = sub_22685E04C(v45, v58);
    objc_msgSend_setPersonalizedBaseName_(self, v72, (uint64_t)v71);
  }
  v73 = objc_msgSend_personalizedBaseName(self, v69, v70);
  if (objc_msgSend_length(v73, v74, v75))
  {
    if (v27) {
      goto LABEL_12;
    }
  }
  else
  {
    v77 = sub_22685E098(v45, v58);
    objc_msgSend_setPersonalizedBaseName_(self, v78, (uint64_t)v77);
    if (v27) {
      goto LABEL_12;
    }
  }
  uint64_t v27 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v76, @"kSBSKey_NetworkName");
  if (!v27) {
    uint64_t v27 = (uint64_t)sub_22685E110();
  }
LABEL_12:
  objc_msgSend_setWifiName_(self, v76, v27);
  if (!NetworkPasswordForNetworkNamed) {
    uint64_t NetworkPasswordForNetworkNamed = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v79, @"kSBSKey_NetworkPassword");
  }
  if (NetworkPasswordForNetworkNamed) {
    objc_msgSend_setWifiPassword_(self, v79, NetworkPasswordForNetworkNamed);
  }
  else {
    objc_msgSend_setWifiPassword_(self, v79, (uint64_t)&stru_26DA6BE88);
  }
  uint64_t v82 = objc_msgSend_wifiPassword(self, v80, v81);
  objc_msgSend_setWifiPasswordVerify_(self, v83, v82);
  if (!v34) {
    uint64_t v34 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v84, @"kSBSKey_BasePassword");
  }
  if (v34) {
    objc_msgSend_setBasePassword_(self, v84, v34);
  }
  else {
    objc_msgSend_setBasePassword_(self, v84, (uint64_t)&stru_26DA6BE88);
  }
  uint64_t v87 = objc_msgSend_basePassword(self, v85, v86);
  objc_msgSend_setBasePasswordVerify_(self, v88, v87);
  v91 = objc_msgSend_wifiPassword(self, v89, v90);
  uint64_t v94 = objc_msgSend_basePassword(self, v92, v93);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v91, v95, v94);
  objc_msgSend_setUseSinglePassword_(self, v97, isEqualToString);
  if (objc_msgSend_hasDisk(self, v98, v99))
  {
    uint64_t v102 = objc_msgSend_valueForKey_(self->super.super._outResultsDict, v100, @"kSBSKey_DiskSharing_Password");
    if (v102) {
      objc_msgSend_setDiskPassword_(self, v103, v102);
    }
    else {
      objc_msgSend_setDiskPassword_(self, v103, (uint64_t)&stru_26DA6BE88);
    }
    uint64_t v106 = objc_msgSend_diskPassword(self, v104, v105);
    objc_msgSend_setDiskPasswordVerify_(self, v107, v106);
    if ((objc_msgSend_useSinglePassword(self, v108, v109) & 1) != 0
      || (v112 = objc_msgSend_diskPassword(self, v110, v111), !objc_msgSend_length(v112, v113, v114)))
    {
      objc_msgSend_setUseDifferentDiskPassword_(self, v110, 0);
    }
    else
    {
      v116 = objc_msgSend_diskPassword(self, v110, v115);
      uint64_t v119 = objc_msgSend_basePassword(self, v117, v118);
      uint64_t v121 = objc_msgSend_isEqualToString_(v116, v120, v119) ^ 1;
      objc_msgSend_setUseDifferentDiskPassword_(self, v122, v121);
    }
  }
  v123 = objc_msgSend_inParamDict(self, v100, v101);
  v125 = objc_msgSend_objectForKey_(v123, v124, @"kSBSKey_Mode");
  uint64_t v128 = objc_msgSend_integerValue(v125, v126, v127);
  objc_msgSend_setSbsMode_(self, v129, v128);
  if (objc_msgSend_sbsMode(self, v130, v131) == 2)
  {
    objc_msgSend_setLeftNavigationButton_enable_hide_(self, v132, @"kCancel", 1, 0);
    if (!objc_msgSend_actionController(self, v134, v135))
    {
      uint64_t v136 = objc_msgSend_tableManager(self, v132, v133);
      uint64_t v139 = objc_msgSend_parentController(self, v137, v138);
      uint64_t v141 = objc_msgSend_recommendationActionControllerWithTableManager_andAssistantUIViewController_(RecommendationActionController, v140, v136, v139);
      objc_msgSend_setActionController_(self, v142, v141);
    }
  }
  if (objc_msgSend_sbsMode(self, v132, v133) == 2)
  {
    v145 = objc_msgSend_wifiName(self, v143, v144);
    if (objc_msgSend_length(v145, v146, v147)) {
      objc_msgSend_wifiName(self, v143, v144);
    }
  }
  v148 = objc_msgSend_inParamDict(self, v143, v144);
  v150 = objc_msgSend_objectForKey_(v148, v149, @"kSBSKey_SelectorChoice");
  BOOL v234 = v3;
  uint64_t v235 = v19;
  if ((unint64_t)(objc_msgSend_integerValue(v150, v151, v152) - 101) > 1)
  {
    ProductLocalizedStringWithFormat = objc_msgSend_getProductLocalizedStringWithFormat_(self, v153, @"PrimarySetupRecommendation_Create%@");
  }
  else
  {
    uint64_t v154 = sub_22685D62C(@"TextualSentenceConcatenator", qword_268148378);
    uint64_t v155 = sub_22685D62C(@"TurnOffNamedDeviceBeingReplaced", @"AirPortSettings");
    v158 = objc_msgSend_inParamDict(self, v156, v157);
    v160 = objc_msgSend_objectForKey_(v158, v159, @"kSBSKey_SourceBase");
    uint64_t v162 = objc_msgSend_objectForKey_(v160, v161, @"name");
    uint64_t valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v163, v155, @"%@", 0, v162);
    uint64_t v167 = objc_msgSend_inParamDict(self, v165, v166);
    uint64_t ProductLocalizedStringWithFormat_fromParamDict = objc_msgSend_getProductLocalizedStringWithFormat_fromParamDict_(StepByStepUtilities, v168, @"PrimarySetupRecommendation_Replace%@", v167);
    uint64_t v171 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v170, ProductLocalizedStringWithFormat_fromParamDict, @"%@", 0, v162);
    ProductLocalizedStringWithFormat = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(NSString, v172, v154, @"%@%@", 0, v171, valid);
  }
  sub_22684E878(self->super.justTextLabel, (char *)self->super.justTextContainerView, ProductLocalizedStringWithFormat);
  uint64_t v176 = objc_msgSend_tableHeaderContainerView(self, v174, v175);
  objc_msgSend_readjustSubviewsInContainer_(AssistantUIViewController, v177, v176);
  objc_msgSend_setupTable(self, v178, v179);
  objc_msgSend_updateTable(self, v180, v181);
  objc_msgSend_setupInitialTableHeaderConfiguration(self, v182, v183);
  v186 = objc_msgSend_parentController(self, v184, v185);
  v189 = objc_msgSend__assistantUIController(v186, v187, v188);
  v192 = objc_msgSend_topoView(self, v190, v191);
  uint64_t v233 = objc_msgSend_layer(v192, v193, v194);
  uint64_t v197 = objc_msgSend_topoLayout(self, v195, v196);
  uint64_t v200 = objc_msgSend_topoView(self, v198, v199);
  uint64_t v202 = objc_msgSend_numberWithInteger_(NSNumber, v201, v45);
  uint64_t v204 = objc_msgSend_numberWithInteger_(NSNumber, v203, v58);
  v207 = objc_msgSend_inParamDict(self, v205, v206);
  uint64_t v209 = objc_msgSend_objectForKey_(v207, v208, @"kSBSKey_TargetNetwork");
  v210 = sub_22685D9D0(v209, v45, 0);
  uint64_t v219 = objc_msgSend_valueForKey_(v232, v211, @"syAP");
  if (v232)
  {
    v220 = NSNumber;
    unsigned int v221 = sub_22685AB68((uint64_t)v232, (uint64_t)v212, v213, v214, v215, v216, v217, v218);
    uint64_t v223 = objc_msgSend_numberWithInteger_(v220, v222, v221);
  }
  else
  {
    uint64_t v223 = 0;
  }
  uint64_t v224 = objc_msgSend_modifyTopoUIInLayer_withLayout_andOwningView_targetProductID_targetDeviceKind_targetName_targetWiFiName_sourceProductID_sourceDeviceKind_sourceName_sourceWiFiName_connectionType_(v189, v212, v233, v197, v200, v202, v204, v210, 0, v219, v223, v235, 0, v231);
  objc_msgSend_setTopoLayout_(self, v225, v224);
  objc_msgSend_validateAndUpdateNextButton(self, v226, v227);
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v228, (uint64_t)&stru_26DA6BE88, @"kSBSKey_BasePassword");
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v229, (uint64_t)&stru_26DA6BE88, @"kSBSKey_NetworkPassword");
  objc_msgSend_setValue_forKey_(self->super.super._outResultsDict, v230, (uint64_t)&stru_26DA6BE88, @"kSBSKey_DiskSharing_Password");
  v236.receiver = self;
  v236.super_class = (Class)StepByStepUIViewController_Create_Config;
  [(StepByStepUIViewController *)&v236 viewWillAppear:v234];
}

- (BOOL)validateAndSetValues
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"WiFiName") == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = objc_msgSend_tableManager(self, v6, v7);
    uint64_t ValueForFirstItemOfType_inCellWithTag = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v9, v10, @"editTextView", 1464225389);
    objc_msgSend_setWifiName_(self, v12, ValueForFirstItemOfType_inCellWithTag);
    v15 = objc_msgSend_wifiName(self, v13, v14);
    v18 = (const char *)objc_msgSend_UTF8String(v15, v16, v17);
    BOOL v8 = sub_22685C484(v18) != 0;
  }
  uint64_t v19 = objc_msgSend_tableManager(self, v6, v7);
  uint64_t v21 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v19, v20, @"editTextView", 1937329773);
  objc_msgSend_setPersonalizedBaseName_(self, v22, v21);
  if (objc_msgSend_personalizedBaseName(self, v23, v24))
  {
    uint64_t v27 = objc_msgSend_personalizedBaseName(self, v25, v26);
    v30 = (const char *)objc_msgSend_UTF8String(v27, v28, v29);
    if (!sub_22685C500(v30)) {
      BOOL v8 = 0;
    }
  }
  v31 = objc_msgSend_tableManager(self, v25, v26);
  uint64_t v33 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v31, v32, @"editTextView", 1464225889);
  objc_msgSend_setWifiPassword_(self, v34, v33);
  CFStringRef v37 = objc_msgSend_tableManager(self, v35, v36);
  uint64_t v39 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v37, v38, @"editTextView", 1464225878);
  objc_msgSend_setWifiPasswordVerify_(self, v40, v39);
  uint64_t v43 = objc_msgSend_tableManager(self, v41, v42);
  uint64_t v46 = objc_msgSend_wifiPassword(self, v44, v45);
  uint64_t v49 = objc_msgSend_wifiPasswordVerify(self, v47, v48);
  char v51 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v43, v50, v46, 1464225889, v49, 1464225878);
  uint64_t v54 = objc_msgSend_wifiPassword(self, v52, v53);
  uint64_t v57 = (const char *)objc_msgSend_UTF8String(v54, v55, v56);
  if (!v57) {
    return 0;
  }
  unsigned int v58 = v57;
  unsigned int v59 = sub_22685C4C8(v57);
  BOOL v60 = v59 != 0;
  if (objc_msgSend_useSinglePassword(self, v61, v62))
  {
    unsigned int v65 = sub_22685C544(v58);
    if (v59) {
      BOOL v66 = v65 == 0;
    }
    else {
      BOOL v66 = 1;
    }
    BOOL v60 = !v66;
  }
  char v67 = v60 & v51 & v8;
  if ((objc_msgSend_useSinglePassword(self, v63, v64) & 1) == 0)
  {
    uint64_t v70 = objc_msgSend_tableManager(self, v68, v69);
    uint64_t v72 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v70, v71, @"editTextView", 1113673825);
    objc_msgSend_setBasePassword_(self, v73, v72);
    v76 = objc_msgSend_tableManager(self, v74, v75);
    uint64_t v78 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v76, v77, @"editTextView", 1113673814);
    objc_msgSend_setBasePasswordVerify_(self, v79, v78);
    uint64_t v82 = objc_msgSend_tableManager(self, v80, v81);
    uint64_t v85 = objc_msgSend_basePassword(self, v83, v84);
    uint64_t v88 = objc_msgSend_basePasswordVerify(self, v86, v87);
    char v90 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v82, v89, v85, 1113673825, v88, 1113673814);
    uint64_t v93 = objc_msgSend_basePassword(self, v91, v92);
    v96 = (const char *)objc_msgSend_UTF8String(v93, v94, v95);
    char v99 = sub_22685C544(v96) ? v90 : 0;
    v67 &= v99;
    if (objc_msgSend_hasDisk(self, v97, v98))
    {
      if (objc_msgSend_useDifferentDiskPassword(self, v100, v101))
      {
        v104 = objc_msgSend_tableManager(self, v102, v103);
        uint64_t v106 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v104, v105, @"editTextView", 1147752545);
        objc_msgSend_setDiskPassword_(self, v107, v106);
        v110 = objc_msgSend_tableManager(self, v108, v109);
        uint64_t v112 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(v110, v111, @"editTextView", 1147752534);
        objc_msgSend_setDiskPasswordVerify_(self, v113, v112);
        v116 = objc_msgSend_tableManager(self, v114, v115);
        uint64_t v119 = objc_msgSend_diskPassword(self, v117, v118);
        uint64_t v122 = objc_msgSend_diskPasswordVerify(self, v120, v121);
        char v124 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(v116, v123, v119, 1147752545, v122, 1147752534);
        uint64_t v127 = objc_msgSend_diskPassword(self, v125, v126);
        v130 = (const char *)objc_msgSend_UTF8String(v127, v128, v129);
        if (sub_22685C5CC(v130)) {
          char v131 = v124;
        }
        else {
          char v131 = 0;
        }
        return v131 & v67;
      }
    }
  }
  return v67;
}

- (void)updateTableForSinglePassword
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v4, v5, @"WiFiPassword", 0);
  BOOL v8 = objc_msgSend_tableManager(self, v6, v7);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v8, v9, @"BasePassword", 0);
  uint64_t v12 = objc_msgSend_tableManager(self, v10, v11);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v12, v13, @"DiskPassword", 0);
  v16 = objc_msgSend_tableManager(self, v14, v15);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v16, v17, @"DiskPasswordSwitch", 0);
  actionController = self->actionController;
  if (actionController && !objc_msgSend_isPrimaryRecommendation(actionController, v18, v19))
  {
    char v67 = objc_msgSend_tableManager(self, v18, v19);
    objc_msgSend_deleteSectionWithIdentifier_animated_(v67, v68, @"SinglePassword", 0);
  }
  else
  {
    uint64_t v21 = objc_msgSend_tableManager(self, v18, v19);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v21, v22, @"SinglePassword") == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v25 = objc_msgSend_array(MEMORY[0x263EFF980], v23, v24);
      v28 = objc_msgSend_tableManager(self, v26, v27);
      uint64_t v29 = sub_22685D62C(@"PasswordLabel", qword_268148378);
      uint64_t v32 = objc_msgSend_wifiPassword(self, v30, v31);
      uint64_t v33 = sub_22685D62C(@"CreatePasswordPlaceholder", qword_268148378);
      isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v28, v34, 0, v29, v32, v33, 1, 1, 1464225889);
      uint64_t v39 = sub_22684EA54(1651716432, v36);
      if (v39) {
        objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v37, v39, @"nsFormatter");
      }
      uint64_t v40 = objc_msgSend_tableManager(self, v37, v38);
      objc_msgSend_setNewRow_verifierAccessoryType_(v40, v41, (uint64_t)isSecure_keyboardType_withTag, 0);
      objc_msgSend_addObject_(v25, v42, (uint64_t)isSecure_keyboardType_withTag);
      uint64_t v45 = objc_msgSend_tableManager(self, v43, v44);
      uint64_t v46 = sub_22685D62C(@"VerifyLabel", qword_268148378);
      uint64_t v49 = objc_msgSend_wifiPasswordVerify(self, v47, v48);
      uint64_t v50 = sub_22685D62C(@"VerifyPlaceholder", qword_268148378);
      uint64_t v52 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v45, v51, 0, v46, v49, v50, 1, 1, 1464225878);
      uint64_t v55 = (uint64_t)v52;
      if (v39) {
        objc_msgSend_setObject_forKey_(v52, v53, v39, @"nsFormatter");
      }
      uint64_t v56 = objc_msgSend_tableManager(self, v53, v54);
      objc_msgSend_setNewRow_verifierAccessoryType_(v56, v57, v55, 0);
      objc_msgSend_addObject_(v25, v58, v55);
      BOOL v61 = objc_msgSend_tableManager(self, v59, v60);
      uint64_t v62 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v63 = sub_22685D62C(@"WiFiPasswordRequirement", qword_268148378);
      uint64_t v66 = objc_msgSend_dictionaryWithObjectsAndKeys_(v62, v64, (uint64_t)v25, @"sectionRows", v63, @"footer", @"SinglePassword", @"identifier", 0);
      objc_msgSend_addSectionInfo_animated_(v61, v65, v66, 0);
    }
  }
}

- (void)updateTableForMultiplePasswords
{
  v4 = objc_msgSend_tableManager(self, a2, v2);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v4, v5, @"WiFiPassword", 0);
  BOOL v8 = objc_msgSend_tableManager(self, v6, v7);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v8, v9, @"BasePassword", 0);
  uint64_t v12 = objc_msgSend_tableManager(self, v10, v11);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v12, v13, @"BasePassword", 0);
  v16 = objc_msgSend_tableManager(self, v14, v15);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v16, v17, @"SinglePassword", 0);
  uint64_t v20 = objc_msgSend_tableManager(self, v18, v19);
  objc_msgSend_deleteSectionWithIdentifier_animated_(v20, v21, @"DiskPasswordSwitch", 0);
  if ((objc_msgSend_useDifferentDiskPassword(self, v22, v23) & 1) == 0)
  {
    uint64_t v26 = objc_msgSend_tableManager(self, v24, v25);
    objc_msgSend_deleteSectionWithIdentifier_animated_(v26, v27, @"DiskPassword", 0);
  }
  actionController = self->actionController;
  if (!actionController || objc_msgSend_isPrimaryRecommendation(actionController, v24, v25))
  {
    uint64_t v29 = objc_msgSend_tableManager(self, v24, v25);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v29, v30, @"WiFiPassword") == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v33 = objc_msgSend_array(MEMORY[0x263EFF980], v31, v32);
      uint64_t v36 = objc_msgSend_tableManager(self, v34, v35);
      uint64_t v37 = sub_22685D62C(@"PasswordLabel", qword_268148378);
      uint64_t v40 = objc_msgSend_wifiPassword(self, v38, v39);
      uint64_t v41 = sub_22685D62C(@"CreatePasswordPlaceholder", qword_268148378);
      isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v36, v42, 0, v37, v40, v41, 1, 1, 1464225889);
      uint64_t v47 = sub_22684EA54(1651725131, v44);
      if (v47) {
        objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v45, v47, @"nsFormatter");
      }
      uint64_t v48 = objc_msgSend_tableManager(self, v45, v46);
      objc_msgSend_setNewRow_verifierAccessoryType_(v48, v49, (uint64_t)isSecure_keyboardType_withTag, 0);
      objc_msgSend_addObject_(v33, v50, (uint64_t)isSecure_keyboardType_withTag);
      uint64_t v53 = objc_msgSend_tableManager(self, v51, v52);
      uint64_t v54 = sub_22685D62C(@"VerifyLabel", qword_268148378);
      uint64_t v57 = objc_msgSend_wifiPasswordVerify(self, v55, v56);
      uint64_t v58 = sub_22685D62C(@"VerifyPlaceholder", qword_268148378);
      uint64_t v60 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v53, v59, 0, v54, v57, v58, 1, 1, 1464225878);
      uint64_t v63 = (uint64_t)v60;
      if (v47) {
        objc_msgSend_setObject_forKey_(v60, v61, v47, @"nsFormatter");
      }
      uint64_t v64 = objc_msgSend_tableManager(self, v61, v62);
      objc_msgSend_setNewRow_verifierAccessoryType_(v64, v65, v63, 0);
      objc_msgSend_addObject_(v33, v66, v63);
      uint64_t v69 = objc_msgSend_tableManager(self, v67, v68);
      uint64_t v70 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v71 = sub_22685D62C(@"WiFiPasswordSectionTitle", qword_268148378);
      uint64_t v72 = sub_22685D62C(@"WiFiPasswordRequirement", qword_268148378);
      uint64_t v74 = objc_msgSend_dictionaryWithObjectsAndKeys_(v70, v73, (uint64_t)v33, @"sectionRows", v71, @"header", v72, @"footer", @"WiFiPassword", @"identifier", 0);
      objc_msgSend_addSectionInfo_animated_(v69, v75, v74, 0);
    }
    v76 = objc_msgSend_tableManager(self, v31, v32);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v76, v77, @"BasePassword") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v80 = objc_msgSend_array(MEMORY[0x263EFF980], v78, v79);
      v83 = objc_msgSend_tableManager(self, v81, v82);
      uint64_t v84 = sub_22685D62C(@"PasswordLabel", qword_268148378);
      uint64_t v87 = objc_msgSend_basePassword(self, v85, v86);
      uint64_t v88 = sub_22685D62C(@"CreatePasswordPlaceholder", qword_268148378);
      char v90 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v83, v89, 0, v84, v87, v88, 1, 1, 1113673825);
      uint64_t v94 = sub_22684EA54(1651721296, v91);
      if (v94) {
        objc_msgSend_setObject_forKey_(v90, v92, v94, @"nsFormatter");
      }
      uint64_t v95 = objc_msgSend_tableManager(self, v92, v93);
      objc_msgSend_setNewRow_verifierAccessoryType_(v95, v96, (uint64_t)v90, 0);
      objc_msgSend_addObject_(v80, v97, (uint64_t)v90);
      v100 = objc_msgSend_tableManager(self, v98, v99);
      uint64_t v101 = sub_22685D62C(@"VerifyLabel", qword_268148378);
      uint64_t v104 = objc_msgSend_basePasswordVerify(self, v102, v103);
      uint64_t v105 = sub_22685D62C(@"VerifyPlaceholder", qword_268148378);
      v107 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v100, v106, 0, v101, v104, v105, 1, 1, 1113673814);
      uint64_t v110 = (uint64_t)v107;
      if (v94) {
        objc_msgSend_setObject_forKey_(v107, v108, v94, @"nsFormatter");
      }
      uint64_t v111 = objc_msgSend_tableManager(self, v108, v109);
      objc_msgSend_setNewRow_verifierAccessoryType_(v111, v112, v110, 0);
      objc_msgSend_addObject_(v80, v113, v110);
      v116 = objc_msgSend_tableManager(self, v114, v115);
      v117 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v118 = sub_22685D62C(@"AdminPasswordSectionTitle", qword_268148378);
      uint64_t v120 = objc_msgSend_dictionaryWithObjectsAndKeys_(v117, v119, (uint64_t)v80, @"sectionRows", v118, @"header", @"BasePassword", @"identifier", 0);
      objc_msgSend_addSectionInfo_animated_(v116, v121, v120, 0);
    }
    if (objc_msgSend_hasDisk(self, v78, v79))
    {
      char v124 = objc_msgSend_tableManager(self, v122, v123);
      if (objc_msgSend_indexOfSectionWithIdentifier_(v124, v125, @"DiskPasswordSwitch") == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v128 = objc_msgSend_array(MEMORY[0x263EFF980], v126, v127);
        uint64_t v129 = sub_22685D62C(@"StepByStepChoice_Create_Config.UsingDifferentDiskPasswordLabel", qword_268148378);
        v132 = objc_msgSend_tableManager(self, v130, v131);
        uint64_t v135 = objc_msgSend_useDifferentDiskPassword(self, v133, v134);
        uint64_t v137 = objc_msgSend_createRowStyleBasicOnOffWithImage_labelText_isOn_withTag_(v132, v136, 0, v129, v135, 1146114935);
        objc_msgSend_addObject_(v128, v138, v137);
        uint64_t v141 = objc_msgSend_tableManager(self, v139, v140);
        uint64_t v144 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v142, (uint64_t)v128, @"sectionRows", @"DiskPasswordSwitch", @"identifier", 0);
        objc_msgSend_addSectionInfo_animated_(v141, v143, v144, 0);
      }
    }
  }
}

- (void)touchInCellAtIndexPath:(id)a3
{
  if (self->actionController)
  {
    uint64_t v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
    BOOL v8 = objc_msgSend_tableManager(self, v6, v7);
    if (v5 == objc_msgSend_indexOfSectionWithIdentifier_(v8, v9, @"ActionTableSection"))
    {
      objc_msgSend_setupTable(self, v10, v11);
      objc_msgSend_updateTable(self, v12, v13);
      objc_msgSend_validateAndUpdateNextButton(self, v14, v15);
      v18 = objc_msgSend_tableManager(self, v16, v17);
      objc_msgSend_selectMenuCellAtIndexPath_(v18, v19, (uint64_t)a3);
    }
  }
}

- (void)switchTouchedInCellAtIndexPath:(id)a3 forSwitchIndex:(unint64_t)a4 isOn:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = 0;
  BOOL v8 = objc_msgSend_tableManager(self, a2, (uint64_t)a3, a4);
  if (objc_msgSend_tagOfCellAtIndexPath_tag_(v8, v9, (uint64_t)a3, &v19))
  {
    if (v19 == 1146114935)
    {
      objc_msgSend_setUseDifferentDiskPassword_(self, v10, v5);
    }
    else if (v19 == 1397773175)
    {
      objc_msgSend_setUseSinglePassword_(self, v10, v5);
      if (v5)
      {
        uint64_t v12 = objc_msgSend_wifiPassword(self, v10, v11);
        uint64_t v15 = (const char *)objc_msgSend_UTF8String(v12, v13, v14);
        if (v15)
        {
          if (!sub_22685C544(v15))
          {
            objc_msgSend_setWifiPassword_(self, v10, (uint64_t)&stru_26DA6BE88);
            objc_msgSend_setWifiPasswordVerify_(self, v16, (uint64_t)&stru_26DA6BE88);
          }
        }
      }
    }
    objc_msgSend_updateTable(self, v10, v11);
    objc_msgSend_validateAndUpdateNextButton(self, v17, v18);
  }
}

- (BOOL)shouldChangeTextField:(id)a3 atIndexPath:(id)a4 forTextIndex:(unint64_t)a5 toString:(id)a6
{
  return 1;
}

- (NSString)wifiName
{
  return self->_wifiName;
}

- (void)setWifiName:(id)a3
{
}

- (NSString)personalizedBaseName
{
  return self->_personalizedBaseName;
}

- (void)setPersonalizedBaseName:(id)a3
{
}

- (BOOL)useSinglePassword
{
  return self->useSinglePassword;
}

- (void)setUseSinglePassword:(BOOL)a3
{
  self->useSinglePassword = a3;
}

- (NSString)basePassword
{
  return self->_basePassword;
}

- (void)setBasePassword:(id)a3
{
}

- (NSString)basePasswordVerify
{
  return self->_basePasswordVerify;
}

- (void)setBasePasswordVerify:(id)a3
{
}

- (NSString)wifiPassword
{
  return self->_wifiPassword;
}

- (void)setWifiPassword:(id)a3
{
}

- (NSString)wifiPasswordVerify
{
  return self->_wifiPasswordVerify;
}

- (void)setWifiPasswordVerify:(id)a3
{
}

- (NSString)diskPassword
{
  return self->_diskPassword;
}

- (void)setDiskPassword:(id)a3
{
}

- (NSString)diskPasswordVerify
{
  return self->_diskPasswordVerify;
}

- (void)setDiskPasswordVerify:(id)a3
{
}

- (BOOL)hasDisk
{
  return self->hasDisk;
}

- (void)setHasDisk:(BOOL)a3
{
  self->hasDisk = a3;
}

- (BOOL)useDifferentDiskPassword
{
  return self->useDifferentDiskPassword;
}

- (void)setUseDifferentDiskPassword:(BOOL)a3
{
  self->useDifferentDiskPassword = a3;
}

- (RecommendationActionController)actionController
{
  return self->actionController;
}

- (void)setActionController:(id)a3
{
}

- (void)updateSinglePasswordSwitchExplanation:(BOOL)a3
{
  BOOL v3 = a3;
  int hasDisk = objc_msgSend_hasDisk(self, a2, a3);
  uint64_t v7 = @"off";
  if (v3) {
    uint64_t v7 = @"on";
  }
  if (hasDisk) {
    uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"SinglePasswordExplanationWithDisk.%@", v7);
  }
  else {
    uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"SinglePasswordExplanation.%@", v7);
  }
  uint64_t v9 = sub_22685D62C(v8, qword_268148378);
  uint64_t v12 = objc_msgSend_tableManager(self, v10, v11);

  MEMORY[0x270F9A6D0](v12, sel_updateFooter_forSectionWithIdentifier_, v9);
}

- (void)setupInitialTableHeaderConfiguration
{
  v4 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v5 = objc_msgSend_justTextContainerView(self, a2, v2);
  uint64_t v8 = objc_msgSend_topoView(self, v6, v7);
  uint64_t v10 = objc_msgSend_arrayWithObjects_(v4, v9, v5, v8, 0);
  uint64_t v13 = objc_msgSend_parentController(self, v11, v12);
  uint64_t v16 = objc_msgSend_tableHeaderContainerView(self, v14, v15);
  objc_msgSend_replaceSubviewsInView_newSubviews_withAnimation_(v13, v17, v16, v10, 1);
  uint64_t v20 = objc_msgSend_tableHeaderContainerView(self, v18, v19);
  uint64_t v23 = objc_msgSend_tableView(self, v21, v22);

  objc_msgSend_setTableHeaderView_(v23, v24, v20);
}

- (void)validateAndUpdateNextButton
{
  actionController = self->actionController;
  if (!actionController || objc_msgSend_isPrimaryRecommendation(actionController, a2, v2))
  {
    if (!objc_msgSend_validateAndSetValues(self, a2, v2))
    {
      uint64_t v27 = 0;
      goto LABEL_10;
    }
    outResultsDict = self->super.super._outResultsDict;
    uint64_t v7 = objc_msgSend_wifiName(self, a2, v5);
    objc_msgSend_setValue_forKey_(outResultsDict, v8, v7, @"kSBSKey_NetworkName");
    uint64_t v9 = self->super.super._outResultsDict;
    uint64_t v12 = objc_msgSend_personalizedBaseName(self, v10, v11);
    objc_msgSend_setValue_forKey_(v9, v13, v12, @"kSBSKey_BaseName");
    uint64_t v14 = self->super.super._outResultsDict;
    uint64_t v17 = objc_msgSend_wifiPassword(self, v15, v16);
    objc_msgSend_setValue_forKey_(v14, v18, v17, @"kSBSKey_NetworkPassword");
    int v21 = objc_msgSend_useSinglePassword(self, v19, v20);
    uint64_t v24 = self->super.super._outResultsDict;
    if (v21)
    {
      uint64_t v25 = objc_msgSend_wifiPassword(self, v22, v23);
      objc_msgSend_setValue_forKey_(v24, v26, v25, @"kSBSKey_BasePassword");
    }
    else
    {
      uint64_t v28 = objc_msgSend_basePassword(self, v22, v23);
      objc_msgSend_setValue_forKey_(v24, v29, v28, @"kSBSKey_BasePassword");
      if (objc_msgSend_useDifferentDiskPassword(self, v30, v31))
      {
        uint64_t v33 = self->super.super._outResultsDict;
        uint64_t v34 = objc_msgSend_diskPassword(self, a2, v32);
        objc_msgSend_setValue_forKey_(v33, v35, v34, @"kSBSKey_DiskSharing_Password");
      }
    }
  }
  uint64_t v27 = 1;
LABEL_10:

  objc_msgSend_setRightNavigationButton_enable_hide_(self, a2, @"kNext", v27, 0);
}

- (void)setupTable
{
  if (!self->actionController) {
    goto LABEL_6;
  }
  v4 = objc_msgSend_tableManager(self, a2, v2);
  uint64_t v7 = objc_msgSend_sectionIdentifier(self->actionController, v5, v6);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v8, v7) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = objc_msgSend_tableManager(self, a2, v2);
    actionController = self->actionController;
    BOOL v13 = sub_22690522C(self, v11, v12) != 1;
    uint64_t SectionInfoWithLongStrings = objc_msgSend_getSectionInfoWithLongStrings_(actionController, v14, v13);
    objc_msgSend_addSectionInfo_(v9, v16, SectionInfoWithLongStrings);
  }
  uint64_t v17 = self->actionController;
  if (v17 && !objc_msgSend_isPrimaryRecommendation(v17, a2, v2))
  {
    uint64_t v55 = objc_msgSend_tableManager(self, a2, v2);
    objc_msgSend_deleteSectionWithIdentifier_animated_(v55, v56, @"WiFiName", 0);
  }
  else
  {
LABEL_6:
    uint64_t v18 = objc_msgSend_tableManager(self, a2, v2);
    if (objc_msgSend_indexOfSectionWithIdentifier_(v18, v19, @"WiFiName") == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = objc_msgSend_array(MEMORY[0x263EFF980], v20, v21);
      uint64_t v25 = objc_msgSend_tableManager(self, v23, v24);
      uint64_t v26 = sub_22685D62C(@"CustomWiFiName", qword_268148378);
      uint64_t v29 = objc_msgSend_wifiName(self, v27, v28);
      uint64_t v30 = sub_22685D62C(@"CustomWiFiNamePlaceholder", qword_268148378);
      isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v25, v31, 0, v26, v29, v30, 0, 0, 1464225389);
      uint64_t v34 = sub_22684EA54(1651724878, v33);
      if (v34) {
        objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v35, v34, @"nsFormatter");
      }
      objc_msgSend_addObject_(v22, v35, (uint64_t)isSecure_keyboardType_withTag);
      uint64_t v38 = objc_msgSend_tableManager(self, v36, v37);
      uint64_t v39 = sub_22685D62C(@"CustomBaseName", qword_268148378);
      uint64_t v42 = objc_msgSend_personalizedBaseName(self, v40, v41);
      uint64_t v43 = sub_22685D62C(@"CustomBaseNamePlaceholder", qword_268148378);
      uint64_t v45 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v38, v44, 0, v39, v42, v43, 0, 0, 1937329773);
      uint64_t v47 = sub_22684EA54(1937329773, v46);
      if (v47) {
        objc_msgSend_setObject_forKey_(v45, v48, v47, @"nsFormatter");
      }
      objc_msgSend_addObject_(v22, v48, (uint64_t)v45);
      char v51 = objc_msgSend_tableManager(self, v49, v50);
      uint64_t v53 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v52, (uint64_t)v22, @"sectionRows", @"WiFiName", @"identifier", 0);
      objc_msgSend_addSectionInfo_(v51, v54, v53);
    }
  }
  uint64_t v57 = self->actionController;
  uint64_t v58 = objc_msgSend_tableManager(self, v20, v21);
  if (v57)
  {
    objc_msgSend_deleteSectionWithIdentifier_animated_(v58, v59, @"SinglePasswordSwitch", 0);
  }
  else if (objc_msgSend_indexOfSectionWithIdentifier_(v58, v59, @"SinglePasswordSwitch") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v62 = objc_msgSend_array(MEMORY[0x263EFF980], v60, v61);
    unsigned int v65 = objc_msgSend_tableManager(self, v63, v64);
    uint64_t v66 = sub_22685D62C(@"StepByStepChoice_Create_Config.UsingSinglePasswordLabel", qword_268148378);
    uint64_t v69 = objc_msgSend_useSinglePassword(self, v67, v68);
    uint64_t v71 = objc_msgSend_createRowStyleBasicOnOffWithImage_labelText_isOn_withTag_(v65, v70, 0, v66, v69, 1397773175);
    objc_msgSend_addObject_(v62, v72, v71);
    uint64_t v75 = objc_msgSend_tableManager(self, v73, v74);
    uint64_t v78 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x263EFF9A0], v76, (uint64_t)v62, @"sectionRows", @"SinglePasswordSwitch", @"identifier", 0);
    objc_msgSend_addSectionInfo_(v75, v77, v78);
  }
}

- (void)updateTable
{
  uint64_t v4 = objc_msgSend_useSinglePassword(self, a2, v2);
  objc_msgSend_updateSinglePasswordSwitchExplanation_(self, v5, v4);
  if (objc_msgSend_useSinglePassword(self, v6, v7))
  {
    MEMORY[0x270F9A6D0](self, sel_updateTableForSinglePassword, v9);
  }
  else
  {
    objc_msgSend_updateTableForMultiplePasswords(self, v8, v9);
    if (objc_msgSend_useDifferentDiskPassword(self, v10, v11))
    {
      MEMORY[0x270F9A6D0](self, sel_addDiskPasswordSection, v13);
    }
    else
    {
      uint64_t v14 = objc_msgSend_tableManager(self, v12, v13);
      objc_msgSend_deleteSectionWithIdentifier_(v14, v15, @"DiskPassword");
    }
  }
}

- (void)addDiskPasswordSection
{
  uint64_t v4 = objc_msgSend_tableManager(self, a2, v2);
  if (objc_msgSend_indexOfSectionWithIdentifier_(v4, v5, @"DiskPassword") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7);
    uint64_t v11 = objc_msgSend_tableManager(self, v9, v10);
    uint64_t v12 = sub_22685D62C(@"PasswordLabel", qword_268148378);
    uint64_t v15 = objc_msgSend_diskPassword(self, v13, v14);
    uint64_t v16 = sub_22685D62C(@"CreatePasswordPlaceholder", qword_268148378);
    isSecure_keyboardType_withTag = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v11, v17, 0, v12, v15, v16, 1, 1, 1147752545);
    uint64_t v22 = sub_22684EA54(1718842224, v19);
    if (v22) {
      objc_msgSend_setObject_forKey_(isSecure_keyboardType_withTag, v20, v22, @"nsFormatter");
    }
    uint64_t v23 = objc_msgSend_tableManager(self, v20, v21);
    objc_msgSend_setNewRow_verifierAccessoryType_(v23, v24, (uint64_t)isSecure_keyboardType_withTag, 0);
    objc_msgSend_addObject_(v8, v25, (uint64_t)isSecure_keyboardType_withTag);
    uint64_t v28 = objc_msgSend_tableManager(self, v26, v27);
    uint64_t v29 = sub_22685D62C(@"VerifyLabel", qword_268148378);
    uint64_t v32 = objc_msgSend_diskPasswordVerify(self, v30, v31);
    uint64_t v33 = sub_22685D62C(@"VerifyPlaceholder", qword_268148378);
    uint64_t v35 = objc_msgSend_createRowStyleBasicEditableWithImage_labelText_currentValue_placeholderText_isSecure_keyboardType_withTag_(v28, v34, 0, v29, v32, v33, 1, 1, 1147752534);
    uint64_t v38 = (uint64_t)v35;
    if (v22) {
      objc_msgSend_setObject_forKey_(v35, v36, v22, @"nsFormatter");
    }
    uint64_t v39 = objc_msgSend_tableManager(self, v36, v37);
    objc_msgSend_setNewRow_verifierAccessoryType_(v39, v40, v38, 0);
    objc_msgSend_addObject_(v8, v41, v38);
    uint64_t v44 = objc_msgSend_tableManager(self, v42, v43);
    uint64_t v45 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v46 = sub_22685D62C(@"DiskPasswordSectionTitle", qword_268148378);
    uint64_t v49 = objc_msgSend_dictionaryWithObjectsAndKeys_(v45, v47, (uint64_t)v8, @"sectionRows", v46, @"header", @"DiskPassword", @"identifier", 0);
    objc_msgSend_addSectionInfo_animated_(v44, v48, v49, 0);
  }
}

@end
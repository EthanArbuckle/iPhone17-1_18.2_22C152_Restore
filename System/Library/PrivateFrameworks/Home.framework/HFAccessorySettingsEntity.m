@interface HFAccessorySettingsEntity
+ (id)settingsAtURL:(id)a3 error:(id *)a4;
- (BOOL)alwaysShowGroup;
- (BOOL)isSoftwareVersionNeeded;
- (BOOL)previewAccessory;
- (BOOL)requiresDependenciesToShowSetting;
- (BOOL)showInSeperateSection;
- (BOOL)wantsSeparateSectionPerGroup;
- (HFAccessorySettingsEntity)initWithDictionary:(id)a3;
- (NSArray)BOOLeanKeyPathDependencies;
- (NSDictionary)userInfo;
- (NSFormatter)footerTitleFormatter;
- (NSFormatter)headerTitleFormatter;
- (NSFormatter)previewValueFormatter;
- (NSString)adapterIdentifier;
- (NSString)keyPath;
- (NSString)localizedFooter;
- (NSString)localizedHeader;
- (NSString)overrideLocalizedTitleKey;
- (NSString)previewValueKeyPath;
- (NSString)sortKey;
- (id)description;
- (int64_t)interfaceModality;
@end

@implementation HFAccessorySettingsEntity

+ (id)settingsAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 checkResourceIsReachableAndReturnError:a4])
  {
    v6 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v5];
    v7 = objc_opt_new();
    v8 = [v6 objectForKey:@"CodexRoot"];
    objc_msgSend(v7, "na_safeSetObject:forKey:", v8, @"Children");

    [v7 setObject:@"root" forKeyedSubscript:@"KeyPath"];
    id v9 = objc_alloc(MEMORY[0x263F581A0]);
    v10 = [[HFAccessorySettingsEntity alloc] initWithDictionary:v7];
    v11 = (void *)[v9 initWithRepresentedObject:v10];

    uint64_t v15 = 0;
    v16 = (id *)&v15;
    uint64_t v17 = 0x3042000000;
    v18 = __Block_byref_object_copy__26;
    v19 = __Block_byref_object_dispose__26;
    id v20 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__HFAccessorySettingsEntity_settingsAtURL_error___block_invoke;
    aBlock[3] = &unk_26409BA20;
    aBlock[4] = &v15;
    v12 = _Block_copy(aBlock);
    objc_storeWeak(v16 + 5, v12);
    (*((void (**)(void *, void *, void *))v12 + 2))(v12, v11, v7);
    _Block_object_dispose(&v15, 8);
    objc_destroyWeak(&v20);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __49__HFAccessorySettingsEntity_settingsAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"Children"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        v11 = [[HFAccessorySettingsEntity alloc] initWithDictionary:v10];
        v12 = (void *)[objc_alloc(MEMORY[0x263F581A0]) initWithRepresentedObject:v11];
        [v5 addChild:v12];
        WeakRetained = (void (**)(id, void *, void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                            + 40));
        WeakRetained[2](WeakRetained, v12, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFAccessorySettingsEntity *)self keyPath];
  [v3 appendString:v4 withName:@"keyPath"];

  id v5 = [(HFAccessorySettingsEntity *)self sortKey];
  [v3 appendString:v5 withName:@"sortKey"];

  uint64_t v6 = [v3 build];

  return v6;
}

- (HFAccessorySettingsEntity)initWithDictionary:(id)a3
{
  id v150 = a3;
  if (!v150)
  {
    v133 = [MEMORY[0x263F08690] currentHandler];
    [v133 handleFailureInMethod:a2, self, @"HFAccessorySettingsEntity.m", 171, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v172.receiver = self;
  v172.super_class = (Class)HFAccessorySettingsEntity;
  v146 = [(HFAccessorySettingsEntity *)&v172 init];
  id v5 = NSString;
  uint64_t v6 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 1, 2);
  uint64_t v7 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 13, 2);
  uint64_t v8 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 3, 2);
  uint64_t v9 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 32, 2);
  v148 = [v5 stringWithFormat:@"%@%@%@%@", v6, v7, v8, v9];

  uint64_t v10 = NSString;
  v11 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 6, 2);
  v12 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 13, 2);
  v13 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 3, 2);
  v14 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 32, 2);
  v145 = [v10 stringWithFormat:@"%@%@%@%@", v11, v12, v13, v14];

  long long v15 = NSString;
  long long v16 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 15, 2);
  long long v17 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 19, 2);
  long long v18 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 11, 2);
  v19 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 34, 2);
  uint64_t v20 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 24, 2);
  v21 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 9, 2);
  v144 = [v15 stringWithFormat:@"%@%@%@%@%@i%@", v16, v17, v18, v19, v20, v21];

  v22 = NSString;
  v23 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 30, 2);
  v24 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 19, 2);
  v25 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 11, 2);
  v26 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 34, 2);
  v27 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 24, 2);
  v28 = objc_msgSend(@"1anun2AnnmebenodobeorXouCh78Y5Docell", "substringWithRange:", 9, 2);
  v143 = [v22 stringWithFormat:@"%@%@%@%@%@i%@", v23, v24, v25, v26, v27, v28];

  v29 = NSString;
  v30 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 6, 2);
  v31 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 8, 2);
  v32 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 12, 2);
  v33 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 8, 2);
  v142 = [v29 stringWithFormat:@"%@%@%@%@", v30, v31, v32, v33];

  v34 = NSString;
  v35 = objc_msgSend(@"yAtdolbmos", "substringWithRange:", 3, 2);
  v36 = objc_msgSend(@"yAtdolbmos", "substringWithRange:", 5, 2);
  v37 = objc_msgSend(@"yAtdolbmos", "substringWithRange:", 0, 1);
  v38 = objc_msgSend(@"yAtdolbmos", "substringWithRange:", 1, 2);
  v39 = objc_msgSend(@"yAtdolbmos", "substringWithRange:", 7, 2);
  v40 = objc_msgSend(@"yAtdolbmos", "substringWithRange:", 9, 1);
  v141 = [v34 stringWithFormat:@"%@%@%@%@%@%@", v35, v36, v37, v38, v39, v40];

  v41 = NSString;
  v42 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 20, 2);
  v43 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 8, 2);
  v44 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 4, 2);
  v45 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 22, 2);
  v46 = objc_msgSend(@"stleAdlossatlemelAiobajuloudnt ", "substringWithRange:", 0, 2);
  v140 = [v41 stringWithFormat:@"%@%@%@%@%@", v42, v43, v44, v45, v46];

  v138 = NSString;
  v137 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 26, 2);
  v154 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 21, 2);
  v152 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 9, 2);
  v135 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 12, 2);
  v136 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 20, 2);
  v134 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 6, 2);
  v47 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 15, 2);
  v48 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 17, 2);
  v49 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 0, 2);
  v50 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 30, 2);
  v51 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 24, 2);
  v52 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 3, 2);
  v53 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 28, 2);
  v54 = objc_msgSend(@"lugabHSiMAdkjuvriVo8sto3Enauleme", "substringWithRange:", 10, 1);
  v139 = [v138 stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@", v137, v154, v152, v135, v136, v134, v47, v48, v49, v50, v51, v52, v53, v54];

  v55 = v146;
  v169[0] = MEMORY[0x263EF8330];
  v169[1] = 3221225472;
  v169[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke;
  v169[3] = &unk_26409BA48;
  id v56 = v148;
  id v170 = v56;
  id v57 = v145;
  id v171 = v57;
  v58 = objc_msgSend(v150, "na_dictionaryByMappingValues:", v169);

  v166[0] = MEMORY[0x263EF8330];
  v166[1] = 3221225472;
  v166[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_2;
  v166[3] = &unk_26409BA48;
  id v59 = v144;
  id v167 = v59;
  id v60 = v143;
  id v168 = v60;
  v61 = objc_msgSend(v58, "na_dictionaryByMappingValues:", v166);

  v164[0] = MEMORY[0x263EF8330];
  v164[1] = 3221225472;
  v164[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_3;
  v164[3] = &unk_26409BA70;
  id v155 = v142;
  id v165 = v155;
  v62 = objc_msgSend(v61, "na_dictionaryByMappingValues:", v164);

  v162[0] = MEMORY[0x263EF8330];
  v162[1] = 3221225472;
  v162[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_4;
  v162[3] = &unk_26409BA70;
  id v153 = v141;
  id v163 = v153;
  v63 = objc_msgSend(v62, "na_dictionaryByMappingValues:", v162);

  v160[0] = MEMORY[0x263EF8330];
  v160[1] = 3221225472;
  v160[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_5;
  v160[3] = &unk_26409BA70;
  id v151 = v140;
  id v161 = v151;
  v64 = objc_msgSend(v63, "na_dictionaryByMappingValues:", v160);

  v158[0] = MEMORY[0x263EF8330];
  v158[1] = 3221225472;
  v158[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_6;
  v158[3] = &unk_26409BA70;
  id v65 = v139;
  id v159 = v65;
  v66 = objc_msgSend(v64, "na_dictionaryByMappingValues:", v158);

  if (v146)
  {
    v67 = [v66 objectForKeyedSubscript:@"KeyPath"];
    uint64_t v68 = [v67 copy];
    keyPath = v146->_keyPath;
    v146->_keyPath = (NSString *)v68;

    v70 = [v66 objectForKeyedSubscript:@"SortKey"];
    uint64_t v71 = [v70 copy];
    sortKey = v146->_sortKey;
    v146->_sortKey = (NSString *)v71;

    v73 = [v66 objectForKeyedSubscript:@"DisplayValuePreviewFromKeyPath"];
    uint64_t v74 = [v73 copy];
    p_previewValueKeyPath = (id *)&v146->_previewValueKeyPath;
    previewValueKeyPath = v146->_previewValueKeyPath;
    v146->_previewValueKeyPath = (NSString *)v74;

    v77 = [v66 objectForKeyedSubscript:@"DisplayValuePreviewFromAccessory"];
    v146->_previewAccessory = [v77 BOOLValue];

    v78 = [v66 objectForKeyedSubscript:@"LocalizedOverrideTitleKey"];
    uint64_t v79 = [v78 copy];
    overrideLocalizedTitleKey = v146->_overrideLocalizedTitleKey;
    v146->_overrideLocalizedTitleKey = (NSString *)v79;

    if (v146->_previewAccessory && [*p_previewValueKeyPath length]) {
      NSLog(&cfstr_CannotPopulate.isa);
    }
    v81 = [v66 objectForKeyedSubscript:@"DisplayValuePreviewFormatter"];
    if ([*p_previewValueKeyPath isEqualToString:@"root.siri.allowHeySiri"])
    {

      objc_storeStrong((id *)&v146->_previewValueKeyPath, @"root.siri.allowHeySiri");
      v81 = @"SiriTriggerPhraseSettingFormatter";
    }
    if ([(__CFString *)v81 containsString:@"AudioAnalysis"])
    {
      v82 = v81;
      v81 = 0;
LABEL_17:

      goto LABEL_18;
    }
    if (*p_previewValueKeyPath)
    {
      if (!v81) {
        goto LABEL_18;
      }
    }
    else if (!v81 || !v146->_previewAccessory)
    {
LABEL_18:
      v85 = [v66 objectForKeyedSubscript:@"HeaderTitleFormatter"];
      if (([v85 containsString:@"AudioAnalysis"] & 1) == 0)
      {
        if (!v85) {
          goto LABEL_22;
        }
        v86 = +[HFAccessorySettingFormatterFactory defaultFactory];
        uint64_t v87 = [v86 formatterForKey:v85];
        headerTitleFormatter = v146->_headerTitleFormatter;
        v146->_headerTitleFormatter = (NSFormatter *)v87;
      }
LABEL_22:
      v89 = [v66 objectForKeyedSubscript:@"FooterTitleFormatter"];
      if (([v89 containsString:@"AudioAnalysis"] & 1) == 0)
      {
        if (!v89)
        {
LABEL_26:
          v93 = [v66 objectForKeyedSubscript:@"GroupHeaderLocalizedStringKey"];

          if (v93)
          {
            v94 = [v66 objectForKeyedSubscript:@"GroupHeaderLocalizedStringKey"];
            uint64_t v95 = _HFLocalizedStringWithDefaultValue(v94, v94, 1);
            localizedHeader = v146->_localizedHeader;
            v146->_localizedHeader = (NSString *)v95;
          }
          v97 = [v66 objectForKeyedSubscript:@"GroupFooterLocalizedStringKey"];

          if (v97)
          {
            v98 = [v66 objectForKeyedSubscript:@"GroupFooterLocalizedStringKey"];
            uint64_t v99 = _HFLocalizedStringWithDefaultValue(v98, v98, 1);
            localizedFooter = v146->_localizedFooter;
            v146->_localizedFooter = (NSString *)v99;
          }
          v101 = [v66 objectForKeyedSubscript:@"PreferredInterfaceModality"];
          v102 = v101;
          v149 = v81;
          if (v101)
          {
            id v103 = v101;
            if ([v103 isEqualToString:@"AccessorySettingsInterfaceModalitySlider"])
            {
              uint64_t v104 = 2;
            }
            else if ([v103 isEqualToString:@"AccessorySettingsInterfaceModalityStepper"])
            {
              uint64_t v104 = 3;
            }
            else if ([v103 isEqualToString:@"AccessorySettingsInterfaceModalitySwitch"])
            {
              uint64_t v104 = 5;
            }
            else if ([v103 isEqualToString:@"kCodexSettingsModalitySetting"])
            {
              uint64_t v104 = 1;
            }
            else if ([v103 isEqualToString:@"AccessorySettingsInterfaceModalityAXSecondStepper"])
            {
              uint64_t v104 = 4;
            }
            else if ([v103 isEqualToString:@"AccessorySettingsInterfaceModalitySelection"])
            {
              uint64_t v104 = 8;
            }
            else if ([v103 isEqualToString:@"AccessorySettingsInterfaceModalityButton"])
            {
              uint64_t v104 = 9;
            }
            else
            {
              uint64_t v104 = -1;
            }
          }
          else
          {
            v105 = [v66 objectForKeyedSubscript:@"Children"];
            if ([v105 count])
            {

              uint64_t v104 = 0;
            }
            else
            {
              v106 = [v66 objectForKeyedSubscript:@"AlwaysShowGroup"];
              int v107 = [v106 BOOLValue];

              uint64_t v104 = v107 ^ 1u;
              v55 = v146;
            }
          }
          v55->_interfaceModality = v104;
          if (_MergedGlobals_322 != -1) {
            dispatch_once(&_MergedGlobals_322, &__block_literal_global_187);
          }
          id v108 = (id)qword_26AB2FE50;
          v109 = [v66 objectForKeyedSubscript:@"SwitchEnableDependencies"];
          uint64_t v110 = [v109 copy];
          BOOLeanKeyPathDependencies = v55->_BOOLeanKeyPathDependencies;
          v55->_BOOLeanKeyPathDependencies = (NSArray *)v110;

          v112 = [v66 objectForKeyedSubscript:@"HideOnDisableDependency"];

          if (v112)
          {
            v113 = [v66 objectForKeyedSubscript:@"HideOnDisableDependency"];
            v55->_requiresDependenciesToShowSetting = [v113 BOOLValue];
          }
          else
          {
            v55->_requiresDependenciesToShowSetting = 1;
          }
          v114 = [v66 objectForKeyedSubscript:@"AlwaysShowGroup"];
          v55->_alwaysShowGroup = [v114 BOOLValue];

          v115 = [v66 objectForKeyedSubscript:@"ShowInSeperateSection"];
          v55->_showInSeperateSection = [v115 BOOLValue];

          v116 = [v66 objectForKeyedSubscript:@"IsSoftwareVersionNeeded"];
          v55->_isSoftwareVersionNeeded = [v116 BOOLValue];

          v117 = [v66 objectForKeyedSubscript:@"WantsSeparateSectionPerGroup"];
          if (v117)
          {
            [v66 objectForKeyedSubscript:@"WantsSeparateSectionPerGroup"];
            v147 = v66;
            id v118 = v108;
            v119 = v102;
            id v120 = v65;
            id v121 = v60;
            id v122 = v59;
            id v123 = v57;
            id v124 = v56;
            v126 = v125 = v55;
            v125->_wantsSeparateSectionPerGroup = [v126 BOOLValue];

            v55 = v125;
            id v56 = v124;
            id v57 = v123;
            id v59 = v122;
            id v60 = v121;
            id v65 = v120;
            v102 = v119;
            id v108 = v118;
            v66 = v147;
          }
          else
          {
            v55->_wantsSeparateSectionPerGroup = 1;
          }

          uint64_t v127 = [v66 objectForKeyedSubscript:@"AdapterIdentifier"];
          adapterIdentifier = v55->_adapterIdentifier;
          v55->_adapterIdentifier = (NSString *)v127;

          v156[0] = MEMORY[0x263EF8330];
          v156[1] = 3221225472;
          v156[2] = __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_9;
          v156[3] = &unk_26409BA98;
          id v157 = v108;
          id v129 = v108;
          uint64_t v130 = objc_msgSend(v66, "na_filter:", v156);
          userInfo = v55->_userInfo;
          v55->_userInfo = (NSDictionary *)v130;

          goto LABEL_59;
        }
        v90 = +[HFAccessorySettingFormatterFactory defaultFactory];
        uint64_t v91 = [v90 formatterForKey:v89];
        footerTitleFormatter = v146->_footerTitleFormatter;
        v146->_footerTitleFormatter = (NSFormatter *)v91;
      }
      goto LABEL_26;
    }
    v82 = +[HFAccessorySettingFormatterFactory defaultFactory];
    uint64_t v83 = [v82 formatterForKey:v81];
    previewValueFormatter = v146->_previewValueFormatter;
    v146->_previewValueFormatter = (NSFormatter *)v83;

    goto LABEL_17;
  }
LABEL_59:

  return v55;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"*dertbu*" withString:*(void *)(a1 + 32)];

    id v9 = [v8 stringByReplacingOccurrencesOfString:@"*Dertbu*" withString:*(void *)(a1 + 40)];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"*grtyde*" withString:*(void *)(a1 + 32)];

    id v9 = [v8 stringByReplacingOccurrencesOfString:@"*Grtyde*" withString:*(void *)(a1 + 40)];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"*wdeioes*" withString:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"*uehgslv*" withString:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"*cyutvegi*" withString:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

id __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 stringByReplacingOccurrencesOfString:@"*lRVrruvjJf*" withString:*(void *)(a1 + 32)];
  }
  else
  {
    id v8 = v5;
  }
  id v9 = v8;

  return v9;
}

uint64_t __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_8()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"KeyPath", @"SortKey", @"GroupHeaderLocalizedStringKey", @"GroupFooterLocalizedStringKey", @"PreferredInterfaceModality", @"Children", @"SwitchEnableDependencies", @"WantsSeparateSectionPerGroup", @"AlwaysShowGroup", @"AdapterIdentifier", @"LocalizedOverrideTitleKey", @"FooterTitleFormatter", 0);
  uint64_t v1 = qword_26AB2FE50;
  qword_26AB2FE50 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __48__HFAccessorySettingsEntity_initWithDictionary___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (NSString)localizedHeader
{
  return self->_localizedHeader;
}

- (NSString)localizedFooter
{
  return self->_localizedFooter;
}

- (NSString)overrideLocalizedTitleKey
{
  return self->_overrideLocalizedTitleKey;
}

- (NSArray)BOOLeanKeyPathDependencies
{
  return self->_BOOLeanKeyPathDependencies;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (int64_t)interfaceModality
{
  return self->_interfaceModality;
}

- (BOOL)requiresDependenciesToShowSetting
{
  return self->_requiresDependenciesToShowSetting;
}

- (BOOL)previewAccessory
{
  return self->_previewAccessory;
}

- (NSString)previewValueKeyPath
{
  return self->_previewValueKeyPath;
}

- (NSFormatter)previewValueFormatter
{
  return self->_previewValueFormatter;
}

- (NSFormatter)footerTitleFormatter
{
  return self->_footerTitleFormatter;
}

- (NSFormatter)headerTitleFormatter
{
  return self->_headerTitleFormatter;
}

- (BOOL)alwaysShowGroup
{
  return self->_alwaysShowGroup;
}

- (BOOL)wantsSeparateSectionPerGroup
{
  return self->_wantsSeparateSectionPerGroup;
}

- (NSString)adapterIdentifier
{
  return self->_adapterIdentifier;
}

- (BOOL)showInSeperateSection
{
  return self->_showInSeperateSection;
}

- (BOOL)isSoftwareVersionNeeded
{
  return self->_isSoftwareVersionNeeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapterIdentifier, 0);
  objc_storeStrong((id *)&self->_headerTitleFormatter, 0);
  objc_storeStrong((id *)&self->_footerTitleFormatter, 0);
  objc_storeStrong((id *)&self->_previewValueFormatter, 0);
  objc_storeStrong((id *)&self->_previewValueKeyPath, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_BOOLeanKeyPathDependencies, 0);
  objc_storeStrong((id *)&self->_overrideLocalizedTitleKey, 0);
  objc_storeStrong((id *)&self->_localizedFooter, 0);
  objc_storeStrong((id *)&self->_localizedHeader, 0);
  objc_storeStrong((id *)&self->_sortKey, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
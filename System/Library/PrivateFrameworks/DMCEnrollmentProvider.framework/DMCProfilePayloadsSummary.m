@interface DMCProfilePayloadsSummary
+ (BOOL)_isInstalledMDMProfile:(id)a3;
+ (BOOL)_isMDMProfile:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_consentModelWithProfileName:(id)a3 consentString:(id)a4;
+ (id)_installedManagedAppIDs;
+ (id)_localizedPayloadSummaryByType:(id)a3;
+ (id)_managedBooks;
+ (id)_signedByStringFromProfile:(id)a3;
+ (id)_sortedPayloads:(id)a3;
+ (id)_warningTextFromPayload:(id)a3;
+ (id)summaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4 dataSource:(unint64_t)a5;
+ (void)_addObjectsOfClass:(Class)a3 fromArray:(id)a4 toArray:(id)a5;
- (DMCProfilePayloadsSummary)initWithCoder:(id)a3;
- (NSArray)accountSections;
- (NSArray)byodInfoSections;
- (NSArray)managedAppSections;
- (NSArray)managedBookSections;
- (NSArray)moreDetailsSections;
- (NSArray)payloadInfoSectionSummaries;
- (NSArray)restrictionSections;
- (NSString)managedAppleID;
- (int64_t)finalInstallationWarningStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountSections:(id)a3;
- (void)setByodInfoSections:(id)a3;
- (void)setFinalInstallationWarningStyle:(int64_t)a3;
- (void)setManagedAppSections:(id)a3;
- (void)setManagedAppleID:(id)a3;
- (void)setManagedBookSections:(id)a3;
- (void)setMoreDetailsSections:(id)a3;
- (void)setPayloadInfoSectionSummaries:(id)a3;
- (void)setRestrictionSections:(id)a3;
@end

@implementation DMCProfilePayloadsSummary

+ (id)summaryForProfile:(id)a3 showManagedPayloads:(BOOL)a4 dataSource:(unint64_t)a5
{
  BOOL v5 = a4;
  uint64_t v213 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  v172 = objc_opt_new();
  if (v5) {
    [v6 managedPayloads];
  }
  else {
  id v8 = [v6 payloads];
  }

  v151 = v8;
  [v172 addObjectsFromArray:v8];
  unsigned int context = [a1 _isMDMProfile:v6];
  int v9 = [a1 _isInstalledMDMProfile:v6];
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = [v6 payloadsOfKindOfClass:objc_opt_class()];
  v13 = [v12 firstObject];

  v14 = [v13 assignedManagedAppleID];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v13 managedAppleID];
  }
  if ([v16 length]) {
    [v7 setManagedAppleID:v16];
  }
  [v7 setFinalInstallationWarningStyle:context];
  v164 = v10;
  v165 = v6;
  v163 = v11;
  v157 = v7;
  v152 = v13;
  v150 = v16;
  if ((v9 & v5) == 1)
  {
    [a1 _installedManagedAppIDs];
    long long v199 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v199 objects:v212 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v200;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v200 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v199 + 1) + 8 * i);
          v23 = [[DMCApplicationProxy alloc] initWithBundleID:v22 dataSource:a5];
          v24 = [[DMCPayloadViewModel alloc] initWithManagedApp:v23];
          [v164 addObject:v24];
          v25 = [[DMCManagedAppPayload alloc] initWithManagedAppID:v22 profile:v165];
          [v172 addObject:v25];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v199 objects:v212 count:16];
      }
      while (v19);
    }

    v26 = *(id *)DMCLogObjects();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v17 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v211 = v27;
      _os_log_impl(&dword_221CC5000, v26, OS_LOG_TYPE_DEFAULT, "DMCProfileViewModel: number of installed managed apps: %lu.", buf, 0xCu);
    }

    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    v28 = [a1 _managedBooks];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v195 objects:v209 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v196;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v196 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v195 + 1) + 8 * j);
          v34 = [[DMCPayloadViewModel alloc] initWithManagedBook:v33];
          [v163 addObject:v34];
          v35 = [[DMCManagedBookPayload alloc] initWithBook:v33];
          [v172 addObject:v35];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v195 objects:v209 count:16];
      }
      while (v30);
    }

    v11 = v163;
    v10 = v164;
  }
  if ([v10 count]) {
    v36 = [[DMCProfilePayloadSection alloc] initWithSectionTitle:0 footer:0 payloadViewModels:v10];
  }
  else {
    v36 = 0;
  }
  if ([v11 count]) {
    v37 = [[DMCProfilePayloadSection alloc] initWithSectionTitle:0 footer:0 payloadViewModels:v11];
  }
  else {
    v37 = 0;
  }
  v149 = v36;
  if (v36)
  {
    v208 = v36;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v208 count:1];
    [v7 setManagedAppSections:v38];
  }
  else
  {
    [v7 setManagedAppSections:0];
  }
  v148 = v37;
  if (v37)
  {
    v207 = v37;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v207 count:1];
    [v7 setManagedBookSections:v39];
  }
  else
  {
    [v7 setManagedBookSections:0];
  }
  v40 = [a1 _sortedPayloads:v172];
  id v41 = objc_alloc_init(MEMORY[0x263F08760]);
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v42 = v40;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v191 objects:v206 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v192;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v192 != v45) {
          objc_enumerationMutation(v42);
        }
        [v41 addObject:objc_opt_class()];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v191 objects:v206 count:16];
    }
    while (v44);
  }
  v158 = v41;

  v156 = objc_opt_new();
  v154 = objc_opt_new();
  v153 = objc_opt_new();
  v159 = objc_opt_new();
  uint64_t v47 = objc_opt_new();
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  obuint64_t j = v42;
  uint64_t v173 = [obj countByEnumeratingWithState:&v187 objects:v205 count:16];
  uint64_t v48 = 0;
  if (v173)
  {
    v174 = 0;
    v175 = 0;
    uint64_t v49 = 0;
    v50 = 0;
    v51 = 0;
    uint64_t v171 = *(void *)v188;
    uint64_t v161 = *MEMORY[0x263F53870];
    uint64_t v52 = 2;
    if (context) {
      uint64_t v52 = 3;
    }
    uint64_t v155 = v52;
    unint64_t v53 = 0x2645E8000uLL;
    uint64_t v167 = v47;
    do
    {
      for (uint64_t m = 0; m != v173; ++m)
      {
        if (*(void *)v188 != v171) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v187 + 1) + 8 * m);
        contexta = (void *)MEMORY[0x223C90110]();
        uint64_t v56 = objc_opt_class();
        uint64_t v57 = [*(id *)(v53 + 1384) payloadTypeForPayloadClass:v56];
        if (v56 != objc_opt_class())
        {
          v58 = [*(id *)(v53 + 1384) payloadViewModelsFromPayload:v55];
          if (v56 == objc_opt_class())
          {
            v168 = v58;
            uint64_t v59 = v49;
            v60 = (void *)MEMORY[0x263F53C70];
            [v55 restrictions];
            v61 = v55;
            uint64_t v62 = v48;
            v63 = v51;
            v65 = v64 = v50;
            LODWORD(v60) = [v60 restrictedBoolForFeature:v161 withRestrictionsDictionary:v65];

            v50 = v64;
            v51 = v63;
            uint64_t v48 = v62;
            v55 = v61;
            BOOL v66 = v60 == 2;
            uint64_t v49 = v59;
            v58 = v168;
            unint64_t v53 = 0x2645E8000uLL;
            if (v66) {
              [v157 setFinalInstallationWarningStyle:v155];
            }
          }
          if (v51 == (void *)v56)
          {
            v73 = v175;
          }
          else
          {
            uint64_t v169 = v49;
            if (v48)
            {
              if (v51 == objc_opt_class())
              {
                if (v175)
                {
                  v67 = *(void **)(v53 + 1384);
                  v68 = [(DMCProfilePayloadSection *)v175 payloadViewModels];
                  v69 = [v67 removeDuplicatesFromRestrictionPayloadViewModels:v68];

                  v70 = (void *)[v69 mutableCopy];
                  [(DMCProfilePayloadSection *)v175 setPayloadViewModels:v70];
                }
                v71 = [(DMCProfilePayloadSection *)v175 payloadViewModels];
                uint64_t v48 = [v71 count];
              }
              v72 = [v51 localizedDescriptionForPayloadCount:v48];
              if (v72) {
                [v159 addObject:v72];
              }
              if (v175)
              {
                if ((unint64_t)[v158 countForObject:v51] > 1) {
                  [v51 localizedPluralForm];
                }
                else {
                v74 = [v51 localizedSingularForm];
                }
                [(DMCProfilePayloadSection *)v175 setSectionTitle:v74];

                v75 = [a1 _warningTextFromPayload:v50];
                [(DMCProfilePayloadSection *)v175 setSectionFooter:v75];

                [v174 addObject:v175];
              }

              unint64_t v53 = 0x2645E8000;
            }
            v73 = objc_alloc_init(DMCProfilePayloadSection);

            uint64_t v48 = 0;
            uint64_t v49 = v169;
          }
          if (v49 != v57)
          {
            if ([v174 count] && (unint64_t)(v49 - 2) >= 2)
            {
              v76 = v156;
              if (v49 != 1)
              {
                v76 = v154;
                if (v49 != 4) {
                  v76 = v153;
                }
              }
              [v76 addObjectsFromArray:v174];
            }
            uint64_t v77 = objc_opt_new();

            v174 = (void *)v77;
          }
          v48 += [v58 count];
          v175 = v73;
          v78 = [(DMCProfilePayloadSection *)v73 payloadViewModels];
          [v78 addObjectsFromArray:v58];

          id v79 = v55;
          v50 = v79;
          uint64_t v49 = v57;
          v51 = (void *)v56;
          uint64_t v47 = v167;
        }
      }
      uint64_t v173 = [obj countByEnumeratingWithState:&v187 objects:v205 count:16];
    }
    while (v173);
  }
  else
  {
    v174 = 0;
    v175 = 0;
    uint64_t v49 = 0;
    v50 = 0;
    v51 = 0;
  }
  v80 = (void *)v47;
  uint64_t v81 = v49;

  v82 = [(DMCProfilePayloadSection *)v175 payloadViewModels];
  uint64_t v83 = [v82 count];

  v84 = v165;
  if (v83 && v51)
  {
    if (v51 == objc_opt_class())
    {
      v85 = [(DMCProfilePayloadSection *)v175 payloadViewModels];
      v86 = +[DMCPayloadViewModel removeDuplicatesFromRestrictionPayloadViewModels:v85];

      v87 = (void *)[v86 mutableCopy];
      [(DMCProfilePayloadSection *)v175 setPayloadViewModels:v87];

      v88 = [(DMCProfilePayloadSection *)v175 payloadViewModels];
      uint64_t v48 = [v88 count];
    }
    v89 = [v51 localizedDescriptionForPayloadCount:v48];
    [v159 addObject:v89];
    v90 = objc_msgSend(v51, "localizedParenthesizedFormDescriptionForPayloadCount:", objc_msgSend(v158, "countForObject:", v51));
    [(DMCProfilePayloadSection *)v175 setSectionTitle:v90];
    v91 = [a1 _warningTextFromPayload:v50];
    [(DMCProfilePayloadSection *)v175 setSectionFooter:v91];

    [v174 addObject:v175];
  }
  v160 = v50;
  if ([v174 count] && (unint64_t)(v81 - 2) >= 2)
  {
    v92 = v154;
    if (v81 != 4) {
      v92 = v153;
    }
    if (v81 == 1) {
      v93 = v156;
    }
    else {
      v93 = v92;
    }
    [v93 addObjectsFromArray:v174];
  }
  if (a5 != 1)
  {
    v94 = [v165 signerCertificates];
    v95 = objc_opt_new();
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v96 = v94;
    uint64_t v97 = [v96 countByEnumeratingWithState:&v183 objects:v204 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v184;
      do
      {
        for (uint64_t n = 0; n != v98; ++n)
        {
          if (*(void *)v184 != v99) {
            objc_enumerationMutation(v96);
          }
          v101 = *(void **)(*((void *)&v183 + 1) + 8 * n);
          v102 = [MEMORY[0x263EFF9D0] null];
          char v103 = [v101 isEqual:v102];

          if ((v103 & 1) == 0) {
            [v95 addObject:v101];
          }
        }
        uint64_t v98 = [v96 countByEnumeratingWithState:&v183 objects:v204 count:16];
      }
      while (v98);
    }

    objc_opt_class();
    v84 = v165;
    if ((objc_opt_isKindOfClass() & 1) == 0 && [v95 count])
    {
      if ((unint64_t)[v95 count] <= 1) {
        v104 = @"DMC_SIGNING_CERTIFICATE";
      }
      else {
        v104 = @"DMC_SIGNING_CERTIFICATES";
      }
      v105 = DMCEnrollmentLocalizedString(v104);
      v106 = [[DMCProfilePayloadSection alloc] initWithSectionTitle:v105 footer:0 payloadViewModels:v95];
      [v153 addObject:v106];
    }
  }
  v107 = [v84 localizedManagedProfileConsentTexts];
  if ([v107 count])
  {
    v108 = objc_opt_new();
    long long v179 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    id v109 = v107;
    uint64_t v110 = [v109 countByEnumeratingWithState:&v179 objects:v203 count:16];
    if (v110)
    {
      uint64_t v111 = v110;
      uint64_t v112 = *(void *)v180;
      do
      {
        for (iuint64_t i = 0; ii != v111; ++ii)
        {
          if (*(void *)v180 != v112) {
            objc_enumerationMutation(v109);
          }
          uint64_t v114 = *(void *)(*((void *)&v179 + 1) + 8 * ii);
          v115 = [v109 objectForKeyedSubscript:v114];
          v116 = [a1 _consentModelWithProfileName:v114 consentString:v115];

          [v108 addObject:v116];
        }
        uint64_t v111 = [v109 countByEnumeratingWithState:&v179 objects:v203 count:16];
      }
      while (v111);
    }

    if ((unint64_t)[v109 count] <= 1) {
      v117 = @"DMC_CONSENT_NOTICE";
    }
    else {
      v117 = @"DMC_CONSENT_NOTICES";
    }
    v118 = DMCEnrollmentLocalizedString(v117);
    v119 = [[DMCProfilePayloadSection alloc] initWithSectionTitle:v118 footer:0 payloadViewModels:v108];
    [v153 addObject:v119];
    if ((unint64_t)[v109 count] >= 2)
    {
      v120 = NSString;
      v121 = DMCEnrollmentLocalizedString(@"DMC_CONSENT_NOTICES_%@");
      v122 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v109, "count"));
      uint64_t v123 = objc_msgSend(v120, "stringWithFormat:", v121, v122);

      v118 = (void *)v123;
    }
    [v159 addObject:v118];

    v84 = v165;
  }
  contextb = v107;
  v124 = +[DMCEnrollmentFlowManagedConfigurationHelper organizationNameFromProfile:v84 payload:v152];
  v125 = [DMCProfileInfoSection alloc];
  v126 = DMCEnrollmentLocalizedString(@"DMC_ORGANIZATION");
  v127 = [(DMCProfileInfoSection *)v125 initWithSectionTitle:v126 footer:0 text:v124];
  [v80 addObject:v127];

  v128 = NSString;
  v129 = DMCEnrollmentLocalizedString(@"DMC_SIGNED_BY");
  v130 = [v128 stringWithFormat:@"%@ ", v129];

  v131 = [a1 _signedByStringFromProfile:v84];
  v132 = [[DMCProfileInfoSection alloc] initWithSectionTitle:v130 footer:0 attributedText:v131];
  [v80 addObject:v132];

  v133 = [v84 localizedConsentText];
  v134 = v84;
  uint64_t v135 = [v133 length];

  if (v135)
  {
    v136 = NSString;
    v137 = DMCEnrollmentLocalizedString(@"DMC_INSTALL_CONSENT_MESSAGE_FROM_%@");
    v138 = objc_msgSend(v136, "stringWithFormat:", v137, v124);

    v139 = [DMCProfileInfoSection alloc];
    v140 = [v134 localizedConsentText];
    v141 = [(DMCProfileInfoSection *)v139 initWithSectionTitle:v138 footer:0 text:v140];
    [v80 addObject:v141];
  }
  if ([v156 count]) {
    v142 = v156;
  }
  else {
    v142 = 0;
  }
  [v157 setAccountSections:v142];
  if ([v153 count]) {
    v143 = v153;
  }
  else {
    v143 = 0;
  }
  [v157 setMoreDetailsSections:v143];
  if ([v154 count]) {
    v144 = v154;
  }
  else {
    v144 = 0;
  }
  [v157 setRestrictionSections:v144];
  if ([v159 count]) {
    v145 = v159;
  }
  else {
    v145 = 0;
  }
  [v157 setPayloadInfoSectionSummaries:v145];
  [v157 setByodInfoSections:v80];
  id v146 = v157;

  return v146;
}

+ (BOOL)_isInstalledMDMProfile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F53C50] sharedConnection];
  id v6 = [v5 unverifiedInstalledMDMProfileIdentifier];

  if ([a1 _isMDMProfile:v4])
  {
    v7 = [v4 identifier];
    char v8 = [v7 isEqualToString:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_isMDMProfile:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v4 = [v3 isMDMProfile];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)_installedManagedAppIDs
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F52840] managedAppIDsExcludeDDMApps:1];
  if ([v2 count])
  {
    id v3 = objc_opt_new();
    char v4 = [MEMORY[0x263F01880] defaultWorkspace];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v4, "applicationIsInstalled:", v10, (void)v12)) {
            [v3 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }

  return v3;
}

+ (id)_managedBooks
{
  return (id)[MEMORY[0x263F52840] managedBooks];
}

+ (id)_sortedPayloads:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    if (!_sortedPayloads__classSortOrder)
    {
      uint64_t v48 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v47 = objc_opt_class();
      uint64_t v46 = objc_opt_class();
      uint64_t v45 = objc_opt_class();
      uint64_t v44 = objc_opt_class();
      uint64_t v43 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      uint64_t v41 = objc_opt_class();
      uint64_t v40 = objc_opt_class();
      uint64_t v39 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      uint64_t v33 = objc_opt_class();
      uint64_t v32 = objc_opt_class();
      uint64_t v31 = objc_opt_class();
      uint64_t v30 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      objc_msgSend(v48, "arrayWithObjects:", v47, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31,
        v30,
        v29,
        v28,
        v27,
        v26,
        v5,
        v6,
        v7,
        v8,
        v9,
        v10,
        v11,
        v12,
        objc_opt_class(),
      uint64_t v13 = 0);
      long long v14 = (void *)_sortedPayloads__classSortOrder;
      _sortedPayloads__classSortOrder = v13;
    }
    long long v15 = (void *)[v4 mutableCopy];
    id v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v17 = (id)_sortedPayloads__classSortOrder;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          [a1 _addObjectsOfClass:*(void *)(*((void *)&v49 + 1) + 8 * i) fromArray:v15 toArray:v16];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v19);
    }

    while ([v15 count])
    {
      uint64_t v22 = [v15 objectAtIndex:0];
      uint64_t v23 = objc_opt_class();

      [a1 _addObjectsOfClass:v23 fromArray:v15 toArray:v16];
    }
    id v24 = (id)[v16 copy];
  }
  else
  {
    id v24 = v4;
  }

  return v24;
}

+ (void)_addObjectsOfClass:(Class)a3 fromArray:(id)a4 toArray:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if ([v10 count] && objc_msgSend(v10, "count"))
  {
    unint64_t v8 = 0;
    do
    {
      if (v8 >= [v10 count]) {
        break;
      }
      uint64_t v9 = [v10 objectAtIndex:v8];
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (Class)objc_opt_class() == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        ++v8;
      }
      else
      {
        [v7 addObject:v9];
        [v10 removeObjectAtIndex:v8];
      }
    }
    while ([v10 count]);
  }
}

+ (id)_localizedPayloadSummaryByType:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  id v7 = v5;
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v8 = v6;
  uint64_t v9 = 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v5);
      }
      uint64_t v13 = objc_opt_class();
      if (v13 != objc_opt_class())
      {
        if (v10 == (void *)v13)
        {
          ++v9;
        }
        else
        {
          if (v10 && v9)
          {
            long long v14 = objc_msgSend(v10, "localizedDescriptionForPayloadCount:", v9, v16);
            [v4 addObject:v14];
          }
          uint64_t v9 = 1;
          id v10 = (void *)v13;
        }
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);

  if (v10 && v9)
  {
    id v7 = [v10 localizedDescriptionForPayloadCount:v9];
    [v4 addObject:v7];
LABEL_18:
  }
  return v4;
}

+ (id)_warningTextFromPayload:(id)a3
{
  id v3 = [a3 installationWarnings];
  id v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__DMCProfilePayloadsSummary__warningTextFromPayload___block_invoke;
  v9[3] = &unk_2645E97D0;
  id v10 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v9];
  if ([v5 length]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void __53__DMCProfilePayloadsSummary__warningTextFromPayload___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v7 localizedBody];
  [v5 appendString:v6];
}

+ (id)_signedByStringFromProfile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 signerSummary];
  if (![(__CFString *)v4 length])
  {

    id v4 = &stru_26D435FC0;
  }
  id v5 = objc_opt_new();
  if ([v3 isSigned])
  {
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    id v7 = [NSString stringWithFormat:@"%@ · ", v4];
    uint64_t v8 = (void *)[v6 initWithString:v7];
    [v5 appendAttributedString:v8];
  }
  uint64_t v9 = +[DMCProfileViewModel trustTextForProfile:v3];
  if (v9) {
    [v5 appendAttributedString:v9];
  }

  return v5;
}

+ (id)_consentModelWithProfileName:(id)a3 consentString:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F53C08];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithLocalizedString:0 localizedKey:v6];

  uint64_t v9 = (void *)MEMORY[0x263F53C10];
  v17[0] = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  uint64_t v11 = [v9 sectionWithKeyValues:v10];

  uint64_t v12 = DMCEnrollmentLocalizedString(@"DMC_CONSENT_NOTICE");
  [v11 setSectionTitle:v12];

  uint64_t v13 = objc_opt_new();
  [v13 setType:5];
  [v13 setTitle:v7];
  [v13 setFriendlyName:v7];

  [v13 setShowIcon:0];
  [v13 setHasDetails:1];
  long long v16 = v11;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  [v13 setPayloadDescriptionKeyValueSections:v14];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCProfilePayloadsSummary *)self managedAppleID];
  [v4 encodeObject:v5 forKey:@"managedAppleID"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMCProfilePayloadsSummary finalInstallationWarningStyle](self, "finalInstallationWarningStyle"));
  [v4 encodeObject:v6 forKey:@"finalInstallationWarningStyle"];

  id v7 = [(DMCProfilePayloadsSummary *)self accountSections];
  [v4 encodeObject:v7 forKey:@"accountSections"];

  uint64_t v8 = [(DMCProfilePayloadsSummary *)self managedAppSections];
  [v4 encodeObject:v8 forKey:@"managedAppSections"];

  uint64_t v9 = [(DMCProfilePayloadsSummary *)self managedBookSections];
  [v4 encodeObject:v9 forKey:@"managedBookSections"];

  id v10 = [(DMCProfilePayloadsSummary *)self moreDetailsSections];
  [v4 encodeObject:v10 forKey:@"moreDetailsSections"];

  uint64_t v11 = [(DMCProfilePayloadsSummary *)self restrictionSections];
  [v4 encodeObject:v11 forKey:@"restrictionSections"];

  uint64_t v12 = [(DMCProfilePayloadsSummary *)self byodInfoSections];
  [v4 encodeObject:v12 forKey:@"byodInfoSections"];

  id v13 = [(DMCProfilePayloadsSummary *)self payloadInfoSectionSummaries];
  [v4 encodeObject:v13 forKey:@"payloadInfoSectionSummaries"];
}

- (DMCProfilePayloadsSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DMCProfilePayloadsSummary;
  id v5 = [(DMCProfilePayloadsSummary *)&v46 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"managedAppleID"];
    managedAppleID = v5->_managedAppleID;
    v5->_managedAppleID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"finalInstallationWarningStyle"];
    v5->_finalInstallationWarningStyle = [v9 integerValue];

    id v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"accountSections"];
    accountSections = v5->_accountSections;
    v5->_accountSections = (NSArray *)v13;

    long long v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    long long v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"managedAppSections"];
    managedAppSections = v5->_managedAppSections;
    v5->_managedAppSections = (NSArray *)v18;

    uint64_t v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"managedBookSections"];
    managedBookSections = v5->_managedBookSections;
    v5->_managedBookSections = (NSArray *)v23;

    v25 = (void *)MEMORY[0x263EFFA08];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"moreDetailsSections"];
    moreDetailsSections = v5->_moreDetailsSections;
    v5->_moreDetailsSections = (NSArray *)v28;

    uint64_t v30 = (void *)MEMORY[0x263EFFA08];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"restrictionSections"];
    restrictionSections = v5->_restrictionSections;
    v5->_restrictionSections = (NSArray *)v33;

    uint64_t v35 = (void *)MEMORY[0x263EFFA08];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"byodInfoSections"];
    byodInfoSections = v5->_byodInfoSections;
    v5->_byodInfoSections = (NSArray *)v38;

    uint64_t v40 = (void *)MEMORY[0x263EFFA08];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"payloadInfoSectionSummaries"];
    payloadInfoSectionSummaries = v5->_payloadInfoSectionSummaries;
    v5->_payloadInfoSectionSummaries = (NSArray *)v43;
  }
  return v5;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (void)setManagedAppleID:(id)a3
{
}

- (int64_t)finalInstallationWarningStyle
{
  return self->_finalInstallationWarningStyle;
}

- (void)setFinalInstallationWarningStyle:(int64_t)a3
{
  self->_finalInstallationWarningStyle = a3;
}

- (NSArray)accountSections
{
  return self->_accountSections;
}

- (void)setAccountSections:(id)a3
{
}

- (NSArray)managedAppSections
{
  return self->_managedAppSections;
}

- (void)setManagedAppSections:(id)a3
{
}

- (NSArray)managedBookSections
{
  return self->_managedBookSections;
}

- (void)setManagedBookSections:(id)a3
{
}

- (NSArray)moreDetailsSections
{
  return self->_moreDetailsSections;
}

- (void)setMoreDetailsSections:(id)a3
{
}

- (NSArray)restrictionSections
{
  return self->_restrictionSections;
}

- (void)setRestrictionSections:(id)a3
{
}

- (NSArray)byodInfoSections
{
  return self->_byodInfoSections;
}

- (void)setByodInfoSections:(id)a3
{
}

- (NSArray)payloadInfoSectionSummaries
{
  return self->_payloadInfoSectionSummaries;
}

- (void)setPayloadInfoSectionSummaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadInfoSectionSummaries, 0);
  objc_storeStrong((id *)&self->_byodInfoSections, 0);
  objc_storeStrong((id *)&self->_restrictionSections, 0);
  objc_storeStrong((id *)&self->_moreDetailsSections, 0);
  objc_storeStrong((id *)&self->_managedBookSections, 0);
  objc_storeStrong((id *)&self->_managedAppSections, 0);
  objc_storeStrong((id *)&self->_accountSections, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
}

@end
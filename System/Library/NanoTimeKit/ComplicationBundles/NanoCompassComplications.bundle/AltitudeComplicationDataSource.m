@interface AltitudeComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
- (AltitudeComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateNoData:(BOOL)a3 altitude:(id)a4 privacyEnabled:(BOOL)a5;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)privacyTemplate;
- (id)randomizedTemplate;
- (id)sampleTemplate;
- (void)_setMetadataForProvider:(id)a3 withAltitude:(id)a4 privacyEnabled:(BOOL)a5;
@end

@implementation AltitudeComplicationDataSource

+ (id)bundleIdentifierSuffix
{
  return @".altitude";
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_supportsUrsa(v5, v6, v7, v8))
  {
    int v12 = objc_msgSend_supportsPolaris(v5, v9, v10, v11);
    unsigned int v13 = (0x1CDFu >> a3) & 1;
    if ((unint64_t)a3 > 0xC) {
      LOBYTE(v13) = 0;
    }
    if (v12) {
      BOOL v14 = v13;
    }
    else {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (id)appNameLocalizationKey
{
  return @"COMPASS_APP_NAME";
}

+ (id)complicationNameLocalizationKey
{
  return @"ALTITUDE_COMPLICATION_NAME";
}

- (AltitudeComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AltitudeComplicationDataSource;
  return [(NanoCompassBaseComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5 mode:8];
}

- (id)sampleTemplate
{
  id v5 = objc_msgSend_idealizedAltitude(NCAltitude, a2, v2, v3);
  uint64_t v7 = objc_msgSend__templateNoData_altitude_privacyEnabled_(self, v6, 0, (uint64_t)v5, 0);

  return v7;
}

- (id)newTemplate
{
  id v5 = objc_msgSend_altitude(self, a2, v2, v3);
  v9 = objc_msgSend_copy(v5, v6, v7, v8);
  uint64_t v11 = objc_msgSend__templateNoData_altitude_privacyEnabled_(self, v10, 0, (uint64_t)v9, 0);

  return v11;
}

- (id)noDataTemplate
{
  return (id)objc_msgSend__templateNoData_altitude_privacyEnabled_(self, a2, 1, 0, 0);
}

- (id)privacyTemplate
{
  return (id)objc_msgSend__templateNoData_altitude_privacyEnabled_(self, a2, 1, 0, 1);
}

- (id)alwaysOnTemplate
{
  return 0;
}

- (id)randomizedTemplate
{
  id v5 = objc_msgSend_randomizedAltitude(NCAltitude, a2, v2, v3);
  uint64_t v7 = objc_msgSend__templateNoData_altitude_privacyEnabled_(self, v6, 0, (uint64_t)v5, 0);

  return v7;
}

- (id)_templateNoData:(BOOL)a3 altitude:(id)a4 privacyEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v192 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int v12 = v8;
  if (v6)
  {

    int v12 = 0;
  }
  switch(objc_msgSend_family(self, v9, v10, v11))
  {
    case 0:
      unsigned __int8 v185 = 0;
      if (v12)
      {
        uint64_t v29 = NanoCompassGetAltitudeAbbreviationWithTargetLength(v12, 5, &v185);
      }
      else
      {
        uint64_t v29 = NanoCompassFormattedUncalibrated();
      }
      v19 = (void *)v29;
      v113 = NCLogForCategory(0);
      if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
      {
        if (v185) {
          v114 = @"YES";
        }
        else {
          v114 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v191 = v114;
        _os_log_impl(&dword_23759D000, v113, OS_LOG_TYPE_DEFAULT, "metric unit should be abbreviated: %@", buf, 0xCu);
      }

      v27 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v115, (uint64_t)v19, v116);
      v30 = objc_opt_new();
      objc_msgSend_setLine1TextProvider_(v30, v117, (uint64_t)v27, v118);
      v119 = (void *)MEMORY[0x263EFD208];
      v123 = NanoCompassFormattedAltitudeUnitsInAbbr(v185, v120, v121, v122);
      v127 = objc_msgSend_localizedUppercaseString(v123, v124, v125, v126);
      v130 = objc_msgSend_textProviderWithText_(v119, v128, (uint64_t)v127, v129);
      objc_msgSend_setLine2TextProvider_(v30, v131, (uint64_t)v130, v132);

      objc_msgSend_setHighlightLine2_(v30, v133, 1, v134);
      goto LABEL_37;
    case 1:
      v30 = objc_opt_new();
      v19 = NanoCompassLocalizedString(@"ALTITUDE_LARGE_MODULAR_TITLE_FORMAT");
      v31 = NSString;
      v32 = NanoCompassLocalizedString(@"ALTITUDE_LARGE_MODULAR_TITLE");
      v36 = NanoCompassFormattedAltitudeUnits((uint64_t)v32, v33, v34, v35);
      v40 = objc_msgSend_localizedUppercaseString(v36, v37, v38, v39);
      v27 = objc_msgSend_stringWithFormat_(v31, v41, (uint64_t)v19, v42, v32, v40);

      v45 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v43, (uint64_t)v27, v44);
      objc_msgSend_setHeaderTextProvider_(v30, v46, (uint64_t)v45, v47);

      if (v12)
      {
        char v51 = objc_msgSend_displayTilde(v12, v48, v49, v50);
        v52 = NSNumber;
        objc_msgSend_altitude(v12, v53, v54, v55);
        v59 = objc_msgSend_numberWithDouble_(v52, v56, v57, v58);
        v60 = NanoCompassValueWithFormat(v59, 0, v51);
      }
      else
      {
        v60 = NanoCompassValueWithFormat(0, 0, 0);
      }
      v135 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v61, (uint64_t)v60, v62);
      objc_msgSend_setBodyTextProvider_(v30, v136, (uint64_t)v135, v137);

      goto LABEL_37;
    case 2:
    case 6:
      id v16 = objc_alloc(MEMORY[0x263EFD210]);
      v19 = objc_msgSend_initWithSystemName_(v16, v17, @"mountain.2.fill", v18);
      v20 = NanoCompassAppTintColor();
      objc_msgSend_setTintColor_(v19, v21, (uint64_t)v20, v22);

      if (v5)
      {
        v23 = (void *)MEMORY[0x263EFD208];
        v24 = NanoCompassFormattedUncalibrated();
        v27 = objc_msgSend_textProviderWithText_(v23, v25, (uint64_t)v24, v26);

        goto LABEL_27;
      }
      v111 = v12;
      int v112 = 1;
      goto LABEL_26;
    case 3:
      id v63 = objc_alloc(MEMORY[0x263EFD210]);
      v19 = objc_msgSend_initWithSystemName_(v63, v64, @"mountain.2.fill", v65);
      v66 = NanoCompassAppTintColor();
      objc_msgSend_setTintColor_(v19, v67, (uint64_t)v66, v68);

      if (v5)
      {
        v69 = NanoCompassAppTintColor();
        v27 = AltitudeRedactionTextProvider(v69);
      }
      else
      {
        v111 = v12;
        int v112 = 0;
LABEL_26:
        v27 = NanoCompassComplicationAltitudeSmallCapsTextProvider(v111, 0, v112);
      }
LABEL_27:
      v30 = objc_msgSend_templateWithTextProvider_imageProvider_(MEMORY[0x263EFD148], v28, (uint64_t)v27, (uint64_t)v19);
LABEL_37:

LABEL_38:
LABEL_39:
      v138 = NanoCompassAppTintColor();
      objc_msgSend_setTintColor_(v30, v139, (uint64_t)v138, v140);

      return v30;
    case 4:
      unsigned __int8 v185 = 0;
      if (v12)
      {
        uint64_t v70 = NanoCompassGetAltitudeAbbreviationWithTargetLength(v12, 5, &v185);
      }
      else
      {
        uint64_t v70 = NanoCompassFormattedUncalibrated();
      }
      v19 = (void *)v70;
      v142 = NCLogForCategory(0);
      if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
      {
        if (v185) {
          v143 = @"YES";
        }
        else {
          v143 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v191 = v143;
        _os_log_impl(&dword_23759D000, v142, OS_LOG_TYPE_DEFAULT, "metric unit should be abbreviated: %@", buf, 0xCu);
      }

      v30 = objc_opt_new();
      v146 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v144, (uint64_t)v19, v145);
      objc_msgSend_setLine1TextProvider_(v30, v147, (uint64_t)v146, v148);

      v149 = (void *)MEMORY[0x263EFD208];
      v153 = NanoCompassFormattedAltitudeUnitsInAbbr(v185, v150, v151, v152);
      v157 = objc_msgSend_localizedUppercaseString(v153, v154, v155, v156);
      v160 = objc_msgSend_textProviderWithText_(v149, v158, (uint64_t)v157, v159);
      objc_msgSend_setLine2TextProvider_(v30, v161, (uint64_t)v160, v162);

      goto LABEL_38;
    case 7:
      if (v12)
      {
        char v74 = objc_msgSend_displayTilde(v12, v13, v14, v15);
        v75 = NSNumber;
        objc_msgSend_altitude(v12, v76, v77, v78);
        v82 = objc_msgSend_numberWithDouble_(v75, v79, v80, v81);
      }
      else
      {
        char v74 = 0;
        v82 = 0;
      }
      v19 = NanoCompassValueWithFormat(v82, 0, v74);
      if (v12) {

      }
      v30 = objc_opt_new();
      v165 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v163, (uint64_t)v19, v164);
      objc_msgSend_setLine1TextProvider_(v30, v166, (uint64_t)v165, v167);

      v168 = (void *)MEMORY[0x263EFD208];
      v173 = NanoCompassFormattedAltitudeUnits(v169, v170, v171, v172);
      v177 = objc_msgSend_localizedUppercaseString(v173, v174, v175, v176);
      v180 = objc_msgSend_textProviderWithText_(v168, v178, (uint64_t)v177, v179);
      objc_msgSend_setLine2TextProvider_(v30, v181, (uint64_t)v180, v182);

      objc_msgSend_setHighlightLine2_(v30, v183, 1, v184);
      goto LABEL_38;
    case 10:
      v83 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v84 = objc_opt_class();
      v87 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v83, v85, v84, v86);
      objc_msgSend__setMetadataForProvider_withAltitude_privacyEnabled_(self, v88, (uint64_t)v87, (uint64_t)v12, v5);
      v30 = objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v89, (uint64_t)v87, v90);
      uint64_t v186 = *MEMORY[0x263EFCF80];
      uint64_t v187 = MEMORY[0x263EFFA88];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v91, (uint64_t)&v187, (uint64_t)&v186, 1);
      goto LABEL_22;
    case 11:
      v92 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v93 = objc_opt_class();
      v87 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v92, v94, v93, v95);
      objc_msgSend__setMetadataForProvider_withAltitude_privacyEnabled_(self, v96, (uint64_t)v87, (uint64_t)v12, v5);
      id v97 = objc_alloc(MEMORY[0x263EFD0D8]);
      v30 = objc_msgSend_initWithImageProvider_(v97, v98, (uint64_t)v87, v99);
      goto LABEL_23;
    case 12:
      v100 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v101 = objc_opt_class();
      v87 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v100, v102, v101, v103);
      objc_msgSend__setMetadataForProvider_withAltitude_privacyEnabled_(self, v104, (uint64_t)v87, (uint64_t)v12, v5);
      v30 = objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD0A0], v105, (uint64_t)v87, v106);
      uint64_t v188 = *MEMORY[0x263EFCF80];
      uint64_t v189 = MEMORY[0x263EFFA88];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v107, (uint64_t)&v189, (uint64_t)&v188, 1);
      v108 = LABEL_22:;
      objc_msgSend_setMetadata_(v30, v109, (uint64_t)v108, v110);

LABEL_23:
      goto LABEL_39;
    default:
      NCLogForCategory(1uLL);
      v71 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR)) {
        sub_2375D7C80(self, v71, v72, v73);
      }

      v30 = 0;
      goto LABEL_39;
  }
}

- (void)_setMetadataForProvider:(id)a3 withAltitude:(id)a4 privacyEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  v26[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v12 = v8;
  if (v5)
  {
    v25[0] = @"altitude";
    unsigned int v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10, v11);
    v25[1] = @"nodata";
    v26[0] = v13;
    v26[1] = MEMORY[0x263EFFA88];
    uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v26, (uint64_t)v25, 2);
    objc_msgSend_setMetadata_(v7, v16, (uint64_t)v15, v17);

LABEL_6:
    goto LABEL_7;
  }
  v23[0] = @"altitude";
  unsigned int v13 = v8;
  if (!v8)
  {
    unsigned int v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10, v11);
  }
  v24[0] = v13;
  v23[1] = @"nodata";
  uint64_t v18 = objc_msgSend_numberWithBool_(NSNumber, v9, v12 == 0, v11);
  v24[1] = v18;
  v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v19, (uint64_t)v24, (uint64_t)v23, 2);
  objc_msgSend_setMetadata_(v7, v21, (uint64_t)v20, v22);

  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:
}

@end
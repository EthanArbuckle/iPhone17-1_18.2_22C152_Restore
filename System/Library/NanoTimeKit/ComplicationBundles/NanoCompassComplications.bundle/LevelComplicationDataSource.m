@interface LevelComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
- (LevelComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateNoData:(BOOL)a3 calibrated:(BOOL)a4 showAlwaysOnState:(BOOL)a5 heading:(id)a6 bearing:(id)a7 incline:(id)a8;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)randomizedTemplate;
- (id)sampleTemplate;
@end

@implementation LevelComplicationDataSource

+ (id)appNameLocalizationKey
{
  return @"COMPASS_APP_NAME";
}

+ (id)complicationNameLocalizationKey
{
  return @"LEVEL_COMPLICATION_NAME";
}

+ (id)bundleIdentifierSuffix
{
  return @".level";
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  int v5 = objc_msgSend_supportsUrsa(a4, a2, a3, (uint64_t)a4);
  if (v5)
  {
    if (objc_msgSend_showingIdealizedData(NCManager, v6, v7, v8))
    {
      v9 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "Running fixture demo mode. Disabling the Level complication in complication picker.", v11, 2u);
      }

      LOBYTE(v5) = 0;
    }
    else if ((unint64_t)a3 <= 0xC)
    {
      LOBYTE(v5) = (0x1700u >> a3) & 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (LevelComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)LevelComplicationDataSource;
  return [(NanoCompassBaseComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5 mode:3];
}

- (id)sampleTemplate
{
  int v5 = objc_msgSend_idealizedHeading(NCHeading, a2, v2, v3);
  v9 = objc_msgSend_idealizedBearing(NCBearing, v6, v7, v8);
  v13 = objc_msgSend_idealizedIncline(NCIncline, v10, v11, v12);
  v15 = objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_incline_(self, v14, 0, 1, 0, v5, v9, v13);

  return v15;
}

- (id)alwaysOnTemplate
{
  return (id)objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_incline_(self, a2, 1, 0, 1, 0, 0, 0);
}

- (id)newTemplate
{
  uint64_t v5 = objc_msgSend_calibrated(self, a2, v2, v3);
  v9 = objc_msgSend_heading(self, v6, v7, v8);
  v13 = objc_msgSend_copy(v9, v10, v11, v12);
  v17 = objc_msgSend_bearing(self, v14, v15, v16);
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  v25 = objc_msgSend_incline(self, v22, v23, v24);
  v29 = objc_msgSend_copy(v25, v26, v27, v28);
  v31 = objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_incline_(self, v30, 0, v5, 0, v13, v21, v29);

  return v31;
}

- (id)noDataTemplate
{
  return (id)objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_incline_(self, a2, 1, 0, 0, 0, 0, 0);
}

- (id)randomizedTemplate
{
  uint64_t v5 = objc_msgSend_randomizedHeading(NCHeading, a2, v2, v3);
  v9 = objc_msgSend_randomizedBearing(NCBearing, v6, v7, v8);
  v13 = objc_msgSend_randomizedIncline(NCIncline, v10, v11, v12);
  uint64_t v15 = objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_incline_(self, v14, 0, 1, 0, v5, v9, v13);

  return v15;
}

- (id)_templateNoData:(BOOL)a3 calibrated:(BOOL)a4 showAlwaysOnState:(BOOL)a5 heading:(id)a6 bearing:(id)a7 incline:(id)a8
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  v120[4] = *MEMORY[0x263EF8340];
  id v14 = a6;
  id v15 = a7;
  id v19 = a8;
  uint64_t v20 = !v11 | v12;
  if (v20 == 1)
  {

    id v19 = 0;
    id v15 = 0;
    id v14 = 0;
  }
  switch(objc_msgSend_family(self, v16, v17, v18))
  {
    case 8:
      if (v10)
      {
        uint64_t v23 = NanoCompassLocalizedString(@"LEVEL_COMPLICATION_NAME");
        uint64_t v27 = objc_msgSend_localizedUppercaseString(v23, v24, v25, v26);

        v30 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v28, (uint64_t)v27, v29);
        v31 = NanoCompassAppTintColor();
        objc_msgSend_setTintColor_(v30, v32, (uint64_t)v31, v33);
      }
      else
      {
        if (v20) {
          objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v21, (uint64_t)&stru_26EA49580, v22);
        }
        else {
        v30 = NanoCompassComplicationHeadingDirectionBearingTextProvider(v14, v15);
        }
      }
      v95 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v96 = objc_opt_class();
      v82 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v95, v97, v96, v98);
      v113[0] = @"incline";
      v102 = v19;
      if (!v19)
      {
        v102 = objc_msgSend_null(MEMORY[0x263EFF9D0], v99, v100, v101);
      }
      v114[0] = v102;
      v113[1] = @"nodata";
      v103 = objc_msgSend_numberWithBool_(NSNumber, v99, v20, v101);
      v114[1] = v103;
      v105 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v104, (uint64_t)v114, (uint64_t)v113, 2);
      objc_msgSend_setMetadata_(v82, v106, (uint64_t)v105, v107);

      if (!v19) {
      v55 = objc_msgSend_templateWithTextProvider_imageProvider_(MEMORY[0x263EFD098], v108, (uint64_t)v30, (uint64_t)v82);
      }
      goto LABEL_49;
    case 9:
      if (v20)
      {
        v30 = 0;
      }
      else
      {
        v30 = NanoCompassComplicationHeadingDirectionBearingTextProvider(v14, v15);
      }
      v75 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v76 = objc_opt_class();
      v82 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v75, v77, v76, v78);
      v115[0] = @"heading";
      v83 = v14;
      if (!v14)
      {
        v83 = objc_msgSend_null(MEMORY[0x263EFF9D0], v79, v80, v81);
      }
      v116[0] = v83;
      v115[1] = @"incline";
      v84 = v19;
      if (!v19)
      {
        v84 = objc_msgSend_null(MEMORY[0x263EFF9D0], v79, v80, v81);
      }
      v116[1] = v84;
      v115[2] = @"nodata";
      v85 = objc_msgSend_numberWithBool_(NSNumber, v79, v20, v81);
      v116[2] = v85;
      v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v86, (uint64_t)v116, (uint64_t)v115, 3);
      objc_msgSend_setMetadata_(v82, v88, (uint64_t)v87, v89);

      if (v19)
      {
        if (v14) {
          goto LABEL_35;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_35;
        }
      }

LABEL_35:
      v92 = (void *)MEMORY[0x263EFD018];
      v93 = objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v90, (uint64_t)v82, v91);
      v55 = objc_msgSend_templateWithCircularTemplate_textProvider_(v92, v94, (uint64_t)v93, (uint64_t)v30);

LABEL_49:
      goto LABEL_50;
    case 10:
      v34 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v35 = objc_opt_class();
      v30 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v34, v36, v35, v37);
      v119[0] = @"heading";
      v41 = v14;
      if (!v14)
      {
        v41 = objc_msgSend_null(MEMORY[0x263EFF9D0], v38, v39, v40);
      }
      v120[0] = v41;
      v119[1] = @"incline";
      v42 = v19;
      if (!v19)
      {
        v42 = objc_msgSend_null(MEMORY[0x263EFF9D0], v38, v39, v40);
      }
      v120[1] = v42;
      v119[2] = @"nodata";
      v43 = objc_msgSend_numberWithBool_(NSNumber, v38, v20, v40);
      v120[2] = v43;
      v119[3] = @"alwayson";
      v46 = objc_msgSend_numberWithBool_(NSNumber, v44, v10, v45);
      v120[3] = v46;
      v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v47, (uint64_t)v120, (uint64_t)v119, 4);
      objc_msgSend_setMetadata_(v30, v49, (uint64_t)v48, v50);

      if (v19)
      {
        if (v14) {
          goto LABEL_14;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_14;
        }
      }

LABEL_14:
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v51, (uint64_t)v30, v52);
      goto LABEL_25;
    case 12:
      v56 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v57 = objc_opt_class();
      v30 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v56, v58, v57, v59);
      v117[0] = @"heading";
      v63 = v14;
      if (!v14)
      {
        v63 = objc_msgSend_null(MEMORY[0x263EFF9D0], v60, v61, v62);
      }
      v118[0] = v63;
      v117[1] = @"incline";
      v64 = v19;
      if (!v19)
      {
        v64 = objc_msgSend_null(MEMORY[0x263EFF9D0], v60, v61, v62);
      }
      v118[1] = v64;
      v117[2] = @"nodata";
      v65 = objc_msgSend_numberWithBool_(NSNumber, v60, v20, v62);
      v118[2] = v65;
      v117[3] = @"alwayson";
      v68 = objc_msgSend_numberWithBool_(NSNumber, v66, v10, v67);
      v118[3] = v68;
      v70 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v69, (uint64_t)v118, (uint64_t)v117, 4);
      objc_msgSend_setMetadata_(v30, v71, (uint64_t)v70, v72);

      if (v19)
      {
        if (v14) {
          goto LABEL_24;
        }
      }
      else
      {

        if (v14) {
          goto LABEL_24;
        }
      }

LABEL_24:
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD0A0], v73, (uint64_t)v30, v74);
      v55 = LABEL_25:;
LABEL_50:

      v109 = NanoCompassAppTintColor();
      objc_msgSend_setTintColor_(v55, v110, (uint64_t)v109, v111);

      return v55;
    default:
      v30 = NCLogForCategory(1uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_2375D7C80(self, (char *)v30, v53, v54);
      }
      v55 = 0;
      goto LABEL_50;
  }
}

@end
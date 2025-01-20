@interface CompassBearingComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
- (CompassBearingComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateNoData:(BOOL)a3 calibrated:(BOOL)a4 showAlwaysOnState:(BOOL)a5 heading:(id)a6 bearing:(id)a7;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)randomizedTemplate;
- (id)redactionTextProviderWithColor:(id)a3;
- (id)sampleTemplate;
@end

@implementation CompassBearingComplicationDataSource

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
        _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "running fixture demo mode. disable the compass complication in complication picker.", v11, 2u);
      }

      LOBYTE(v5) = 0;
    }
    else if ((unint64_t)a3 <= 0xB)
    {
      LOBYTE(v5) = (0xB00u >> a3) & 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CompassBearingComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CompassBearingComplicationDataSource;
  return [(NanoCompassBaseComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5 mode:3];
}

+ (id)appNameLocalizationKey
{
  return @"COMPASS_APP_NAME";
}

+ (id)complicationNameLocalizationKey
{
  return @"COMPASS_COMPLICATION_TITLE";
}

+ (id)bundleIdentifierSuffix
{
  return @".compass.bearing";
}

- (id)sampleTemplate
{
  int v5 = objc_msgSend_idealizedHeading(NCHeading, a2, v2, v3);
  v9 = objc_msgSend_idealizedBearing(NCBearing, v6, v7, v8);
  v11 = objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_(self, v10, 0, 1, 0, v5, v9);

  return v11;
}

- (id)newTemplate
{
  uint64_t v5 = objc_msgSend_calibrated(self, a2, v2, v3);
  v9 = objc_msgSend_heading(self, v6, v7, v8);
  v13 = objc_msgSend_copy(v9, v10, v11, v12);
  v17 = objc_msgSend_bearing(self, v14, v15, v16);
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  v23 = objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_(self, v22, 0, v5, 0, v13, v21);

  return v23;
}

- (id)noDataTemplate
{
  return (id)objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_(self, a2, 1, 0, 0, 0, 0);
}

- (id)randomizedTemplate
{
  uint64_t v5 = objc_msgSend_randomizedHeading(NCHeading, a2, v2, v3);
  v9 = objc_msgSend_randomizedBearing(NCBearing, v6, v7, v8);
  uint64_t v11 = objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_(self, v10, 0, 1, 0, v5, v9);

  return v11;
}

- (id)alwaysOnTemplate
{
  return (id)objc_msgSend__templateNoData_calibrated_showAlwaysOnState_heading_bearing_(self, a2, 1, 0, 1, 0, 0);
}

- (id)_templateNoData:(BOOL)a3 calibrated:(BOOL)a4 showAlwaysOnState:(BOOL)a5 heading:(id)a6 bearing:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  v100[3] = *MEMORY[0x263EF8340];
  id v12 = a6;
  id v16 = a7;
  uint64_t v17 = !v9 | v10;
  if (v17 == 1)
  {

    id v16 = 0;
    id v12 = 0;
  }
  uint64_t v18 = objc_msgSend_family(self, v13, v14, v15);
  switch(v18)
  {
    case 11:
      uint64_t v19 = objc_opt_new();
      v26 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v27 = objc_opt_class();
      v23 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v26, v28, v27, v29);
      v94 = @"heading";
      v33 = v12;
      if (!v12)
      {
        v33 = objc_msgSend_null(MEMORY[0x263EFF9D0], v30, v31, v32, v94);
      }
      v96[0] = v33;
      v95 = @"bearing";
      v34 = v16;
      if (!v16)
      {
        v34 = objc_msgSend_null(MEMORY[0x263EFF9D0], v30, v31, v32);
      }
      v35 = objc_msgSend_numberWithBool_(NSNumber, v30, v17, v32, v94, v95, @"nodata", v96[0], v34);
      v96[2] = v35;
      v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v96, (uint64_t)&v94, 3);
      objc_msgSend_setMetadata_(v23, v38, (uint64_t)v37, v39);

      if (v16)
      {
        if (v12)
        {
LABEL_14:
          objc_msgSend_setImageProvider_(v19, v40, (uint64_t)v23, v41);
          goto LABEL_31;
        }
      }
      else
      {

        if (v12) {
          goto LABEL_14;
        }
      }

      goto LABEL_14;
    case 9:
      uint64_t v19 = objc_opt_new();
      if (v17 | v8)
      {
        v45 = objc_msgSend_whiteColor(MEMORY[0x263F1C550], v42, v43, v44);
        v23 = objc_msgSend_redactionTextProviderWithColor_(self, v46, (uint64_t)v45, v47);
      }
      else
      {
        v23 = NanoCompassComplicationHeadingDirectionBearingTextProvider(v12, v16);
      }
      objc_msgSend_setTextProvider_(v19, v48, (uint64_t)v23, v49);
      v50 = objc_opt_new();
      v51 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v52 = objc_opt_class();
      v58 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v51, v53, v52, v54);
      v97[0] = @"heading";
      v59 = v12;
      if (!v12)
      {
        v59 = objc_msgSend_null(MEMORY[0x263EFF9D0], v55, v56, v57);
      }
      v98[0] = v59;
      v97[1] = @"nodata";
      v60 = objc_msgSend_numberWithBool_(NSNumber, v55, v17, v57);
      v98[1] = v60;
      v97[2] = @"alwayson";
      v63 = objc_msgSend_numberWithBool_(NSNumber, v61, v8, v62);
      v98[2] = v63;
      v65 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v64, (uint64_t)v98, (uint64_t)v97, 3);
      objc_msgSend_setMetadata_(v58, v66, (uint64_t)v65, v67);

      if (!v12) {
      objc_msgSend_setImageProvider_(v50, v68, (uint64_t)v58, v69);
      }
      objc_msgSend_setCircularTemplate_(v19, v70, (uint64_t)v50, v71);

      break;
    case 8:
      uint64_t v19 = objc_opt_new();
      if (v17 | v8)
      {
        uint64_t v20 = NanoCompassAppTintColor();
        v23 = objc_msgSend_redactionTextProviderWithColor_(self, v21, (uint64_t)v20, v22);
      }
      else
      {
        v23 = NanoCompassComplicationHeadingDirectionBearingTextProvider(v12, v16);
      }
      objc_msgSend_setTextProvider_(v19, v24, (uint64_t)v23, v25);
      v72 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v73 = objc_opt_class();
      v50 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v72, v74, v73, v75);
      v99[0] = @"heading";
      v79 = v12;
      if (!v12)
      {
        v79 = objc_msgSend_null(MEMORY[0x263EFF9D0], v76, v77, v78);
      }
      v100[0] = v79;
      v99[1] = @"nodata";
      v80 = objc_msgSend_numberWithBool_(NSNumber, v76, v17, v78);
      v100[1] = v80;
      v99[2] = @"alwayson";
      v83 = objc_msgSend_numberWithBool_(NSNumber, v81, v8, v82);
      v100[2] = v83;
      v85 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v84, (uint64_t)v100, (uint64_t)v99, 3);
      objc_msgSend_setMetadata_(v50, v86, (uint64_t)v85, v87);

      if (!v12) {
      objc_msgSend_setImageProvider_(v19, v88, (uint64_t)v50, v89);
      }
      break;
    default:
      uint64_t v19 = 0;
      goto LABEL_32;
  }

LABEL_31:
LABEL_32:
  v90 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v19, v91, (uint64_t)v90, v92);

  return v19;
}

- (id)redactionTextProviderWithColor:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2375D140C;
  block[3] = &unk_264CD5570;
  id v9 = v3;
  uint64_t v4 = qword_2689214D0;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&qword_2689214D0, block);
  }
  id v6 = (id)qword_2689214C8;

  return v6;
}

@end
@interface CompassComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
- (CompassComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateNoData:(BOOL)a3 calibrated:(BOOL)a4 heading:(id)a5;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)randomizedTemplate;
- (id)sampleTemplate;
@end

@implementation CompassComplicationDataSource

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
        _os_log_impl(&dword_23759D000, v9, OS_LOG_TYPE_DEFAULT, "running fixture demo mode. disable the compass complication in complicaiton picker.", v11, 2u);
      }

      LOBYTE(v5) = 0;
    }
    else if ((unint64_t)a3 <= 0xC)
    {
      LOBYTE(v5) = (0x14DDu >> a3) & 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
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
  return @".compass";
}

- (CompassComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CompassComplicationDataSource;
  return [(NanoCompassBaseComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5 mode:1];
}

- (id)sampleTemplate
{
  int v5 = objc_msgSend_idealizedHeading(NCHeading, a2, v2, v3);
  uint64_t v7 = objc_msgSend__templateNoData_calibrated_heading_(self, v6, 0, 1, v5);

  return v7;
}

- (id)newTemplate
{
  uint64_t v5 = objc_msgSend_calibrated(self, a2, v2, v3);
  v9 = objc_msgSend_heading(self, v6, v7, v8);
  v13 = objc_msgSend_copy(v9, v10, v11, v12);
  v15 = objc_msgSend__templateNoData_calibrated_heading_(self, v14, 0, v5, v13);

  return v15;
}

- (id)noDataTemplate
{
  return (id)objc_msgSend__templateNoData_calibrated_heading_(self, a2, 1, 0, 0);
}

- (id)randomizedTemplate
{
  uint64_t v5 = objc_msgSend_randomizedHeading(NCHeading, a2, v2, v3);
  uint64_t v7 = objc_msgSend__templateNoData_calibrated_heading_(self, v6, 0, 1, v5);

  return v7;
}

- (id)_templateNoData:(BOOL)a3 calibrated:(BOOL)a4 heading:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v100[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v12 = v8;
  uint64_t v13 = !v5 | v6;
  if (v13 == 1)
  {

    uint64_t v12 = 0;
  }
  switch(objc_msgSend_family(self, v9, v10, v11))
  {
    case 0:
      v22 = (void *)MEMORY[0x263EFD208];
      v23 = NanoCompassFormattedHeading(v12, 0, 0);
      v26 = objc_msgSend_textProviderWithText_(v22, v24, (uint64_t)v23, v25);

      v27 = (void *)MEMORY[0x263EFD208];
      v28 = NanoCompassFormattedHeadingDirection(v12);
      v31 = objc_msgSend_textProviderWithText_(v27, v29, (uint64_t)v28, v30);

      objc_msgSend_templateWithLine1TextProvider_line2TextProvider_(MEMORY[0x263EFD130], v32, (uint64_t)v26, (uint64_t)v31);
      goto LABEL_13;
    case 2:
    case 6:
      if (v13) {
        goto LABEL_11;
      }
      v14 = (void *)MEMORY[0x263EFD208];
      v15 = NanoCompassFormattedHeadingAndDirection(v12, 0, 0);
      v16 = NanoCompassFormattedHeading(v12, 0, 0);
      v18 = objc_msgSend_textProviderWithText_shortText_(v14, v17, (uint64_t)v15, (uint64_t)v16);

      v21 = objc_msgSend_templateWithTextProvider_(MEMORY[0x263EFD148], v19, (uint64_t)v18, v20);

      break;
    case 3:
      if (v13)
      {
LABEL_11:
        v21 = NanoCompassRedactionLabel();
      }
      else
      {
        v91 = (void *)MEMORY[0x263EFD208];
        v92 = NanoCompassFormattedHeadingAndDirection(v12, 0, 0);
        v26 = objc_msgSend_textProviderWithText_(v91, v93, (uint64_t)v92, v94);

        v21 = objc_msgSend_templateWithTextProvider_(MEMORY[0x263EFD138], v95, (uint64_t)v26, v96);
LABEL_16:
      }
      break;
    case 4:
      v36 = (void *)MEMORY[0x263EFD208];
      v37 = NanoCompassFormattedHeading(v12, 0, 0);
      v26 = objc_msgSend_textProviderWithText_(v36, v38, (uint64_t)v37, v39);

      v40 = (void *)MEMORY[0x263EFD208];
      v41 = NanoCompassFormattedHeadingDirection(v12);
      v31 = objc_msgSend_textProviderWithText_(v40, v42, (uint64_t)v41, v43);

      objc_msgSend_templateWithLine1TextProvider_line2TextProvider_(MEMORY[0x263EFCFE0], v44, (uint64_t)v26, (uint64_t)v31);
      v21 = LABEL_13:;
      goto LABEL_15;
    case 7:
      v45 = (void *)MEMORY[0x263EFD208];
      v46 = NanoCompassFormattedHeading(v12, 0, 0);
      v26 = objc_msgSend_textProviderWithText_(v45, v47, (uint64_t)v46, v48);

      v49 = (void *)MEMORY[0x263EFD208];
      v50 = NanoCompassFormattedHeadingDirection(v12);
      v31 = objc_msgSend_textProviderWithText_(v49, v51, (uint64_t)v50, v52);

      v21 = objc_msgSend_templateWithLine1TextProvider_line2TextProvider_(MEMORY[0x263EFD008], v53, (uint64_t)v26, (uint64_t)v31);
      objc_msgSend_setHighlightLine2_(v21, v54, 1, v55);
LABEL_15:

      goto LABEL_16;
    case 10:
      v56 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v57 = objc_opt_class();
      v63 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v56, v58, v57, v59);
      v99[0] = @"heading";
      v64 = v12;
      if (!v12)
      {
        v64 = objc_msgSend_null(MEMORY[0x263EFF9D0], v60, v61, v62);
      }
      v100[0] = v64;
      v99[1] = @"nodata";
      v65 = objc_msgSend_numberWithBool_(NSNumber, v60, v13, v62);
      v100[1] = v65;
      v67 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v66, (uint64_t)v100, (uint64_t)v99, 2);
      objc_msgSend_setMetadata_(v63, v68, (uint64_t)v67, v69);

      if (!v12) {
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v70, (uint64_t)v63, v71);
      }
      goto LABEL_27;
    case 12:
      v72 = (void *)MEMORY[0x263EFD1A8];
      uint64_t v73 = objc_opt_class();
      v63 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v72, v74, v73, v75);
      v97[0] = @"heading";
      v79 = v12;
      if (!v12)
      {
        v79 = objc_msgSend_null(MEMORY[0x263EFF9D0], v76, v77, v78);
      }
      v98[0] = v79;
      v97[1] = @"nodata";
      v80 = objc_msgSend_numberWithBool_(NSNumber, v76, v13, v78);
      v98[1] = v80;
      v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v81, (uint64_t)v98, (uint64_t)v97, 2);
      objc_msgSend_setMetadata_(v63, v83, (uint64_t)v82, v84);

      if (!v12) {
      objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD0A0], v85, (uint64_t)v63, v86);
      }
      v21 = LABEL_27:;

      break;
    default:
      NCLogForCategory(1uLL);
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
        sub_2375D7C80(self, v33, v34, v35);
      }

      v21 = 0;
      break;
  }
  v87 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v21, v88, (uint64_t)v87, v89);

  return v21;
}

@end
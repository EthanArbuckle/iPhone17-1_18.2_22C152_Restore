@interface CompassAltitudeComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
- (CompassAltitudeComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateNoData:(BOOL)a3 noHeading:(BOOL)a4 calibrated:(BOOL)a5 altitude:(id)a6 heading:(id)a7;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)privacyTemplate;
- (id)randomizedTemplate;
- (id)sampleTemplate;
@end

@implementation CompassAltitudeComplicationDataSource

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_supportsUrsa(v5, v6, v7, v8)
    && objc_msgSend_supportsPolaris(v5, v9, v10, v11))
  {
    if (!objc_msgSend_showingIdealizedData(NCManager, v12, v13, v14))
    {
      BOOL v16 = a3 == 3;
      goto LABEL_8;
    }
    v15 = NCLogForCategory(1uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23759D000, v15, OS_LOG_TYPE_DEFAULT, "running fixture demo mode. disable the compass complication in complicaiton picker.", v18, 2u);
    }
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

+ (id)appNameLocalizationKey
{
  return @"COMPASS_APP_NAME";
}

+ (id)complicationNameLocalizationKey
{
  return @"COMPASS_ALTITUDE_COMPLICATION_NAME";
}

+ (id)bundleIdentifierSuffix
{
  return @".compass.altitude";
}

- (CompassAltitudeComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CompassAltitudeComplicationDataSource;
  return [(NanoCompassBaseComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5 mode:9];
}

- (id)sampleTemplate
{
  id v5 = objc_msgSend_idealizedAltitude(NCAltitude, a2, v2, v3);
  v9 = objc_msgSend_idealizedHeading(NCHeading, v6, v7, v8);
  uint64_t v11 = objc_msgSend__templateNoData_noHeading_calibrated_altitude_heading_(self, v10, 0, 0, 1, v5, v9);

  return v11;
}

- (id)newTemplate
{
  uint64_t v5 = objc_msgSend_calibrated(self, a2, v2, v3);
  v9 = objc_msgSend_altitude(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_copy(v9, v10, v11, v12);
  v17 = objc_msgSend_heading(self, v14, v15, v16);
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  v23 = objc_msgSend__templateNoData_noHeading_calibrated_altitude_heading_(self, v22, 0, 0, v5, v13, v21);

  return v23;
}

- (id)noDataTemplate
{
  return (id)objc_msgSend__templateNoData_noHeading_calibrated_altitude_heading_(self, a2, 1, 1, 0, 0, 0);
}

- (id)alwaysOnTemplate
{
  uint64_t v5 = objc_msgSend_altitude(self, a2, v2, v3);
  v9 = objc_msgSend_copy(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_heading(self, v10, v11, v12);
  v17 = objc_msgSend_copy(v13, v14, v15, v16);
  uint64_t v19 = objc_msgSend__templateNoData_noHeading_calibrated_altitude_heading_(self, v18, 0, 1, 0, v9, v17);

  return v19;
}

- (id)randomizedTemplate
{
  uint64_t v5 = objc_msgSend_randomizedAltitude(NCAltitude, a2, v2, v3);
  v9 = objc_msgSend_randomizedHeading(NCHeading, v6, v7, v8);
  uint64_t v11 = objc_msgSend__templateNoData_noHeading_calibrated_altitude_heading_(self, v10, 0, 0, 1, v5, v9);

  return v11;
}

- (id)privacyTemplate
{
  return (id)objc_msgSend__templateNoData_noHeading_calibrated_altitude_heading_(self, a2, 1, 1, 0, 0, 0);
}

- (id)_templateNoData:(BOOL)a3 noHeading:(BOOL)a4 calibrated:(BOOL)a5 altitude:(id)a6 heading:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a6;
  id v16 = a7;
  if (v10)
  {

    id v12 = 0;
  }
  else if (v8 && !v9)
  {
    if (objc_msgSend_family(self, v13, v14, v15) == 3) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  if (objc_msgSend_family(self, v17, v18, v19) == 3)
  {
    if (v10)
    {
      uint64_t v20 = NanoCompassRedactionLabel();
      id v16 = 0;
      goto LABEL_17;
    }
    id v16 = 0;
LABEL_13:
    uint64_t v20 = objc_opt_new();
    uint64_t v24 = NanoCompassFormattedHeadingAndDirection(v16, 0, 0);
    if (v12)
    {
      char v25 = objc_msgSend_displayTilde(v12, v21, v22, v23);
      v26 = NSNumber;
      objc_msgSend_altitude(v12, v27, v28, v29);
      v33 = objc_msgSend_numberWithDouble_(v26, v30, v31, v32);
      v34 = NanoCompassValueWithFormat(v33, 0, v25);
    }
    else
    {
      v34 = NanoCompassValueWithFormat(0, 0, 0);
    }
    v35 = NanoCompassLocalizedString(@"COMPLICATION_FUSION_COMBINING_FORMAT");
    v38 = objc_msgSend_stringWithFormat_(NSString, v36, (uint64_t)v35, v37, v24, v34);
    v64 = (void *)v24;
    v39 = (void *)MEMORY[0x263EFD208];
    v43 = NanoCompassFormattedAltitudeUnits((uint64_t)v38, v40, v41, v42);
    v46 = objc_msgSend_textProviderWithText_(v39, v44, (uint64_t)v43, v45);

    objc_msgSend_setUseLowercaseSmallCaps_(v46, v47, 1, v48);
    objc_msgSend_setIgnoreUppercaseStyle_(v46, v49, 1, v50);
    v53 = objc_msgSend_textProviderWithText_(MEMORY[0x263EFD208], v51, (uint64_t)v38, v52);
    v54 = NanoCompassLocalizedString(@"ALTITUDE_COMBINING_FORMAT");
    v57 = objc_msgSend_textProviderWithFormat_(MEMORY[0x263EFD218], v55, (uint64_t)v54, v56, v53, v46);
    objc_msgSend_setTextProvider_(v20, v58, (uint64_t)v57, v59);

    goto LABEL_17;
  }
  id v16 = 0;
LABEL_11:
  uint64_t v20 = 0;
LABEL_17:
  v60 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v20, v61, (uint64_t)v60, v62);

  return v20;
}

@end
@interface AltitudeInclineComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (id)appNameLocalizationKey;
+ (id)bundleIdentifierSuffix;
+ (id)complicationNameLocalizationKey;
- (AltitudeInclineComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_templateNoData:(BOOL)a3 altitude:(id)a4 privacyEnabled:(BOOL)a5;
- (id)alwaysOnTemplate;
- (id)newTemplate;
- (id)noDataTemplate;
- (id)privacyTemplate;
- (id)randomizedTemplate;
- (id)redactionImageProvider;
- (id)sampleTemplate;
@end

@implementation AltitudeInclineComplicationDataSource

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (objc_msgSend_supportsUrsa(v5, v6, v7, v8))
  {
    if (objc_msgSend_supportsPolaris(v5, v9, v10, v11)) {
      BOOL v12 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)appNameLocalizationKey
{
  return @"COMPASS_APP_NAME";
}

+ (id)complicationNameLocalizationKey
{
  return @"ALTITUDE_COMPLICATION_NAME";
}

+ (id)bundleIdentifierSuffix
{
  return @".altitude.incline";
}

- (AltitudeInclineComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AltitudeInclineComplicationDataSource;
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

- (id)alwaysOnTemplate
{
  id v5 = objc_msgSend_altitude(self, a2, v2, v3);
  v9 = objc_msgSend_copy(v5, v6, v7, v8);
  uint64_t v11 = objc_msgSend__templateNoData_altitude_privacyEnabled_(self, v10, 0, (uint64_t)v9, 0);

  return v11;
}

- (id)randomizedTemplate
{
  id v5 = objc_msgSend_randomizedAltitude(NCAltitude, a2, v2, v3);
  uint64_t v7 = objc_msgSend__templateNoData_altitude_privacyEnabled_(self, v6, 0, (uint64_t)v5, 0);

  return v7;
}

- (id)privacyTemplate
{
  return (id)objc_msgSend__templateNoData_altitude_privacyEnabled_(self, a2, 1, 0, 1);
}

- (id)_templateNoData:(BOOL)a3 altitude:(id)a4 privacyEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  v74[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v12 = objc_msgSend_family(self, v9, v10, v11);
  if (v12 == 9)
  {
    v22 = objc_opt_new();
    v23 = (void *)MEMORY[0x263EFD1A8];
    uint64_t v24 = objc_opt_class();
    v30 = objc_msgSend_fullColorImageProviderWithImageViewClass_(v23, v25, v24, v26);
    uint64_t v31 = MEMORY[0x263EFFA88];
    if (v5)
    {
      v73[0] = @"altitude";
      v32 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
      v73[1] = @"nodata";
      v74[0] = v32;
      v74[1] = v31;
      v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v74, (uint64_t)v73, 2);
      objc_msgSend_setMetadata_(v30, v35, (uint64_t)v34, v36);
    }
    else
    {
      v71[0] = @"altitude";
      v32 = v8;
      if (!v8)
      {
        v32 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
      }
      v72[0] = v32;
      v71[1] = @"nodata";
      v41 = objc_msgSend_numberWithBool_(NSNumber, v27, v8 == 0, v29);
      v72[1] = v41;
      v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v72, (uint64_t)v71, 2);
      objc_msgSend_setMetadata_(v30, v44, (uint64_t)v43, v45);

      if (v8) {
        goto LABEL_14;
      }
    }

LABEL_14:
    v48 = objc_msgSend_templateWithImageProvider_(MEMORY[0x263EFD030], v46, (uint64_t)v30, v47);
    uint64_t v69 = *MEMORY[0x263EFCF80];
    uint64_t v70 = v31;
    v50 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v49, (uint64_t)&v70, (uint64_t)&v69, 1);
    objc_msgSend_setMetadata_(v48, v51, (uint64_t)v50, v52);

    objc_msgSend_setCircularTemplate_(v22, v53, (uint64_t)v48, v54);
    objc_msgSend_setTextProvider_(v22, v55, 0, v56);

    goto LABEL_21;
  }
  if (v12 != 8)
  {
    v22 = 0;
    goto LABEL_21;
  }
  if (!v5)
  {
    if (v6)
    {
      v37 = (void *)MEMORY[0x263EFD208];
      v38 = NanoCompassFormattedUncalibrated();
      v16 = objc_msgSend_textProviderWithText_(v37, v39, (uint64_t)v38, v40);
    }
    else
    {
      v16 = NanoCompassComplicationAltitudeSmallCapsTextProvider(v8, 0, 0);
      if (v8 && (objc_msgSend_hasAcceptibleAccuracy(v8, v57, v58, v59) & 1) != 0)
      {
        v18 = NanoCompassComplicationAltitudeAccuracySmallCapsTextProvider(v8, 0);
        v60 = NanoCompassAppTintColor();
        objc_msgSend_setTintColor_(v18, v61, (uint64_t)v60, v62);
LABEL_19:

        id v63 = objc_alloc(MEMORY[0x263EFD090]);
        uint64_t v21 = objc_msgSend_initWithInnerTextProvider_outerTextProvider_(v63, v64, (uint64_t)v18, (uint64_t)v16);
        goto LABEL_20;
      }
    }
    v60 = NanoCompassAppTintColor();
    v18 = AltitudeRedactionTextProvider(v60);
    goto LABEL_19;
  }
  v16 = objc_msgSend_redactionImageProvider(self, v13, v14, v15);
  v17 = NanoCompassAppTintColor();
  v18 = AltitudeRedactionTextProvider(v17);

  id v19 = objc_alloc(MEMORY[0x263EFD098]);
  uint64_t v21 = objc_msgSend_initWithTextProvider_imageProvider_(v19, v20, (uint64_t)v18, (uint64_t)v16);
LABEL_20:
  v22 = (void *)v21;

LABEL_21:
  v65 = NanoCompassAppTintColor();
  objc_msgSend_setTintColor_(v22, v66, (uint64_t)v65, v67);

  return v22;
}

- (id)redactionImageProvider
{
  if (qword_2689210E8 != -1) {
    dispatch_once(&qword_2689210E8, &unk_26EA48BA0);
  }
  uint64_t v2 = (void *)qword_2689210E0;

  return v2;
}

@end
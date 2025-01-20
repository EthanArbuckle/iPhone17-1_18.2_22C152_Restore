@interface DoseComplicationFormatter
- (BOOL)supportsFamily:(int64_t)a3 forDevice:(id)a4;
- (DoseComplicationFormatter)init;
- (DoseContent)alwaysOnDoseContent;
- (DoseContent)currentDoseContent;
- (DoseContent)switcherDoseContent;
- (NSNumberFormatter)dbFormatter;
- (id)_alwaysOnTemplateWithFamily:(int64_t)a3 content:(id)a4 device:(id)a5;
- (id)_setupNoiseTemplateWithFamily:(int64_t)a3 device:(id)a4;
- (id)_templateWithFamily:(int64_t)a3 content:(id)a4 device:(id)a5;
- (id)accessibilityLabelForSymbol:(id)a3;
- (id)alwaysOnTemplateWithFamily:(int64_t)a3 forDevice:(id)a4;
- (id)createGaugeProviderWithFillValue:(double)a3 tintColor:(id)a4;
- (id)createMonospaceTextProviderWithText:(id)a3 shortText:(id)a4;
- (id)createOuterMonospaceTextProviderWithText:(id)a3;
- (id)formattedTemplateWithFamily:(int64_t)a3 forDevice:(id)a4;
- (id)fullColorImageProviderWithImage:(id)a3;
- (id)fullColorImageProviderWithSymbolName:(id)a3 tintColor:(id)a4 pointSizeSymbolConstants:(id *)a5;
- (id)imageProviderWithImage:(id)a3 tintColor:(id)a4;
- (id)imageProviderWithSymbolName:(id)a3 tintColor:(id)a4;
- (id)imageProviderWithSymbolName:(id)a3 tintColor:(id)a4 pointSizeSymbolConstants:(id *)a5;
- (id)newAlwaysOnDoseContent;
- (id)newSwitcherDoseContent;
- (id)setupComplicationBackgroundColor;
- (id)switcherTemplateWithFamily:(int64_t)a3 forDevice:(id)a4;
- (void)setCurrentDoseContent:(id)a3;
- (void)setDbFormatter:(id)a3;
- (void)updateWithSlowLeq:(float)a3 fastLeq:(float)a4 enabled:(BOOL)a5 threshold:(unint64_t)a6 slowAttenuation:(float)a7 fastAttenuation:(float)a8 andWearingAirpods:(BOOL)a9;
@end

@implementation DoseComplicationFormatter

- (DoseComplicationFormatter)init
{
  v12.receiver = self;
  v12.super_class = (Class)DoseComplicationFormatter;
  v2 = [(DoseComplicationFormatter *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSNumberFormatter);
    [v3 setNumberStyle:1];
    [v3 setMaximumFractionDigits:0];
    v4 = +[NSNumber numberWithInt:0];
    v5 = [v3 stringFromNumber:v4];
    [v3 setNotANumberSymbol:v5];

    [(DoseComplicationFormatter *)v2 setDbFormatter:v3];
    id v6 = [(DoseComplicationFormatter *)v2 newSwitcherDoseContent];
    [(DoseComplicationFormatter *)v2 setCurrentDoseContent:v6];

    v7 = [(DoseComplicationFormatter *)v2 newSwitcherDoseContent];
    switcherDoseContent = v2->_switcherDoseContent;
    v2->_switcherDoseContent = v7;

    v9 = [(DoseComplicationFormatter *)v2 newAlwaysOnDoseContent];
    alwaysOnDoseContent = v2->_alwaysOnDoseContent;
    v2->_alwaysOnDoseContent = v9;
  }
  return v2;
}

- (id)newSwitcherDoseContent
{
  id v3 = objc_opt_new();
  [v3 setIsEnabled:1];
  LODWORD(v4) = 1116995584;
  [v3 setSlowLeq:v4];
  LODWORD(v5) = 1116995584;
  [v3 setFastLeq:v5];
  [v3 fastLeq];
  float v7 = fmaxf(v6, 30.0);
  if (v7 > 120.0) {
    float v7 = 120.0;
  }
  double v8 = (v7 + -30.0) / 90.0;
  *(float *)&double v8 = v8;
  [v3 setGaugeFillValue:v8];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"LEVEL_SHORT" value:&stru_C3E0 table:0];
  objc_super v12 = [v9 localizedStringForKey:@"LEVEL_SHORT" value:v11 table:@"Noise"];
  v13 = [(DoseComplicationFormatter *)self dbFormatter];
  [v3 slowLeq];
  v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v15 = [v13 stringFromNumber:v14];
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v15);
  [v3 setLevelContentShort:v16];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"LEVEL_LONG" value:&stru_C3E0 table:0];
  v20 = [v17 localizedStringForKey:@"LEVEL_LONG" value:v19 table:@"Noise"];
  v21 = [(DoseComplicationFormatter *)self dbFormatter];
  [v3 slowLeq];
  v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v23 = [v21 stringFromNumber:v22];
  v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, [v23 integerValue]);
  [v3 setLevelContentLong:v24];

  v25 = +[NSBundle bundleForClass:objc_opt_class()];
  v26 = +[NSBundle bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"OK_LABEL" value:&stru_C3E0 table:0];
  v28 = [v25 localizedStringForKey:@"OK_LABEL" value:v27 table:@"Noise"];
  [v3 setClassifierContent:v28];

  [v3 setClassificationImageName:@"checkmark.circle.fill"];
  v29 = +[UIColor systemGreenColor];
  [v3 setTintColor:v29];

  v30 = +[UIColor systemGreenColor];
  [v3 setImageTintColor:v30];

  return v3;
}

- (id)newAlwaysOnDoseContent
{
  v2 = objc_opt_new();
  [v2 setIsEnabled:0];
  [v2 setSlowLeq:0.0];
  [v2 setFastLeq:0.0];
  [v2 setGaugeFillValue:0.0];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  double v4 = +[NSBundle bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
  float v6 = [v3 localizedStringForKey:@"UNIT_LABEL" value:v5 table:@"Noise"];
  [v2 setLevelContentShort:v6];

  float v7 = +[NSBundle bundleForClass:objc_opt_class()];
  double v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"UNIT_LABEL_LONG" value:&stru_C3E0 table:0];
  v10 = [v7 localizedStringForKey:@"UNIT_LABEL_LONG" value:v9 table:@"Noise"];
  [v2 setLevelContentLong:v10];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"APP_NAME" value:&stru_C3E0 table:0];
  v14 = [v11 localizedStringForKey:@"APP_NAME" value:v13 table:@"Noise"];
  [v2 setClassifierContent:v14];

  [v2 setClassificationImageName:@"circle.fill"];
  v15 = +[UIColor systemGrayColor];
  [v2 setTintColor:v15];

  v16 = +[UIColor colorWithWhite:1.0 alpha:0.3];
  [v2 setImageTintColor:v16];

  return v2;
}

- (BOOL)supportsFamily:(int64_t)a3 forDevice:(id)a4
{
  if (CLKComplicationFamilyCircularMedium == a3) {
    return 1;
  }
  if ((unint64_t)a3 <= 0xC) {
    return (0x1FDFu >> a3) & 1;
  }
  return 0;
}

- (void)updateWithSlowLeq:(float)a3 fastLeq:(float)a4 enabled:(BOOL)a5 threshold:(unint64_t)a6 slowAttenuation:(float)a7 fastAttenuation:(float)a8 andWearingAirpods:(BOOL)a9
{
  BOOL v12 = a5;
  v16 = [(DoseComplicationFormatter *)self currentDoseContent];
  [v16 setIsEnabled:v12];

  if (v12)
  {
    v17 = [(DoseComplicationFormatter *)self currentDoseContent];
    *(float *)&double v18 = a3 - a7;
    [v17 setSlowLeq:v18];

    v19 = [(DoseComplicationFormatter *)self currentDoseContent];
    *(float *)&double v20 = a4 - a8;
    [v19 setFastLeq:v20];

    v21 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v21 fastLeq];
    float v23 = (float)(v22 + -30.0) / 90.0;
    v24 = [(DoseComplicationFormatter *)self currentDoseContent];
    *(float *)&double v25 = v23;
    [v24 setGaugeFillValue:v25];

    v83 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"LEVEL_SHORT" value:&stru_C3E0 table:0];
    v28 = [v83 localizedStringForKey:@"LEVEL_SHORT" value:v27 table:@"Noise"];
    v29 = [(DoseComplicationFormatter *)self dbFormatter];
    v30 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v30 slowLeq];
    v31 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    [v29 stringFromNumber:v31];
    v32 = id v85 = (id)a6;
    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v32);
    v34 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v34 setLevelContentShort:v33];

    v84 = +[NSBundle bundleForClass:objc_opt_class()];
    v35 = +[NSBundle bundleForClass:objc_opt_class()];
    v36 = [v35 localizedStringForKey:@"LEVEL_LONG" value:&stru_C3E0 table:0];
    v37 = [v84 localizedStringForKey:@"LEVEL_LONG" value:v36 table:@"Noise"];
    v38 = [(DoseComplicationFormatter *)self dbFormatter];
    v39 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v39 slowLeq];
    v40 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
    v41 = [v38 stringFromNumber:v40];
    v42 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v37, [v41 integerValue]);
    v43 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v43 setLevelContentLong:v42];

    if (v85 == &stru_20.flags || v85 == &stru_20.filesize)
    {
      v74 = +[NSBundle bundleForClass:objc_opt_class()];
      v75 = +[NSBundle bundleForClass:objc_opt_class()];
      v76 = [v75 localizedStringForKey:@"LOUD_LABEL" value:&stru_C3E0 table:0];
      v77 = [v74 localizedStringForKey:@"LOUD_LABEL" value:v76 table:@"Noise"];
      v78 = [(DoseComplicationFormatter *)self currentDoseContent];
      [v78 setClassifierContent:v77];

      v79 = [(DoseComplicationFormatter *)self currentDoseContent];
      [v79 setClassificationImageName:@"exclamationmark.triangle.fill"];

      v80 = +[UIColor systemYellowColor];
      v81 = [(DoseComplicationFormatter *)self currentDoseContent];
      [v81 setTintColor:v80];

      uint64_t v52 = +[UIColor systemYellowColor];
    }
    else
    {
      if (v85) {
        return;
      }
      v44 = +[NSBundle bundleForClass:objc_opt_class()];
      v45 = +[NSBundle bundleForClass:objc_opt_class()];
      v46 = [v45 localizedStringForKey:@"OK_LABEL" value:&stru_C3E0 table:0];
      v47 = [v44 localizedStringForKey:@"OK_LABEL" value:v46 table:@"Noise"];
      v48 = [(DoseComplicationFormatter *)self currentDoseContent];
      [v48 setClassifierContent:v47];

      v49 = [(DoseComplicationFormatter *)self currentDoseContent];
      [v49 setClassificationImageName:@"checkmark.circle.fill"];

      v50 = +[UIColor systemGreenColor];
      v51 = [(DoseComplicationFormatter *)self currentDoseContent];
      [v51 setTintColor:v50];

      uint64_t v52 = +[UIColor systemGreenColor];
    }
  }
  else
  {
    v53 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v53 setSlowLeq:0.0];

    v54 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v54 setFastLeq:0.0];

    v55 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v55 setGaugeFillValue:0.0];

    v56 = +[NSBundle bundleForClass:objc_opt_class()];
    v57 = +[NSBundle bundleForClass:objc_opt_class()];
    v58 = [v57 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
    v59 = [v56 localizedStringForKey:@"UNIT_LABEL" value:v58 table:@"Noise"];
    v60 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v60 setLevelContentShort:v59];

    v61 = +[NSBundle bundleForClass:objc_opt_class()];
    v62 = +[NSBundle bundleForClass:objc_opt_class()];
    v63 = [v62 localizedStringForKey:@"SUSPENDED_LABEL" value:&stru_C3E0 table:0];
    v64 = [v61 localizedStringForKey:@"SUSPENDED_LABEL" value:v63 table:@"Noise"];
    v65 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v65 setLevelContentLong:v64];

    v66 = +[NSBundle bundleForClass:objc_opt_class()];
    v67 = +[NSBundle bundleForClass:objc_opt_class()];
    v68 = [v67 localizedStringForKey:@"CLASSIFIER_SUSPENDED" value:&stru_C3E0 table:0];
    v69 = [v66 localizedStringForKey:@"CLASSIFIER_SUSPENDED" value:v68 table:@"Noise"];
    v70 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v70 setClassifierContent:v69];

    v71 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v71 setClassificationImageName:@"mic.slash.fill"];

    v72 = +[UIColor systemGrayColor];
    v73 = [(DoseComplicationFormatter *)self currentDoseContent];
    [v73 setTintColor:v72];

    uint64_t v52 = +[UIColor systemWhiteColor];
  }
  id v86 = (id)v52;
  v82 = [(DoseComplicationFormatter *)self currentDoseContent];
  [v82 setImageTintColor:v86];
}

- (id)accessibilityLabelForSymbol:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"checkmark.circle.fill"])
  {
    double v4 = +[NSBundle bundleForClass:objc_opt_class()];
    double v5 = +[NSBundle bundleForClass:objc_opt_class()];
    float v6 = v5;
    CFStringRef v7 = @"THRESHOLD_OK_SYMBOL_ACCESSIBILITY";
LABEL_5:
    double v8 = [v5 localizedStringForKey:v7 value:&stru_C3E0 table:0];
    v9 = [v4 localizedStringForKey:v7 value:v8 table:@"Noise"];

    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"exclamationmark.triangle.fill"])
  {
    double v4 = +[NSBundle bundleForClass:objc_opt_class()];
    double v5 = +[NSBundle bundleForClass:objc_opt_class()];
    float v6 = v5;
    CFStringRef v7 = @"THRESHOLD_WARNING_SYMBOL_ACCESSIBILITY";
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (id)imageProviderWithSymbolName:(id)a3 tintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:2 scale:12.0];
  if (qword_10B28 != -1) {
    dispatch_once(&qword_10B28, &stru_C308);
  }
  v9 = [(id)qword_10B20 objectForKeyedSubscript:v6];
  if (!v9)
  {
    v9 = +[UIImage systemImageNamed:v6 withConfiguration:v8];
    v10 = [(DoseComplicationFormatter *)self accessibilityLabelForSymbol:v6];
    [v9 setAccessibilityLabel:v10];

    [(id)qword_10B20 setObject:v9 forKeyedSubscript:v6];
  }
  v11 = [(DoseComplicationFormatter *)self imageProviderWithImage:v9 tintColor:v7];

  return v11;
}

- (id)imageProviderWithSymbolName:(id)a3 tintColor:(id)a4 pointSizeSymbolConstants:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:v9];
  [v10 setTintColor:v8];

  v11 = [(DoseComplicationFormatter *)self accessibilityLabelForSymbol:v9];

  [v10 setAccessibilityLabel:v11];
  [v10 setIgnoreHierarchicalLayers:1];
  BOOL v12 = +[NSNumber numberWithDouble:a5->var0];
  [v10 setOverridePointSize:v12];

  return v10;
}

- (id)imageProviderWithImage:(id)a3 tintColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v6];
  [v7 setTintColor:v5];

  id v8 = [v6 accessibilityLabel];

  [v7 setAccessibilityLabel:v8];

  return v7;
}

- (id)fullColorImageProviderWithImage:(id)a3
{
  id v3 = a3;
  double v4 = +[CLKFullColorImageProvider providerWithFullColorImage:v3 monochromeFilterType:1];
  id v5 = [v3 accessibilityLabel];

  [v4 setAccessibilityLabel:v5];

  return v4;
}

- (id)fullColorImageProviderWithSymbolName:(id)a3 tintColor:(id)a4 pointSizeSymbolConstants:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[CLKFullColorSymbolImageProvider symbolImageProviderWithSystemName:v9];
  [v10 setTintColor:v8];

  v11 = [(DoseComplicationFormatter *)self accessibilityLabelForSymbol:v9];

  [v10 setAccessibilityLabel:v11];
  [v10 setIgnoreHierarchicalLayers:1];
  BOOL v12 = +[NSNumber numberWithDouble:a5->var0];
  [v10 setOverridePointSize:v12];

  return v10;
}

- (id)setupComplicationBackgroundColor
{
  v2 = +[NSMutableDictionary dictionary];
  id v3 = +[UIColor colorWithWhite:1.0 alpha:0.1];
  [v2 setObject:v3 forKeyedSubscript:NTKRichComplicationViewBackgroundColorKey];

  return v2;
}

- (id)formattedTemplateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = [(DoseComplicationFormatter *)self switcherDoseContent];
  id v8 = [(DoseComplicationFormatter *)self _templateWithFamily:a3 content:v7 device:v6];

  return v8;
}

- (id)switcherTemplateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = [(DoseComplicationFormatter *)self switcherDoseContent];
  id v8 = [(DoseComplicationFormatter *)self _templateWithFamily:a3 content:v7 device:v6];

  return v8;
}

- (id)alwaysOnTemplateWithFamily:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = [(DoseComplicationFormatter *)self alwaysOnDoseContent];
  id v8 = [(DoseComplicationFormatter *)self _alwaysOnTemplateWithFamily:a3 content:v7 device:v6];

  return v8;
}

- (id)_alwaysOnTemplateWithFamily:(int64_t)a3 content:(id)a4 device:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (qword_10BF0 != -1) {
    dispatch_once(&qword_10BF0, &stru_C3A0);
  }
  long long v121 = xmmword_10BB0;
  long long v122 = *(_OWORD *)&qword_10BC0;
  *(_OWORD *)v123 = xmmword_10BD0;
  *(_OWORD *)&v123[16] = xmmword_10BE0;
  long long v117 = xmmword_10B70;
  long long v118 = xmmword_10B80;
  long long v119 = xmmword_10B90;
  long long v120 = unk_10BA0;
  long long v113 = xmmword_10B30;
  long long v114 = unk_10B40;
  long long v115 = xmmword_10B50;
  long long v116 = *(_OWORD *)&qword_10B60;
  switch(a3)
  {
    case 0:
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateModularSmallStackImage);
      v11 = [v8 classificationImageName];

      if (v11)
      {
        BOOL v12 = [v8 classificationImageName];
        v13 = [v8 imageTintColor];
        long long v111 = v119;
        uint64_t v112 = v120;
        v14 = [(DoseComplicationFormatter *)self imageProviderWithSymbolName:v12 tintColor:v13 pointSizeSymbolConstants:&v111];
        [v10 setLine1ImageProvider:v14];
      }
      v15 = [v8 levelContentShort];
      v16 = +[NSString localizedStringWithFormat:@"%@", v15];
      v17 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v16 shortText:0];
      [v10 setLine2TextProvider:v17];

      [v10 setHighlightLine2:0];
      goto LABEL_8;
    case 1:
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateModularLargeStandardBody);
      double v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      double v20 = [v19 localizedStringForKey:@"HEADER_TITLE" value:&stru_C3E0 table:0];
      v21 = [v18 localizedStringForKey:@"HEADER_TITLE" value:v20 table:@"Noise"];
      float v22 = +[CLKSimpleTextProvider textProviderWithText:v21];
      [v10 setHeaderTextProvider:v22];

      float v23 = [v8 classifierContent];
      v24 = +[CLKSimpleTextProvider textProviderWithText:v23];
      [v10 setBody1TextProvider:v24];

      double v25 = [v8 levelContentLong];
      v26 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v25 shortText:0];
      [v10 setBody2TextProvider:v26];

      v27 = +[UIColor systemBlueColor];
      v28 = [v10 headerTextProvider];
      [v28 setTintColor:v27];

LABEL_8:
      v29 = [v8 tintColor];
      [v10 setTintColor:v29];
      goto LABEL_27;
    case 3:
      id v110 = v9;
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateUtilitarianLargeFlat);
      v30 = [v8 classificationImageName];

      if (v30)
      {
        v31 = [v8 classificationImageName];
        v32 = [v8 imageTintColor];
        v33 = [(DoseComplicationFormatter *)self imageProviderWithSymbolName:v31 tintColor:v32];
        [v10 setImageProvider:v33];
      }
      v108 = +[NSBundle bundleForClass:objc_opt_class()];
      v109 = +[NSBundle bundleForClass:objc_opt_class()];
      v107 = [v109 localizedStringForKey:@"LEVEL_SUMMARY" value:&stru_C3E0 table:0];
      uint64_t v34 = [v108 localizedStringForKey:@"LEVEL_SUMMARY" value:v107 table:@"Noise"];
      v106 = [v8 classifierContent];
      v35 = [v106 uppercaseString];
      v36 = +[NSBundle bundleForClass:objc_opt_class()];
      v37 = +[NSBundle bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:&stru_C3E0 value:&stru_C3E0 table:0];
      v39 = [v36 localizedStringForKey:&stru_C3E0 value:v38 table:@"Noise"];
      v40 = (void *)v34;
      v41 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v34, v35, v39);
      v42 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v41 shortText:0];
      [v10 setTextProvider:v42];

      v43 = [v10 textProvider];
      [v43 setIgnoreUppercaseStyle:1];
      goto LABEL_17;
    case 4:
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateCircularSmallStackText);
      v44 = +[NSBundle bundleForClass:objc_opt_class()];
      v45 = +[NSBundle bundleForClass:objc_opt_class()];
      [v45 localizedStringForKey:@"UNKNOWN_DECIBELS_LEVEL" value:&stru_C3E0 table:0];
      v47 = id v46 = v9;
      v48 = [v44 localizedStringForKey:@"UNKNOWN_DECIBELS_LEVEL" value:v47 table:@"Noise"];
      v49 = +[CLKSimpleTextProvider textProviderWithText:v48];
      [v10 setLine1TextProvider:v49];

      id v9 = v46;
      v50 = +[NSBundle bundleForClass:objc_opt_class()];
      v51 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v52 = [v51 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
      v53 = [v50 localizedStringForKey:@"UNIT_LABEL" value:v52 table:@"Noise"];
      v54 = +[CLKSimpleTextProvider textProviderWithText:v53];
      [v10 setLine2TextProvider:v54];

      goto LABEL_28;
    case 8:
      id v110 = v9;
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCornerMeteredGaugeText);
      v55 = +[NSBundle bundleForClass:objc_opt_class()];
      v56 = +[NSBundle bundleForClass:objc_opt_class()];
      v57 = [v56 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
      v58 = [v55 localizedStringForKey:@"UNIT_LABEL" value:v57 table:@"Noise"];
      v59 = +[CLKSimpleTextProvider textProviderWithText:v58];
      [v10 setLeadingTextProvider:v59];

      v60 = [v10 leadingTextProvider];
      [v60 setIgnoreUppercaseStyle:1];

      v61 = +[UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:1.0];
      v62 = [v10 leadingTextProvider];
      [v62 setTintColor:v61];

      v63 = +[NSBundle bundleForClass:objc_opt_class()];
      v64 = +[NSBundle bundleForClass:objc_opt_class()];
      v65 = [v64 localizedStringForKey:@"UNKNOWN_DECIBELS_LEVEL" value:&stru_C3E0 table:0];
      v66 = [v63 localizedStringForKey:@"UNKNOWN_DECIBELS_LEVEL" value:v65 table:@"Noise"];
      v67 = [(DoseComplicationFormatter *)self createOuterMonospaceTextProviderWithText:v66];
      [v10 setOuterTextProvider:v67];

      v68 = [v8 classificationImageName];

      if (v68)
      {
        v69 = [v8 classificationImageName];
        v70 = [v8 imageTintColor];
        long long v111 = v113;
        uint64_t v112 = v114;
        v71 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v69 tintColor:v70 pointSizeSymbolConstants:&v111];
        [v10 setOuterImageProvider:v71];
      }
      [v8 gaugeFillValue];
      double v73 = v72;
      v43 = [v8 tintColor];
      v74 = [(DoseComplicationFormatter *)self createGaugeProviderWithFillValue:v43 tintColor:v73];
      [v10 setGaugeProvider:v74];

LABEL_17:
      id v9 = v110;
      goto LABEL_28;
    case 9:
      v75 = +[NSBundle bundleForClass:objc_opt_class()];
      v76 = +[NSBundle bundleForClass:objc_opt_class()];
      v77 = [v76 localizedStringForKey:@"HEADER_TITLE" value:&stru_C3E0 table:0];
      v29 = [v75 localizedStringForKey:@"HEADER_TITLE" value:v77 table:@"Noise"];

      id v10 = objc_alloc_init((Class)CLKComplicationTemplateGraphicBezelCircularText);
      v78 = [v29 localizedCapitalizedString];
      v79 = +[CLKSimpleTextProvider textProviderWithText:v78];
      [v10 setTextProvider:v79];

      v80 = [(DoseComplicationFormatter *)self _alwaysOnTemplateWithFamily:10 content:v8 device:v9];
      [v10 setCircularTemplate:v80];
      goto LABEL_26;
    case 10:
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCircularOpenMeteredGaugeImage);
      v81 = [v8 levelContentShort];
      v82 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v81 shortText:0];
      [v10 setTextProvider:v82];

      v83 = [v8 classificationImageName];

      if (!v83) {
        goto LABEL_25;
      }
      v84 = [v8 classificationImageName];
      id v85 = [v8 imageTintColor];
      long long v111 = v116;
      uint64_t v86 = v117;
      break;
    case 11:
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateGraphicRectangularTextMeteredGauge);
      v87 = [v8 classifierContent];
      v88 = +[CLKSimpleTextProvider textProviderWithText:v87];

      v89 = +[UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:1.0];
      [v88 setTintColor:v89];

      [v10 setHeaderTextProvider:v88];
      v90 = +[NSBundle bundleForClass:objc_opt_class()];
      v91 = +[NSBundle bundleForClass:objc_opt_class()];
      v92 = [v91 localizedStringForKey:@"UNIT_LABEL_LONG" value:&stru_C3E0 table:0];
      v93 = [v90 localizedStringForKey:@"UNIT_LABEL_LONG" value:v92 table:@"Noise"];
      v94 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v93 shortText:0];
      [v10 setBody1TextProvider:v94];

      [v8 gaugeFillValue];
      double v96 = v95;
      v97 = [v8 tintColor];
      v98 = [(DoseComplicationFormatter *)self createGaugeProviderWithFillValue:v97 tintColor:v96];
      [v10 setGaugeProvider:v98];

      goto LABEL_28;
    case 12:
      id v10 = objc_alloc_init((Class)CLKComplicationTemplateGraphicExtraLargeCircularOpenMeteredGaugeImage);
      v99 = [v8 levelContentShort];
      v100 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v99 shortText:0];
      [v10 setTextProvider:v100];

      v101 = [v8 classificationImageName];

      if (!v101) {
        goto LABEL_25;
      }
      v84 = [v8 classificationImageName];
      id v85 = [v8 imageTintColor];
      long long v111 = *(_OWORD *)&v123[8];
      uint64_t v86 = *(void *)&v123[24];
      break;
    default:
      id v10 = [(DoseComplicationFormatter *)self _templateWithFamily:a3 content:v8 device:v9];
      goto LABEL_28;
  }
  uint64_t v112 = v86;
  v102 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v84 tintColor:v85 pointSizeSymbolConstants:&v111];
  [v10 setImageProvider:v102];

LABEL_25:
  [v8 gaugeFillValue];
  double v104 = v103;
  v29 = [v8 tintColor];
  v80 = [(DoseComplicationFormatter *)self createGaugeProviderWithFillValue:v29 tintColor:v104];
  [v10 setGaugeProvider:v80];
LABEL_26:

LABEL_27:
LABEL_28:

  return v10;
}

- (id)_templateWithFamily:(int64_t)a3 content:(id)a4 device:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (qword_10BF0 != -1) {
    dispatch_once(&qword_10BF0, &stru_C3A0);
  }
  *(_OWORD *)&v183[16] = xmmword_10BB0;
  long long v184 = *(_OWORD *)&qword_10BC0;
  *(_OWORD *)v185 = xmmword_10BD0;
  *(_OWORD *)&v185[16] = xmmword_10BE0;
  *(_OWORD *)v181 = xmmword_10B70;
  *(_OWORD *)&v181[16] = xmmword_10B80;
  long long v182 = xmmword_10B90;
  *(_OWORD *)v183 = unk_10BA0;
  long long v178 = xmmword_10B30;
  *(_OWORD *)v179 = unk_10B40;
  *(_OWORD *)&v179[16] = xmmword_10B50;
  long long v180 = *(_OWORD *)&qword_10B60;
  id v10 = [v8 classificationImageName];

  if (v10)
  {
    v11 = [v8 classificationImageName];
    BOOL v12 = [v8 imageTintColor];
    v13 = [(DoseComplicationFormatter *)self imageProviderWithSymbolName:v11 tintColor:v12];

    v14 = [v8 classificationImageName];
    v15 = [(DoseComplicationFormatter *)self accessibilityLabelForSymbol:v14];
    v175 = v13;
    [v13 setAccessibilityLabel:v15];
  }
  else
  {
    v175 = 0;
  }
  v16 = +[UIColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:1.0];
  v17 = [(DoseComplicationFormatter *)self dbFormatter];
  [v8 slowLeq];
  double v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  uint64_t v19 = [v17 stringFromNumber:v18];

  v174 = (void *)v19;
  if (CLKComplicationFamilyCircularMedium == a3)
  {
    id v20 = objc_alloc_init((Class)CLKComplicationTemplateCircularMediumStackImage);
    [v20 setLine1ImageProvider:v175];
    v21 = [v8 levelContentShort];
    float v22 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v21 shortText:v19];
    [v20 setLine2TextProvider:v22];

LABEL_8:
    if ([v8 isEnabled]) {
      [v20 setTintColor:v16];
    }
  }
  else
  {
    id v20 = 0;
    switch(a3)
    {
      case 0:
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateModularSmallStackImage);
        v28 = [v8 classificationImageName];

        if (v28)
        {
          unsigned int v29 = [v8 isEnabled];
          v30 = [v8 classificationImageName];
          if (v29) {
            [v8 imageTintColor];
          }
          else {
          v156 = [v8 tintColor];
          }
          long long v176 = v182;
          uint64_t v177 = *(void *)v183;
          v157 = [(DoseComplicationFormatter *)self imageProviderWithSymbolName:v30 tintColor:v156 pointSizeSymbolConstants:&v176];
          [v20 setLine1ImageProvider:v157];
        }
        v158 = [v8 levelContentShort];
        v159 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v158 shortText:v19];
        [v20 setLine2TextProvider:v159];

        [v20 setHighlightLine2:0];
        goto LABEL_8;
      case 1:
        id v171 = v9;
        v173 = v16;
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateModularLargeStandardBody);
        v31 = +[NSBundle bundleForClass:objc_opt_class()];
        v32 = +[NSBundle bundleForClass:objc_opt_class()];
        v33 = [v32 localizedStringForKey:@"HEADER_TITLE" value:&stru_C3E0 table:0];
        uint64_t v34 = [v31 localizedStringForKey:@"HEADER_TITLE" value:v33 table:@"Noise"];
        v35 = +[CLKSimpleTextProvider textProviderWithText:v34];
        [v20 setHeaderTextProvider:v35];

        if ([v8 isEnabled])
        {
          v36 = [v8 classifierContent];
          v37 = +[CLKSimpleTextProvider textProviderWithText:v36];
          [v20 setBody1TextProvider:v37];

          [v20 setTintColor:v173];
        }
        else
        {
          double v104 = +[NSBundle bundleForClass:objc_opt_class()];
          v105 = +[NSBundle bundleForClass:objc_opt_class()];
          v106 = [v105 localizedStringForKey:@"MEASUREMENTS_LABEL" value:&stru_C3E0 table:0];
          v107 = [v104 localizedStringForKey:@"MEASUREMENTS_LABEL" value:v106 table:@"Noise"];
          v108 = +[CLKSimpleTextProvider textProviderWithText:v107];
          [v20 setBody1TextProvider:v108];
        }
        v109 = [v8 levelContentLong];
        id v110 = [v8 levelContentShort];
        long long v111 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v109 shortText:v110];
        [v20 setBody2TextProvider:v111];

        uint64_t v112 = +[UIColor systemBlueColor];
        long long v113 = [v20 headerTextProvider];
        [v113 setTintColor:v112];
        goto LABEL_62;
      case 2:
      case 6:
        float v23 = v16;
        id v24 = v9;
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateUtilitarianSmallFlat);
        [v20 setImageProvider:v175];
        double v25 = [v8 levelContentShort];
        v26 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v25 shortText:v174];
        [v20 setTextProvider:v26];

        v27 = [v20 textProvider];
        [v27 setIgnoreUppercaseStyle:1];

        if ([v8 isEnabled])
        {
          v16 = v23;
          [v20 setTintColor:v23];
          id v9 = v24;
        }
        else
        {
          id v9 = v24;
          v16 = v23;
        }
        break;
      case 3:
        id v171 = v9;
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateUtilitarianLargeFlat);
        [v20 setImageProvider:v175];
        v173 = v16;
        if ([v8 isEnabled])
        {
          [v20 setTintColor:v16];
          v169 = +[NSBundle bundleForClass:objc_opt_class()];
          v170 = +[NSBundle bundleForClass:objc_opt_class()];
          v168 = [v170 localizedStringForKey:@"LEVEL_SUMMARY" value:&stru_C3E0 table:0];
          v38 = [v169 localizedStringForKey:@"LEVEL_SUMMARY" value:v168 table:@"Noise"];
          v167 = [v8 classifierContent];
          v39 = [v167 uppercaseString];
          v40 = [(DoseComplicationFormatter *)self dbFormatter];
          [v8 slowLeq];
          v41 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          v42 = [v40 stringFromNumber:v41];
          v43 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, v39, v42);
          v44 = [v8 levelContentShort];
          v45 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v43 shortText:v44];
          [v20 setTextProvider:v45];

          id v46 = [v20 textProvider];
          [v46 setIgnoreUppercaseStyle:1];
        }
        else
        {
          id v46 = +[NSBundle bundleForClass:objc_opt_class()];
          long long v114 = +[NSBundle bundleForClass:objc_opt_class()];
          long long v115 = [v114 localizedStringForKey:@"SUSPENDED_LABEL" value:&stru_C3E0 table:0];
          long long v116 = [v46 localizedStringForKey:@"SUSPENDED_LABEL" value:v115 table:@"Noise"];
          long long v117 = +[CLKSimpleTextProvider textProviderWithText:v116];
          [v20 setTextProvider:v117];
        }
        goto LABEL_63;
      case 4:
        id v172 = v9;
        if ([v8 isEnabled])
        {
          id v20 = objc_alloc_init((Class)CLKComplicationTemplateCircularSmallStackText);
          v47 = [(DoseComplicationFormatter *)self dbFormatter];
          v48 = v16;
          [v8 slowLeq];
          v49 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          v50 = [v47 stringFromNumber:v49];
          v51 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v50 shortText:0];
          [v20 setLine1TextProvider:v51];

          uint64_t v52 = +[NSBundle bundleForClass:objc_opt_class()];
          v53 = +[NSBundle bundleForClass:objc_opt_class()];
          v54 = [v53 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
          v55 = [v52 localizedStringForKey:@"UNIT_LABEL" value:v54 table:@"Noise"];
          v56 = +[CLKSimpleTextProvider textProviderWithText:v55];
          [v20 setLine2TextProvider:v56];

          v16 = v48;
        }
        else
        {
          id v20 = objc_alloc_init((Class)CLKComplicationTemplateCircularSmallSimpleImage);
          long long v118 = [v8 classificationImageName];

          if (v118)
          {
            long long v119 = [v8 classificationImageName];
            [v8 imageTintColor];
            v121 = long long v120 = v16;
            long long v176 = *(_OWORD *)&v183[8];
            uint64_t v177 = *(void *)&v183[24];
            long long v122 = [(DoseComplicationFormatter *)self imageProviderWithSymbolName:v119 tintColor:v121 pointSizeSymbolConstants:&v176];
            [v20 setImageProvider:v122];

            v16 = v120;
          }
        }
        id v9 = v172;
        break;
      case 7:
        v57 = v16;
        id v58 = v9;
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateExtraLargeStackImage);
        v59 = [v8 classificationImageName];

        if (v59)
        {
          v60 = [v8 classificationImageName];
          v61 = [v8 imageTintColor];
          long long v176 = v184;
          uint64_t v177 = *(void *)v185;
          v62 = [(DoseComplicationFormatter *)self imageProviderWithSymbolName:v60 tintColor:v61 pointSizeSymbolConstants:&v176];
          [v20 setLine1ImageProvider:v62];
        }
        if ([v8 isEnabled])
        {
          v63 = [v8 levelContentShort];
          v64 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v63 shortText:v174];
          [v20 setLine2TextProvider:v64];
        }
        else
        {
          v63 = +[NSBundle bundleForClass:objc_opt_class()];
          v64 = +[NSBundle bundleForClass:objc_opt_class()];
          v123 = [v64 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
          v124 = [v63 localizedStringForKey:@"UNIT_LABEL" value:v123 table:@"Noise"];
          v125 = +[CLKSimpleTextProvider textProviderWithText:v124];
          [v20 setLine2TextProvider:v125];
        }
        id v9 = v58;
        v16 = v57;

        break;
      case 8:
        v173 = v16;
        id v65 = v9;
        if ([v8 isEnabled])
        {
          id v20 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCornerMeteredGaugeText);
          v66 = +[NSBundle bundleForClass:objc_opt_class()];
          v67 = +[NSBundle bundleForClass:objc_opt_class()];
          v68 = [v67 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
          v69 = [v66 localizedStringForKey:@"UNIT_LABEL" value:v68 table:@"Noise"];
          v70 = +[CLKSimpleTextProvider textProviderWithText:v69];
          [v20 setLeadingTextProvider:v70];

          v71 = [v20 leadingTextProvider];
          [v71 setIgnoreUppercaseStyle:1];

          float v72 = [v8 tintColor];
          double v73 = [v20 leadingTextProvider];
          [v73 setTintColor:v72];

          v74 = [(DoseComplicationFormatter *)self dbFormatter];
          [v8 slowLeq];
          v75 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
          v76 = [v74 stringFromNumber:v75];
          v77 = [(DoseComplicationFormatter *)self createOuterMonospaceTextProviderWithText:v76];
          [v20 setOuterTextProvider:v77];

          v78 = [v8 classificationImageName];

          if (!v78) {
            goto LABEL_57;
          }
          v79 = [v8 classificationImageName];
          v80 = [v8 imageTintColor];
          long long v176 = v178;
          uint64_t v177 = *(void *)v179;
          v81 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v79 tintColor:v80 pointSizeSymbolConstants:&v176];
          [v20 setOuterImageProvider:v81];
        }
        else
        {
          id v20 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCornerMeteredGaugeImage);
          v126 = +[NSBundle bundleForClass:objc_opt_class()];
          v127 = +[NSBundle bundleForClass:objc_opt_class()];
          v128 = [v127 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
          v129 = [v126 localizedStringForKey:@"UNIT_LABEL" value:v128 table:@"Noise"];
          v130 = +[CLKSimpleTextProvider textProviderWithText:v129];
          [v20 setLeadingTextProvider:v130];

          v131 = [v20 leadingTextProvider];
          [v131 setIgnoreUppercaseStyle:1];

          v132 = [v8 tintColor];
          v133 = [v20 leadingTextProvider];
          [v133 setTintColor:v132];

          v134 = [v8 classificationImageName];

          if (!v134) {
            goto LABEL_57;
          }
          v79 = [v8 classificationImageName];
          v80 = [v8 imageTintColor];
          long long v176 = *(_OWORD *)&v179[8];
          uint64_t v135 = *(void *)&v179[24];
LABEL_55:
          uint64_t v177 = v135;
          v81 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v79 tintColor:v80 pointSizeSymbolConstants:&v176];
          [v20 setImageProvider:v81];
        }

LABEL_57:
        [v8 gaugeFillValue];
        double v144 = v143;
        v145 = [v8 tintColor];
        v146 = [(DoseComplicationFormatter *)self createGaugeProviderWithFillValue:v145 tintColor:v144];
        [v20 setGaugeProvider:v146];

LABEL_70:
        id v9 = v65;
LABEL_71:
        v16 = v173;
        break;
      case 9:
        v173 = v16;
        id v82 = v9;
        if ([v8 isEnabled])
        {
          v83 = +[NSBundle bundleForClass:objc_opt_class()];
          v84 = +[NSBundle bundleForClass:objc_opt_class()];
          id v85 = [v84 localizedStringForKey:@"BEZEL_LABEL" value:&stru_C3E0 table:0];
          uint64_t v86 = [v83 localizedStringForKey:@"BEZEL_LABEL" value:v85 table:@"Noise"];
          v87 = [v8 classifierContent];
          v88 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v86, v87);
        }
        else
        {
          v83 = +[NSBundle bundleForClass:objc_opt_class()];
          v84 = +[NSBundle bundleForClass:objc_opt_class()];
          id v85 = [v84 localizedStringForKey:@"BEZEL_SUSPENDED_LABEL" value:&stru_C3E0 table:0];
          v88 = [v83 localizedStringForKey:@"BEZEL_SUSPENDED_LABEL" value:v85 table:@"Noise"];
        }

        id v20 = objc_alloc_init((Class)CLKComplicationTemplateGraphicBezelCircularText);
        v136 = [v88 localizedCapitalizedString];
        v137 = +[CLKSimpleTextProvider textProviderWithText:v136];
        [v20 setTextProvider:v137];

        v138 = [(DoseComplicationFormatter *)self _templateWithFamily:10 content:v8 device:v82];
        [v20 setCircularTemplate:v138];

        id v9 = v82;
        goto LABEL_71;
      case 10:
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCircularOpenMeteredGaugeImage);
        v173 = v16;
        id v65 = v9;
        if ([v8 isEnabled])
        {
          v89 = [v8 levelContentShort];
          v90 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v89 shortText:v174];
          [v20 setTextProvider:v90];
        }
        else
        {
          v89 = +[NSBundle bundleForClass:objc_opt_class()];
          v90 = +[NSBundle bundleForClass:objc_opt_class()];
          v139 = [v90 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
          v140 = [v89 localizedStringForKey:@"UNIT_LABEL" value:v139 table:@"Noise"];
          v141 = +[CLKSimpleTextProvider textProviderWithText:v140];
          [v20 setTextProvider:v141];
        }
        v142 = [v8 classificationImageName];

        if (!v142) {
          goto LABEL_57;
        }
        v79 = [v8 classificationImageName];
        v80 = [v8 imageTintColor];
        long long v176 = v180;
        uint64_t v135 = *(void *)v181;
        goto LABEL_55;
      case 11:
        v173 = v16;
        id v65 = v9;
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateGraphicRectangularTextMeteredGauge);
        v91 = [v8 classifierContent];
        v92 = +[CLKSimpleTextProvider textProviderWithText:v91];

        v93 = [v8 tintColor];
        [v92 setTintColor:v93];

        [v20 setHeaderTextProvider:v92];
        v94 = [v8 levelContentLong];
        float v95 = [v8 levelContentShort];
        double v96 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v94 shortText:v95];
        [v20 setBody1TextProvider:v96];

        v97 = [v8 classificationImageName];

        if (v97)
        {
          unsigned int v98 = [v8 isEnabled];
          v99 = [v8 classificationImageName];
          if (v98)
          {
            v100 = [v8 imageTintColor];
            long long v176 = *(_OWORD *)&v181[8];
            uint64_t v177 = *(void *)&v181[24];
            v101 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v99 tintColor:v100 pointSizeSymbolConstants:&v176];
            [v20 setHeaderImageProvider:v101];
          }
          else
          {
            v160 = [v8 tintColor];
            long long v176 = *(_OWORD *)&v181[8];
            uint64_t v177 = *(void *)&v181[24];
            v161 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v99 tintColor:v160 pointSizeSymbolConstants:&v176];
            [v20 setHeaderImageProvider:v161];

            v99 = [v8 tintColor];
            v100 = [v20 body1TextProvider];
            [v100 setTintColor:v99];
          }
        }
        [v8 gaugeFillValue];
        double v163 = v162;
        v164 = [v8 tintColor];
        v165 = [(DoseComplicationFormatter *)self createGaugeProviderWithFillValue:v164 tintColor:v163];
        [v20 setGaugeProvider:v165];

        goto LABEL_70;
      case 12:
        id v20 = objc_alloc_init((Class)CLKComplicationTemplateGraphicExtraLargeCircularOpenMeteredGaugeImage);
        id v171 = v9;
        v173 = v16;
        if ([v8 isEnabled])
        {
          v102 = [v8 levelContentShort];
          float v103 = [(DoseComplicationFormatter *)self createMonospaceTextProviderWithText:v102 shortText:v19];
          [v20 setTextProvider:v103];
        }
        else
        {
          v102 = +[NSBundle bundleForClass:objc_opt_class()];
          float v103 = +[NSBundle bundleForClass:objc_opt_class()];
          v147 = [v103 localizedStringForKey:@"UNIT_LABEL" value:&stru_C3E0 table:0];
          v148 = [v102 localizedStringForKey:@"UNIT_LABEL" value:v147 table:@"Noise"];
          v149 = +[CLKSimpleTextProvider textProviderWithText:v148];
          [v20 setTextProvider:v149];
        }
        v150 = [v8 classificationImageName];

        if (v150)
        {
          v151 = [v8 classificationImageName];
          v152 = [v8 imageTintColor];
          long long v176 = *(_OWORD *)&v185[8];
          uint64_t v177 = *(void *)&v185[24];
          v153 = [(DoseComplicationFormatter *)self fullColorImageProviderWithSymbolName:v151 tintColor:v152 pointSizeSymbolConstants:&v176];
          [v20 setImageProvider:v153];
        }
        [v8 gaugeFillValue];
        double v155 = v154;
        uint64_t v112 = [v8 tintColor];
        long long v113 = [(DoseComplicationFormatter *)self createGaugeProviderWithFillValue:v112 tintColor:v155];
        [v20 setGaugeProvider:v113];
LABEL_62:

LABEL_63:
        id v9 = v171;
        goto LABEL_71;
      default:
        break;
    }
  }

  return v20;
}

- (id)_setupNoiseTemplateWithFamily:(int64_t)a3 device:(id)a4
{
  id v6 = a4;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_8F68;
  v55[3] = &unk_C330;
  v55[4] = self;
  id v7 = objc_retainBlock(v55);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_8FCC;
  v54[3] = &unk_C358;
  v54[4] = self;
  id v8 = objc_retainBlock(v54);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_90B4;
  v53[3] = &unk_C380;
  v53[4] = self;
  id v9 = objc_retainBlock(v53);
  if (CLKComplicationFamilyCircularMedium != a3)
  {
    id v11 = 0;
    switch(a3)
    {
      case 0:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateModularSmallSimpleImage);
        BOOL v12 = (void (*)(void *, const __CFString *))v8[2];
        CFStringRef v13 = @"modular-sm_noise";
        goto LABEL_4;
      case 1:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateModularLargeStandardBody);
        v50 = +[NSBundle bundleForClass:objc_opt_class()];
        v16 = +[NSBundle bundleForClass:objc_opt_class()];
        v17 = [v16 localizedStringForKey:@"HEADER_TITLE" value:&stru_C3E0 table:0];
        double v18 = [v50 localizedStringForKey:@"HEADER_TITLE" value:v17 table:@"Noise"];
        uint64_t v19 = sub_8EFC((uint64_t)v18, (uint64_t)v18);
        [v11 setHeaderTextProvider:v19];

        id v20 = +[NSBundle bundleForClass:objc_opt_class()];
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        float v22 = [v21 localizedStringForKey:@"SETUP_LONG" value:&stru_C3E0 table:0];
        float v23 = [v20 localizedStringForKey:@"SETUP_LONG" value:v22 table:@"Noise"];
        id v24 = sub_8EFC((uint64_t)v23, (uint64_t)v23);
        [v11 setBody1TextProvider:v24];

        v14 = +[UIColor systemBlueColor];
        double v25 = [v11 headerTextProvider];
        [v25 setTintColor:v14];
        goto LABEL_18;
      case 2:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateUtilitarianSmallSquare);
        BOOL v12 = (void (*)(void *, const __CFString *))v8[2];
        CFStringRef v13 = @"utility-corner_noise";
        goto LABEL_4;
      case 3:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateUtilitarianLargeFlat);
        v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v26 = +[NSBundle bundleForClass:objc_opt_class()];
        double v25 = v26;
        CFStringRef v27 = @"SETUP_NOISE";
        goto LABEL_17;
      case 4:
        id v10 = (objc_class *)CLKComplicationTemplateCircularSmallSimpleImage;
        goto LABEL_3;
      case 6:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateUtilitarianSmallFlat);
        v14 = +[NSBundle bundleForClass:objc_opt_class()];
        v26 = +[NSBundle bundleForClass:objc_opt_class()];
        double v25 = v26;
        CFStringRef v27 = @"SETUP_SHORT";
LABEL_17:
        v28 = [v26 localizedStringForKey:v27 value:&stru_C3E0 table:0];
        unsigned int v29 = [v14 localizedStringForKey:v27 value:v28 table:@"Noise"];
        v30 = sub_8EFC((uint64_t)v29, (uint64_t)v29);
        [v11 setTextProvider:v30];

LABEL_18:
        goto LABEL_6;
      case 7:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateExtraLargeSimpleImage);
        BOOL v12 = (void (*)(void *, const __CFString *))v8[2];
        CFStringRef v13 = @"XL_noise";
        goto LABEL_4;
      case 8:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCornerTextImage);
        v31 = +[NSBundle bundleForClass:objc_opt_class()];
        v32 = +[NSBundle bundleForClass:objc_opt_class()];
        v33 = [v32 localizedStringForKey:@"SETUP_NOISE" value:&stru_C3E0 table:0];
        uint64_t v34 = [v31 localizedStringForKey:@"SETUP_NOISE" value:v33 table:@"Noise"];
        v35 = sub_8EFC((uint64_t)v34, (uint64_t)v34);
        [v11 setTextProvider:v35];

        ((void (*)(void *, const __CFString *))v9[2])(v9, @"rich-corner_noise-394h");
        goto LABEL_5;
      case 9:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateGraphicBezelCircularText);
        v51 = +[NSBundle bundleForClass:objc_opt_class()];
        v36 = +[NSBundle bundleForClass:objc_opt_class()];
        v37 = [v36 localizedStringForKey:@"SETUP_NOISE" value:&stru_C3E0 table:0];
        v38 = [v51 localizedStringForKey:@"SETUP_NOISE" value:v37 table:@"Noise"];
        v39 = sub_8EFC((uint64_t)v38, (uint64_t)v38);
        [v11 setTextProvider:v39];

        v14 = [(DoseComplicationFormatter *)self _setupNoiseTemplateWithFamily:10 device:v6];
        [v11 setCircularTemplate:v14];
        goto LABEL_6;
      case 10:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateGraphicCircularImage);
        ((void (*)(void *, const __CFString *))v9[2])(v9, @"circular-md_noise");
        goto LABEL_25;
      case 11:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateGraphicRectangularTextMeteredGauge);
        uint64_t v52 = +[NSBundle bundleForClass:objc_opt_class()];
        v40 = +[NSBundle bundleForClass:objc_opt_class()];
        v41 = [v40 localizedStringForKey:@"APP_NAME" value:&stru_C3E0 table:0];
        v42 = [v52 localizedStringForKey:@"APP_NAME" value:v41 table:@"Noise"];
        v43 = sub_8EFC((uint64_t)v42, (uint64_t)v42);
        [v11 setHeaderTextProvider:v43];

        v44 = +[NSBundle bundleForClass:objc_opt_class()];
        v45 = +[NSBundle bundleForClass:objc_opt_class()];
        id v46 = [v45 localizedStringForKey:@"SETUP_LONG" value:&stru_C3E0 table:0];
        v47 = [v44 localizedStringForKey:@"SETUP_LONG" value:v46 table:@"Noise"];
        v48 = sub_8EFC((uint64_t)v47, (uint64_t)v47);
        [v11 setBody1TextProvider:v48];

        v14 = ((void (*)(void *))v7[2])(v7);
        [v11 setGaugeProvider:v14];
        goto LABEL_6;
      case 12:
        id v11 = objc_alloc_init((Class)CLKComplicationTemplateGraphicExtraLargeCircularImage);
        ((void (*)(void *, const __CFString *))v9[2])(v9, @"XL_noise");
        v49 = LABEL_25:;
        [v11 setImageProvider:v49];

        v14 = [(DoseComplicationFormatter *)self setupComplicationBackgroundColor];
        [v11 setMetadata:v14];
        goto LABEL_6;
      default:
        goto LABEL_7;
    }
  }
  id v10 = (objc_class *)CLKComplicationTemplateCircularMediumSimpleImage;
LABEL_3:
  id v11 = objc_alloc_init(v10);
  BOOL v12 = (void (*)(void *, const __CFString *))v8[2];
  CFStringRef v13 = @"circular-sm_noise";
LABEL_4:
  v12(v8, v13);
  v14 = LABEL_5:;
  [v11 setImageProvider:v14];
LABEL_6:

LABEL_7:

  return v11;
}

- (id)createMonospaceTextProviderWithText:(id)a3 shortText:(id)a4
{
  double v4 = +[CLKSimpleTextProvider textProviderWithText:a3 shortText:a4];
  [v4 setMonospacedNumbers:1];

  return v4;
}

- (id)createOuterMonospaceTextProviderWithText:(id)a3
{
  id v3 = +[DoseTextProvider textProviderWithText:a3];
  [v3 setMonospacedNumbers:1];

  return v3;
}

- (id)createGaugeProviderWithFillValue:(double)a3 tintColor:(id)a4
{
  double v4 = fmax(a3, 0.0);
  if (v4 <= 1.0) {
    double v5 = v4;
  }
  else {
    double v5 = 1.0;
  }
  id v6 = _SPLGradientColor(a4);
  *(float *)&double v7 = v5;
  id v8 = +[CLKSimpleGaugeProvider gaugeProviderWithStyle:1 gaugeColors:v6 gaugeColorLocations:&off_C948 fillFraction:v7];

  return v8;
}

- (NSNumberFormatter)dbFormatter
{
  return self->_dbFormatter;
}

- (void)setDbFormatter:(id)a3
{
}

- (DoseContent)currentDoseContent
{
  return self->_currentDoseContent;
}

- (void)setCurrentDoseContent:(id)a3
{
}

- (DoseContent)switcherDoseContent
{
  return self->_switcherDoseContent;
}

- (DoseContent)alwaysOnDoseContent
{
  return self->_alwaysOnDoseContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alwaysOnDoseContent, 0);
  objc_storeStrong((id *)&self->_switcherDoseContent, 0);
  objc_storeStrong((id *)&self->_currentDoseContent, 0);

  objc_storeStrong((id *)&self->_dbFormatter, 0);
}

@end
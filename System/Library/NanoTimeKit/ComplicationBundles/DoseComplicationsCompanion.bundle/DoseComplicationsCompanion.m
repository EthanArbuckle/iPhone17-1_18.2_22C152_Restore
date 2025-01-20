void sub_3A10(id a1)
{
  uint64_t vars8;

  qword_10B08 = objc_opt_new();

  _objc_release_x1();
}

id colorForThreshold(uint64_t a1)
{
  v2 = +[UIColor systemGreenColor];
  if (a1 == 100 || a1 == 80)
  {
    uint64_t v3 = +[UIColor systemYellowColor];

    v2 = (void *)v3;
  }
  if (Dose_HCEDThresholdLevelDimmed == a1)
  {
    uint64_t v4 = +[UIColor systemDarkGrayColor];

    v2 = (void *)v4;
  }

  return v2;
}

id attributedStringWithImage(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  id v13 = objc_alloc_init((Class)NSMutableAttributedString);
  id v14 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v10];

  id v15 = objc_alloc_init((Class)NSTextAttachment);
  v16 = +[UIImageSymbolConfiguration configurationWithTextStyle:v9 scale:2];
  v17 = +[UIImage systemImageNamed:v12 withConfiguration:v16];

  v18 = [v17 imageWithTintColor:v11];

  v19 = [v18 imageWithRenderingMode:1];

  v20 = +[UIFont _preferredFontForTextStyle:v9 variant:a5];

  [v20 capHeight];
  double v22 = v21;
  [v19 size];
  float v24 = v22 - v23;
  double v25 = (float)(roundf(v24) * 0.5);
  [v19 size];
  double v27 = v26;
  [v19 size];
  objc_msgSend(v15, "setBounds:", 0.0, v25, v27, v28);
  [v15 setImage:v19];
  v29 = +[NSAttributedString attributedStringWithAttachment:v15];
  [v13 appendAttributedString:v29];
  id v30 = [objc_alloc((Class)NSMutableAttributedString) initWithString:@" "];
  [v13 appendAttributedString:v30];

  [v13 appendAttributedString:v14];

  return v13;
}

id _SPLGradientColor(void *a1)
{
  v4[0] = a1;
  v4[1] = a1;
  id v1 = a1;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

_UNKNOWN **_SPLGradientMarks()
{
  return &off_C948;
}

uint64_t PointSizeSymbolConstantsMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(double *)a3 = a4;
  *(void *)(a3 + 8) = result;
  *(void *)(a3 + 16) = a2;
  return result;
}

void sub_58A4(id a1)
{
  qword_10B20 = objc_opt_new();

  _objc_release_x1();
}

id sub_8EFC(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKSimpleTextProvider textProviderWithText:a2];
  uint64_t v3 = +[UIColor systemGrayColor];
  [v2 setTintColor:v3];

  return v2;
}

id sub_8F68(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v2 = +[UIColor systemGrayColor];
  uint64_t v3 = [v1 createGaugeProviderWithFillValue:v2 tintColor:0.0];

  return v3;
}

id sub_8FCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = +[UIImage imageNamed:v3 inBundle:v4];

  v6 = *(void **)(a1 + 32);
  v7 = +[UIColor colorWithRed:1.0 green:0.79 blue:0.0 alpha:1.0];
  v8 = [v6 imageProviderWithImage:v5 tintColor:v7];

  return v8;
}

id sub_90B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = +[UIImage imageNamed:v3 inBundle:v4];

  v6 = +[UIColor colorWithRed:1.0 green:0.79 blue:0.0 alpha:1.0];
  v7 = [v5 imageWithTintColor:v6];

  v8 = [*(id *)(a1 + 32) fullColorImageProviderWithImage:v7];

  return v8;
}

void sub_9364(id a1)
{
  *(void *)&xmmword_10B30 = 0x4028000000000000;
  *(long long *)((char *)&xmmword_10B30 + 8) = xmmword_BEA0;
  qword_10B48 = 0x4031000000000000;
  xmmword_10B50 = xmmword_BEA0;
  qword_10B60 = 0x402E000000000000;
  *(_OWORD *)algn_10B68 = xmmword_BEA0;
  *((void *)&xmmword_10B70 + 1) = 0x402A000000000000;
  xmmword_10B80 = xmmword_BEB0;
  *(void *)&xmmword_10B90 = 0x402E000000000000;
  *(long long *)((char *)&xmmword_10B90 + 8) = xmmword_BEA0;
  qword_10BA8 = 0x402E000000000000;
  xmmword_10BB0 = xmmword_BEA0;
  qword_10BC0 = 0x403F000000000000;
  *(_OWORD *)algn_10BC8 = xmmword_BEA0;
  *((void *)&xmmword_10BD0 + 1) = 0x4045733326000000;
  xmmword_10BE0 = xmmword_BEA0;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_alwaysOnDoseContent(void *a1, const char *a2, ...)
{
  return [a1 alwaysOnDoseContent];
}

id objc_msgSend_body1TextProvider(void *a1, const char *a2, ...)
{
  return [a1 body1TextProvider];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_classificationImageName(void *a1, const char *a2, ...)
{
  return [a1 classificationImageName];
}

id objc_msgSend_classifierContent(void *a1, const char *a2, ...)
{
  return [a1 classifierContent];
}

id objc_msgSend_currentDoseContent(void *a1, const char *a2, ...)
{
  return [a1 currentDoseContent];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dbFormatter(void *a1, const char *a2, ...)
{
  return [a1 dbFormatter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_fastLeq(void *a1, const char *a2, ...)
{
  return [a1 fastLeq];
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return [a1 formatter];
}

id objc_msgSend_gaugeFillValue(void *a1, const char *a2, ...)
{
  return [a1 gaugeFillValue];
}

id objc_msgSend_headerTextProvider(void *a1, const char *a2, ...)
{
  return [a1 headerTextProvider];
}

id objc_msgSend_imageTintColor(void *a1, const char *a2, ...)
{
  return [a1 imageTintColor];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_leadingTextProvider(void *a1, const char *a2, ...)
{
  return [a1 leadingTextProvider];
}

id objc_msgSend_levelContentLong(void *a1, const char *a2, ...)
{
  return [a1 levelContentLong];
}

id objc_msgSend_levelContentShort(void *a1, const char *a2, ...)
{
  return [a1 levelContentShort];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return [a1 localizedCapitalizedString];
}

id objc_msgSend_newAlwaysOnDoseContent(void *a1, const char *a2, ...)
{
  return [a1 newAlwaysOnDoseContent];
}

id objc_msgSend_newSwitcherDoseContent(void *a1, const char *a2, ...)
{
  return [a1 newSwitcherDoseContent];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_onboardingCompleted(void *a1, const char *a2, ...)
{
  return [a1 onboardingCompleted];
}

id objc_msgSend_setupComplicationBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 setupComplicationBackgroundColor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_slowLeq(void *a1, const char *a2, ...)
{
  return [a1 slowLeq];
}

id objc_msgSend_switcherDoseContent(void *a1, const char *a2, ...)
{
  return [a1 switcherDoseContent];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemDarkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkGrayColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_textProvider(void *a1, const char *a2, ...)
{
  return [a1 textProvider];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}
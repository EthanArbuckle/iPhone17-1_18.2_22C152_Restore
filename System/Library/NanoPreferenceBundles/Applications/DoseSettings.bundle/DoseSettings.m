id colorForThreshold(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars8;

  v2 = +[UIColor systemGreenColor];
  if (a1 == 100 || a1 == 80)
  {
    v3 = +[UIColor systemYellowColor];

    v2 = (void *)v3;
  }
  if (Dose_HCEDThresholdLevelDimmed == a1)
  {
    v4 = +[UIColor systemDarkGrayColor];

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

void sub_3004(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) parentViewController];
    v1 = [v3 navigationController];
    id v2 = [v1 popViewControllerAnimated:1];
  }
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend__allSPLOptions(void *a1, const char *a2, ...)
{
  return [a1 _allSPLOptions];
}

id objc_msgSend__enableMeasurementsSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _enableMeasurementsSpecifier];
}

id objc_msgSend__loudEnvironmentSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _loudEnvironmentSpecifier];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_descriptionLabel(void *a1, const char *a2, ...)
{
  return [a1 descriptionLabel];
}

id objc_msgSend_descriptionText(void *a1, const char *a2, ...)
{
  return [a1 descriptionText];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_environmentalMeasurementsFooterDescription(void *a1, const char *a2, ...)
{
  return [a1 environmentalMeasurementsFooterDescription];
}

id objc_msgSend_environmentalMeasurementsTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 environmentalMeasurementsTitleDescription];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_iconBottomToTitleFirstBaseline(void *a1, const char *a2, ...)
{
  return [a1 iconBottomToTitleFirstBaseline];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedPaneTitle];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_noiseEnabled(void *a1, const char *a2, ...)
{
  return [a1 noiseEnabled];
}

id objc_msgSend_noiseOnboardingDelegate(void *a1, const char *a2, ...)
{
  return [a1 noiseOnboardingDelegate];
}

id objc_msgSend_noiseThresholdFooterDescription(void *a1, const char *a2, ...)
{
  return [a1 noiseThresholdFooterDescription];
}

id objc_msgSend_noiseThresholdFooterLinkTitle(void *a1, const char *a2, ...)
{
  return [a1 noiseThresholdFooterLinkTitle];
}

id objc_msgSend_noiseThresholdSectionTitle(void *a1, const char *a2, ...)
{
  return [a1 noiseThresholdSectionTitle];
}

id objc_msgSend_noiseThresholdTitleDescription(void *a1, const char *a2, ...)
{
  return [a1 noiseThresholdTitleDescription];
}

id objc_msgSend_noiseThresholdValueFooterDescription(void *a1, const char *a2, ...)
{
  return [a1 noiseThresholdValueFooterDescription];
}

id objc_msgSend_notificationThreshold(void *a1, const char *a2, ...)
{
  return [a1 notificationThreshold];
}

id objc_msgSend_notificationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 notificationsEnabled];
}

id objc_msgSend_onboardingCompleted(void *a1, const char *a2, ...)
{
  return [a1 onboardingCompleted];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sectionInfo(void *a1, const char *a2, ...)
{
  return [a1 sectionInfo];
}

id objc_msgSend_setNeedsUserInterfaceAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUserInterfaceAppearanceUpdate];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_systemDarkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemDarkGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleLastBaselineToDescriptionFirstBaseline(void *a1, const char *a2, ...)
{
  return [a1 titleLastBaselineToDescriptionFirstBaseline];
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return [a1 titleText];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topToIconTop(void *a1, const char *a2, ...)
{
  return [a1 topToIconTop];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}
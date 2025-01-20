void sub_100003278(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  v1 = [v3 userPersonaUniqueString];
  v2 = (void *)qword_10000CB48;
  qword_10000CB48 = v1;
}

void sub_1000034C8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) button];
  [v2 setTitle:*(void *)(a1 + 40) forState:0];

  v3 = [*(id *)(a1 + 32) button];
  [v3 intrinsicContentSize];
  double v5 = v4;

  v6 = [*(id *)(a1 + 32) view];
  v7 = [v6 layoutMarginsGuide];
  [v7 layoutFrame];
  double v9 = v8;

  if (v5 > v9 && [*(id *)(a1 + 48) length])
  {
    v10 = [*(id *)(a1 + 32) button];
    [v10 setTitle:*(void *)(a1 + 48) forState:0];
  }
  id v11 = [*(id *)(a1 + 32) button];
  [v11 layoutBelowIfNeeded];
}

void sub_100003764(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) tooSmallToFitAnything];
  v3 = [*(id *)(a1 + 32) contentView];
  id v5 = v3;
  if (v2)
  {
    [v3 setHidden:1];
  }
  else
  {
    [v3 setHidden:0];

    double v4 = *(void **)(a1 + 32);
    [v4 updateIcon];
  }
}

void sub_1000037FC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) contentView];
  [v2 layoutBelowIfNeeded];
}

uint64_t sub_100003B24(void *a1)
{
  id v1 = a1;
  if ([v1 horizontalSizeClass] == (id)2)
  {
    if (qword_10000CB58 != -1) {
      dispatch_once(&qword_10000CB58, &stru_1000083B8);
    }
    if (qword_10000CB50 == 11)
    {
      uint64_t v2 = 63;
    }
    else
    {
      [v1 displayScale];
      if (v5 < 2.0) {
        uint64_t v2 = 1;
      }
      else {
        uint64_t v2 = 24;
      }
    }
  }
  else
  {
    [v1 displayScale];
    if (v3 >= 3.0)
    {
      uint64_t v2 = 32;
    }
    else
    {
      [v1 displayScale];
      if (v4 >= 2.0) {
        uint64_t v2 = 15;
      }
      else {
        uint64_t v2 = 0;
      }
    }
  }

  return v2;
}

void sub_100004478(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained buttonTapped];
}

void sub_100004868(id a1)
{
  id v1 = (id)MGCopyAnswer();
  qword_10000CB50 = (uint64_t)[v1 integerValue];
}

void sub_1000048B8(id a1)
{
  if (qword_10000CB70 != -1) {
    dispatch_once(&qword_10000CB70, &stru_1000083F8);
  }
  if (byte_10000CB78 || (_os_feature_enabled_impl() & 1) != 0)
  {
    unsigned __int8 v1 = 1;
  }
  else
  {
    uint64_t v2 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v1 = [v2 BOOLForKey:@"BRFileProviderUI.useModernLayout"];
  }
  byte_10000CB68 = v1;
}

void sub_100004958(id a1)
{
  id v2 = +[UIScreen mainScreen];
  unsigned __int8 v1 = [v2 traitCollection];
  byte_10000CB78 = [v1 userInterfaceIdiom] == (id)6;
}

void sub_1000049C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", (uint8_t *)&v3, 0x16u);
}

void sub_100004A50(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", (uint8_t *)&v2, 0xCu);
}

void sub_100004AC8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", (uint8_t *)&v2, 0xCu);
}

uint64_t BRPrimaryiCloudAccountCopyStatus()
{
  return _BRPrimaryiCloudAccountCopyStatus();
}

uint64_t LIIconContinuousCornerRadiusForVariant()
{
  return _LIIconContinuousCornerRadiusForVariant();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t _BRRestorePersona()
{
  return __BRRestorePersona();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return _voucher_process_can_use_arbitrary_personas();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__imageForContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _imageForContentConfiguration];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderedProminentButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 borderedProminentButtonConfiguration];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return [a1 button];
}

id objc_msgSend_buttonProperties(void *a1, const char *a2, ...)
{
  return [a1 buttonProperties];
}

id objc_msgSend_buttonSpacingConstraint(void *a1, const char *a2, ...)
{
  return [a1 buttonSpacingConstraint];
}

id objc_msgSend_buttonTapped(void *a1, const char *a2, ...)
{
  return [a1 buttonTapped];
}

id objc_msgSend_buttonText(void *a1, const char *a2, ...)
{
  return [a1 buttonText];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_completeRequest(void *a1, const char *a2, ...)
{
  return [a1 completeRequest];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_didInitializeText(void *a1, const char *a2, ...)
{
  return [a1 didInitializeText];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_emptyProminentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 emptyProminentConfiguration];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_forceDisplayIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 forceDisplayIfNeeded];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_iconToTitleSpacingConstraint(void *a1, const char *a2, ...)
{
  return [a1 iconToTitleSpacingConstraint];
}

id objc_msgSend_iconTopConstraint(void *a1, const char *a2, ...)
{
  return [a1 iconTopConstraint];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_imageProperties(void *a1, const char *a2, ...)
{
  return [a1 imageProperties];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutBelowIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutBelowIfNeeded];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkColor(void *a1, const char *a2, ...)
{
  return [a1 linkColor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageHeightFallbackConstraint(void *a1, const char *a2, ...)
{
  return [a1 messageHeightFallbackConstraint];
}

id objc_msgSend_messageLabel(void *a1, const char *a2, ...)
{
  return [a1 messageLabel];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_refreshMode(void *a1, const char *a2, ...)
{
  return [a1 refreshMode];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return [a1 separatorColor];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shortButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 shortButtonTitle];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleHeightFallbackConstraint(void *a1, const char *a2, ...)
{
  return [a1 titleHeightFallbackConstraint];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleTopFallbackConstraint(void *a1, const char *a2, ...)
{
  return [a1 titleTopFallbackConstraint];
}

id objc_msgSend_tooSmallToFitAnything(void *a1, const char *a2, ...)
{
  return [a1 tooSmallToFitAnything];
}

id objc_msgSend_tooSmallToFitIcon(void *a1, const char *a2, ...)
{
  return [a1 tooSmallToFitIcon];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_ubiquityIdentityToken(void *a1, const char *a2, ...)
{
  return [a1 ubiquityIdentityToken];
}

id objc_msgSend_updateButtonSpacing(void *a1, const char *a2, ...)
{
  return [a1 updateButtonSpacing];
}

id objc_msgSend_updateIcon(void *a1, const char *a2, ...)
{
  return [a1 updateIcon];
}

id objc_msgSend_updateText(void *a1, const char *a2, ...)
{
  return [a1 updateText];
}

id objc_msgSend_updateTitleFont(void *a1, const char *a2, ...)
{
  return [a1 updateTitleFont];
}

id objc_msgSend_updateTraitCollectionDependents(void *a1, const char *a2, ...)
{
  return [a1 updateTraitCollectionDependents];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}
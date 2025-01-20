void sub_39CC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t vars8;

  v6 = objc_alloc_init((Class)CSLPRFStingConfiguration);
  v2 = [*(id *)(a1 + 32) selectedActivity];
  v3 = [v2 actionType];
  v4 = [v3 integerValue];

  [v6 setActionType:v4];
  v5 = +[BPSStingSetupModel defaultBundleIDForActionType:v4];
  [v6 setBundleID:v5];

  [v6 setSource:0];
}

id bps_utility_log()
{
  if (qword_124E0 != -1) {
    dispatch_once(&qword_124E0, &stru_C460);
  }
  v0 = (void *)qword_124D8;

  return v0;
}

void sub_5D04(id a1)
{
  qword_124D8 = (uint64_t)os_log_create("com.apple.BridgePreferences", "utility");

  _objc_release_x1();
}

id bps_setup_log()
{
  if (qword_124F0 != -1) {
    dispatch_once(&qword_124F0, &stru_C480);
  }
  v0 = (void *)qword_124E8;

  return v0;
}

void sub_5D9C(id a1)
{
  qword_124E8 = (uint64_t)os_log_create("com.apple.BridgePreferences", "setup");

  _objc_release_x1();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

uint64_t CSLPRFLinkActionTypeToIdentifier()
{
  return _CSLPRFLinkActionTypeToIdentifier();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__applyScale(void *a1, const char *a2, ...)
{
  return [a1 _applyScale];
}

id objc_msgSend__findOptimalTitleLineSize(void *a1, const char *a2, ...)
{
  return [a1 _findOptimalTitleLineSize];
}

id objc_msgSend__largerThanMaxCategory(void *a1, const char *a2, ...)
{
  return [a1 _largerThanMaxCategory];
}

id objc_msgSend__subtitleLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _subtitleLabelFont];
}

id objc_msgSend__titleLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _titleLabelFont];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return [a1 actionType];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_applyAnimationLayoutContraints(void *a1, const char *a2, ...)
{
  return [a1 applyAnimationLayoutContraints];
}

id objc_msgSend_availableContentViewHeight(void *a1, const char *a2, ...)
{
  return [a1 availableContentViewHeight];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_cgColor(void *a1, const char *a2, ...)
{
  return [a1 cgColor];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultQuickActionItems(void *a1, const char *a2, ...)
{
  return [a1 defaultQuickActionItems];
}

id objc_msgSend_defaultSetupActionItems(void *a1, const char *a2, ...)
{
  return [a1 defaultSetupActionItems];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_doneSettingUpViews(void *a1, const char *a2, ...)
{
  return [a1 doneSettingUpViews];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getPreferredCellSize(void *a1, const char *a2, ...)
{
  return [a1 getPreferredCellSize];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isLargeText(void *a1, const char *a2, ...)
{
  return [a1 isLargeText];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_localContentView(void *a1, const char *a2, ...)
{
  return [a1 localContentView];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_preferredCellHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredCellHeight];
}

id objc_msgSend_preferredCellWidth(void *a1, const char *a2, ...)
{
  return [a1 preferredCellWidth];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_proActivities(void *a1, const char *a2, ...)
{
  return [a1 proActivities];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_secondarySystemFillColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemFillColor];
}

id objc_msgSend_selectedActivity(void *a1, const char *a2, ...)
{
  return [a1 selectedActivity];
}

id objc_msgSend_selectionChangeDelegate(void *a1, const char *a2, ...)
{
  return [a1 selectionChangeDelegate];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_setupViews(void *a1, const char *a2, ...)
{
  return [a1 setupViews];
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

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_suggestedChoiceButton(void *a1, const char *a2, ...)
{
  return [a1 suggestedChoiceButton];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitOverrides(void *a1, const char *a2, ...)
{
  return [a1 traitOverrides];
}

id objc_msgSend_updateLocalViewSize(void *a1, const char *a2, ...)
{
  return [a1 updateLocalViewSize];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_watchViewBottomConstraint(void *a1, const char *a2, ...)
{
  return [a1 watchViewBottomConstraint];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}
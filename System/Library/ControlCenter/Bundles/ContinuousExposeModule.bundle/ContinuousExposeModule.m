id sub_656C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewSubviews];
}

void sub_687C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) buttonView];
  [v2 setHighlighted:0];

  v3 = [*(id *)(a1 + 32) buttonView];
  id v4 = 0;
  if (!*(unsigned char *)(a1 + 40)) {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldShowToggleSelected", 0);
  }
  [v3 setSelected:v4];

  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setSelected:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "hideStrip") ^ 1);
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    uint64_t v7 = [*(id *)(v5 + 8) hideDock] ^ 1;
    [v6 setSelected:v7];
  }
}

id sub_6C84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTitle];
}

id sub_6C8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutCheckboxButtons];
}

void sub_6D88(uint64_t a1)
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v2 localizedStringForKey:@"CONTROL_CENTER_STATUS_CONTINUOUS_EXPOSE_OFF" value:&stru_C400 table:0];

  v3 = *(void **)(a1 + 40);
  id v4 = +[CCUIStatusUpdate statusUpdateWithMessage:v5 type:2];
  [v3 enqueueStatusUpdate:v4];
}

id sub_7158(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _shouldShowToggleSelected];

  return [v1 setSelected:v2];
}

id sub_74B4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) frame];
  double v3 = v2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) font];
  [v4 _scaledValueForValue:40.0];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 16) _firstLineBaselineOffsetFromBoundsTop];
  double v8 = v6 - v7;

  v9 = *(void **)(*(void *)(a1 + 32) + 16);
  double v10 = *(double *)(a1 + 40);

  return objc_msgSend(v9, "setFrame:", 0.0, v8, v10, v3);
}

void sub_7A04(uint64_t a1)
{
  [*(id *)(a1 + 32) setClipsToBounds:*(unsigned __int8 *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    CCUIExpandedModuleContinuousCornerRadius();
  }
  else {
    double v3 = 0.0;
  }
  [v2 _setContinuousCornerRadius:v3];
  id v4 = [*(id *)(a1 + 32) layer];
  id v6 = v4;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v5 = 12;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setMaskedCorners:v5];
}

id sub_7B78(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[2];
  [v2 preferredExpandedContentWidth];
  objc_msgSend(v2, "_titleWidthForContainerWidth:");
  objc_msgSend(v3, "sizeThatFits:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setBounds:", 0.0, 0.0, v4, v5);
  id v6 = *(void **)(a1 + 32);

  return [v6 _updateTitle];
}

id sub_7C74(uint64_t a1)
{
  [*(id *)(a1 + 32) _stageManagerViewScale];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setScale:");
  [*(id *)(a1 + 32) _stageManagerViewSize];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setBounds:", 0.0, 0.0, v2, v3);
  double v4 = *(void **)(*(void *)(a1 + 32) + 40);
  double v5 = (char *)[UIApp userInterfaceLayoutDirection];
  double v6 = 1.0;
  if (v5 == (unsigned char *)&dword_0 + 1) {
    double v6 = -1.0;
  }
  CGAffineTransformMakeScale(&v8, v6, 1.0);
  [v4 setTransform:&v8];
  return [*(id *)(a1 + 32) _updateStageManagerView];
}

uint64_t BSEqualStrings()
{
  return _BSEqualStrings();
}

uint64_t BSFloatIsZero()
{
  return _BSFloatIsZero();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return _CCUIExpandedModuleContinuousCornerRadius();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend__aggregateModuleHeight(void *a1, const char *a2, ...)
{
  return [a1 _aggregateModuleHeight];
}

id objc_msgSend__assetPackageDescription(void *a1, const char *a2, ...)
{
  return [a1 _assetPackageDescription];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return [a1 _baselineOffsetFromBottom];
}

id objc_msgSend__configurationStatus(void *a1, const char *a2, ...)
{
  return [a1 _configurationStatus];
}

id objc_msgSend__contentHeight(void *a1, const char *a2, ...)
{
  return [a1 _contentHeight];
}

id objc_msgSend__contentSizeCategoryDidChange(void *a1, const char *a2, ...)
{
  return [a1 _contentSizeCategoryDidChange];
}

id objc_msgSend__cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 _cornerRadius];
}

id objc_msgSend__defaults(void *a1, const char *a2, ...)
{
  return [a1 _defaults];
}

id objc_msgSend__dimension(void *a1, const char *a2, ...)
{
  return [a1 _dimension];
}

id objc_msgSend__firstLineBaselineOffsetFromBoundsTop(void *a1, const char *a2, ...)
{
  return [a1 _firstLineBaselineOffsetFromBoundsTop];
}

id objc_msgSend__footerHeight(void *a1, const char *a2, ...)
{
  return [a1 _footerHeight];
}

id objc_msgSend__glyphImage(void *a1, const char *a2, ...)
{
  return [a1 _glyphImage];
}

id objc_msgSend__isScreenJ520OrWider(void *a1, const char *a2, ...)
{
  return [a1 _isScreenJ520OrWider];
}

id objc_msgSend__layoutStageManagerView(void *a1, const char *a2, ...)
{
  return [a1 _layoutStageManagerView];
}

id objc_msgSend__layoutViewSubviews(void *a1, const char *a2, ...)
{
  return [a1 _layoutViewSubviews];
}

id objc_msgSend__minimumContentHeight(void *a1, const char *a2, ...)
{
  return [a1 _minimumContentHeight];
}

id objc_msgSend__pointerRect(void *a1, const char *a2, ...)
{
  return [a1 _pointerRect];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__refreshState(void *a1, const char *a2, ...)
{
  return [a1 _refreshState];
}

id objc_msgSend__selectedColor(void *a1, const char *a2, ...)
{
  return [a1 _selectedColor];
}

id objc_msgSend__separatorHeight(void *a1, const char *a2, ...)
{
  return [a1 _separatorHeight];
}

id objc_msgSend__setupStageManagerView(void *a1, const char *a2, ...)
{
  return [a1 _setupStageManagerView];
}

id objc_msgSend__setupTitleLabel(void *a1, const char *a2, ...)
{
  return [a1 _setupTitleLabel];
}

id objc_msgSend__shouldShowToggleSelected(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowToggleSelected];
}

id objc_msgSend__stageManagerViewScale(void *a1, const char *a2, ...)
{
  return [a1 _stageManagerViewScale];
}

id objc_msgSend__stageManagerViewSize(void *a1, const char *a2, ...)
{
  return [a1 _stageManagerViewSize];
}

id objc_msgSend__symbolConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _symbolConfiguration];
}

id objc_msgSend__tertiaryView(void *a1, const char *a2, ...)
{
  return [a1 _tertiaryView];
}

id objc_msgSend__titleBaselineToBottom(void *a1, const char *a2, ...)
{
  return [a1 _titleBaselineToBottom];
}

id objc_msgSend__titleBaselineToTop(void *a1, const char *a2, ...)
{
  return [a1 _titleBaselineToTop];
}

id objc_msgSend__titleFont(void *a1, const char *a2, ...)
{
  return [a1 _titleFont];
}

id objc_msgSend__titleHeight(void *a1, const char *a2, ...)
{
  return [a1 _titleHeight];
}

id objc_msgSend__updateForStateChange(void *a1, const char *a2, ...)
{
  return [a1 _updateForStateChange];
}

id objc_msgSend__updateStageManagerView(void *a1, const char *a2, ...)
{
  return [a1 _updateStageManagerView];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonView(void *a1, const char *a2, ...)
{
  return [a1 buttonView];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_contentModuleContext(void *a1, const char *a2, ...)
{
  return [a1 contentModuleContext];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dismissModule(void *a1, const char *a2, ...)
{
  return [a1 dismissModule];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hideDock(void *a1, const char *a2, ...)
{
  return [a1 hideDock];
}

id objc_msgSend_hideStrip(void *a1, const char *a2, ...)
{
  return [a1 hideStrip];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isContinuousExposeEverEnabled(void *a1, const char *a2, ...)
{
  return [a1 isContinuousExposeEverEnabled];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredExpandedContentHeight(void *a1, const char *a2, ...)
{
  return [a1 preferredExpandedContentHeight];
}

id objc_msgSend_preferredExpandedContentWidth(void *a1, const char *a2, ...)
{
  return [a1 preferredExpandedContentWidth];
}

id objc_msgSend_preferredMaxLayoutWidth(void *a1, const char *a2, ...)
{
  return [a1 preferredMaxLayoutWidth];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewIfLoaded];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}